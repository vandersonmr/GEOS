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
  %ptr.01 = phi i8* [ %6, %.lr.ph ], [ %1, %0 ]
  %3 = tail call fastcc i64 @random4(), !dbg !133
  %4 = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %3, !dbg !133
  %5 = load i8* %4, align 1, !dbg !133, !tbaa !135
  store i8 %5, i8* %ptr.01, align 1, !dbg !133, !tbaa !135
  %6 = getelementptr inbounds i8* %ptr.01, i64 1, !dbg !138
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !20), !dbg !138
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !131
  %exitcond = icmp eq i64 %indvars.iv.next, %n, !dbg !131
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !131

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %1, !dbg !139
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
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !27), !dbg !140
  tail call void @llvm.dbg.value(metadata !{i64 %data_len}, i64 0, metadata !28), !dbg !140
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !38), !dbg !141
  %1 = add i64 %data_len, 1, !dbg !142
  %2 = tail call noalias i8* @malloc(i64 %1) #3, !dbg !142
  tail call void @llvm.dbg.value(metadata !{i8* %2}, i64 0, metadata !39), !dbg !142
  %3 = bitcast [512 x i64]* %freq to i8*, !dbg !143
  call void @llvm.lifetime.start(i64 4096, i8* %3) #3, !dbg !143
  tail call void @llvm.dbg.declare(metadata !{[512 x i64]* %freq}, metadata !40), !dbg !143
  %4 = bitcast [256 x i64]* %heap to i8*, !dbg !144
  call void @llvm.lifetime.start(i64 2048, i8* %4) #3, !dbg !144
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap}, metadata !44), !dbg !144
  %5 = bitcast [512 x i32]* %link to i8*, !dbg !145
  call void @llvm.lifetime.start(i64 2048, i8* %5) #3, !dbg !145
  tail call void @llvm.dbg.declare(metadata !{[512 x i32]* %link}, metadata !48), !dbg !145
  %6 = bitcast [256 x i64]* %code to i8*, !dbg !146
  call void @llvm.lifetime.start(i64 2048, i8* %6) #3, !dbg !146
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %code}, metadata !50), !dbg !146
  %7 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 0, !dbg !147
  call void @llvm.lifetime.start(i64 256, i8* %7) #3, !dbg !147
  tail call void @llvm.dbg.declare(metadata !{[256 x i8]* %clen}, metadata !52), !dbg !147
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %1, i32 1, i1 false), !dbg !148
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 4096, i32 16, i1 false), !dbg !149
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 2048, i32 16, i1 false), !dbg !150
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 2048, i32 16, i1 false), !dbg !151
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 2048, i32 16, i1 false), !dbg !152
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 256, i32 16, i1 false), !dbg !153
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !29), !dbg !155
  %8 = icmp eq i64 %data_len, 0, !dbg !155
  br i1 %8, label %.preheader10, label %.lr.ph87, !dbg !155

.lr.ph87:                                         ; preds = %0, %.lr.ph87
  %i.085 = phi i64 [ %15, %.lr.ph87 ], [ 0, %0 ]
  %dptr.084 = phi i8* [ %14, %.lr.ph87 ], [ %data, %0 ]
  %9 = load i8* %dptr.084, align 1, !dbg !157, !tbaa !135
  %10 = zext i8 %9 to i64, !dbg !157
  %11 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %10, !dbg !157
  %12 = load i64* %11, align 8, !dbg !157, !tbaa !159
  %13 = add i64 %12, 1, !dbg !157
  store i64 %13, i64* %11, align 8, !dbg !157, !tbaa !159
  %14 = getelementptr inbounds i8* %dptr.084, i64 1, !dbg !161
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !38), !dbg !161
  %15 = add i64 %i.085, 1, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !29), !dbg !155
  %exitcond100 = icmp eq i64 %15, %data_len, !dbg !155
  br i1 %exitcond100, label %.preheader10, label %.lr.ph87, !dbg !155

.preheader9:                                      ; preds = %26
  %16 = icmp eq i64 %n.1, 0, !dbg !162
  br i1 %16, label %._crit_edge78, label %.lr.ph81, !dbg !162

.lr.ph81:                                         ; preds = %.preheader9
  %17 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 0, !dbg !164
  %18 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !164
  %19 = trunc i64 %n.1 to i32, !dbg !164
  br label %31, !dbg !162

.preheader10:                                     ; preds = %0, %.lr.ph87, %26
  %i.183 = phi i64 [ %27, %26 ], [ 0, %.lr.ph87 ], [ 0, %0 ]
  %n.082 = phi i64 [ %n.1, %26 ], [ 0, %.lr.ph87 ], [ 0, %0 ]
  %20 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %i.183, !dbg !165
  %21 = load i64* %20, align 8, !dbg !165, !tbaa !159
  %22 = icmp eq i64 %21, 0, !dbg !165
  br i1 %22, label %26, label %23, !dbg !165

; <label>:23                                      ; preds = %.preheader10
  %24 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %n.082, !dbg !169
  store i64 %i.183, i64* %24, align 8, !dbg !169, !tbaa !159
  %25 = add i64 %n.082, 1, !dbg !171
  tail call void @llvm.dbg.value(metadata !{i64 %25}, i64 0, metadata !31), !dbg !171
  br label %26, !dbg !172

; <label>:26                                      ; preds = %.preheader10, %23
  %n.1 = phi i64 [ %25, %23 ], [ %n.082, %.preheader10 ]
  %27 = add i64 %i.183, 1, !dbg !173
  tail call void @llvm.dbg.value(metadata !{i64 %27}, i64 0, metadata !29), !dbg !173
  %exitcond99 = icmp eq i64 %27, 256, !dbg !173
  br i1 %exitcond99, label %.preheader9, label %.preheader10, !dbg !173

.preheader8:                                      ; preds = %31
  %28 = icmp ugt i64 %n.1, 1, !dbg !174
  br i1 %28, label %.lr.ph77, label %._crit_edge78, !dbg !174

.lr.ph77:                                         ; preds = %.preheader8
  %29 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !175
  %30 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 0, !dbg !177
  br label %35, !dbg !174

; <label>:31                                      ; preds = %.lr.ph81, %31
  %i.280 = phi i64 [ %n.1, %.lr.ph81 ], [ %33, %31 ]
  %32 = trunc i64 %i.280 to i32, !dbg !164
  call fastcc void @heap_adjust(i64* %17, i64* %18, i32 %19, i32 %32), !dbg !164
  %33 = add i64 %i.280, -1, !dbg !162
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !29), !dbg !162
  %34 = icmp eq i64 %33, 0, !dbg !162
  br i1 %34, label %.preheader8, label %31, !dbg !162

; <label>:35                                      ; preds = %.lr.ph77, %35
  %n.276 = phi i64 [ %n.1, %.lr.ph77 ], [ %36, %35 ]
  %36 = add i64 %n.276, -1, !dbg !178
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !31), !dbg !178
  %37 = load i64* %29, align 16, !dbg !175, !tbaa !159
  %38 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %36, !dbg !180
  %39 = load i64* %38, align 8, !dbg !180, !tbaa !159
  store i64 %39, i64* %29, align 16, !dbg !180, !tbaa !159
  %40 = trunc i64 %36 to i32, !dbg !177
  call fastcc void @heap_adjust(i64* %30, i64* %29, i32 %40, i32 1), !dbg !177
  %41 = load i64* %29, align 16, !dbg !181, !tbaa !159
  %42 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %41, !dbg !181
  %43 = load i64* %42, align 8, !dbg !181, !tbaa !159
  %44 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %37, !dbg !181
  %45 = load i64* %44, align 8, !dbg !181, !tbaa !159
  %46 = add i64 %45, %43, !dbg !181
  %47 = add i64 %n.276, 255, !dbg !181
  %48 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %47, !dbg !181
  store i64 %46, i64* %48, align 8, !dbg !181, !tbaa !159
  %49 = trunc i64 %47 to i32, !dbg !182
  %50 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %37, !dbg !182
  store i32 %49, i32* %50, align 4, !dbg !182, !tbaa !183
  %51 = sub i64 -255, %n.276, !dbg !185
  %52 = trunc i64 %51 to i32, !dbg !185
  %53 = load i64* %29, align 16, !dbg !185, !tbaa !159
  %54 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %53, !dbg !185
  store i32 %52, i32* %54, align 4, !dbg !185, !tbaa !183
  store i64 %47, i64* %29, align 16, !dbg !186, !tbaa !159
  call fastcc void @heap_adjust(i64* %30, i64* %29, i32 %40, i32 1), !dbg !187
  %55 = icmp ugt i64 %36, 1, !dbg !174
  br i1 %55, label %35, label %._crit_edge78, !dbg !174

