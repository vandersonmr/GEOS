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
@.str4 = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global %struct._IO_FILE*
@.str5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind optsize uwtable
define noalias i8* @generate_test_data(i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !15), !dbg !112
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !16), !dbg !114
  %1 = tail call noalias i8* @malloc(i64 %n) #6, !dbg !115
  tail call void @llvm.dbg.value(metadata !{i8* %1}, i64 0, metadata !19), !dbg !115
  tail call void @llvm.dbg.value(metadata !{i8* %1}, i64 0, metadata !20), !dbg !116
  tail call void @llvm.dbg.value(metadata !117, i64 0, metadata !21), !dbg !118
  %2 = icmp eq i64 %n, 0, !dbg !118
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !118

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %ptr.01 = phi i8* [ %17, %.lr.ph ], [ %1, %0 ]
  %3 = load i64* @seed, align 8, !dbg !120, !tbaa !123
  %4 = xor i64 %3, 123459876, !dbg !120
  %5 = sdiv i64 %4, 127773, !dbg !127
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !128), !dbg !127
  %6 = mul i64 %5, -127773, !dbg !129
  %7 = add i64 %6, %4, !dbg !129
  %8 = mul nsw i64 %7, 16807, !dbg !129
  %9 = mul i64 %5, -2836, !dbg !129
  %10 = add i64 %8, %9, !dbg !129
  %11 = icmp slt i64 %10, 0, !dbg !130
  %12 = add nsw i64 %10, 2147483647, !dbg !132
  %..i = select i1 %11, i64 %12, i64 %10, !dbg !130
  %13 = srem i64 %..i, 32, !dbg !133
  tail call void @llvm.dbg.value(metadata !{i64 %13}, i64 0, metadata !134), !dbg !133
  %14 = xor i64 %..i, 123459876, !dbg !135
  store i64 %14, i64* @seed, align 8, !dbg !135, !tbaa !123
  %15 = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %13, !dbg !121
  %16 = load i8* %15, align 1, !dbg !121, !tbaa !136
  store i8 %16, i8* %ptr.01, align 1, !dbg !121, !tbaa !136
  %17 = getelementptr inbounds i8* %ptr.01, i64 1, !dbg !137
  tail call void @llvm.dbg.value(metadata !{i8* %17}, i64 0, metadata !20), !dbg !137
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !118
  %exitcond = icmp eq i64 %indvars.iv.next, %n, !dbg !118
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !118

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %1, !dbg !138
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind optsize uwtable
define void @compdecomp(i8* nocapture %data, i64 %data_len) #0 {
  %freq = alloca [512 x i64], align 16
  %heap = alloca [256 x i64], align 16
  %link = alloca [512 x i32], align 16
  %code = alloca [256 x i64], align 16
  %clen = alloca [256 x i8], align 16
  %heap2 = alloca [256 x i64], align 16
  %outc = alloca [256 x i8], align 16
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !27), !dbg !139
  tail call void @llvm.dbg.value(metadata !{i64 %data_len}, i64 0, metadata !28), !dbg !139
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !38), !dbg !140
  %1 = add i64 %data_len, 1, !dbg !141
  %2 = tail call noalias i8* @malloc(i64 %1) #6, !dbg !141
  tail call void @llvm.dbg.value(metadata !{i8* %2}, i64 0, metadata !39), !dbg !141
  %3 = bitcast [512 x i64]* %freq to i8*, !dbg !142
  call void @llvm.lifetime.start(i64 4096, i8* %3) #3, !dbg !142
  tail call void @llvm.dbg.declare(metadata !{[512 x i64]* %freq}, metadata !40), !dbg !142
  %4 = bitcast [256 x i64]* %heap to i8*, !dbg !143
  call void @llvm.lifetime.start(i64 2048, i8* %4) #3, !dbg !143
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap}, metadata !44), !dbg !143
  %5 = bitcast [512 x i32]* %link to i8*, !dbg !144
  call void @llvm.lifetime.start(i64 2048, i8* %5) #3, !dbg !144
  tail call void @llvm.dbg.declare(metadata !{[512 x i32]* %link}, metadata !48), !dbg !144
  %6 = bitcast [256 x i64]* %code to i8*, !dbg !145
  call void @llvm.lifetime.start(i64 2048, i8* %6) #3, !dbg !145
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %code}, metadata !50), !dbg !145
  %7 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 0, !dbg !146
  call void @llvm.lifetime.start(i64 256, i8* %7) #3, !dbg !146
  tail call void @llvm.dbg.declare(metadata !{[256 x i8]* %clen}, metadata !52), !dbg !146
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %1, i32 1, i1 false), !dbg !147
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 4096, i32 16, i1 false), !dbg !148
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 2048, i32 16, i1 false), !dbg !149
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 2048, i32 16, i1 false), !dbg !150
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 2048, i32 16, i1 false), !dbg !151
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 256, i32 16, i1 false), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !29), !dbg !154
  %8 = icmp eq i64 %data_len, 0, !dbg !154
  br i1 %8, label %.preheader10, label %.lr.ph87, !dbg !154

.lr.ph87:                                         ; preds = %0, %.lr.ph87
  %i.085 = phi i64 [ %15, %.lr.ph87 ], [ 0, %0 ]
  %dptr.084 = phi i8* [ %14, %.lr.ph87 ], [ %data, %0 ]
  %9 = load i8* %dptr.084, align 1, !dbg !156, !tbaa !136
  %10 = zext i8 %9 to i64, !dbg !156
  %11 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %10, !dbg !156
  %12 = load i64* %11, align 8, !dbg !156, !tbaa !123
  %13 = add i64 %12, 1, !dbg !156
  store i64 %13, i64* %11, align 8, !dbg !156, !tbaa !123
  %14 = getelementptr inbounds i8* %dptr.084, i64 1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !38), !dbg !158
  %15 = add i64 %i.085, 1, !dbg !154
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !29), !dbg !154
  %exitcond100 = icmp eq i64 %15, %data_len, !dbg !154
  br i1 %exitcond100, label %.preheader10, label %.lr.ph87, !dbg !154

.preheader9:                                      ; preds = %26
  %16 = icmp eq i64 %n.1, 0, !dbg !159
  br i1 %16, label %._crit_edge78, label %.lr.ph81, !dbg !159

.lr.ph81:                                         ; preds = %.preheader9
  %17 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 0, !dbg !161
  %18 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !161
  %19 = trunc i64 %n.1 to i32, !dbg !161
  br label %31, !dbg !159

.preheader10:                                     ; preds = %0, %.lr.ph87, %26
  %i.183 = phi i64 [ %27, %26 ], [ 0, %.lr.ph87 ], [ 0, %0 ]
  %n.082 = phi i64 [ %n.1, %26 ], [ 0, %.lr.ph87 ], [ 0, %0 ]
  %20 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %i.183, !dbg !162
  %21 = load i64* %20, align 8, !dbg !162, !tbaa !123
  %22 = icmp eq i64 %21, 0, !dbg !162
  br i1 %22, label %26, label %23, !dbg !162

; <label>:23                                      ; preds = %.preheader10
  %24 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %n.082, !dbg !166
  store i64 %i.183, i64* %24, align 8, !dbg !166, !tbaa !123
  %25 = add i64 %n.082, 1, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i64 %25}, i64 0, metadata !31), !dbg !168
  br label %26, !dbg !169

; <label>:26                                      ; preds = %.preheader10, %23
  %n.1 = phi i64 [ %25, %23 ], [ %n.082, %.preheader10 ]
  %27 = add i64 %i.183, 1, !dbg !170
  tail call void @llvm.dbg.value(metadata !{i64 %27}, i64 0, metadata !29), !dbg !170
  %exitcond99 = icmp eq i64 %27, 256, !dbg !170
  br i1 %exitcond99, label %.preheader9, label %.preheader10, !dbg !170

.preheader8:                                      ; preds = %31
  %28 = icmp ugt i64 %n.1, 1, !dbg !171
  br i1 %28, label %.lr.ph77, label %._crit_edge78, !dbg !171

