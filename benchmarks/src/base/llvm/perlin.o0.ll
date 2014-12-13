; ModuleID = 'perlin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@p = internal global [512 x i32] zeroinitializer, align 16
@permutation = internal global [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %sum = alloca double, align 8
  store i32 0, i32* %1
  %2 = call i32 @init(), !dbg !33
  call void @llvm.dbg.declare(metadata !{double* %x}, metadata !34), !dbg !35
  call void @llvm.dbg.declare(metadata !{double* %y}, metadata !36), !dbg !35
  call void @llvm.dbg.declare(metadata !{double* %z}, metadata !37), !dbg !35
  call void @llvm.dbg.declare(metadata !{double* %sum}, metadata !38), !dbg !35
  store double 0.000000e+00, double* %sum, align 8, !dbg !35
  store double -1.135257e+04, double* %x, align 8, !dbg !39
  br label %3, !dbg !39

; <label>:3                                       ; preds = %29, %0
  %4 = load double* %x, align 8, !dbg !39
  %5 = fcmp olt double %4, 2.356157e+04, !dbg !39
  br i1 %5, label %6, label %32, !dbg !39

; <label>:6                                       ; preds = %3
  store double -3.461235e+02, double* %y, align 8, !dbg !41
  br label %7, !dbg !41

; <label>:7                                       ; preds = %25, %6
  %8 = load double* %y, align 8, !dbg !41
  %9 = fcmp olt double %8, 1.241240e+02, !dbg !41
  br i1 %9, label %10, label %28, !dbg !41

; <label>:10                                      ; preds = %7
  store double -1.562350e+02, double* %z, align 8, !dbg !43
  br label %11, !dbg !43

; <label>:11                                      ; preds = %21, %10
  %12 = load double* %y, align 8, !dbg !43
  %13 = fcmp olt double %12, 2.323450e+01, !dbg !43
  br i1 %13, label %14, label %24, !dbg !43

; <label>:14                                      ; preds = %11
  %15 = load double* %x, align 8, !dbg !45
  %16 = load double* %y, align 8, !dbg !45
  %17 = load double* %z, align 8, !dbg !45
  %18 = call double @noise(double %15, double %16, double %17), !dbg !45
  %19 = load double* %sum, align 8, !dbg !45
  %20 = fadd double %19, %18, !dbg !45
  store double %20, double* %sum, align 8, !dbg !45
  br label %21, !dbg !45

; <label>:21                                      ; preds = %14
  %22 = load double* %y, align 8, !dbg !43
  %23 = fadd double %22, 2.450000e+00, !dbg !43
  store double %23, double* %y, align 8, !dbg !43
  br label %11, !dbg !43

; <label>:24                                      ; preds = %11
  br label %25, !dbg !45

; <label>:25                                      ; preds = %24
  %26 = load double* %y, align 8, !dbg !41
  %27 = fadd double %26, 1.432500e+00, !dbg !41
  store double %27, double* %y, align 8, !dbg !41
  br label %7, !dbg !41

; <label>:28                                      ; preds = %7
  br label %29, !dbg !46

; <label>:29                                      ; preds = %28
  %30 = load double* %x, align 8, !dbg !39
  %31 = fadd double %30, 1.235000e-01, !dbg !39
  store double %31, double* %x, align 8, !dbg !39
  br label %3, !dbg !39

; <label>:32                                      ; preds = %3
  %33 = load double* %sum, align 8, !dbg !47
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %33), !dbg !47
  ret i32 0, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal double @noise(double %x, double %y, double %z) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %X = alloca i32, align 4
  %Y = alloca i32, align 4
  %Z = alloca i32, align 4
  %u = alloca double, align 8
  %v = alloca double, align 8
  %w = alloca double, align 8
  %A = alloca i32, align 4
  %AA = alloca i32, align 4
  %AB = alloca i32, align 4
  %B = alloca i32, align 4
  %BA = alloca i32, align 4
  %BB = alloca i32, align 4
  store double %x, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !49), !dbg !50
  store double %y, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !51), !dbg !50
  store double %z, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !52), !dbg !50
  call void @llvm.dbg.declare(metadata !{i32* %X}, metadata !53), !dbg !54
  %4 = load double* %1, align 8, !dbg !54
  %5 = call double @floor(double %4) #1, !dbg !54
  %6 = fptosi double %5 to i32, !dbg !54
  %7 = and i32 %6, 255, !dbg !54
  store i32 %7, i32* %X, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %Y}, metadata !55), !dbg !56
  %8 = load double* %2, align 8, !dbg !56
  %9 = call double @floor(double %8) #1, !dbg !56
  %10 = fptosi double %9 to i32, !dbg !56
  %11 = and i32 %10, 255, !dbg !56
  store i32 %11, i32* %Y, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata !{i32* %Z}, metadata !57), !dbg !58
  %12 = load double* %3, align 8, !dbg !58
  %13 = call double @floor(double %12) #1, !dbg !58
  %14 = fptosi double %13 to i32, !dbg !58
  %15 = and i32 %14, 255, !dbg !58
  store i32 %15, i32* %Z, align 4, !dbg !58
  %16 = load double* %1, align 8, !dbg !59
  %17 = call double @floor(double %16) #1, !dbg !59
  %18 = load double* %1, align 8, !dbg !59
  %19 = fsub double %18, %17, !dbg !59
  store double %19, double* %1, align 8, !dbg !59
  %20 = load double* %2, align 8, !dbg !60
  %21 = call double @floor(double %20) #1, !dbg !60
  %22 = load double* %2, align 8, !dbg !60
  %23 = fsub double %22, %21, !dbg !60
  store double %23, double* %2, align 8, !dbg !60
  %24 = load double* %3, align 8, !dbg !61
  %25 = call double @floor(double %24) #1, !dbg !61
  %26 = load double* %3, align 8, !dbg !61
  %27 = fsub double %26, %25, !dbg !61
  store double %27, double* %3, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata !{double* %u}, metadata !62), !dbg !63
  %28 = load double* %1, align 8, !dbg !63
  %29 = call double @fade(double %28), !dbg !63
  store double %29, double* %u, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata !{double* %v}, metadata !64), !dbg !65
  %30 = load double* %2, align 8, !dbg !65
  %31 = call double @fade(double %30), !dbg !65
  store double %31, double* %v, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata !{double* %w}, metadata !66), !dbg !67
  %32 = load double* %3, align 8, !dbg !67
  %33 = call double @fade(double %32), !dbg !67
  store double %33, double* %w, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata !{i32* %A}, metadata !68), !dbg !69
  %34 = load i32* %X, align 4, !dbg !69
  %35 = sext i32 %34 to i64, !dbg !69
  %36 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %35, !dbg !69
  %37 = load i32* %36, align 4, !dbg !69
  %38 = load i32* %Y, align 4, !dbg !69
  %39 = add nsw i32 %37, %38, !dbg !69
  store i32 %39, i32* %A, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %AA}, metadata !70), !dbg !69
  %40 = load i32* %A, align 4, !dbg !69
  %41 = sext i32 %40 to i64, !dbg !69
  %42 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %41, !dbg !69
  %43 = load i32* %42, align 4, !dbg !69
  %44 = load i32* %Z, align 4, !dbg !69
  %45 = add nsw i32 %43, %44, !dbg !69
  store i32 %45, i32* %AA, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %AB}, metadata !71), !dbg !69
  %46 = load i32* %A, align 4, !dbg !69
  %47 = add nsw i32 %46, 1, !dbg !69
  %48 = sext i32 %47 to i64, !dbg !69
  %49 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %48, !dbg !69
  %50 = load i32* %49, align 4, !dbg !69
  %51 = load i32* %Z, align 4, !dbg !69
  %52 = add nsw i32 %50, %51, !dbg !69
  store i32 %52, i32* %AB, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %B}, metadata !72), !dbg !73
  %53 = load i32* %X, align 4, !dbg !69
  %54 = add nsw i32 %53, 1, !dbg !69
  %55 = sext i32 %54 to i64, !dbg !69
  %56 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %55, !dbg !69
  %57 = load i32* %56, align 4, !dbg !69
  %58 = load i32* %Y, align 4, !dbg !69
  %59 = add nsw i32 %57, %58, !dbg !69
  store i32 %59, i32* %B, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %BA}, metadata !74), !dbg !73
  %60 = load i32* %B, align 4, !dbg !69
  %61 = sext i32 %60 to i64, !dbg !69
  %62 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %61, !dbg !69
  %63 = load i32* %62, align 4, !dbg !69
  %64 = load i32* %Z, align 4, !dbg !69
  %65 = add nsw i32 %63, %64, !dbg !69
  store i32 %65, i32* %BA, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %BB}, metadata !75), !dbg !73
  %66 = load i32* %B, align 4, !dbg !69
  %67 = add nsw i32 %66, 1, !dbg !69
  %68 = sext i32 %67 to i64, !dbg !69
  %69 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %68, !dbg !69
  %70 = load i32* %69, align 4, !dbg !69
  %71 = load i32* %Z, align 4, !dbg !69
  %72 = add nsw i32 %70, %71, !dbg !69
  store i32 %72, i32* %BB, align 4, !dbg !69
  %73 = load double* %w, align 8, !dbg !76
  %74 = load double* %v, align 8, !dbg !76
  %75 = load double* %u, align 8, !dbg !76
  %76 = load i32* %AA, align 4, !dbg !76
  %77 = sext i32 %76 to i64, !dbg !76
  %78 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %77, !dbg !76
  %79 = load i32* %78, align 4, !dbg !76
  %80 = load double* %1, align 8, !dbg !76
  %81 = load double* %2, align 8, !dbg !76
  %82 = load double* %3, align 8, !dbg !76
  %83 = call double @grad(i32 %79, double %80, double %81, double %82), !dbg !76
  %84 = load i32* %BA, align 4, !dbg !77
  %85 = sext i32 %84 to i64, !dbg !77
  %86 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %85, !dbg !77
  %87 = load i32* %86, align 4, !dbg !77
  %88 = load double* %1, align 8, !dbg !77
  %89 = fsub double %88, 1.000000e+00, !dbg !77
  %90 = load double* %2, align 8, !dbg !77
  %91 = load double* %3, align 8, !dbg !77
  %92 = call double @grad(i32 %87, double %89, double %90, double %91), !dbg !77
  %93 = call double @lerp(double %75, double %83, double %92), !dbg !76
  %94 = load double* %u, align 8, !dbg !78
  %95 = load i32* %AB, align 4, !dbg !78
  %96 = sext i32 %95 to i64, !dbg !78
  %97 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %96, !dbg !78
  %98 = load i32* %97, align 4, !dbg !78
  %99 = load double* %1, align 8, !dbg !78
  %100 = load double* %2, align 8, !dbg !78
  %101 = fsub double %100, 1.000000e+00, !dbg !78
  %102 = load double* %3, align 8, !dbg !78
  %103 = call double @grad(i32 %98, double %99, double %101, double %102), !dbg !78
  %104 = load i32* %BB, align 4, !dbg !79
  %105 = sext i32 %104 to i64, !dbg !79
  %106 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %105, !dbg !79
  %107 = load i32* %106, align 4, !dbg !79
  %108 = load double* %1, align 8, !dbg !79
  %109 = fsub double %108, 1.000000e+00, !dbg !79
  %110 = load double* %2, align 8, !dbg !79
  %111 = fsub double %110, 1.000000e+00, !dbg !79
  %112 = load double* %3, align 8, !dbg !79
  %113 = call double @grad(i32 %107, double %109, double %111, double %112), !dbg !79
  %114 = call double @lerp(double %94, double %103, double %113), !dbg !78
  %115 = call double @lerp(double %74, double %93, double %114), !dbg !76
  %116 = load double* %v, align 8, !dbg !80
  %117 = load double* %u, align 8, !dbg !80
  %118 = load i32* %AA, align 4, !dbg !80
  %119 = add nsw i32 %118, 1, !dbg !80
  %120 = sext i32 %119 to i64, !dbg !80
  %121 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %120, !dbg !80
  %122 = load i32* %121, align 4, !dbg !80
  %123 = load double* %1, align 8, !dbg !80
  %124 = load double* %2, align 8, !dbg !80
  %125 = load double* %3, align 8, !dbg !80
  %126 = fsub double %125, 1.000000e+00, !dbg !80
  %127 = call double @grad(i32 %122, double %123, double %124, double %126), !dbg !80
  %128 = load i32* %BA, align 4, !dbg !81
  %129 = add nsw i32 %128, 1, !dbg !81
  %130 = sext i32 %129 to i64, !dbg !81
  %131 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %130, !dbg !81
  %132 = load i32* %131, align 4, !dbg !81
  %133 = load double* %1, align 8, !dbg !81
  %134 = fsub double %133, 1.000000e+00, !dbg !81
  %135 = load double* %2, align 8, !dbg !81
  %136 = load double* %3, align 8, !dbg !81
  %137 = fsub double %136, 1.000000e+00, !dbg !81
  %138 = call double @grad(i32 %132, double %134, double %135, double %137), !dbg !81
  %139 = call double @lerp(double %117, double %127, double %138), !dbg !80
  %140 = load double* %u, align 8, !dbg !82
  %141 = load i32* %AB, align 4, !dbg !82
  %142 = add nsw i32 %141, 1, !dbg !82
  %143 = sext i32 %142 to i64, !dbg !82
  %144 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %143, !dbg !82
  %145 = load i32* %144, align 4, !dbg !82
  %146 = load double* %1, align 8, !dbg !82
  %147 = load double* %2, align 8, !dbg !82
  %148 = fsub double %147, 1.000000e+00, !dbg !82
  %149 = load double* %3, align 8, !dbg !82
  %150 = fsub double %149, 1.000000e+00, !dbg !82
  %151 = call double @grad(i32 %145, double %146, double %148, double %150), !dbg !82
  %152 = load i32* %BB, align 4, !dbg !83
  %153 = add nsw i32 %152, 1, !dbg !83
  %154 = sext i32 %153 to i64, !dbg !83
  %155 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %154, !dbg !83
  %156 = load i32* %155, align 4, !dbg !83
  %157 = load double* %1, align 8, !dbg !83
  %158 = fsub double %157, 1.000000e+00, !dbg !83
  %159 = load double* %2, align 8, !dbg !83
  %160 = fsub double %159, 1.000000e+00, !dbg !83
  %161 = load double* %3, align 8, !dbg !83
  %162 = fsub double %161, 1.000000e+00, !dbg !83
  %163 = call double @grad(i32 %156, double %158, double %160, double %162), !dbg !83
  %164 = call double @lerp(double %140, double %151, double %163), !dbg !82
  %165 = call double @lerp(double %116, double %139, double %164), !dbg !80
  %166 = call double @lerp(double %73, double %115, double %165), !dbg !76
  ret double %166, !dbg !76
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone
declare double @floor(double) #3

