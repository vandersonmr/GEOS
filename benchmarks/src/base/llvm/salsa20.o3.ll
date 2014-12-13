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
  %17 = bitcast [16 x i32]* %x to i64*, !dbg !51
  %.promoted = load i64* %17, align 16, !dbg !51
  %18 = trunc i64 %.promoted to i32, !dbg !51
  %19 = bitcast i32* %2 to i64*, !dbg !52
  %.promoted4 = load i64* %19, align 16, !dbg !52
  %20 = trunc i64 %.promoted4 to i32, !dbg !52
  %21 = bitcast i32* %3 to i64*, !dbg !53
  %.promoted6 = load i64* %21, align 16, !dbg !53
  %22 = trunc i64 %.promoted6 to i32, !dbg !53
  %23 = bitcast i32* %4 to i64*, !dbg !54
  %.promoted8 = load i64* %23, align 16, !dbg !54
  %24 = trunc i64 %.promoted8 to i32, !dbg !54
  %25 = lshr i64 %.promoted6, 32
  %26 = trunc i64 %25 to i32
  %27 = lshr i64 %.promoted, 32
  %28 = trunc i64 %27 to i32
  %29 = lshr i64 %.promoted8, 32
  %30 = trunc i64 %29 to i32
  %31 = lshr i64 %.promoted4, 32
  %32 = trunc i64 %31 to i32
  %33 = bitcast i32* %9 to i64*, !dbg !54
  %.promoted18 = load i64* %33, align 8, !dbg !54
  %34 = trunc i64 %.promoted18 to i32, !dbg !54
  %35 = bitcast i32* %10 to i64*, !dbg !53
  %.promoted20 = load i64* %35, align 8, !dbg !53
  %36 = trunc i64 %.promoted20 to i32, !dbg !53
  %37 = bitcast i32* %11 to i64*, !dbg !52
  %.promoted22 = load i64* %37, align 8, !dbg !52
  %38 = trunc i64 %.promoted22 to i32, !dbg !52
  %39 = bitcast i32* %12 to i64*, !dbg !51
  %.promoted24 = load i64* %39, align 8, !dbg !51
  %40 = trunc i64 %.promoted24 to i32, !dbg !51
  %41 = lshr i64 %.promoted22, 32
  %42 = trunc i64 %41 to i32
  %43 = lshr i64 %.promoted18, 32
  %44 = trunc i64 %43 to i32
  %45 = lshr i64 %.promoted24, 32
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %.promoted20, 32
  %48 = trunc i64 %47 to i32
  br label %49, !dbg !55

.preheader:                                       ; preds = %49
  store i32 %165, i32* %1, align 16, !dbg !51, !tbaa !56
  store i32 %210, i32* %2, align 16, !dbg !52, !tbaa !56
  store i32 %180, i32* %3, align 16, !dbg !53, !tbaa !56
  store i32 %195, i32* %4, align 16, !dbg !54, !tbaa !56
  store i32 %185, i32* %5, align 4, !dbg !53, !tbaa !56
  store i32 %150, i32* %6, align 4, !dbg !51, !tbaa !56
  store i32 %200, i32* %7, align 4, !dbg !54, !tbaa !56
  store i32 %215, i32* %8, align 4, !dbg !52, !tbaa !56
  store i32 %205, i32* %9, align 8, !dbg !54, !tbaa !56
  store i32 %170, i32* %10, align 8, !dbg !53, !tbaa !56
  store i32 %220, i32* %11, align 8, !dbg !52, !tbaa !56
  store i32 %155, i32* %12, align 8, !dbg !51, !tbaa !56
  store i32 %225, i32* %13, align 4, !dbg !52, !tbaa !56
  store i32 %190, i32* %14, align 4, !dbg !54, !tbaa !56
  store i32 %160, i32* %15, align 4, !dbg !51, !tbaa !56
  store i32 %175, i32* %16, align 4, !dbg !53, !tbaa !56
  br label %228, !dbg !60