.lr.ph77:                                         ; preds = %.preheader8
  %29 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !172
  %30 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 0, !dbg !174
  br label %35, !dbg !171

; <label>:31                                      ; preds = %.lr.ph81, %31
  %i.280 = phi i64 [ %n.1, %.lr.ph81 ], [ %33, %31 ]
  %32 = trunc i64 %i.280 to i32, !dbg !161
  call fastcc void @heap_adjust(i64* %17, i64* %18, i32 %19, i32 %32) #7, !dbg !161
  %33 = add i64 %i.280, -1, !dbg !159
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !29), !dbg !159
  %34 = icmp eq i64 %33, 0, !dbg !159
  br i1 %34, label %.preheader8, label %31, !dbg !159

; <label>:35                                      ; preds = %.lr.ph77, %35
  %n.276 = phi i64 [ %n.1, %.lr.ph77 ], [ %36, %35 ]
  %36 = add i64 %n.276, -1, !dbg !175
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !31), !dbg !175
  %37 = load i64* %29, align 16, !dbg !172, !tbaa !123
  %38 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %36, !dbg !177
  %39 = load i64* %38, align 8, !dbg !177, !tbaa !123
  store i64 %39, i64* %29, align 16, !dbg !177, !tbaa !123
  %40 = trunc i64 %36 to i32, !dbg !174
  call fastcc void @heap_adjust(i64* %30, i64* %29, i32 %40, i32 1) #7, !dbg !174
  %41 = load i64* %29, align 16, !dbg !178, !tbaa !123
  %42 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %41, !dbg !178
  %43 = load i64* %42, align 8, !dbg !178, !tbaa !123
  %44 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %37, !dbg !178
  %45 = load i64* %44, align 8, !dbg !178, !tbaa !123
  %46 = add i64 %45, %43, !dbg !178
  %47 = add i64 %n.276, 255, !dbg !178
  %48 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %47, !dbg !178
  store i64 %46, i64* %48, align 8, !dbg !178, !tbaa !123
  %49 = trunc i64 %47 to i32, !dbg !179
  %50 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %37, !dbg !179
  store i32 %49, i32* %50, align 4, !dbg !179, !tbaa !180
  %51 = sub i64 -255, %n.276, !dbg !182
  %52 = trunc i64 %51 to i32, !dbg !182
  %53 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %41, !dbg !182
  store i32 %52, i32* %53, align 4, !dbg !182, !tbaa !180
  store i64 %47, i64* %29, align 16, !dbg !183, !tbaa !123
  call fastcc void @heap_adjust(i64* %30, i64* %29, i32 %40, i32 1) #7, !dbg !184
  %54 = icmp ugt i64 %36, 1, !dbg !171
  br i1 %54, label %35, label %._crit_edge78, !dbg !171

._crit_edge78:                                    ; preds = %35, %.preheader9, %.preheader8
  %n.2.lcssa = phi i64 [ %n.1, %.preheader8 ], [ 0, %.preheader9 ], [ 1, %35 ]
  %55 = add i64 %n.2.lcssa, 256, !dbg !185
  %56 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %55, !dbg !185
  store i32 0, i32* %56, align 4, !dbg !185, !tbaa !180
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !57), !dbg !186
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !58), !dbg !186
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !55), !dbg !187
  br label %57, !dbg !187

; <label>:57                                      ; preds = %79, %._crit_edge78
  %maxi.075 = phi i64 [ 0, %._crit_edge78 ], [ %maxi.1, %79 ]
  %maxx.074 = phi i64 [ 0, %._crit_edge78 ], [ %maxx.2, %79 ]
  %m.073 = phi i64 [ 0, %._crit_edge78 ], [ %80, %79 ]
  %58 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %m.073, !dbg !189
  %59 = load i64* %58, align 8, !dbg !189, !tbaa !123
  %60 = icmp eq i64 %59, 0, !dbg !189
  br i1 %60, label %62, label %.preheader7, !dbg !189

.preheader7:                                      ; preds = %57
  %l.0.in63 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %m.073, !dbg !192
  %l.064 = load i32* %l.0.in63, align 4, !dbg !192
  %61 = icmp eq i32 %l.064, 0, !dbg !194
  br i1 %61, label %._crit_edge70, label %.lr.ph69, !dbg !194

; <label>:62                                      ; preds = %57
  %63 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.073, !dbg !195
  store i64 0, i64* %63, align 8, !dbg !195, !tbaa !123
  %64 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.073, !dbg !197
  store i8 0, i8* %64, align 1, !dbg !197, !tbaa !136
  br label %79, !dbg !198

.lr.ph69:                                         ; preds = %.preheader7, %69
  %l.068 = phi i32 [ %l.0, %69 ], [ %l.064, %.preheader7 ]
  %x.067 = phi i64 [ %x.1, %69 ], [ 0, %.preheader7 ]
  %i.366 = phi i64 [ %72, %69 ], [ 0, %.preheader7 ]
  %j.065 = phi i64 [ %71, %69 ], [ 1, %.preheader7 ]
  %65 = icmp slt i32 %l.068, 0, !dbg !199
  br i1 %65, label %66, label %69, !dbg !199

; <label>:66                                      ; preds = %.lr.ph69
  %67 = add i64 %x.067, %j.065, !dbg !202
  tail call void @llvm.dbg.value(metadata !{i64 %67}, i64 0, metadata !56), !dbg !202
  %68 = sub nsw i32 0, %l.068, !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32 %68}, i64 0, metadata !59), !dbg !204
  br label %69, !dbg !205

; <label>:69                                      ; preds = %66, %.lr.ph69
  %x.1 = phi i64 [ %67, %66 ], [ %x.067, %.lr.ph69 ]
  %l.1 = phi i32 [ %68, %66 ], [ %l.068, %.lr.ph69 ]
  %70 = sext i32 %l.1 to i64, !dbg !206
  %71 = shl i64 %j.065, 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i64 %71}, i64 0, metadata !30), !dbg !207
  %72 = add i64 %i.366, 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{i64 %72}, i64 0, metadata !29), !dbg !208
  %l.0.in = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %70, !dbg !192
  %l.0 = load i32* %l.0.in, align 4, !dbg !192
  %73 = icmp eq i32 %l.0, 0, !dbg !194
  br i1 %73, label %._crit_edge70, label %.lr.ph69, !dbg !194

._crit_edge70:                                    ; preds = %69, %.preheader7
  %x.0.lcssa = phi i64 [ 0, %.preheader7 ], [ %x.1, %69 ]
  %i.3.lcssa = phi i64 [ 0, %.preheader7 ], [ %72, %69 ]
  %74 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.073, !dbg !209
  store i64 %x.0.lcssa, i64* %74, align 8, !dbg !209, !tbaa !123
  %75 = trunc i64 %i.3.lcssa to i8, !dbg !210
  %76 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.073, !dbg !210
  store i8 %75, i8* %76, align 1, !dbg !210, !tbaa !136
  %77 = icmp ugt i64 %x.0.lcssa, %maxx.074, !dbg !211
  tail call void @llvm.dbg.value(metadata !{i64 %x.0.lcssa}, i64 0, metadata !57), !dbg !213
  %x.0.maxx.0 = select i1 %77, i64 %x.0.lcssa, i64 %maxx.074, !dbg !211
  %78 = icmp ugt i64 %i.3.lcssa, %maxi.075, !dbg !214
  tail call void @llvm.dbg.value(metadata !{i64 %i.3.lcssa}, i64 0, metadata !58), !dbg !216
  %i.3.maxi.0 = select i1 %78, i64 %i.3.lcssa, i64 %maxi.075, !dbg !214
  br label %79, !dbg !214

; <label>:79                                      ; preds = %._crit_edge70, %62
  %maxx.2 = phi i64 [ %maxx.074, %62 ], [ %x.0.maxx.0, %._crit_edge70 ]
  %maxi.1 = phi i64 [ %maxi.075, %62 ], [ %i.3.maxi.0, %._crit_edge70 ]
  %80 = add i64 %m.073, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata !{i64 %80}, i64 0, metadata !55), !dbg !187
  %exitcond98 = icmp eq i64 %80, 256, !dbg !187
  br i1 %exitcond98, label %81, label %57, !dbg !187

