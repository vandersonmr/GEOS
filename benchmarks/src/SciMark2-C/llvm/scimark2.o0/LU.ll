; ModuleID = 'LU.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @LU_num_flops(i32 %N) #0 {
  %1 = alloca i32, align 4
  %Nd = alloca double, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata !{double* %Nd}, metadata !24), !dbg !25
  %2 = load i32* %1, align 4, !dbg !25
  %3 = sitofp i32 %2 to double, !dbg !25
  store double %3, double* %Nd, align 8, !dbg !25
  %4 = load double* %Nd, align 8, !dbg !26
  %5 = fmul double 2.000000e+00, %4, !dbg !26
  %6 = load double* %Nd, align 8, !dbg !26
  %7 = fmul double %5, %6, !dbg !26
  %8 = load double* %Nd, align 8, !dbg !26
  %9 = fmul double %7, %8, !dbg !26
  %10 = fdiv double %9, 3.000000e+00, !dbg !26
  ret double %10, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @LU_copy_matrix(i32 %M, i32 %N, double** %lu, double** %A) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double**, align 8
  %4 = alloca double**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %M, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !27), !dbg !28
  store i32 %N, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !29), !dbg !28
  store double** %lu, double*** %3, align 8
  call void @llvm.dbg.declare(metadata !{double*** %3}, metadata !30), !dbg !28
  store double** %A, double*** %4, align 8
  call void @llvm.dbg.declare(metadata !{double*** %4}, metadata !31), !dbg !28
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !34), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %5, !dbg !36

; <label>:5                                       ; preds = %36, %0
  %6 = load i32* %i, align 4, !dbg !36
  %7 = load i32* %1, align 4, !dbg !36
  %8 = icmp slt i32 %6, %7, !dbg !36
  br i1 %8, label %9, label %39, !dbg !36

; <label>:9                                       ; preds = %5
  store i32 0, i32* %j, align 4, !dbg !38
  br label %10, !dbg !38

; <label>:10                                      ; preds = %32, %9
  %11 = load i32* %j, align 4, !dbg !38
  %12 = load i32* %2, align 4, !dbg !38
  %13 = icmp slt i32 %11, %12, !dbg !38
  br i1 %13, label %14, label %35, !dbg !38

; <label>:14                                      ; preds = %10
  %15 = load i32* %j, align 4, !dbg !40
  %16 = sext i32 %15 to i64, !dbg !40
  %17 = load i32* %i, align 4, !dbg !40
  %18 = sext i32 %17 to i64, !dbg !40
  %19 = load double*** %4, align 8, !dbg !40
  %20 = getelementptr inbounds double** %19, i64 %18, !dbg !40
  %21 = load double** %20, align 8, !dbg !40
  %22 = getelementptr inbounds double* %21, i64 %16, !dbg !40
  %23 = load double* %22, align 8, !dbg !40
  %24 = load i32* %j, align 4, !dbg !40
  %25 = sext i32 %24 to i64, !dbg !40
  %26 = load i32* %i, align 4, !dbg !40
  %27 = sext i32 %26 to i64, !dbg !40
  %28 = load double*** %3, align 8, !dbg !40
  %29 = getelementptr inbounds double** %28, i64 %27, !dbg !40
  %30 = load double** %29, align 8, !dbg !40
  %31 = getelementptr inbounds double* %30, i64 %25, !dbg !40
  store double %23, double* %31, align 8, !dbg !40
  br label %32, !dbg !40

; <label>:32                                      ; preds = %14
  %33 = load i32* %j, align 4, !dbg !38
  %34 = add nsw i32 %33, 1, !dbg !38
  store i32 %34, i32* %j, align 4, !dbg !38
  br label %10, !dbg !38

; <label>:35                                      ; preds = %10
  br label %36, !dbg !40

; <label>:36                                      ; preds = %35
  %37 = load i32* %i, align 4, !dbg !36
  %38 = add nsw i32 %37, 1, !dbg !36
  store i32 %38, i32* %i, align 4, !dbg !36
  br label %5, !dbg !36

