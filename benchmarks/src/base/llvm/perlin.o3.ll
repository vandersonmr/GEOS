; ModuleID = 'perlin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@p = internal unnamed_addr global [512 x i32] zeroinitializer, align 16
@permutation = internal unnamed_addr constant [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
vector.ph:
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !71), !dbg !73
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !74
  %0 = getelementptr inbounds [256 x i32]* @permutation, i64 0, i64 %index, !dbg !76
  %1 = bitcast i32* %0 to <4 x i32>*, !dbg !76
  %wide.load = load <4 x i32>* %1, align 16, !dbg !76
  %2 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %index, !dbg !76
  %3 = bitcast i32* %2 to <4 x i32>*, !dbg !76
  store <4 x i32> %wide.load, <4 x i32>* %3, align 16, !dbg !76
  %4 = add i64 %index, 256, !dbg !76
  %5 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %4, !dbg !76
  %6 = bitcast i32* %5 to <4 x i32>*, !dbg !76
  store <4 x i32> %wide.load, <4 x i32>* %6, align 16, !dbg !76
  %index.next = add i64 %index, 4, !dbg !74
  %7 = icmp eq i64 %index.next, 256, !dbg !74
  br i1 %7, label %.preheader1, label %vector.body, !dbg !74, !llvm.loop !77

.preheader1:                                      ; preds = %vector.body, %init.exit
  %sum.08 = phi double [ %sum.2.lcssa, %init.exit ], [ 0.000000e+00, %vector.body ]
  %x.07 = phi double [ %291, %init.exit ], [ -1.135257e+04, %vector.body ]
  br label %.preheader, !dbg !80

.preheader:                                       ; preds = %.preheader1, %._crit_edge
  %sum.16 = phi double [ %sum.08, %.preheader1 ], [ %sum.2.lcssa, %._crit_edge ]
  %y.05 = phi double [ -3.461235e+02, %.preheader1 ], [ %289, %._crit_edge ]
  %8 = fcmp olt double %y.05, 2.323450e+01, !dbg !83
  br i1 %8, label %.lr.ph, label %._crit_edge, !dbg !83

.lr.ph:                                           ; preds = %.preheader
  %9 = tail call double @floor(double %x.07) #3, !dbg !85
  %10 = fptosi double %9 to i32, !dbg !85
  %11 = and i32 %10, 255, !dbg !85
  %12 = fsub double %x.07, %9, !dbg !87
  %13 = fmul double %12, %12, !dbg !88
  %14 = fmul double %12, %13, !dbg !88
  %15 = fmul double %12, 6.000000e+00, !dbg !88
  %16 = fadd double %15, -1.500000e+01, !dbg !88
  %17 = fmul double %12, %16, !dbg !88
  %18 = fadd double %17, 1.000000e+01, !dbg !88
  %19 = fmul double %14, %18, !dbg !88
  %20 = zext i32 %11 to i64, !dbg !90
  %21 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %20, !dbg !90
  %22 = load i32* %21, align 4, !dbg !90, !tbaa !91
  %23 = add nsw i32 %11, 1, !dbg !90
  %24 = zext i32 %23 to i64, !dbg !90
  %25 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %24, !dbg !90
  %26 = load i32* %25, align 4, !dbg !90, !tbaa !91
  %27 = fadd double %12, -1.000000e+00, !dbg !95
  br label %28, !dbg !83

; <label>:28                                      ; preds = %.lr.ph, %noise.exit
  %sum.23 = phi double [ %sum.16, %.lr.ph ], [ %286, %noise.exit ]
  %y.12 = phi double [ %y.05, %.lr.ph ], [ %287, %noise.exit ]
  tail call void @llvm.dbg.value(metadata !96, i64 0, metadata !97) #4, !dbg !98
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !99) #4, !dbg !85
  %29 = tail call double @floor(double %y.12) #3, !dbg !100
  %30 = fptosi double %29 to i32, !dbg !100
  %31 = and i32 %30, 255, !dbg !100
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !101) #4, !dbg !100
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !103) #4, !dbg !104
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !105) #4, !dbg !87
  %32 = fsub double %y.12, %29, !dbg !106
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !107) #4, !dbg !106
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !97) #4, !dbg !109
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !110) #4, !dbg !88
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !111) #4, !dbg !89
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !112) #4, !dbg !114
  %33 = fmul double %32, %32, !dbg !114
  %34 = fmul double %32, %33, !dbg !114
  %35 = fmul double %32, 6.000000e+00, !dbg !114
  %36 = fadd double %35, -1.500000e+01, !dbg !114
  %37 = fmul double %32, %36, !dbg !114
  %38 = fadd double %37, 1.000000e+01, !dbg !114
  %39 = fmul double %34, %38, !dbg !114
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !115) #4, !dbg !113
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !116) #4, !dbg !118
  tail call void @llvm.dbg.value(metadata !119, i64 0, metadata !120) #4, !dbg !117
  %40 = add nsw i32 %31, %22, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !121) #4, !dbg !90
  %41 = sext i32 %40 to i64, !dbg !90
  %42 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %41, !dbg !90
  %43 = load i32* %42, align 4, !dbg !90, !tbaa !91
  %44 = add nsw i32 %43, 99, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !122) #4, !dbg !90
  %45 = add nsw i32 %40, 1, !dbg !90
  %46 = sext i32 %45 to i64, !dbg !90
  %47 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %46, !dbg !90
  %48 = load i32* %47, align 4, !dbg !90, !tbaa !91
  %49 = add nsw i32 %48, 99, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !123) #4, !dbg !90
  %50 = add nsw i32 %26, %31, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !124) #4, !dbg !90
  %51 = sext i32 %50 to i64, !dbg !90
  %52 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %51, !dbg !90
  %53 = load i32* %52, align 4, !dbg !90, !tbaa !91
  %54 = add nsw i32 %53, 99, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !125) #4, !dbg !90
  %55 = add nsw i32 %50, 1, !dbg !90
  %56 = sext i32 %55 to i64, !dbg !90
  %57 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %56, !dbg !90
  %58 = load i32* %57, align 4, !dbg !90, !tbaa !91
  %59 = add nsw i32 %58, 99, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %59}, i64 0, metadata !126) #4, !dbg !90
  %60 = sext i32 %44 to i64, !dbg !127
  %61 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %60, !dbg !127
  %62 = load i32* %61, align 4, !dbg !127, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !128) #4, !dbg !129
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !130) #4, !dbg !129
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !131) #4, !dbg !129
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !132) #4, !dbg !129
  %63 = and i32 %62, 15, !dbg !133
  tail call void @llvm.dbg.value(metadata !{i32 %63}, i64 0, metadata !134) #4, !dbg !133
  %64 = icmp ult i32 %63, 8, !dbg !135
  %65 = select i1 %64, double %12, double %32, !dbg !135
  tail call void @llvm.dbg.value(metadata !{double %65}, i64 0, metadata !136) #4, !dbg !135
  %66 = icmp ult i32 %63, 4, !dbg !135
  br i1 %66, label %71, label %67, !dbg !135