; Function Attrs: nounwind uwtable
define internal double @fade(double %t) #0 {
  %1 = alloca double, align 8
  store double %t, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !84), !dbg !85
  %2 = load double* %1, align 8, !dbg !85
  %3 = load double* %1, align 8, !dbg !85
  %4 = fmul double %2, %3, !dbg !85
  %5 = load double* %1, align 8, !dbg !85
  %6 = fmul double %4, %5, !dbg !85
  %7 = load double* %1, align 8, !dbg !85
  %8 = load double* %1, align 8, !dbg !85
  %9 = fmul double %8, 6.000000e+00, !dbg !85
  %10 = fsub double %9, 1.500000e+01, !dbg !85
  %11 = fmul double %7, %10, !dbg !85
  %12 = fadd double %11, 1.000000e+01, !dbg !85
  %13 = fmul double %6, %12, !dbg !85
  ret double %13, !dbg !85
}

; Function Attrs: nounwind uwtable
define internal double @lerp(double %t, double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %t, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !86), !dbg !87
  store double %a, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !88), !dbg !87
  store double %b, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !89), !dbg !87
  %4 = load double* %2, align 8, !dbg !87
  %5 = load double* %1, align 8, !dbg !87
  %6 = load double* %3, align 8, !dbg !87
  %7 = load double* %2, align 8, !dbg !87
  %8 = fsub double %6, %7, !dbg !87
  %9 = fmul double %5, %8, !dbg !87
  %10 = fadd double %4, %9, !dbg !87
  ret double %10, !dbg !87
}

