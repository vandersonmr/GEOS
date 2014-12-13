; ModuleID = 'salsa20.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ptr = global i32 0, align 4
@outbuf = common global [16 x i32] zeroinitializer, align 16
@STATE = common global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [15 x i8] c"got:       %x\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"should be: %x\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @salsa20(i32* nocapture %out, i32* nocapture readonly %in) #0 {
.preheader1:
  %in53 = bitcast i32* %in to i8*
  %x = alloca [16 x i32], align 16
  %0 = bitcast [16 x i32]* %x to i8*
  tail call void @llvm.dbg.value(metadata !{i32* %out}, i64 0, metadata !13), !dbg !39
  tail call void @llvm.dbg.value(metadata !{i32* %in}, i64 0, metadata !14), !dbg !39
  call void @llvm.lifetime.start(i64 64, i8* %0) #2, !dbg !40
  tail call void @llvm.dbg.declare(metadata !{[16 x i32]* %x}, metadata !16), !dbg !40
  tail call void @llvm.dbg.value(metadata !41, i64 0, metadata !15), !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %in53, i64 64, i32 4, i1 false), !dbg !44
  %1 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 0, !dbg !45
  %2 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 12, !dbg !45
  %3 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 4, !dbg !45
  %4 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 8, !dbg !45
  %5 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 5, !dbg !48
  %6 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 1, !dbg !48
  %7 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 9, !dbg !48
  %8 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 13, !dbg !48
  %9 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 10, !dbg !49
  %10 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 6, !dbg !49
  %11 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 14, !dbg !49
  %12 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 2, !dbg !49
  %13 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 15, !dbg !50
  %14 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 11, !dbg !50
  %15 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 3, !dbg !50
  %16 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 7, !dbg !50
  %.promoted = load i32* %1, align 16, !dbg !51, !tbaa !52
  %.promoted4 = load i32* %2, align 16, !dbg !56, !tbaa !52
  %.promoted6 = load i32* %3, align 16, !dbg !57, !tbaa !52
  %.promoted8 = load i32* %4, align 16, !dbg !58, !tbaa !52
  %.promoted10 = load i32* %5, align 4, !dbg !57, !tbaa !52
  %.promoted12 = load i32* %6, align 4, !dbg !51, !tbaa !52
  %.promoted14 = load i32* %7, align 4, !dbg !58, !tbaa !52
  %.promoted16 = load i32* %8, align 4, !dbg !56, !tbaa !52
  %.promoted18 = load i32* %9, align 8, !dbg !58, !tbaa !52
  %.promoted20 = load i32* %10, align 8, !dbg !57, !tbaa !52
  %.promoted22 = load i32* %11, align 8, !dbg !56, !tbaa !52
  %.promoted24 = load i32* %12, align 8, !dbg !51, !tbaa !52
  %.promoted26 = load i32* %13, align 4, !dbg !56, !tbaa !52
  %.promoted28 = load i32* %14, align 4, !dbg !58, !tbaa !52
  %.promoted30 = load i32* %15, align 4, !dbg !51, !tbaa !52
  %.promoted32 = load i32* %16, align 4, !dbg !57, !tbaa !52
  br label %17, !dbg !59

.preheader:                                       ; preds = %17
  store i32 %133, i32* %1, align 16, !dbg !51, !tbaa !52
  store i32 %178, i32* %2, align 16, !dbg !56, !tbaa !52
  store i32 %148, i32* %3, align 16, !dbg !57, !tbaa !52
  store i32 %163, i32* %4, align 16, !dbg !58, !tbaa !52
  store i32 %153, i32* %5, align 4, !dbg !57, !tbaa !52
  store i32 %118, i32* %6, align 4, !dbg !51, !tbaa !52
  store i32 %168, i32* %7, align 4, !dbg !58, !tbaa !52
  store i32 %183, i32* %8, align 4, !dbg !56, !tbaa !52
  store i32 %173, i32* %9, align 8, !dbg !58, !tbaa !52
  store i32 %138, i32* %10, align 8, !dbg !57, !tbaa !52
  store i32 %188, i32* %11, align 8, !dbg !56, !tbaa !52
  store i32 %123, i32* %12, align 8, !dbg !51, !tbaa !52
  store i32 %193, i32* %13, align 4, !dbg !56, !tbaa !52
  store i32 %158, i32* %14, align 4, !dbg !58, !tbaa !52
  store i32 %128, i32* %15, align 4, !dbg !51, !tbaa !52
  store i32 %143, i32* %16, align 4, !dbg !57, !tbaa !52
  br label %196, !dbg !60

