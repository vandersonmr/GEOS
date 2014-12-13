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
  br i1 %.b, label %.preheader20, label %1, !dbg !104

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
  store i32 2, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !139, !tbaa !117
  store i32 1, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 1), align 4, !dbg !141, !tbaa !117
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !143), !dbg !144
  br label %.lr.ph.i4, !dbg !144

.lr.ph.i4:                                        ; preds = %._crit_edge.i6, %generate_gf.exit
  %indvars.iv14.i = phi i64 [ 2, %generate_gf.exit ], [ %indvars.iv.next15.i, %._crit_edge.i6 ]
  %indvars.iv6.i = phi i64 [ 1, %generate_gf.exit ], [ %indvars.iv.next7.i, %._crit_edge.i6 ]
  %19 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv14.i, !dbg !146
  store i32 1, i32* %19, align 4, !dbg !146, !tbaa !117
  %20 = trunc i64 %indvars.iv14.i to i32, !dbg !148
  br label %21, !dbg !151

; <label>:21                                      ; preds = %38, %.lr.ph.i4
  %indvars.iv12.i = phi i64 [ %indvars.iv14.i, %.lr.ph.i4 ], [ %indvars.iv.next13.i, %38 ]
  %indvars.iv8.i = phi i64 [ %indvars.iv6.i, %.lr.ph.i4 ], [ %indvars.iv.next9.i, %38 ]
  %22 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv8.i, !dbg !148
  %23 = load i32* %22, align 4, !dbg !148, !tbaa !117
  %24 = icmp eq i32 %23, 0, !dbg !148
  %25 = add nsw i64 %indvars.iv12.i, -2, !dbg !148
  %26 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %25, !dbg !148
  %27 = load i32* %26, align 4, !dbg !148, !tbaa !117
  br i1 %24, label %38, label %28, !dbg !148

; <label>:28                                      ; preds = %21
  %29 = sext i32 %23 to i64, !dbg !148
  %30 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %29, !dbg !148
  %31 = load i32* %30, align 4, !dbg !148, !tbaa !117
  %32 = add nsw i32 %31, %20, !dbg !148
  %33 = srem i32 %32, 255, !dbg !148
  %34 = sext i32 %33 to i64, !dbg !148
  %35 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %34, !dbg !148
  %36 = load i32* %35, align 4, !dbg !148, !tbaa !117
  %37 = xor i32 %36, %27, !dbg !148
  br label %38, !dbg !148

; <label>:38                                      ; preds = %28, %21
  %storemerge.i5 = phi i32 [ %37, %28 ], [ %27, %21 ]
  store i32 %storemerge.i5, i32* %22, align 4, !dbg !148, !tbaa !117
  %indvars.iv.next9.i = add nsw i64 %indvars.iv8.i, -1, !dbg !151
  %39 = trunc i64 %indvars.iv.next9.i to i32, !dbg !151
  %40 = icmp sgt i32 %39, 0, !dbg !151
  %indvars.iv.next13.i = add nsw i64 %indvars.iv12.i, -1, !dbg !151
  br i1 %40, label %21, label %._crit_edge.i6, !dbg !151

._crit_edge.i6:                                   ; preds = %38
  %41 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !152, !tbaa !117
  %42 = sext i32 %41 to i64, !dbg !152
  %43 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %42, !dbg !152
  %44 = load i32* %43, align 4, !dbg !152, !tbaa !117
  %45 = add nsw i32 %44, %20, !dbg !152
  %46 = srem i32 %45, 255, !dbg !152
  %47 = sext i32 %46 to i64, !dbg !152
  %48 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %47, !dbg !152
  %49 = load i32* %48, align 4, !dbg !152, !tbaa !117
  store i32 %49, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !152, !tbaa !117
  %indvars.iv.next15.i = add nuw nsw i64 %indvars.iv14.i, 1, !dbg !144
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !144
  %exitcond17.i = icmp eq i64 %indvars.iv.next15.i, 17, !dbg !144
  br i1 %exitcond17.i, label %.preheader.i10.preheader, label %.lr.ph.i4, !dbg !144

.preheader.i10.preheader:                         ; preds = %._crit_edge.i6
  %50 = sext i32 %49 to i64, !dbg !153
  %51 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %50, !dbg !153
  %52 = load i32* %51, align 4, !dbg !153, !tbaa !117
  store i32 %52, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !153, !tbaa !117
  br label %._crit_edge19.i, !dbg !153

._crit_edge19.i:                                  ; preds = %.preheader.i10.preheader, %._crit_edge19.i
  %indvars.iv.next.i835 = phi i64 [ 1, %.preheader.i10.preheader ], [ %indvars.iv.next.i8, %._crit_edge19.i ]
  %.phi.trans.insert.i = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.next.i835
  %.pre.i11 = load i32* %.phi.trans.insert.i, align 4, !dbg !153, !tbaa !117
  %53 = sext i32 %.pre.i11 to i64, !dbg !153
  %54 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %53, !dbg !153
  %55 = load i32* %54, align 4, !dbg !153, !tbaa !117
  store i32 %55, i32* %.phi.trans.insert.i, align 4, !dbg !153, !tbaa !117
  %indvars.iv.next.i8 = add nuw nsw i64 %indvars.iv.next.i835, 1, !dbg !153
  %exitcond.i9 = icmp eq i64 %indvars.iv.next.i8, 17, !dbg !153
  br i1 %exitcond.i9, label %gen_poly.exit, label %._crit_edge19.i, !dbg !153

gen_poly.exit:                                    ; preds = %._crit_edge19.i
  store i1 true, i1* @inited, align 1
  br label %.preheader20, !dbg !155

.preheader20:                                     ; preds = %gen_poly.exit, %0
  %56 = getelementptr inbounds i8* %data_in, i64 188, !dbg !156
  %57 = load i8* %56, align 1, !dbg !156, !tbaa !159
  %58 = zext i8 %57 to i32, !dbg !156
  store i32 %58, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 0), align 16, !dbg !156, !tbaa !117
  %59 = getelementptr inbounds i8* %data_in, i64 189, !dbg !156
  %60 = load i8* %59, align 1, !dbg !156, !tbaa !159
  %61 = zext i8 %60 to i32, !dbg !156
  store i32 %61, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 1), align 4, !dbg !156, !tbaa !117
  %62 = getelementptr inbounds i8* %data_in, i64 190, !dbg !156
  %63 = load i8* %62, align 1, !dbg !156, !tbaa !159
  %64 = zext i8 %63 to i32, !dbg !156
  store i32 %64, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 2), align 8, !dbg !156, !tbaa !117
  %65 = getelementptr inbounds i8* %data_in, i64 191, !dbg !156
  %66 = load i8* %65, align 1, !dbg !156, !tbaa !159
  %67 = zext i8 %66 to i32, !dbg !156
  store i32 %67, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 3), align 4, !dbg !156, !tbaa !117
  %68 = getelementptr inbounds i8* %data_in, i64 192, !dbg !156
  %69 = load i8* %68, align 1, !dbg !156, !tbaa !159
  %70 = zext i8 %69 to i32, !dbg !156
  store i32 %70, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 4), align 16, !dbg !156, !tbaa !117
  %71 = getelementptr inbounds i8* %data_in, i64 193, !dbg !156
  %72 = load i8* %71, align 1, !dbg !156, !tbaa !159
  %73 = zext i8 %72 to i32, !dbg !156
  store i32 %73, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 5), align 4, !dbg !156, !tbaa !117
  %74 = getelementptr inbounds i8* %data_in, i64 194, !dbg !156
  %75 = load i8* %74, align 1, !dbg !156, !tbaa !159
  %76 = zext i8 %75 to i32, !dbg !156
  store i32 %76, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 6), align 8, !dbg !156, !tbaa !117
  %77 = getelementptr inbounds i8* %data_in, i64 195, !dbg !156
  %78 = load i8* %77, align 1, !dbg !156, !tbaa !159
  %79 = zext i8 %78 to i32, !dbg !156
  store i32 %79, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 7), align 4, !dbg !156, !tbaa !117
  %80 = getelementptr inbounds i8* %data_in, i64 196, !dbg !156
  %81 = load i8* %80, align 1, !dbg !156, !tbaa !159
  %82 = zext i8 %81 to i32, !dbg !156
  store i32 %82, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 8), align 16, !dbg !156, !tbaa !117
  %83 = getelementptr inbounds i8* %data_in, i64 197, !dbg !156
  %84 = load i8* %83, align 1, !dbg !156, !tbaa !159
  %85 = zext i8 %84 to i32, !dbg !156
  store i32 %85, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 9), align 4, !dbg !156, !tbaa !117
  %86 = getelementptr inbounds i8* %data_in, i64 198, !dbg !156
  %87 = load i8* %86, align 1, !dbg !156, !tbaa !159
  %88 = zext i8 %87 to i32, !dbg !156
  store i32 %88, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 10), align 8, !dbg !156, !tbaa !117
  %89 = getelementptr inbounds i8* %data_in, i64 199, !dbg !156
  %90 = load i8* %89, align 1, !dbg !156, !tbaa !159
  %91 = zext i8 %90 to i32, !dbg !156
  store i32 %91, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 11), align 4, !dbg !156, !tbaa !117
  %92 = getelementptr inbounds i8* %data_in, i64 200, !dbg !156
  %93 = load i8* %92, align 1, !dbg !156, !tbaa !159
  %94 = zext i8 %93 to i32, !dbg !156
  store i32 %94, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 12), align 16, !dbg !156, !tbaa !117
  %95 = getelementptr inbounds i8* %data_in, i64 201, !dbg !156
  %96 = load i8* %95, align 1, !dbg !156, !tbaa !159
  %97 = zext i8 %96 to i32, !dbg !156
  store i32 %97, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 13), align 4, !dbg !156, !tbaa !117
  %98 = getelementptr inbounds i8* %data_in, i64 202, !dbg !156
  %99 = load i8* %98, align 1, !dbg !156, !tbaa !159
  %100 = zext i8 %99 to i32, !dbg !156
  store i32 %100, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 14), align 8, !dbg !156, !tbaa !117
  %101 = getelementptr inbounds i8* %data_in, i64 203, !dbg !156
  %102 = load i8* %101, align 1, !dbg !156, !tbaa !159
  %103 = zext i8 %102 to i32, !dbg !156
  store i32 %103, i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 15), align 4, !dbg !156, !tbaa !117
  call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 16) to i8*), i8 0, i64 204, i32 16, i1 false), !dbg !160
  %scevgep = getelementptr i8* %data_in, i64 187
  %bound1 = icmp ule i8* %data_in, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 254) to i8*)
  %bound0 = icmp uge i8* %scevgep, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 67) to i8*)
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph, label %vector.body

vector.body:                                      ; preds = %.preheader20, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader20 ], !dbg !163
  %104 = getelementptr inbounds i8* %data_in, i64 %index, !dbg !165
  %105 = bitcast i8* %104 to <4 x i8>*, !dbg !165
  %wide.load = load <4 x i8>* %105, align 1, !dbg !165
  %.sum137 = or i64 %index, 4, !dbg !165
  %106 = getelementptr i8* %data_in, i64 %.sum137, !dbg !165
  %107 = bitcast i8* %106 to <4 x i8>*, !dbg !165
  %wide.load93 = load <4 x i8>* %107, align 1, !dbg !165
  %108 = zext <4 x i8> %wide.load to <4 x i32>, !dbg !165
  %109 = zext <4 x i8> %wide.load93 to <4 x i32>, !dbg !165
  %110 = add i64 %index, 67, !dbg !165
  %111 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %110, !dbg !165
  %112 = bitcast i32* %111 to <4 x i32>*, !dbg !165
  store <4 x i32> %108, <4 x i32>* %112, align 4, !dbg !165
  %.sum = add i64 %index, 71, !dbg !165
  %113 = getelementptr [255 x i32]* @recd, i64 0, i64 %.sum, !dbg !165
  %114 = bitcast i32* %113 to <4 x i32>*, !dbg !165
  store <4 x i32> %109, <4 x i32>* %114, align 4, !dbg !165
  %index.next = add i64 %index, 8, !dbg !163
  %115 = icmp eq i64 %index.next, 184, !dbg !163
  br i1 %115, label %scalar.ph, label %vector.body, !dbg !163, !llvm.loop !167

scalar.ph:                                        ; preds = %vector.body, %.preheader20, %scalar.ph
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %scalar.ph ], [ 0, %.preheader20 ], [ 184, %vector.body ]
  %116 = getelementptr inbounds i8* %data_in, i64 %indvars.iv69, !dbg !165
  %117 = load i8* %116, align 1, !dbg !165, !tbaa !159
  %118 = zext i8 %117 to i32, !dbg !165
  %119 = add nsw i64 %indvars.iv69, 67, !dbg !165
  %120 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %119, !dbg !165
  store i32 %118, i32* %120, align 4, !dbg !165, !tbaa !117
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1, !dbg !163
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 188, !dbg !163
  br i1 %exitcond71, label %vector.body95, label %scalar.ph, !dbg !163, !llvm.loop !170

vector.body95:                                    ; preds = %scalar.ph, %vector.body95
  %index98 = phi i64 [ %index.next102, %vector.body95 ], [ 0, %scalar.ph ], !dbg !171
  %induction104138 = or i64 %index98, 1
  %121 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %index98, !dbg !173
  %122 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %induction104138, !dbg !173
  %123 = load i32* %121, align 8, !dbg !173, !tbaa !117
  %124 = load i32* %122, align 4, !dbg !173, !tbaa !117
  %125 = sext i32 %123 to i64, !dbg !173
  %126 = sext i32 %124 to i64, !dbg !173
  %127 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %125, !dbg !173
  %128 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %126, !dbg !173
  %129 = load i32* %127, align 4, !dbg !173, !tbaa !117
  %130 = load i32* %128, align 4, !dbg !173, !tbaa !117
  store i32 %129, i32* %121, align 8, !dbg !173, !tbaa !117
  store i32 %130, i32* %122, align 4, !dbg !173, !tbaa !117
  %index.next102 = add i64 %index98, 2, !dbg !171
  %131 = icmp eq i64 %index.next102, 254, !dbg !171
  br i1 %131, label %.preheader, label %vector.body95, !dbg !171, !llvm.loop !174

.preheader:                                       ; preds = %vector.body95, %.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %.preheader ], [ 254, %vector.body95 ]
  %132 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv66, !dbg !173
  %133 = load i32* %132, align 4, !dbg !173, !tbaa !117
  %134 = sext i32 %133 to i64, !dbg !173
  %135 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %134, !dbg !173
  %136 = load i32* %135, align 4, !dbg !173, !tbaa !117
  store i32 %136, i32* %132, align 4, !dbg !173, !tbaa !117
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1, !dbg !171
  %exitcond68 = icmp eq i64 %indvars.iv.next67, 255, !dbg !171
  br i1 %exitcond68, label %137, label %.preheader, !dbg !171, !llvm.loop !175

; <label>:137                                     ; preds = %.preheader
  %138 = bitcast [8 x i32]* %root.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 32, i8* %138) #2, !dbg !176
  %139 = bitcast [8 x i32]* %loc.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 32, i8* %139) #2, !dbg !176
  %140 = bitcast [18 x [16 x i32]]* %elp.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 1152, i8* %140) #2, !dbg !176
  call void @llvm.dbg.declare(metadata !{[18 x [16 x i32]]* %elp.i}, metadata !45) #2, !dbg !176
  %141 = bitcast [18 x i32]* %d.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 72, i8* %141) #2, !dbg !176
  call void @llvm.dbg.declare(metadata !{[18 x i32]* %d.i}, metadata !50) #2, !dbg !176
  %142 = bitcast [18 x i32]* %l.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 72, i8* %142) #2, !dbg !176
  call void @llvm.dbg.declare(metadata !{[18 x i32]* %l.i}, metadata !53) #2, !dbg !176
  %143 = bitcast [18 x i32]* %u_lu.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 72, i8* %143) #2, !dbg !176
  call void @llvm.dbg.declare(metadata !{[18 x i32]* %u_lu.i}, metadata !54) #2, !dbg !176
  %144 = bitcast [17 x i32]* %s.i to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 68, i8* %144) #2, !dbg !176
  call void @llvm.dbg.declare(metadata !{[17 x i32]* %s.i}, metadata !55) #2, !dbg !176
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !178) #2, !dbg !179
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !180) #2, !dbg !179
  call void @llvm.dbg.declare(metadata !{[8 x i32]* %root.i}, metadata !61) #2, !dbg !179
  call void @llvm.dbg.declare(metadata !{[8 x i32]* %loc.i}, metadata !65) #2, !dbg !179
  %145 = bitcast [9 x i32]* %z.i to i8*, !dbg !179
  call void @llvm.lifetime.start(i64 36, i8* %145) #2, !dbg !179
  call void @llvm.dbg.declare(metadata !{[9 x i32]* %z.i}, metadata !66) #2, !dbg !179
  %146 = bitcast [9 x i32]* %reg.i to i8*, !dbg !179
  call void @llvm.lifetime.start(i64 36, i8* %146) #2, !dbg !179
  call void @llvm.dbg.declare(metadata !{[9 x i32]* %reg.i}, metadata !74) #2, !dbg !179
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !181) #2, !dbg !182
  br label %147, !dbg !182