; <label>:67                                      ; preds = %28
  %68 = and i32 %62, 13, !dbg !135
  %69 = icmp eq i32 %68, 12, !dbg !135
  %70 = select i1 %69, double %12, double 0x3FE87AE147AE1400, !dbg !135
  br label %71, !dbg !135

; <label>:71                                      ; preds = %67, %28
  %72 = phi double [ %70, %67 ], [ %32, %28 ], !dbg !135
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !137) #4, !dbg !135
  %73 = and i32 %62, 1, !dbg !138
  %74 = icmp eq i32 %73, 0, !dbg !138
  br i1 %74, label %77, label %75, !dbg !138

; <label>:75                                      ; preds = %71
  %76 = fsub double -0.000000e+00, %65, !dbg !138
  br label %77, !dbg !138

; <label>:77                                      ; preds = %75, %71
  %78 = phi double [ %76, %75 ], [ %65, %71 ], !dbg !138
  %79 = and i32 %62, 2, !dbg !138
  %80 = icmp eq i32 %79, 0, !dbg !138
  br i1 %80, label %grad.exit7.i, label %81, !dbg !138

; <label>:81                                      ; preds = %77
  %82 = fsub double -0.000000e+00, %72, !dbg !138
  br label %grad.exit7.i, !dbg !138

grad.exit7.i:                                     ; preds = %81, %77
  %83 = phi double [ %82, %81 ], [ %72, %77 ], !dbg !138
  %84 = fadd double %78, %83, !dbg !138
  %85 = sext i32 %54 to i64, !dbg !95
  %86 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %85, !dbg !95
  %87 = load i32* %86, align 4, !dbg !95, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !139) #4, !dbg !140
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !141) #4, !dbg !140
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !142) #4, !dbg !140
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !143) #4, !dbg !140
  %88 = and i32 %87, 15, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !145) #4, !dbg !144
  %89 = icmp ult i32 %88, 8, !dbg !146
  %90 = select i1 %89, double %27, double %32, !dbg !146
  tail call void @llvm.dbg.value(metadata !{double %90}, i64 0, metadata !147) #4, !dbg !146
  %91 = icmp ult i32 %88, 4, !dbg !146
  br i1 %91, label %96, label %92, !dbg !146

; <label>:92                                      ; preds = %grad.exit7.i
  %93 = and i32 %87, 13, !dbg !146
  %94 = icmp eq i32 %93, 12, !dbg !146
  %95 = select i1 %94, double %27, double 0x3FE87AE147AE1400, !dbg !146
  br label %96, !dbg !146

; <label>:96                                      ; preds = %92, %grad.exit7.i
  %97 = phi double [ %95, %92 ], [ %32, %grad.exit7.i ], !dbg !146
  tail call void @llvm.dbg.value(metadata !{double %97}, i64 0, metadata !148) #4, !dbg !146
  %98 = and i32 %87, 1, !dbg !149
  %99 = icmp eq i32 %98, 0, !dbg !149
  br i1 %99, label %102, label %100, !dbg !149

; <label>:100                                     ; preds = %96
  %101 = fsub double -0.000000e+00, %90, !dbg !149
  br label %102, !dbg !149

; <label>:102                                     ; preds = %100, %96
  %103 = phi double [ %101, %100 ], [ %90, %96 ], !dbg !149
  %104 = and i32 %87, 2, !dbg !149
  %105 = icmp eq i32 %104, 0, !dbg !149
  br i1 %105, label %grad.exit6.i, label %106, !dbg !149

; <label>:106                                     ; preds = %102
  %107 = fsub double -0.000000e+00, %97, !dbg !149
  br label %grad.exit6.i, !dbg !149