._crit_edge78:                                    ; preds = %35, %.preheader9, %.preheader8
  %n.2.lcssa = phi i64 [ %n.1, %.preheader8 ], [ 0, %.preheader9 ], [ 1, %35 ]
  %56 = add i64 %n.2.lcssa, 256, !dbg !188
  %57 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %56, !dbg !188
  store i32 0, i32* %57, align 4, !dbg !188, !tbaa !183
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !57), !dbg !189
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !58), !dbg !189
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !55), !dbg !190
  br label %58, !dbg !190

; <label>:58                                      ; preds = %80, %._crit_edge78
  %maxi.075 = phi i64 [ 0, %._crit_edge78 ], [ %maxi.1, %80 ]
  %maxx.074 = phi i64 [ 0, %._crit_edge78 ], [ %maxx.2, %80 ]
  %m.073 = phi i64 [ 0, %._crit_edge78 ], [ %81, %80 ]
  %59 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %m.073, !dbg !192
  %60 = load i64* %59, align 8, !dbg !192, !tbaa !159
  %61 = icmp eq i64 %60, 0, !dbg !192
  br i1 %61, label %63, label %.preheader7, !dbg !192

.preheader7:                                      ; preds = %58
  %l.0.in63 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %m.073, !dbg !195
  %l.064 = load i32* %l.0.in63, align 4, !dbg !195
  %62 = icmp eq i32 %l.064, 0, !dbg !197
  br i1 %62, label %._crit_edge70, label %.lr.ph69, !dbg !197

; <label>:63                                      ; preds = %58
  %64 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.073, !dbg !198
  store i64 0, i64* %64, align 8, !dbg !198, !tbaa !159
  %65 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.073, !dbg !200
  store i8 0, i8* %65, align 1, !dbg !200, !tbaa !135
  br label %80, !dbg !201

.lr.ph69:                                         ; preds = %.preheader7, %70
  %l.068 = phi i32 [ %l.0, %70 ], [ %l.064, %.preheader7 ]
  %x.067 = phi i64 [ %x.1, %70 ], [ 0, %.preheader7 ]
  %i.366 = phi i64 [ %73, %70 ], [ 0, %.preheader7 ]
  %j.065 = phi i64 [ %72, %70 ], [ 1, %.preheader7 ]
  %66 = icmp slt i32 %l.068, 0, !dbg !202
  br i1 %66, label %67, label %70, !dbg !202

; <label>:67                                      ; preds = %.lr.ph69
  %68 = add i64 %x.067, %j.065, !dbg !205
  tail call void @llvm.dbg.value(metadata !{i64 %68}, i64 0, metadata !56), !dbg !205
  %69 = sub nsw i32 0, %l.068, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !59), !dbg !207
  br label %70, !dbg !208

; <label>:70                                      ; preds = %67, %.lr.ph69
  %x.1 = phi i64 [ %68, %67 ], [ %x.067, %.lr.ph69 ]
  %l.1 = phi i32 [ %69, %67 ], [ %l.068, %.lr.ph69 ]
  %71 = sext i32 %l.1 to i64, !dbg !209
  %72 = shl i64 %j.065, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i64 %72}, i64 0, metadata !30), !dbg !210
  %73 = add i64 %i.366, 1, !dbg !211
  tail call void @llvm.dbg.value(metadata !{i64 %73}, i64 0, metadata !29), !dbg !211
  %l.0.in = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %71, !dbg !195
  %l.0 = load i32* %l.0.in, align 4, !dbg !195
  %74 = icmp eq i32 %l.0, 0, !dbg !197
  br i1 %74, label %._crit_edge70, label %.lr.ph69, !dbg !197

._crit_edge70:                                    ; preds = %70, %.preheader7
  %x.0.lcssa = phi i64 [ 0, %.preheader7 ], [ %x.1, %70 ]
  %i.3.lcssa = phi i64 [ 0, %.preheader7 ], [ %73, %70 ]
  %75 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.073, !dbg !212
  store i64 %x.0.lcssa, i64* %75, align 8, !dbg !212, !tbaa !159
  %76 = trunc i64 %i.3.lcssa to i8, !dbg !213
  %77 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.073, !dbg !213
  store i8 %76, i8* %77, align 1, !dbg !213, !tbaa !135
  %78 = icmp ugt i64 %x.0.lcssa, %maxx.074, !dbg !214
  tail call void @llvm.dbg.value(metadata !{i64 %x.0.lcssa}, i64 0, metadata !57), !dbg !216
  %x.0.maxx.0 = select i1 %78, i64 %x.0.lcssa, i64 %maxx.074, !dbg !214
  %79 = icmp ugt i64 %i.3.lcssa, %maxi.075, !dbg !217
  tail call void @llvm.dbg.value(metadata !{i64 %i.3.lcssa}, i64 0, metadata !58), !dbg !219
  %i.3.maxi.0 = select i1 %79, i64 %i.3.lcssa, i64 %maxi.075, !dbg !217
  br label %80, !dbg !217

; <label>:80                                      ; preds = %._crit_edge70, %63
  %maxx.2 = phi i64 [ %maxx.074, %63 ], [ %x.0.maxx.0, %._crit_edge70 ]
  %maxi.1 = phi i64 [ %maxi.075, %63 ], [ %i.3.maxi.0, %._crit_edge70 ]
  %81 = add i64 %m.073, 1, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i64 %81}, i64 0, metadata !55), !dbg !190
  %exitcond98 = icmp eq i64 %81, 256, !dbg !190
  br i1 %exitcond98, label %82, label %58, !dbg !190

; <label>:82                                      ; preds = %80
  %83 = icmp ugt i64 %maxi.1, 64, !dbg !220
  br i1 %83, label %84, label %87, !dbg !220

; <label>:84                                      ; preds = %82
  %85 = load %struct._IO_FILE** @stderr, align 8, !dbg !222, !tbaa !224
  %86 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %85) #5, !dbg !222
  tail call void @exit(i32 1) #6, !dbg !226
  unreachable, !dbg !226

; <label>:87                                      ; preds = %82
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !60), !dbg !227
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !61), !dbg !229
  tail call void @llvm.dbg.value(metadata !230, i64 0, metadata !62), !dbg !231
  tail call void @llvm.dbg.value(metadata !{i8* %data}, i64 0, metadata !38), !dbg !232
  %88 = icmp eq i64 %maxx.2, 0, !dbg !233
  br i1 %88, label %90, label %.preheader6, !dbg !233

.preheader6:                                      ; preds = %87
  %89 = icmp eq i64 %data_len, 0, !dbg !235
  br i1 %89, label %._crit_edge59, label %.lr.ph58, !dbg !235

