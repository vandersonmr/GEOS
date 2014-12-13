; ModuleID = 'himenobmtxpa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Mat = type { float*, i32, i32, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@omega = global float 0x3FE99999A0000000, align 4
@.str = private unnamed_addr constant [34 x i8] c"mimax = %d mjmax = %d mkmax = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"imax = %d jmax = %d kmax =%d\0A\00", align 1
@p = common global %struct.Mat zeroinitializer, align 8
@bnd = common global %struct.Mat zeroinitializer, align 8
@wrk1 = common global %struct.Mat zeroinitializer, align 8
@wrk2 = common global %struct.Mat zeroinitializer, align 8
@a = common global %struct.Mat zeroinitializer, align 8
@b = common global %struct.Mat zeroinitializer, align 8
@c = common global %struct.Mat zeroinitializer, align 8
@.str2 = private unnamed_addr constant [29 x i8] c" Loop executed for %d times\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c" Gosa : %e \0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"XS\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"xs\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"XL\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"xl\00", align 1
@second.base_sec = internal unnamed_addr global i32 0, align 4
@second.base_usec = internal unnamed_addr global i32 0, align 4
@str = private unnamed_addr constant [27 x i8] c"Invalid input character !!\00"

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !150
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !150
  tail call void @llvm.dbg.declare(metadata !151, metadata !25), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !22), !dbg !154
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !23), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !24), !dbg !157
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !19), !dbg !159
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !20), !dbg !160
  tail call void @llvm.dbg.value(metadata !161, i64 0, metadata !21), !dbg !162
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i64 0, i64 0), i32 64, i32 64, i32 128) #7, !dbg !163
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 63, i32 63, i32 127) #7, !dbg !164
  %3 = tail call i32 @newMat(%struct.Mat* @p, i32 1, i32 64, i32 64, i32 128) #8, !dbg !165
  %4 = tail call i32 @newMat(%struct.Mat* @bnd, i32 1, i32 64, i32 64, i32 128) #8, !dbg !166
  %5 = tail call i32 @newMat(%struct.Mat* @wrk1, i32 1, i32 64, i32 64, i32 128) #8, !dbg !167
  %6 = tail call i32 @newMat(%struct.Mat* @wrk2, i32 1, i32 64, i32 64, i32 128) #8, !dbg !168
  %7 = tail call i32 @newMat(%struct.Mat* @a, i32 4, i32 64, i32 64, i32 128) #8, !dbg !169
  %8 = tail call i32 @newMat(%struct.Mat* @b, i32 3, i32 64, i32 64, i32 128) #8, !dbg !170
  %9 = tail call i32 @newMat(%struct.Mat* @c, i32 3, i32 64, i32 64, i32 128) #8, !dbg !171
  tail call void @mat_set_init(%struct.Mat* @p) #8, !dbg !172
  tail call void @mat_set(%struct.Mat* @bnd, i32 0, float 1.000000e+00) #8, !dbg !173
  tail call void @mat_set(%struct.Mat* @wrk1, i32 0, float 0.000000e+00) #8, !dbg !174
  tail call void @mat_set(%struct.Mat* @wrk2, i32 0, float 0.000000e+00) #8, !dbg !175
  tail call void @mat_set(%struct.Mat* @a, i32 0, float 1.000000e+00) #8, !dbg !176
  tail call void @mat_set(%struct.Mat* @a, i32 1, float 1.000000e+00) #8, !dbg !177
  tail call void @mat_set(%struct.Mat* @a, i32 2, float 1.000000e+00) #8, !dbg !178
  tail call void @mat_set(%struct.Mat* @a, i32 3, float 0x3FC5555560000000) #8, !dbg !179
  tail call void @mat_set(%struct.Mat* @b, i32 0, float 0.000000e+00) #8, !dbg !180
  tail call void @mat_set(%struct.Mat* @b, i32 1, float 0.000000e+00) #8, !dbg !181
  tail call void @mat_set(%struct.Mat* @b, i32 2, float 0.000000e+00) #8, !dbg !182
  tail call void @mat_set(%struct.Mat* @c, i32 0, float 1.000000e+00) #8, !dbg !183
  tail call void @mat_set(%struct.Mat* @c, i32 1, float 1.000000e+00) #8, !dbg !184
  tail call void @mat_set(%struct.Mat* @c, i32 2, float 1.000000e+00) #8, !dbg !185
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !18), !dbg !186
  %10 = tail call float @jacobi(i32 64, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2) #8, !dbg !187
  tail call void @llvm.dbg.value(metadata !{float %10}, i64 0, metadata !29), !dbg !187
  %11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 64) #7, !dbg !188
  %12 = fpext float %10 to double, !dbg !189
  %13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0), double %12) #7, !dbg !189
  tail call void @clearMat(%struct.Mat* @p) #8, !dbg !190
  tail call void @clearMat(%struct.Mat* @bnd) #8, !dbg !191
  tail call void @clearMat(%struct.Mat* @wrk1) #8, !dbg !192
  tail call void @clearMat(%struct.Mat* @wrk2) #8, !dbg !193
  tail call void @clearMat(%struct.Mat* @a) #8, !dbg !194
  tail call void @clearMat(%struct.Mat* @b) #8, !dbg !195
  tail call void @clearMat(%struct.Mat* @c) #8, !dbg !196
  ret i32 0, !dbg !197
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize uwtable
define i32 @newMat(%struct.Mat* nocapture %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !71), !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %mnums}, i64 0, metadata !72), !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %mrows}, i64 0, metadata !73), !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %mcols}, i64 0, metadata !74), !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %mdeps}, i64 0, metadata !75), !dbg !198
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 1, !dbg !199
  store i32 %mnums, i32* %1, align 4, !dbg !199, !tbaa !200
  %2 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !206
  store i32 %mrows, i32* %2, align 4, !dbg !206, !tbaa !207
  %3 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !208
  store i32 %mcols, i32* %3, align 4, !dbg !208, !tbaa !209
  %4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !210
  store i32 %mdeps, i32* %4, align 4, !dbg !210, !tbaa !211
  %5 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !212
  %6 = mul nsw i32 %mrows, %mnums, !dbg !213
  %7 = mul nsw i32 %6, %mcols, !dbg !213
  %8 = mul nsw i32 %7, %mdeps, !dbg !213
  %9 = sext i32 %8 to i64, !dbg !213
  %10 = shl nsw i64 %9, 2, !dbg !213
  %11 = tail call noalias i8* @malloc(i64 %10) #7, !dbg !213
  %12 = bitcast i8* %11 to float*, !dbg !213
  store float* %12, float** %5, align 8, !dbg !213, !tbaa !214
  %13 = icmp ne i8* %11, null, !dbg !215
  %14 = zext i1 %13 to i32, !dbg !215
  ret i32 %14, !dbg !215
}

; Function Attrs: minsize nounwind optsize uwtable
define void @mat_set_init(%struct.Mat* nocapture readonly %Mat) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !93), !dbg !216
  tail call void @llvm.dbg.value(metadata !217, i64 0, metadata !94), !dbg !218
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !218
  %2 = load i32* %1, align 4, !dbg !218, !tbaa !207
  %3 = icmp sgt i32 %2, 0, !dbg !218
  br i1 %3, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !218

.preheader1.lr.ph:                                ; preds = %0
  %4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !220
  %5 = load i32* %4, align 4, !dbg !220, !tbaa !209
  %6 = icmp sgt i32 %5, 0, !dbg !220
  %7 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !222
  %8 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !224
  br label %.preheader1, !dbg !218

.preheader1:                                      ; preds = %.preheader1.lr.ph, %._crit_edge4
  %i.05 = phi i32 [ 0, %.preheader1.lr.ph ], [ %29, %._crit_edge4 ]
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge4, !dbg !220

.preheader.lr.ph:                                 ; preds = %.preheader1
  %9 = load i32* %7, align 4, !dbg !222, !tbaa !211
  %10 = icmp sgt i32 %9, 0, !dbg !222
  %11 = mul nsw i32 %i.05, %i.05, !dbg !224
  %12 = sitofp i32 %11 to float, !dbg !224
  br label %.preheader, !dbg !220

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %j.03 = phi i32 [ 0, %.preheader.lr.ph ], [ %27, %._crit_edge ]
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !222

.lr.ph:                                           ; preds = %.preheader
  %13 = add nsw i32 %2, -1, !dbg !224
  %14 = mul nsw i32 %13, %13, !dbg !224
  %15 = sitofp i32 %14 to float, !dbg !224
  %16 = fdiv float %12, %15, !dbg !224
  %17 = mul nsw i32 %5, %i.05, !dbg !224
  %18 = add i32 %17, %j.03, !dbg !224
  %19 = load float** %8, align 8, !dbg !224, !tbaa !214
  br label %20, !dbg !222

; <label>:20                                      ; preds = %.lr.ph, %20
  %k.02 = phi i32 [ 0, %.lr.ph ], [ %25, %20 ]
  %21 = mul i32 %18, %9, !dbg !224
  %22 = add nsw i32 %21, %k.02, !dbg !224
  %23 = sext i32 %22 to i64, !dbg !224
  %24 = getelementptr inbounds float* %19, i64 %23, !dbg !224
  store float %16, float* %24, align 4, !dbg !224, !tbaa !225
  %25 = add nsw i32 %k.02, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !96), !dbg !222
  %26 = icmp slt i32 %25, %9, !dbg !222
  br i1 %26, label %20, label %._crit_edge, !dbg !222