; <label>:147                                     ; preds = %165, %137
  %indvars.iv149.i = phi i64 [ 1, %137 ], [ %indvars.iv.next150.i, %165 ]
  %syn_error.076.i = phi i32 [ 0, %137 ], [ %syn_error.0..i, %165 ]
  %148 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv149.i, !dbg !184
  store i32 0, i32* %148, align 4, !dbg !184, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !186) #2, !dbg !187
  br label %149, !dbg !187

; <label>:149                                     ; preds = %163, %147
  %150 = phi i32 [ 0, %147 ], [ %164, %163 ]
  %indvars.iv146.i = phi i64 [ 0, %147 ], [ %indvars.iv.next147.i, %163 ]
  %151 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv146.i, !dbg !189
  %152 = load i32* %151, align 4, !dbg !189, !tbaa !117
  %153 = icmp eq i32 %152, -1, !dbg !189
  br i1 %153, label %163, label %154, !dbg !189

; <label>:154                                     ; preds = %149
  %155 = mul nsw i64 %indvars.iv146.i, %indvars.iv149.i, !dbg !191
  %156 = trunc i64 %155 to i32, !dbg !191
  %157 = add nsw i32 %156, %152, !dbg !191
  %158 = srem i32 %157, 255, !dbg !191
  %159 = sext i32 %158 to i64, !dbg !191
  %160 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %159, !dbg !191
  %161 = load i32* %160, align 4, !dbg !191, !tbaa !117
  %162 = xor i32 %161, %150, !dbg !191
  store i32 %162, i32* %148, align 4, !dbg !191, !tbaa !117
  br label %163, !dbg !191

; <label>:163                                     ; preds = %154, %149
  %164 = phi i32 [ %150, %149 ], [ %162, %154 ]
  %indvars.iv.next147.i = add nuw nsw i64 %indvars.iv146.i, 1, !dbg !187
  %exitcond148.i = icmp eq i64 %indvars.iv.next147.i, 255, !dbg !187
  br i1 %exitcond148.i, label %165, label %149, !dbg !187

; <label>:165                                     ; preds = %163
  %166 = icmp eq i32 %164, 0, !dbg !192
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !180) #2, !dbg !192
  %syn_error.0..i = select i1 %166, i32 %syn_error.076.i, i32 1, !dbg !192
  %167 = sext i32 %164 to i64, !dbg !194
  %168 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %167, !dbg !194
  %169 = load i32* %168, align 4, !dbg !194, !tbaa !117
  store i32 %169, i32* %148, align 4, !dbg !194, !tbaa !117
  %indvars.iv.next150.i = add nuw nsw i64 %indvars.iv149.i, 1, !dbg !182
  %exitcond151.i = icmp eq i64 %indvars.iv.next150.i, 17, !dbg !182
  br i1 %exitcond151.i, label %170, label %147, !dbg !182

; <label>:170                                     ; preds = %165
  %171 = icmp eq i32 %syn_error.0..i, 0, !dbg !195
  br i1 %171, label %.preheader.i, label %172, !dbg !195

; <label>:172                                     ; preds = %170
  %173 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 0, !dbg !197
  store i32 0, i32* %173, align 16, !dbg !197, !tbaa !117
  %174 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 1, !dbg !199
  %175 = load i32* %174, align 4, !dbg !199, !tbaa !117
  %176 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 1, !dbg !199
  store i32 %175, i32* %176, align 4, !dbg !199, !tbaa !117
  %177 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 0, !dbg !200
  store i32 0, i32* %177, align 16, !dbg !200, !tbaa !117
  %178 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 0, !dbg !201
  store i32 1, i32* %178, align 16, !dbg !201, !tbaa !117
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !181) #2, !dbg !202
  %179 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 1, !dbg !204
  store i32 -1, i32* %179, align 4, !dbg !204, !tbaa !117
  %180 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 1, !dbg !206
  store i32 0, i32* %180, align 4, !dbg !206, !tbaa !117
  %181 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 2, !dbg !204
  store i32 -1, i32* %181, align 8, !dbg !204, !tbaa !117
  %182 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 2, !dbg !206
  store i32 0, i32* %182, align 8, !dbg !206, !tbaa !117
  %183 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 3, !dbg !204
  store i32 -1, i32* %183, align 4, !dbg !204, !tbaa !117
  %184 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 3, !dbg !206
  store i32 0, i32* %184, align 4, !dbg !206, !tbaa !117
  %185 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 4, !dbg !204
  store i32 -1, i32* %185, align 16, !dbg !204, !tbaa !117
  %186 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 4, !dbg !206
  store i32 0, i32* %186, align 16, !dbg !206, !tbaa !117
  %187 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 5, !dbg !204
  store i32 -1, i32* %187, align 4, !dbg !204, !tbaa !117
  %188 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 5, !dbg !206
  store i32 0, i32* %188, align 4, !dbg !206, !tbaa !117
  %189 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 6, !dbg !204
  store i32 -1, i32* %189, align 8, !dbg !204, !tbaa !117
  %190 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 6, !dbg !206
  store i32 0, i32* %190, align 8, !dbg !206, !tbaa !117
  %191 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 7, !dbg !204
  store i32 -1, i32* %191, align 4, !dbg !204, !tbaa !117
  %192 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 7, !dbg !206
  store i32 0, i32* %192, align 4, !dbg !206, !tbaa !117
  %193 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 8, !dbg !204
  store i32 -1, i32* %193, align 16, !dbg !204, !tbaa !117
  %194 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 8, !dbg !206
  store i32 0, i32* %194, align 16, !dbg !206, !tbaa !117
  %195 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 9, !dbg !204
  store i32 -1, i32* %195, align 4, !dbg !204, !tbaa !117
  %196 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 9, !dbg !206
  store i32 0, i32* %196, align 4, !dbg !206, !tbaa !117
  %197 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 10, !dbg !204
  store i32 -1, i32* %197, align 8, !dbg !204, !tbaa !117
  %198 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 10, !dbg !206
  store i32 0, i32* %198, align 8, !dbg !206, !tbaa !117
  %199 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 11, !dbg !204
  store i32 -1, i32* %199, align 4, !dbg !204, !tbaa !117
  %200 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 11, !dbg !206
  store i32 0, i32* %200, align 4, !dbg !206, !tbaa !117
  %201 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 12, !dbg !204
  store i32 -1, i32* %201, align 16, !dbg !204, !tbaa !117
  %202 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 12, !dbg !206
  store i32 0, i32* %202, align 16, !dbg !206, !tbaa !117
  %203 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 13, !dbg !204
  store i32 -1, i32* %203, align 4, !dbg !204, !tbaa !117
  %204 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 13, !dbg !206
  store i32 0, i32* %204, align 4, !dbg !206, !tbaa !117
  %205 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 14, !dbg !204
  store i32 -1, i32* %205, align 8, !dbg !204, !tbaa !117
  %206 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 14, !dbg !206
  store i32 0, i32* %206, align 8, !dbg !206, !tbaa !117
  %207 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 0, i64 15, !dbg !204
  store i32 -1, i32* %207, align 4, !dbg !204, !tbaa !117
  %208 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 1, i64 15, !dbg !206
  store i32 0, i32* %208, align 4, !dbg !206, !tbaa !117
  %209 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 0, !dbg !207
  store i32 0, i32* %209, align 16, !dbg !207, !tbaa !117
  %210 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 1, !dbg !208
  store i32 0, i32* %210, align 4, !dbg !208, !tbaa !117
  %211 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 0, !dbg !209
  store i32 -1, i32* %211, align 16, !dbg !209, !tbaa !117
  %212 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 1, !dbg !210
  store i32 0, i32* %212, align 4, !dbg !210, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !211) #2, !dbg !212
  br label %._crit_edge158.i, !dbg !213

._crit_edge158.i:                                 ; preds = %.preheader20._crit_edge.i.thread, %.preheader20._crit_edge.i, %172
  %213 = phi i32 [ 0, %172 ], [ %291, %.preheader20._crit_edge.i ], [ %291, %.preheader20._crit_edge.i.thread ]
  %214 = phi i32 [ %175, %172 ], [ %336, %.preheader20._crit_edge.i ], [ %311, %.preheader20._crit_edge.i.thread ]
  %indvars.iv137.i = phi i64 [ 0, %172 ], [ %indvars.iv.next138.i, %.preheader20._crit_edge.i ], [ %indvars.iv.next138.i, %.preheader20._crit_edge.i.thread ]
  %215 = add i64 %indvars.iv137.i, 2, !dbg !214
  %sext.i = shl i64 %215, 32
  %216 = ashr exact i64 %sext.i, 32
  %scevgep125.i = getelementptr [18 x [16 x i32]]* %elp.i, i64 0, i64 %216, i64 0
  %scevgep125126.i = bitcast i32* %scevgep125.i to i8*
  %indvars.iv.next138.i = add nuw nsw i64 %indvars.iv137.i, 1
  %217 = icmp eq i32 %214, -1, !dbg !216
  br i1 %217, label %218, label %.preheader28.i, !dbg !216

; <label>:218                                     ; preds = %._crit_edge158.i
  %219 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %215, !dbg !218
  store i32 %213, i32* %219, align 4, !dbg !218, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !181) #2, !dbg !220
  %220 = icmp slt i32 %213, 0, !dbg !220
  br i1 %220, label %.loopexit21.i, label %.lr.ph69.i.preheader, !dbg !220

.lr.ph69.i.preheader:                             ; preds = %218
  %221 = add i32 %213, 1, !dbg !222
  br label %.lr.ph69.i, !dbg !222

.lr.ph69.i:                                       ; preds = %.lr.ph69.i, %.lr.ph69.i.preheader
  %indvars.iv131.i = phi i64 [ %indvars.iv.next132.i, %.lr.ph69.i ], [ 0, %.lr.ph69.i.preheader ]
  %222 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %indvars.iv.next138.i, i64 %indvars.iv131.i, !dbg !222
  %223 = load i32* %222, align 4, !dbg !222, !tbaa !117
  %224 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %indvars.iv131.i, !dbg !222
  store i32 %223, i32* %224, align 4, !dbg !222, !tbaa !117
  %225 = sext i32 %223 to i64, !dbg !224
  %226 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %225, !dbg !224
  %227 = load i32* %226, align 4, !dbg !224, !tbaa !117
  store i32 %227, i32* %222, align 4, !dbg !224, !tbaa !117
  %indvars.iv.next132.i = add nuw nsw i64 %indvars.iv131.i, 1, !dbg !220
  %lftr.wideiv60 = trunc i64 %indvars.iv.next132.i to i32, !dbg !220
  %exitcond61 = icmp eq i32 %lftr.wideiv60, %221, !dbg !220
  br i1 %exitcond61, label %.loopexit21.i, label %.lr.ph69.i, !dbg !220

.preheader28.i:                                   ; preds = %._crit_edge158.i, %.preheader28.i
  %indvars.iv118.i = phi i64 [ %indvars.iv.next119.i, %.preheader28.i ], [ %indvars.iv137.i, %._crit_edge158.i ]
  %228 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %indvars.iv118.i, !dbg !225
  %229 = load i32* %228, align 4, !dbg !225, !tbaa !117
  %230 = icmp eq i32 %229, -1, !dbg !225
  %231 = trunc i64 %indvars.iv118.i to i32, !dbg !225
  %232 = icmp sgt i32 %231, 0, !dbg !225
  %..i = and i1 %230, %232, !dbg !225
  %indvars.iv.next119.i = add nsw i64 %indvars.iv118.i, -1
  br i1 %..i, label %.preheader28.i, label %233

; <label>:233                                     ; preds = %.preheader28.i
  br i1 %232, label %.preheader26.i, label %.loopexit27.i, !dbg !227

.preheader26.i:                                   ; preds = %233
  %sext189.i = shl i64 %indvars.iv118.i, 32
  %234 = ashr exact i64 %sext189.i, 32
  br label %235, !dbg !229

; <label>:235                                     ; preds = %247, %.preheader26.i
  %indvars.iv120.i = phi i64 [ %234, %.preheader26.i ], [ %indvars.iv.next121.i, %247 ]
  %q.1.i = phi i32 [ %231, %.preheader26.i ], [ %q.2.i, %247 ]
  %indvars.iv.next121.i = add nsw i64 %indvars.iv120.i, -1, !dbg !232
  %236 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %indvars.iv.next121.i, !dbg !233
  %237 = load i32* %236, align 4, !dbg !233, !tbaa !117
  %238 = icmp eq i32 %237, -1, !dbg !233
  br i1 %238, label %._crit_edge172.i, label %239, !dbg !233

._crit_edge172.i:                                 ; preds = %235
  %.pre183.i = trunc i64 %indvars.iv.next121.i to i32, !dbg !232
  br label %247, !dbg !233

; <label>:239                                     ; preds = %235
  %240 = sext i32 %q.1.i to i64, !dbg !233
  %241 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %240, !dbg !233
  %242 = load i32* %241, align 4, !dbg !233, !tbaa !117
  %243 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %indvars.iv.next121.i, !dbg !233
  %244 = load i32* %243, align 4, !dbg !233, !tbaa !117
  %245 = icmp slt i32 %242, %244, !dbg !233
  %246 = trunc i64 %indvars.iv.next121.i to i32, !dbg !233
  %.q.1.i = select i1 %245, i32 %246, i32 %q.1.i, !dbg !233
  br label %247, !dbg !233

; <label>:247                                     ; preds = %239, %._crit_edge172.i
  %.pre-phi184.i = phi i32 [ %.pre183.i, %._crit_edge172.i ], [ %246, %239 ], !dbg !232
  %q.2.i = phi i32 [ %q.1.i, %._crit_edge172.i ], [ %.q.1.i, %239 ]
  %248 = icmp sgt i32 %.pre-phi184.i, 0, !dbg !232
  br i1 %248, label %235, label %.loopexit27.i, !dbg !232

.loopexit27.i:                                    ; preds = %247, %233
  %q.3.i = phi i32 [ %231, %233 ], [ %q.2.i, %247 ]
  %249 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %indvars.iv.next138.i, !dbg !235
  %250 = sext i32 %q.3.i to i64, !dbg !235
  %251 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %250, !dbg !235
  %252 = load i32* %251, align 4, !dbg !235, !tbaa !117
  %253 = trunc i64 %indvars.iv.next138.i to i32, !dbg !235
  %254 = sub i32 %253, %q.3.i, !dbg !235
  %255 = add i32 %254, %252, !dbg !235
  %256 = icmp sgt i32 %213, %255, !dbg !235
  %257 = getelementptr inbounds [18 x i32]* %l.i, i64 0, i64 %215, !dbg !235
  %.190.i = select i1 %256, i32 %213, i32 %255, !dbg !235
  store i32 %.190.i, i32* %257, align 4, !dbg !235, !tbaa !117
  call void @llvm.memset.p0i8.i64(i8* %scevgep125126.i, i8 0, i64 64, i32 16, i1 false) #2, !dbg !237
  %258 = load i32* %251, align 4, !dbg !239, !tbaa !117
  %259 = icmp slt i32 %258, 0, !dbg !239
  br i1 %259, label %.preheader22.i, label %.lr.ph64.i, !dbg !239

.lr.ph64.i:                                       ; preds = %.loopexit27.i
  %260 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %250, !dbg !241
  %261 = add i32 %214, 255, !dbg !241
  br label %265, !dbg !239

.preheader22.i:                                   ; preds = %281, %.loopexit27.i
  %262 = load i32* %249, align 4, !dbg !243, !tbaa !117
  %263 = icmp slt i32 %262, 0, !dbg !243
  br i1 %263, label %.loopexit23.i, label %.lr.ph66.i.preheader, !dbg !243

.lr.ph66.i.preheader:                             ; preds = %.preheader22.i
  %264 = add i32 %262, 1, !dbg !245
  br label %.lr.ph66.i, !dbg !245