; <label>:17                                      ; preds = %.preheader1, %17
  %18 = phi i32 [ %.promoted32, %.preheader1 ], [ %143, %17 ], !dbg !45
  %19 = phi i32 [ %.promoted30, %.preheader1 ], [ %128, %17 ], !dbg !45
  %20 = phi i32 [ %.promoted28, %.preheader1 ], [ %158, %17 ], !dbg !45
  %21 = phi i32 [ %.promoted26, %.preheader1 ], [ %193, %17 ], !dbg !45
  %22 = phi i32 [ %.promoted24, %.preheader1 ], [ %123, %17 ], !dbg !45
  %23 = phi i32 [ %.promoted22, %.preheader1 ], [ %188, %17 ], !dbg !45
  %24 = phi i32 [ %.promoted20, %.preheader1 ], [ %138, %17 ], !dbg !45
  %25 = phi i32 [ %.promoted18, %.preheader1 ], [ %173, %17 ], !dbg !45
  %26 = phi i32 [ %.promoted16, %.preheader1 ], [ %183, %17 ], !dbg !45
  %27 = phi i32 [ %.promoted14, %.preheader1 ], [ %168, %17 ], !dbg !45
  %28 = phi i32 [ %.promoted12, %.preheader1 ], [ %118, %17 ], !dbg !45
  %29 = phi i32 [ %.promoted10, %.preheader1 ], [ %153, %17 ], !dbg !45
  %30 = phi i32 [ %.promoted8, %.preheader1 ], [ %163, %17 ], !dbg !45
  %31 = phi i32 [ %.promoted6, %.preheader1 ], [ %148, %17 ], !dbg !45
  %32 = phi i32 [ %.promoted4, %.preheader1 ], [ %178, %17 ], !dbg !45
  %33 = phi i32 [ %.promoted, %.preheader1 ], [ %133, %17 ], !dbg !45
  %i.13 = phi i32 [ 20, %.preheader1 ], [ %194, %17 ]
  %34 = add i32 %32, %33, !dbg !45
  %35 = shl i32 %34, 7, !dbg !45
  %36 = lshr i32 %34, 25, !dbg !45
  %37 = or i32 %35, %36, !dbg !45
  %38 = xor i32 %37, %31, !dbg !45
  %39 = add i32 %38, %33, !dbg !45
  %40 = shl i32 %39, 9, !dbg !45
  %41 = lshr i32 %39, 23, !dbg !45
  %42 = or i32 %40, %41, !dbg !45
  %43 = xor i32 %42, %30, !dbg !45
  %44 = add i32 %43, %38, !dbg !62
  %45 = shl i32 %44, 13, !dbg !62
  %46 = lshr i32 %44, 19, !dbg !62
  %47 = or i32 %45, %46, !dbg !62
  %48 = xor i32 %47, %32, !dbg !62
  %49 = add i32 %48, %43, !dbg !62
  %50 = shl i32 %49, 18, !dbg !62
  %51 = lshr i32 %49, 14, !dbg !62
  %52 = or i32 %50, %51, !dbg !62
  %53 = xor i32 %52, %33, !dbg !62
  %54 = add i32 %28, %29, !dbg !48
  %55 = shl i32 %54, 7, !dbg !48
  %56 = lshr i32 %54, 25, !dbg !48
  %57 = or i32 %55, %56, !dbg !48
  %58 = xor i32 %57, %27, !dbg !48
  %59 = add i32 %58, %29, !dbg !48
  %60 = shl i32 %59, 9, !dbg !48
  %61 = lshr i32 %59, 23, !dbg !48
  %62 = or i32 %60, %61, !dbg !48
  %63 = xor i32 %62, %26, !dbg !48
  %64 = add i32 %63, %58, !dbg !63
  %65 = shl i32 %64, 13, !dbg !63
  %66 = lshr i32 %64, 19, !dbg !63
  %67 = or i32 %65, %66, !dbg !63
  %68 = xor i32 %67, %28, !dbg !63
  %69 = add i32 %68, %63, !dbg !63
  %70 = shl i32 %69, 18, !dbg !63
  %71 = lshr i32 %69, 14, !dbg !63
  %72 = or i32 %70, %71, !dbg !63
  %73 = xor i32 %72, %29, !dbg !63
  %74 = add i32 %24, %25, !dbg !49
  %75 = shl i32 %74, 7, !dbg !49
  %76 = lshr i32 %74, 25, !dbg !49
  %77 = or i32 %75, %76, !dbg !49
  %78 = xor i32 %77, %23, !dbg !49
  %79 = add i32 %78, %25, !dbg !49
  %80 = shl i32 %79, 9, !dbg !49
  %81 = lshr i32 %79, 23, !dbg !49
  %82 = or i32 %80, %81, !dbg !49
  %83 = xor i32 %82, %22, !dbg !49
  %84 = add i32 %83, %78, !dbg !64
  %85 = shl i32 %84, 13, !dbg !64
  %86 = lshr i32 %84, 19, !dbg !64
  %87 = or i32 %85, %86, !dbg !64
  %88 = xor i32 %87, %24, !dbg !64
  %89 = add i32 %88, %83, !dbg !64
  %90 = shl i32 %89, 18, !dbg !64
  %91 = lshr i32 %89, 14, !dbg !64
  %92 = or i32 %90, %91, !dbg !64
  %93 = xor i32 %92, %25, !dbg !64
  %94 = add i32 %20, %21, !dbg !50
  %95 = shl i32 %94, 7, !dbg !50
  %96 = lshr i32 %94, 25, !dbg !50
  %97 = or i32 %95, %96, !dbg !50
  %98 = xor i32 %97, %19, !dbg !50
  %99 = add i32 %98, %21, !dbg !50
  %100 = shl i32 %99, 9, !dbg !50
  %101 = lshr i32 %99, 23, !dbg !50
  %102 = or i32 %100, %101, !dbg !50
  %103 = xor i32 %102, %18, !dbg !50
  %104 = add i32 %103, %98, !dbg !65
  %105 = shl i32 %104, 13, !dbg !65
  %106 = lshr i32 %104, 19, !dbg !65
  %107 = or i32 %105, %106, !dbg !65
  %108 = xor i32 %107, %20, !dbg !65
  %109 = add i32 %108, %103, !dbg !65
  %110 = shl i32 %109, 18, !dbg !65
  %111 = lshr i32 %109, 14, !dbg !65
  %112 = or i32 %110, %111, !dbg !65
  %113 = xor i32 %112, %21, !dbg !65
  %114 = add i32 %98, %53, !dbg !66
  %115 = shl i32 %114, 7, !dbg !66
  %116 = lshr i32 %114, 25, !dbg !66
  %117 = or i32 %115, %116, !dbg !66
  %118 = xor i32 %117, %68, !dbg !66
  %119 = add i32 %118, %53, !dbg !66
  %120 = shl i32 %119, 9, !dbg !66
  %121 = lshr i32 %119, 23, !dbg !66
  %122 = or i32 %120, %121, !dbg !66
  %123 = xor i32 %122, %83, !dbg !66
  %124 = add i32 %123, %118, !dbg !51
  %125 = shl i32 %124, 13, !dbg !51
  %126 = lshr i32 %124, 19, !dbg !51
  %127 = or i32 %125, %126, !dbg !51
  %128 = xor i32 %127, %98, !dbg !51
  %129 = add i32 %128, %123, !dbg !51
  %130 = shl i32 %129, 18, !dbg !51
  %131 = lshr i32 %129, 14, !dbg !51
  %132 = or i32 %130, %131, !dbg !51
  %133 = xor i32 %132, %53, !dbg !51
  %134 = add i32 %38, %73, !dbg !67
  %135 = shl i32 %134, 7, !dbg !67
  %136 = lshr i32 %134, 25, !dbg !67
  %137 = or i32 %135, %136, !dbg !67
  %138 = xor i32 %137, %88, !dbg !67
  %139 = add i32 %138, %73, !dbg !67
  %140 = shl i32 %139, 9, !dbg !67
  %141 = lshr i32 %139, 23, !dbg !67
  %142 = or i32 %140, %141, !dbg !67
  %143 = xor i32 %142, %103, !dbg !67
  %144 = add i32 %143, %138, !dbg !57
  %145 = shl i32 %144, 13, !dbg !57
  %146 = lshr i32 %144, 19, !dbg !57
  %147 = or i32 %145, %146, !dbg !57
  %148 = xor i32 %147, %38, !dbg !57
  %149 = add i32 %148, %143, !dbg !57
  %150 = shl i32 %149, 18, !dbg !57
  %151 = lshr i32 %149, 14, !dbg !57
  %152 = or i32 %150, %151, !dbg !57
  %153 = xor i32 %152, %73, !dbg !57
  %154 = add i32 %58, %93, !dbg !68
  %155 = shl i32 %154, 7, !dbg !68
  %156 = lshr i32 %154, 25, !dbg !68
  %157 = or i32 %155, %156, !dbg !68
  %158 = xor i32 %157, %108, !dbg !68
  %159 = add i32 %158, %93, !dbg !68
  %160 = shl i32 %159, 9, !dbg !68
  %161 = lshr i32 %159, 23, !dbg !68
  %162 = or i32 %160, %161, !dbg !68
  %163 = xor i32 %162, %43, !dbg !68
  %164 = add i32 %163, %158, !dbg !58
  %165 = shl i32 %164, 13, !dbg !58
  %166 = lshr i32 %164, 19, !dbg !58
  %167 = or i32 %165, %166, !dbg !58
  %168 = xor i32 %167, %58, !dbg !58
  %169 = add i32 %168, %163, !dbg !58
  %170 = shl i32 %169, 18, !dbg !58
  %171 = lshr i32 %169, 14, !dbg !58
  %172 = or i32 %170, %171, !dbg !58
  %173 = xor i32 %172, %93, !dbg !58
  %174 = add i32 %78, %113, !dbg !69
  %175 = shl i32 %174, 7, !dbg !69
  %176 = lshr i32 %174, 25, !dbg !69
  %177 = or i32 %175, %176, !dbg !69
  %178 = xor i32 %177, %48, !dbg !69
  %179 = add i32 %178, %113, !dbg !69
  %180 = shl i32 %179, 9, !dbg !69
  %181 = lshr i32 %179, 23, !dbg !69
  %182 = or i32 %180, %181, !dbg !69
  %183 = xor i32 %182, %63, !dbg !69
  %184 = add i32 %183, %178, !dbg !56
  %185 = shl i32 %184, 13, !dbg !56
  %186 = lshr i32 %184, 19, !dbg !56
  %187 = or i32 %185, %186, !dbg !56
  %188 = xor i32 %187, %78, !dbg !56
  %189 = add i32 %188, %183, !dbg !56
  %190 = shl i32 %189, 18, !dbg !56
  %191 = lshr i32 %189, 14, !dbg !56
  %192 = or i32 %190, %191, !dbg !56
  %193 = xor i32 %192, %113, !dbg !56
  %194 = add i32 %i.13, -2, !dbg !59
  tail call void @llvm.dbg.value(metadata !{i32 %194}, i64 0, metadata !15), !dbg !59
  %195 = icmp eq i32 %194, 0, !dbg !59
  br i1 %195, label %.preheader, label %17, !dbg !59

