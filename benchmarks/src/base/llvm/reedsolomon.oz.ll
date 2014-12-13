; ModuleID = 'reedsolomon.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@inited = internal unnamed_addr global i1 false
@recd = internal unnamed_addr global [255 x i32] zeroinitializer, align 16
@index_of = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@data = internal unnamed_addr global [239 x i32] zeroinitializer, align 16
@bb = internal unnamed_addr global [16 x i32] zeroinitializer, align 16
@gg = internal unnamed_addr global [17 x i32] zeroinitializer, align 16
@alpha_to = internal unnamed_addr global [256 x i32] zeroinitializer, align 16

; Function Attrs: minsize nounwind optsize uwtable
define void @rsdec_204(i8* nocapture %data_out, i8* nocapture readonly %data_in) #0 {
  %elp.i = alloca [18 x [16 x i32]], align 16
  %d.i = alloca [18 x i32], align 16
  %l.i = alloca [18 x i32], align 16
  %u_lu.i = alloca [18 x i32], align 16
  %s.i = alloca [17 x i32], align 16
  %root.i = alloca [8 x i32], align 16
  %loc.i = alloca [8 x i32], align 16
  %z.i = alloca [9 x i32], align 16
  %reg.i = alloca [9 x i32], align 16
  tail call void @llvm.dbg.value(metadata !{i8* %data_out}, i64 0, metadata !11), !dbg !103
  tail call void @llvm.dbg.value(metadata !{i8* %data_in}, i64 0, metadata !12), !dbg !103
  %.b = load i1* @inited, align 1
  br i1 %.b, label %.preheader7, label %1, !dbg !104

; <label>:1                                       ; preds = %0
  tail call fastcc void @generate_gf() #4, !dbg !106
  tail call fastcc void @gen_poly() #4, !dbg !108
  store i1 true, i1* @inited, align 1
  br label %.preheader7, !dbg !109

.preheader6:                                      ; preds = %.preheader7
  call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 16) to i8*), i8 0, i64 204, i32 16, i1 false), !dbg !110
  br label %7, !dbg !113

.preheader7:                                      ; preds = %0, %1, %.preheader7
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.preheader7 ], [ 0, %1 ], [ 0, %0 ]
  %2 = add nsw i64 %indvars.iv57, 188, !dbg !115
  %3 = getelementptr inbounds i8* %data_in, i64 %2, !dbg !115
  %4 = load i8* %3, align 1, !dbg !115, !tbaa !118
  %5 = zext i8 %4 to i32, !dbg !115
  %6 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv57, !dbg !115
  store i32 %5, i32* %6, align 4, !dbg !115, !tbaa !121
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1, !dbg !123
  %exitcond59 = icmp eq i64 %indvars.iv.next58, 16, !dbg !123
  br i1 %exitcond59, label %.preheader6, label %.preheader7, !dbg !123

; <label>:7                                       ; preds = %7, %.preheader6
  %indvars.iv51 = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next52, %7 ]
  %8 = getelementptr inbounds i8* %data_in, i64 %indvars.iv51, !dbg !124
  %9 = load i8* %8, align 1, !dbg !124, !tbaa !118
  %10 = zext i8 %9 to i32, !dbg !124
  %11 = add nsw i64 %indvars.iv51, 67, !dbg !124
  %12 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %11, !dbg !124
  store i32 %10, i32* %12, align 4, !dbg !124, !tbaa !121
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1, !dbg !113
  %exitcond53 = icmp eq i64 %indvars.iv.next52, 188, !dbg !113
  br i1 %exitcond53, label %.preheader, label %7, !dbg !113

.preheader:                                       ; preds = %7, %.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %.preheader ], [ 0, %7 ]
  %13 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv48, !dbg !126
  %14 = load i32* %13, align 4, !dbg !126, !tbaa !121
  %15 = sext i32 %14 to i64, !dbg !126
  %16 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %15, !dbg !126
  %17 = load i32* %16, align 4, !dbg !126, !tbaa !121
  store i32 %17, i32* %13, align 4, !dbg !126, !tbaa !121
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1, !dbg !128
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 255, !dbg !128
  br i1 %exitcond50, label %18, label %.preheader, !dbg !128

; <label>:18                                      ; preds = %.preheader
  %19 = bitcast [8 x i32]* %root.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 32, i8* %19) #2, !dbg !129
  %20 = bitcast [8 x i32]* %loc.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 32, i8* %20) #2, !dbg !129
  %21 = bitcast [18 x [16 x i32]]* %elp.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 1152, i8* %21) #2, !dbg !129
  tail call void @llvm.dbg.declare(metadata !{[18 x [16 x i32]]* %elp.i}, metadata !45) #2, !dbg !129
  %22 = bitcast [18 x i32]* %d.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 72, i8* %22) #2, !dbg !129
  tail call void @llvm.dbg.declare(metadata !{[18 x i32]* %d.i}, metadata !50) #2, !dbg !129
  %23 = bitcast [18 x i32]* %l.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 72, i8* %23) #2, !dbg !129
  tail call void @llvm.dbg.declare(metadata !{[18 x i32]* %l.i}, metadata !53) #2, !dbg !129
  %24 = bitcast [18 x i32]* %u_lu.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 72, i8* %24) #2, !dbg !129
  tail call void @llvm.dbg.declare(metadata !{[18 x i32]* %u_lu.i}, metadata !54) #2, !dbg !129
  %25 = bitcast [17 x i32]* %s.i to i8*, !dbg !129
  call void @llvm.lifetime.start(i64 68, i8* %25) #2, !dbg !129
  tail call void @llvm.dbg.declare(metadata !{[17 x i32]* %s.i}, metadata !55) #2, !dbg !129
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !132) #2, !dbg !133
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !134) #2, !dbg !133
  tail call void @llvm.dbg.declare(metadata !{[8 x i32]* %root.i}, metadata !61) #2, !dbg !133
  tail call void @llvm.dbg.declare(metadata !{[8 x i32]* %loc.i}, metadata !65) #2, !dbg !133
  %26 = bitcast [9 x i32]* %z.i to i8*, !dbg !133
  call void @llvm.lifetime.start(i64 36, i8* %26) #2, !dbg !133
  tail call void @llvm.dbg.declare(metadata !{[9 x i32]* %z.i}, metadata !66) #2, !dbg !133
  %27 = bitcast [9 x i32]* %reg.i to i8*, !dbg !133
  call void @llvm.lifetime.start(i64 36, i8* %27) #2, !dbg !133
  tail call void @llvm.dbg.declare(metadata !{[9 x i32]* %reg.i}, metadata !74) #2, !dbg !133
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !136) #2, !dbg !137
  br label %28, !dbg !137

; <label>:28                                      ; preds = %46, %18
  %indvars.iv147.i = phi i64 [ 1, %18 ], [ %indvars.iv.next148.i, %46 ]
  %syn_error.076.i = phi i32 [ 0, %18 ], [ %syn_error.0..i, %46 ]
  %29 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv147.i, !dbg !139
  store i32 0, i32* %29, align 4, !dbg !139, !tbaa !121
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !141) #2, !dbg !142
  br label %30, !dbg !142

; <label>:30                                      ; preds = %44, %28
  %31 = phi i32 [ 0, %28 ], [ %45, %44 ]
  %indvars.iv144.i = phi i64 [ 0, %28 ], [ %indvars.iv.next145.i, %44 ]
  %32 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv144.i, !dbg !144
  %33 = load i32* %32, align 4, !dbg !144, !tbaa !121
  %34 = icmp eq i32 %33, -1, !dbg !144
  br i1 %34, label %44, label %35, !dbg !144

; <label>:35                                      ; preds = %30
  %36 = mul nsw i64 %indvars.iv144.i, %indvars.iv147.i, !dbg !146
  %37 = trunc i64 %36 to i32, !dbg !146
  %38 = add nsw i32 %37, %33, !dbg !146
  %39 = srem i32 %38, 255, !dbg !146
  %40 = sext i32 %39 to i64, !dbg !146
  %41 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %40, !dbg !146
  %42 = load i32* %41, align 4, !dbg !146, !tbaa !121
  %43 = xor i32 %42, %31, !dbg !146
  store i32 %43, i32* %29, align 4, !dbg !146, !tbaa !121
  br label %44, !dbg !146

; <label>:44                                      ; preds = %35, %30
  %45 = phi i32 [ %31, %30 ], [ %43, %35 ]
  %indvars.iv.next145.i = add nuw nsw i64 %indvars.iv144.i, 1, !dbg !142
  %exitcond146.i = icmp eq i64 %indvars.iv.next145.i, 255, !dbg !142
  br i1 %exitcond146.i, label %46, label %30, !dbg !142

; <label>:46                                      ; preds = %44
  %47 = icmp eq i32 %45, 0, !dbg !147
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !134) #2, !dbg !147
  %syn_error.0..i = select i1 %47, i32 %syn_error.076.i, i32 1, !dbg !147
  %48 = sext i32 %45 to i64, !dbg !149
  %49 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %48, !dbg !149
  %50 = load i32* %49, align 4, !dbg !149, !tbaa !121
  store i32 %50, i32* %29, align 4, !dbg !149, !tbaa !121
  %indvars.iv.next148.i = add nuw nsw i64 %indvars.iv147.i, 1, !dbg !137
  %exitcond149.i = icmp eq i64 %indvars.iv.next148.i, 17, !dbg !137
  br i1 %exitcond149.i, label %51, label %28, !dbg !137

; <label>:51                                      ; preds = %46
  %52 = icmp eq i32 %syn_error.0..i, 0, !dbg !150
  br i1 %52, label %.preheader.i, label %53, !dbg !150

; <label>:53                                      ; preds = %51
  %54 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 0, !dbg !152
  store i32 0, i32* %54, align 16, !dbg !152, !tbaa !121
  %55 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 1, !dbg !154
  %56 = load i32* %55, align 4, !dbg !154, !tbaa !121
  %57 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 1, !dbg !154
  store i32 %56, i32* %57, align 4, !dbg !154, !tbaa !121
  %58 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 0, !dbg !155
  store i32 0, i32* %58, align 16, !dbg !155, !tbaa !121
  %59 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 0, !dbg !156
  store i32 1, i32* %59, align 16, !dbg !156, !tbaa !121
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !136) #2, !dbg !157
  br label %60, !dbg !157

; <label>:60                                      ; preds = %60, %53
  %indvars.iv137.i = phi i64 [ 1, %53 ], [ %indvars.iv.next138.i, %60 ]
  %61 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 %indvars.iv137.i, !dbg !159
  store i32 -1, i32* %61, align 4, !dbg !159, !tbaa !121
  %62 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 %indvars.iv137.i, !dbg !161
  store i32 0, i32* %62, align 4, !dbg !161, !tbaa !121
  %indvars.iv.next138.i = add nuw nsw i64 %indvars.iv137.i, 1, !dbg !157
  %exitcond139.i = icmp eq i64 %indvars.iv.next138.i, 16, !dbg !157
  br i1 %exitcond139.i, label %63, label %60, !dbg !157

; <label>:63                                      ; preds = %60
  %64 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 0, !dbg !162
  store i32 0, i32* %64, align 16, !dbg !162, !tbaa !121
  %65 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 1, !dbg !163
  store i32 0, i32* %65, align 4, !dbg !163, !tbaa !121
  %66 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 0, !dbg !164
  store i32 -1, i32* %66, align 16, !dbg !164, !tbaa !121
  %67 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 1, !dbg !165
  store i32 0, i32* %67, align 4, !dbg !165, !tbaa !121
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !166) #2, !dbg !167
  br label %._crit_edge152.i, !dbg !168

._crit_edge152.i:                                 ; preds = %.preheader20._crit_edge.i.thread, %.preheader20._crit_edge.i, %63
  %68 = phi i32 [ 0, %63 ], [ %146, %.preheader20._crit_edge.i ], [ %146, %.preheader20._crit_edge.i.thread ]
  %69 = phi i32 [ %56, %63 ], [ %191, %.preheader20._crit_edge.i ], [ %166, %.preheader20._crit_edge.i.thread ]
  %indvars.iv135.i = phi i64 [ 0, %63 ], [ %indvars.iv.next136.i, %.preheader20._crit_edge.i ], [ %indvars.iv.next136.i, %.preheader20._crit_edge.i.thread ]
  %70 = add i64 %indvars.iv135.i, 2, !dbg !169
  %sext.i = shl i64 %70, 32
  %71 = ashr exact i64 %sext.i, 32
  %scevgep123.i = getelementptr [18 x [16 x i32]]* %elp.i, i64 0, i64 %71, i64 0
  %scevgep123124.i = bitcast i32* %scevgep123.i to i8*
  %indvars.iv.next136.i = add nuw nsw i64 %indvars.iv135.i, 1
  %72 = icmp eq i32 %69, -1, !dbg !171
  br i1 %72, label %73, label %.preheader28.i, !dbg !171

; <label>:73                                      ; preds = %._crit_edge152.i
  %74 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %70, !dbg !173
  store i32 %68, i32* %74, align 4, !dbg !173, !tbaa !121
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !136) #2, !dbg !175
  %75 = icmp slt i32 %68, 0, !dbg !175
  br i1 %75, label %.loopexit21.i, label %.lr.ph69.i.preheader, !dbg !175

.lr.ph69.i.preheader:                             ; preds = %73
  %76 = add i32 %68, 1, !dbg !177
  br label %.lr.ph69.i, !dbg !177