; <label>:265                                     ; preds = %281, %.lr.ph64.i
  %indvars.iv127.i = phi i64 [ %indvars.iv.next128.i, %281 ], [ 0, %.lr.ph64.i ]
  %266 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %250, i64 %indvars.iv127.i, !dbg !247
  %267 = load i32* %266, align 4, !dbg !247, !tbaa !117
  %268 = icmp eq i32 %267, -1, !dbg !247
  br i1 %268, label %._crit_edge171.i, label %269, !dbg !247

._crit_edge171.i:                                 ; preds = %265
  %.pre185.i = trunc i64 %indvars.iv127.i to i32, !dbg !239
  br label %281, !dbg !247

; <label>:269                                     ; preds = %265
  %270 = load i32* %260, align 4, !dbg !241, !tbaa !117
  %271 = add i32 %261, %267, !dbg !241
  %272 = sub i32 %271, %270, !dbg !241
  %273 = srem i32 %272, 255, !dbg !241
  %274 = sext i32 %273 to i64, !dbg !241
  %275 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %274, !dbg !241
  %276 = load i32* %275, align 4, !dbg !241, !tbaa !117
  %277 = trunc i64 %indvars.iv127.i to i32, !dbg !241
  %278 = add i32 %277, %254, !dbg !241
  %279 = sext i32 %278 to i64, !dbg !241
  %280 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %279, !dbg !241
  store i32 %276, i32* %280, align 4, !dbg !241, !tbaa !117
  br label %281, !dbg !241

; <label>:281                                     ; preds = %269, %._crit_edge171.i
  %.pre-phi186.i = phi i32 [ %.pre185.i, %._crit_edge171.i ], [ %277, %269 ], !dbg !239
  %indvars.iv.next128.i = add nuw nsw i64 %indvars.iv127.i, 1, !dbg !239
  %282 = icmp slt i32 %.pre-phi186.i, %258, !dbg !239
  br i1 %282, label %265, label %.preheader22.i, !dbg !239

.lr.ph66.i:                                       ; preds = %.lr.ph66.i, %.lr.ph66.i.preheader
  %indvars.iv129.i = phi i64 [ %indvars.iv.next130.i, %.lr.ph66.i ], [ 0, %.lr.ph66.i.preheader ]
  %283 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %indvars.iv.next138.i, i64 %indvars.iv129.i, !dbg !245
  %284 = load i32* %283, align 4, !dbg !245, !tbaa !117
  %285 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %indvars.iv129.i, !dbg !245
  %286 = load i32* %285, align 4, !dbg !245, !tbaa !117
  %287 = xor i32 %286, %284, !dbg !245
  store i32 %287, i32* %285, align 4, !dbg !245, !tbaa !117
  %288 = sext i32 %284 to i64, !dbg !248
  %289 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %288, !dbg !248
  %290 = load i32* %289, align 4, !dbg !248, !tbaa !117
  store i32 %290, i32* %283, align 4, !dbg !248, !tbaa !117
  %indvars.iv.next130.i = add nuw nsw i64 %indvars.iv129.i, 1, !dbg !243
  %lftr.wideiv58 = trunc i64 %indvars.iv.next130.i to i32, !dbg !243
  %exitcond59 = icmp eq i32 %lftr.wideiv58, %264, !dbg !243
  br i1 %exitcond59, label %.loopexit23.i, label %.lr.ph66.i, !dbg !243

.loopexit21.i:                                    ; preds = %.lr.ph69.i, %218
  %.pre.i = trunc i64 %indvars.iv.next138.i to i32, !dbg !249
  br label %.loopexit23.i

.loopexit23.i:                                    ; preds = %.lr.ph66.i, %.loopexit21.i, %.preheader22.i
  %.pre-phi.i = phi i32 [ %.pre.i, %.loopexit21.i ], [ %253, %.preheader22.i ], [ %253, %.lr.ph66.i ], !dbg !249
  %291 = phi i32 [ %213, %.loopexit21.i ], [ %.190.i, %.preheader22.i ], [ %.190.i, %.lr.ph66.i ]
  %292 = sub nsw i32 %.pre-phi.i, %291, !dbg !249
  %293 = getelementptr inbounds [18 x i32]* %u_lu.i, i64 0, i64 %215, !dbg !249
  store i32 %292, i32* %293, align 4, !dbg !249, !tbaa !117
  %294 = icmp slt i32 %.pre-phi.i, 16, !dbg !250
  br i1 %294, label %295, label %.critedge.i, !dbg !250

; <label>:295                                     ; preds = %.loopexit23.i
  %296 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %215, !dbg !252
  %297 = load i32* %296, align 4, !dbg !252, !tbaa !117
  %298 = icmp eq i32 %297, -1, !dbg !252
  br i1 %298, label %304, label %299, !dbg !252

; <label>:299                                     ; preds = %295
  %300 = sext i32 %297 to i64, !dbg !255
  %301 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %300, !dbg !255
  %302 = load i32* %301, align 4, !dbg !255, !tbaa !117
  %303 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %215, !dbg !255
  store i32 %302, i32* %303, align 4, !dbg !255, !tbaa !117
  br label %.preheader20.i, !dbg !255

; <label>:304                                     ; preds = %295
  %305 = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %215, !dbg !256
  store i32 0, i32* %305, align 4, !dbg !256, !tbaa !117
  br label %.preheader20.i

.preheader20.i:                                   ; preds = %304, %299
  %306 = phi i32 [ 0, %304 ], [ %302, %299 ]
  %307 = icmp slt i32 %291, 1, !dbg !257
  %.pre175.i = getelementptr inbounds [18 x i32]* %d.i, i64 0, i64 %215, !dbg !259
  br i1 %307, label %.preheader20._crit_edge.i.thread, label %.lr.ph71.i.preheader, !dbg !257

.lr.ph71.i.preheader:                             ; preds = %.preheader20.i
  %308 = add i32 %291, 1, !dbg !260
  br label %.lr.ph71.i, !dbg !260

.preheader20._crit_edge.i.thread:                 ; preds = %.preheader20.i
  %309 = sext i32 %306 to i64, !dbg !259
  %310 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %309, !dbg !259
  %311 = load i32* %310, align 4, !dbg !259, !tbaa !117
  store i32 %311, i32* %.pre175.i, align 4, !dbg !259, !tbaa !117
  br label %._crit_edge158.i

.lr.ph71.i:                                       ; preds = %332, %.lr.ph71.i.preheader
  %312 = phi i32 [ %333, %332 ], [ %306, %.lr.ph71.i.preheader ]
  %indvars.iv135.i = phi i64 [ %indvars.iv.next136.i, %332 ], [ 1, %.lr.ph71.i.preheader ]
  %313 = sub i64 %215, %indvars.iv135.i, !dbg !260
  %sext188.i = shl i64 %313, 32, !dbg !260
  %314 = ashr exact i64 %sext188.i, 32, !dbg !260
  %315 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %314, !dbg !260
  %316 = load i32* %315, align 4, !dbg !260, !tbaa !117
  %317 = icmp eq i32 %316, -1, !dbg !260
  br i1 %317, label %332, label %318, !dbg !260

; <label>:318                                     ; preds = %.lr.ph71.i
  %319 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %indvars.iv135.i, !dbg !260
  %320 = load i32* %319, align 4, !dbg !260, !tbaa !117
  %321 = icmp eq i32 %320, 0, !dbg !260
  br i1 %321, label %332, label %322, !dbg !260

; <label>:322                                     ; preds = %318
  %323 = sext i32 %320 to i64, !dbg !262
  %324 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %323, !dbg !262
  %325 = load i32* %324, align 4, !dbg !262, !tbaa !117
  %326 = add nsw i32 %325, %316, !dbg !262
  %327 = srem i32 %326, 255, !dbg !262
  %328 = sext i32 %327 to i64, !dbg !262
  %329 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %328, !dbg !262
  %330 = load i32* %329, align 4, !dbg !262, !tbaa !117
  %331 = xor i32 %330, %312, !dbg !262
  store i32 %331, i32* %.pre175.i, align 4, !dbg !262, !tbaa !117
  br label %332, !dbg !262

; <label>:332                                     ; preds = %322, %318, %.lr.ph71.i
  %333 = phi i32 [ %312, %318 ], [ %312, %.lr.ph71.i ], [ %331, %322 ]
  %indvars.iv.next136.i = add nuw nsw i64 %indvars.iv135.i, 1, !dbg !257
  %lftr.wideiv63 = trunc i64 %indvars.iv.next136.i to i32, !dbg !257
  %exitcond64 = icmp eq i32 %lftr.wideiv63, %308, !dbg !257
  br i1 %exitcond64, label %.preheader20._crit_edge.i, label %.lr.ph71.i, !dbg !257

.preheader20._crit_edge.i:                        ; preds = %332
  %334 = sext i32 %333 to i64, !dbg !259
  %335 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %334, !dbg !259
  %336 = load i32* %335, align 4, !dbg !259, !tbaa !117
  store i32 %336, i32* %.pre175.i, align 4, !dbg !259, !tbaa !117
  %337 = icmp slt i32 %291, 9, !dbg !263
  br i1 %337, label %._crit_edge158.i, label %.critedge.thread.preheader.i

.critedge.i:                                      ; preds = %.loopexit23.i
  %338 = icmp slt i32 %291, 9, !dbg !264
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !181) #2, !dbg !266
  br i1 %338, label %.preheader19.i, label %.critedge.thread.preheader.i, !dbg !264

.preheader19.i:                                   ; preds = %.critedge.i
  %339 = icmp slt i32 %291, 0, !dbg !266
  br i1 %339, label %.preheader17.i, label %.lr.ph61.i.preheader, !dbg !266

.lr.ph61.i.preheader:                             ; preds = %.preheader19.i
  %340 = add i32 %291, 1, !dbg !266
  %341 = zext i32 %291 to i64
  %342 = add i64 %341, 1, !dbg !266
  %end.idx = add i64 %341, 1, !dbg !266
  %n.vec = and i64 %342, 8589934590, !dbg !266
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !266
  br i1 %cmp.zero, label %middle.block107, label %vector.body106

vector.body106:                                   ; preds = %.lr.ph61.i.preheader, %vector.body106
  %index109 = phi i64 [ %index.next113, %vector.body106 ], [ 0, %.lr.ph61.i.preheader ], !dbg !266
  %induction115142 = or i64 %index109, 1
  %343 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %index109, !dbg !266
  %344 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %induction115142, !dbg !266
  %345 = load i32* %343, align 8, !dbg !266, !tbaa !117
  %346 = load i32* %344, align 4, !dbg !266, !tbaa !117
  %347 = sext i32 %345 to i64, !dbg !266
  %348 = sext i32 %346 to i64, !dbg !266
  %349 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %347, !dbg !266
  %350 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %348, !dbg !266
  %351 = load i32* %349, align 4, !dbg !266, !tbaa !117
  %352 = load i32* %350, align 4, !dbg !266, !tbaa !117
  store i32 %351, i32* %343, align 8, !dbg !266, !tbaa !117
  store i32 %352, i32* %344, align 4, !dbg !266, !tbaa !117
  %index.next113 = add i64 %index109, 2, !dbg !266
  %353 = icmp eq i64 %index.next113, %n.vec, !dbg !266
  br i1 %353, label %middle.block107, label %vector.body106, !dbg !266, !llvm.loop !269

middle.block107:                                  ; preds = %vector.body106, %.lr.ph61.i.preheader
  %resume.val110 = phi i64 [ 0, %.lr.ph61.i.preheader ], [ %n.vec, %vector.body106 ]
  %cmp.n112 = icmp eq i64 %end.idx, %resume.val110
  br i1 %cmp.n112, label %.preheader18.i, label %.lr.ph61.i

.preheader18.i:                                   ; preds = %middle.block107, %.lr.ph61.i
  %354 = icmp slt i32 %291, 1, !dbg !270
  br i1 %354, label %.preheader17.i, label %.lr.ph59.i, !dbg !270

.lr.ph59.i:                                       ; preds = %.preheader18.i
  %scevgep.i = getelementptr [9 x i32]* %reg.i, i64 0, i64 1
  %scevgep111.i = bitcast i32* %scevgep.i to i8*
  %scevgep112.i = getelementptr [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 1
  %scevgep112113.i = bitcast i32* %scevgep112.i to i8*
  %355 = icmp sgt i32 %291, 1
  %.op.i = add i32 %291, -1, !dbg !270
  %356 = zext i32 %.op.i to i64
  %.op187.i = shl nuw nsw i64 %356, 2, !dbg !270
  %.op187.op.i = add i64 %.op187.i, 4, !dbg !270
  %357 = select i1 %355, i64 %.op187.op.i, i64 4, !dbg !270
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep111.i, i8* %scevgep112113.i, i64 %357, i32 4, i1 false) #2, !dbg !272
  br label %.preheader17.i, !dbg !270

.lr.ph61.i:                                       ; preds = %middle.block107, %.lr.ph61.i
  %indvars.iv114.i = phi i64 [ %indvars.iv.next115.i, %.lr.ph61.i ], [ %resume.val110, %middle.block107 ]
  %358 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %indvars.iv114.i, !dbg !266
  %359 = load i32* %358, align 4, !dbg !266, !tbaa !117
  %360 = sext i32 %359 to i64, !dbg !266
  %361 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %360, !dbg !266
  %362 = load i32* %361, align 4, !dbg !266, !tbaa !117
  store i32 %362, i32* %358, align 4, !dbg !266, !tbaa !117
  %indvars.iv.next115.i = add nuw nsw i64 %indvars.iv114.i, 1, !dbg !266
  %lftr.wideiv56 = trunc i64 %indvars.iv.next115.i to i32, !dbg !266
  %exitcond57 = icmp eq i32 %lftr.wideiv56, %340, !dbg !266
  br i1 %exitcond57, label %.preheader18.i, label %.lr.ph61.i, !dbg !266, !llvm.loop !273

.preheader17.i:                                   ; preds = %.lr.ph59.i, %.preheader18.i, %.preheader19.i
  %363 = phi i1 [ false, %.lr.ph59.i ], [ true, %.preheader18.i ], [ true, %.preheader19.i ]
  br label %.preheader16.i, !dbg !274

.preheader16.i:                                   ; preds = %._crit_edge54.thread.i, %.preheader17.i
  %count.057.i = phi i32 [ 0, %.preheader17.i ], [ %count.1.i, %._crit_edge54.thread.i ]
  %i.956.i = phi i32 [ 1, %.preheader17.i ], [ %382, %._crit_edge54.thread.i ]
  br i1 %363, label %._crit_edge54.thread.i, label %.lr.ph53.i, !dbg !276

.lr.ph53.i:                                       ; preds = %.preheader16.i, %._crit_edge173.i
  %indvars.iv106.i = phi i64 [ %indvars.iv.next107.i, %._crit_edge173.i ], [ 1, %.preheader16.i ]
  %q.452.i = phi i32 [ %q.5.i, %._crit_edge173.i ], [ 1, %.preheader16.i ]
  %364 = getelementptr inbounds [9 x i32]* %reg.i, i64 0, i64 %indvars.iv106.i, !dbg !279
  %365 = load i32* %364, align 4, !dbg !279, !tbaa !117
  %366 = icmp eq i32 %365, -1, !dbg !279
  %.pre181.i = trunc i64 %indvars.iv106.i to i32, !dbg !276
  br i1 %366, label %._crit_edge173.i, label %367, !dbg !279

; <label>:367                                     ; preds = %.lr.ph53.i
  %368 = add nsw i32 %365, %.pre181.i, !dbg !281
  %369 = srem i32 %368, 255, !dbg !281
  store i32 %369, i32* %364, align 4, !dbg !281, !tbaa !117
  %370 = sext i32 %369 to i64, !dbg !283
  %371 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %370, !dbg !283
  %372 = load i32* %371, align 4, !dbg !283, !tbaa !117
  %373 = xor i32 %372, %q.452.i, !dbg !283
  call void @llvm.dbg.value(metadata !{i32 %373}, i64 0, metadata !284) #2, !dbg !283
  br label %._crit_edge173.i, !dbg !285

._crit_edge173.i:                                 ; preds = %367, %.lr.ph53.i
  %q.5.i = phi i32 [ %373, %367 ], [ %q.452.i, %.lr.ph53.i ]
  %indvars.iv.next107.i = add nuw nsw i64 %indvars.iv106.i, 1, !dbg !276
  %374 = icmp slt i32 %.pre181.i, %291, !dbg !276
  br i1 %374, label %.lr.ph53.i, label %._crit_edge54.i, !dbg !276