; <label>:196                                     ; preds = %196, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %196 ]
  %197 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 %indvars.iv, !dbg !60
  %198 = load i32* %197, align 4, !dbg !60, !tbaa !52
  %199 = getelementptr inbounds i32* %in, i64 %indvars.iv, !dbg !60
  %200 = load i32* %199, align 4, !dbg !60, !tbaa !52
  %201 = add i32 %200, %198, !dbg !60
  %202 = getelementptr inbounds i32* %out, i64 %indvars.iv, !dbg !60
  store i32 %201, i32* %202, align 4, !dbg !60, !tbaa !52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !60
  %exitcond = icmp eq i64 %indvars.iv.next, 16, !dbg !60
  br i1 %exitcond, label %203, label %196, !dbg !60

; <label>:203                                     ; preds = %196
  call void @llvm.lifetime.end(i64 64, i8* %0) #2, !dbg !70
  ret void, !dbg !70
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @salsa() #0 {
  %1 = load i32* @ptr, align 4, !dbg !71, !tbaa !52
  %2 = icmp eq i32 %1, 0, !dbg !71
  br i1 %2, label %3, label %6, !dbg !71

; <label>:3                                       ; preds = %0
  tail call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i64 0, i64 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0)), !dbg !73
  %4 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !75, !tbaa !52
  %5 = add i32 %4, 1, !dbg !75
  store i32 %5, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !75, !tbaa !52
  br label %6, !dbg !76