; <label>:90                                      ; preds = %87
  %91 = load %struct._IO_FILE** @stderr, align 8, !dbg !237, !tbaa !224
  %92 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %91) #5, !dbg !237
  tail call void @exit(i32 1) #6, !dbg !239
  unreachable, !dbg !239

.lr.ph58:                                         ; preds = %.preheader6, %._crit_edge49
  %bit.057 = phi i32 [ %bit.1.lcssa, %._crit_edge49 ], [ -1, %.preheader6 ]
  %bout.056 = phi i8 [ %bout.1.lcssa, %._crit_edge49 ], [ 0, %.preheader6 ]
  %comp_len.055 = phi i64 [ %comp_len.1.lcssa, %._crit_edge49 ], [ 0, %.preheader6 ]
  %j.154 = phi i64 [ %133, %._crit_edge49 ], [ 0, %.preheader6 ]
  %dptr.153 = phi i8* [ %132, %._crit_edge49 ], [ %data, %.preheader6 ]
  %93 = load i8* %dptr.153, align 1, !dbg !240, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %104}, i64 0, metadata !32), !dbg !240
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !29), !dbg !242
  %94 = zext i8 %93 to i64, !dbg !242
  %95 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %94, !dbg !242
  %96 = load i8* %95, align 1, !dbg !242, !tbaa !135
  %97 = icmp eq i8 %96, 0, !dbg !242
  br i1 %97, label %._crit_edge49, label %.lr.ph48, !dbg !242

.lr.ph48:                                         ; preds = %.lr.ph58
  %98 = zext i8 %93 to i64, !dbg !240
  %99 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %98, !dbg !240
  %100 = load i8* %99, align 1, !dbg !240, !tbaa !135
  %101 = zext i8 %100 to i32, !dbg !240
  %102 = add nsw i32 %101, -1, !dbg !240
  %103 = shl i32 1, %102, !dbg !240
  %104 = sext i32 %103 to i64, !dbg !240
  br label %105, !dbg !242

; <label>:105                                     ; preds = %.lr.ph48, %117
  %bit.146 = phi i32 [ %bit.057, %.lr.ph48 ], [ %bit.2, %117 ]
  %bout.145 = phi i8 [ %bout.056, %.lr.ph48 ], [ %bout.2., %117 ]
  %comp_len.144 = phi i64 [ %comp_len.055, %.lr.ph48 ], [ %comp_len.2, %117 ]
  %i.443 = phi i64 [ 0, %.lr.ph48 ], [ %125, %117 ]
  %mask.042 = phi i64 [ %104, %.lr.ph48 ], [ %124, %117 ]
  %106 = icmp eq i32 %bit.146, 7, !dbg !244
  br i1 %106, label %107, label %114, !dbg !244

; <label>:107                                     ; preds = %105
  %108 = getelementptr inbounds i8* %2, i64 %comp_len.144, !dbg !247
  store i8 %bout.145, i8* %108, align 1, !dbg !247, !tbaa !135
  %109 = add i64 %comp_len.144, 1, !dbg !249
  tail call void @llvm.dbg.value(metadata !{i64 %109}, i64 0, metadata !60), !dbg !249
  %110 = icmp eq i64 %109, %data_len, !dbg !250
  br i1 %110, label %111, label %117, !dbg !250

; <label>:111                                     ; preds = %107
  %112 = load %struct._IO_FILE** @stderr, align 8, !dbg !252, !tbaa !224
  %113 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %112) #5, !dbg !252
  tail call void @exit(i32 1) #6, !dbg !254
  unreachable, !dbg !254

; <label>:114                                     ; preds = %105
  %115 = add nsw i32 %bit.146, 1, !dbg !255
  tail call void @llvm.dbg.value(metadata !{i32 %115}, i64 0, metadata !62), !dbg !255
  %116 = shl i8 %bout.145, 1, !dbg !257
  tail call void @llvm.dbg.value(metadata !{i8 %116}, i64 0, metadata !61), !dbg !257
  br label %117

; <label>:117                                     ; preds = %107, %114
  %comp_len.2 = phi i64 [ %comp_len.144, %114 ], [ %109, %107 ]
  %bout.2 = phi i8 [ %116, %114 ], [ 0, %107 ]
  %bit.2 = phi i32 [ %115, %114 ], [ 0, %107 ]
  %118 = load i8* %dptr.153, align 1, !dbg !258, !tbaa !135
  %119 = zext i8 %118 to i64, !dbg !258
  %120 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %119, !dbg !258
  %121 = load i64* %120, align 8, !dbg !258, !tbaa !159
  %122 = and i64 %121, %mask.042, !dbg !258
  %not.3 = icmp ne i64 %122, 0, !dbg !258
  %123 = zext i1 %not.3 to i8, !dbg !258
  %bout.2. = or i8 %123, %bout.2, !dbg !258
  %124 = lshr i64 %mask.042, 1, !dbg !260
  tail call void @llvm.dbg.value(metadata !{i64 %124}, i64 0, metadata !32), !dbg !260
  %125 = add i64 %i.443, 1, !dbg !242
  tail call void @llvm.dbg.value(metadata !{i64 %125}, i64 0, metadata !29), !dbg !242
  %126 = load i8* %dptr.153, align 1, !dbg !242, !tbaa !135
  %127 = zext i8 %126 to i64, !dbg !242
  %128 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %127, !dbg !242
  %129 = load i8* %128, align 1, !dbg !242, !tbaa !135
  %130 = zext i8 %129 to i64, !dbg !242
  %131 = icmp ult i64 %125, %130, !dbg !242
  br i1 %131, label %105, label %._crit_edge49, !dbg !242

._crit_edge49:                                    ; preds = %117, %.lr.ph58
  %bit.1.lcssa = phi i32 [ %bit.057, %.lr.ph58 ], [ %bit.2, %117 ]
  %bout.1.lcssa = phi i8 [ %bout.056, %.lr.ph58 ], [ %bout.2., %117 ]
  %comp_len.1.lcssa = phi i64 [ %comp_len.055, %.lr.ph58 ], [ %comp_len.2, %117 ]
  %132 = getelementptr inbounds i8* %dptr.153, i64 1, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i8* %132}, i64 0, metadata !38), !dbg !261
  %133 = add i64 %j.154, 1, !dbg !235
  tail call void @llvm.dbg.value(metadata !{i64 %133}, i64 0, metadata !30), !dbg !235
  %134 = icmp ult i64 %133, %data_len, !dbg !235
  br i1 %134, label %.lr.ph58, label %._crit_edge59, !dbg !235

._crit_edge59:                                    ; preds = %._crit_edge49, %.preheader6
  %bit.0.lcssa = phi i32 [ -1, %.preheader6 ], [ %bit.1.lcssa, %._crit_edge49 ]
  %bout.0.lcssa = phi i8 [ 0, %.preheader6 ], [ %bout.1.lcssa, %._crit_edge49 ]
  %comp_len.0.lcssa = phi i64 [ 0, %.preheader6 ], [ %comp_len.1.lcssa, %._crit_edge49 ]
  %135 = sub nsw i32 7, %bit.0.lcssa, !dbg !262
  %136 = sext i8 %bout.0.lcssa to i32, !dbg !262
  %137 = shl i32 %136, %135, !dbg !262
  %138 = trunc i32 %137 to i8, !dbg !262
  tail call void @llvm.dbg.value(metadata !{i8 %138}, i64 0, metadata !61), !dbg !262
  %139 = getelementptr inbounds i8* %2, i64 %comp_len.0.lcssa, !dbg !263
  store i8 %138, i8* %139, align 1, !dbg !263, !tbaa !135
  %140 = bitcast [256 x i64]* %heap2 to i8*, !dbg !264
  call void @llvm.lifetime.start(i64 2048, i8* %140) #3, !dbg !264
  tail call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap2}, metadata !63), !dbg !264
  %141 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 0, !dbg !265
  call void @llvm.lifetime.start(i64 256, i8* %141) #3, !dbg !265
  tail call void @llvm.dbg.declare(metadata !{[256 x i8]* %outc}, metadata !64), !dbg !265
  call void @llvm.memset.p0i8.i64(i8* %140, i8 0, i64 2048, i32 16, i1 false), !dbg !266
  tail call void @llvm.dbg.value(metadata !{i8* %141}, i64 0, metadata !66), !dbg !267
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !30), !dbg !268
  br label %142, !dbg !268

