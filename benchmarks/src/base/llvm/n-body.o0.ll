; ModuleID = 'n-body.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* %bodies, double %dt) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %3 = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  %mag = alloca double, align 8
  %b1 = alloca %struct.planet*, align 8
  store i32 %nbodies, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !40), !dbg !41
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.planet** %2}, metadata !42), !dbg !41
  store double %dt, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !43), !dbg !41
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !46), !dbg !45
  store i32 0, i32* %i, align 4, !dbg !47
  br label %4, !dbg !47

; <label>:4                                       ; preds = %134, %0
  %5 = load i32* %i, align 4, !dbg !47
  %6 = load i32* %1, align 4, !dbg !47
  %7 = icmp slt i32 %5, %6, !dbg !47
  br i1 %7, label %8, label %137, !dbg !47

; <label>:8                                       ; preds = %4
  call void @llvm.dbg.declare(metadata !{%struct.planet** %b}, metadata !49), !dbg !51
  %9 = load i32* %i, align 4, !dbg !51
  %10 = sext i32 %9 to i64, !dbg !51
  %11 = load %struct.planet** %2, align 8, !dbg !51
  %12 = getelementptr inbounds %struct.planet* %11, i64 %10, !dbg !51
  store %struct.planet* %12, %struct.planet** %b, align 8, !dbg !51
  %13 = load i32* %i, align 4, !dbg !52
  %14 = add nsw i32 %13, 1, !dbg !52
  store i32 %14, i32* %j, align 4, !dbg !52
  br label %15, !dbg !52

; <label>:15                                      ; preds = %130, %8
  %16 = load i32* %j, align 4, !dbg !52
  %17 = load i32* %1, align 4, !dbg !52
  %18 = icmp slt i32 %16, %17, !dbg !52
  br i1 %18, label %19, label %133, !dbg !52