; Function Attrs: nounwind uwtable
define internal double @grad(i32 %hash, double %x, double %y, double %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %h = alloca i32, align 4
  %u = alloca double, align 8
  %v = alloca double, align 8
  store i32 %hash, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !90), !dbg !91
  store double %x, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !92), !dbg !91
  store double %y, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !93), !dbg !91
  store double %z, double* %4, align 8
  call void @llvm.dbg.declare(metadata !{double* %4}, metadata !94), !dbg !91
  call void @llvm.dbg.declare(metadata !{i32* %h}, metadata !95), !dbg !96
  %5 = load i32* %1, align 4, !dbg !96
  %6 = and i32 %5, 15, !dbg !96
  store i32 %6, i32* %h, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata !{double* %u}, metadata !97), !dbg !98
  %7 = load i32* %h, align 4, !dbg !98
  %8 = icmp slt i32 %7, 8, !dbg !98
  br i1 %8, label %9, label %11, !dbg !98

; <label>:9                                       ; preds = %0
  %10 = load double* %2, align 8, !dbg !98
  br label %13, !dbg !98

; <label>:11                                      ; preds = %0
  %12 = load double* %3, align 8, !dbg !98
  br label %13, !dbg !98

; <label>:13                                      ; preds = %11, %9
  %14 = phi double [ %10, %9 ], [ %12, %11 ], !dbg !98
  store double %14, double* %u, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata !{double* %v}, metadata !99), !dbg !100
  %15 = load i32* %h, align 4, !dbg !98
  %16 = icmp slt i32 %15, 4, !dbg !98
  br i1 %16, label %17, label %19, !dbg !98

