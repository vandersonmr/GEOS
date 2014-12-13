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

; Function Attrs: nounwind uwtable
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
  call void @llvm.dbg.value(metadata !{i8* %data_out}, i64 0, metadata !11), !dbg !103
  call void @llvm.dbg.value(metadata !{i8* %data_in}, i64 0, metadata !12), !dbg !103
  %.b = load i1* @inited, align 1
  br i1 %.b, label %.preheader10, label %1, !dbg !104

; <label>:1                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !106, i64 0, metadata !107), !dbg !110
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !112), !dbg !113
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 0), align 16, !dbg !115, !tbaa !117
  store i32 0, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 1), align 4, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 1), align 4, !dbg !115, !tbaa !117
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 2), align 8, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 2), align 8, !dbg !115, !tbaa !117
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 4), align 16, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 3), align 4, !dbg !115, !tbaa !117
  store i32 3, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 8), align 16, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 16, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 4), align 16, !dbg !115, !tbaa !117
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 16), align 16, !dbg !121, !tbaa !117
  store i32 29, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !124, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 32, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 5), align 4, !dbg !115, !tbaa !117
  store i32 5, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 32), align 16, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 64, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 6), align 8, !dbg !115, !tbaa !117
  store i32 6, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 64), align 16, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 128, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 7), align 4, !dbg !115, !tbaa !117
  store i32 7, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 128), align 16, !dbg !121, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !107), !dbg !123
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 29), align 4, !dbg !126, !tbaa !117
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !107), !dbg !128
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !112), !dbg !130
  br label %2, !dbg !130

; <label>:2                                       ; preds = %14, %1
  %3 = phi i32 [ 29, %1 ], [ %15, %14 ]
  %indvars.iv.i = phi i64 [ 9, %1 ], [ %indvars.iv.next.i, %14 ]
  %4 = icmp slt i32 %3, 128, !dbg !132
  br i1 %4, label %11, label %5, !dbg !132

; <label>:5                                       ; preds = %2
  %6 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !135, !tbaa !117
  %7 = shl i32 %3, 1, !dbg !135
  %8 = xor i32 %7, 256, !dbg !135
  %9 = xor i32 %8, %6, !dbg !135
  %10 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv.i, !dbg !135
  store i32 %9, i32* %10, align 4, !dbg !135, !tbaa !117
  br label %14, !dbg !135

; <label>:11                                      ; preds = %2
  %12 = shl i32 %3, 1, !dbg !136
  %13 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv.i, !dbg !136
  store i32 %12, i32* %13, align 4, !dbg !136, !tbaa !117
  br label %14

; <label>:14                                      ; preds = %11, %5
  %15 = phi i32 [ %12, %11 ], [ %9, %5 ]
  %16 = sext i32 %15 to i64, !dbg !137
  %17 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %16, !dbg !137
  %18 = trunc i64 %indvars.iv.i to i32, !dbg !137
  store i32 %18, i32* %17, align 4, !dbg !137, !tbaa !117
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !130
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 255, !dbg !130
  br i1 %exitcond.i, label %generate_gf.exit, label %2, !dbg !130

generate_gf.exit:                                 ; preds = %14
  store i32 -1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 0), align 16, !dbg !138, !tbaa !117
  call fastcc void @gen_poly(), !dbg !139
  store i1 true, i1* @inited, align 1
  br label %.preheader10, !dbg !140

.preheader10:                                     ; preds = %generate_gf.exit, %0
  %19 = getelementptr inbounds i8* %data_in, i64 188, !dbg !141
  %20 = load i8* %19, align 1, !dbg !141, !tbaa !144
  %21 = zext i8 %20 to i32, !dbg !141
  store i32 %21, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 0), align 16, !dbg !141, !tbaa !117
  %22 = getelementptr inbounds i8* %data_in, i64 189, !dbg !141
  %23 = load i8* %22, align 1, !dbg !141, !tbaa !144
  %24 = zext i8 %23 to i32, !dbg !141
  store i32 %24, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 1), align 4, !dbg !141, !tbaa !117
  %25 = getelementptr inbounds i8* %data_in, i64 190, !dbg !141
  %26 = load i8* %25, align 1, !dbg !141, !tbaa !144
  %27 = zext i8 %26 to i32, !dbg !141
  store i32 %27, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 2), align 8, !dbg !141, !tbaa !117
  %28 = getelementptr inbounds i8* %data_in, i64 191, !dbg !141
  %29 = load i8* %28, align 1, !dbg !141, !tbaa !144
  %30 = zext i8 %29 to i32, !dbg !141
  store i32 %30, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 3), align 4, !dbg !141, !tbaa !117
  %31 = getelementptr inbounds i8* %data_in, i64 192, !dbg !141
  %32 = load i8* %31, align 1, !dbg !141, !tbaa !144
  %33 = zext i8 %32 to i32, !dbg !141
  store i32 %33, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 4), align 16, !dbg !141, !tbaa !117
  %34 = getelementptr inbounds i8* %data_in, i64 193, !dbg !141
  %35 = load i8* %34, align 1, !dbg !141, !tbaa !144
  %36 = zext i8 %35 to i32, !dbg !141
  store i32 %36, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 5), align 4, !dbg !141, !tbaa !117
  %37 = getelementptr inbounds i8* %data_in, i64 194, !dbg !141
  %38 = load i8* %37, align 1, !dbg !141, !tbaa !144
  %39 = zext i8 %38 to i32, !dbg !141
  store i32 %39, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 6), align 8, !dbg !141, !tbaa !117
  %40 = getelementptr inbounds i8* %data_in, i64 195, !dbg !141
  %41 = load i8* %40, align 1, !dbg !141, !tbaa !144
  %42 = zext i8 %41 to i32, !dbg !141
  store i32 %42, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 7), align 4, !dbg !141, !tbaa !117
  %43 = getelementptr inbounds i8* %data_in, i64 196, !dbg !141
  %44 = load i8* %43, align 1, !dbg !141, !tbaa !144
  %45 = zext i8 %44 to i32, !dbg !141
  store i32 %45, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 8), align 16, !dbg !141, !tbaa !117
  %46 = getelementptr inbounds i8* %data_in, i64 197, !dbg !141
  %47 = load i8* %46, align 1, !dbg !141, !tbaa !144
  %48 = zext i8 %47 to i32, !dbg !141
  store i32 %48, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 9), align 4, !dbg !141, !tbaa !117
  %49 = getelementptr inbounds i8* %data_in, i64 198, !dbg !141
  %50 = load i8* %49, align 1, !dbg !141, !tbaa !144
  %51 = zext i8 %50 to i32, !dbg !141
  store i32 %51, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 10), align 8, !dbg !141, !tbaa !117
  %52 = getelementptr inbounds i8* %data_in, i64 199, !dbg !141
  %53 = load i8* %52, align 1, !dbg !141, !tbaa !144
  %54 = zext i8 %53 to i32, !dbg !141
  store i32 %54, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 11), align 4, !dbg !141, !tbaa !117
  %55 = getelementptr inbounds i8* %data_in, i64 200, !dbg !141
  %56 = load i8* %55, align 1, !dbg !141, !tbaa !144
  %57 = zext i8 %56 to i32, !dbg !141
  store i32 %57, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 12), align 16, !dbg !141, !tbaa !117
  %58 = getelementptr inbounds i8* %data_in, i64 201, !dbg !141
  %59 = load i8* %58, align 1, !dbg !141, !tbaa !144
  %60 = zext i8 %59 to i32, !dbg !141
  store i32 %60, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 13), align 4, !dbg !141, !tbaa !117
  %61 = getelementptr inbounds i8* %data_in, i64 202, !dbg !141
  %62 = load i8* %61, align 1, !dbg !141, !tbaa !144
  %63 = zext i8 %62 to i32, !dbg !141
  store i32 %63, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 14), align 8, !dbg !141, !tbaa !117
  %64 = getelementptr inbounds i8* %data_in, i64 203, !dbg !141
  %65 = load i8* %64, align 1, !dbg !141, !tbaa !144
  %66 = zext i8 %65 to i32, !dbg !141
  store i32 %66, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 15), align 4, !dbg !141, !tbaa !117
  call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 16) to i8*), i8 0, i64 204, i32 16, i1 false), !dbg !145
  %scevgep = getelementptr i8* %data_in, i64 187
  %bound1 = icmp ule i8* %data_in, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 254) to i8*)
  %bound0 = icmp uge i8* %scevgep, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 67) to i8*)
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph, label %vector.body

vector.body:                                      ; preds = %.preheader10, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader10 ], !dbg !148
  %67 = getelementptr inbounds i8* %data_in, i64 %index, !dbg !150
  %68 = bitcast i8* %67 to <4 x i8>*, !dbg !150
  %wide.load = load <4 x i8>* %68, align 1, !dbg !150
  %.sum118 = or i64 %index, 4, !dbg !150
  %69 = getelementptr i8* %data_in, i64 %.sum118, !dbg !150
  %70 = bitcast i8* %69 to <4 x i8>*, !dbg !150
  %wide.load74 = load <4 x i8>* %70, align 1, !dbg !150
  %71 = zext <4 x i8> %wide.load to <4 x i32>, !dbg !150
  %72 = zext <4 x i8> %wide.load74 to <4 x i32>, !dbg !150
  %73 = add i64 %index, 67, !dbg !150
  %74 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %73, !dbg !150
  %75 = bitcast i32* %74 to <4 x i32>*, !dbg !150
  store <4 x i32> %71, <4 x i32>* %75, align 4, !dbg !150
  %.sum = add i64 %index, 71, !dbg !150
  %76 = getelementptr [255 x i32]* @recd, i64 0, i64 %.sum, !dbg !150
  %77 = bitcast i32* %76 to <4 x i32>*, !dbg !150
  store <4 x i32> %72, <4 x i32>* %77, align 4, !dbg !150
  %index.next = add i64 %index, 8, !dbg !148
  %78 = icmp eq i64 %index.next, 184, !dbg !148
  br i1 %78, label %scalar.ph, label %vector.body, !dbg !148, !llvm.loop !152

scalar.ph:                                        ; preds = %vector.body, %.preheader10, %scalar.ph
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %scalar.ph ], [ 0, %.preheader10 ], [ 184, %vector.body ]
  %79 = getelementptr inbounds i8* %data_in, i64 %indvars.iv52, !dbg !150
  %80 = load i8* %79, align 1, !dbg !150, !tbaa !144
  %81 = zext i8 %80 to i32, !dbg !150
  %82 = add nsw i64 %indvars.iv52, 67, !dbg !150
  %83 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %82, !dbg !150
  store i32 %81, i32* %83, align 4, !dbg !150, !tbaa !117
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1, !dbg !148
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 188, !dbg !148
  br i1 %exitcond54, label %vector.body76, label %scalar.ph, !dbg !148, !llvm.loop !155

vector.body76:                                    ; preds = %scalar.ph, %vector.body76
  %index79 = phi i64 [ %index.next83, %vector.body76 ], [ 0, %scalar.ph ], !dbg !156
  %induction85119 = or i64 %index79, 1
  %84 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %index79, !dbg !158
  %85 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %induction85119, !dbg !158
  %86 = load i32* %84, align 8, !dbg !158, !tbaa !117
  %87 = load i32* %85, align 4, !dbg !158, !tbaa !117
  %88 = sext i32 %86 to i64, !dbg !158
  %89 = sext i32 %87 to i64, !dbg !158
  %90 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %88, !dbg !158
  %91 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %89, !dbg !158
  %92 = load i32* %90, align 4, !dbg !158, !tbaa !117
  %93 = load i32* %91, align 4, !dbg !158, !tbaa !117
  store i32 %92, i32* %84, align 8, !dbg !158, !tbaa !117
  store i32 %93, i32* %85, align 4, !dbg !158, !tbaa !117
  %index.next83 = add i64 %index79, 2, !dbg !156
  %94 = icmp eq i64 %index.next83, 254, !dbg !156
  br i1 %94, label %.preheader, label %vector.body76, !dbg !156, !llvm.loop !159

.preheader:                                       ; preds = %vector.body76, %.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %.preheader ], [ 254, %vector.body76 ]
  %95 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv49, !dbg !158
  %96 = load i32* %95, align 4, !dbg !158, !tbaa !117
  %97 = sext i32 %96 to i64, !dbg !158
  %98 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %97, !dbg !158
  %99 = load i32* %98, align 4, !dbg !158, !tbaa !117
  store i32 %99, i32* %95, align 4, !dbg !158, !tbaa !117
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !156
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 255, !dbg !156
  br i1 %exitcond51, label %100, label %.preheader, !dbg !156, !llvm.loop !160

; <label>:100                                     ; preds = %.preheader
  %101 = bitcast [8 x i32]* %root.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 32, i8* %101) #2, !dbg !161
  %102 = bitcast [8 x i32]* %loc.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 32, i8* %102) #2, !dbg !161
  %103 = bitcast [18 x [16 x i32]]* %elp.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 1152, i8* %103) #2, !dbg !161
  call void @llvm.dbg.declare(metadata !{[18 x [16 x i32]]* %elp.i}, metadata !45) #2, !dbg !161
  %104 = bitcast [18 x i32]* %d.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 72, i8* %104) #2, !dbg !161
  call void @llvm.dbg.declare(metadata !{[18 x i32]* %d.i}, metadata !50) #2, !dbg !161
  %105 = bitcast [18 x i32]* %l.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 72, i8* %105) #2, !dbg !161
  call void @llvm.dbg.declare(metadata !{[18 x i32]* %l.i}, metadata !53) #2, !dbg !161
  %106 = bitcast [18 x i32]* %u_lu.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 72, i8* %106) #2, !dbg !161
  call void @llvm.dbg.declare(metadata !{[18 x i32]* %u_lu.i}, metadata !54) #2, !dbg !161
  %107 = bitcast [17 x i32]* %s.i to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 68, i8* %107) #2, !dbg !161
  call void @llvm.dbg.declare(metadata !{[17 x i32]* %s.i}, metadata !55) #2, !dbg !161
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !163) #2, !dbg !164
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !165) #2, !dbg !164
  call void @llvm.dbg.declare(metadata !{[8 x i32]* %root.i}, metadata !61) #2, !dbg !164
  call void @llvm.dbg.declare(metadata !{[8 x i32]* %loc.i}, metadata !65) #2, !dbg !164
  %108 = bitcast [9 x i32]* %z.i to i8*, !dbg !164
  call void @llvm.lifetime.start(i64 36, i8* %108) #2, !dbg !164
  call void @llvm.dbg.declare(metadata !{[9 x i32]* %z.i}, metadata !66) #2, !dbg !164
  %109 = bitcast [9 x i32]* %reg.i to i8*, !dbg !164
  call void @llvm.lifetime.start(i64 36, i8* %109) #2, !dbg !164
  call void @llvm.dbg.declare(metadata !{[9 x i32]* %reg.i}, metadata !74) #2, !dbg !164
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !166) #2, !dbg !167
  br label %110, !dbg !167

; <label>:110                                     ; preds = %128, %100
  %indvars.iv147.i = phi i64 [ 1, %100 ], [ %indvars.iv.next148.i, %128 ]
  %syn_error.076.i = phi i32 [ 0, %100 ], [ %syn_error.0..i, %128 ]
  %111 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv147.i, !dbg !169
  store i32 0, i32* %111, align 4, !dbg !169, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !171) #2, !dbg !172
  br label %112, !dbg !172