; <label>:19                                      ; preds = %15
  call void @llvm.dbg.declare(metadata !{%struct.planet** %b2}, metadata !54), !dbg !56
  %20 = load i32* %j, align 4, !dbg !56
  %21 = sext i32 %20 to i64, !dbg !56
  %22 = load %struct.planet** %2, align 8, !dbg !56
  %23 = getelementptr inbounds %struct.planet* %22, i64 %21, !dbg !56
  store %struct.planet* %23, %struct.planet** %b2, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata !{double* %dx}, metadata !57), !dbg !58
  %24 = load %struct.planet** %b, align 8, !dbg !58
  %25 = getelementptr inbounds %struct.planet* %24, i32 0, i32 0, !dbg !58
  %26 = load double* %25, align 8, !dbg !58
  %27 = load %struct.planet** %b2, align 8, !dbg !58
  %28 = getelementptr inbounds %struct.planet* %27, i32 0, i32 0, !dbg !58
  %29 = load double* %28, align 8, !dbg !58
  %30 = fsub double %26, %29, !dbg !58
  store double %30, double* %dx, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %dy}, metadata !59), !dbg !60
  %31 = load %struct.planet** %b, align 8, !dbg !60
  %32 = getelementptr inbounds %struct.planet* %31, i32 0, i32 1, !dbg !60
  %33 = load double* %32, align 8, !dbg !60
  %34 = load %struct.planet** %b2, align 8, !dbg !60
  %35 = getelementptr inbounds %struct.planet* %34, i32 0, i32 1, !dbg !60
  %36 = load double* %35, align 8, !dbg !60
  %37 = fsub double %33, %36, !dbg !60
  store double %37, double* %dy, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata !{double* %dz}, metadata !61), !dbg !62
  %38 = load %struct.planet** %b, align 8, !dbg !62
  %39 = getelementptr inbounds %struct.planet* %38, i32 0, i32 2, !dbg !62
  %40 = load double* %39, align 8, !dbg !62
  %41 = load %struct.planet** %b2, align 8, !dbg !62
  %42 = getelementptr inbounds %struct.planet* %41, i32 0, i32 2, !dbg !62
  %43 = load double* %42, align 8, !dbg !62
  %44 = fsub double %40, %43, !dbg !62
  store double %44, double* %dz, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata !{double* %distance}, metadata !63), !dbg !64
  %45 = load double* %dx, align 8, !dbg !64
  %46 = load double* %dx, align 8, !dbg !64
  %47 = fmul double %45, %46, !dbg !64
  %48 = load double* %dy, align 8, !dbg !64
  %49 = load double* %dy, align 8, !dbg !64
  %50 = fmul double %48, %49, !dbg !64
  %51 = fadd double %47, %50, !dbg !64
  %52 = load double* %dz, align 8, !dbg !64
  %53 = load double* %dz, align 8, !dbg !64
  %54 = fmul double %52, %53, !dbg !64
  %55 = fadd double %51, %54, !dbg !64
  %56 = call double @sqrt(double %55) #4, !dbg !64
  store double %56, double* %distance, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata !{double* %mag}, metadata !65), !dbg !66
  %57 = load double* %3, align 8, !dbg !66
  %58 = load double* %distance, align 8, !dbg !66
  %59 = load double* %distance, align 8, !dbg !66
  %60 = fmul double %58, %59, !dbg !66
  %61 = load double* %distance, align 8, !dbg !66
  %62 = fmul double %60, %61, !dbg !66
  %63 = fdiv double %57, %62, !dbg !66
  store double %63, double* %mag, align 8, !dbg !66
  %64 = load double* %dx, align 8, !dbg !67
  %65 = load %struct.planet** %b2, align 8, !dbg !67
  %66 = getelementptr inbounds %struct.planet* %65, i32 0, i32 6, !dbg !67
  %67 = load double* %66, align 8, !dbg !67
  %68 = fmul double %64, %67, !dbg !67
  %69 = load double* %mag, align 8, !dbg !67
  %70 = fmul double %68, %69, !dbg !67
  %71 = load %struct.planet** %b, align 8, !dbg !67
  %72 = getelementptr inbounds %struct.planet* %71, i32 0, i32 3, !dbg !67
  %73 = load double* %72, align 8, !dbg !67
  %74 = fsub double %73, %70, !dbg !67
  store double %74, double* %72, align 8, !dbg !67
  %75 = load double* %dy, align 8, !dbg !68
  %76 = load %struct.planet** %b2, align 8, !dbg !68
  %77 = getelementptr inbounds %struct.planet* %76, i32 0, i32 6, !dbg !68
  %78 = load double* %77, align 8, !dbg !68
  %79 = fmul double %75, %78, !dbg !68
  %80 = load double* %mag, align 8, !dbg !68
  %81 = fmul double %79, %80, !dbg !68
  %82 = load %struct.planet** %b, align 8, !dbg !68
  %83 = getelementptr inbounds %struct.planet* %82, i32 0, i32 4, !dbg !68
  %84 = load double* %83, align 8, !dbg !68
  %85 = fsub double %84, %81, !dbg !68
  store double %85, double* %83, align 8, !dbg !68
  %86 = load double* %dz, align 8, !dbg !69
  %87 = load %struct.planet** %b2, align 8, !dbg !69
  %88 = getelementptr inbounds %struct.planet* %87, i32 0, i32 6, !dbg !69
  %89 = load double* %88, align 8, !dbg !69
  %90 = fmul double %86, %89, !dbg !69
  %91 = load double* %mag, align 8, !dbg !69
  %92 = fmul double %90, %91, !dbg !69
  %93 = load %struct.planet** %b, align 8, !dbg !69
  %94 = getelementptr inbounds %struct.planet* %93, i32 0, i32 5, !dbg !69
  %95 = load double* %94, align 8, !dbg !69
  %96 = fsub double %95, %92, !dbg !69
  store double %96, double* %94, align 8, !dbg !69
  %97 = load double* %dx, align 8, !dbg !70
  %98 = load %struct.planet** %b, align 8, !dbg !70
  %99 = getelementptr inbounds %struct.planet* %98, i32 0, i32 6, !dbg !70
  %100 = load double* %99, align 8, !dbg !70
  %101 = fmul double %97, %100, !dbg !70
  %102 = load double* %mag, align 8, !dbg !70
  %103 = fmul double %101, %102, !dbg !70
  %104 = load %struct.planet** %b2, align 8, !dbg !70
  %105 = getelementptr inbounds %struct.planet* %104, i32 0, i32 3, !dbg !70
  %106 = load double* %105, align 8, !dbg !70
  %107 = fadd double %106, %103, !dbg !70
  store double %107, double* %105, align 8, !dbg !70
  %108 = load double* %dy, align 8, !dbg !71
  %109 = load %struct.planet** %b, align 8, !dbg !71
  %110 = getelementptr inbounds %struct.planet* %109, i32 0, i32 6, !dbg !71
  %111 = load double* %110, align 8, !dbg !71
  %112 = fmul double %108, %111, !dbg !71
  %113 = load double* %mag, align 8, !dbg !71
  %114 = fmul double %112, %113, !dbg !71
  %115 = load %struct.planet** %b2, align 8, !dbg !71
  %116 = getelementptr inbounds %struct.planet* %115, i32 0, i32 4, !dbg !71
  %117 = load double* %116, align 8, !dbg !71
  %118 = fadd double %117, %114, !dbg !71
  store double %118, double* %116, align 8, !dbg !71
  %119 = load double* %dz, align 8, !dbg !72
  %120 = load %struct.planet** %b, align 8, !dbg !72
  %121 = getelementptr inbounds %struct.planet* %120, i32 0, i32 6, !dbg !72
  %122 = load double* %121, align 8, !dbg !72
  %123 = fmul double %119, %122, !dbg !72
  %124 = load double* %mag, align 8, !dbg !72
  %125 = fmul double %123, %124, !dbg !72
  %126 = load %struct.planet** %b2, align 8, !dbg !72
  %127 = getelementptr inbounds %struct.planet* %126, i32 0, i32 5, !dbg !72
  %128 = load double* %127, align 8, !dbg !72
  %129 = fadd double %128, %125, !dbg !72
  store double %129, double* %127, align 8, !dbg !72
  br label %130, !dbg !73