._crit_edge:                                      ; preds = %20, %.preheader
  %27 = add nsw i32 %j.03, 1, !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !95), !dbg !220
  %28 = icmp slt i32 %27, %5, !dbg !220
  br i1 %28, label %.preheader, label %._crit_edge4, !dbg !220

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader1
  %29 = add nsw i32 %i.05, 1, !dbg !218
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !94), !dbg !218
  %30 = icmp slt i32 %29, %2, !dbg !218
  br i1 %30, label %.preheader1, label %._crit_edge7, !dbg !218

._crit_edge7:                                     ; preds = %._crit_edge4, %0
  ret void, !dbg !227
}

; Function Attrs: minsize nounwind optsize uwtable
define void @mat_set(%struct.Mat* nocapture readonly %Mat, i32 %l, float %val) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !85), !dbg !228
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !86), !dbg !228
  tail call void @llvm.dbg.value(metadata !{float %val}, i64 0, metadata !87), !dbg !228
  tail call void @llvm.dbg.value(metadata !217, i64 0, metadata !88), !dbg !229
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !229
  %2 = load i32* %1, align 4, !dbg !229, !tbaa !207
  %3 = icmp sgt i32 %2, 0, !dbg !229
  br i1 %3, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !229

.preheader1.lr.ph:                                ; preds = %0
  %4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !231
  %5 = load i32* %4, align 4, !dbg !231, !tbaa !209
  %6 = icmp sgt i32 %5, 0, !dbg !231
  %7 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !233
  %8 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !235
  br label %.preheader1, !dbg !229

.preheader1:                                      ; preds = %.preheader1.lr.ph, %._crit_edge4
  %i.05 = phi i32 [ 0, %.preheader1.lr.ph ], [ %25, %._crit_edge4 ]
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge4, !dbg !231

.preheader.lr.ph:                                 ; preds = %.preheader1
  %9 = load i32* %7, align 4, !dbg !233, !tbaa !211
  %10 = icmp sgt i32 %9, 0, !dbg !233
  br label %.preheader, !dbg !231

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %j.03 = phi i32 [ 0, %.preheader.lr.ph ], [ %23, %._crit_edge ]
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !233

.lr.ph:                                           ; preds = %.preheader
  %11 = mul nsw i32 %2, %l, !dbg !235
  %12 = add i32 %11, %i.05, !dbg !235
  %13 = mul i32 %12, %5, !dbg !235
  %14 = add i32 %13, %j.03, !dbg !235
  %15 = load float** %8, align 8, !dbg !235, !tbaa !214
  br label %16, !dbg !233

; <label>:16                                      ; preds = %.lr.ph, %16
  %k.02 = phi i32 [ 0, %.lr.ph ], [ %21, %16 ]
  %17 = mul i32 %14, %9, !dbg !235
  %18 = add nsw i32 %17, %k.02, !dbg !235
  %19 = sext i32 %18 to i64, !dbg !235
  %20 = getelementptr inbounds float* %15, i64 %19, !dbg !235
  store float %val, float* %20, align 4, !dbg !235, !tbaa !225
  %21 = add nsw i32 %k.02, 1, !dbg !233
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !90), !dbg !233
  %22 = icmp slt i32 %21, %9, !dbg !233
  br i1 %22, label %16, label %._crit_edge, !dbg !233

._crit_edge:                                      ; preds = %16, %.preheader
  %23 = add nsw i32 %j.03, 1, !dbg !231
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !89), !dbg !231
  %24 = icmp slt i32 %23, %5, !dbg !231
  br i1 %24, label %.preheader, label %._crit_edge4, !dbg !231

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader1
  %25 = add nsw i32 %i.05, 1, !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !88), !dbg !229
  %26 = icmp slt i32 %25, %2, !dbg !229
  br i1 %26, label %.preheader1, label %._crit_edge7, !dbg !229

._crit_edge7:                                     ; preds = %._crit_edge4, %0
  ret void, !dbg !236
}

; Function Attrs: minsize nounwind optsize uwtable
define float @jacobi(i32 %nn, %struct.Mat* nocapture readonly %a, %struct.Mat* nocapture readonly %b, %struct.Mat* nocapture readonly %c, %struct.Mat* nocapture readonly %p, %struct.Mat* nocapture readonly %bnd, %struct.Mat* nocapture readonly %wrk1, %struct.Mat* nocapture readonly %wrk2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nn}, i64 0, metadata !103), !dbg !237
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %a}, i64 0, metadata !104), !dbg !237
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %b}, i64 0, metadata !105), !dbg !237
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %c}, i64 0, metadata !106), !dbg !237
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %p}, i64 0, metadata !107), !dbg !238
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %bnd}, i64 0, metadata !108), !dbg !238
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %wrk1}, i64 0, metadata !109), !dbg !238
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %wrk2}, i64 0, metadata !110), !dbg !238
  %1 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 2, !dbg !239
  %2 = load i32* %1, align 4, !dbg !239, !tbaa !207
  %3 = add i32 %2, -1, !dbg !239
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !115), !dbg !239
  %4 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 3, !dbg !240
  %5 = load i32* %4, align 4, !dbg !240, !tbaa !209
  %6 = add i32 %5, -1, !dbg !240
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !116), !dbg !240
  %7 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 4, !dbg !241
  %8 = load i32* %7, align 4, !dbg !241, !tbaa !211
  %9 = add i32 %8, -1, !dbg !241
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !117), !dbg !241
  tail call void @llvm.dbg.value(metadata !217, i64 0, metadata !114), !dbg !242
  %10 = icmp sgt i32 %nn, 0, !dbg !242
  br i1 %10, label %.preheader5.lr.ph, label %._crit_edge25, !dbg !242

.preheader5.lr.ph:                                ; preds = %0
  %11 = icmp sgt i32 %3, 1, !dbg !244
  %12 = icmp sgt i32 %6, 1, !dbg !247
  %13 = icmp sgt i32 %9, 1, !dbg !250
  %14 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 3, !dbg !252
  %15 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 4, !dbg !252
  %16 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 0, !dbg !252
  %17 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 0, !dbg !252
  %18 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 2, !dbg !253
  %19 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 3, !dbg !253
  %20 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 4, !dbg !253
  %21 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 0, !dbg !253
  %22 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 2, !dbg !253
  %23 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 3, !dbg !253
  %24 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 4, !dbg !253
  %25 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 0, !dbg !253
  %26 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 2, !dbg !253
  %27 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 3, !dbg !253
  %28 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 4, !dbg !253
  %29 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 0, !dbg !253
  %30 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 3, !dbg !253
  %31 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 4, !dbg !253
  %32 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 0, !dbg !253
  %33 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 3, !dbg !257
  %34 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 4, !dbg !257
  %35 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 0, !dbg !257
  br label %.preheader5, !dbg !242

.preheader5:                                      ; preds = %._crit_edge23, %.preheader5.lr.ph
  %n.024 = phi i32 [ 0, %.preheader5.lr.ph ], [ %311, %._crit_edge23 ]
  br i1 %11, label %.preheader3, label %._crit_edge23, !dbg !244

.preheader4:                                      ; preds = %._crit_edge10
  br i1 %11, label %.preheader2, label %._crit_edge23, !dbg !258

.preheader3:                                      ; preds = %.preheader5, %._crit_edge10
  %i.013 = phi i32 [ %36, %._crit_edge10 ], [ 1, %.preheader5 ]
  %gosa.112 = phi float [ %gosa.2.lcssa, %._crit_edge10 ], [ 0.000000e+00, %.preheader5 ]
  %36 = add nsw i32 %i.013, 1, !dbg !253
  br i1 %12, label %.preheader1.lr.ph, label %._crit_edge10, !dbg !259

.preheader1.lr.ph:                                ; preds = %.preheader3
  %37 = add nsw i32 %i.013, -1, !dbg !253
  br label %.preheader1, !dbg !259

.preheader1:                                      ; preds = %._crit_edge, %.preheader1.lr.ph
  %j.09 = phi i32 [ 1, %.preheader1.lr.ph ], [ %.pre-phi, %._crit_edge ]
  %gosa.28 = phi float [ %gosa.112, %.preheader1.lr.ph ], [ %gosa.3.lcssa, %._crit_edge ]
  br i1 %13, label %.lr.ph, label %.preheader1._crit_edge, !dbg !260

.preheader1._crit_edge:                           ; preds = %.preheader1
  %.pre = add nsw i32 %j.09, 1, !dbg !259
  br label %._crit_edge, !dbg !260