; <label>:112                                     ; preds = %126, %110
  %113 = phi i32 [ 0, %110 ], [ %127, %126 ]
  %indvars.iv144.i = phi i64 [ 0, %110 ], [ %indvars.iv.next145.i, %126 ]
  %114 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv144.i, !dbg !174
  %115 = load i32* %114, align 4, !dbg !174, !tbaa !117
  %116 = icmp eq i32 %115, -1, !dbg !174
  br i1 %116, label %126, label %117, !dbg !174

; <label>:117                                     ; preds = %112
  %118 = mul nsw i64 %indvars.iv144.i, %indvars.iv147.i, !dbg !176
  %119 = trunc i64 %118 to i32, !dbg !176
  %120 = add nsw i32 %119, %115, !dbg !176
  %121 = srem i32 %120, 255, !dbg !176
  %122 = sext i32 %121 to i64, !dbg !176
  %123 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %122, !dbg !176
  %124 = load i32* %123, align 4, !dbg !176, !tbaa !117
  %125 = xor i32 %124, %113, !dbg !176
  store i32 %125, i32* %111, align 4, !dbg !176, !tbaa !117
  br label %126, !dbg !176

; <label>:126                                     ; preds = %117, %112
  %127 = phi i32 [ %113, %112 ], [ %125, %117 ]
  %indvars.iv.next145.i = add nuw nsw i64 %indvars.iv144.i, 1, !dbg !172
  %exitcond146.i = icmp eq i64 %indvars.iv.next145.i, 255, !dbg !172
  br i1 %exitcond146.i, label %128, label %112, !dbg !172

; <label>:128                                     ; preds = %126
  %129 = icmp eq i32 %127, 0, !dbg !177
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !165) #2, !dbg !177
  %syn_error.0..i = select i1 %129, i32 %syn_error.076.i, i32 1, !dbg !177
  %130 = sext i32 %127 to i64, !dbg !179
  %131 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %130, !dbg !179
  %132 = load i32* %131, align 4, !dbg !179, !tbaa !117
  store i32 %132, i32* %111, align 4, !dbg !179, !tbaa !117
  %indvars.iv.next148.i = add nuw nsw i64 %indvars.iv147.i, 1, !dbg !167
  %exitcond149.i = icmp eq i64 %indvars.iv.next148.i, 17, !dbg !167
  br i1 %exitcond149.i, label %133, label %110, !dbg !167

; <label>:133                                     ; preds = %128
  %134 = icmp eq i32 %syn_error.0..i, 0, !dbg !180
  br i1 %134, label %.preheader.i, label %135, !dbg !180

; <label>:135                                     ; preds = %133
  %136 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 0, !dbg !182
  store i32 0, i32* %136, align 16, !dbg !182, !tbaa !117
  %137 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 1, !dbg !184
  %138 = load i32* %137, align 4, !dbg !184, !tbaa !117
  %139 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 1, !dbg !184
  store i32 %138, i32* %139, align 4, !dbg !184, !tbaa !117
  %140 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 0, !dbg !185
  store i32 0, i32* %140, align 16, !dbg !185, !tbaa !117
  %141 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 0, !dbg !186
  store i32 1, i32* %141, align 16, !dbg !186, !tbaa !117
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !166) #2, !dbg !187
  %142 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 1, !dbg !189
  store i32 -1, i32* %142, align 4, !dbg !189, !tbaa !117
  %143 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 1, !dbg !191
  store i32 0, i32* %143, align 4, !dbg !191, !tbaa !117
  %144 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 2, !dbg !189
  store i32 -1, i32* %144, align 8, !dbg !189, !tbaa !117
  %145 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 2, !dbg !191
  store i32 0, i32* %145, align 8, !dbg !191, !tbaa !117
  %146 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 3, !dbg !189
  store i32 -1, i32* %146, align 4, !dbg !189, !tbaa !117
  %147 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 3, !dbg !191
  store i32 0, i32* %147, align 4, !dbg !191, !tbaa !117
  %148 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 4, !dbg !189
  store i32 -1, i32* %148, align 16, !dbg !189, !tbaa !117
  %149 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 4, !dbg !191
  store i32 0, i32* %149, align 16, !dbg !191, !tbaa !117
  %150 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 5, !dbg !189
  store i32 -1, i32* %150, align 4, !dbg !189, !tbaa !117
  %151 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 5, !dbg !191
  store i32 0, i32* %151, align 4, !dbg !191, !tbaa !117
  %152 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 6, !dbg !189
  store i32 -1, i32* %152, align 8, !dbg !189, !tbaa !117
  %153 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 6, !dbg !191
  store i32 0, i32* %153, align 8, !dbg !191, !tbaa !117
  %154 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 7, !dbg !189
  store i32 -1, i32* %154, align 4, !dbg !189, !tbaa !117
  %155 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 7, !dbg !191
  store i32 0, i32* %155, align 4, !dbg !191, !tbaa !117
  %156 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 8, !dbg !189
  store i32 -1, i32* %156, align 16, !dbg !189, !tbaa !117
  %157 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 8, !dbg !191
  store i32 0, i32* %157, align 16, !dbg !191, !tbaa !117
  %158 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 9, !dbg !189
  store i32 -1, i32* %158, align 4, !dbg !189, !tbaa !117
  %159 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 9, !dbg !191
  store i32 0, i32* %159, align 4, !dbg !191, !tbaa !117
  %160 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 10, !dbg !189
  store i32 -1, i32* %160, align 8, !dbg !189, !tbaa !117
  %161 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 10, !dbg !191
  store i32 0, i32* %161, align 8, !dbg !191, !tbaa !117
  %162 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 11, !dbg !189
  store i32 -1, i32* %162, align 4, !dbg !189, !tbaa !117
  %163 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 11, !dbg !191
  store i32 0, i32* %163, align 4, !dbg !191, !tbaa !117
  %164 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 12, !dbg !189
  store i32 -1, i32* %164, align 16, !dbg !189, !tbaa !117
  %165 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 12, !dbg !191
  store i32 0, i32* %165, align 16, !dbg !191, !tbaa !117
  %166 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 13, !dbg !189
  store i32 -1, i32* %166, align 4, !dbg !189, !tbaa !117
  %167 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 13, !dbg !191
  store i32 0, i32* %167, align 4, !dbg !191, !tbaa !117
  %168 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 14, !dbg !189
  store i32 -1, i32* %168, align 8, !dbg !189, !tbaa !117
  %169 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 14, !dbg !191
  store i32 0, i32* %169, align 8, !dbg !191, !tbaa !117
  %170 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 15, !dbg !189
  store i32 -1, i32* %170, align 4, !dbg !189, !tbaa !117
  %171 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 15, !dbg !191
  store i32 0, i32* %171, align 4, !dbg !191, !tbaa !117
  %172 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 0, !dbg !192
  store i32 0, i32* %172, align 16, !dbg !192, !tbaa !117
  %173 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 1, !dbg !193
  store i32 0, i32* %173, align 4, !dbg !193, !tbaa !117
  %174 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 0, !dbg !194
  store i32 -1, i32* %174, align 16, !dbg !194, !tbaa !117
  %175 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 1, !dbg !195
  store i32 0, i32* %175, align 4, !dbg !195, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !196) #2, !dbg !197
  br label %._crit_edge152.i, !dbg !198

._crit_edge152.i:                                 ; preds = %.preheader20._crit_edge.i.thread, %.preheader20._crit_edge.i, %135
  %176 = phi i32 [ 0, %135 ], [ %254, %.preheader20._crit_edge.i ], [ %254, %.preheader20._crit_edge.i.thread ]
  %177 = phi i32 [ %138, %135 ], [ %299, %.preheader20._crit_edge.i ], [ %274, %.preheader20._crit_edge.i.thread ]
  %indvars.iv135.i = phi i64 [ 0, %135 ], [ %indvars.iv.next136.i, %.preheader20._crit_edge.i ], [ %indvars.iv.next136.i, %.preheader20._crit_edge.i.thread ]
  %178 = add i64 %indvars.iv135.i, 2, !dbg !199
  %sext.i = shl i64 %178, 32
  %179 = ashr exact i64 %sext.i, 32
  %scevgep123.i = getelementptr [18 x [16 x i32]]* %elp.i, i64 0, i64 %179, i64 0
  %scevgep123124.i = bitcast i32* %scevgep123.i to i8*
  %indvars.iv.next136.i = add nuw nsw i64 %indvars.iv135.i, 1
  %180 = icmp eq i32 %177, -1, !dbg !201
  br i1 %180, label %181, label %.preheader28.i, !dbg !201

; <label>:181                                     ; preds = %._crit_edge152.i
  %182 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %178, !dbg !203
  store i32 %176, i32* %182, align 4, !dbg !203, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !166) #2, !dbg !205
  %183 = icmp slt i32 %176, 0, !dbg !205
  br i1 %183, label %.loopexit21.i, label %.lr.ph69.i.preheader, !dbg !205

.lr.ph69.i.preheader:                             ; preds = %181
  %184 = add i32 %176, 1, !dbg !207
  br label %.lr.ph69.i, !dbg !207

.lr.ph69.i:                                       ; preds = %.lr.ph69.i, %.lr.ph69.i.preheader
  %indvars.iv129.i = phi i64 [ %indvars.iv.next130.i, %.lr.ph69.i ], [ 0, %.lr.ph69.i.preheader ]
  %185 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %indvars.iv.next136.i, i64 %indvars.iv129.i, !dbg !207
  %186 = load i32* %185, align 4, !dbg !207, !tbaa !117
  %187 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %indvars.iv129.i, !dbg !207
  store i32 %186, i32* %187, align 4, !dbg !207, !tbaa !117
  %188 = sext i32 %186 to i64, !dbg !209
  %189 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %188, !dbg !209
  %190 = load i32* %189, align 4, !dbg !209, !tbaa !117
  store i32 %190, i32* %185, align 4, !dbg !209, !tbaa !117
  %indvars.iv.next130.i = add nuw nsw i64 %indvars.iv129.i, 1, !dbg !205
  %lftr.wideiv43 = trunc i64 %indvars.iv.next130.i to i32, !dbg !205
  %exitcond44 = icmp eq i32 %lftr.wideiv43, %184, !dbg !205
  br i1 %exitcond44, label %.loopexit21.i, label %.lr.ph69.i, !dbg !205

.preheader28.i:                                   ; preds = %._crit_edge152.i, %.preheader28.i
  %indvars.iv116.i = phi i64 [ %indvars.iv.next117.i, %.preheader28.i ], [ %indvars.iv135.i, %._crit_edge152.i ]
  %191 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %indvars.iv116.i, !dbg !210
  %192 = load i32* %191, align 4, !dbg !210, !tbaa !117
  %193 = icmp eq i32 %192, -1, !dbg !210
  %194 = trunc i64 %indvars.iv116.i to i32, !dbg !210
  %195 = icmp sgt i32 %194, 0, !dbg !210
  %..i = and i1 %193, %195, !dbg !210
  %indvars.iv.next117.i = add nsw i64 %indvars.iv116.i, -1
  br i1 %..i, label %.preheader28.i, label %196

; <label>:196                                     ; preds = %.preheader28.i
  br i1 %195, label %.preheader26.i, label %.loopexit27.i, !dbg !212

.preheader26.i:                                   ; preds = %196
  %sext180.i = shl i64 %indvars.iv116.i, 32
  %197 = ashr exact i64 %sext180.i, 32
  br label %198, !dbg !214

; <label>:198                                     ; preds = %210, %.preheader26.i
  %indvars.iv118.i = phi i64 [ %197, %.preheader26.i ], [ %indvars.iv.next119.i, %210 ]
  %q.1.i = phi i32 [ %194, %.preheader26.i ], [ %q.2.i, %210 ]
  %indvars.iv.next119.i = add nsw i64 %indvars.iv118.i, -1, !dbg !217
  %199 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %indvars.iv.next119.i, !dbg !218
  %200 = load i32* %199, align 4, !dbg !218, !tbaa !117
  %201 = icmp eq i32 %200, -1, !dbg !218
  br i1 %201, label %._crit_edge163.i, label %202, !dbg !218

._crit_edge163.i:                                 ; preds = %198
  %.pre174.i = trunc i64 %indvars.iv.next119.i to i32, !dbg !217
  br label %210, !dbg !218

; <label>:202                                     ; preds = %198
  %203 = sext i32 %q.1.i to i64, !dbg !218
  %204 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %203, !dbg !218
  %205 = load i32* %204, align 4, !dbg !218, !tbaa !117
  %206 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %indvars.iv.next119.i, !dbg !218
  %207 = load i32* %206, align 4, !dbg !218, !tbaa !117
  %208 = icmp slt i32 %205, %207, !dbg !218
  %209 = trunc i64 %indvars.iv.next119.i to i32, !dbg !218
  %.q.1.i = select i1 %208, i32 %209, i32 %q.1.i, !dbg !218
  br label %210, !dbg !218

; <label>:210                                     ; preds = %202, %._crit_edge163.i
  %.pre-phi175.i = phi i32 [ %.pre174.i, %._crit_edge163.i ], [ %209, %202 ], !dbg !217
  %q.2.i = phi i32 [ %q.1.i, %._crit_edge163.i ], [ %.q.1.i, %202 ]
  %211 = icmp sgt i32 %.pre-phi175.i, 0, !dbg !217
  br i1 %211, label %198, label %.loopexit27.i, !dbg !217

.loopexit27.i:                                    ; preds = %210, %196
  %q.3.i = phi i32 [ %194, %196 ], [ %q.2.i, %210 ]
  %212 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %indvars.iv.next136.i, !dbg !220
  %213 = sext i32 %q.3.i to i64, !dbg !220
  %214 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %213, !dbg !220
  %215 = load i32* %214, align 4, !dbg !220, !tbaa !117
  %216 = trunc i64 %indvars.iv.next136.i to i32, !dbg !220
  %217 = sub i32 %216, %q.3.i, !dbg !220
  %218 = add i32 %217, %215, !dbg !220
  %219 = icmp sgt i32 %176, %218, !dbg !220
  %220 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %178, !dbg !220
  %.181.i = select i1 %219, i32 %176, i32 %218, !dbg !220
  store i32 %.181.i, i32* %220, align 4, !dbg !220, !tbaa !117
  call void @llvm.memset.p0i8.i64(i8* %scevgep123124.i, i8 0, i64 64, i32 16, i1 false) #2, !dbg !222
  %221 = load i32* %214, align 4, !dbg !224, !tbaa !117
  %222 = icmp slt i32 %221, 0, !dbg !224
  br i1 %222, label %.preheader22.i, label %.lr.ph64.i, !dbg !224

.lr.ph64.i:                                       ; preds = %.loopexit27.i
  %223 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %213, !dbg !226
  %224 = add i32 %177, 255, !dbg !226
  br label %228, !dbg !224

.preheader22.i:                                   ; preds = %244, %.loopexit27.i
  %225 = load i32* %212, align 4, !dbg !228, !tbaa !117
  %226 = icmp slt i32 %225, 0, !dbg !228
  br i1 %226, label %.loopexit23.i, label %.lr.ph66.i.preheader, !dbg !228

.lr.ph66.i.preheader:                             ; preds = %.preheader22.i
  %227 = add i32 %225, 1, !dbg !230
  br label %.lr.ph66.i, !dbg !230

; <label>:228                                     ; preds = %244, %.lr.ph64.i
  %indvars.iv125.i = phi i64 [ %indvars.iv.next126.i, %244 ], [ 0, %.lr.ph64.i ]
  %229 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %213, i64 %indvars.iv125.i, !dbg !232
  %230 = load i32* %229, align 4, !dbg !232, !tbaa !117
  %231 = icmp eq i32 %230, -1, !dbg !232
  br i1 %231, label %._crit_edge162.i, label %232, !dbg !232