; <label>:142                                     ; preds = %171, %._crit_edge59
  %optr.041 = phi i8* [ %141, %._crit_edge59 ], [ %144, %171 ]
  %j.240 = phi i64 [ 0, %._crit_edge59 ], [ %172, %171 ]
  %143 = trunc i64 %j.240 to i8, !dbg !270
  store i8 %143, i8* %optr.041, align 1, !dbg !270, !tbaa !135
  %144 = getelementptr inbounds i8* %optr.041, i64 1, !dbg !272
  tail call void @llvm.dbg.value(metadata !{i8* %144}, i64 0, metadata !66), !dbg !272
  %145 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %j.240, !dbg !273
  %146 = load i64* %145, align 8, !dbg !273, !tbaa !159
  %147 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %j.240, !dbg !273
  %148 = load i8* %147, align 1, !dbg !273, !tbaa !135
  %149 = zext i8 %148 to i64, !dbg !273
  %150 = or i64 %149, %146, !dbg !273
  %151 = icmp eq i64 %150, 0, !dbg !273
  br i1 %151, label %171, label %152, !dbg !273

; <label>:152                                     ; preds = %142
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !33), !dbg !275
  tail call void @llvm.dbg.value(metadata !{i64 %158}, i64 0, metadata !32), !dbg !277
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !29), !dbg !278
  %153 = load i8* %147, align 1, !dbg !278, !tbaa !135
  %154 = icmp eq i8 %153, 0, !dbg !278
  br i1 %154, label %._crit_edge38, label %.lr.ph37, !dbg !278

.lr.ph37:                                         ; preds = %152
  %155 = zext i8 %148 to i32, !dbg !277
  %156 = add nsw i32 %155, -1, !dbg !277
  %157 = shl i32 1, %156, !dbg !277
  %158 = sext i32 %157 to i64, !dbg !277
  %159 = load i64* %145, align 8, !dbg !280, !tbaa !159
  %160 = load i8* %147, align 1, !dbg !278, !tbaa !135
  %161 = zext i8 %160 to i64, !dbg !278
  br label %162, !dbg !278

; <label>:162                                     ; preds = %.lr.ph37, %162
  %i.535 = phi i64 [ 0, %.lr.ph37 ], [ %168, %162 ]
  %mask.134 = phi i64 [ %158, %.lr.ph37 ], [ %167, %162 ]
  %k.033 = phi i64 [ 0, %.lr.ph37 ], [ %., %162 ]
  %163 = shl i64 %k.033, 1, !dbg !283
  %164 = or i64 %163, 1, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i64 %164}, i64 0, metadata !33), !dbg !283
  %165 = and i64 %159, %mask.134, !dbg !280
  %not.2 = icmp ne i64 %165, 0, !dbg !280
  %166 = zext i1 %not.2 to i64, !dbg !280
  %. = add i64 %166, %164, !dbg !280
  %167 = lshr i64 %mask.134, 1, !dbg !284
  tail call void @llvm.dbg.value(metadata !{i64 %167}, i64 0, metadata !32), !dbg !284
  %168 = add i64 %i.535, 1, !dbg !278
  tail call void @llvm.dbg.value(metadata !{i64 %168}, i64 0, metadata !29), !dbg !278
  %169 = icmp ult i64 %168, %161, !dbg !278
  br i1 %169, label %162, label %._crit_edge38, !dbg !278

._crit_edge38:                                    ; preds = %162, %152
  %k.0.lcssa = phi i64 [ 0, %152 ], [ %., %162 ]
  %170 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.240, !dbg !285
  store i64 %k.0.lcssa, i64* %170, align 8, !dbg !285, !tbaa !159
  br label %171, !dbg !286

; <label>:171                                     ; preds = %142, %._crit_edge38
  %172 = add i64 %j.240, 1, !dbg !268
  tail call void @llvm.dbg.value(metadata !{i64 %172}, i64 0, metadata !30), !dbg !268
  %exitcond97 = icmp eq i64 %172, 256, !dbg !268
  br i1 %exitcond97, label %.lr.ph29, label %142, !dbg !268

.lr.ph29:                                         ; preds = %171, %.critedge
  %i.632 = phi i64 [ %190, %.critedge ], [ 1, %171 ]
  %173 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.632, !dbg !287
  %174 = load i64* %173, align 8, !dbg !287, !tbaa !159
  tail call void @llvm.dbg.value(metadata !{i64 %174}, i64 0, metadata !35), !dbg !287
  %175 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.632, !dbg !290
  %176 = load i8* %175, align 1, !dbg !290, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i8 %176}, i64 0, metadata !36), !dbg !290
  tail call void @llvm.dbg.value(metadata !{i64 %i.632}, i64 0, metadata !30), !dbg !291
  br label %177, !dbg !292

; <label>:177                                     ; preds = %.lr.ph29, %182
  %j.327 = phi i64 [ %i.632, %.lr.ph29 ], [ %178, %182 ]
  %178 = add i64 %j.327, -1, !dbg !292
  %179 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %178, !dbg !292
  %180 = load i64* %179, align 8, !dbg !292, !tbaa !159
  %181 = icmp ugt i64 %180, %174, !dbg !292
  br i1 %181, label %182, label %.critedge

; <label>:182                                     ; preds = %177
  %183 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.327, !dbg !293
  store i64 %180, i64* %183, align 8, !dbg !293, !tbaa !159
  %184 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %178, !dbg !295
  %185 = load i8* %184, align 1, !dbg !295, !tbaa !135
  %186 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.327, !dbg !295
  store i8 %185, i8* %186, align 1, !dbg !295, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %178}, i64 0, metadata !30), !dbg !296
  %187 = icmp eq i64 %178, 0, !dbg !292
  br i1 %187, label %.critedge, label %177, !dbg !292

.critedge:                                        ; preds = %177, %182
  %j.3.lcssa = phi i64 [ 0, %182 ], [ %j.327, %177 ]
  %188 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3.lcssa, !dbg !297
  store i64 %174, i64* %188, align 8, !dbg !297, !tbaa !159
  %189 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3.lcssa, !dbg !298
  store i8 %176, i8* %189, align 1, !dbg !298, !tbaa !135
  %190 = add i64 %i.632, 1, !dbg !299
  tail call void @llvm.dbg.value(metadata !{i64 %190}, i64 0, metadata !29), !dbg !299
  %exitcond = icmp eq i64 %190, 256, !dbg !299
  br i1 %exitcond, label %.preheader4, label %.lr.ph29, !dbg !299

.preheader4:                                      ; preds = %.critedge, %.preheader4
  %j.4 = phi i64 [ %194, %.preheader4 ], [ 0, %.critedge ]
  %191 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.4, !dbg !300
  %192 = load i64* %191, align 8, !dbg !300, !tbaa !159
  %193 = icmp eq i64 %192, 0, !dbg !300
  %194 = add i64 %j.4, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata !{i64 %194}, i64 0, metadata !30), !dbg !300
  br i1 %193, label %.preheader4, label %.preheader, !dbg !300

.preheader:                                       ; preds = %.preheader4
  %195 = icmp eq i64 %data_len, 0, !dbg !302
  br i1 %195, label %.outer._crit_edge, label %.lr.ph, !dbg !302