; <label>:130                                     ; preds = %19
  %131 = load i32* %j, align 4, !dbg !52
  %132 = add nsw i32 %131, 1, !dbg !52
  store i32 %132, i32* %j, align 4, !dbg !52
  br label %15, !dbg !52

; <label>:133                                     ; preds = %15
  br label %134, !dbg !74

; <label>:134                                     ; preds = %133
  %135 = load i32* %i, align 4, !dbg !47
  %136 = add nsw i32 %135, 1, !dbg !47
  store i32 %136, i32* %i, align 4, !dbg !47
  br label %4, !dbg !47

; <label>:137                                     ; preds = %4
  store i32 0, i32* %i, align 4, !dbg !75
  br label %138, !dbg !75

; <label>:138                                     ; preds = %174, %137
  %139 = load i32* %i, align 4, !dbg !75
  %140 = load i32* %1, align 4, !dbg !75
  %141 = icmp slt i32 %139, %140, !dbg !75
  br i1 %141, label %142, label %177, !dbg !75

; <label>:142                                     ; preds = %138
  call void @llvm.dbg.declare(metadata !{%struct.planet** %b1}, metadata !77), !dbg !79
  %143 = load i32* %i, align 4, !dbg !79
  %144 = sext i32 %143 to i64, !dbg !79
  %145 = load %struct.planet** %2, align 8, !dbg !79
  %146 = getelementptr inbounds %struct.planet* %145, i64 %144, !dbg !79
  store %struct.planet* %146, %struct.planet** %b1, align 8, !dbg !79
  %147 = load double* %3, align 8, !dbg !80
  %148 = load %struct.planet** %b1, align 8, !dbg !80
  %149 = getelementptr inbounds %struct.planet* %148, i32 0, i32 3, !dbg !80
  %150 = load double* %149, align 8, !dbg !80
  %151 = fmul double %147, %150, !dbg !80
  %152 = load %struct.planet** %b1, align 8, !dbg !80
  %153 = getelementptr inbounds %struct.planet* %152, i32 0, i32 0, !dbg !80
  %154 = load double* %153, align 8, !dbg !80
  %155 = fadd double %154, %151, !dbg !80
  store double %155, double* %153, align 8, !dbg !80
  %156 = load double* %3, align 8, !dbg !81
  %157 = load %struct.planet** %b1, align 8, !dbg !81
  %158 = getelementptr inbounds %struct.planet* %157, i32 0, i32 4, !dbg !81
  %159 = load double* %158, align 8, !dbg !81
  %160 = fmul double %156, %159, !dbg !81
  %161 = load %struct.planet** %b1, align 8, !dbg !81
  %162 = getelementptr inbounds %struct.planet* %161, i32 0, i32 1, !dbg !81
  %163 = load double* %162, align 8, !dbg !81
  %164 = fadd double %163, %160, !dbg !81
  store double %164, double* %162, align 8, !dbg !81
  %165 = load double* %3, align 8, !dbg !82
  %166 = load %struct.planet** %b1, align 8, !dbg !82
  %167 = getelementptr inbounds %struct.planet* %166, i32 0, i32 5, !dbg !82
  %168 = load double* %167, align 8, !dbg !82
  %169 = fmul double %165, %168, !dbg !82
  %170 = load %struct.planet** %b1, align 8, !dbg !82
  %171 = getelementptr inbounds %struct.planet* %170, i32 0, i32 2, !dbg !82
  %172 = load double* %171, align 8, !dbg !82
  %173 = fadd double %172, %169, !dbg !82
  store double %173, double* %171, align 8, !dbg !82
  br label %174, !dbg !83

; <label>:174                                     ; preds = %142
  %175 = load i32* %i, align 4, !dbg !75
  %176 = add nsw i32 %175, 1, !dbg !75
  store i32 %176, i32* %i, align 4, !dbg !75
  br label %138, !dbg !75

; <label>:177                                     ; preds = %138
  ret void, !dbg !84
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* %bodies) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %e = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  store i32 %nbodies, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !85), !dbg !86
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.planet** %2}, metadata !87), !dbg !86
  call void @llvm.dbg.declare(metadata !{double* %e}, metadata !88), !dbg !89
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !90), !dbg !91
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !92), !dbg !91
  store double 0.000000e+00, double* %e, align 8, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %3, !dbg !94

; <label>:3                                       ; preds = %101, %0
  %4 = load i32* %i, align 4, !dbg !94
  %5 = load i32* %1, align 4, !dbg !94
  %6 = icmp slt i32 %4, %5, !dbg !94
  br i1 %6, label %7, label %104, !dbg !94