; <label>:81                                      ; preds = %79
  %82 = icmp ugt i64 %maxi.1, 64, !dbg !217
  br i1 %82, label %83, label %86, !dbg !217

; <label>:83                                      ; preds = %81
  %84 = load %struct._IO_FILE** @stderr, align 8, !dbg !219, !tbaa !221
  %85 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %84) #8, !dbg !219
  tail call void @exit(i32 1) #9, !dbg !223
  unreachable, !dbg !223

; <label>:86                                      ; preds = %81
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !60), !dbg !224
  tail call void @llvm.dbg.value(metadata !225, i64 0, metadata !61), !dbg !226
  tail call void @llvm.dbg.value(metadata !227, i64 0, metadata !62), !dbg !228
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !38), !dbg !229
  %87 = icmp eq i64 %maxx.2, 0, !dbg !230
  br i1 %87, label %88, label %.preheader6, !dbg !230

.preheader6:                                      ; preds = %86
  br i1 %8, label %._crit_edge59, label %.lr.ph58, !dbg !232

; <label>:88                                      ; preds = %86
  %89 = load %struct._IO_FILE** @stderr, align 8, !dbg !234, !tbaa !221
  %90 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %89) #8, !dbg !234
  tail call void @exit(i32 1) #9, !dbg !236
  unreachable, !dbg !236

.lr.ph58:                                         ; preds = %.preheader6, %._crit_edge49
  %bit.057 = phi i32 [ %bit.1.lcssa, %._crit_edge49 ], [ -1, %.preheader6 ]
  %bout.056 = phi i8 [ %bout.1.lcssa, %._crit_edge49 ], [ 0, %.preheader6 ]
  %comp_len.055 = phi i64 [ %comp_len.1.lcssa, %._crit_edge49 ], [ 0, %.preheader6 ]
  %j.154 = phi i64 [ %127, %._crit_edge49 ], [ 0, %.preheader6 ]
  %dptr.153 = phi i8* [ %126, %._crit_edge49 ], [ %data, %.preheader6 ]
  %91 = load i8* %dptr.153, align 1, !dbg !237, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i64 %99}, i64 0, metadata !32), !dbg !237
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !29), !dbg !239
  %92 = zext i8 %91 to i64, !dbg !239
  %93 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %92, !dbg !239
  %94 = load i8* %93, align 1, !dbg !239, !tbaa !136
  %95 = icmp eq i8 %94, 0, !dbg !239
  br i1 %95, label %._crit_edge49, label %.lr.ph48, !dbg !239

.lr.ph48:                                         ; preds = %.lr.ph58
  %96 = zext i8 %94 to i32, !dbg !237
  %97 = add nsw i32 %96, -1, !dbg !237
  %98 = shl i32 1, %97, !dbg !237
  %99 = sext i32 %98 to i64, !dbg !237
  br label %100, !dbg !239

; <label>:100                                     ; preds = %.lr.ph48, %113
  %101 = phi i8 [ %91, %.lr.ph48 ], [ %114, %113 ]
  %bit.146 = phi i32 [ %bit.057, %.lr.ph48 ], [ %bit.2, %113 ]
  %bout.145 = phi i8 [ %bout.056, %.lr.ph48 ], [ %bout.2., %113 ]
  %comp_len.144 = phi i64 [ %comp_len.055, %.lr.ph48 ], [ %comp_len.2, %113 ]
  %i.443 = phi i64 [ 0, %.lr.ph48 ], [ %121, %113 ]
  %mask.042 = phi i64 [ %99, %.lr.ph48 ], [ %120, %113 ]
  %102 = icmp eq i32 %bit.146, 7, !dbg !241
  br i1 %102, label %103, label %110, !dbg !241

; <label>:103                                     ; preds = %100
  %104 = getelementptr inbounds i8* %2, i64 %comp_len.144, !dbg !244
  store i8 %bout.145, i8* %104, align 1, !dbg !244, !tbaa !136
  %105 = add i64 %comp_len.144, 1, !dbg !246
  tail call void @llvm.dbg.value(metadata !{i64 %105}, i64 0, metadata !60), !dbg !246
  %106 = icmp eq i64 %105, %data_len, !dbg !247
  br i1 %106, label %107, label %._crit_edge102, !dbg !247

._crit_edge102:                                   ; preds = %103
  %.pre = load i8* %dptr.153, align 1, !dbg !249, !tbaa !136
  br label %113, !dbg !247

; <label>:107                                     ; preds = %103
  %108 = load %struct._IO_FILE** @stderr, align 8, !dbg !251, !tbaa !221
  %109 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %108) #8, !dbg !251
  tail call void @exit(i32 1) #9, !dbg !253
  unreachable, !dbg !253

; <label>:110                                     ; preds = %100
  %111 = add nsw i32 %bit.146, 1, !dbg !254
  tail call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !62), !dbg !254
  %112 = shl i8 %bout.145, 1, !dbg !256
  tail call void @llvm.dbg.value(metadata !{i8 %112}, i64 0, metadata !61), !dbg !256
  br label %113

; <label>:113                                     ; preds = %._crit_edge102, %110
  %114 = phi i8 [ %101, %110 ], [ %.pre, %._crit_edge102 ], !dbg !249
  %comp_len.2 = phi i64 [ %comp_len.144, %110 ], [ %105, %._crit_edge102 ]
  %bout.2 = phi i8 [ %112, %110 ], [ 0, %._crit_edge102 ]
  %bit.2 = phi i32 [ %111, %110 ], [ 0, %._crit_edge102 ]
  %115 = zext i8 %114 to i64, !dbg !249
  %116 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %115, !dbg !249
  %117 = load i64* %116, align 8, !dbg !249, !tbaa !123
  %118 = and i64 %117, %mask.042, !dbg !249
  %not.3 = icmp ne i64 %118, 0, !dbg !249
  %119 = zext i1 %not.3 to i8, !dbg !249
  %bout.2. = or i8 %119, %bout.2, !dbg !249
  %120 = lshr i64 %mask.042, 1, !dbg !257
  tail call void @llvm.dbg.value(metadata !{i64 %120}, i64 0, metadata !32), !dbg !257
  %121 = add i64 %i.443, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata !{i64 %121}, i64 0, metadata !29), !dbg !239
  %122 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %115, !dbg !239
  %123 = load i8* %122, align 1, !dbg !239, !tbaa !136
  %124 = zext i8 %123 to i64, !dbg !239
  %125 = icmp ult i64 %121, %124, !dbg !239
  br i1 %125, label %100, label %._crit_edge49, !dbg !239

._crit_edge49:                                    ; preds = %113, %.lr.ph58
  %bit.1.lcssa = phi i32 [ %bit.057, %.lr.ph58 ], [ %bit.2, %113 ]
  %bout.1.lcssa = phi i8 [ %bout.056, %.lr.ph58 ], [ %bout.2., %113 ]
  %comp_len.1.lcssa = phi i64 [ %comp_len.055, %.lr.ph58 ], [ %comp_len.2, %113 ]
  %126 = getelementptr inbounds i8* %dptr.153, i64 1, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i8* %126}, i64 0, metadata !38), !dbg !258
  %127 = add i64 %j.154, 1, !dbg !232
  tail call void @llvm.dbg.value(metadata !{i64 %127}, i64 0, metadata !30), !dbg !232
  %128 = icmp ult i64 %127, %data_len, !dbg !232
  br i1 %128, label %.lr.ph58, label %._crit_edge59, !dbg !232

