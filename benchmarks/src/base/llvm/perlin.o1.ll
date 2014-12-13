; ModuleID = 'perlin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@p = internal unnamed_addr global [512 x i32] zeroinitializer, align 16
@permutation = internal unnamed_addr constant [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call fastcc void @init(), !dbg !70
  tail call void @llvm.dbg.value(metadata !71, i64 0, metadata !14), !dbg !72
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !10), !dbg !74
  br label %.preheader1, !dbg !74

.preheader1:                                      ; preds = %0, %8
  %sum.08 = phi double [ 0.000000e+00, %0 ], [ %sum.2.lcssa, %8 ]
  %x.07 = phi double [ -1.135257e+04, %0 ], [ %9, %8 ]
  br label %.preheader, !dbg !76

.preheader:                                       ; preds = %.preheader1, %._crit_edge
  %sum.16 = phi double [ %sum.08, %.preheader1 ], [ %sum.2.lcssa, %._crit_edge ]
  %y.05 = phi double [ -3.461235e+02, %.preheader1 ], [ %6, %._crit_edge ]
  %1 = fcmp olt double %y.05, 2.323450e+01, !dbg !78
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !78

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %sum.23 = phi double [ %3, %.lr.ph ], [ %sum.16, %.preheader ]
  %y.12 = phi double [ %4, %.lr.ph ], [ %y.05, %.preheader ]
  %2 = tail call fastcc double @noise(double %x.07, double %y.12), !dbg !80
  %3 = fadd double %sum.23, %2, !dbg !80
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !14), !dbg !80
  %4 = fadd double %y.12, 2.450000e+00, !dbg !78
  tail call void @llvm.dbg.value(metadata !{double %4}, i64 0, metadata !12), !dbg !78
  %5 = fcmp olt double %4, 2.323450e+01, !dbg !78
  br i1 %5, label %.lr.ph, label %._crit_edge, !dbg !78

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %sum.2.lcssa = phi double [ %sum.16, %.preheader ], [ %3, %.lr.ph ]
  %y.1.lcssa = phi double [ %y.05, %.preheader ], [ %4, %.lr.ph ]
  %6 = fadd double %y.1.lcssa, 1.432500e+00, !dbg !76
  tail call void @llvm.dbg.value(metadata !{double %6}, i64 0, metadata !12), !dbg !76
  %7 = fcmp olt double %6, 1.241240e+02, !dbg !76
  br i1 %7, label %.preheader, label %8, !dbg !76

; <label>:8                                       ; preds = %._crit_edge
  %9 = fadd double %x.07, 1.235000e-01, !dbg !74
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !10), !dbg !74
  %10 = fcmp olt double %9, 2.356157e+04, !dbg !74
  br i1 %10, label %.preheader1, label %11, !dbg !74

