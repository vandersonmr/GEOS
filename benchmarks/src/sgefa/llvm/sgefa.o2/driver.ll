; ModuleID = 'driver.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.FULL = type { i32, i32, [1000 x float*] }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [49 x i8] c"Matrix row dim (%d) or column dim (%d) too big.\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"One-Norm(A) ---------- %e.\0A\00", align 1
@.str2 = private unnamed_addr constant [24 x i8] c"FACTORED MATRIX FOLLOWS\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"True Solution\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"Solution\00", align 1
@.str5 = private unnamed_addr constant [30 x i8] c"Solution to transposed system\00", align 1
@.str7 = private unnamed_addr constant [42 x i8] c"Hilbert Slice.  Test case %d of size %d.\0A\00", align 1
@.str8 = private unnamed_addr constant [42 x i8] c"Monoelemental.  Test case %d of size %d.\0A\00", align 1
@.str9 = private unnamed_addr constant [41 x i8] c"Tridiagional.  Test case %d of size %d.\0A\00", align 1
@.str10 = private unnamed_addr constant [37 x i8] c"Rank One.  Test case %d of size %d.\0A\00", align 1
@.str11 = private unnamed_addr constant [40 x i8] c"Zero Column.  Test case %d of size %d.\0A\00", align 1
@.str12 = private unnamed_addr constant [45 x i8] c"Upper Triangular.  Test case %d of size %d.\0A\00", align 1
@.str13 = private unnamed_addr constant [45 x i8] c"Lower Triangular.  Test case %d of size %d.\0A\00", align 1
@.str14 = private unnamed_addr constant [51 x i8] c"Near Overflow.  Test case %d of size %d. BIG = %e\0A\00", align 1
@.str15 = private unnamed_addr constant [54 x i8] c"Near Underflow.  Test case %d of size %d. SMALL = %e\0A\00", align 1
@.str18 = private unnamed_addr constant [15 x i8] c"MATRIX FOLLOWS\00", align 1
@.str19 = private unnamed_addr constant [9 x i8] c"SOLUTION\00", align 1
@.str20 = private unnamed_addr constant [16 x i8] c"RIGHT HAND SIDE\00", align 1
@.str21 = private unnamed_addr constant [26 x i8] c"TRANSPOSE RIGHT HAND SIDE\00", align 1
@.str25 = private unnamed_addr constant [5 x i8] c"%3d|\00", align 1
@.str26 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str27 = private unnamed_addr constant [7 x i8] c"%12.4e\00", align 1
@.str29 = private unnamed_addr constant [4 x i8] c"%8d\00", align 1
@str30 = private unnamed_addr constant [25 x i8] c"MATGEN: Error in matvec.\00"
@str31 = private unnamed_addr constant [28 x i8] c"MATGEN: All tests complete.\00"
@str32 = private unnamed_addr constant [73 x i8] c"\0A\0A**********************************************************************\00"
@str33 = private unnamed_addr constant [49 x i8] c"GET_SPACE: Can't get enouph space for vectors...\00"
@str34 = private unnamed_addr constant [51 x i8] c"GET_SPACE: Can't get enouph space for matricies...\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %a = alloca %struct.FULL, align 8
  %b = alloca float*, align 8
  %bt = alloca float*, align 8
  %x = alloca float*, align 8
  %ipvt = alloca i32*, align 8
  %1 = bitcast %struct.FULL* %a to i8*, !dbg !123
  call void @llvm.lifetime.start(i64 8008, i8* %1) #2, !dbg !123
  call void @llvm.dbg.declare(metadata !{%struct.FULL* %a}, metadata !13), !dbg !123
  call void @llvm.dbg.declare(metadata !{float** %b}, metadata !25), !dbg !124
  call void @llvm.dbg.declare(metadata !{float** %bt}, metadata !26), !dbg !124
  call void @llvm.dbg.declare(metadata !{float** %x}, metadata !27), !dbg !124
  call void @llvm.dbg.declare(metadata !{i32** %ipvt}, metadata !33), !dbg !125
  call void @llvm.dbg.value(metadata !126, i64 0, metadata !36), !dbg !125
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !36), !dbg !128
  %2 = call i32 @matgen(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt, i32 1, i32 1), !dbg !128
  %3 = icmp eq i32 %2, 0, !dbg !128
  br i1 %3, label %.lr.ph10, label %._crit_edge11, !dbg !128

.lr.ph10:                                         ; preds = %0
  %4 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !129
  %5 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !129
  br label %6, !dbg !128

; <label>:6                                       ; preds = %.lr.ph10, %.backedge
  %7 = phi i32 [ 1, %.lr.ph10 ], [ %71, %.backedge ]
  %8 = load i32* %4, align 4, !dbg !129, !tbaa !132
  %9 = icmp sgt i32 %8, 1000, !dbg !129
  br i1 %9, label %._crit_edge13, label %10, !dbg !129

._crit_edge13:                                    ; preds = %6
  %.pre = load i32* %5, align 8, !dbg !137, !tbaa !139
  br label %19, !dbg !129

; <label>:10                                      ; preds = %6
  %11 = bitcast %struct.FULL* %a to i64*, !dbg !129
  %12 = load i64* %11, align 8, !dbg !129
  %13 = trunc i64 %12 to i32, !dbg !129
  %14 = icmp sgt i32 %13, 1000, !dbg !129
  br i1 %14, label %.loopexit, label %.preheader, !dbg !129

.preheader:                                       ; preds = %10
  %15 = icmp sgt i32 %13, 0, !dbg !140
  br i1 %15, label %.lr.ph6, label %41, !dbg !140

.lr.ph6:                                          ; preds = %.preheader
  %16 = icmp sgt i32 %8, 0, !dbg !142
  br label %24, !dbg !140

.loopexit:                                        ; preds = %10
  %17 = lshr i64 %12, 32
  %18 = trunc i64 %17 to i32
  br label %19

; <label>:19                                      ; preds = %.loopexit, %._crit_edge13
  %20 = phi i32 [ %.pre, %._crit_edge13 ], [ %13, %.loopexit ]
  %21 = phi i32 [ %8, %._crit_edge13 ], [ %18, %.loopexit ]
  %22 = load %struct._IO_FILE** @stderr, align 8, !dbg !137, !tbaa !145
  %23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([49 x i8]* @.str, i64 0, i64 0), i32 %21, i32 %20) #6, !dbg !137
  call void @exit(i32 1) #7, !dbg !147
  unreachable, !dbg !147

; <label>:24                                      ; preds = %.lr.ph6, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next, %._crit_edge ]
  %anorm.05 = phi float [ 0.000000e+00, %.lr.ph6 ], [ %38, %._crit_edge ]
  call void @llvm.dbg.value(metadata !126, i64 0, metadata !10), !dbg !142
  call void @llvm.dbg.value(metadata !{float* %26}, i64 0, metadata !29), !dbg !142
  call void @llvm.dbg.value(metadata !148, i64 0, metadata !30), !dbg !142
  br i1 %16, label %.lr.ph, label %._crit_edge, !dbg !142

.lr.ph:                                           ; preds = %24
  %25 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv, !dbg !142
  %26 = load float** %25, align 8, !dbg !142, !tbaa !145
  br label %27, !dbg !142

; <label>:27                                      ; preds = %32, %.lr.ph
  %i.03 = phi i32 [ 0, %.lr.ph ], [ %35, %32 ]
  %t.02 = phi float [ 0.000000e+00, %.lr.ph ], [ %34, %32 ]
  %col.01 = phi float* [ %26, %.lr.ph ], [ %36, %32 ]
  %28 = load float* %col.01, align 4, !dbg !149, !tbaa !150
  %29 = fcmp olt float %28, 0.000000e+00, !dbg !149
  br i1 %29, label %30, label %32, !dbg !149

; <label>:30                                      ; preds = %27
  %31 = fsub float -0.000000e+00, %28, !dbg !149
  br label %32, !dbg !149

; <label>:32                                      ; preds = %27, %30
  %33 = phi float [ %31, %30 ], [ %28, %27 ], !dbg !149
  %34 = fadd float %t.02, %33, !dbg !149
  call void @llvm.dbg.value(metadata !{float %34}, i64 0, metadata !30), !dbg !149
  %35 = add nsw i32 %i.03, 1, !dbg !142
  call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !10), !dbg !142
  %36 = getelementptr inbounds float* %col.01, i64 1, !dbg !142
  call void @llvm.dbg.value(metadata !{float* %36}, i64 0, metadata !29), !dbg !142
  %exitcond = icmp eq i32 %35, %8, !dbg !142
  br i1 %exitcond, label %._crit_edge, label %27, !dbg !142

._crit_edge:                                      ; preds = %32, %24
  %t.0.lcssa = phi float [ 0.000000e+00, %24 ], [ %34, %32 ]
  %37 = fcmp ogt float %anorm.05, %t.0.lcssa, !dbg !152
  %38 = select i1 %37, float %anorm.05, float %t.0.lcssa, !dbg !152
  call void @llvm.dbg.value(metadata !{float %38}, i64 0, metadata !28), !dbg !152
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !140
  %39 = trunc i64 %indvars.iv.next to i32, !dbg !140
  %40 = icmp slt i32 %39, %13, !dbg !140
  br i1 %40, label %24, label %._crit_edge7, !dbg !140

._crit_edge7:                                     ; preds = %._crit_edge
  %phitmp = fpext float %38 to double, !dbg !140
  br label %41, !dbg !140

; <label>:41                                      ; preds = %._crit_edge7, %.preheader
  %anorm.0.lcssa = phi double [ %phitmp, %._crit_edge7 ], [ 0.000000e+00, %.preheader ]
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), double %anorm.0.lcssa) #2, !dbg !153
  call void @llvm.dbg.value(metadata !{i32** %ipvt}, i64 0, metadata !33), !dbg !154
  %43 = load i32** %ipvt, align 8, !dbg !154, !tbaa !145
  %44 = call i32 (%struct.FULL*, i32*, ...)* bitcast (i32 (...)* @sgefa to i32 (%struct.FULL*, i32*, ...)*)(%struct.FULL* %a, i32* %43) #2, !dbg !154
  call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !35), !dbg !154
  %45 = icmp eq i32 %44, 0, !dbg !155
  br i1 %45, label %46, label %.backedge, !dbg !155

; <label>:46                                      ; preds = %41
  call void @llvm.dbg.value(metadata !{i32** %ipvt}, i64 0, metadata !33), !dbg !157
  call void @llvm.dbg.value(metadata !{float** %b}, i64 0, metadata !25), !dbg !157
  %47 = load float** %b, align 8, !dbg !157, !tbaa !145
  %48 = call i32 (%struct.FULL*, i32*, float*, i32, ...)* bitcast (i32 (...)* @sgesl to i32 (%struct.FULL*, i32*, float*, i32, ...)*)(%struct.FULL* %a, i32* %43, float* %47, i32 0) #2, !dbg !157
  %49 = load i32* %4, align 4, !dbg !159, !tbaa !132
  %50 = icmp slt i32 %49, 8, !dbg !159
  br i1 %50, label %51, label %.thread, !dbg !159

; <label>:51                                      ; preds = %46
  call void @matdump(%struct.FULL* %a, i8* getelementptr inbounds ([24 x i8]* @.str2, i64 0, i64 0)), !dbg !161
  %.pr = load i32* %4, align 4, !dbg !162, !tbaa !132
  %52 = icmp slt i32 %.pr, 8, !dbg !162
  br i1 %52, label %53, label %.thread, !dbg !162

; <label>:53                                      ; preds = %51
  call void @llvm.dbg.value(metadata !{float** %x}, i64 0, metadata !27), !dbg !164
  %54 = load float** %x, align 8, !dbg !164, !tbaa !145
  call void @fvecdump(float* %54, i32 %.pr, i8* getelementptr inbounds ([14 x i8]* @.str3, i64 0, i64 0)), !dbg !164
  call void @llvm.dbg.value(metadata !{float** %b}, i64 0, metadata !25), !dbg !166
  %55 = load i32* %4, align 4, !dbg !166, !tbaa !132
  call void @fvecdump(float* %47, i32 %55, i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0)), !dbg !166
  %.pre14 = load i32* %4, align 4, !dbg !167, !tbaa !132
  br label %.thread, !dbg !168

.thread:                                          ; preds = %46, %53, %51
  %56 = phi i32 [ %49, %46 ], [ %.pre14, %53 ], [ %.pr, %51 ]
  call void @llvm.dbg.value(metadata !{float** %b}, i64 0, metadata !25), !dbg !167
  call void @llvm.dbg.value(metadata !{float** %x}, i64 0, metadata !27), !dbg !167
  %57 = load float** %x, align 8, !dbg !167, !tbaa !145
  %58 = call i32 (i32, float*, float*, float*, i32, ...)* bitcast (i32 (...)* @vexopy to i32 (i32, float*, float*, float*, i32, ...)*)(i32 %56, float* %47, float* %57, float* %47, i32 2) #2, !dbg !167
  %59 = load i32* %4, align 4, !dbg !169, !tbaa !132
  call void @llvm.dbg.value(metadata !{float** %b}, i64 0, metadata !25), !dbg !169
  %60 = call double (i32, float*, i32, ...)* bitcast (double (...)* @snrm2 to double (i32, float*, i32, ...)*)(i32 %59, float* %47, i32 1) #2, !dbg !169
  call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !31), !dbg !169
  call void @llvm.dbg.value(metadata !{i32** %ipvt}, i64 0, metadata !33), !dbg !170
  call void @llvm.dbg.value(metadata !{float** %bt}, i64 0, metadata !26), !dbg !170
  %61 = load float** %bt, align 8, !dbg !170, !tbaa !145
  %62 = call i32 (%struct.FULL*, i32*, float*, i32, ...)* bitcast (i32 (...)* @sgesl to i32 (%struct.FULL*, i32*, float*, i32, ...)*)(%struct.FULL* %a, i32* %43, float* %61, i32 1) #2, !dbg !170
  %63 = load i32* %4, align 4, !dbg !171, !tbaa !132
  %64 = icmp slt i32 %63, 8, !dbg !171
  br i1 %64, label %65, label %66, !dbg !171

; <label>:65                                      ; preds = %.thread
  call void @llvm.dbg.value(metadata !{float** %bt}, i64 0, metadata !26), !dbg !173
  call void @fvecdump(float* %61, i32 %63, i8* getelementptr inbounds ([30 x i8]* @.str5, i64 0, i64 0)), !dbg !173
  %.pre15 = load i32* %4, align 4, !dbg !175, !tbaa !132
  br label %66, !dbg !176

; <label>:66                                      ; preds = %65, %.thread
  %67 = phi i32 [ %.pre15, %65 ], [ %63, %.thread ]
  call void @llvm.dbg.value(metadata !{float** %bt}, i64 0, metadata !26), !dbg !175
  call void @llvm.dbg.value(metadata !{float** %x}, i64 0, metadata !27), !dbg !175
  %68 = call i32 (i32, float*, float*, float*, i32, ...)* bitcast (i32 (...)* @vexopy to i32 (i32, float*, float*, float*, i32, ...)*)(i32 %67, float* %61, float* %57, float* %61, i32 2) #2, !dbg !175
  %69 = load i32* %4, align 4, !dbg !177, !tbaa !132
  call void @llvm.dbg.value(metadata !{float** %bt}, i64 0, metadata !26), !dbg !177
  %70 = call double (i32, float*, i32, ...)* bitcast (double (...)* @snrm2 to double (i32, float*, i32, ...)*)(i32 %69, float* %61, i32 1) #2, !dbg !177
  call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !31), !dbg !177
  br label %.backedge

.backedge:                                        ; preds = %66, %41
  %71 = add nsw i32 %7, 1, !dbg !128
  call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !36), !dbg !128
  %72 = call i32 @matgen(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt, i32 %71, i32 1), !dbg !128
  %73 = icmp eq i32 %72, 0, !dbg !128
  br i1 %73, label %6, label %._crit_edge11, !dbg !128

._crit_edge11:                                    ; preds = %.backedge, %0
  call void @llvm.lifetime.end(i64 8008, i8* %1) #2, !dbg !178
  ret i32 0, !dbg !179
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: noreturn
declare void @exit(i32) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

declare i32 @sgefa(...) #5

declare i32 @sgesl(...) #5

declare i32 @vexopy(...) #5

declare double @snrm2(...) #5

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @matgen(%struct.FULL* %a, float** nocapture %x, float** nocapture %b, float** nocapture %bt, i32** nocapture %ipvt, i32 %test_case, i32 %scale) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !44), !dbg !180
  tail call void @llvm.dbg.value(metadata !{float** %x}, i64 0, metadata !45), !dbg !181
  tail call void @llvm.dbg.value(metadata !{float** %b}, i64 0, metadata !46), !dbg !181
  tail call void @llvm.dbg.value(metadata !{float** %bt}, i64 0, metadata !47), !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32** %ipvt}, i64 0, metadata !48), !dbg !182
  tail call void @llvm.dbg.value(metadata !{i32 %test_case}, i64 0, metadata !49), !dbg !182
  tail call void @llvm.dbg.value(metadata !{i32 %scale}, i64 0, metadata !50), !dbg !182
  %1 = icmp sgt i32 %test_case, 1, !dbg !183
  br i1 %1, label %2, label %14, !dbg !183

; <label>:2                                       ; preds = %0
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([73 x i8]* @str32, i64 0, i64 0)), !dbg !185
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !187
  %3 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !187
  %4 = load i32* %3, align 4, !dbg !187, !tbaa !132
  %5 = icmp sgt i32 %4, 0, !dbg !187
  br i1 %5, label %.lr.ph89, label %._crit_edge90, !dbg !187

.lr.ph89:                                         ; preds = %2, %.lr.ph89
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %.lr.ph89 ], [ 0, %2 ]
  %6 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv114, !dbg !189
  %7 = load float** %6, align 8, !dbg !189, !tbaa !145
  tail call void (float*, ...)* bitcast (void (...)* @free to void (float*, ...)*)(float* %7) #2, !dbg !189
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1, !dbg !187
  %8 = load i32* %3, align 4, !dbg !187, !tbaa !132
  %9 = trunc i64 %indvars.iv.next115 to i32, !dbg !187
  %10 = icmp slt i32 %9, %8, !dbg !187
  br i1 %10, label %.lr.ph89, label %._crit_edge90, !dbg !187

._crit_edge90:                                    ; preds = %.lr.ph89, %2
  %11 = load float** %x, align 8, !dbg !190, !tbaa !145
  tail call void (float*, ...)* bitcast (void (...)* @free to void (float*, ...)*)(float* %11) #2, !dbg !190
  %12 = load float** %b, align 8, !dbg !191, !tbaa !145
  tail call void (float*, ...)* bitcast (void (...)* @free to void (float*, ...)*)(float* %12) #2, !dbg !191
  %13 = load float** %bt, align 8, !dbg !192, !tbaa !145
  tail call void (float*, ...)* bitcast (void (...)* @free to void (float*, ...)*)(float* %13) #2, !dbg !192
  br label %14, !dbg !193