; <label>:17                                      ; preds = %13
  %18 = load double* %3, align 8, !dbg !98
  br label %31, !dbg !98

; <label>:19                                      ; preds = %13
  %20 = load i32* %h, align 4, !dbg !98
  %21 = icmp eq i32 %20, 12, !dbg !98
  br i1 %21, label %25, label %22, !dbg !98

; <label>:22                                      ; preds = %19
  %23 = load i32* %h, align 4, !dbg !98
  %24 = icmp eq i32 %23, 14, !dbg !98
  br i1 %24, label %25, label %27, !dbg !98

; <label>:25                                      ; preds = %22, %19
  %26 = load double* %2, align 8, !dbg !98
  br label %29, !dbg !98

; <label>:27                                      ; preds = %22
  %28 = load double* %4, align 8, !dbg !98
  br label %29, !dbg !98

; <label>:29                                      ; preds = %27, %25
  %30 = phi double [ %26, %25 ], [ %28, %27 ], !dbg !98
  br label %31, !dbg !98

; <label>:31                                      ; preds = %29, %17
  %32 = phi double [ %18, %17 ], [ %30, %29 ], !dbg !98
  store double %32, double* %v, align 8, !dbg !98
  %33 = load i32* %h, align 4, !dbg !101
  %34 = and i32 %33, 1, !dbg !101
  %35 = icmp eq i32 %34, 0, !dbg !101
  br i1 %35, label %36, label %38, !dbg !101