; <label>:196                                     ; preds = %218
  %197 = lshr i64 %mask.218, 1, !dbg !303
  %198 = icmp ult i64 %n.4, %data_len, !dbg !302
  br i1 %198, label %199, label %.outer._crit_edge, !dbg !302

; <label>:199                                     ; preds = %.lr.ph, %196
  %i.721 = phi i64 [ %i.7.ph26, %.lr.ph ], [ %i.9, %196 ]
  %dptr.220 = phi i8* [ %dptr.2.ph25, %.lr.ph ], [ %dptr.3, %196 ]
  %n.319 = phi i64 [ %n.3.ph23, %.lr.ph ], [ %n.4, %196 ]
  %mask.218 = phi i64 [ 128, %.lr.ph ], [ %197, %196 ]
  %k.217 = phi i64 [ %k.2.ph22, %.lr.ph ], [ %k.4, %196 ]
  %200 = shl i64 %k.217, 1, !dbg !306
  %201 = or i64 %200, 1, !dbg !306
  tail call void @llvm.dbg.value(metadata !{i64 %201}, i64 0, metadata !33), !dbg !306
  %202 = load i8* %cptr.0.ph24, align 1, !dbg !307, !tbaa !135
  %203 = zext i8 %202 to i64, !dbg !307
  %204 = and i64 %203, %mask.218, !dbg !307
  %not. = icmp ne i64 %204, 0, !dbg !307
  %205 = zext i1 %not. to i64, !dbg !307
  %.1 = add i64 %205, %201, !dbg !307
  br label %206, !dbg !307

; <label>:206                                     ; preds = %206, %199
  %i.8 = phi i64 [ %210, %206 ], [ %i.721, %199 ]
  %207 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.8, !dbg !309
  %208 = load i64* %207, align 8, !dbg !309, !tbaa !159
  %209 = icmp ult i64 %208, %.1, !dbg !309
  %210 = add i64 %i.8, 1, !dbg !310
  tail call void @llvm.dbg.value(metadata !{i64 %210}, i64 0, metadata !29), !dbg !310
  br i1 %209, label %206, label %211, !dbg !309

; <label>:211                                     ; preds = %206
  %212 = icmp eq i64 %.1, %208, !dbg !311
  br i1 %212, label %213, label %218, !dbg !311

; <label>:213                                     ; preds = %211
  %214 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.8, !dbg !313
  %215 = load i8* %214, align 1, !dbg !313, !tbaa !135
  store i8 %215, i8* %dptr.220, align 1, !dbg !313, !tbaa !135
  %216 = getelementptr inbounds i8* %dptr.220, i64 1, !dbg !315
  tail call void @llvm.dbg.value(metadata !{i8* %216}, i64 0, metadata !38), !dbg !315
  %217 = add i64 %n.319, 1, !dbg !316
  tail call void @llvm.dbg.value(metadata !{i64 %217}, i64 0, metadata !31), !dbg !316
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !33), !dbg !317
  tail call void @llvm.dbg.value(metadata !{i64 %j.4}, i64 0, metadata !29), !dbg !318
  br label %218, !dbg !319

; <label>:218                                     ; preds = %213, %211
  %k.4 = phi i64 [ 0, %213 ], [ %.1, %211 ]
  %n.4 = phi i64 [ %217, %213 ], [ %n.319, %211 ]
  %dptr.3 = phi i8* [ %216, %213 ], [ %dptr.220, %211 ]
  %i.9 = phi i64 [ %j.4, %213 ], [ %i.8, %211 ]
  %219 = icmp ugt i64 %mask.218, 1, !dbg !320
  tail call void @llvm.dbg.value(metadata !{i64 %197}, i64 0, metadata !32), !dbg !303
  br i1 %219, label %196, label %.outer, !dbg !320

.outer:                                           ; preds = %218
  tail call void @llvm.dbg.value(metadata !321, i64 0, metadata !32), !dbg !322
  %220 = getelementptr inbounds i8* %cptr.0.ph24, i64 1, !dbg !324
  tail call void @llvm.dbg.value(metadata !{i8* %220}, i64 0, metadata !37), !dbg !324
  %221 = icmp ult i64 %n.4, %data_len, !dbg !302
  br i1 %221, label %.lr.ph, label %.outer._crit_edge, !dbg !302

.lr.ph:                                           ; preds = %.preheader, %.outer
  %i.7.ph26 = phi i64 [ %i.9, %.outer ], [ %j.4, %.preheader ]
  %dptr.2.ph25 = phi i8* [ %dptr.3, %.outer ], [ %data, %.preheader ]
  %cptr.0.ph24 = phi i8* [ %220, %.outer ], [ %2, %.preheader ]
  %n.3.ph23 = phi i64 [ %n.4, %.outer ], [ 0, %.preheader ]
  %k.2.ph22 = phi i64 [ %k.4, %.outer ], [ 0, %.preheader ]
  br label %199, !dbg !302

.outer._crit_edge:                                ; preds = %.outer, %196, %.preheader
  tail call void @free(i8* %2) #3, !dbg !325
  call void @llvm.lifetime.end(i64 256, i8* %141) #3, !dbg !326
  call void @llvm.lifetime.end(i64 2048, i8* %140) #3, !dbg !326
  call void @llvm.lifetime.end(i64 256, i8* %7) #3, !dbg !326
  call void @llvm.lifetime.end(i64 2048, i8* %6) #3, !dbg !326
  call void @llvm.lifetime.end(i64 2048, i8* %5) #3, !dbg !326
  call void @llvm.lifetime.end(i64 2048, i8* %4) #3, !dbg !326
  call void @llvm.lifetime.end(i64 4096, i8* %3) #3, !dbg !326
  ret void, !dbg !326
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @heap_adjust(i64* nocapture readonly %freq, i64* nocapture %heap, i32 %n, i32 %k) #0 {
  tail call void @llvm.dbg.value(metadata !{i64* %freq}, i64 0, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i64* %heap}, i64 0, metadata !99), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !100), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !101), !dbg !327
  %1 = sext i32 %k to i64, !dbg !328
  %.sum = add i64 %1, -1, !dbg !328
  %2 = getelementptr inbounds i64* %heap, i64 %.sum, !dbg !328
  %3 = load i64* %2, align 8, !dbg !328, !tbaa !159
  %4 = sdiv i32 %n, 2, !dbg !329
  %5 = icmp slt i32 %4, %k, !dbg !329
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !329

.lr.ph:                                           ; preds = %0
  %sext2 = shl i64 %3, 32, !dbg !330
  %6 = ashr exact i64 %sext2, 32, !dbg !330
  %7 = getelementptr inbounds i64* %freq, i64 %6, !dbg !330
  br label %8, !dbg !329

; <label>:8                                       ; preds = %.lr.ph, %32
  %.07 = phi i32 [ %k, %.lr.ph ], [ %j.0, %32 ]
  %9 = shl nsw i32 %.07, 1, !dbg !333
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !102), !dbg !333
  %10 = icmp slt i32 %9, %n, !dbg !334
  br i1 %10, label %11, label %24, !dbg !334