; <label>:14                                      ; preds = %._crit_edge90, %0
  switch i32 %test_case, label %290 [
    i32 1, label %15
    i32 2, label %15
    i32 3, label %15
    i32 4, label %46
    i32 5, label %46
    i32 6, label %57
    i32 7, label %57
    i32 8, label %57
    i32 9, label %90
    i32 10, label %112
    i32 11, label %144
    i32 12, label %170
    i32 13, label %196
    i32 14, label %243
  ], !dbg !194

; <label>:15                                      ; preds = %14, %14, %14
  %16 = mul nsw i32 %test_case, 3, !dbg !195
  %17 = mul nsw i32 %16, %scale, !dbg !195
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !53), !dbg !195
  %18 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !197
  store i32 %17, i32* %18, align 4, !dbg !197, !tbaa !139
  %19 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !198
  store i32 %17, i32* %19, align 4, !dbg !198, !tbaa !132
  %20 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !199
  %21 = icmp eq i32 %20, 0, !dbg !199
  br i1 %21, label %22, label %.critedge, !dbg !199

; <label>:22                                      ; preds = %15
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 %test_case, i32 %17) #2, !dbg !201
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !202
  %24 = icmp sgt i32 %17, 0, !dbg !202
  br i1 %24, label %.lr.ph31, label %.loopexit15.thread, !dbg !202

.loopexit15.thread:                               ; preds = %22
  %25 = load float** %x, align 8, !dbg !204, !tbaa !145
  store float 1.000000e+00, float* %25, align 4, !dbg !204, !tbaa !150
  br label %.thread11, !dbg !205

.lr.ph31:                                         ; preds = %22
  %26 = mul i32 %scale, %test_case, !dbg !202
  %27 = mul i32 %26, 3, !dbg !202
  br label %.lr.ph28, !dbg !202

.lr.ph28:                                         ; preds = %.lr.ph31, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph31 ], [ %32, %._crit_edge ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !207
  tail call void @llvm.dbg.value(metadata !{float* %29}, i64 0, metadata !54), !dbg !207
  %28 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv, !dbg !207
  %29 = load float** %28, align 8, !dbg !207, !tbaa !145
  %30 = add nsw i64 %indvars.iv, 4294967293, !dbg !210
  %31 = add nsw i64 %indvars.iv, 2
  %32 = add i64 %indvars.iv, 1, !dbg !210
  br label %33, !dbg !207

; <label>:33                                      ; preds = %43, %.lr.ph28
  %col.027 = phi float* [ %29, %.lr.ph28 ], [ %45, %43 ]
  %i.026 = phi i32 [ 0, %.lr.ph28 ], [ %44, %43 ]
  %34 = trunc i64 %30 to i32, !dbg !210
  %35 = icmp slt i32 %i.026, %34, !dbg !210
  %36 = trunc i64 %31 to i32, !dbg !210
  %37 = icmp sgt i32 %i.026, %36, !dbg !210
  %or.cond = or i1 %35, %37, !dbg !210
  br i1 %or.cond, label %43, label %38, !dbg !210

; <label>:38                                      ; preds = %33
  %39 = trunc i64 %32 to i32, !dbg !210
  %40 = add i32 %39, %i.026, !dbg !210
  %41 = sitofp i32 %40 to float, !dbg !210
  %42 = fdiv float 1.000000e+00, %41, !dbg !210
  br label %43, !dbg !210

; <label>:43                                      ; preds = %33, %38
  %storemerge = phi float [ %42, %38 ], [ 0.000000e+00, %33 ]
  store float %storemerge, float* %col.027, align 4, !dbg !213, !tbaa !150
  %44 = add nsw i32 %i.026, 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !51), !dbg !207
  %45 = getelementptr inbounds float* %col.027, i64 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{float* %45}, i64 0, metadata !54), !dbg !207
  %exitcond97 = icmp eq i32 %44, %27, !dbg !207
  br i1 %exitcond97, label %._crit_edge, label %33, !dbg !207

._crit_edge:                                      ; preds = %43
  %lftr.wideiv98 = trunc i64 %32 to i32, !dbg !202
  %exitcond99 = icmp eq i32 %lftr.wideiv98, %27, !dbg !202
  br i1 %exitcond99, label %.loopexit15, label %.lr.ph28, !dbg !202

; <label>:46                                      ; preds = %14, %14
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !53), !dbg !214
  %47 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !215
  store i32 1, i32* %47, align 4, !dbg !215, !tbaa !139
  %48 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !216
  store i32 1, i32* %48, align 4, !dbg !216, !tbaa !132
  %49 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !217
  %50 = icmp eq i32 %49, 0, !dbg !217
  br i1 %50, label %.thread, label %.critedge, !dbg !217

.thread:                                          ; preds = %46
  %51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str8, i64 0, i64 0), i32 %test_case, i32 1) #2, !dbg !219
  %52 = icmp eq i32 %test_case, 4, !dbg !220
  %53 = select i1 %52, float 3.000000e+00, float 0.000000e+00, !dbg !220
  %54 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !220
  %55 = load float** %54, align 8, !dbg !220, !tbaa !145
  store float %53, float* %55, align 4, !dbg !220, !tbaa !150
  %56 = load float** %x, align 8, !dbg !204, !tbaa !145
  store float 1.000000e+00, float* %56, align 4, !dbg !204, !tbaa !150
  br label %.thread11, !dbg !205

; <label>:57                                      ; preds = %14, %14, %14
  %58 = mul nsw i32 %scale, 15, !dbg !221
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !53), !dbg !221
  %59 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !222
  store i32 %58, i32* %59, align 4, !dbg !222, !tbaa !139
  %60 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !223
  store i32 %58, i32* %60, align 4, !dbg !223, !tbaa !132
  %61 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !224
  %62 = icmp eq i32 %61, 0, !dbg !224
  br i1 %62, label %63, label %.critedge, !dbg !224

; <label>:63                                      ; preds = %57
  %64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str9, i64 0, i64 0), i32 %test_case, i32 %58) #2, !dbg !226
  tail call void @llvm.dbg.value(metadata !227, i64 0, metadata !56), !dbg !228
  tail call void @llvm.dbg.value(metadata !227, i64 0, metadata !55), !dbg !229
  %65 = icmp eq i32 %test_case, 7, !dbg !230
  %. = select i1 %65, float 1.000000e+02, float 1.000000e+00, !dbg !230
  tail call void @llvm.dbg.value(metadata !{float %.}, i64 0, metadata !55), !dbg !230
  %66 = icmp eq i32 %test_case, 8, !dbg !232
  tail call void @llvm.dbg.value(metadata !234, i64 0, metadata !56), !dbg !232
  %.6 = select i1 %66, float 1.000000e+02, float 1.000000e+00, !dbg !232
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !235
  %67 = icmp sgt i32 %scale, 0, !dbg !235
  br i1 %67, label %.lr.ph35, label %.loopexit15, !dbg !235

.lr.ph35:                                         ; preds = %63, %._crit_edge36
  %indvars.iv100 = phi i64 [ %71, %._crit_edge36 ], [ 0, %63 ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !237
  tail call void @llvm.dbg.value(metadata !{float* %69}, i64 0, metadata !54), !dbg !237
  %68 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv100, !dbg !237
  %69 = load float** %68, align 8, !dbg !237, !tbaa !145
  %70 = add nsw i64 %indvars.iv100, 4294967295, !dbg !240
  %71 = add nsw i64 %indvars.iv100, 1, !dbg !244
  br label %72, !dbg !237

; <label>:72                                      ; preds = %.lr.ph35, %84
  %col.133 = phi float* [ %69, %.lr.ph35 ], [ %86, %84 ]
  %i.132 = phi i32 [ 0, %.lr.ph35 ], [ %85, %84 ]
  store float 0.000000e+00, float* %col.133, align 4, !dbg !246, !tbaa !150
  %73 = trunc i64 %indvars.iv100 to i32, !dbg !247
  %74 = icmp eq i32 %i.132, %73, !dbg !247
  br i1 %74, label %75, label %76, !dbg !247

; <label>:75                                      ; preds = %72
  store float 4.000000e+00, float* %col.133, align 4, !dbg !247, !tbaa !150
  br label %84, !dbg !247

; <label>:76                                      ; preds = %72
  %77 = trunc i64 %70 to i32, !dbg !240
  %78 = icmp eq i32 %i.132, %77, !dbg !240
  br i1 %78, label %79, label %80, !dbg !240

; <label>:79                                      ; preds = %76
  store float %., float* %col.133, align 4, !dbg !240, !tbaa !150
  br label %84, !dbg !240

; <label>:80                                      ; preds = %76
  %81 = trunc i64 %71 to i32, !dbg !244
  %82 = icmp eq i32 %i.132, %81, !dbg !244
  br i1 %82, label %83, label %84, !dbg !244

; <label>:83                                      ; preds = %80
  store float %.6, float* %col.133, align 4, !dbg !244, !tbaa !150
  br label %84, !dbg !244

; <label>:84                                      ; preds = %75, %80, %83, %79
  %85 = add nsw i32 %i.132, 1, !dbg !237
  tail call void @llvm.dbg.value(metadata !{i32 %85}, i64 0, metadata !51), !dbg !237
  %86 = getelementptr inbounds float* %col.133, i64 1, !dbg !237
  tail call void @llvm.dbg.value(metadata !{float* %86}, i64 0, metadata !54), !dbg !237
  %87 = icmp slt i32 %85, %58, !dbg !237
  br i1 %87, label %72, label %._crit_edge36, !dbg !237

._crit_edge36:                                    ; preds = %84
  %88 = trunc i64 %71 to i32, !dbg !235
  %89 = icmp slt i32 %88, %58, !dbg !235
  br i1 %89, label %.lr.ph35, label %.loopexit15, !dbg !235

; <label>:90                                      ; preds = %14
  %91 = mul nsw i32 %scale, 5, !dbg !248
  tail call void @llvm.dbg.value(metadata !{i32 %91}, i64 0, metadata !53), !dbg !248
  %92 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !249
  store i32 %91, i32* %92, align 4, !dbg !249, !tbaa !139
  %93 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !250
  store i32 %91, i32* %93, align 4, !dbg !250, !tbaa !132
  %94 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !251
  %95 = icmp eq i32 %94, 0, !dbg !251
  br i1 %95, label %96, label %.critedge, !dbg !251

; <label>:96                                      ; preds = %90
  %97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str10, i64 0, i64 0), i32 9, i32 %91) #2, !dbg !253
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !254
  %98 = icmp sgt i32 %scale, 0, !dbg !254
  br i1 %98, label %.lr.ph43, label %.loopexit15, !dbg !254

.lr.ph43:                                         ; preds = %96, %._crit_edge44
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge44 ], [ 0, %96 ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !256
  tail call void @llvm.dbg.value(metadata !{float* %100}, i64 0, metadata !54), !dbg !256
  %99 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv102, !dbg !256
  %100 = load float** %99, align 8, !dbg !256, !tbaa !145
  br label %101, !dbg !256

; <label>:101                                     ; preds = %.lr.ph43, %101
  %col.241 = phi float* [ %100, %.lr.ph43 ], [ %108, %101 ]
  %i.240 = phi i32 [ 0, %.lr.ph43 ], [ %107, %101 ]
  %102 = trunc i64 %indvars.iv102 to i32, !dbg !259
  %103 = sub nsw i32 %i.240, %102, !dbg !259
  %104 = sitofp i32 %103 to double, !dbg !259
  %105 = tail call double @pow(double 1.000000e+01, double %104) #2, !dbg !259
  %106 = fptrunc double %105 to float, !dbg !259
  store float %106, float* %col.241, align 4, !dbg !259, !tbaa !150
  %107 = add nsw i32 %i.240, 1, !dbg !256
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !51), !dbg !256
  %108 = getelementptr inbounds float* %col.241, i64 1, !dbg !256
  tail call void @llvm.dbg.value(metadata !{float* %108}, i64 0, metadata !54), !dbg !256
  %109 = icmp slt i32 %107, %91, !dbg !256
  br i1 %109, label %101, label %._crit_edge44, !dbg !256

._crit_edge44:                                    ; preds = %101
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1, !dbg !254
  %110 = trunc i64 %indvars.iv.next103 to i32, !dbg !254
  %111 = icmp slt i32 %110, %91, !dbg !254
  br i1 %111, label %.lr.ph43, label %.loopexit15, !dbg !254

; <label>:112                                     ; preds = %14
  %113 = shl nsw i32 %scale, 2, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i32 %113}, i64 0, metadata !53), !dbg !261
  %114 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !262
  store i32 %113, i32* %114, align 4, !dbg !262, !tbaa !139
  %115 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !263
  store i32 %113, i32* %115, align 4, !dbg !263, !tbaa !132
  %116 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !264
  %117 = icmp eq i32 %116, 0, !dbg !264
  br i1 %117, label %118, label %.critedge, !dbg !264

; <label>:118                                     ; preds = %112
  %119 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str11, i64 0, i64 0), i32 10, i32 %113) #2, !dbg !266
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !267
  %120 = icmp sgt i32 %scale, 0, !dbg !267
  br i1 %120, label %.lr.ph51.preheader, label %.loopexit15, !dbg !267

.lr.ph51.preheader:                               ; preds = %118
  %121 = shl i32 %scale, 2, !dbg !269
  %122 = icmp sgt i32 %121, 1
  %.op348 = add i32 %121, -1, !dbg !269
  %123 = zext i32 %.op348 to i64
  %.op349 = add i64 %123, 1, !dbg !269
  %124 = select i1 %122, i64 %.op349, i64 1, !dbg !269
  br label %.lr.ph51, !dbg !269

.lr.ph51:                                         ; preds = %.lr.ph51.preheader, %._crit_edge52
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge52 ], [ 0, %.lr.ph51.preheader ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !269
  tail call void @llvm.dbg.value(metadata !{float* %126}, i64 0, metadata !54), !dbg !269
  %125 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv104, !dbg !269
  %126 = load float** %125, align 8, !dbg !269, !tbaa !145
  %127 = add nsw i64 %indvars.iv104, 4294967294, !dbg !272
  %128 = trunc i64 %127 to i32, !dbg !272
  %129 = sitofp i32 %128 to float, !dbg !272
  %n.vec205 = and i64 %124, -4, !dbg !274
  %cmp.zero207 = icmp eq i64 %n.vec205, 0, !dbg !274
  %ptr.ind.end209 = getelementptr float* %126, i64 %n.vec205
  %130 = trunc i64 %n.vec205 to i32
  br i1 %cmp.zero207, label %middle.block200, label %vector.ph198

vector.ph198:                                     ; preds = %.lr.ph51
  %broadcast.splatinsert230 = insertelement <4 x float> undef, float %129, i32 0
  %broadcast.splat231 = shufflevector <4 x float> %broadcast.splatinsert230, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body199

vector.body199:                                   ; preds = %vector.body199, %vector.ph198
  %index202 = phi i64 [ 0, %vector.ph198 ], [ %index.next213, %vector.body199 ], !dbg !274
  %next.gep216 = getelementptr float* %126, i64 %index202
  %131 = trunc i64 %index202 to i32
  %broadcast.splatinsert227 = insertelement <4 x i32> undef, i32 %131, i32 0
  %broadcast.splat228 = shufflevector <4 x i32> %broadcast.splatinsert227, <4 x i32> undef, <4 x i32> zeroinitializer
  %132 = add <4 x i32> %broadcast.splat228, <i32 1, i32 2, i32 3, i32 4>, !dbg !274
  %133 = sitofp <4 x i32> %132 to <4 x float>, !dbg !274
  %134 = fdiv <4 x float> %broadcast.splat231, %133, !dbg !275
  %135 = bitcast float* %next.gep216 to <4 x float>*, !dbg !275
  store <4 x float> %134, <4 x float>* %135, align 4, !dbg !275
  %index.next213 = add i64 %index202, 4, !dbg !274
  %136 = icmp eq i64 %index.next213, %n.vec205, !dbg !274
  br i1 %136, label %middle.block200, label %vector.body199, !dbg !274, !llvm.loop !276

middle.block200:                                  ; preds = %vector.body199, %.lr.ph51
  %resume.val208 = phi float* [ %126, %.lr.ph51 ], [ %ptr.ind.end209, %vector.body199 ]
  %resume.val210 = phi i64 [ 0, %.lr.ph51 ], [ %n.vec205, %vector.body199 ]
  %trunc.resume.val211 = phi i32 [ 0, %.lr.ph51 ], [ %130, %vector.body199 ]
  %cmp.n212 = icmp eq i64 %124, %resume.val210
  br i1 %cmp.n212, label %._crit_edge52, label %scalar.ph201

scalar.ph201:                                     ; preds = %middle.block200, %scalar.ph201
  %col.349 = phi float* [ %140, %scalar.ph201 ], [ %resume.val208, %middle.block200 ]
  %i.348 = phi i32 [ %137, %scalar.ph201 ], [ %trunc.resume.val211, %middle.block200 ]
  tail call void @llvm.dbg.value(metadata !{float %129}, i64 0, metadata !56), !dbg !272
  %137 = add nsw i32 %i.348, 1, !dbg !274
  %138 = sitofp i32 %137 to float, !dbg !274
  tail call void @llvm.dbg.value(metadata !{float %138}, i64 0, metadata !55), !dbg !274
  %139 = fdiv float %129, %138, !dbg !275
  store float %139, float* %col.349, align 4, !dbg !275, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !51), !dbg !269
  %140 = getelementptr inbounds float* %col.349, i64 1, !dbg !269
  tail call void @llvm.dbg.value(metadata !{float* %140}, i64 0, metadata !54), !dbg !269
  %141 = icmp slt i32 %137, %113, !dbg !269
  br i1 %141, label %scalar.ph201, label %._crit_edge52, !dbg !269, !llvm.loop !279

._crit_edge52:                                    ; preds = %middle.block200, %scalar.ph201
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1, !dbg !267
  %142 = trunc i64 %indvars.iv.next105 to i32, !dbg !267
  %143 = icmp slt i32 %142, %113, !dbg !267
  br i1 %143, label %.lr.ph51, label %.loopexit15, !dbg !267

; <label>:144                                     ; preds = %14
  %145 = mul nsw i32 %scale, 6, !dbg !280
  tail call void @llvm.dbg.value(metadata !{i32 %145}, i64 0, metadata !53), !dbg !280
  %146 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !281
  store i32 %145, i32* %146, align 4, !dbg !281, !tbaa !139
  %147 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !282
  store i32 %145, i32* %147, align 4, !dbg !282, !tbaa !132
  %148 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !283
  %149 = icmp eq i32 %148, 0, !dbg !283
  br i1 %149, label %150, label %.critedge, !dbg !283

; <label>:150                                     ; preds = %144
  %151 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str12, i64 0, i64 0), i32 11, i32 %145) #2, !dbg !285
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !286
  %152 = icmp sgt i32 %scale, 0, !dbg !286
  br i1 %152, label %.lr.ph59, label %.loopexit15, !dbg !286