._crit_edge54.i:                                  ; preds = %._crit_edge173.i
  %375 = icmp eq i32 %q.5.i, 0, !dbg !286
  br i1 %375, label %376, label %._crit_edge54.thread.i, !dbg !286

; <label>:376                                     ; preds = %._crit_edge54.i
  %377 = sext i32 %count.057.i to i64, !dbg !288
  %378 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %377, !dbg !288
  store i32 %i.956.i, i32* %378, align 4, !dbg !288, !tbaa !117
  %379 = sub nsw i32 255, %i.956.i, !dbg !290
  %380 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %377, !dbg !290
  store i32 %379, i32* %380, align 4, !dbg !290, !tbaa !117
  %381 = add nsw i32 %count.057.i, 1, !dbg !291
  call void @llvm.dbg.value(metadata !{i32 %381}, i64 0, metadata !178) #2, !dbg !291
  br label %._crit_edge54.thread.i, !dbg !292

._crit_edge54.thread.i:                           ; preds = %376, %._crit_edge54.i, %.preheader16.i
  %count.1.i = phi i32 [ %count.057.i, %._crit_edge54.i ], [ %381, %376 ], [ %count.057.i, %.preheader16.i ]
  %382 = add nsw i32 %i.956.i, 1, !dbg !274
  call void @llvm.dbg.value(metadata !{i32 %382}, i64 0, metadata !181) #2, !dbg !274
  %exitcond108.i = icmp eq i32 %382, 256, !dbg !274
  br i1 %exitcond108.i, label %383, label %.preheader16.i, !dbg !274

; <label>:383                                     ; preds = %._crit_edge54.thread.i
  %384 = icmp eq i32 %count.1.i, %291, !dbg !293
  br i1 %384, label %.preheader13.i, label %.preheader14.i, !dbg !293

.preheader13.i:                                   ; preds = %383
  br i1 %363, label %.preheader11.i, label %.lr.ph49.i, !dbg !295

.lr.ph49.i:                                       ; preds = %.preheader13.i, %._crit_edge164.i
  %indvars.iv52 = phi i32 [ %indvars.iv.next53, %._crit_edge164.i ], [ 1, %.preheader13.i ]
  %.pr4.i = phi i32 [ %.pre166.i, %._crit_edge164.i ], [ %175, %.preheader13.i ]
  %indvars.iv101.i = phi i64 [ %indvars.iv.next102.i, %._crit_edge164.i ], [ 1, %.preheader13.i ]
  %385 = icmp eq i32 %.pr4.i, -1, !dbg !298
  %.phi.trans.insert167.i = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %indvars.iv101.i
  %.pre168.i = load i32* %.phi.trans.insert167.i, align 4, !dbg !301, !tbaa !117
  %386 = icmp eq i32 %.pre168.i, -1, !dbg !301
  br i1 %385, label %.thread6.i, label %387, !dbg !298

; <label>:387                                     ; preds = %.lr.ph49.i
  %388 = sext i32 %.pr4.i to i64, !dbg !304
  %389 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %388, !dbg !304
  %390 = load i32* %389, align 4, !dbg !304, !tbaa !117
  br i1 %386, label %397, label %391, !dbg !298

; <label>:391                                     ; preds = %387
  %392 = sext i32 %.pre168.i to i64, !dbg !305
  %393 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %392, !dbg !305
  %394 = load i32* %393, align 4, !dbg !305, !tbaa !117
  %395 = xor i32 %394, %390, !dbg !305
  %396 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv101.i, !dbg !305
  store i32 %395, i32* %396, align 4, !dbg !305, !tbaa !117
  br label %.preheader12.i, !dbg !305

; <label>:397                                     ; preds = %387
  %398 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv101.i, !dbg !304
  store i32 %390, i32* %398, align 4, !dbg !304, !tbaa !117
  br label %.preheader12.i, !dbg !304

.thread6.i:                                       ; preds = %.lr.ph49.i
  br i1 %386, label %404, label %399, !dbg !301

; <label>:399                                     ; preds = %.thread6.i
  %400 = sext i32 %.pre168.i to i64, !dbg !306
  %401 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %400, !dbg !306
  %402 = load i32* %401, align 4, !dbg !306, !tbaa !117
  %403 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv101.i, !dbg !306
  store i32 %402, i32* %403, align 4, !dbg !306, !tbaa !117
  br label %.preheader12.i, !dbg !306

; <label>:404                                     ; preds = %.thread6.i
  %405 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv101.i, !dbg !307
  store i32 0, i32* %405, align 4, !dbg !307, !tbaa !117
  br label %.preheader12.i

.preheader12.i:                                   ; preds = %404, %399, %397, %391
  %406 = phi i32 [ %390, %397 ], [ 0, %404 ], [ %402, %399 ], [ %395, %391 ]
  %407 = trunc i64 %indvars.iv101.i to i32, !dbg !308
  %408 = icmp sgt i32 %407, 1, !dbg !308
  %409 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv101.i, !dbg !310
  br i1 %408, label %.lr.ph45.i, label %._crit_edge46.i, !dbg !308

.lr.ph45.i:                                       ; preds = %.preheader12.i, %426
  %410 = phi i32 [ %427, %426 ], [ %406, %.preheader12.i ]
  %indvars.iv95.i = phi i64 [ %indvars.iv.next96.i, %426 ], [ 1, %.preheader12.i ]
  %411 = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv95.i, !dbg !312
  %412 = load i32* %411, align 4, !dbg !312, !tbaa !117
  %413 = icmp eq i32 %412, -1, !dbg !312
  br i1 %413, label %426, label %414, !dbg !312

; <label>:414                                     ; preds = %.lr.ph45.i
  %415 = sub nsw i64 %indvars.iv101.i, %indvars.iv95.i, !dbg !312
  %416 = getelementptr inbounds [18 x [16 x i32]]* %elp.i, i64 0, i64 %215, i64 %415, !dbg !312
  %417 = load i32* %416, align 4, !dbg !312, !tbaa !117
  %418 = icmp eq i32 %417, -1, !dbg !312
  br i1 %418, label %426, label %419, !dbg !312

; <label>:419                                     ; preds = %414
  %420 = add nsw i32 %417, %412, !dbg !310
  %421 = srem i32 %420, 255, !dbg !310
  %422 = sext i32 %421 to i64, !dbg !310
  %423 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %422, !dbg !310
  %424 = load i32* %423, align 4, !dbg !310, !tbaa !117
  %425 = xor i32 %424, %410, !dbg !310
  store i32 %425, i32* %409, align 4, !dbg !310, !tbaa !117
  br label %426, !dbg !310

; <label>:426                                     ; preds = %419, %414, %.lr.ph45.i
  %427 = phi i32 [ %410, %414 ], [ %410, %.lr.ph45.i ], [ %425, %419 ]
  %indvars.iv.next96.i = add nuw nsw i64 %indvars.iv95.i, 1, !dbg !308
  %lftr.wideiv54 = trunc i64 %indvars.iv.next96.i to i32, !dbg !308
  %exitcond55 = icmp eq i32 %lftr.wideiv54, %indvars.iv52, !dbg !308
  br i1 %exitcond55, label %._crit_edge46.i, label %.lr.ph45.i, !dbg !308

._crit_edge46.i:                                  ; preds = %426, %.preheader12.i
  %428 = phi i32 [ %406, %.preheader12.i ], [ %427, %426 ]
  %429 = sext i32 %428 to i64, !dbg !313
  %430 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %429, !dbg !313
  %431 = load i32* %430, align 4, !dbg !313, !tbaa !117
  store i32 %431, i32* %409, align 4, !dbg !313, !tbaa !117
  %indvars.iv.next102.i = add nuw nsw i64 %indvars.iv101.i, 1, !dbg !295
  %432 = icmp slt i32 %407, %291, !dbg !295
  br i1 %432, label %._crit_edge164.i, label %.preheader11.i, !dbg !295

._crit_edge164.i:                                 ; preds = %._crit_edge46.i
  %indvars.iv.next53 = add nuw nsw i32 %indvars.iv52, 1, !dbg !295
  %.phi.trans.insert165.i = getelementptr inbounds [17 x i32]* %s.i, i64 0, i64 %indvars.iv.next102.i
  %.pre166.i = load i32* %.phi.trans.insert165.i, align 4, !dbg !298, !tbaa !117
  br label %.lr.ph49.i, !dbg !295

.preheader9.i:                                    ; preds = %476
  %433 = icmp sgt i32 %291, 0, !dbg !314
  br i1 %433, label %.lr.ph42.i, label %vector.memcheck126, !dbg !314

.lr.ph42.i:                                       ; preds = %.preheader9.i
  br i1 %363, label %.lr.ph39.us.i.preheader, label %.lr.ph.i

.lr.ph39.us.i.preheader:                          ; preds = %.lr.ph42.i
  %434 = load i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 1), align 4, !dbg !316, !tbaa !117
  %435 = add i32 %434, 255, !dbg !320
  br label %.lr.ph39.us.i, !dbg !321

; <label>:436                                     ; preds = %453, %.lr.ph39.us.i
  %indvars.iv154.i = phi i64 [ 0, %.lr.ph39.us.i ], [ %indvars.iv.next155.i, %453 ]
  %q.637.us.i = phi i32 [ 0, %.lr.ph39.us.i ], [ %q.7.us.i, %453 ]
  %437 = trunc i64 %indvars.iv154.i to i32, !dbg !322
  %438 = icmp eq i32 %437, %468, !dbg !322
  br i1 %438, label %453, label %439, !dbg !322

; <label>:439                                     ; preds = %436
  %440 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv154.i, !dbg !325
  %441 = load i32* %440, align 4, !dbg !325, !tbaa !117
  %442 = load i32* %467, align 4, !dbg !325, !tbaa !117
  %443 = add nsw i32 %442, %441, !dbg !325
  %444 = srem i32 %443, 255, !dbg !325
  %445 = sext i32 %444 to i64, !dbg !325
  %446 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %445, !dbg !325
  %447 = load i32* %446, align 4, !dbg !325, !tbaa !117
  %448 = xor i32 %447, 1, !dbg !325
  %449 = sext i32 %448 to i64, !dbg !325
  %450 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %449, !dbg !325
  %451 = load i32* %450, align 4, !dbg !325, !tbaa !117
  %452 = add nsw i32 %451, %q.637.us.i, !dbg !325
  call void @llvm.dbg.value(metadata !{i32 %452}, i64 0, metadata !284) #2, !dbg !325
  br label %453, !dbg !325

; <label>:453                                     ; preds = %439, %436
  %q.7.us.i = phi i32 [ %452, %439 ], [ %q.637.us.i, %436 ]
  %indvars.iv.next155.i = add nuw nsw i64 %indvars.iv154.i, 1, !dbg !326
  %lftr.wideiv = trunc i64 %indvars.iv.next155.i to i32, !dbg !326
  %exitcond45 = icmp eq i32 %lftr.wideiv, %291, !dbg !326
  br i1 %exitcond45, label %454, label %436, !dbg !326

; <label>:454                                     ; preds = %453
  %455 = sext i32 %466 to i64, !dbg !321
  %456 = srem i32 %q.7.us.i, 255, !dbg !327
  call void @llvm.dbg.value(metadata !{i32 %456}, i64 0, metadata !284) #2, !dbg !327
  %457 = sub i32 %435, %456, !dbg !320
  %458 = srem i32 %457, 255, !dbg !320
  %459 = sext i32 %458 to i64, !dbg !320
  %460 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %459, !dbg !320
  %461 = load i32* %460, align 4, !dbg !320, !tbaa !117
  %462 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %455, !dbg !328
  %463 = load i32* %462, align 4, !dbg !328, !tbaa !117
  %464 = xor i32 %463, %461, !dbg !328
  store i32 %464, i32* %462, align 4, !dbg !328, !tbaa !117
  %indvars.iv.next157.i = add nuw nsw i64 %indvars.iv156.i, 1, !dbg !314
  %lftr.wideiv46 = trunc i64 %indvars.iv.next157.i to i32, !dbg !314
  %exitcond47 = icmp eq i32 %lftr.wideiv46, %291, !dbg !314
  br i1 %exitcond47, label %vector.memcheck126, label %.lr.ph39.us.i, !dbg !314

.lr.ph39.us.i:                                    ; preds = %454, %.lr.ph39.us.i.preheader
  %indvars.iv156.i = phi i64 [ %indvars.iv.next157.i, %454 ], [ 0, %.lr.ph39.us.i.preheader ]
  %465 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv156.i, !dbg !321
  %466 = load i32* %465, align 4, !dbg !321, !tbaa !117
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !186) #2, !dbg !329
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !284) #2, !dbg !331
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !186) #2, !dbg !326
  %467 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %indvars.iv156.i, !dbg !325
  %468 = trunc i64 %indvars.iv156.i to i32, !dbg !322
  br label %436, !dbg !326

.preheader11.i:                                   ; preds = %.preheader13.i, %._crit_edge46.i, %476
  %indvars.iv92.i = phi i64 [ %indvars.iv.next93.i, %476 ], [ 0, %._crit_edge46.i ], [ 0, %.preheader13.i ]
  %469 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv92.i, !dbg !332
  %470 = load i32* %469, align 4, !dbg !332, !tbaa !117
  %471 = icmp eq i32 %470, -1, !dbg !332
  br i1 %471, label %476, label %472, !dbg !332

; <label>:472                                     ; preds = %.preheader11.i
  %473 = sext i32 %470 to i64, !dbg !336
  %474 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %473, !dbg !336
  %475 = load i32* %474, align 4, !dbg !336, !tbaa !117
  br label %476, !dbg !336

; <label>:476                                     ; preds = %472, %.preheader11.i
  %storemerge3.i = phi i32 [ %475, %472 ], [ 0, %.preheader11.i ]
  store i32 %storemerge3.i, i32* %469, align 4, !dbg !336, !tbaa !117
  %indvars.iv.next93.i = add nuw nsw i64 %indvars.iv92.i, 1, !dbg !337
  %exitcond94.i = icmp eq i64 %indvars.iv.next93.i, 255, !dbg !337
  br i1 %exitcond94.i, label %.preheader9.i, label %.preheader11.i, !dbg !337

.lr.ph.i:                                         ; preds = %.lr.ph42.i, %530
  %indvars.iv89.i = phi i64 [ %indvars.iv.next90.i, %530 ], [ 0, %.lr.ph42.i ]
  %477 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv89.i, !dbg !321
  %478 = load i32* %477, align 4, !dbg !321, !tbaa !117
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !186) #2, !dbg !329
  %479 = getelementptr inbounds [8 x i32]* %root.i, i64 0, i64 %indvars.iv89.i, !dbg !338
  br label %480, !dbg !329

; <label>:480                                     ; preds = %495, %.lr.ph.i
  %481 = phi i32 [ %.pre163.i, %495 ], [ 1, %.lr.ph.i ]
  %indvars.iv85.i = phi i64 [ %indvars.iv.next86.i, %495 ], [ 1, %.lr.ph.i ]
  %482 = getelementptr inbounds [9 x i32]* %z.i, i64 0, i64 %indvars.iv85.i, !dbg !340
  %483 = load i32* %482, align 4, !dbg !340, !tbaa !117
  %484 = icmp eq i32 %483, -1, !dbg !340
  br i1 %484, label %._crit_edge174.i, label %485, !dbg !340

._crit_edge174.i:                                 ; preds = %480
  %.pre177.i = trunc i64 %indvars.iv85.i to i32, !dbg !329
  br label %495, !dbg !340

; <label>:485                                     ; preds = %480
  %486 = load i32* %479, align 4, !dbg !338, !tbaa !117
  %487 = trunc i64 %indvars.iv85.i to i32, !dbg !338
  %488 = mul nsw i32 %486, %487, !dbg !338
  %489 = add nsw i32 %488, %483, !dbg !338
  %490 = srem i32 %489, 255, !dbg !338
  %491 = sext i32 %490 to i64, !dbg !338
  %492 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %491, !dbg !338
  %493 = load i32* %492, align 4, !dbg !338, !tbaa !117
  %494 = xor i32 %493, %481, !dbg !338
  br label %495, !dbg !338

; <label>:495                                     ; preds = %485, %._crit_edge174.i
  %.pre-phi178.i = phi i32 [ %.pre177.i, %._crit_edge174.i ], [ %487, %485 ], !dbg !329
  %.pre163.i = phi i32 [ %481, %._crit_edge174.i ], [ %494, %485 ]
  %indvars.iv.next86.i = add nuw nsw i64 %indvars.iv85.i, 1, !dbg !329
  %496 = icmp slt i32 %.pre-phi178.i, %291, !dbg !329
  br i1 %496, label %480, label %._crit_edge.i, !dbg !329