; <label>:11                                      ; preds = %8
  %12 = sext i32 %9 to i64, !dbg !334
  %.sum5 = add i64 %12, -1, !dbg !334
  %13 = getelementptr inbounds i64* %heap, i64 %.sum5, !dbg !334
  %14 = load i64* %13, align 8, !dbg !334, !tbaa !159
  %15 = getelementptr inbounds i64* %freq, i64 %14, !dbg !334
  %16 = load i64* %15, align 8, !dbg !334, !tbaa !159
  %17 = or i32 %9, 1, !dbg !334
  %18 = sext i32 %17 to i64, !dbg !334
  %.sum6 = add i64 %18, -1, !dbg !334
  %19 = getelementptr inbounds i64* %heap, i64 %.sum6, !dbg !334
  %20 = load i64* %19, align 8, !dbg !334, !tbaa !159
  %21 = getelementptr inbounds i64* %freq, i64 %20, !dbg !334
  %22 = load i64* %21, align 8, !dbg !334, !tbaa !159
  %23 = icmp ugt i64 %16, %22, !dbg !334
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !102), !dbg !336
  %. = select i1 %23, i32 %17, i32 %9, !dbg !334
  br label %24, !dbg !334

; <label>:24                                      ; preds = %11, %8
  %j.0 = phi i32 [ %9, %8 ], [ %., %11 ]
  %25 = load i64* %7, align 8, !dbg !330, !tbaa !159
  %26 = sext i32 %j.0 to i64, !dbg !330
  %.sum3 = add i64 %26, -1, !dbg !330
  %27 = getelementptr inbounds i64* %heap, i64 %.sum3, !dbg !330
  %28 = load i64* %27, align 8, !dbg !330, !tbaa !159
  %29 = getelementptr inbounds i64* %freq, i64 %28, !dbg !330
  %30 = load i64* %29, align 8, !dbg !330, !tbaa !159
  %31 = icmp ult i64 %25, %30, !dbg !330
  br i1 %31, label %._crit_edge, label %32, !dbg !330

; <label>:32                                      ; preds = %24
  %33 = sext i32 %.07 to i64, !dbg !337
  %.sum4 = add i64 %33, -1, !dbg !337
  %34 = getelementptr inbounds i64* %heap, i64 %.sum4, !dbg !337
  store i64 %28, i64* %34, align 8, !dbg !337, !tbaa !159
  tail call void @llvm.dbg.value(metadata !{i32 %j.0}, i64 0, metadata !101), !dbg !338
  %35 = icmp sgt i32 %j.0, %4, !dbg !329
  br i1 %35, label %._crit_edge, label %8, !dbg !329

._crit_edge:                                      ; preds = %24, %32, %0
  %.0.lcssa = phi i32 [ %k, %0 ], [ %.07, %24 ], [ %j.0, %32 ]
  %sext = shl i64 %3, 32, !dbg !339
  %36 = ashr exact i64 %sext, 32, !dbg !339
  %37 = sext i32 %.0.lcssa to i64, !dbg !339
  %.sum1 = add i64 %37, -1, !dbg !339
  %38 = getelementptr inbounds i64* %heap, i64 %.sum1, !dbg !339
  store i64 %36, i64* %38, align 8, !dbg !339, !tbaa !159
  ret void, !dbg !340
}

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
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !72), !dbg !341
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !73), !dbg !341
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !75), !dbg !342
  %1 = icmp sgt i32 %argc, 1, !dbg !343
  br i1 %1, label %.lr.ph, label %.loopexit, !dbg !343

.lr.ph:                                           ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !344
  %3 = load i8** %2, align 8, !dbg !344, !tbaa !224
  %4 = load i8* %3, align 1, !dbg !344, !tbaa !135
  %5 = zext i8 %4 to i32, !dbg !344
  %6 = sub nsw i32 45, %5, !dbg !344
  %7 = icmp eq i8 %4, 45, !dbg !345
  %8 = getelementptr inbounds i8* %3, i64 1, !dbg !347
  %9 = getelementptr inbounds i8* %3, i64 2, !dbg !349
  %10 = getelementptr inbounds i8* %3, i64 3, !dbg !352
  br label %13, !dbg !354

; <label>:11                                      ; preds = %28
  %12 = icmp slt i32 %29, %argc, !dbg !354
  br i1 %12, label %13, label %.loopexit, !dbg !354

; <label>:13                                      ; preds = %.lr.ph, %11
  %i.07 = phi i32 [ 1, %.lr.ph ], [ %29, %11 ]
  tail call void @llvm.dbg.value(metadata !355, i64 0, metadata !84), !dbg !356
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !85), !dbg !344
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !89), !dbg !344
  br i1 %7, label %14, label %28, !dbg !345

; <label>:14                                      ; preds = %13
  %15 = load i8* %8, align 1, !dbg !347, !tbaa !135
  %16 = zext i8 %15 to i32, !dbg !347
  %17 = sub nsw i32 103, %16, !dbg !347
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !89), !dbg !347
  %18 = icmp eq i8 %15, 103, !dbg !357
  br i1 %18, label %19, label %28, !dbg !357

; <label>:19                                      ; preds = %14
  %20 = load i8* %9, align 1, !dbg !349, !tbaa !135
  %21 = zext i8 %20 to i32, !dbg !349
  %22 = sub nsw i32 97, %21, !dbg !349
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !89), !dbg !349
  %23 = icmp eq i8 %20, 97, !dbg !352
  br i1 %23, label %24, label %28, !dbg !352

; <label>:24                                      ; preds = %19
  %25 = load i8* %10, align 1, !dbg !352, !tbaa !135
  %26 = zext i8 %25 to i32, !dbg !352
  %27 = sub nsw i32 0, %26, !dbg !352
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !89), !dbg !352
  br label %28, !dbg !352

; <label>:28                                      ; preds = %14, %24, %19, %13
  %__result.0 = phi i32 [ %27, %24 ], [ %22, %19 ], [ %17, %14 ], [ %6, %13 ]
  %phitmp = icmp eq i32 %__result.0, 0, !dbg !344
  %29 = add nsw i32 %i.07, 1, !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !74), !dbg !354
  br i1 %phitmp, label %.loopexit, label %11, !dbg !356

.loopexit:                                        ; preds = %11, %28, %0
  %ga_testing.0 = phi i1 [ false, %0 ], [ false, %11 ], [ true, %28 ]
  %30 = tail call i8* @generate_test_data(i64 10000000), !dbg !358
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !90), !dbg !358
  tail call void @llvm.dbg.value(metadata !130, i64 0, metadata !74), !dbg !359
  br label %31, !dbg !359

; <label>:31                                      ; preds = %31, %.loopexit
  %i.16 = phi i32 [ 0, %.loopexit ], [ %32, %31 ]
  tail call void @compdecomp(i8* %30, i64 10000000), !dbg !361
  %32 = add nsw i32 %i.16, 1, !dbg !359
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !74), !dbg !359
  %exitcond = icmp eq i32 %32, 30, !dbg !359
  br i1 %exitcond, label %33, label %31, !dbg !359

; <label>:33                                      ; preds = %31
  tail call void @llvm.dbg.value(metadata !362, i64 0, metadata !91), !dbg !363
  tail call void @free(i8* %30) #3, !dbg !364
  %34 = load %struct._IO_FILE** @stdout, align 8, !dbg !365, !tbaa !224
  br i1 %ga_testing.0, label %35, label %37, !dbg !367

; <label>:35                                      ; preds = %33
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), double 0.000000e+00) #3, !dbg !365
  br label %39, !dbg !365

; <label>:37                                      ; preds = %33
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([35 x i8]* @.str6, i64 0, i64 0), double 0.000000e+00) #3, !dbg !368
  br label %39