._crit_edge59:                                    ; preds = %._crit_edge49, %.preheader6
  %bit.0.lcssa = phi i32 [ -1, %.preheader6 ], [ %bit.1.lcssa, %._crit_edge49 ]
  %bout.0.lcssa = phi i8 [ 0, %.preheader6 ], [ %bout.1.lcssa, %._crit_edge49 ]
  %comp_len.0.lcssa = phi i64 [ 0, %.preheader6 ], [ %comp_len.1.lcssa, %._crit_edge49 ]
  %129 = sub nsw i32 7, %bit.0.lcssa, !dbg !259
  %130 = sext i8 %bout.0.lcssa to i32, !dbg !259
  %131 = shl i32 %130, %129, !dbg !259
  %132 = trunc i32 %131 to i8, !dbg !259
  tail call void @llvm.dbg.value(metadata !{i8 %132}, i64 0, metadata !61), !dbg !259
  %133 = getelementptr inbounds i8* %2, i64 %comp_len.0.lcssa, !dbg !260
  store i8 %132, i8* %133, align 1, !dbg !260, !tbaa !136
  %134 = bitcast [256 x i64]* %heap2 to i8*, !dbg !261
  call void @llvm.lifetime.start(i64 2048, i8* %134) #3, !dbg !261
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap2}, metadata !63), !dbg !261
  %135 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 0, !dbg !262
  call void @llvm.lifetime.start(i64 256, i8* %135) #3, !dbg !262
  tail call void @llvm.dbg.declare(metadata !{[256 x i8]* %outc}, metadata !64), !dbg !262
  call void @llvm.memset.p0i8.i64(i8* %134, i8 0, i64 2048, i32 16, i1 false), !dbg !263
  tail call void @llvm.dbg.value(metadata !{i8* %135}, i64 0, metadata !66), !dbg !264
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !30), !dbg !265
  br label %136, !dbg !265

; <label>:136                                     ; preds = %161, %._crit_edge59
  %optr.041 = phi i8* [ %135, %._crit_edge59 ], [ %138, %161 ]
  %j.240 = phi i64 [ 0, %._crit_edge59 ], [ %162, %161 ]
  %137 = trunc i64 %j.240 to i8, !dbg !267
  store i8 %137, i8* %optr.041, align 1, !dbg !267, !tbaa !136
  %138 = getelementptr inbounds i8* %optr.041, i64 1, !dbg !269
  tail call void @llvm.dbg.value(metadata !{i8* %138}, i64 0, metadata !66), !dbg !269
  %139 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %j.240, !dbg !270
  %140 = load i64* %139, align 8, !dbg !270, !tbaa !123
  %141 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %j.240, !dbg !270
  %142 = load i8* %141, align 1, !dbg !270, !tbaa !136
  %143 = zext i8 %142 to i64, !dbg !270
  %144 = or i64 %143, %140, !dbg !270
  %145 = icmp eq i64 %144, 0, !dbg !270
  br i1 %145, label %161, label %146, !dbg !270

; <label>:146                                     ; preds = %136
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !33), !dbg !272
  tail call void @llvm.dbg.value(metadata !{i64 %151}, i64 0, metadata !32), !dbg !274
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !29), !dbg !275
  %147 = icmp eq i8 %142, 0, !dbg !275
  br i1 %147, label %._crit_edge38, label %.lr.ph37, !dbg !275

.lr.ph37:                                         ; preds = %146
  %148 = zext i8 %142 to i32, !dbg !274
  %149 = add nsw i32 %148, -1, !dbg !274
  %150 = shl i32 1, %149, !dbg !274
  %151 = sext i32 %150 to i64, !dbg !274
  br label %152, !dbg !275

; <label>:152                                     ; preds = %.lr.ph37, %152
  %i.535 = phi i64 [ 0, %.lr.ph37 ], [ %158, %152 ]
  %mask.134 = phi i64 [ %151, %.lr.ph37 ], [ %157, %152 ]
  %k.033 = phi i64 [ 0, %.lr.ph37 ], [ %., %152 ]
  %153 = shl i64 %k.033, 1, !dbg !277
  %154 = or i64 %153, 1, !dbg !277
  tail call void @llvm.dbg.value(metadata !{i64 %154}, i64 0, metadata !33), !dbg !277
  %155 = and i64 %140, %mask.134, !dbg !279
  %not.2 = icmp ne i64 %155, 0, !dbg !279
  %156 = zext i1 %not.2 to i64, !dbg !279
  %. = add i64 %156, %154, !dbg !279
  %157 = lshr i64 %mask.134, 1, !dbg !281
  tail call void @llvm.dbg.value(metadata !{i64 %157}, i64 0, metadata !32), !dbg !281
  %158 = add i64 %i.535, 1, !dbg !275
  tail call void @llvm.dbg.value(metadata !{i64 %158}, i64 0, metadata !29), !dbg !275
  %159 = icmp ult i64 %158, %143, !dbg !275
  br i1 %159, label %152, label %._crit_edge38, !dbg !275

._crit_edge38:                                    ; preds = %152, %146
  %k.0.lcssa = phi i64 [ 0, %146 ], [ %., %152 ]
  %160 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.240, !dbg !282
  store i64 %k.0.lcssa, i64* %160, align 8, !dbg !282, !tbaa !123
  br label %161, !dbg !283

; <label>:161                                     ; preds = %136, %._crit_edge38
  %162 = add i64 %j.240, 1, !dbg !265
  tail call void @llvm.dbg.value(metadata !{i64 %162}, i64 0, metadata !30), !dbg !265
  %exitcond97 = icmp eq i64 %162, 256, !dbg !265
  br i1 %exitcond97, label %.lr.ph29, label %136, !dbg !265

.lr.ph29:                                         ; preds = %161, %.critedge
  %i.632 = phi i64 [ %180, %.critedge ], [ 1, %161 ]
  %163 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.632, !dbg !284
  %164 = load i64* %163, align 8, !dbg !284, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{i64 %164}, i64 0, metadata !35), !dbg !284
  %165 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.632, !dbg !287
  %166 = load i8* %165, align 1, !dbg !287, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i8 %166}, i64 0, metadata !36), !dbg !287
  tail call void @llvm.dbg.value(metadata !{i64 %i.632}, i64 0, metadata !30), !dbg !288
  br label %167, !dbg !289

; <label>:167                                     ; preds = %.lr.ph29, %172
  %j.327 = phi i64 [ %i.632, %.lr.ph29 ], [ %168, %172 ]
  %168 = add i64 %j.327, -1, !dbg !289
  %169 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %168, !dbg !289
  %170 = load i64* %169, align 8, !dbg !289, !tbaa !123
  %171 = icmp ugt i64 %170, %164, !dbg !289
  br i1 %171, label %172, label %.critedge

; <label>:172                                     ; preds = %167
  %173 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.327, !dbg !290
  store i64 %170, i64* %173, align 8, !dbg !290, !tbaa !123
  %174 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %168, !dbg !292
  %175 = load i8* %174, align 1, !dbg !292, !tbaa !136
  %176 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.327, !dbg !292
  store i8 %175, i8* %176, align 1, !dbg !292, !tbaa !136
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !30), !dbg !293
  %177 = icmp eq i64 %168, 0, !dbg !289
  br i1 %177, label %.critedge, label %167, !dbg !289

.critedge:                                        ; preds = %167, %172
  %j.3.lcssa = phi i64 [ 0, %172 ], [ %j.327, %167 ]
  %178 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3.lcssa, !dbg !294
  store i64 %164, i64* %178, align 8, !dbg !294, !tbaa !123
  %179 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3.lcssa, !dbg !295
  store i8 %166, i8* %179, align 1, !dbg !295, !tbaa !136
  %180 = add i64 %i.632, 1, !dbg !296
  tail call void @llvm.dbg.value(metadata !{i64 %180}, i64 0, metadata !29), !dbg !296
  %exitcond = icmp eq i64 %180, 256, !dbg !296
  br i1 %exitcond, label %.preheader4, label %.lr.ph29, !dbg !296

.preheader4:                                      ; preds = %.critedge, %.preheader4
  %j.4 = phi i64 [ %184, %.preheader4 ], [ 0, %.critedge ]
  %181 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.4, !dbg !297
  %182 = load i64* %181, align 8, !dbg !297, !tbaa !123
  %183 = icmp eq i64 %182, 0, !dbg !297
  %184 = add i64 %j.4, 1, !dbg !297
  tail call void @llvm.dbg.value(metadata !{i64 %184}, i64 0, metadata !30), !dbg !297
  br i1 %183, label %.preheader4, label %.preheader, !dbg !297