._crit_edge.i:                                    ; preds = %495
  %497 = sext i32 %478 to i64, !dbg !321
  %498 = icmp eq i32 %.pre163.i, 0, !dbg !341
  br i1 %498, label %530, label %.lr.ph39.i.preheader, !dbg !341

.lr.ph39.i.preheader:                             ; preds = %._crit_edge.i
  %499 = sext i32 %.pre163.i to i64, !dbg !316
  %500 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %499, !dbg !316
  %501 = load i32* %500, align 4, !dbg !316, !tbaa !117
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !284) #2, !dbg !331
  call void @llvm.dbg.value(metadata !111, i64 0, metadata !186) #2, !dbg !326
  %502 = trunc i64 %indvars.iv89.i to i32, !dbg !322
  br label %.lr.ph39.i, !dbg !322

.lr.ph39.i:                                       ; preds = %519, %.lr.ph39.i.preheader
  %indvars.iv87.i = phi i64 [ %indvars.iv.next88.i, %519 ], [ 0, %.lr.ph39.i.preheader ]
  %q.637.i = phi i32 [ %q.7.i, %519 ], [ 0, %.lr.ph39.i.preheader ]
  %503 = trunc i64 %indvars.iv87.i to i32, !dbg !322
  %504 = icmp eq i32 %503, %502, !dbg !322
  br i1 %504, label %519, label %505, !dbg !322

; <label>:505                                     ; preds = %.lr.ph39.i
  %506 = getelementptr inbounds [8 x i32]* %loc.i, i64 0, i64 %indvars.iv87.i, !dbg !325
  %507 = load i32* %506, align 4, !dbg !325, !tbaa !117
  %508 = load i32* %479, align 4, !dbg !325, !tbaa !117
  %509 = add nsw i32 %508, %507, !dbg !325
  %510 = srem i32 %509, 255, !dbg !325
  %511 = sext i32 %510 to i64, !dbg !325
  %512 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %511, !dbg !325
  %513 = load i32* %512, align 4, !dbg !325, !tbaa !117
  %514 = xor i32 %513, 1, !dbg !325
  %515 = sext i32 %514 to i64, !dbg !325
  %516 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %515, !dbg !325
  %517 = load i32* %516, align 4, !dbg !325, !tbaa !117
  %518 = add nsw i32 %517, %q.637.i, !dbg !325
  call void @llvm.dbg.value(metadata !{i32 %518}, i64 0, metadata !284) #2, !dbg !325
  br label %519, !dbg !325

; <label>:519                                     ; preds = %505, %.lr.ph39.i
  %q.7.i = phi i32 [ %518, %505 ], [ %q.637.i, %.lr.ph39.i ]
  %indvars.iv.next88.i = add nuw nsw i64 %indvars.iv87.i, 1, !dbg !326
  %lftr.wideiv48 = trunc i64 %indvars.iv.next88.i to i32, !dbg !326
  %exitcond49 = icmp eq i32 %lftr.wideiv48, %291, !dbg !326
  br i1 %exitcond49, label %._crit_edge40.i, label %.lr.ph39.i, !dbg !326

._crit_edge40.i:                                  ; preds = %519
  %520 = srem i32 %q.7.i, 255, !dbg !327
  call void @llvm.dbg.value(metadata !{i32 %520}, i64 0, metadata !284) #2, !dbg !327
  %521 = add i32 %501, 255, !dbg !320
  %522 = sub i32 %521, %520, !dbg !320
  %523 = srem i32 %522, 255, !dbg !320
  %524 = sext i32 %523 to i64, !dbg !320
  %525 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %524, !dbg !320
  %526 = load i32* %525, align 4, !dbg !320, !tbaa !117
  %527 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %497, !dbg !328
  %528 = load i32* %527, align 4, !dbg !328, !tbaa !117
  %529 = xor i32 %528, %526, !dbg !328
  store i32 %529, i32* %527, align 4, !dbg !328, !tbaa !117
  br label %530, !dbg !342

; <label>:530                                     ; preds = %._crit_edge40.i, %._crit_edge.i
  %indvars.iv.next90.i = add nuw nsw i64 %indvars.iv89.i, 1, !dbg !314
  %lftr.wideiv50 = trunc i64 %indvars.iv.next90.i to i32, !dbg !314
  %exitcond51 = icmp eq i32 %lftr.wideiv50, %291, !dbg !314
  br i1 %exitcond51, label %vector.memcheck126, label %.lr.ph.i, !dbg !314

.preheader14.i:                                   ; preds = %383, %538
  %indvars.iv103.i = phi i64 [ %indvars.iv.next104.i, %538 ], [ 0, %383 ]
  %531 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv103.i, !dbg !343
  %532 = load i32* %531, align 4, !dbg !343, !tbaa !117
  %533 = icmp eq i32 %532, -1, !dbg !343
  br i1 %533, label %538, label %534, !dbg !343

; <label>:534                                     ; preds = %.preheader14.i
  %535 = sext i32 %532 to i64, !dbg !346
  %536 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %535, !dbg !346
  %537 = load i32* %536, align 4, !dbg !346, !tbaa !117
  br label %538, !dbg !346

; <label>:538                                     ; preds = %534, %.preheader14.i
  %storemerge2.i = phi i32 [ %537, %534 ], [ 0, %.preheader14.i ]
  store i32 %storemerge2.i, i32* %531, align 4, !dbg !346, !tbaa !117
  %indvars.iv.next104.i = add nuw nsw i64 %indvars.iv103.i, 1, !dbg !347
  %exitcond105.i = icmp eq i64 %indvars.iv.next104.i, 255, !dbg !347
  br i1 %exitcond105.i, label %vector.memcheck126, label %.preheader14.i, !dbg !347

.critedge.thread.preheader.i:                     ; preds = %.critedge.i, %.preheader20._crit_edge.i, %.critedge.thread.i
  %indvars.iv82.i = phi i64 [ %indvars.iv.next83.i, %.critedge.thread.i ], [ 0, %.preheader20._crit_edge.i ], [ 0, %.critedge.i ]
  %539 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv82.i, !dbg !348
  %540 = load i32* %539, align 4, !dbg !348, !tbaa !117
  %541 = icmp eq i32 %540, -1, !dbg !348
  br i1 %541, label %.critedge.thread.i, label %542, !dbg !348

; <label>:542                                     ; preds = %.critedge.thread.preheader.i
  %543 = sext i32 %540 to i64, !dbg !351
  %544 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %543, !dbg !351
  %545 = load i32* %544, align 4, !dbg !351, !tbaa !117
  br label %.critedge.thread.i, !dbg !351

.critedge.thread.i:                               ; preds = %542, %.critedge.thread.preheader.i
  %storemerge1.i = phi i32 [ %545, %542 ], [ 0, %.critedge.thread.preheader.i ]
  store i32 %storemerge1.i, i32* %539, align 4, !dbg !351, !tbaa !117
  %indvars.iv.next83.i = add nuw nsw i64 %indvars.iv82.i, 1, !dbg !352
  %exitcond84.i = icmp eq i64 %indvars.iv.next83.i, 255, !dbg !352
  br i1 %exitcond84.i, label %vector.memcheck126, label %.critedge.thread.preheader.i, !dbg !352

.preheader.i:                                     ; preds = %170, %553
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %553 ], [ 0, %170 ]
  %546 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %indvars.iv.i1, !dbg !353
  %547 = load i32* %546, align 4, !dbg !353, !tbaa !117
  %548 = icmp eq i32 %547, -1, !dbg !353
  br i1 %548, label %553, label %549, !dbg !353

; <label>:549                                     ; preds = %.preheader.i
  %550 = sext i32 %547 to i64, !dbg !356
  %551 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %550, !dbg !356
  %552 = load i32* %551, align 4, !dbg !356, !tbaa !117
  br label %553, !dbg !356

; <label>:553                                     ; preds = %549, %.preheader.i
  %storemerge.i = phi i32 [ %552, %549 ], [ 0, %.preheader.i ]
  store i32 %storemerge.i, i32* %546, align 4, !dbg !356, !tbaa !117
  %indvars.iv.next.i2 = add nuw nsw i64 %indvars.iv.i1, 1, !dbg !357
  %exitcond.i3 = icmp eq i64 %indvars.iv.next.i2, 255, !dbg !357
  br i1 %exitcond.i3, label %vector.memcheck126, label %.preheader.i, !dbg !357

vector.memcheck126:                               ; preds = %.preheader9.i, %553, %.critedge.thread.i, %454, %530, %538
  %scevgep121 = getelementptr i8* %data_out, i64 187
  %bound1123 = icmp uge i8* %scevgep121, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 67) to i8*)
  %bound0122 = icmp ule i8* %data_out, bitcast (i32* getelementptr inbounds ([255 x i32]* @recd, i64 0, i64 254) to i8*)
  %memcheck.conflict125 = and i1 %bound0122, %bound1123
  br i1 %memcheck.conflict125, label %decode_rs.exit, label %vector.body117

vector.body117:                                   ; preds = %vector.memcheck126, %vector.body117
  %index120 = phi i64 [ %index.next130, %vector.body117 ], [ 0, %vector.memcheck126 ], !dbg !358
  %554 = add i64 %index120, 67, !dbg !360
  %555 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %554, !dbg !360
  %556 = bitcast i32* %555 to <4 x i32>*, !dbg !360
  %wide.load135 = load <4 x i32>* %556, align 4, !dbg !360
  %.sum139 = add i64 %index120, 71, !dbg !360
  %557 = getelementptr [255 x i32]* @recd, i64 0, i64 %.sum139, !dbg !360
  %558 = bitcast i32* %557 to <4 x i32>*, !dbg !360
  %wide.load136 = load <4 x i32>* %558, align 4, !dbg !360
  %559 = trunc <4 x i32> %wide.load135 to <4 x i8>, !dbg !360
  %560 = trunc <4 x i32> %wide.load136 to <4 x i8>, !dbg !360
  %561 = getelementptr inbounds i8* %data_out, i64 %index120, !dbg !360
  %562 = bitcast i8* %561 to <4 x i8>*, !dbg !360
  store <4 x i8> %559, <4 x i8>* %562, align 1, !dbg !360
  %.sum140141 = or i64 %index120, 4, !dbg !360
  %563 = getelementptr i8* %data_out, i64 %.sum140141, !dbg !360
  %564 = bitcast i8* %563 to <4 x i8>*, !dbg !360
  store <4 x i8> %560, <4 x i8>* %564, align 1, !dbg !360
  %index.next130 = add i64 %index120, 8, !dbg !358
  %565 = icmp eq i64 %index.next130, 184, !dbg !358
  br i1 %565, label %decode_rs.exit, label %vector.body117, !dbg !358, !llvm.loop !362

decode_rs.exit:                                   ; preds = %vector.body117, %vector.memcheck126, %decode_rs.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %decode_rs.exit ], [ 0, %vector.memcheck126 ], [ 184, %vector.body117 ]
  %566 = add nsw i64 %indvars.iv, 67, !dbg !360
  %567 = getelementptr inbounds [255 x i32]* @recd, i64 0, i64 %566, !dbg !360
  %568 = load i32* %567, align 4, !dbg !360, !tbaa !117
  %569 = trunc i32 %568 to i8, !dbg !360
  %570 = getelementptr inbounds i8* %data_out, i64 %indvars.iv, !dbg !360
  store i8 %569, i8* %570, align 1, !dbg !360, !tbaa !159
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !358
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !358
  br i1 %exitcond, label %571, label %decode_rs.exit, !dbg !358, !llvm.loop !363

; <label>:571                                     ; preds = %decode_rs.exit
  ret void, !dbg !364
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @rsenc_204(i8* nocapture %data_out, i8* nocapture readonly %data_in) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %data_out}, i64 0, metadata !17), !dbg !365
  tail call void @llvm.dbg.value(metadata !{i8* %data_in}, i64 0, metadata !18), !dbg !365
  %.b = load i1* @inited, align 1
  br i1 %.b, label %.preheader11, label %1, !dbg !366

; <label>:1                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !106, i64 0, metadata !368), !dbg !371
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !372), !dbg !373
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 0), align 16, !dbg !374, !tbaa !117
  store i32 0, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 1), align 4, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 1), align 4, !dbg !374, !tbaa !117
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 2), align 8, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 2), align 8, !dbg !374, !tbaa !117
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 4), align 16, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 3), align 4, !dbg !374, !tbaa !117
  store i32 3, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 8), align 16, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 16, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 4), align 16, !dbg !374, !tbaa !117
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 16), align 16, !dbg !375, !tbaa !117
  store i32 29, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !377, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 32, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 5), align 4, !dbg !374, !tbaa !117
  store i32 5, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 32), align 16, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 64, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 6), align 8, !dbg !374, !tbaa !117
  store i32 6, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 64), align 16, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 128, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 7), align 4, !dbg !374, !tbaa !117
  store i32 7, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 128), align 16, !dbg !375, !tbaa !117
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !368), !dbg !376
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 29), align 4, !dbg !378, !tbaa !117
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !368), !dbg !379
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !372), !dbg !380
  br label %2, !dbg !380

; <label>:2                                       ; preds = %14, %1
  %3 = phi i32 [ 29, %1 ], [ %15, %14 ]
  %indvars.iv.i = phi i64 [ 9, %1 ], [ %indvars.iv.next.i, %14 ]
  %4 = icmp slt i32 %3, 128, !dbg !381
  br i1 %4, label %11, label %5, !dbg !381

; <label>:5                                       ; preds = %2
  %6 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i64 0, i64 8), align 16, !dbg !382, !tbaa !117
  %7 = shl i32 %3, 1, !dbg !382
  %8 = xor i32 %7, 256, !dbg !382
  %9 = xor i32 %8, %6, !dbg !382
  %10 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv.i, !dbg !382
  store i32 %9, i32* %10, align 4, !dbg !382, !tbaa !117
  br label %14, !dbg !382

; <label>:11                                      ; preds = %2
  %12 = shl i32 %3, 1, !dbg !383
  %13 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %indvars.iv.i, !dbg !383
  store i32 %12, i32* %13, align 4, !dbg !383, !tbaa !117
  br label %14

; <label>:14                                      ; preds = %11, %5
  %15 = phi i32 [ %12, %11 ], [ %9, %5 ]
  %16 = sext i32 %15 to i64, !dbg !384
  %17 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %16, !dbg !384
  %18 = trunc i64 %indvars.iv.i to i32, !dbg !384
  store i32 %18, i32* %17, align 4, !dbg !384, !tbaa !117
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !380
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 255, !dbg !380
  br i1 %exitcond.i, label %generate_gf.exit, label %2, !dbg !380

generate_gf.exit:                                 ; preds = %14
  store i32 -1, i32* getelementptr inbounds ([256 x i32]* @index_of, i64 0, i64 0), align 16, !dbg !385, !tbaa !117
  store i32 2, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !386, !tbaa !117
  store i32 1, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 1), align 4, !dbg !388, !tbaa !117
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !389), !dbg !390
  br label %.lr.ph.i, !dbg !390

.lr.ph.i:                                         ; preds = %._crit_edge.i4, %generate_gf.exit
  %indvars.iv14.i = phi i64 [ 2, %generate_gf.exit ], [ %indvars.iv.next15.i, %._crit_edge.i4 ]
  %indvars.iv6.i = phi i64 [ 1, %generate_gf.exit ], [ %indvars.iv.next7.i, %._crit_edge.i4 ]
  %19 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv14.i, !dbg !391
  store i32 1, i32* %19, align 4, !dbg !391, !tbaa !117
  %20 = trunc i64 %indvars.iv14.i to i32, !dbg !392
  br label %21, !dbg !393

; <label>:21                                      ; preds = %38, %.lr.ph.i
  %indvars.iv12.i = phi i64 [ %indvars.iv14.i, %.lr.ph.i ], [ %indvars.iv.next13.i, %38 ]
  %indvars.iv8.i = phi i64 [ %indvars.iv6.i, %.lr.ph.i ], [ %indvars.iv.next9.i, %38 ]
  %22 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv8.i, !dbg !392
  %23 = load i32* %22, align 4, !dbg !392, !tbaa !117
  %24 = icmp eq i32 %23, 0, !dbg !392
  %25 = add nsw i64 %indvars.iv12.i, -2, !dbg !392
  %26 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %25, !dbg !392
  %27 = load i32* %26, align 4, !dbg !392, !tbaa !117
  br i1 %24, label %38, label %28, !dbg !392