; <label>:11                                      ; preds = %8
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %sum.2.lcssa) #6, !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc double @noise(double %x, double %y) #1 {
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !21), !dbg !84
  %1 = tail call double @floor(double %x) #5, !dbg !85
  %2 = fptosi double %1 to i32, !dbg !85
  %3 = and i32 %2, 255, !dbg !85
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !22), !dbg !85
  %4 = tail call double @floor(double %y) #5, !dbg !86
  %5 = fptosi double %4 to i32, !dbg !86
  %6 = and i32 %5, 255, !dbg !86
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !23), !dbg !86
  tail call void @llvm.dbg.value(metadata !87, i64 0, metadata !24), !dbg !88
  %7 = fsub double %x, %1, !dbg !89
  tail call void @llvm.dbg.value(metadata !{double %7}, i64 0, metadata !19), !dbg !89
  %8 = fsub double %y, %4, !dbg !90
  tail call void @llvm.dbg.value(metadata !{double %8}, i64 0, metadata !20), !dbg !90
  tail call void @llvm.dbg.value(metadata !91, i64 0, metadata !21), !dbg !92
  %9 = tail call fastcc double @fade(double %7), !dbg !93
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !25), !dbg !93
  %10 = tail call fastcc double @fade(double %8), !dbg !94
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !26), !dbg !94
  %11 = tail call fastcc double @fade(double 0x3FE87AE147AE1400), !dbg !95
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !27), !dbg !95
  %12 = zext i32 %3 to i64, !dbg !96
  %13 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %12, !dbg !96
  %14 = load i32* %13, align 4, !dbg !96, !tbaa !97
  %15 = add nsw i32 %14, %6, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !28), !dbg !96
  %16 = sext i32 %15 to i64, !dbg !96
  %17 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %16, !dbg !96
  %18 = load i32* %17, align 4, !dbg !96, !tbaa !97
  %19 = add nsw i32 %18, 99, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !29), !dbg !96
  %20 = add nsw i32 %15, 1, !dbg !96
  %21 = sext i32 %20 to i64, !dbg !96
  %22 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %21, !dbg !96
  %23 = load i32* %22, align 4, !dbg !96, !tbaa !97
  %24 = add nsw i32 %23, 99, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !30), !dbg !96
  %25 = add nsw i32 %3, 1, !dbg !96
  %26 = zext i32 %25 to i64, !dbg !96
  %27 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %26, !dbg !96
  %28 = load i32* %27, align 4, !dbg !96, !tbaa !97
  %29 = add nsw i32 %28, %6, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !31), !dbg !96
  %30 = sext i32 %29 to i64, !dbg !96
  %31 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %30, !dbg !96
  %32 = load i32* %31, align 4, !dbg !96, !tbaa !97
  %33 = add nsw i32 %32, 99, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !32), !dbg !96
  %34 = add nsw i32 %29, 1, !dbg !96
  %35 = sext i32 %34 to i64, !dbg !96
  %36 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %35, !dbg !96
  %37 = load i32* %36, align 4, !dbg !96, !tbaa !97
  %38 = add nsw i32 %37, 99, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !33), !dbg !96
  %39 = sext i32 %19 to i64, !dbg !101
  %40 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %39, !dbg !101
  %41 = load i32* %40, align 4, !dbg !101, !tbaa !97
  %42 = tail call fastcc double @grad(i32 %41, double %7, double %8, double 0x3FE87AE147AE1400), !dbg !101
  %43 = sext i32 %33 to i64, !dbg !102
  %44 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %43, !dbg !102
  %45 = load i32* %44, align 4, !dbg !102, !tbaa !97
  %46 = fadd double %7, -1.000000e+00, !dbg !102
  %47 = tail call fastcc double @grad(i32 %45, double %46, double %8, double 0x3FE87AE147AE1400), !dbg !102
  %48 = tail call fastcc double @lerp(double %9, double %42, double %47), !dbg !101
  %49 = sext i32 %24 to i64, !dbg !103
  %50 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %49, !dbg !103
  %51 = load i32* %50, align 4, !dbg !103, !tbaa !97
  %52 = fadd double %8, -1.000000e+00, !dbg !103
  %53 = tail call fastcc double @grad(i32 %51, double %7, double %52, double 0x3FE87AE147AE1400), !dbg !103
  %54 = sext i32 %38 to i64, !dbg !104
  %55 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %54, !dbg !104
  %56 = load i32* %55, align 4, !dbg !104, !tbaa !97
  %57 = tail call fastcc double @grad(i32 %56, double %46, double %52, double 0x3FE87AE147AE1400), !dbg !104
  %58 = tail call fastcc double @lerp(double %9, double %53, double %57), !dbg !103
  %59 = tail call fastcc double @lerp(double %10, double %48, double %58), !dbg !101
  %60 = add nsw i32 %18, 100, !dbg !105
  %61 = sext i32 %60 to i64, !dbg !105
  %62 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %61, !dbg !105
  %63 = load i32* %62, align 4, !dbg !105, !tbaa !97
  %64 = tail call fastcc double @grad(i32 %63, double %7, double %8, double 0xBFCE147AE147B000), !dbg !105
  %65 = add nsw i32 %32, 100, !dbg !106
  %66 = sext i32 %65 to i64, !dbg !106
  %67 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %66, !dbg !106
  %68 = load i32* %67, align 4, !dbg !106, !tbaa !97
  %69 = tail call fastcc double @grad(i32 %68, double %46, double %8, double 0xBFCE147AE147B000), !dbg !106
  %70 = tail call fastcc double @lerp(double %9, double %64, double %69), !dbg !105
  %71 = add nsw i32 %23, 100, !dbg !107
  %72 = sext i32 %71 to i64, !dbg !107
  %73 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %72, !dbg !107
  %74 = load i32* %73, align 4, !dbg !107, !tbaa !97
  %75 = tail call fastcc double @grad(i32 %74, double %7, double %52, double 0xBFCE147AE147B000), !dbg !107
  %76 = add nsw i32 %37, 100, !dbg !108
  %77 = sext i32 %76 to i64, !dbg !108
  %78 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %77, !dbg !108
  %79 = load i32* %78, align 4, !dbg !108, !tbaa !97
  %80 = tail call fastcc double @grad(i32 %79, double %46, double %52, double 0xBFCE147AE147B000), !dbg !108
  %81 = tail call fastcc double @lerp(double %9, double %75, double %80), !dbg !107
  %82 = tail call fastcc double @lerp(double %10, double %70, double %81), !dbg !105
  %83 = tail call fastcc double @lerp(double %11, double %59, double %82), !dbg !101
  ret double %83, !dbg !101
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare double @floor(double) #3