._crit_edge162.i:                                 ; preds = %228
  %.pre176.i = trunc i64 %indvars.iv125.i to i32, !dbg !224
  br label %244, !dbg !232

; <label>:232                                     ; preds = %228
  %233 = load i32* %223, align 4, !dbg !226, !tbaa !117
  %234 = add i32 %224, %230, !dbg !226
  %235 = sub i32 %234, %233, !dbg !226
  %236 = srem i32 %235, 255, !dbg !226
  %237 = sext i32 %236 to i64, !dbg !226
  %238 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %237, !dbg !226
  %239 = load i32* %238, align 4, !dbg !226, !tbaa !117
  %240 = trunc i64 %indvars.iv125.i to i32, !dbg !226
  %241 = add i32 %240, %217, !dbg !226
  %242 = sext i32 %241 to i64, !dbg !226
  %243 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %242, !dbg !226
  store i32 %239, i32* %243, align 4, !dbg !226, !tbaa !117
  br label %244, !dbg !226

; <label>:244                                     ; preds = %232, %._crit_edge162.i
  %.pre-phi177.i = phi i32 [ %.pre176.i, %._crit_edge162.i ], [ %240, %232 ], !dbg !224
  %indvars.iv.next126.i = add nuw nsw i64 %indvars.iv125.i, 1, !dbg !224
  %245 = icmp slt i32 %.pre-phi177.i, %221, !dbg !224
  br i1 %245, label %228, label %.preheader22.i, !dbg !224

.lr.ph66.i:                                       ; preds = %.lr.ph66.i, %.lr.ph66.i.preheader
  %indvars.iv127.i = phi i64 [ %indvars.iv.next128.i, %.lr.ph66.i ], [ 0, %.lr.ph66.i.preheader ]
  %246 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %indvars.iv.next136.i, i64 %indvars.iv127.i, !dbg !230
  %247 = load i32* %246, align 4, !dbg !230, !tbaa !117
  %248 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %indvars.iv127.i, !dbg !230
  %249 = load i32* %248, align 4, !dbg !230, !tbaa !117
  %250 = xor i32 %249, %247, !dbg !230
  store i32 %250, i32* %248, align 4, !dbg !230, !tbaa !117
  %251 = sext i32 %247 to i64, !dbg !233
  %252 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %251, !dbg !233
  %253 = load i32* %252, align 4, !dbg !233, !tbaa !117
  store i32 %253, i32* %246, align 4, !dbg !233, !tbaa !117
  %indvars.iv.next128.i = add nuw nsw i64 %indvars.iv127.i, 1, !dbg !228
  %lftr.wideiv41 = trunc i64 %indvars.iv.next128.i to i32, !dbg !228
  %exitcond42 = icmp eq i32 %lftr.wideiv41, %227, !dbg !228
  br i1 %exitcond42, label %.loopexit23.i, label %.lr.ph66.i, !dbg !228

.loopexit21.i:                                    ; preds = %.lr.ph69.i, %181
  %.pre.i = trunc i64 %indvars.iv.next136.i to i32, !dbg !234
  br label %.loopexit23.i

.loopexit23.i:                                    ; preds = %.lr.ph66.i, %.loopexit21.i, %.preheader22.i
  %.pre-phi.i = phi i32 [ %.pre.i, %.loopexit21.i ], [ %216, %.preheader22.i ], [ %216, %.lr.ph66.i ], !dbg !234
  %254 = phi i32 [ %176, %.loopexit21.i ], [ %.181.i, %.preheader22.i ], [ %.181.i, %.lr.ph66.i ]
  %255 = sub nsw i32 %.pre-phi.i, %254, !dbg !234
  %256 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %178, !dbg !234
  store i32 %255, i32* %256, align 4, !dbg !234, !tbaa !117
  %257 = icmp slt i32 %.pre-phi.i, 16, !dbg !235
  br i1 %257, label %258, label %.critedge.i, !dbg !235

; <label>:258                                     ; preds = %.loopexit23.i
  %259 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %178, !dbg !237
  %260 = load i32* %259, align 4, !dbg !237, !tbaa !117
  %261 = icmp eq i32 %260, -1, !dbg !237
  br i1 %261, label %267, label %262, !dbg !237

; <label>:262                                     ; preds = %258
  %263 = sext i32 %260 to i64, !dbg !240
  %264 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %263, !dbg !240
  %265 = load i32* %264, align 4, !dbg !240, !tbaa !117
  %266 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %178, !dbg !240
  store i32 %265, i32* %266, align 4, !dbg !240, !tbaa !117
  br label %.preheader20.i, !dbg !240

; <label>:267                                     ; preds = %258
  %268 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %178, !dbg !241
  store i32 0, i32* %268, align 4, !dbg !241, !tbaa !117
  br label %.preheader20.i

.preheader20.i:                                   ; preds = %267, %262
  %269 = phi i32 [ 0, %267 ], [ %265, %262 ]
  %270 = icmp slt i32 %254, 1, !dbg !242
  %.pre166.i = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %178, !dbg !244
  br i1 %270, label %.preheader20._crit_edge.i.thread, label %.lr.ph71.i.preheader, !dbg !242

.lr.ph71.i.preheader:                             ; preds = %.preheader20.i
  %271 = add i32 %254, 1, !dbg !245
  br label %.lr.ph71.i, !dbg !245

.preheader20._crit_edge.i.thread:                 ; preds = %.preheader20.i
  %272 = sext i32 %269 to i64, !dbg !244
  %273 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %272, !dbg !244
  %274 = load i32* %273, align 4, !dbg !244, !tbaa !117
  store i32 %274, i32* %.pre166.i, align 4, !dbg !244, !tbaa !117
  br label %._crit_edge152.i

.lr.ph71.i:                                       ; preds = %295, %.lr.ph71.i.preheader
  %275 = phi i32 [ %296, %295 ], [ %269, %.lr.ph71.i.preheader ]
  %indvars.iv133.i = phi i64 [ %indvars.iv.next134.i, %295 ], [ 1, %.lr.ph71.i.preheader ]
  %276 = sub i64 %178, %indvars.iv133.i, !dbg !245
  %sext179.i = shl i64 %276, 32, !dbg !245
  %277 = ashr exact i64 %sext179.i, 32, !dbg !245
  %278 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %277, !dbg !245
  %279 = load i32* %278, align 4, !dbg !245, !tbaa !117
  %280 = icmp eq i32 %279, -1, !dbg !245
  br i1 %280, label %295, label %281, !dbg !245

; <label>:281                                     ; preds = %.lr.ph71.i
  %282 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %indvars.iv133.i, !dbg !245
  %283 = load i32* %282, align 4, !dbg !245, !tbaa !117
  %284 = icmp eq i32 %283, 0, !dbg !245
  br i1 %284, label %295, label %285, !dbg !245

; <label>:285                                     ; preds = %281
  %286 = sext i32 %283 to i64, !dbg !247
  %287 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %286, !dbg !247
  %288 = load i32* %287, align 4, !dbg !247, !tbaa !117
  %289 = add nsw i32 %288, %279, !dbg !247
  %290 = srem i32 %289, 255, !dbg !247
  %291 = sext i32 %290 to i64, !dbg !247
  %292 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %291, !dbg !247
  %293 = load i32* %292, align 4, !dbg !247, !tbaa !117
  %294 = xor i32 %293, %275, !dbg !247
  store i32 %294, i32* %.pre166.i, align 4, !dbg !247, !tbaa !117
  br label %295, !dbg !247

; <label>:295                                     ; preds = %285, %281, %.lr.ph71.i
  %296 = phi i32 [ %275, %281 ], [ %275, %.lr.ph71.i ], [ %294, %285 ]
  %indvars.iv.next134.i = add nuw nsw i64 %indvars.iv133.i, 1, !dbg !242
  %lftr.wideiv46 = trunc i64 %indvars.iv.next134.i to i32, !dbg !242
  %exitcond47 = icmp eq i32 %lftr.wideiv46, %271, !dbg !242
  br i1 %exitcond47, label %.preheader20._crit_edge.i, label %.lr.ph71.i, !dbg !242

.preheader20._crit_edge.i:                        ; preds = %295
  %297 = sext i32 %296 to i64, !dbg !244
  %298 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %297, !dbg !244
  %299 = load i32* %298, align 4, !dbg !244, !tbaa !117
  store i32 %299, i32* %.pre166.i, align 4, !dbg !244, !tbaa !117
  %300 = icmp slt i32 %254, 9, !dbg !248
  br i1 %300, label %._crit_edge152.i, label %.critedge.thread.preheader.i

.critedge.i:                                      ; preds = %.loopexit23.i
  %301 = icmp slt i32 %254, 9, !dbg !249
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !166) #2, !dbg !251
  br i1 %301, label %.preheader19.i, label %.critedge.thread.preheader.i, !dbg !249

.preheader19.i:                                   ; preds = %.critedge.i
  %302 = icmp slt i32 %254, 0, !dbg !251
  br i1 %302, label %.preheader17.i, label %.lr.ph61.i.preheader, !dbg !251

.lr.ph61.i.preheader:                             ; preds = %.preheader19.i
  %303 = add i32 %254, 1, !dbg !251
  %304 = zext i32 %254 to i64
  %305 = add i64 %304, 1, !dbg !251
  %end.idx = add i64 %304, 1, !dbg !251
  %n.vec = and i64 %305, 8589934590, !dbg !251
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !251
  br i1 %cmp.zero, label %middle.block88, label %vector.body87

vector.body87:                                    ; preds = %.lr.ph61.i.preheader, %vector.body87
  %index90 = phi i64 [ %index.next94, %vector.body87 ], [ 0, %.lr.ph61.i.preheader ], !dbg !251
  %induction96123 = or i64 %index90, 1
  %306 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %index90, !dbg !251
  %307 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %induction96123, !dbg !251
  %308 = load i32* %306, align 8, !dbg !251, !tbaa !117
  %309 = load i32* %307, align 4, !dbg !251, !tbaa !117
  %310 = sext i32 %308 to i64, !dbg !251
  %311 = sext i32 %309 to i64, !dbg !251
  %312 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %310, !dbg !251
  %313 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %311, !dbg !251
  %314 = load i32* %312, align 4, !dbg !251, !tbaa !117
  %315 = load i32* %313, align 4, !dbg !251, !tbaa !117
  store i32 %314, i32* %306, align 8, !dbg !251, !tbaa !117
  store i32 %315, i32* %307, align 4, !dbg !251, !tbaa !117
  %index.next94 = add i64 %index90, 2, !dbg !251
  %316 = icmp eq i64 %index.next94, %n.vec, !dbg !251
  br i1 %316, label %middle.block88, label %vector.body87, !dbg !251, !llvm.loop !254

middle.block88:                                   ; preds = %vector.body87, %.lr.ph61.i.preheader
  %resume.val91 = phi i64 [ 0, %.lr.ph61.i.preheader ], [ %n.vec, %vector.body87 ]
  %cmp.n93 = icmp eq i64 %end.idx, %resume.val91
  br i1 %cmp.n93, label %.preheader18.i, label %.lr.ph61.i

.preheader18.i:                                   ; preds = %middle.block88, %.lr.ph61.i
  %317 = icmp slt i32 %254, 1, !dbg !255
  br i1 %317, label %.preheader17.i, label %.lr.ph59.i, !dbg !255

.lr.ph59.i:                                       ; preds = %.preheader18.i
  %scevgep.i = getelementptr [9 x i32]* %reg.i, i64 0, i64 1
  %scevgep109.i = bitcast i32* %scevgep.i to i8*
  %scevgep110.i = getelementptr [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 1
  %scevgep110111.i = bitcast i32* %scevgep110.i to i8*
  %318 = icmp sgt i32 %254, 1
  %.op.i = add i32 %254, -1, !dbg !255
  %319 = zext i32 %.op.i to i64
  %.op178.i = shl nuw nsw i64 %319, 2, !dbg !255
  %.op178.op.i = add i64 %.op178.i, 4, !dbg !255
  %320 = select i1 %318, i64 %.op178.op.i, i64 4, !dbg !255
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep109.i, i8* %scevgep110111.i, i64 %320, i32 4, i1 false) #2, !dbg !257
  br label %.preheader17.i, !dbg !255

.lr.ph61.i:                                       ; preds = %middle.block88, %.lr.ph61.i
  %indvars.iv112.i = phi i64 [ %indvars.iv.next113.i, %.lr.ph61.i ], [ %resume.val91, %middle.block88 ]
  %321 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %indvars.iv112.i, !dbg !251
  %322 = load i32* %321, align 4, !dbg !251, !tbaa !117
  %323 = sext i32 %322 to i64, !dbg !251
  %324 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %323, !dbg !251
  %325 = load i32* %324, align 4, !dbg !251, !tbaa !117
  store i32 %325, i32* %321, align 4, !dbg !251, !tbaa !117
  %indvars.iv.next113.i = add nuw nsw i64 %indvars.iv112.i, 1, !dbg !251
  %lftr.wideiv39 = trunc i64 %indvars.iv.next113.i to i32, !dbg !251
  %exitcond40 = icmp eq i32 %lftr.wideiv39, %303, !dbg !251
  br i1 %exitcond40, label %.preheader18.i, label %.lr.ph61.i, !dbg !251, !llvm.loop !258

.preheader17.i:                                   ; preds = %.lr.ph59.i, %.preheader18.i, %.preheader19.i
  %326 = phi i1 [ false, %.lr.ph59.i ], [ true, %.preheader18.i ], [ true, %.preheader19.i ]
  br label %.preheader16.i, !dbg !259

.preheader16.i:                                   ; preds = %._crit_edge54.thread.i, %.preheader17.i
  %count.057.i = phi i32 [ 0, %.preheader17.i ], [ %count.1.i, %._crit_edge54.thread.i ]
  %i.956.i = phi i32 [ 1, %.preheader17.i ], [ %345, %._crit_edge54.thread.i ]
  br i1 %326, label %._crit_edge54.thread.i, label %.lr.ph53.i, !dbg !261

.lr.ph53.i:                                       ; preds = %.preheader16.i, %._crit_edge164.i
  %indvars.iv104.i = phi i64 [ %indvars.iv.next105.i, %._crit_edge164.i ], [ 1, %.preheader16.i ]
  %q.452.i = phi i32 [ %q.5.i, %._crit_edge164.i ], [ 1, %.preheader16.i ]
  %327 = getelementptr inbounds [9 x i32]* %reg.i, i64 0, i64 %indvars.iv104.i, !dbg !264
  %328 = load i32* %327, align 4, !dbg !264, !tbaa !117
  %329 = icmp eq i32 %328, -1, !dbg !264
  %.pre172.i = trunc i64 %indvars.iv104.i to i32, !dbg !261
  br i1 %329, label %._crit_edge164.i, label %330, !dbg !264

; <label>:330                                     ; preds = %.lr.ph53.i
  %331 = add nsw i32 %328, %.pre172.i, !dbg !266
  %332 = srem i32 %331, 255, !dbg !266
  store i32 %332, i32* %327, align 4, !dbg !266, !tbaa !117
  %333 = sext i32 %332 to i64, !dbg !268
  %334 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %333, !dbg !268
  %335 = load i32* %334, align 4, !dbg !268, !tbaa !117
  %336 = xor i32 %335, %q.452.i, !dbg !268
  call void @llvm.dbg.value(metadata !{i32 %336}, i64 0, metadata !269) #2, !dbg !268
  br label %._crit_edge164.i, !dbg !270

