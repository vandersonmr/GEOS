; ModuleID = 'perlin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@p = internal unnamed_addr global [512 x i32] zeroinitializer, align 16
@permutation = internal unnamed_addr constant [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 16

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !71), !dbg !73
  br label %1, !dbg !74

; <label>:1                                       ; preds = %1, %0
  %indvars.iv.i = phi i64 [ 0, %0 ], [ %indvars.iv.next.i, %1 ]
  %2 = getelementptr inbounds [256 x i32]* @permutation, i64 0, i64 %indvars.iv.i, !dbg !76
  %3 = load i32* %2, align 4, !dbg !76, !tbaa !77
  %4 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %indvars.iv.i, !dbg !76
  store i32 %3, i32* %4, align 4, !dbg !76, !tbaa !77
  %5 = add nsw i64 %indvars.iv.i, 256, !dbg !76
  %6 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %5, !dbg !76
  store i32 %3, i32* %6, align 4, !dbg !76, !tbaa !77
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !74
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 256, !dbg !74
  br i1 %exitcond.i, label %.preheader1, label %1, !dbg !74

.preheader1:                                      ; preds = %1, %init.exit
  %sum.08 = phi double [ %sum.2.lcssa, %init.exit ], [ 0.000000e+00, %1 ]
  %x.07 = phi double [ %122, %init.exit ], [ -1.135257e+04, %1 ]
  br label %.preheader, !dbg !81

.preheader:                                       ; preds = %.preheader1, %._crit_edge
  %sum.16 = phi double [ %sum.08, %.preheader1 ], [ %sum.2.lcssa, %._crit_edge ]
  %y.05 = phi double [ -3.461235e+02, %.preheader1 ], [ %120, %._crit_edge ]
  %7 = fcmp olt double %y.05, 2.323450e+01, !dbg !84
  br i1 %7, label %.lr.ph, label %._crit_edge, !dbg !84

.lr.ph:                                           ; preds = %.preheader
  %8 = tail call double @floor(double %x.07) #5, !dbg !86
  %9 = fptosi double %8 to i32, !dbg !86
  %10 = and i32 %9, 255, !dbg !86
  %11 = fsub double %x.07, %8, !dbg !88
  %12 = fmul double %11, %11, !dbg !89
  %13 = fmul double %11, %12, !dbg !89
  %14 = fmul double %11, 6.000000e+00, !dbg !89
  %15 = fadd double %14, -1.500000e+01, !dbg !89
  %16 = fmul double %11, %15, !dbg !89
  %17 = fadd double %16, 1.000000e+01, !dbg !89
  %18 = fmul double %13, %17, !dbg !89
  %19 = zext i32 %10 to i64, !dbg !91
  %20 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %19, !dbg !91
  %21 = load i32* %20, align 4, !dbg !91, !tbaa !77
  %22 = add nsw i32 %10, 1, !dbg !91
  %23 = zext i32 %22 to i64, !dbg !91
  %24 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %23, !dbg !91
  %25 = load i32* %24, align 4, !dbg !91, !tbaa !77
  %26 = fadd double %11, -1.000000e+00, !dbg !92
  br label %27, !dbg !84

