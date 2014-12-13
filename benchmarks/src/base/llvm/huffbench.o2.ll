; ModuleID = 'huffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [26 x i8] c"error: bit code overflow\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"error: file has only one value!\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"error: no compression\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind uwtable
define noalias i8* @generate_test_data(i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !15), !dbg !125
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !16), !dbg !127
  %1 = tail call noalias i8* @malloc(i64 %n) #3, !dbg !128
  tail call void @llvm.dbg.value(metadata !{i8* %1}, i64 0, metadata !19), !dbg !128
  tail call void @llvm.dbg.value(metadata !{i8* %1}, i64 0, metadata !20), !dbg !129
  tail call void @llvm.dbg.value(metadata !130, i64 0, metadata !21), !dbg !131
  %2 = icmp eq i64 %n, 0, !dbg !131
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !131

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %ptr.01 = phi i8* [ %17, %.lr.ph ], [ %1, %0 ]
  %3 = load i64* @seed, align 8, !dbg !133, !tbaa !136
  %4 = xor i64 %3, 123459876, !dbg !133
  %5 = sdiv i64 %4, 127773, !dbg !140
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !141), !dbg !140
  %6 = mul i64 %5, -127773, !dbg !142
  %7 = add i64 %6, %4, !dbg !142
  %8 = mul nsw i64 %7, 16807, !dbg !142
  %9 = mul i64 %5, -2836, !dbg !142
  %10 = add i64 %8, %9, !dbg !142
  %11 = icmp slt i64 %10, 0, !dbg !143
  %12 = add nsw i64 %10, 2147483647, !dbg !145
  %..i = select i1 %11, i64 %12, i64 %10, !dbg !143
  %13 = srem i64 %..i, 32, !dbg !146
  tail call void @llvm.dbg.value(metadata !{i64 %13}, i64 0, metadata !147), !dbg !146
  %14 = xor i64 %..i, 123459876, !dbg !148
  store i64 %14, i64* @seed, align 8, !dbg !148, !tbaa !136
  %15 = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %13, !dbg !134
  %16 = load i8* %15, align 1, !dbg !134, !tbaa !149
  store i8 %16, i8* %ptr.01, align 1, !dbg !134, !tbaa !149
  %17 = getelementptr inbounds i8* %ptr.01, i64 1, !dbg !150
  tail call void @llvm.dbg.value(metadata !{i8* %17}, i64 0, metadata !20), !dbg !150
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !131
  %exitcond = icmp eq i64 %indvars.iv.next, %n, !dbg !131
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !131

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %1, !dbg !151
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @compdecomp(i8* nocapture %data, i64 %data_len) #0 {
  %freq = alloca [512 x i64], align 16
  %heap = alloca [256 x i64], align 16
  %link = alloca [512 x i32], align 16
  %code = alloca [256 x i64], align 16
  %clen = alloca [256 x i8], align 16
  %heap2 = alloca [256 x i64], align 16
  %outc = alloca [256 x i8], align 16
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !27), !dbg !152
  tail call void @llvm.dbg.value(metadata !{i64 %data_len}, i64 0, metadata !28), !dbg !152
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !38), !dbg !153
  %1 = add i64 %data_len, 1, !dbg !154
  %2 = tail call noalias i8* @malloc(i64 %1) #3, !dbg !154
  tail call void @llvm.dbg.value(metadata !{i8* %2}, i64 0, metadata !39), !dbg !154
  %3 = bitcast [512 x i64]* %freq to i8*, !dbg !155
  call void @llvm.lifetime.start(i64 4096, i8* %3) #3, !dbg !155
  tail call void @llvm.dbg.declare(metadata !{[512 x i64]* %freq}, metadata !40), !dbg !155
  %4 = bitcast [256 x i64]* %heap to i8*, !dbg !156
  call void @llvm.lifetime.start(i64 2048, i8* %4) #3, !dbg !156
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap}, metadata !44), !dbg !156
  %5 = bitcast [512 x i32]* %link to i8*, !dbg !157
  call void @llvm.lifetime.start(i64 2048, i8* %5) #3, !dbg !157
  tail call void @llvm.dbg.declare(metadata !{[512 x i32]* %link}, metadata !48), !dbg !157
  %6 = bitcast [256 x i64]* %code to i8*, !dbg !158
  call void @llvm.lifetime.start(i64 2048, i8* %6) #3, !dbg !158
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %code}, metadata !50), !dbg !158
  %7 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 0, !dbg !159
  call void @llvm.lifetime.start(i64 256, i8* %7) #3, !dbg !159
  tail call void @llvm.dbg.declare(metadata !{[256 x i8]* %clen}, metadata !52), !dbg !159
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %1, i32 1, i1 false), !dbg !160
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 4096, i32 16, i1 false), !dbg !161
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 2048, i32 16, i1 false), !dbg !162
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 2048, i32 16, i1 false), !dbg !163
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 2048, i32 16, i1 false), !dbg !164
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 256, i32 16, i1 false), !dbg !165
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !29), !dbg !167
  %8 = icmp eq i64 %data_len, 0, !dbg !167
  br i1 %8, label %.preheader36, label %.lr.ph113, !dbg !167

.lr.ph113:                                        ; preds = %0, %.lr.ph113
  %i.0111 = phi i64 [ %15, %.lr.ph113 ], [ 0, %0 ]
  %dptr.0110 = phi i8* [ %14, %.lr.ph113 ], [ %data, %0 ]
  %9 = load i8* %dptr.0110, align 1, !dbg !169, !tbaa !149
  %10 = zext i8 %9 to i64, !dbg !169
  %11 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %10, !dbg !169
  %12 = load i64* %11, align 8, !dbg !169, !tbaa !136
  %13 = add i64 %12, 1, !dbg !169
  store i64 %13, i64* %11, align 8, !dbg !169, !tbaa !136
  %14 = getelementptr inbounds i8* %dptr.0110, i64 1, !dbg !171
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !38), !dbg !171
  %15 = add i64 %i.0111, 1, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !29), !dbg !167
  %exitcond126 = icmp eq i64 %15, %data_len, !dbg !167
  br i1 %exitcond126, label %.preheader36, label %.lr.ph113, !dbg !167

.preheader35:                                     ; preds = %25
  %16 = icmp eq i64 %n.1, 0, !dbg !172
  br i1 %16, label %._crit_edge104, label %.lr.ph107, !dbg !172

.lr.ph107:                                        ; preds = %.preheader35
  %17 = trunc i64 %n.1 to i32, !dbg !174
  %18 = sdiv i32 %17, 2, !dbg !175
  br label %29, !dbg !172

.preheader36:                                     ; preds = %0, %.lr.ph113, %25
  %i.1109 = phi i64 [ %26, %25 ], [ 0, %.lr.ph113 ], [ 0, %0 ]
  %n.0108 = phi i64 [ %n.1, %25 ], [ 0, %.lr.ph113 ], [ 0, %0 ]
  %19 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %i.1109, !dbg !176
  %20 = load i64* %19, align 8, !dbg !176, !tbaa !136
  %21 = icmp eq i64 %20, 0, !dbg !176
  br i1 %21, label %25, label %22, !dbg !176

; <label>:22                                      ; preds = %.preheader36
  %23 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %n.0108, !dbg !180
  store i64 %i.1109, i64* %23, align 8, !dbg !180, !tbaa !136
  %24 = add i64 %n.0108, 1, !dbg !182
  tail call void @llvm.dbg.value(metadata !{i64 %24}, i64 0, metadata !31), !dbg !182
  br label %25, !dbg !183

; <label>:25                                      ; preds = %.preheader36, %22
  %n.1 = phi i64 [ %24, %22 ], [ %n.0108, %.preheader36 ]
  %26 = add i64 %i.1109, 1, !dbg !184
  tail call void @llvm.dbg.value(metadata !{i64 %26}, i64 0, metadata !29), !dbg !184
  %exitcond125 = icmp eq i64 %26, 256, !dbg !184
  br i1 %exitcond125, label %.preheader35, label %.preheader36, !dbg !184

.preheader34:                                     ; preds = %heap_adjust.exit
  %27 = icmp ugt i64 %n.1, 1, !dbg !185
  br i1 %27, label %.lr.ph103, label %._crit_edge104, !dbg !185

.lr.ph103:                                        ; preds = %.preheader34
  %28 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !186
  br label %68, !dbg !185

; <label>:29                                      ; preds = %.lr.ph107, %heap_adjust.exit
  %i.2106 = phi i64 [ %n.1, %.lr.ph107 ], [ %66, %heap_adjust.exit ]
  %30 = trunc i64 %i.2106 to i32, !dbg !174
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !188), !dbg !189
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !190), !dbg !189
  %sext = shl i64 %i.2106, 32, !dbg !191
  %31 = ashr exact i64 %sext, 32, !dbg !191
  %.sum.i = add i64 %31, -1, !dbg !191
  %32 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum.i, !dbg !191
  %33 = load i64* %32, align 8, !dbg !191, !tbaa !136
  %34 = icmp slt i32 %18, %30, !dbg !175
  %sext.pre.i = shl i64 %33, 32, !dbg !192
  %.pre.i = ashr exact i64 %sext.pre.i, 32, !dbg !192
  br i1 %34, label %heap_adjust.exit, label %.lr.ph.i, !dbg !175

.lr.ph.i:                                         ; preds = %29
  %35 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %.pre.i, !dbg !193
  %36 = load i64* %35, align 8, !dbg !193, !tbaa !136
  br label %37, !dbg !175

; <label>:37                                      ; preds = %60, %.lr.ph.i
  %.07.i = phi i32 [ %30, %.lr.ph.i ], [ %j.0.i, %60 ]
  %38 = shl nsw i32 %.07.i, 1, !dbg !196
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !197), !dbg !196
  %39 = icmp slt i32 %38, %17, !dbg !198
  br i1 %39, label %40, label %53, !dbg !198

; <label>:40                                      ; preds = %37
  %41 = sext i32 %38 to i64, !dbg !198
  %.sum5.i = add i64 %41, -1, !dbg !198
  %42 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum5.i, !dbg !198
  %43 = load i64* %42, align 8, !dbg !198, !tbaa !136
  %44 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %43, !dbg !198
  %45 = load i64* %44, align 8, !dbg !198, !tbaa !136
  %46 = or i32 %38, 1, !dbg !198
  %47 = sext i32 %46 to i64, !dbg !198
  %.sum6.i = add i64 %47, -1, !dbg !198
  %48 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum6.i, !dbg !198
  %49 = load i64* %48, align 8, !dbg !198, !tbaa !136
  %50 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %49, !dbg !198
  %51 = load i64* %50, align 8, !dbg !198, !tbaa !136
  %52 = icmp ugt i64 %45, %51, !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !197), !dbg !200
  %..i = select i1 %52, i32 %46, i32 %38, !dbg !198
  br label %53, !dbg !198