.preheader:                                       ; preds = %.preheader4
  br i1 %8, label %.outer._crit_edge, label %.lr.ph, !dbg !299

; <label>:185                                     ; preds = %207
  %186 = lshr i64 %mask.218, 1, !dbg !300
  %187 = icmp ult i64 %n.4, %data_len, !dbg !299
  br i1 %187, label %188, label %.outer._crit_edge, !dbg !299

; <label>:188                                     ; preds = %.lr.ph, %185
  %i.721 = phi i64 [ %i.7.ph26, %.lr.ph ], [ %i.9, %185 ]
  %dptr.220 = phi i8* [ %dptr.2.ph25, %.lr.ph ], [ %dptr.3, %185 ]
  %n.319 = phi i64 [ %n.3.ph23, %.lr.ph ], [ %n.4, %185 ]
  %mask.218 = phi i64 [ 128, %.lr.ph ], [ %186, %185 ]
  %k.217 = phi i64 [ %k.2.ph22, %.lr.ph ], [ %k.4, %185 ]
  %189 = shl i64 %k.217, 1, !dbg !303
  %190 = or i64 %189, 1, !dbg !303
  tail call void @llvm.dbg.value(metadata !{i64 %190}, i64 0, metadata !33), !dbg !303
  %191 = load i8* %cptr.0.ph24, align 1, !dbg !304, !tbaa !136
  %192 = zext i8 %191 to i64, !dbg !304
  %193 = and i64 %192, %mask.218, !dbg !304
  %not. = icmp ne i64 %193, 0, !dbg !304
  %194 = zext i1 %not. to i64, !dbg !304
  %.1 = add i64 %194, %190, !dbg !304
  br label %195, !dbg !304

; <label>:195                                     ; preds = %195, %188
  %i.8 = phi i64 [ %199, %195 ], [ %i.721, %188 ]
  %196 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.8, !dbg !306
  %197 = load i64* %196, align 8, !dbg !306, !tbaa !123
  %198 = icmp ult i64 %197, %.1, !dbg !306
  %199 = add i64 %i.8, 1, !dbg !307
  tail call void @llvm.dbg.value(metadata !{i64 %199}, i64 0, metadata !29), !dbg !307
  br i1 %198, label %195, label %200, !dbg !306

; <label>:200                                     ; preds = %195
  %201 = icmp eq i64 %.1, %197, !dbg !308
  br i1 %201, label %202, label %207, !dbg !308

; <label>:202                                     ; preds = %200
  %203 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.8, !dbg !310
  %204 = load i8* %203, align 1, !dbg !310, !tbaa !136
  store i8 %204, i8* %dptr.220, align 1, !dbg !310, !tbaa !136
  %205 = getelementptr inbounds i8* %dptr.220, i64 1, !dbg !312
  tail call void @llvm.dbg.value(metadata !{i8* %205}, i64 0, metadata !38), !dbg !312
  %206 = add i64 %n.319, 1, !dbg !313
  tail call void @llvm.dbg.value(metadata !{i64 %206}, i64 0, metadata !31), !dbg !313
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !33), !dbg !314
  tail call void @llvm.dbg.value(metadata !{i64 %j.4}, i64 0, metadata !29), !dbg !315
  br label %207, !dbg !316

; <label>:207                                     ; preds = %202, %200
  %k.4 = phi i64 [ 0, %202 ], [ %.1, %200 ]
  %n.4 = phi i64 [ %206, %202 ], [ %n.319, %200 ]
  %dptr.3 = phi i8* [ %205, %202 ], [ %dptr.220, %200 ]
  %i.9 = phi i64 [ %j.4, %202 ], [ %i.8, %200 ]
  %208 = icmp ugt i64 %mask.218, 1, !dbg !317
  tail call void @llvm.dbg.value(metadata !{i64 %186}, i64 0, metadata !32), !dbg !300
  br i1 %208, label %185, label %.outer, !dbg !317

.outer:                                           ; preds = %207
  tail call void @llvm.dbg.value(metadata !318, i64 0, metadata !32), !dbg !319
  %209 = getelementptr inbounds i8* %cptr.0.ph24, i64 1, !dbg !321
  tail call void @llvm.dbg.value(metadata !{i8* %209}, i64 0, metadata !37), !dbg !321
  %210 = icmp ult i64 %n.4, %data_len, !dbg !299
  br i1 %210, label %.lr.ph, label %.outer._crit_edge, !dbg !299

.lr.ph:                                           ; preds = %.preheader, %.outer
  %i.7.ph26 = phi i64 [ %i.9, %.outer ], [ %j.4, %.preheader ]
  %dptr.2.ph25 = phi i8* [ %dptr.3, %.outer ], [ %data, %.preheader ]
  %cptr.0.ph24 = phi i8* [ %209, %.outer ], [ %2, %.preheader ]
  %n.3.ph23 = phi i64 [ %n.4, %.outer ], [ 0, %.preheader ]
  %k.2.ph22 = phi i64 [ %k.4, %.outer ], [ 0, %.preheader ]
  br label %188, !dbg !299

.outer._crit_edge:                                ; preds = %.outer, %185, %.preheader
  tail call void @free(i8* %2) #6, !dbg !322
  call void @llvm.lifetime.end(i64 256, i8* %135) #3, !dbg !323
  call void @llvm.lifetime.end(i64 2048, i8* %134) #3, !dbg !323
  call void @llvm.lifetime.end(i64 256, i8* %7) #3, !dbg !323
  call void @llvm.lifetime.end(i64 2048, i8* %6) #3, !dbg !323
  call void @llvm.lifetime.end(i64 2048, i8* %5) #3, !dbg !323
  call void @llvm.lifetime.end(i64 2048, i8* %4) #3, !dbg !323
  call void @llvm.lifetime.end(i64 4096, i8* %3) #3, !dbg !323
  ret void, !dbg !323
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind optsize uwtable
define internal fastcc void @heap_adjust(i64* nocapture readonly %freq, i64* nocapture %heap, i32 %n, i32 %k) #0 {
  tail call void @llvm.dbg.value(metadata !{i64* %freq}, i64 0, metadata !85), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i64* %heap}, i64 0, metadata !86), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !87), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !88), !dbg !324
  %1 = sext i32 %k to i64, !dbg !325
  %.sum = add i64 %1, -1, !dbg !325
  %2 = getelementptr inbounds i64* %heap, i64 %.sum, !dbg !325
  %3 = load i64* %2, align 8, !dbg !325, !tbaa !123
  %4 = sdiv i32 %n, 2, !dbg !326
  %5 = icmp slt i32 %4, %k, !dbg !326
  %sext.pre = shl i64 %3, 32, !dbg !327
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !327
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !326

.lr.ph:                                           ; preds = %0
  %6 = getelementptr inbounds i64* %freq, i64 %.pre, !dbg !328
  br label %7, !dbg !326

; <label>:7                                       ; preds = %.lr.ph, %31
  %.07 = phi i32 [ %k, %.lr.ph ], [ %j.0, %31 ]
  %8 = shl nsw i32 %.07, 1, !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !89), !dbg !331
  %9 = icmp slt i32 %8, %n, !dbg !332
  br i1 %9, label %10, label %23, !dbg !332

; <label>:10                                      ; preds = %7
  %11 = sext i32 %8 to i64, !dbg !332
  %.sum5 = add i64 %11, -1, !dbg !332
  %12 = getelementptr inbounds i64* %heap, i64 %.sum5, !dbg !332
  %13 = load i64* %12, align 8, !dbg !332, !tbaa !123
  %14 = getelementptr inbounds i64* %freq, i64 %13, !dbg !332
  %15 = load i64* %14, align 8, !dbg !332, !tbaa !123
  %16 = or i32 %8, 1, !dbg !332
  %17 = sext i32 %16 to i64, !dbg !332
  %.sum6 = add i64 %17, -1, !dbg !332
  %18 = getelementptr inbounds i64* %heap, i64 %.sum6, !dbg !332
  %19 = load i64* %18, align 8, !dbg !332, !tbaa !123
  %20 = getelementptr inbounds i64* %freq, i64 %19, !dbg !332
  %21 = load i64* %20, align 8, !dbg !332, !tbaa !123
  %22 = icmp ugt i64 %15, %21, !dbg !332
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !89), !dbg !334
  %. = select i1 %22, i32 %16, i32 %8, !dbg !332
  br label %23, !dbg !332