; <label>:7                                       ; preds = %3
  call void @llvm.dbg.declare(metadata !{%struct.planet** %b}, metadata !96), !dbg !98
  %8 = load i32* %i, align 4, !dbg !98
  %9 = sext i32 %8 to i64, !dbg !98
  %10 = load %struct.planet** %2, align 8, !dbg !98
  %11 = getelementptr inbounds %struct.planet* %10, i64 %9, !dbg !98
  store %struct.planet* %11, %struct.planet** %b, align 8, !dbg !98
  %12 = load %struct.planet** %b, align 8, !dbg !99
  %13 = getelementptr inbounds %struct.planet* %12, i32 0, i32 6, !dbg !99
  %14 = load double* %13, align 8, !dbg !99
  %15 = fmul double 5.000000e-01, %14, !dbg !99
  %16 = load %struct.planet** %b, align 8, !dbg !99
  %17 = getelementptr inbounds %struct.planet* %16, i32 0, i32 3, !dbg !99
  %18 = load double* %17, align 8, !dbg !99
  %19 = load %struct.planet** %b, align 8, !dbg !99
  %20 = getelementptr inbounds %struct.planet* %19, i32 0, i32 3, !dbg !99
  %21 = load double* %20, align 8, !dbg !99
  %22 = fmul double %18, %21, !dbg !99
  %23 = load %struct.planet** %b, align 8, !dbg !99
  %24 = getelementptr inbounds %struct.planet* %23, i32 0, i32 4, !dbg !99
  %25 = load double* %24, align 8, !dbg !99
  %26 = load %struct.planet** %b, align 8, !dbg !99
  %27 = getelementptr inbounds %struct.planet* %26, i32 0, i32 4, !dbg !99
  %28 = load double* %27, align 8, !dbg !99
  %29 = fmul double %25, %28, !dbg !99
  %30 = fadd double %22, %29, !dbg !99
  %31 = load %struct.planet** %b, align 8, !dbg !99
  %32 = getelementptr inbounds %struct.planet* %31, i32 0, i32 5, !dbg !99
  %33 = load double* %32, align 8, !dbg !99
  %34 = load %struct.planet** %b, align 8, !dbg !99
  %35 = getelementptr inbounds %struct.planet* %34, i32 0, i32 5, !dbg !99
  %36 = load double* %35, align 8, !dbg !99
  %37 = fmul double %33, %36, !dbg !99
  %38 = fadd double %30, %37, !dbg !99
  %39 = fmul double %15, %38, !dbg !99
  %40 = load double* %e, align 8, !dbg !99
  %41 = fadd double %40, %39, !dbg !99
  store double %41, double* %e, align 8, !dbg !99
  %42 = load i32* %i, align 4, !dbg !100
  %43 = add nsw i32 %42, 1, !dbg !100
  store i32 %43, i32* %j, align 4, !dbg !100
  br label %44, !dbg !100

; <label>:44                                      ; preds = %97, %7
  %45 = load i32* %j, align 4, !dbg !100
  %46 = load i32* %1, align 4, !dbg !100
  %47 = icmp slt i32 %45, %46, !dbg !100
  br i1 %47, label %48, label %100, !dbg !100

; <label>:48                                      ; preds = %44
  call void @llvm.dbg.declare(metadata !{%struct.planet** %b2}, metadata !102), !dbg !104
  %49 = load i32* %j, align 4, !dbg !104
  %50 = sext i32 %49 to i64, !dbg !104
  %51 = load %struct.planet** %2, align 8, !dbg !104
  %52 = getelementptr inbounds %struct.planet* %51, i64 %50, !dbg !104
  store %struct.planet* %52, %struct.planet** %b2, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata !{double* %dx}, metadata !105), !dbg !106
  %53 = load %struct.planet** %b, align 8, !dbg !106
  %54 = getelementptr inbounds %struct.planet* %53, i32 0, i32 0, !dbg !106
  %55 = load double* %54, align 8, !dbg !106
  %56 = load %struct.planet** %b2, align 8, !dbg !106
  %57 = getelementptr inbounds %struct.planet* %56, i32 0, i32 0, !dbg !106
  %58 = load double* %57, align 8, !dbg !106
  %59 = fsub double %55, %58, !dbg !106
  store double %59, double* %dx, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata !{double* %dy}, metadata !107), !dbg !108
  %60 = load %struct.planet** %b, align 8, !dbg !108
  %61 = getelementptr inbounds %struct.planet* %60, i32 0, i32 1, !dbg !108
  %62 = load double* %61, align 8, !dbg !108
  %63 = load %struct.planet** %b2, align 8, !dbg !108
  %64 = getelementptr inbounds %struct.planet* %63, i32 0, i32 1, !dbg !108
  %65 = load double* %64, align 8, !dbg !108
  %66 = fsub double %62, %65, !dbg !108
  store double %66, double* %dy, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata !{double* %dz}, metadata !109), !dbg !110
  %67 = load %struct.planet** %b, align 8, !dbg !110
  %68 = getelementptr inbounds %struct.planet* %67, i32 0, i32 2, !dbg !110
  %69 = load double* %68, align 8, !dbg !110
  %70 = load %struct.planet** %b2, align 8, !dbg !110
  %71 = getelementptr inbounds %struct.planet* %70, i32 0, i32 2, !dbg !110
  %72 = load double* %71, align 8, !dbg !110
  %73 = fsub double %69, %72, !dbg !110
  store double %73, double* %dz, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata !{double* %distance}, metadata !111), !dbg !112
  %74 = load double* %dx, align 8, !dbg !112
  %75 = load double* %dx, align 8, !dbg !112
  %76 = fmul double %74, %75, !dbg !112
  %77 = load double* %dy, align 8, !dbg !112
  %78 = load double* %dy, align 8, !dbg !112
  %79 = fmul double %77, %78, !dbg !112
  %80 = fadd double %76, %79, !dbg !112
  %81 = load double* %dz, align 8, !dbg !112
  %82 = load double* %dz, align 8, !dbg !112
  %83 = fmul double %81, %82, !dbg !112
  %84 = fadd double %80, %83, !dbg !112
  %85 = call double @sqrt(double %84) #4, !dbg !112
  store double %85, double* %distance, align 8, !dbg !112
  %86 = load %struct.planet** %b, align 8, !dbg !113
  %87 = getelementptr inbounds %struct.planet* %86, i32 0, i32 6, !dbg !113
  %88 = load double* %87, align 8, !dbg !113
  %89 = load %struct.planet** %b2, align 8, !dbg !113
  %90 = getelementptr inbounds %struct.planet* %89, i32 0, i32 6, !dbg !113
  %91 = load double* %90, align 8, !dbg !113
  %92 = fmul double %88, %91, !dbg !113
  %93 = load double* %distance, align 8, !dbg !113
  %94 = fdiv double %92, %93, !dbg !113
  %95 = load double* %e, align 8, !dbg !113
  %96 = fsub double %95, %94, !dbg !113
  store double %96, double* %e, align 8, !dbg !113
  br label %97, !dbg !114