; <label>:36                                      ; preds = %31
  %37 = load double* %u, align 8, !dbg !101
  br label %41, !dbg !101

; <label>:38                                      ; preds = %31
  %39 = load double* %u, align 8, !dbg !101
  %40 = fsub double -0.000000e+00, %39, !dbg !101
  br label %41, !dbg !101

; <label>:41                                      ; preds = %38, %36
  %42 = phi double [ %37, %36 ], [ %40, %38 ], !dbg !101
  %43 = load i32* %h, align 4, !dbg !101
  %44 = and i32 %43, 2, !dbg !101
  %45 = icmp eq i32 %44, 0, !dbg !101
  br i1 %45, label %46, label %48, !dbg !101

; <label>:46                                      ; preds = %41
  %47 = load double* %v, align 8, !dbg !101
  br label %51, !dbg !101

; <label>:48                                      ; preds = %41
  %49 = load double* %v, align 8, !dbg !101
  %50 = fsub double -0.000000e+00, %49, !dbg !101
  br label %51, !dbg !101

; <label>:51                                      ; preds = %48, %46
  %52 = phi double [ %47, %46 ], [ %50, %48 ], !dbg !101
  %53 = fadd double %42, %52, !dbg !101
  ret double %53, !dbg !101
}

; Function Attrs: nounwind uwtable
define internal i32 @init() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !102), !dbg !103
  store i32 0, i32* %i, align 4, !dbg !103
  store i32 0, i32* %i, align 4, !dbg !104
  br label %2, !dbg !104