; <label>:53                                      ; preds = %40, %37
  %j.0.i = phi i32 [ %38, %37 ], [ %..i, %40 ]
  %54 = sext i32 %j.0.i to i64, !dbg !193
  %.sum3.i = add i64 %54, -1, !dbg !193
  %55 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum3.i, !dbg !193
  %56 = load i64* %55, align 8, !dbg !193, !tbaa !136
  %57 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %56, !dbg !193
  %58 = load i64* %57, align 8, !dbg !193, !tbaa !136
  %59 = icmp ult i64 %36, %58, !dbg !193
  br i1 %59, label %heap_adjust.exit, label %60, !dbg !193

; <label>:60                                      ; preds = %53
  %61 = sext i32 %.07.i to i64, !dbg !201
  %.sum4.i = add i64 %61, -1, !dbg !201
  %62 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum4.i, !dbg !201
  store i64 %56, i64* %62, align 8, !dbg !201, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i32 %j.0.i}, i64 0, metadata !190), !dbg !202
  %63 = icmp sgt i32 %j.0.i, %18, !dbg !175
  br i1 %63, label %heap_adjust.exit, label %37, !dbg !175

heap_adjust.exit:                                 ; preds = %53, %60, %29
  %.0.lcssa.i = phi i32 [ %30, %29 ], [ %.07.i, %53 ], [ %j.0.i, %60 ]
  %64 = sext i32 %.0.lcssa.i to i64, !dbg !192
  %.sum1.i = add i64 %64, -1, !dbg !192
  %65 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum1.i, !dbg !192
  store i64 %.pre.i, i64* %65, align 8, !dbg !192, !tbaa !136
  %66 = add i64 %i.2106, -1, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i64 %66}, i64 0, metadata !29), !dbg !172
  %67 = icmp eq i64 %66, 0, !dbg !172
  br i1 %67, label %.preheader34, label %29, !dbg !172

; <label>:68                                      ; preds = %.lr.ph103, %heap_adjust.exit14
  %n.2102 = phi i64 [ %n.1, %.lr.ph103 ], [ %69, %heap_adjust.exit14 ]
  %69 = add i64 %n.2102, -1, !dbg !203
  tail call void @llvm.dbg.value(metadata !204, i64 0, metadata !31), !dbg !203
  %70 = load i64* %28, align 16, !dbg !186, !tbaa !136
  %71 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %69, !dbg !205
  %72 = load i64* %71, align 8, !dbg !205, !tbaa !136
  store i64 %72, i64* %28, align 16, !dbg !205, !tbaa !136
  %73 = trunc i64 %69 to i32, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i64* %28}, i64 0, metadata !207), !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32 %73}, i64 0, metadata !209), !dbg !208
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !211), !dbg !208
  %74 = sdiv i32 %73, 2, !dbg !212
  %75 = icmp slt i32 %73, 2, !dbg !212
  %sext.pre.i15 = shl i64 %72, 32, !dbg !213
  %.pre.i16 = ashr exact i64 %sext.pre.i15, 32, !dbg !213
  br i1 %75, label %heap_adjust.exit27, label %.lr.ph.i17, !dbg !212

.lr.ph.i17:                                       ; preds = %68
  %76 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %.pre.i16, !dbg !214
  %77 = load i64* %76, align 8, !dbg !214, !tbaa !136
  br label %78, !dbg !212

; <label>:78                                      ; preds = %101, %.lr.ph.i17
  %.07.i18 = phi i32 [ 1, %.lr.ph.i17 ], [ %j.0.i22, %101 ]
  %79 = shl nsw i32 %.07.i18, 1, !dbg !215
  tail call void @llvm.dbg.value(metadata !{i32 %79}, i64 0, metadata !216), !dbg !215
  %80 = icmp slt i32 %79, %73, !dbg !217
  br i1 %80, label %81, label %94, !dbg !217

; <label>:81                                      ; preds = %78
  %82 = sext i32 %79 to i64, !dbg !217
  %.sum5.i19 = add i64 %82, -1, !dbg !217
  %83 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum5.i19, !dbg !217
  %84 = load i64* %83, align 8, !dbg !217, !tbaa !136
  %85 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %84, !dbg !217
  %86 = load i64* %85, align 8, !dbg !217, !tbaa !136
  %87 = or i32 %79, 1, !dbg !217
  %88 = sext i32 %87 to i64, !dbg !217
  %.sum6.i20 = add i64 %88, -1, !dbg !217
  %89 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum6.i20, !dbg !217
  %90 = load i64* %89, align 8, !dbg !217, !tbaa !136
  %91 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %90, !dbg !217
  %92 = load i64* %91, align 8, !dbg !217, !tbaa !136
  %93 = icmp ugt i64 %86, %92, !dbg !217
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !216), !dbg !218
  %..i21 = select i1 %93, i32 %87, i32 %79, !dbg !217
  br label %94, !dbg !217

; <label>:94                                      ; preds = %81, %78
  %j.0.i22 = phi i32 [ %79, %78 ], [ %..i21, %81 ]
  %95 = sext i32 %j.0.i22 to i64, !dbg !214
  %.sum3.i23 = add i64 %95, -1, !dbg !214
  %96 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum3.i23, !dbg !214
  %97 = load i64* %96, align 8, !dbg !214, !tbaa !136
  %98 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %97, !dbg !214
  %99 = load i64* %98, align 8, !dbg !214, !tbaa !136
  %100 = icmp ult i64 %77, %99, !dbg !214
  br i1 %100, label %heap_adjust.exit27, label %101, !dbg !214

; <label>:101                                     ; preds = %94
  %102 = sext i32 %.07.i18 to i64, !dbg !219
  %.sum4.i24 = add i64 %102, -1, !dbg !219
  %103 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum4.i24, !dbg !219
  store i64 %97, i64* %103, align 8, !dbg !219, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i32 %j.0.i22}, i64 0, metadata !211), !dbg !220
  %104 = icmp sgt i32 %j.0.i22, %74, !dbg !212
  br i1 %104, label %heap_adjust.exit27, label %78, !dbg !212

heap_adjust.exit27:                               ; preds = %94, %101, %68
  %.0.lcssa.i25 = phi i32 [ 1, %68 ], [ %.07.i18, %94 ], [ %j.0.i22, %101 ]
  %105 = sext i32 %.0.lcssa.i25 to i64, !dbg !213
  %.sum1.i26 = add i64 %105, -1, !dbg !213
  %106 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum1.i26, !dbg !213
  store i64 %.pre.i16, i64* %106, align 8, !dbg !213, !tbaa !136
  %107 = load i64* %28, align 16, !dbg !221, !tbaa !136
  %108 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %107, !dbg !221
  %109 = load i64* %108, align 8, !dbg !221, !tbaa !136
  %110 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %70, !dbg !221
  %111 = load i64* %110, align 8, !dbg !221, !tbaa !136
  %112 = add i64 %111, %109, !dbg !221
  %113 = add i64 %n.2102, 255, !dbg !221
  %114 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %113, !dbg !221
  store i64 %112, i64* %114, align 8, !dbg !221, !tbaa !136
  %115 = trunc i64 %113 to i32, !dbg !222
  %116 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %70, !dbg !222
  store i32 %115, i32* %116, align 4, !dbg !222, !tbaa !223
  %117 = sub i64 -255, %n.2102, !dbg !225
  %118 = trunc i64 %117 to i32, !dbg !225
  %119 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %107, !dbg !225
  store i32 %118, i32* %119, align 4, !dbg !225, !tbaa !223
  store i64 %113, i64* %28, align 16, !dbg !226, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i64* %28}, i64 0, metadata !227), !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %73}, i64 0, metadata !230), !dbg !229
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !231), !dbg !229
  %sext.pre.i2 = shl i64 %113, 32, !dbg !232
  %.pre.i3 = ashr exact i64 %sext.pre.i2, 32, !dbg !232
  br i1 %75, label %heap_adjust.exit14, label %.lr.ph.i4, !dbg !233

.lr.ph.i4:                                        ; preds = %heap_adjust.exit27
  %120 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %.pre.i3, !dbg !234
  %121 = load i64* %120, align 8, !dbg !234, !tbaa !136
  br label %122, !dbg !233

; <label>:122                                     ; preds = %145, %.lr.ph.i4
  %.07.i5 = phi i32 [ 1, %.lr.ph.i4 ], [ %j.0.i9, %145 ]
  %123 = shl nsw i32 %.07.i5, 1, !dbg !235
  tail call void @llvm.dbg.value(metadata !{i32 %123}, i64 0, metadata !236), !dbg !235
  %124 = icmp slt i32 %123, %73, !dbg !237
  br i1 %124, label %125, label %138, !dbg !237

; <label>:125                                     ; preds = %122
  %126 = sext i32 %123 to i64, !dbg !237
  %.sum5.i6 = add i64 %126, -1, !dbg !237
  %127 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum5.i6, !dbg !237
  %128 = load i64* %127, align 8, !dbg !237, !tbaa !136
  %129 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %128, !dbg !237
  %130 = load i64* %129, align 8, !dbg !237, !tbaa !136
  %131 = or i32 %123, 1, !dbg !237
  %132 = sext i32 %131 to i64, !dbg !237
  %.sum6.i7 = add i64 %132, -1, !dbg !237
  %133 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum6.i7, !dbg !237
  %134 = load i64* %133, align 8, !dbg !237, !tbaa !136
  %135 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %134, !dbg !237
  %136 = load i64* %135, align 8, !dbg !237, !tbaa !136
  %137 = icmp ugt i64 %130, %136, !dbg !237
  tail call void @llvm.dbg.value(metadata !{i32 %131}, i64 0, metadata !236), !dbg !238
  %..i8 = select i1 %137, i32 %131, i32 %123, !dbg !237
  br label %138, !dbg !237

; <label>:138                                     ; preds = %125, %122
  %j.0.i9 = phi i32 [ %123, %122 ], [ %..i8, %125 ]
  %139 = sext i32 %j.0.i9 to i64, !dbg !234
  %.sum3.i10 = add i64 %139, -1, !dbg !234
  %140 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum3.i10, !dbg !234
  %141 = load i64* %140, align 8, !dbg !234, !tbaa !136
  %142 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %141, !dbg !234
  %143 = load i64* %142, align 8, !dbg !234, !tbaa !136
  %144 = icmp ult i64 %121, %143, !dbg !234
  br i1 %144, label %heap_adjust.exit14, label %145, !dbg !234

; <label>:145                                     ; preds = %138
  %146 = sext i32 %.07.i5 to i64, !dbg !239
  %.sum4.i11 = add i64 %146, -1, !dbg !239
  %147 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum4.i11, !dbg !239
  store i64 %141, i64* %147, align 8, !dbg !239, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i32 %j.0.i9}, i64 0, metadata !231), !dbg !240
  %148 = icmp sgt i32 %j.0.i9, %74, !dbg !233
  br i1 %148, label %heap_adjust.exit14, label %122, !dbg !233

heap_adjust.exit14:                               ; preds = %138, %145, %heap_adjust.exit27
  %.0.lcssa.i12 = phi i32 [ 1, %heap_adjust.exit27 ], [ %.07.i5, %138 ], [ %j.0.i9, %145 ]
  %149 = sext i32 %.0.lcssa.i12 to i64, !dbg !232
  %.sum1.i13 = add i64 %149, -1, !dbg !232
  %150 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %.sum1.i13, !dbg !232
  store i64 %.pre.i3, i64* %150, align 8, !dbg !232, !tbaa !136
  %151 = icmp ugt i64 %69, 1, !dbg !185
  br i1 %151, label %68, label %._crit_edge104, !dbg !185