; <label>:49                                      ; preds = %.preheader1, %49
  %50 = phi i32 [ %48, %.preheader1 ], [ %175, %49 ], !dbg !45
  %51 = phi i32 [ %46, %.preheader1 ], [ %160, %49 ], !dbg !45
  %52 = phi i32 [ %44, %.preheader1 ], [ %190, %49 ], !dbg !45
  %53 = phi i32 [ %42, %.preheader1 ], [ %225, %49 ], !dbg !45
  %54 = phi i32 [ %40, %.preheader1 ], [ %155, %49 ], !dbg !45
  %55 = phi i32 [ %38, %.preheader1 ], [ %220, %49 ], !dbg !45
  %56 = phi i32 [ %36, %.preheader1 ], [ %170, %49 ], !dbg !45
  %57 = phi i32 [ %34, %.preheader1 ], [ %205, %49 ], !dbg !45
  %58 = phi i32 [ %32, %.preheader1 ], [ %215, %49 ], !dbg !45
  %59 = phi i32 [ %30, %.preheader1 ], [ %200, %49 ], !dbg !45
  %60 = phi i32 [ %28, %.preheader1 ], [ %150, %49 ], !dbg !45
  %61 = phi i32 [ %26, %.preheader1 ], [ %185, %49 ], !dbg !45
  %62 = phi i32 [ %24, %.preheader1 ], [ %195, %49 ], !dbg !45
  %63 = phi i32 [ %22, %.preheader1 ], [ %180, %49 ], !dbg !45
  %64 = phi i32 [ %20, %.preheader1 ], [ %210, %49 ], !dbg !45
  %65 = phi i32 [ %18, %.preheader1 ], [ %165, %49 ], !dbg !45
  %i.13 = phi i32 [ 20, %.preheader1 ], [ %226, %49 ]
  %66 = add i32 %64, %65, !dbg !45
  %67 = shl i32 %66, 7, !dbg !45
  %68 = lshr i32 %66, 25, !dbg !45
  %69 = or i32 %67, %68, !dbg !45
  %70 = xor i32 %69, %63, !dbg !45
  %71 = add i32 %70, %65, !dbg !45
  %72 = shl i32 %71, 9, !dbg !45
  %73 = lshr i32 %71, 23, !dbg !45
  %74 = or i32 %72, %73, !dbg !45
  %75 = xor i32 %74, %62, !dbg !45
  %76 = add i32 %75, %70, !dbg !62
  %77 = shl i32 %76, 13, !dbg !62
  %78 = lshr i32 %76, 19, !dbg !62
  %79 = or i32 %77, %78, !dbg !62
  %80 = xor i32 %79, %64, !dbg !62
  %81 = add i32 %80, %75, !dbg !62
  %82 = shl i32 %81, 18, !dbg !62
  %83 = lshr i32 %81, 14, !dbg !62
  %84 = or i32 %82, %83, !dbg !62
  %85 = xor i32 %84, %65, !dbg !62
  %86 = add i32 %60, %61, !dbg !48
  %87 = shl i32 %86, 7, !dbg !48
  %88 = lshr i32 %86, 25, !dbg !48
  %89 = or i32 %87, %88, !dbg !48
  %90 = xor i32 %89, %59, !dbg !48
  %91 = add i32 %90, %61, !dbg !48
  %92 = shl i32 %91, 9, !dbg !48
  %93 = lshr i32 %91, 23, !dbg !48
  %94 = or i32 %92, %93, !dbg !48
  %95 = xor i32 %94, %58, !dbg !48
  %96 = add i32 %95, %90, !dbg !63
  %97 = shl i32 %96, 13, !dbg !63
  %98 = lshr i32 %96, 19, !dbg !63
  %99 = or i32 %97, %98, !dbg !63
  %100 = xor i32 %99, %60, !dbg !63
  %101 = add i32 %100, %95, !dbg !63
  %102 = shl i32 %101, 18, !dbg !63
  %103 = lshr i32 %101, 14, !dbg !63
  %104 = or i32 %102, %103, !dbg !63
  %105 = xor i32 %104, %61, !dbg !63
  %106 = add i32 %56, %57, !dbg !49
  %107 = shl i32 %106, 7, !dbg !49
  %108 = lshr i32 %106, 25, !dbg !49
  %109 = or i32 %107, %108, !dbg !49
  %110 = xor i32 %109, %55, !dbg !49
  %111 = add i32 %110, %57, !dbg !49
  %112 = shl i32 %111, 9, !dbg !49
  %113 = lshr i32 %111, 23, !dbg !49
  %114 = or i32 %112, %113, !dbg !49
  %115 = xor i32 %114, %54, !dbg !49
  %116 = add i32 %115, %110, !dbg !64
  %117 = shl i32 %116, 13, !dbg !64
  %118 = lshr i32 %116, 19, !dbg !64
  %119 = or i32 %117, %118, !dbg !64
  %120 = xor i32 %119, %56, !dbg !64
  %121 = add i32 %120, %115, !dbg !64
  %122 = shl i32 %121, 18, !dbg !64
  %123 = lshr i32 %121, 14, !dbg !64
  %124 = or i32 %122, %123, !dbg !64
  %125 = xor i32 %124, %57, !dbg !64
  %126 = add i32 %52, %53, !dbg !50
  %127 = shl i32 %126, 7, !dbg !50
  %128 = lshr i32 %126, 25, !dbg !50
  %129 = or i32 %127, %128, !dbg !50
  %130 = xor i32 %129, %51, !dbg !50
  %131 = add i32 %130, %53, !dbg !50
  %132 = shl i32 %131, 9, !dbg !50
  %133 = lshr i32 %131, 23, !dbg !50
  %134 = or i32 %132, %133, !dbg !50
  %135 = xor i32 %134, %50, !dbg !50
  %136 = add i32 %135, %130, !dbg !65
  %137 = shl i32 %136, 13, !dbg !65
  %138 = lshr i32 %136, 19, !dbg !65
  %139 = or i32 %137, %138, !dbg !65
  %140 = xor i32 %139, %52, !dbg !65
  %141 = add i32 %140, %135, !dbg !65
  %142 = shl i32 %141, 18, !dbg !65
  %143 = lshr i32 %141, 14, !dbg !65
  %144 = or i32 %142, %143, !dbg !65
  %145 = xor i32 %144, %53, !dbg !65
  %146 = add i32 %130, %85, !dbg !66
  %147 = shl i32 %146, 7, !dbg !66
  %148 = lshr i32 %146, 25, !dbg !66
  %149 = or i32 %147, %148, !dbg !66
  %150 = xor i32 %149, %100, !dbg !66
  %151 = add i32 %150, %85, !dbg !66
  %152 = shl i32 %151, 9, !dbg !66
  %153 = lshr i32 %151, 23, !dbg !66
  %154 = or i32 %152, %153, !dbg !66
  %155 = xor i32 %154, %115, !dbg !66
  %156 = add i32 %155, %150, !dbg !51
  %157 = shl i32 %156, 13, !dbg !51
  %158 = lshr i32 %156, 19, !dbg !51
  %159 = or i32 %157, %158, !dbg !51
  %160 = xor i32 %159, %130, !dbg !51
  %161 = add i32 %160, %155, !dbg !51
  %162 = shl i32 %161, 18, !dbg !51
  %163 = lshr i32 %161, 14, !dbg !51
  %164 = or i32 %162, %163, !dbg !51
  %165 = xor i32 %164, %85, !dbg !51
  %166 = add i32 %70, %105, !dbg !67
  %167 = shl i32 %166, 7, !dbg !67
  %168 = lshr i32 %166, 25, !dbg !67
  %169 = or i32 %167, %168, !dbg !67
  %170 = xor i32 %169, %120, !dbg !67
  %171 = add i32 %170, %105, !dbg !67
  %172 = shl i32 %171, 9, !dbg !67
  %173 = lshr i32 %171, 23, !dbg !67
  %174 = or i32 %172, %173, !dbg !67
  %175 = xor i32 %174, %135, !dbg !67
  %176 = add i32 %175, %170, !dbg !53
  %177 = shl i32 %176, 13, !dbg !53
  %178 = lshr i32 %176, 19, !dbg !53
  %179 = or i32 %177, %178, !dbg !53
  %180 = xor i32 %179, %70, !dbg !53
  %181 = add i32 %180, %175, !dbg !53
  %182 = shl i32 %181, 18, !dbg !53
  %183 = lshr i32 %181, 14, !dbg !53
  %184 = or i32 %182, %183, !dbg !53
  %185 = xor i32 %184, %105, !dbg !53
  %186 = add i32 %90, %125, !dbg !68
  %187 = shl i32 %186, 7, !dbg !68
  %188 = lshr i32 %186, 25, !dbg !68
  %189 = or i32 %187, %188, !dbg !68
  %190 = xor i32 %189, %140, !dbg !68
  %191 = add i32 %190, %125, !dbg !68
  %192 = shl i32 %191, 9, !dbg !68
  %193 = lshr i32 %191, 23, !dbg !68
  %194 = or i32 %192, %193, !dbg !68
  %195 = xor i32 %194, %75, !dbg !68
  %196 = add i32 %195, %190, !dbg !54
  %197 = shl i32 %196, 13, !dbg !54
  %198 = lshr i32 %196, 19, !dbg !54
  %199 = or i32 %197, %198, !dbg !54
  %200 = xor i32 %199, %90, !dbg !54
  %201 = add i32 %200, %195, !dbg !54
  %202 = shl i32 %201, 18, !dbg !54
  %203 = lshr i32 %201, 14, !dbg !54
  %204 = or i32 %202, %203, !dbg !54
  %205 = xor i32 %204, %125, !dbg !54
  %206 = add i32 %110, %145, !dbg !69
  %207 = shl i32 %206, 7, !dbg !69
  %208 = lshr i32 %206, 25, !dbg !69
  %209 = or i32 %207, %208, !dbg !69
  %210 = xor i32 %209, %80, !dbg !69
  %211 = add i32 %210, %145, !dbg !69
  %212 = shl i32 %211, 9, !dbg !69
  %213 = lshr i32 %211, 23, !dbg !69
  %214 = or i32 %212, %213, !dbg !69
  %215 = xor i32 %214, %95, !dbg !69
  %216 = add i32 %215, %210, !dbg !52
  %217 = shl i32 %216, 13, !dbg !52
  %218 = lshr i32 %216, 19, !dbg !52
  %219 = or i32 %217, %218, !dbg !52
  %220 = xor i32 %219, %110, !dbg !52
  %221 = add i32 %220, %215, !dbg !52
  %222 = shl i32 %221, 18, !dbg !52
  %223 = lshr i32 %221, 14, !dbg !52
  %224 = or i32 %222, %223, !dbg !52
  %225 = xor i32 %224, %145, !dbg !52
  %226 = add i32 %i.13, -2, !dbg !55
  tail call void @llvm.dbg.value(metadata !{i32 %226}, i64 0, metadata !15), !dbg !55
  %227 = icmp eq i32 %226, 0, !dbg !55
  br i1 %227, label %.preheader, label %49, !dbg !55