; <label>:39                                      ; preds = %5
  ret void, !dbg !41
}

; Function Attrs: nounwind uwtable
define i32 @LU_factor(i32 %M, i32 %N, double** %A, i32* %pivot) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double**, align 8
  %5 = alloca i32*, align 8
  %minMN = alloca i32, align 4
  %j = alloca i32, align 4
  %jp = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca double, align 8
  %ab = alloca double, align 8
  %tA = alloca double*, align 8
  %recp = alloca double, align 8
  %k = alloca i32, align 4
  %ii = alloca i32, align 4
  %Aii = alloca double*, align 8
  %Aj = alloca double*, align 8
  %AiiJ = alloca double, align 8
  %jj = alloca i32, align 4
  store i32 %M, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !42), !dbg !43
  store i32 %N, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !44), !dbg !43
  store double** %A, double*** %4, align 8
  call void @llvm.dbg.declare(metadata !{double*** %4}, metadata !45), !dbg !43
  store i32* %pivot, i32** %5, align 8
  call void @llvm.dbg.declare(metadata !{i32** %5}, metadata !46), !dbg !43
  call void @llvm.dbg.declare(metadata !{i32* %minMN}, metadata !47), !dbg !48
  %6 = load i32* %2, align 4, !dbg !48
  %7 = load i32* %3, align 4, !dbg !48
  %8 = icmp slt i32 %6, %7, !dbg !48
  br i1 %8, label %9, label %11, !dbg !48

; <label>:9                                       ; preds = %0
  %10 = load i32* %2, align 4, !dbg !48
  br label %13, !dbg !48

; <label>:11                                      ; preds = %0
  %12 = load i32* %3, align 4, !dbg !48
  br label %13, !dbg !48

; <label>:13                                      ; preds = %11, %9
  %14 = phi i32 [ %10, %9 ], [ %12, %11 ], !dbg !48
  store i32 %14, i32* %minMN, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !49), !dbg !50
  store i32 0, i32* %j, align 4, !dbg !50
  store i32 0, i32* %j, align 4, !dbg !51
  br label %15, !dbg !51

; <label>:15                                      ; preds = %194, %13
  %16 = load i32* %j, align 4, !dbg !51
  %17 = load i32* %minMN, align 4, !dbg !51
  %18 = icmp slt i32 %16, %17, !dbg !51
  br i1 %18, label %19, label %197, !dbg !51

; <label>:19                                      ; preds = %15
  call void @llvm.dbg.declare(metadata !{i32* %jp}, metadata !53), !dbg !55
  %20 = load i32* %j, align 4, !dbg !55
  store i32 %20, i32* %jp, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !56), !dbg !57
  call void @llvm.dbg.declare(metadata !{double* %t}, metadata !58), !dbg !59
  %21 = load i32* %j, align 4, !dbg !59
  %22 = sext i32 %21 to i64, !dbg !59
  %23 = load i32* %j, align 4, !dbg !59
  %24 = sext i32 %23 to i64, !dbg !59
  %25 = load double*** %4, align 8, !dbg !59
  %26 = getelementptr inbounds double** %25, i64 %24, !dbg !59
  %27 = load double** %26, align 8, !dbg !59
  %28 = getelementptr inbounds double* %27, i64 %22, !dbg !59
  %29 = load double* %28, align 8, !dbg !59
  %30 = call double @fabs(double %29) #1, !dbg !59
  store double %30, double* %t, align 8, !dbg !59
  %31 = load i32* %j, align 4, !dbg !60
  %32 = add nsw i32 %31, 1, !dbg !60
  store i32 %32, i32* %i, align 4, !dbg !60
  br label %33, !dbg !60

; <label>:33                                      ; preds = %55, %19
  %34 = load i32* %i, align 4, !dbg !60
  %35 = load i32* %2, align 4, !dbg !60
  %36 = icmp slt i32 %34, %35, !dbg !60
  br i1 %36, label %37, label %58, !dbg !60