._crit_edge164.i:                                 ; preds = %330, %.lr.ph53.i
  %q.5.i = phi i32 [ %336, %330 ], [ %q.452.i, %.lr.ph53.i ]
  %indvars.iv.next105.i = add nuw nsw i64 %indvars.iv104.i, 1, !dbg !261
  %337 = icmp slt i32 %.pre172.i, %254, !dbg !261
  br i1 %337, label %.lr.ph53.i, label %._crit_edge54.i, !dbg !261

._crit_edge54.i:                                  ; preds = %._crit_edge164.i
  %338 = icmp eq i32 %q.5.i, 0, !dbg !271
  br i1 %338, label %339, label %._crit_edge54.thread.i, !dbg !271

; <label>:339                                     ; preds = %._crit_edge54.i
  %340 = sext i32 %count.057.i to i64, !dbg !273
  %341 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %340, !dbg !273
  store i32 %i.956.i, i32* %341, align 4, !dbg !273, !tbaa !117
  %342 = sub nsw i32 255, %i.956.i, !dbg !275
  %343 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %340, !dbg !275
  store i32 %342, i32* %343, align 4, !dbg !275, !tbaa !117
  %344 = add nsw i32 %count.057.i, 1, !dbg !276
  call void @llvm.dbg.value(metadata !{i32 %344}, i64 0, metadata !163) #2, !dbg !276
  br label %._crit_edge54.thread.i, !dbg !277

._crit_edge54.thread.i:                           ; preds = %339, %._crit_edge54.i, %.preheader16.i
  %count.1.i = phi i32 [ %count.057.i, %._crit_edge54.i ], [ %344, %339 ], [ %count.057.i, %.preheader16.i ]
  %345 = add nsw i32 %i.956.i, 1, !dbg !259
  call void @llvm.dbg.value(metadata !{i32 %345}, i64 0, metadata !166) #2, !dbg !259
  %exitcond106.i = icmp eq i32 %345, 256, !dbg !259
  br i1 %exitcond106.i, label %346, label %.preheader16.i, !dbg !259

; <label>:346                                     ; preds = %._crit_edge54.thread.i
  %347 = icmp eq i32 %count.1.i, %254, !dbg !278
  br i1 %347, label %.preheader13.i, label %.preheader14.i, !dbg !278

.preheader13.i:                                   ; preds = %346
  br i1 %326, label %.preheader11.i, label %.lr.ph49.i, !dbg !280

.lr.ph49.i:                                       ; preds = %.preheader13.i, %._crit_edge156.i
  %indvars.iv35 = phi i32 [ %indvars.iv.next36, %._crit_edge156.i ], [ 1, %.preheader13.i ]
  %.pr4.i = phi i32 [ %.pre158.i, %._crit_edge156.i ], [ %138, %.preheader13.i ]
  %indvars.iv99.i = phi i64 [ %indvars.iv.next100.i, %._crit_edge156.i ], [ 1, %.preheader13.i ]
  %348 = icmp eq i32 %.pr4.i, -1, !dbg !283
  %.phi.trans.insert159.i = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %indvars.iv99.i
  %.pre160.i = load i32* %.phi.trans.insert159.i, align 4, !dbg !286, !tbaa !117
  %349 = icmp eq i32 %.pre160.i, -1, !dbg !286
  br i1 %348, label %.thread6.i, label %350, !dbg !283

; <label>:350                                     ; preds = %.lr.ph49.i
  %351 = sext i32 %.pr4.i to i64, !dbg !289
  %352 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %351, !dbg !289
  %353 = load i32* %352, align 4, !dbg !289, !tbaa !117
  br i1 %349, label %360, label %354, !dbg !283

; <label>:354                                     ; preds = %350
  %355 = sext i32 %.pre160.i to i64, !dbg !290
  %356 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %355, !dbg !290
  %357 = load i32* %356, align 4, !dbg !290, !tbaa !117
  %358 = xor i32 %357, %353, !dbg !290
  %359 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !290
  store i32 %358, i32* %359, align 4, !dbg !290, !tbaa !117
  br label %.preheader12.i, !dbg !290

; <label>:360                                     ; preds = %350
  %361 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !289
  store i32 %353, i32* %361, align 4, !dbg !289, !tbaa !117
  br label %.preheader12.i, !dbg !289

.thread6.i:                                       ; preds = %.lr.ph49.i
  br i1 %349, label %367, label %362, !dbg !286

; <label>:362                                     ; preds = %.thread6.i
  %363 = sext i32 %.pre160.i to i64, !dbg !291
  %364 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %363, !dbg !291
  %365 = load i32* %364, align 4, !dbg !291, !tbaa !117
  %366 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !291
  store i32 %365, i32* %366, align 4, !dbg !291, !tbaa !117
  br label %.preheader12.i, !dbg !291

; <label>:367                                     ; preds = %.thread6.i
  %368 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !292
  store i32 0, i32* %368, align 4, !dbg !292, !tbaa !117
  br label %.preheader12.i

.preheader12.i:                                   ; preds = %367, %362, %360, %354
  %369 = phi i32 [ %353, %360 ], [ 0, %367 ], [ %365, %362 ], [ %358, %354 ]
  %370 = trunc i64 %indvars.iv99.i to i32, !dbg !293
  %371 = icmp sgt i32 %370, 1, !dbg !293
  %372 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv99.i, !dbg !295
  br i1 %371, label %.lr.ph45.i, label %._crit_edge46.i, !dbg !293

.lr.ph45.i:                                       ; preds = %.preheader12.i, %389
  %373 = phi i32 [ %390, %389 ], [ %369, %.preheader12.i ]
  %indvars.iv94.i = phi i64 [ %indvars.iv.next95.i, %389 ], [ 1, %.preheader12.i ]
  %374 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv94.i, !dbg !297
  %375 = load i32* %374, align 4, !dbg !297, !tbaa !117
  %376 = icmp eq i32 %375, -1, !dbg !297
  br i1 %376, label %389, label %377, !dbg !297

; <label>:377                                     ; preds = %.lr.ph45.i
  %378 = sub nsw i64 %indvars.iv99.i, %indvars.iv94.i, !dbg !297
  %379 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %178, i64 %378, !dbg !297
  %380 = load i32* %379, align 4, !dbg !297, !tbaa !117
  %381 = icmp eq i32 %380, -1, !dbg !297
  br i1 %381, label %389, label %382, !dbg !297

; <label>:382                                     ; preds = %377
  %383 = add nsw i32 %380, %375, !dbg !295
  %384 = srem i32 %383, 255, !dbg !295
  %385 = sext i32 %384 to i64, !dbg !295
  %386 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %385, !dbg !295
  %387 = load i32* %386, align 4, !dbg !295, !tbaa !117
  %388 = xor i32 %387, %373, !dbg !295
  store i32 %388, i32* %372, align 4, !dbg !295, !tbaa !117
  br label %389, !dbg !295

; <label>:389                                     ; preds = %382, %377, %.lr.ph45.i
  %390 = phi i32 [ %373, %377 ], [ %373, %.lr.ph45.i ], [ %388, %382 ]
  %indvars.iv.next95.i = add nuw nsw i64 %indvars.iv94.i, 1, !dbg !293
  %lftr.wideiv37 = trunc i64 %indvars.iv.next95.i to i32, !dbg !293
  %exitcond38 = icmp eq i32 %lftr.wideiv37, %indvars.iv35, !dbg !293
  br i1 %exitcond38, label %._crit_edge46.i, label %.lr.ph45.i, !dbg !293

._crit_edge46.i:                                  ; preds = %389, %.preheader12.i
  %391 = phi i32 [ %369, %.preheader12.i ], [ %390, %389 ]
  %392 = sext i32 %391 to i64, !dbg !298
  %393 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %392, !dbg !298
  %394 = load i32* %393, align 4, !dbg !298, !tbaa !117
  store i32 %394, i32* %372, align 4, !dbg !298, !tbaa !117
  %indvars.iv.next100.i = add nuw nsw i64 %indvars.iv99.i, 1, !dbg !280
  %395 = icmp slt i32 %370, %254, !dbg !280
  br i1 %395, label %._crit_edge156.i, label %.preheader11.i, !dbg !280

._crit_edge156.i:                                 ; preds = %._crit_edge46.i
  %indvars.iv.next36 = add nuw nsw i32 %indvars.iv35, 1, !dbg !280
  %.phi.trans.insert157.i = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv.next100.i
  %.pre158.i = load i32* %.phi.trans.insert157.i, align 4, !dbg !283, !tbaa !117
  br label %.lr.ph49.i, !dbg !280

.preheader9.i:                                    ; preds = %404
  %396 = icmp sgt i32 %254, 0, !dbg !299
  br i1 %396, label %.lr.ph42.i, label %vector.memcheck107, !dbg !299

.preheader11.i:                                   ; preds = %.preheader13.i, %._crit_edge46.i, %404
  %indvars.iv91.i = phi i64 [ %indvars.iv.next92.i, %404 ], [ 0, %._crit_edge46.i ], [ 0, %.preheader13.i ]
  %397 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv91.i, !dbg !301
  %398 = load i32* %397, align 4, !dbg !301, !tbaa !117
  %399 = icmp eq i32 %398, -1, !dbg !301
  br i1 %399, label %404, label %400, !dbg !301

; <label>:400                                     ; preds = %.preheader11.i
  %401 = sext i32 %398 to i64, !dbg !305
  %402 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %401, !dbg !305
  %403 = load i32* %402, align 4, !dbg !305, !tbaa !117
  br label %404, !dbg !305

; <label>:404                                     ; preds = %400, %.preheader11.i
  %storemerge3.i = phi i32 [ %403, %400 ], [ 0, %.preheader11.i ]
  store i32 %storemerge3.i, i32* %397, align 4, !dbg !305, !tbaa !117
  %indvars.iv.next92.i = add nuw nsw i64 %indvars.iv91.i, 1, !dbg !306
  %exitcond93.i = icmp eq i64 %indvars.iv.next92.i, 255, !dbg !306
  br i1 %exitcond93.i, label %.preheader9.i, label %.preheader11.i, !dbg !306

.lr.ph42.i:                                       ; preds = %.preheader9.i, %464
  %405 = phi i32 [ %465, %464 ], [ %254, %.preheader9.i ]
  %indvars.iv89.i = phi i64 [ %indvars.iv.next90.i, %464 ], [ 0, %.preheader9.i ]
  %406 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv89.i, !dbg !307
  %407 = load i32* %406, align 4, !dbg !307, !tbaa !117
  %408 = sext i32 %407 to i64, !dbg !307
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !171) #2, !dbg !309
  br i1 %326, label %._crit_edge.thread.i, label %.lr.ph.i, !dbg !309

.lr.ph.i:                                         ; preds = %.lr.ph42.i
  %409 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %indvars.iv89.i, !dbg !311
  br label %410, !dbg !309

; <label>:410                                     ; preds = %425, %.lr.ph.i
  %411 = phi i32 [ %.pre155.i, %425 ], [ 1, %.lr.ph.i ]
  %indvars.iv85.i = phi i64 [ %indvars.iv.next86.i, %425 ], [ 1, %.lr.ph.i ]
  %412 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv85.i, !dbg !313
  %413 = load i32* %412, align 4, !dbg !313, !tbaa !117
  %414 = icmp eq i32 %413, -1, !dbg !313
  br i1 %414, label %._crit_edge165.i, label %415, !dbg !313

._crit_edge165.i:                                 ; preds = %410
  %.pre168.i = trunc i64 %indvars.iv85.i to i32, !dbg !309
  br label %425, !dbg !313

; <label>:415                                     ; preds = %410
  %416 = load i32* %409, align 4, !dbg !311, !tbaa !117
  %417 = trunc i64 %indvars.iv85.i to i32, !dbg !311
  %418 = mul nsw i32 %416, %417, !dbg !311
  %419 = add nsw i32 %418, %413, !dbg !311
  %420 = srem i32 %419, 255, !dbg !311
  %421 = sext i32 %420 to i64, !dbg !311
  %422 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %421, !dbg !311
  %423 = load i32* %422, align 4, !dbg !311, !tbaa !117
  %424 = xor i32 %423, %411, !dbg !311
  br label %425, !dbg !311

; <label>:425                                     ; preds = %415, %._crit_edge165.i
  %.pre-phi169.i = phi i32 [ %.pre168.i, %._crit_edge165.i ], [ %417, %415 ], !dbg !309
  %.pre155.i = phi i32 [ %411, %._crit_edge165.i ], [ %424, %415 ]
  %indvars.iv.next86.i = add nuw nsw i64 %indvars.iv85.i, 1, !dbg !309
  %426 = icmp slt i32 %.pre-phi169.i, %254, !dbg !309
  br i1 %426, label %410, label %._crit_edge.i, !dbg !309

._crit_edge.i:                                    ; preds = %425
  %427 = icmp eq i32 %.pre155.i, 0, !dbg !314
  br i1 %427, label %464, label %._crit_edge.thread.i, !dbg !314

._crit_edge.thread.i:                             ; preds = %._crit_edge.i, %.lr.ph42.i
  %428 = phi i32 [ %.pre155.i, %._crit_edge.i ], [ 1, %.lr.ph42.i ]
  %429 = phi i32 [ %254, %._crit_edge.i ], [ %405, %.lr.ph42.i ]
  %430 = sext i32 %428 to i64, !dbg !316
  %431 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %430, !dbg !316
  %432 = load i32* %431, align 4, !dbg !316, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !269) #2, !dbg !318
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !171) #2, !dbg !319
  %433 = icmp sgt i32 %429, 0, !dbg !319
  br i1 %433, label %.lr.ph39.i, label %._crit_edge40.i, !dbg !319

.lr.ph39.i:                                       ; preds = %._crit_edge.thread.i
  %434 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %indvars.iv89.i, !dbg !321
  %435 = trunc i64 %indvars.iv89.i to i32, !dbg !323
  br label %436, !dbg !319

; <label>:436                                     ; preds = %453, %.lr.ph39.i
  %indvars.iv87.i = phi i64 [ 0, %.lr.ph39.i ], [ %indvars.iv.next88.i, %453 ]
  %q.637.i = phi i32 [ 0, %.lr.ph39.i ], [ %q.7.i, %453 ]
  %437 = trunc i64 %indvars.iv87.i to i32, !dbg !323
  %438 = icmp eq i32 %437, %435, !dbg !323
  br i1 %438, label %453, label %439, !dbg !323

; <label>:439                                     ; preds = %436
  %440 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv87.i, !dbg !321
  %441 = load i32* %440, align 4, !dbg !321, !tbaa !117
  %442 = load i32* %434, align 4, !dbg !321, !tbaa !117
  %443 = add nsw i32 %442, %441, !dbg !321
  %444 = srem i32 %443, 255, !dbg !321
  %445 = sext i32 %444 to i64, !dbg !321
  %446 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %445, !dbg !321
  %447 = load i32* %446, align 4, !dbg !321, !tbaa !117
  %448 = xor i32 %447, 1, !dbg !321
  %449 = sext i32 %448 to i64, !dbg !321
  %450 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %449, !dbg !321
  %451 = load i32* %450, align 4, !dbg !321, !tbaa !117
  %452 = add nsw i32 %451, %q.637.i, !dbg !321
  call void @llvm.dbg.value(metadata !{i32 %452}, i64 0, metadata !269) #2, !dbg !321
  br label %453, !dbg !321