.lr.ph69.i:                                       ; preds = %.lr.ph69.i, %.lr.ph69.i.preheader
  %indvars.iv129.i = phi i64 [ %indvars.iv.next130.i, %.lr.ph69.i ], [ 0, %.lr.ph69.i.preheader ]
  %77 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %indvars.iv.next136.i, i64 %indvars.iv129.i, !dbg !177
  %78 = load i32* %77, align 4, !dbg !177, !tbaa !121
  %79 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %indvars.iv129.i, !dbg !177
  store i32 %78, i32* %79, align 4, !dbg !177, !tbaa !121
  %80 = sext i32 %78 to i64, !dbg !179
  %81 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %80, !dbg !179
  %82 = load i32* %81, align 4, !dbg !179, !tbaa !121
  store i32 %82, i32* %77, align 4, !dbg !179, !tbaa !121
  %indvars.iv.next130.i = add nuw nsw i64 %indvars.iv129.i, 1, !dbg !175
  %lftr.wideiv40 = trunc i64 %indvars.iv.next130.i to i32, !dbg !175
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %76, !dbg !175
  br i1 %exitcond41, label %.loopexit21.i, label %.lr.ph69.i, !dbg !175

.preheader28.i:                                   ; preds = %._crit_edge152.i, %.preheader28.i
  %indvars.iv116.i = phi i64 [ %indvars.iv.next117.i, %.preheader28.i ], [ %indvars.iv135.i, %._crit_edge152.i ]
  %83 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %indvars.iv116.i, !dbg !180
  %84 = load i32* %83, align 4, !dbg !180, !tbaa !121
  %85 = icmp eq i32 %84, -1, !dbg !180
  %86 = trunc i64 %indvars.iv116.i to i32, !dbg !180
  %87 = icmp sgt i32 %86, 0, !dbg !180
  %..i = and i1 %85, %87, !dbg !180
  %indvars.iv.next117.i = add nsw i64 %indvars.iv116.i, -1
  br i1 %..i, label %.preheader28.i, label %88

; <label>:88                                      ; preds = %.preheader28.i
  br i1 %87, label %.preheader26.i, label %.loopexit27.i, !dbg !182

.preheader26.i:                                   ; preds = %88
  %sext180.i = shl i64 %indvars.iv116.i, 32
  %89 = ashr exact i64 %sext180.i, 32
  br label %90, !dbg !184

; <label>:90                                      ; preds = %102, %.preheader26.i
  %indvars.iv118.i = phi i64 [ %89, %.preheader26.i ], [ %indvars.iv.next119.i, %102 ]
  %q.1.i = phi i32 [ %86, %.preheader26.i ], [ %q.2.i, %102 ]
  %indvars.iv.next119.i = add nsw i64 %indvars.iv118.i, -1, !dbg !187
  %91 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %indvars.iv.next119.i, !dbg !188
  %92 = load i32* %91, align 4, !dbg !188, !tbaa !121
  %93 = icmp eq i32 %92, -1, !dbg !188
  br i1 %93, label %._crit_edge163.i, label %94, !dbg !188

._crit_edge163.i:                                 ; preds = %90
  %.pre174.i = trunc i64 %indvars.iv.next119.i to i32, !dbg !187
  br label %102, !dbg !188

; <label>:94                                      ; preds = %90
  %95 = sext i32 %q.1.i to i64, !dbg !188
  %96 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %95, !dbg !188
  %97 = load i32* %96, align 4, !dbg !188, !tbaa !121
  %98 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %indvars.iv.next119.i, !dbg !188
  %99 = load i32* %98, align 4, !dbg !188, !tbaa !121
  %100 = icmp slt i32 %97, %99, !dbg !188
  %101 = trunc i64 %indvars.iv.next119.i to i32, !dbg !188
  %.q.1.i = select i1 %100, i32 %101, i32 %q.1.i, !dbg !188
  br label %102, !dbg !188

; <label>:102                                     ; preds = %94, %._crit_edge163.i
  %.pre-phi175.i = phi i32 [ %.pre174.i, %._crit_edge163.i ], [ %101, %94 ], !dbg !187
  %q.2.i = phi i32 [ %q.1.i, %._crit_edge163.i ], [ %.q.1.i, %94 ]
  %103 = icmp sgt i32 %.pre-phi175.i, 0, !dbg !187
  br i1 %103, label %90, label %.loopexit27.i, !dbg !187

.loopexit27.i:                                    ; preds = %102, %88
  %q.3.i = phi i32 [ %86, %88 ], [ %q.2.i, %102 ]
  %104 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %indvars.iv.next136.i, !dbg !190
  %105 = sext i32 %q.3.i to i64, !dbg !190
  %106 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %105, !dbg !190
  %107 = load i32* %106, align 4, !dbg !190, !tbaa !121
  %108 = trunc i64 %indvars.iv.next136.i to i32, !dbg !190
  %109 = sub i32 %108, %q.3.i, !dbg !190
  %110 = add i32 %109, %107, !dbg !190
  %111 = icmp sgt i32 %68, %110, !dbg !190
  %112 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %70, !dbg !190
  %.181.i = select i1 %111, i32 %68, i32 %110, !dbg !190
  store i32 %.181.i, i32* %112, align 4, !dbg !190, !tbaa !121
  call void @llvm.memset.p0i8.i64(i8* %scevgep123124.i, i8 0, i64 64, i32 16, i1 false) #2, !dbg !192
  %113 = load i32* %106, align 4, !dbg !194, !tbaa !121
  %114 = icmp slt i32 %113, 0, !dbg !194
  br i1 %114, label %.preheader22.i, label %.lr.ph64.i, !dbg !194

.lr.ph64.i:                                       ; preds = %.loopexit27.i
  %115 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %105, !dbg !196
  %116 = add i32 %69, 255, !dbg !196
  br label %120, !dbg !194

.preheader22.i:                                   ; preds = %136, %.loopexit27.i
  %117 = load i32* %104, align 4, !dbg !198, !tbaa !121
  %118 = icmp slt i32 %117, 0, !dbg !198
  br i1 %118, label %.loopexit23.i, label %.lr.ph66.i.preheader, !dbg !198

.lr.ph66.i.preheader:                             ; preds = %.preheader22.i
  %119 = add i32 %117, 1, !dbg !200
  br label %.lr.ph66.i, !dbg !200

; <label>:120                                     ; preds = %136, %.lr.ph64.i
  %indvars.iv125.i = phi i64 [ %indvars.iv.next126.i, %136 ], [ 0, %.lr.ph64.i ]
  %121 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %105, i64 %indvars.iv125.i, !dbg !202
  %122 = load i32* %121, align 4, !dbg !202, !tbaa !121
  %123 = icmp eq i32 %122, -1, !dbg !202
  br i1 %123, label %._crit_edge162.i, label %124, !dbg !202

._crit_edge162.i:                                 ; preds = %120
  %.pre176.i = trunc i64 %indvars.iv125.i to i32, !dbg !194
  br label %136, !dbg !202

; <label>:124                                     ; preds = %120
  %125 = load i32* %115, align 4, !dbg !196, !tbaa !121
  %126 = add i32 %116, %122, !dbg !196
  %127 = sub i32 %126, %125, !dbg !196
  %128 = srem i32 %127, 255, !dbg !196
  %129 = sext i32 %128 to i64, !dbg !196
  %130 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %129, !dbg !196
  %131 = load i32* %130, align 4, !dbg !196, !tbaa !121
  %132 = trunc i64 %indvars.iv125.i to i32, !dbg !196
  %133 = add i32 %132, %109, !dbg !196
  %134 = sext i32 %133 to i64, !dbg !196
  %135 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %134, !dbg !196
  store i32 %131, i32* %135, align 4, !dbg !196, !tbaa !121
  br label %136, !dbg !196

; <label>:136                                     ; preds = %124, %._crit_edge162.i
  %.pre-phi177.i = phi i32 [ %.pre176.i, %._crit_edge162.i ], [ %132, %124 ], !dbg !194
  %indvars.iv.next126.i = add nuw nsw i64 %indvars.iv125.i, 1, !dbg !194
  %137 = icmp slt i32 %.pre-phi177.i, %113, !dbg !194
  br i1 %137, label %120, label %.preheader22.i, !dbg !194

.lr.ph66.i:                                       ; preds = %.lr.ph66.i, %.lr.ph66.i.preheader
  %indvars.iv127.i = phi i64 [ %indvars.iv.next128.i, %.lr.ph66.i ], [ 0, %.lr.ph66.i.preheader ]
  %138 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %indvars.iv.next136.i, i64 %indvars.iv127.i, !dbg !200
  %139 = load i32* %138, align 4, !dbg !200, !tbaa !121
  %140 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %indvars.iv127.i, !dbg !200
  %141 = load i32* %140, align 4, !dbg !200, !tbaa !121
  %142 = xor i32 %141, %139, !dbg !200
  store i32 %142, i32* %140, align 4, !dbg !200, !tbaa !121
  %143 = sext i32 %139 to i64, !dbg !203
  %144 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %143, !dbg !203
  %145 = load i32* %144, align 4, !dbg !203, !tbaa !121
  store i32 %145, i32* %138, align 4, !dbg !203, !tbaa !121
  %indvars.iv.next128.i = add nuw nsw i64 %indvars.iv127.i, 1, !dbg !198
  %lftr.wideiv38 = trunc i64 %indvars.iv.next128.i to i32, !dbg !198
  %exitcond39 = icmp eq i32 %lftr.wideiv38, %119, !dbg !198
  br i1 %exitcond39, label %.loopexit23.i, label %.lr.ph66.i, !dbg !198

.loopexit21.i:                                    ; preds = %.lr.ph69.i, %73
  %.pre.i = trunc i64 %indvars.iv.next136.i to i32, !dbg !204
  br label %.loopexit23.i

.loopexit23.i:                                    ; preds = %.lr.ph66.i, %.loopexit21.i, %.preheader22.i
  %.pre-phi.i = phi i32 [ %.pre.i, %.loopexit21.i ], [ %108, %.preheader22.i ], [ %108, %.lr.ph66.i ], !dbg !204
  %146 = phi i32 [ %68, %.loopexit21.i ], [ %.181.i, %.preheader22.i ], [ %.181.i, %.lr.ph66.i ]
  %147 = sub nsw i32 %.pre-phi.i, %146, !dbg !204
  %148 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %70, !dbg !204
  store i32 %147, i32* %148, align 4, !dbg !204, !tbaa !121
  %149 = icmp slt i32 %.pre-phi.i, 16, !dbg !205
  br i1 %149, label %150, label %.critedge.i, !dbg !205

; <label>:150                                     ; preds = %.loopexit23.i
  %151 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %70, !dbg !207
  %152 = load i32* %151, align 4, !dbg !207, !tbaa !121
  %153 = icmp eq i32 %152, -1, !dbg !207
  br i1 %153, label %159, label %154, !dbg !207

; <label>:154                                     ; preds = %150
  %155 = sext i32 %152 to i64, !dbg !210
  %156 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %155, !dbg !210
  %157 = load i32* %156, align 4, !dbg !210, !tbaa !121
  %158 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %70, !dbg !210
  store i32 %157, i32* %158, align 4, !dbg !210, !tbaa !121
  br label %.preheader20.i, !dbg !210

; <label>:159                                     ; preds = %150
  %160 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %70, !dbg !211
  store i32 0, i32* %160, align 4, !dbg !211, !tbaa !121
  br label %.preheader20.i

.preheader20.i:                                   ; preds = %159, %154
  %161 = phi i32 [ 0, %159 ], [ %157, %154 ]
  %162 = icmp slt i32 %146, 1, !dbg !212
  %.pre166.i = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %70, !dbg !214
  br i1 %162, label %.preheader20._crit_edge.i.thread, label %.lr.ph71.i.preheader, !dbg !212

.lr.ph71.i.preheader:                             ; preds = %.preheader20.i
  %163 = add i32 %146, 1, !dbg !215
  br label %.lr.ph71.i, !dbg !215

.preheader20._crit_edge.i.thread:                 ; preds = %.preheader20.i
  %164 = sext i32 %161 to i64, !dbg !214
  %165 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %164, !dbg !214
  %166 = load i32* %165, align 4, !dbg !214, !tbaa !121
  store i32 %166, i32* %.pre166.i, align 4, !dbg !214, !tbaa !121
  br label %._crit_edge152.i

.lr.ph71.i:                                       ; preds = %187, %.lr.ph71.i.preheader
  %167 = phi i32 [ %188, %187 ], [ %161, %.lr.ph71.i.preheader ]
  %indvars.iv133.i = phi i64 [ %indvars.iv.next134.i, %187 ], [ 1, %.lr.ph71.i.preheader ]
  %168 = sub i64 %70, %indvars.iv133.i, !dbg !215
  %sext179.i = shl i64 %168, 32, !dbg !215
  %169 = ashr exact i64 %sext179.i, 32, !dbg !215
  %170 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %169, !dbg !215
  %171 = load i32* %170, align 4, !dbg !215, !tbaa !121
  %172 = icmp eq i32 %171, -1, !dbg !215
  br i1 %172, label %187, label %173, !dbg !215

; <label>:173                                     ; preds = %.lr.ph71.i
  %174 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %indvars.iv133.i, !dbg !215
  %175 = load i32* %174, align 4, !dbg !215, !tbaa !121
  %176 = icmp eq i32 %175, 0, !dbg !215
  br i1 %176, label %187, label %177, !dbg !215

; <label>:177                                     ; preds = %173
  %178 = sext i32 %175 to i64, !dbg !217
  %179 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %178, !dbg !217
  %180 = load i32* %179, align 4, !dbg !217, !tbaa !121
  %181 = add nsw i32 %180, %171, !dbg !217
  %182 = srem i32 %181, 255, !dbg !217
  %183 = sext i32 %182 to i64, !dbg !217
  %184 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %183, !dbg !217
  %185 = load i32* %184, align 4, !dbg !217, !tbaa !121
  %186 = xor i32 %185, %167, !dbg !217
  store i32 %186, i32* %.pre166.i, align 4, !dbg !217, !tbaa !121
  br label %187, !dbg !217