.lr.ph:                                           ; preds = %.preheader1
  %38 = load i32* %18, align 4, !dbg !253, !tbaa !207
  %39 = load i32* %19, align 4, !dbg !253, !tbaa !209
  %40 = load i32* %20, align 4, !dbg !253, !tbaa !211
  %41 = mul nsw i32 %39, %i.013, !dbg !253
  %42 = add i32 %41, %j.09, !dbg !253
  %43 = mul i32 %42, %40, !dbg !253
  %44 = load float** %21, align 8, !dbg !253, !tbaa !214
  %45 = load i32* %4, align 4, !dbg !253, !tbaa !209
  %46 = load i32* %7, align 4, !dbg !253, !tbaa !211
  %47 = mul nsw i32 %45, %36, !dbg !253
  %48 = add i32 %47, %j.09, !dbg !253
  %49 = mul i32 %48, %46, !dbg !253
  %50 = load float** %17, align 8, !dbg !253, !tbaa !214
  %51 = add i32 %38, %i.013, !dbg !253
  %52 = mul i32 %39, %51, !dbg !253
  %53 = add i32 %52, %j.09, !dbg !253
  %54 = mul i32 %53, %40, !dbg !253
  %55 = mul nsw i32 %45, %i.013, !dbg !253
  %56 = add nsw i32 %j.09, 1, !dbg !253
  %57 = add i32 %55, %56, !dbg !253
  %58 = mul i32 %57, %46, !dbg !253
  %59 = shl i32 %38, 1, !dbg !253
  %60 = add i32 %59, %i.013, !dbg !253
  %61 = mul i32 %60, %39, !dbg !253
  %62 = add i32 %61, %j.09, !dbg !253
  %63 = mul i32 %62, %40, !dbg !253
  %64 = add i32 %55, %j.09, !dbg !253
  %65 = mul i32 %64, %46, !dbg !253
  %66 = load i32* %22, align 4, !dbg !253, !tbaa !207
  %67 = load i32* %23, align 4, !dbg !253, !tbaa !209
  %68 = load i32* %24, align 4, !dbg !253, !tbaa !211
  %69 = mul nsw i32 %67, %i.013, !dbg !253
  %70 = add i32 %69, %j.09, !dbg !253
  %71 = mul i32 %70, %68, !dbg !253
  %72 = load float** %25, align 8, !dbg !253, !tbaa !214
  %73 = add i32 %47, %56, !dbg !253
  %74 = mul i32 %73, %46, !dbg !253
  %75 = add nsw i32 %j.09, -1, !dbg !253
  %76 = add i32 %47, %75, !dbg !253
  %77 = mul i32 %76, %46, !dbg !253
  %78 = mul nsw i32 %45, %37, !dbg !253
  %79 = add i32 %78, %56, !dbg !253
  %80 = mul i32 %79, %46, !dbg !253
  %81 = add i32 %78, %75, !dbg !253
  %82 = mul i32 %81, %46, !dbg !253
  %83 = add i32 %66, %i.013, !dbg !253
  %84 = mul i32 %67, %83, !dbg !253
  %85 = add i32 %84, %j.09, !dbg !253
  %86 = mul i32 %85, %68, !dbg !253
  %87 = add i32 %55, %75, !dbg !253
  %88 = mul i32 %87, %46, !dbg !253
  %89 = shl i32 %66, 1, !dbg !253
  %90 = add i32 %89, %i.013, !dbg !253
  %91 = mul i32 %90, %67, !dbg !253
  %92 = add i32 %91, %j.09, !dbg !253
  %93 = mul i32 %92, %68, !dbg !253
  %94 = add i32 %78, %j.09, !dbg !253
  %95 = mul i32 %94, %46, !dbg !253
  %96 = load i32* %26, align 4, !dbg !253, !tbaa !207
  %97 = load i32* %27, align 4, !dbg !253, !tbaa !209
  %98 = load i32* %28, align 4, !dbg !253, !tbaa !211
  %99 = mul nsw i32 %97, %i.013, !dbg !253
  %100 = add i32 %99, %j.09, !dbg !253
  %101 = mul i32 %100, %98, !dbg !253
  %102 = load float** %29, align 8, !dbg !253, !tbaa !214
  %103 = add i32 %96, %i.013, !dbg !253
  %104 = mul i32 %97, %103, !dbg !253
  %105 = add i32 %104, %j.09, !dbg !253
  %106 = mul i32 %105, %98, !dbg !253
  %107 = shl i32 %96, 1, !dbg !253
  %108 = add i32 %107, %i.013, !dbg !253
  %109 = mul i32 %108, %97, !dbg !253
  %110 = add i32 %109, %j.09, !dbg !253
  %111 = mul i32 %110, %98, !dbg !253
  %112 = load i32* %30, align 4, !dbg !253, !tbaa !209
  %113 = load i32* %31, align 4, !dbg !253, !tbaa !211
  %114 = mul nsw i32 %112, %i.013, !dbg !253
  %115 = add i32 %114, %j.09, !dbg !253
  %116 = mul i32 %115, %113, !dbg !253
  %117 = load float** %32, align 8, !dbg !253, !tbaa !214
  %118 = mul nsw i32 %38, 3, !dbg !257
  %119 = add i32 %118, %i.013, !dbg !257
  %120 = mul i32 %119, %39, !dbg !257
  %121 = add i32 %120, %j.09, !dbg !257
  %122 = mul i32 %121, %40, !dbg !257
  %123 = load i32* %33, align 4, !dbg !257, !tbaa !209
  %124 = load i32* %34, align 4, !dbg !257, !tbaa !211
  %125 = mul nsw i32 %123, %i.013, !dbg !257
  %126 = add i32 %125, %j.09, !dbg !257
  %127 = mul i32 %126, %124, !dbg !257
  %128 = load float** %35, align 8, !dbg !257, !tbaa !214
  %129 = load i32* %14, align 4, !dbg !261, !tbaa !209
  %130 = load i32* %15, align 4, !dbg !261, !tbaa !211
  %131 = mul nsw i32 %129, %i.013, !dbg !261
  %132 = add i32 %131, %j.09, !dbg !261
  %133 = mul i32 %132, %130, !dbg !261
  %134 = load float** %16, align 8, !dbg !261, !tbaa !214
  %135 = sext i32 %65 to i64, !dbg !260
  %136 = sext i32 %95 to i64, !dbg !260
  %137 = sext i32 %49 to i64, !dbg !260
  %138 = sext i32 %88 to i64, !dbg !260
  %139 = sext i32 %58 to i64, !dbg !260
  %140 = sext i32 %133 to i64, !dbg !260
  %141 = sext i32 %127 to i64, !dbg !260
  %142 = sext i32 %122 to i64, !dbg !260
  %143 = sext i32 %116 to i64, !dbg !260
  %144 = sext i32 %111 to i64, !dbg !260
  %145 = sext i32 %106 to i64, !dbg !260
  %146 = sext i32 %101 to i64, !dbg !260
  %147 = sext i32 %93 to i64, !dbg !260
  %148 = sext i32 %86 to i64, !dbg !260
  %149 = sext i32 %82 to i64, !dbg !260
  %150 = sext i32 %80 to i64, !dbg !260
  %151 = sext i32 %77 to i64, !dbg !260
  %152 = sext i32 %74 to i64, !dbg !260
  %153 = sext i32 %71 to i64, !dbg !260
  %154 = sext i32 %63 to i64, !dbg !260
  %155 = sext i32 %54 to i64, !dbg !260
  %156 = sext i32 %43 to i64, !dbg !260
  br label %157, !dbg !260