.lr.ph59:                                         ; preds = %150, %._crit_edge60
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge60 ], [ 0, %150 ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !288
  tail call void @llvm.dbg.value(metadata !{float* %154}, i64 0, metadata !54), !dbg !288
  %153 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv106, !dbg !288
  %154 = load float** %153, align 8, !dbg !288, !tbaa !145
  %155 = sub i64 1, %indvars.iv106, !dbg !290
  br label %156, !dbg !288

; <label>:156                                     ; preds = %.lr.ph59, %163
  %col.457 = phi float* [ %154, %.lr.ph59 ], [ %166, %163 ]
  %i.456 = phi i32 [ 0, %.lr.ph59 ], [ %165, %163 ]
  %157 = trunc i64 %indvars.iv106 to i32, !dbg !290
  %158 = icmp sgt i32 %i.456, %157, !dbg !290
  br i1 %158, label %163, label %159, !dbg !290

; <label>:159                                     ; preds = %156
  %160 = trunc i64 %155 to i32, !dbg !290
  %161 = add i32 %160, %i.456, !dbg !290
  %162 = sitofp i32 %161 to float, !dbg !290
  br label %163, !dbg !290

; <label>:163                                     ; preds = %156, %159
  %164 = phi float [ %162, %159 ], [ 0.000000e+00, %156 ]
  store float %164, float* %col.457, align 4, !dbg !290, !tbaa !150
  %165 = add nsw i32 %i.456, 1, !dbg !288
  tail call void @llvm.dbg.value(metadata !{i32 %165}, i64 0, metadata !51), !dbg !288
  %166 = getelementptr inbounds float* %col.457, i64 1, !dbg !288
  tail call void @llvm.dbg.value(metadata !{float* %166}, i64 0, metadata !54), !dbg !288
  %167 = icmp slt i32 %165, %145, !dbg !288
  br i1 %167, label %156, label %._crit_edge60, !dbg !288

._crit_edge60:                                    ; preds = %163
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1, !dbg !286
  %168 = trunc i64 %indvars.iv.next107 to i32, !dbg !286
  %169 = icmp slt i32 %168, %145, !dbg !286
  br i1 %169, label %.lr.ph59, label %.loopexit15, !dbg !286

; <label>:170                                     ; preds = %14
  %171 = mul nsw i32 %scale, 6, !dbg !291
  tail call void @llvm.dbg.value(metadata !{i32 %171}, i64 0, metadata !53), !dbg !291
  %172 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !292
  store i32 %171, i32* %172, align 4, !dbg !292, !tbaa !139
  %173 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !293
  store i32 %171, i32* %173, align 4, !dbg !293, !tbaa !132
  %174 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !294
  %175 = icmp eq i32 %174, 0, !dbg !294
  br i1 %175, label %176, label %.critedge, !dbg !294

; <label>:176                                     ; preds = %170
  %177 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str13, i64 0, i64 0), i32 12, i32 %171) #2, !dbg !296
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !297
  %178 = icmp sgt i32 %scale, 0, !dbg !297
  br i1 %178, label %.lr.ph67, label %.loopexit15, !dbg !297

.lr.ph67:                                         ; preds = %176, %._crit_edge68
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge68 ], [ 0, %176 ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !299
  tail call void @llvm.dbg.value(metadata !{float* %180}, i64 0, metadata !54), !dbg !299
  %179 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv108, !dbg !299
  %180 = load float** %179, align 8, !dbg !299, !tbaa !145
  %181 = sub i64 1, %indvars.iv108, !dbg !301
  br label %182, !dbg !299

; <label>:182                                     ; preds = %.lr.ph67, %189
  %col.565 = phi float* [ %180, %.lr.ph67 ], [ %192, %189 ]
  %i.564 = phi i32 [ 0, %.lr.ph67 ], [ %191, %189 ]
  %183 = trunc i64 %indvars.iv108 to i32, !dbg !301
  %184 = icmp slt i32 %i.564, %183, !dbg !301
  br i1 %184, label %189, label %185, !dbg !301

; <label>:185                                     ; preds = %182
  %186 = trunc i64 %181 to i32, !dbg !301
  %187 = add i32 %186, %i.564, !dbg !301
  %188 = sitofp i32 %187 to float, !dbg !301
  br label %189, !dbg !301

; <label>:189                                     ; preds = %182, %185
  %190 = phi float [ %188, %185 ], [ 0.000000e+00, %182 ]
  store float %190, float* %col.565, align 4, !dbg !301, !tbaa !150
  %191 = add nsw i32 %i.564, 1, !dbg !299
  tail call void @llvm.dbg.value(metadata !{i32 %191}, i64 0, metadata !51), !dbg !299
  %192 = getelementptr inbounds float* %col.565, i64 1, !dbg !299
  tail call void @llvm.dbg.value(metadata !{float* %192}, i64 0, metadata !54), !dbg !299
  %193 = icmp slt i32 %191, %171, !dbg !299
  br i1 %193, label %182, label %._crit_edge68, !dbg !299

._crit_edge68:                                    ; preds = %189
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1, !dbg !297
  %194 = trunc i64 %indvars.iv.next109 to i32, !dbg !297
  %195 = icmp slt i32 %194, %171, !dbg !297
  br i1 %195, label %.lr.ph67, label %.loopexit15, !dbg !297

; <label>:196                                     ; preds = %14
  %197 = mul nsw i32 %scale, 5, !dbg !302
  tail call void @llvm.dbg.value(metadata !{i32 %197}, i64 0, metadata !53), !dbg !302
  %198 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !303
  store i32 %197, i32* %198, align 4, !dbg !303, !tbaa !139
  %199 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !304
  store i32 %197, i32* %199, align 4, !dbg !304, !tbaa !132
  %200 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !305
  %201 = icmp eq i32 %200, 0, !dbg !305
  br i1 %201, label %202, label %.critedge, !dbg !305

; <label>:202                                     ; preds = %196
  %203 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str14, i64 0, i64 0), i32 13, i32 %197, double 1.000000e+38) #2, !dbg !307
  tail call void @llvm.dbg.value(metadata !{float %206}, i64 0, metadata !55), !dbg !308
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !309
  %204 = icmp sgt i32 %scale, 0, !dbg !309
  br i1 %204, label %.lr.ph78, label %.loopexit15, !dbg !309

.lr.ph78:                                         ; preds = %202
  %205 = mul nsw i32 %197, %197, !dbg !308
  %206 = sitofp i32 %205 to float, !dbg !308
  %207 = fpext float %206 to double, !dbg !311
  %208 = mul i32 %scale, 5, !dbg !309
  %209 = icmp sgt i32 %208, 1
  %.op341 = add i32 %208, -1, !dbg !309
  %210 = zext i32 %.op341 to i64
  %.op342 = add i64 %210, 1, !dbg !309
  %211 = select i1 %209, i64 %.op342, i64 1, !dbg !309
  br label %.lr.ph75, !dbg !309

.loopexit21:                                      ; preds = %middle.block159, %scalar.ph160
  %212 = icmp slt i32 %215, %197, !dbg !309
  br i1 %212, label %.lr.ph75, label %.loopexit15, !dbg !309

.lr.ph75:                                         ; preds = %.loopexit21, %.lr.ph78
  %indvars.iv110 = phi i64 [ 0, %.lr.ph78 ], [ %indvars.iv.next111, %.loopexit21 ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !314
  tail call void @llvm.dbg.value(metadata !{float* %214}, i64 0, metadata !54), !dbg !314
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1, !dbg !309
  %213 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv110, !dbg !314
  %214 = load float** %213, align 8, !dbg !314, !tbaa !145
  %215 = trunc i64 %indvars.iv.next111 to i32, !dbg !315
  %216 = sitofp i32 %215 to float, !dbg !315
  %n.vec164 = and i64 %211, -4, !dbg !314
  %cmp.zero166 = icmp eq i64 %n.vec164, 0, !dbg !314
  %ptr.ind.end168 = getelementptr float* %214, i64 %n.vec164
  %217 = trunc i64 %n.vec164 to i32
  br i1 %cmp.zero166, label %middle.block159, label %vector.ph157

vector.ph157:                                     ; preds = %.lr.ph75
  %broadcast.splatinsert189 = insertelement <4 x i64> undef, i64 %indvars.iv110, i32 0
  %broadcast.splat190 = shufflevector <4 x i64> %broadcast.splatinsert189, <4 x i64> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert191 = insertelement <4 x float> undef, float %216, i32 0
  %broadcast.splat192 = shufflevector <4 x float> %broadcast.splatinsert191, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert193 = insertelement <4 x double> undef, double %207, i32 0
  %broadcast.splat194 = shufflevector <4 x double> %broadcast.splatinsert193, <4 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body158

vector.body158:                                   ; preds = %vector.body158, %vector.ph157
  %index161 = phi i64 [ 0, %vector.ph157 ], [ %index.next172, %vector.body158 ], !dbg !314
  %next.gep175 = getelementptr float* %214, i64 %index161
  %218 = trunc i64 %index161 to i32
  %broadcast.splatinsert186 = insertelement <4 x i32> undef, i32 %218, i32 0
  %broadcast.splat187 = shufflevector <4 x i32> %broadcast.splatinsert186, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction188 = add <4 x i32> %broadcast.splat187, <i32 0, i32 1, i32 2, i32 3>
  %219 = trunc <4 x i64> %broadcast.splat190 to <4 x i32>, !dbg !315
  %220 = icmp sgt <4 x i32> %induction188, %219, !dbg !315
  %221 = select <4 x i1> %220, <4 x i32> %induction188, <4 x i32> %219, !dbg !315
  %222 = add nsw <4 x i32> %221, <i32 1, i32 1, i32 1, i32 1>, !dbg !315
  %223 = sitofp <4 x i32> %222 to <4 x float>, !dbg !315
  %224 = fdiv <4 x float> %broadcast.splat192, %223, !dbg !315
  %225 = fpext <4 x float> %224 to <4 x double>, !dbg !311
  %226 = fmul <4 x double> %225, <double 1.000000e+38, double 1.000000e+38, double 1.000000e+38, double 1.000000e+38>, !dbg !311
  %227 = fdiv <4 x double> %226, %broadcast.splat194, !dbg !311
  %228 = fptrunc <4 x double> %227 to <4 x float>, !dbg !311
  %229 = bitcast float* %next.gep175 to <4 x float>*, !dbg !311
  store <4 x float> %228, <4 x float>* %229, align 4, !dbg !311
  %index.next172 = add i64 %index161, 4, !dbg !314
  %230 = icmp eq i64 %index.next172, %n.vec164, !dbg !314
  br i1 %230, label %middle.block159, label %vector.body158, !dbg !314, !llvm.loop !316

middle.block159:                                  ; preds = %vector.body158, %.lr.ph75
  %resume.val167 = phi float* [ %214, %.lr.ph75 ], [ %ptr.ind.end168, %vector.body158 ]
  %resume.val169 = phi i64 [ 0, %.lr.ph75 ], [ %n.vec164, %vector.body158 ]
  %trunc.resume.val170 = phi i32 [ 0, %.lr.ph75 ], [ %217, %vector.body158 ]
  %cmp.n171 = icmp eq i64 %211, %resume.val169
  br i1 %cmp.n171, label %.loopexit21, label %scalar.ph160

scalar.ph160:                                     ; preds = %middle.block159, %scalar.ph160
  %col.673 = phi float* [ %241, %scalar.ph160 ], [ %resume.val167, %middle.block159 ]
  %i.672 = phi i32 [ %240, %scalar.ph160 ], [ %trunc.resume.val170, %middle.block159 ]
  %231 = trunc i64 %indvars.iv110 to i32, !dbg !315
  %232 = icmp sgt i32 %i.672, %231, !dbg !315
  %.sink = select i1 %232, i32 %i.672, i32 %231, !dbg !315
  %233 = add nsw i32 %.sink, 1, !dbg !315
  %234 = sitofp i32 %233 to float, !dbg !315
  %235 = fdiv float %216, %234, !dbg !315
  tail call void @llvm.dbg.value(metadata !{float %235}, i64 0, metadata !56), !dbg !315
  %236 = fpext float %235 to double, !dbg !311
  %237 = fmul double %236, 1.000000e+38, !dbg !311
  %238 = fdiv double %237, %207, !dbg !311
  %239 = fptrunc double %238 to float, !dbg !311
  store float %239, float* %col.673, align 4, !dbg !311, !tbaa !150
  %240 = add nsw i32 %i.672, 1, !dbg !314
  tail call void @llvm.dbg.value(metadata !{i32 %240}, i64 0, metadata !51), !dbg !314
  %241 = getelementptr inbounds float* %col.673, i64 1, !dbg !314
  tail call void @llvm.dbg.value(metadata !{float* %241}, i64 0, metadata !54), !dbg !314
  %242 = icmp slt i32 %240, %197, !dbg !314
  br i1 %242, label %scalar.ph160, label %.loopexit21, !dbg !314, !llvm.loop !317

; <label>:243                                     ; preds = %14
  %244 = mul nsw i32 %scale, 5, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32 %244}, i64 0, metadata !53), !dbg !318
  %245 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !319
  store i32 %244, i32* %245, align 4, !dbg !319, !tbaa !139
  %246 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !320
  store i32 %244, i32* %246, align 4, !dbg !320, !tbaa !132
  %247 = tail call i32 @get_space(%struct.FULL* %a, float** %x, float** %b, float** %bt, i32** %ipvt), !dbg !321
  %248 = icmp eq i32 %247, 0, !dbg !321
  br i1 %248, label %249, label %.critedge, !dbg !321

; <label>:249                                     ; preds = %243
  %250 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str15, i64 0, i64 0), i32 14, i32 %244, double 1.000000e-38) #2, !dbg !323
  %251 = mul nsw i32 %244, %244, !dbg !324
  %252 = sitofp i32 %251 to float, !dbg !324
  tail call void @llvm.dbg.value(metadata !{float %252}, i64 0, metadata !55), !dbg !324
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !52), !dbg !325
  %253 = icmp sgt i32 %scale, 0, !dbg !325
  br i1 %253, label %.lr.ph82.preheader, label %.loopexit15, !dbg !325

.lr.ph82.preheader:                               ; preds = %249
  %254 = mul i32 %scale, 5, !dbg !327
  %255 = icmp sgt i32 %254, 1
  %.op = add i32 %254, -1, !dbg !327
  %256 = zext i32 %.op to i64
  %.op335 = add i64 %256, 1, !dbg !327
  %257 = select i1 %255, i64 %.op335, i64 1, !dbg !327
  br label %.lr.ph82, !dbg !327

.lr.ph82:                                         ; preds = %.lr.ph82.preheader, %._crit_edge83
  %indvars.iv112 = phi i64 [ %260, %._crit_edge83 ], [ 0, %.lr.ph82.preheader ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !51), !dbg !327
  tail call void @llvm.dbg.value(metadata !{float* %259}, i64 0, metadata !54), !dbg !327
  %258 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv112, !dbg !327
  %259 = load float** %258, align 8, !dbg !327, !tbaa !145
  %260 = add nsw i64 %indvars.iv112, 1, !dbg !329
  %261 = trunc i64 %260 to i32, !dbg !329
  %262 = sitofp i32 %261 to float, !dbg !329
  %n.vec = and i64 %257, -4, !dbg !327
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !327
  %ptr.ind.end = getelementptr float* %259, i64 %n.vec
  %263 = trunc i64 %n.vec to i32
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph82
  %broadcast.splatinsert148 = insertelement <4 x i64> undef, i64 %indvars.iv112, i32 0
  %broadcast.splat149 = shufflevector <4 x i64> %broadcast.splatinsert148, <4 x i64> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert150 = insertelement <4 x float> undef, float %262, i32 0
  %broadcast.splat151 = shufflevector <4 x float> %broadcast.splatinsert150, <4 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert152 = insertelement <4 x float> undef, float %252, i32 0
  %broadcast.splat153 = shufflevector <4 x float> %broadcast.splatinsert152, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !327
  %next.gep = getelementptr float* %259, i64 %index
  %264 = trunc i64 %index to i32
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %264, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %265 = trunc <4 x i64> %broadcast.splat149 to <4 x i32>, !dbg !329
  %266 = icmp sgt <4 x i32> %induction, %265, !dbg !329
  %267 = select <4 x i1> %266, <4 x i32> %induction, <4 x i32> %265, !dbg !329
  %268 = add nsw <4 x i32> %267, <i32 1, i32 1, i32 1, i32 1>, !dbg !329
  %269 = sitofp <4 x i32> %268 to <4 x float>, !dbg !329
  %270 = fdiv <4 x float> %269, %broadcast.splat151, !dbg !329
  %271 = fmul <4 x float> %broadcast.splat153, %270, !dbg !331
  %272 = fpext <4 x float> %271 to <4 x double>, !dbg !331
  %273 = fdiv <4 x double> %272, <double 1.000000e+38, double 1.000000e+38, double 1.000000e+38, double 1.000000e+38>, !dbg !331
  %274 = fptrunc <4 x double> %273 to <4 x float>, !dbg !331
  %275 = bitcast float* %next.gep to <4 x float>*, !dbg !331
  store <4 x float> %274, <4 x float>* %275, align 4, !dbg !331
  %index.next = add i64 %index, 4, !dbg !327
  %276 = icmp eq i64 %index.next, %n.vec, !dbg !327
  br i1 %276, label %middle.block, label %vector.body, !dbg !327, !llvm.loop !332

middle.block:                                     ; preds = %vector.body, %.lr.ph82
  %resume.val = phi float* [ %259, %.lr.ph82 ], [ %ptr.ind.end, %vector.body ]
  %resume.val138 = phi i64 [ 0, %.lr.ph82 ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph82 ], [ %263, %vector.body ]
  %cmp.n = icmp eq i64 %257, %resume.val138
  br i1 %cmp.n, label %._crit_edge83, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %col.780 = phi float* [ %287, %scalar.ph ], [ %resume.val, %middle.block ]
  %i.779 = phi i32 [ %286, %scalar.ph ], [ %trunc.resume.val, %middle.block ]
  %277 = trunc i64 %indvars.iv112 to i32, !dbg !329
  %278 = icmp sgt i32 %i.779, %277, !dbg !329
  %.sink1 = select i1 %278, i32 %i.779, i32 %277, !dbg !329
  %279 = add nsw i32 %.sink1, 1, !dbg !329
  %280 = sitofp i32 %279 to float, !dbg !329
  %281 = fdiv float %280, %262, !dbg !329
  tail call void @llvm.dbg.value(metadata !{float %281}, i64 0, metadata !56), !dbg !329
  %282 = fmul float %252, %281, !dbg !331
  %283 = fpext float %282 to double, !dbg !331
  %284 = fdiv double %283, 1.000000e+38, !dbg !331
  %285 = fptrunc double %284 to float, !dbg !331
  store float %285, float* %col.780, align 4, !dbg !331, !tbaa !150
  %286 = add nsw i32 %i.779, 1, !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %286}, i64 0, metadata !51), !dbg !327
  %287 = getelementptr inbounds float* %col.780, i64 1, !dbg !327
  tail call void @llvm.dbg.value(metadata !{float* %287}, i64 0, metadata !54), !dbg !327
  %288 = icmp slt i32 %286, %244, !dbg !327
  br i1 %288, label %scalar.ph, label %._crit_edge83, !dbg !327, !llvm.loop !333