; <label>:39                                      ; preds = %37, %35
  %40 = load %struct._IO_FILE** @stdout, align 8, !dbg !369, !tbaa !224
  %41 = tail call i32 @fflush(%struct._IO_FILE* %40) #3, !dbg !369
  ret i32 0, !dbg !370
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind uwtable
define internal fastcc i64 @random4() #0 {
  %1 = load i64* @seed, align 8, !dbg !371, !tbaa !159
  %2 = xor i64 %1, 123459876, !dbg !371
  %3 = sdiv i64 %2, 127773, !dbg !372
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !108), !dbg !372
  %4 = mul i64 %3, -127773, !dbg !373
  %5 = add i64 %4, %2, !dbg !373
  %6 = mul nsw i64 %5, 16807, !dbg !373
  %7 = mul i64 %3, -2836, !dbg !373
  %8 = add i64 %6, %7, !dbg !373
  %9 = icmp slt i64 %8, 0, !dbg !374
  %10 = add nsw i64 %8, 2147483647, !dbg !376
  %. = select i1 %9, i64 %10, i64 %8, !dbg !374
  %11 = srem i64 %., 32, !dbg !377
  tail call void @llvm.dbg.value(metadata !{i64 %11}, i64 0, metadata !110), !dbg !377
  %12 = xor i64 %., 123459876, !dbg !378
  store i64 %12, i64* @seed, align 8, !dbg !378, !tbaa !159
  ret i64 %11, !dbg !379
}

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
!93 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"heap_adjust", metadata !"heap_adjust", metadata !"", i32 106, metadata !94, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64*, i64*, i32, i32)* @heap_adjust, null, null, metadata !97, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
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
!104 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random4", metadata !"random4", metadata !"", i32 47, metadata !105, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, i64 ()* @random4, null, null, metadata !107, i32 48} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
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
!126 = metadata !{i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0)}
!127 = metadata !{i32 90, i32 0, metadata !4, null}
!128 = metadata !{i32 92, i32 0, metadata !4, null}
!129 = metadata !{i32 93, i32 0, metadata !4, null}
!130 = metadata !{i32 0}
!131 = metadata !{i32 96, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !4, i32 96, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!133 = metadata !{i32 98, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !132, i32 97, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!135 = metadata !{metadata !136, metadata !136, i64 0}
!136 = metadata !{metadata !"omnipotent char", metadata !137, i64 0}
!137 = metadata !{metadata !"Simple C/C++ TBAA"}
!138 = metadata !{i32 99, i32 0, metadata !134, null}
!139 = metadata !{i32 102, i32 0, metadata !4, null}
!140 = metadata !{i32 136, i32 0, metadata !23, null}
!141 = metadata !{i32 142, i32 0, metadata !23, null}
!142 = metadata !{i32 149, i32 0, metadata !23, null}
!143 = metadata !{i32 151, i32 0, metadata !23, null}
!144 = metadata !{i32 152, i32 0, metadata !23, null}
!145 = metadata !{i32 153, i32 0, metadata !23, null}
!146 = metadata !{i32 154, i32 0, metadata !23, null}
!147 = metadata !{i32 155, i32 0, metadata !23, null}
!148 = metadata !{i32 157, i32 0, metadata !23, null}
!149 = metadata !{i32 158, i32 0, metadata !23, null}
!150 = metadata !{i32 159, i32 0, metadata !23, null}
!151 = metadata !{i32 160, i32 0, metadata !23, null}
!152 = metadata !{i32 161, i32 0, metadata !23, null}
!153 = metadata !{i32 162, i32 0, metadata !23, null}
!154 = metadata !{i64 0}
!155 = metadata !{i32 165, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !23, i32 165, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!157 = metadata !{i32 167, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !156, i32 166, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!159 = metadata !{metadata !160, metadata !160, i64 0}
!160 = metadata !{metadata !"long", metadata !136, i64 0}
!161 = metadata !{i32 168, i32 0, metadata !158, null}
!162 = metadata !{i32 183, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !23, i32 183, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!164 = metadata !{i32 184, i32 0, metadata !163, null}
!165 = metadata !{i32 176, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !167, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!167 = metadata !{i32 786443, metadata !1, metadata !168, i32 175, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!168 = metadata !{i32 786443, metadata !1, metadata !23, i32 174, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!169 = metadata !{i32 178, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !166, i32 177, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!171 = metadata !{i32 179, i32 0, metadata !170, null}
!172 = metadata !{i32 180, i32 0, metadata !170, null}
!173 = metadata !{i32 174, i32 0, metadata !168, null}
!174 = metadata !{i32 191, i32 0, metadata !23, null}
!175 = metadata !{i32 195, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !23, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!177 = metadata !{i32 199, i32 0, metadata !176, null}
!178 = metadata !{i32 194, i32 0, metadata !176, null}
!179 = metadata !{i64 1}
!180 = metadata !{i32 196, i32 0, metadata !176, null}
!181 = metadata !{i32 203, i32 0, metadata !176, null}
!182 = metadata !{i32 204, i32 0, metadata !176, null}
!183 = metadata !{metadata !184, metadata !184, i64 0}
!184 = metadata !{metadata !"int", metadata !136, i64 0}
!185 = metadata !{i32 205, i32 0, metadata !176, null}
!186 = metadata !{i32 206, i32 0, metadata !176, null}
!187 = metadata !{i32 209, i32 0, metadata !176, null}
!188 = metadata !{i32 212, i32 0, metadata !23, null}
!189 = metadata !{i32 215, i32 0, metadata !23, null}
!190 = metadata !{i32 218, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !23, i32 218, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!192 = metadata !{i32 220, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !194, i32 220, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!194 = metadata !{i32 786443, metadata !1, metadata !191, i32 219, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!195 = metadata !{i32 230, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !193, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!197 = metadata !{i32 232, i32 0, metadata !196, null}
!198 = metadata !{i32 222, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !193, i32 221, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!200 = metadata !{i32 223, i32 0, metadata !199, null}
!201 = metadata !{i32 224, i32 0, metadata !199, null}
!202 = metadata !{i32 234, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !204, i32 234, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!204 = metadata !{i32 786443, metadata !1, metadata !196, i32 233, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!205 = metadata !{i32 236, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !1, metadata !203, i32 235, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!207 = metadata !{i32 237, i32 0, metadata !206, null}
!208 = metadata !{i32 238, i32 0, metadata !206, null}
!209 = metadata !{i32 240, i32 0, metadata !204, null}
!210 = metadata !{i32 241, i32 0, metadata !204, null}
!211 = metadata !{i32 242, i32 0, metadata !204, null}
!212 = metadata !{i32 245, i32 0, metadata !196, null}
!213 = metadata !{i32 246, i32 0, metadata !196, null}
!214 = metadata !{i32 249, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !196, i32 249, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!216 = metadata !{i32 250, i32 0, metadata !215, null}
!217 = metadata !{i32 253, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !196, i32 253, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!219 = metadata !{i32 254, i32 0, metadata !218, null}
!220 = metadata !{i32 259, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !23, i32 259, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!222 = metadata !{i32 261, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !221, i32 260, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!224 = metadata !{metadata !225, metadata !225, i64 0}
!225 = metadata !{metadata !"any pointer", metadata !136, i64 0}
!226 = metadata !{i32 262, i32 0, metadata !223, null}
!227 = metadata !{i32 266, i32 0, metadata !23, null}
!228 = metadata !{i8 0}
!229 = metadata !{i32 267, i32 0, metadata !23, null}
!230 = metadata !{i32 -1}
!231 = metadata !{i32 268, i32 0, metadata !23, null}
!232 = metadata !{i32 269, i32 0, metadata !23, null}
!233 = metadata !{i32 272, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !23, i32 272, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!235 = metadata !{i32 278, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !23, i32 278, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!237 = metadata !{i32 274, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !234, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!239 = metadata !{i32 275, i32 0, metadata !238, null}
!240 = metadata !{i32 281, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !236, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!242 = metadata !{i32 284, i32 0, metadata !243, null}
!243 = metadata !{i32 786443, metadata !1, metadata !241, i32 284, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!244 = metadata !{i32 286, i32 0, metadata !245, null}
!245 = metadata !{i32 786443, metadata !1, metadata !246, i32 286, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!246 = metadata !{i32 786443, metadata !1, metadata !243, i32 285, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!247 = metadata !{i32 289, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !245, i32 287, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!249 = metadata !{i32 290, i32 0, metadata !248, null}
!250 = metadata !{i32 293, i32 0, metadata !251, null}
!251 = metadata !{i32 786443, metadata !1, metadata !248, i32 293, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!252 = metadata !{i32 295, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !251, i32 294, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!254 = metadata !{i32 296, i32 0, metadata !253, null}
!255 = metadata !{i32 305, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !245, i32 303, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!257 = metadata !{i32 306, i32 0, metadata !256, null}
!258 = metadata !{i32 309, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !246, i32 309, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!260 = metadata !{i32 312, i32 0, metadata !246, null}
!261 = metadata !{i32 315, i32 0, metadata !241, null}
!262 = metadata !{i32 319, i32 0, metadata !23, null}
!263 = metadata !{i32 320, i32 0, metadata !23, null}
!264 = metadata !{i32 331, i32 0, metadata !23, null}
!265 = metadata !{i32 334, i32 0, metadata !23, null}
!266 = metadata !{i32 337, i32 0, metadata !23, null}
!267 = metadata !{i32 340, i32 0, metadata !23, null}
!268 = metadata !{i32 342, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !23, i32 342, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!270 = metadata !{i32 344, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !269, i32 343, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!272 = metadata !{i32 345, i32 0, metadata !271, null}
!273 = metadata !{i32 348, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !271, i32 348, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!275 = metadata !{i32 351, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !274, i32 349, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!277 = metadata !{i32 352, i32 0, metadata !276, null}
!278 = metadata !{i32 356, i32 0, metadata !279, null}
!279 = metadata !{i32 786443, metadata !1, metadata !276, i32 356, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!280 = metadata !{i32 360, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !1, metadata !282, i32 360, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!282 = metadata !{i32 786443, metadata !1, metadata !279, i32 357, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!283 = metadata !{i32 358, i32 0, metadata !282, null}
!284 = metadata !{i32 363, i32 0, metadata !282, null}
!285 = metadata !{i32 366, i32 0, metadata !276, null}
!286 = metadata !{i32 367, i32 0, metadata !276, null}
!287 = metadata !{i32 373, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !289, i32 372, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!289 = metadata !{i32 786443, metadata !1, metadata !23, i32 371, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!290 = metadata !{i32 374, i32 0, metadata !288, null}
!291 = metadata !{i32 375, i32 0, metadata !288, null}
!292 = metadata !{i32 377, i32 0, metadata !288, null}
!293 = metadata !{i32 379, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !288, i32 378, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!295 = metadata !{i32 380, i32 0, metadata !294, null}
!296 = metadata !{i32 381, i32 0, metadata !294, null}
!297 = metadata !{i32 384, i32 0, metadata !288, null}
!298 = metadata !{i32 385, i32 0, metadata !288, null}
!299 = metadata !{i32 371, i32 0, metadata !289, null}
!300 = metadata !{i32 389, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !23, i32 389, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!302 = metadata !{i32 399, i32 0, metadata !23, null}
!303 = metadata !{i32 422, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !305, i32 421, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!305 = metadata !{i32 786443, metadata !1, metadata !23, i32 400, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!306 = metadata !{i32 401, i32 0, metadata !305, null}
!307 = metadata !{i32 403, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !305, i32 403, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!309 = metadata !{i32 407, i32 0, metadata !305, null}
!310 = metadata !{i32 408, i32 0, metadata !305, null}
!311 = metadata !{i32 411, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !305, i32 411, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!313 = metadata !{i32 413, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !312, i32 412, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!315 = metadata !{i32 414, i32 0, metadata !314, null}
!316 = metadata !{i32 415, i32 0, metadata !314, null}
!317 = metadata !{i32 416, i32 0, metadata !314, null}
!318 = metadata !{i32 417, i32 0, metadata !314, null}
!319 = metadata !{i32 418, i32 0, metadata !314, null}
!320 = metadata !{i32 421, i32 0, metadata !304, null}
!321 = metadata !{i64 128}
!322 = metadata !{i32 425, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !1, metadata !304, i32 424, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!324 = metadata !{i32 426, i32 0, metadata !323, null}
!325 = metadata !{i32 431, i32 0, metadata !23, null}
!326 = metadata !{i32 432, i32 0, metadata !23, null}
!327 = metadata !{i32 106, i32 0, metadata !93, null}
!328 = metadata !{i32 116, i32 0, metadata !93, null}
!329 = metadata !{i32 118, i32 0, metadata !93, null}
!330 = metadata !{i32 125, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !332, i32 125, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!332 = metadata !{i32 786443, metadata !1, metadata !93, i32 119, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!333 = metadata !{i32 120, i32 0, metadata !332, null}
!334 = metadata !{i32 122, i32 0, metadata !335, null}
!335 = metadata !{i32 786443, metadata !1, metadata !332, i32 122, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!336 = metadata !{i32 123, i32 0, metadata !335, null}
!337 = metadata !{i32 128, i32 0, metadata !332, null}
!338 = metadata !{i32 129, i32 0, metadata !332, null}
!339 = metadata !{i32 132, i32 0, metadata !93, null}
!340 = metadata !{i32 133, i32 0, metadata !93, null}
!341 = metadata !{i32 434, i32 0, metadata !67, null}
!342 = metadata !{i32 439, i32 0, metadata !67, null}
!343 = metadata !{i32 441, i32 0, metadata !83, null}
!344 = metadata !{i32 445, i32 0, metadata !86, null}
!345 = metadata !{i32 445, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !86, i32 445, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!347 = metadata !{i32 445, i32 0, metadata !348, null}
!348 = metadata !{i32 786443, metadata !1, metadata !346, i32 445, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!349 = metadata !{i32 445, i32 0, metadata !350, null}
!350 = metadata !{i32 786443, metadata !1, metadata !351, i32 445, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!351 = metadata !{i32 786443, metadata !1, metadata !348, i32 445, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!352 = metadata !{i32 445, i32 0, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !350, i32 445, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!354 = metadata !{i32 443, i32 0, metadata !81, null}
!355 = metadata !{i64 3}
!356 = metadata !{i32 445, i32 0, metadata !78, null}
!357 = metadata !{i32 445, i32 0, metadata !351, null}
!358 = metadata !{i32 454, i32 0, metadata !67, null}
!359 = metadata !{i32 467, i32 0, metadata !360, null}
!360 = metadata !{i32 786443, metadata !1, metadata !67, i32 467, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!361 = metadata !{i32 468, i32 0, metadata !360, null}
!362 = metadata !{double 0.000000e+00}
!363 = metadata !{i32 472, i32 0, metadata !67, null}
!364 = metadata !{i32 481, i32 0, metadata !67, null}
!365 = metadata !{i32 485, i32 0, metadata !366, null}
!366 = metadata !{i32 786443, metadata !1, metadata !67, i32 484, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!367 = metadata !{i32 484, i32 0, metadata !366, null}
!368 = metadata !{i32 487, i32 0, metadata !366, null}
!369 = metadata !{i32 489, i32 0, metadata !67, null}
!370 = metadata !{i32 492, i32 0, metadata !67, null}
!371 = metadata !{i32 52, i32 0, metadata !104, null}
!372 = metadata !{i32 53, i32 0, metadata !104, null}
!373 = metadata !{i32 54, i32 0, metadata !104, null}
!374 = metadata !{i32 56, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !104, i32 56, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!376 = metadata !{i32 57, i32 0, metadata !375, null}
!377 = metadata !{i32 59, i32 0, metadata !104, null}
!378 = metadata !{i32 60, i32 0, metadata !104, null}
!379 = metadata !{i32 62, i32 0, metadata !104, null}