; <label>:28                                      ; preds = %21
  %29 = sext i32 %23 to i64, !dbg !392
  %30 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %29, !dbg !392
  %31 = load i32* %30, align 4, !dbg !392, !tbaa !117
  %32 = add nsw i32 %31, %20, !dbg !392
  %33 = srem i32 %32, 255, !dbg !392
  %34 = sext i32 %33 to i64, !dbg !392
  %35 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %34, !dbg !392
  %36 = load i32* %35, align 4, !dbg !392, !tbaa !117
  %37 = xor i32 %36, %27, !dbg !392
  br label %38, !dbg !392

; <label>:38                                      ; preds = %28, %21
  %storemerge.i3 = phi i32 [ %37, %28 ], [ %27, %21 ]
  store i32 %storemerge.i3, i32* %22, align 4, !dbg !392, !tbaa !117
  %indvars.iv.next9.i = add nsw i64 %indvars.iv8.i, -1, !dbg !393
  %39 = trunc i64 %indvars.iv.next9.i to i32, !dbg !393
  %40 = icmp sgt i32 %39, 0, !dbg !393
  %indvars.iv.next13.i = add nsw i64 %indvars.iv12.i, -1, !dbg !393
  br i1 %40, label %21, label %._crit_edge.i4, !dbg !393

._crit_edge.i4:                                   ; preds = %38
  %41 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !394, !tbaa !117
  %42 = sext i32 %41 to i64, !dbg !394
  %43 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %42, !dbg !394
  %44 = load i32* %43, align 4, !dbg !394, !tbaa !117
  %45 = add nsw i32 %44, %20, !dbg !394
  %46 = srem i32 %45, 255, !dbg !394
  %47 = sext i32 %46 to i64, !dbg !394
  %48 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %47, !dbg !394
  %49 = load i32* %48, align 4, !dbg !394, !tbaa !117
  store i32 %49, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !394, !tbaa !117
  %indvars.iv.next15.i = add nuw nsw i64 %indvars.iv14.i, 1, !dbg !390
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !390
  %exitcond17.i = icmp eq i64 %indvars.iv.next15.i, 17, !dbg !390
  br i1 %exitcond17.i, label %.preheader.i8.preheader, label %.lr.ph.i, !dbg !390

.preheader.i8.preheader:                          ; preds = %._crit_edge.i4
  %50 = sext i32 %49 to i64, !dbg !395
  %51 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %50, !dbg !395
  %52 = load i32* %51, align 4, !dbg !395, !tbaa !117
  store i32 %52, i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !395, !tbaa !117
  br label %._crit_edge19.i, !dbg !395

._crit_edge19.i:                                  ; preds = %.preheader.i8.preheader, %._crit_edge19.i
  %indvars.iv.next.i616 = phi i64 [ 1, %.preheader.i8.preheader ], [ %indvars.iv.next.i6, %._crit_edge19.i ]
  %.phi.trans.insert.i = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.next.i616
  %.pre.i9 = load i32* %.phi.trans.insert.i, align 4, !dbg !395, !tbaa !117
  %53 = sext i32 %.pre.i9 to i64, !dbg !395
  %54 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %53, !dbg !395
  %55 = load i32* %54, align 4, !dbg !395, !tbaa !117
  store i32 %55, i32* %.phi.trans.insert.i, align 4, !dbg !395, !tbaa !117
  %indvars.iv.next.i6 = add nuw nsw i64 %indvars.iv.next.i616, 1, !dbg !395
  %exitcond.i7 = icmp eq i64 %indvars.iv.next.i6, 17, !dbg !395
  br i1 %exitcond.i7, label %gen_poly.exit, label %._crit_edge19.i, !dbg !395

gen_poly.exit:                                    ; preds = %._crit_edge19.i
  store i1 true, i1* @inited, align 1
  br label %.preheader11, !dbg !396

.preheader11:                                     ; preds = %gen_poly.exit, %0
  call void @llvm.memset.p0i8.i64(i8* bitcast ([239 x i32]* @data to i8*), i8 0, i64 204, i32 16, i1 false), !dbg !397
  %scevgep = getelementptr i8* %data_in, i64 187
  %bound1 = icmp ule i8* %data_in, bitcast (i32* getelementptr inbounds ([239 x i32]* @data, i64 0, i64 238) to i8*)
  %bound0 = icmp uge i8* %scevgep, bitcast (i32* getelementptr inbounds ([239 x i32]* @data, i64 0, i64 51) to i8*)
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph, label %vector.body

vector.body:                                      ; preds = %.preheader11, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader11 ], !dbg !400
  %56 = getelementptr inbounds i8* %data_in, i64 %index, !dbg !402
  %57 = bitcast i8* %56 to <4 x i8>*, !dbg !402
  %wide.load = load <4 x i8>* %57, align 1, !dbg !402
  %.sum47 = or i64 %index, 4, !dbg !402
  %58 = getelementptr i8* %data_in, i64 %.sum47, !dbg !402
  %59 = bitcast i8* %58 to <4 x i8>*, !dbg !402
  %wide.load24 = load <4 x i8>* %59, align 1, !dbg !402
  %60 = zext <4 x i8> %wide.load to <4 x i32>, !dbg !402
  %61 = zext <4 x i8> %wide.load24 to <4 x i32>, !dbg !402
  %62 = add i64 %index, 51, !dbg !402
  %63 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %62, !dbg !402
  %64 = bitcast i32* %63 to <4 x i32>*, !dbg !402
  store <4 x i32> %60, <4 x i32>* %64, align 4, !dbg !402
  %.sum = add i64 %index, 55, !dbg !402
  %65 = getelementptr [239 x i32]* @data, i64 0, i64 %.sum, !dbg !402
  %66 = bitcast i32* %65 to <4 x i32>*, !dbg !402
  store <4 x i32> %61, <4 x i32>* %66, align 4, !dbg !402
  %index.next = add i64 %index, 8, !dbg !400
  %67 = icmp eq i64 %index.next, 184, !dbg !400
  br i1 %67, label %scalar.ph, label %vector.body, !dbg !400, !llvm.loop !404

scalar.ph:                                        ; preds = %vector.body, %.preheader11, %scalar.ph
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %scalar.ph ], [ 0, %.preheader11 ], [ 184, %vector.body ]
  %68 = getelementptr inbounds i8* %data_in, i64 %indvars.iv17, !dbg !402
  %69 = load i8* %68, align 1, !dbg !402, !tbaa !159
  %70 = zext i8 %69 to i32, !dbg !402
  %71 = add nsw i64 %indvars.iv17, 51, !dbg !402
  %72 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %71, !dbg !402
  store i32 %70, i32* %72, align 4, !dbg !402, !tbaa !117
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !400
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 188, !dbg !400
  br i1 %exitcond19, label %73, label %scalar.ph, !dbg !400, !llvm.loop !405

; <label>:73                                      ; preds = %scalar.ph
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !406) #2, !dbg !408
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @bb to i8*), i8 0, i64 64, i32 16, i1 false) #2, !dbg !408
  %74 = load i32* getelementptr inbounds ([17 x i32]* @gg, i64 0, i64 0), align 16, !dbg !410, !tbaa !117
  br label %75, !dbg !415

; <label>:75                                      ; preds = %._crit_edge.i, %73
  %76 = phi i32 [ 0, %73 ], [ %storemerge.i, %._crit_edge.i ]
  %77 = phi i32 [ 0, %73 ], [ %.pre.i, %._crit_edge.i ]
  %indvars.iv10.i = phi i64 [ 238, %73 ], [ %indvars.iv.next11.i, %._crit_edge.i ]
  %78 = getelementptr inbounds [239 x i32]* @data, i64 0, i64 %indvars.iv10.i, !dbg !416
  %79 = load i32* %78, align 4, !dbg !416, !tbaa !117
  %80 = xor i32 %79, %77, !dbg !416
  %81 = sext i32 %80 to i64, !dbg !416
  %82 = getelementptr inbounds [256 x i32]* @index_of, i64 0, i64 %81, !dbg !416
  %83 = load i32* %82, align 4, !dbg !416, !tbaa !117
  tail call void @llvm.dbg.value(metadata !{i32 %83}, i64 0, metadata !417) #2, !dbg !416
  %84 = icmp eq i32 %83, -1, !dbg !418
  tail call void @llvm.dbg.value(metadata !419, i64 0, metadata !420) #2, !dbg !421
  br i1 %84, label %.preheader.i, label %.preheader1.i, !dbg !418

.preheader.i:                                     ; preds = %75
  %85 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 14), align 8, !dbg !423, !tbaa !117
  store i32 %85, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !423, !tbaa !117
  %86 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 13), align 4, !dbg !423, !tbaa !117
  store i32 %86, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 14), align 8, !dbg !423, !tbaa !117
  %87 = load <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 9) to <4 x i32>*), align 4, !dbg !423, !tbaa !117
  store <4 x i32> %87, <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 10) to <4 x i32>*), align 8, !dbg !423, !tbaa !117
  %88 = load <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 5) to <4 x i32>*), align 4, !dbg !423, !tbaa !117
  store <4 x i32> %88, <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 6) to <4 x i32>*), align 8, !dbg !423, !tbaa !117
  %89 = load <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 1) to <4 x i32>*), align 4, !dbg !423, !tbaa !117
  store <4 x i32> %89, <4 x i32>* bitcast (i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 2) to <4 x i32>*), align 8, !dbg !423, !tbaa !117
  store i32 %76, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 1), align 4, !dbg !423, !tbaa !117
  br label %113

.preheader1.i:                                    ; preds = %75, %.backedge.i
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %.backedge.i ], [ 15, %75 ]
  %90 = getelementptr inbounds [17 x i32]* @gg, i64 0, i64 %indvars.iv.i1, !dbg !426
  %91 = load i32* %90, align 4, !dbg !426, !tbaa !117
  %92 = icmp eq i32 %91, -1, !dbg !426
  %indvars.iv.next.i2 = add nsw i64 %indvars.iv.i1, -1, !dbg !421
  %93 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.next.i2, !dbg !428
  %94 = load i32* %93, align 4, !dbg !428, !tbaa !117
  br i1 %92, label %105, label %95, !dbg !426

; <label>:95                                      ; preds = %.preheader1.i
  %96 = add nsw i32 %91, %83, !dbg !428
  %97 = srem i32 %96, 255, !dbg !428
  %98 = sext i32 %97 to i64, !dbg !428
  %99 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %98, !dbg !428
  %100 = load i32* %99, align 4, !dbg !428, !tbaa !117
  %101 = xor i32 %100, %94, !dbg !428
  %102 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.i1, !dbg !428
  store i32 %101, i32* %102, align 4, !dbg !428, !tbaa !117
  br label %.backedge.i, !dbg !428

.backedge.i:                                      ; preds = %105, %95
  %103 = trunc i64 %indvars.iv.next.i2 to i32, !dbg !421
  %104 = icmp sgt i32 %103, 0, !dbg !421
  br i1 %104, label %.preheader1.i, label %107, !dbg !421

; <label>:105                                     ; preds = %.preheader1.i
  %106 = getelementptr inbounds [16 x i32]* @bb, i64 0, i64 %indvars.iv.i1, !dbg !429
  store i32 %94, i32* %106, align 4, !dbg !429, !tbaa !117
  br label %.backedge.i

; <label>:107                                     ; preds = %.backedge.i
  %108 = add nsw i32 %83, %74, !dbg !410
  %109 = srem i32 %108, 255, !dbg !410
  %110 = sext i32 %109 to i64, !dbg !410
  %111 = getelementptr inbounds [256 x i32]* @alpha_to, i64 0, i64 %110, !dbg !410
  %112 = load i32* %111, align 4, !dbg !410, !tbaa !117
  br label %113, !dbg !430

; <label>:113                                     ; preds = %107, %.preheader.i
  %storemerge.i = phi i32 [ %112, %107 ], [ 0, %.preheader.i ]
  store i32 %storemerge.i, i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 0), align 16, !dbg !431, !tbaa !117
  %114 = trunc i64 %indvars.iv10.i to i32, !dbg !415
  %115 = icmp sgt i32 %114, 0, !dbg !415
  br i1 %115, label %._crit_edge.i, label %vector.memcheck36, !dbg !415

vector.memcheck36:                                ; preds = %113
  %scevgep31 = getelementptr i8* %data_in, i64 187
  %scevgep30 = getelementptr i8* %data_out, i64 187
  %bound133 = icmp uge i8* %scevgep30, %data_in
  %bound032 = icmp uge i8* %scevgep31, %data_out
  %memcheck.conflict35 = and i1 %bound032, %bound133
  br i1 %memcheck.conflict35, label %encode_rs.exit, label %vector.body26

vector.body26:                                    ; preds = %vector.memcheck36, %vector.body26
  %index29 = phi i64 [ %index.next40, %vector.body26 ], [ 0, %vector.memcheck36 ], !dbg !432
  %116 = getelementptr inbounds i8* %data_in, i64 %index29, !dbg !434
  %117 = bitcast i8* %116 to <16 x i8>*, !dbg !434
  %wide.load45 = load <16 x i8>* %117, align 1, !dbg !434
  %.sum4849 = or i64 %index29, 16, !dbg !434
  %118 = getelementptr i8* %data_in, i64 %.sum4849, !dbg !434
  %119 = bitcast i8* %118 to <16 x i8>*, !dbg !434
  %wide.load46 = load <16 x i8>* %119, align 1, !dbg !434
  %120 = getelementptr inbounds i8* %data_out, i64 %index29, !dbg !434
  %121 = bitcast i8* %120 to <16 x i8>*, !dbg !434
  store <16 x i8> %wide.load45, <16 x i8>* %121, align 1, !dbg !434
  %.sum5051 = or i64 %index29, 16, !dbg !434
  %122 = getelementptr i8* %data_out, i64 %.sum5051, !dbg !434
  %123 = bitcast i8* %122 to <16 x i8>*, !dbg !434
  store <16 x i8> %wide.load46, <16 x i8>* %123, align 1, !dbg !434
  %index.next40 = add i64 %index29, 32, !dbg !432
  %124 = icmp eq i64 %index.next40, 160, !dbg !432
  br i1 %124, label %encode_rs.exit, label %vector.body26, !dbg !432, !llvm.loop !436

._crit_edge.i:                                    ; preds = %113
  %indvars.iv.next11.i = add nsw i64 %indvars.iv10.i, -1, !dbg !415
  %.pre.i = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !416, !tbaa !117
  br label %75, !dbg !415