; <label>:228                                     ; preds = %._crit_edge, %.preheader
  %229 = phi i32 [ %165, %.preheader ], [ %.pre, %._crit_edge ]
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %230 = getelementptr inbounds i32* %in, i64 %indvars.iv, !dbg !60
  %231 = load i32* %230, align 4, !dbg !60, !tbaa !56
  %232 = add i32 %231, %229, !dbg !60
  %233 = getelementptr inbounds i32* %out, i64 %indvars.iv, !dbg !60
  store i32 %232, i32* %233, align 4, !dbg !60, !tbaa !56
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !60
  %exitcond = icmp eq i64 %indvars.iv.next, 16, !dbg !60
  br i1 %exitcond, label %234, label %._crit_edge, !dbg !60

._crit_edge:                                      ; preds = %228
  %.phi.trans.insert = getelementptr inbounds [16 x i32]* %x, i64 0, i64 %indvars.iv.next
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !60, !tbaa !56
  br label %228, !dbg !60

; <label>:234                                     ; preds = %228
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
  %1 = load i32* @ptr, align 4, !dbg !71, !tbaa !56
  %2 = icmp eq i32 %1, 0, !dbg !71
  br i1 %2, label %3, label %6, !dbg !71

; <label>:3                                       ; preds = %0
  tail call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i64 0, i64 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0)), !dbg !73
  %4 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !75, !tbaa !56
  %5 = add i32 %4, 1, !dbg !75
  store i32 %5, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !75, !tbaa !56
  %.pre = load i32* @ptr, align 4, !dbg !76, !tbaa !56
  br label %6, !dbg !77

