; ModuleID = 'salsa20.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ptr = global i32 0, align 4
@outbuf = common global [16 x i32] zeroinitializer, align 16
@STATE = common global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [15 x i8] c"got:       %x\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"should be: %x\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @salsa20(i32* %out, i32* %in) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %i = alloca i32, align 4
  %x = alloca [16 x i32], align 16
  store i32* %out, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !29), !dbg !30
  store i32* %in, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !31), !dbg !30
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{[16 x i32]* %x}, metadata !34), !dbg !33
  store i32 0, i32* %i, align 4, !dbg !35
  br label %3, !dbg !35

; <label>:3                                       ; preds = %15, %0
  %4 = load i32* %i, align 4, !dbg !35
  %5 = icmp ult i32 %4, 16, !dbg !35
  br i1 %5, label %6, label %18, !dbg !35

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4, !dbg !37
  %8 = zext i32 %7 to i64, !dbg !37
  %9 = load i32** %2, align 8, !dbg !37
  %10 = getelementptr inbounds i32* %9, i64 %8, !dbg !37
  %11 = load i32* %10, align 4, !dbg !37
  %12 = load i32* %i, align 4, !dbg !37
  %13 = zext i32 %12 to i64, !dbg !37
  %14 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %13, !dbg !37
  store i32 %11, i32* %14, align 4, !dbg !37
  br label %15, !dbg !37

; <label>:15                                      ; preds = %6
  %16 = load i32* %i, align 4, !dbg !35
  %17 = add i32 %16, 1, !dbg !35
  store i32 %17, i32* %i, align 4, !dbg !35
  br label %3, !dbg !35

; <label>:18                                      ; preds = %3
  store i32 20, i32* %i, align 4, !dbg !38
  br label %19, !dbg !38

; <label>:19                                      ; preds = %535, %18
  %20 = load i32* %i, align 4, !dbg !38
  %21 = icmp ugt i32 %20, 0, !dbg !38
  br i1 %21, label %22, label %538, !dbg !38