; <label>:37                                      ; preds = %33
  call void @llvm.dbg.declare(metadata !{double* %ab}, metadata !62), !dbg !64
  %38 = load i32* %j, align 4, !dbg !64
  %39 = sext i32 %38 to i64, !dbg !64
  %40 = load i32* %i, align 4, !dbg !64
  %41 = sext i32 %40 to i64, !dbg !64
  %42 = load double*** %4, align 8, !dbg !64
  %43 = getelementptr inbounds double** %42, i64 %41, !dbg !64
  %44 = load double** %43, align 8, !dbg !64
  %45 = getelementptr inbounds double* %44, i64 %39, !dbg !64
  %46 = load double* %45, align 8, !dbg !64
  %47 = call double @fabs(double %46) #1, !dbg !64
  store double %47, double* %ab, align 8, !dbg !64
  %48 = load double* %ab, align 8, !dbg !65
  %49 = load double* %t, align 8, !dbg !65
  %50 = fcmp ogt double %48, %49, !dbg !65
  br i1 %50, label %51, label %54, !dbg !65

; <label>:51                                      ; preds = %37
  %52 = load i32* %i, align 4, !dbg !67
  store i32 %52, i32* %jp, align 4, !dbg !67
  %53 = load double* %ab, align 8, !dbg !69
  store double %53, double* %t, align 8, !dbg !69
  br label %54, !dbg !70

; <label>:54                                      ; preds = %51, %37
  br label %55, !dbg !71

; <label>:55                                      ; preds = %54
  %56 = load i32* %i, align 4, !dbg !60
  %57 = add nsw i32 %56, 1, !dbg !60
  store i32 %57, i32* %i, align 4, !dbg !60
  br label %33, !dbg !60

; <label>:58                                      ; preds = %33
  %59 = load i32* %jp, align 4, !dbg !72
  %60 = load i32* %j, align 4, !dbg !72
  %61 = sext i32 %60 to i64, !dbg !72
  %62 = load i32** %5, align 8, !dbg !72
  %63 = getelementptr inbounds i32* %62, i64 %61, !dbg !72
  store i32 %59, i32* %63, align 4, !dbg !72
  %64 = load i32* %j, align 4, !dbg !73
  %65 = sext i32 %64 to i64, !dbg !73
  %66 = load i32* %jp, align 4, !dbg !73
  %67 = sext i32 %66 to i64, !dbg !73
  %68 = load double*** %4, align 8, !dbg !73
  %69 = getelementptr inbounds double** %68, i64 %67, !dbg !73
  %70 = load double** %69, align 8, !dbg !73
  %71 = getelementptr inbounds double* %70, i64 %65, !dbg !73
  %72 = load double* %71, align 8, !dbg !73
  %73 = fcmp oeq double %72, 0.000000e+00, !dbg !73
  br i1 %73, label %74, label %75, !dbg !73

; <label>:74                                      ; preds = %58
  store i32 1, i32* %1, !dbg !75
  br label %198, !dbg !75

; <label>:75                                      ; preds = %58
  %76 = load i32* %jp, align 4, !dbg !76
  %77 = load i32* %j, align 4, !dbg !76
  %78 = icmp ne i32 %76, %77, !dbg !76
  br i1 %78, label %79, label %99, !dbg !76