; <label>:97                                      ; preds = %48
  %98 = load i32* %j, align 4, !dbg !100
  %99 = add nsw i32 %98, 1, !dbg !100
  store i32 %99, i32* %j, align 4, !dbg !100
  br label %44, !dbg !100

; <label>:100                                     ; preds = %44
  br label %101, !dbg !115

; <label>:101                                     ; preds = %100
  %102 = load i32* %i, align 4, !dbg !94
  %103 = add nsw i32 %102, 1, !dbg !94
  store i32 %103, i32* %i, align 4, !dbg !94
  br label %3, !dbg !94

; <label>:104                                     ; preds = %3
  %105 = load double* %e, align 8, !dbg !116
  ret double %105, !dbg !116
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* %bodies) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %px = alloca double, align 8
  %py = alloca double, align 8
  %pz = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %nbodies, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !117), !dbg !118
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.planet** %2}, metadata !119), !dbg !118
  call void @llvm.dbg.declare(metadata !{double* %px}, metadata !120), !dbg !121
  store double 0.000000e+00, double* %px, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata !{double* %py}, metadata !122), !dbg !121
  store double 0.000000e+00, double* %py, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata !{double* %pz}, metadata !123), !dbg !121
  store double 0.000000e+00, double* %pz, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !124), !dbg !125
  store i32 0, i32* %i, align 4, !dbg !126
  br label %3, !dbg !126

; <label>:3                                       ; preds = %53, %0
  %4 = load i32* %i, align 4, !dbg !126
  %5 = load i32* %1, align 4, !dbg !126
  %6 = icmp slt i32 %4, %5, !dbg !126
  br i1 %6, label %7, label %56, !dbg !126

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4, !dbg !128
  %9 = sext i32 %8 to i64, !dbg !128
  %10 = load %struct.planet** %2, align 8, !dbg !128
  %11 = getelementptr inbounds %struct.planet* %10, i64 %9, !dbg !128
  %12 = getelementptr inbounds %struct.planet* %11, i32 0, i32 3, !dbg !128
  %13 = load double* %12, align 8, !dbg !128
  %14 = load i32* %i, align 4, !dbg !128
  %15 = sext i32 %14 to i64, !dbg !128
  %16 = load %struct.planet** %2, align 8, !dbg !128
  %17 = getelementptr inbounds %struct.planet* %16, i64 %15, !dbg !128
  %18 = getelementptr inbounds %struct.planet* %17, i32 0, i32 6, !dbg !128
  %19 = load double* %18, align 8, !dbg !128
  %20 = fmul double %13, %19, !dbg !128
  %21 = load double* %px, align 8, !dbg !128
  %22 = fadd double %21, %20, !dbg !128
  store double %22, double* %px, align 8, !dbg !128
  %23 = load i32* %i, align 4, !dbg !130
  %24 = sext i32 %23 to i64, !dbg !130
  %25 = load %struct.planet** %2, align 8, !dbg !130
  %26 = getelementptr inbounds %struct.planet* %25, i64 %24, !dbg !130
  %27 = getelementptr inbounds %struct.planet* %26, i32 0, i32 4, !dbg !130
  %28 = load double* %27, align 8, !dbg !130
  %29 = load i32* %i, align 4, !dbg !130
  %30 = sext i32 %29 to i64, !dbg !130
  %31 = load %struct.planet** %2, align 8, !dbg !130
  %32 = getelementptr inbounds %struct.planet* %31, i64 %30, !dbg !130
  %33 = getelementptr inbounds %struct.planet* %32, i32 0, i32 6, !dbg !130
  %34 = load double* %33, align 8, !dbg !130
  %35 = fmul double %28, %34, !dbg !130
  %36 = load double* %py, align 8, !dbg !130
  %37 = fadd double %36, %35, !dbg !130
  store double %37, double* %py, align 8, !dbg !130
  %38 = load i32* %i, align 4, !dbg !131
  %39 = sext i32 %38 to i64, !dbg !131
  %40 = load %struct.planet** %2, align 8, !dbg !131
  %41 = getelementptr inbounds %struct.planet* %40, i64 %39, !dbg !131
  %42 = getelementptr inbounds %struct.planet* %41, i32 0, i32 5, !dbg !131
  %43 = load double* %42, align 8, !dbg !131
  %44 = load i32* %i, align 4, !dbg !131
  %45 = sext i32 %44 to i64, !dbg !131
  %46 = load %struct.planet** %2, align 8, !dbg !131
  %47 = getelementptr inbounds %struct.planet* %46, i64 %45, !dbg !131
  %48 = getelementptr inbounds %struct.planet* %47, i32 0, i32 6, !dbg !131
  %49 = load double* %48, align 8, !dbg !131
  %50 = fmul double %43, %49, !dbg !131
  %51 = load double* %pz, align 8, !dbg !131
  %52 = fadd double %51, %50, !dbg !131
  store double %52, double* %pz, align 8, !dbg !131
  br label %53, !dbg !132