; <label>:6                                       ; preds = %3, %0
  %7 = load i32* @ptr, align 4, !dbg !77, !tbaa !52
  %8 = add i32 %7, 1, !dbg !77
  %9 = and i32 %8, 15, !dbg !77
  store i32 %9, i32* @ptr, align 4, !dbg !77, !tbaa !52
  %10 = zext i32 %9 to i64, !dbg !78
  %11 = getelementptr inbounds [16 x i32]* @outbuf, i64 0, i64 %10, !dbg !78
  %12 = load i32* %11, align 4, !dbg !78, !tbaa !52
  ret i32 %12, !dbg !78
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !30), !dbg !80
  tail call void @llvm.dbg.value(metadata !41, i64 0, metadata !31), !dbg !81
  tail call void @llvm.dbg.value(metadata !41, i64 0, metadata !29), !dbg !82
  br label %1, !dbg !82

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %1 ]
  %i.01 = phi i32 [ 0, %0 ], [ %7, %1 ]
  %2 = add i64 %indvars.iv, 3987450866, !dbg !84
  %3 = sub i32 -559038737, %i.01, !dbg !84
  %4 = trunc i64 %2 to i32, !dbg !84
  %5 = xor i32 %4, %3, !dbg !84
  %6 = getelementptr inbounds [16 x i32]* @STATE, i64 0, i64 %indvars.iv, !dbg !84
  store i32 %5, i32* %6, align 4, !dbg !84, !tbaa !52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !82
  %7 = add i32 %i.01, 1, !dbg !82
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !29), !dbg !82
  %exitcond2 = icmp eq i64 %indvars.iv.next, 16, !dbg !82
  br i1 %exitcond2, label %.preheader, label %1, !dbg !82