; <label>:22                                      ; preds = %19
  %23 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !40
  %24 = load i32* %23, align 4, !dbg !40
  %25 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !40
  %26 = load i32* %25, align 4, !dbg !40
  %27 = add i32 %24, %26, !dbg !40
  %28 = shl i32 %27, 7, !dbg !40
  %29 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !40
  %30 = load i32* %29, align 4, !dbg !40
  %31 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !40
  %32 = load i32* %31, align 4, !dbg !40
  %33 = add i32 %30, %32, !dbg !40
  %34 = lshr i32 %33, 25, !dbg !40
  %35 = or i32 %28, %34, !dbg !40
  %36 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !40
  %37 = load i32* %36, align 4, !dbg !40
  %38 = xor i32 %37, %35, !dbg !40
  store i32 %38, i32* %36, align 4, !dbg !40
  %39 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !40
  %40 = load i32* %39, align 4, !dbg !40
  %41 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !40
  %42 = load i32* %41, align 4, !dbg !40
  %43 = add i32 %40, %42, !dbg !40
  %44 = shl i32 %43, 9, !dbg !40
  %45 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !40
  %46 = load i32* %45, align 4, !dbg !40
  %47 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !40
  %48 = load i32* %47, align 4, !dbg !40
  %49 = add i32 %46, %48, !dbg !40
  %50 = lshr i32 %49, 23, !dbg !40
  %51 = or i32 %44, %50, !dbg !40
  %52 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !40
  %53 = load i32* %52, align 4, !dbg !40
  %54 = xor i32 %53, %51, !dbg !40
  store i32 %54, i32* %52, align 4, !dbg !40
  %55 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !42
  %56 = load i32* %55, align 4, !dbg !42
  %57 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !42
  %58 = load i32* %57, align 4, !dbg !42
  %59 = add i32 %56, %58, !dbg !42
  %60 = shl i32 %59, 13, !dbg !42
  %61 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !42
  %62 = load i32* %61, align 4, !dbg !42
  %63 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !42
  %64 = load i32* %63, align 4, !dbg !42
  %65 = add i32 %62, %64, !dbg !42
  %66 = lshr i32 %65, 19, !dbg !42
  %67 = or i32 %60, %66, !dbg !42
  %68 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !42
  %69 = load i32* %68, align 4, !dbg !42
  %70 = xor i32 %69, %67, !dbg !42
  store i32 %70, i32* %68, align 4, !dbg !42
  %71 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !42
  %72 = load i32* %71, align 4, !dbg !42
  %73 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !42
  %74 = load i32* %73, align 4, !dbg !42
  %75 = add i32 %72, %74, !dbg !42
  %76 = shl i32 %75, 18, !dbg !42
  %77 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !42
  %78 = load i32* %77, align 4, !dbg !42
  %79 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !42
  %80 = load i32* %79, align 4, !dbg !42
  %81 = add i32 %78, %80, !dbg !42
  %82 = lshr i32 %81, 14, !dbg !42
  %83 = or i32 %76, %82, !dbg !42
  %84 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !42
  %85 = load i32* %84, align 4, !dbg !42
  %86 = xor i32 %85, %83, !dbg !42
  store i32 %86, i32* %84, align 4, !dbg !42
  %87 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !43
  %88 = load i32* %87, align 4, !dbg !43
  %89 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !43
  %90 = load i32* %89, align 4, !dbg !43
  %91 = add i32 %88, %90, !dbg !43
  %92 = shl i32 %91, 7, !dbg !43
  %93 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !43
  %94 = load i32* %93, align 4, !dbg !43
  %95 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !43
  %96 = load i32* %95, align 4, !dbg !43
  %97 = add i32 %94, %96, !dbg !43
  %98 = lshr i32 %97, 25, !dbg !43
  %99 = or i32 %92, %98, !dbg !43
  %100 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !43
  %101 = load i32* %100, align 4, !dbg !43
  %102 = xor i32 %101, %99, !dbg !43
  store i32 %102, i32* %100, align 4, !dbg !43
  %103 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !43
  %104 = load i32* %103, align 4, !dbg !43
  %105 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !43
  %106 = load i32* %105, align 4, !dbg !43
  %107 = add i32 %104, %106, !dbg !43
  %108 = shl i32 %107, 9, !dbg !43
  %109 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !43
  %110 = load i32* %109, align 4, !dbg !43
  %111 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !43
  %112 = load i32* %111, align 4, !dbg !43
  %113 = add i32 %110, %112, !dbg !43
  %114 = lshr i32 %113, 23, !dbg !43
  %115 = or i32 %108, %114, !dbg !43
  %116 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !43
  %117 = load i32* %116, align 4, !dbg !43
  %118 = xor i32 %117, %115, !dbg !43
  store i32 %118, i32* %116, align 4, !dbg !43
  %119 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !44
  %120 = load i32* %119, align 4, !dbg !44
  %121 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !44
  %122 = load i32* %121, align 4, !dbg !44
  %123 = add i32 %120, %122, !dbg !44
  %124 = shl i32 %123, 13, !dbg !44
  %125 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !44
  %126 = load i32* %125, align 4, !dbg !44
  %127 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !44
  %128 = load i32* %127, align 4, !dbg !44
  %129 = add i32 %126, %128, !dbg !44
  %130 = lshr i32 %129, 19, !dbg !44
  %131 = or i32 %124, %130, !dbg !44
  %132 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !44
  %133 = load i32* %132, align 4, !dbg !44
  %134 = xor i32 %133, %131, !dbg !44
  store i32 %134, i32* %132, align 4, !dbg !44
  %135 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !44
  %136 = load i32* %135, align 4, !dbg !44
  %137 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !44
  %138 = load i32* %137, align 4, !dbg !44
  %139 = add i32 %136, %138, !dbg !44
  %140 = shl i32 %139, 18, !dbg !44
  %141 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !44
  %142 = load i32* %141, align 4, !dbg !44
  %143 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !44
  %144 = load i32* %143, align 4, !dbg !44
  %145 = add i32 %142, %144, !dbg !44
  %146 = lshr i32 %145, 14, !dbg !44
  %147 = or i32 %140, %146, !dbg !44
  %148 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !44
  %149 = load i32* %148, align 4, !dbg !44
  %150 = xor i32 %149, %147, !dbg !44
  store i32 %150, i32* %148, align 4, !dbg !44
  %151 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !45
  %152 = load i32* %151, align 4, !dbg !45
  %153 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !45
  %154 = load i32* %153, align 4, !dbg !45
  %155 = add i32 %152, %154, !dbg !45
  %156 = shl i32 %155, 7, !dbg !45
  %157 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !45
  %158 = load i32* %157, align 4, !dbg !45
  %159 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !45
  %160 = load i32* %159, align 4, !dbg !45
  %161 = add i32 %158, %160, !dbg !45
  %162 = lshr i32 %161, 25, !dbg !45
  %163 = or i32 %156, %162, !dbg !45
  %164 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !45
  %165 = load i32* %164, align 4, !dbg !45
  %166 = xor i32 %165, %163, !dbg !45
  store i32 %166, i32* %164, align 4, !dbg !45
  %167 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !45
  %168 = load i32* %167, align 4, !dbg !45
  %169 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !45
  %170 = load i32* %169, align 4, !dbg !45
  %171 = add i32 %168, %170, !dbg !45
  %172 = shl i32 %171, 9, !dbg !45
  %173 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !45
  %174 = load i32* %173, align 4, !dbg !45
  %175 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !45
  %176 = load i32* %175, align 4, !dbg !45
  %177 = add i32 %174, %176, !dbg !45
  %178 = lshr i32 %177, 23, !dbg !45
  %179 = or i32 %172, %178, !dbg !45
  %180 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !45
  %181 = load i32* %180, align 4, !dbg !45
  %182 = xor i32 %181, %179, !dbg !45
  store i32 %182, i32* %180, align 4, !dbg !45
  %183 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !46
  %184 = load i32* %183, align 4, !dbg !46
  %185 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !46
  %186 = load i32* %185, align 4, !dbg !46
  %187 = add i32 %184, %186, !dbg !46
  %188 = shl i32 %187, 13, !dbg !46
  %189 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !46
  %190 = load i32* %189, align 4, !dbg !46
  %191 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !46
  %192 = load i32* %191, align 4, !dbg !46
  %193 = add i32 %190, %192, !dbg !46
  %194 = lshr i32 %193, 19, !dbg !46
  %195 = or i32 %188, %194, !dbg !46
  %196 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !46
  %197 = load i32* %196, align 4, !dbg !46
  %198 = xor i32 %197, %195, !dbg !46
  store i32 %198, i32* %196, align 4, !dbg !46
  %199 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !46
  %200 = load i32* %199, align 4, !dbg !46
  %201 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !46
  %202 = load i32* %201, align 4, !dbg !46
  %203 = add i32 %200, %202, !dbg !46
  %204 = shl i32 %203, 18, !dbg !46
  %205 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !46
  %206 = load i32* %205, align 4, !dbg !46
  %207 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !46
  %208 = load i32* %207, align 4, !dbg !46
  %209 = add i32 %206, %208, !dbg !46
  %210 = lshr i32 %209, 14, !dbg !46
  %211 = or i32 %204, %210, !dbg !46
  %212 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !46
  %213 = load i32* %212, align 4, !dbg !46
  %214 = xor i32 %213, %211, !dbg !46
  store i32 %214, i32* %212, align 4, !dbg !46
  %215 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !47
  %216 = load i32* %215, align 4, !dbg !47
  %217 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !47
  %218 = load i32* %217, align 4, !dbg !47
  %219 = add i32 %216, %218, !dbg !47
  %220 = shl i32 %219, 7, !dbg !47
  %221 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !47
  %222 = load i32* %221, align 4, !dbg !47
  %223 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !47
  %224 = load i32* %223, align 4, !dbg !47
  %225 = add i32 %222, %224, !dbg !47
  %226 = lshr i32 %225, 25, !dbg !47
  %227 = or i32 %220, %226, !dbg !47
  %228 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !47
  %229 = load i32* %228, align 4, !dbg !47
  %230 = xor i32 %229, %227, !dbg !47
  store i32 %230, i32* %228, align 4, !dbg !47
  %231 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !47
  %232 = load i32* %231, align 4, !dbg !47
  %233 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !47
  %234 = load i32* %233, align 4, !dbg !47
  %235 = add i32 %232, %234, !dbg !47
  %236 = shl i32 %235, 9, !dbg !47
  %237 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !47
  %238 = load i32* %237, align 4, !dbg !47
  %239 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !47
  %240 = load i32* %239, align 4, !dbg !47
  %241 = add i32 %238, %240, !dbg !47
  %242 = lshr i32 %241, 23, !dbg !47
  %243 = or i32 %236, %242, !dbg !47
  %244 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !47
  %245 = load i32* %244, align 4, !dbg !47
  %246 = xor i32 %245, %243, !dbg !47
  store i32 %246, i32* %244, align 4, !dbg !47
  %247 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !48
  %248 = load i32* %247, align 4, !dbg !48
  %249 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !48
  %250 = load i32* %249, align 4, !dbg !48
  %251 = add i32 %248, %250, !dbg !48
  %252 = shl i32 %251, 13, !dbg !48
  %253 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !48
  %254 = load i32* %253, align 4, !dbg !48
  %255 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !48
  %256 = load i32* %255, align 4, !dbg !48
  %257 = add i32 %254, %256, !dbg !48
  %258 = lshr i32 %257, 19, !dbg !48
  %259 = or i32 %252, %258, !dbg !48
  %260 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !48
  %261 = load i32* %260, align 4, !dbg !48
  %262 = xor i32 %261, %259, !dbg !48
  store i32 %262, i32* %260, align 4, !dbg !48
  %263 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !48
  %264 = load i32* %263, align 4, !dbg !48
  %265 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !48
  %266 = load i32* %265, align 4, !dbg !48
  %267 = add i32 %264, %266, !dbg !48
  %268 = shl i32 %267, 18, !dbg !48
  %269 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !48
  %270 = load i32* %269, align 4, !dbg !48
  %271 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !48
  %272 = load i32* %271, align 4, !dbg !48
  %273 = add i32 %270, %272, !dbg !48
  %274 = lshr i32 %273, 14, !dbg !48
  %275 = or i32 %268, %274, !dbg !48
  %276 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !48
  %277 = load i32* %276, align 4, !dbg !48
  %278 = xor i32 %277, %275, !dbg !48
  store i32 %278, i32* %276, align 4, !dbg !48
  %279 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !49
  %280 = load i32* %279, align 4, !dbg !49
  %281 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !49
  %282 = load i32* %281, align 4, !dbg !49
  %283 = add i32 %280, %282, !dbg !49
  %284 = shl i32 %283, 7, !dbg !49
  %285 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !49
  %286 = load i32* %285, align 4, !dbg !49
  %287 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !49
  %288 = load i32* %287, align 4, !dbg !49
  %289 = add i32 %286, %288, !dbg !49
  %290 = lshr i32 %289, 25, !dbg !49
  %291 = or i32 %284, %290, !dbg !49
  %292 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !49
  %293 = load i32* %292, align 4, !dbg !49
  %294 = xor i32 %293, %291, !dbg !49
  store i32 %294, i32* %292, align 4, !dbg !49
  %295 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !49
  %296 = load i32* %295, align 4, !dbg !49
  %297 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !49
  %298 = load i32* %297, align 4, !dbg !49
  %299 = add i32 %296, %298, !dbg !49
  %300 = shl i32 %299, 9, !dbg !49
  %301 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !49
  %302 = load i32* %301, align 4, !dbg !49
  %303 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !49
  %304 = load i32* %303, align 4, !dbg !49
  %305 = add i32 %302, %304, !dbg !49
  %306 = lshr i32 %305, 23, !dbg !49
  %307 = or i32 %300, %306, !dbg !49
  %308 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !49
  %309 = load i32* %308, align 4, !dbg !49
  %310 = xor i32 %309, %307, !dbg !49
  store i32 %310, i32* %308, align 4, !dbg !49
  %311 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !50
  %312 = load i32* %311, align 4, !dbg !50
  %313 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !50
  %314 = load i32* %313, align 4, !dbg !50
  %315 = add i32 %312, %314, !dbg !50
  %316 = shl i32 %315, 13, !dbg !50
  %317 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !50
  %318 = load i32* %317, align 4, !dbg !50
  %319 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !50
  %320 = load i32* %319, align 4, !dbg !50
  %321 = add i32 %318, %320, !dbg !50
  %322 = lshr i32 %321, 19, !dbg !50
  %323 = or i32 %316, %322, !dbg !50
  %324 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !50
  %325 = load i32* %324, align 4, !dbg !50
  %326 = xor i32 %325, %323, !dbg !50
  store i32 %326, i32* %324, align 4, !dbg !50
  %327 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !50
  %328 = load i32* %327, align 4, !dbg !50
  %329 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !50
  %330 = load i32* %329, align 4, !dbg !50
  %331 = add i32 %328, %330, !dbg !50
  %332 = shl i32 %331, 18, !dbg !50
  %333 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !50
  %334 = load i32* %333, align 4, !dbg !50
  %335 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !50
  %336 = load i32* %335, align 4, !dbg !50
  %337 = add i32 %334, %336, !dbg !50
  %338 = lshr i32 %337, 14, !dbg !50
  %339 = or i32 %332, %338, !dbg !50
  %340 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !50
  %341 = load i32* %340, align 4, !dbg !50
  %342 = xor i32 %341, %339, !dbg !50
  store i32 %342, i32* %340, align 4, !dbg !50
  %343 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !51
  %344 = load i32* %343, align 4, !dbg !51
  %345 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !51
  %346 = load i32* %345, align 4, !dbg !51
  %347 = add i32 %344, %346, !dbg !51
  %348 = shl i32 %347, 7, !dbg !51
  %349 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !51
  %350 = load i32* %349, align 4, !dbg !51
  %351 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !51
  %352 = load i32* %351, align 4, !dbg !51
  %353 = add i32 %350, %352, !dbg !51
  %354 = lshr i32 %353, 25, !dbg !51
  %355 = or i32 %348, %354, !dbg !51
  %356 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !51
  %357 = load i32* %356, align 4, !dbg !51
  %358 = xor i32 %357, %355, !dbg !51
  store i32 %358, i32* %356, align 4, !dbg !51
  %359 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !51
  %360 = load i32* %359, align 4, !dbg !51
  %361 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !51
  %362 = load i32* %361, align 4, !dbg !51
  %363 = add i32 %360, %362, !dbg !51
  %364 = shl i32 %363, 9, !dbg !51
  %365 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !51
  %366 = load i32* %365, align 4, !dbg !51
  %367 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !51
  %368 = load i32* %367, align 4, !dbg !51
  %369 = add i32 %366, %368, !dbg !51
  %370 = lshr i32 %369, 23, !dbg !51
  %371 = or i32 %364, %370, !dbg !51
  %372 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !51
  %373 = load i32* %372, align 4, !dbg !51
  %374 = xor i32 %373, %371, !dbg !51
  store i32 %374, i32* %372, align 4, !dbg !51
  %375 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !52
  %376 = load i32* %375, align 4, !dbg !52
  %377 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !52
  %378 = load i32* %377, align 4, !dbg !52
  %379 = add i32 %376, %378, !dbg !52
  %380 = shl i32 %379, 13, !dbg !52
  %381 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !52
  %382 = load i32* %381, align 4, !dbg !52
  %383 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !52
  %384 = load i32* %383, align 4, !dbg !52
  %385 = add i32 %382, %384, !dbg !52
  %386 = lshr i32 %385, 19, !dbg !52
  %387 = or i32 %380, %386, !dbg !52
  %388 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !52
  %389 = load i32* %388, align 4, !dbg !52
  %390 = xor i32 %389, %387, !dbg !52
  store i32 %390, i32* %388, align 4, !dbg !52
  %391 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !52
  %392 = load i32* %391, align 4, !dbg !52
  %393 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !52
  %394 = load i32* %393, align 4, !dbg !52
  %395 = add i32 %392, %394, !dbg !52
  %396 = shl i32 %395, 18, !dbg !52
  %397 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !52
  %398 = load i32* %397, align 4, !dbg !52
  %399 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !52
  %400 = load i32* %399, align 4, !dbg !52
  %401 = add i32 %398, %400, !dbg !52
  %402 = lshr i32 %401, 14, !dbg !52
  %403 = or i32 %396, %402, !dbg !52
  %404 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !52
  %405 = load i32* %404, align 4, !dbg !52
  %406 = xor i32 %405, %403, !dbg !52
  store i32 %406, i32* %404, align 4, !dbg !52
  %407 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !53
  %408 = load i32* %407, align 4, !dbg !53
  %409 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !53
  %410 = load i32* %409, align 4, !dbg !53
  %411 = add i32 %408, %410, !dbg !53
  %412 = shl i32 %411, 7, !dbg !53
  %413 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !53
  %414 = load i32* %413, align 4, !dbg !53
  %415 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !53
  %416 = load i32* %415, align 4, !dbg !53
  %417 = add i32 %414, %416, !dbg !53
  %418 = lshr i32 %417, 25, !dbg !53
  %419 = or i32 %412, %418, !dbg !53
  %420 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !53
  %421 = load i32* %420, align 4, !dbg !53
  %422 = xor i32 %421, %419, !dbg !53
  store i32 %422, i32* %420, align 4, !dbg !53
  %423 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !53
  %424 = load i32* %423, align 4, !dbg !53
  %425 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !53
  %426 = load i32* %425, align 4, !dbg !53
  %427 = add i32 %424, %426, !dbg !53
  %428 = shl i32 %427, 9, !dbg !53
  %429 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !53
  %430 = load i32* %429, align 4, !dbg !53
  %431 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !53
  %432 = load i32* %431, align 4, !dbg !53
  %433 = add i32 %430, %432, !dbg !53
  %434 = lshr i32 %433, 23, !dbg !53
  %435 = or i32 %428, %434, !dbg !53
  %436 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !53
  %437 = load i32* %436, align 4, !dbg !53
  %438 = xor i32 %437, %435, !dbg !53
  store i32 %438, i32* %436, align 4, !dbg !53
  %439 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !54
  %440 = load i32* %439, align 4, !dbg !54
  %441 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !54
  %442 = load i32* %441, align 4, !dbg !54
  %443 = add i32 %440, %442, !dbg !54
  %444 = shl i32 %443, 13, !dbg !54
  %445 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !54
  %446 = load i32* %445, align 4, !dbg !54
  %447 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !54
  %448 = load i32* %447, align 4, !dbg !54
  %449 = add i32 %446, %448, !dbg !54
  %450 = lshr i32 %449, 19, !dbg !54
  %451 = or i32 %444, %450, !dbg !54
  %452 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !54
  %453 = load i32* %452, align 4, !dbg !54
  %454 = xor i32 %453, %451, !dbg !54
  store i32 %454, i32* %452, align 4, !dbg !54
  %455 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !54
  %456 = load i32* %455, align 4, !dbg !54
  %457 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !54
  %458 = load i32* %457, align 4, !dbg !54
  %459 = add i32 %456, %458, !dbg !54
  %460 = shl i32 %459, 18, !dbg !54
  %461 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !54
  %462 = load i32* %461, align 4, !dbg !54
  %463 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !54
  %464 = load i32* %463, align 4, !dbg !54
  %465 = add i32 %462, %464, !dbg !54
  %466 = lshr i32 %465, 14, !dbg !54
  %467 = or i32 %460, %466, !dbg !54
  %468 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !54
  %469 = load i32* %468, align 4, !dbg !54
  %470 = xor i32 %469, %467, !dbg !54
  store i32 %470, i32* %468, align 4, !dbg !54
  %471 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !55
  %472 = load i32* %471, align 4, !dbg !55
  %473 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !55
  %474 = load i32* %473, align 4, !dbg !55
  %475 = add i32 %472, %474, !dbg !55
  %476 = shl i32 %475, 7, !dbg !55
  %477 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !55
  %478 = load i32* %477, align 4, !dbg !55
  %479 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !55
  %480 = load i32* %479, align 4, !dbg !55
  %481 = add i32 %478, %480, !dbg !55
  %482 = lshr i32 %481, 25, !dbg !55
  %483 = or i32 %476, %482, !dbg !55
  %484 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !55
  %485 = load i32* %484, align 4, !dbg !55
  %486 = xor i32 %485, %483, !dbg !55
  store i32 %486, i32* %484, align 4, !dbg !55
  %487 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !55
  %488 = load i32* %487, align 4, !dbg !55
  %489 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !55
  %490 = load i32* %489, align 4, !dbg !55
  %491 = add i32 %488, %490, !dbg !55
  %492 = shl i32 %491, 9, !dbg !55
  %493 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !55
  %494 = load i32* %493, align 4, !dbg !55
  %495 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !55
  %496 = load i32* %495, align 4, !dbg !55
  %497 = add i32 %494, %496, !dbg !55
  %498 = lshr i32 %497, 23, !dbg !55
  %499 = or i32 %492, %498, !dbg !55
  %500 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !55
  %501 = load i32* %500, align 4, !dbg !55
  %502 = xor i32 %501, %499, !dbg !55
  store i32 %502, i32* %500, align 4, !dbg !55
  %503 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !56
  %504 = load i32* %503, align 4, !dbg !56
  %505 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !56
  %506 = load i32* %505, align 4, !dbg !56
  %507 = add i32 %504, %506, !dbg !56
  %508 = shl i32 %507, 13, !dbg !56
  %509 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !56
  %510 = load i32* %509, align 4, !dbg !56
  %511 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !56
  %512 = load i32* %511, align 4, !dbg !56
  %513 = add i32 %510, %512, !dbg !56
  %514 = lshr i32 %513, 19, !dbg !56
  %515 = or i32 %508, %514, !dbg !56
  %516 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !56
  %517 = load i32* %516, align 4, !dbg !56
  %518 = xor i32 %517, %515, !dbg !56
  store i32 %518, i32* %516, align 4, !dbg !56
  %519 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !56
  %520 = load i32* %519, align 4, !dbg !56
  %521 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !56
  %522 = load i32* %521, align 4, !dbg !56
  %523 = add i32 %520, %522, !dbg !56
  %524 = shl i32 %523, 18, !dbg !56
  %525 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !56
  %526 = load i32* %525, align 4, !dbg !56
  %527 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !56
  %528 = load i32* %527, align 4, !dbg !56
  %529 = add i32 %526, %528, !dbg !56
  %530 = lshr i32 %529, 14, !dbg !56
  %531 = or i32 %524, %530, !dbg !56
  %532 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !56
  %533 = load i32* %532, align 4, !dbg !56
  %534 = xor i32 %533, %531, !dbg !56
  store i32 %534, i32* %532, align 4, !dbg !56
  br label %535, !dbg !57