; <label>:157                                     ; preds = %157, %.lr.ph
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %157 ]
  %gosa.37 = phi float [ %gosa.28, %.lr.ph ], [ %283, %157 ]
  %158 = add nsw i64 %156, %indvars.iv, !dbg !253
  %159 = getelementptr inbounds float* %44, i64 %158, !dbg !253
  %160 = load float* %159, align 4, !dbg !253, !tbaa !225
  %161 = add nsw i64 %137, %indvars.iv, !dbg !253
  %162 = getelementptr inbounds float* %50, i64 %161, !dbg !253
  %163 = load float* %162, align 4, !dbg !253, !tbaa !225
  %164 = fmul float %160, %163, !dbg !253
  %165 = add nsw i64 %155, %indvars.iv, !dbg !253
  %166 = getelementptr inbounds float* %44, i64 %165, !dbg !253
  %167 = load float* %166, align 4, !dbg !253, !tbaa !225
  %168 = add nsw i64 %139, %indvars.iv, !dbg !253
  %169 = getelementptr inbounds float* %50, i64 %168, !dbg !253
  %170 = load float* %169, align 4, !dbg !253, !tbaa !225
  %171 = fmul float %167, %170, !dbg !253
  %172 = fadd float %164, %171, !dbg !253
  %173 = add nsw i64 %154, %indvars.iv, !dbg !253
  %174 = getelementptr inbounds float* %44, i64 %173, !dbg !253
  %175 = load float* %174, align 4, !dbg !253, !tbaa !225
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !260
  %176 = add nsw i64 %135, %indvars.iv.next, !dbg !253
  %177 = getelementptr inbounds float* %50, i64 %176, !dbg !253
  %178 = load float* %177, align 4, !dbg !253, !tbaa !225
  %179 = fmul float %175, %178, !dbg !253
  %180 = fadd float %172, %179, !dbg !253
  %181 = add nsw i64 %153, %indvars.iv, !dbg !253
  %182 = getelementptr inbounds float* %72, i64 %181, !dbg !253
  %183 = load float* %182, align 4, !dbg !253, !tbaa !225
  %184 = add nsw i64 %152, %indvars.iv, !dbg !253
  %185 = getelementptr inbounds float* %50, i64 %184, !dbg !253
  %186 = load float* %185, align 4, !dbg !253, !tbaa !225
  %187 = add nsw i64 %151, %indvars.iv, !dbg !253
  %188 = getelementptr inbounds float* %50, i64 %187, !dbg !253
  %189 = load float* %188, align 4, !dbg !253, !tbaa !225
  %190 = fsub float %186, %189, !dbg !253
  %191 = add nsw i64 %150, %indvars.iv, !dbg !253
  %192 = getelementptr inbounds float* %50, i64 %191, !dbg !253
  %193 = load float* %192, align 4, !dbg !253, !tbaa !225
  %194 = fsub float %190, %193, !dbg !253
  %195 = add nsw i64 %149, %indvars.iv, !dbg !253
  %196 = getelementptr inbounds float* %50, i64 %195, !dbg !253
  %197 = load float* %196, align 4, !dbg !253, !tbaa !225
  %198 = fadd float %194, %197, !dbg !253
  %199 = fmul float %183, %198, !dbg !253
  %200 = fadd float %180, %199, !dbg !253
  %201 = add nsw i64 %148, %indvars.iv, !dbg !253
  %202 = getelementptr inbounds float* %72, i64 %201, !dbg !253
  %203 = load float* %202, align 4, !dbg !253, !tbaa !225
  %204 = add nsw i64 %139, %indvars.iv.next, !dbg !253
  %205 = getelementptr inbounds float* %50, i64 %204, !dbg !253
  %206 = load float* %205, align 4, !dbg !253, !tbaa !225
  %207 = add nsw i64 %138, %indvars.iv.next, !dbg !253
  %208 = getelementptr inbounds float* %50, i64 %207, !dbg !253
  %209 = load float* %208, align 4, !dbg !253, !tbaa !225
  %210 = fsub float %206, %209, !dbg !253
  %211 = add nsw i64 %indvars.iv, -1, !dbg !253
  %212 = add nsw i64 %139, %211, !dbg !253
  %213 = getelementptr inbounds float* %50, i64 %212, !dbg !253
  %214 = load float* %213, align 4, !dbg !253, !tbaa !225
  %215 = fsub float %210, %214, !dbg !253
  %216 = add nsw i64 %138, %211, !dbg !253
  %217 = getelementptr inbounds float* %50, i64 %216, !dbg !253
  %218 = load float* %217, align 4, !dbg !253, !tbaa !225
  %219 = fadd float %215, %218, !dbg !253
  %220 = fmul float %203, %219, !dbg !253
  %221 = fadd float %200, %220, !dbg !253
  %222 = add nsw i64 %147, %indvars.iv, !dbg !253
  %223 = getelementptr inbounds float* %72, i64 %222, !dbg !253
  %224 = load float* %223, align 4, !dbg !253, !tbaa !225
  %225 = add nsw i64 %137, %indvars.iv.next, !dbg !253
  %226 = getelementptr inbounds float* %50, i64 %225, !dbg !253
  %227 = load float* %226, align 4, !dbg !253, !tbaa !225
  %228 = add nsw i64 %136, %indvars.iv.next, !dbg !253
  %229 = getelementptr inbounds float* %50, i64 %228, !dbg !253
  %230 = load float* %229, align 4, !dbg !253, !tbaa !225
  %231 = fsub float %227, %230, !dbg !253
  %232 = add nsw i64 %137, %211, !dbg !253
  %233 = getelementptr inbounds float* %50, i64 %232, !dbg !253
  %234 = load float* %233, align 4, !dbg !253, !tbaa !225
  %235 = fsub float %231, %234, !dbg !253
  %236 = add nsw i64 %136, %211, !dbg !253
  %237 = getelementptr inbounds float* %50, i64 %236, !dbg !253
  %238 = load float* %237, align 4, !dbg !253, !tbaa !225
  %239 = fadd float %235, %238, !dbg !253
  %240 = fmul float %224, %239, !dbg !253
  %241 = fadd float %221, %240, !dbg !253
  %242 = add nsw i64 %146, %indvars.iv, !dbg !253
  %243 = getelementptr inbounds float* %102, i64 %242, !dbg !253
  %244 = load float* %243, align 4, !dbg !253, !tbaa !225
  %245 = add nsw i64 %136, %indvars.iv, !dbg !253
  %246 = getelementptr inbounds float* %50, i64 %245, !dbg !253
  %247 = load float* %246, align 4, !dbg !253, !tbaa !225
  %248 = fmul float %244, %247, !dbg !253
  %249 = fadd float %241, %248, !dbg !253
  %250 = add nsw i64 %145, %indvars.iv, !dbg !253
  %251 = getelementptr inbounds float* %102, i64 %250, !dbg !253
  %252 = load float* %251, align 4, !dbg !253, !tbaa !225
  %253 = add nsw i64 %138, %indvars.iv, !dbg !253
  %254 = getelementptr inbounds float* %50, i64 %253, !dbg !253
  %255 = load float* %254, align 4, !dbg !253, !tbaa !225
  %256 = fmul float %252, %255, !dbg !253
  %257 = fadd float %249, %256, !dbg !253
  %258 = add nsw i64 %144, %indvars.iv, !dbg !253
  %259 = getelementptr inbounds float* %102, i64 %258, !dbg !253
  %260 = load float* %259, align 4, !dbg !253, !tbaa !225
  %261 = add nsw i64 %135, %211, !dbg !253
  %262 = getelementptr inbounds float* %50, i64 %261, !dbg !253
  %263 = load float* %262, align 4, !dbg !253, !tbaa !225
  %264 = fmul float %260, %263, !dbg !253
  %265 = fadd float %257, %264, !dbg !253
  %266 = add nsw i64 %143, %indvars.iv, !dbg !253
  %267 = getelementptr inbounds float* %117, i64 %266, !dbg !253
  %268 = load float* %267, align 4, !dbg !253, !tbaa !225
  %269 = fadd float %265, %268, !dbg !253
  tail call void @llvm.dbg.value(metadata !{float %269}, i64 0, metadata !119), !dbg !253
  %270 = add nsw i64 %142, %indvars.iv, !dbg !257
  %271 = getelementptr inbounds float* %44, i64 %270, !dbg !257
  %272 = load float* %271, align 4, !dbg !257, !tbaa !225
  %273 = fmul float %269, %272, !dbg !257
  %274 = add nsw i64 %135, %indvars.iv, !dbg !257
  %275 = getelementptr inbounds float* %50, i64 %274, !dbg !257
  %276 = load float* %275, align 4, !dbg !257, !tbaa !225
  %277 = fsub float %273, %276, !dbg !257
  %278 = add nsw i64 %141, %indvars.iv, !dbg !257
  %279 = getelementptr inbounds float* %128, i64 %278, !dbg !257
  %280 = load float* %279, align 4, !dbg !257, !tbaa !225
  %281 = fmul float %277, %280, !dbg !257
  tail call void @llvm.dbg.value(metadata !{float %281}, i64 0, metadata !120), !dbg !257
  %282 = fmul float %281, %281, !dbg !262
  %283 = fadd float %gosa.37, %282, !dbg !262
  tail call void @llvm.dbg.value(metadata !{float %283}, i64 0, metadata !118), !dbg !262
  %284 = load float* @omega, align 4, !dbg !261, !tbaa !225
  %285 = fmul float %284, %281, !dbg !261
  %286 = fadd float %276, %285, !dbg !261
  %287 = add nsw i64 %140, %indvars.iv, !dbg !261
  %288 = getelementptr inbounds float* %134, i64 %287, !dbg !261
  store float %286, float* %288, align 4, !dbg !261, !tbaa !225
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !260
  %exitcond = icmp eq i32 %lftr.wideiv, %9, !dbg !260
  br i1 %exitcond, label %._crit_edge, label %157, !dbg !260

._crit_edge:                                      ; preds = %157, %.preheader1._crit_edge
  %.pre-phi = phi i32 [ %.pre, %.preheader1._crit_edge ], [ %56, %157 ], !dbg !259
  %gosa.3.lcssa = phi float [ %gosa.28, %.preheader1._crit_edge ], [ %283, %157 ]
  tail call void @llvm.dbg.value(metadata !{i32 %.pre-phi}, i64 0, metadata !112), !dbg !259
  %exitcond27 = icmp eq i32 %.pre-phi, %6, !dbg !259
  br i1 %exitcond27, label %._crit_edge10, label %.preheader1, !dbg !259

._crit_edge10:                                    ; preds = %._crit_edge, %.preheader3
  %gosa.2.lcssa = phi float [ %gosa.112, %.preheader3 ], [ %gosa.3.lcssa, %._crit_edge ]
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !111), !dbg !244
  %exitcond28 = icmp eq i32 %36, %3, !dbg !244
  br i1 %exitcond28, label %.preheader4, label %.preheader3, !dbg !244

.preheader2:                                      ; preds = %.preheader4, %._crit_edge20
  %i.121 = phi i32 [ %310, %._crit_edge20 ], [ 1, %.preheader4 ]
  br i1 %12, label %.preheader, label %._crit_edge20, !dbg !247

.preheader:                                       ; preds = %.preheader2, %._crit_edge18
  %j.119 = phi i32 [ %309, %._crit_edge18 ], [ 1, %.preheader2 ]
  br i1 %13, label %.lr.ph17, label %._crit_edge18, !dbg !250