._crit_edge104:                                   ; preds = %heap_adjust.exit14, %.preheader35, %.preheader34
  %n.2.lcssa = phi i64 [ %n.1, %.preheader34 ], [ 0, %.preheader35 ], [ 1, %heap_adjust.exit14 ]
  %152 = add i64 %n.2.lcssa, 256, !dbg !241
  %153 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %152, !dbg !241
  store i32 0, i32* %153, align 4, !dbg !241, !tbaa !223
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !57), !dbg !242
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !58), !dbg !242
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !55), !dbg !243
  br label %154, !dbg !243

; <label>:154                                     ; preds = %176, %._crit_edge104
  %maxi.0101 = phi i64 [ 0, %._crit_edge104 ], [ %maxi.1, %176 ]
  %maxx.0100 = phi i64 [ 0, %._crit_edge104 ], [ %maxx.2, %176 ]
  %m.099 = phi i64 [ 0, %._crit_edge104 ], [ %177, %176 ]
  %155 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %m.099, !dbg !245
  %156 = load i64* %155, align 8, !dbg !245, !tbaa !136
  %157 = icmp eq i64 %156, 0, !dbg !245
  br i1 %157, label %159, label %.preheader33, !dbg !245

.preheader33:                                     ; preds = %154
  %l.0.in89 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %m.099, !dbg !248
  %l.090 = load i32* %l.0.in89, align 4, !dbg !248
  %158 = icmp eq i32 %l.090, 0, !dbg !250
  br i1 %158, label %._crit_edge96, label %.lr.ph95, !dbg !250

; <label>:159                                     ; preds = %154
  %160 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.099, !dbg !251
  store i64 0, i64* %160, align 8, !dbg !251, !tbaa !136
  %161 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.099, !dbg !253
  store i8 0, i8* %161, align 1, !dbg !253, !tbaa !149
  br label %176, !dbg !254

.lr.ph95:                                         ; preds = %.preheader33, %166
  %l.094 = phi i32 [ %l.0, %166 ], [ %l.090, %.preheader33 ]
  %x.093 = phi i64 [ %x.1, %166 ], [ 0, %.preheader33 ]
  %i.392 = phi i64 [ %169, %166 ], [ 0, %.preheader33 ]
  %j.091 = phi i64 [ %168, %166 ], [ 1, %.preheader33 ]
  %162 = icmp slt i32 %l.094, 0, !dbg !255
  br i1 %162, label %163, label %166, !dbg !255

; <label>:163                                     ; preds = %.lr.ph95
  %164 = add i64 %x.093, %j.091, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i64 %164}, i64 0, metadata !56), !dbg !258
  %165 = sub nsw i32 0, %l.094, !dbg !260
  tail call void @llvm.dbg.value(metadata !{i32 %165}, i64 0, metadata !59), !dbg !260
  br label %166, !dbg !261

; <label>:166                                     ; preds = %163, %.lr.ph95
  %x.1 = phi i64 [ %164, %163 ], [ %x.093, %.lr.ph95 ]
  %l.1 = phi i32 [ %165, %163 ], [ %l.094, %.lr.ph95 ]
  %167 = sext i32 %l.1 to i64, !dbg !262
  %168 = shl i64 %j.091, 1, !dbg !263
  tail call void @llvm.dbg.value(metadata !{i64 %168}, i64 0, metadata !30), !dbg !263
  %169 = add i64 %i.392, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata !{i64 %169}, i64 0, metadata !29), !dbg !264
  %l.0.in = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %167, !dbg !248
  %l.0 = load i32* %l.0.in, align 4, !dbg !248
  %170 = icmp eq i32 %l.0, 0, !dbg !250
  br i1 %170, label %._crit_edge96, label %.lr.ph95, !dbg !250

._crit_edge96:                                    ; preds = %166, %.preheader33
  %x.0.lcssa = phi i64 [ 0, %.preheader33 ], [ %x.1, %166 ]
  %i.3.lcssa = phi i64 [ 0, %.preheader33 ], [ %169, %166 ]
  %171 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.099, !dbg !265
  store i64 %x.0.lcssa, i64* %171, align 8, !dbg !265, !tbaa !136
  %172 = trunc i64 %i.3.lcssa to i8, !dbg !266
  %173 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.099, !dbg !266
  store i8 %172, i8* %173, align 1, !dbg !266, !tbaa !149
  %174 = icmp ugt i64 %x.0.lcssa, %maxx.0100, !dbg !267
  tail call void @llvm.dbg.value(metadata !{i64 %x.0.lcssa}, i64 0, metadata !57), !dbg !269
  %x.0.maxx.0 = select i1 %174, i64 %x.0.lcssa, i64 %maxx.0100, !dbg !267
  %175 = icmp ugt i64 %i.3.lcssa, %maxi.0101, !dbg !270
  tail call void @llvm.dbg.value(metadata !{i64 %i.3.lcssa}, i64 0, metadata !58), !dbg !272
  %i.3.maxi.0 = select i1 %175, i64 %i.3.lcssa, i64 %maxi.0101, !dbg !270
  br label %176, !dbg !270

; <label>:176                                     ; preds = %._crit_edge96, %159
  %maxx.2 = phi i64 [ %maxx.0100, %159 ], [ %x.0.maxx.0, %._crit_edge96 ]
  %maxi.1 = phi i64 [ %maxi.0101, %159 ], [ %i.3.maxi.0, %._crit_edge96 ]
  %177 = add i64 %m.099, 1, !dbg !243
  tail call void @llvm.dbg.value(metadata !{i64 %177}, i64 0, metadata !55), !dbg !243
  %exitcond124 = icmp eq i64 %177, 256, !dbg !243
  br i1 %exitcond124, label %178, label %154, !dbg !243

; <label>:178                                     ; preds = %176
  %179 = icmp ugt i64 %maxi.1, 64, !dbg !273
  br i1 %179, label %180, label %183, !dbg !273

; <label>:180                                     ; preds = %178
  %181 = load %struct._IO_FILE** @stderr, align 8, !dbg !275, !tbaa !277
  %182 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %181) #5, !dbg !275
  tail call void @exit(i32 1) #6, !dbg !279
  unreachable, !dbg !279

; <label>:183                                     ; preds = %178
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !60), !dbg !280
  tail call void @llvm.dbg.value(metadata !281, i64 0, metadata !61), !dbg !282
  tail call void @llvm.dbg.value(metadata !283, i64 0, metadata !62), !dbg !284
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !38), !dbg !285
  %184 = icmp eq i64 %maxx.2, 0, !dbg !286
  br i1 %184, label %185, label %.preheader32, !dbg !286

.preheader32:                                     ; preds = %183
  br i1 %8, label %._crit_edge85, label %.lr.ph84, !dbg !288

; <label>:185                                     ; preds = %183
  %186 = load %struct._IO_FILE** @stderr, align 8, !dbg !290, !tbaa !277
  %187 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %186) #5, !dbg !290
  tail call void @exit(i32 1) #6, !dbg !292
  unreachable, !dbg !292

.lr.ph84:                                         ; preds = %.preheader32, %._crit_edge75
  %bit.083 = phi i32 [ %bit.1.lcssa, %._crit_edge75 ], [ -1, %.preheader32 ]
  %bout.082 = phi i8 [ %bout.1.lcssa, %._crit_edge75 ], [ 0, %.preheader32 ]
  %comp_len.081 = phi i64 [ %comp_len.1.lcssa, %._crit_edge75 ], [ 0, %.preheader32 ]
  %j.180 = phi i64 [ %224, %._crit_edge75 ], [ 0, %.preheader32 ]
  %dptr.179 = phi i8* [ %223, %._crit_edge75 ], [ %data, %.preheader32 ]
  %188 = load i8* %dptr.179, align 1, !dbg !293, !tbaa !149
  tail call void @llvm.dbg.value(metadata !{i64 %196}, i64 0, metadata !32), !dbg !293
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !29), !dbg !295
  %189 = zext i8 %188 to i64, !dbg !295
  %190 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %189, !dbg !295
  %191 = load i8* %190, align 1, !dbg !295, !tbaa !149
  %192 = icmp eq i8 %191, 0, !dbg !295
  br i1 %192, label %._crit_edge75, label %.lr.ph74, !dbg !295

.lr.ph74:                                         ; preds = %.lr.ph84
  %193 = zext i8 %191 to i32, !dbg !293
  %194 = add nsw i32 %193, -1, !dbg !293
  %195 = shl i32 1, %194, !dbg !293
  %196 = sext i32 %195 to i64, !dbg !293
  br label %197, !dbg !295

; <label>:197                                     ; preds = %.lr.ph74, %210
  %198 = phi i8 [ %188, %.lr.ph74 ], [ %211, %210 ]
  %bit.172 = phi i32 [ %bit.083, %.lr.ph74 ], [ %bit.2, %210 ]
  %bout.171 = phi i8 [ %bout.082, %.lr.ph74 ], [ %bout.2., %210 ]
  %comp_len.170 = phi i64 [ %comp_len.081, %.lr.ph74 ], [ %comp_len.2, %210 ]
  %i.469 = phi i64 [ 0, %.lr.ph74 ], [ %218, %210 ]
  %mask.068 = phi i64 [ %196, %.lr.ph74 ], [ %217, %210 ]
  %199 = icmp eq i32 %bit.172, 7, !dbg !297
  br i1 %199, label %200, label %207, !dbg !297

; <label>:200                                     ; preds = %197
  %201 = getelementptr inbounds i8* %2, i64 %comp_len.170, !dbg !300
  store i8 %bout.171, i8* %201, align 1, !dbg !300, !tbaa !149
  %202 = add i64 %comp_len.170, 1, !dbg !302
  tail call void @llvm.dbg.value(metadata !{i64 %202}, i64 0, metadata !60), !dbg !302
  %203 = icmp eq i64 %202, %data_len, !dbg !303
  br i1 %203, label %204, label %._crit_edge128, !dbg !303

._crit_edge128:                                   ; preds = %200
  %.pre = load i8* %dptr.179, align 1, !dbg !305, !tbaa !149
  br label %210, !dbg !303

; <label>:204                                     ; preds = %200
  %205 = load %struct._IO_FILE** @stderr, align 8, !dbg !307, !tbaa !277
  %206 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %205) #5, !dbg !307
  tail call void @exit(i32 1) #6, !dbg !309
  unreachable, !dbg !309

; <label>:207                                     ; preds = %197
  %208 = add nsw i32 %bit.172, 1, !dbg !310
  tail call void @llvm.dbg.value(metadata !{i32 %208}, i64 0, metadata !62), !dbg !310
  %209 = shl i8 %bout.171, 1, !dbg !312
  tail call void @llvm.dbg.value(metadata !{i8 %209}, i64 0, metadata !61), !dbg !312
  br label %210