; <label>:535                                     ; preds = %22
  %536 = load i32* %i, align 4, !dbg !38
  %537 = sub i32 %536, 2, !dbg !38
  store i32 %537, i32* %i, align 4, !dbg !38
  br label %19, !dbg !38

; <label>:538                                     ; preds = %19
  store i32 0, i32* %i, align 4, !dbg !58
  br label %539, !dbg !58

; <label>:539                                     ; preds = %557, %538
  %540 = load i32* %i, align 4, !dbg !58
  %541 = icmp ult i32 %540, 16, !dbg !58
  br i1 %541, label %542, label %560, !dbg !58

; <label>:542                                     ; preds = %539
  %543 = load i32* %i, align 4, !dbg !58
  %544 = zext i32 %543 to i64, !dbg !58
  %545 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %544, !dbg !58
  %546 = load i32* %545, align 4, !dbg !58
  %547 = load i32* %i, align 4, !dbg !58
  %548 = zext i32 %547 to i64, !dbg !58
  %549 = load i32** %2, align 8, !dbg !58
  %550 = getelementptr inbounds i32* %549, i64 %548, !dbg !58
  %551 = load i32* %550, align 4, !dbg !58
  %552 = add i32 %546, %551, !dbg !58
  %553 = load i32* %i, align 4, !dbg !58
  %554 = zext i32 %553 to i64, !dbg !58
  %555 = load i32** %1, align 8, !dbg !58
  %556 = getelementptr inbounds i32* %555, i64 %554, !dbg !58
  store i32 %552, i32* %556, align 4, !dbg !58
  br label %557, !dbg !58