grad.exit6.i:                                     ; preds = %106, %102
  %108 = phi double [ %107, %106 ], [ %97, %102 ], !dbg !149
  %109 = fadd double %103, %108, !dbg !149
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !150) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !{double %84}, i64 0, metadata !152) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !153) #4, !dbg !151
  %110 = fsub double %109, %84, !dbg !151
  %111 = fmul double %19, %110, !dbg !151
  %112 = fadd double %84, %111, !dbg !151
  %113 = sext i32 %49 to i64, !dbg !154
  %114 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %113, !dbg !154
  %115 = load i32* %114, align 4, !dbg !154, !tbaa !91
  %116 = fadd double %32, -1.000000e+00, !dbg !154
  tail call void @llvm.dbg.value(metadata !{i32 %115}, i64 0, metadata !155) #4, !dbg !156
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !157) #4, !dbg !156
  tail call void @llvm.dbg.value(metadata !{double %116}, i64 0, metadata !158) #4, !dbg !156
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !159) #4, !dbg !156
  %117 = and i32 %115, 15, !dbg !160
  tail call void @llvm.dbg.value(metadata !{i32 %117}, i64 0, metadata !161) #4, !dbg !160
  %118 = icmp ult i32 %117, 8, !dbg !162
  %119 = select i1 %118, double %12, double %116, !dbg !162
  tail call void @llvm.dbg.value(metadata !{double %119}, i64 0, metadata !163) #4, !dbg !162
  %120 = icmp ult i32 %117, 4, !dbg !162
  br i1 %120, label %125, label %121, !dbg !162

; <label>:121                                     ; preds = %grad.exit6.i
  %122 = and i32 %115, 13, !dbg !162
  %123 = icmp eq i32 %122, 12, !dbg !162
  %124 = select i1 %123, double %12, double 0x3FE87AE147AE1400, !dbg !162
  br label %125, !dbg !162

; <label>:125                                     ; preds = %121, %grad.exit6.i
  %126 = phi double [ %124, %121 ], [ %116, %grad.exit6.i ], !dbg !162
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !164) #4, !dbg !162
  %127 = and i32 %115, 1, !dbg !165
  %128 = icmp eq i32 %127, 0, !dbg !165
  br i1 %128, label %131, label %129, !dbg !165

; <label>:129                                     ; preds = %125
  %130 = fsub double -0.000000e+00, %119, !dbg !165
  br label %131, !dbg !165

; <label>:131                                     ; preds = %129, %125
  %132 = phi double [ %130, %129 ], [ %119, %125 ], !dbg !165
  %133 = and i32 %115, 2, !dbg !165
  %134 = icmp eq i32 %133, 0, !dbg !165
  br i1 %134, label %grad.exit5.i, label %135, !dbg !165

; <label>:135                                     ; preds = %131
  %136 = fsub double -0.000000e+00, %126, !dbg !165
  br label %grad.exit5.i, !dbg !165

grad.exit5.i:                                     ; preds = %135, %131
  %137 = phi double [ %136, %135 ], [ %126, %131 ], !dbg !165
  %138 = fadd double %132, %137, !dbg !165
  %139 = sext i32 %59 to i64, !dbg !166
  %140 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %139, !dbg !166
  %141 = load i32* %140, align 4, !dbg !166, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %141}, i64 0, metadata !167) #4, !dbg !168
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !169) #4, !dbg !168
  tail call void @llvm.dbg.value(metadata !{double %116}, i64 0, metadata !170) #4, !dbg !168
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !171) #4, !dbg !168
  %142 = and i32 %141, 15, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i32 %142}, i64 0, metadata !173) #4, !dbg !172
  %143 = icmp ult i32 %142, 8, !dbg !174
  %144 = select i1 %143, double %27, double %116, !dbg !174
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !175) #4, !dbg !174
  %145 = icmp ult i32 %142, 4, !dbg !174
  br i1 %145, label %150, label %146, !dbg !174

; <label>:146                                     ; preds = %grad.exit5.i
  %147 = and i32 %141, 13, !dbg !174
  %148 = icmp eq i32 %147, 12, !dbg !174
  %149 = select i1 %148, double %27, double 0x3FE87AE147AE1400, !dbg !174
  br label %150, !dbg !174

; <label>:150                                     ; preds = %146, %grad.exit5.i
  %151 = phi double [ %149, %146 ], [ %116, %grad.exit5.i ], !dbg !174
  tail call void @llvm.dbg.value(metadata !{double %151}, i64 0, metadata !176) #4, !dbg !174
  %152 = and i32 %141, 1, !dbg !177
  %153 = icmp eq i32 %152, 0, !dbg !177
  br i1 %153, label %156, label %154, !dbg !177

; <label>:154                                     ; preds = %150
  %155 = fsub double -0.000000e+00, %144, !dbg !177
  br label %156, !dbg !177

; <label>:156                                     ; preds = %154, %150
  %157 = phi double [ %155, %154 ], [ %144, %150 ], !dbg !177
  %158 = and i32 %141, 2, !dbg !177
  %159 = icmp eq i32 %158, 0, !dbg !177
  br i1 %159, label %grad.exit4.i, label %160, !dbg !177

; <label>:160                                     ; preds = %156
  %161 = fsub double -0.000000e+00, %151, !dbg !177
  br label %grad.exit4.i, !dbg !177