; <label>:53                                      ; preds = %7
  %54 = load i32* %i, align 4, !dbg !126
  %55 = add nsw i32 %54, 1, !dbg !126
  store i32 %55, i32* %i, align 4, !dbg !126
  br label %3, !dbg !126

; <label>:56                                      ; preds = %3
  %57 = load double* %px, align 8, !dbg !133
  %58 = fsub double -0.000000e+00, %57, !dbg !133
  %59 = fdiv double %58, 0x4043BD3CC9BE45DE, !dbg !133
  %60 = load %struct.planet** %2, align 8, !dbg !133
  %61 = getelementptr inbounds %struct.planet* %60, i64 0, !dbg !133
  %62 = getelementptr inbounds %struct.planet* %61, i32 0, i32 3, !dbg !133
  store double %59, double* %62, align 8, !dbg !133
  %63 = load double* %py, align 8, !dbg !134
  %64 = fsub double -0.000000e+00, %63, !dbg !134
  %65 = fdiv double %64, 0x4043BD3CC9BE45DE, !dbg !134
  %66 = load %struct.planet** %2, align 8, !dbg !134
  %67 = getelementptr inbounds %struct.planet* %66, i64 0, !dbg !134
  %68 = getelementptr inbounds %struct.planet* %67, i32 0, i32 4, !dbg !134
  store double %65, double* %68, align 8, !dbg !134
  %69 = load double* %pz, align 8, !dbg !135
  %70 = fsub double -0.000000e+00, %69, !dbg !135
  %71 = fdiv double %70, 0x4043BD3CC9BE45DE, !dbg !135
  %72 = load %struct.planet** %2, align 8, !dbg !135
  %73 = getelementptr inbounds %struct.planet* %72, i64 0, !dbg !135
  %74 = getelementptr inbounds %struct.planet* %73, i32 0, i32 5, !dbg !135
  store double %71, double* %74, align 8, !dbg !135
  ret void, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !137), !dbg !138
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !139), !dbg !138
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !140), !dbg !141
  store i32 5000000, i32* %n, align 4, !dbg !141
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !142), !dbg !143
  call void @offset_momentum(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0)), !dbg !144
  %4 = call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0)), !dbg !145
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %4), !dbg !145
  store i32 1, i32* %i, align 4, !dbg !146
  br label %6, !dbg !146

; <label>:6                                       ; preds = %11, %0
  %7 = load i32* %i, align 4, !dbg !146
  %8 = load i32* %n, align 4, !dbg !146
  %9 = icmp sle i32 %7, %8, !dbg !146
  br i1 %9, label %10, label %14, !dbg !146

; <label>:10                                      ; preds = %6
  call void @advance(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0), double 1.000000e-02), !dbg !148
  br label %11, !dbg !148

; <label>:11                                      ; preds = %10
  %12 = load i32* %i, align 4, !dbg !146
  %13 = add nsw i32 %12, 1, !dbg !146
  store i32 %13, i32* %i, align 4, !dbg !146
  br label %6, !dbg !146