; <label>:453                                     ; preds = %439, %436
  %q.7.i = phi i32 [ %452, %439 ], [ %q.637.i, %436 ]
  %indvars.iv.next88.i = add nuw nsw i64 %indvars.iv87.i, 1, !dbg !319
  %lftr.wideiv = trunc i64 %indvars.iv.next88.i to i32, !dbg !319
  %exitcond32 = icmp eq i32 %lftr.wideiv, %429, !dbg !319
  br i1 %exitcond32, label %._crit_edge40.i, label %436, !dbg !319

._crit_edge40.i:                                  ; preds = %453, %._crit_edge.thread.i
  %q.6.lcssa.i = phi i32 [ 0, %._crit_edge.thread.i ], [ %q.7.i, %453 ]
  %454 = srem i32 %q.6.lcssa.i, 255, !dbg !324
  call void @llvm.dbg.value(metadata !{i32 %454}, i64 0, metadata !269) #2, !dbg !324
  %455 = add i32 %432, 255, !dbg !325
  %456 = sub i32 %455, %454, !dbg !325
  %457 = srem i32 %456, 255, !dbg !325
  %458 = sext i32 %457 to i64, !dbg !325
  %459 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %458, !dbg !325
  %460 = load i32* %459, align 4, !dbg !325, !tbaa !117
  %461 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %408, !dbg !326
  %462 = load i32* %461, align 4, !dbg !326, !tbaa !117
  %463 = xor i32 %462, %460, !dbg !326
  store i32 %463, i32* %461, align 4, !dbg !326, !tbaa !117
  br label %464, !dbg !327

; <label>:464                                     ; preds = %._crit_edge40.i, %._crit_edge.i
  %465 = phi i32 [ %254, %._crit_edge.i ], [ %429, %._crit_edge40.i ]
  %indvars.iv.next90.i = add nuw nsw i64 %indvars.iv89.i, 1, !dbg !299
  %lftr.wideiv33 = trunc i64 %indvars.iv.next90.i to i32, !dbg !299
  %exitcond34 = icmp eq i32 %lftr.wideiv33, %254, !dbg !299
  br i1 %exitcond34, label %vector.memcheck107, label %.lr.ph42.i, !dbg !299

.preheader14.i:                                   ; preds = %346, %473
  %indvars.iv101.i = phi i64 [ %indvars.iv.next102.i, %473 ], [ 0, %346 ]
  %466 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv101.i, !dbg !328
  %467 = load i32* %466, align 4, !dbg !328, !tbaa !117
  %468 = icmp eq i32 %467, -1, !dbg !328
  br i1 %468, label %473, label %469, !dbg !328

; <label>:469                                     ; preds = %.preheader14.i
  %470 = sext i32 %467 to i64, !dbg !331
  %471 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %470, !dbg !331
  %472 = load i32* %471, align 4, !dbg !331, !tbaa !117
  br label %473, !dbg !331

; <label>:473                                     ; preds = %469, %.preheader14.i
  %storemerge2.i = phi i32 [ %472, %469 ], [ 0, %.preheader14.i ]
  store i32 %storemerge2.i, i32* %466, align 4, !dbg !331, !tbaa !117
  %indvars.iv.next102.i = add nuw nsw i64 %indvars.iv101.i, 1, !dbg !332
  %exitcond103.i = icmp eq i64 %indvars.iv.next102.i, 255, !dbg !332
  br i1 %exitcond103.i, label %vector.memcheck107, label %.preheader14.i, !dbg !332

.critedge.thread.preheader.i:                     ; preds = %.critedge.i, %.preheader20._crit_edge.i, %.critedge.thread.i
  %indvars.iv82.i = phi i64 [ %indvars.iv.next83.i, %.critedge.thread.i ], [ 0, %.preheader20._crit_edge.i ], [ 0, %.critedge.i ]
  %474 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv82.i, !dbg !333
  %475 = load i32* %474, align 4, !dbg !333, !tbaa !117
  %476 = icmp eq i32 %475, -1, !dbg !333
  br i1 %476, label %.critedge.thread.i, label %477, !dbg !333

; <label>:477                                     ; preds = %.critedge.thread.preheader.i
  %478 = sext i32 %475 to i64, !dbg !336
  %479 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %478, !dbg !336
  %480 = load i32* %479, align 4, !dbg !336, !tbaa !117
  br label %.critedge.thread.i, !dbg !336

.critedge.thread.i:                               ; preds = %477, %.critedge.thread.preheader.i
  %storemerge1.i = phi i32 [ %480, %477 ], [ 0, %.critedge.thread.preheader.i ]
  store i32 %storemerge1.i, i32* %474, align 4, !dbg !336, !tbaa !117
  %indvars.iv.next83.i = add nuw nsw i64 %indvars.iv82.i, 1, !dbg !337
  %exitcond84.i = icmp eq i64 %indvars.iv.next83.i, 255, !dbg !337
  br i1 %exitcond84.i, label %vector.memcheck107, label %.critedge.thread.preheader.i, !dbg !337

.preheader.i:                                     ; preds = %133, %488
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %488 ], [ 0, %133 ]
  %481 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv.i1, !dbg !338
  %482 = load i32* %481, align 4, !dbg !338, !tbaa !117
  %483 = icmp eq i32 %482, -1, !dbg !338
  br i1 %483, label %488, label %484, !dbg !338

; <label>:484                                     ; preds = %.preheader.i
  %485 = sext i32 %482 to i64, !dbg !341
  %486 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %485, !dbg !341
  %487 = load i32* %486, align 4, !dbg !341, !tbaa !117
  br label %488, !dbg !341

; <label>:488                                     ; preds = %484, %.preheader.i
  %storemerge.i = phi i32 [ %487, %484 ], [ 0, %.preheader.i ]
  store i32 %storemerge.i, i32* %481, align 4, !dbg !341, !tbaa !117
  %indvars.iv.next.i2 = add nuw nsw i64 %indvars.iv.i1, 1, !dbg !342
  %exitcond.i3 = icmp eq i64 %indvars.iv.next.i2, 255, !dbg !342
  br i1 %exitcond.i3, label %vector.memcheck107, label %.preheader.i, !dbg !342

vector.memcheck107:                               ; preds = %.preheader9.i, %488, %.critedge.thread.i, %464, %473
  %scevgep102 = getelementptr i8* %data_out, i64 187
  %bound1104 = icmp uge i8* %scevgep102, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 67) to i8*)
  %bound0103 = icmp ule i8* %data_out, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 254) to i8*)
  %memcheck.conflict106 = and i1 %bound0103, %bound1104
  br i1 %memcheck.conflict106, label %decode_rs.exit, label %vector.body98

vector.body98:                                    ; preds = %vector.memcheck107, %vector.body98
  %index101 = phi i64 [ %index.next111, %vector.body98 ], [ 0, %vector.memcheck107 ], !dbg !343
  %489 = add i64 %index101, 67, !dbg !345
  %490 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %489, !dbg !345
  %491 = bitcast i32* %490 to <4 x i32>*, !dbg !345
  %wide.load116 = load <4 x i32>* %491, align 4, !dbg !345
  %.sum120 = add i64 %index101, 71, !dbg !345
  %492 = getelementptr [255 x i32]* @recd, i64 0, i64 %.sum120, !dbg !345
  %493 = bitcast i32* %492 to <4 x i32>*, !dbg !345
  %wide.load117 = load <4 x i32>* %493, align 4, !dbg !345
  %494 = trunc <4 x i32> %wide.load116 to <4 x i8>, !dbg !345
  %495 = trunc <4 x i32> %wide.load117 to <4 x i8>, !dbg !345
  %496 = getelementptr inbounds i8* %data_out, i64 %index101, !dbg !345
  %497 = bitcast i8* %496 to <4 x i8>*, !dbg !345
  store <4 x i8> %494, <4 x i8>* %497, align 1, !dbg !345
  %.sum121122 = or i64 %index101, 4, !dbg !345
  %498 = getelementptr i8* %data_out, i64 %.sum121122, !dbg !345
  %499 = bitcast i8* %498 to <4 x i8>*, !dbg !345
  store <4 x i8> %495, <4 x i8>* %499, align 1, !dbg !345
  %index.next111 = add i64 %index101, 8, !dbg !343
  %500 = icmp eq i64 %index.next111, 184, !dbg !343
  br i1 %500, label %decode_rs.exit, label %vector.body98, !dbg !343, !llvm.loop !347

decode_rs.exit:                                   ; preds = %vector.body98, %vector.memcheck107, %decode_rs.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %decode_rs.exit ], [ 0, %vector.memcheck107 ], [ 184, %vector.body98 ]
  %501 = add nsw i64 %indvars.iv, 67, !dbg !345
  %502 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %501, !dbg !345
  %503 = load i32* %502, align 4, !dbg !345, !tbaa !117
  %504 = trunc i32 %503 to i8, !dbg !345
  %505 = getelementptr inbounds i8* %data_out, i64 %indvars.iv, !dbg !345
  store i8 %504, i8* %505, align 1, !dbg !345, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !343
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !343
  br i1 %exitcond, label %506, label %decode_rs.exit, !dbg !343, !llvm.loop !348

; <label>:506                                     ; preds = %decode_rs.exit
  ret void, !dbg !349
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @rsenc_204(i8* nocapture %data_out, i8* nocapture readonly %data_in) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %data_out}, i64 0, metadata !17), !dbg !350
  tail call void @llvm.dbg.value(metadata !{i8* %data_in}, i64 0, metadata !18), !dbg !350
  %.b = load i1* @inited, align 1
  br i1 %.b, label %.preheader4, label %1, !dbg !351

; <label>:1                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !106, i64 0, metadata !353), !dbg !356
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !357), !dbg !358
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 0), align 16, !dbg !359, !tbaa !117
  store i32 0, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 1), align 4, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 1), align 4, !dbg !359, !tbaa !117
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 2), align 8, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 2), align 8, !dbg !359, !tbaa !117
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 4), align 16, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 3), align 4, !dbg !359, !tbaa !117
  store i32 3, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 8), align 16, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 16, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 4), align 16, !dbg !359, !tbaa !117
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 16), align 16, !dbg !360, !tbaa !117
  store i32 29, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !362, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 32, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 5), align 4, !dbg !359, !tbaa !117
  store i32 5, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 32), align 16, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 64, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 6), align 8, !dbg !359, !tbaa !117
  store i32 6, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 64), align 16, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 128, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 7), align 4, !dbg !359, !tbaa !117
  store i32 7, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 128), align 16, !dbg !360, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !353), !dbg !361
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 29), align 4, !dbg !363, !tbaa !117
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !353), !dbg !364
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !357), !dbg !365
  br label %2, !dbg !365

; <label>:2                                       ; preds = %14, %1
  %3 = phi i32 [ 29, %1 ], [ %15, %14 ]
  %indvars.iv.i = phi i64 [ 9, %1 ], [ %indvars.iv.next.i, %14 ]
  %4 = icmp slt i32 %3, 128, !dbg !366
  br i1 %4, label %11, label %5, !dbg !366

; <label>:5                                       ; preds = %2
  %6 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !367, !tbaa !117
  %7 = shl i32 %3, 1, !dbg !367
  %8 = xor i32 %7, 256, !dbg !367
  %9 = xor i32 %8, %6, !dbg !367
  %10 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv.i, !dbg !367
  store i32 %9, i32* %10, align 4, !dbg !367, !tbaa !117
  br label %14, !dbg !367

; <label>:11                                      ; preds = %2
  %12 = shl i32 %3, 1, !dbg !368
  %13 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv.i, !dbg !368
  store i32 %12, i32* %13, align 4, !dbg !368, !tbaa !117
  br label %14

; <label>:14                                      ; preds = %11, %5
  %15 = phi i32 [ %12, %11 ], [ %9, %5 ]
  %16 = sext i32 %15 to i64, !dbg !369
  %17 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %16, !dbg !369
  %18 = trunc i64 %indvars.iv.i to i32, !dbg !369
  store i32 %18, i32* %17, align 4, !dbg !369, !tbaa !117
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !365
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 255, !dbg !365
  br i1 %exitcond.i, label %generate_gf.exit, label %2, !dbg !365

generate_gf.exit:                                 ; preds = %14
  store i32 -1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 0), align 16, !dbg !370, !tbaa !117
  tail call fastcc void @gen_poly(), !dbg !371
  store i1 true, i1* @inited, align 1
  br label %.preheader4, !dbg !372

.preheader4:                                      ; preds = %generate_gf.exit, %0
  call void @llvm.memset.p0i8.i64(i8* bitcast ([239 x i32]* @data to i8*), i8 0, i64 204, i32 16, i1 false), !dbg !373
  %scevgep = getelementptr i8* %data_in, i64 187
  %bound1 = icmp ule i8* %data_in, bitcast (i32* getelementptr inbounds ([239 x i32]* @data, i64 0, i64 238) to i8*)
  %bound0 = icmp uge i8* %scevgep, bitcast (i32* getelementptr inbounds ([239 x i32]* @data, i64 0, i64 51) to i8*)
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph, label %vector.body

vector.body:                                      ; preds = %.preheader4, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader4 ], !dbg !376
  %19 = getelementptr inbounds i8* %data_in, i64 %index, !dbg !378
  %20 = bitcast i8* %19 to <4 x i8>*, !dbg !378
  %wide.load = load <4 x i8>* %20, align 1, !dbg !378
  %.sum39 = or i64 %index, 4, !dbg !378
  %21 = getelementptr i8* %data_in, i64 %.sum39, !dbg !378
  %22 = bitcast i8* %21 to <4 x i8>*, !dbg !378
  %wide.load16 = load <4 x i8>* %22, align 1, !dbg !378
  %23 = zext <4 x i8> %wide.load to <4 x i32>, !dbg !378
  %24 = zext <4 x i8> %wide.load16 to <4 x i32>, !dbg !378
  %25 = add i64 %index, 51, !dbg !378
  %26 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %25, !dbg !378
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !378
  store <4 x i32> %23, <4 x i32>* %27, align 4, !dbg !378
  %.sum = add i64 %index, 55, !dbg !378
  %28 = getelementptr [239 x i32]* @data, i64 0, i64 %.sum, !dbg !378
  %29 = bitcast i32* %28 to <4 x i32>*, !dbg !378
  store <4 x i32> %24, <4 x i32>* %29, align 4, !dbg !378
  %index.next = add i64 %index, 8, !dbg !376
  %30 = icmp eq i64 %index.next, 184, !dbg !376
  br i1 %30, label %scalar.ph, label %vector.body, !dbg !376, !llvm.loop !380

scalar.ph:                                        ; preds = %vector.body, %.preheader4, %scalar.ph
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %scalar.ph ], [ 0, %.preheader4 ], [ 184, %vector.body ]
  %31 = getelementptr inbounds i8* %data_in, i64 %indvars.iv9, !dbg !378
  %32 = load i8* %31, align 1, !dbg !378, !tbaa !144
  %33 = zext i8 %32 to i32, !dbg !378
  %34 = add nsw i64 %indvars.iv9, 51, !dbg !378
  %35 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %34, !dbg !378
  store i32 %33, i32* %35, align 4, !dbg !378, !tbaa !117
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !376
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 188, !dbg !376
  br i1 %exitcond11, label %36, label %scalar.ph, !dbg !376, !llvm.loop !381

; <label>:36                                      ; preds = %scalar.ph
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !382) #2, !dbg !384
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @bb to i8*), i8 0, i64 64, i32 16, i1 false) #2, !dbg !384
  %37 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !386, !tbaa !117
  br label %38, !dbg !391