grad.exit4.i:                                     ; preds = %160, %156
  %162 = phi double [ %161, %160 ], [ %151, %156 ], !dbg !177
  %163 = fadd double %157, %162, !dbg !177
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !178) #4, !dbg !179
  tail call void @llvm.dbg.value(metadata !{double %138}, i64 0, metadata !180) #4, !dbg !179
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !181) #4, !dbg !179
  %164 = fsub double %163, %138, !dbg !179
  %165 = fmul double %19, %164, !dbg !179
  %166 = fadd double %138, %165, !dbg !179
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !150) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !{double %112}, i64 0, metadata !152) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !{double %166}, i64 0, metadata !153) #4, !dbg !151
  %167 = fsub double %166, %112, !dbg !151
  %168 = fmul double %39, %167, !dbg !151
  %169 = fadd double %112, %168, !dbg !151
  %170 = add nsw i32 %43, 100, !dbg !182
  %171 = sext i32 %170 to i64, !dbg !182
  %172 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %171, !dbg !182
  %173 = load i32* %172, align 4, !dbg !182, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %173}, i64 0, metadata !183) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !185) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !186) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !187, i64 0, metadata !188) #4, !dbg !184
  %174 = and i32 %173, 15, !dbg !189
  tail call void @llvm.dbg.value(metadata !{i32 %174}, i64 0, metadata !190) #4, !dbg !189
  %175 = icmp ult i32 %174, 8, !dbg !191
  %176 = select i1 %175, double %12, double %32, !dbg !191
  tail call void @llvm.dbg.value(metadata !{double %176}, i64 0, metadata !192) #4, !dbg !191
  %177 = icmp ult i32 %174, 4, !dbg !191
  br i1 %177, label %182, label %178, !dbg !191

; <label>:178                                     ; preds = %grad.exit4.i
  %179 = and i32 %173, 13, !dbg !191
  %180 = icmp eq i32 %179, 12, !dbg !191
  %181 = select i1 %180, double %12, double 0xBFCE147AE147B000, !dbg !191
  br label %182, !dbg !191

; <label>:182                                     ; preds = %178, %grad.exit4.i
  %183 = phi double [ %181, %178 ], [ %32, %grad.exit4.i ], !dbg !191
  tail call void @llvm.dbg.value(metadata !{double %183}, i64 0, metadata !193) #4, !dbg !191
  %184 = and i32 %173, 1, !dbg !194
  %185 = icmp eq i32 %184, 0, !dbg !194
  br i1 %185, label %188, label %186, !dbg !194

; <label>:186                                     ; preds = %182
  %187 = fsub double -0.000000e+00, %176, !dbg !194
  br label %188, !dbg !194

; <label>:188                                     ; preds = %186, %182
  %189 = phi double [ %187, %186 ], [ %176, %182 ], !dbg !194
  %190 = and i32 %173, 2, !dbg !194
  %191 = icmp eq i32 %190, 0, !dbg !194
  br i1 %191, label %grad.exit3.i, label %192, !dbg !194

; <label>:192                                     ; preds = %188
  %193 = fsub double -0.000000e+00, %183, !dbg !194
  br label %grad.exit3.i, !dbg !194

grad.exit3.i:                                     ; preds = %192, %188
  %194 = phi double [ %193, %192 ], [ %183, %188 ], !dbg !194
  %195 = fadd double %189, %194, !dbg !194
  %196 = add nsw i32 %53, 100, !dbg !195
  %197 = sext i32 %196 to i64, !dbg !195
  %198 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %197, !dbg !195
  %199 = load i32* %198, align 4, !dbg !195, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %199}, i64 0, metadata !196) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !198) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !199) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !187, i64 0, metadata !200) #4, !dbg !197
  %200 = and i32 %199, 15, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i32 %200}, i64 0, metadata !202) #4, !dbg !201
  %201 = icmp ult i32 %200, 8, !dbg !203
  %202 = select i1 %201, double %27, double %32, !dbg !203
  tail call void @llvm.dbg.value(metadata !{double %202}, i64 0, metadata !204) #4, !dbg !203
  %203 = icmp ult i32 %200, 4, !dbg !203
  br i1 %203, label %208, label %204, !dbg !203

; <label>:204                                     ; preds = %grad.exit3.i
  %205 = and i32 %199, 13, !dbg !203
  %206 = icmp eq i32 %205, 12, !dbg !203
  %207 = select i1 %206, double %27, double 0xBFCE147AE147B000, !dbg !203
  br label %208, !dbg !203

; <label>:208                                     ; preds = %204, %grad.exit3.i
  %209 = phi double [ %207, %204 ], [ %32, %grad.exit3.i ], !dbg !203
  tail call void @llvm.dbg.value(metadata !{double %209}, i64 0, metadata !205) #4, !dbg !203
  %210 = and i32 %199, 1, !dbg !206
  %211 = icmp eq i32 %210, 0, !dbg !206
  br i1 %211, label %214, label %212, !dbg !206

; <label>:212                                     ; preds = %208
  %213 = fsub double -0.000000e+00, %202, !dbg !206
  br label %214, !dbg !206

; <label>:214                                     ; preds = %212, %208
  %215 = phi double [ %213, %212 ], [ %202, %208 ], !dbg !206
  %216 = and i32 %199, 2, !dbg !206
  %217 = icmp eq i32 %216, 0, !dbg !206
  br i1 %217, label %grad.exit2.i, label %218, !dbg !206