; <label>:79                                      ; preds = %75
  call void @llvm.dbg.declare(metadata !{double** %tA}, metadata !78), !dbg !80
  %80 = load i32* %j, align 4, !dbg !80
  %81 = sext i32 %80 to i64, !dbg !80
  %82 = load double*** %4, align 8, !dbg !80
  %83 = getelementptr inbounds double** %82, i64 %81, !dbg !80
  %84 = load double** %83, align 8, !dbg !80
  store double* %84, double** %tA, align 8, !dbg !80
  %85 = load i32* %jp, align 4, !dbg !81
  %86 = sext i32 %85 to i64, !dbg !81
  %87 = load double*** %4, align 8, !dbg !81
  %88 = getelementptr inbounds double** %87, i64 %86, !dbg !81
  %89 = load double** %88, align 8, !dbg !81
  %90 = load i32* %j, align 4, !dbg !81
  %91 = sext i32 %90 to i64, !dbg !81
  %92 = load double*** %4, align 8, !dbg !81
  %93 = getelementptr inbounds double** %92, i64 %91, !dbg !81
  store double* %89, double** %93, align 8, !dbg !81
  %94 = load double** %tA, align 8, !dbg !82
  %95 = load i32* %jp, align 4, !dbg !82
  %96 = sext i32 %95 to i64, !dbg !82
  %97 = load double*** %4, align 8, !dbg !82
  %98 = getelementptr inbounds double** %97, i64 %96, !dbg !82
  store double* %94, double** %98, align 8, !dbg !82
  br label %99, !dbg !83

; <label>:99                                      ; preds = %79, %75
  %100 = load i32* %j, align 4, !dbg !84
  %101 = load i32* %2, align 4, !dbg !84
  %102 = sub nsw i32 %101, 1, !dbg !84
  %103 = icmp slt i32 %100, %102, !dbg !84
  br i1 %103, label %104, label %137, !dbg !84

; <label>:104                                     ; preds = %99
  call void @llvm.dbg.declare(metadata !{double* %recp}, metadata !86), !dbg !88
  %105 = load i32* %j, align 4, !dbg !88
  %106 = sext i32 %105 to i64, !dbg !88
  %107 = load i32* %j, align 4, !dbg !88
  %108 = sext i32 %107 to i64, !dbg !88
  %109 = load double*** %4, align 8, !dbg !88
  %110 = getelementptr inbounds double** %109, i64 %108, !dbg !88
  %111 = load double** %110, align 8, !dbg !88
  %112 = getelementptr inbounds double* %111, i64 %106, !dbg !88
  %113 = load double* %112, align 8, !dbg !88
  %114 = fdiv double 1.000000e+00, %113, !dbg !88
  store double %114, double* %recp, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !89), !dbg !90
  %115 = load i32* %j, align 4, !dbg !91
  %116 = add nsw i32 %115, 1, !dbg !91
  store i32 %116, i32* %k, align 4, !dbg !91
  br label %117, !dbg !91

; <label>:117                                     ; preds = %133, %104
  %118 = load i32* %k, align 4, !dbg !91
  %119 = load i32* %2, align 4, !dbg !91
  %120 = icmp slt i32 %118, %119, !dbg !91
  br i1 %120, label %121, label %136, !dbg !91

; <label>:121                                     ; preds = %117
  %122 = load double* %recp, align 8, !dbg !93
  %123 = load i32* %j, align 4, !dbg !93
  %124 = sext i32 %123 to i64, !dbg !93
  %125 = load i32* %k, align 4, !dbg !93
  %126 = sext i32 %125 to i64, !dbg !93
  %127 = load double*** %4, align 8, !dbg !93
  %128 = getelementptr inbounds double** %127, i64 %126, !dbg !93
  %129 = load double** %128, align 8, !dbg !93
  %130 = getelementptr inbounds double* %129, i64 %124, !dbg !93
  %131 = load double* %130, align 8, !dbg !93
  %132 = fmul double %131, %122, !dbg !93
  store double %132, double* %130, align 8, !dbg !93
  br label %133, !dbg !93

; <label>:133                                     ; preds = %121
  %134 = load i32* %k, align 4, !dbg !91
  %135 = add nsw i32 %134, 1, !dbg !91
  store i32 %135, i32* %k, align 4, !dbg !91
  br label %117, !dbg !91

; <label>:136                                     ; preds = %117
  br label %137, !dbg !94

; <label>:137                                     ; preds = %136, %99
  %138 = load i32* %j, align 4, !dbg !95
  %139 = load i32* %minMN, align 4, !dbg !95
  %140 = sub nsw i32 %139, 1, !dbg !95
  %141 = icmp slt i32 %138, %140, !dbg !95
  br i1 %141, label %142, label %193, !dbg !95