; <label>:557                                     ; preds = %542
  %558 = load i32* %i, align 4, !dbg !58
  %559 = add i32 %558, 1, !dbg !58
  store i32 %559, i32* %i, align 4, !dbg !58
  br label %539, !dbg !58

; <label>:560                                     ; preds = %539
  ret void, !dbg !60
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @salsa() #0 {
  %1 = load i32* @ptr, align 4, !dbg !61
  %2 = icmp eq i32 %1, 0, !dbg !61
  br i1 %2, label %3, label %7, !dbg !61

; <label>:3                                       ; preds = %0
  call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i32 0, i32 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 0)), !dbg !63
  %4 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i64 0), align 4, !dbg !65
  %5 = add i32 %4, 1, !dbg !65
  store i32 %5, i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i64 0), align 4, !dbg !65
  %6 = zext i32 %4 to i64, !dbg !65
  br label %7, !dbg !66

; <label>:7                                       ; preds = %3, %0
  %8 = load i32* @ptr, align 4, !dbg !67
  %9 = add i32 %8, 1, !dbg !67
  %10 = and i32 %9, 15, !dbg !67
  store i32 %10, i32* @ptr, align 4, !dbg !67
  %11 = load i32* @ptr, align 4, !dbg !68
  %12 = zext i32 %11 to i64, !dbg !68
  %13 = getelementptr inbounds [16 x i32]* @outbuf, i32 0, i64 %12, !dbg !68
  %14 = load i32* %13, align 4, !dbg !68
  ret i32 %14, !dbg !68
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %offset = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !69), !dbg !70
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !71), !dbg !70
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !72), !dbg !73
  store i32 537919488, i32* %count, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %offset}, metadata !74), !dbg !75
  store i32 0, i32* %offset, align 4, !dbg !75
  store i32 0, i32* %i, align 4, !dbg !76
  br label %2, !dbg !76