; <label>:218                                     ; preds = %214
  %219 = fsub double -0.000000e+00, %209, !dbg !206
  br label %grad.exit2.i, !dbg !206

grad.exit2.i:                                     ; preds = %218, %214
  %220 = phi double [ %219, %218 ], [ %209, %214 ], !dbg !206
  %221 = fadd double %215, %220, !dbg !206
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !207) #4, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %195}, i64 0, metadata !209) #4, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %221}, i64 0, metadata !210) #4, !dbg !208
  %222 = fsub double %221, %195, !dbg !208
  %223 = fmul double %19, %222, !dbg !208
  %224 = fadd double %195, %223, !dbg !208
  %225 = add nsw i32 %48, 100, !dbg !211
  %226 = sext i32 %225 to i64, !dbg !211
  %227 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %226, !dbg !211
  %228 = load i32* %227, align 4, !dbg !211, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %228}, i64 0, metadata !212) #4, !dbg !213
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !214) #4, !dbg !213
  tail call void @llvm.dbg.value(metadata !{double %116}, i64 0, metadata !215) #4, !dbg !213
  tail call void @llvm.dbg.value(metadata !187, i64 0, metadata !216) #4, !dbg !213
  %229 = and i32 %228, 15, !dbg !217
  tail call void @llvm.dbg.value(metadata !{i32 %229}, i64 0, metadata !218) #4, !dbg !217
  %230 = icmp ult i32 %229, 8, !dbg !219
  %231 = select i1 %230, double %12, double %116, !dbg !219
  tail call void @llvm.dbg.value(metadata !{double %231}, i64 0, metadata !220) #4, !dbg !219
  %232 = icmp ult i32 %229, 4, !dbg !219
  br i1 %232, label %237, label %233, !dbg !219

; <label>:233                                     ; preds = %grad.exit2.i
  %234 = and i32 %228, 13, !dbg !219
  %235 = icmp eq i32 %234, 12, !dbg !219
  %236 = select i1 %235, double %12, double 0xBFCE147AE147B000, !dbg !219
  br label %237, !dbg !219

; <label>:237                                     ; preds = %233, %grad.exit2.i
  %238 = phi double [ %236, %233 ], [ %116, %grad.exit2.i ], !dbg !219
  tail call void @llvm.dbg.value(metadata !{double %238}, i64 0, metadata !221) #4, !dbg !219
  %239 = and i32 %228, 1, !dbg !222
  %240 = icmp eq i32 %239, 0, !dbg !222
  br i1 %240, label %243, label %241, !dbg !222

; <label>:241                                     ; preds = %237
  %242 = fsub double -0.000000e+00, %231, !dbg !222
  br label %243, !dbg !222

; <label>:243                                     ; preds = %241, %237
  %244 = phi double [ %242, %241 ], [ %231, %237 ], !dbg !222
  %245 = and i32 %228, 2, !dbg !222
  %246 = icmp eq i32 %245, 0, !dbg !222
  br i1 %246, label %grad.exit1.i, label %247, !dbg !222

; <label>:247                                     ; preds = %243
  %248 = fsub double -0.000000e+00, %238, !dbg !222
  br label %grad.exit1.i, !dbg !222

grad.exit1.i:                                     ; preds = %247, %243
  %249 = phi double [ %248, %247 ], [ %238, %243 ], !dbg !222
  %250 = fadd double %244, %249, !dbg !222
  %251 = add nsw i32 %58, 100, !dbg !223
  %252 = sext i32 %251 to i64, !dbg !223
  %253 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %252, !dbg !223
  %254 = load i32* %253, align 4, !dbg !223, !tbaa !91
  tail call void @llvm.dbg.value(metadata !{i32 %254}, i64 0, metadata !224) #4, !dbg !225
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !226) #4, !dbg !225
  tail call void @llvm.dbg.value(metadata !{double %116}, i64 0, metadata !227) #4, !dbg !225
  tail call void @llvm.dbg.value(metadata !187, i64 0, metadata !228) #4, !dbg !225
  %255 = and i32 %254, 15, !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %255}, i64 0, metadata !230) #4, !dbg !229
  %256 = icmp ult i32 %255, 8, !dbg !231
  %257 = select i1 %256, double %27, double %116, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %257}, i64 0, metadata !232) #4, !dbg !231
  %258 = icmp ult i32 %255, 4, !dbg !231
  br i1 %258, label %263, label %259, !dbg !231

; <label>:259                                     ; preds = %grad.exit1.i
  %260 = and i32 %254, 13, !dbg !231
  %261 = icmp eq i32 %260, 12, !dbg !231
  %262 = select i1 %261, double %27, double 0xBFCE147AE147B000, !dbg !231
  br label %263, !dbg !231

; <label>:263                                     ; preds = %259, %grad.exit1.i
  %264 = phi double [ %262, %259 ], [ %116, %grad.exit1.i ], !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %264}, i64 0, metadata !233) #4, !dbg !231
  %265 = and i32 %254, 1, !dbg !234
  %266 = icmp eq i32 %265, 0, !dbg !234
  br i1 %266, label %269, label %267, !dbg !234

; <label>:267                                     ; preds = %263
  %268 = fsub double -0.000000e+00, %257, !dbg !234
  br label %269, !dbg !234