; <label>:142                                     ; preds = %137
  call void @llvm.dbg.declare(metadata !{i32* %ii}, metadata !97), !dbg !99
  %143 = load i32* %j, align 4, !dbg !100
  %144 = add nsw i32 %143, 1, !dbg !100
  store i32 %144, i32* %ii, align 4, !dbg !100
  br label %145, !dbg !100

; <label>:145                                     ; preds = %189, %142
  %146 = load i32* %ii, align 4, !dbg !100
  %147 = load i32* %2, align 4, !dbg !100
  %148 = icmp slt i32 %146, %147, !dbg !100
  br i1 %148, label %149, label %192, !dbg !100

; <label>:149                                     ; preds = %145
  call void @llvm.dbg.declare(metadata !{double** %Aii}, metadata !102), !dbg !104
  %150 = load i32* %ii, align 4, !dbg !104
  %151 = sext i32 %150 to i64, !dbg !104
  %152 = load double*** %4, align 8, !dbg !104
  %153 = getelementptr inbounds double** %152, i64 %151, !dbg !104
  %154 = load double** %153, align 8, !dbg !104
  store double* %154, double** %Aii, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata !{double** %Aj}, metadata !105), !dbg !106
  %155 = load i32* %j, align 4, !dbg !106
  %156 = sext i32 %155 to i64, !dbg !106
  %157 = load double*** %4, align 8, !dbg !106
  %158 = getelementptr inbounds double** %157, i64 %156, !dbg !106
  %159 = load double** %158, align 8, !dbg !106
  store double* %159, double** %Aj, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata !{double* %AiiJ}, metadata !107), !dbg !108
  %160 = load i32* %j, align 4, !dbg !108
  %161 = sext i32 %160 to i64, !dbg !108
  %162 = load double** %Aii, align 8, !dbg !108
  %163 = getelementptr inbounds double* %162, i64 %161, !dbg !108
  %164 = load double* %163, align 8, !dbg !108
  store double %164, double* %AiiJ, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata !{i32* %jj}, metadata !109), !dbg !110
  %165 = load i32* %j, align 4, !dbg !111
  %166 = add nsw i32 %165, 1, !dbg !111
  store i32 %166, i32* %jj, align 4, !dbg !111
  br label %167, !dbg !111

; <label>:167                                     ; preds = %185, %149
  %168 = load i32* %jj, align 4, !dbg !111
  %169 = load i32* %3, align 4, !dbg !111
  %170 = icmp slt i32 %168, %169, !dbg !111
  br i1 %170, label %171, label %188, !dbg !111

; <label>:171                                     ; preds = %167
  %172 = load double* %AiiJ, align 8, !dbg !113
  %173 = load i32* %jj, align 4, !dbg !113
  %174 = sext i32 %173 to i64, !dbg !113
  %175 = load double** %Aj, align 8, !dbg !113
  %176 = getelementptr inbounds double* %175, i64 %174, !dbg !113
  %177 = load double* %176, align 8, !dbg !113
  %178 = fmul double %172, %177, !dbg !113
  %179 = load i32* %jj, align 4, !dbg !113
  %180 = sext i32 %179 to i64, !dbg !113
  %181 = load double** %Aii, align 8, !dbg !113
  %182 = getelementptr inbounds double* %181, i64 %180, !dbg !113
  %183 = load double* %182, align 8, !dbg !113
  %184 = fsub double %183, %178, !dbg !113
  store double %184, double* %182, align 8, !dbg !113
  br label %185, !dbg !113

; <label>:185                                     ; preds = %171
  %186 = load i32* %jj, align 4, !dbg !111
  %187 = add nsw i32 %186, 1, !dbg !111
  store i32 %187, i32* %jj, align 4, !dbg !111
  br label %167, !dbg !111

; <label>:188                                     ; preds = %167
  br label %189, !dbg !114