; <label>:187                                     ; preds = %177, %173, %.lr.ph71.i
  %188 = phi i32 [ %167, %173 ], [ %167, %.lr.ph71.i ], [ %186, %177 ]
  %indvars.iv.next134.i = add nuw nsw i64 %indvars.iv133.i, 1, !dbg !212
  %lftr.wideiv43 = trunc i64 %indvars.iv.next134.i to i32, !dbg !212
  %exitcond44 = icmp eq i32 %lftr.wideiv43, %163, !dbg !212
  br i1 %exitcond44, label %.preheader20._crit_edge.i, label %.lr.ph71.i, !dbg !212

.preheader20._crit_edge.i:                        ; preds = %187
  %189 = sext i32 %188 to i64, !dbg !214
  %190 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %189, !dbg !214
  %191 = load i32* %190, align 4, !dbg !214, !tbaa !121
  store i32 %191, i32* %.pre166.i, align 4, !dbg !214, !tbaa !121
  %192 = icmp slt i32 %146, 9, !dbg !218
  br i1 %192, label %._crit_edge152.i, label %.critedge.thread.preheader.i

.critedge.i:                                      ; preds = %.loopexit23.i
  %193 = icmp slt i32 %146, 9, !dbg !219
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !136) #2, !dbg !221
  br i1 %193, label %.preheader19.i, label %.critedge.thread.preheader.i, !dbg !219

.preheader19.i:                                   ; preds = %.critedge.i
  %194 = icmp slt i32 %146, 0, !dbg !221
  br i1 %194, label %.preheader17.i, label %.lr.ph61.i.preheader, !dbg !221

.lr.ph61.i.preheader:                             ; preds = %.preheader19.i
  %195 = add i32 %146, 1, !dbg !221
  br label %.lr.ph61.i, !dbg !221

.preheader18.i:                                   ; preds = %.lr.ph61.i
  %196 = icmp slt i32 %146, 1, !dbg !224
  br i1 %196, label %.preheader17.i, label %.lr.ph59.i, !dbg !224

.lr.ph59.i:                                       ; preds = %.preheader18.i
  %scevgep.i = getelementptr [9 x i32]* %reg.i, i64 0, i64 1
  %scevgep109.i = bitcast i32* %scevgep.i to i8*
  %scevgep110.i = getelementptr [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 1
  %scevgep110111.i = bitcast i32* %scevgep110.i to i8*
  %197 = icmp sgt i32 %146, 1
  %.op.i = add i32 %146, -1, !dbg !224
  %198 = zext i32 %.op.i to i64
  %.op178.i = shl nuw nsw i64 %198, 2, !dbg !224
  %.op178.op.i = add i64 %.op178.i, 4, !dbg !224
  %199 = select i1 %197, i64 %.op178.op.i, i64 4, !dbg !224
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep109.i, i8* %scevgep110111.i, i64 %199, i32 4, i1 false) #2, !dbg !226
  br label %.preheader17.i, !dbg !224

.lr.ph61.i:                                       ; preds = %.lr.ph61.i, %.lr.ph61.i.preheader
  %indvars.iv112.i = phi i64 [ %indvars.iv.next113.i, %.lr.ph61.i ], [ 0, %.lr.ph61.i.preheader ]
  %200 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %indvars.iv112.i, !dbg !221
  %201 = load i32* %200, align 4, !dbg !221, !tbaa !121
  %202 = sext i32 %201 to i64, !dbg !221
  %203 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %202, !dbg !221
  %204 = load i32* %203, align 4, !dbg !221, !tbaa !121
  store i32 %204, i32* %200, align 4, !dbg !221, !tbaa !121
  %indvars.iv.next113.i = add nuw nsw i64 %indvars.iv112.i, 1, !dbg !221
  %lftr.wideiv36 = trunc i64 %indvars.iv.next113.i to i32, !dbg !221
  %exitcond37 = icmp eq i32 %lftr.wideiv36, %195, !dbg !221
  br i1 %exitcond37, label %.preheader18.i, label %.lr.ph61.i, !dbg !221

.preheader17.i:                                   ; preds = %.lr.ph59.i, %.preheader18.i, %.preheader19.i
  %205 = phi i1 [ false, %.lr.ph59.i ], [ true, %.preheader18.i ], [ true, %.preheader19.i ]
  br label %.preheader16.i, !dbg !227

.preheader16.i:                                   ; preds = %._crit_edge54.thread.i, %.preheader17.i
  %count.057.i = phi i32 [ 0, %.preheader17.i ], [ %count.1.i, %._crit_edge54.thread.i ]
  %i.956.i = phi i32 [ 1, %.preheader17.i ], [ %224, %._crit_edge54.thread.i ]
  br i1 %205, label %._crit_edge54.thread.i, label %.lr.ph53.i, !dbg !229

.lr.ph53.i:                                       ; preds = %.preheader16.i, %._crit_edge164.i
  %indvars.iv104.i = phi i64 [ %indvars.iv.next105.i, %._crit_edge164.i ], [ 1, %.preheader16.i ]
  %q.452.i = phi i32 [ %q.5.i, %._crit_edge164.i ], [ 1, %.preheader16.i ]
  %206 = getelementptr inbounds [9 x i32]* %reg.i, i64 0, i64 %indvars.iv104.i, !dbg !232
  %207 = load i32* %206, align 4, !dbg !232, !tbaa !121
  %208 = icmp eq i32 %207, -1, !dbg !232
  %.pre172.i = trunc i64 %indvars.iv104.i to i32, !dbg !229
  br i1 %208, label %._crit_edge164.i, label %209, !dbg !232

; <label>:209                                     ; preds = %.lr.ph53.i
  %210 = add nsw i32 %207, %.pre172.i, !dbg !234
  %211 = srem i32 %210, 255, !dbg !234
  store i32 %211, i32* %206, align 4, !dbg !234, !tbaa !121
  %212 = sext i32 %211 to i64, !dbg !236
  %213 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %212, !dbg !236
  %214 = load i32* %213, align 4, !dbg !236, !tbaa !121
  %215 = xor i32 %214, %q.452.i, !dbg !236
  tail call void @llvm.dbg.value(metadata !{i32 %215}, i64 0, metadata !237) #2, !dbg !236
  br label %._crit_edge164.i, !dbg !238

._crit_edge164.i:                                 ; preds = %209, %.lr.ph53.i
  %q.5.i = phi i32 [ %215, %209 ], [ %q.452.i, %.lr.ph53.i ]
  %indvars.iv.next105.i = add nuw nsw i64 %indvars.iv104.i, 1, !dbg !229
  %216 = icmp slt i32 %.pre172.i, %146, !dbg !229
  br i1 %216, label %.lr.ph53.i, label %._crit_edge54.i, !dbg !229

._crit_edge54.i:                                  ; preds = %._crit_edge164.i
  %217 = icmp eq i32 %q.5.i, 0, !dbg !239
  br i1 %217, label %218, label %._crit_edge54.thread.i, !dbg !239

; <label>:218                                     ; preds = %._crit_edge54.i
  %219 = sext i32 %count.057.i to i64, !dbg !241
  %220 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %219, !dbg !241
  store i32 %i.956.i, i32* %220, align 4, !dbg !241, !tbaa !121
  %221 = sub nsw i32 255, %i.956.i, !dbg !243
  %222 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %219, !dbg !243
  store i32 %221, i32* %222, align 4, !dbg !243, !tbaa !121
  %223 = add nsw i32 %count.057.i, 1, !dbg !244
  tail call void @llvm.dbg.value(metadata !{i32 %223}, i64 0, metadata !132) #2, !dbg !244
  br label %._crit_edge54.thread.i, !dbg !245

._crit_edge54.thread.i:                           ; preds = %218, %._crit_edge54.i, %.preheader16.i
  %count.1.i = phi i32 [ %count.057.i, %._crit_edge54.i ], [ %223, %218 ], [ %count.057.i, %.preheader16.i ]
  %224 = add nsw i32 %i.956.i, 1, !dbg !227
  tail call void @llvm.dbg.value(metadata !{i32 %224}, i64 0, metadata !136) #2, !dbg !227
  %exitcond106.i = icmp eq i32 %224, 256, !dbg !227
  br i1 %exitcond106.i, label %225, label %.preheader16.i, !dbg !227

; <label>:225                                     ; preds = %._crit_edge54.thread.i
  %226 = icmp eq i32 %count.1.i, %146, !dbg !246
  br i1 %226, label %.preheader13.i, label %.preheader14.i, !dbg !246

.preheader13.i:                                   ; preds = %225
  br i1 %205, label %.preheader11.i, label %.lr.ph49.i, !dbg !248

.lr.ph49.i:                                       ; preds = %.preheader13.i, %._crit_edge156.i
  %indvars.iv32 = phi i32 [ %indvars.iv.next33, %._crit_edge156.i ], [ 1, %.preheader13.i ]
  %.pr4.i = phi i32 [ %.pre158.i, %._crit_edge156.i ], [ %56, %.preheader13.i ]
  %indvars.iv99.i = phi i64 [ %indvars.iv.next100.i, %._crit_edge156.i ], [ 1, %.preheader13.i ]
  %227 = icmp eq i32 %.pr4.i, -1, !dbg !251
  %.phi.trans.insert159.i = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %indvars.iv99.i
  %.pre160.i = load i32* %.phi.trans.insert159.i, align 4, !dbg !254, !tbaa !121
  %228 = icmp eq i32 %.pre160.i, -1, !dbg !254
  br i1 %227, label %.thread6.i, label %229, !dbg !251

; <label>:229                                     ; preds = %.lr.ph49.i
  %230 = sext i32 %.pr4.i to i64, !dbg !257
  %231 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %230, !dbg !257
  %232 = load i32* %231, align 4, !dbg !257, !tbaa !121
  br i1 %228, label %239, label %233, !dbg !251

; <label>:233                                     ; preds = %229
  %234 = sext i32 %.pre160.i to i64, !dbg !258
  %235 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %234, !dbg !258
  %236 = load i32* %235, align 4, !dbg !258, !tbaa !121
  %237 = xor i32 %236, %232, !dbg !258
  %238 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !258
  store i32 %237, i32* %238, align 4, !dbg !258, !tbaa !121
  br label %.preheader12.i, !dbg !258

; <label>:239                                     ; preds = %229
  %240 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !257
  store i32 %232, i32* %240, align 4, !dbg !257, !tbaa !121
  br label %.preheader12.i, !dbg !257

.thread6.i:                                       ; preds = %.lr.ph49.i
  br i1 %228, label %246, label %241, !dbg !254

; <label>:241                                     ; preds = %.thread6.i
  %242 = sext i32 %.pre160.i to i64, !dbg !259
  %243 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %242, !dbg !259
  %244 = load i32* %243, align 4, !dbg !259, !tbaa !121
  %245 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !259
  store i32 %244, i32* %245, align 4, !dbg !259, !tbaa !121
  br label %.preheader12.i, !dbg !259

; <label>:246                                     ; preds = %.thread6.i
  %247 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !260
  store i32 0, i32* %247, align 4, !dbg !260, !tbaa !121
  br label %.preheader12.i

.preheader12.i:                                   ; preds = %246, %241, %239, %233
  %248 = phi i32 [ %232, %239 ], [ 0, %246 ], [ %244, %241 ], [ %237, %233 ]
  %249 = trunc i64 %indvars.iv99.i to i32, !dbg !261
  %250 = icmp sgt i32 %249, 1, !dbg !261
  %251 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !263
  br i1 %250, label %.lr.ph45.i, label %._crit_edge46.i, !dbg !261

.lr.ph45.i:                                       ; preds = %.preheader12.i, %268
  %252 = phi i32 [ %269, %268 ], [ %248, %.preheader12.i ]
  %indvars.iv94.i = phi i64 [ %indvars.iv.next95.i, %268 ], [ 1, %.preheader12.i ]
  %253 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv94.i, !dbg !265
  %254 = load i32* %253, align 4, !dbg !265, !tbaa !121
  %255 = icmp eq i32 %254, -1, !dbg !265
  br i1 %255, label %268, label %256, !dbg !265

; <label>:256                                     ; preds = %.lr.ph45.i
  %257 = sub nsw i64 %indvars.iv99.i, %indvars.iv94.i, !dbg !265
  %258 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %70, i64 %257, !dbg !265
  %259 = load i32* %258, align 4, !dbg !265, !tbaa !121
  %260 = icmp eq i32 %259, -1, !dbg !265
  br i1 %260, label %268, label %261, !dbg !265

; <label>:261                                     ; preds = %256
  %262 = add nsw i32 %259, %254, !dbg !263
  %263 = srem i32 %262, 255, !dbg !263
  %264 = sext i32 %263 to i64, !dbg !263
  %265 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %264, !dbg !263
  %266 = load i32* %265, align 4, !dbg !263, !tbaa !121
  %267 = xor i32 %266, %252, !dbg !263
  store i32 %267, i32* %251, align 4, !dbg !263, !tbaa !121
  br label %268, !dbg !263