._crit_edge83:                                    ; preds = %middle.block, %scalar.ph
  %289 = icmp slt i32 %261, %244, !dbg !325
  br i1 %289, label %.lr.ph82, label %.loopexit15, !dbg !325

; <label>:290                                     ; preds = %14
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str31, i64 0, i64 0)), !dbg !334
  br label %.critedge, !dbg !335

.loopexit15:                                      ; preds = %._crit_edge83, %.loopexit21, %._crit_edge68, %._crit_edge60, %._crit_edge52, %._crit_edge44, %._crit_edge36, %._crit_edge, %249, %202, %176, %150, %118, %96, %63
  %n.0 = phi i32 [ %58, %63 ], [ %91, %96 ], [ %113, %118 ], [ %145, %150 ], [ %171, %176 ], [ %197, %202 ], [ %244, %249 ], [ %17, %._crit_edge ], [ %58, %._crit_edge36 ], [ %91, %._crit_edge44 ], [ %113, %._crit_edge52 ], [ %145, %._crit_edge60 ], [ %171, %._crit_edge68 ], [ %197, %.loopexit21 ], [ %244, %._crit_edge83 ]
  %291 = load float** %x, align 8, !dbg !204, !tbaa !145
  store float 1.000000e+00, float* %291, align 4, !dbg !204, !tbaa !150
  %292 = icmp sgt i32 %n.0, 1, !dbg !205
  br i1 %292, label %293, label %.thread11, !dbg !205

; <label>:293                                     ; preds = %.loopexit15
  %294 = load float** %bt, align 8, !dbg !205, !tbaa !145
  store float 0.000000e+00, float* %294, align 4, !dbg !205, !tbaa !150
  %295 = icmp sgt i32 %n.0, 2, !dbg !336
  br i1 %295, label %.lr.ph, label %.thread11, !dbg !336

.lr.ph:                                           ; preds = %293
  tail call void @llvm.dbg.value(metadata !338, i64 0, metadata !51), !dbg !339
  tail call void @llvm.dbg.value(metadata !{float* %296}, i64 0, metadata !54), !dbg !339
  %296 = getelementptr inbounds float* %291, i64 2, !dbg !339
  %297 = add i32 %n.0, -3, !dbg !339
  %298 = zext i32 %297 to i64
  %299 = add i64 %298, 1, !dbg !339
  %end.idx239 = add i64 %298, 3, !dbg !339
  %n.vec241 = and i64 %299, 8589934590, !dbg !339
  %end.idx.rnd.down242 = add i64 %n.vec241, 2, !dbg !339
  %cmp.zero243 = icmp eq i64 %n.vec241, 0, !dbg !339
  %.sum = add i64 %n.vec241, 2
  %ptr.ind.end245 = getelementptr float* %291, i64 %.sum
  %300 = trunc i64 %end.idx.rnd.down242 to i32
  br i1 %cmp.zero243, label %middle.block236, label %vector.body235

vector.body235:                                   ; preds = %.lr.ph, %vector.body235
  %index238 = phi i64 [ %index.next249, %vector.body235 ], [ 2, %.lr.ph ], !dbg !339
  %next.gep252 = getelementptr float* %291, i64 %index238
  %next.gep252.sum = add i64 %index238, -2, !dbg !342
  %301 = getelementptr inbounds float* %291, i64 %next.gep252.sum, !dbg !342
  %302 = bitcast float* %301 to <2 x float>*, !dbg !342
  %wide.load = load <2 x float>* %302, align 4, !dbg !342
  %303 = fsub <2 x float> <float -0.000000e+00, float -0.000000e+00>, %wide.load, !dbg !342
  %304 = bitcast float* %next.gep252 to <2 x float>*, !dbg !342
  store <2 x float> %303, <2 x float>* %304, align 4, !dbg !342
  %index.next249 = add i64 %index238, 2, !dbg !339
  %305 = icmp eq i64 %index.next249, %end.idx.rnd.down242, !dbg !339
  br i1 %305, label %middle.block236, label %vector.body235, !dbg !339, !llvm.loop !343

middle.block236:                                  ; preds = %vector.body235, %.lr.ph
  %resume.val244 = phi float* [ %296, %.lr.ph ], [ %ptr.ind.end245, %vector.body235 ]
  %resume.val246 = phi i64 [ 2, %.lr.ph ], [ %end.idx.rnd.down242, %vector.body235 ]
  %trunc.resume.val247 = phi i32 [ 2, %.lr.ph ], [ %300, %vector.body235 ]
  %cmp.n248 = icmp eq i64 %end.idx239, %resume.val246
  br i1 %cmp.n248, label %.thread11, label %scalar.ph237

scalar.ph237:                                     ; preds = %middle.block236, %scalar.ph237
  %col.825 = phi float* [ %310, %scalar.ph237 ], [ %resume.val244, %middle.block236 ]
  %i.824 = phi i32 [ %309, %scalar.ph237 ], [ %trunc.resume.val247, %middle.block236 ]
  %306 = getelementptr inbounds float* %col.825, i64 -2, !dbg !342
  %307 = load float* %306, align 4, !dbg !342, !tbaa !150
  %308 = fsub float -0.000000e+00, %307, !dbg !342
  store float %308, float* %col.825, align 4, !dbg !342, !tbaa !150
  %309 = add nsw i32 %i.824, 1, !dbg !339
  tail call void @llvm.dbg.value(metadata !{i32 %309}, i64 0, metadata !51), !dbg !339
  %310 = getelementptr inbounds float* %col.825, i64 1, !dbg !339
  tail call void @llvm.dbg.value(metadata !{float* %310}, i64 0, metadata !54), !dbg !339
  %exitcond96 = icmp eq i32 %309, %n.0, !dbg !339
  br i1 %exitcond96, label %.thread11, label %scalar.ph237, !dbg !339, !llvm.loop !344

.thread11:                                        ; preds = %scalar.ph237, %middle.block236, %.loopexit15.thread, %.loopexit15, %.thread, %293
  %311 = phi float* [ %291, %293 ], [ %56, %.thread ], [ %291, %.loopexit15 ], [ %25, %.loopexit15.thread ], [ %291, %middle.block236 ], [ %291, %scalar.ph237 ]
  %n.010 = phi i32 [ 2, %293 ], [ 1, %.thread ], [ %n.0, %.loopexit15 ], [ %17, %.loopexit15.thread ], [ %n.0, %middle.block236 ], [ %n.0, %scalar.ph237 ]
  %312 = load float** %b, align 8, !dbg !345, !tbaa !145
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !347), !dbg !348
  tail call void @llvm.dbg.value(metadata !{float* %311}, i64 0, metadata !349), !dbg !350
  tail call void @llvm.dbg.value(metadata !{float* %312}, i64 0, metadata !351), !dbg !350
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !352), !dbg !353
  %313 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !354
  %314 = load i32* %313, align 4, !dbg !354, !tbaa !139
  %315 = icmp slt i32 %314, 1, !dbg !354
  br i1 %315, label %358, label %316, !dbg !354

; <label>:316                                     ; preds = %.thread11
  %317 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !354
  %318 = load i32* %317, align 4, !dbg !354, !tbaa !132
  %319 = icmp slt i32 %318, 1, !dbg !354
  br i1 %319, label %358, label %320, !dbg !354

; <label>:320                                     ; preds = %316
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !356), !dbg !357
  tail call void @llvm.dbg.value(metadata !{float* %311}, i64 0, metadata !361), !dbg !362
  tail call void @llvm.dbg.value(metadata !{float* %312}, i64 0, metadata !364), !dbg !362
  %321 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !362
  %322 = load float** %321, align 8, !dbg !362, !tbaa !145
  br label %328, !dbg !362

.preheader.i:                                     ; preds = %328
  %323 = icmp sgt i32 %314, 1, !dbg !365
  br i1 %323, label %.lr.ph7.i.preheader, label %.preheader, !dbg !365

.lr.ph7.i.preheader:                              ; preds = %.preheader.i
  %324 = add i32 %318, -1, !dbg !367
  %325 = zext i32 %324 to i64
  %326 = add i64 %325, 1, !dbg !367
  %327 = zext i32 %324 to i64
  %scevgep = getelementptr float* %312, i64 %327
  br label %.lr.ph7.i, !dbg !367

; <label>:328                                     ; preds = %328, %320
  %col.010.i = phi float* [ %322, %320 ], [ %334, %328 ]
  %pb.19.i = phi float* [ %312, %320 ], [ %333, %328 ]
  %i.18.i = phi i32 [ 0, %320 ], [ %332, %328 ]
  %329 = load float* %col.010.i, align 4, !dbg !370, !tbaa !150
  %330 = load float* %311, align 4, !dbg !370, !tbaa !150
  %331 = fmul float %329, %330, !dbg !370
  store float %331, float* %pb.19.i, align 4, !dbg !370, !tbaa !150
  %332 = add nsw i32 %i.18.i, 1, !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %332}, i64 0, metadata !356), !dbg !362
  %333 = getelementptr inbounds float* %pb.19.i, i64 1, !dbg !362
  tail call void @llvm.dbg.value(metadata !{float* %333}, i64 0, metadata !364), !dbg !362
  %334 = getelementptr inbounds float* %col.010.i, i64 1, !dbg !362
  tail call void @llvm.dbg.value(metadata !{float* %334}, i64 0, metadata !371), !dbg !362
  %exitcond95 = icmp eq i32 %332, %318, !dbg !362
  br i1 %exitcond95, label %.preheader.i, label %328, !dbg !362

.lr.ph7.i:                                        ; preds = %.lr.ph7.i.preheader, %._crit_edge.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %._crit_edge.i ], [ 1, %.lr.ph7.i.preheader ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !356), !dbg !367
  %335 = getelementptr inbounds float* %311, i64 %indvars.iv.i, !dbg !367
  tail call void @llvm.dbg.value(metadata !{float* %335}, i64 0, metadata !361), !dbg !367
  tail call void @llvm.dbg.value(metadata !{float* %312}, i64 0, metadata !364), !dbg !367
  %336 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.i, !dbg !367
  %337 = load float** %336, align 8, !dbg !367, !tbaa !145
  %end.idx267 = add i64 %325, 1, !dbg !367
  %n.vec269 = and i64 %326, 8589934588, !dbg !367
  %cmp.zero271 = icmp eq i64 %n.vec269, 0, !dbg !367
  br i1 %cmp.zero271, label %middle.block264, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph7.i
  %scevgep273 = getelementptr float* %337, i64 %327
  %bound1277 = icmp ule float* %335, %scevgep
  %bound0276 = icmp ule float* %312, %335
  %bound1 = icmp ule float* %337, %scevgep
  %bound0 = icmp ule float* %312, %scevgep273
  %found.conflict278 = and i1 %bound0276, %bound1277
  %found.conflict = and i1 %bound0, %bound1
  %conflict.rdx = or i1 %found.conflict, %found.conflict278
  %ptr.ind.end280 = getelementptr float* %337, i64 %n.vec269
  %ptr.ind.end282 = getelementptr float* %312, i64 %n.vec269
  %338 = trunc i64 %n.vec269 to i32
  br i1 %conflict.rdx, label %middle.block264, label %vector.body263

vector.body263:                                   ; preds = %vector.memcheck, %vector.body263
  %index266 = phi i64 [ %index.next286, %vector.body263 ], [ 0, %vector.memcheck ], !dbg !367
  %next.gep289 = getelementptr float* %337, i64 %index266
  %next.gep302 = getelementptr float* %312, i64 %index266
  %339 = bitcast float* %next.gep289 to <4 x float>*, !dbg !372
  %wide.load316 = load <4 x float>* %339, align 4, !dbg !372
  %340 = load float* %335, align 4, !dbg !372, !tbaa !150
  %341 = insertelement <4 x float> undef, float %340, i32 0, !dbg !372
  %342 = insertelement <4 x float> %341, float %340, i32 1, !dbg !372
  %343 = insertelement <4 x float> %342, float %340, i32 2, !dbg !372
  %344 = insertelement <4 x float> %343, float %340, i32 3, !dbg !372
  %345 = fmul <4 x float> %wide.load316, %344, !dbg !372
  %346 = bitcast float* %next.gep302 to <4 x float>*, !dbg !372
  %wide.load317 = load <4 x float>* %346, align 4, !dbg !372
  %347 = fadd <4 x float> %wide.load317, %345, !dbg !372
  %348 = bitcast float* %next.gep302 to <4 x float>*, !dbg !372
  store <4 x float> %347, <4 x float>* %348, align 4, !dbg !372
  %index.next286 = add i64 %index266, 4, !dbg !367
  %349 = icmp eq i64 %index.next286, %n.vec269, !dbg !367
  br i1 %349, label %middle.block264, label %vector.body263, !dbg !367, !llvm.loop !373

middle.block264:                                  ; preds = %vector.body263, %vector.memcheck, %.lr.ph7.i
  %resume.val279 = phi float* [ %337, %.lr.ph7.i ], [ %337, %vector.memcheck ], [ %ptr.ind.end280, %vector.body263 ]
  %resume.val281 = phi float* [ %312, %.lr.ph7.i ], [ %312, %vector.memcheck ], [ %ptr.ind.end282, %vector.body263 ]
  %resume.val283 = phi i64 [ 0, %.lr.ph7.i ], [ 0, %vector.memcheck ], [ %n.vec269, %vector.body263 ]
  %trunc.resume.val284 = phi i32 [ 0, %.lr.ph7.i ], [ 0, %vector.memcheck ], [ %338, %vector.body263 ]
  %cmp.n285 = icmp eq i64 %end.idx267, %resume.val283
  br i1 %cmp.n285, label %._crit_edge.i, label %scalar.ph265

scalar.ph265:                                     ; preds = %middle.block264, %scalar.ph265
  %col.15.i = phi float* [ %357, %scalar.ph265 ], [ %resume.val279, %middle.block264 ]
  %pb.24.i = phi float* [ %356, %scalar.ph265 ], [ %resume.val281, %middle.block264 ]
  %i.23.i = phi i32 [ %355, %scalar.ph265 ], [ %trunc.resume.val284, %middle.block264 ]
  %350 = load float* %col.15.i, align 4, !dbg !372, !tbaa !150
  %351 = load float* %335, align 4, !dbg !372, !tbaa !150
  %352 = fmul float %350, %351, !dbg !372
  %353 = load float* %pb.24.i, align 4, !dbg !372, !tbaa !150
  %354 = fadd float %353, %352, !dbg !372
  store float %354, float* %pb.24.i, align 4, !dbg !372, !tbaa !150
  %355 = add nsw i32 %i.23.i, 1, !dbg !367
  tail call void @llvm.dbg.value(metadata !{i32 %355}, i64 0, metadata !356), !dbg !367
  %356 = getelementptr inbounds float* %pb.24.i, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata !{float* %356}, i64 0, metadata !364), !dbg !367
  %357 = getelementptr inbounds float* %col.15.i, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata !{float* %357}, i64 0, metadata !371), !dbg !367
  %exitcond92 = icmp eq i32 %355, %318, !dbg !367
  br i1 %exitcond92, label %._crit_edge.i, label %scalar.ph265, !dbg !367, !llvm.loop !374

._crit_edge.i:                                    ; preds = %middle.block264, %scalar.ph265
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !365
  %lftr.wideiv93 = trunc i64 %indvars.iv.next.i to i32, !dbg !365
  %exitcond94 = icmp eq i32 %lftr.wideiv93, %314, !dbg !365
  br i1 %exitcond94, label %.preheader, label %.lr.ph7.i, !dbg !365

; <label>:358                                     ; preds = %316, %.thread11
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8]* @str30, i64 0, i64 0)), !dbg !375
  br label %.critedge, !dbg !377

.preheader:                                       ; preds = %._crit_edge.i, %.preheader.i
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !378), !dbg !381
  tail call void @llvm.dbg.value(metadata !{float* %311}, i64 0, metadata !382), !dbg !383
  tail call void @llvm.dbg.value(metadata !{float* %359}, i64 0, metadata !384), !dbg !383
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !385), !dbg !386
  %359 = load float** %bt, align 8, !dbg !379, !tbaa !145
  br label %360, !dbg !387

; <label>:360                                     ; preds = %._crit_edge18.i._crit_edge, %.preheader
  %361 = phi float* [ %.pre, %._crit_edge18.i._crit_edge ], [ %322, %.preheader ]
  %indvars.iv22.i = phi i64 [ %phitmp, %._crit_edge18.i._crit_edge ], [ 1, %.preheader ]
  %pb.020.i = phi float* [ %370, %._crit_edge18.i._crit_edge ], [ %359, %.preheader ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !390), !dbg !387
  tail call void @llvm.dbg.value(metadata !{float* %361}, i64 0, metadata !391), !dbg !387
  tail call void @llvm.dbg.value(metadata !{float* %311}, i64 0, metadata !392), !dbg !387
  store float 0.000000e+00, float* %pb.020.i, align 4, !dbg !387, !tbaa !150
  br label %.lr.ph17.i, !dbg !387

.lr.ph17.i:                                       ; preds = %.lr.ph17.i, %360
  %362 = phi float [ %366, %.lr.ph17.i ], [ 0.000000e+00, %360 ], !dbg !393
  %row.015.i = phi float* [ %369, %.lr.ph17.i ], [ %361, %360 ]
  %px.014.i = phi float* [ %368, %.lr.ph17.i ], [ %311, %360 ]
  %j.013.i = phi i32 [ %367, %.lr.ph17.i ], [ 0, %360 ]
  %363 = load float* %row.015.i, align 4, !dbg !393, !tbaa !150
  %364 = load float* %px.014.i, align 4, !dbg !393, !tbaa !150
  %365 = fmul float %363, %364, !dbg !393
  %366 = fadd float %362, %365, !dbg !393
  store float %366, float* %pb.020.i, align 4, !dbg !393, !tbaa !150
  %367 = add nsw i32 %j.013.i, 1, !dbg !387
  tail call void @llvm.dbg.value(metadata !{i32 %367}, i64 0, metadata !390), !dbg !387
  %368 = getelementptr inbounds float* %px.014.i, i64 1, !dbg !387
  tail call void @llvm.dbg.value(metadata !{float* %368}, i64 0, metadata !392), !dbg !387
  %369 = getelementptr inbounds float* %row.015.i, i64 1, !dbg !387
  tail call void @llvm.dbg.value(metadata !{float* %369}, i64 0, metadata !391), !dbg !387
  %exitcond = icmp eq i32 %367, %314, !dbg !387
  br i1 %exitcond, label %._crit_edge18.i, label %.lr.ph17.i, !dbg !387

._crit_edge18.i:                                  ; preds = %.lr.ph17.i
  tail call void @llvm.dbg.value(metadata !{float* %370}, i64 0, metadata !394), !dbg !395
  %lftr.wideiv = trunc i64 %indvars.iv22.i to i32, !dbg !395
  %exitcond91 = icmp eq i32 %lftr.wideiv, %318, !dbg !395
  br i1 %exitcond91, label %371, label %._crit_edge18.i._crit_edge, !dbg !395