.lr.ph17:                                         ; preds = %.preheader
  %289 = load i32* %14, align 4, !dbg !252, !tbaa !209
  %290 = load i32* %15, align 4, !dbg !252, !tbaa !211
  %291 = mul nsw i32 %289, %i.121, !dbg !252
  %292 = add i32 %291, %j.119, !dbg !252
  %293 = mul i32 %292, %290, !dbg !252
  %294 = load float** %16, align 8, !dbg !252, !tbaa !214
  %295 = load i32* %4, align 4, !dbg !252, !tbaa !209
  %296 = load i32* %7, align 4, !dbg !252, !tbaa !211
  %297 = mul nsw i32 %295, %i.121, !dbg !252
  %298 = add i32 %297, %j.119, !dbg !252
  %299 = mul i32 %298, %296, !dbg !252
  %300 = load float** %17, align 8, !dbg !252, !tbaa !214
  %301 = sext i32 %299 to i64, !dbg !250
  %302 = sext i32 %293 to i64, !dbg !250
  br label %303, !dbg !250

; <label>:303                                     ; preds = %303, %.lr.ph17
  %indvars.iv29 = phi i64 [ 1, %.lr.ph17 ], [ %indvars.iv.next30, %303 ]
  %304 = add nsw i64 %302, %indvars.iv29, !dbg !252
  %305 = getelementptr inbounds float* %294, i64 %304, !dbg !252
  %306 = load float* %305, align 4, !dbg !252, !tbaa !225
  %307 = add nsw i64 %301, %indvars.iv29, !dbg !252
  %308 = getelementptr inbounds float* %300, i64 %307, !dbg !252
  store float %306, float* %308, align 4, !dbg !252, !tbaa !225
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !250
  %lftr.wideiv31 = trunc i64 %indvars.iv.next30 to i32, !dbg !250
  %exitcond32 = icmp eq i32 %lftr.wideiv31, %9, !dbg !250
  br i1 %exitcond32, label %._crit_edge18, label %303, !dbg !250

._crit_edge18:                                    ; preds = %303, %.preheader
  %309 = add nsw i32 %j.119, 1, !dbg !247
  tail call void @llvm.dbg.value(metadata !{i32 %309}, i64 0, metadata !112), !dbg !247
  %exitcond37 = icmp eq i32 %309, %6, !dbg !247
  br i1 %exitcond37, label %._crit_edge20, label %.preheader, !dbg !247

._crit_edge20:                                    ; preds = %._crit_edge18, %.preheader2
  %310 = add nsw i32 %i.121, 1, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i32 %310}, i64 0, metadata !111), !dbg !258
  %exitcond38 = icmp eq i32 %310, %3, !dbg !258
  br i1 %exitcond38, label %._crit_edge23, label %.preheader2, !dbg !258

._crit_edge23:                                    ; preds = %._crit_edge20, %.preheader5, %.preheader4
  %gosa.1.lcssa42 = phi float [ %gosa.2.lcssa, %.preheader4 ], [ 0.000000e+00, %.preheader5 ], [ %gosa.2.lcssa, %._crit_edge20 ]
  %311 = add nsw i32 %n.024, 1, !dbg !242
  tail call void @llvm.dbg.value(metadata !{i32 %311}, i64 0, metadata !114), !dbg !242
  %exitcond39 = icmp eq i32 %311, %nn, !dbg !242
  br i1 %exitcond39, label %._crit_edge25, label %.preheader5, !dbg !242

._crit_edge25:                                    ; preds = %._crit_edge23, %0
  %gosa.0.lcssa = phi float [ undef, %0 ], [ %gosa.1.lcssa42, %._crit_edge23 ]
  ret float %gosa.0.lcssa, !dbg !263
}

; Function Attrs: minsize nounwind optsize uwtable
define void @clearMat(%struct.Mat* nocapture %Mat) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !80), !dbg !264
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !265
  %2 = load float** %1, align 8, !dbg !265, !tbaa !214
  %3 = icmp eq float* %2, null, !dbg !265
  br i1 %3, label %6, label %4, !dbg !265

; <label>:4                                       ; preds = %0
  %5 = bitcast float* %2 to i8*, !dbg !267
  tail call void @free(i8* %5) #7, !dbg !267
  br label %6, !dbg !267

; <label>:6                                       ; preds = %0, %4
  %7 = bitcast %struct.Mat* %Mat to i8*, !dbg !268
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 24, i32 8, i1 false), !dbg !269
  ret void, !dbg !268
}

; Function Attrs: minsize nounwind optsize readnone uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %mx}, i64 0, metadata !40), !dbg !270
  tail call void @llvm.dbg.value(metadata !{i32 %my}, i64 0, metadata !41), !dbg !270
  tail call void @llvm.dbg.value(metadata !{i32 %mz}, i64 0, metadata !42), !dbg !270
  %1 = add nsw i32 %mz, -2, !dbg !271
  %2 = sitofp i32 %1 to double, !dbg !271
  %3 = add nsw i32 %my, -2, !dbg !271
  %4 = sitofp i32 %3 to double, !dbg !271
  %5 = fmul double %4, %2, !dbg !271
  %6 = add nsw i32 %mx, -2, !dbg !271
  %7 = sitofp i32 %6 to double, !dbg !271
  %8 = fmul double %7, %5, !dbg !271
  %9 = fmul double %8, 3.400000e+01, !dbg !271
  ret double %9, !dbg !271
}

; Function Attrs: minsize nounwind optsize readnone uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nn}, i64 0, metadata !47), !dbg !272
  tail call void @llvm.dbg.value(metadata !{double %cpu}, i64 0, metadata !48), !dbg !272
  tail call void @llvm.dbg.value(metadata !{double %flop}, i64 0, metadata !49), !dbg !272
  %1 = fdiv double %flop, %cpu, !dbg !273
  %2 = fmul double %1, 1.000000e-06, !dbg !273
  %3 = sitofp i32 %nn to double, !dbg !273
  %4 = fmul double %3, %2, !dbg !273
  ret double %4, !dbg !273
}

; Function Attrs: minsize nounwind optsize uwtable
define void @set_param(i32* nocapture %is, i8* nocapture readonly %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %is}, i64 0, metadata !55), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %size}, i64 0, metadata !56), !dbg !274
  %1 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #7, !dbg !275
  %2 = icmp eq i32 %1, 0, !dbg !275
  br i1 %2, label %6, label %3, !dbg !275

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !275
  %5 = icmp eq i32 %4, 0, !dbg !275
  br i1 %5, label %6, label %9, !dbg !275

; <label>:6                                       ; preds = %3, %0
  store i32 32, i32* %is, align 4, !dbg !277, !tbaa !279
  %7 = getelementptr inbounds i32* %is, i64 1, !dbg !280
  store i32 32, i32* %7, align 4, !dbg !280, !tbaa !279
  %8 = getelementptr inbounds i32* %is, i64 2, !dbg !281
  store i32 64, i32* %8, align 4, !dbg !281, !tbaa !279
  br label %46, !dbg !282

; <label>:9                                       ; preds = %3
  %10 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0)) #7, !dbg !283
  %11 = icmp eq i32 %10, 0, !dbg !283
  br i1 %11, label %15, label %12, !dbg !283

; <label>:12                                      ; preds = %9
  %13 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str7, i64 0, i64 0)) #7, !dbg !283
  %14 = icmp eq i32 %13, 0, !dbg !283
  br i1 %14, label %15, label %18, !dbg !283

; <label>:15                                      ; preds = %12, %9
  store i32 64, i32* %is, align 4, !dbg !285, !tbaa !279
  %16 = getelementptr inbounds i32* %is, i64 1, !dbg !287
  store i32 64, i32* %16, align 4, !dbg !287, !tbaa !279
  %17 = getelementptr inbounds i32* %is, i64 2, !dbg !288
  store i32 128, i32* %17, align 4, !dbg !288, !tbaa !279
  br label %46, !dbg !289

; <label>:18                                      ; preds = %12
  %19 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) #7, !dbg !290
  %20 = icmp eq i32 %19, 0, !dbg !290
  br i1 %20, label %24, label %21, !dbg !290

; <label>:21                                      ; preds = %18
  %22 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str9, i64 0, i64 0)) #7, !dbg !290
  %23 = icmp eq i32 %22, 0, !dbg !290
  br i1 %23, label %24, label %27, !dbg !290

; <label>:24                                      ; preds = %21, %18
  store i32 128, i32* %is, align 4, !dbg !292, !tbaa !279
  %25 = getelementptr inbounds i32* %is, i64 1, !dbg !294
  store i32 128, i32* %25, align 4, !dbg !294, !tbaa !279
  %26 = getelementptr inbounds i32* %is, i64 2, !dbg !295
  store i32 256, i32* %26, align 4, !dbg !295, !tbaa !279
  br label %46, !dbg !296

; <label>:27                                      ; preds = %21
  %28 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str10, i64 0, i64 0)) #7, !dbg !297
  %29 = icmp eq i32 %28, 0, !dbg !297
  br i1 %29, label %33, label %30, !dbg !297

; <label>:30                                      ; preds = %27
  %31 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str11, i64 0, i64 0)) #7, !dbg !297
  %32 = icmp eq i32 %31, 0, !dbg !297
  br i1 %32, label %33, label %36, !dbg !297