; <label>:268                                     ; preds = %261, %256, %.lr.ph45.i
  %269 = phi i32 [ %252, %256 ], [ %252, %.lr.ph45.i ], [ %267, %261 ]
  %indvars.iv.next95.i = add nuw nsw i64 %indvars.iv94.i, 1, !dbg !261
  %lftr.wideiv34 = trunc i64 %indvars.iv.next95.i to i32, !dbg !261
  %exitcond35 = icmp eq i32 %lftr.wideiv34, %indvars.iv32, !dbg !261
  br i1 %exitcond35, label %._crit_edge46.i, label %.lr.ph45.i, !dbg !261

._crit_edge46.i:                                  ; preds = %268, %.preheader12.i
  %270 = phi i32 [ %248, %.preheader12.i ], [ %269, %268 ]
  %271 = sext i32 %270 to i64, !dbg !266
  %272 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %271, !dbg !266
  %273 = load i32* %272, align 4, !dbg !266, !tbaa !121
  store i32 %273, i32* %251, align 4, !dbg !266, !tbaa !121
  %indvars.iv.next100.i = add nuw nsw i64 %indvars.iv99.i, 1, !dbg !248
  %274 = icmp slt i32 %249, %146, !dbg !248
  br i1 %274, label %._crit_edge156.i, label %.preheader11.i, !dbg !248

._crit_edge156.i:                                 ; preds = %._crit_edge46.i
  %indvars.iv.next33 = add nuw nsw i32 %indvars.iv32, 1, !dbg !248
  %.phi.trans.insert157.i = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv.next100.i
  %.pre158.i = load i32* %.phi.trans.insert157.i, align 4, !dbg !251, !tbaa !121
  br label %.lr.ph49.i, !dbg !248

.preheader9.i:                                    ; preds = %283
  %275 = icmp sgt i32 %146, 0, !dbg !267
  br i1 %275, label %.lr.ph42.i, label %decode_rs.exit, !dbg !267

.preheader11.i:                                   ; preds = %.preheader13.i, %._crit_edge46.i, %283
  %indvars.iv91.i = phi i64 [ %indvars.iv.next92.i, %283 ], [ 0, %._crit_edge46.i ], [ 0, %.preheader13.i ]
  %276 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv91.i, !dbg !269
  %277 = load i32* %276, align 4, !dbg !269, !tbaa !121
  %278 = icmp eq i32 %277, -1, !dbg !269
  br i1 %278, label %283, label %279, !dbg !269

; <label>:279                                     ; preds = %.preheader11.i
  %280 = sext i32 %277 to i64, !dbg !273
  %281 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %280, !dbg !273
  %282 = load i32* %281, align 4, !dbg !273, !tbaa !121
  br label %283, !dbg !273

; <label>:283                                     ; preds = %279, %.preheader11.i
  %storemerge3.i = phi i32 [ %282, %279 ], [ 0, %.preheader11.i ]
  store i32 %storemerge3.i, i32* %276, align 4, !dbg !273, !tbaa !121
  %indvars.iv.next92.i = add nuw nsw i64 %indvars.iv91.i, 1, !dbg !274
  %exitcond93.i = icmp eq i64 %indvars.iv.next92.i, 255, !dbg !274
  br i1 %exitcond93.i, label %.preheader9.i, label %.preheader11.i, !dbg !274

.lr.ph42.i:                                       ; preds = %.preheader9.i, %343
  %284 = phi i32 [ %344, %343 ], [ %146, %.preheader9.i ]
  %indvars.iv89.i = phi i64 [ %indvars.iv.next90.i, %343 ], [ 0, %.preheader9.i ]
  %285 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv89.i, !dbg !275
  %286 = load i32* %285, align 4, !dbg !275, !tbaa !121
  %287 = sext i32 %286 to i64, !dbg !275
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !141) #2, !dbg !277
  br i1 %205, label %._crit_edge.thread.i, label %.lr.ph.i, !dbg !277

.lr.ph.i:                                         ; preds = %.lr.ph42.i
  %288 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %indvars.iv89.i, !dbg !279
  br label %289, !dbg !277

; <label>:289                                     ; preds = %304, %.lr.ph.i
  %290 = phi i32 [ %.pre155.i, %304 ], [ 1, %.lr.ph.i ]
  %indvars.iv85.i = phi i64 [ %indvars.iv.next86.i, %304 ], [ 1, %.lr.ph.i ]
  %291 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv85.i, !dbg !281
  %292 = load i32* %291, align 4, !dbg !281, !tbaa !121
  %293 = icmp eq i32 %292, -1, !dbg !281
  br i1 %293, label %._crit_edge165.i, label %294, !dbg !281

._crit_edge165.i:                                 ; preds = %289
  %.pre168.i = trunc i64 %indvars.iv85.i to i32, !dbg !277
  br label %304, !dbg !281

; <label>:294                                     ; preds = %289
  %295 = load i32* %288, align 4, !dbg !279, !tbaa !121
  %296 = trunc i64 %indvars.iv85.i to i32, !dbg !279
  %297 = mul nsw i32 %295, %296, !dbg !279
  %298 = add nsw i32 %297, %292, !dbg !279
  %299 = srem i32 %298, 255, !dbg !279
  %300 = sext i32 %299 to i64, !dbg !279
  %301 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %300, !dbg !279
  %302 = load i32* %301, align 4, !dbg !279, !tbaa !121
  %303 = xor i32 %302, %290, !dbg !279
  br label %304, !dbg !279

; <label>:304                                     ; preds = %294, %._crit_edge165.i
  %.pre-phi169.i = phi i32 [ %.pre168.i, %._crit_edge165.i ], [ %296, %294 ], !dbg !277
  %.pre155.i = phi i32 [ %290, %._crit_edge165.i ], [ %303, %294 ]
  %indvars.iv.next86.i = add nuw nsw i64 %indvars.iv85.i, 1, !dbg !277
  %305 = icmp slt i32 %.pre-phi169.i, %146, !dbg !277
  br i1 %305, label %289, label %._crit_edge.i, !dbg !277

._crit_edge.i:                                    ; preds = %304
  %306 = icmp eq i32 %.pre155.i, 0, !dbg !282
  br i1 %306, label %343, label %._crit_edge.thread.i, !dbg !282

._crit_edge.thread.i:                             ; preds = %._crit_edge.i, %.lr.ph42.i
  %307 = phi i32 [ %.pre155.i, %._crit_edge.i ], [ 1, %.lr.ph42.i ]
  %308 = phi i32 [ %146, %._crit_edge.i ], [ %284, %.lr.ph42.i ]
  %309 = sext i32 %307 to i64, !dbg !284
  %310 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %309, !dbg !284
  %311 = load i32* %310, align 4, !dbg !284, !tbaa !121
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !237) #2, !dbg !286
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !141) #2, !dbg !287
  %312 = icmp sgt i32 %308, 0, !dbg !287
  br i1 %312, label %.lr.ph39.i, label %._crit_edge40.i, !dbg !287

.lr.ph39.i:                                       ; preds = %._crit_edge.thread.i
  %313 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %indvars.iv89.i, !dbg !289
  %314 = trunc i64 %indvars.iv89.i to i32, !dbg !291
  br label %315, !dbg !287

; <label>:315                                     ; preds = %332, %.lr.ph39.i
  %indvars.iv87.i = phi i64 [ 0, %.lr.ph39.i ], [ %indvars.iv.next88.i, %332 ]
  %q.637.i = phi i32 [ 0, %.lr.ph39.i ], [ %q.7.i, %332 ]
  %316 = trunc i64 %indvars.iv87.i to i32, !dbg !291
  %317 = icmp eq i32 %316, %314, !dbg !291
  br i1 %317, label %332, label %318, !dbg !291

; <label>:318                                     ; preds = %315
  %319 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv87.i, !dbg !289
  %320 = load i32* %319, align 4, !dbg !289, !tbaa !121
  %321 = load i32* %313, align 4, !dbg !289, !tbaa !121
  %322 = add nsw i32 %321, %320, !dbg !289
  %323 = srem i32 %322, 255, !dbg !289
  %324 = sext i32 %323 to i64, !dbg !289
  %325 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %324, !dbg !289
  %326 = load i32* %325, align 4, !dbg !289, !tbaa !121
  %327 = xor i32 %326, 1, !dbg !289
  %328 = sext i32 %327 to i64, !dbg !289
  %329 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %328, !dbg !289
  %330 = load i32* %329, align 4, !dbg !289, !tbaa !121
  %331 = add nsw i32 %330, %q.637.i, !dbg !289
  tail call void @llvm.dbg.value(metadata !{i32 %331}, i64 0, metadata !237) #2, !dbg !289
  br label %332, !dbg !289

; <label>:332                                     ; preds = %318, %315
  %q.7.i = phi i32 [ %331, %318 ], [ %q.637.i, %315 ]
  %indvars.iv.next88.i = add nuw nsw i64 %indvars.iv87.i, 1, !dbg !287
  %lftr.wideiv = trunc i64 %indvars.iv.next88.i to i32, !dbg !287
  %exitcond29 = icmp eq i32 %lftr.wideiv, %308, !dbg !287
  br i1 %exitcond29, label %._crit_edge40.i, label %315, !dbg !287

._crit_edge40.i:                                  ; preds = %332, %._crit_edge.thread.i
  %q.6.lcssa.i = phi i32 [ 0, %._crit_edge.thread.i ], [ %q.7.i, %332 ]
  %333 = srem i32 %q.6.lcssa.i, 255, !dbg !292
  tail call void @llvm.dbg.value(metadata !{i32 %333}, i64 0, metadata !237) #2, !dbg !292
  %334 = add i32 %311, 255, !dbg !293
  %335 = sub i32 %334, %333, !dbg !293
  %336 = srem i32 %335, 255, !dbg !293
  %337 = sext i32 %336 to i64, !dbg !293
  %338 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %337, !dbg !293
  %339 = load i32* %338, align 4, !dbg !293, !tbaa !121
  %340 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %287, !dbg !294
  %341 = load i32* %340, align 4, !dbg !294, !tbaa !121
  %342 = xor i32 %341, %339, !dbg !294
  store i32 %342, i32* %340, align 4, !dbg !294, !tbaa !121
  br label %343, !dbg !295

; <label>:343                                     ; preds = %._crit_edge40.i, %._crit_edge.i
  %344 = phi i32 [ %146, %._crit_edge.i ], [ %308, %._crit_edge40.i ]
  %indvars.iv.next90.i = add nuw nsw i64 %indvars.iv89.i, 1, !dbg !267
  %lftr.wideiv30 = trunc i64 %indvars.iv.next90.i to i32, !dbg !267
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %146, !dbg !267
  br i1 %exitcond31, label %decode_rs.exit, label %.lr.ph42.i, !dbg !267

.preheader14.i:                                   ; preds = %225, %352
  %indvars.iv101.i = phi i64 [ %indvars.iv.next102.i, %352 ], [ 0, %225 ]
  %345 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv101.i, !dbg !296
  %346 = load i32* %345, align 4, !dbg !296, !tbaa !121
  %347 = icmp eq i32 %346, -1, !dbg !296
  br i1 %347, label %352, label %348, !dbg !296

; <label>:348                                     ; preds = %.preheader14.i
  %349 = sext i32 %346 to i64, !dbg !299
  %350 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %349, !dbg !299
  %351 = load i32* %350, align 4, !dbg !299, !tbaa !121
  br label %352, !dbg !299

; <label>:352                                     ; preds = %348, %.preheader14.i
  %storemerge2.i = phi i32 [ %351, %348 ], [ 0, %.preheader14.i ]
  store i32 %storemerge2.i, i32* %345, align 4, !dbg !299, !tbaa !121
  %indvars.iv.next102.i = add nuw nsw i64 %indvars.iv101.i, 1, !dbg !300
  %exitcond103.i = icmp eq i64 %indvars.iv.next102.i, 255, !dbg !300
  br i1 %exitcond103.i, label %decode_rs.exit, label %.preheader14.i, !dbg !300

.critedge.thread.preheader.i:                     ; preds = %.critedge.i, %.preheader20._crit_edge.i, %.critedge.thread.i
  %indvars.iv82.i = phi i64 [ %indvars.iv.next83.i, %.critedge.thread.i ], [ 0, %.preheader20._crit_edge.i ], [ 0, %.critedge.i ]
  %353 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv82.i, !dbg !301
  %354 = load i32* %353, align 4, !dbg !301, !tbaa !121
  %355 = icmp eq i32 %354, -1, !dbg !301
  br i1 %355, label %.critedge.thread.i, label %356, !dbg !301

; <label>:356                                     ; preds = %.critedge.thread.preheader.i
  %357 = sext i32 %354 to i64, !dbg !304
  %358 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %357, !dbg !304
  %359 = load i32* %358, align 4, !dbg !304, !tbaa !121
  br label %.critedge.thread.i, !dbg !304

.critedge.thread.i:                               ; preds = %356, %.critedge.thread.preheader.i
  %storemerge1.i = phi i32 [ %359, %356 ], [ 0, %.critedge.thread.preheader.i ]
  store i32 %storemerge1.i, i32* %353, align 4, !dbg !304, !tbaa !121
  %indvars.iv.next83.i = add nuw nsw i64 %indvars.iv82.i, 1, !dbg !305
  %exitcond84.i = icmp eq i64 %indvars.iv.next83.i, 255, !dbg !305
  br i1 %exitcond84.i, label %decode_rs.exit, label %.critedge.thread.preheader.i, !dbg !305

.preheader.i:                                     ; preds = %51, %367
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %367 ], [ 0, %51 ]
  %360 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv.i, !dbg !306
  %361 = load i32* %360, align 4, !dbg !306, !tbaa !121
  %362 = icmp eq i32 %361, -1, !dbg !306
  br i1 %362, label %367, label %363, !dbg !306