._crit_edge18.i._crit_edge:                       ; preds = %._crit_edge18.i
  %370 = getelementptr inbounds float* %pb.020.i, i64 1, !dbg !395
  %.phi.trans.insert = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv22.i
  %.pre = load float** %.phi.trans.insert, align 8, !dbg !387, !tbaa !145
  %phitmp = add i64 %indvars.iv22.i, 1, !dbg !395
  br label %360, !dbg !395

; <label>:371                                     ; preds = %._crit_edge18.i
  %372 = icmp slt i32 %n.010, 8, !dbg !396
  br i1 %372, label %373, label %.critedge, !dbg !396

; <label>:373                                     ; preds = %371
  tail call void @matdump(%struct.FULL* %a, i8* getelementptr inbounds ([15 x i8]* @.str18, i64 0, i64 0)), !dbg !398
  %374 = load float** %x, align 8, !dbg !399, !tbaa !145
  tail call void @fvecdump(float* %374, i32 %n.010, i8* getelementptr inbounds ([9 x i8]* @.str19, i64 0, i64 0)), !dbg !399
  %375 = load float** %b, align 8, !dbg !402, !tbaa !145
  tail call void @fvecdump(float* %375, i32 %n.010, i8* getelementptr inbounds ([16 x i8]* @.str20, i64 0, i64 0)), !dbg !402
  %376 = load float** %bt, align 8, !dbg !403, !tbaa !145
  tail call void @fvecdump(float* %376, i32 %n.010, i8* getelementptr inbounds ([26 x i8]* @.str21, i64 0, i64 0)), !dbg !403
  br label %.critedge, !dbg !404

.critedge:                                        ; preds = %373, %371, %243, %196, %170, %144, %112, %90, %57, %46, %15, %358, %290
  %.0 = phi i32 [ 1, %290 ], [ 1, %358 ], [ 1, %15 ], [ 1, %46 ], [ 1, %57 ], [ 1, %90 ], [ 1, %112 ], [ 1, %144 ], [ 1, %170 ], [ 1, %196 ], [ 1, %243 ], [ 0, %371 ], [ 0, %373 ]
  ret i32 %.0, !dbg !405
}

declare void @free(...) #5

; Function Attrs: nounwind
declare double @pow(double, double) #3

; Function Attrs: nounwind uwtable
define i32 @get_space(%struct.FULL* nocapture %a, float** nocapture %x, float** nocapture %b, float** nocapture %bt, i32** nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !61), !dbg !406
  tail call void @llvm.dbg.value(metadata !{float** %x}, i64 0, metadata !62), !dbg !407
  tail call void @llvm.dbg.value(metadata !{float** %b}, i64 0, metadata !63), !dbg !407
  tail call void @llvm.dbg.value(metadata !{float** %bt}, i64 0, metadata !64), !dbg !407
  tail call void @llvm.dbg.value(metadata !{i32** %ipvt}, i64 0, metadata !65), !dbg !408
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !67), !dbg !409
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !409
  %2 = load i32* %1, align 4, !dbg !409, !tbaa !132
  %3 = icmp sgt i32 %2, 0, !dbg !409
  %4 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !411
  %5 = load i32* %4, align 4, !dbg !411, !tbaa !139
  %6 = sext i32 %5 to i64, !dbg !411
  %7 = shl nsw i64 %6, 2, !dbg !411
  %8 = tail call i8* (i64, ...)* bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %7) #2, !dbg !411
  %9 = bitcast i8* %8 to float*, !dbg !411
  br i1 %3, label %.lr.ph, label %._crit_edge, !dbg !409

; <label>:10                                      ; preds = %.lr.ph
  %11 = load i32* %1, align 4, !dbg !409, !tbaa !132
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !409
  %13 = icmp slt i32 %12, %11, !dbg !409
  %14 = load i32* %4, align 4, !dbg !411, !tbaa !139
  %15 = sext i32 %14 to i64, !dbg !411
  %16 = shl nsw i64 %15, 2, !dbg !411
  %17 = tail call i8* (i64, ...)* bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %16) #2, !dbg !411
  %18 = bitcast i8* %17 to float*, !dbg !411
  br i1 %13, label %.lr.ph, label %._crit_edge, !dbg !409

.lr.ph:                                           ; preds = %0, %10
  %indvars.iv = phi i64 [ %indvars.iv.next, %10 ], [ 0, %0 ]
  %19 = phi float* [ %18, %10 ], [ %9, %0 ]
  %20 = phi i8* [ %17, %10 ], [ %8, %0 ]
  %21 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv, !dbg !411
  store float* %19, float** %21, align 8, !dbg !411, !tbaa !145
  %22 = icmp eq i8* %20, null, !dbg !413
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !409
  br i1 %22, label %23, label %10, !dbg !413

; <label>:23                                      ; preds = %.lr.ph
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([51 x i8]* @str34, i64 0, i64 0)), !dbg !415
  br label %49, !dbg !417

._crit_edge:                                      ; preds = %10, %0
  %.lcssa3 = phi float* [ %9, %0 ], [ %18, %10 ]
  store float* %.lcssa3, float** %x, align 8, !dbg !418, !tbaa !145
  %24 = load i32* %4, align 4, !dbg !419, !tbaa !139
  %25 = sext i32 %24 to i64, !dbg !419
  %26 = shl nsw i64 %25, 2, !dbg !419
  %27 = tail call i8* (i64, ...)* bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %26) #2, !dbg !419
  %28 = bitcast i8* %27 to float*, !dbg !419
  store float* %28, float** %b, align 8, !dbg !419, !tbaa !145
  %29 = load i32* %4, align 4, !dbg !420, !tbaa !139
  %30 = sext i32 %29 to i64, !dbg !420
  %31 = shl nsw i64 %30, 2, !dbg !420
  %32 = tail call i8* (i64, ...)* bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %31) #2, !dbg !420
  %33 = bitcast i8* %32 to float*, !dbg !420
  store float* %33, float** %bt, align 8, !dbg !420, !tbaa !145
  %34 = load i32* %4, align 4, !dbg !421, !tbaa !139
  %35 = sext i32 %34 to i64, !dbg !421
  %36 = shl nsw i64 %35, 2, !dbg !421
  %37 = tail call i8* (i64, ...)* bitcast (i8* (...)* @malloc to i8* (i64, ...)*)(i64 %36) #2, !dbg !421
  %38 = bitcast i8* %37 to i32*, !dbg !421
  store i32* %38, i32** %ipvt, align 8, !dbg !421, !tbaa !145
  %39 = load float** %x, align 8, !dbg !422, !tbaa !145
  %40 = icmp eq float* %39, null, !dbg !422
  br i1 %40, label %48, label %41, !dbg !422

; <label>:41                                      ; preds = %._crit_edge
  %42 = load float** %b, align 8, !dbg !422, !tbaa !145
  %43 = icmp eq float* %42, null, !dbg !422
  br i1 %43, label %48, label %44, !dbg !422

; <label>:44                                      ; preds = %41
  %45 = load float** %bt, align 8, !dbg !422, !tbaa !145
  %46 = icmp eq float* %45, null, !dbg !422
  %47 = icmp eq i8* %37, null, !dbg !422
  %or.cond = or i1 %46, %47, !dbg !422
  br i1 %or.cond, label %48, label %49, !dbg !422

; <label>:48                                      ; preds = %44, %41, %._crit_edge
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([49 x i8]* @str33, i64 0, i64 0)), !dbg !424
  br label %49, !dbg !426

; <label>:49                                      ; preds = %44, %48, %23
  %.0 = phi i32 [ 1, %23 ], [ 1, %48 ], [ 0, %44 ]
  ret i32 %.0, !dbg !427
}

declare i8* @malloc(...) #5

; Function Attrs: nounwind uwtable
define i32 @matvec(%struct.FULL* nocapture readonly %a, float* nocapture readonly %x, float* nocapture %b, i32 %job) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !72), !dbg !428
  tail call void @llvm.dbg.value(metadata !{float* %x}, i64 0, metadata !73), !dbg !429
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !74), !dbg !429
  tail call void @llvm.dbg.value(metadata !{i32 %job}, i64 0, metadata !75), !dbg !430
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !431
  %2 = load i32* %1, align 4, !dbg !431, !tbaa !139
  %3 = icmp slt i32 %2, 1, !dbg !431
  br i1 %3, label %.loopexit, label %4, !dbg !431

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !431
  %6 = load i32* %5, align 4, !dbg !431, !tbaa !132
  %7 = icmp slt i32 %6, 1, !dbg !431
  br i1 %7, label %.loopexit, label %8, !dbg !431

; <label>:8                                       ; preds = %4
  %9 = icmp eq i32 %job, 0, !dbg !432
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !76), !dbg !433
  br i1 %9, label %.lr.ph12, label %.lr.ph21, !dbg !432

.lr.ph21:                                         ; preds = %8
  %10 = icmp sgt i32 %2, 0, !dbg !434
  br label %11, !dbg !433

; <label>:11                                      ; preds = %.lr.ph21, %._crit_edge18
  %indvars.iv22 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next23, %._crit_edge18 ]
  %pb.020 = phi float* [ %b, %.lr.ph21 ], [ %23, %._crit_edge18 ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !77), !dbg !434
  %12 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv22, !dbg !434
  %13 = load float** %12, align 8, !dbg !434, !tbaa !145
  tail call void @llvm.dbg.value(metadata !{float* %13}, i64 0, metadata !81), !dbg !434
  tail call void @llvm.dbg.value(metadata !{float* %x}, i64 0, metadata !78), !dbg !434
  store float 0.000000e+00, float* %pb.020, align 4, !dbg !434, !tbaa !150
  br i1 %10, label %.lr.ph17, label %._crit_edge18, !dbg !434

.lr.ph17:                                         ; preds = %11, %.lr.ph17
  %14 = phi float [ %18, %.lr.ph17 ], [ 0.000000e+00, %11 ], !dbg !435
  %row.015 = phi float* [ %21, %.lr.ph17 ], [ %13, %11 ]
  %px.014 = phi float* [ %20, %.lr.ph17 ], [ %x, %11 ]
  %j.013 = phi i32 [ %19, %.lr.ph17 ], [ 0, %11 ]
  %15 = load float* %row.015, align 4, !dbg !435, !tbaa !150
  %16 = load float* %px.014, align 4, !dbg !435, !tbaa !150
  %17 = fmul float %15, %16, !dbg !435
  %18 = fadd float %14, %17, !dbg !435
  store float %18, float* %pb.020, align 4, !dbg !435, !tbaa !150
  %19 = add nsw i32 %j.013, 1, !dbg !434
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !77), !dbg !434
  %20 = getelementptr inbounds float* %px.014, i64 1, !dbg !434
  tail call void @llvm.dbg.value(metadata !{float* %20}, i64 0, metadata !78), !dbg !434
  %21 = getelementptr inbounds float* %row.015, i64 1, !dbg !434
  tail call void @llvm.dbg.value(metadata !{float* %21}, i64 0, metadata !81), !dbg !434
  %22 = icmp slt i32 %19, %2, !dbg !434
  br i1 %22, label %.lr.ph17, label %._crit_edge18, !dbg !434

._crit_edge18:                                    ; preds = %.lr.ph17, %11
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !433
  %23 = getelementptr inbounds float* %pb.020, i64 1, !dbg !433
  tail call void @llvm.dbg.value(metadata !{float* %23}, i64 0, metadata !79), !dbg !433
  %24 = trunc i64 %indvars.iv.next23 to i32, !dbg !433
  %25 = icmp slt i32 %24, %6, !dbg !433
  br i1 %25, label %11, label %.loopexit, !dbg !433

.lr.ph12:                                         ; preds = %8
  tail call void @llvm.dbg.value(metadata !{float* %x}, i64 0, metadata !78), !dbg !436
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !79), !dbg !436
  tail call void @llvm.dbg.value(metadata !{float* %27}, i64 0, metadata !80), !dbg !436
  %26 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !436
  %27 = load float** %26, align 8, !dbg !436, !tbaa !145
  br label %33, !dbg !436

.preheader:                                       ; preds = %33
  %28 = icmp sgt i32 %2, 1, !dbg !437
  br i1 %28, label %.lr.ph7.preheader, label %.loopexit, !dbg !437

.lr.ph7.preheader:                                ; preds = %.preheader
  %29 = add i32 %6, -1, !dbg !438
  %30 = zext i32 %29 to i64
  %31 = add i64 %30, 1, !dbg !438
  %32 = zext i32 %29 to i64
  %scevgep = getelementptr float* %b, i64 %32
  br label %.lr.ph7, !dbg !438

; <label>:33                                      ; preds = %.lr.ph12, %33
  %col.010 = phi float* [ %27, %.lr.ph12 ], [ %39, %33 ]
  %pb.19 = phi float* [ %b, %.lr.ph12 ], [ %38, %33 ]
  %i.18 = phi i32 [ 0, %.lr.ph12 ], [ %37, %33 ]
  %34 = load float* %col.010, align 4, !dbg !439, !tbaa !150
  %35 = load float* %x, align 4, !dbg !439, !tbaa !150
  %36 = fmul float %34, %35, !dbg !439
  store float %36, float* %pb.19, align 4, !dbg !439, !tbaa !150
  %37 = add nsw i32 %i.18, 1, !dbg !436
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !76), !dbg !436
  %38 = getelementptr inbounds float* %pb.19, i64 1, !dbg !436
  tail call void @llvm.dbg.value(metadata !{float* %38}, i64 0, metadata !79), !dbg !436
  %39 = getelementptr inbounds float* %col.010, i64 1, !dbg !436
  tail call void @llvm.dbg.value(metadata !{float* %39}, i64 0, metadata !80), !dbg !436
  %40 = icmp slt i32 %37, %6, !dbg !436
  br i1 %40, label %33, label %.preheader, !dbg !436

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 1, %.lr.ph7.preheader ]
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !76), !dbg !438
  %41 = getelementptr inbounds float* %x, i64 %indvars.iv, !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %41}, i64 0, metadata !78), !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !79), !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %43}, i64 0, metadata !80), !dbg !438
  %42 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv, !dbg !438
  %43 = load float** %42, align 8, !dbg !438, !tbaa !145
  %end.idx = add i64 %30, 1, !dbg !438
  %n.vec = and i64 %31, 8589934588, !dbg !438
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !438
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph7
  %scevgep28 = getelementptr float* %43, i64 %32
  %bound132 = icmp ule float* %41, %scevgep
  %bound031 = icmp uge float* %41, %b
  %bound1 = icmp ule float* %43, %scevgep
  %bound0 = icmp uge float* %scevgep28, %b
  %found.conflict33 = and i1 %bound031, %bound132
  %found.conflict = and i1 %bound0, %bound1
  %conflict.rdx = or i1 %found.conflict, %found.conflict33
  %ptr.ind.end = getelementptr float* %43, i64 %n.vec
  %ptr.ind.end35 = getelementptr float* %b, i64 %n.vec
  %44 = trunc i64 %n.vec to i32
  br i1 %conflict.rdx, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ], !dbg !438
  %next.gep = getelementptr float* %43, i64 %index
  %next.gep48 = getelementptr float* %b, i64 %index
  %45 = bitcast float* %next.gep to <4 x float>*, !dbg !440
  %wide.load = load <4 x float>* %45, align 4, !dbg !440
  %46 = load float* %41, align 4, !dbg !440, !tbaa !150
  %47 = insertelement <4 x float> undef, float %46, i32 0, !dbg !440
  %48 = insertelement <4 x float> %47, float %46, i32 1, !dbg !440
  %49 = insertelement <4 x float> %48, float %46, i32 2, !dbg !440
  %50 = insertelement <4 x float> %49, float %46, i32 3, !dbg !440
  %51 = fmul <4 x float> %wide.load, %50, !dbg !440
  %52 = bitcast float* %next.gep48 to <4 x float>*, !dbg !440
  %wide.load59 = load <4 x float>* %52, align 4, !dbg !440
  %53 = fadd <4 x float> %wide.load59, %51, !dbg !440
  %54 = bitcast float* %next.gep48 to <4 x float>*, !dbg !440
  store <4 x float> %53, <4 x float>* %54, align 4, !dbg !440
  %index.next = add i64 %index, 4, !dbg !438
  %55 = icmp eq i64 %index.next, %n.vec, !dbg !438
  br i1 %55, label %middle.block, label %vector.body, !dbg !438, !llvm.loop !441

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph7
  %resume.val = phi float* [ %43, %.lr.ph7 ], [ %43, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val34 = phi float* [ %b, %.lr.ph7 ], [ %b, %vector.memcheck ], [ %ptr.ind.end35, %vector.body ]
  %resume.val36 = phi i64 [ 0, %.lr.ph7 ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph7 ], [ 0, %vector.memcheck ], [ %44, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val36
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %col.15 = phi float* [ %63, %scalar.ph ], [ %resume.val, %middle.block ]
  %pb.24 = phi float* [ %62, %scalar.ph ], [ %resume.val34, %middle.block ]
  %i.23 = phi i32 [ %61, %scalar.ph ], [ %trunc.resume.val, %middle.block ]
  %56 = load float* %col.15, align 4, !dbg !440, !tbaa !150
  %57 = load float* %41, align 4, !dbg !440, !tbaa !150
  %58 = fmul float %56, %57, !dbg !440
  %59 = load float* %pb.24, align 4, !dbg !440, !tbaa !150
  %60 = fadd float %59, %58, !dbg !440
  store float %60, float* %pb.24, align 4, !dbg !440, !tbaa !150
  %61 = add nsw i32 %i.23, 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !76), !dbg !438
  %62 = getelementptr inbounds float* %pb.24, i64 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %62}, i64 0, metadata !79), !dbg !438
  %63 = getelementptr inbounds float* %col.15, i64 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %63}, i64 0, metadata !80), !dbg !438
  %64 = icmp slt i32 %61, %6, !dbg !438
  br i1 %64, label %scalar.ph, label %._crit_edge, !dbg !438, !llvm.loop !442

._crit_edge:                                      ; preds = %middle.block, %scalar.ph
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !437
  %65 = trunc i64 %indvars.iv.next to i32, !dbg !437
  %66 = icmp slt i32 %65, %2, !dbg !437
  br i1 %66, label %.lr.ph7, label %.loopexit, !dbg !437

.loopexit:                                        ; preds = %._crit_edge18, %._crit_edge, %.preheader, %0, %4
  %.0 = phi i32 [ 1, %4 ], [ 1, %0 ], [ 0, %.preheader ], [ 0, %._crit_edge ], [ 0, %._crit_edge18 ]
  ret i32 %.0, !dbg !443
}