; <label>:38                                      ; preds = %._crit_edge.i, %36
  %39 = phi i32 [ 0, %36 ], [ %storemerge.i, %._crit_edge.i ]
  %40 = phi i32 [ 0, %36 ], [ %.pre.i, %._crit_edge.i ]
  %indvars.iv10.i = phi i64 [ 238, %36 ], [ %indvars.iv.next11.i, %._crit_edge.i ]
  %41 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %indvars.iv10.i, !dbg !392
  %42 = load i32* %41, align 4, !dbg !392, !tbaa !117
  %43 = xor i32 %42, %40, !dbg !392
  %44 = sext i32 %43 to i64, !dbg !392
  %45 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %44, !dbg !392
  %46 = load i32* %45, align 4, !dbg !392, !tbaa !117
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !393) #2, !dbg !392
  %47 = icmp eq i32 %46, -1, !dbg !394
  tail call void @llvm.dbg.value(metadata !395, i64 0, metadata !396) #2, !dbg !397
  br i1 %47, label %.preheader.i, label %.preheader1.i, !dbg !394

.preheader.i:                                     ; preds = %38
  %48 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 14), align 8, !dbg !399, !tbaa !117
  store i32 %48, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !399, !tbaa !117
  %49 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 13), align 4, !dbg !399, !tbaa !117
  store i32 %49, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 14), align 8, !dbg !399, !tbaa !117
  %50 = load <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 9) to <4 x i32>*), align 4, !dbg !399, !tbaa !117
  store <4 x i32> %50, <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 10) to <4 x i32>*), align 8, !dbg !399, !tbaa !117
  %51 = load <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 5) to <4 x i32>*), align 4, !dbg !399, !tbaa !117
  store <4 x i32> %51, <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 6) to <4 x i32>*), align 8, !dbg !399, !tbaa !117
  %52 = load <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 1) to <4 x i32>*), align 4, !dbg !399, !tbaa !117
  store <4 x i32> %52, <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 2) to <4 x i32>*), align 8, !dbg !399, !tbaa !117
  store i32 %39, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 1), align 4, !dbg !399, !tbaa !117
  br label %76

.preheader1.i:                                    ; preds = %38, %.backedge.i
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %.backedge.i ], [ 15, %38 ]
  %53 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.i1, !dbg !402
  %54 = load i32* %53, align 4, !dbg !402, !tbaa !117
  %55 = icmp eq i32 %54, -1, !dbg !402
  %indvars.iv.next.i2 = add nsw i64 %indvars.iv.i1, -1, !dbg !397
  %56 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.next.i2, !dbg !404
  %57 = load i32* %56, align 4, !dbg !404, !tbaa !117
  br i1 %55, label %68, label %58, !dbg !402

; <label>:58                                      ; preds = %.preheader1.i
  %59 = add nsw i32 %54, %46, !dbg !404
  %60 = srem i32 %59, 255, !dbg !404
  %61 = sext i32 %60 to i64, !dbg !404
  %62 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %61, !dbg !404
  %63 = load i32* %62, align 4, !dbg !404, !tbaa !117
  %64 = xor i32 %63, %57, !dbg !404
  %65 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.i1, !dbg !404
  store i32 %64, i32* %65, align 4, !dbg !404, !tbaa !117
  br label %.backedge.i, !dbg !404

.backedge.i:                                      ; preds = %68, %58
  %66 = trunc i64 %indvars.iv.next.i2 to i32, !dbg !397
  %67 = icmp sgt i32 %66, 0, !dbg !397
  br i1 %67, label %.preheader1.i, label %70, !dbg !397

; <label>:68                                      ; preds = %.preheader1.i
  %69 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.i1, !dbg !405
  store i32 %57, i32* %69, align 4, !dbg !405, !tbaa !117
  br label %.backedge.i

; <label>:70                                      ; preds = %.backedge.i
  %71 = add nsw i32 %46, %37, !dbg !386
  %72 = srem i32 %71, 255, !dbg !386
  %73 = sext i32 %72 to i64, !dbg !386
  %74 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %73, !dbg !386
  %75 = load i32* %74, align 4, !dbg !386, !tbaa !117
  br label %76, !dbg !406

; <label>:76                                      ; preds = %70, %.preheader.i
  %storemerge.i = phi i32 [ %75, %70 ], [ 0, %.preheader.i ]
  store i32 %storemerge.i, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 0), align 16, !dbg !407, !tbaa !117
  %77 = trunc i64 %indvars.iv10.i to i32, !dbg !391
  %78 = icmp sgt i32 %77, 0, !dbg !391
  br i1 %78, label %._crit_edge.i, label %vector.memcheck28, !dbg !391

vector.memcheck28:                                ; preds = %76
  %scevgep23 = getelementptr i8* %data_in, i64 187
  %scevgep22 = getelementptr i8* %data_out, i64 187
  %bound125 = icmp uge i8* %scevgep22, %data_in
  %bound024 = icmp uge i8* %scevgep23, %data_out
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %encode_rs.exit, label %vector.body18

vector.body18:                                    ; preds = %vector.memcheck28, %vector.body18
  %index21 = phi i64 [ %index.next32, %vector.body18 ], [ 0, %vector.memcheck28 ], !dbg !408
  %79 = getelementptr inbounds i8* %data_in, i64 %index21, !dbg !410
  %80 = bitcast i8* %79 to <16 x i8>*, !dbg !410
  %wide.load37 = load <16 x i8>* %80, align 1, !dbg !410
  %.sum4041 = or i64 %index21, 16, !dbg !410
  %81 = getelementptr i8* %data_in, i64 %.sum4041, !dbg !410
  %82 = bitcast i8* %81 to <16 x i8>*, !dbg !410
  %wide.load38 = load <16 x i8>* %82, align 1, !dbg !410
  %83 = getelementptr inbounds i8* %data_out, i64 %index21, !dbg !410
  %84 = bitcast i8* %83 to <16 x i8>*, !dbg !410
  store <16 x i8> %wide.load37, <16 x i8>* %84, align 1, !dbg !410
  %.sum4243 = or i64 %index21, 16, !dbg !410
  %85 = getelementptr i8* %data_out, i64 %.sum4243, !dbg !410
  %86 = bitcast i8* %85 to <16 x i8>*, !dbg !410
  store <16 x i8> %wide.load38, <16 x i8>* %86, align 1, !dbg !410
  %index.next32 = add i64 %index21, 32, !dbg !408
  %87 = icmp eq i64 %index.next32, 160, !dbg !408
  br i1 %87, label %encode_rs.exit, label %vector.body18, !dbg !408, !llvm.loop !412

._crit_edge.i:                                    ; preds = %76
  %indvars.iv.next11.i = add nsw i64 %indvars.iv10.i, -1, !dbg !391
  %.pre.i = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !392, !tbaa !117
  br label %38, !dbg !391

.preheader:                                       ; preds = %encode_rs.exit
  %88 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 0), align 16, !dbg !413, !tbaa !117
  %89 = trunc i32 %88 to i8, !dbg !413
  %90 = getelementptr inbounds i8* %data_out, i64 188, !dbg !413
  store i8 %89, i8* %90, align 1, !dbg !413, !tbaa !144
  %91 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 1), align 4, !dbg !413, !tbaa !117
  %92 = trunc i32 %91 to i8, !dbg !413
  %93 = getelementptr inbounds i8* %data_out, i64 189, !dbg !413
  store i8 %92, i8* %93, align 1, !dbg !413, !tbaa !144
  %94 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 2), align 8, !dbg !413, !tbaa !117
  %95 = trunc i32 %94 to i8, !dbg !413
  %96 = getelementptr inbounds i8* %data_out, i64 190, !dbg !413
  store i8 %95, i8* %96, align 1, !dbg !413, !tbaa !144
  %97 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 3), align 4, !dbg !413, !tbaa !117
  %98 = trunc i32 %97 to i8, !dbg !413
  %99 = getelementptr inbounds i8* %data_out, i64 191, !dbg !413
  store i8 %98, i8* %99, align 1, !dbg !413, !tbaa !144
  %100 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 4), align 16, !dbg !413, !tbaa !117
  %101 = trunc i32 %100 to i8, !dbg !413
  %102 = getelementptr inbounds i8* %data_out, i64 192, !dbg !413
  store i8 %101, i8* %102, align 1, !dbg !413, !tbaa !144
  %103 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 5), align 4, !dbg !413, !tbaa !117
  %104 = trunc i32 %103 to i8, !dbg !413
  %105 = getelementptr inbounds i8* %data_out, i64 193, !dbg !413
  store i8 %104, i8* %105, align 1, !dbg !413, !tbaa !144
  %106 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 6), align 8, !dbg !413, !tbaa !117
  %107 = trunc i32 %106 to i8, !dbg !413
  %108 = getelementptr inbounds i8* %data_out, i64 194, !dbg !413
  store i8 %107, i8* %108, align 1, !dbg !413, !tbaa !144
  %109 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 7), align 4, !dbg !413, !tbaa !117
  %110 = trunc i32 %109 to i8, !dbg !413
  %111 = getelementptr inbounds i8* %data_out, i64 195, !dbg !413
  store i8 %110, i8* %111, align 1, !dbg !413, !tbaa !144
  %112 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 8), align 16, !dbg !413, !tbaa !117
  %113 = trunc i32 %112 to i8, !dbg !413
  %114 = getelementptr inbounds i8* %data_out, i64 196, !dbg !413
  store i8 %113, i8* %114, align 1, !dbg !413, !tbaa !144
  %115 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 9), align 4, !dbg !413, !tbaa !117
  %116 = trunc i32 %115 to i8, !dbg !413
  %117 = getelementptr inbounds i8* %data_out, i64 197, !dbg !413
  store i8 %116, i8* %117, align 1, !dbg !413, !tbaa !144
  %118 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 10), align 8, !dbg !413, !tbaa !117
  %119 = trunc i32 %118 to i8, !dbg !413
  %120 = getelementptr inbounds i8* %data_out, i64 198, !dbg !413
  store i8 %119, i8* %120, align 1, !dbg !413, !tbaa !144
  %121 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 11), align 4, !dbg !413, !tbaa !117
  %122 = trunc i32 %121 to i8, !dbg !413
  %123 = getelementptr inbounds i8* %data_out, i64 199, !dbg !413
  store i8 %122, i8* %123, align 1, !dbg !413, !tbaa !144
  %124 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 12), align 16, !dbg !413, !tbaa !117
  %125 = trunc i32 %124 to i8, !dbg !413
  %126 = getelementptr inbounds i8* %data_out, i64 200, !dbg !413
  store i8 %125, i8* %126, align 1, !dbg !413, !tbaa !144
  %127 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 13), align 4, !dbg !413, !tbaa !117
  %128 = trunc i32 %127 to i8, !dbg !413
  %129 = getelementptr inbounds i8* %data_out, i64 201, !dbg !413
  store i8 %128, i8* %129, align 1, !dbg !413, !tbaa !144
  %130 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 14), align 8, !dbg !413, !tbaa !117
  %131 = trunc i32 %130 to i8, !dbg !413
  %132 = getelementptr inbounds i8* %data_out, i64 202, !dbg !413
  store i8 %131, i8* %132, align 1, !dbg !413, !tbaa !144
  %133 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !413, !tbaa !117
  %134 = trunc i32 %133 to i8, !dbg !413
  %135 = getelementptr inbounds i8* %data_out, i64 203, !dbg !413
  store i8 %134, i8* %135, align 1, !dbg !413, !tbaa !144
  ret void, !dbg !416

encode_rs.exit:                                   ; preds = %vector.body18, %vector.memcheck28, %encode_rs.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %encode_rs.exit ], [ 0, %vector.memcheck28 ], [ 160, %vector.body18 ]
  %136 = getelementptr inbounds i8* %data_in, i64 %indvars.iv, !dbg !410
  %137 = load i8* %136, align 1, !dbg !410, !tbaa !144
  %138 = getelementptr inbounds i8* %data_out, i64 %indvars.iv, !dbg !410
  store i8 %137, i8* %138, align 1, !dbg !410, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !408
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !408
  br i1 %exitcond, label %.preheader, label %encode_rs.exit, !dbg !408, !llvm.loop !417
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %rs_in = alloca [204 x i8], align 16
  %rs_out = alloca [204 x i8], align 16
  %1 = getelementptr inbounds [204 x i8]* %rs_in, i64 0, i64 0, !dbg !418
  call void @llvm.lifetime.start(i64 204, i8* %1) #2, !dbg !418
  tail call void @llvm.dbg.declare(metadata !{[204 x i8]* %rs_in}, metadata !24), !dbg !418
  %2 = getelementptr inbounds [204 x i8]* %rs_out, i64 0, i64 0, !dbg !418
  call void @llvm.lifetime.start(i64 204, i8* %2) #2, !dbg !418
  tail call void @llvm.dbg.declare(metadata !{[204 x i8]* %rs_out}, metadata !28), !dbg !418
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !29), !dbg !419
  br label %.preheader, !dbg !419

.preheader:                                       ; preds = %._crit_edge, %0
  %i.03 = phi i32 [ 0, %0 ], [ %19, %._crit_edge ]
  br label %3, !dbg !421

; <label>:3                                       ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = tail call i32 (...)* @random() #2, !dbg !424
  %5 = trunc i32 %4 to i8, !dbg !424
  %6 = getelementptr inbounds [204 x i8]* %rs_in, i64 0, i64 %indvars.iv, !dbg !424
  store i8 %5, i8* %6, align 1, !dbg !424, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !421
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !421
  br i1 %exitcond, label %7, label %3, !dbg !421

; <label>:7                                       ; preds = %3
  call void @rsenc_204(i8* %2, i8* %1), !dbg !426
  %8 = tail call i32 (...)* @random() #2, !dbg !427
  %9 = and i32 %8, 127, !dbg !427
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !31), !dbg !427
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !30), !dbg !428
  %10 = icmp eq i32 %9, 0, !dbg !428
  br i1 %10, label %._crit_edge, label %.lr.ph, !dbg !428

.lr.ph:                                           ; preds = %7, %.lr.ph
  %j.12 = phi i32 [ %17, %.lr.ph ], [ 0, %7 ]
  %11 = tail call i32 (...)* @random() #2, !dbg !430
  %12 = trunc i32 %11 to i8, !dbg !430
  %13 = tail call i32 (...)* @random() #2, !dbg !430
  %14 = srem i32 %13, 204, !dbg !430
  %15 = sext i32 %14 to i64, !dbg !430
  %16 = getelementptr inbounds [204 x i8]* %rs_out, i64 0, i64 %15, !dbg !430
  store i8 %12, i8* %16, align 1, !dbg !430, !tbaa !144
  %17 = add nsw i32 %j.12, 1, !dbg !428
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !30), !dbg !428
  %18 = icmp slt i32 %17, %9, !dbg !428
  br i1 %18, label %.lr.ph, label %._crit_edge, !dbg !428

._crit_edge:                                      ; preds = %.lr.ph, %7
  call void @rsdec_204(i8* %1, i8* %2), !dbg !432
  %19 = add nsw i32 %i.03, 1, !dbg !419
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !29), !dbg !419
  %exitcond4 = icmp eq i32 %19, 150000, !dbg !419
  br i1 %exitcond4, label %20, label %.preheader, !dbg !419

; <label>:20                                      ; preds = %._crit_edge
  call void @llvm.lifetime.end(i64 204, i8* %2) #2, !dbg !433
  call void @llvm.lifetime.end(i64 204, i8* %1) #2, !dbg !433
  ret i32 0, !dbg !434
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