; <label>:27                                      ; preds = %.lr.ph, %27
  %sum.23 = phi double [ %sum.16, %.lr.ph ], [ %117, %27 ]
  %y.12 = phi double [ %y.05, %.lr.ph ], [ %118, %27 ]
  tail call void @llvm.dbg.value(metadata !93, i64 0, metadata !94) #6, !dbg !95
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !96) #6, !dbg !86
  %28 = tail call double @floor(double %y.12) #5, !dbg !97
  %29 = fptosi double %28 to i32, !dbg !97
  %30 = and i32 %29, 255, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !98) #6, !dbg !97
  tail call void @llvm.dbg.value(metadata !99, i64 0, metadata !100) #6, !dbg !101
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !102) #6, !dbg !88
  %31 = fsub double %y.12, %28, !dbg !103
  tail call void @llvm.dbg.value(metadata !{double %31}, i64 0, metadata !104) #6, !dbg !103
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !94) #6, !dbg !106
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !107) #6, !dbg !89
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !108) #6, !dbg !90
  tail call void @llvm.dbg.value(metadata !{double %31}, i64 0, metadata !109) #6, !dbg !111
  %32 = fmul double %31, %31, !dbg !111
  %33 = fmul double %31, %32, !dbg !111
  %34 = fmul double %31, 6.000000e+00, !dbg !111
  %35 = fadd double %34, -1.500000e+01, !dbg !111
  %36 = fmul double %31, %35, !dbg !111
  %37 = fadd double %36, 1.000000e+01, !dbg !111
  %38 = fmul double %33, %37, !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !112) #6, !dbg !110
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !113) #6, !dbg !115
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !117) #6, !dbg !114
  %39 = add nsw i32 %30, %21, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !118) #6, !dbg !91
  %40 = sext i32 %39 to i64, !dbg !91
  %41 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %40, !dbg !91
  %42 = load i32* %41, align 4, !dbg !91, !tbaa !77
  %43 = add nsw i32 %42, 99, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !119) #6, !dbg !91
  %44 = add nsw i32 %39, 1, !dbg !91
  %45 = sext i32 %44 to i64, !dbg !91
  %46 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %45, !dbg !91
  %47 = load i32* %46, align 4, !dbg !91, !tbaa !77
  %48 = add nsw i32 %47, 99, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !120) #6, !dbg !91
  %49 = add nsw i32 %25, %30, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !121) #6, !dbg !91
  %50 = sext i32 %49 to i64, !dbg !91
  %51 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %50, !dbg !91
  %52 = load i32* %51, align 4, !dbg !91, !tbaa !77
  %53 = add nsw i32 %52, 99, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !122) #6, !dbg !91
  %54 = add nsw i32 %49, 1, !dbg !91
  %55 = sext i32 %54 to i64, !dbg !91
  %56 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %55, !dbg !91
  %57 = load i32* %56, align 4, !dbg !91, !tbaa !77
  %58 = add nsw i32 %57, 99, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !123) #6, !dbg !91
  %59 = sext i32 %43 to i64, !dbg !124
  %60 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %59, !dbg !124
  %61 = load i32* %60, align 4, !dbg !124, !tbaa !77
  %62 = tail call fastcc double @grad(i32 %61, double %11, double %31, double 0x3FE87AE147AE1400) #7, !dbg !124
  %63 = sext i32 %53 to i64, !dbg !92
  %64 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %63, !dbg !92
  %65 = load i32* %64, align 4, !dbg !92, !tbaa !77
  %66 = tail call fastcc double @grad(i32 %65, double %26, double %31, double 0x3FE87AE147AE1400) #7, !dbg !92
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !125) #6, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !127) #6, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %66}, i64 0, metadata !128) #6, !dbg !126
  %67 = fsub double %66, %62, !dbg !126
  %68 = fmul double %18, %67, !dbg !126
  %69 = fadd double %62, %68, !dbg !126
  %70 = sext i32 %48 to i64, !dbg !129
  %71 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %70, !dbg !129
  %72 = load i32* %71, align 4, !dbg !129, !tbaa !77
  %73 = fadd double %31, -1.000000e+00, !dbg !129
  %74 = tail call fastcc double @grad(i32 %72, double %11, double %73, double 0x3FE87AE147AE1400) #7, !dbg !129
  %75 = sext i32 %58 to i64, !dbg !130
  %76 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %75, !dbg !130
  %77 = load i32* %76, align 4, !dbg !130, !tbaa !77
  %78 = tail call fastcc double @grad(i32 %77, double %26, double %73, double 0x3FE87AE147AE1400) #7, !dbg !130
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !131) #6, !dbg !132
  tail call void @llvm.dbg.value(metadata !{double %74}, i64 0, metadata !133) #6, !dbg !132
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !134) #6, !dbg !132
  %79 = fsub double %78, %74, !dbg !132
  %80 = fmul double %18, %79, !dbg !132
  %81 = fadd double %74, %80, !dbg !132
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !125) #6, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %69}, i64 0, metadata !127) #6, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !128) #6, !dbg !126
  %82 = fsub double %81, %69, !dbg !126
  %83 = fmul double %38, %82, !dbg !126
  %84 = fadd double %69, %83, !dbg !126
  %85 = add nsw i32 %42, 100, !dbg !135
  %86 = sext i32 %85 to i64, !dbg !135
  %87 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %86, !dbg !135
  %88 = load i32* %87, align 4, !dbg !135, !tbaa !77
  %89 = tail call fastcc double @grad(i32 %88, double %11, double %31, double 0xBFCE147AE147B000) #7, !dbg !135
  %90 = add nsw i32 %52, 100, !dbg !136
  %91 = sext i32 %90 to i64, !dbg !136
  %92 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %91, !dbg !136
  %93 = load i32* %92, align 4, !dbg !136, !tbaa !77
  %94 = tail call fastcc double @grad(i32 %93, double %26, double %31, double 0xBFCE147AE147B000) #7, !dbg !136
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !137) #6, !dbg !138
  tail call void @llvm.dbg.value(metadata !{double %89}, i64 0, metadata !139) #6, !dbg !138
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !140) #6, !dbg !138
  %95 = fsub double %94, %89, !dbg !138
  %96 = fmul double %18, %95, !dbg !138
  %97 = fadd double %89, %96, !dbg !138
  %98 = add nsw i32 %47, 100, !dbg !141
  %99 = sext i32 %98 to i64, !dbg !141
  %100 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %99, !dbg !141
  %101 = load i32* %100, align 4, !dbg !141, !tbaa !77
  %102 = tail call fastcc double @grad(i32 %101, double %11, double %73, double 0xBFCE147AE147B000) #7, !dbg !141
  %103 = add nsw i32 %57, 100, !dbg !142
  %104 = sext i32 %103 to i64, !dbg !142
  %105 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %104, !dbg !142
  %106 = load i32* %105, align 4, !dbg !142, !tbaa !77
  %107 = tail call fastcc double @grad(i32 %106, double %26, double %73, double 0xBFCE147AE147B000) #7, !dbg !142
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !143) #6, !dbg !144
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !145) #6, !dbg !144
  tail call void @llvm.dbg.value(metadata !{double %107}, i64 0, metadata !146) #6, !dbg !144
  %108 = fsub double %107, %102, !dbg !144
  %109 = fmul double %18, %108, !dbg !144
  %110 = fadd double %102, %109, !dbg !144
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !137) #6, !dbg !138
  tail call void @llvm.dbg.value(metadata !{double %97}, i64 0, metadata !139) #6, !dbg !138
  tail call void @llvm.dbg.value(metadata !{double %110}, i64 0, metadata !140) #6, !dbg !138
  %111 = fsub double %110, %97, !dbg !138
  %112 = fmul double %38, %111, !dbg !138
  %113 = fadd double %97, %112, !dbg !138
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !125) #6, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %84}, i64 0, metadata !127) #6, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %113}, i64 0, metadata !128) #6, !dbg !126
  %114 = fsub double %113, %84, !dbg !126
  %115 = fmul double %114, 0x3FED2C62745753FF, !dbg !126
  %116 = fadd double %84, %115, !dbg !126
  %117 = fadd double %sum.23, %116, !dbg !87
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !14), !dbg !87
  %118 = fadd double %y.12, 2.450000e+00, !dbg !84
  tail call void @llvm.dbg.value(metadata !{double %118}, i64 0, metadata !12), !dbg !84
  %119 = fcmp olt double %118, 2.323450e+01, !dbg !84
  br i1 %119, label %27, label %._crit_edge, !dbg !84