; Function Attrs: nounwind uwtable
define void @matdump(%struct.FULL* nocapture readonly %a, i8* nocapture readonly %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !88), !dbg !444
  tail call void @llvm.dbg.value(metadata !{i8* %head}, i64 0, metadata !89), !dbg !445
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !446
  %2 = load i32* %1, align 4, !dbg !446, !tbaa !139
  %3 = sdiv i32 %2, 6, !dbg !446
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !94), !dbg !446
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !95), !dbg !447
  %puts = tail call i32 @puts(i8* %head), !dbg !448
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !90), !dbg !449
  %4 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !449
  %5 = load i32* %4, align 4, !dbg !449, !tbaa !132
  %6 = icmp sgt i32 %5, 0, !dbg !449
  br i1 %6, label %.lr.ph13, label %._crit_edge14, !dbg !449

.lr.ph13:                                         ; preds = %0
  %7 = mul i32 %3, -6, !dbg !447
  %8 = add i32 %7, %2, !dbg !447
  %9 = icmp sgt i32 %2, 5, !dbg !451
  %10 = icmp sgt i32 %8, 0, !dbg !454
  %11 = icmp sgt i32 %2, 11
  %.op = mul i32 %3, 6, !dbg !449
  %12 = mul i32 %3, -6, !dbg !449
  %13 = add i32 %2, %12, !dbg !449
  br label %14, !dbg !449

; <label>:14                                      ; preds = %.lr.ph13, %._crit_edge
  %indvars.iv18 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next19, %._crit_edge ]
  %15 = trunc i64 %indvars.iv18 to i32, !dbg !456
  %16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str25, i64 0, i64 0), i32 %15) #2, !dbg !456
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !91), !dbg !457
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !92), !dbg !451
  br i1 %9, label %.lr.ph, label %.preheader3, !dbg !451

..preheader3_crit_edge:                           ; preds = %.preheader
  %17 = sext i32 %.op to i64, !dbg !451
  %phitmp = select i1 %11, i64 %17, i64 6, !dbg !451
  br label %.preheader3, !dbg !451

.preheader3:                                      ; preds = %..preheader3_crit_edge, %14
  %j.0.lcssa = phi i64 [ %phitmp, %..preheader3_crit_edge ], [ 0, %14 ]
  br i1 %10, label %.lr.ph10, label %._crit_edge, !dbg !454

.lr.ph:                                           ; preds = %14, %.preheader
  %j.07 = phi i64 [ %58, %.preheader ], [ 0, %14 ]
  %k.06 = phi i32 [ %59, %.preheader ], [ 0, %14 ]
  %18 = icmp eq i32 %k.06, 0, !dbg !458
  br i1 %18, label %.preheader, label %19, !dbg !458

; <label>:19                                      ; preds = %.lr.ph
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str26, i64 0, i64 0)) #2, !dbg !458
  br label %.preheader, !dbg !458

.preheader:                                       ; preds = %.lr.ph, %19
  %sext = shl i64 %j.07, 32
  %21 = ashr exact i64 %sext, 32
  %22 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %21, !dbg !461
  %23 = load float** %22, align 8, !dbg !461, !tbaa !145
  %24 = getelementptr inbounds float* %23, i64 %indvars.iv18, !dbg !461
  %25 = load float* %24, align 4, !dbg !461, !tbaa !150
  %26 = fpext float %25 to double, !dbg !461
  %27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %26) #2, !dbg !461
  %indvars.iv.next = add nsw i64 %21, 1, !dbg !463
  %28 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next, !dbg !461
  %29 = load float** %28, align 8, !dbg !461, !tbaa !145
  %30 = getelementptr inbounds float* %29, i64 %indvars.iv18, !dbg !461
  %31 = load float* %30, align 4, !dbg !461, !tbaa !150
  %32 = fpext float %31 to double, !dbg !461
  %33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %32) #2, !dbg !461
  %indvars.iv.next.1 = add nsw i64 %21, 2, !dbg !463
  %34 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next.1, !dbg !461
  %35 = load float** %34, align 8, !dbg !461, !tbaa !145
  %36 = getelementptr inbounds float* %35, i64 %indvars.iv18, !dbg !461
  %37 = load float* %36, align 4, !dbg !461, !tbaa !150
  %38 = fpext float %37 to double, !dbg !461
  %39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %38) #2, !dbg !461
  %indvars.iv.next.2 = add nsw i64 %21, 3, !dbg !463
  %40 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next.2, !dbg !461
  %41 = load float** %40, align 8, !dbg !461, !tbaa !145
  %42 = getelementptr inbounds float* %41, i64 %indvars.iv18, !dbg !461
  %43 = load float* %42, align 4, !dbg !461, !tbaa !150
  %44 = fpext float %43 to double, !dbg !461
  %45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %44) #2, !dbg !461
  %indvars.iv.next.3 = add nsw i64 %21, 4, !dbg !463
  %46 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next.3, !dbg !461
  %47 = load float** %46, align 8, !dbg !461, !tbaa !145
  %48 = getelementptr inbounds float* %47, i64 %indvars.iv18, !dbg !461
  %49 = load float* %48, align 4, !dbg !461, !tbaa !150
  %50 = fpext float %49 to double, !dbg !461
  %51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %50) #2, !dbg !461
  %indvars.iv.next.4 = add nsw i64 %21, 5, !dbg !463
  %52 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next.4, !dbg !461
  %53 = load float** %52, align 8, !dbg !461, !tbaa !145
  %54 = getelementptr inbounds float* %53, i64 %indvars.iv18, !dbg !461
  %55 = load float* %54, align 4, !dbg !461, !tbaa !150
  %56 = fpext float %55 to double, !dbg !461
  %57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %56) #2, !dbg !461
  %58 = add i64 %21, 6, !dbg !463
  %putchar2 = tail call i32 @putchar(i32 10) #2, !dbg !464
  %59 = add nsw i32 %k.06, 1, !dbg !451
  tail call void @llvm.dbg.value(metadata !{i32 %59}, i64 0, metadata !92), !dbg !451
  %60 = icmp slt i32 %59, %3, !dbg !451
  br i1 %60, label %.lr.ph, label %..preheader3_crit_edge, !dbg !451

.lr.ph10:                                         ; preds = %.preheader3, %.lr.ph10
  %indvars.iv = phi i64 [ %indvars.iv.next17, %.lr.ph10 ], [ %j.0.lcssa, %.preheader3 ]
  %jj.18 = phi i32 [ %67, %.lr.ph10 ], [ 0, %.preheader3 ]
  %61 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv, !dbg !465
  %62 = load float** %61, align 8, !dbg !465, !tbaa !145
  %63 = getelementptr inbounds float* %62, i64 %indvars.iv18, !dbg !465
  %64 = load float* %63, align 4, !dbg !465, !tbaa !150
  %65 = fpext float %64 to double, !dbg !465
  %66 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %65) #2, !dbg !465
  %67 = add nsw i32 %jj.18, 1, !dbg !454
  tail call void @llvm.dbg.value(metadata !{i32 %67}, i64 0, metadata !93), !dbg !454
  %indvars.iv.next17 = add nsw i64 %indvars.iv, 1, !dbg !454
  %exitcond = icmp eq i32 %67, %13, !dbg !454
  br i1 %exitcond, label %._crit_edge, label %.lr.ph10, !dbg !454

._crit_edge:                                      ; preds = %.lr.ph10, %.preheader3
  %putchar1 = tail call i32 @putchar(i32 10) #2, !dbg !466
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !449
  %68 = load i32* %4, align 4, !dbg !449, !tbaa !132
  %69 = trunc i64 %indvars.iv.next19 to i32, !dbg !449
  %70 = icmp slt i32 %69, %68, !dbg !449
  br i1 %70, label %14, label %._crit_edge14, !dbg !449

._crit_edge14:                                    ; preds = %._crit_edge, %0
  %putchar = tail call i32 @putchar(i32 10) #2, !dbg !467
  ret void, !dbg !468
}

; Function Attrs: nounwind uwtable
define void @fvecdump(float* nocapture readonly %vec, i32 %len, i8* nocapture readonly %head) #0 {
  tail call void @llvm.dbg.value(metadata !{float* %vec}, i64 0, metadata !100), !dbg !469
  tail call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !101), !dbg !470
  tail call void @llvm.dbg.value(metadata !{i8* %head}, i64 0, metadata !102), !dbg !471
  %1 = sdiv i32 %len, 6, !dbg !472
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !106), !dbg !472
  %2 = mul i32 %1, -6, !dbg !473
  %3 = add i32 %2, %len, !dbg !473
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !107), !dbg !473
  %puts = tail call i32 @puts(i8* %head), !dbg !474
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !105), !dbg !475
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !104), !dbg !476
  %4 = icmp sgt i32 %len, 5, !dbg !476
  br i1 %4, label %.lr.ph12, label %39, !dbg !476

.lr.ph12:                                         ; preds = %0
  %5 = icmp sgt i32 %1, 1
  %smax = select i1 %5, i32 %1, i32 1
  %6 = add i32 %smax, -1, !dbg !476
  %7 = zext i32 %6 to i64
  %8 = mul i64 %7, 6, !dbg !476
  %9 = add i64 %8, 6, !dbg !476
  %scevgep17 = getelementptr float* %vec, i64 %9
  br label %10, !dbg !476

; <label>:10                                      ; preds = %.lr.ph12, %10
  %.010 = phi float* [ %vec, %.lr.ph12 ], [ %scevgep, %10 ]
  %count.09 = phi i32 [ 0, %.lr.ph12 ], [ %12, %10 ]
  %j.08 = phi i32 [ 0, %.lr.ph12 ], [ %36, %10 ]
  %11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str25, i64 0, i64 0), i32 %count.09) #2, !dbg !478
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !103), !dbg !480
  %12 = add i32 %count.09, 6, !dbg !480
  %13 = load float* %.010, align 4, !dbg !482, !tbaa !150
  %14 = fpext float %13 to double, !dbg !482
  %15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %14) #2, !dbg !482
  %16 = getelementptr inbounds float* %.010, i64 1, !dbg !480
  tail call void @llvm.dbg.value(metadata !{float* %scevgep17}, i64 0, metadata !100), !dbg !480
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !105), !dbg !480
  %17 = load float* %16, align 4, !dbg !482, !tbaa !150
  %18 = fpext float %17 to double, !dbg !482
  %19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %18) #2, !dbg !482
  %20 = getelementptr inbounds float* %.010, i64 2, !dbg !480
  tail call void @llvm.dbg.value(metadata !{float* %scevgep17}, i64 0, metadata !100), !dbg !480
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !105), !dbg !480
  %21 = load float* %20, align 4, !dbg !482, !tbaa !150
  %22 = fpext float %21 to double, !dbg !482
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %22) #2, !dbg !482
  %24 = getelementptr inbounds float* %.010, i64 3, !dbg !480
  tail call void @llvm.dbg.value(metadata !{float* %scevgep17}, i64 0, metadata !100), !dbg !480
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !105), !dbg !480
  %25 = load float* %24, align 4, !dbg !482, !tbaa !150
  %26 = fpext float %25 to double, !dbg !482
  %27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %26) #2, !dbg !482
  %28 = getelementptr inbounds float* %.010, i64 4, !dbg !480
  tail call void @llvm.dbg.value(metadata !{float* %scevgep17}, i64 0, metadata !100), !dbg !480
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !105), !dbg !480
  %29 = load float* %28, align 4, !dbg !482, !tbaa !150
  %30 = fpext float %29 to double, !dbg !482
  %31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %30) #2, !dbg !482
  %32 = getelementptr inbounds float* %.010, i64 5, !dbg !480
  tail call void @llvm.dbg.value(metadata !{float* %scevgep17}, i64 0, metadata !100), !dbg !480
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !105), !dbg !480
  %33 = load float* %32, align 4, !dbg !482, !tbaa !150
  %34 = fpext float %33 to double, !dbg !482
  %35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %34) #2, !dbg !482
  tail call void @llvm.dbg.value(metadata !{float* %scevgep17}, i64 0, metadata !100), !dbg !480
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !105), !dbg !480
  %scevgep = getelementptr float* %.010, i64 6
  %putchar2 = tail call i32 @putchar(i32 10) #2, !dbg !483
  %36 = add nsw i32 %j.08, 1, !dbg !476
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !104), !dbg !476
  %37 = icmp slt i32 %36, %1, !dbg !476
  br i1 %37, label %10, label %._crit_edge13, !dbg !476

._crit_edge13:                                    ; preds = %10
  %38 = mul i32 %smax, 6, !dbg !476
  br label %39, !dbg !476

; <label>:39                                      ; preds = %._crit_edge13, %0
  %.0.lcssa = phi float* [ %scevgep17, %._crit_edge13 ], [ %vec, %0 ]
  %count.0.lcssa = phi i32 [ %38, %._crit_edge13 ], [ 0, %0 ]
  %40 = icmp eq i32 %3, 0, !dbg !484
  br i1 %40, label %52, label %41, !dbg !484

; <label>:41                                      ; preds = %39
  %42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str25, i64 0, i64 0), i32 %count.0.lcssa) #2, !dbg !486
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !103), !dbg !488
  %43 = icmp sgt i32 %3, 0, !dbg !488
  br i1 %43, label %.lr.ph, label %._crit_edge, !dbg !488

.lr.ph:                                           ; preds = %41
  %44 = mul i32 %1, -6, !dbg !488
  %45 = add i32 %44, %len, !dbg !488
  br label %46, !dbg !488

; <label>:46                                      ; preds = %46, %.lr.ph
  %.24 = phi float* [ %.0.lcssa, %.lr.ph ], [ %51, %46 ]
  %i.13 = phi i32 [ 0, %.lr.ph ], [ %50, %46 ]
  %47 = load float* %.24, align 4, !dbg !490, !tbaa !150
  %48 = fpext float %47 to double, !dbg !490
  %49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), double %48) #2, !dbg !490
  %50 = add nsw i32 %i.13, 1, !dbg !488
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !103), !dbg !488
  %51 = getelementptr inbounds float* %.24, i64 1, !dbg !488
  tail call void @llvm.dbg.value(metadata !{float* %51}, i64 0, metadata !100), !dbg !488
  %exitcond = icmp eq i32 %50, %45, !dbg !488
  br i1 %exitcond, label %._crit_edge, label %46, !dbg !488

._crit_edge:                                      ; preds = %46, %41
  %putchar1 = tail call i32 @putchar(i32 10) #2, !dbg !491
  br label %52, !dbg !492

; <label>:52                                      ; preds = %39, %._crit_edge
  %putchar = tail call i32 @putchar(i32 10) #2, !dbg !493
  ret void, !dbg !494
}

; Function Attrs: nounwind uwtable
define void @ivecdump(i32* nocapture readonly %vec, i32 %len, i8* nocapture readonly %head) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %vec}, i64 0, metadata !112), !dbg !495
  tail call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !113), !dbg !496
  tail call void @llvm.dbg.value(metadata !{i8* %head}, i64 0, metadata !114), !dbg !497
  %1 = sdiv i32 %len, 9, !dbg !498
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !118), !dbg !498
  %2 = mul i32 %1, -6, !dbg !499
  %3 = add i32 %2, %len, !dbg !499
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !119), !dbg !499
  %puts = tail call i32 @puts(i8* %head), !dbg !500
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !117), !dbg !501
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !116), !dbg !502
  %4 = icmp sgt i32 %len, 8, !dbg !502
  br i1 %4, label %.lr.ph12, label %42, !dbg !502

.lr.ph12:                                         ; preds = %0
  %5 = icmp sgt i32 %1, 1
  %smax = select i1 %5, i32 %1, i32 1
  %6 = add i32 %smax, -1, !dbg !502
  %7 = zext i32 %6 to i64
  %8 = mul i64 %7, 9, !dbg !502
  %9 = add i64 %8, 9, !dbg !502
  %scevgep17 = getelementptr i32* %vec, i64 %9
  br label %10, !dbg !502

; <label>:10                                      ; preds = %.lr.ph12, %10
  %.010 = phi i32* [ %vec, %.lr.ph12 ], [ %scevgep, %10 ]
  %count.09 = phi i32 [ 0, %.lr.ph12 ], [ %12, %10 ]
  %j.08 = phi i32 [ 0, %.lr.ph12 ], [ %39, %10 ]
  %11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str25, i64 0, i64 0), i32 %count.09) #2, !dbg !504
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !115), !dbg !506
  %12 = add i32 %count.09, 9, !dbg !506
  %13 = load i32* %.010, align 4, !dbg !508, !tbaa !509
  %14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %13) #2, !dbg !508
  %15 = getelementptr inbounds i32* %.010, i64 1, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %16 = load i32* %15, align 4, !dbg !508, !tbaa !509
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %16) #2, !dbg !508
  %18 = getelementptr inbounds i32* %.010, i64 2, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %19 = load i32* %18, align 4, !dbg !508, !tbaa !509
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %19) #2, !dbg !508
  %21 = getelementptr inbounds i32* %.010, i64 3, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %22 = load i32* %21, align 4, !dbg !508, !tbaa !509
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %22) #2, !dbg !508
  %24 = getelementptr inbounds i32* %.010, i64 4, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %25 = load i32* %24, align 4, !dbg !508, !tbaa !509
  %26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %25) #2, !dbg !508
  %27 = getelementptr inbounds i32* %.010, i64 5, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %28 = load i32* %27, align 4, !dbg !508, !tbaa !509
  %29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %28) #2, !dbg !508
  %30 = getelementptr inbounds i32* %.010, i64 6, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %31 = load i32* %30, align 4, !dbg !508, !tbaa !509
  %32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %31) #2, !dbg !508
  %33 = getelementptr inbounds i32* %.010, i64 7, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %34 = load i32* %33, align 4, !dbg !508, !tbaa !509
  %35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %34) #2, !dbg !508
  %36 = getelementptr inbounds i32* %.010, i64 8, !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %37 = load i32* %36, align 4, !dbg !508, !tbaa !509
  %38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %37) #2, !dbg !508
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep17}, i64 0, metadata !112), !dbg !506
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !117), !dbg !506
  %scevgep = getelementptr i32* %.010, i64 9
  %putchar2 = tail call i32 @putchar(i32 10) #2, !dbg !510
  %39 = add nsw i32 %j.08, 1, !dbg !502
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !116), !dbg !502
  %40 = icmp slt i32 %39, %1, !dbg !502
  br i1 %40, label %10, label %._crit_edge13, !dbg !502

._crit_edge13:                                    ; preds = %10
  %41 = mul i32 %smax, 9, !dbg !502
  br label %42, !dbg !502

; <label>:42                                      ; preds = %._crit_edge13, %0
  %.0.lcssa = phi i32* [ %scevgep17, %._crit_edge13 ], [ %vec, %0 ]
  %count.0.lcssa = phi i32 [ %41, %._crit_edge13 ], [ 0, %0 ]
  %43 = icmp eq i32 %3, 0, !dbg !511
  br i1 %43, label %54, label %44, !dbg !511

; <label>:44                                      ; preds = %42
  %45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str25, i64 0, i64 0), i32 %count.0.lcssa) #2, !dbg !513
  tail call void @llvm.dbg.value(metadata !126, i64 0, metadata !115), !dbg !515
  %46 = icmp sgt i32 %3, 0, !dbg !515
  br i1 %46, label %.lr.ph, label %._crit_edge, !dbg !515