; Function Attrs: nounwind readnone uwtable
define internal fastcc double @fade(double %t) #4 {
  tail call void @llvm.dbg.value(metadata !{double %t}, i64 0, metadata !54), !dbg !109
  %1 = fmul double %t, %t, !dbg !109
  %2 = fmul double %1, %t, !dbg !109
  %3 = fmul double %t, 6.000000e+00, !dbg !109
  %4 = fadd double %3, -1.500000e+01, !dbg !109
  %5 = fmul double %4, %t, !dbg !109
  %6 = fadd double %5, 1.000000e+01, !dbg !109
  %7 = fmul double %2, %6, !dbg !109
  ret double %7, !dbg !109
}

; Function Attrs: nounwind readnone uwtable
define internal fastcc double @lerp(double %t, double %a, double %b) #4 {
  tail call void @llvm.dbg.value(metadata !{double %t}, i64 0, metadata !47), !dbg !110
  tail call void @llvm.dbg.value(metadata !{double %a}, i64 0, metadata !48), !dbg !110
  tail call void @llvm.dbg.value(metadata !{double %b}, i64 0, metadata !49), !dbg !110
  %1 = fsub double %b, %a, !dbg !110
  %2 = fmul double %1, %t, !dbg !110
  %3 = fadd double %2, %a, !dbg !110
  ret double %3, !dbg !110
}

; Function Attrs: nounwind readnone uwtable
define internal fastcc double @grad(i32 %hash, double %x, double %y, double %z) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %hash}, i64 0, metadata !38), !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %x}, i64 0, metadata !39), !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %y}, i64 0, metadata !40), !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %z}, i64 0, metadata !41), !dbg !111
  %1 = and i32 %hash, 15, !dbg !112
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !42), !dbg !112
  %2 = icmp ult i32 %1, 8, !dbg !113
  %3 = select i1 %2, double %x, double %y, !dbg !113
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !43), !dbg !113
  %4 = icmp ult i32 %1, 4, !dbg !113
  br i1 %4, label %9, label %5, !dbg !113

; <label>:5                                       ; preds = %0
  %6 = and i32 %hash, 13, !dbg !113
  %7 = icmp eq i32 %6, 12, !dbg !113
  %8 = select i1 %7, double %x, double %z, !dbg !113
  br label %9, !dbg !113

; <label>:9                                       ; preds = %0, %5
  %10 = phi double [ %8, %5 ], [ %y, %0 ], !dbg !113
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !44), !dbg !113
  %11 = and i32 %hash, 1, !dbg !114
  %12 = icmp eq i32 %11, 0, !dbg !114
  br i1 %12, label %15, label %13, !dbg !114

; <label>:13                                      ; preds = %9
  %14 = fsub double -0.000000e+00, %3, !dbg !114
  br label %15, !dbg !114

; <label>:15                                      ; preds = %9, %13
  %16 = phi double [ %14, %13 ], [ %3, %9 ], !dbg !114
  %17 = and i32 %hash, 2, !dbg !114
  %18 = icmp eq i32 %17, 0, !dbg !114
  br i1 %18, label %21, label %19, !dbg !114

; <label>:19                                      ; preds = %15
  %20 = fsub double -0.000000e+00, %10, !dbg !114
  br label %21, !dbg !114

; <label>:21                                      ; preds = %15, %19
  %22 = phi double [ %20, %19 ], [ %10, %15 ], !dbg !114
  %23 = fadd double %16, %22, !dbg !114
  ret double %23, !dbg !114
}