; <label>:2                                       ; preds = %17, %0
  %3 = load i32* %i, align 4, !dbg !104
  %4 = icmp slt i32 %3, 256, !dbg !104
  br i1 %4, label %5, label %20, !dbg !104

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !106
  %7 = sext i32 %6 to i64, !dbg !106
  %8 = getelementptr inbounds [256 x i32]* @permutation, i32 0, i64 %7, !dbg !106
  %9 = load i32* %8, align 4, !dbg !106
  %10 = load i32* %i, align 4, !dbg !106
  %11 = sext i32 %10 to i64, !dbg !106
  %12 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %11, !dbg !106
  store i32 %9, i32* %12, align 4, !dbg !106
  %13 = load i32* %i, align 4, !dbg !106
  %14 = add nsw i32 256, %13, !dbg !106
  %15 = sext i32 %14 to i64, !dbg !106
  %16 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %15, !dbg !106
  store i32 %9, i32* %16, align 4, !dbg !106
  br label %17, !dbg !106

; <label>:17                                      ; preds = %5
  %18 = load i32* %i, align 4, !dbg !104
  %19 = add nsw i32 %18, 1, !dbg !104
  store i32 %19, i32* %i, align 4, !dbg !104
  br label %2, !dbg !104

; <label>:20                                      ; preds = %2
  %21 = load i32* %1, !dbg !107
  ret i32 %21, !dbg !107
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !21, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c] [DW_LANG_C99]
!1 = metadata !{metadata !"perlin.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !16, metadata !17, metadata !20}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 64, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 64} ; [ DW_TAG_subprogram ] [line 64] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"noise", metadata !"noise", metadata !"", i32 35, metadata !10, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double, double, double)* @noise, null, null, metadata !2, i32 35} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [noise]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12, metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"grad", metadata !"grad", metadata !"", i32 28, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, double, double, double)* @grad, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 28] [local] [def] [grad]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !12, metadata !8, metadata !12, metadata !12, metadata !12}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lerp", metadata !"lerp", metadata !"", i32 26, metadata !10, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double, double, double)* @lerp, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 26] [local] [def] [lerp]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fade", metadata !"fade", metadata !"", i32 24, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @fade, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [fade]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !12, metadata !12}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"init", metadata !"init", metadata !"", i32 58, metadata !6, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @init, null, null, metadata !2, i32 58} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [init]
!21 = metadata !{metadata !22, metadata !26}
!22 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 7, metadata !23, i32 1, i32 1, [512 x i32]* @p, null} ; [ DW_TAG_variable ] [p] [line 7] [local] [def]
!23 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !8, metadata !24, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!26 = metadata !{i32 786484, i32 0, null, metadata !"permutation", metadata !"permutation", metadata !"", metadata !5, i32 9, metadata !27, i32 1, i32 1, [256 x i32]* @permutation, null} ; [ DW_TAG_variable ] [permutation] [line 9] [local] [def]
!27 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !8, metadata !28, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from int]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!30 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!31 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!32 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!33 = metadata !{i32 65, i32 0, metadata !4, null}
!34 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 67, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 67]
!35 = metadata !{i32 67, i32 0, metadata !4, null}
!36 = metadata !{i32 786688, metadata !4, metadata !"y", metadata !5, i32 67, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 67]
!37 = metadata !{i32 786688, metadata !4, metadata !"z", metadata !5, i32 67, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 67]
!38 = metadata !{i32 786688, metadata !4, metadata !"sum", metadata !5, i32 67, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 67]
!39 = metadata !{i32 73, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !4, i32 73, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!41 = metadata !{i32 74, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 74, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!43 = metadata !{i32 75, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !42, i32 75, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!45 = metadata !{i32 77, i32 0, metadata !44, null}
!46 = metadata !{i32 77, i32 0, metadata !42, null}
!47 = metadata !{i32 79, i32 0, metadata !4, null}
!48 = metadata !{i32 80, i32 0, metadata !4, null}
!49 = metadata !{i32 786689, metadata !9, metadata !"x", metadata !5, i32 16777251, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 35]
!50 = metadata !{i32 35, i32 0, metadata !9, null}
!51 = metadata !{i32 786689, metadata !9, metadata !"y", metadata !5, i32 33554467, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 35]
!52 = metadata !{i32 786689, metadata !9, metadata !"z", metadata !5, i32 50331683, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 35]
!53 = metadata !{i32 786688, metadata !9, metadata !"X", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 36]
!54 = metadata !{i32 36, i32 0, metadata !9, null}
!55 = metadata !{i32 786688, metadata !9, metadata !"Y", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y] [line 37]
!56 = metadata !{i32 37, i32 0, metadata !9, null}
!57 = metadata !{i32 786688, metadata !9, metadata !"Z", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z] [line 38]
!58 = metadata !{i32 38, i32 0, metadata !9, null}
!59 = metadata !{i32 39, i32 0, metadata !9, null}
!60 = metadata !{i32 40, i32 0, metadata !9, null}
!61 = metadata !{i32 41, i32 0, metadata !9, null}
!62 = metadata !{i32 786688, metadata !9, metadata !"u", metadata !5, i32 42, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 42]
!63 = metadata !{i32 42, i32 0, metadata !9, null}
!64 = metadata !{i32 786688, metadata !9, metadata !"v", metadata !5, i32 43, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 43]
!65 = metadata !{i32 43, i32 0, metadata !9, null}
!66 = metadata !{i32 786688, metadata !9, metadata !"w", metadata !5, i32 44, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 44]
!67 = metadata !{i32 44, i32 0, metadata !9, null}
!68 = metadata !{i32 786688, metadata !9, metadata !"A", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 45]
!69 = metadata !{i32 45, i32 0, metadata !9, null}
!70 = metadata !{i32 786688, metadata !9, metadata !"AA", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [AA] [line 45]
!71 = metadata !{i32 786688, metadata !9, metadata !"AB", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [AB] [line 45]
!72 = metadata !{i32 786688, metadata !9, metadata !"B", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [B] [line 46]
!73 = metadata !{i32 46, i32 0, metadata !9, null}
!74 = metadata !{i32 786688, metadata !9, metadata !"BA", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BA] [line 46]
!75 = metadata !{i32 786688, metadata !9, metadata !"BB", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BB] [line 46]
!76 = metadata !{i32 48, i32 0, metadata !9, null}
!77 = metadata !{i32 49, i32 0, metadata !9, null}
!78 = metadata !{i32 50, i32 0, metadata !9, null}
!79 = metadata !{i32 51, i32 0, metadata !9, null}
!80 = metadata !{i32 52, i32 0, metadata !9, null}
!81 = metadata !{i32 53, i32 0, metadata !9, null}
!82 = metadata !{i32 54, i32 0, metadata !9, null}
!83 = metadata !{i32 55, i32 0, metadata !9, null}
!84 = metadata !{i32 786689, metadata !17, metadata !"t", metadata !5, i32 16777240, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 24]
!85 = metadata !{i32 24, i32 0, metadata !17, null}
!86 = metadata !{i32 786689, metadata !16, metadata !"t", metadata !5, i32 16777242, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 26]
!87 = metadata !{i32 26, i32 0, metadata !16, null}
!88 = metadata !{i32 786689, metadata !16, metadata !"a", metadata !5, i32 33554458, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 26]
!89 = metadata !{i32 786689, metadata !16, metadata !"b", metadata !5, i32 50331674, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 26]
!90 = metadata !{i32 786689, metadata !13, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!91 = metadata !{i32 28, i32 0, metadata !13, null}
!92 = metadata !{i32 786689, metadata !13, metadata !"x", metadata !5, i32 33554460, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 28]
!93 = metadata !{i32 786689, metadata !13, metadata !"y", metadata !5, i32 50331676, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 28]
!94 = metadata !{i32 786689, metadata !13, metadata !"z", metadata !5, i32 67108892, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 28]
!95 = metadata !{i32 786688, metadata !13, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 29]
!96 = metadata !{i32 29, i32 0, metadata !13, null}
!97 = metadata !{i32 786688, metadata !13, metadata !"u", metadata !5, i32 30, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 30]
!98 = metadata !{i32 30, i32 0, metadata !13, null}
!99 = metadata !{i32 786688, metadata !13, metadata !"v", metadata !5, i32 31, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 31]
!100 = metadata !{i32 31, i32 0, metadata !13, null}
!101 = metadata !{i32 32, i32 0, metadata !13, null}
!102 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 59]
!103 = metadata !{i32 59, i32 0, metadata !20, null}
!104 = metadata !{i32 60, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !20, i32 60, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!106 = metadata !{i32 61, i32 0, metadata !105, null}
!107 = metadata !{i32 62, i32 0, metadata !20, null}