; <label>:189                                     ; preds = %188
  %190 = load i32* %ii, align 4, !dbg !100
  %191 = add nsw i32 %190, 1, !dbg !100
  store i32 %191, i32* %ii, align 4, !dbg !100
  br label %145, !dbg !100

; <label>:192                                     ; preds = %145
  br label %193, !dbg !115

; <label>:193                                     ; preds = %192, %137
  br label %194, !dbg !116

; <label>:194                                     ; preds = %193
  %195 = load i32* %j, align 4, !dbg !51
  %196 = add nsw i32 %195, 1, !dbg !51
  store i32 %196, i32* %j, align 4, !dbg !51
  br label %15, !dbg !51

; <label>:197                                     ; preds = %15
  store i32 0, i32* %1, !dbg !117
  br label %198, !dbg !117

; <label>:198                                     ; preds = %197, %74
  %199 = load i32* %1, !dbg !118
  ret i32 %199, !dbg !118
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c] [DW_LANG_C99]
!1 = metadata !{metadata !"LU.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"LU_num_flops", metadata !"LU_num_flops", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32)* @LU_num_flops, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [LU_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"LU_copy_matrix", metadata !"LU_copy_matrix", metadata !"", i32 14, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, double**, double**)* @LU_copy_matrix, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [LU_copy_matrix]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{null, metadata !9, metadata !9, metadata !13, metadata !13}
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"LU_factor", metadata !"LU_factor", metadata !"", i32 25, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, double**, i32*)* @LU_factor, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [LU_factor]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !9, metadata !9, metadata !9, metadata !13, metadata !18}
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!22 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 4]
!23 = metadata !{i32 4, i32 0, metadata !4, null}
!24 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 8]
!25 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!26 = metadata !{i32 10, i32 0, metadata !4, null}
!27 = metadata !{i32 786689, metadata !10, metadata !"M", metadata !5, i32 16777230, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 14]
!28 = metadata !{i32 14, i32 0, metadata !10, null}
!29 = metadata !{i32 786689, metadata !10, metadata !"N", metadata !5, i32 33554446, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 14]
!30 = metadata !{i32 786689, metadata !10, metadata !"lu", metadata !5, i32 50331662, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lu] [line 14]
!31 = metadata !{i32 786689, metadata !10, metadata !"A", metadata !5, i32 67108878, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 14]
!32 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 16, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!33 = metadata !{i32 16, i32 0, metadata !10, null}
!34 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 17]
!35 = metadata !{i32 17, i32 0, metadata !10, null}
!36 = metadata !{i32 19, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !10, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!38 = metadata !{i32 20, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !37, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!40 = metadata !{i32 21, i32 0, metadata !39, null}
!41 = metadata !{i32 22, i32 0, metadata !10, null}
!42 = metadata !{i32 786689, metadata !15, metadata !"M", metadata !5, i32 16777241, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 25]
!43 = metadata !{i32 25, i32 0, metadata !15, null}
!44 = metadata !{i32 786689, metadata !15, metadata !"N", metadata !5, i32 33554457, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 25]
!45 = metadata !{i32 786689, metadata !15, metadata !"A", metadata !5, i32 50331673, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 25]
!46 = metadata !{i32 786689, metadata !15, metadata !"pivot", metadata !5, i32 67108889, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pivot] [line 25]
!47 = metadata !{i32 786688, metadata !15, metadata !"minMN", metadata !5, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [minMN] [line 29]
!48 = metadata !{i32 29, i32 0, metadata !15, null}
!49 = metadata !{i32 786688, metadata !15, metadata !"j", metadata !5, i32 30, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 30]
!50 = metadata !{i32 30, i32 0, metadata !15, null}
!51 = metadata !{i32 32, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !15, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!53 = metadata !{i32 786688, metadata !54, metadata !"jp", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jp] [line 36]
!54 = metadata !{i32 786443, metadata !1, metadata !52, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!55 = metadata !{i32 36, i32 0, metadata !54, null}
!56 = metadata !{i32 786688, metadata !54, metadata !"i", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 37]
!57 = metadata !{i32 37, i32 0, metadata !54, null}
!58 = metadata !{i32 786688, metadata !54, metadata !"t", metadata !5, i32 39, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 39]
!59 = metadata !{i32 39, i32 0, metadata !54, null}
!60 = metadata !{i32 40, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !54, i32 40, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!62 = metadata !{i32 786688, metadata !63, metadata !"ab", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ab] [line 42]
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 41, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!64 = metadata !{i32 42, i32 0, metadata !63, null}
!65 = metadata !{i32 43, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !63, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!67 = metadata !{i32 45, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !66, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!69 = metadata !{i32 46, i32 0, metadata !68, null}
!70 = metadata !{i32 47, i32 0, metadata !68, null}
!71 = metadata !{i32 48, i32 0, metadata !63, null}
!72 = metadata !{i32 50, i32 0, metadata !54, null}
!73 = metadata !{i32 55, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !54, i32 55, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!75 = metadata !{i32 56, i32 0, metadata !74, null}
!76 = metadata !{i32 59, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !54, i32 59, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!78 = metadata !{i32 786688, metadata !79, metadata !"tA", metadata !5, i32 62, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tA] [line 62]
!79 = metadata !{i32 786443, metadata !1, metadata !77, i32 60, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!80 = metadata !{i32 62, i32 0, metadata !79, null}
!81 = metadata !{i32 63, i32 0, metadata !79, null}
!82 = metadata !{i32 64, i32 0, metadata !79, null}
!83 = metadata !{i32 65, i32 0, metadata !79, null}
!84 = metadata !{i32 67, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !54, i32 67, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!86 = metadata !{i32 786688, metadata !87, metadata !"recp", metadata !5, i32 72, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [recp] [line 72]
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 68, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!88 = metadata !{i32 72, i32 0, metadata !87, null}
!89 = metadata !{i32 786688, metadata !87, metadata !"k", metadata !5, i32 73, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 73]
!90 = metadata !{i32 73, i32 0, metadata !87, null}
!91 = metadata !{i32 74, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !87, i32 74, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!93 = metadata !{i32 75, i32 0, metadata !92, null}
!94 = metadata !{i32 76, i32 0, metadata !87, null}
!95 = metadata !{i32 79, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !54, i32 79, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!97 = metadata !{i32 786688, metadata !98, metadata !"ii", metadata !5, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ii] [line 86]
!98 = metadata !{i32 786443, metadata !1, metadata !96, i32 80, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!99 = metadata !{i32 86, i32 0, metadata !98, null}
!100 = metadata !{i32 87, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !98, i32 87, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!102 = metadata !{i32 786688, metadata !103, metadata !"Aii", metadata !5, i32 89, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Aii] [line 89]
!103 = metadata !{i32 786443, metadata !1, metadata !101, i32 88, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!104 = metadata !{i32 89, i32 0, metadata !103, null}
!105 = metadata !{i32 786688, metadata !103, metadata !"Aj", metadata !5, i32 90, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Aj] [line 90]
!106 = metadata !{i32 90, i32 0, metadata !103, null}
!107 = metadata !{i32 786688, metadata !103, metadata !"AiiJ", metadata !5, i32 91, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [AiiJ] [line 91]
!108 = metadata !{i32 91, i32 0, metadata !103, null}
!109 = metadata !{i32 786688, metadata !103, metadata !"jj", metadata !5, i32 92, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 92]
!110 = metadata !{i32 92, i32 0, metadata !103, null}
!111 = metadata !{i32 93, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !103, i32 93, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!113 = metadata !{i32 94, i32 0, metadata !112, null}
!114 = metadata !{i32 96, i32 0, metadata !103, null}
!115 = metadata !{i32 97, i32 0, metadata !98, null}
!116 = metadata !{i32 98, i32 0, metadata !54, null}
!117 = metadata !{i32 100, i32 0, metadata !15, null}
!118 = metadata !{i32 101, i32 0, metadata !15, null}