; <label>:210                                     ; preds = %._crit_edge128, %207
  %211 = phi i8 [ %198, %207 ], [ %.pre, %._crit_edge128 ], !dbg !305
  %comp_len.2 = phi i64 [ %comp_len.170, %207 ], [ %202, %._crit_edge128 ]
  %bout.2 = phi i8 [ %209, %207 ], [ 0, %._crit_edge128 ]
  %bit.2 = phi i32 [ %208, %207 ], [ 0, %._crit_edge128 ]
  %212 = zext i8 %211 to i64, !dbg !305
  %213 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %212, !dbg !305
  %214 = load i64* %213, align 8, !dbg !305, !tbaa !136
  %215 = and i64 %214, %mask.068, !dbg !305
  %not.29 = icmp ne i64 %215, 0, !dbg !305
  %216 = zext i1 %not.29 to i8, !dbg !305
  %bout.2. = or i8 %216, %bout.2, !dbg !305
  %217 = lshr i64 %mask.068, 1, !dbg !313
  tail call void @llvm.dbg.value(metadata !{i64 %217}, i64 0, metadata !32), !dbg !313
  %218 = add i64 %i.469, 1, !dbg !295
  tail call void @llvm.dbg.value(metadata !{i64 %218}, i64 0, metadata !29), !dbg !295
  %219 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %212, !dbg !295
  %220 = load i8* %219, align 1, !dbg !295, !tbaa !149
  %221 = zext i8 %220 to i64, !dbg !295
  %222 = icmp ult i64 %218, %221, !dbg !295
  br i1 %222, label %197, label %._crit_edge75, !dbg !295

._crit_edge75:                                    ; preds = %210, %.lr.ph84
  %bit.1.lcssa = phi i32 [ %bit.083, %.lr.ph84 ], [ %bit.2, %210 ]
  %bout.1.lcssa = phi i8 [ %bout.082, %.lr.ph84 ], [ %bout.2., %210 ]
  %comp_len.1.lcssa = phi i64 [ %comp_len.081, %.lr.ph84 ], [ %comp_len.2, %210 ]
  %223 = getelementptr inbounds i8* %dptr.179, i64 1, !dbg !314
  tail call void @llvm.dbg.value(metadata !{i8* %223}, i64 0, metadata !38), !dbg !314
  %224 = add i64 %j.180, 1, !dbg !288
  tail call void @llvm.dbg.value(metadata !{i64 %224}, i64 0, metadata !30), !dbg !288
  %225 = icmp ult i64 %224, %data_len, !dbg !288
  br i1 %225, label %.lr.ph84, label %._crit_edge85, !dbg !288

._crit_edge85:                                    ; preds = %._crit_edge75, %.preheader32
  %bit.0.lcssa = phi i32 [ -1, %.preheader32 ], [ %bit.1.lcssa, %._crit_edge75 ]
  %bout.0.lcssa = phi i8 [ 0, %.preheader32 ], [ %bout.1.lcssa, %._crit_edge75 ]
  %comp_len.0.lcssa = phi i64 [ 0, %.preheader32 ], [ %comp_len.1.lcssa, %._crit_edge75 ]
  %226 = sub nsw i32 7, %bit.0.lcssa, !dbg !315
  %227 = sext i8 %bout.0.lcssa to i32, !dbg !315
  %228 = shl i32 %227, %226, !dbg !315
  %229 = trunc i32 %228 to i8, !dbg !315
  tail call void @llvm.dbg.value(metadata !{i8 %229}, i64 0, metadata !61), !dbg !315
  %230 = getelementptr inbounds i8* %2, i64 %comp_len.0.lcssa, !dbg !316
  store i8 %229, i8* %230, align 1, !dbg !316, !tbaa !149
  %231 = bitcast [256 x i64]* %heap2 to i8*, !dbg !317
  call void @llvm.lifetime.start(i64 2048, i8* %231) #3, !dbg !317
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap2}, metadata !63), !dbg !317
  %232 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 0, !dbg !318
  call void @llvm.lifetime.start(i64 256, i8* %232) #3, !dbg !318
  tail call void @llvm.dbg.declare(metadata !{[256 x i8]* %outc}, metadata !64), !dbg !318
  call void @llvm.memset.p0i8.i64(i8* %231, i8 0, i64 2048, i32 16, i1 false), !dbg !319
  tail call void @llvm.dbg.value(metadata !{i8* %232}, i64 0, metadata !66), !dbg !320
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !30), !dbg !321
  br label %233, !dbg !321

; <label>:233                                     ; preds = %258, %._crit_edge85
  %optr.067 = phi i8* [ %232, %._crit_edge85 ], [ %235, %258 ]
  %j.266 = phi i64 [ 0, %._crit_edge85 ], [ %259, %258 ]
  %234 = trunc i64 %j.266 to i8, !dbg !323
  store i8 %234, i8* %optr.067, align 1, !dbg !323, !tbaa !149
  %235 = getelementptr inbounds i8* %optr.067, i64 1, !dbg !325
  tail call void @llvm.dbg.value(metadata !{i8* %235}, i64 0, metadata !66), !dbg !325
  %236 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %j.266, !dbg !326
  %237 = load i64* %236, align 8, !dbg !326, !tbaa !136
  %238 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %j.266, !dbg !326
  %239 = load i8* %238, align 1, !dbg !326, !tbaa !149
  %240 = zext i8 %239 to i64, !dbg !326
  %241 = or i64 %240, %237, !dbg !326
  %242 = icmp eq i64 %241, 0, !dbg !326
  br i1 %242, label %258, label %243, !dbg !326

; <label>:243                                     ; preds = %233
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !33), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i64 %248}, i64 0, metadata !32), !dbg !330
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !29), !dbg !331
  %244 = icmp eq i8 %239, 0, !dbg !331
  br i1 %244, label %._crit_edge64, label %.lr.ph63, !dbg !331

.lr.ph63:                                         ; preds = %243
  %245 = zext i8 %239 to i32, !dbg !330
  %246 = add nsw i32 %245, -1, !dbg !330
  %247 = shl i32 1, %246, !dbg !330
  %248 = sext i32 %247 to i64, !dbg !330
  br label %249, !dbg !331

; <label>:249                                     ; preds = %.lr.ph63, %249
  %i.561 = phi i64 [ 0, %.lr.ph63 ], [ %255, %249 ]
  %mask.160 = phi i64 [ %248, %.lr.ph63 ], [ %254, %249 ]
  %k.059 = phi i64 [ 0, %.lr.ph63 ], [ %., %249 ]
  %250 = shl i64 %k.059, 1, !dbg !333
  %251 = or i64 %250, 1, !dbg !333
  tail call void @llvm.dbg.value(metadata !{i64 %251}, i64 0, metadata !33), !dbg !333
  %252 = and i64 %237, %mask.160, !dbg !335
  %not.28 = icmp ne i64 %252, 0, !dbg !335
  %253 = zext i1 %not.28 to i64, !dbg !335
  %. = add i64 %253, %251, !dbg !335
  %254 = lshr i64 %mask.160, 1, !dbg !337
  tail call void @llvm.dbg.value(metadata !{i64 %254}, i64 0, metadata !32), !dbg !337
  %255 = add i64 %i.561, 1, !dbg !331
  tail call void @llvm.dbg.value(metadata !{i64 %255}, i64 0, metadata !29), !dbg !331
  %256 = icmp ult i64 %255, %240, !dbg !331
  br i1 %256, label %249, label %._crit_edge64, !dbg !331

._crit_edge64:                                    ; preds = %249, %243
  %k.0.lcssa = phi i64 [ 0, %243 ], [ %., %249 ]
  %257 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.266, !dbg !338
  store i64 %k.0.lcssa, i64* %257, align 8, !dbg !338, !tbaa !136
  br label %258, !dbg !339

; <label>:258                                     ; preds = %233, %._crit_edge64
  %259 = add i64 %j.266, 1, !dbg !321
  tail call void @llvm.dbg.value(metadata !{i64 %259}, i64 0, metadata !30), !dbg !321
  %exitcond123 = icmp eq i64 %259, 256, !dbg !321
  br i1 %exitcond123, label %.lr.ph55, label %233, !dbg !321

.lr.ph55:                                         ; preds = %258, %.critedge
  %i.658 = phi i64 [ %277, %.critedge ], [ 1, %258 ]
  %260 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.658, !dbg !340
  %261 = load i64* %260, align 8, !dbg !340, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i64 %261}, i64 0, metadata !35), !dbg !340
  %262 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.658, !dbg !343
  %263 = load i8* %262, align 1, !dbg !343, !tbaa !149
  tail call void @llvm.dbg.value(metadata !{i8 %263}, i64 0, metadata !36), !dbg !343
  tail call void @llvm.dbg.value(metadata !{i64 %i.658}, i64 0, metadata !30), !dbg !344
  br label %264, !dbg !345

; <label>:264                                     ; preds = %.lr.ph55, %269
  %j.353 = phi i64 [ %i.658, %.lr.ph55 ], [ %265, %269 ]
  %265 = add i64 %j.353, -1, !dbg !345
  %266 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %265, !dbg !345
  %267 = load i64* %266, align 8, !dbg !345, !tbaa !136
  %268 = icmp ugt i64 %267, %261, !dbg !345
  br i1 %268, label %269, label %.critedge

; <label>:269                                     ; preds = %264
  %270 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.353, !dbg !346
  store i64 %267, i64* %270, align 8, !dbg !346, !tbaa !136
  %271 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %265, !dbg !348
  %272 = load i8* %271, align 1, !dbg !348, !tbaa !149
  %273 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.353, !dbg !348
  store i8 %272, i8* %273, align 1, !dbg !348, !tbaa !149
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !30), !dbg !349
  %274 = icmp eq i64 %265, 0, !dbg !345
  br i1 %274, label %.critedge, label %264, !dbg !345

.critedge:                                        ; preds = %264, %269
  %j.3.lcssa = phi i64 [ 0, %269 ], [ %j.353, %264 ]
  %275 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3.lcssa, !dbg !350
  store i64 %261, i64* %275, align 8, !dbg !350, !tbaa !136
  %276 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3.lcssa, !dbg !351
  store i8 %263, i8* %276, align 1, !dbg !351, !tbaa !149
  %277 = add i64 %i.658, 1, !dbg !352
  tail call void @llvm.dbg.value(metadata !{i64 %277}, i64 0, metadata !29), !dbg !352
  %exitcond = icmp eq i64 %277, 256, !dbg !352
  br i1 %exitcond, label %.preheader30, label %.lr.ph55, !dbg !352

.preheader30:                                     ; preds = %.critedge, %.preheader30
  %j.4 = phi i64 [ %281, %.preheader30 ], [ 0, %.critedge ]
  %278 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.4, !dbg !353
  %279 = load i64* %278, align 8, !dbg !353, !tbaa !136
  %280 = icmp eq i64 %279, 0, !dbg !353
  %281 = add i64 %j.4, 1, !dbg !353
  tail call void @llvm.dbg.value(metadata !{i64 %281}, i64 0, metadata !30), !dbg !353
  br i1 %280, label %.preheader30, label %.preheader, !dbg !353

.preheader:                                       ; preds = %.preheader30
  br i1 %8, label %.outer._crit_edge, label %.lr.ph, !dbg !355