; <label>:2                                       ; preds = %15, %0
  %3 = load i32* %i, align 4, !dbg !76
  %4 = icmp ult i32 %3, 16, !dbg !76
  br i1 %4, label %5, label %18, !dbg !76

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !78
  %7 = add i32 %6, 13, !dbg !78
  %8 = add i32 -307516443, %7, !dbg !78
  %9 = load i32* %i, align 4, !dbg !78
  %10 = sub i32 -559038737, %9, !dbg !78
  %11 = xor i32 %8, %10, !dbg !78
  %12 = load i32* %i, align 4, !dbg !78
  %13 = zext i32 %12 to i64, !dbg !78
  %14 = getelementptr inbounds [16 x i32]* @STATE, i32 0, i64 %13, !dbg !78
  store i32 %11, i32* %14, align 4, !dbg !78
  br label %15, !dbg !78

; <label>:15                                      ; preds = %5
  %16 = load i32* %i, align 4, !dbg !76
  %17 = add i32 %16, 1, !dbg !76
  store i32 %17, i32* %i, align 4, !dbg !76
  br label %2, !dbg !76

; <label>:18                                      ; preds = %2
  store i32 0, i32* %i, align 4, !dbg !79
  br label %19, !dbg !79

; <label>:19                                      ; preds = %25, %18
  %20 = load i32* %i, align 4, !dbg !79
  %21 = load i32* %count, align 4, !dbg !79
  %22 = icmp ult i32 %20, %21, !dbg !79
  br i1 %22, label %23, label %28, !dbg !79