; <label>:363                                     ; preds = %.preheader.i
  %364 = sext i32 %361 to i64, !dbg !309
  %365 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %364, !dbg !309
  %366 = load i32* %365, align 4, !dbg !309, !tbaa !121
  br label %367, !dbg !309

; <label>:367                                     ; preds = %363, %.preheader.i
  %storemerge.i = phi i32 [ %366, %363 ], [ 0, %.preheader.i ]
  store i32 %storemerge.i, i32* %360, align 4, !dbg !309, !tbaa !121
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !310
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 255, !dbg !310
  br i1 %exitcond.i, label %decode_rs.exit, label %.preheader.i, !dbg !310

decode_rs.exit:                                   ; preds = %.preheader9.i, %367, %.critedge.thread.i, %343, %352, %decode_rs.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %decode_rs.exit ], [ 0, %352 ], [ 0, %343 ], [ 0, %.critedge.thread.i ], [ 0, %367 ], [ 0, %.preheader9.i ]
  %368 = add nsw i64 %indvars.iv, 67, !dbg !311
  %369 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %368, !dbg !311
  %370 = load i32* %369, align 4, !dbg !311, !tbaa !121
  %371 = trunc i32 %370 to i8, !dbg !311
  %372 = getelementptr inbounds i8* %data_out, i64 %indvars.iv, !dbg !311
  store i8 %371, i8* %372, align 1, !dbg !311, !tbaa !118
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !314
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !314
  br i1 %exitcond, label %373, label %decode_rs.exit, !dbg !314

; <label>:373                                     ; preds = %decode_rs.exit
  ret void, !dbg !315
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize nounwind optsize uwtable
define void @rsenc_204(i8* nocapture %data_out, i8* nocapture readonly %data_in) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %data_out}, i64 0, metadata !17), !dbg !316
  tail call void @llvm.dbg.value(metadata !{i8* %data_in}, i64 0, metadata !18), !dbg !316
  %.b = load i1* @inited, align 1
  br i1 %.b, label %.preheader2, label %1, !dbg !317

; <label>:1                                       ; preds = %0
  tail call fastcc void @generate_gf() #4, !dbg !319
  tail call fastcc void @gen_poly() #4, !dbg !321
  store i1 true, i1* @inited, align 1
  br label %.preheader2, !dbg !322

.preheader2:                                      ; preds = %1, %0
  call void @llvm.memset.p0i8.i64(i8* bitcast ([239 x i32]* @data to i8*), i8 0, i64 204, i32 16, i1 false), !dbg !323
  br label %2, !dbg !326

; <label>:2                                       ; preds = %2, %.preheader2
  %indvars.iv10 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next11, %2 ]
  %3 = getelementptr inbounds i8* %data_in, i64 %indvars.iv10, !dbg !328
  %4 = load i8* %3, align 1, !dbg !328, !tbaa !118
  %5 = zext i8 %4 to i32, !dbg !328
  %6 = add nsw i64 %indvars.iv10, 51, !dbg !328
  %7 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %6, !dbg !328
  store i32 %5, i32* %7, align 4, !dbg !328, !tbaa !121
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !326
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 188, !dbg !326
  br i1 %exitcond12, label %8, label %2, !dbg !326

; <label>:8                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !330) #2, !dbg !332
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @bb to i8*), i8 0, i64 64, i32 16, i1 false) #2, !dbg !332
  %9 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !334, !tbaa !121
  br label %10, !dbg !339

; <label>:10                                      ; preds = %._crit_edge.i, %8
  %11 = phi i32 [ 0, %8 ], [ %.pre.i, %._crit_edge.i ]
  %indvars.iv9.i = phi i64 [ 238, %8 ], [ %indvars.iv.next10.i, %._crit_edge.i ]
  %12 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %indvars.iv9.i, !dbg !340
  %13 = load i32* %12, align 4, !dbg !340, !tbaa !121
  %14 = xor i32 %13, %11, !dbg !340
  %15 = sext i32 %14 to i64, !dbg !340
  %16 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %15, !dbg !340
  %17 = load i32* %16, align 4, !dbg !340, !tbaa !121
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !341) #2, !dbg !340
  %18 = icmp eq i32 %17, -1, !dbg !342
  tail call void @llvm.dbg.value(metadata !343, i64 0, metadata !344) #2, !dbg !345
  br i1 %18, label %.preheader.i, label %.preheader1.i, !dbg !342

.preheader1.i:                                    ; preds = %10, %.backedge.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.backedge.i ], [ 15, %10 ]
  %19 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.i, !dbg !347
  %20 = load i32* %19, align 4, !dbg !347, !tbaa !121
  %21 = icmp eq i32 %20, -1, !dbg !347
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1, !dbg !345
  %22 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.next.i, !dbg !349
  %23 = load i32* %22, align 4, !dbg !349, !tbaa !121
  br i1 %21, label %34, label %24, !dbg !347

; <label>:24                                      ; preds = %.preheader1.i
  %25 = add nsw i32 %20, %17, !dbg !349
  %26 = srem i32 %25, 255, !dbg !349
  %27 = sext i32 %26 to i64, !dbg !349
  %28 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %27, !dbg !349
  %29 = load i32* %28, align 4, !dbg !349, !tbaa !121
  %30 = xor i32 %29, %23, !dbg !349
  %31 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.i, !dbg !349
  store i32 %30, i32* %31, align 4, !dbg !349, !tbaa !121
  br label %.backedge.i, !dbg !349

.backedge.i:                                      ; preds = %34, %24
  %32 = trunc i64 %indvars.iv.next.i to i32, !dbg !345
  %33 = icmp sgt i32 %32, 0, !dbg !345
  br i1 %33, label %.preheader1.i, label %36, !dbg !345

; <label>:34                                      ; preds = %.preheader1.i
  %35 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.i, !dbg !350
  store i32 %23, i32* %35, align 4, !dbg !350, !tbaa !121
  br label %.backedge.i

; <label>:36                                      ; preds = %.backedge.i
  %37 = add nsw i32 %17, %9, !dbg !334
  %38 = srem i32 %37, 255, !dbg !334
  %39 = sext i32 %38 to i64, !dbg !334
  %40 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %39, !dbg !334
  %41 = load i32* %40, align 4, !dbg !334, !tbaa !121
  br label %.loopexit.i, !dbg !351

.preheader.i:                                     ; preds = %10, %.preheader.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %.preheader.i ], [ 15, %10 ]
  %indvars.iv.next8.i = add nsw i64 %indvars.iv7.i, -1, !dbg !352
  %42 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.next8.i, !dbg !355
  %43 = load i32* %42, align 4, !dbg !355, !tbaa !121
  %44 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv7.i, !dbg !355
  store i32 %43, i32* %44, align 4, !dbg !355, !tbaa !121
  %45 = trunc i64 %indvars.iv.next8.i to i32, !dbg !352
  %46 = icmp sgt i32 %45, 0, !dbg !352
  br i1 %46, label %.preheader.i, label %.loopexit.i, !dbg !352

.loopexit.i:                                      ; preds = %.preheader.i, %36
  %storemerge.i = phi i32 [ %41, %36 ], [ 0, %.preheader.i ]
  store i32 %storemerge.i, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 0), align 16, !dbg !356, !tbaa !121
  %47 = trunc i64 %indvars.iv9.i to i32, !dbg !339
  %48 = icmp sgt i32 %47, 0, !dbg !339
  br i1 %48, label %._crit_edge.i, label %encode_rs.exit, !dbg !339

._crit_edge.i:                                    ; preds = %.loopexit.i
  %indvars.iv.next10.i = add nsw i64 %indvars.iv9.i, -1, !dbg !339
  %.pre.i = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !340, !tbaa !121
  br label %10, !dbg !339

encode_rs.exit:                                   ; preds = %.loopexit.i, %encode_rs.exit
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %encode_rs.exit ], [ 0, %.loopexit.i ]
  %49 = getelementptr inbounds i8* %data_in, i64 %indvars.iv7, !dbg !357
  %50 = load i8* %49, align 1, !dbg !357, !tbaa !118
  %51 = getelementptr inbounds i8* %data_out, i64 %indvars.iv7, !dbg !357
  store i8 %50, i8* %51, align 1, !dbg !357, !tbaa !118
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !360
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 188, !dbg !360
  br i1 %exitcond9, label %.preheader, label %encode_rs.exit, !dbg !360

.preheader:                                       ; preds = %encode_rs.exit, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %encode_rs.exit ]
  %52 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv, !dbg !361
  %53 = load i32* %52, align 4, !dbg !361, !tbaa !121
  %54 = trunc i32 %53 to i8, !dbg !361
  %55 = add nsw i64 %indvars.iv, 188, !dbg !361
  %56 = getelementptr inbounds i8* %data_out, i64 %55, !dbg !361
  store i8 %54, i8* %56, align 1, !dbg !361, !tbaa !118
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !364
  %exitcond = icmp eq i64 %indvars.iv.next, 16, !dbg !364
  br i1 %exitcond, label %57, label %.preheader, !dbg !364

; <label>:57                                      ; preds = %.preheader
  ret void, !dbg !365
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  %rs_in = alloca [204 x i8], align 16
  %rs_out = alloca [204 x i8], align 16
  %1 = getelementptr inbounds [204 x i8]* %rs_in, i64 0, i64 0, !dbg !366
  call void @llvm.lifetime.start(i64 204, i8* %1) #2, !dbg !366
  tail call void @llvm.dbg.declare(metadata !{[204 x i8]* %rs_in}, metadata !24), !dbg !366
  %2 = getelementptr inbounds [204 x i8]* %rs_out, i64 0, i64 0, !dbg !366
  call void @llvm.lifetime.start(i64 204, i8* %2) #2, !dbg !366
  tail call void @llvm.dbg.declare(metadata !{[204 x i8]* %rs_out}, metadata !28), !dbg !366
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !29), !dbg !367
  br label %.preheader, !dbg !367

.preheader:                                       ; preds = %._crit_edge, %0
  %i.03 = phi i32 [ 0, %0 ], [ %19, %._crit_edge ]
  br label %3, !dbg !369

; <label>:3                                       ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = tail call i32 (...)* @random() #5, !dbg !372
  %5 = trunc i32 %4 to i8, !dbg !372
  %6 = getelementptr inbounds [204 x i8]* %rs_in, i64 0, i64 %indvars.iv, !dbg !372
  store i8 %5, i8* %6, align 1, !dbg !372, !tbaa !118
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !369
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !369
  br i1 %exitcond, label %7, label %3, !dbg !369

; <label>:7                                       ; preds = %3
  call void @rsenc_204(i8* %2, i8* %1) #4, !dbg !374
  %8 = tail call i32 (...)* @random() #5, !dbg !375
  %9 = and i32 %8, 127, !dbg !375
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !31), !dbg !375
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !30), !dbg !376
  %10 = icmp eq i32 %9, 0, !dbg !376
  br i1 %10, label %._crit_edge, label %.lr.ph, !dbg !376

.lr.ph:                                           ; preds = %7, %.lr.ph
  %j.12 = phi i32 [ %17, %.lr.ph ], [ 0, %7 ]
  %11 = tail call i32 (...)* @random() #5, !dbg !378
  %12 = trunc i32 %11 to i8, !dbg !378
  %13 = tail call i32 (...)* @random() #5, !dbg !378
  %14 = srem i32 %13, 204, !dbg !378
  %15 = sext i32 %14 to i64, !dbg !378
  %16 = getelementptr inbounds [204 x i8]* %rs_out, i64 0, i64 %15, !dbg !378
  store i8 %12, i8* %16, align 1, !dbg !378, !tbaa !118
  %17 = add nsw i32 %j.12, 1, !dbg !376
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !30), !dbg !376
  %18 = icmp slt i32 %17, %9, !dbg !376
  br i1 %18, label %.lr.ph, label %._crit_edge, !dbg !376

._crit_edge:                                      ; preds = %.lr.ph, %7
  call void @rsdec_204(i8* %1, i8* %2) #4, !dbg !380
  %19 = add nsw i32 %i.03, 1, !dbg !367
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !29), !dbg !367
  %exitcond4 = icmp eq i32 %19, 150000, !dbg !367
  br i1 %exitcond4, label %20, label %.preheader, !dbg !367

; <label>:20                                      ; preds = %._crit_edge
  call void @llvm.lifetime.end(i64 204, i8* %2) #2, !dbg !381
  call void @llvm.lifetime.end(i64 204, i8* %1) #2, !dbg !381
  ret i32 0, !dbg !382
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: minsize optsize
declare i32 @random(...) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
define internal fastcc void @gen_poly() #0 {
  store i32 2, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !383, !tbaa !121
  store i32 1, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 1), align 4, !dbg !384, !tbaa !121
  tail call void @llvm.dbg.value(metadata !385, i64 0, metadata !77), !dbg !386
  br label %.lr.ph, !dbg !386

.lr.ph:                                           ; preds = %0, %._crit_edge
  %indvars.iv14 = phi i64 [ 2, %0 ], [ %indvars.iv.next15, %._crit_edge ]
  %indvars.iv6 = phi i64 [ 1, %0 ], [ %indvars.iv.next7, %._crit_edge ]
  %1 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv14, !dbg !388
  store i32 1, i32* %1, align 4, !dbg !388, !tbaa !121
  br label %2, !dbg !390

; <label>:2                                       ; preds = %.lr.ph, %20
  %indvars.iv12 = phi i64 [ %indvars.iv14, %.lr.ph ], [ %indvars.iv.next13, %20 ]
  %indvars.iv8 = phi i64 [ %indvars.iv6, %.lr.ph ], [ %indvars.iv.next9, %20 ]
  %3 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv8, !dbg !392
  %4 = load i32* %3, align 4, !dbg !392, !tbaa !121
  %5 = icmp eq i32 %4, 0, !dbg !392
  %6 = add nsw i64 %indvars.iv12, -2, !dbg !392
  %7 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %6, !dbg !392
  %8 = load i32* %7, align 4, !dbg !392, !tbaa !121
  br i1 %5, label %20, label %9, !dbg !392