declare i32 @random(...) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define internal fastcc void @gen_poly() #0 {
  store i32 2, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !435, !tbaa !117
  store i32 1, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 1), align 4, !dbg !436, !tbaa !117
  tail call void @llvm.dbg.value(metadata !437, i64 0, metadata !77), !dbg !438
  br label %.lr.ph, !dbg !438

.lr.ph:                                           ; preds = %0, %._crit_edge
  %indvars.iv14 = phi i64 [ 2, %0 ], [ %indvars.iv.next15, %._crit_edge ]
  %indvars.iv6 = phi i64 [ 1, %0 ], [ %indvars.iv.next7, %._crit_edge ]
  %1 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv14, !dbg !440
  store i32 1, i32* %1, align 4, !dbg !440, !tbaa !117
  br label %2, !dbg !442

; <label>:2                                       ; preds = %.lr.ph, %20
  %indvars.iv12 = phi i64 [ %indvars.iv14, %.lr.ph ], [ %indvars.iv.next13, %20 ]
  %indvars.iv8 = phi i64 [ %indvars.iv6, %.lr.ph ], [ %indvars.iv.next9, %20 ]
  %3 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv8, !dbg !444
  %4 = load i32* %3, align 4, !dbg !444, !tbaa !117
  %5 = icmp eq i32 %4, 0, !dbg !444
  %6 = add nsw i64 %indvars.iv12, -2, !dbg !444
  %7 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %6, !dbg !444
  %8 = load i32* %7, align 4, !dbg !444, !tbaa !117
  br i1 %5, label %20, label %9, !dbg !444

; <label>:9                                       ; preds = %2
  %10 = sext i32 %4 to i64, !dbg !444
  %11 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %10, !dbg !444
  %12 = load i32* %11, align 4, !dbg !444, !tbaa !117
  %13 = trunc i64 %indvars.iv14 to i32, !dbg !444
  %14 = add nsw i32 %12, %13, !dbg !444
  %15 = srem i32 %14, 255, !dbg !444
  %16 = sext i32 %15 to i64, !dbg !444
  %17 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %16, !dbg !444
  %18 = load i32* %17, align 4, !dbg !444, !tbaa !117
  %19 = xor i32 %18, %8, !dbg !444
  br label %20, !dbg !444

; <label>:20                                      ; preds = %2, %9
  %storemerge = phi i32 [ %19, %9 ], [ %8, %2 ]
  store i32 %storemerge, i32* %3, align 4, !dbg !444, !tbaa !117
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1, !dbg !442
  %21 = trunc i64 %indvars.iv.next9 to i32, !dbg !442
  %22 = icmp sgt i32 %21, 0, !dbg !442
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, -1, !dbg !442
  br i1 %22, label %2, label %._crit_edge, !dbg !442

._crit_edge:                                      ; preds = %20
  %23 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !446, !tbaa !117
  %24 = sext i32 %23 to i64, !dbg !446
  %25 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %24, !dbg !446
  %26 = load i32* %25, align 4, !dbg !446, !tbaa !117
  %27 = trunc i64 %indvars.iv14 to i32, !dbg !446
  %28 = add nsw i32 %26, %27, !dbg !446
  %29 = srem i32 %28, 255, !dbg !446
  %30 = sext i32 %29 to i64, !dbg !446
  %31 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %30, !dbg !446
  %32 = load i32* %31, align 4, !dbg !446, !tbaa !117
  store i32 %32, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !446, !tbaa !117
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !438
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !438
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 17, !dbg !438
  br i1 %exitcond17, label %.preheader, label %.lr.ph, !dbg !438

.preheader:                                       ; preds = %._crit_edge, %._crit_edge19
  %33 = phi i32 [ %.pre, %._crit_edge19 ], [ %32, %._crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge19 ], [ 0, %._crit_edge ]
  %34 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv, !dbg !447
  %35 = sext i32 %33 to i64, !dbg !447
  %36 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %35, !dbg !447
  %37 = load i32* %36, align 4, !dbg !447, !tbaa !117
  store i32 %37, i32* %34, align 4, !dbg !447, !tbaa !117
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !447
  %exitcond = icmp eq i64 %indvars.iv.next, 17, !dbg !447
  br i1 %exitcond, label %38, label %._crit_edge19, !dbg !447

._crit_edge19:                                    ; preds = %.preheader
  %.phi.trans.insert = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.next
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !447, !tbaa !117
  br label %.preheader, !dbg !447