; <label>:33                                      ; preds = %30, %27
  store i32 256, i32* %is, align 4, !dbg !299, !tbaa !279
  %34 = getelementptr inbounds i32* %is, i64 1, !dbg !301
  store i32 256, i32* %34, align 4, !dbg !301, !tbaa !279
  %35 = getelementptr inbounds i32* %is, i64 2, !dbg !302
  store i32 512, i32* %35, align 4, !dbg !302, !tbaa !279
  br label %46, !dbg !303

; <label>:36                                      ; preds = %30
  %37 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str12, i64 0, i64 0)) #7, !dbg !304
  %38 = icmp eq i32 %37, 0, !dbg !304
  br i1 %38, label %42, label %39, !dbg !304

; <label>:39                                      ; preds = %36
  %40 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0)) #7, !dbg !304
  %41 = icmp eq i32 %40, 0, !dbg !304
  br i1 %41, label %42, label %45, !dbg !304

; <label>:42                                      ; preds = %39, %36
  store i32 512, i32* %is, align 4, !dbg !306, !tbaa !279
  %43 = getelementptr inbounds i32* %is, i64 1, !dbg !308
  store i32 512, i32* %43, align 4, !dbg !308, !tbaa !279
  %44 = getelementptr inbounds i32* %is, i64 2, !dbg !309
  store i32 1024, i32* %44, align 4, !dbg !309, !tbaa !279
  br label %46, !dbg !310

; <label>:45                                      ; preds = %39
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str, i64 0, i64 0)), !dbg !311
  tail call void @exit(i32 6) #9, !dbg !313
  unreachable, !dbg !313

; <label>:46                                      ; preds = %42, %33, %24, %15, %6
  ret void, !dbg !314
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #4

; Function Attrs: minsize noreturn nounwind optsize
declare void @exit(i32) #5

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
define double @second() #0 {
  %tm = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tm}, metadata !125), !dbg !315
  %1 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #7, !dbg !316
  %2 = load i32* @second.base_sec, align 4, !dbg !317, !tbaa !279
  %3 = load i32* @second.base_usec, align 4
  %4 = or i32 %3, %2, !dbg !317
  %5 = icmp eq i32 %4, 0, !dbg !317
  %6 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0, !dbg !319
  %7 = load i64* %6, align 8, !dbg !319, !tbaa !321
  br i1 %5, label %8, label %13, !dbg !317

; <label>:8                                       ; preds = %0
  %9 = trunc i64 %7 to i32, !dbg !319
  store i32 %9, i32* @second.base_sec, align 4, !dbg !319, !tbaa !279
  %10 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1, !dbg !324
  %11 = load i64* %10, align 8, !dbg !324, !tbaa !325
  %12 = trunc i64 %11 to i32, !dbg !324
  store i32 %12, i32* @second.base_usec, align 4, !dbg !324, !tbaa !279
  tail call void @llvm.dbg.value(metadata !326, i64 0, metadata !135), !dbg !327
  br label %24, !dbg !328

; <label>:13                                      ; preds = %0
  %14 = sext i32 %2 to i64, !dbg !329
  %15 = sub nsw i64 %7, %14, !dbg !329
  %16 = sitofp i64 %15 to double, !dbg !329
  %17 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1, !dbg !329
  %18 = load i64* %17, align 8, !dbg !329, !tbaa !325
  %19 = sext i32 %3 to i64, !dbg !329
  %20 = sub nsw i64 %18, %19, !dbg !329
  %21 = sitofp i64 %20 to double, !dbg !329
  %22 = fdiv double %21, 1.000000e+06, !dbg !329
  %23 = fadd double %16, %22, !dbg !329
  tail call void @llvm.dbg.value(metadata !{double %23}, i64 0, metadata !135), !dbg !329
  br label %24

; <label>:24                                      ; preds = %13, %8
  %t.0 = phi double [ 0.000000e+00, %8 ], [ %23, %13 ]
  ret double %t.0, !dbg !331
}