; Function Attrs: nounwind uwtable
define internal fastcc void @init() #0 {
  tail call void @llvm.dbg.value(metadata !115, i64 0, metadata !57), !dbg !116
  br label %1, !dbg !117

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %1 ]
  %2 = getelementptr inbounds [256 x i32]* @permutation, i64 0, i64 %indvars.iv, !dbg !119
  %3 = load i32* %2, align 4, !dbg !119, !tbaa !97
  %4 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %indvars.iv, !dbg !119
  store i32 %3, i32* %4, align 4, !dbg !119, !tbaa !97
  %5 = add nsw i64 %indvars.iv, 256, !dbg !119
  %6 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %5, !dbg !119
  store i32 %3, i32* %6, align 4, !dbg !119, !tbaa !97
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !117
  %exitcond = icmp eq i64 %indvars.iv.next, 256, !dbg !117
  br i1 %exitcond, label %7, label %1, !dbg !117

; <label>:7                                       ; preds = %1
  ret void
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68}
!llvm.ident = !{!69}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !58, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c] [DW_LANG_C99]
!1 = metadata !{metadata !"perlin.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !15, metadata !34, metadata !45, metadata !50, metadata !55}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 64, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !9, i32 64} ; [ DW_TAG_subprogram ] [line 64] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !12, metadata !13, metadata !14}
!10 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 67, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 67]
!11 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!12 = metadata !{i32 786688, metadata !4, metadata !"y", metadata !5, i32 67, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 67]
!13 = metadata !{i32 786688, metadata !4, metadata !"z", metadata !5, i32 67, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 67]
!14 = metadata !{i32 786688, metadata !4, metadata !"sum", metadata !5, i32 67, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 67]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"noise", metadata !"noise", metadata !"", i32 35, metadata !16, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double, double)* @noise, null, null, metadata !18, i32 35} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [noise]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !11, metadata !11, metadata !11, metadata !11}
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33}
!19 = metadata !{i32 786689, metadata !15, metadata !"x", metadata !5, i32 16777251, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 35]
!20 = metadata !{i32 786689, metadata !15, metadata !"y", metadata !5, i32 33554467, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 35]
!21 = metadata !{i32 786689, metadata !15, metadata !"z", metadata !5, i32 50331683, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 35]
!22 = metadata !{i32 786688, metadata !15, metadata !"X", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 36]
!23 = metadata !{i32 786688, metadata !15, metadata !"Y", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y] [line 37]
!24 = metadata !{i32 786688, metadata !15, metadata !"Z", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z] [line 38]
!25 = metadata !{i32 786688, metadata !15, metadata !"u", metadata !5, i32 42, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 42]
!26 = metadata !{i32 786688, metadata !15, metadata !"v", metadata !5, i32 43, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 43]
!27 = metadata !{i32 786688, metadata !15, metadata !"w", metadata !5, i32 44, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 44]
!28 = metadata !{i32 786688, metadata !15, metadata !"A", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 45]
!29 = metadata !{i32 786688, metadata !15, metadata !"AA", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [AA] [line 45]
!30 = metadata !{i32 786688, metadata !15, metadata !"AB", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [AB] [line 45]
!31 = metadata !{i32 786688, metadata !15, metadata !"B", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [B] [line 46]
!32 = metadata !{i32 786688, metadata !15, metadata !"BA", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BA] [line 46]
!33 = metadata !{i32 786688, metadata !15, metadata !"BB", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BB] [line 46]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"grad", metadata !"grad", metadata !"", i32 28, metadata !35, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, double, double, double)* @grad, null, null, metadata !37, i32 28} ; [ DW_TAG_subprogram ] [line 28] [local] [def] [grad]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !11, metadata !8, metadata !11, metadata !11, metadata !11}
!37 = metadata !{metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44}
!38 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!39 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 28]
!40 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 28]
!41 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 28]
!42 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 29]
!43 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 30]
!44 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 31]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lerp", metadata !"lerp", metadata !"", i32 26, metadata !16, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double, double, double)* @lerp, null, null, metadata !46, i32 26} ; [ DW_TAG_subprogram ] [line 26] [local] [def] [lerp]
!46 = metadata !{metadata !47, metadata !48, metadata !49}
!47 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 26]
!48 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 26]
!49 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 26]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fade", metadata !"fade", metadata !"", i32 24, metadata !51, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @fade, null, null, metadata !53, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [fade]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{metadata !11, metadata !11}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 24]
!55 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"init", metadata !"init", metadata !"", i32 58, metadata !6, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @init, null, null, metadata !56, i32 58} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [init]
!56 = metadata !{metadata !57}
!57 = metadata !{i32 786688, metadata !55, metadata !"i", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 59]
!58 = metadata !{metadata !59, metadata !63}
!59 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 7, metadata !60, i32 1, i32 1, [512 x i32]* @p, null} ; [ DW_TAG_variable ] [p] [line 7] [local] [def]
!60 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !8, metadata !61, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!63 = metadata !{i32 786484, i32 0, null, metadata !"permutation", metadata !"permutation", metadata !"", metadata !5, i32 9, metadata !64, i32 1, i32 1, [256 x i32]* @permutation, null} ; [ DW_TAG_variable ] [permutation] [line 9] [local] [def]
!64 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !8, metadata !65, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from int]
!65 = metadata !{metadata !66}
!66 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!67 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!68 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!69 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!70 = metadata !{i32 65, i32 0, metadata !4, null}
!71 = metadata !{double 0.000000e+00}
!72 = metadata !{i32 67, i32 0, metadata !4, null}
!73 = metadata !{double -1.135257e+04}
!74 = metadata !{i32 73, i32 0, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !4, i32 73, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!76 = metadata !{i32 74, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !75, i32 74, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!78 = metadata !{i32 75, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !77, i32 75, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!80 = metadata !{i32 77, i32 0, metadata !79, null}
!81 = metadata !{i32 79, i32 0, metadata !4, null}
!82 = metadata !{i32 80, i32 0, metadata !4, null}
!83 = metadata !{double -1.562350e+02}
!84 = metadata !{i32 35, i32 0, metadata !15, null}
!85 = metadata !{i32 36, i32 0, metadata !15, null}
!86 = metadata !{i32 37, i32 0, metadata !15, null}
!87 = metadata !{i32 99}
!88 = metadata !{i32 38, i32 0, metadata !15, null}
!89 = metadata !{i32 39, i32 0, metadata !15, null}
!90 = metadata !{i32 40, i32 0, metadata !15, null}
!91 = metadata !{double 0x3FE87AE147AE1400}
!92 = metadata !{i32 41, i32 0, metadata !15, null}
!93 = metadata !{i32 42, i32 0, metadata !15, null}
!94 = metadata !{i32 43, i32 0, metadata !15, null}
!95 = metadata !{i32 44, i32 0, metadata !15, null}
!96 = metadata !{i32 45, i32 0, metadata !15, null}
!97 = metadata !{metadata !98, metadata !98, i64 0}
!98 = metadata !{metadata !"int", metadata !99, i64 0}
!99 = metadata !{metadata !"omnipotent char", metadata !100, i64 0}
!100 = metadata !{metadata !"Simple C/C++ TBAA"}
!101 = metadata !{i32 48, i32 0, metadata !15, null}
!102 = metadata !{i32 49, i32 0, metadata !15, null}
!103 = metadata !{i32 50, i32 0, metadata !15, null}
!104 = metadata !{i32 51, i32 0, metadata !15, null}
!105 = metadata !{i32 52, i32 0, metadata !15, null}
!106 = metadata !{i32 53, i32 0, metadata !15, null}
!107 = metadata !{i32 54, i32 0, metadata !15, null}
!108 = metadata !{i32 55, i32 0, metadata !15, null}
!109 = metadata !{i32 24, i32 0, metadata !50, null}
!110 = metadata !{i32 26, i32 0, metadata !45, null}
!111 = metadata !{i32 28, i32 0, metadata !34, null}
!112 = metadata !{i32 29, i32 0, metadata !34, null}
!113 = metadata !{i32 30, i32 0, metadata !34, null}
!114 = metadata !{i32 32, i32 0, metadata !34, null}
!115 = metadata !{i32 0}
!116 = metadata !{i32 59, i32 0, metadata !55, null}
!117 = metadata !{i32 60, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !55, i32 60, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!119 = metadata !{i32 61, i32 0, metadata !118, null}