; <label>:23                                      ; preds = %10, %7
  %j.0 = phi i32 [ %8, %7 ], [ %., %10 ]
  %24 = load i64* %6, align 8, !dbg !328, !tbaa !123
  %25 = sext i32 %j.0 to i64, !dbg !328
  %.sum3 = add i64 %25, -1, !dbg !328
  %26 = getelementptr inbounds i64* %heap, i64 %.sum3, !dbg !328
  %27 = load i64* %26, align 8, !dbg !328, !tbaa !123
  %28 = getelementptr inbounds i64* %freq, i64 %27, !dbg !328
  %29 = load i64* %28, align 8, !dbg !328, !tbaa !123
  %30 = icmp ult i64 %24, %29, !dbg !328
  br i1 %30, label %._crit_edge, label %31, !dbg !328

; <label>:31                                      ; preds = %23
  %32 = sext i32 %.07 to i64, !dbg !335
  %.sum4 = add i64 %32, -1, !dbg !335
  %33 = getelementptr inbounds i64* %heap, i64 %.sum4, !dbg !335
  store i64 %27, i64* %33, align 8, !dbg !335, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{i32 %j.0}, i64 0, metadata !88), !dbg !336
  %34 = icmp sgt i32 %j.0, %4, !dbg !326
  br i1 %34, label %._crit_edge, label %7, !dbg !326

._crit_edge:                                      ; preds = %23, %31, %0
  %.0.lcssa = phi i32 [ %k, %0 ], [ %.07, %23 ], [ %j.0, %31 ]
  %35 = sext i32 %.0.lcssa to i64, !dbg !327
  %.sum1 = add i64 %35, -1, !dbg !327
  %36 = getelementptr inbounds i64* %heap, i64 %.sum1, !dbg !327
  store i64 %.pre, i64* %36, align 8, !dbg !327, !tbaa !123
  ret void, !dbg !337
}

; Function Attrs: nounwind optsize
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind optsize
declare void @exit(i32) #4

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !72), !dbg !338
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !73), !dbg !338
  tail call void @llvm.dbg.value(metadata !225, i64 0, metadata !75), !dbg !339
  %1 = icmp sgt i32 %argc, 1, !dbg !340
  br i1 %1, label %.lr.ph, label %.loopexit, !dbg !340

.lr.ph:                                           ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !342
  %3 = load i8** %2, align 8, !dbg !342, !tbaa !221
  %4 = tail call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0)) #10, !dbg !342
  %5 = icmp eq i32 %4, 0, !dbg !342
  br label %8, !dbg !347

; <label>:6                                       ; preds = %8
  %7 = icmp slt i32 %9, %argc, !dbg !347
  br i1 %7, label %8, label %.loopexit, !dbg !347

; <label>:8                                       ; preds = %.lr.ph, %6
  %i.02 = phi i32 [ 1, %.lr.ph ], [ %9, %6 ]
  %9 = add nsw i32 %i.02, 1, !dbg !347
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !74), !dbg !347
  br i1 %5, label %.loopexit, label %6, !dbg !342

.loopexit:                                        ; preds = %6, %8, %0
  %ga_testing.0 = phi i1 [ false, %0 ], [ false, %6 ], [ true, %8 ]
  %10 = tail call i8* @generate_test_data(i64 10000000) #7, !dbg !348
  tail call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !77), !dbg !348
  tail call void @llvm.dbg.value(metadata !117, i64 0, metadata !74), !dbg !349
  br label %11, !dbg !349

; <label>:11                                      ; preds = %11, %.loopexit
  %i.11 = phi i32 [ 0, %.loopexit ], [ %12, %11 ]
  tail call void @compdecomp(i8* %10, i64 10000000) #7, !dbg !351
  %12 = add nsw i32 %i.11, 1, !dbg !349
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !74), !dbg !349
  %exitcond = icmp eq i32 %12, 30, !dbg !349
  br i1 %exitcond, label %13, label %11, !dbg !349

; <label>:13                                      ; preds = %11
  tail call void @llvm.dbg.value(metadata !352, i64 0, metadata !78), !dbg !353
  tail call void @free(i8* %10) #6, !dbg !354
  %14 = load %struct._IO_FILE** @stdout, align 8, !dbg !355, !tbaa !221
  br i1 %ga_testing.0, label %15, label %17, !dbg !357

; <label>:15                                      ; preds = %13
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), double 0.000000e+00) #6, !dbg !355
  br label %19, !dbg !355

; <label>:17                                      ; preds = %13
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([35 x i8]* @.str6, i64 0, i64 0), double 0.000000e+00) #6, !dbg !358
  br label %19

; <label>:19                                      ; preds = %17, %15
  %20 = load %struct._IO_FILE** @stdout, align 8, !dbg !359, !tbaa !221
  %21 = tail call i32 @fflush(%struct._IO_FILE* %20) #6, !dbg !359
  ret i32 0, !dbg !360
}

; Function Attrs: nounwind optsize readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #5