; <label>:6                                       ; preds = %3, %0
  %7 = phi i32 [ %.pre, %3 ], [ %1, %0 ]
  %8 = add i32 %7, 1, !dbg !76
  %9 = and i32 %8, 15, !dbg !76
  store i32 %9, i32* @ptr, align 4, !dbg !76, !tbaa !56
  %10 = zext i32 %9 to i64, !dbg !78
  %11 = getelementptr inbounds [16 x i32]* @outbuf, i64 0, i64 %10, !dbg !78
  %12 = load i32* %11, align 4, !dbg !78, !tbaa !56
  ret i32 %12, !dbg !78
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
vector.ph:
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !30), !dbg !80
  tail call void @llvm.dbg.value(metadata !41, i64 0, metadata !31), !dbg !81
  tail call void @llvm.dbg.value(metadata !41, i64 0, metadata !29), !dbg !82
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !82
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %0 = trunc i64 %index to i32
  %broadcast.splatinsert4 = insertelement <2 x i32> undef, i32 %0, i32 0
  %broadcast.splat5 = shufflevector <2 x i32> %broadcast.splatinsert4, <2 x i32> undef, <2 x i32> zeroinitializer
  %1 = add <2 x i64> %broadcast.splat, <i64 3987450866, i64 3987450867>, !dbg !84
  %2 = sub <2 x i32> <i32 -559038737, i32 -559038738>, %broadcast.splat5, !dbg !84
  %3 = trunc <2 x i64> %1 to <2 x i32>, !dbg !84
  %4 = xor <2 x i32> %3, %2, !dbg !84
  %5 = getelementptr inbounds [16 x i32]* @STATE, i64 0, i64 %index, !dbg !84
  %6 = bitcast i32* %5 to <2 x i32>*, !dbg !84
  store <2 x i32> %4, <2 x i32>* %6, align 8, !dbg !84
  %index.next = add i64 %index, 2, !dbg !82
  %7 = icmp eq i64 %index.next, 16, !dbg !82
  br i1 %7, label %.preheader, label %vector.body, !dbg !82, !llvm.loop !85