.lr.ph:                                           ; preds = %44
  %47 = mul i32 %1, -6, !dbg !515
  %48 = add i32 %47, %len, !dbg !515
  br label %49, !dbg !515

; <label>:49                                      ; preds = %49, %.lr.ph
  %.24 = phi i32* [ %.0.lcssa, %.lr.ph ], [ %53, %49 ]
  %i.13 = phi i32 [ 0, %.lr.ph ], [ %52, %49 ]
  %50 = load i32* %.24, align 4, !dbg !517, !tbaa !509
  %51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str29, i64 0, i64 0), i32 %50) #2, !dbg !517
  %52 = add nsw i32 %i.13, 1, !dbg !515
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !115), !dbg !515
  %53 = getelementptr inbounds i32* %.24, i64 1, !dbg !515
  tail call void @llvm.dbg.value(metadata !{i32* %53}, i64 0, metadata !112), !dbg !515
  %exitcond = icmp eq i32 %52, %48, !dbg !515
  br i1 %exitcond, label %._crit_edge, label %49, !dbg !515

._crit_edge:                                      ; preds = %49, %44
  %putchar1 = tail call i32 @putchar(i32 10) #2, !dbg !518
  br label %54, !dbg !519

; <label>:54                                      ; preds = %42, %._crit_edge
  %putchar = tail call i32 @putchar(i32 10) #2, !dbg !520
  ret void, !dbg !521
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { cold nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!120, !121}
!llvm.ident = !{!122}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c] [DW_LANG_C99]
!1 = metadata !{metadata !"driver.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !37, metadata !57, metadata !68, metadata !82, metadata !96, metadata !108}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !9, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !11, metadata !12, metadata !13, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !33, metadata !35, metadata !36}
!10 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 20]
!11 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 20]
!12 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 20]
!13 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 21, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 21]
!14 = metadata !{i32 786451, metadata !15, null, metadata !"FULL", i32 31, i64 64064, i64 64, i32 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!15 = metadata !{metadata !"./ge.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!16 = metadata !{metadata !17, metadata !18, metadata !19}
!17 = metadata !{i32 786445, metadata !15, metadata !14, metadata !"cd", i32 32, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!18 = metadata !{i32 786445, metadata !15, metadata !14, metadata !"rd", i32 33, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!19 = metadata !{i32 786445, metadata !15, metadata !14, metadata !"pd", i32 34, i64 64000, i64 64, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!20 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64000, i64 64, i32 0, i32 0, metadata !21, metadata !23, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!22 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 1000}     ; [ DW_TAG_subrange_type ] [0, 999]
!25 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !5, i32 24, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 24]
!26 = metadata !{i32 786688, metadata !4, metadata !"bt", metadata !5, i32 24, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bt] [line 24]
!27 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 24, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 24]
!28 = metadata !{i32 786688, metadata !4, metadata !"anorm", metadata !5, i32 24, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [anorm] [line 24]
!29 = metadata !{i32 786688, metadata !4, metadata !"col", metadata !5, i32 24, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 24]
!30 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 24, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 24]
!31 = metadata !{i32 786688, metadata !4, metadata !"err", metadata !5, i32 25, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 25]
!32 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!33 = metadata !{i32 786688, metadata !4, metadata !"ipvt", metadata !5, i32 26, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ipvt] [line 26]
!34 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!35 = metadata !{i32 786688, metadata !4, metadata !"retval", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [retval] [line 26]
!36 = metadata !{i32 786688, metadata !4, metadata !"test_case", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [test_case] [line 26]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matgen", metadata !"matgen", metadata !"", i32 81, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, float**, float**, float**, i32**, i32, i32)* @matgen, null, null, metadata !43, i32 107} ; [ DW_TAG_subprogram ] [line 81] [def] [scope 107] [matgen]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !8, metadata !40, metadata !41, metadata !41, metadata !41, metadata !42, metadata !8, metadata !8}
!40 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!43 = metadata !{metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56}
!44 = metadata !{i32 786689, metadata !37, metadata !"a", metadata !5, i32 16777298, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 82]
!45 = metadata !{i32 786689, metadata !37, metadata !"x", metadata !5, i32 33554515, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 83]
!46 = metadata !{i32 786689, metadata !37, metadata !"b", metadata !5, i32 50331731, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 83]
!47 = metadata !{i32 786689, metadata !37, metadata !"bt", metadata !5, i32 67108947, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bt] [line 83]
!48 = metadata !{i32 786689, metadata !37, metadata !"ipvt", metadata !5, i32 83886164, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 84]
!49 = metadata !{i32 786689, metadata !37, metadata !"test_case", metadata !5, i32 100663380, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [test_case] [line 84]
!50 = metadata !{i32 786689, metadata !37, metadata !"scale", metadata !5, i32 117440596, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [scale] [line 84]
!51 = metadata !{i32 786688, metadata !37, metadata !"i", metadata !5, i32 108, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 108]
!52 = metadata !{i32 786688, metadata !37, metadata !"j", metadata !5, i32 108, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 108]
!53 = metadata !{i32 786688, metadata !37, metadata !"n", metadata !5, i32 109, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 109]
!54 = metadata !{i32 786688, metadata !37, metadata !"col", metadata !5, i32 110, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 110]
!55 = metadata !{i32 786688, metadata !37, metadata !"tl", metadata !5, i32 110, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tl] [line 110]
!56 = metadata !{i32 786688, metadata !37, metadata !"tu", metadata !5, i32 110, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tu] [line 110]
!57 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_space", metadata !"get_space", metadata !"", i32 315, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, float**, float**, float**, i32**)* @get_space, null, null, metadata !60, i32 322} ; [ DW_TAG_subprogram ] [line 315] [def] [scope 322] [get_space]
!58 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !8, metadata !40, metadata !41, metadata !41, metadata !41, metadata !42}
!60 = metadata !{metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67}
!61 = metadata !{i32 786689, metadata !57, metadata !"a", metadata !5, i32 16777532, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 316]
!62 = metadata !{i32 786689, metadata !57, metadata !"x", metadata !5, i32 33554749, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 317]
!63 = metadata !{i32 786689, metadata !57, metadata !"b", metadata !5, i32 50331965, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 317]
!64 = metadata !{i32 786689, metadata !57, metadata !"bt", metadata !5, i32 67109181, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bt] [line 317]
!65 = metadata !{i32 786689, metadata !57, metadata !"ipvt", metadata !5, i32 83886398, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 318]
!66 = metadata !{i32 786688, metadata !57, metadata !"i", metadata !5, i32 324, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 324]
!67 = metadata !{i32 786688, metadata !57, metadata !"j", metadata !5, i32 324, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 324]
!68 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matvec", metadata !"matvec", metadata !"", i32 345, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, float*, float*, i32)* @matvec, null, null, metadata !71, i32 358} ; [ DW_TAG_subprogram ] [line 345] [def] [scope 358] [matvec]
!69 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{metadata !8, metadata !40, metadata !21, metadata !21, metadata !8}
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81}
!72 = metadata !{i32 786689, metadata !68, metadata !"a", metadata !5, i32 16777562, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 346]
!73 = metadata !{i32 786689, metadata !68, metadata !"x", metadata !5, i32 33554779, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 347]
!74 = metadata !{i32 786689, metadata !68, metadata !"b", metadata !5, i32 50331995, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 347]
!75 = metadata !{i32 786689, metadata !68, metadata !"job", metadata !5, i32 67109212, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [job] [line 348]
!76 = metadata !{i32 786688, metadata !68, metadata !"i", metadata !5, i32 359, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 359]
!77 = metadata !{i32 786688, metadata !68, metadata !"j", metadata !5, i32 359, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 359]
!78 = metadata !{i32 786688, metadata !68, metadata !"px", metadata !5, i32 360, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [px] [line 360]
!79 = metadata !{i32 786688, metadata !68, metadata !"pb", metadata !5, i32 360, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pb] [line 360]
!80 = metadata !{i32 786688, metadata !68, metadata !"col", metadata !5, i32 360, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 360]
!81 = metadata !{i32 786688, metadata !68, metadata !"row", metadata !5, i32 360, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 360]
!82 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matdump", metadata !"matdump", metadata !"", i32 386, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (%struct.FULL*, i8*)* @matdump, null, null, metadata !87, i32 392} ; [ DW_TAG_subprogram ] [line 386] [def] [scope 392] [matdump]
!83 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{null, metadata !40, metadata !85}
!85 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!86 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!87 = metadata !{metadata !88, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !94, metadata !95}
!88 = metadata !{i32 786689, metadata !82, metadata !"a", metadata !5, i32 16777603, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 387]
!89 = metadata !{i32 786689, metadata !82, metadata !"head", metadata !5, i32 33554820, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 388]
!90 = metadata !{i32 786688, metadata !82, metadata !"i", metadata !5, i32 393, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 393]
!91 = metadata !{i32 786688, metadata !82, metadata !"j", metadata !5, i32 393, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 393]
!92 = metadata !{i32 786688, metadata !82, metadata !"k", metadata !5, i32 394, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 394]
!93 = metadata !{i32 786688, metadata !82, metadata !"jj", metadata !5, i32 394, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 394]
!94 = metadata !{i32 786688, metadata !82, metadata !"ncolmod", metadata !5, i32 394, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ncolmod] [line 394]
!95 = metadata !{i32 786688, metadata !82, metadata !"ncolrem", metadata !5, i32 394, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ncolrem] [line 394]
!96 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fvecdump", metadata !"fvecdump", metadata !"", i32 418, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (float*, i32, i8*)* @fvecdump, null, null, metadata !99, i32 426} ; [ DW_TAG_subprogram ] [line 418] [def] [scope 426] [fvecdump]
!97 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{null, metadata !21, metadata !8, metadata !85}
!99 = metadata !{metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !105, metadata !106, metadata !107}
!100 = metadata !{i32 786689, metadata !96, metadata !"vec", metadata !5, i32 16777635, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vec] [line 419]
!101 = metadata !{i32 786689, metadata !96, metadata !"len", metadata !5, i32 33554852, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 420]
!102 = metadata !{i32 786689, metadata !96, metadata !"head", metadata !5, i32 50332069, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 421]
!103 = metadata !{i32 786688, metadata !96, metadata !"i", metadata !5, i32 427, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 427]
!104 = metadata !{i32 786688, metadata !96, metadata !"j", metadata !5, i32 427, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 427]
!105 = metadata !{i32 786688, metadata !96, metadata !"count", metadata !5, i32 427, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 427]
!106 = metadata !{i32 786688, metadata !96, metadata !"lenmod", metadata !5, i32 428, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lenmod] [line 428]
!107 = metadata !{i32 786688, metadata !96, metadata !"lenrem", metadata !5, i32 428, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lenrem] [line 428]
!108 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ivecdump", metadata !"ivecdump", metadata !"", i32 451, metadata !109, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32*, i32, i8*)* @ivecdump, null, null, metadata !111, i32 459} ; [ DW_TAG_subprogram ] [line 451] [def] [scope 459] [ivecdump]
!109 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = metadata !{null, metadata !34, metadata !8, metadata !85}
!111 = metadata !{metadata !112, metadata !113, metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119}
!112 = metadata !{i32 786689, metadata !108, metadata !"vec", metadata !5, i32 16777668, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vec] [line 452]
!113 = metadata !{i32 786689, metadata !108, metadata !"len", metadata !5, i32 33554885, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 453]
!114 = metadata !{i32 786689, metadata !108, metadata !"head", metadata !5, i32 50332102, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 454]
!115 = metadata !{i32 786688, metadata !108, metadata !"i", metadata !5, i32 460, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 460]
!116 = metadata !{i32 786688, metadata !108, metadata !"j", metadata !5, i32 460, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 460]
!117 = metadata !{i32 786688, metadata !108, metadata !"count", metadata !5, i32 460, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 460]
!118 = metadata !{i32 786688, metadata !108, metadata !"lenmod", metadata !5, i32 461, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lenmod] [line 461]
!119 = metadata !{i32 786688, metadata !108, metadata !"lenrem", metadata !5, i32 461, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lenrem] [line 461]
!120 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!121 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!122 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!123 = metadata !{i32 21, i32 0, metadata !4, null}
!124 = metadata !{i32 24, i32 0, metadata !4, null}
!125 = metadata !{i32 26, i32 0, metadata !4, null}
!126 = metadata !{i32 0}
!127 = metadata !{i32 1}
!128 = metadata !{i32 31, i32 0, metadata !4, null}
!129 = metadata !{i32 34, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !131, i32 34, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!131 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!132 = metadata !{metadata !133, metadata !134, i64 4}
!133 = metadata !{metadata !"FULL", metadata !134, i64 0, metadata !134, i64 4, metadata !135, i64 8}
!134 = metadata !{metadata !"int", metadata !135, i64 0}
!135 = metadata !{metadata !"omnipotent char", metadata !136, i64 0}
!136 = metadata !{metadata !"Simple C/C++ TBAA"}
!137 = metadata !{i32 35, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !130, i32 34, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!139 = metadata !{metadata !133, metadata !134, i64 0}
!140 = metadata !{i32 39, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !131, i32 39, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!142 = metadata !{i32 40, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !144, i32 40, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!144 = metadata !{i32 786443, metadata !1, metadata !141, i32 39, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!145 = metadata !{metadata !146, metadata !146, i64 0}
!146 = metadata !{metadata !"any pointer", metadata !135, i64 0}
!147 = metadata !{i32 36, i32 0, metadata !138, null}
!148 = metadata !{float 0.000000e+00}
!149 = metadata !{i32 41, i32 0, metadata !143, null}
!150 = metadata !{metadata !151, metadata !151, i64 0}
!151 = metadata !{metadata !"float", metadata !135, i64 0}
!152 = metadata !{i32 42, i32 0, metadata !144, null}
!153 = metadata !{i32 44, i32 0, metadata !131, null}
!154 = metadata !{i32 48, i32 0, metadata !131, null}
!155 = metadata !{i32 51, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !131, i32 51, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!157 = metadata !{i32 55, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !156, i32 53, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!159 = metadata !{i32 56, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !158, i32 56, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!161 = metadata !{i32 57, i32 0, metadata !160, null}
!162 = metadata !{i32 58, i32 0, metadata !163, null} ; [ DW_TAG_imported_module ]
!163 = metadata !{i32 786443, metadata !1, metadata !158, i32 58, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!164 = metadata !{i32 59, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !163, i32 58, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!166 = metadata !{i32 60, i32 0, metadata !165, null}
!167 = metadata !{i32 62, i32 0, metadata !158, null}
!168 = metadata !{i32 61, i32 0, metadata !165, null}
!169 = metadata !{i32 63, i32 0, metadata !158, null}
!170 = metadata !{i32 68, i32 0, metadata !158, null}
!171 = metadata !{i32 69, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !158, i32 69, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!173 = metadata !{i32 70, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !172, i32 69, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!175 = metadata !{i32 72, i32 0, metadata !158, null}
!176 = metadata !{i32 71, i32 0, metadata !174, null}
!177 = metadata !{i32 73, i32 0, metadata !158, null}
!178 = metadata !{i32 78, i32 0, metadata !4, null}
!179 = metadata !{i32 79, i32 0, metadata !4, null}
!180 = metadata !{i32 82, i32 0, metadata !37, null}
!181 = metadata !{i32 83, i32 0, metadata !37, null}
!182 = metadata !{i32 84, i32 0, metadata !37, null}
!183 = metadata !{i32 114, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !37, i32 114, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!185 = metadata !{i32 115, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !184, i32 114, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!187 = metadata !{i32 116, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !186, i32 116, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!189 = metadata !{i32 117, i32 0, metadata !188, null}
!190 = metadata !{i32 118, i32 0, metadata !186, null}
!191 = metadata !{i32 119, i32 0, metadata !186, null}
!192 = metadata !{i32 120, i32 0, metadata !186, null}
!193 = metadata !{i32 121, i32 0, metadata !186, null}
!194 = metadata !{i32 124, i32 0, metadata !37, null}
!195 = metadata !{i32 128, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !37, i32 124, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!197 = metadata !{i32 129, i32 0, metadata !196, null}
!198 = metadata !{i32 130, i32 0, metadata !196, null}
!199 = metadata !{i32 132, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !196, i32 132, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!201 = metadata !{i32 135, i32 0, metadata !196, null}
!202 = metadata !{i32 136, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !196, i32 136, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!204 = metadata !{i32 287, i32 0, metadata !37, null}
!205 = metadata !{i32 288, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !1, metadata !37, i32 288, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!207 = metadata !{i32 137, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !209, i32 137, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!209 = metadata !{i32 786443, metadata !1, metadata !203, i32 136, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!210 = metadata !{i32 139, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !212, i32 139, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!212 = metadata !{i32 786443, metadata !1, metadata !208, i32 137, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!213 = metadata !{i32 138, i32 0, metadata !212, null}
!214 = metadata !{i32 146, i32 0, metadata !196, null}
!215 = metadata !{i32 147, i32 0, metadata !196, null}
!216 = metadata !{i32 148, i32 0, metadata !196, null}
!217 = metadata !{i32 150, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !196, i32 150, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!219 = metadata !{i32 153, i32 0, metadata !196, null}
!220 = metadata !{i32 154, i32 0, metadata !196, null}
!221 = metadata !{i32 160, i32 0, metadata !196, null}
!222 = metadata !{i32 161, i32 0, metadata !196, null}
!223 = metadata !{i32 162, i32 0, metadata !196, null}
!224 = metadata !{i32 164, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !196, i32 164, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!226 = metadata !{i32 167, i32 0, metadata !196, null}
!227 = metadata !{float 1.000000e+00}
!228 = metadata !{i32 168, i32 0, metadata !196, null}
!229 = metadata !{i32 169, i32 0, metadata !196, null}
!230 = metadata !{i32 170, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !196, i32 170, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!232 = metadata !{i32 171, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !196, i32 171, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!234 = metadata !{float 1.000000e+02}
!235 = metadata !{i32 172, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !196, i32 172, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!237 = metadata !{i32 173, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !239, i32 173, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!239 = metadata !{i32 786443, metadata !1, metadata !236, i32 172, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!240 = metadata !{i32 176, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !242, i32 176, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!242 = metadata !{i32 786443, metadata !1, metadata !243, i32 175, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!243 = metadata !{i32 786443, metadata !1, metadata !238, i32 173, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!244 = metadata !{i32 177, i32 0, metadata !245, null}
!245 = metadata !{i32 786443, metadata !1, metadata !241, i32 177, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!246 = metadata !{i32 174, i32 0, metadata !243, null}
!247 = metadata !{i32 175, i32 0, metadata !242, null}
!248 = metadata !{i32 183, i32 0, metadata !196, null}
!249 = metadata !{i32 184, i32 0, metadata !196, null}
!250 = metadata !{i32 185, i32 0, metadata !196, null}
!251 = metadata !{i32 187, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !196, i32 187, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!253 = metadata !{i32 190, i32 0, metadata !196, null}
!254 = metadata !{i32 191, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !196, i32 191, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!256 = metadata !{i32 192, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !258, i32 192, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!258 = metadata !{i32 786443, metadata !1, metadata !255, i32 191, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!259 = metadata !{i32 193, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !257, i32 192, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!261 = metadata !{i32 199, i32 0, metadata !196, null}
!262 = metadata !{i32 200, i32 0, metadata !196, null}
!263 = metadata !{i32 201, i32 0, metadata !196, null}
!264 = metadata !{i32 203, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !196, i32 203, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!266 = metadata !{i32 206, i32 0, metadata !196, null}
!267 = metadata !{i32 207, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !196, i32 207, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!269 = metadata !{i32 208, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !271, i32 208, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!271 = metadata !{i32 786443, metadata !1, metadata !268, i32 207, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!272 = metadata !{i32 209, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !270, i32 208, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!274 = metadata !{i32 210, i32 0, metadata !273, null}
!275 = metadata !{i32 211, i32 0, metadata !273, null}
!276 = metadata !{metadata !276, metadata !277, metadata !278}
!277 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!278 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!279 = metadata !{metadata !279, metadata !277, metadata !278}
!280 = metadata !{i32 217, i32 0, metadata !196, null}
!281 = metadata !{i32 218, i32 0, metadata !196, null}
!282 = metadata !{i32 219, i32 0, metadata !196, null}
!283 = metadata !{i32 221, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !196, i32 221, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!285 = metadata !{i32 224, i32 0, metadata !196, null}
!286 = metadata !{i32 225, i32 0, metadata !287, null}
!287 = metadata !{i32 786443, metadata !1, metadata !196, i32 225, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!288 = metadata !{i32 226, i32 0, metadata !289, null}
!289 = metadata !{i32 786443, metadata !1, metadata !287, i32 226, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!290 = metadata !{i32 227, i32 0, metadata !289, null}
!291 = metadata !{i32 231, i32 0, metadata !196, null}
!292 = metadata !{i32 232, i32 0, metadata !196, null}
!293 = metadata !{i32 233, i32 0, metadata !196, null}
!294 = metadata !{i32 235, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !196, i32 235, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!296 = metadata !{i32 238, i32 0, metadata !196, null}
!297 = metadata !{i32 239, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !196, i32 239, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!299 = metadata !{i32 240, i32 0, metadata !300, null}
!300 = metadata !{i32 786443, metadata !1, metadata !298, i32 240, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!301 = metadata !{i32 241, i32 0, metadata !300, null}
!302 = metadata !{i32 245, i32 0, metadata !196, null}
!303 = metadata !{i32 246, i32 0, metadata !196, null}
!304 = metadata !{i32 247, i32 0, metadata !196, null}
!305 = metadata !{i32 249, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !196, i32 249, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!307 = metadata !{i32 252, i32 0, metadata !196, null}
!308 = metadata !{i32 253, i32 0, metadata !196, null}
!309 = metadata !{i32 254, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !196, i32 254, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!311 = metadata !{i32 257, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !313, i32 255, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!313 = metadata !{i32 786443, metadata !1, metadata !310, i32 255, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!314 = metadata !{i32 255, i32 0, metadata !313, null}
!315 = metadata !{i32 256, i32 0, metadata !312, null}
!316 = metadata !{metadata !316, metadata !277, metadata !278}
!317 = metadata !{metadata !317, metadata !277, metadata !278}
!318 = metadata !{i32 262, i32 0, metadata !196, null}
!319 = metadata !{i32 263, i32 0, metadata !196, null}
!320 = metadata !{i32 264, i32 0, metadata !196, null}
!321 = metadata !{i32 266, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !196, i32 266, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!323 = metadata !{i32 270, i32 0, metadata !196, null}
!324 = metadata !{i32 271, i32 0, metadata !196, null}
!325 = metadata !{i32 272, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !196, i32 272, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!327 = metadata !{i32 273, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !326, i32 273, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!329 = metadata !{i32 274, i32 0, metadata !330, null}
!330 = metadata !{i32 786443, metadata !1, metadata !328, i32 273, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!331 = metadata !{i32 275, i32 0, metadata !330, null}
!332 = metadata !{metadata !332, metadata !277, metadata !278}
!333 = metadata !{metadata !333, metadata !277, metadata !278}
!334 = metadata !{i32 280, i32 0, metadata !196, null}
!335 = metadata !{i32 281, i32 0, metadata !196, null}
!336 = metadata !{i32 289, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !1, metadata !37, i32 289, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!338 = metadata !{i32 2}
!339 = metadata !{i32 290, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !341, i32 290, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!341 = metadata !{i32 786443, metadata !1, metadata !337, i32 289, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!342 = metadata !{i32 291, i32 0, metadata !340, null}
!343 = metadata !{metadata !343, metadata !277, metadata !278}
!344 = metadata !{metadata !344, metadata !277, metadata !278}
!345 = metadata !{i32 295, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !37, i32 295, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!347 = metadata !{i32 786689, metadata !68, metadata !"a", metadata !5, i32 16777562, metadata !40, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [a] [line 346]
!348 = metadata !{i32 346, i32 0, metadata !68, metadata !345}
!349 = metadata !{i32 786689, metadata !68, metadata !"x", metadata !5, i32 33554779, metadata !21, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [x] [line 347]
!350 = metadata !{i32 347, i32 0, metadata !68, metadata !345}
!351 = metadata !{i32 786689, metadata !68, metadata !"b", metadata !5, i32 50331995, metadata !21, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [b] [line 347]
!352 = metadata !{i32 786689, metadata !68, metadata !"job", metadata !5, i32 67109212, metadata !8, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [job] [line 348]
!353 = metadata !{i32 348, i32 0, metadata !68, metadata !345}
!354 = metadata !{i32 363, i32 0, metadata !355, metadata !345}
!355 = metadata !{i32 786443, metadata !1, metadata !68, i32 363, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!356 = metadata !{i32 786688, metadata !68, metadata !"i", metadata !5, i32 359, metadata !8, i32 0, metadata !345} ; [ DW_TAG_auto_variable ] [i] [line 359]
!357 = metadata !{i32 368, i32 0, metadata !358, metadata !345}
!358 = metadata !{i32 786443, metadata !1, metadata !359, i32 368, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!359 = metadata !{i32 786443, metadata !1, metadata !360, i32 366, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!360 = metadata !{i32 786443, metadata !1, metadata !68, i32 366, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!361 = metadata !{i32 786688, metadata !68, metadata !"px", metadata !5, i32 360, metadata !21, i32 0, metadata !345} ; [ DW_TAG_auto_variable ] [px] [line 360]
!362 = metadata !{i32 377, i32 0, metadata !363, metadata !345}
!363 = metadata !{i32 786443, metadata !1, metadata !68, i32 377, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!364 = metadata !{i32 786688, metadata !68, metadata !"pb", metadata !5, i32 360, metadata !21, i32 0, metadata !345} ; [ DW_TAG_auto_variable ] [pb] [line 360]
!365 = metadata !{i32 379, i32 0, metadata !366, metadata !345}
!366 = metadata !{i32 786443, metadata !1, metadata !68, i32 379, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!367 = metadata !{i32 380, i32 0, metadata !368, metadata !345}
!368 = metadata !{i32 786443, metadata !1, metadata !369, i32 380, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!369 = metadata !{i32 786443, metadata !1, metadata !366, i32 379, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!370 = metadata !{i32 378, i32 0, metadata !363, metadata !345}
!371 = metadata !{i32 786688, metadata !68, metadata !"col", metadata !5, i32 360, metadata !21, i32 0, metadata !345} ; [ DW_TAG_auto_variable ] [col] [line 360]
!372 = metadata !{i32 381, i32 0, metadata !368, metadata !345}
!373 = metadata !{metadata !373, metadata !277, metadata !278}
!374 = metadata !{metadata !374, metadata !277, metadata !278}
!375 = metadata !{i32 296, i32 0, metadata !376, null}
!376 = metadata !{i32 786443, metadata !1, metadata !346, i32 295, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!377 = metadata !{i32 297, i32 0, metadata !376, null}
!378 = metadata !{i32 786689, metadata !68, metadata !"a", metadata !5, i32 16777562, metadata !40, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [a] [line 346]
!379 = metadata !{i32 301, i32 0, metadata !380, null}
!380 = metadata !{i32 786443, metadata !1, metadata !37, i32 301, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!381 = metadata !{i32 346, i32 0, metadata !68, metadata !379}
!382 = metadata !{i32 786689, metadata !68, metadata !"x", metadata !5, i32 33554779, metadata !21, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [x] [line 347]
!383 = metadata !{i32 347, i32 0, metadata !68, metadata !379}
!384 = metadata !{i32 786689, metadata !68, metadata !"b", metadata !5, i32 50331995, metadata !21, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [b] [line 347]
!385 = metadata !{i32 786689, metadata !68, metadata !"job", metadata !5, i32 67109212, metadata !8, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [job] [line 348]
!386 = metadata !{i32 348, i32 0, metadata !68, metadata !379}
!387 = metadata !{i32 369, i32 0, metadata !388, metadata !379}
!388 = metadata !{i32 786443, metadata !1, metadata !389, i32 369, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!389 = metadata !{i32 786443, metadata !1, metadata !358, i32 368, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!390 = metadata !{i32 786688, metadata !68, metadata !"j", metadata !5, i32 359, metadata !8, i32 0, metadata !379} ; [ DW_TAG_auto_variable ] [j] [line 359]
!391 = metadata !{i32 786688, metadata !68, metadata !"row", metadata !5, i32 360, metadata !21, i32 0, metadata !379} ; [ DW_TAG_auto_variable ] [row] [line 360]
!392 = metadata !{i32 786688, metadata !68, metadata !"px", metadata !5, i32 360, metadata !21, i32 0, metadata !379} ; [ DW_TAG_auto_variable ] [px] [line 360]
!393 = metadata !{i32 370, i32 0, metadata !388, metadata !379}
!394 = metadata !{i32 786688, metadata !68, metadata !"pb", metadata !5, i32 360, metadata !21, i32 0, metadata !379} ; [ DW_TAG_auto_variable ] [pb] [line 360]
!395 = metadata !{i32 368, i32 0, metadata !358, metadata !379}
!396 = metadata !{i32 305, i32 0, metadata !397, null}
!397 = metadata !{i32 786443, metadata !1, metadata !37, i32 305, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!398 = metadata !{i32 306, i32 0, metadata !397, null}
!399 = metadata !{i32 308, i32 0, metadata !400, null}
!400 = metadata !{i32 786443, metadata !1, metadata !401, i32 307, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!401 = metadata !{i32 786443, metadata !1, metadata !37, i32 307, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!402 = metadata !{i32 309, i32 0, metadata !400, null}
!403 = metadata !{i32 310, i32 0, metadata !400, null}
!404 = metadata !{i32 311, i32 0, metadata !400, null}
!405 = metadata !{i32 313, i32 0, metadata !37, null}
!406 = metadata !{i32 316, i32 0, metadata !57, null}
!407 = metadata !{i32 317, i32 0, metadata !57, null}
!408 = metadata !{i32 318, i32 0, metadata !57, null}
!409 = metadata !{i32 327, i32 0, metadata !410, null}
!410 = metadata !{i32 786443, metadata !1, metadata !57, i32 327, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!411 = metadata !{i32 328, i32 0, metadata !412, null}
!412 = metadata !{i32 786443, metadata !1, metadata !410, i32 327, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!413 = metadata !{i32 329, i32 0, metadata !414, null}
!414 = metadata !{i32 786443, metadata !1, metadata !412, i32 329, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!415 = metadata !{i32 330, i32 0, metadata !416, null}
!416 = metadata !{i32 786443, metadata !1, metadata !414, i32 329, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!417 = metadata !{i32 331, i32 0, metadata !416, null}
!418 = metadata !{i32 334, i32 0, metadata !57, null}
!419 = metadata !{i32 335, i32 0, metadata !57, null}
!420 = metadata !{i32 336, i32 0, metadata !57, null}
!421 = metadata !{i32 337, i32 0, metadata !57, null}
!422 = metadata !{i32 338, i32 0, metadata !423, null}
!423 = metadata !{i32 786443, metadata !1, metadata !57, i32 338, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!424 = metadata !{i32 339, i32 0, metadata !425, null}
!425 = metadata !{i32 786443, metadata !1, metadata !423, i32 338, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!426 = metadata !{i32 340, i32 0, metadata !425, null}
!427 = metadata !{i32 343, i32 0, metadata !57, null}
!428 = metadata !{i32 346, i32 0, metadata !68, null}
!429 = metadata !{i32 347, i32 0, metadata !68, null}
!430 = metadata !{i32 348, i32 0, metadata !68, null}
!431 = metadata !{i32 363, i32 0, metadata !355, null}
!432 = metadata !{i32 366, i32 0, metadata !360, null}
!433 = metadata !{i32 368, i32 0, metadata !358, null}
!434 = metadata !{i32 369, i32 0, metadata !388, null}
!435 = metadata !{i32 370, i32 0, metadata !388, null}
!436 = metadata !{i32 377, i32 0, metadata !363, null}
!437 = metadata !{i32 379, i32 0, metadata !366, null}
!438 = metadata !{i32 380, i32 0, metadata !368, null}
!439 = metadata !{i32 378, i32 0, metadata !363, null}
!440 = metadata !{i32 381, i32 0, metadata !368, null}
!441 = metadata !{metadata !441, metadata !277, metadata !278}
!442 = metadata !{metadata !442, metadata !277, metadata !278}
!443 = metadata !{i32 384, i32 0, metadata !68, null}
!444 = metadata !{i32 387, i32 0, metadata !82, null}
!445 = metadata !{i32 388, i32 0, metadata !82, null}
!446 = metadata !{i32 396, i32 0, metadata !82, null}
!447 = metadata !{i32 397, i32 0, metadata !82, null}
!448 = metadata !{i32 399, i32 0, metadata !82, null}
!449 = metadata !{i32 400, i32 0, metadata !450, null}
!450 = metadata !{i32 786443, metadata !1, metadata !82, i32 400, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!451 = metadata !{i32 403, i32 0, metadata !452, null}
!452 = metadata !{i32 786443, metadata !1, metadata !453, i32 403, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!453 = metadata !{i32 786443, metadata !1, metadata !450, i32 400, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!454 = metadata !{i32 411, i32 0, metadata !455, null}
!455 = metadata !{i32 786443, metadata !1, metadata !453, i32 411, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!456 = metadata !{i32 401, i32 0, metadata !453, null}
!457 = metadata !{i32 402, i32 0, metadata !453, null}
!458 = metadata !{i32 404, i32 0, metadata !459, null}
!459 = metadata !{i32 786443, metadata !1, metadata !460, i32 404, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!460 = metadata !{i32 786443, metadata !1, metadata !452, i32 403, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!461 = metadata !{i32 406, i32 0, metadata !462, null}
!462 = metadata !{i32 786443, metadata !1, metadata !460, i32 405, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!463 = metadata !{i32 405, i32 0, metadata !462, null}
!464 = metadata !{i32 407, i32 0, metadata !460, null}
!465 = metadata !{i32 412, i32 0, metadata !455, null}
!466 = metadata !{i32 413, i32 0, metadata !453, null}
!467 = metadata !{i32 415, i32 0, metadata !82, null}
!468 = metadata !{i32 416, i32 0, metadata !82, null}
!469 = metadata !{i32 419, i32 0, metadata !96, null}
!470 = metadata !{i32 420, i32 0, metadata !96, null}
!471 = metadata !{i32 421, i32 0, metadata !96, null}
!472 = metadata !{i32 430, i32 0, metadata !96, null}
!473 = metadata !{i32 431, i32 0, metadata !96, null}
!474 = metadata !{i32 433, i32 0, metadata !96, null}
!475 = metadata !{i32 434, i32 0, metadata !96, null}
!476 = metadata !{i32 435, i32 0, metadata !477, null}
!477 = metadata !{i32 786443, metadata !1, metadata !96, i32 435, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!478 = metadata !{i32 436, i32 0, metadata !479, null}
!479 = metadata !{i32 786443, metadata !1, metadata !477, i32 435, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!480 = metadata !{i32 437, i32 0, metadata !481, null}
!481 = metadata !{i32 786443, metadata !1, metadata !479, i32 437, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!482 = metadata !{i32 438, i32 0, metadata !481, null}
!483 = metadata !{i32 439, i32 0, metadata !479, null}
!484 = metadata !{i32 442, i32 0, metadata !485, null}
!485 = metadata !{i32 786443, metadata !1, metadata !96, i32 442, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!486 = metadata !{i32 443, i32 0, metadata !487, null}
!487 = metadata !{i32 786443, metadata !1, metadata !485, i32 442, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!488 = metadata !{i32 444, i32 0, metadata !489, null}
!489 = metadata !{i32 786443, metadata !1, metadata !487, i32 444, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!490 = metadata !{i32 445, i32 0, metadata !489, null}
!491 = metadata !{i32 446, i32 0, metadata !487, null}
!492 = metadata !{i32 447, i32 0, metadata !487, null}
!493 = metadata !{i32 448, i32 0, metadata !96, null}
!494 = metadata !{i32 449, i32 0, metadata !96, null}
!495 = metadata !{i32 452, i32 0, metadata !108, null}
!496 = metadata !{i32 453, i32 0, metadata !108, null}
!497 = metadata !{i32 454, i32 0, metadata !108, null}
!498 = metadata !{i32 463, i32 0, metadata !108, null}
!499 = metadata !{i32 464, i32 0, metadata !108, null}
!500 = metadata !{i32 466, i32 0, metadata !108, null}
!501 = metadata !{i32 467, i32 0, metadata !108, null}
!502 = metadata !{i32 468, i32 0, metadata !503, null}
!503 = metadata !{i32 786443, metadata !1, metadata !108, i32 468, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!504 = metadata !{i32 469, i32 0, metadata !505, null}
!505 = metadata !{i32 786443, metadata !1, metadata !503, i32 468, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!506 = metadata !{i32 470, i32 0, metadata !507, null}
!507 = metadata !{i32 786443, metadata !1, metadata !505, i32 470, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!508 = metadata !{i32 471, i32 0, metadata !507, null}
!509 = metadata !{metadata !134, metadata !134, i64 0}
!510 = metadata !{i32 472, i32 0, metadata !505, null}
!511 = metadata !{i32 475, i32 0, metadata !512, null}
!512 = metadata !{i32 786443, metadata !1, metadata !108, i32 475, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!513 = metadata !{i32 476, i32 0, metadata !514, null}
!514 = metadata !{i32 786443, metadata !1, metadata !512, i32 475, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!515 = metadata !{i32 477, i32 0, metadata !516, null}
!516 = metadata !{i32 786443, metadata !1, metadata !514, i32 477, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/driver.c]
!517 = metadata !{i32 478, i32 0, metadata !516, null}
!518 = metadata !{i32 479, i32 0, metadata !514, null}
!519 = metadata !{i32 480, i32 0, metadata !514, null}
!520 = metadata !{i32 481, i32 0, metadata !108, null}
!521 = metadata !{i32 482, i32 0, metadata !108, null}