; <label>:282                                     ; preds = %304
  %283 = lshr i64 %mask.244, 1, !dbg !356
  %284 = icmp ult i64 %n.4, %data_len, !dbg !355
  br i1 %284, label %285, label %.outer._crit_edge, !dbg !355

; <label>:285                                     ; preds = %.lr.ph, %282
  %i.747 = phi i64 [ %i.7.ph52, %.lr.ph ], [ %i.9, %282 ]
  %dptr.246 = phi i8* [ %dptr.2.ph51, %.lr.ph ], [ %dptr.3, %282 ]
  %n.345 = phi i64 [ %n.3.ph49, %.lr.ph ], [ %n.4, %282 ]
  %mask.244 = phi i64 [ 128, %.lr.ph ], [ %283, %282 ]
  %k.243 = phi i64 [ %k.2.ph48, %.lr.ph ], [ %k.4, %282 ]
  %286 = shl i64 %k.243, 1, !dbg !359
  %287 = or i64 %286, 1, !dbg !359
  tail call void @llvm.dbg.value(metadata !{i64 %287}, i64 0, metadata !33), !dbg !359
  %288 = load i8* %cptr.0.ph50, align 1, !dbg !360, !tbaa !149
  %289 = zext i8 %288 to i64, !dbg !360
  %290 = and i64 %289, %mask.244, !dbg !360
  %not. = icmp ne i64 %290, 0, !dbg !360
  %291 = zext i1 %not. to i64, !dbg !360
  %.1 = add i64 %291, %287, !dbg !360
  br label %292, !dbg !360

; <label>:292                                     ; preds = %292, %285
  %i.8 = phi i64 [ %296, %292 ], [ %i.747, %285 ]
  %293 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.8, !dbg !362
  %294 = load i64* %293, align 8, !dbg !362, !tbaa !136
  %295 = icmp ult i64 %294, %.1, !dbg !362
  %296 = add i64 %i.8, 1, !dbg !363
  tail call void @llvm.dbg.value(metadata !{i64 %296}, i64 0, metadata !29), !dbg !363
  br i1 %295, label %292, label %297, !dbg !362

; <label>:297                                     ; preds = %292
  %298 = icmp eq i64 %.1, %294, !dbg !364
  br i1 %298, label %299, label %304, !dbg !364

; <label>:299                                     ; preds = %297
  %300 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.8, !dbg !366
  %301 = load i8* %300, align 1, !dbg !366, !tbaa !149
  store i8 %301, i8* %dptr.246, align 1, !dbg !366, !tbaa !149
  %302 = getelementptr inbounds i8* %dptr.246, i64 1, !dbg !368
  tail call void @llvm.dbg.value(metadata !{i8* %302}, i64 0, metadata !38), !dbg !368
  %303 = add i64 %n.345, 1, !dbg !369
  tail call void @llvm.dbg.value(metadata !{i64 %303}, i64 0, metadata !31), !dbg !369
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !33), !dbg !370
  tail call void @llvm.dbg.value(metadata !{i64 %j.4}, i64 0, metadata !29), !dbg !371
  br label %304, !dbg !372

; <label>:304                                     ; preds = %299, %297
  %k.4 = phi i64 [ 0, %299 ], [ %.1, %297 ]
  %n.4 = phi i64 [ %303, %299 ], [ %n.345, %297 ]
  %dptr.3 = phi i8* [ %302, %299 ], [ %dptr.246, %297 ]
  %i.9 = phi i64 [ %j.4, %299 ], [ %i.8, %297 ]
  %305 = icmp ugt i64 %mask.244, 1, !dbg !373
  tail call void @llvm.dbg.value(metadata !{i64 %283}, i64 0, metadata !32), !dbg !356
  br i1 %305, label %282, label %.outer, !dbg !373

.outer:                                           ; preds = %304
  tail call void @llvm.dbg.value(metadata !374, i64 0, metadata !32), !dbg !375
  %306 = getelementptr inbounds i8* %cptr.0.ph50, i64 1, !dbg !377
  tail call void @llvm.dbg.value(metadata !{i8* %306}, i64 0, metadata !37), !dbg !377
  %307 = icmp ult i64 %n.4, %data_len, !dbg !355
  br i1 %307, label %.lr.ph, label %.outer._crit_edge, !dbg !355

.lr.ph:                                           ; preds = %.preheader, %.outer
  %i.7.ph52 = phi i64 [ %i.9, %.outer ], [ %j.4, %.preheader ]
  %dptr.2.ph51 = phi i8* [ %dptr.3, %.outer ], [ %data, %.preheader ]
  %cptr.0.ph50 = phi i8* [ %306, %.outer ], [ %2, %.preheader ]
  %n.3.ph49 = phi i64 [ %n.4, %.outer ], [ 0, %.preheader ]
  %k.2.ph48 = phi i64 [ %k.4, %.outer ], [ 0, %.preheader ]
  br label %285, !dbg !355

.outer._crit_edge:                                ; preds = %.outer, %282, %.preheader
  tail call void @free(i8* %2) #3, !dbg !378
  call void @llvm.lifetime.end(i64 256, i8* %232) #3, !dbg !379
  call void @llvm.lifetime.end(i64 2048, i8* %231) #3, !dbg !379
  call void @llvm.lifetime.end(i64 256, i8* %7) #3, !dbg !379
  call void @llvm.lifetime.end(i64 2048, i8* %6) #3, !dbg !379
  call void @llvm.lifetime.end(i64 2048, i8* %5) #3, !dbg !379
  call void @llvm.lifetime.end(i64 2048, i8* %4) #3, !dbg !379
  call void @llvm.lifetime.end(i64 4096, i8* %3) #3, !dbg !379
  ret void, !dbg !379
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !72), !dbg !380
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !73), !dbg !380
  tail call void @llvm.dbg.value(metadata !281, i64 0, metadata !75), !dbg !381
  %1 = icmp sgt i32 %argc, 1, !dbg !382
  br i1 %1, label %.lr.ph, label %.loopexit, !dbg !382

.lr.ph:                                           ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !383
  %3 = load i8** %2, align 8, !dbg !383, !tbaa !277
  %4 = load i8* %3, align 1, !dbg !383, !tbaa !149
  %5 = zext i8 %4 to i32, !dbg !383
  %6 = sub nsw i32 45, %5, !dbg !383
  %7 = icmp eq i8 %4, 45, !dbg !384
  %8 = getelementptr inbounds i8* %3, i64 1, !dbg !386
  %9 = getelementptr inbounds i8* %3, i64 2, !dbg !388
  %10 = getelementptr inbounds i8* %3, i64 3, !dbg !391
  br label %13, !dbg !393

; <label>:11                                      ; preds = %28
  %12 = icmp slt i32 %29, %argc, !dbg !393
  br i1 %12, label %13, label %.loopexit, !dbg !393

; <label>:13                                      ; preds = %.lr.ph, %11
  %i.07 = phi i32 [ 1, %.lr.ph ], [ %29, %11 ]
  tail call void @llvm.dbg.value(metadata !394, i64 0, metadata !84), !dbg !395
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !85), !dbg !383
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !89), !dbg !383
  br i1 %7, label %14, label %28, !dbg !384

; <label>:14                                      ; preds = %13
  %15 = load i8* %8, align 1, !dbg !386, !tbaa !149
  %16 = zext i8 %15 to i32, !dbg !386
  %17 = sub nsw i32 103, %16, !dbg !386
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !89), !dbg !386
  %18 = icmp eq i8 %15, 103, !dbg !396
  br i1 %18, label %19, label %28, !dbg !396

; <label>:19                                      ; preds = %14
  %20 = load i8* %9, align 1, !dbg !388, !tbaa !149
  %21 = zext i8 %20 to i32, !dbg !388
  %22 = sub nsw i32 97, %21, !dbg !388
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !89), !dbg !388
  %23 = icmp eq i8 %20, 97, !dbg !391
  br i1 %23, label %24, label %28, !dbg !391

; <label>:24                                      ; preds = %19
  %25 = load i8* %10, align 1, !dbg !391, !tbaa !149
  %26 = zext i8 %25 to i32, !dbg !391
  %27 = sub nsw i32 0, %26, !dbg !391
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !89), !dbg !391
  br label %28, !dbg !391

; <label>:28                                      ; preds = %14, %24, %19, %13
  %__result.0 = phi i32 [ %27, %24 ], [ %22, %19 ], [ %17, %14 ], [ %6, %13 ]
  %phitmp = icmp eq i32 %__result.0, 0, !dbg !383
  %29 = add nsw i32 %i.07, 1, !dbg !393
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !74), !dbg !393
  br i1 %phitmp, label %.loopexit, label %11, !dbg !395

.loopexit:                                        ; preds = %11, %28, %0
  %ga_testing.0 = phi i1 [ false, %0 ], [ false, %11 ], [ true, %28 ]
  tail call void @llvm.dbg.value(metadata !397, i64 0, metadata !398) #3, !dbg !400
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !401) #3, !dbg !402
  %30 = tail call noalias i8* @malloc(i64 10000000) #3, !dbg !403
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !404) #3, !dbg !403
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !405) #3, !dbg !406
  tail call void @llvm.dbg.value(metadata !130, i64 0, metadata !407) #3, !dbg !408
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.loopexit
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.loopexit ]
  %ptr.01.i = phi i8* [ %45, %.lr.ph.i ], [ %30, %.loopexit ]
  %31 = load i64* @seed, align 8, !dbg !409, !tbaa !136
  %32 = xor i64 %31, 123459876, !dbg !409
  %33 = sdiv i64 %32, 127773, !dbg !411
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !412) #3, !dbg !411
  %34 = mul i64 %33, -127773, !dbg !413
  %35 = add i64 %34, %32, !dbg !413
  %36 = mul nsw i64 %35, 16807, !dbg !413
  %37 = mul i64 %33, -2836, !dbg !413
  %38 = add i64 %36, %37, !dbg !413
  %39 = icmp slt i64 %38, 0, !dbg !414
  %40 = add nsw i64 %38, 2147483647, !dbg !415
  %..i.i = select i1 %39, i64 %40, i64 %38, !dbg !414
  %41 = srem i64 %..i.i, 32, !dbg !416
  tail call void @llvm.dbg.value(metadata !{i64 %41}, i64 0, metadata !417) #3, !dbg !416
  %42 = xor i64 %..i.i, 123459876, !dbg !418
  store i64 %42, i64* @seed, align 8, !dbg !418, !tbaa !136
  %43 = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %41, !dbg !410
  %44 = load i8* %43, align 1, !dbg !410, !tbaa !149
  store i8 %44, i8* %ptr.01.i, align 1, !dbg !410, !tbaa !149
  %45 = getelementptr inbounds i8* %ptr.01.i, i64 1, !dbg !419
  tail call void @llvm.dbg.value(metadata !{i8* %45}, i64 0, metadata !405) #3, !dbg !419
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !408
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 10000000, !dbg !408
  br i1 %exitcond.i, label %generate_test_data.exit, label %.lr.ph.i, !dbg !408