._crit_edge:                                      ; preds = %27, %.preheader
  %sum.2.lcssa = phi double [ %sum.16, %.preheader ], [ %117, %27 ]
  %y.1.lcssa = phi double [ %y.05, %.preheader ], [ %118, %27 ]
  %120 = fadd double %y.1.lcssa, 1.432500e+00, !dbg !81
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !12), !dbg !81
  %121 = fcmp olt double %120, 1.241240e+02, !dbg !81
  br i1 %121, label %.preheader, label %init.exit, !dbg !81

init.exit:                                        ; preds = %._crit_edge
  %122 = fadd double %x.07, 1.235000e-01, !dbg !147
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !10), !dbg !147
  %123 = fcmp olt double %122, 2.356157e+04, !dbg !147
  br i1 %123, label %.preheader1, label %124, !dbg !147

; <label>:124                                     ; preds = %init.exit
  %125 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %sum.2.lcssa) #7, !dbg !148
  ret i32 0, !dbg !149
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize readnone
declare double @floor(double) #2

; Function Attrs: minsize nounwind optsize readnone uwtable
define internal fastcc double @grad(i32 %hash, double %x, double %y, double %z) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %hash}, i64 0, metadata !38), !dbg !150
  tail call void @llvm.dbg.value(metadata !{double %x}, i64 0, metadata !39), !dbg !150
  tail call void @llvm.dbg.value(metadata !{double %y}, i64 0, metadata !40), !dbg !150
  tail call void @llvm.dbg.value(metadata !{double %z}, i64 0, metadata !41), !dbg !150
  %1 = and i32 %hash, 15, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !42), !dbg !151
  %2 = icmp ult i32 %1, 8, !dbg !152
  %3 = select i1 %2, double %x, double %y, !dbg !152
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !43), !dbg !152
  %4 = icmp ult i32 %1, 4, !dbg !152
  br i1 %4, label %9, label %5, !dbg !152

; <label>:5                                       ; preds = %0
  %6 = and i32 %hash, 13, !dbg !152
  %7 = icmp eq i32 %6, 12, !dbg !152
  %8 = select i1 %7, double %x, double %z, !dbg !152
  br label %9, !dbg !152