.preheader:                                       ; preds = %encode_rs.exit
  %125 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 0), align 16, !dbg !437, !tbaa !117
  %126 = trunc i32 %125 to i8, !dbg !437
  %127 = getelementptr inbounds i8* %data_out, i64 188, !dbg !437
  store i8 %126, i8* %127, align 1, !dbg !437, !tbaa !159
  %128 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 1), align 4, !dbg !437, !tbaa !117
  %129 = trunc i32 %128 to i8, !dbg !437
  %130 = getelementptr inbounds i8* %data_out, i64 189, !dbg !437
  store i8 %129, i8* %130, align 1, !dbg !437, !tbaa !159
  %131 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 2), align 8, !dbg !437, !tbaa !117
  %132 = trunc i32 %131 to i8, !dbg !437
  %133 = getelementptr inbounds i8* %data_out, i64 190, !dbg !437
  store i8 %132, i8* %133, align 1, !dbg !437, !tbaa !159
  %134 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 3), align 4, !dbg !437, !tbaa !117
  %135 = trunc i32 %134 to i8, !dbg !437
  %136 = getelementptr inbounds i8* %data_out, i64 191, !dbg !437
  store i8 %135, i8* %136, align 1, !dbg !437, !tbaa !159
  %137 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 4), align 16, !dbg !437, !tbaa !117
  %138 = trunc i32 %137 to i8, !dbg !437
  %139 = getelementptr inbounds i8* %data_out, i64 192, !dbg !437
  store i8 %138, i8* %139, align 1, !dbg !437, !tbaa !159
  %140 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 5), align 4, !dbg !437, !tbaa !117
  %141 = trunc i32 %140 to i8, !dbg !437
  %142 = getelementptr inbounds i8* %data_out, i64 193, !dbg !437
  store i8 %141, i8* %142, align 1, !dbg !437, !tbaa !159
  %143 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 6), align 8, !dbg !437, !tbaa !117
  %144 = trunc i32 %143 to i8, !dbg !437
  %145 = getelementptr inbounds i8* %data_out, i64 194, !dbg !437
  store i8 %144, i8* %145, align 1, !dbg !437, !tbaa !159
  %146 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 7), align 4, !dbg !437, !tbaa !117
  %147 = trunc i32 %146 to i8, !dbg !437
  %148 = getelementptr inbounds i8* %data_out, i64 195, !dbg !437
  store i8 %147, i8* %148, align 1, !dbg !437, !tbaa !159
  %149 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 8), align 16, !dbg !437, !tbaa !117
  %150 = trunc i32 %149 to i8, !dbg !437
  %151 = getelementptr inbounds i8* %data_out, i64 196, !dbg !437
  store i8 %150, i8* %151, align 1, !dbg !437, !tbaa !159
  %152 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 9), align 4, !dbg !437, !tbaa !117
  %153 = trunc i32 %152 to i8, !dbg !437
  %154 = getelementptr inbounds i8* %data_out, i64 197, !dbg !437
  store i8 %153, i8* %154, align 1, !dbg !437, !tbaa !159
  %155 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 10), align 8, !dbg !437, !tbaa !117
  %156 = trunc i32 %155 to i8, !dbg !437
  %157 = getelementptr inbounds i8* %data_out, i64 198, !dbg !437
  store i8 %156, i8* %157, align 1, !dbg !437, !tbaa !159
  %158 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 11), align 4, !dbg !437, !tbaa !117
  %159 = trunc i32 %158 to i8, !dbg !437
  %160 = getelementptr inbounds i8* %data_out, i64 199, !dbg !437
  store i8 %159, i8* %160, align 1, !dbg !437, !tbaa !159
  %161 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 12), align 16, !dbg !437, !tbaa !117
  %162 = trunc i32 %161 to i8, !dbg !437
  %163 = getelementptr inbounds i8* %data_out, i64 200, !dbg !437
  store i8 %162, i8* %163, align 1, !dbg !437, !tbaa !159
  %164 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 13), align 4, !dbg !437, !tbaa !117
  %165 = trunc i32 %164 to i8, !dbg !437
  %166 = getelementptr inbounds i8* %data_out, i64 201, !dbg !437
  store i8 %165, i8* %166, align 1, !dbg !437, !tbaa !159
  %167 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 14), align 8, !dbg !437, !tbaa !117
  %168 = trunc i32 %167 to i8, !dbg !437
  %169 = getelementptr inbounds i8* %data_out, i64 202, !dbg !437
  store i8 %168, i8* %169, align 1, !dbg !437, !tbaa !159
  %170 = load i32* getelementptr inbounds ([16 x i32]* @bb, i64 0, i64 15), align 4, !dbg !437, !tbaa !117
  %171 = trunc i32 %170 to i8, !dbg !437
  %172 = getelementptr inbounds i8* %data_out, i64 203, !dbg !437
  store i8 %171, i8* %172, align 1, !dbg !437, !tbaa !159
  ret void, !dbg !440

encode_rs.exit:                                   ; preds = %vector.body26, %vector.memcheck36, %encode_rs.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %encode_rs.exit ], [ 0, %vector.memcheck36 ], [ 160, %vector.body26 ]
  %173 = getelementptr inbounds i8* %data_in, i64 %indvars.iv, !dbg !434
  %174 = load i8* %173, align 1, !dbg !434, !tbaa !159
  %175 = getelementptr inbounds i8* %data_out, i64 %indvars.iv, !dbg !434
  store i8 %174, i8* %175, align 1, !dbg !434, !tbaa !159
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !432
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !432
  br i1 %exitcond, label %.preheader, label %encode_rs.exit, !dbg !432, !llvm.loop !441
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %rs_in = alloca [204 x i8], align 16
  %rs_out = alloca [204 x i8], align 16
  %1 = getelementptr inbounds [204 x i8]* %rs_in, i64 0, i64 0, !dbg !442
  call void @llvm.lifetime.start(i64 204, i8* %1) #2, !dbg !442
  tail call void @llvm.dbg.declare(metadata !{[204 x i8]* %rs_in}, metadata !24), !dbg !442
  %2 = getelementptr inbounds [204 x i8]* %rs_out, i64 0, i64 0, !dbg !442
  call void @llvm.lifetime.start(i64 204, i8* %2) #2, !dbg !442
  tail call void @llvm.dbg.declare(metadata !{[204 x i8]* %rs_out}, metadata !28), !dbg !442
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !29), !dbg !443
  br label %.preheader, !dbg !443

.preheader:                                       ; preds = %._crit_edge, %0
  %i.03 = phi i32 [ 0, %0 ], [ %19, %._crit_edge ]
  br label %3, !dbg !445

; <label>:3                                       ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = tail call i32 (...)* @random() #2, !dbg !448
  %5 = trunc i32 %4 to i8, !dbg !448
  %6 = getelementptr inbounds [204 x i8]* %rs_in, i64 0, i64 %indvars.iv, !dbg !448
  store i8 %5, i8* %6, align 1, !dbg !448, !tbaa !159
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !445
  %exitcond = icmp eq i64 %indvars.iv.next, 188, !dbg !445
  br i1 %exitcond, label %7, label %3, !dbg !445

; <label>:7                                       ; preds = %3
  call void @rsenc_204(i8* %2, i8* %1), !dbg !450
  %8 = tail call i32 (...)* @random() #2, !dbg !451
  %9 = and i32 %8, 127, !dbg !451
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !31), !dbg !451
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !30), !dbg !452
  %10 = icmp eq i32 %9, 0, !dbg !452
  br i1 %10, label %._crit_edge, label %.lr.ph, !dbg !452

.lr.ph:                                           ; preds = %7, %.lr.ph
  %j.12 = phi i32 [ %17, %.lr.ph ], [ 0, %7 ]
  %11 = tail call i32 (...)* @random() #2, !dbg !454
  %12 = trunc i32 %11 to i8, !dbg !454
  %13 = tail call i32 (...)* @random() #2, !dbg !454
  %14 = srem i32 %13, 204, !dbg !454
  %15 = sext i32 %14 to i64, !dbg !454
  %16 = getelementptr inbounds [204 x i8]* %rs_out, i64 0, i64 %15, !dbg !454
  store i8 %12, i8* %16, align 1, !dbg !454, !tbaa !159
  %17 = add nsw i32 %j.12, 1, !dbg !452
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !30), !dbg !452
  %18 = icmp slt i32 %17, %9, !dbg !452
  br i1 %18, label %.lr.ph, label %._crit_edge, !dbg !452

._crit_edge:                                      ; preds = %.lr.ph, %7
  call void @rsdec_204(i8* %1, i8* %2), !dbg !456
  %19 = add nsw i32 %i.03, 1, !dbg !443
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !29), !dbg !443
  %exitcond4 = icmp eq i32 %19, 150000, !dbg !443
  br i1 %exitcond4, label %20, label %.preheader, !dbg !443

; <label>:20                                      ; preds = %._crit_edge
  call void @llvm.lifetime.end(i64 204, i8* %2) #2, !dbg !457
  call void @llvm.lifetime.end(i64 204, i8* %1) #2, !dbg !457
  ret i32 0, !dbg !458
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