; <label>:23                                      ; preds = %19
  %24 = call i32 @salsa(), !dbg !81
  br label %25, !dbg !81

; <label>:25                                      ; preds = %23
  %26 = load i32* %i, align 4, !dbg !79
  %27 = add i32 %26, 1, !dbg !79
  store i32 %27, i32* %i, align 4, !dbg !79
  br label %19, !dbg !79

; <label>:28                                      ; preds = %19
  %29 = call i32 @salsa(), !dbg !82
  store i32 %29, i32* %val, align 4, !dbg !82
  %30 = load i32* %offset, align 4, !dbg !83
  %31 = load i32* %val, align 4, !dbg !83
  %32 = add i32 %31, %30, !dbg !83
  store i32 %32, i32* %val, align 4, !dbg !83
  %33 = load i32* %val, align 4, !dbg !84
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %33), !dbg !84
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 -162172867), !dbg !85
  %36 = load i32* %val, align 4, !dbg !86
  %37 = icmp ne i32 %36, -162172867, !dbg !86
  %38 = zext i1 %37 to i32, !dbg !86
  ret i32 %38, !dbg !86
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!26, !27}
!llvm.ident = !{!28}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !19, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c] [DW_LANG_C99]
!1 = metadata !{metadata !"salsa20.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"salsa20", metadata !"salsa20", metadata !"", i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*)* @salsa20, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [salsa20]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint32_t]
!9 = metadata !{i32 786454, metadata !10, null, metadata !"uint32_t", i32 51, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!10 = metadata !{metadata !"/usr/include/stdint.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!11 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"salsa", metadata !"salsa", metadata !"", i32 42, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @salsa, null, null, metadata !2, i32 42} ; [ DW_TAG_subprogram ] [line 42] [def] [salsa]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !9}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 52, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !2, i32 52} ; [ DW_TAG_subprogram ] [line 52] [def] [main]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{metadata !20, metadata !21, metadata !25}
!20 = metadata !{i32 786484, i32 0, null, metadata !"ptr", metadata !"ptr", metadata !"", metadata !5, i32 12, metadata !9, i32 0, i32 1, i32* @ptr, null} ; [ DW_TAG_variable ] [ptr] [line 12] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"STATE", metadata !"STATE", metadata !"", metadata !5, i32 10, metadata !22, i32 0, i32 1, [16 x i32]* @STATE, null} ; [ DW_TAG_variable ] [STATE] [line 10] [def]
!22 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 32, i32 0, i32 0, metadata !9, metadata !23, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from uint32_t]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!25 = metadata !{i32 786484, i32 0, null, metadata !"outbuf", metadata !"outbuf", metadata !"", metadata !5, i32 11, metadata !22, i32 0, i32 1, [16 x i32]* @outbuf, null} ; [ DW_TAG_variable ] [outbuf] [line 11] [def]
!26 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!27 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!28 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!29 = metadata !{i32 786689, metadata !4, metadata !"out", metadata !5, i32 16777231, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [out] [line 15]
!30 = metadata !{i32 15, i32 0, metadata !4, null}
!31 = metadata !{i32 786689, metadata !4, metadata !"in", metadata !5, i32 33554447, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [in] [line 15]
!32 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 16, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!33 = metadata !{i32 16, i32 0, metadata !4, null}
!34 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 16, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 16]
!35 = metadata !{i32 18, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !4, i32 18, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!37 = metadata !{i32 19, i32 0, metadata !36, null}
!38 = metadata !{i32 21, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!40 = metadata !{i32 22, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !39, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!42 = metadata !{i32 23, i32 0, metadata !41, null}
!43 = metadata !{i32 24, i32 0, metadata !41, null}
!44 = metadata !{i32 25, i32 0, metadata !41, null}
!45 = metadata !{i32 26, i32 0, metadata !41, null}
!46 = metadata !{i32 27, i32 0, metadata !41, null}
!47 = metadata !{i32 28, i32 0, metadata !41, null}
!48 = metadata !{i32 29, i32 0, metadata !41, null}
!49 = metadata !{i32 30, i32 0, metadata !41, null}
!50 = metadata !{i32 31, i32 0, metadata !41, null}
!51 = metadata !{i32 32, i32 0, metadata !41, null}
!52 = metadata !{i32 33, i32 0, metadata !41, null}
!53 = metadata !{i32 34, i32 0, metadata !41, null}
!54 = metadata !{i32 35, i32 0, metadata !41, null}
!55 = metadata !{i32 36, i32 0, metadata !41, null}
!56 = metadata !{i32 37, i32 0, metadata !41, null}
!57 = metadata !{i32 38, i32 0, metadata !41, null}
!58 = metadata !{i32 39, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !4, i32 39, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!60 = metadata !{i32 40, i32 0, metadata !4, null}
!61 = metadata !{i32 43, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !12, i32 43, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!63 = metadata !{i32 44, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 43, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!65 = metadata !{i32 45, i32 0, metadata !64, null}
!66 = metadata !{i32 46, i32 0, metadata !64, null}
!67 = metadata !{i32 48, i32 0, metadata !12, null}
!68 = metadata !{i32 49, i32 0, metadata !12, null}
!69 = metadata !{i32 786688, metadata !15, metadata !"val", metadata !5, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 53]
!70 = metadata !{i32 53, i32 0, metadata !15, null}
!71 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 53]
!72 = metadata !{i32 786688, metadata !15, metadata !"count", metadata !5, i32 58, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 58]
!73 = metadata !{i32 58, i32 0, metadata !15, null} ; [ DW_TAG_imported_module ]
!74 = metadata !{i32 786688, metadata !15, metadata !"offset", metadata !5, i32 59, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [offset] [line 59]
!75 = metadata !{i32 59, i32 0, metadata !15, null}
!76 = metadata !{i32 62, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !15, i32 62, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!78 = metadata !{i32 63, i32 0, metadata !77, null}
!79 = metadata !{i32 65, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !15, i32 65, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/salsa20.c]
!81 = metadata !{i32 66, i32 0, metadata !80, null}
!82 = metadata !{i32 68, i32 0, metadata !15, null}
!83 = metadata !{i32 69, i32 0, metadata !15, null}
!84 = metadata !{i32 71, i32 0, metadata !15, null}
!85 = metadata !{i32 72, i32 0, metadata !15, null}
!86 = metadata !{i32 73, i32 0, metadata !15, null}