generate_test_data.exit:                          ; preds = %.lr.ph.i, %generate_test_data.exit
  %i.16 = phi i32 [ %46, %generate_test_data.exit ], [ 0, %.lr.ph.i ]
  tail call void @compdecomp(i8* %30, i64 10000000), !dbg !420
  %46 = add nsw i32 %i.16, 1, !dbg !422
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !74), !dbg !422
  %exitcond = icmp eq i32 %46, 30, !dbg !422
  br i1 %exitcond, label %47, label %generate_test_data.exit, !dbg !422

; <label>:47                                      ; preds = %generate_test_data.exit
  tail call void @llvm.dbg.value(metadata !423, i64 0, metadata !91), !dbg !424
  tail call void @free(i8* %30) #3, !dbg !425
  %48 = load %struct._IO_FILE** @stdout, align 8, !dbg !426, !tbaa !277
  br i1 %ga_testing.0, label %49, label %51, !dbg !428

; <label>:49                                      ; preds = %47
  %50 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), double 0.000000e+00) #3, !dbg !426
  br label %53, !dbg !426

; <label>:51                                      ; preds = %47
  %52 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([35 x i8]* @.str6, i64 0, i64 0), double 0.000000e+00) #3, !dbg !429
  br label %53

; <label>:53                                      ; preds = %51, %49
  %54 = load %struct._IO_FILE** @stdout, align 8, !dbg !430, !tbaa !277
  %55 = tail call i32 @fflush(%struct._IO_FILE* %54) #3, !dbg !430
  ret i32 0, !dbg !431
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!122, !123}
!llvm.ident = !{!124}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !111, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"huffbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !23, metadata !67, metadata !93, metadata !104}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"generate_test_data", metadata !"generate_test_data", metadata !"", i32 88, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i64)* @generate_test_data, null, null, metadata !14, i32 89} ; [ DW_TAG_subprogram ] [line 88] [def] [scope 89] [generate_test_data]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from byte]
!9 = metadata !{i32 786454, metadata !1, null, metadata !"byte", i32 84, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [byte] [line 84, size 0, align 0, offset 0] [from unsigned char]
!10 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!11 = metadata !{i32 786454, metadata !12, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !19, metadata !20, metadata !21}
!15 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777304, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 88]
!16 = metadata !{i32 786688, metadata !4, metadata !"codes", metadata !5, i32 90, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [codes] [line 90]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = metadata !{i32 786688, metadata !4, metadata !"result", metadata !5, i32 92, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 92]
!20 = metadata !{i32 786688, metadata !4, metadata !"ptr", metadata !5, i32 93, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ptr] [line 93]
!21 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 95, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 95]
!22 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"compdecomp", metadata !"compdecomp", metadata !"", i32 136, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*, i64)* @compdecomp, null, null, metadata !26, i32 137} ; [ DW_TAG_subprogram ] [line 136] [def] [scope 137] [compdecomp]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !8, metadata !11}
!26 = metadata !{metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !44, metadata !48, metadata !50, metadata !52, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !66}
!27 = metadata !{i32 786689, metadata !23, metadata !"data", metadata !5, i32 16777352, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 136]
!28 = metadata !{i32 786689, metadata !23, metadata !"data_len", metadata !5, i32 33554568, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data_len] [line 136]
!29 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 138]
!30 = metadata !{i32 786688, metadata !23, metadata !"j", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 138]
!31 = metadata !{i32 786688, metadata !23, metadata !"n", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 138]
!32 = metadata !{i32 786688, metadata !23, metadata !"mask", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mask] [line 138]
!33 = metadata !{i32 786688, metadata !23, metadata !"k", metadata !5, i32 139, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 139]
!34 = metadata !{i32 786454, metadata !1, null, metadata !"bits32", i32 83, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [bits32] [line 83, size 0, align 0, offset 0] [from long unsigned int]
!35 = metadata !{i32 786688, metadata !23, metadata !"t", metadata !5, i32 139, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 139]
!36 = metadata !{i32 786688, metadata !23, metadata !"c", metadata !5, i32 140, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 140]
!37 = metadata !{i32 786688, metadata !23, metadata !"cptr", metadata !5, i32 141, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cptr] [line 141]
!38 = metadata !{i32 786688, metadata !23, metadata !"dptr", metadata !5, i32 142, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dptr] [line 142]
!39 = metadata !{i32 786688, metadata !23, metadata !"comp", metadata !5, i32 149, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp] [line 149]
!40 = metadata !{i32 786688, metadata !23, metadata !"freq", metadata !5, i32 151, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [freq] [line 151]
!41 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32768, i64 64, i32 0, i32 0, metadata !11, metadata !42, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 64, offset 0] [from size_t]
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!44 = metadata !{i32 786688, metadata !23, metadata !"heap", metadata !5, i32 152, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [heap] [line 152]
!45 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 64, i32 0, i32 0, metadata !11, metadata !46, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from size_t]
!46 = metadata !{metadata !47}
!47 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!48 = metadata !{i32 786688, metadata !23, metadata !"link", metadata !5, i32 153, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [link] [line 153]
!49 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !22, metadata !42, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!50 = metadata !{i32 786688, metadata !23, metadata !"code", metadata !5, i32 154, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [code] [line 154]
!51 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 64, i32 0, i32 0, metadata !34, metadata !46, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from bits32]
!52 = metadata !{i32 786688, metadata !23, metadata !"clen", metadata !5, i32 155, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [clen] [line 155]
!53 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !9, metadata !46, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from byte]
!54 = metadata !{i32 786688, metadata !23, metadata !"temp", metadata !5, i32 187, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 187]
!55 = metadata !{i32 786688, metadata !23, metadata !"m", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 215]
!56 = metadata !{i32 786688, metadata !23, metadata !"x", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 215]
!57 = metadata !{i32 786688, metadata !23, metadata !"maxx", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [maxx] [line 215]
!58 = metadata !{i32 786688, metadata !23, metadata !"maxi", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [maxi] [line 215]
!59 = metadata !{i32 786688, metadata !23, metadata !"l", metadata !5, i32 216, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 216]
!60 = metadata !{i32 786688, metadata !23, metadata !"comp_len", metadata !5, i32 266, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp_len] [line 266]
!61 = metadata !{i32 786688, metadata !23, metadata !"bout", metadata !5, i32 267, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bout] [line 267]
!62 = metadata !{i32 786688, metadata !23, metadata !"bit", metadata !5, i32 268, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bit] [line 268]
!63 = metadata !{i32 786688, metadata !23, metadata !"heap2", metadata !5, i32 331, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [heap2] [line 331]
!64 = metadata !{i32 786688, metadata !23, metadata !"outc", metadata !5, i32 334, metadata !65, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [outc] [line 334]
!65 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !18, metadata !46, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!66 = metadata !{i32 786688, metadata !23, metadata !"optr", metadata !5, i32 340, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [optr] [line 340]
!67 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 434, metadata !68, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !71, i32 435} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [main]
!68 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = metadata !{metadata !22, metadata !22, metadata !70}
!70 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75, metadata !77, metadata !84, metadata !85, metadata !89, metadata !90, metadata !91}
!72 = metadata !{i32 786689, metadata !67, metadata !"argc", metadata !5, i32 16777650, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 434]
!73 = metadata !{i32 786689, metadata !67, metadata !"argv", metadata !5, i32 33554866, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 434]
!74 = metadata !{i32 786688, metadata !67, metadata !"i", metadata !5, i32 436, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 436]
!75 = metadata !{i32 786688, metadata !67, metadata !"ga_testing", metadata !5, i32 439, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ga_testing] [line 439]
!76 = metadata !{i32 786468, null, null, metadata !"_Bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!77 = metadata !{i32 786688, metadata !78, metadata !"__s1_len", metadata !5, i32 445, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 445]
!78 = metadata !{i32 786443, metadata !1, metadata !79, i32 445, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!79 = metadata !{i32 786443, metadata !1, metadata !80, i32 445, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!80 = metadata !{i32 786443, metadata !1, metadata !81, i32 444, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!81 = metadata !{i32 786443, metadata !1, metadata !82, i32 443, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!82 = metadata !{i32 786443, metadata !1, metadata !83, i32 442, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!83 = metadata !{i32 786443, metadata !1, metadata !67, i32 441, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!84 = metadata !{i32 786688, metadata !78, metadata !"__s2_len", metadata !5, i32 445, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 445]
!85 = metadata !{i32 786688, metadata !86, metadata !"__s2", metadata !5, i32 445, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2] [line 445]
!86 = metadata !{i32 786443, metadata !1, metadata !78, i32 445, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!87 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!89 = metadata !{i32 786688, metadata !86, metadata !"__result", metadata !5, i32 445, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__result] [line 445]
!90 = metadata !{i32 786688, metadata !67, metadata !"test_data", metadata !5, i32 454, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [test_data] [line 454]
!91 = metadata !{i32 786688, metadata !67, metadata !"run_time", metadata !5, i32 472, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [run_time] [line 472]
!92 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!93 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"heap_adjust", metadata !"heap_adjust", metadata !"", i32 106, metadata !94, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !97, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
!94 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{null, metadata !96, metadata !96, metadata !22, metadata !22}
!96 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!97 = metadata !{metadata !98, metadata !99, metadata !100, metadata !101, metadata !102, metadata !103}
!98 = metadata !{i32 786689, metadata !93, metadata !"freq", metadata !5, i32 16777322, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [freq] [line 106]
!99 = metadata !{i32 786689, metadata !93, metadata !"heap", metadata !5, i32 33554538, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!100 = metadata !{i32 786689, metadata !93, metadata !"n", metadata !5, i32 50331754, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 106]
!101 = metadata !{i32 786689, metadata !93, metadata !"k", metadata !5, i32 67108970, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 106]
!102 = metadata !{i32 786688, metadata !93, metadata !"j", metadata !5, i32 112, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 112]
!103 = metadata !{i32 786688, metadata !93, metadata !"v", metadata !5, i32 116, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 116]
!104 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random4", metadata !"random4", metadata !"", i32 47, metadata !105, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !107, i32 48} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
!105 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !106, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!106 = metadata !{metadata !11}
!107 = metadata !{metadata !108, metadata !110}
!108 = metadata !{i32 786688, metadata !104, metadata !"k", metadata !5, i32 49, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 49]
!109 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!110 = metadata !{i32 786688, metadata !104, metadata !"result", metadata !5, i32 50, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 50]
!111 = metadata !{metadata !112, metadata !114, metadata !112, metadata !115, metadata !117, metadata !118, metadata !117, metadata !119, metadata !120, metadata !115, metadata !121}
!112 = metadata !{i32 786484, i32 0, metadata !5, metadata !"TEST_SIZE", metadata !"TEST_SIZE", metadata !"TEST_SIZE", metadata !5, i32 79, metadata !113, i32 1, i32 1, i32 10000000, null} ; [ DW_TAG_variable ] [TEST_SIZE] [line 79] [local] [def]
!113 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!114 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NUM_LOOPS", metadata !"NUM_LOOPS", metadata !"NUM_LOOPS", metadata !5, i32 78, metadata !113, i32 1, i32 1, i32 30, null} ; [ DW_TAG_variable ] [NUM_LOOPS] [line 78] [local] [def]
!115 = metadata !{i32 786484, i32 0, metadata !5, metadata !"MASK", metadata !"MASK", metadata !"MASK", metadata !5, i32 44, metadata !116, i32 1, i32 1, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 44] [local] [def]
!116 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!117 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IQ", metadata !"IQ", metadata !"IQ", metadata !5, i32 42, metadata !116, i32 1, i32 1, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 42] [local] [def]
!118 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IA", metadata !"IA", metadata !"IA", metadata !5, i32 40, metadata !116, i32 1, i32 1, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 40] [local] [def]
!119 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IR", metadata !"IR", metadata !"IR", metadata !5, i32 43, metadata !116, i32 1, i32 1, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 43] [local] [def]
!120 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IM", metadata !"IM", metadata !"IM", metadata !5, i32 41, metadata !116, i32 1, i32 1, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 41] [local] [def]
!121 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 39, metadata !109, i32 1, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 39] [local] [def]
!122 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!123 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!124 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!125 = metadata !{i32 88, i32 0, metadata !4, null}
!126 = metadata !{null}
!127 = metadata !{i32 90, i32 0, metadata !4, null}
!128 = metadata !{i32 92, i32 0, metadata !4, null}
!129 = metadata !{i32 93, i32 0, metadata !4, null}
!130 = metadata !{i32 0}
!131 = metadata !{i32 96, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !4, i32 96, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!133 = metadata !{i32 52, i32 0, metadata !104, metadata !134}
!134 = metadata !{i32 98, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !132, i32 97, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!136 = metadata !{metadata !137, metadata !137, i64 0}
!137 = metadata !{metadata !"long", metadata !138, i64 0}
!138 = metadata !{metadata !"omnipotent char", metadata !139, i64 0}
!139 = metadata !{metadata !"Simple C/C++ TBAA"}
!140 = metadata !{i32 53, i32 0, metadata !104, metadata !134}
!141 = metadata !{i32 786688, metadata !104, metadata !"k", metadata !5, i32 49, metadata !109, i32 0, metadata !134} ; [ DW_TAG_auto_variable ] [k] [line 49]
!142 = metadata !{i32 54, i32 0, metadata !104, metadata !134}
!143 = metadata !{i32 56, i32 0, metadata !144, metadata !134}
!144 = metadata !{i32 786443, metadata !1, metadata !104, i32 56, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!145 = metadata !{i32 57, i32 0, metadata !144, metadata !134}
!146 = metadata !{i32 59, i32 0, metadata !104, metadata !134}
!147 = metadata !{i32 786688, metadata !104, metadata !"result", metadata !5, i32 50, metadata !11, i32 0, metadata !134} ; [ DW_TAG_auto_variable ] [result] [line 50]
!148 = metadata !{i32 60, i32 0, metadata !104, metadata !134}
!149 = metadata !{metadata !138, metadata !138, i64 0}
!150 = metadata !{i32 99, i32 0, metadata !135, null}
!151 = metadata !{i32 102, i32 0, metadata !4, null}
!152 = metadata !{i32 136, i32 0, metadata !23, null}
!153 = metadata !{i32 142, i32 0, metadata !23, null}
!154 = metadata !{i32 149, i32 0, metadata !23, null}
!155 = metadata !{i32 151, i32 0, metadata !23, null}
!156 = metadata !{i32 152, i32 0, metadata !23, null}
!157 = metadata !{i32 153, i32 0, metadata !23, null}
!158 = metadata !{i32 154, i32 0, metadata !23, null}
!159 = metadata !{i32 155, i32 0, metadata !23, null}
!160 = metadata !{i32 157, i32 0, metadata !23, null}
!161 = metadata !{i32 158, i32 0, metadata !23, null}
!162 = metadata !{i32 159, i32 0, metadata !23, null}
!163 = metadata !{i32 160, i32 0, metadata !23, null}
!164 = metadata !{i32 161, i32 0, metadata !23, null}
!165 = metadata !{i32 162, i32 0, metadata !23, null}
!166 = metadata !{i64 0}
!167 = metadata !{i32 165, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !23, i32 165, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!169 = metadata !{i32 167, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !168, i32 166, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!171 = metadata !{i32 168, i32 0, metadata !170, null}
!172 = metadata !{i32 183, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !23, i32 183, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!174 = metadata !{i32 184, i32 0, metadata !173, null}
!175 = metadata !{i32 118, i32 0, metadata !93, metadata !174}
!176 = metadata !{i32 176, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !178, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!178 = metadata !{i32 786443, metadata !1, metadata !179, i32 175, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!179 = metadata !{i32 786443, metadata !1, metadata !23, i32 174, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!180 = metadata !{i32 178, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !177, i32 177, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!182 = metadata !{i32 179, i32 0, metadata !181, null}
!183 = metadata !{i32 180, i32 0, metadata !181, null}
!184 = metadata !{i32 174, i32 0, metadata !179, null}
!185 = metadata !{i32 191, i32 0, metadata !23, null}
!186 = metadata !{i32 195, i32 0, metadata !187, null}
!187 = metadata !{i32 786443, metadata !1, metadata !23, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!188 = metadata !{i32 786689, metadata !93, metadata !"n", metadata !5, i32 50331754, metadata !22, i32 0, metadata !174} ; [ DW_TAG_arg_variable ] [n] [line 106]
!189 = metadata !{i32 106, i32 0, metadata !93, metadata !174}
!190 = metadata !{i32 786689, metadata !93, metadata !"k", metadata !5, i32 67108970, metadata !22, i32 0, metadata !174} ; [ DW_TAG_arg_variable ] [k] [line 106]
!191 = metadata !{i32 116, i32 0, metadata !93, metadata !174}
!192 = metadata !{i32 132, i32 0, metadata !93, metadata !174}
!193 = metadata !{i32 125, i32 0, metadata !194, metadata !174}
!194 = metadata !{i32 786443, metadata !1, metadata !195, i32 125, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!195 = metadata !{i32 786443, metadata !1, metadata !93, i32 119, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!196 = metadata !{i32 120, i32 0, metadata !195, metadata !174}
!197 = metadata !{i32 786688, metadata !93, metadata !"j", metadata !5, i32 112, metadata !22, i32 0, metadata !174} ; [ DW_TAG_auto_variable ] [j] [line 112]
!198 = metadata !{i32 122, i32 0, metadata !199, metadata !174}
!199 = metadata !{i32 786443, metadata !1, metadata !195, i32 122, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!200 = metadata !{i32 123, i32 0, metadata !199, metadata !174}
!201 = metadata !{i32 128, i32 0, metadata !195, metadata !174}
!202 = metadata !{i32 129, i32 0, metadata !195, metadata !174}
!203 = metadata !{i32 194, i32 0, metadata !187, null}
!204 = metadata !{i64 1}
!205 = metadata !{i32 196, i32 0, metadata !187, null}
!206 = metadata !{i32 199, i32 0, metadata !187, null}
!207 = metadata !{i32 786689, metadata !93, metadata !"heap", metadata !5, i32 33554538, metadata !96, i32 0, metadata !206} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!208 = metadata !{i32 106, i32 0, metadata !93, metadata !206}
!209 = metadata !{i32 786689, metadata !93, metadata !"n", metadata !5, i32 50331754, metadata !22, i32 0, metadata !206} ; [ DW_TAG_arg_variable ] [n] [line 106]
!210 = metadata !{i32 1}
!211 = metadata !{i32 786689, metadata !93, metadata !"k", metadata !5, i32 67108970, metadata !22, i32 0, metadata !206} ; [ DW_TAG_arg_variable ] [k] [line 106]
!212 = metadata !{i32 118, i32 0, metadata !93, metadata !206}
!213 = metadata !{i32 132, i32 0, metadata !93, metadata !206}
!214 = metadata !{i32 125, i32 0, metadata !194, metadata !206}
!215 = metadata !{i32 120, i32 0, metadata !195, metadata !206}
!216 = metadata !{i32 786688, metadata !93, metadata !"j", metadata !5, i32 112, metadata !22, i32 0, metadata !206} ; [ DW_TAG_auto_variable ] [j] [line 112]
!217 = metadata !{i32 122, i32 0, metadata !199, metadata !206}
!218 = metadata !{i32 123, i32 0, metadata !199, metadata !206}
!219 = metadata !{i32 128, i32 0, metadata !195, metadata !206}
!220 = metadata !{i32 129, i32 0, metadata !195, metadata !206}
!221 = metadata !{i32 203, i32 0, metadata !187, null}
!222 = metadata !{i32 204, i32 0, metadata !187, null}
!223 = metadata !{metadata !224, metadata !224, i64 0}
!224 = metadata !{metadata !"int", metadata !138, i64 0}
!225 = metadata !{i32 205, i32 0, metadata !187, null}
!226 = metadata !{i32 206, i32 0, metadata !187, null}
!227 = metadata !{i32 786689, metadata !93, metadata !"heap", metadata !5, i32 33554538, metadata !96, i32 0, metadata !228} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!228 = metadata !{i32 209, i32 0, metadata !187, null}
!229 = metadata !{i32 106, i32 0, metadata !93, metadata !228}
!230 = metadata !{i32 786689, metadata !93, metadata !"n", metadata !5, i32 50331754, metadata !22, i32 0, metadata !228} ; [ DW_TAG_arg_variable ] [n] [line 106]
!231 = metadata !{i32 786689, metadata !93, metadata !"k", metadata !5, i32 67108970, metadata !22, i32 0, metadata !228} ; [ DW_TAG_arg_variable ] [k] [line 106]
!232 = metadata !{i32 132, i32 0, metadata !93, metadata !228}
!233 = metadata !{i32 118, i32 0, metadata !93, metadata !228}
!234 = metadata !{i32 125, i32 0, metadata !194, metadata !228}
!235 = metadata !{i32 120, i32 0, metadata !195, metadata !228}
!236 = metadata !{i32 786688, metadata !93, metadata !"j", metadata !5, i32 112, metadata !22, i32 0, metadata !228} ; [ DW_TAG_auto_variable ] [j] [line 112]
!237 = metadata !{i32 122, i32 0, metadata !199, metadata !228}
!238 = metadata !{i32 123, i32 0, metadata !199, metadata !228}
!239 = metadata !{i32 128, i32 0, metadata !195, metadata !228}
!240 = metadata !{i32 129, i32 0, metadata !195, metadata !228}
!241 = metadata !{i32 212, i32 0, metadata !23, null}
!242 = metadata !{i32 215, i32 0, metadata !23, null}
!243 = metadata !{i32 218, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !23, i32 218, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!245 = metadata !{i32 220, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !247, i32 220, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!247 = metadata !{i32 786443, metadata !1, metadata !244, i32 219, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!248 = metadata !{i32 230, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !246, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!250 = metadata !{i32 232, i32 0, metadata !249, null}
!251 = metadata !{i32 222, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !246, i32 221, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!253 = metadata !{i32 223, i32 0, metadata !252, null}
!254 = metadata !{i32 224, i32 0, metadata !252, null}
!255 = metadata !{i32 234, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !257, i32 234, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!257 = metadata !{i32 786443, metadata !1, metadata !249, i32 233, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!258 = metadata !{i32 236, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !256, i32 235, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!260 = metadata !{i32 237, i32 0, metadata !259, null}
!261 = metadata !{i32 238, i32 0, metadata !259, null}
!262 = metadata !{i32 240, i32 0, metadata !257, null}
!263 = metadata !{i32 241, i32 0, metadata !257, null}
!264 = metadata !{i32 242, i32 0, metadata !257, null}
!265 = metadata !{i32 245, i32 0, metadata !249, null}
!266 = metadata !{i32 246, i32 0, metadata !249, null}
!267 = metadata !{i32 249, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !249, i32 249, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!269 = metadata !{i32 250, i32 0, metadata !268, null}
!270 = metadata !{i32 253, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !249, i32 253, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!272 = metadata !{i32 254, i32 0, metadata !271, null}
!273 = metadata !{i32 259, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !23, i32 259, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!275 = metadata !{i32 261, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !274, i32 260, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!277 = metadata !{metadata !278, metadata !278, i64 0}
!278 = metadata !{metadata !"any pointer", metadata !138, i64 0}
!279 = metadata !{i32 262, i32 0, metadata !276, null}
!280 = metadata !{i32 266, i32 0, metadata !23, null}
!281 = metadata !{i8 0}
!282 = metadata !{i32 267, i32 0, metadata !23, null}
!283 = metadata !{i32 -1}
!284 = metadata !{i32 268, i32 0, metadata !23, null}
!285 = metadata !{i32 269, i32 0, metadata !23, null}
!286 = metadata !{i32 272, i32 0, metadata !287, null}
!287 = metadata !{i32 786443, metadata !1, metadata !23, i32 272, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!288 = metadata !{i32 278, i32 0, metadata !289, null}
!289 = metadata !{i32 786443, metadata !1, metadata !23, i32 278, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!290 = metadata !{i32 274, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !287, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!292 = metadata !{i32 275, i32 0, metadata !291, null}
!293 = metadata !{i32 281, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !289, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!295 = metadata !{i32 284, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !294, i32 284, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!297 = metadata !{i32 286, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !299, i32 286, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!299 = metadata !{i32 786443, metadata !1, metadata !296, i32 285, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!300 = metadata !{i32 289, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !298, i32 287, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!302 = metadata !{i32 290, i32 0, metadata !301, null}
!303 = metadata !{i32 293, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !301, i32 293, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!305 = metadata !{i32 309, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !299, i32 309, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!307 = metadata !{i32 295, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !304, i32 294, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!309 = metadata !{i32 296, i32 0, metadata !308, null}
!310 = metadata !{i32 305, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !1, metadata !298, i32 303, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!312 = metadata !{i32 306, i32 0, metadata !311, null}
!313 = metadata !{i32 312, i32 0, metadata !299, null}
!314 = metadata !{i32 315, i32 0, metadata !294, null}
!315 = metadata !{i32 319, i32 0, metadata !23, null}
!316 = metadata !{i32 320, i32 0, metadata !23, null}
!317 = metadata !{i32 331, i32 0, metadata !23, null}
!318 = metadata !{i32 334, i32 0, metadata !23, null}
!319 = metadata !{i32 337, i32 0, metadata !23, null}
!320 = metadata !{i32 340, i32 0, metadata !23, null}
!321 = metadata !{i32 342, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !23, i32 342, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!323 = metadata !{i32 344, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !322, i32 343, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!325 = metadata !{i32 345, i32 0, metadata !324, null}
!326 = metadata !{i32 348, i32 0, metadata !327, null}
!327 = metadata !{i32 786443, metadata !1, metadata !324, i32 348, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!328 = metadata !{i32 351, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !327, i32 349, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!330 = metadata !{i32 352, i32 0, metadata !329, null}
!331 = metadata !{i32 356, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !329, i32 356, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!333 = metadata !{i32 358, i32 0, metadata !334, null}
!334 = metadata !{i32 786443, metadata !1, metadata !332, i32 357, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!335 = metadata !{i32 360, i32 0, metadata !336, null}
!336 = metadata !{i32 786443, metadata !1, metadata !334, i32 360, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!337 = metadata !{i32 363, i32 0, metadata !334, null}
!338 = metadata !{i32 366, i32 0, metadata !329, null}
!339 = metadata !{i32 367, i32 0, metadata !329, null}
!340 = metadata !{i32 373, i32 0, metadata !341, null}
!341 = metadata !{i32 786443, metadata !1, metadata !342, i32 372, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!342 = metadata !{i32 786443, metadata !1, metadata !23, i32 371, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!343 = metadata !{i32 374, i32 0, metadata !341, null}
!344 = metadata !{i32 375, i32 0, metadata !341, null}
!345 = metadata !{i32 377, i32 0, metadata !341, null}
!346 = metadata !{i32 379, i32 0, metadata !347, null}
!347 = metadata !{i32 786443, metadata !1, metadata !341, i32 378, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!348 = metadata !{i32 380, i32 0, metadata !347, null}
!349 = metadata !{i32 381, i32 0, metadata !347, null}
!350 = metadata !{i32 384, i32 0, metadata !341, null}
!351 = metadata !{i32 385, i32 0, metadata !341, null}
!352 = metadata !{i32 371, i32 0, metadata !342, null}
!353 = metadata !{i32 389, i32 0, metadata !354, null}
!354 = metadata !{i32 786443, metadata !1, metadata !23, i32 389, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!355 = metadata !{i32 399, i32 0, metadata !23, null}
!356 = metadata !{i32 422, i32 0, metadata !357, null}
!357 = metadata !{i32 786443, metadata !1, metadata !358, i32 421, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!358 = metadata !{i32 786443, metadata !1, metadata !23, i32 400, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!359 = metadata !{i32 401, i32 0, metadata !358, null}
!360 = metadata !{i32 403, i32 0, metadata !361, null}
!361 = metadata !{i32 786443, metadata !1, metadata !358, i32 403, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!362 = metadata !{i32 407, i32 0, metadata !358, null}
!363 = metadata !{i32 408, i32 0, metadata !358, null}
!364 = metadata !{i32 411, i32 0, metadata !365, null}
!365 = metadata !{i32 786443, metadata !1, metadata !358, i32 411, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!366 = metadata !{i32 413, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !365, i32 412, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!368 = metadata !{i32 414, i32 0, metadata !367, null}
!369 = metadata !{i32 415, i32 0, metadata !367, null}
!370 = metadata !{i32 416, i32 0, metadata !367, null}
!371 = metadata !{i32 417, i32 0, metadata !367, null}
!372 = metadata !{i32 418, i32 0, metadata !367, null}
!373 = metadata !{i32 421, i32 0, metadata !357, null}
!374 = metadata !{i64 128}
!375 = metadata !{i32 425, i32 0, metadata !376, null}
!376 = metadata !{i32 786443, metadata !1, metadata !357, i32 424, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!377 = metadata !{i32 426, i32 0, metadata !376, null}
!378 = metadata !{i32 431, i32 0, metadata !23, null}
!379 = metadata !{i32 432, i32 0, metadata !23, null}
!380 = metadata !{i32 434, i32 0, metadata !67, null}
!381 = metadata !{i32 439, i32 0, metadata !67, null}
!382 = metadata !{i32 441, i32 0, metadata !83, null}
!383 = metadata !{i32 445, i32 0, metadata !86, null}
!384 = metadata !{i32 445, i32 0, metadata !385, null}
!385 = metadata !{i32 786443, metadata !1, metadata !86, i32 445, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!386 = metadata !{i32 445, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !385, i32 445, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!388 = metadata !{i32 445, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !390, i32 445, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!390 = metadata !{i32 786443, metadata !1, metadata !387, i32 445, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!391 = metadata !{i32 445, i32 0, metadata !392, null}
!392 = metadata !{i32 786443, metadata !1, metadata !389, i32 445, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!393 = metadata !{i32 443, i32 0, metadata !81, null}
!394 = metadata !{i64 3}
!395 = metadata !{i32 445, i32 0, metadata !78, null}
!396 = metadata !{i32 445, i32 0, metadata !390, null}
!397 = metadata !{i64 10000000}
!398 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777304, metadata !11, i32 0, metadata !399} ; [ DW_TAG_arg_variable ] [n] [line 88]
!399 = metadata !{i32 454, i32 0, metadata !67, null}
!400 = metadata !{i32 88, i32 0, metadata !4, metadata !399}
!401 = metadata !{i32 786688, metadata !4, metadata !"codes", metadata !5, i32 90, metadata !17, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [codes] [line 90]
!402 = metadata !{i32 90, i32 0, metadata !4, metadata !399}
!403 = metadata !{i32 92, i32 0, metadata !4, metadata !399}
!404 = metadata !{i32 786688, metadata !4, metadata !"result", metadata !5, i32 92, metadata !8, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [result] [line 92]
!405 = metadata !{i32 786688, metadata !4, metadata !"ptr", metadata !5, i32 93, metadata !8, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [ptr] [line 93]
!406 = metadata !{i32 93, i32 0, metadata !4, metadata !399}
!407 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 95, metadata !22, i32 0, metadata !399} ; [ DW_TAG_auto_variable ] [i] [line 95]
!408 = metadata !{i32 96, i32 0, metadata !132, metadata !399}
!409 = metadata !{i32 52, i32 0, metadata !104, metadata !410}
!410 = metadata !{i32 98, i32 0, metadata !135, metadata !399}
!411 = metadata !{i32 53, i32 0, metadata !104, metadata !410}
!412 = metadata !{i32 786688, metadata !104, metadata !"k", metadata !5, i32 49, metadata !109, i32 0, metadata !410} ; [ DW_TAG_auto_variable ] [k] [line 49]
!413 = metadata !{i32 54, i32 0, metadata !104, metadata !410}
!414 = metadata !{i32 56, i32 0, metadata !144, metadata !410}
!415 = metadata !{i32 57, i32 0, metadata !144, metadata !410}
!416 = metadata !{i32 59, i32 0, metadata !104, metadata !410}
!417 = metadata !{i32 786688, metadata !104, metadata !"result", metadata !5, i32 50, metadata !11, i32 0, metadata !410} ; [ DW_TAG_auto_variable ] [result] [line 50]
!418 = metadata !{i32 60, i32 0, metadata !104, metadata !410}
!419 = metadata !{i32 99, i32 0, metadata !135, metadata !399}
!420 = metadata !{i32 468, i32 0, metadata !421, null}
!421 = metadata !{i32 786443, metadata !1, metadata !67, i32 467, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!422 = metadata !{i32 467, i32 0, metadata !421, null}
!423 = metadata !{double 0.000000e+00}
!424 = metadata !{i32 472, i32 0, metadata !67, null}
!425 = metadata !{i32 481, i32 0, metadata !67, null}
!426 = metadata !{i32 485, i32 0, metadata !427, null}
!427 = metadata !{i32 786443, metadata !1, metadata !67, i32 484, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!428 = metadata !{i32 484, i32 0, metadata !427, null}
!429 = metadata !{i32 487, i32 0, metadata !427, null}
!430 = metadata !{i32 489, i32 0, metadata !67, null}
!431 = metadata !{i32 492, i32 0, metadata !67, null}