declare i32 @random(...) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

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
!75 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_poly", metadata !"gen_poly", metadata !"", i32 91, metadata !33, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !76, i32 95} ; [ DW_TAG_subprogram ] [line 91] [local] [def] [scope 95] [gen_poly]
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
!139 = metadata !{i32 98, i32 0, metadata !75, metadata !140}
!140 = metadata !{i32 352, i32 0, metadata !109, null}
!141 = metadata !{i32 99, i32 0, metadata !75, metadata !140}
!142 = metadata !{i32 2}
!143 = metadata !{i32 786688, metadata !75, metadata !"i", metadata !5, i32 96, metadata !14, i32 0, metadata !140} ; [ DW_TAG_auto_variable ] [i] [line 96]
!144 = metadata !{i32 100, i32 0, metadata !145, metadata !140}
!145 = metadata !{i32 786443, metadata !1, metadata !75, i32 100, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!146 = metadata !{i32 101, i32 0, metadata !147, metadata !140}
!147 = metadata !{i32 786443, metadata !1, metadata !145, i32 101, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!148 = metadata !{i32 103, i32 0, metadata !149, metadata !140}
!149 = metadata !{i32 786443, metadata !1, metadata !150, i32 103, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!150 = metadata !{i32 786443, metadata !1, metadata !147, i32 102, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!151 = metadata !{i32 102, i32 0, metadata !150, metadata !140}
!152 = metadata !{i32 105, i32 0, metadata !147, metadata !140}
!153 = metadata !{i32 108, i32 0, metadata !154, metadata !140}
!154 = metadata !{i32 786443, metadata !1, metadata !75, i32 108, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!155 = metadata !{i32 355, i32 0, metadata !109, null}
!156 = metadata !{i32 361, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !158, i32 360, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!158 = metadata !{i32 786443, metadata !1, metadata !4, i32 360, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!159 = metadata !{metadata !119, metadata !119, i64 0}
!160 = metadata !{i32 365, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !162, i32 364, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!162 = metadata !{i32 786443, metadata !1, metadata !4, i32 364, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!163 = metadata !{i32 368, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !4, i32 368, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!165 = metadata !{i32 369, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !164, i32 368, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!167 = metadata !{metadata !167, metadata !168, metadata !169}
!168 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!169 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!170 = metadata !{metadata !170, metadata !168, metadata !169}
!171 = metadata !{i32 372, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !4, i32 372, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!173 = metadata !{i32 373, i32 0, metadata !172, null}
!174 = metadata !{metadata !174, metadata !168, metadata !169}
!175 = metadata !{metadata !175, metadata !168, metadata !169}
!176 = metadata !{i32 165, i32 0, metadata !39, metadata !177}
!177 = metadata !{i32 376, i32 0, metadata !4, null}
!178 = metadata !{i32 786688, metadata !39, metadata !"count", metadata !5, i32 166, metadata !14, i32 0, metadata !177} ; [ DW_TAG_auto_variable ] [count] [line 166]
!179 = metadata !{i32 166, i32 0, metadata !39, metadata !177}
!180 = metadata !{i32 786688, metadata !39, metadata !"syn_error", metadata !5, i32 166, metadata !14, i32 0, metadata !177} ; [ DW_TAG_auto_variable ] [syn_error] [line 166]
!181 = metadata !{i32 786688, metadata !39, metadata !"i", metadata !5, i32 164, metadata !14, i32 0, metadata !177} ; [ DW_TAG_auto_variable ] [i] [line 164]
!182 = metadata !{i32 169, i32 0, metadata !183, metadata !177}
!183 = metadata !{i32 786443, metadata !1, metadata !39, i32 169, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!184 = metadata !{i32 170, i32 0, metadata !185, metadata !177}
!185 = metadata !{i32 786443, metadata !1, metadata !183, i32 170, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!186 = metadata !{i32 786688, metadata !39, metadata !"j", metadata !5, i32 164, metadata !14, i32 0, metadata !177} ; [ DW_TAG_auto_variable ] [j] [line 164]
!187 = metadata !{i32 171, i32 0, metadata !188, metadata !177}
!188 = metadata !{i32 786443, metadata !1, metadata !185, i32 171, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!189 = metadata !{i32 172, i32 0, metadata !190, metadata !177}
!190 = metadata !{i32 786443, metadata !1, metadata !188, i32 172, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!191 = metadata !{i32 173, i32 0, metadata !190, metadata !177}
!192 = metadata !{i32 175, i32 0, metadata !193, metadata !177}
!193 = metadata !{i32 786443, metadata !1, metadata !185, i32 175, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!194 = metadata !{i32 176, i32 0, metadata !185, metadata !177}
!195 = metadata !{i32 179, i32 0, metadata !196, metadata !177}
!196 = metadata !{i32 786443, metadata !1, metadata !39, i32 179, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!197 = metadata !{i32 190, i32 0, metadata !198, metadata !177}
!198 = metadata !{i32 786443, metadata !1, metadata !196, i32 180, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!199 = metadata !{i32 191, i32 0, metadata !198, metadata !177}
!200 = metadata !{i32 192, i32 0, metadata !198, metadata !177}
!201 = metadata !{i32 193, i32 0, metadata !198, metadata !177}
!202 = metadata !{i32 194, i32 0, metadata !203, metadata !177}
!203 = metadata !{i32 786443, metadata !1, metadata !198, i32 194, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!204 = metadata !{i32 195, i32 0, metadata !205, metadata !177}
!205 = metadata !{i32 786443, metadata !1, metadata !203, i32 195, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!206 = metadata !{i32 196, i32 0, metadata !205, metadata !177}
!207 = metadata !{i32 198, i32 0, metadata !198, metadata !177}
!208 = metadata !{i32 199, i32 0, metadata !198, metadata !177}
!209 = metadata !{i32 200, i32 0, metadata !198, metadata !177}
!210 = metadata !{i32 201, i32 0, metadata !198, metadata !177}
!211 = metadata !{i32 786688, metadata !39, metadata !"u", metadata !5, i32 164, metadata !14, i32 0, metadata !177} ; [ DW_TAG_auto_variable ] [u] [line 164]
!212 = metadata !{i32 202, i32 0, metadata !198, metadata !177}
!213 = metadata !{i32 204, i32 0, metadata !198, metadata !177}
!214 = metadata !{i32 206, i32 0, metadata !215, metadata !177}
!215 = metadata !{i32 786443, metadata !1, metadata !198, i32 205, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!216 = metadata !{i32 207, i32 0, metadata !217, metadata !177}
!217 = metadata !{i32 786443, metadata !1, metadata !215, i32 207, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!218 = metadata !{i32 208, i32 0, metadata !219, metadata !177}
!219 = metadata !{i32 786443, metadata !1, metadata !217, i32 208, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!220 = metadata !{i32 209, i32 0, metadata !221, metadata !177}
!221 = metadata !{i32 786443, metadata !1, metadata !219, i32 209, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!222 = metadata !{i32 210, i32 0, metadata !223, metadata !177}
!223 = metadata !{i32 786443, metadata !1, metadata !221, i32 210, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!224 = metadata !{i32 211, i32 0, metadata !223, metadata !177}
!225 = metadata !{i32 217, i32 0, metadata !226, metadata !177}
!226 = metadata !{i32 786443, metadata !1, metadata !217, i32 216, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!227 = metadata !{i32 219, i32 0, metadata !228, metadata !177}
!228 = metadata !{i32 786443, metadata !1, metadata !226, i32 219, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!229 = metadata !{i32 222, i32 0, metadata !230, metadata !177}
!230 = metadata !{i32 786443, metadata !1, metadata !231, i32 222, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!231 = metadata !{i32 786443, metadata !1, metadata !228, i32 220, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!232 = metadata !{i32 225, i32 0, metadata !230, metadata !177}
!233 = metadata !{i32 223, i32 0, metadata !234, metadata !177}
!234 = metadata !{i32 786443, metadata !1, metadata !230, i32 223, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!235 = metadata !{i32 230, i32 0, metadata !236, metadata !177}
!236 = metadata !{i32 786443, metadata !1, metadata !226, i32 230, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!237 = metadata !{i32 234, i32 0, metadata !238, metadata !177}
!238 = metadata !{i32 786443, metadata !1, metadata !226, i32 234, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!239 = metadata !{i32 235, i32 0, metadata !240, metadata !177}
!240 = metadata !{i32 786443, metadata !1, metadata !226, i32 235, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!241 = metadata !{i32 237, i32 0, metadata !242, metadata !177}
!242 = metadata !{i32 786443, metadata !1, metadata !240, i32 236, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!243 = metadata !{i32 238, i32 0, metadata !244, metadata !177}
!244 = metadata !{i32 786443, metadata !1, metadata !226, i32 238, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!245 = metadata !{i32 239, i32 0, metadata !246, metadata !177}
!246 = metadata !{i32 786443, metadata !1, metadata !244, i32 239, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!247 = metadata !{i32 236, i32 0, metadata !242, metadata !177}
!248 = metadata !{i32 240, i32 0, metadata !246, metadata !177}
!249 = metadata !{i32 243, i32 0, metadata !215, metadata !177}
!250 = metadata !{i32 246, i32 0, metadata !251, metadata !177}
!251 = metadata !{i32 786443, metadata !1, metadata !215, i32 246, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!252 = metadata !{i32 248, i32 0, metadata !253, metadata !177}
!253 = metadata !{i32 786443, metadata !1, metadata !254, i32 248, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!254 = metadata !{i32 786443, metadata !1, metadata !251, i32 247, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!255 = metadata !{i32 249, i32 0, metadata !253, metadata !177}
!256 = metadata !{i32 251, i32 0, metadata !253, metadata !177}
!257 = metadata !{i32 252, i32 0, metadata !258, metadata !177}
!258 = metadata !{i32 786443, metadata !1, metadata !254, i32 252, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!259 = metadata !{i32 255, i32 0, metadata !254, metadata !177}
!260 = metadata !{i32 253, i32 0, metadata !261, metadata !177}
!261 = metadata !{i32 786443, metadata !1, metadata !258, i32 253, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!262 = metadata !{i32 254, i32 0, metadata !261, metadata !177}
!263 = metadata !{i32 257, i32 0, metadata !215, metadata !177}
!264 = metadata !{i32 260, i32 0, metadata !265, metadata !177}
!265 = metadata !{i32 786443, metadata !1, metadata !198, i32 260, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!266 = metadata !{i32 263, i32 0, metadata !267, metadata !177}
!267 = metadata !{i32 786443, metadata !1, metadata !268, i32 263, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!268 = metadata !{i32 786443, metadata !1, metadata !265, i32 261, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!269 = metadata !{metadata !269, metadata !168, metadata !169}
!270 = metadata !{i32 266, i32 0, metadata !271, metadata !177}
!271 = metadata !{i32 786443, metadata !1, metadata !268, i32 266, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!272 = metadata !{i32 267, i32 0, metadata !271, metadata !177}
!273 = metadata !{metadata !273, metadata !168, metadata !169}
!274 = metadata !{i32 269, i32 0, metadata !275, metadata !177}
!275 = metadata !{i32 786443, metadata !1, metadata !268, i32 269, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!276 = metadata !{i32 271, i32 0, metadata !277, metadata !177}
!277 = metadata !{i32 786443, metadata !1, metadata !278, i32 271, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!278 = metadata !{i32 786443, metadata !1, metadata !275, i32 270, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!279 = metadata !{i32 272, i32 0, metadata !280, metadata !177}
!280 = metadata !{i32 786443, metadata !1, metadata !277, i32 272, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!281 = metadata !{i32 273, i32 0, metadata !282, metadata !177}
!282 = metadata !{i32 786443, metadata !1, metadata !280, i32 273, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!283 = metadata !{i32 274, i32 0, metadata !282, metadata !177}
!284 = metadata !{i32 786688, metadata !39, metadata !"q", metadata !5, i32 164, metadata !14, i32 0, metadata !177} ; [ DW_TAG_auto_variable ] [q] [line 164]
!285 = metadata !{i32 275, i32 0, metadata !282, metadata !177}
!286 = metadata !{i32 276, i32 0, metadata !287, metadata !177}
!287 = metadata !{i32 786443, metadata !1, metadata !278, i32 276, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!288 = metadata !{i32 277, i32 0, metadata !289, metadata !177}
!289 = metadata !{i32 786443, metadata !1, metadata !287, i32 277, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!290 = metadata !{i32 278, i32 0, metadata !289, metadata !177}
!291 = metadata !{i32 279, i32 0, metadata !289, metadata !177}
!292 = metadata !{i32 280, i32 0, metadata !289, metadata !177}
!293 = metadata !{i32 282, i32 0, metadata !294, metadata !177}
!294 = metadata !{i32 786443, metadata !1, metadata !268, i32 282, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!295 = metadata !{i32 285, i32 0, metadata !296, metadata !177}
!296 = metadata !{i32 786443, metadata !1, metadata !297, i32 285, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!297 = metadata !{i32 786443, metadata !1, metadata !294, i32 283, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!298 = metadata !{i32 286, i32 0, metadata !299, metadata !177}
!299 = metadata !{i32 786443, metadata !1, metadata !300, i32 286, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!300 = metadata !{i32 786443, metadata !1, metadata !296, i32 286, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!301 = metadata !{i32 290, i32 0, metadata !302, metadata !177}
!302 = metadata !{i32 786443, metadata !1, metadata !303, i32 290, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!303 = metadata !{i32 786443, metadata !1, metadata !299, i32 288, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!304 = metadata !{i32 289, i32 0, metadata !303, metadata !177}
!305 = metadata !{i32 287, i32 0, metadata !299, metadata !177}
!306 = metadata !{i32 291, i32 0, metadata !302, metadata !177}
!307 = metadata !{i32 293, i32 0, metadata !302, metadata !177}
!308 = metadata !{i32 294, i32 0, metadata !309, metadata !177}
!309 = metadata !{i32 786443, metadata !1, metadata !300, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!310 = metadata !{i32 296, i32 0, metadata !311, metadata !177}
!311 = metadata !{i32 786443, metadata !1, metadata !309, i32 295, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!312 = metadata !{i32 295, i32 0, metadata !311, metadata !177}
!313 = metadata !{i32 297, i32 0, metadata !300, metadata !177}
!314 = metadata !{i32 307, i32 0, metadata !315, metadata !177}
!315 = metadata !{i32 786443, metadata !1, metadata !297, i32 307, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!316 = metadata !{i32 313, i32 0, metadata !317, metadata !177}
!317 = metadata !{i32 786443, metadata !1, metadata !318, i32 313, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!318 = metadata !{i32 786443, metadata !1, metadata !319, i32 312, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!319 = metadata !{i32 786443, metadata !1, metadata !315, i32 308, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!320 = metadata !{i32 319, i32 0, metadata !317, metadata !177}
!321 = metadata !{i32 308, i32 0, metadata !319, metadata !177}
!322 = metadata !{i32 316, i32 0, metadata !323, metadata !177}
!323 = metadata !{i32 786443, metadata !1, metadata !324, i32 316, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!324 = metadata !{i32 786443, metadata !1, metadata !317, i32 315, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!325 = metadata !{i32 317, i32 0, metadata !323, metadata !177}
!326 = metadata !{i32 315, i32 0, metadata !324, metadata !177}
!327 = metadata !{i32 318, i32 0, metadata !317, metadata !177}
!328 = metadata !{i32 320, i32 0, metadata !317, metadata !177}
!329 = metadata !{i32 309, i32 0, metadata !330, metadata !177}
!330 = metadata !{i32 786443, metadata !1, metadata !319, i32 309, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!331 = metadata !{i32 314, i32 0, metadata !317, metadata !177}
!332 = metadata !{i32 303, i32 0, metadata !333, metadata !177}
!333 = metadata !{i32 786443, metadata !1, metadata !334, i32 303, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!334 = metadata !{i32 786443, metadata !1, metadata !335, i32 302, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!335 = metadata !{i32 786443, metadata !1, metadata !297, i32 301, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!336 = metadata !{i32 304, i32 0, metadata !333, metadata !177}
!337 = metadata !{i32 301, i32 0, metadata !335, metadata !177}
!338 = metadata !{i32 311, i32 0, metadata !339, metadata !177}
!339 = metadata !{i32 786443, metadata !1, metadata !330, i32 310, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!340 = metadata !{i32 310, i32 0, metadata !339, metadata !177}
!341 = metadata !{i32 312, i32 0, metadata !318, metadata !177}
!342 = metadata !{i32 321, i32 0, metadata !317, metadata !177}
!343 = metadata !{i32 326, i32 0, metadata !344, metadata !177}
!344 = metadata !{i32 786443, metadata !1, metadata !345, i32 326, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!345 = metadata !{i32 786443, metadata !1, metadata !294, i32 325, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!346 = metadata !{i32 327, i32 0, metadata !344, metadata !177}
!347 = metadata !{i32 325, i32 0, metadata !345, metadata !177}
!348 = metadata !{i32 332, i32 0, metadata !349, metadata !177}
!349 = metadata !{i32 786443, metadata !1, metadata !350, i32 332, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!350 = metadata !{i32 786443, metadata !1, metadata !265, i32 331, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!351 = metadata !{i32 333, i32 0, metadata !349, metadata !177}
!352 = metadata !{i32 331, i32 0, metadata !350, metadata !177}
!353 = metadata !{i32 338, i32 0, metadata !354, metadata !177}
!354 = metadata !{i32 786443, metadata !1, metadata !355, i32 338, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!355 = metadata !{i32 786443, metadata !1, metadata !196, i32 337, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!356 = metadata !{i32 339, i32 0, metadata !354, metadata !177}
!357 = metadata !{i32 337, i32 0, metadata !355, metadata !177}
!358 = metadata !{i32 378, i32 0, metadata !359, null}
!359 = metadata !{i32 786443, metadata !1, metadata !4, i32 378, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!360 = metadata !{i32 379, i32 0, metadata !361, null}
!361 = metadata !{i32 786443, metadata !1, metadata !359, i32 378, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!362 = metadata !{metadata !362, metadata !168, metadata !169}
!363 = metadata !{metadata !363, metadata !168, metadata !169}
!364 = metadata !{i32 381, i32 0, metadata !4, null}
!365 = metadata !{i32 383, i32 0, metadata !15, null}
!366 = metadata !{i32 387, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !15, i32 387, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!368 = metadata !{i32 786688, metadata !79, metadata !"mask", metadata !5, i32 68, metadata !14, i32 0, metadata !369} ; [ DW_TAG_auto_variable ] [mask] [line 68]
!369 = metadata !{i32 389, i32 0, metadata !370, null}
!370 = metadata !{i32 786443, metadata !1, metadata !367, i32 387, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!371 = metadata !{i32 70, i32 0, metadata !79, metadata !369}
!372 = metadata !{i32 786688, metadata !79, metadata !"i", metadata !5, i32 68, metadata !14, i32 0, metadata !369} ; [ DW_TAG_auto_variable ] [i] [line 68]
!373 = metadata !{i32 72, i32 0, metadata !114, metadata !369}
!374 = metadata !{i32 73, i32 0, metadata !116, metadata !369}
!375 = metadata !{i32 74, i32 0, metadata !116, metadata !369}
!376 = metadata !{i32 77, i32 0, metadata !116, metadata !369}
!377 = metadata !{i32 76, i32 0, metadata !125, metadata !369}
!378 = metadata !{i32 79, i32 0, metadata !79, metadata !369}
!379 = metadata !{i32 80, i32 0, metadata !79, metadata !369}
!380 = metadata !{i32 81, i32 0, metadata !131, metadata !369}
!381 = metadata !{i32 82, i32 0, metadata !133, metadata !369}
!382 = metadata !{i32 83, i32 0, metadata !133, metadata !369}
!383 = metadata !{i32 84, i32 0, metadata !133, metadata !369}
!384 = metadata !{i32 85, i32 0, metadata !134, metadata !369}
!385 = metadata !{i32 87, i32 0, metadata !79, metadata !369}
!386 = metadata !{i32 98, i32 0, metadata !75, metadata !387}
!387 = metadata !{i32 391, i32 0, metadata !370, null}
!388 = metadata !{i32 99, i32 0, metadata !75, metadata !387}
!389 = metadata !{i32 786688, metadata !75, metadata !"i", metadata !5, i32 96, metadata !14, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [i] [line 96]
!390 = metadata !{i32 100, i32 0, metadata !145, metadata !387}
!391 = metadata !{i32 101, i32 0, metadata !147, metadata !387}
!392 = metadata !{i32 103, i32 0, metadata !149, metadata !387}
!393 = metadata !{i32 102, i32 0, metadata !150, metadata !387}
!394 = metadata !{i32 105, i32 0, metadata !147, metadata !387}
!395 = metadata !{i32 108, i32 0, metadata !154, metadata !387}
!396 = metadata !{i32 394, i32 0, metadata !370, null}
!397 = metadata !{i32 398, i32 0, metadata !398, null}
!398 = metadata !{i32 786443, metadata !1, metadata !399, i32 397, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!399 = metadata !{i32 786443, metadata !1, metadata !15, i32 397, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!400 = metadata !{i32 401, i32 0, metadata !401, null}
!401 = metadata !{i32 786443, metadata !1, metadata !15, i32 401, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!402 = metadata !{i32 402, i32 0, metadata !403, null}
!403 = metadata !{i32 786443, metadata !1, metadata !401, i32 401, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!404 = metadata !{metadata !404, metadata !168, metadata !169}
!405 = metadata !{metadata !405, metadata !168, metadata !169}
!406 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !5, i32 120, metadata !14, i32 0, metadata !407} ; [ DW_TAG_auto_variable ] [i] [line 120]
!407 = metadata !{i32 405, i32 0, metadata !15, null}
!408 = metadata !{i32 123, i32 0, metadata !409, metadata !407}
!409 = metadata !{i32 786443, metadata !1, metadata !32, i32 123, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!410 = metadata !{i32 132, i32 0, metadata !411, metadata !407}
!411 = metadata !{i32 786443, metadata !1, metadata !412, i32 127, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!412 = metadata !{i32 786443, metadata !1, metadata !413, i32 126, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!413 = metadata !{i32 786443, metadata !1, metadata !414, i32 125, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!414 = metadata !{i32 786443, metadata !1, metadata !32, i32 124, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!415 = metadata !{i32 124, i32 0, metadata !414, metadata !407}
!416 = metadata !{i32 125, i32 0, metadata !413, metadata !407}
!417 = metadata !{i32 786688, metadata !32, metadata !"feedback", metadata !5, i32 121, metadata !14, i32 0, metadata !407} ; [ DW_TAG_auto_variable ] [feedback] [line 121]
!418 = metadata !{i32 126, i32 0, metadata !412, metadata !407}
!419 = metadata !{i32 15}
!420 = metadata !{i32 786688, metadata !32, metadata !"j", metadata !5, i32 120, metadata !14, i32 0, metadata !407} ; [ DW_TAG_auto_variable ] [j] [line 120]
!421 = metadata !{i32 127, i32 0, metadata !422, metadata !407}
!422 = metadata !{i32 786443, metadata !1, metadata !411, i32 127, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!423 = metadata !{i32 136, i32 0, metadata !424, metadata !407}
!424 = metadata !{i32 786443, metadata !1, metadata !425, i32 135, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!425 = metadata !{i32 786443, metadata !1, metadata !412, i32 135, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!426 = metadata !{i32 128, i32 0, metadata !427, metadata !407}
!427 = metadata !{i32 786443, metadata !1, metadata !422, i32 128, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!428 = metadata !{i32 129, i32 0, metadata !427, metadata !407}
!429 = metadata !{i32 131, i32 0, metadata !427, metadata !407}
!430 = metadata !{i32 133, i32 0, metadata !411, metadata !407}
!431 = metadata !{i32 137, i32 0, metadata !425, metadata !407}
!432 = metadata !{i32 407, i32 0, metadata !433, null}
!433 = metadata !{i32 786443, metadata !1, metadata !15, i32 407, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!434 = metadata !{i32 408, i32 0, metadata !435, null}
!435 = metadata !{i32 786443, metadata !1, metadata !433, i32 407, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!436 = metadata !{metadata !436, metadata !168, metadata !169}
!437 = metadata !{i32 411, i32 0, metadata !438, null}
!438 = metadata !{i32 786443, metadata !1, metadata !439, i32 410, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!439 = metadata !{i32 786443, metadata !1, metadata !15, i32 410, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!440 = metadata !{i32 414, i32 0, metadata !15, null}
!441 = metadata !{metadata !441, metadata !168, metadata !169}
!442 = metadata !{i32 417, i32 0, metadata !20, null}
!443 = metadata !{i32 430, i32 0, metadata !444, null}
!444 = metadata !{i32 786443, metadata !1, metadata !20, i32 430, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!445 = metadata !{i32 432, i32 0, metadata !446, null}
!446 = metadata !{i32 786443, metadata !1, metadata !447, i32 432, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!447 = metadata !{i32 786443, metadata !1, metadata !444, i32 430, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!448 = metadata !{i32 433, i32 0, metadata !449, null}
!449 = metadata !{i32 786443, metadata !1, metadata !446, i32 432, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!450 = metadata !{i32 435, i32 0, metadata !447, null}
!451 = metadata !{i32 437, i32 0, metadata !447, null}
!452 = metadata !{i32 439, i32 0, metadata !453, null}
!453 = metadata !{i32 786443, metadata !1, metadata !447, i32 439, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!454 = metadata !{i32 440, i32 0, metadata !455, null}
!455 = metadata !{i32 786443, metadata !1, metadata !453, i32 439, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/reedsolomon.c]
!456 = metadata !{i32 443, i32 0, metadata !447, null}
!457 = metadata !{i32 445, i32 0, metadata !20, null}
!458 = metadata !{i32 446, i32 0, metadata !20, null}