; <label>:14                                      ; preds = %6
  %15 = call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0)), !dbg !149
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %15), !dbg !149
  ret i32 0, !dbg !150
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !32, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c] [DW_LANG_C99]
!1 = metadata !{metadata !"n-body.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !20, metadata !23, metadata !26}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"advance", metadata !"advance", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, %struct.planet*, double)* @advance, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [advance]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9, metadata !13}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from planet]
!10 = metadata !{i32 786451, metadata !1, null, metadata !"planet", i32 17, i64 448, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [planet] [line 17, size 448, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19}
!12 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"x", i32 18, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [x] [line 18, size 64, align 64, offset 0] [from double]
!13 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"y", i32 18, i64 64, i64 64, i64 64, i32 0, metadata !13} ; [ DW_TAG_member ] [y] [line 18, size 64, align 64, offset 64] [from double]
!15 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"z", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !13} ; [ DW_TAG_member ] [z] [line 18, size 64, align 64, offset 128] [from double]
!16 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"vx", i32 19, i64 64, i64 64, i64 192, i32 0, metadata !13} ; [ DW_TAG_member ] [vx] [line 19, size 64, align 64, offset 192] [from double]
!17 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"vy", i32 19, i64 64, i64 64, i64 256, i32 0, metadata !13} ; [ DW_TAG_member ] [vy] [line 19, size 64, align 64, offset 256] [from double]
!18 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"vz", i32 19, i64 64, i64 64, i64 320, i32 0, metadata !13} ; [ DW_TAG_member ] [vz] [line 19, size 64, align 64, offset 320] [from double]
!19 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"mass", i32 20, i64 64, i64 64, i64 384, i32 0, metadata !13} ; [ DW_TAG_member ] [mass] [line 20, size 64, align 64, offset 384] [from double]
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"energy", metadata !"energy", metadata !"", i32 52, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, %struct.planet*)* @energy, null, null, metadata !2, i32 53} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [energy]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !13, metadata !8, metadata !9}
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"offset_momentum", metadata !"offset_momentum", metadata !"", i32 73, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, %struct.planet*)* @offset_momentum, null, null, metadata !2, i32 74} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [offset_momentum]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !8, metadata !9}
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 130, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 131} ; [ DW_TAG_subprogram ] [line 130] [def] [scope 131] [main]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !8, metadata !8, metadata !29}
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!31 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786484, i32 0, null, metadata !"bodies", metadata !"bodies", metadata !"", metadata !5, i32 88, metadata !34, i32 0, i32 1, [5 x %struct.planet]* @bodies, null} ; [ DW_TAG_variable ] [bodies] [line 88] [def]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2240, i64 64, i32 0, i32 0, metadata !10, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2240, align 64, offset 0] [from planet]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!37 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!38 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!39 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!40 = metadata !{i32 786689, metadata !4, metadata !"nbodies", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbodies] [line 23]
!41 = metadata !{i32 23, i32 0, metadata !4, null}
!42 = metadata !{i32 786689, metadata !4, metadata !"bodies", metadata !5, i32 33554455, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bodies] [line 23]
!43 = metadata !{i32 786689, metadata !4, metadata !"dt", metadata !5, i32 50331671, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dt] [line 23]
!44 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!45 = metadata !{i32 25, i32 0, metadata !4, null}
!46 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!47 = metadata !{i32 27, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !4, i32 27, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!49 = metadata !{i32 786688, metadata !50, metadata !"b", metadata !5, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 28]
!50 = metadata !{i32 786443, metadata !1, metadata !48, i32 27, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!51 = metadata !{i32 28, i32 0, metadata !50, null}
!52 = metadata !{i32 29, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !50, i32 29, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!54 = metadata !{i32 786688, metadata !55, metadata !"b2", metadata !5, i32 30, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b2] [line 30]
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 29, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!56 = metadata !{i32 30, i32 0, metadata !55, null}
!57 = metadata !{i32 786688, metadata !55, metadata !"dx", metadata !5, i32 31, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dx] [line 31]
!58 = metadata !{i32 31, i32 0, metadata !55, null}
!59 = metadata !{i32 786688, metadata !55, metadata !"dy", metadata !5, i32 32, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dy] [line 32]
!60 = metadata !{i32 32, i32 0, metadata !55, null}
!61 = metadata !{i32 786688, metadata !55, metadata !"dz", metadata !5, i32 33, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dz] [line 33]
!62 = metadata !{i32 33, i32 0, metadata !55, null}
!63 = metadata !{i32 786688, metadata !55, metadata !"distance", metadata !5, i32 34, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [distance] [line 34]
!64 = metadata !{i32 34, i32 0, metadata !55, null}
!65 = metadata !{i32 786688, metadata !55, metadata !"mag", metadata !5, i32 35, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mag] [line 35]
!66 = metadata !{i32 35, i32 0, metadata !55, null}
!67 = metadata !{i32 36, i32 0, metadata !55, null}
!68 = metadata !{i32 37, i32 0, metadata !55, null}
!69 = metadata !{i32 38, i32 0, metadata !55, null}
!70 = metadata !{i32 39, i32 0, metadata !55, null}
!71 = metadata !{i32 40, i32 0, metadata !55, null}
!72 = metadata !{i32 41, i32 0, metadata !55, null}
!73 = metadata !{i32 42, i32 0, metadata !55, null}
!74 = metadata !{i32 43, i32 0, metadata !50, null}
!75 = metadata !{i32 44, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !4, i32 44, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!77 = metadata !{i32 786688, metadata !78, metadata !"b", metadata !5, i32 45, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 45]
!78 = metadata !{i32 786443, metadata !1, metadata !76, i32 44, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!79 = metadata !{i32 45, i32 0, metadata !78, null}
!80 = metadata !{i32 46, i32 0, metadata !78, null}
!81 = metadata !{i32 47, i32 0, metadata !78, null}
!82 = metadata !{i32 48, i32 0, metadata !78, null}
!83 = metadata !{i32 49, i32 0, metadata !78, null}
!84 = metadata !{i32 50, i32 0, metadata !4, null}
!85 = metadata !{i32 786689, metadata !20, metadata !"nbodies", metadata !5, i32 16777268, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!86 = metadata !{i32 52, i32 0, metadata !20, null}
!87 = metadata !{i32 786689, metadata !20, metadata !"bodies", metadata !5, i32 33554484, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!88 = metadata !{i32 786688, metadata !20, metadata !"e", metadata !5, i32 54, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 54]
!89 = metadata !{i32 54, i32 0, metadata !20, null}
!90 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 55]
!91 = metadata !{i32 55, i32 0, metadata !20, null}
!92 = metadata !{i32 786688, metadata !20, metadata !"j", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 55]
!93 = metadata !{i32 57, i32 0, metadata !20, null}
!94 = metadata !{i32 58, i32 0, metadata !95, null} ; [ DW_TAG_imported_module ]
!95 = metadata !{i32 786443, metadata !1, metadata !20, i32 58, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!96 = metadata !{i32 786688, metadata !97, metadata !"b", metadata !5, i32 59, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 59]
!97 = metadata !{i32 786443, metadata !1, metadata !95, i32 58, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!98 = metadata !{i32 59, i32 0, metadata !97, null}
!99 = metadata !{i32 60, i32 0, metadata !97, null}
!100 = metadata !{i32 61, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !97, i32 61, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!102 = metadata !{i32 786688, metadata !103, metadata !"b2", metadata !5, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b2] [line 62]
!103 = metadata !{i32 786443, metadata !1, metadata !101, i32 61, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!104 = metadata !{i32 62, i32 0, metadata !103, null}
!105 = metadata !{i32 786688, metadata !103, metadata !"dx", metadata !5, i32 63, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dx] [line 63]
!106 = metadata !{i32 63, i32 0, metadata !103, null}
!107 = metadata !{i32 786688, metadata !103, metadata !"dy", metadata !5, i32 64, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dy] [line 64]
!108 = metadata !{i32 64, i32 0, metadata !103, null}
!109 = metadata !{i32 786688, metadata !103, metadata !"dz", metadata !5, i32 65, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dz] [line 65]
!110 = metadata !{i32 65, i32 0, metadata !103, null}
!111 = metadata !{i32 786688, metadata !103, metadata !"distance", metadata !5, i32 66, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!112 = metadata !{i32 66, i32 0, metadata !103, null}
!113 = metadata !{i32 67, i32 0, metadata !103, null}
!114 = metadata !{i32 68, i32 0, metadata !103, null}
!115 = metadata !{i32 69, i32 0, metadata !97, null}
!116 = metadata !{i32 70, i32 0, metadata !20, null}
!117 = metadata !{i32 786689, metadata !23, metadata !"nbodies", metadata !5, i32 16777289, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!118 = metadata !{i32 73, i32 0, metadata !23, null}
!119 = metadata !{i32 786689, metadata !23, metadata !"bodies", metadata !5, i32 33554505, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!120 = metadata !{i32 786688, metadata !23, metadata !"px", metadata !5, i32 75, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [px] [line 75]
!121 = metadata !{i32 75, i32 0, metadata !23, null}
!122 = metadata !{i32 786688, metadata !23, metadata !"py", metadata !5, i32 75, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [py] [line 75]
!123 = metadata !{i32 786688, metadata !23, metadata !"pz", metadata !5, i32 75, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pz] [line 75]
!124 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 76, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 76]
!125 = metadata !{i32 76, i32 0, metadata !23, null}
!126 = metadata !{i32 77, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !23, i32 77, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!128 = metadata !{i32 78, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !127, i32 77, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!130 = metadata !{i32 79, i32 0, metadata !129, null}
!131 = metadata !{i32 80, i32 0, metadata !129, null}
!132 = metadata !{i32 81, i32 0, metadata !129, null}
!133 = metadata !{i32 82, i32 0, metadata !23, null}
!134 = metadata !{i32 83, i32 0, metadata !23, null}
!135 = metadata !{i32 84, i32 0, metadata !23, null}
!136 = metadata !{i32 85, i32 0, metadata !23, null}
!137 = metadata !{i32 786689, metadata !26, metadata !"argc", metadata !5, i32 16777346, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 130]
!138 = metadata !{i32 130, i32 0, metadata !26, null}
!139 = metadata !{i32 786689, metadata !26, metadata !"argv", metadata !5, i32 33554562, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 130]
!140 = metadata !{i32 786688, metadata !26, metadata !"n", metadata !5, i32 132, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 132]
!141 = metadata !{i32 132, i32 0, metadata !26, null}
!142 = metadata !{i32 786688, metadata !26, metadata !"i", metadata !5, i32 133, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 133]
!143 = metadata !{i32 133, i32 0, metadata !26, null}
!144 = metadata !{i32 135, i32 0, metadata !26, null}
!145 = metadata !{i32 136, i32 0, metadata !26, null}
!146 = metadata !{i32 137, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !26, i32 137, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!148 = metadata !{i32 138, i32 0, metadata !147, null}
!149 = metadata !{i32 139, i32 0, metadata !26, null}
!150 = metadata !{i32 140, i32 0, metadata !26, null}