.preheader:                                       ; preds = %vector.body
  %.pre = load i32* @ptr, align 4, !dbg !88, !tbaa !56
  br label %8, !dbg !91

; <label>:8                                       ; preds = %salsa.exit, %.preheader
  %9 = phi i32 [ %16, %salsa.exit ], [ %.pre, %.preheader ]
  %i.1 = phi i32 [ %20, %salsa.exit ], [ 0, %.preheader ]
  %10 = icmp eq i32 %9, 0, !dbg !88
  br i1 %10, label %11, label %salsa.exit, !dbg !88

; <label>:11                                      ; preds = %8
  tail call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i64 0, i64 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0)) #2, !dbg !92
  %12 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !93, !tbaa !56
  %13 = add i32 %12, 1, !dbg !93
  store i32 %13, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !93, !tbaa !56
  %.pre.i = load i32* @ptr, align 4, !dbg !94, !tbaa !56
  br label %salsa.exit, !dbg !95

salsa.exit:                                       ; preds = %8, %11
  %14 = phi i32 [ %.pre.i, %11 ], [ %9, %8 ]
  %15 = add i32 %14, 1, !dbg !94
  %16 = and i32 %15, 15, !dbg !94
  store i32 %16, i32* @ptr, align 4, !dbg !94, !tbaa !56
  %17 = zext i32 %16 to i64, !dbg !96
  %18 = getelementptr inbounds [16 x i32]* @outbuf, i64 0, i64 %17, !dbg !96
  %19 = load i32* %18, align 4, !dbg !96, !tbaa !56
  %20 = add i32 %i.1, 1, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !29), !dbg !91
  %exitcond = icmp eq i32 %20, 537919489, !dbg !91
  br i1 %exitcond, label %21, label %8, !dbg !91