; <label>:9                                       ; preds = %0, %5
  %10 = phi double [ %8, %5 ], [ %y, %0 ], !dbg !152
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !44), !dbg !152
  %11 = and i32 %hash, 1, !dbg !153
  %12 = icmp eq i32 %11, 0, !dbg !153
  br i1 %12, label %15, label %13, !dbg !153

; <label>:13                                      ; preds = %9
  %14 = fsub double -0.000000e+00, %3, !dbg !153
  br label %15, !dbg !153

; <label>:15                                      ; preds = %9, %13
  %16 = phi double [ %14, %13 ], [ %3, %9 ], !dbg !153
  %17 = and i32 %hash, 2, !dbg !153
  %18 = icmp eq i32 %17, 0, !dbg !153
  br i1 %18, label %21, label %19, !dbg !153

; <label>:19                                      ; preds = %15
  %20 = fsub double -0.000000e+00, %10, !dbg !153
  br label %21, !dbg !153

; <label>:21                                      ; preds = %15, %19
  %22 = phi double [ %20, %19 ], [ %10, %15 ], !dbg !153
  %23 = fadd double %16, %22, !dbg !153
  ret double %23, !dbg !153
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { minsize nounwind optsize readnone }
attributes #6 = { nounwind }
attributes #7 = { minsize nounwind optsize }

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
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"noise", metadata !"noise", metadata !"", i32 35, metadata !16, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !18, i32 35} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [noise]
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
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lerp", metadata !"lerp", metadata !"", i32 26, metadata !16, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !46, i32 26} ; [ DW_TAG_subprogram ] [line 26] [local] [def] [lerp]
!46 = metadata !{metadata !47, metadata !48, metadata !49}
!47 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 26]
!48 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 26]
!49 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 26]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fade", metadata !"fade", metadata !"", i32 24, metadata !51, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !53, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [fade]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{metadata !11, metadata !11}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 24]
!55 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"init", metadata !"init", metadata !"", i32 58, metadata !6, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !56, i32 58} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [init]
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
!70 = metadata !{i32 0}
!71 = metadata !{i32 786688, metadata !55, metadata !"i", metadata !5, i32 59, metadata !8, i32 0, metadata !72} ; [ DW_TAG_auto_variable ] [i] [line 59]
!72 = metadata !{i32 65, i32 0, metadata !4, null}
!73 = metadata !{i32 59, i32 0, metadata !55, metadata !72}
!74 = metadata !{i32 60, i32 0, metadata !75, metadata !72}
!75 = metadata !{i32 786443, metadata !1, metadata !55, i32 60, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!76 = metadata !{i32 61, i32 0, metadata !75, metadata !72}
!77 = metadata !{metadata !78, metadata !78, i64 0}
!78 = metadata !{metadata !"int", metadata !79, i64 0}
!79 = metadata !{metadata !"omnipotent char", metadata !80, i64 0}
!80 = metadata !{metadata !"Simple C/C++ TBAA"}
!81 = metadata !{i32 74, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !83, i32 74, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!83 = metadata !{i32 786443, metadata !1, metadata !4, i32 73, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!84 = metadata !{i32 75, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 75, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!86 = metadata !{i32 36, i32 0, metadata !15, metadata !87}
!87 = metadata !{i32 77, i32 0, metadata !85, null}
!88 = metadata !{i32 39, i32 0, metadata !15, metadata !87}
!89 = metadata !{i32 24, i32 0, metadata !50, metadata !90}
!90 = metadata !{i32 42, i32 0, metadata !15, metadata !87}
!91 = metadata !{i32 45, i32 0, metadata !15, metadata !87}
!92 = metadata !{i32 49, i32 0, metadata !15, metadata !87}
!93 = metadata !{double -1.562350e+02}
!94 = metadata !{i32 786689, metadata !15, metadata !"z", metadata !5, i32 50331683, metadata !11, i32 0, metadata !87} ; [ DW_TAG_arg_variable ] [z] [line 35]
!95 = metadata !{i32 35, i32 0, metadata !15, metadata !87}
!96 = metadata !{i32 786688, metadata !15, metadata !"X", metadata !5, i32 36, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [X] [line 36]
!97 = metadata !{i32 37, i32 0, metadata !15, metadata !87}
!98 = metadata !{i32 786688, metadata !15, metadata !"Y", metadata !5, i32 37, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [Y] [line 37]
!99 = metadata !{i32 99}
!100 = metadata !{i32 786688, metadata !15, metadata !"Z", metadata !5, i32 38, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [Z] [line 38]
!101 = metadata !{i32 38, i32 0, metadata !15, metadata !87}
!102 = metadata !{i32 786689, metadata !15, metadata !"x", metadata !5, i32 16777251, metadata !11, i32 0, metadata !87} ; [ DW_TAG_arg_variable ] [x] [line 35]
!103 = metadata !{i32 40, i32 0, metadata !15, metadata !87}
!104 = metadata !{i32 786689, metadata !15, metadata !"y", metadata !5, i32 33554467, metadata !11, i32 0, metadata !87} ; [ DW_TAG_arg_variable ] [y] [line 35]
!105 = metadata !{double 0x3FE87AE147AE1400}
!106 = metadata !{i32 41, i32 0, metadata !15, metadata !87}
!107 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, metadata !90} ; [ DW_TAG_arg_variable ] [t] [line 24]
!108 = metadata !{i32 786688, metadata !15, metadata !"u", metadata !5, i32 42, metadata !11, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [u] [line 42]
!109 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, metadata !110} ; [ DW_TAG_arg_variable ] [t] [line 24]
!110 = metadata !{i32 43, i32 0, metadata !15, metadata !87}
!111 = metadata !{i32 24, i32 0, metadata !50, metadata !110}
!112 = metadata !{i32 786688, metadata !15, metadata !"v", metadata !5, i32 43, metadata !11, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [v] [line 43]
!113 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [t] [line 24]
!114 = metadata !{i32 44, i32 0, metadata !15, metadata !87}
!115 = metadata !{i32 24, i32 0, metadata !50, metadata !114}
!116 = metadata !{double 0x3FED2C62745753FF}
!117 = metadata !{i32 786688, metadata !15, metadata !"w", metadata !5, i32 44, metadata !11, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [w] [line 44]
!118 = metadata !{i32 786688, metadata !15, metadata !"A", metadata !5, i32 45, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [A] [line 45]
!119 = metadata !{i32 786688, metadata !15, metadata !"AA", metadata !5, i32 45, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [AA] [line 45]
!120 = metadata !{i32 786688, metadata !15, metadata !"AB", metadata !5, i32 45, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [AB] [line 45]
!121 = metadata !{i32 786688, metadata !15, metadata !"B", metadata !5, i32 46, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [B] [line 46]
!122 = metadata !{i32 786688, metadata !15, metadata !"BA", metadata !5, i32 46, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [BA] [line 46]
!123 = metadata !{i32 786688, metadata !15, metadata !"BB", metadata !5, i32 46, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [BB] [line 46]
!124 = metadata !{i32 48, i32 0, metadata !15, metadata !87}
!125 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !124} ; [ DW_TAG_arg_variable ] [t] [line 26]
!126 = metadata !{i32 26, i32 0, metadata !45, metadata !124}
!127 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !124} ; [ DW_TAG_arg_variable ] [a] [line 26]
!128 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !124} ; [ DW_TAG_arg_variable ] [b] [line 26]
!129 = metadata !{i32 50, i32 0, metadata !15, metadata !87}
!130 = metadata !{i32 51, i32 0, metadata !15, metadata !87}
!131 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [t] [line 26]
!132 = metadata !{i32 26, i32 0, metadata !45, metadata !129}
!133 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [a] [line 26]
!134 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [b] [line 26]
!135 = metadata !{i32 52, i32 0, metadata !15, metadata !87}
!136 = metadata !{i32 53, i32 0, metadata !15, metadata !87}
!137 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [t] [line 26]
!138 = metadata !{i32 26, i32 0, metadata !45, metadata !135}
!139 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [a] [line 26]
!140 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [b] [line 26]
!141 = metadata !{i32 54, i32 0, metadata !15, metadata !87}
!142 = metadata !{i32 55, i32 0, metadata !15, metadata !87}
!143 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !141} ; [ DW_TAG_arg_variable ] [t] [line 26]
!144 = metadata !{i32 26, i32 0, metadata !45, metadata !141}
!145 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !141} ; [ DW_TAG_arg_variable ] [a] [line 26]
!146 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !141} ; [ DW_TAG_arg_variable ] [b] [line 26]
!147 = metadata !{i32 73, i32 0, metadata !83, null}
!148 = metadata !{i32 79, i32 0, metadata !4, null}
!149 = metadata !{i32 80, i32 0, metadata !4, null}
!150 = metadata !{i32 28, i32 0, metadata !34, null}
!151 = metadata !{i32 29, i32 0, metadata !34, null}
!152 = metadata !{i32 30, i32 0, metadata !34, null}
!153 = metadata !{i32 32, i32 0, metadata !34, null}