; Function Attrs: nounwind optsize
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind optsize }
attributes #7 = { optsize }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind optsize }
attributes #10 = { nounwind optsize readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!109, !110}
!llvm.ident = !{!111}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !98, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"huffbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !23, metadata !67, metadata !80, metadata !91}
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
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75, metadata !77, metadata !78}
!72 = metadata !{i32 786689, metadata !67, metadata !"argc", metadata !5, i32 16777650, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 434]
!73 = metadata !{i32 786689, metadata !67, metadata !"argv", metadata !5, i32 33554866, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 434]
!74 = metadata !{i32 786688, metadata !67, metadata !"i", metadata !5, i32 436, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 436]
!75 = metadata !{i32 786688, metadata !67, metadata !"ga_testing", metadata !5, i32 439, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ga_testing] [line 439]
!76 = metadata !{i32 786468, null, null, metadata !"_Bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!77 = metadata !{i32 786688, metadata !67, metadata !"test_data", metadata !5, i32 454, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [test_data] [line 454]
!78 = metadata !{i32 786688, metadata !67, metadata !"run_time", metadata !5, i32 472, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [run_time] [line 472]
!79 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!80 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"heap_adjust", metadata !"heap_adjust", metadata !"", i32 106, metadata !81, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64*, i64*, i32, i32)* @heap_adjust, null, null, metadata !84, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
!81 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{null, metadata !83, metadata !83, metadata !22, metadata !22}
!83 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90}
!85 = metadata !{i32 786689, metadata !80, metadata !"freq", metadata !5, i32 16777322, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [freq] [line 106]
!86 = metadata !{i32 786689, metadata !80, metadata !"heap", metadata !5, i32 33554538, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!87 = metadata !{i32 786689, metadata !80, metadata !"n", metadata !5, i32 50331754, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 106]
!88 = metadata !{i32 786689, metadata !80, metadata !"k", metadata !5, i32 67108970, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 106]
!89 = metadata !{i32 786688, metadata !80, metadata !"j", metadata !5, i32 112, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 112]
!90 = metadata !{i32 786688, metadata !80, metadata !"v", metadata !5, i32 116, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 116]
!91 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random4", metadata !"random4", metadata !"", i32 47, metadata !92, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !94, i32 48} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
!92 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !93, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = metadata !{metadata !11}
!94 = metadata !{metadata !95, metadata !97}
!95 = metadata !{i32 786688, metadata !91, metadata !"k", metadata !5, i32 49, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 49]
!96 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!97 = metadata !{i32 786688, metadata !91, metadata !"result", metadata !5, i32 50, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 50]
!98 = metadata !{metadata !99, metadata !101, metadata !99, metadata !102, metadata !104, metadata !105, metadata !104, metadata !106, metadata !107, metadata !102, metadata !108}
!99 = metadata !{i32 786484, i32 0, metadata !5, metadata !"TEST_SIZE", metadata !"TEST_SIZE", metadata !"TEST_SIZE", metadata !5, i32 79, metadata !100, i32 1, i32 1, i32 10000000, null} ; [ DW_TAG_variable ] [TEST_SIZE] [line 79] [local] [def]
!100 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!101 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NUM_LOOPS", metadata !"NUM_LOOPS", metadata !"NUM_LOOPS", metadata !5, i32 78, metadata !100, i32 1, i32 1, i32 30, null} ; [ DW_TAG_variable ] [NUM_LOOPS] [line 78] [local] [def]
!102 = metadata !{i32 786484, i32 0, metadata !5, metadata !"MASK", metadata !"MASK", metadata !"MASK", metadata !5, i32 44, metadata !103, i32 1, i32 1, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 44] [local] [def]
!103 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !96} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!104 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IQ", metadata !"IQ", metadata !"IQ", metadata !5, i32 42, metadata !103, i32 1, i32 1, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 42] [local] [def]
!105 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IA", metadata !"IA", metadata !"IA", metadata !5, i32 40, metadata !103, i32 1, i32 1, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 40] [local] [def]
!106 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IR", metadata !"IR", metadata !"IR", metadata !5, i32 43, metadata !103, i32 1, i32 1, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 43] [local] [def]
!107 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IM", metadata !"IM", metadata !"IM", metadata !5, i32 41, metadata !103, i32 1, i32 1, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 41] [local] [def]
!108 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 39, metadata !96, i32 1, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 39] [local] [def]
!109 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!110 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!111 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!112 = metadata !{i32 88, i32 0, metadata !4, null}
!113 = metadata !{null}
!114 = metadata !{i32 90, i32 0, metadata !4, null}
!115 = metadata !{i32 92, i32 0, metadata !4, null}
!116 = metadata !{i32 93, i32 0, metadata !4, null}
!117 = metadata !{i32 0}
!118 = metadata !{i32 96, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !4, i32 96, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!120 = metadata !{i32 52, i32 0, metadata !91, metadata !121}
!121 = metadata !{i32 98, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !119, i32 97, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!123 = metadata !{metadata !124, metadata !124, i64 0}
!124 = metadata !{metadata !"long", metadata !125, i64 0}
!125 = metadata !{metadata !"omnipotent char", metadata !126, i64 0}
!126 = metadata !{metadata !"Simple C/C++ TBAA"}
!127 = metadata !{i32 53, i32 0, metadata !91, metadata !121}
!128 = metadata !{i32 786688, metadata !91, metadata !"k", metadata !5, i32 49, metadata !96, i32 0, metadata !121} ; [ DW_TAG_auto_variable ] [k] [line 49]
!129 = metadata !{i32 54, i32 0, metadata !91, metadata !121}
!130 = metadata !{i32 56, i32 0, metadata !131, metadata !121}
!131 = metadata !{i32 786443, metadata !1, metadata !91, i32 56, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!132 = metadata !{i32 57, i32 0, metadata !131, metadata !121}
!133 = metadata !{i32 59, i32 0, metadata !91, metadata !121}
!134 = metadata !{i32 786688, metadata !91, metadata !"result", metadata !5, i32 50, metadata !11, i32 0, metadata !121} ; [ DW_TAG_auto_variable ] [result] [line 50]
!135 = metadata !{i32 60, i32 0, metadata !91, metadata !121}
!136 = metadata !{metadata !125, metadata !125, i64 0}
!137 = metadata !{i32 99, i32 0, metadata !122, null}
!138 = metadata !{i32 102, i32 0, metadata !4, null}
!139 = metadata !{i32 136, i32 0, metadata !23, null}
!140 = metadata !{i32 142, i32 0, metadata !23, null}
!141 = metadata !{i32 149, i32 0, metadata !23, null}
!142 = metadata !{i32 151, i32 0, metadata !23, null}
!143 = metadata !{i32 152, i32 0, metadata !23, null}
!144 = metadata !{i32 153, i32 0, metadata !23, null}
!145 = metadata !{i32 154, i32 0, metadata !23, null}
!146 = metadata !{i32 155, i32 0, metadata !23, null}
!147 = metadata !{i32 157, i32 0, metadata !23, null}
!148 = metadata !{i32 158, i32 0, metadata !23, null}
!149 = metadata !{i32 159, i32 0, metadata !23, null}
!150 = metadata !{i32 160, i32 0, metadata !23, null}
!151 = metadata !{i32 161, i32 0, metadata !23, null}
!152 = metadata !{i32 162, i32 0, metadata !23, null}
!153 = metadata !{i64 0}
!154 = metadata !{i32 165, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !23, i32 165, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!156 = metadata !{i32 167, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !155, i32 166, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!158 = metadata !{i32 168, i32 0, metadata !157, null}
!159 = metadata !{i32 183, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !23, i32 183, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!161 = metadata !{i32 184, i32 0, metadata !160, null}
!162 = metadata !{i32 176, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !164, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!164 = metadata !{i32 786443, metadata !1, metadata !165, i32 175, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!165 = metadata !{i32 786443, metadata !1, metadata !23, i32 174, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!166 = metadata !{i32 178, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !163, i32 177, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!168 = metadata !{i32 179, i32 0, metadata !167, null}
!169 = metadata !{i32 180, i32 0, metadata !167, null}
!170 = metadata !{i32 174, i32 0, metadata !165, null}
!171 = metadata !{i32 191, i32 0, metadata !23, null}
!172 = metadata !{i32 195, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !23, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!174 = metadata !{i32 199, i32 0, metadata !173, null}
!175 = metadata !{i32 194, i32 0, metadata !173, null}
!176 = metadata !{i64 1}
!177 = metadata !{i32 196, i32 0, metadata !173, null}
!178 = metadata !{i32 203, i32 0, metadata !173, null}
!179 = metadata !{i32 204, i32 0, metadata !173, null}
!180 = metadata !{metadata !181, metadata !181, i64 0}
!181 = metadata !{metadata !"int", metadata !125, i64 0}
!182 = metadata !{i32 205, i32 0, metadata !173, null}
!183 = metadata !{i32 206, i32 0, metadata !173, null}
!184 = metadata !{i32 209, i32 0, metadata !173, null}
!185 = metadata !{i32 212, i32 0, metadata !23, null}
!186 = metadata !{i32 215, i32 0, metadata !23, null}
!187 = metadata !{i32 218, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !23, i32 218, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!189 = metadata !{i32 220, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !191, i32 220, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!191 = metadata !{i32 786443, metadata !1, metadata !188, i32 219, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!192 = metadata !{i32 230, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !190, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!194 = metadata !{i32 232, i32 0, metadata !193, null}
!195 = metadata !{i32 222, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !190, i32 221, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!197 = metadata !{i32 223, i32 0, metadata !196, null}
!198 = metadata !{i32 224, i32 0, metadata !196, null}
!199 = metadata !{i32 234, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !201, i32 234, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!201 = metadata !{i32 786443, metadata !1, metadata !193, i32 233, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!202 = metadata !{i32 236, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !200, i32 235, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!204 = metadata !{i32 237, i32 0, metadata !203, null}
!205 = metadata !{i32 238, i32 0, metadata !203, null}
!206 = metadata !{i32 240, i32 0, metadata !201, null}
!207 = metadata !{i32 241, i32 0, metadata !201, null}
!208 = metadata !{i32 242, i32 0, metadata !201, null}
!209 = metadata !{i32 245, i32 0, metadata !193, null}
!210 = metadata !{i32 246, i32 0, metadata !193, null}
!211 = metadata !{i32 249, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !193, i32 249, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!213 = metadata !{i32 250, i32 0, metadata !212, null}
!214 = metadata !{i32 253, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !193, i32 253, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!216 = metadata !{i32 254, i32 0, metadata !215, null}
!217 = metadata !{i32 259, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !23, i32 259, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!219 = metadata !{i32 261, i32 0, metadata !220, null}
!220 = metadata !{i32 786443, metadata !1, metadata !218, i32 260, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!221 = metadata !{metadata !222, metadata !222, i64 0}
!222 = metadata !{metadata !"any pointer", metadata !125, i64 0}
!223 = metadata !{i32 262, i32 0, metadata !220, null}
!224 = metadata !{i32 266, i32 0, metadata !23, null}
!225 = metadata !{i8 0}
!226 = metadata !{i32 267, i32 0, metadata !23, null}
!227 = metadata !{i32 -1}
!228 = metadata !{i32 268, i32 0, metadata !23, null}
!229 = metadata !{i32 269, i32 0, metadata !23, null}
!230 = metadata !{i32 272, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !23, i32 272, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!232 = metadata !{i32 278, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !23, i32 278, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!234 = metadata !{i32 274, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !231, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!236 = metadata !{i32 275, i32 0, metadata !235, null}
!237 = metadata !{i32 281, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !233, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!239 = metadata !{i32 284, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !238, i32 284, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!241 = metadata !{i32 286, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !1, metadata !243, i32 286, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!243 = metadata !{i32 786443, metadata !1, metadata !240, i32 285, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!244 = metadata !{i32 289, i32 0, metadata !245, null}
!245 = metadata !{i32 786443, metadata !1, metadata !242, i32 287, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!246 = metadata !{i32 290, i32 0, metadata !245, null}
!247 = metadata !{i32 293, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !245, i32 293, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!249 = metadata !{i32 309, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !243, i32 309, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!251 = metadata !{i32 295, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !248, i32 294, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!253 = metadata !{i32 296, i32 0, metadata !252, null}
!254 = metadata !{i32 305, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !242, i32 303, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!256 = metadata !{i32 306, i32 0, metadata !255, null}
!257 = metadata !{i32 312, i32 0, metadata !243, null}
!258 = metadata !{i32 315, i32 0, metadata !238, null}
!259 = metadata !{i32 319, i32 0, metadata !23, null}
!260 = metadata !{i32 320, i32 0, metadata !23, null}
!261 = metadata !{i32 331, i32 0, metadata !23, null}
!262 = metadata !{i32 334, i32 0, metadata !23, null}
!263 = metadata !{i32 337, i32 0, metadata !23, null}
!264 = metadata !{i32 340, i32 0, metadata !23, null}
!265 = metadata !{i32 342, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !23, i32 342, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!267 = metadata !{i32 344, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !266, i32 343, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!269 = metadata !{i32 345, i32 0, metadata !268, null}
!270 = metadata !{i32 348, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !268, i32 348, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!272 = metadata !{i32 351, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !271, i32 349, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!274 = metadata !{i32 352, i32 0, metadata !273, null}
!275 = metadata !{i32 356, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !273, i32 356, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!277 = metadata !{i32 358, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !1, metadata !276, i32 357, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!279 = metadata !{i32 360, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !278, i32 360, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!281 = metadata !{i32 363, i32 0, metadata !278, null}
!282 = metadata !{i32 366, i32 0, metadata !273, null}
!283 = metadata !{i32 367, i32 0, metadata !273, null}
!284 = metadata !{i32 373, i32 0, metadata !285, null}
!285 = metadata !{i32 786443, metadata !1, metadata !286, i32 372, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!286 = metadata !{i32 786443, metadata !1, metadata !23, i32 371, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!287 = metadata !{i32 374, i32 0, metadata !285, null}
!288 = metadata !{i32 375, i32 0, metadata !285, null}
!289 = metadata !{i32 377, i32 0, metadata !285, null}
!290 = metadata !{i32 379, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !285, i32 378, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!292 = metadata !{i32 380, i32 0, metadata !291, null}
!293 = metadata !{i32 381, i32 0, metadata !291, null}
!294 = metadata !{i32 384, i32 0, metadata !285, null}
!295 = metadata !{i32 385, i32 0, metadata !285, null}
!296 = metadata !{i32 371, i32 0, metadata !286, null}
!297 = metadata !{i32 389, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !23, i32 389, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!299 = metadata !{i32 399, i32 0, metadata !23, null}
!300 = metadata !{i32 422, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !302, i32 421, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!302 = metadata !{i32 786443, metadata !1, metadata !23, i32 400, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!303 = metadata !{i32 401, i32 0, metadata !302, null}
!304 = metadata !{i32 403, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !302, i32 403, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!306 = metadata !{i32 407, i32 0, metadata !302, null}
!307 = metadata !{i32 408, i32 0, metadata !302, null}
!308 = metadata !{i32 411, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !302, i32 411, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!310 = metadata !{i32 413, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !1, metadata !309, i32 412, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!312 = metadata !{i32 414, i32 0, metadata !311, null}
!313 = metadata !{i32 415, i32 0, metadata !311, null}
!314 = metadata !{i32 416, i32 0, metadata !311, null}
!315 = metadata !{i32 417, i32 0, metadata !311, null}
!316 = metadata !{i32 418, i32 0, metadata !311, null}
!317 = metadata !{i32 421, i32 0, metadata !301, null}
!318 = metadata !{i64 128}
!319 = metadata !{i32 425, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !301, i32 424, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!321 = metadata !{i32 426, i32 0, metadata !320, null}
!322 = metadata !{i32 431, i32 0, metadata !23, null}
!323 = metadata !{i32 432, i32 0, metadata !23, null}
!324 = metadata !{i32 106, i32 0, metadata !80, null}
!325 = metadata !{i32 116, i32 0, metadata !80, null}
!326 = metadata !{i32 118, i32 0, metadata !80, null}
!327 = metadata !{i32 132, i32 0, metadata !80, null}
!328 = metadata !{i32 125, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !330, i32 125, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!330 = metadata !{i32 786443, metadata !1, metadata !80, i32 119, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!331 = metadata !{i32 120, i32 0, metadata !330, null}
!332 = metadata !{i32 122, i32 0, metadata !333, null}
!333 = metadata !{i32 786443, metadata !1, metadata !330, i32 122, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!334 = metadata !{i32 123, i32 0, metadata !333, null}
!335 = metadata !{i32 128, i32 0, metadata !330, null}
!336 = metadata !{i32 129, i32 0, metadata !330, null}
!337 = metadata !{i32 133, i32 0, metadata !80, null}
!338 = metadata !{i32 434, i32 0, metadata !67, null}
!339 = metadata !{i32 439, i32 0, metadata !67, null}
!340 = metadata !{i32 441, i32 0, metadata !341, null}
!341 = metadata !{i32 786443, metadata !1, metadata !67, i32 441, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!342 = metadata !{i32 445, i32 0, metadata !343, null}
!343 = metadata !{i32 786443, metadata !1, metadata !344, i32 445, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!344 = metadata !{i32 786443, metadata !1, metadata !345, i32 444, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!345 = metadata !{i32 786443, metadata !1, metadata !346, i32 443, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!346 = metadata !{i32 786443, metadata !1, metadata !341, i32 442, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!347 = metadata !{i32 443, i32 0, metadata !345, null}
!348 = metadata !{i32 454, i32 0, metadata !67, null}
!349 = metadata !{i32 467, i32 0, metadata !350, null}
!350 = metadata !{i32 786443, metadata !1, metadata !67, i32 467, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!351 = metadata !{i32 468, i32 0, metadata !350, null}
!352 = metadata !{double 0.000000e+00}
!353 = metadata !{i32 472, i32 0, metadata !67, null}
!354 = metadata !{i32 481, i32 0, metadata !67, null}
!355 = metadata !{i32 485, i32 0, metadata !356, null}
!356 = metadata !{i32 786443, metadata !1, metadata !67, i32 484, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!357 = metadata !{i32 484, i32 0, metadata !356, null}
!358 = metadata !{i32 487, i32 0, metadata !356, null}
!359 = metadata !{i32 489, i32 0, metadata !67, null}
!360 = metadata !{i32 492, i32 0, metadata !67, null}