; Function Attrs: minsize nounwind optsize
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { minsize nounwind optsize }
attributes #8 = { minsize optsize }
attributes #9 = { minsize noreturn nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!147, !148}
!llvm.ident = !{!149}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !136, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c] [DW_LANG_C99]
!1 = metadata !{metadata !"himenobmtxpa.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !36, metadata !43, metadata !50, metadata !57, metadata !76, metadata !81, metadata !91, metadata !99, metadata !121}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 71, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 72} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !29, metadata !31, metadata !33, metadata !34, metadata !35}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777287, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 71]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554503, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 71]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 73]
!16 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 73]
!17 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 73]
!18 = metadata !{i32 786688, metadata !4, metadata !"nn", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nn] [line 73]
!19 = metadata !{i32 786688, metadata !4, metadata !"imax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 74]
!20 = metadata !{i32 786688, metadata !4, metadata !"jmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jmax] [line 74]
!21 = metadata !{i32 786688, metadata !4, metadata !"kmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kmax] [line 74]
!22 = metadata !{i32 786688, metadata !4, metadata !"mimax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mimax] [line 74]
!23 = metadata !{i32 786688, metadata !4, metadata !"mjmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mjmax] [line 74]
!24 = metadata !{i32 786688, metadata !4, metadata !"mkmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mkmax] [line 74]
!25 = metadata !{i32 786688, metadata !4, metadata !"msize", metadata !5, i32 74, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msize] [line 74]
!26 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 96, i64 32, i32 0, i32 0, metadata !8, metadata !27, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!29 = metadata !{i32 786688, metadata !4, metadata !"gosa", metadata !5, i32 75, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gosa] [line 75]
!30 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!31 = metadata !{i32 786688, metadata !4, metadata !"cpu0", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu0] [line 76]
!32 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!33 = metadata !{i32 786688, metadata !4, metadata !"cpu1", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu1] [line 76]
!34 = metadata !{i32 786688, metadata !4, metadata !"cpu", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu] [line 76]
!35 = metadata !{i32 786688, metadata !4, metadata !"flop", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flop] [line 76]
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fflop", metadata !"fflop", metadata !"", i32 144, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32, i32)* @fflop, null, null, metadata !39, i32 145} ; [ DW_TAG_subprogram ] [line 144] [def] [scope 145] [fflop]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !32, metadata !8, metadata !8, metadata !8}
!39 = metadata !{metadata !40, metadata !41, metadata !42}
!40 = metadata !{i32 786689, metadata !36, metadata !"mx", metadata !5, i32 16777360, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mx] [line 144]
!41 = metadata !{i32 786689, metadata !36, metadata !"my", metadata !5, i32 33554576, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [my] [line 144]
!42 = metadata !{i32 786689, metadata !36, metadata !"mz", metadata !5, i32 50331792, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mz] [line 144]
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mflops", metadata !"mflops", metadata !"", i32 150, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, double, double)* @mflops, null, null, metadata !46, i32 151} ; [ DW_TAG_subprogram ] [line 150] [def] [scope 151] [mflops]
!44 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{metadata !32, metadata !8, metadata !32, metadata !32}
!46 = metadata !{metadata !47, metadata !48, metadata !49}
!47 = metadata !{i32 786689, metadata !43, metadata !"nn", metadata !5, i32 16777366, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 150]
!48 = metadata !{i32 786689, metadata !43, metadata !"cpu", metadata !5, i32 33554582, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cpu] [line 150]
!49 = metadata !{i32 786689, metadata !43, metadata !"flop", metadata !5, i32 50331798, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flop] [line 150]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"set_param", metadata !"set_param", metadata !"", i32 156, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8*)* @set_param, null, null, metadata !54, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [set_param]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !53, metadata !10}
!53 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!54 = metadata !{metadata !55, metadata !56}
!55 = metadata !{i32 786689, metadata !50, metadata !"is", metadata !5, i32 16777372, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [is] [line 156]
!56 = metadata !{i32 786689, metadata !50, metadata !"size", metadata !5, i32 33554588, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 156]
!57 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"newMat", metadata !"newMat", metadata !"", i32 194, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.Mat*, i32, i32, i32, i32)* @newMat, null, null, metadata !70, i32 195} ; [ DW_TAG_subprogram ] [line 194] [def] [scope 195] [newMat]
!58 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !8, metadata !60, metadata !8, metadata !8, metadata !8, metadata !8}
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Matrix]
!61 = metadata !{i32 786454, metadata !1, null, metadata !"Matrix", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_typedef ] [Matrix] [line 54, size 0, align 0, offset 0] [from Mat]
!62 = metadata !{i32 786451, metadata !1, null, metadata !"Mat", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Mat] [line 45, size 192, align 64, offset 0] [def] [from ]
!63 = metadata !{metadata !64, metadata !66, metadata !67, metadata !68, metadata !69}
!64 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"m", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_member ] [m] [line 46, size 64, align 64, offset 0] [from ]
!65 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!66 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mnums", i32 47, i64 32, i64 32, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [mnums] [line 47, size 32, align 32, offset 64] [from int]
!67 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mrows", i32 48, i64 32, i64 32, i64 96, i32 0, metadata !8} ; [ DW_TAG_member ] [mrows] [line 48, size 32, align 32, offset 96] [from int]
!68 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mcols", i32 49, i64 32, i64 32, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [mcols] [line 49, size 32, align 32, offset 128] [from int]
!69 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mdeps", i32 50, i64 32, i64 32, i64 160, i32 0, metadata !8} ; [ DW_TAG_member ] [mdeps] [line 50, size 32, align 32, offset 160] [from int]
!70 = metadata !{metadata !71, metadata !72, metadata !73, metadata !74, metadata !75}
!71 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!72 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!73 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!74 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!75 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!76 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"clearMat", metadata !"clearMat", metadata !"", i32 208, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Mat*)* @clearMat, null, null, metadata !79, i32 209} ; [ DW_TAG_subprogram ] [line 208] [def] [scope 209] [clearMat]
!77 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{null, metadata !60}
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!81 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mat_set", metadata !"mat_set", metadata !"", i32 220, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Mat*, i32, float)* @mat_set, null, null, metadata !84, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [mat_set]
!82 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!83 = metadata !{null, metadata !60, metadata !8, metadata !30}
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90}
!85 = metadata !{i32 786689, metadata !81, metadata !"Mat", metadata !5, i32 16777436, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!86 = metadata !{i32 786689, metadata !81, metadata !"l", metadata !5, i32 33554652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 220]
!87 = metadata !{i32 786689, metadata !81, metadata !"val", metadata !5, i32 50331868, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 220]
!88 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 222]
!89 = metadata !{i32 786688, metadata !81, metadata !"j", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 222]
!90 = metadata !{i32 786688, metadata !81, metadata !"k", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 222]
!91 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mat_set_init", metadata !"mat_set_init", metadata !"", i32 231, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Mat*)* @mat_set_init, null, null, metadata !92, i32 232} ; [ DW_TAG_subprogram ] [line 231] [def] [scope 232] [mat_set_init]
!92 = metadata !{metadata !93, metadata !94, metadata !95, metadata !96, metadata !97, metadata !98}
!93 = metadata !{i32 786689, metadata !91, metadata !"Mat", metadata !5, i32 16777447, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!94 = metadata !{i32 786688, metadata !91, metadata !"i", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 233]
!95 = metadata !{i32 786688, metadata !91, metadata !"j", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 233]
!96 = metadata !{i32 786688, metadata !91, metadata !"k", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 233]
!97 = metadata !{i32 786688, metadata !91, metadata !"l", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 233]
!98 = metadata !{i32 786688, metadata !91, metadata !"tt", metadata !5, i32 234, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tt] [line 234]
!99 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"jacobi", metadata !"jacobi", metadata !"", i32 244, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (i32, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*)* @jacobi, null, null, metadata !102, i32 246} ; [ DW_TAG_subprogram ] [line 244] [def] [scope 246] [jacobi]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !30, metadata !8, metadata !60, metadata !60, metadata !60, metadata !60, metadata !60, metadata !60, metadata !60}
!102 = metadata !{metadata !103, metadata !104, metadata !105, metadata !106, metadata !107, metadata !108, metadata !109, metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119, metadata !120}
!103 = metadata !{i32 786689, metadata !99, metadata !"nn", metadata !5, i32 16777460, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 244]
!104 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 33554676, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 244]
!105 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 50331892, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 244]
!106 = metadata !{i32 786689, metadata !99, metadata !"c", metadata !5, i32 67109108, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 244]
!107 = metadata !{i32 786689, metadata !99, metadata !"p", metadata !5, i32 83886325, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 245]
!108 = metadata !{i32 786689, metadata !99, metadata !"bnd", metadata !5, i32 100663541, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bnd] [line 245]
!109 = metadata !{i32 786689, metadata !99, metadata !"wrk1", metadata !5, i32 117440757, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wrk1] [line 245]
!110 = metadata !{i32 786689, metadata !99, metadata !"wrk2", metadata !5, i32 134217973, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wrk2] [line 245]
!111 = metadata !{i32 786688, metadata !99, metadata !"i", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 247]
!112 = metadata !{i32 786688, metadata !99, metadata !"j", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 247]
!113 = metadata !{i32 786688, metadata !99, metadata !"k", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 247]
!114 = metadata !{i32 786688, metadata !99, metadata !"n", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 247]
!115 = metadata !{i32 786688, metadata !99, metadata !"imax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 247]
!116 = metadata !{i32 786688, metadata !99, metadata !"jmax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jmax] [line 247]
!117 = metadata !{i32 786688, metadata !99, metadata !"kmax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kmax] [line 247]
!118 = metadata !{i32 786688, metadata !99, metadata !"gosa", metadata !5, i32 248, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gosa] [line 248]
!119 = metadata !{i32 786688, metadata !99, metadata !"s0", metadata !5, i32 248, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s0] [line 248]
!120 = metadata !{i32 786688, metadata !99, metadata !"ss", metadata !5, i32 248, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ss] [line 248]
!121 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"second", metadata !"second", metadata !"", i32 294, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, double ()* @second, null, null, metadata !124, i32 295} ; [ DW_TAG_subprogram ] [line 294] [def] [scope 295] [second]
!122 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !123, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = metadata !{metadata !32}
!124 = metadata !{metadata !125, metadata !135}
!125 = metadata !{i32 786688, metadata !121, metadata !"tm", metadata !5, i32 297, metadata !126, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tm] [line 297]
!126 = metadata !{i32 786451, metadata !127, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !128, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!127 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!128 = metadata !{metadata !129, metadata !133}
!129 = metadata !{i32 786445, metadata !127, metadata !126, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!130 = metadata !{i32 786454, metadata !131, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !132} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!131 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!132 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!133 = metadata !{i32 786445, metadata !127, metadata !126, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !134} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!134 = metadata !{i32 786454, metadata !131, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !132} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!135 = metadata !{i32 786688, metadata !121, metadata !"t", metadata !5, i32 298, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 298]
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146}
!137 = metadata !{i32 786484, i32 0, null, metadata !"omega", metadata !"omega", metadata !"", metadata !5, i32 67, metadata !30, i32 0, i32 1, float* @omega, null} ; [ DW_TAG_variable ] [omega] [line 67] [def]
!138 = metadata !{i32 786484, i32 0, metadata !121, metadata !"base_sec", metadata !"base_sec", metadata !"", metadata !5, i32 300, metadata !8, i32 1, i32 1, i32* @second.base_sec, null} ; [ DW_TAG_variable ] [base_sec] [line 300] [local] [def]
!139 = metadata !{i32 786484, i32 0, metadata !121, metadata !"base_usec", metadata !"base_usec", metadata !"", metadata !5, i32 300, metadata !8, i32 1, i32 1, i32* @second.base_usec, null} ; [ DW_TAG_variable ] [base_usec] [line 300] [local] [def]
!140 = metadata !{i32 786484, i32 0, null, metadata !"a", metadata !"a", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @a, null} ; [ DW_TAG_variable ] [a] [line 68] [def]
!141 = metadata !{i32 786484, i32 0, null, metadata !"b", metadata !"b", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @b, null} ; [ DW_TAG_variable ] [b] [line 68] [def]
!142 = metadata !{i32 786484, i32 0, null, metadata !"c", metadata !"c", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @c, null} ; [ DW_TAG_variable ] [c] [line 68] [def]
!143 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @p, null} ; [ DW_TAG_variable ] [p] [line 68] [def]
!144 = metadata !{i32 786484, i32 0, null, metadata !"bnd", metadata !"bnd", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @bnd, null} ; [ DW_TAG_variable ] [bnd] [line 68] [def]
!145 = metadata !{i32 786484, i32 0, null, metadata !"wrk1", metadata !"wrk1", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @wrk1, null} ; [ DW_TAG_variable ] [wrk1] [line 68] [def]
!146 = metadata !{i32 786484, i32 0, null, metadata !"wrk2", metadata !"wrk2", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @wrk2, null} ; [ DW_TAG_variable ] [wrk2] [line 68] [def]
!147 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!148 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!149 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!150 = metadata !{i32 71, i32 0, metadata !4, null}
!151 = metadata !{[3 x i32]* undef}
!152 = metadata !{i32 74, i32 0, metadata !4, null}
!153 = metadata !{i32 64}
!154 = metadata !{i32 83, i32 0, metadata !4, null}
!155 = metadata !{i32 84, i32 0, metadata !4, null}
!156 = metadata !{i32 128}
!157 = metadata !{i32 85, i32 0, metadata !4, null}
!158 = metadata !{i32 63}
!159 = metadata !{i32 86, i32 0, metadata !4, null}
!160 = metadata !{i32 87, i32 0, metadata !4, null}
!161 = metadata !{i32 127}
!162 = metadata !{i32 88, i32 0, metadata !4, null}
!163 = metadata !{i32 90, i32 0, metadata !4, null}
!164 = metadata !{i32 91, i32 0, metadata !4, null}
!165 = metadata !{i32 96, i32 0, metadata !4, null}
!166 = metadata !{i32 97, i32 0, metadata !4, null}
!167 = metadata !{i32 98, i32 0, metadata !4, null}
!168 = metadata !{i32 99, i32 0, metadata !4, null}
!169 = metadata !{i32 100, i32 0, metadata !4, null}
!170 = metadata !{i32 101, i32 0, metadata !4, null}
!171 = metadata !{i32 102, i32 0, metadata !4, null}
!172 = metadata !{i32 104, i32 0, metadata !4, null}
!173 = metadata !{i32 105, i32 0, metadata !4, null}
!174 = metadata !{i32 106, i32 0, metadata !4, null}
!175 = metadata !{i32 107, i32 0, metadata !4, null}
!176 = metadata !{i32 108, i32 0, metadata !4, null}
!177 = metadata !{i32 109, i32 0, metadata !4, null}
!178 = metadata !{i32 110, i32 0, metadata !4, null}
!179 = metadata !{i32 111, i32 0, metadata !4, null}
!180 = metadata !{i32 112, i32 0, metadata !4, null}
!181 = metadata !{i32 113, i32 0, metadata !4, null}
!182 = metadata !{i32 114, i32 0, metadata !4, null}
!183 = metadata !{i32 115, i32 0, metadata !4, null}
!184 = metadata !{i32 116, i32 0, metadata !4, null}
!185 = metadata !{i32 117, i32 0, metadata !4, null}
!186 = metadata !{i32 122, i32 0, metadata !4, null}
!187 = metadata !{i32 124, i32 0, metadata !4, null}
!188 = metadata !{i32 126, i32 0, metadata !4, null}
!189 = metadata !{i32 127, i32 0, metadata !4, null}
!190 = metadata !{i32 132, i32 0, metadata !4, null}
!191 = metadata !{i32 133, i32 0, metadata !4, null}
!192 = metadata !{i32 134, i32 0, metadata !4, null}
!193 = metadata !{i32 135, i32 0, metadata !4, null}
!194 = metadata !{i32 136, i32 0, metadata !4, null}
!195 = metadata !{i32 137, i32 0, metadata !4, null}
!196 = metadata !{i32 138, i32 0, metadata !4, null}
!197 = metadata !{i32 140, i32 0, metadata !4, null}
!198 = metadata !{i32 194, i32 0, metadata !57, null}
!199 = metadata !{i32 196, i32 0, metadata !57, null}
!200 = metadata !{metadata !201, metadata !205, i64 8}
!201 = metadata !{metadata !"Mat", metadata !202, i64 0, metadata !205, i64 8, metadata !205, i64 12, metadata !205, i64 16, metadata !205, i64 20}
!202 = metadata !{metadata !"any pointer", metadata !203, i64 0}
!203 = metadata !{metadata !"omnipotent char", metadata !204, i64 0}
!204 = metadata !{metadata !"Simple C/C++ TBAA"}
!205 = metadata !{metadata !"int", metadata !203, i64 0}
!206 = metadata !{i32 197, i32 0, metadata !57, null}
!207 = metadata !{metadata !201, metadata !205, i64 12}
!208 = metadata !{i32 198, i32 0, metadata !57, null}
!209 = metadata !{metadata !201, metadata !205, i64 16}
!210 = metadata !{i32 199, i32 0, metadata !57, null}
!211 = metadata !{metadata !201, metadata !205, i64 20}
!212 = metadata !{i32 200, i32 0, metadata !57, null}
!213 = metadata !{i32 202, i32 0, metadata !57, null}
!214 = metadata !{metadata !201, metadata !202, i64 0}
!215 = metadata !{i32 204, i32 0, metadata !57, null}
!216 = metadata !{i32 231, i32 0, metadata !91, null}
!217 = metadata !{i32 0}
!218 = metadata !{i32 236, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !91, i32 236, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!220 = metadata !{i32 237, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !219, i32 237, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!222 = metadata !{i32 238, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !221, i32 238, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!224 = metadata !{i32 239, i32 0, metadata !223, null}
!225 = metadata !{metadata !226, metadata !226, i64 0}
!226 = metadata !{metadata !"float", metadata !203, i64 0}
!227 = metadata !{i32 241, i32 0, metadata !91, null}
!228 = metadata !{i32 220, i32 0, metadata !81, null}
!229 = metadata !{i32 224, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !81, i32 224, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!231 = metadata !{i32 225, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !230, i32 225, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!233 = metadata !{i32 226, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !232, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!235 = metadata !{i32 227, i32 0, metadata !234, null}
!236 = metadata !{i32 228, i32 0, metadata !81, null}
!237 = metadata !{i32 244, i32 0, metadata !99, null}
!238 = metadata !{i32 245, i32 0, metadata !99, null}
!239 = metadata !{i32 250, i32 0, metadata !99, null}
!240 = metadata !{i32 251, i32 0, metadata !99, null}
!241 = metadata !{i32 252, i32 0, metadata !99, null}
!242 = metadata !{i32 254, i32 0, metadata !243, null}
!243 = metadata !{i32 786443, metadata !1, metadata !99, i32 254, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!244 = metadata !{i32 257, i32 0, metadata !245, null}
!245 = metadata !{i32 786443, metadata !1, metadata !246, i32 257, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!246 = metadata !{i32 786443, metadata !1, metadata !243, i32 254, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!247 = metadata !{i32 284, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !249, i32 284, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!249 = metadata !{i32 786443, metadata !1, metadata !246, i32 283, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!250 = metadata !{i32 285, i32 0, metadata !251, null}
!251 = metadata !{i32 786443, metadata !1, metadata !248, i32 285, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!252 = metadata !{i32 286, i32 0, metadata !251, null}
!253 = metadata !{i32 260, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !1, metadata !255, i32 259, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!255 = metadata !{i32 786443, metadata !1, metadata !256, i32 259, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!256 = metadata !{i32 786443, metadata !1, metadata !245, i32 258, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!257 = metadata !{i32 277, i32 0, metadata !254, null}
!258 = metadata !{i32 283, i32 0, metadata !249, null}
!259 = metadata !{i32 258, i32 0, metadata !256, null}
!260 = metadata !{i32 259, i32 0, metadata !255, null}
!261 = metadata !{i32 280, i32 0, metadata !254, null}
!262 = metadata !{i32 279, i32 0, metadata !254, null}
!263 = metadata !{i32 290, i32 0, metadata !99, null}
!264 = metadata !{i32 208, i32 0, metadata !76, null}
!265 = metadata !{i32 210, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !76, i32 210, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!267 = metadata !{i32 211, i32 0, metadata !266, null}
!268 = metadata !{i32 217, i32 0, metadata !76, null}
!269 = metadata !{i32 213, i32 0, metadata !76, null}
!270 = metadata !{i32 144, i32 0, metadata !36, null}
!271 = metadata !{i32 146, i32 0, metadata !36, null}
!272 = metadata !{i32 150, i32 0, metadata !43, null}
!273 = metadata !{i32 152, i32 0, metadata !43, null}
!274 = metadata !{i32 156, i32 0, metadata !50, null}
!275 = metadata !{i32 158, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !50, i32 158, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!277 = metadata !{i32 159, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !1, metadata !276, i32 158, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!279 = metadata !{metadata !205, metadata !205, i64 0}
!280 = metadata !{i32 160, i32 0, metadata !278, null}
!281 = metadata !{i32 161, i32 0, metadata !278, null}
!282 = metadata !{i32 162, i32 0, metadata !278, null}
!283 = metadata !{i32 164, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !50, i32 164, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!285 = metadata !{i32 165, i32 0, metadata !286, null}
!286 = metadata !{i32 786443, metadata !1, metadata !284, i32 164, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!287 = metadata !{i32 166, i32 0, metadata !286, null}
!288 = metadata !{i32 167, i32 0, metadata !286, null}
!289 = metadata !{i32 168, i32 0, metadata !286, null}
!290 = metadata !{i32 170, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !50, i32 170, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!292 = metadata !{i32 171, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !291, i32 170, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!294 = metadata !{i32 172, i32 0, metadata !293, null}
!295 = metadata !{i32 173, i32 0, metadata !293, null}
!296 = metadata !{i32 174, i32 0, metadata !293, null}
!297 = metadata !{i32 176, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !50, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!299 = metadata !{i32 177, i32 0, metadata !300, null}
!300 = metadata !{i32 786443, metadata !1, metadata !298, i32 176, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!301 = metadata !{i32 178, i32 0, metadata !300, null}
!302 = metadata !{i32 179, i32 0, metadata !300, null}
!303 = metadata !{i32 180, i32 0, metadata !300, null}
!304 = metadata !{i32 182, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !50, i32 182, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!306 = metadata !{i32 183, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !1, metadata !305, i32 182, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!308 = metadata !{i32 184, i32 0, metadata !307, null}
!309 = metadata !{i32 185, i32 0, metadata !307, null}
!310 = metadata !{i32 186, i32 0, metadata !307, null}
!311 = metadata !{i32 188, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !305, i32 187, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!313 = metadata !{i32 189, i32 0, metadata !312, null}
!314 = metadata !{i32 191, i32 0, metadata !50, null}
!315 = metadata !{i32 297, i32 0, metadata !121, null}
!316 = metadata !{i32 302, i32 0, metadata !121, null}
!317 = metadata !{i32 304, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !121, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!319 = metadata !{i32 306, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !318, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!321 = metadata !{metadata !322, metadata !323, i64 0}
!322 = metadata !{metadata !"timeval", metadata !323, i64 0, metadata !323, i64 8}
!323 = metadata !{metadata !"long", metadata !203, i64 0}
!324 = metadata !{i32 307, i32 0, metadata !320, null}
!325 = metadata !{metadata !322, metadata !323, i64 8}
!326 = metadata !{double 0.000000e+00}
!327 = metadata !{i32 308, i32 0, metadata !320, null}
!328 = metadata !{i32 309, i32 0, metadata !320, null}
!329 = metadata !{i32 310, i32 0, metadata !330, null}
!330 = metadata !{i32 786443, metadata !1, metadata !318, i32 309, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!331 = metadata !{i32 314, i32 0, metadata !121, null}