; <label>:269                                     ; preds = %267, %263
  %270 = phi double [ %268, %267 ], [ %257, %263 ], !dbg !234
  %271 = and i32 %254, 2, !dbg !234
  %272 = icmp eq i32 %271, 0, !dbg !234
  br i1 %272, label %noise.exit, label %273, !dbg !234

; <label>:273                                     ; preds = %269
  %274 = fsub double -0.000000e+00, %264, !dbg !234
  br label %noise.exit, !dbg !234

noise.exit:                                       ; preds = %269, %273
  %275 = phi double [ %274, %273 ], [ %264, %269 ], !dbg !234
  %276 = fadd double %270, %275, !dbg !234
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !235) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %250}, i64 0, metadata !237) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %276}, i64 0, metadata !238) #4, !dbg !236
  %277 = fsub double %276, %250, !dbg !236
  %278 = fmul double %19, %277, !dbg !236
  %279 = fadd double %250, %278, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !207) #4, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !209) #4, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %279}, i64 0, metadata !210) #4, !dbg !208
  %280 = fsub double %279, %224, !dbg !208
  %281 = fmul double %39, %280, !dbg !208
  %282 = fadd double %224, %281, !dbg !208
  tail call void @llvm.dbg.value(metadata !119, i64 0, metadata !150) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !{double %169}, i64 0, metadata !152) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !{double %282}, i64 0, metadata !153) #4, !dbg !151
  %283 = fsub double %282, %169, !dbg !151
  %284 = fmul double %283, 0x3FED2C62745753FF, !dbg !151
  %285 = fadd double %169, %284, !dbg !151
  %286 = fadd double %sum.23, %285, !dbg !86
  tail call void @llvm.dbg.value(metadata !{double %286}, i64 0, metadata !14), !dbg !86
  %287 = fadd double %y.12, 2.450000e+00, !dbg !83
  tail call void @llvm.dbg.value(metadata !{double %287}, i64 0, metadata !12), !dbg !83
  %288 = fcmp olt double %287, 2.323450e+01, !dbg !83
  br i1 %288, label %28, label %._crit_edge, !dbg !83

._crit_edge:                                      ; preds = %noise.exit, %.preheader
  %sum.2.lcssa = phi double [ %sum.16, %.preheader ], [ %286, %noise.exit ]
  %y.1.lcssa = phi double [ %y.05, %.preheader ], [ %287, %noise.exit ]
  %289 = fadd double %y.1.lcssa, 1.432500e+00, !dbg !80
  tail call void @llvm.dbg.value(metadata !{double %289}, i64 0, metadata !12), !dbg !80
  %290 = fcmp olt double %289, 1.241240e+02, !dbg !80
  br i1 %290, label %.preheader, label %init.exit, !dbg !80

init.exit:                                        ; preds = %._crit_edge
  %291 = fadd double %x.07, 1.235000e-01, !dbg !239
  tail call void @llvm.dbg.value(metadata !{double %291}, i64 0, metadata !10), !dbg !239
  %292 = fcmp olt double %291, 2.356157e+04, !dbg !239
  br i1 %292, label %.preheader1, label %293, !dbg !239