.preheader:                                       ; preds = %1, %.preheader
  %i.1 = phi i32 [ %9, %.preheader ], [ 0, %1 ]
  %8 = tail call i32 @salsa(), !dbg !85
  %9 = add i32 %i.1, 1, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !29), !dbg !87
  %exitcond = icmp eq i32 %9, 537919489, !dbg !87
  br i1 %exitcond, label %10, label %.preheader, !dbg !87

; <label>:10                                      ; preds = %.preheader
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !28), !dbg !88
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !28), !dbg !89
  %11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %8) #2, !dbg !90
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 -162172867) #2, !dbg !91
  %13 = icmp ne i32 %8, -162172867, !dbg !92
  %14 = zext i1 %13 to i32, !dbg !92
  ret i32 %14, !dbg !92
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!36, !37}
!llvm.ident = !{!38}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !32, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c] [DW_LANG_C99]
!1 = metadata !{metadata !"salsa20.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !20, metadata !23}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"salsa20", metadata !"salsa20", metadata !"", i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32*)* @salsa20, null, null, metadata !12, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [salsa20]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint32_t]
!9 = metadata !{i32 786454, metadata !10, null, metadata !"uint32_t", i32 51, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!10 = metadata !{metadata !"/usr/include/stdint.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!11 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16}
!13 = metadata !{i32 786689, metadata !4, metadata !"out", metadata !5, i32 16777231, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [out] [line 15]
!14 = metadata !{i32 786689, metadata !4, metadata !"in", metadata !5, i32 33554447, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [in] [line 15]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 16, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!16 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 16, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 16]
!17 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 32, i32 0, i32 0, metadata !9, metadata !18, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from uint32_t]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"salsa", metadata !"salsa", metadata !"", i32 42, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @salsa, null, null, metadata !2, i32 42} ; [ DW_TAG_subprogram ] [line 42] [def] [salsa]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !9}
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 52, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @main, null, null, metadata !27, i32 52} ; [ DW_TAG_subprogram ] [line 52] [def] [main]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = metadata !{metadata !28, metadata !29, metadata !30, metadata !31}
!28 = metadata !{i32 786688, metadata !23, metadata !"val", metadata !5, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 53]
!29 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 53]
!30 = metadata !{i32 786688, metadata !23, metadata !"count", metadata !5, i32 58, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 58]
!31 = metadata !{i32 786688, metadata !23, metadata !"offset", metadata !5, i32 59, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [offset] [line 59]
!32 = metadata !{metadata !33, metadata !34, metadata !35}
!33 = metadata !{i32 786484, i32 0, null, metadata !"ptr", metadata !"ptr", metadata !"", metadata !5, i32 12, metadata !9, i32 0, i32 1, i32* @ptr, null} ; [ DW_TAG_variable ] [ptr] [line 12] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"STATE", metadata !"STATE", metadata !"", metadata !5, i32 10, metadata !17, i32 0, i32 1, [16 x i32]* @STATE, null} ; [ DW_TAG_variable ] [STATE] [line 10] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"outbuf", metadata !"outbuf", metadata !"", metadata !5, i32 11, metadata !17, i32 0, i32 1, [16 x i32]* @outbuf, null} ; [ DW_TAG_variable ] [outbuf] [line 11] [def]
!36 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!37 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!38 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!39 = metadata !{i32 15, i32 0, metadata !4, null}
!40 = metadata !{i32 16, i32 0, metadata !4, null}
!41 = metadata !{i32 0}
!42 = metadata !{i32 18, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !4, i32 18, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!44 = metadata !{i32 19, i32 0, metadata !43, null}
!45 = metadata !{i32 22, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !47, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!47 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!48 = metadata !{i32 24, i32 0, metadata !46, null}
!49 = metadata !{i32 26, i32 0, metadata !46, null}
!50 = metadata !{i32 28, i32 0, metadata !46, null}
!51 = metadata !{i32 31, i32 0, metadata !46, null}
!52 = metadata !{metadata !53, metadata !53, i64 0}
!53 = metadata !{metadata !"int", metadata !54, i64 0}
!54 = metadata !{metadata !"omnipotent char", metadata !55, i64 0}
!55 = metadata !{metadata !"Simple C/C++ TBAA"}
!56 = metadata !{i32 37, i32 0, metadata !46, null}
!57 = metadata !{i32 33, i32 0, metadata !46, null}
!58 = metadata !{i32 35, i32 0, metadata !46, null}
!59 = metadata !{i32 21, i32 0, metadata !47, null}
!60 = metadata !{i32 39, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !4, i32 39, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!62 = metadata !{i32 23, i32 0, metadata !46, null}
!63 = metadata !{i32 25, i32 0, metadata !46, null}
!64 = metadata !{i32 27, i32 0, metadata !46, null}
!65 = metadata !{i32 29, i32 0, metadata !46, null}
!66 = metadata !{i32 30, i32 0, metadata !46, null}
!67 = metadata !{i32 32, i32 0, metadata !46, null}
!68 = metadata !{i32 34, i32 0, metadata !46, null}
!69 = metadata !{i32 36, i32 0, metadata !46, null}
!70 = metadata !{i32 40, i32 0, metadata !4, null}
!71 = metadata !{i32 43, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !20, i32 43, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!73 = metadata !{i32 44, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !72, i32 43, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!75 = metadata !{i32 45, i32 0, metadata !74, null}
!76 = metadata !{i32 46, i32 0, metadata !74, null}
!77 = metadata !{i32 48, i32 0, metadata !20, null}
!78 = metadata !{i32 49, i32 0, metadata !20, null}
!79 = metadata !{i32 537919488}
!80 = metadata !{i32 58, i32 0, metadata !23, null} ; [ DW_TAG_imported_module ]
!81 = metadata !{i32 59, i32 0, metadata !23, null}
!82 = metadata !{i32 62, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !23, i32 62, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!84 = metadata !{i32 63, i32 0, metadata !83, null}
!85 = metadata !{i32 66, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !23, i32 65, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!87 = metadata !{i32 65, i32 0, metadata !86, null}
!88 = metadata !{i32 68, i32 0, metadata !23, null}
!89 = metadata !{i32 69, i32 0, metadata !23, null}
!90 = metadata !{i32 71, i32 0, metadata !23, null}
!91 = metadata !{i32 72, i32 0, metadata !23, null}
!92 = metadata !{i32 73, i32 0, metadata !23, null}