; <label>:21                                      ; preds = %salsa.exit
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !28), !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !28), !dbg !98
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %19) #2, !dbg !99
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 -162172867) #2, !dbg !100
  %24 = icmp ne i32 %19, -162172867, !dbg !101
  %25 = zext i1 %24 to i32, !dbg !101
  ret i32 %25, !dbg !101
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
!52 = metadata !{i32 37, i32 0, metadata !46, null}
!53 = metadata !{i32 33, i32 0, metadata !46, null}
!54 = metadata !{i32 35, i32 0, metadata !46, null}
!55 = metadata !{i32 21, i32 0, metadata !47, null}
!56 = metadata !{metadata !57, metadata !57, i64 0}
!57 = metadata !{metadata !"int", metadata !58, i64 0}
!58 = metadata !{metadata !"omnipotent char", metadata !59, i64 0}
!59 = metadata !{metadata !"Simple C/C++ TBAA"}
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
!76 = metadata !{i32 48, i32 0, metadata !20, null}
!77 = metadata !{i32 46, i32 0, metadata !74, null}
!78 = metadata !{i32 49, i32 0, metadata !20, null}
!79 = metadata !{i32 537919488}
!80 = metadata !{i32 58, i32 0, metadata !23, null} ; [ DW_TAG_imported_module ]
!81 = metadata !{i32 59, i32 0, metadata !23, null}
!82 = metadata !{i32 62, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !23, i32 62, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!84 = metadata !{i32 63, i32 0, metadata !83, null}
!85 = metadata !{metadata !85, metadata !86, metadata !87}
!86 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!87 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!88 = metadata !{i32 43, i32 0, metadata !72, metadata !89}
!89 = metadata !{i32 66, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !23, i32 65, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!91 = metadata !{i32 65, i32 0, metadata !90, null}
!92 = metadata !{i32 44, i32 0, metadata !74, metadata !89}
!93 = metadata !{i32 45, i32 0, metadata !74, metadata !89}
!94 = metadata !{i32 48, i32 0, metadata !20, metadata !89}
!95 = metadata !{i32 46, i32 0, metadata !74, metadata !89}
!96 = metadata !{i32 49, i32 0, metadata !20, metadata !89}
!97 = metadata !{i32 68, i32 0, metadata !23, null}
!98 = metadata !{i32 69, i32 0, metadata !23, null}
!99 = metadata !{i32 71, i32 0, metadata !23, null}
!100 = metadata !{i32 72, i32 0, metadata !23, null}
!101 = metadata !{i32 73, i32 0, metadata !23, null}