; <label>:293                                     ; preds = %init.exit
  %294 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %sum.2.lcssa) #4, !dbg !240
  ret i32 0, !dbg !241
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

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
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"grad", metadata !"grad", metadata !"", i32 28, metadata !35, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !37, i32 28} ; [ DW_TAG_subprogram ] [line 28] [local] [def] [grad]
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
!77 = metadata !{metadata !77, metadata !78, metadata !79}
!78 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!79 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!80 = metadata !{i32 74, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !82, i32 74, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!82 = metadata !{i32 786443, metadata !1, metadata !4, i32 73, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!83 = metadata !{i32 75, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !81, i32 75, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perlin.c]
!85 = metadata !{i32 36, i32 0, metadata !15, metadata !86}
!86 = metadata !{i32 77, i32 0, metadata !84, null}
!87 = metadata !{i32 39, i32 0, metadata !15, metadata !86}
!88 = metadata !{i32 24, i32 0, metadata !50, metadata !89}
!89 = metadata !{i32 42, i32 0, metadata !15, metadata !86}
!90 = metadata !{i32 45, i32 0, metadata !15, metadata !86}
!91 = metadata !{metadata !92, metadata !92, i64 0}
!92 = metadata !{metadata !"int", metadata !93, i64 0}
!93 = metadata !{metadata !"omnipotent char", metadata !94, i64 0}
!94 = metadata !{metadata !"Simple C/C++ TBAA"}
!95 = metadata !{i32 49, i32 0, metadata !15, metadata !86}
!96 = metadata !{double -1.562350e+02}
!97 = metadata !{i32 786689, metadata !15, metadata !"z", metadata !5, i32 50331683, metadata !11, i32 0, metadata !86} ; [ DW_TAG_arg_variable ] [z] [line 35]
!98 = metadata !{i32 35, i32 0, metadata !15, metadata !86}
!99 = metadata !{i32 786688, metadata !15, metadata !"X", metadata !5, i32 36, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [X] [line 36]
!100 = metadata !{i32 37, i32 0, metadata !15, metadata !86}
!101 = metadata !{i32 786688, metadata !15, metadata !"Y", metadata !5, i32 37, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [Y] [line 37]
!102 = metadata !{i32 99}
!103 = metadata !{i32 786688, metadata !15, metadata !"Z", metadata !5, i32 38, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [Z] [line 38]
!104 = metadata !{i32 38, i32 0, metadata !15, metadata !86}
!105 = metadata !{i32 786689, metadata !15, metadata !"x", metadata !5, i32 16777251, metadata !11, i32 0, metadata !86} ; [ DW_TAG_arg_variable ] [x] [line 35]
!106 = metadata !{i32 40, i32 0, metadata !15, metadata !86}
!107 = metadata !{i32 786689, metadata !15, metadata !"y", metadata !5, i32 33554467, metadata !11, i32 0, metadata !86} ; [ DW_TAG_arg_variable ] [y] [line 35]
!108 = metadata !{double 0x3FE87AE147AE1400}
!109 = metadata !{i32 41, i32 0, metadata !15, metadata !86}
!110 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [t] [line 24]
!111 = metadata !{i32 786688, metadata !15, metadata !"u", metadata !5, i32 42, metadata !11, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [u] [line 42]
!112 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [t] [line 24]
!113 = metadata !{i32 43, i32 0, metadata !15, metadata !86}
!114 = metadata !{i32 24, i32 0, metadata !50, metadata !113}
!115 = metadata !{i32 786688, metadata !15, metadata !"v", metadata !5, i32 43, metadata !11, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [v] [line 43]
!116 = metadata !{i32 786689, metadata !50, metadata !"t", metadata !5, i32 16777240, metadata !11, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [t] [line 24]
!117 = metadata !{i32 44, i32 0, metadata !15, metadata !86}
!118 = metadata !{i32 24, i32 0, metadata !50, metadata !117}
!119 = metadata !{double 0x3FED2C62745753FF}
!120 = metadata !{i32 786688, metadata !15, metadata !"w", metadata !5, i32 44, metadata !11, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [w] [line 44]
!121 = metadata !{i32 786688, metadata !15, metadata !"A", metadata !5, i32 45, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [A] [line 45]
!122 = metadata !{i32 786688, metadata !15, metadata !"AA", metadata !5, i32 45, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [AA] [line 45]
!123 = metadata !{i32 786688, metadata !15, metadata !"AB", metadata !5, i32 45, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [AB] [line 45]
!124 = metadata !{i32 786688, metadata !15, metadata !"B", metadata !5, i32 46, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [B] [line 46]
!125 = metadata !{i32 786688, metadata !15, metadata !"BA", metadata !5, i32 46, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [BA] [line 46]
!126 = metadata !{i32 786688, metadata !15, metadata !"BB", metadata !5, i32 46, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [BB] [line 46]
!127 = metadata !{i32 48, i32 0, metadata !15, metadata !86}
!128 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!129 = metadata !{i32 28, i32 0, metadata !34, metadata !127}
!130 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [x] [line 28]
!131 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [y] [line 28]
!132 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [z] [line 28]
!133 = metadata !{i32 29, i32 0, metadata !34, metadata !127}
!134 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [h] [line 29]
!135 = metadata !{i32 30, i32 0, metadata !34, metadata !127}
!136 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [u] [line 30]
!137 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [v] [line 31]
!138 = metadata !{i32 32, i32 0, metadata !34, metadata !127}
!139 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !95} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!140 = metadata !{i32 28, i32 0, metadata !34, metadata !95}
!141 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !95} ; [ DW_TAG_arg_variable ] [x] [line 28]
!142 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !95} ; [ DW_TAG_arg_variable ] [y] [line 28]
!143 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !95} ; [ DW_TAG_arg_variable ] [z] [line 28]
!144 = metadata !{i32 29, i32 0, metadata !34, metadata !95}
!145 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [h] [line 29]
!146 = metadata !{i32 30, i32 0, metadata !34, metadata !95}
!147 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [u] [line 30]
!148 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [v] [line 31]
!149 = metadata !{i32 32, i32 0, metadata !34, metadata !95}
!150 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [t] [line 26]
!151 = metadata !{i32 26, i32 0, metadata !45, metadata !127}
!152 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [a] [line 26]
!153 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [b] [line 26]
!154 = metadata !{i32 50, i32 0, metadata !15, metadata !86}
!155 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!156 = metadata !{i32 28, i32 0, metadata !34, metadata !154}
!157 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [x] [line 28]
!158 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [y] [line 28]
!159 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [z] [line 28]
!160 = metadata !{i32 29, i32 0, metadata !34, metadata !154}
!161 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !154} ; [ DW_TAG_auto_variable ] [h] [line 29]
!162 = metadata !{i32 30, i32 0, metadata !34, metadata !154}
!163 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !154} ; [ DW_TAG_auto_variable ] [u] [line 30]
!164 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !154} ; [ DW_TAG_auto_variable ] [v] [line 31]
!165 = metadata !{i32 32, i32 0, metadata !34, metadata !154}
!166 = metadata !{i32 51, i32 0, metadata !15, metadata !86}
!167 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!168 = metadata !{i32 28, i32 0, metadata !34, metadata !166}
!169 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [x] [line 28]
!170 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [y] [line 28]
!171 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [z] [line 28]
!172 = metadata !{i32 29, i32 0, metadata !34, metadata !166}
!173 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !166} ; [ DW_TAG_auto_variable ] [h] [line 29]
!174 = metadata !{i32 30, i32 0, metadata !34, metadata !166}
!175 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !166} ; [ DW_TAG_auto_variable ] [u] [line 30]
!176 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !166} ; [ DW_TAG_auto_variable ] [v] [line 31]
!177 = metadata !{i32 32, i32 0, metadata !34, metadata !166}
!178 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [t] [line 26]
!179 = metadata !{i32 26, i32 0, metadata !45, metadata !154}
!180 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [a] [line 26]
!181 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [b] [line 26]
!182 = metadata !{i32 52, i32 0, metadata !15, metadata !86}
!183 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!184 = metadata !{i32 28, i32 0, metadata !34, metadata !182}
!185 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [x] [line 28]
!186 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [y] [line 28]
!187 = metadata !{double 0xBFCE147AE147B000}
!188 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [z] [line 28]
!189 = metadata !{i32 29, i32 0, metadata !34, metadata !182}
!190 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !182} ; [ DW_TAG_auto_variable ] [h] [line 29]
!191 = metadata !{i32 30, i32 0, metadata !34, metadata !182}
!192 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !182} ; [ DW_TAG_auto_variable ] [u] [line 30]
!193 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !182} ; [ DW_TAG_auto_variable ] [v] [line 31]
!194 = metadata !{i32 32, i32 0, metadata !34, metadata !182}
!195 = metadata !{i32 53, i32 0, metadata !15, metadata !86}
!196 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!197 = metadata !{i32 28, i32 0, metadata !34, metadata !195}
!198 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [x] [line 28]
!199 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [y] [line 28]
!200 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [z] [line 28]
!201 = metadata !{i32 29, i32 0, metadata !34, metadata !195}
!202 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !195} ; [ DW_TAG_auto_variable ] [h] [line 29]
!203 = metadata !{i32 30, i32 0, metadata !34, metadata !195}
!204 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !195} ; [ DW_TAG_auto_variable ] [u] [line 30]
!205 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !195} ; [ DW_TAG_auto_variable ] [v] [line 31]
!206 = metadata !{i32 32, i32 0, metadata !34, metadata !195}
!207 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [t] [line 26]
!208 = metadata !{i32 26, i32 0, metadata !45, metadata !182}
!209 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [a] [line 26]
!210 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [b] [line 26]
!211 = metadata !{i32 54, i32 0, metadata !15, metadata !86}
!212 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!213 = metadata !{i32 28, i32 0, metadata !34, metadata !211}
!214 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [x] [line 28]
!215 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [y] [line 28]
!216 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [z] [line 28]
!217 = metadata !{i32 29, i32 0, metadata !34, metadata !211}
!218 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !211} ; [ DW_TAG_auto_variable ] [h] [line 29]
!219 = metadata !{i32 30, i32 0, metadata !34, metadata !211}
!220 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !211} ; [ DW_TAG_auto_variable ] [u] [line 30]
!221 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !211} ; [ DW_TAG_auto_variable ] [v] [line 31]
!222 = metadata !{i32 32, i32 0, metadata !34, metadata !211}
!223 = metadata !{i32 55, i32 0, metadata !15, metadata !86}
!224 = metadata !{i32 786689, metadata !34, metadata !"hash", metadata !5, i32 16777244, metadata !8, i32 0, metadata !223} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!225 = metadata !{i32 28, i32 0, metadata !34, metadata !223}
!226 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 33554460, metadata !11, i32 0, metadata !223} ; [ DW_TAG_arg_variable ] [x] [line 28]
!227 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 50331676, metadata !11, i32 0, metadata !223} ; [ DW_TAG_arg_variable ] [y] [line 28]
!228 = metadata !{i32 786689, metadata !34, metadata !"z", metadata !5, i32 67108892, metadata !11, i32 0, metadata !223} ; [ DW_TAG_arg_variable ] [z] [line 28]
!229 = metadata !{i32 29, i32 0, metadata !34, metadata !223}
!230 = metadata !{i32 786688, metadata !34, metadata !"h", metadata !5, i32 29, metadata !8, i32 0, metadata !223} ; [ DW_TAG_auto_variable ] [h] [line 29]
!231 = metadata !{i32 30, i32 0, metadata !34, metadata !223}
!232 = metadata !{i32 786688, metadata !34, metadata !"u", metadata !5, i32 30, metadata !11, i32 0, metadata !223} ; [ DW_TAG_auto_variable ] [u] [line 30]
!233 = metadata !{i32 786688, metadata !34, metadata !"v", metadata !5, i32 31, metadata !11, i32 0, metadata !223} ; [ DW_TAG_auto_variable ] [v] [line 31]
!234 = metadata !{i32 32, i32 0, metadata !34, metadata !223}
!235 = metadata !{i32 786689, metadata !45, metadata !"t", metadata !5, i32 16777242, metadata !11, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [t] [line 26]
!236 = metadata !{i32 26, i32 0, metadata !45, metadata !211}
!237 = metadata !{i32 786689, metadata !45, metadata !"a", metadata !5, i32 33554458, metadata !11, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [a] [line 26]
!238 = metadata !{i32 786689, metadata !45, metadata !"b", metadata !5, i32 50331674, metadata !11, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [b] [line 26]
!239 = metadata !{i32 73, i32 0, metadata !82, null}
!240 = metadata !{i32 79, i32 0, metadata !4, null}
!241 = metadata !{i32 80, i32 0, metadata !4, null}