; <label>:38                                      ; preds = %.preheader
  ret void, !dbg !449
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
!79 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"generate_gf", metadata !"generate_gf", metadata !"", i32 61, metadata !33, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !80, i32 67} ; [ DW_TAG_subprogram ] [line 61] [local] [def] [scope 67] [generate_gf]
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
!106 = metadata !{i32 1}
!107 = metadata !{i32 786688, metadata !79, metadata !"mask", metadata !5, i32 68, metadata !14, i32 0, metadata !108} ; [ DW_TAG_auto_variable ] [mask] [line 68]
!108 = metadata !{i32 350, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !105, i32 348, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!110 = metadata !{i32 70, i32 0, metadata !79, metadata !108}
!111 = metadata !{i32 0}
!112 = metadata !{i32 786688, metadata !79, metadata !"i", metadata !5, i32 68, metadata !14, i32 0, metadata !108} ; [ DW_TAG_auto_variable ] [i] [line 68]
!113 = metadata !{i32 72, i32 0, metadata !114, metadata !108}
!114 = metadata !{i32 786443, metadata !1, metadata !79, i32 72, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!115 = metadata !{i32 73, i32 0, metadata !116, metadata !108}
!116 = metadata !{i32 786443, metadata !1, metadata !114, i32 73, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!117 = metadata !{metadata !118, metadata !118, i64 0}
!118 = metadata !{metadata !"int", metadata !119, i64 0}
!119 = metadata !{metadata !"omnipotent char", metadata !120, i64 0}
!120 = metadata !{metadata !"Simple C/C++ TBAA"}
!121 = metadata !{i32 74, i32 0, metadata !116, metadata !108}
!122 = metadata !{i32 256}
!123 = metadata !{i32 77, i32 0, metadata !116, metadata !108}
!124 = metadata !{i32 76, i32 0, metadata !125, metadata !108}
!125 = metadata !{i32 786443, metadata !1, metadata !116, i32 75, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!126 = metadata !{i32 79, i32 0, metadata !79, metadata !108}
!127 = metadata !{i32 128}
!128 = metadata !{i32 80, i32 0, metadata !79, metadata !108}
!129 = metadata !{i32 9}
!130 = metadata !{i32 81, i32 0, metadata !131, metadata !108}
!131 = metadata !{i32 786443, metadata !1, metadata !79, i32 81, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!132 = metadata !{i32 82, i32 0, metadata !133, metadata !108}
!133 = metadata !{i32 786443, metadata !1, metadata !134, i32 82, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!134 = metadata !{i32 786443, metadata !1, metadata !131, i32 82, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!135 = metadata !{i32 83, i32 0, metadata !133, metadata !108}
!136 = metadata !{i32 84, i32 0, metadata !133, metadata !108}
!137 = metadata !{i32 85, i32 0, metadata !134, metadata !108}
!138 = metadata !{i32 87, i32 0, metadata !79, metadata !108}
!139 = metadata !{i32 352, i32 0, metadata !109, null}
!140 = metadata !{i32 355, i32 0, metadata !109, null}
!141 = metadata !{i32 361, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !143, i32 360, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!143 = metadata !{i32 786443, metadata !1, metadata !4, i32 360, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!144 = metadata !{metadata !119, metadata !119, i64 0}
!145 = metadata !{i32 365, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !147, i32 364, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!147 = metadata !{i32 786443, metadata !1, metadata !4, i32 364, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!148 = metadata !{i32 368, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !4, i32 368, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!150 = metadata !{i32 369, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !149, i32 368, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!152 = metadata !{metadata !152, metadata !153, metadata !154}
!153 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!154 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!155 = metadata !{metadata !155, metadata !153, metadata !154}
!156 = metadata !{i32 372, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !4, i32 372, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!158 = metadata !{i32 373, i32 0, metadata !157, null}
!159 = metadata !{metadata !159, metadata !153, metadata !154}
!160 = metadata !{metadata !160, metadata !153, metadata !154}
!161 = metadata !{i32 165, i32 0, metadata !39, metadata !162}
!162 = metadata !{i32 376, i32 0, metadata !4, null}
!163 = metadata !{i32 786688, metadata !39, metadata !"count", metadata !5, i32 166, metadata !14, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [count] [line 166]
!164 = metadata !{i32 166, i32 0, metadata !39, metadata !162}
!165 = metadata !{i32 786688, metadata !39, metadata !"syn_error", metadata !5, i32 166, metadata !14, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [syn_error] [line 166]
!166 = metadata !{i32 786688, metadata !39, metadata !"i", metadata !5, i32 164, metadata !14, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [i] [line 164]
!167 = metadata !{i32 169, i32 0, metadata !168, metadata !162}
!168 = metadata !{i32 786443, metadata !1, metadata !39, i32 169, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!169 = metadata !{i32 170, i32 0, metadata !170, metadata !162}
!170 = metadata !{i32 786443, metadata !1, metadata !168, i32 170, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!171 = metadata !{i32 786688, metadata !39, metadata !"j", metadata !5, i32 164, metadata !14, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [j] [line 164]
!172 = metadata !{i32 171, i32 0, metadata !173, metadata !162}
!173 = metadata !{i32 786443, metadata !1, metadata !170, i32 171, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!174 = metadata !{i32 172, i32 0, metadata !175, metadata !162}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 172, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!176 = metadata !{i32 173, i32 0, metadata !175, metadata !162}
!177 = metadata !{i32 175, i32 0, metadata !178, metadata !162}
!178 = metadata !{i32 786443, metadata !1, metadata !170, i32 175, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!179 = metadata !{i32 176, i32 0, metadata !170, metadata !162}
!180 = metadata !{i32 179, i32 0, metadata !181, metadata !162}
!181 = metadata !{i32 786443, metadata !1, metadata !39, i32 179, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!182 = metadata !{i32 190, i32 0, metadata !183, metadata !162}
!183 = metadata !{i32 786443, metadata !1, metadata !181, i32 180, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!184 = metadata !{i32 191, i32 0, metadata !183, metadata !162}
!185 = metadata !{i32 192, i32 0, metadata !183, metadata !162}
!186 = metadata !{i32 193, i32 0, metadata !183, metadata !162}
!187 = metadata !{i32 194, i32 0, metadata !188, metadata !162}
!188 = metadata !{i32 786443, metadata !1, metadata !183, i32 194, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!189 = metadata !{i32 195, i32 0, metadata !190, metadata !162}
!190 = metadata !{i32 786443, metadata !1, metadata !188, i32 195, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!191 = metadata !{i32 196, i32 0, metadata !190, metadata !162}
!192 = metadata !{i32 198, i32 0, metadata !183, metadata !162}
!193 = metadata !{i32 199, i32 0, metadata !183, metadata !162}
!194 = metadata !{i32 200, i32 0, metadata !183, metadata !162}
!195 = metadata !{i32 201, i32 0, metadata !183, metadata !162}
!196 = metadata !{i32 786688, metadata !39, metadata !"u", metadata !5, i32 164, metadata !14, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [u] [line 164]
!197 = metadata !{i32 202, i32 0, metadata !183, metadata !162}
!198 = metadata !{i32 204, i32 0, metadata !183, metadata !162}
!199 = metadata !{i32 206, i32 0, metadata !200, metadata !162}
!200 = metadata !{i32 786443, metadata !1, metadata !183, i32 205, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!201 = metadata !{i32 207, i32 0, metadata !202, metadata !162}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 207, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!203 = metadata !{i32 208, i32 0, metadata !204, metadata !162}
!204 = metadata !{i32 786443, metadata !1, metadata !202, i32 208, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!205 = metadata !{i32 209, i32 0, metadata !206, metadata !162}
!206 = metadata !{i32 786443, metadata !1, metadata !204, i32 209, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!207 = metadata !{i32 210, i32 0, metadata !208, metadata !162}
!208 = metadata !{i32 786443, metadata !1, metadata !206, i32 210, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!209 = metadata !{i32 211, i32 0, metadata !208, metadata !162}
!210 = metadata !{i32 217, i32 0, metadata !211, metadata !162}
!211 = metadata !{i32 786443, metadata !1, metadata !202, i32 216, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!212 = metadata !{i32 219, i32 0, metadata !213, metadata !162}
!213 = metadata !{i32 786443, metadata !1, metadata !211, i32 219, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!214 = metadata !{i32 222, i32 0, metadata !215, metadata !162}
!215 = metadata !{i32 786443, metadata !1, metadata !216, i32 222, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!216 = metadata !{i32 786443, metadata !1, metadata !213, i32 220, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!217 = metadata !{i32 225, i32 0, metadata !215, metadata !162}
!218 = metadata !{i32 223, i32 0, metadata !219, metadata !162}
!219 = metadata !{i32 786443, metadata !1, metadata !215, i32 223, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!220 = metadata !{i32 230, i32 0, metadata !221, metadata !162}
!221 = metadata !{i32 786443, metadata !1, metadata !211, i32 230, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!222 = metadata !{i32 234, i32 0, metadata !223, metadata !162}
!223 = metadata !{i32 786443, metadata !1, metadata !211, i32 234, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!224 = metadata !{i32 235, i32 0, metadata !225, metadata !162}
!225 = metadata !{i32 786443, metadata !1, metadata !211, i32 235, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!226 = metadata !{i32 237, i32 0, metadata !227, metadata !162}
!227 = metadata !{i32 786443, metadata !1, metadata !225, i32 236, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!228 = metadata !{i32 238, i32 0, metadata !229, metadata !162}
!229 = metadata !{i32 786443, metadata !1, metadata !211, i32 238, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!230 = metadata !{i32 239, i32 0, metadata !231, metadata !162}
!231 = metadata !{i32 786443, metadata !1, metadata !229, i32 239, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!232 = metadata !{i32 236, i32 0, metadata !227, metadata !162}
!233 = metadata !{i32 240, i32 0, metadata !231, metadata !162}
!234 = metadata !{i32 243, i32 0, metadata !200, metadata !162}
!235 = metadata !{i32 246, i32 0, metadata !236, metadata !162}
!236 = metadata !{i32 786443, metadata !1, metadata !200, i32 246, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!237 = metadata !{i32 248, i32 0, metadata !238, metadata !162}
!238 = metadata !{i32 786443, metadata !1, metadata !239, i32 248, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!239 = metadata !{i32 786443, metadata !1, metadata !236, i32 247, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!240 = metadata !{i32 249, i32 0, metadata !238, metadata !162}
!241 = metadata !{i32 251, i32 0, metadata !238, metadata !162}
!242 = metadata !{i32 252, i32 0, metadata !243, metadata !162}
!243 = metadata !{i32 786443, metadata !1, metadata !239, i32 252, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!244 = metadata !{i32 255, i32 0, metadata !239, metadata !162}
!245 = metadata !{i32 253, i32 0, metadata !246, metadata !162}
!246 = metadata !{i32 786443, metadata !1, metadata !243, i32 253, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!247 = metadata !{i32 254, i32 0, metadata !246, metadata !162}
!248 = metadata !{i32 257, i32 0, metadata !200, metadata !162}
!249 = metadata !{i32 260, i32 0, metadata !250, metadata !162}
!250 = metadata !{i32 786443, metadata !1, metadata !183, i32 260, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!251 = metadata !{i32 263, i32 0, metadata !252, metadata !162}
!252 = metadata !{i32 786443, metadata !1, metadata !253, i32 263, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!253 = metadata !{i32 786443, metadata !1, metadata !250, i32 261, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!254 = metadata !{metadata !254, metadata !153, metadata !154}
!255 = metadata !{i32 266, i32 0, metadata !256, metadata !162}
!256 = metadata !{i32 786443, metadata !1, metadata !253, i32 266, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!257 = metadata !{i32 267, i32 0, metadata !256, metadata !162}
!258 = metadata !{metadata !258, metadata !153, metadata !154}
!259 = metadata !{i32 269, i32 0, metadata !260, metadata !162}
!260 = metadata !{i32 786443, metadata !1, metadata !253, i32 269, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!261 = metadata !{i32 271, i32 0, metadata !262, metadata !162}
!262 = metadata !{i32 786443, metadata !1, metadata !263, i32 271, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!263 = metadata !{i32 786443, metadata !1, metadata !260, i32 270, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!264 = metadata !{i32 272, i32 0, metadata !265, metadata !162}
!265 = metadata !{i32 786443, metadata !1, metadata !262, i32 272, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!266 = metadata !{i32 273, i32 0, metadata !267, metadata !162}
!267 = metadata !{i32 786443, metadata !1, metadata !265, i32 273, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!268 = metadata !{i32 274, i32 0, metadata !267, metadata !162}
!269 = metadata !{i32 786688, metadata !39, metadata !"q", metadata !5, i32 164, metadata !14, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [q] [line 164]
!270 = metadata !{i32 275, i32 0, metadata !267, metadata !162}
!271 = metadata !{i32 276, i32 0, metadata !272, metadata !162}
!272 = metadata !{i32 786443, metadata !1, metadata !263, i32 276, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!273 = metadata !{i32 277, i32 0, metadata !274, metadata !162}
!274 = metadata !{i32 786443, metadata !1, metadata !272, i32 277, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!275 = metadata !{i32 278, i32 0, metadata !274, metadata !162}
!276 = metadata !{i32 279, i32 0, metadata !274, metadata !162}
!277 = metadata !{i32 280, i32 0, metadata !274, metadata !162}
!278 = metadata !{i32 282, i32 0, metadata !279, metadata !162}
!279 = metadata !{i32 786443, metadata !1, metadata !253, i32 282, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!280 = metadata !{i32 285, i32 0, metadata !281, metadata !162}
!281 = metadata !{i32 786443, metadata !1, metadata !282, i32 285, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!282 = metadata !{i32 786443, metadata !1, metadata !279, i32 283, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!283 = metadata !{i32 286, i32 0, metadata !284, metadata !162}
!284 = metadata !{i32 786443, metadata !1, metadata !285, i32 286, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!285 = metadata !{i32 786443, metadata !1, metadata !281, i32 286, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!286 = metadata !{i32 290, i32 0, metadata !287, metadata !162}
!287 = metadata !{i32 786443, metadata !1, metadata !288, i32 290, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!288 = metadata !{i32 786443, metadata !1, metadata !284, i32 288, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!289 = metadata !{i32 289, i32 0, metadata !288, metadata !162}
!290 = metadata !{i32 287, i32 0, metadata !284, metadata !162}
!291 = metadata !{i32 291, i32 0, metadata !287, metadata !162}
!292 = metadata !{i32 293, i32 0, metadata !287, metadata !162}
!293 = metadata !{i32 294, i32 0, metadata !294, metadata !162}
!294 = metadata !{i32 786443, metadata !1, metadata !285, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!295 = metadata !{i32 296, i32 0, metadata !296, metadata !162}
!296 = metadata !{i32 786443, metadata !1, metadata !294, i32 295, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!297 = metadata !{i32 295, i32 0, metadata !296, metadata !162}
!298 = metadata !{i32 297, i32 0, metadata !285, metadata !162}
!299 = metadata !{i32 307, i32 0, metadata !300, metadata !162}
!300 = metadata !{i32 786443, metadata !1, metadata !282, i32 307, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!301 = metadata !{i32 303, i32 0, metadata !302, metadata !162}
!302 = metadata !{i32 786443, metadata !1, metadata !303, i32 303, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!303 = metadata !{i32 786443, metadata !1, metadata !304, i32 302, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!304 = metadata !{i32 786443, metadata !1, metadata !282, i32 301, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!305 = metadata !{i32 304, i32 0, metadata !302, metadata !162}
!306 = metadata !{i32 301, i32 0, metadata !304, metadata !162}
!307 = metadata !{i32 308, i32 0, metadata !308, metadata !162}
!308 = metadata !{i32 786443, metadata !1, metadata !300, i32 308, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!309 = metadata !{i32 309, i32 0, metadata !310, metadata !162}
!310 = metadata !{i32 786443, metadata !1, metadata !308, i32 309, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!311 = metadata !{i32 311, i32 0, metadata !312, metadata !162}
!312 = metadata !{i32 786443, metadata !1, metadata !310, i32 310, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!313 = metadata !{i32 310, i32 0, metadata !312, metadata !162}
!314 = metadata !{i32 312, i32 0, metadata !315, metadata !162}
!315 = metadata !{i32 786443, metadata !1, metadata !308, i32 312, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!316 = metadata !{i32 313, i32 0, metadata !317, metadata !162}
!317 = metadata !{i32 786443, metadata !1, metadata !315, i32 313, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!318 = metadata !{i32 314, i32 0, metadata !317, metadata !162}
!319 = metadata !{i32 315, i32 0, metadata !320, metadata !162}
!320 = metadata !{i32 786443, metadata !1, metadata !317, i32 315, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!321 = metadata !{i32 317, i32 0, metadata !322, metadata !162}
!322 = metadata !{i32 786443, metadata !1, metadata !320, i32 316, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!323 = metadata !{i32 316, i32 0, metadata !322, metadata !162}
!324 = metadata !{i32 318, i32 0, metadata !317, metadata !162}
!325 = metadata !{i32 319, i32 0, metadata !317, metadata !162}
!326 = metadata !{i32 320, i32 0, metadata !317, metadata !162}
!327 = metadata !{i32 321, i32 0, metadata !317, metadata !162}
!328 = metadata !{i32 326, i32 0, metadata !329, metadata !162}
!329 = metadata !{i32 786443, metadata !1, metadata !330, i32 326, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!330 = metadata !{i32 786443, metadata !1, metadata !279, i32 325, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!331 = metadata !{i32 327, i32 0, metadata !329, metadata !162}
!332 = metadata !{i32 325, i32 0, metadata !330, metadata !162}
!333 = metadata !{i32 332, i32 0, metadata !334, metadata !162}
!334 = metadata !{i32 786443, metadata !1, metadata !335, i32 332, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!335 = metadata !{i32 786443, metadata !1, metadata !250, i32 331, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!336 = metadata !{i32 333, i32 0, metadata !334, metadata !162}
!337 = metadata !{i32 331, i32 0, metadata !335, metadata !162}
!338 = metadata !{i32 338, i32 0, metadata !339, metadata !162}
!339 = metadata !{i32 786443, metadata !1, metadata !340, i32 338, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!340 = metadata !{i32 786443, metadata !1, metadata !181, i32 337, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!341 = metadata !{i32 339, i32 0, metadata !339, metadata !162}
!342 = metadata !{i32 337, i32 0, metadata !340, metadata !162}
!343 = metadata !{i32 378, i32 0, metadata !344, null}
!344 = metadata !{i32 786443, metadata !1, metadata !4, i32 378, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!345 = metadata !{i32 379, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !344, i32 378, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!347 = metadata !{metadata !347, metadata !153, metadata !154}
!348 = metadata !{metadata !348, metadata !153, metadata !154}
!349 = metadata !{i32 381, i32 0, metadata !4, null}
!350 = metadata !{i32 383, i32 0, metadata !15, null}
!351 = metadata !{i32 387, i32 0, metadata !352, null}
!352 = metadata !{i32 786443, metadata !1, metadata !15, i32 387, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!353 = metadata !{i32 786688, metadata !79, metadata !"mask", metadata !5, i32 68, metadata !14, i32 0, metadata !354} ; [ DW_TAG_auto_variable ] [mask] [line 68]
!354 = metadata !{i32 389, i32 0, metadata !355, null}
!355 = metadata !{i32 786443, metadata !1, metadata !352, i32 387, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!356 = metadata !{i32 70, i32 0, metadata !79, metadata !354}
!357 = metadata !{i32 786688, metadata !79, metadata !"i", metadata !5, i32 68, metadata !14, i32 0, metadata !354} ; [ DW_TAG_auto_variable ] [i] [line 68]
!358 = metadata !{i32 72, i32 0, metadata !114, metadata !354}
!359 = metadata !{i32 73, i32 0, metadata !116, metadata !354}
!360 = metadata !{i32 74, i32 0, metadata !116, metadata !354}
!361 = metadata !{i32 77, i32 0, metadata !116, metadata !354}
!362 = metadata !{i32 76, i32 0, metadata !125, metadata !354}
!363 = metadata !{i32 79, i32 0, metadata !79, metadata !354}
!364 = metadata !{i32 80, i32 0, metadata !79, metadata !354}
!365 = metadata !{i32 81, i32 0, metadata !131, metadata !354}
!366 = metadata !{i32 82, i32 0, metadata !133, metadata !354}
!367 = metadata !{i32 83, i32 0, metadata !133, metadata !354}
!368 = metadata !{i32 84, i32 0, metadata !133, metadata !354}
!369 = metadata !{i32 85, i32 0, metadata !134, metadata !354}
!370 = metadata !{i32 87, i32 0, metadata !79, metadata !354}
!371 = metadata !{i32 391, i32 0, metadata !355, null}
!372 = metadata !{i32 394, i32 0, metadata !355, null}
!373 = metadata !{i32 398, i32 0, metadata !374, null}
!374 = metadata !{i32 786443, metadata !1, metadata !375, i32 397, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!375 = metadata !{i32 786443, metadata !1, metadata !15, i32 397, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!376 = metadata !{i32 401, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !15, i32 401, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!378 = metadata !{i32 402, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !377, i32 401, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!380 = metadata !{metadata !380, metadata !153, metadata !154}
!381 = metadata !{metadata !381, metadata !153, metadata !154}
!382 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !5, i32 120, metadata !14, i32 0, metadata !383} ; [ DW_TAG_auto_variable ] [i] [line 120]
!383 = metadata !{i32 405, i32 0, metadata !15, null}
!384 = metadata !{i32 123, i32 0, metadata !385, metadata !383}
!385 = metadata !{i32 786443, metadata !1, metadata !32, i32 123, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!386 = metadata !{i32 132, i32 0, metadata !387, metadata !383}
!387 = metadata !{i32 786443, metadata !1, metadata !388, i32 127, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!388 = metadata !{i32 786443, metadata !1, metadata !389, i32 126, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!389 = metadata !{i32 786443, metadata !1, metadata !390, i32 125, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!390 = metadata !{i32 786443, metadata !1, metadata !32, i32 124, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!391 = metadata !{i32 124, i32 0, metadata !390, metadata !383}
!392 = metadata !{i32 125, i32 0, metadata !389, metadata !383}
!393 = metadata !{i32 786688, metadata !32, metadata !"feedback", metadata !5, i32 121, metadata !14, i32 0, metadata !383} ; [ DW_TAG_auto_variable ] [feedback] [line 121]
!394 = metadata !{i32 126, i32 0, metadata !388, metadata !383}
!395 = metadata !{i32 15}
!396 = metadata !{i32 786688, metadata !32, metadata !"j", metadata !5, i32 120, metadata !14, i32 0, metadata !383} ; [ DW_TAG_auto_variable ] [j] [line 120]
!397 = metadata !{i32 127, i32 0, metadata !398, metadata !383}
!398 = metadata !{i32 786443, metadata !1, metadata !387, i32 127, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!399 = metadata !{i32 136, i32 0, metadata !400, metadata !383}
!400 = metadata !{i32 786443, metadata !1, metadata !401, i32 135, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!401 = metadata !{i32 786443, metadata !1, metadata !388, i32 135, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!402 = metadata !{i32 128, i32 0, metadata !403, metadata !383}
!403 = metadata !{i32 786443, metadata !1, metadata !398, i32 128, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!404 = metadata !{i32 129, i32 0, metadata !403, metadata !383}
!405 = metadata !{i32 131, i32 0, metadata !403, metadata !383}
!406 = metadata !{i32 133, i32 0, metadata !387, metadata !383}
!407 = metadata !{i32 137, i32 0, metadata !401, metadata !383}
!408 = metadata !{i32 407, i32 0, metadata !409, null}
!409 = metadata !{i32 786443, metadata !1, metadata !15, i32 407, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!410 = metadata !{i32 408, i32 0, metadata !411, null}
!411 = metadata !{i32 786443, metadata !1, metadata !409, i32 407, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!412 = metadata !{metadata !412, metadata !153, metadata !154}
!413 = metadata !{i32 411, i32 0, metadata !414, null}
!414 = metadata !{i32 786443, metadata !1, metadata !415, i32 410, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!415 = metadata !{i32 786443, metadata !1, metadata !15, i32 410, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!416 = metadata !{i32 414, i32 0, metadata !15, null}
!417 = metadata !{metadata !417, metadata !153, metadata !154}
!418 = metadata !{i32 417, i32 0, metadata !20, null}
!419 = metadata !{i32 430, i32 0, metadata !420, null}
!420 = metadata !{i32 786443, metadata !1, metadata !20, i32 430, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!421 = metadata !{i32 432, i32 0, metadata !422, null}
!422 = metadata !{i32 786443, metadata !1, metadata !423, i32 432, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!423 = metadata !{i32 786443, metadata !1, metadata !420, i32 430, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!424 = metadata !{i32 433, i32 0, metadata !425, null}
!425 = metadata !{i32 786443, metadata !1, metadata !422, i32 432, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!426 = metadata !{i32 435, i32 0, metadata !423, null}
!427 = metadata !{i32 437, i32 0, metadata !423, null}
!428 = metadata !{i32 439, i32 0, metadata !429, null}
!429 = metadata !{i32 786443, metadata !1, metadata !423, i32 439, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!430 = metadata !{i32 440, i32 0, metadata !431, null}
!431 = metadata !{i32 786443, metadata !1, metadata !429, i32 439, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!432 = metadata !{i32 443, i32 0, metadata !423, null}
!433 = metadata !{i32 445, i32 0, metadata !20, null}
!434 = metadata !{i32 446, i32 0, metadata !20, null}
!435 = metadata !{i32 98, i32 0, metadata !75, null}
!436 = metadata !{i32 99, i32 0, metadata !75, null}
!437 = metadata !{i32 2}
!438 = metadata !{i32 100, i32 0, metadata !439, null}
!439 = metadata !{i32 786443, metadata !1, metadata !75, i32 100, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!440 = metadata !{i32 101, i32 0, metadata !441, null}
!441 = metadata !{i32 786443, metadata !1, metadata !439, i32 101, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!442 = metadata !{i32 102, i32 0, metadata !443, null}
!443 = metadata !{i32 786443, metadata !1, metadata !441, i32 102, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!444 = metadata !{i32 103, i32 0, metadata !445, null}
!445 = metadata !{i32 786443, metadata !1, metadata !443, i32 103, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!446 = metadata !{i32 105, i32 0, metadata !441, null}
!447 = metadata !{i32 108, i32 0, metadata !448, null}
!448 = metadata !{i32 786443, metadata !1, metadata !75, i32 108, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!449 = metadata !{i32 109, i32 0, metadata !75, null}