; <label>:9                                       ; preds = %2
  %10 = sext i32 %4 to i64, !dbg !392
  %11 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %10, !dbg !392
  %12 = load i32* %11, align 4, !dbg !392, !tbaa !121
  %13 = trunc i64 %indvars.iv14 to i32, !dbg !392
  %14 = add nsw i32 %12, %13, !dbg !392
  %15 = srem i32 %14, 255, !dbg !392
  %16 = sext i32 %15 to i64, !dbg !392
  %17 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %16, !dbg !392
  %18 = load i32* %17, align 4, !dbg !392, !tbaa !121
  %19 = xor i32 %18, %8, !dbg !392
  br label %20, !dbg !392

; <label>:20                                      ; preds = %2, %9
  %storemerge = phi i32 [ %19, %9 ], [ %8, %2 ]
  store i32 %storemerge, i32* %3, align 4, !dbg !392, !tbaa !121
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1, !dbg !390
  %21 = trunc i64 %indvars.iv.next9 to i32, !dbg !390
  %22 = icmp sgt i32 %21, 0, !dbg !390
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, -1, !dbg !390
  br i1 %22, label %2, label %._crit_edge, !dbg !390

._crit_edge:                                      ; preds = %20
  %23 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !394, !tbaa !121
  %24 = sext i32 %23 to i64, !dbg !394
  %25 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %24, !dbg !394
  %26 = load i32* %25, align 4, !dbg !394, !tbaa !121
  %27 = trunc i64 %indvars.iv14 to i32, !dbg !394
  %28 = add nsw i32 %26, %27, !dbg !394
  %29 = srem i32 %28, 255, !dbg !394
  %30 = sext i32 %29 to i64, !dbg !394
  %31 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %30, !dbg !394
  %32 = load i32* %31, align 4, !dbg !394, !tbaa !121
  store i32 %32, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !394, !tbaa !121
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !386
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !386
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 17, !dbg !386
  br i1 %exitcond17, label %.preheader, label %.lr.ph, !dbg !386

.preheader:                                       ; preds = %._crit_edge, %._crit_edge19
  %33 = phi i32 [ %.pre, %._crit_edge19 ], [ %32, %._crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge19 ], [ 0, %._crit_edge ]
  %34 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv, !dbg !395
  %35 = sext i32 %33 to i64, !dbg !395
  %36 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %35, !dbg !395
  %37 = load i32* %36, align 4, !dbg !395, !tbaa !121
  store i32 %37, i32* %34, align 4, !dbg !395, !tbaa !121
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !395
  %exitcond = icmp eq i64 %indvars.iv.next, 17, !dbg !395
  br i1 %exitcond, label %38, label %._crit_edge19, !dbg !395

._crit_edge19:                                    ; preds = %.preheader
  %.phi.trans.insert = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.next
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !395, !tbaa !121
  br label %.preheader, !dbg !395

; <label>:38                                      ; preds = %.preheader
  ret void, !dbg !397
}

; Function Attrs: minsize nounwind optsize uwtable
define internal fastcc void @generate_gf() #0 {
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !82), !dbg !398
  store i32 0, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !399, !tbaa !121
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !81), !dbg !400
  br label %1, !dbg !400

; <label>:1                                       ; preds = %12, %0
  %indvars.iv4 = phi i64 [ 0, %0 ], [ %indvars.iv.next5, %12 ]
  %mask.03 = phi i32 [ 1, %0 ], [ %13, %12 ]
  %2 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv4, !dbg !402
  store i32 %mask.03, i32* %2, align 4, !dbg !402, !tbaa !121
  %3 = sext i32 %mask.03 to i64, !dbg !404
  %4 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %3, !dbg !404
  %5 = trunc i64 %indvars.iv4 to i32, !dbg !404
  store i32 %5, i32* %4, align 4, !dbg !404, !tbaa !121
  %6 = lshr i64 285, %indvars.iv4, !dbg !405
  %7 = and i64 %6, 1, !dbg !405
  %8 = icmp eq i64 %7, 0, !dbg !405
  br i1 %8, label %12, label %9, !dbg !405

; <label>:9                                       ; preds = %1
  %10 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !407, !tbaa !121
  %11 = xor i32 %10, %mask.03, !dbg !407
  store i32 %11, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !407, !tbaa !121
  br label %12, !dbg !407

; <label>:12                                      ; preds = %1, %9
  %13 = shl i32 %mask.03, 1, !dbg !408
  tail call void @llvm.dbg.value(metadata !409, i64 0, metadata !82), !dbg !408
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !400
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 8, !dbg !400
  br i1 %exitcond6, label %14, label %1, !dbg !400

; <label>:14                                      ; preds = %12
  %15 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !410, !tbaa !121
  %16 = sext i32 %15 to i64, !dbg !410
  %17 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %16, !dbg !410
  store i32 8, i32* %17, align 4, !dbg !410, !tbaa !121
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !82), !dbg !412
  tail call void @llvm.dbg.value(metadata !413, i64 0, metadata !81), !dbg !414
  br label %18, !dbg !414

; <label>:18                                      ; preds = %30, %14
  %19 = phi i32 [ %15, %14 ], [ %31, %30 ]
  %indvars.iv = phi i64 [ 9, %14 ], [ %indvars.iv.next, %30 ]
  %20 = icmp slt i32 %19, 128, !dbg !416
  br i1 %20, label %27, label %21, !dbg !416

; <label>:21                                      ; preds = %18
  %22 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !419, !tbaa !121
  %23 = shl i32 %19, 1, !dbg !419
  %24 = xor i32 %23, 256, !dbg !419
  %25 = xor i32 %22, %24, !dbg !419
  %26 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv, !dbg !419
  store i32 %25, i32* %26, align 4, !dbg !419, !tbaa !121
  br label %30, !dbg !419

; <label>:27                                      ; preds = %18
  %28 = shl i32 %19, 1, !dbg !420
  %29 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv, !dbg !420
  store i32 %28, i32* %29, align 4, !dbg !420, !tbaa !121
  br label %30

; <label>:30                                      ; preds = %27, %21
  %31 = phi i32 [ %28, %27 ], [ %25, %21 ]
  %32 = sext i32 %31 to i64, !dbg !421
  %33 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %32, !dbg !421
  %34 = trunc i64 %indvars.iv to i32, !dbg !421
  store i32 %34, i32* %33, align 4, !dbg !421, !tbaa !121
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !414
  %exitcond = icmp eq i64 %indvars.iv.next, 255, !dbg !414
  br i1 %exitcond, label %35, label %18, !dbg !414

; <label>:35                                      ; preds = %30
  store i32 -1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 0), align 16, !dbg !422, !tbaa !121
  ret void, !dbg !423
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { minsize optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize optsize }
attributes #5 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!100, !101}
!llvm.ident = !{!102}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !83, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c] [DW_LANG_C99]
!1 = metadata !{metadata !"reedsolomon.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !15, metadata !20, metadata !32, metadata !39, metadata !75, metadata !79}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rsdec_204", metadata !"rsdec_204", metadata !"", i32 344, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*, i8*)* @rsdec_204, null, null, metadata !10, i32 345} ; [ DW_TAG_subprogram ] [line 344] [def] [scope 345] [rsdec_204]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!9 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!10 = metadata !{metadata !11, metadata !12, metadata !13}
!11 = metadata !{i32 786689, metadata !4, metadata !"data_out", metadata !5, i32 16777560, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data_out] [line 344]
!12 = metadata !{i32 786689, metadata !4, metadata !"data_in", metadata !5, i32 33554776, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data_in] [line 344]
!13 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 346, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 346]
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rsenc_204", metadata !"rsenc_204", metadata !"", i32 383, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*, i8*)* @rsenc_204, null, null, metadata !16, i32 384} ; [ DW_TAG_subprogram ] [line 383] [def] [scope 384] [rsenc_204]
!16 = metadata !{metadata !17, metadata !18, metadata !19}
!17 = metadata !{i32 786689, metadata !15, metadata !"data_out", metadata !5, i32 16777599, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data_out] [line 383]
!18 = metadata !{i32 786689, metadata !15, metadata !"data_in", metadata !5, i32 33554815, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data_in] [line 383]
!19 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 385, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 385]
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 416, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @main, null, null, metadata !23, i32 416} ; [ DW_TAG_subprogram ] [line 416] [def] [main]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !14}
!23 = metadata !{metadata !24, metadata !28, metadata !29, metadata !30, metadata !31}
!24 = metadata !{i32 786688, metadata !20, metadata !"rs_in", metadata !5, i32 417, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rs_in] [line 417]
!25 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1632, i64 8, i32 0, i32 0, metadata !9, metadata !26, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1632, align 8, offset 0] [from unsigned char]
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786465, i64 0, i64 204}      ; [ DW_TAG_subrange_type ] [0, 203]
!28 = metadata !{i32 786688, metadata !20, metadata !"rs_out", metadata !5, i32 417, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rs_out] [line 417]
!29 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 418, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 418]
!30 = metadata !{i32 786688, metadata !20, metadata !"j", metadata !5, i32 418, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 418]
!31 = metadata !{i32 786688, metadata !20, metadata !"k", metadata !5, i32 418, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 418]
!32 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"encode_rs", metadata !"encode_rs", metadata !"", i32 112, metadata !33, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !35, i32 119} ; [ DW_TAG_subprogram ] [line 112] [local] [def] [scope 119] [encode_rs]
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{null}
!35 = metadata !{metadata !36, metadata !37, metadata !38}
!36 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !5, i32 120, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 120]
!37 = metadata !{i32 786688, metadata !32, metadata !"j", metadata !5, i32 120, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 120]
!38 = metadata !{i32 786688, metadata !32, metadata !"feedback", metadata !5, i32 121, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [feedback] [line 121]
!39 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"decode_rs", metadata !"decode_rs", metadata !"", i32 144, metadata !33, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !40, i32 163} ; [ DW_TAG_subprogram ] [line 144] [local] [def] [scope 163] [decode_rs]
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !50, metadata !53, metadata !54, metadata !55, metadata !59, metadata !60, metadata !61, metadata !65, metadata !66, metadata !70, metadata !74}
!41 = metadata !{i32 786688, metadata !39, metadata !"i", metadata !5, i32 164, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 164]
!42 = metadata !{i32 786688, metadata !39, metadata !"j", metadata !5, i32 164, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 164]
!43 = metadata !{i32 786688, metadata !39, metadata !"u", metadata !5, i32 164, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 164]
!44 = metadata !{i32 786688, metadata !39, metadata !"q", metadata !5, i32 164, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 164]
!45 = metadata !{i32 786688, metadata !39, metadata !"elp", metadata !5, i32 165, metadata !46, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [elp] [line 165]
!46 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 9216, i64 32, i32 0, i32 0, metadata !14, metadata !47, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 9216, align 32, offset 0] [from int]
!47 = metadata !{metadata !48, metadata !49}
!48 = metadata !{i32 786465, i64 0, i64 18}       ; [ DW_TAG_subrange_type ] [0, 17]
!49 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!50 = metadata !{i32 786688, metadata !39, metadata !"d", metadata !5, i32 165, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 165]
!51 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 576, i64 32, i32 0, i32 0, metadata !14, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 576, align 32, offset 0] [from int]
!52 = metadata !{metadata !48}
!53 = metadata !{i32 786688, metadata !39, metadata !"l", metadata !5, i32 165, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 165]
!54 = metadata !{i32 786688, metadata !39, metadata !"u_lu", metadata !5, i32 165, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u_lu] [line 165]
!55 = metadata !{i32 786688, metadata !39, metadata !"s", metadata !5, i32 165, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 165]
!56 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !14, metadata !57, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!59 = metadata !{i32 786688, metadata !39, metadata !"count", metadata !5, i32 166, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 166]
!60 = metadata !{i32 786688, metadata !39, metadata !"syn_error", metadata !5, i32 166, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [syn_error] [line 166]
!61 = metadata !{i32 786688, metadata !39, metadata !"root", metadata !5, i32 166, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [root] [line 166]
!62 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 32, i32 0, i32 0, metadata !14, metadata !63, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 32, offset 0] [from int]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786465, i64 0, i64 8}        ; [ DW_TAG_subrange_type ] [0, 7]
!65 = metadata !{i32 786688, metadata !39, metadata !"loc", metadata !5, i32 166, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loc] [line 166]
!66 = metadata !{i32 786688, metadata !39, metadata !"z", metadata !5, i32 166, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 166]
!67 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 288, i64 32, i32 0, i32 0, metadata !14, metadata !68, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from int]
!68 = metadata !{metadata !69}
!69 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ] [0, 8]
!70 = metadata !{i32 786688, metadata !39, metadata !"err", metadata !5, i32 166, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 166]
!71 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8160, i64 32, i32 0, i32 0, metadata !14, metadata !72, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8160, align 32, offset 0] [from int]
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ] [0, 254]
!74 = metadata !{i32 786688, metadata !39, metadata !"reg", metadata !5, i32 166, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [reg] [line 166]
!75 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_poly", metadata !"gen_poly", metadata !"", i32 91, metadata !33, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @gen_poly, null, null, metadata !76, i32 95} ; [ DW_TAG_subprogram ] [line 91] [local] [def] [scope 95] [gen_poly]
!76 = metadata !{metadata !77, metadata !78}
!77 = metadata !{i32 786688, metadata !75, metadata !"i", metadata !5, i32 96, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 96]
!78 = metadata !{i32 786688, metadata !75, metadata !"j", metadata !5, i32 96, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 96]
!79 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"generate_gf", metadata !"generate_gf", metadata !"", i32 61, metadata !33, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @generate_gf, null, null, metadata !80, i32 67} ; [ DW_TAG_subprogram ] [line 61] [local] [def] [scope 67] [generate_gf]
!80 = metadata !{metadata !81, metadata !82}
!81 = metadata !{i32 786688, metadata !79, metadata !"i", metadata !5, i32 68, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 68]
!82 = metadata !{i32 786688, metadata !79, metadata !"mask", metadata !5, i32 68, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mask] [line 68]
!83 = metadata !{metadata !84, metadata !88, metadata !89, metadata !93, metadata !96, metadata !97, metadata !98, metadata !99}
!84 = metadata !{i32 786484, i32 0, null, metadata !"index_of", metadata !"index_of", metadata !"", metadata !5, i32 57, metadata !85, i32 1, i32 1, [256 x i32]* @index_of, null} ; [ DW_TAG_variable ] [index_of] [line 57] [local] [def]
!85 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !14, metadata !86, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from int]
!86 = metadata !{metadata !87}
!87 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!88 = metadata !{i32 786484, i32 0, null, metadata !"recd", metadata !"recd", metadata !"", metadata !5, i32 58, metadata !71, i32 1, i32 1, [255 x i32]* @recd, null} ; [ DW_TAG_variable ] [recd] [line 58] [local] [def]
!89 = metadata !{i32 786484, i32 0, null, metadata !"data", metadata !"data", metadata !"", metadata !5, i32 58, metadata !90, i32 1, i32 1, [239 x i32]* @data, null} ; [ DW_TAG_variable ] [data] [line 58] [local] [def]
!90 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 7648, i64 32, i32 0, i32 0, metadata !14, metadata !91, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 7648, align 32, offset 0] [from int]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786465, i64 0, i64 239}      ; [ DW_TAG_subrange_type ] [0, 238]
!93 = metadata !{i32 786484, i32 0, null, metadata !"bb", metadata !"bb", metadata !"", metadata !5, i32 58, metadata !94, i32 1, i32 1, [16 x i32]* @bb, null} ; [ DW_TAG_variable ] [bb] [line 58] [local] [def]
!94 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 32, i32 0, i32 0, metadata !14, metadata !95, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from int]
!95 = metadata !{metadata !49}
!96 = metadata !{i32 786484, i32 0, null, metadata !"alpha_to", metadata !"alpha_to", metadata !"", metadata !5, i32 57, metadata !85, i32 1, i32 1, [256 x i32]* @alpha_to, null} ; [ DW_TAG_variable ] [alpha_to] [line 57] [local] [def]
!97 = metadata !{i32 786484, i32 0, null, metadata !"gg", metadata !"gg", metadata !"", metadata !5, i32 57, metadata !56, i32 1, i32 1, [17 x i32]* @gg, null} ; [ DW_TAG_variable ] [gg] [line 57] [local] [def]
!98 = metadata !{i32 786484, i32 0, null, metadata !"pp", metadata !"pp", metadata !"", metadata !5, i32 56, metadata !67, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [pp] [line 56] [local] [def]
!99 = metadata !{i32 786484, i32 0, null, metadata !"inited", metadata !"inited", metadata !"", metadata !5, i32 59, metadata !14, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [inited] [line 59] [local] [def]
!100 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!101 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!102 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!103 = metadata !{i32 344, i32 0, metadata !4, null}
!104 = metadata !{i32 348, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !4, i32 348, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!106 = metadata !{i32 350, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !105, i32 348, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!108 = metadata !{i32 352, i32 0, metadata !107, null}
!109 = metadata !{i32 355, i32 0, metadata !107, null}
!110 = metadata !{i32 365, i32 0, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !112, i32 364, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!112 = metadata !{i32 786443, metadata !1, metadata !4, i32 364, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!113 = metadata !{i32 368, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !4, i32 368, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!115 = metadata !{i32 361, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !117, i32 360, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!117 = metadata !{i32 786443, metadata !1, metadata !4, i32 360, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!118 = metadata !{metadata !119, metadata !119, i64 0}
!119 = metadata !{metadata !"omnipotent char", metadata !120, i64 0}
!120 = metadata !{metadata !"Simple C/C++ TBAA"}
!121 = metadata !{metadata !122, metadata !122, i64 0}
!122 = metadata !{metadata !"int", metadata !119, i64 0}
!123 = metadata !{i32 360, i32 0, metadata !117, null}
!124 = metadata !{i32 369, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !114, i32 368, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!126 = metadata !{i32 373, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !4, i32 372, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!128 = metadata !{i32 372, i32 0, metadata !127, null}
!129 = metadata !{i32 165, i32 0, metadata !39, metadata !130}
!130 = metadata !{i32 376, i32 0, metadata !4, null}
!131 = metadata !{i32 0}
!132 = metadata !{i32 786688, metadata !39, metadata !"count", metadata !5, i32 166, metadata !14, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [count] [line 166]
!133 = metadata !{i32 166, i32 0, metadata !39, metadata !130}
!134 = metadata !{i32 786688, metadata !39, metadata !"syn_error", metadata !5, i32 166, metadata !14, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [syn_error] [line 166]
!135 = metadata !{i32 1}
!136 = metadata !{i32 786688, metadata !39, metadata !"i", metadata !5, i32 164, metadata !14, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [i] [line 164]
!137 = metadata !{i32 169, i32 0, metadata !138, metadata !130}
!138 = metadata !{i32 786443, metadata !1, metadata !39, i32 169, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!139 = metadata !{i32 170, i32 0, metadata !140, metadata !130}
!140 = metadata !{i32 786443, metadata !1, metadata !138, i32 170, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!141 = metadata !{i32 786688, metadata !39, metadata !"j", metadata !5, i32 164, metadata !14, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [j] [line 164]
!142 = metadata !{i32 171, i32 0, metadata !143, metadata !130}
!143 = metadata !{i32 786443, metadata !1, metadata !140, i32 171, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!144 = metadata !{i32 172, i32 0, metadata !145, metadata !130}
!145 = metadata !{i32 786443, metadata !1, metadata !143, i32 172, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!146 = metadata !{i32 173, i32 0, metadata !145, metadata !130}
!147 = metadata !{i32 175, i32 0, metadata !148, metadata !130}
!148 = metadata !{i32 786443, metadata !1, metadata !140, i32 175, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!149 = metadata !{i32 176, i32 0, metadata !140, metadata !130}
!150 = metadata !{i32 179, i32 0, metadata !151, metadata !130}
!151 = metadata !{i32 786443, metadata !1, metadata !39, i32 179, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!152 = metadata !{i32 190, i32 0, metadata !153, metadata !130}
!153 = metadata !{i32 786443, metadata !1, metadata !151, i32 180, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!154 = metadata !{i32 191, i32 0, metadata !153, metadata !130}
!155 = metadata !{i32 192, i32 0, metadata !153, metadata !130}
!156 = metadata !{i32 193, i32 0, metadata !153, metadata !130}
!157 = metadata !{i32 194, i32 0, metadata !158, metadata !130}
!158 = metadata !{i32 786443, metadata !1, metadata !153, i32 194, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!159 = metadata !{i32 195, i32 0, metadata !160, metadata !130}
!160 = metadata !{i32 786443, metadata !1, metadata !158, i32 195, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!161 = metadata !{i32 196, i32 0, metadata !160, metadata !130}
!162 = metadata !{i32 198, i32 0, metadata !153, metadata !130}
!163 = metadata !{i32 199, i32 0, metadata !153, metadata !130}
!164 = metadata !{i32 200, i32 0, metadata !153, metadata !130}
!165 = metadata !{i32 201, i32 0, metadata !153, metadata !130}
!166 = metadata !{i32 786688, metadata !39, metadata !"u", metadata !5, i32 164, metadata !14, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [u] [line 164]
!167 = metadata !{i32 202, i32 0, metadata !153, metadata !130}
!168 = metadata !{i32 204, i32 0, metadata !153, metadata !130}
!169 = metadata !{i32 206, i32 0, metadata !170, metadata !130}
!170 = metadata !{i32 786443, metadata !1, metadata !153, i32 205, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!171 = metadata !{i32 207, i32 0, metadata !172, metadata !130}
!172 = metadata !{i32 786443, metadata !1, metadata !170, i32 207, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!173 = metadata !{i32 208, i32 0, metadata !174, metadata !130}
!174 = metadata !{i32 786443, metadata !1, metadata !172, i32 208, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!175 = metadata !{i32 209, i32 0, metadata !176, metadata !130}
!176 = metadata !{i32 786443, metadata !1, metadata !174, i32 209, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!177 = metadata !{i32 210, i32 0, metadata !178, metadata !130}
!178 = metadata !{i32 786443, metadata !1, metadata !176, i32 210, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!179 = metadata !{i32 211, i32 0, metadata !178, metadata !130}
!180 = metadata !{i32 217, i32 0, metadata !181, metadata !130}
!181 = metadata !{i32 786443, metadata !1, metadata !172, i32 216, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!182 = metadata !{i32 219, i32 0, metadata !183, metadata !130}
!183 = metadata !{i32 786443, metadata !1, metadata !181, i32 219, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!184 = metadata !{i32 222, i32 0, metadata !185, metadata !130}
!185 = metadata !{i32 786443, metadata !1, metadata !186, i32 222, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!186 = metadata !{i32 786443, metadata !1, metadata !183, i32 220, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!187 = metadata !{i32 225, i32 0, metadata !185, metadata !130}
!188 = metadata !{i32 223, i32 0, metadata !189, metadata !130}
!189 = metadata !{i32 786443, metadata !1, metadata !185, i32 223, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!190 = metadata !{i32 230, i32 0, metadata !191, metadata !130}
!191 = metadata !{i32 786443, metadata !1, metadata !181, i32 230, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!192 = metadata !{i32 234, i32 0, metadata !193, metadata !130}
!193 = metadata !{i32 786443, metadata !1, metadata !181, i32 234, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!194 = metadata !{i32 235, i32 0, metadata !195, metadata !130}
!195 = metadata !{i32 786443, metadata !1, metadata !181, i32 235, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!196 = metadata !{i32 237, i32 0, metadata !197, metadata !130}
!197 = metadata !{i32 786443, metadata !1, metadata !195, i32 236, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!198 = metadata !{i32 238, i32 0, metadata !199, metadata !130}
!199 = metadata !{i32 786443, metadata !1, metadata !181, i32 238, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!200 = metadata !{i32 239, i32 0, metadata !201, metadata !130}
!201 = metadata !{i32 786443, metadata !1, metadata !199, i32 239, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!202 = metadata !{i32 236, i32 0, metadata !197, metadata !130}
!203 = metadata !{i32 240, i32 0, metadata !201, metadata !130}
!204 = metadata !{i32 243, i32 0, metadata !170, metadata !130}
!205 = metadata !{i32 246, i32 0, metadata !206, metadata !130}
!206 = metadata !{i32 786443, metadata !1, metadata !170, i32 246, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!207 = metadata !{i32 248, i32 0, metadata !208, metadata !130}
!208 = metadata !{i32 786443, metadata !1, metadata !209, i32 248, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!209 = metadata !{i32 786443, metadata !1, metadata !206, i32 247, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!210 = metadata !{i32 249, i32 0, metadata !208, metadata !130}
!211 = metadata !{i32 251, i32 0, metadata !208, metadata !130}
!212 = metadata !{i32 252, i32 0, metadata !213, metadata !130}
!213 = metadata !{i32 786443, metadata !1, metadata !209, i32 252, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!214 = metadata !{i32 255, i32 0, metadata !209, metadata !130}
!215 = metadata !{i32 253, i32 0, metadata !216, metadata !130}
!216 = metadata !{i32 786443, metadata !1, metadata !213, i32 253, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!217 = metadata !{i32 254, i32 0, metadata !216, metadata !130}
!218 = metadata !{i32 257, i32 0, metadata !170, metadata !130}
!219 = metadata !{i32 260, i32 0, metadata !220, metadata !130}
!220 = metadata !{i32 786443, metadata !1, metadata !153, i32 260, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!221 = metadata !{i32 263, i32 0, metadata !222, metadata !130}
!222 = metadata !{i32 786443, metadata !1, metadata !223, i32 263, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!223 = metadata !{i32 786443, metadata !1, metadata !220, i32 261, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!224 = metadata !{i32 266, i32 0, metadata !225, metadata !130}
!225 = metadata !{i32 786443, metadata !1, metadata !223, i32 266, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!226 = metadata !{i32 267, i32 0, metadata !225, metadata !130}
!227 = metadata !{i32 269, i32 0, metadata !228, metadata !130}
!228 = metadata !{i32 786443, metadata !1, metadata !223, i32 269, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!229 = metadata !{i32 271, i32 0, metadata !230, metadata !130}
!230 = metadata !{i32 786443, metadata !1, metadata !231, i32 271, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!231 = metadata !{i32 786443, metadata !1, metadata !228, i32 270, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!232 = metadata !{i32 272, i32 0, metadata !233, metadata !130}
!233 = metadata !{i32 786443, metadata !1, metadata !230, i32 272, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!234 = metadata !{i32 273, i32 0, metadata !235, metadata !130}
!235 = metadata !{i32 786443, metadata !1, metadata !233, i32 273, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!236 = metadata !{i32 274, i32 0, metadata !235, metadata !130}
!237 = metadata !{i32 786688, metadata !39, metadata !"q", metadata !5, i32 164, metadata !14, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [q] [line 164]
!238 = metadata !{i32 275, i32 0, metadata !235, metadata !130}
!239 = metadata !{i32 276, i32 0, metadata !240, metadata !130}
!240 = metadata !{i32 786443, metadata !1, metadata !231, i32 276, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!241 = metadata !{i32 277, i32 0, metadata !242, metadata !130}
!242 = metadata !{i32 786443, metadata !1, metadata !240, i32 277, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!243 = metadata !{i32 278, i32 0, metadata !242, metadata !130}
!244 = metadata !{i32 279, i32 0, metadata !242, metadata !130}
!245 = metadata !{i32 280, i32 0, metadata !242, metadata !130}
!246 = metadata !{i32 282, i32 0, metadata !247, metadata !130}
!247 = metadata !{i32 786443, metadata !1, metadata !223, i32 282, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!248 = metadata !{i32 285, i32 0, metadata !249, metadata !130}
!249 = metadata !{i32 786443, metadata !1, metadata !250, i32 285, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!250 = metadata !{i32 786443, metadata !1, metadata !247, i32 283, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!251 = metadata !{i32 286, i32 0, metadata !252, metadata !130}
!252 = metadata !{i32 786443, metadata !1, metadata !253, i32 286, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!253 = metadata !{i32 786443, metadata !1, metadata !249, i32 286, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!254 = metadata !{i32 290, i32 0, metadata !255, metadata !130}
!255 = metadata !{i32 786443, metadata !1, metadata !256, i32 290, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!256 = metadata !{i32 786443, metadata !1, metadata !252, i32 288, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!257 = metadata !{i32 289, i32 0, metadata !256, metadata !130}
!258 = metadata !{i32 287, i32 0, metadata !252, metadata !130}
!259 = metadata !{i32 291, i32 0, metadata !255, metadata !130}
!260 = metadata !{i32 293, i32 0, metadata !255, metadata !130}
!261 = metadata !{i32 294, i32 0, metadata !262, metadata !130}
!262 = metadata !{i32 786443, metadata !1, metadata !253, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!263 = metadata !{i32 296, i32 0, metadata !264, metadata !130}
!264 = metadata !{i32 786443, metadata !1, metadata !262, i32 295, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!265 = metadata !{i32 295, i32 0, metadata !264, metadata !130}
!266 = metadata !{i32 297, i32 0, metadata !253, metadata !130}
!267 = metadata !{i32 307, i32 0, metadata !268, metadata !130}
!268 = metadata !{i32 786443, metadata !1, metadata !250, i32 307, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!269 = metadata !{i32 303, i32 0, metadata !270, metadata !130}
!270 = metadata !{i32 786443, metadata !1, metadata !271, i32 303, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!271 = metadata !{i32 786443, metadata !1, metadata !272, i32 302, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!272 = metadata !{i32 786443, metadata !1, metadata !250, i32 301, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!273 = metadata !{i32 304, i32 0, metadata !270, metadata !130}
!274 = metadata !{i32 301, i32 0, metadata !272, metadata !130}
!275 = metadata !{i32 308, i32 0, metadata !276, metadata !130}
!276 = metadata !{i32 786443, metadata !1, metadata !268, i32 308, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!277 = metadata !{i32 309, i32 0, metadata !278, metadata !130}
!278 = metadata !{i32 786443, metadata !1, metadata !276, i32 309, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!279 = metadata !{i32 311, i32 0, metadata !280, metadata !130}
!280 = metadata !{i32 786443, metadata !1, metadata !278, i32 310, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!281 = metadata !{i32 310, i32 0, metadata !280, metadata !130}
!282 = metadata !{i32 312, i32 0, metadata !283, metadata !130}
!283 = metadata !{i32 786443, metadata !1, metadata !276, i32 312, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!284 = metadata !{i32 313, i32 0, metadata !285, metadata !130}
!285 = metadata !{i32 786443, metadata !1, metadata !283, i32 313, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!286 = metadata !{i32 314, i32 0, metadata !285, metadata !130}
!287 = metadata !{i32 315, i32 0, metadata !288, metadata !130}
!288 = metadata !{i32 786443, metadata !1, metadata !285, i32 315, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!289 = metadata !{i32 317, i32 0, metadata !290, metadata !130}
!290 = metadata !{i32 786443, metadata !1, metadata !288, i32 316, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!291 = metadata !{i32 316, i32 0, metadata !290, metadata !130}
!292 = metadata !{i32 318, i32 0, metadata !285, metadata !130}
!293 = metadata !{i32 319, i32 0, metadata !285, metadata !130}
!294 = metadata !{i32 320, i32 0, metadata !285, metadata !130}
!295 = metadata !{i32 321, i32 0, metadata !285, metadata !130}
!296 = metadata !{i32 326, i32 0, metadata !297, metadata !130}
!297 = metadata !{i32 786443, metadata !1, metadata !298, i32 326, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!298 = metadata !{i32 786443, metadata !1, metadata !247, i32 325, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!299 = metadata !{i32 327, i32 0, metadata !297, metadata !130}
!300 = metadata !{i32 325, i32 0, metadata !298, metadata !130}
!301 = metadata !{i32 332, i32 0, metadata !302, metadata !130}
!302 = metadata !{i32 786443, metadata !1, metadata !303, i32 332, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!303 = metadata !{i32 786443, metadata !1, metadata !220, i32 331, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!304 = metadata !{i32 333, i32 0, metadata !302, metadata !130}
!305 = metadata !{i32 331, i32 0, metadata !303, metadata !130}
!306 = metadata !{i32 338, i32 0, metadata !307, metadata !130}
!307 = metadata !{i32 786443, metadata !1, metadata !308, i32 338, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!308 = metadata !{i32 786443, metadata !1, metadata !151, i32 337, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!309 = metadata !{i32 339, i32 0, metadata !307, metadata !130}
!310 = metadata !{i32 337, i32 0, metadata !308, metadata !130}
!311 = metadata !{i32 379, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !313, i32 378, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!313 = metadata !{i32 786443, metadata !1, metadata !4, i32 378, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!314 = metadata !{i32 378, i32 0, metadata !313, null}
!315 = metadata !{i32 381, i32 0, metadata !4, null}
!316 = metadata !{i32 383, i32 0, metadata !15, null}
!317 = metadata !{i32 387, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !15, i32 387, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!319 = metadata !{i32 389, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !318, i32 387, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!321 = metadata !{i32 391, i32 0, metadata !320, null}
!322 = metadata !{i32 394, i32 0, metadata !320, null}
!323 = metadata !{i32 398, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !325, i32 397, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!325 = metadata !{i32 786443, metadata !1, metadata !15, i32 397, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!326 = metadata !{i32 401, i32 0, metadata !327, null}
!327 = metadata !{i32 786443, metadata !1, metadata !15, i32 401, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!328 = metadata !{i32 402, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !327, i32 401, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!330 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !5, i32 120, metadata !14, i32 0, metadata !331} ; [ DW_TAG_auto_variable ] [i] [line 120]
!331 = metadata !{i32 405, i32 0, metadata !15, null}
!332 = metadata !{i32 123, i32 0, metadata !333, metadata !331}
!333 = metadata !{i32 786443, metadata !1, metadata !32, i32 123, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!334 = metadata !{i32 132, i32 0, metadata !335, metadata !331}
!335 = metadata !{i32 786443, metadata !1, metadata !336, i32 127, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!336 = metadata !{i32 786443, metadata !1, metadata !337, i32 126, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!337 = metadata !{i32 786443, metadata !1, metadata !338, i32 125, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!338 = metadata !{i32 786443, metadata !1, metadata !32, i32 124, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!339 = metadata !{i32 124, i32 0, metadata !338, metadata !331}
!340 = metadata !{i32 125, i32 0, metadata !337, metadata !331}
!341 = metadata !{i32 786688, metadata !32, metadata !"feedback", metadata !5, i32 121, metadata !14, i32 0, metadata !331} ; [ DW_TAG_auto_variable ] [feedback] [line 121]
!342 = metadata !{i32 126, i32 0, metadata !336, metadata !331}
!343 = metadata !{i32 15}
!344 = metadata !{i32 786688, metadata !32, metadata !"j", metadata !5, i32 120, metadata !14, i32 0, metadata !331} ; [ DW_TAG_auto_variable ] [j] [line 120]
!345 = metadata !{i32 127, i32 0, metadata !346, metadata !331}
!346 = metadata !{i32 786443, metadata !1, metadata !335, i32 127, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!347 = metadata !{i32 128, i32 0, metadata !348, metadata !331}
!348 = metadata !{i32 786443, metadata !1, metadata !346, i32 128, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!349 = metadata !{i32 129, i32 0, metadata !348, metadata !331}
!350 = metadata !{i32 131, i32 0, metadata !348, metadata !331}
!351 = metadata !{i32 133, i32 0, metadata !335, metadata !331}
!352 = metadata !{i32 135, i32 0, metadata !353, metadata !331}
!353 = metadata !{i32 786443, metadata !1, metadata !354, i32 135, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!354 = metadata !{i32 786443, metadata !1, metadata !336, i32 135, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!355 = metadata !{i32 136, i32 0, metadata !353, metadata !331}
!356 = metadata !{i32 137, i32 0, metadata !354, metadata !331}
!357 = metadata !{i32 408, i32 0, metadata !358, null}
!358 = metadata !{i32 786443, metadata !1, metadata !359, i32 407, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!359 = metadata !{i32 786443, metadata !1, metadata !15, i32 407, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!360 = metadata !{i32 407, i32 0, metadata !359, null}
!361 = metadata !{i32 411, i32 0, metadata !362, null}
!362 = metadata !{i32 786443, metadata !1, metadata !363, i32 410, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!363 = metadata !{i32 786443, metadata !1, metadata !15, i32 410, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!364 = metadata !{i32 410, i32 0, metadata !363, null}
!365 = metadata !{i32 414, i32 0, metadata !15, null}
!366 = metadata !{i32 417, i32 0, metadata !20, null}
!367 = metadata !{i32 430, i32 0, metadata !368, null}
!368 = metadata !{i32 786443, metadata !1, metadata !20, i32 430, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!369 = metadata !{i32 432, i32 0, metadata !370, null}
!370 = metadata !{i32 786443, metadata !1, metadata !371, i32 432, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!371 = metadata !{i32 786443, metadata !1, metadata !368, i32 430, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!372 = metadata !{i32 433, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !370, i32 432, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!374 = metadata !{i32 435, i32 0, metadata !371, null}
!375 = metadata !{i32 437, i32 0, metadata !371, null}
!376 = metadata !{i32 439, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !371, i32 439, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!378 = metadata !{i32 440, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !377, i32 439, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!380 = metadata !{i32 443, i32 0, metadata !371, null}
!381 = metadata !{i32 445, i32 0, metadata !20, null}
!382 = metadata !{i32 446, i32 0, metadata !20, null}
!383 = metadata !{i32 98, i32 0, metadata !75, null}
!384 = metadata !{i32 99, i32 0, metadata !75, null}
!385 = metadata !{i32 2}
!386 = metadata !{i32 100, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !75, i32 100, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!388 = metadata !{i32 101, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !387, i32 101, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!390 = metadata !{i32 102, i32 0, metadata !391, null}
!391 = metadata !{i32 786443, metadata !1, metadata !389, i32 102, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!392 = metadata !{i32 103, i32 0, metadata !393, null}
!393 = metadata !{i32 786443, metadata !1, metadata !391, i32 103, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!394 = metadata !{i32 105, i32 0, metadata !389, null}
!395 = metadata !{i32 108, i32 0, metadata !396, null}
!396 = metadata !{i32 786443, metadata !1, metadata !75, i32 108, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!397 = metadata !{i32 109, i32 0, metadata !75, null}
!398 = metadata !{i32 70, i32 0, metadata !79, null}
!399 = metadata !{i32 71, i32 0, metadata !79, null}
!400 = metadata !{i32 72, i32 0, metadata !401, null}
!401 = metadata !{i32 786443, metadata !1, metadata !79, i32 72, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!402 = metadata !{i32 73, i32 0, metadata !403, null}
!403 = metadata !{i32 786443, metadata !1, metadata !401, i32 73, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!404 = metadata !{i32 74, i32 0, metadata !403, null}
!405 = metadata !{i32 75, i32 0, metadata !406, null}
!406 = metadata !{i32 786443, metadata !1, metadata !403, i32 75, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!407 = metadata !{i32 76, i32 0, metadata !406, null}
!408 = metadata !{i32 77, i32 0, metadata !403, null}
!409 = metadata !{i32 256}
!410 = metadata !{i32 79, i32 0, metadata !79, null}
!411 = metadata !{i32 128}
!412 = metadata !{i32 80, i32 0, metadata !79, null}
!413 = metadata !{i32 9}
!414 = metadata !{i32 81, i32 0, metadata !415, null}
!415 = metadata !{i32 786443, metadata !1, metadata !79, i32 81, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!416 = metadata !{i32 82, i32 0, metadata !417, null}
!417 = metadata !{i32 786443, metadata !1, metadata !418, i32 82, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!418 = metadata !{i32 786443, metadata !1, metadata !415, i32 82, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!419 = metadata !{i32 83, i32 0, metadata !417, null}
!420 = metadata !{i32 84, i32 0, metadata !417, null}
!421 = metadata !{i32 85, i32 0, metadata !418, null}
!422 = metadata !{i32 87, i32 0, metadata !79, null}
!423 = metadata !{i32 88, i32 0, metadata !79, null}
