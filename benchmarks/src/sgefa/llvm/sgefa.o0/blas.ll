; ModuleID = 'blas.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isamax(i32 %n, float* %sx, i32 %incx) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %smax = alloca float, align 4
  %i = alloca i32, align 4
  %istmp = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !43), !dbg !44
  store float* %sx, float** %3, align 8
  call void @llvm.dbg.declare(metadata !{float** %3}, metadata !45), !dbg !46
  store i32 %incx, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !47), !dbg !44
  call void @llvm.dbg.declare(metadata !{float* %smax}, metadata !48), !dbg !49
  store float 0.000000e+00, float* %smax, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !50), !dbg !51
  call void @llvm.dbg.declare(metadata !{i32* %istmp}, metadata !52), !dbg !51
  store i32 0, i32* %istmp, align 4, !dbg !51
  %5 = load i32* %2, align 4, !dbg !53
  %6 = icmp sle i32 %5, 1, !dbg !53
  br i1 %6, label %7, label %9, !dbg !53

; <label>:7                                       ; preds = %0
  %8 = load i32* %istmp, align 4, !dbg !53
  store i32 %8, i32* %1, !dbg !53
  br label %147, !dbg !53

; <label>:9                                       ; preds = %0
  %10 = load i32* %4, align 4, !dbg !55
  %11 = icmp ne i32 %10, 1, !dbg !55
  br i1 %11, label %12, label %88, !dbg !55

; <label>:12                                      ; preds = %9
  %13 = load i32* %4, align 4, !dbg !57
  %14 = icmp slt i32 %13, 0, !dbg !57
  br i1 %14, label %15, label %25, !dbg !57

; <label>:15                                      ; preds = %12
  %16 = load float** %3, align 8, !dbg !57
  %17 = load i32* %2, align 4, !dbg !57
  %18 = sub nsw i32 0, %17, !dbg !57
  %19 = add nsw i32 %18, 1, !dbg !57
  %20 = load i32* %4, align 4, !dbg !57
  %21 = mul nsw i32 %19, %20, !dbg !57
  %22 = add nsw i32 %21, 1, !dbg !57
  %23 = sext i32 %22 to i64, !dbg !57
  %24 = getelementptr inbounds float* %16, i64 %23, !dbg !57
  store float* %24, float** %3, align 8, !dbg !57
  br label %25, !dbg !57

; <label>:25                                      ; preds = %15, %12
  store i32 0, i32* %istmp, align 4, !dbg !60
  %26 = load float** %3, align 8, !dbg !61
  %27 = load float* %26, align 4, !dbg !61
  %28 = fpext float %27 to double, !dbg !61
  %29 = fcmp ogt double %28, 0.000000e+00, !dbg !61
  br i1 %29, label %30, label %33, !dbg !61

; <label>:30                                      ; preds = %25
  %31 = load float** %3, align 8, !dbg !61
  %32 = load float* %31, align 4, !dbg !61
  br label %37, !dbg !61

; <label>:33                                      ; preds = %25
  %34 = load float** %3, align 8, !dbg !61
  %35 = load float* %34, align 4, !dbg !61
  %36 = fsub float -0.000000e+00, %35, !dbg !61
  br label %37, !dbg !61

; <label>:37                                      ; preds = %33, %30
  %38 = phi float [ %32, %30 ], [ %36, %33 ], !dbg !61
  store float %38, float* %smax, align 4, !dbg !61
  %39 = load i32* %4, align 4, !dbg !62
  %40 = load float** %3, align 8, !dbg !62
  %41 = sext i32 %39 to i64, !dbg !62
  %42 = getelementptr inbounds float* %40, i64 %41, !dbg !62
  store float* %42, float** %3, align 8, !dbg !62
  store i32 1, i32* %i, align 4, !dbg !63
  br label %43, !dbg !63

; <label>:43                                      ; preds = %79, %37
  %44 = load i32* %i, align 4, !dbg !63
  %45 = load i32* %2, align 4, !dbg !63
  %46 = icmp slt i32 %44, %45, !dbg !63
  br i1 %46, label %47, label %86, !dbg !63

; <label>:47                                      ; preds = %43
  %48 = load float** %3, align 8, !dbg !65
  %49 = load float* %48, align 4, !dbg !65
  %50 = fpext float %49 to double, !dbg !65
  %51 = fcmp ogt double %50, 0.000000e+00, !dbg !65
  br i1 %51, label %52, label %55, !dbg !65

; <label>:52                                      ; preds = %47
  %53 = load float** %3, align 8, !dbg !65
  %54 = load float* %53, align 4, !dbg !65
  br label %59, !dbg !65

; <label>:55                                      ; preds = %47
  %56 = load float** %3, align 8, !dbg !65
  %57 = load float* %56, align 4, !dbg !65
  %58 = fsub float -0.000000e+00, %57, !dbg !65
  br label %59, !dbg !65

; <label>:59                                      ; preds = %55, %52
  %60 = phi float [ %54, %52 ], [ %58, %55 ], !dbg !65
  %61 = load float* %smax, align 4, !dbg !65
  %62 = fcmp ogt float %60, %61, !dbg !65
  br i1 %62, label %63, label %78, !dbg !65

; <label>:63                                      ; preds = %59
  %64 = load i32* %i, align 4, !dbg !67
  store i32 %64, i32* %istmp, align 4, !dbg !67
  %65 = load float** %3, align 8, !dbg !69
  %66 = load float* %65, align 4, !dbg !69
  %67 = fpext float %66 to double, !dbg !69
  %68 = fcmp ogt double %67, 0.000000e+00, !dbg !69
  br i1 %68, label %69, label %72, !dbg !69

; <label>:69                                      ; preds = %63
  %70 = load float** %3, align 8, !dbg !69
  %71 = load float* %70, align 4, !dbg !69
  br label %76, !dbg !69

; <label>:72                                      ; preds = %63
  %73 = load float** %3, align 8, !dbg !69
  %74 = load float* %73, align 4, !dbg !69
  %75 = fsub float -0.000000e+00, %74, !dbg !69
  br label %76, !dbg !69

; <label>:76                                      ; preds = %72, %69
  %77 = phi float [ %71, %69 ], [ %75, %72 ], !dbg !69
  store float %77, float* %smax, align 4, !dbg !69
  br label %78, !dbg !70

; <label>:78                                      ; preds = %76, %59
  br label %79, !dbg !71

; <label>:79                                      ; preds = %78
  %80 = load i32* %i, align 4, !dbg !63
  %81 = add nsw i32 %80, 1, !dbg !63
  store i32 %81, i32* %i, align 4, !dbg !63
  %82 = load i32* %4, align 4, !dbg !63
  %83 = load float** %3, align 8, !dbg !63
  %84 = sext i32 %82 to i64, !dbg !63
  %85 = getelementptr inbounds float* %83, i64 %84, !dbg !63
  store float* %85, float** %3, align 8, !dbg !63
  br label %43, !dbg !63

; <label>:86                                      ; preds = %43
  %87 = load i32* %istmp, align 4, !dbg !72
  store i32 %87, i32* %1, !dbg !72
  br label %147, !dbg !72

; <label>:88                                      ; preds = %9
  store i32 0, i32* %istmp, align 4, !dbg !73
  %89 = load float** %3, align 8, !dbg !74
  %90 = load float* %89, align 4, !dbg !74
  %91 = fpext float %90 to double, !dbg !74
  %92 = fcmp ogt double %91, 0.000000e+00, !dbg !74
  br i1 %92, label %93, label %96, !dbg !74

; <label>:93                                      ; preds = %88
  %94 = load float** %3, align 8, !dbg !74
  %95 = load float* %94, align 4, !dbg !74
  br label %100, !dbg !74

; <label>:96                                      ; preds = %88
  %97 = load float** %3, align 8, !dbg !74
  %98 = load float* %97, align 4, !dbg !74
  %99 = fsub float -0.000000e+00, %98, !dbg !74
  br label %100, !dbg !74

; <label>:100                                     ; preds = %96, %93
  %101 = phi float [ %95, %93 ], [ %99, %96 ], !dbg !74
  store float %101, float* %smax, align 4, !dbg !74
  %102 = load float** %3, align 8, !dbg !75
  %103 = getelementptr inbounds float* %102, i32 1, !dbg !75
  store float* %103, float** %3, align 8, !dbg !75
  store i32 1, i32* %i, align 4, !dbg !76
  br label %104, !dbg !76

; <label>:104                                     ; preds = %140, %100
  %105 = load i32* %i, align 4, !dbg !76
  %106 = load i32* %2, align 4, !dbg !76
  %107 = icmp slt i32 %105, %106, !dbg !76
  br i1 %107, label %108, label %145, !dbg !76

; <label>:108                                     ; preds = %104
  %109 = load float** %3, align 8, !dbg !78
  %110 = load float* %109, align 4, !dbg !78
  %111 = fpext float %110 to double, !dbg !78
  %112 = fcmp ogt double %111, 0.000000e+00, !dbg !78
  br i1 %112, label %113, label %116, !dbg !78

; <label>:113                                     ; preds = %108
  %114 = load float** %3, align 8, !dbg !78
  %115 = load float* %114, align 4, !dbg !78
  br label %120, !dbg !78

; <label>:116                                     ; preds = %108
  %117 = load float** %3, align 8, !dbg !78
  %118 = load float* %117, align 4, !dbg !78
  %119 = fsub float -0.000000e+00, %118, !dbg !78
  br label %120, !dbg !78

; <label>:120                                     ; preds = %116, %113
  %121 = phi float [ %115, %113 ], [ %119, %116 ], !dbg !78
  %122 = load float* %smax, align 4, !dbg !78
  %123 = fcmp ogt float %121, %122, !dbg !78
  br i1 %123, label %124, label %139, !dbg !78

; <label>:124                                     ; preds = %120
  %125 = load i32* %i, align 4, !dbg !80
  store i32 %125, i32* %istmp, align 4, !dbg !80
  %126 = load float** %3, align 8, !dbg !82
  %127 = load float* %126, align 4, !dbg !82
  %128 = fpext float %127 to double, !dbg !82
  %129 = fcmp ogt double %128, 0.000000e+00, !dbg !82
  br i1 %129, label %130, label %133, !dbg !82

; <label>:130                                     ; preds = %124
  %131 = load float** %3, align 8, !dbg !82
  %132 = load float* %131, align 4, !dbg !82
  br label %137, !dbg !82

; <label>:133                                     ; preds = %124
  %134 = load float** %3, align 8, !dbg !82
  %135 = load float* %134, align 4, !dbg !82
  %136 = fsub float -0.000000e+00, %135, !dbg !82
  br label %137, !dbg !82

; <label>:137                                     ; preds = %133, %130
  %138 = phi float [ %132, %130 ], [ %136, %133 ], !dbg !82
  store float %138, float* %smax, align 4, !dbg !82
  br label %139, !dbg !83

; <label>:139                                     ; preds = %137, %120
  br label %140, !dbg !84

; <label>:140                                     ; preds = %139
  %141 = load i32* %i, align 4, !dbg !76
  %142 = add nsw i32 %141, 1, !dbg !76
  store i32 %142, i32* %i, align 4, !dbg !76
  %143 = load float** %3, align 8, !dbg !76
  %144 = getelementptr inbounds float* %143, i32 1, !dbg !76
  store float* %144, float** %3, align 8, !dbg !76
  br label %104, !dbg !76

; <label>:145                                     ; preds = %104
  %146 = load i32* %istmp, align 4, !dbg !85
  store i32 %146, i32* %1, !dbg !85
  br label %147, !dbg !85

; <label>:147                                     ; preds = %145, %86, %7
  %148 = load i32* %1, !dbg !86
  ret i32 %148, !dbg !86
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @saxpy(i32 %n, double, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !87), !dbg !88
  store float %sa, float* %3, align 4
  call void @llvm.dbg.declare(metadata !{float* %3}, metadata !89), !dbg !90
  store float* %sx, float** %4, align 8
  call void @llvm.dbg.declare(metadata !{float** %4}, metadata !91), !dbg !90
  store i32 %incx, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !92), !dbg !88
  store float* %sy, float** %6, align 8
  call void @llvm.dbg.declare(metadata !{float** %6}, metadata !93), !dbg !90
  store i32 %incy, i32* %7, align 4
  call void @llvm.dbg.declare(metadata !{i32* %7}, metadata !94), !dbg !88
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !95), !dbg !96
  %8 = load i32* %2, align 4, !dbg !97
  %9 = icmp sle i32 %8, 0, !dbg !97
  br i1 %9, label %14, label %10, !dbg !97

; <label>:10                                      ; preds = %1
  %11 = load float* %3, align 4, !dbg !97
  %12 = fpext float %11 to double, !dbg !97
  %13 = fcmp oeq double %12, 0.000000e+00, !dbg !97
  br i1 %13, label %14, label %15, !dbg !97

; <label>:14                                      ; preds = %10, %1
  br label %122, !dbg !97

; <label>:15                                      ; preds = %10
  %16 = load i32* %5, align 4, !dbg !99
  %17 = load i32* %7, align 4, !dbg !99
  %18 = icmp eq i32 %16, %17, !dbg !99
  br i1 %18, label %19, label %72, !dbg !99

; <label>:19                                      ; preds = %15
  %20 = load i32* %5, align 4, !dbg !101
  %21 = icmp eq i32 %20, 1, !dbg !101
  br i1 %21, label %22, label %43, !dbg !101

; <label>:22                                      ; preds = %19
  store i32 0, i32* %i, align 4, !dbg !104
  br label %23, !dbg !104

; <label>:23                                      ; preds = %35, %22
  %24 = load i32* %i, align 4, !dbg !104
  %25 = load i32* %2, align 4, !dbg !104
  %26 = icmp slt i32 %24, %25, !dbg !104
  br i1 %26, label %27, label %42, !dbg !104

; <label>:27                                      ; preds = %23
  %28 = load float* %3, align 4, !dbg !107
  %29 = load float** %4, align 8, !dbg !107
  %30 = load float* %29, align 4, !dbg !107
  %31 = fmul float %28, %30, !dbg !107
  %32 = load float** %6, align 8, !dbg !107
  %33 = load float* %32, align 4, !dbg !107
  %34 = fadd float %33, %31, !dbg !107
  store float %34, float* %32, align 4, !dbg !107
  br label %35, !dbg !107

; <label>:35                                      ; preds = %27
  %36 = load i32* %i, align 4, !dbg !104
  %37 = add nsw i32 %36, 1, !dbg !104
  store i32 %37, i32* %i, align 4, !dbg !104
  %38 = load float** %6, align 8, !dbg !104
  %39 = getelementptr inbounds float* %38, i32 1, !dbg !104
  store float* %39, float** %6, align 8, !dbg !104
  %40 = load float** %4, align 8, !dbg !104
  %41 = getelementptr inbounds float* %40, i32 1, !dbg !104
  store float* %41, float** %4, align 8, !dbg !104
  br label %23, !dbg !104

; <label>:42                                      ; preds = %23
  br label %122, !dbg !108

; <label>:43                                      ; preds = %19
  %44 = load i32* %5, align 4, !dbg !109
  %45 = icmp sgt i32 %44, 0, !dbg !109
  br i1 %45, label %46, label %71, !dbg !109

; <label>:46                                      ; preds = %43
  store i32 0, i32* %i, align 4, !dbg !111
  br label %47, !dbg !111

; <label>:47                                      ; preds = %59, %46
  %48 = load i32* %i, align 4, !dbg !111
  %49 = load i32* %2, align 4, !dbg !111
  %50 = icmp slt i32 %48, %49, !dbg !111
  br i1 %50, label %51, label %70, !dbg !111

; <label>:51                                      ; preds = %47
  %52 = load float* %3, align 4, !dbg !114
  %53 = load float** %4, align 8, !dbg !114
  %54 = load float* %53, align 4, !dbg !114
  %55 = fmul float %52, %54, !dbg !114
  %56 = load float** %6, align 8, !dbg !114
  %57 = load float* %56, align 4, !dbg !114
  %58 = fadd float %57, %55, !dbg !114
  store float %58, float* %56, align 4, !dbg !114
  br label %59, !dbg !114

; <label>:59                                      ; preds = %51
  %60 = load i32* %i, align 4, !dbg !111
  %61 = add nsw i32 %60, 1, !dbg !111
  store i32 %61, i32* %i, align 4, !dbg !111
  %62 = load i32* %5, align 4, !dbg !111
  %63 = load float** %4, align 8, !dbg !111
  %64 = sext i32 %62 to i64, !dbg !111
  %65 = getelementptr inbounds float* %63, i64 %64, !dbg !111
  store float* %65, float** %4, align 8, !dbg !111
  %66 = load i32* %5, align 4, !dbg !111
  %67 = load float** %6, align 8, !dbg !111
  %68 = sext i32 %66 to i64, !dbg !111
  %69 = getelementptr inbounds float* %67, i64 %68, !dbg !111
  store float* %69, float** %6, align 8, !dbg !111
  br label %47, !dbg !111

; <label>:70                                      ; preds = %47
  br label %122, !dbg !115

; <label>:71                                      ; preds = %43
  br label %72, !dbg !116

; <label>:72                                      ; preds = %71, %15
  %73 = load i32* %5, align 4, !dbg !117
  %74 = icmp slt i32 %73, 0, !dbg !117
  br i1 %74, label %75, label %85, !dbg !117

; <label>:75                                      ; preds = %72
  %76 = load i32* %2, align 4, !dbg !117
  %77 = sub nsw i32 0, %76, !dbg !117
  %78 = add nsw i32 %77, 1, !dbg !117
  %79 = load i32* %5, align 4, !dbg !117
  %80 = mul nsw i32 %78, %79, !dbg !117
  %81 = add nsw i32 %80, 1, !dbg !117
  %82 = load float** %4, align 8, !dbg !117
  %83 = sext i32 %81 to i64, !dbg !117
  %84 = getelementptr inbounds float* %82, i64 %83, !dbg !117
  store float* %84, float** %4, align 8, !dbg !117
  br label %85, !dbg !117

; <label>:85                                      ; preds = %75, %72
  %86 = load i32* %7, align 4, !dbg !119
  %87 = icmp slt i32 %86, 0, !dbg !119
  br i1 %87, label %88, label %98, !dbg !119

; <label>:88                                      ; preds = %85
  %89 = load i32* %2, align 4, !dbg !119
  %90 = sub nsw i32 0, %89, !dbg !119
  %91 = add nsw i32 %90, 1, !dbg !119
  %92 = load i32* %7, align 4, !dbg !119
  %93 = mul nsw i32 %91, %92, !dbg !119
  %94 = add nsw i32 %93, 1, !dbg !119
  %95 = load float** %6, align 8, !dbg !119
  %96 = sext i32 %94 to i64, !dbg !119
  %97 = getelementptr inbounds float* %95, i64 %96, !dbg !119
  store float* %97, float** %6, align 8, !dbg !119
  br label %98, !dbg !119

; <label>:98                                      ; preds = %88, %85
  store i32 0, i32* %i, align 4, !dbg !121
  br label %99, !dbg !121

; <label>:99                                      ; preds = %111, %98
  %100 = load i32* %i, align 4, !dbg !121
  %101 = load i32* %2, align 4, !dbg !121
  %102 = icmp slt i32 %100, %101, !dbg !121
  br i1 %102, label %103, label %122, !dbg !121

; <label>:103                                     ; preds = %99
  %104 = load float* %3, align 4, !dbg !123
  %105 = load float** %4, align 8, !dbg !123
  %106 = load float* %105, align 4, !dbg !123
  %107 = fmul float %104, %106, !dbg !123
  %108 = load float** %6, align 8, !dbg !123
  %109 = load float* %108, align 4, !dbg !123
  %110 = fadd float %109, %107, !dbg !123
  store float %110, float* %108, align 4, !dbg !123
  br label %111, !dbg !123

; <label>:111                                     ; preds = %103
  %112 = load i32* %i, align 4, !dbg !121
  %113 = add nsw i32 %112, 1, !dbg !121
  store i32 %113, i32* %i, align 4, !dbg !121
  %114 = load i32* %5, align 4, !dbg !121
  %115 = load float** %4, align 8, !dbg !121
  %116 = sext i32 %114 to i64, !dbg !121
  %117 = getelementptr inbounds float* %115, i64 %116, !dbg !121
  store float* %117, float** %4, align 8, !dbg !121
  %118 = load i32* %7, align 4, !dbg !121
  %119 = load float** %6, align 8, !dbg !121
  %120 = sext i32 %118 to i64, !dbg !121
  %121 = getelementptr inbounds float* %119, i64 %120, !dbg !121
  store float* %121, float** %6, align 8, !dbg !121
  br label %99, !dbg !121

; <label>:122                                     ; preds = %14, %42, %70, %99
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define void @saxpyx(i32 %n, double, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !125), !dbg !126
  store float %sa, float* %3, align 4
  call void @llvm.dbg.declare(metadata !{float* %3}, metadata !127), !dbg !128
  store float* %sx, float** %4, align 8
  call void @llvm.dbg.declare(metadata !{float** %4}, metadata !129), !dbg !128
  store i32 %incx, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !130), !dbg !126
  store float* %sy, float** %6, align 8
  call void @llvm.dbg.declare(metadata !{float** %6}, metadata !131), !dbg !128
  store i32 %incy, i32* %7, align 4
  call void @llvm.dbg.declare(metadata !{i32* %7}, metadata !132), !dbg !126
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !133), !dbg !134
  %8 = load i32* %2, align 4, !dbg !135
  %9 = icmp sle i32 %8, 0, !dbg !135
  br i1 %9, label %14, label %10, !dbg !135

; <label>:10                                      ; preds = %1
  %11 = load float* %3, align 4, !dbg !135
  %12 = fpext float %11 to double, !dbg !135
  %13 = fcmp oeq double %12, 0.000000e+00, !dbg !135
  br i1 %13, label %14, label %15, !dbg !135

; <label>:14                                      ; preds = %10, %1
  br label %125, !dbg !135

; <label>:15                                      ; preds = %10
  %16 = load i32* %5, align 4, !dbg !137
  %17 = load i32* %7, align 4, !dbg !137
  %18 = icmp eq i32 %16, %17, !dbg !137
  br i1 %18, label %19, label %74, !dbg !137

; <label>:19                                      ; preds = %15
  %20 = load i32* %5, align 4, !dbg !139
  %21 = icmp eq i32 %20, 1, !dbg !139
  br i1 %21, label %22, label %44, !dbg !139

; <label>:22                                      ; preds = %19
  store i32 0, i32* %i, align 4, !dbg !142
  br label %23, !dbg !142

; <label>:23                                      ; preds = %36, %22
  %24 = load i32* %i, align 4, !dbg !142
  %25 = load i32* %2, align 4, !dbg !142
  %26 = icmp slt i32 %24, %25, !dbg !142
  br i1 %26, label %27, label %43, !dbg !142

; <label>:27                                      ; preds = %23
  %28 = load float** %6, align 8, !dbg !145
  %29 = load float* %28, align 4, !dbg !145
  %30 = load float* %3, align 4, !dbg !145
  %31 = load float** %4, align 8, !dbg !145
  %32 = load float* %31, align 4, !dbg !145
  %33 = fmul float %30, %32, !dbg !145
  %34 = fadd float %29, %33, !dbg !145
  %35 = load float** %4, align 8, !dbg !145
  store float %34, float* %35, align 4, !dbg !145
  br label %36, !dbg !145

; <label>:36                                      ; preds = %27
  %37 = load i32* %i, align 4, !dbg !142
  %38 = add nsw i32 %37, 1, !dbg !142
  store i32 %38, i32* %i, align 4, !dbg !142
  %39 = load float** %4, align 8, !dbg !142
  %40 = getelementptr inbounds float* %39, i32 1, !dbg !142
  store float* %40, float** %4, align 8, !dbg !142
  %41 = load float** %6, align 8, !dbg !142
  %42 = getelementptr inbounds float* %41, i32 1, !dbg !142
  store float* %42, float** %6, align 8, !dbg !142
  br label %23, !dbg !142

; <label>:43                                      ; preds = %23
  br label %125, !dbg !146

; <label>:44                                      ; preds = %19
  %45 = load i32* %5, align 4, !dbg !147
  %46 = icmp sgt i32 %45, 0, !dbg !147
  br i1 %46, label %47, label %73, !dbg !147

; <label>:47                                      ; preds = %44
  store i32 0, i32* %i, align 4, !dbg !149
  br label %48, !dbg !149

; <label>:48                                      ; preds = %61, %47
  %49 = load i32* %i, align 4, !dbg !149
  %50 = load i32* %2, align 4, !dbg !149
  %51 = icmp slt i32 %49, %50, !dbg !149
  br i1 %51, label %52, label %72, !dbg !149

; <label>:52                                      ; preds = %48
  %53 = load float** %6, align 8, !dbg !152
  %54 = load float* %53, align 4, !dbg !152
  %55 = load float* %3, align 4, !dbg !152
  %56 = load float** %4, align 8, !dbg !152
  %57 = load float* %56, align 4, !dbg !152
  %58 = fmul float %55, %57, !dbg !152
  %59 = fadd float %54, %58, !dbg !152
  %60 = load float** %4, align 8, !dbg !152
  store float %59, float* %60, align 4, !dbg !152
  br label %61, !dbg !152

; <label>:61                                      ; preds = %52
  %62 = load i32* %i, align 4, !dbg !149
  %63 = add nsw i32 %62, 1, !dbg !149
  store i32 %63, i32* %i, align 4, !dbg !149
  %64 = load i32* %5, align 4, !dbg !149
  %65 = load float** %4, align 8, !dbg !149
  %66 = sext i32 %64 to i64, !dbg !149
  %67 = getelementptr inbounds float* %65, i64 %66, !dbg !149
  store float* %67, float** %4, align 8, !dbg !149
  %68 = load i32* %5, align 4, !dbg !149
  %69 = load float** %6, align 8, !dbg !149
  %70 = sext i32 %68 to i64, !dbg !149
  %71 = getelementptr inbounds float* %69, i64 %70, !dbg !149
  store float* %71, float** %6, align 8, !dbg !149
  br label %48, !dbg !149

; <label>:72                                      ; preds = %48
  br label %125, !dbg !153

; <label>:73                                      ; preds = %44
  br label %74, !dbg !154

; <label>:74                                      ; preds = %73, %15
  %75 = load i32* %5, align 4, !dbg !155
  %76 = icmp slt i32 %75, 0, !dbg !155
  br i1 %76, label %77, label %87, !dbg !155

; <label>:77                                      ; preds = %74
  %78 = load i32* %2, align 4, !dbg !155
  %79 = sub nsw i32 0, %78, !dbg !155
  %80 = add nsw i32 %79, 1, !dbg !155
  %81 = load i32* %5, align 4, !dbg !155
  %82 = mul nsw i32 %80, %81, !dbg !155
  %83 = add nsw i32 %82, 1, !dbg !155
  %84 = load float** %4, align 8, !dbg !155
  %85 = sext i32 %83 to i64, !dbg !155
  %86 = getelementptr inbounds float* %84, i64 %85, !dbg !155
  store float* %86, float** %4, align 8, !dbg !155
  br label %87, !dbg !155

; <label>:87                                      ; preds = %77, %74
  %88 = load i32* %7, align 4, !dbg !157
  %89 = icmp slt i32 %88, 0, !dbg !157
  br i1 %89, label %90, label %100, !dbg !157

; <label>:90                                      ; preds = %87
  %91 = load i32* %2, align 4, !dbg !157
  %92 = sub nsw i32 0, %91, !dbg !157
  %93 = add nsw i32 %92, 1, !dbg !157
  %94 = load i32* %7, align 4, !dbg !157
  %95 = mul nsw i32 %93, %94, !dbg !157
  %96 = add nsw i32 %95, 1, !dbg !157
  %97 = load float** %6, align 8, !dbg !157
  %98 = sext i32 %96 to i64, !dbg !157
  %99 = getelementptr inbounds float* %97, i64 %98, !dbg !157
  store float* %99, float** %6, align 8, !dbg !157
  br label %100, !dbg !157

; <label>:100                                     ; preds = %90, %87
  store i32 0, i32* %i, align 4, !dbg !159
  br label %101, !dbg !159

; <label>:101                                     ; preds = %114, %100
  %102 = load i32* %i, align 4, !dbg !159
  %103 = load i32* %2, align 4, !dbg !159
  %104 = icmp slt i32 %102, %103, !dbg !159
  br i1 %104, label %105, label %125, !dbg !159

; <label>:105                                     ; preds = %101
  %106 = load float** %6, align 8, !dbg !161
  %107 = load float* %106, align 4, !dbg !161
  %108 = load float* %3, align 4, !dbg !161
  %109 = load float** %4, align 8, !dbg !161
  %110 = load float* %109, align 4, !dbg !161
  %111 = fmul float %108, %110, !dbg !161
  %112 = fadd float %107, %111, !dbg !161
  %113 = load float** %4, align 8, !dbg !161
  store float %112, float* %113, align 4, !dbg !161
  br label %114, !dbg !161

; <label>:114                                     ; preds = %105
  %115 = load i32* %i, align 4, !dbg !159
  %116 = add nsw i32 %115, 1, !dbg !159
  store i32 %116, i32* %i, align 4, !dbg !159
  %117 = load i32* %5, align 4, !dbg !159
  %118 = load float** %4, align 8, !dbg !159
  %119 = sext i32 %117 to i64, !dbg !159
  %120 = getelementptr inbounds float* %118, i64 %119, !dbg !159
  store float* %120, float** %4, align 8, !dbg !159
  %121 = load i32* %7, align 4, !dbg !159
  %122 = load float** %6, align 8, !dbg !159
  %123 = sext i32 %121 to i64, !dbg !159
  %124 = getelementptr inbounds float* %122, i64 %123, !dbg !159
  store float* %124, float** %6, align 8, !dbg !159
  br label %101, !dbg !159

; <label>:125                                     ; preds = %14, %43, %72, %101
  ret void, !dbg !162
}

; Function Attrs: nounwind uwtable
define void @scopy(i32 %n, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !163), !dbg !164
  store float* %sx, float** %2, align 8
  call void @llvm.dbg.declare(metadata !{float** %2}, metadata !165), !dbg !166
  store i32 %incx, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !167), !dbg !164
  store float* %sy, float** %4, align 8
  call void @llvm.dbg.declare(metadata !{float** %4}, metadata !168), !dbg !166
  store i32 %incy, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !169), !dbg !164
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !170), !dbg !171
  %6 = load i32* %1, align 4, !dbg !172
  %7 = icmp slt i32 %6, 1, !dbg !172
  br i1 %7, label %8, label %9, !dbg !172

; <label>:8                                       ; preds = %0
  br label %103, !dbg !172

; <label>:9                                       ; preds = %0
  %10 = load i32* %3, align 4, !dbg !174
  %11 = load i32* %5, align 4, !dbg !174
  %12 = icmp eq i32 %10, %11, !dbg !174
  br i1 %12, label %13, label %56, !dbg !174

; <label>:13                                      ; preds = %9
  %14 = load i32* %3, align 4, !dbg !176
  %15 = icmp eq i32 %14, 1, !dbg !176
  br i1 %15, label %16, label %31, !dbg !176

; <label>:16                                      ; preds = %13
  store i32 0, i32* %i, align 4, !dbg !179
  br label %17, !dbg !179

; <label>:17                                      ; preds = %27, %16
  %18 = load i32* %i, align 4, !dbg !179
  %19 = load i32* %1, align 4, !dbg !179
  %20 = icmp slt i32 %18, %19, !dbg !179
  br i1 %20, label %21, label %30, !dbg !179

; <label>:21                                      ; preds = %17
  %22 = load float** %2, align 8, !dbg !182
  %23 = getelementptr inbounds float* %22, i32 1, !dbg !182
  store float* %23, float** %2, align 8, !dbg !182
  %24 = load float* %22, align 4, !dbg !182
  %25 = load float** %4, align 8, !dbg !182
  %26 = getelementptr inbounds float* %25, i32 1, !dbg !182
  store float* %26, float** %4, align 8, !dbg !182
  store float %24, float* %25, align 4, !dbg !182
  br label %27, !dbg !182

; <label>:27                                      ; preds = %21
  %28 = load i32* %i, align 4, !dbg !179
  %29 = add nsw i32 %28, 1, !dbg !179
  store i32 %29, i32* %i, align 4, !dbg !179
  br label %17, !dbg !179

; <label>:30                                      ; preds = %17
  br label %103, !dbg !183

; <label>:31                                      ; preds = %13
  %32 = load i32* %3, align 4, !dbg !184
  %33 = icmp sgt i32 %32, 0, !dbg !184
  br i1 %33, label %34, label %55, !dbg !184

; <label>:34                                      ; preds = %31
  store i32 0, i32* %i, align 4, !dbg !186
  br label %35, !dbg !186

; <label>:35                                      ; preds = %43, %34
  %36 = load i32* %i, align 4, !dbg !186
  %37 = load i32* %1, align 4, !dbg !186
  %38 = icmp slt i32 %36, %37, !dbg !186
  br i1 %38, label %39, label %54, !dbg !186

; <label>:39                                      ; preds = %35
  %40 = load float** %2, align 8, !dbg !189
  %41 = load float* %40, align 4, !dbg !189
  %42 = load float** %4, align 8, !dbg !189
  store float %41, float* %42, align 4, !dbg !189
  br label %43, !dbg !189

; <label>:43                                      ; preds = %39
  %44 = load i32* %i, align 4, !dbg !186
  %45 = add nsw i32 %44, 1, !dbg !186
  store i32 %45, i32* %i, align 4, !dbg !186
  %46 = load i32* %3, align 4, !dbg !186
  %47 = load float** %2, align 8, !dbg !186
  %48 = sext i32 %46 to i64, !dbg !186
  %49 = getelementptr inbounds float* %47, i64 %48, !dbg !186
  store float* %49, float** %2, align 8, !dbg !186
  %50 = load i32* %3, align 4, !dbg !186
  %51 = load float** %4, align 8, !dbg !186
  %52 = sext i32 %50 to i64, !dbg !186
  %53 = getelementptr inbounds float* %51, i64 %52, !dbg !186
  store float* %53, float** %4, align 8, !dbg !186
  br label %35, !dbg !186

; <label>:54                                      ; preds = %35
  br label %103, !dbg !190

; <label>:55                                      ; preds = %31
  br label %56, !dbg !191

; <label>:56                                      ; preds = %55, %9
  %57 = load i32* %3, align 4, !dbg !192
  %58 = icmp slt i32 %57, 0, !dbg !192
  br i1 %58, label %59, label %69, !dbg !192

; <label>:59                                      ; preds = %56
  %60 = load i32* %1, align 4, !dbg !192
  %61 = sub nsw i32 0, %60, !dbg !192
  %62 = add nsw i32 %61, 1, !dbg !192
  %63 = load i32* %3, align 4, !dbg !192
  %64 = mul nsw i32 %62, %63, !dbg !192
  %65 = add nsw i32 %64, 1, !dbg !192
  %66 = load float** %2, align 8, !dbg !192
  %67 = sext i32 %65 to i64, !dbg !192
  %68 = getelementptr inbounds float* %66, i64 %67, !dbg !192
  store float* %68, float** %2, align 8, !dbg !192
  br label %69, !dbg !192

; <label>:69                                      ; preds = %59, %56
  %70 = load i32* %5, align 4, !dbg !194
  %71 = icmp slt i32 %70, 0, !dbg !194
  br i1 %71, label %72, label %82, !dbg !194

; <label>:72                                      ; preds = %69
  %73 = load i32* %1, align 4, !dbg !194
  %74 = sub nsw i32 0, %73, !dbg !194
  %75 = add nsw i32 %74, 1, !dbg !194
  %76 = load i32* %5, align 4, !dbg !194
  %77 = mul nsw i32 %75, %76, !dbg !194
  %78 = add nsw i32 %77, 1, !dbg !194
  %79 = load float** %4, align 8, !dbg !194
  %80 = sext i32 %78 to i64, !dbg !194
  %81 = getelementptr inbounds float* %79, i64 %80, !dbg !194
  store float* %81, float** %4, align 8, !dbg !194
  br label %82, !dbg !194

; <label>:82                                      ; preds = %72, %69
  store i32 0, i32* %i, align 4, !dbg !196
  br label %83, !dbg !196

; <label>:83                                      ; preds = %91, %82
  %84 = load i32* %i, align 4, !dbg !196
  %85 = load i32* %1, align 4, !dbg !196
  %86 = icmp slt i32 %84, %85, !dbg !196
  br i1 %86, label %87, label %102, !dbg !196

; <label>:87                                      ; preds = %83
  %88 = load float** %4, align 8, !dbg !198
  %89 = load float* %88, align 4, !dbg !198
  %90 = load float** %2, align 8, !dbg !198
  store float %89, float* %90, align 4, !dbg !198
  br label %91, !dbg !198

; <label>:91                                      ; preds = %87
  %92 = load i32* %i, align 4, !dbg !196
  %93 = add nsw i32 %92, 1, !dbg !196
  store i32 %93, i32* %i, align 4, !dbg !196
  %94 = load i32* %3, align 4, !dbg !196
  %95 = load float** %2, align 8, !dbg !196
  %96 = sext i32 %94 to i64, !dbg !196
  %97 = getelementptr inbounds float* %95, i64 %96, !dbg !196
  store float* %97, float** %2, align 8, !dbg !196
  %98 = load i32* %5, align 4, !dbg !196
  %99 = load float** %4, align 8, !dbg !196
  %100 = sext i32 %98 to i64, !dbg !196
  %101 = getelementptr inbounds float* %99, i64 %100, !dbg !196
  store float* %101, float** %4, align 8, !dbg !196
  br label %83, !dbg !196

; <label>:102                                     ; preds = %83
  br label %103, !dbg !199

; <label>:103                                     ; preds = %102, %54, %30, %8
  ret void, !dbg !200
}

; Function Attrs: nounwind uwtable
define double @sdot(i32 %n, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca float*, align 8
  %6 = alloca i32, align 4
  %i = alloca i32, align 4
  %stemp = alloca float, align 4
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !201), !dbg !202
  store float* %sx, float** %3, align 8
  call void @llvm.dbg.declare(metadata !{float** %3}, metadata !203), !dbg !204
  store i32 %incx, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !205), !dbg !202
  store float* %sy, float** %5, align 8
  call void @llvm.dbg.declare(metadata !{float** %5}, metadata !206), !dbg !204
  store i32 %incy, i32* %6, align 4
  call void @llvm.dbg.declare(metadata !{i32* %6}, metadata !207), !dbg !202
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !208), !dbg !209
  call void @llvm.dbg.declare(metadata !{float* %stemp}, metadata !210), !dbg !211
  store float 0.000000e+00, float* %stemp, align 4, !dbg !211
  %7 = load i32* %2, align 4, !dbg !212
  %8 = icmp slt i32 %7, 1, !dbg !212
  br i1 %8, label %9, label %12, !dbg !212

; <label>:9                                       ; preds = %0
  %10 = load float* %stemp, align 4, !dbg !212
  %11 = fpext float %10 to double, !dbg !212
  store double %11, double* %1, !dbg !212
  br label %126, !dbg !212

; <label>:12                                      ; preds = %0
  %13 = load i32* %4, align 4, !dbg !214
  %14 = load i32* %6, align 4, !dbg !214
  %15 = icmp eq i32 %13, %14, !dbg !214
  br i1 %15, label %16, label %73, !dbg !214

; <label>:16                                      ; preds = %12
  %17 = load i32* %4, align 4, !dbg !216
  %18 = icmp eq i32 %17, 1, !dbg !216
  br i1 %18, label %19, label %42, !dbg !216

; <label>:19                                      ; preds = %16
  store i32 0, i32* %i, align 4, !dbg !219
  br label %20, !dbg !219

; <label>:20                                      ; preds = %32, %19
  %21 = load i32* %i, align 4, !dbg !219
  %22 = load i32* %2, align 4, !dbg !219
  %23 = icmp slt i32 %21, %22, !dbg !219
  br i1 %23, label %24, label %39, !dbg !219

; <label>:24                                      ; preds = %20
  %25 = load float** %3, align 8, !dbg !222
  %26 = load float* %25, align 4, !dbg !222
  %27 = load float** %5, align 8, !dbg !222
  %28 = load float* %27, align 4, !dbg !222
  %29 = fmul float %26, %28, !dbg !222
  %30 = load float* %stemp, align 4, !dbg !222
  %31 = fadd float %30, %29, !dbg !222
  store float %31, float* %stemp, align 4, !dbg !222
  br label %32, !dbg !222

; <label>:32                                      ; preds = %24
  %33 = load i32* %i, align 4, !dbg !219
  %34 = add nsw i32 %33, 1, !dbg !219
  store i32 %34, i32* %i, align 4, !dbg !219
  %35 = load float** %3, align 8, !dbg !219
  %36 = getelementptr inbounds float* %35, i32 1, !dbg !219
  store float* %36, float** %3, align 8, !dbg !219
  %37 = load float** %5, align 8, !dbg !219
  %38 = getelementptr inbounds float* %37, i32 1, !dbg !219
  store float* %38, float** %5, align 8, !dbg !219
  br label %20, !dbg !219

; <label>:39                                      ; preds = %20
  %40 = load float* %stemp, align 4, !dbg !223
  %41 = fpext float %40 to double, !dbg !223
  store double %41, double* %1, !dbg !223
  br label %126, !dbg !223

; <label>:42                                      ; preds = %16
  %43 = load i32* %4, align 4, !dbg !224
  %44 = icmp sgt i32 %43, 0, !dbg !224
  br i1 %44, label %45, label %72, !dbg !224

; <label>:45                                      ; preds = %42
  store i32 0, i32* %i, align 4, !dbg !226
  br label %46, !dbg !226

; <label>:46                                      ; preds = %58, %45
  %47 = load i32* %i, align 4, !dbg !226
  %48 = load i32* %2, align 4, !dbg !226
  %49 = icmp slt i32 %47, %48, !dbg !226
  br i1 %49, label %50, label %69, !dbg !226

; <label>:50                                      ; preds = %46
  %51 = load float** %3, align 8, !dbg !229
  %52 = load float* %51, align 4, !dbg !229
  %53 = load float** %5, align 8, !dbg !229
  %54 = load float* %53, align 4, !dbg !229
  %55 = fmul float %52, %54, !dbg !229
  %56 = load float* %stemp, align 4, !dbg !229
  %57 = fadd float %56, %55, !dbg !229
  store float %57, float* %stemp, align 4, !dbg !229
  br label %58, !dbg !229

; <label>:58                                      ; preds = %50
  %59 = load i32* %i, align 4, !dbg !226
  %60 = add nsw i32 %59, 1, !dbg !226
  store i32 %60, i32* %i, align 4, !dbg !226
  %61 = load i32* %4, align 4, !dbg !226
  %62 = load float** %3, align 8, !dbg !226
  %63 = sext i32 %61 to i64, !dbg !226
  %64 = getelementptr inbounds float* %62, i64 %63, !dbg !226
  store float* %64, float** %3, align 8, !dbg !226
  %65 = load i32* %4, align 4, !dbg !226
  %66 = load float** %5, align 8, !dbg !226
  %67 = sext i32 %65 to i64, !dbg !226
  %68 = getelementptr inbounds float* %66, i64 %67, !dbg !226
  store float* %68, float** %5, align 8, !dbg !226
  br label %46, !dbg !226

; <label>:69                                      ; preds = %46
  %70 = load float* %stemp, align 4, !dbg !230
  %71 = fpext float %70 to double, !dbg !230
  store double %71, double* %1, !dbg !230
  br label %126, !dbg !230

; <label>:72                                      ; preds = %42
  br label %73, !dbg !231

; <label>:73                                      ; preds = %72, %12
  %74 = load i32* %4, align 4, !dbg !232
  %75 = icmp slt i32 %74, 0, !dbg !232
  br i1 %75, label %76, label %86, !dbg !232

; <label>:76                                      ; preds = %73
  %77 = load i32* %2, align 4, !dbg !232
  %78 = sub nsw i32 0, %77, !dbg !232
  %79 = add nsw i32 %78, 1, !dbg !232
  %80 = load i32* %4, align 4, !dbg !232
  %81 = mul nsw i32 %79, %80, !dbg !232
  %82 = add nsw i32 %81, 1, !dbg !232
  %83 = load float** %3, align 8, !dbg !232
  %84 = sext i32 %82 to i64, !dbg !232
  %85 = getelementptr inbounds float* %83, i64 %84, !dbg !232
  store float* %85, float** %3, align 8, !dbg !232
  br label %86, !dbg !232

; <label>:86                                      ; preds = %76, %73
  %87 = load i32* %6, align 4, !dbg !234
  %88 = icmp slt i32 %87, 0, !dbg !234
  br i1 %88, label %89, label %99, !dbg !234

; <label>:89                                      ; preds = %86
  %90 = load i32* %2, align 4, !dbg !234
  %91 = sub nsw i32 0, %90, !dbg !234
  %92 = add nsw i32 %91, 1, !dbg !234
  %93 = load i32* %6, align 4, !dbg !234
  %94 = mul nsw i32 %92, %93, !dbg !234
  %95 = add nsw i32 %94, 1, !dbg !234
  %96 = load float** %5, align 8, !dbg !234
  %97 = sext i32 %95 to i64, !dbg !234
  %98 = getelementptr inbounds float* %96, i64 %97, !dbg !234
  store float* %98, float** %5, align 8, !dbg !234
  br label %99, !dbg !234

; <label>:99                                      ; preds = %89, %86
  store i32 0, i32* %i, align 4, !dbg !236
  br label %100, !dbg !236

; <label>:100                                     ; preds = %112, %99
  %101 = load i32* %i, align 4, !dbg !236
  %102 = load i32* %2, align 4, !dbg !236
  %103 = icmp slt i32 %101, %102, !dbg !236
  br i1 %103, label %104, label %123, !dbg !236

; <label>:104                                     ; preds = %100
  %105 = load float** %3, align 8, !dbg !238
  %106 = load float* %105, align 4, !dbg !238
  %107 = load float** %5, align 8, !dbg !238
  %108 = load float* %107, align 4, !dbg !238
  %109 = fmul float %106, %108, !dbg !238
  %110 = load float* %stemp, align 4, !dbg !238
  %111 = fadd float %110, %109, !dbg !238
  store float %111, float* %stemp, align 4, !dbg !238
  br label %112, !dbg !238

; <label>:112                                     ; preds = %104
  %113 = load i32* %i, align 4, !dbg !236
  %114 = add nsw i32 %113, 1, !dbg !236
  store i32 %114, i32* %i, align 4, !dbg !236
  %115 = load i32* %4, align 4, !dbg !236
  %116 = load float** %3, align 8, !dbg !236
  %117 = sext i32 %115 to i64, !dbg !236
  %118 = getelementptr inbounds float* %116, i64 %117, !dbg !236
  store float* %118, float** %3, align 8, !dbg !236
  %119 = load i32* %6, align 4, !dbg !236
  %120 = load float** %5, align 8, !dbg !236
  %121 = sext i32 %119 to i64, !dbg !236
  %122 = getelementptr inbounds float* %120, i64 %121, !dbg !236
  store float* %122, float** %5, align 8, !dbg !236
  br label %100, !dbg !236

; <label>:123                                     ; preds = %100
  %124 = load float* %stemp, align 4, !dbg !239
  %125 = fpext float %124 to double, !dbg !239
  store double %125, double* %1, !dbg !239
  br label %126, !dbg !239

; <label>:126                                     ; preds = %123, %69, %39, %9
  %127 = load double* %1, !dbg !240
  ret double %127, !dbg !240
}

; Function Attrs: nounwind uwtable
define double @snrm2(i32 %n, float* %sx, i32 %incx) #0 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %phase = alloca i32, align 4
  %sum = alloca double, align 8
  %cutlo = alloca double, align 8
  %cuthi = alloca double, align 8
  %hitst = alloca double, align 8
  %xmax = alloca float, align 4
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !241), !dbg !242
  store float* %sx, float** %3, align 8
  call void @llvm.dbg.declare(metadata !{float** %3}, metadata !243), !dbg !244
  store i32 %incx, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !245), !dbg !242
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !246), !dbg !247
  call void @llvm.dbg.declare(metadata !{i32* %phase}, metadata !248), !dbg !249
  store i32 3, i32* %phase, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata !{double* %sum}, metadata !250), !dbg !251
  store double 0.000000e+00, double* %sum, align 8, !dbg !251
  call void @llvm.dbg.declare(metadata !{double* %cutlo}, metadata !252), !dbg !251
  call void @llvm.dbg.declare(metadata !{double* %cuthi}, metadata !253), !dbg !251
  call void @llvm.dbg.declare(metadata !{double* %hitst}, metadata !254), !dbg !251
  call void @llvm.dbg.declare(metadata !{float* %xmax}, metadata !255), !dbg !256
  %5 = load i32* %2, align 4, !dbg !257
  %6 = icmp slt i32 %5, 1, !dbg !257
  br i1 %6, label %10, label %7, !dbg !257

; <label>:7                                       ; preds = %0
  %8 = load i32* %4, align 4, !dbg !257
  %9 = icmp slt i32 %8, 1, !dbg !257
  br i1 %9, label %10, label %12, !dbg !257

; <label>:10                                      ; preds = %7, %0
  %11 = load double* %sum, align 8, !dbg !257
  store double %11, double* %1, !dbg !257
  br label %331, !dbg !257

; <label>:12                                      ; preds = %7
  %13 = call double @r1mach(), !dbg !259
  %14 = fdiv double 1.000000e-45, %13, !dbg !259
  %15 = call double @sqrt(double %14) #3, !dbg !259
  store double %15, double* %cutlo, align 8, !dbg !259
  %16 = call double @sqrt(double 1.000000e+38) #3, !dbg !260
  store double %16, double* %cuthi, align 8, !dbg !260
  %17 = load double* %cuthi, align 8, !dbg !261
  %18 = load i32* %2, align 4, !dbg !261
  %19 = sitofp i32 %18 to double, !dbg !261
  %20 = fdiv double %17, %19, !dbg !261
  store double %20, double* %hitst, align 8, !dbg !261
  store i32 0, i32* %i, align 4, !dbg !262
  br label %21, !dbg !263

; <label>:21                                      ; preds = %32, %12
  %22 = load i32* %i, align 4, !dbg !263
  %23 = load i32* %2, align 4, !dbg !263
  %24 = icmp slt i32 %22, %23, !dbg !263
  br i1 %24, label %25, label %30, !dbg !263

; <label>:25                                      ; preds = %21
  %26 = load float** %3, align 8, !dbg !263
  %27 = load float* %26, align 4, !dbg !263
  %28 = fpext float %27 to double, !dbg !263
  %29 = fcmp oeq double %28, 0.000000e+00, !dbg !263
  br label %30

; <label>:30                                      ; preds = %25, %21
  %31 = phi i1 [ false, %21 ], [ %29, %25 ]
  br i1 %31, label %32, label %39

; <label>:32                                      ; preds = %30
  %33 = load i32* %i, align 4, !dbg !264
  %34 = add nsw i32 %33, 1, !dbg !264
  store i32 %34, i32* %i, align 4, !dbg !264
  %35 = load i32* %4, align 4, !dbg !266
  %36 = load float** %3, align 8, !dbg !266
  %37 = sext i32 %35 to i64, !dbg !266
  %38 = getelementptr inbounds float* %36, i64 %37, !dbg !266
  store float* %38, float** %3, align 8, !dbg !266
  br label %21, !dbg !267

; <label>:39                                      ; preds = %30
  %40 = load i32* %i, align 4, !dbg !268
  %41 = load i32* %2, align 4, !dbg !268
  %42 = icmp sge i32 %40, %41, !dbg !268
  br i1 %42, label %43, label %45, !dbg !268

; <label>:43                                      ; preds = %39
  %44 = load double* %sum, align 8, !dbg !268
  store double %44, double* %1, !dbg !268
  br label %331, !dbg !268

; <label>:45                                      ; preds = %39
  br label %46, !dbg !268

; <label>:46                                      ; preds = %149, %45
  %47 = load float** %3, align 8, !dbg !270
  %48 = load float* %47, align 4, !dbg !270
  %49 = fpext float %48 to double, !dbg !270
  %50 = fcmp ogt double %49, 0.000000e+00, !dbg !270
  br i1 %50, label %51, label %54, !dbg !270

; <label>:51                                      ; preds = %46
  %52 = load float** %3, align 8, !dbg !270
  %53 = load float* %52, align 4, !dbg !270
  br label %58, !dbg !270

; <label>:54                                      ; preds = %46
  %55 = load float** %3, align 8, !dbg !270
  %56 = load float* %55, align 4, !dbg !270
  %57 = fsub float -0.000000e+00, %56, !dbg !270
  br label %58, !dbg !270

; <label>:58                                      ; preds = %54, %51
  %59 = phi float [ %53, %51 ], [ %57, %54 ], !dbg !270
  %60 = fpext float %59 to double, !dbg !270
  %61 = load double* %cutlo, align 8, !dbg !270
  %62 = fcmp ogt double %60, %61, !dbg !270
  br i1 %62, label %63, label %106, !dbg !270

; <label>:63                                      ; preds = %58
  br label %64, !dbg !272

; <label>:64                                      ; preds = %95, %63
  %65 = load i32* %i, align 4, !dbg !272
  %66 = load i32* %2, align 4, !dbg !272
  %67 = icmp slt i32 %65, %66, !dbg !272
  br i1 %67, label %68, label %102, !dbg !272

; <label>:68                                      ; preds = %64
  %69 = load float** %3, align 8, !dbg !275
  %70 = load float* %69, align 4, !dbg !275
  %71 = fpext float %70 to double, !dbg !275
  %72 = fcmp ogt double %71, 0.000000e+00, !dbg !275
  br i1 %72, label %73, label %76, !dbg !275

; <label>:73                                      ; preds = %68
  %74 = load float** %3, align 8, !dbg !275
  %75 = load float* %74, align 4, !dbg !275
  br label %80, !dbg !275

; <label>:76                                      ; preds = %68
  %77 = load float** %3, align 8, !dbg !275
  %78 = load float* %77, align 4, !dbg !275
  %79 = fsub float -0.000000e+00, %78, !dbg !275
  br label %80, !dbg !275

; <label>:80                                      ; preds = %76, %73
  %81 = phi float [ %75, %73 ], [ %79, %76 ], !dbg !275
  %82 = fpext float %81 to double, !dbg !275
  %83 = load double* %hitst, align 8, !dbg !275
  %84 = fcmp ogt double %82, %83, !dbg !275
  br i1 %84, label %85, label %86, !dbg !275

; <label>:85                                      ; preds = %80
  br label %227, !dbg !275

; <label>:86                                      ; preds = %80
  %87 = load float** %3, align 8, !dbg !278
  %88 = load float* %87, align 4, !dbg !278
  %89 = load float** %3, align 8, !dbg !278
  %90 = load float* %89, align 4, !dbg !278
  %91 = fmul float %88, %90, !dbg !278
  %92 = fpext float %91 to double, !dbg !278
  %93 = load double* %sum, align 8, !dbg !278
  %94 = fadd double %93, %92, !dbg !278
  store double %94, double* %sum, align 8, !dbg !278
  br label %95, !dbg !279

; <label>:95                                      ; preds = %86
  %96 = load i32* %i, align 4, !dbg !272
  %97 = add nsw i32 %96, 1, !dbg !272
  store i32 %97, i32* %i, align 4, !dbg !272
  %98 = load i32* %4, align 4, !dbg !272
  %99 = load float** %3, align 8, !dbg !272
  %100 = sext i32 %98 to i64, !dbg !272
  %101 = getelementptr inbounds float* %99, i64 %100, !dbg !272
  store float* %101, float** %3, align 8, !dbg !272
  br label %64, !dbg !272

; <label>:102                                     ; preds = %64
  %103 = load double* %sum, align 8, !dbg !280
  %104 = call double @sqrt(double %103) #3, !dbg !280
  store double %104, double* %sum, align 8, !dbg !280
  %105 = load double* %sum, align 8, !dbg !281
  store double %105, double* %1, !dbg !281
  br label %331, !dbg !281

; <label>:106                                     ; preds = %58
  %107 = load float** %3, align 8, !dbg !282
  %108 = load float* %107, align 4, !dbg !282
  %109 = fpext float %108 to double, !dbg !282
  %110 = fcmp ogt double %109, 0.000000e+00, !dbg !282
  br i1 %110, label %111, label %114, !dbg !282

; <label>:111                                     ; preds = %106
  %112 = load float** %3, align 8, !dbg !282
  %113 = load float* %112, align 4, !dbg !282
  br label %118, !dbg !282

; <label>:114                                     ; preds = %106
  %115 = load float** %3, align 8, !dbg !282
  %116 = load float* %115, align 4, !dbg !282
  %117 = fsub float -0.000000e+00, %116, !dbg !282
  br label %118, !dbg !282

; <label>:118                                     ; preds = %114, %111
  %119 = phi float [ %113, %111 ], [ %117, %114 ], !dbg !282
  store float %119, float* %xmax, align 4, !dbg !282
  %120 = load i32* %4, align 4, !dbg !284
  %121 = load float** %3, align 8, !dbg !284
  %122 = sext i32 %120 to i64, !dbg !284
  %123 = getelementptr inbounds float* %121, i64 %122, !dbg !284
  store float* %123, float** %3, align 8, !dbg !284
  %124 = load i32* %i, align 4, !dbg !285
  %125 = add nsw i32 %124, 1, !dbg !285
  store i32 %125, i32* %i, align 4, !dbg !285
  %126 = load double* %sum, align 8, !dbg !286
  %127 = fadd double %126, 1.000000e+00, !dbg !286
  store double %127, double* %sum, align 8, !dbg !286
  br label %128, !dbg !287

; <label>:128                                     ; preds = %214, %118
  %129 = load i32* %i, align 4, !dbg !287
  %130 = load i32* %2, align 4, !dbg !287
  %131 = icmp slt i32 %129, %130, !dbg !287
  br i1 %131, label %132, label %221, !dbg !287

; <label>:132                                     ; preds = %128
  %133 = load float** %3, align 8, !dbg !289
  %134 = load float* %133, align 4, !dbg !289
  %135 = fpext float %134 to double, !dbg !289
  %136 = fcmp ogt double %135, 0.000000e+00, !dbg !289
  br i1 %136, label %137, label %140, !dbg !289

; <label>:137                                     ; preds = %132
  %138 = load float** %3, align 8, !dbg !289
  %139 = load float* %138, align 4, !dbg !289
  br label %144, !dbg !289

; <label>:140                                     ; preds = %132
  %141 = load float** %3, align 8, !dbg !289
  %142 = load float* %141, align 4, !dbg !289
  %143 = fsub float -0.000000e+00, %142, !dbg !289
  br label %144, !dbg !289

; <label>:144                                     ; preds = %140, %137
  %145 = phi float [ %139, %137 ], [ %143, %140 ], !dbg !289
  %146 = fpext float %145 to double, !dbg !289
  %147 = load double* %cutlo, align 8, !dbg !289
  %148 = fcmp ogt double %146, %147, !dbg !289
  br i1 %148, label %149, label %157, !dbg !289

; <label>:149                                     ; preds = %144
  %150 = load double* %sum, align 8, !dbg !292
  %151 = load float* %xmax, align 4, !dbg !292
  %152 = fpext float %151 to double, !dbg !292
  %153 = fmul double %150, %152, !dbg !292
  %154 = load float* %xmax, align 4, !dbg !292
  %155 = fpext float %154 to double, !dbg !292
  %156 = fmul double %153, %155, !dbg !292
  store double %156, double* %sum, align 8, !dbg !292
  br label %46, !dbg !294

; <label>:157                                     ; preds = %144
  %158 = load float** %3, align 8, !dbg !295
  %159 = load float* %158, align 4, !dbg !295
  %160 = fpext float %159 to double, !dbg !295
  %161 = fcmp ogt double %160, 0.000000e+00, !dbg !295
  br i1 %161, label %162, label %165, !dbg !295

; <label>:162                                     ; preds = %157
  %163 = load float** %3, align 8, !dbg !295
  %164 = load float* %163, align 4, !dbg !295
  br label %169, !dbg !295

; <label>:165                                     ; preds = %157
  %166 = load float** %3, align 8, !dbg !295
  %167 = load float* %166, align 4, !dbg !295
  %168 = fsub float -0.000000e+00, %167, !dbg !295
  br label %169, !dbg !295

; <label>:169                                     ; preds = %165, %162
  %170 = phi float [ %164, %162 ], [ %168, %165 ], !dbg !295
  %171 = load float* %xmax, align 4, !dbg !295
  %172 = fcmp ogt float %170, %171, !dbg !295
  br i1 %172, label %173, label %201, !dbg !295

; <label>:173                                     ; preds = %169
  %174 = load double* %sum, align 8, !dbg !297
  %175 = load float* %xmax, align 4, !dbg !297
  %176 = load float** %3, align 8, !dbg !297
  %177 = load float* %176, align 4, !dbg !297
  %178 = fdiv float %175, %177, !dbg !297
  %179 = fpext float %178 to double, !dbg !297
  %180 = fmul double %174, %179, !dbg !297
  %181 = load float* %xmax, align 4, !dbg !297
  %182 = load float** %3, align 8, !dbg !297
  %183 = load float* %182, align 4, !dbg !297
  %184 = fdiv float %181, %183, !dbg !297
  %185 = fpext float %184 to double, !dbg !297
  %186 = fmul double %180, %185, !dbg !297
  %187 = fadd double 1.000000e+00, %186, !dbg !297
  store double %187, double* %sum, align 8, !dbg !297
  %188 = load float** %3, align 8, !dbg !299
  %189 = load float* %188, align 4, !dbg !299
  %190 = fpext float %189 to double, !dbg !299
  %191 = fcmp ogt double %190, 0.000000e+00, !dbg !299
  br i1 %191, label %192, label %195, !dbg !299

; <label>:192                                     ; preds = %173
  %193 = load float** %3, align 8, !dbg !299
  %194 = load float* %193, align 4, !dbg !299
  br label %199, !dbg !299

; <label>:195                                     ; preds = %173
  %196 = load float** %3, align 8, !dbg !299
  %197 = load float* %196, align 4, !dbg !299
  %198 = fsub float -0.000000e+00, %197, !dbg !299
  br label %199, !dbg !299

; <label>:199                                     ; preds = %195, %192
  %200 = phi float [ %194, %192 ], [ %198, %195 ], !dbg !299
  store float %200, float* %xmax, align 4, !dbg !299
  br label %214, !dbg !300

; <label>:201                                     ; preds = %169
  %202 = load float** %3, align 8, !dbg !301
  %203 = load float* %202, align 4, !dbg !301
  %204 = load float* %xmax, align 4, !dbg !301
  %205 = fdiv float %203, %204, !dbg !301
  %206 = load float** %3, align 8, !dbg !301
  %207 = load float* %206, align 4, !dbg !301
  %208 = load float* %xmax, align 4, !dbg !301
  %209 = fdiv float %207, %208, !dbg !301
  %210 = fmul float %205, %209, !dbg !301
  %211 = fpext float %210 to double, !dbg !301
  %212 = load double* %sum, align 8, !dbg !301
  %213 = fadd double %212, %211, !dbg !301
  store double %213, double* %sum, align 8, !dbg !301
  br label %214, !dbg !302

; <label>:214                                     ; preds = %201, %199
  %215 = load i32* %i, align 4, !dbg !287
  %216 = add nsw i32 %215, 1, !dbg !287
  store i32 %216, i32* %i, align 4, !dbg !287
  %217 = load i32* %4, align 4, !dbg !287
  %218 = load float** %3, align 8, !dbg !287
  %219 = sext i32 %217 to i64, !dbg !287
  %220 = getelementptr inbounds float* %218, i64 %219, !dbg !287
  store float* %220, float** %3, align 8, !dbg !287
  br label %128, !dbg !287

; <label>:221                                     ; preds = %128
  %222 = load float* %xmax, align 4, !dbg !303
  %223 = fpext float %222 to double, !dbg !303
  %224 = load double* %sum, align 8, !dbg !303
  %225 = call double @sqrt(double %224) #3, !dbg !303
  %226 = fmul double %223, %225, !dbg !303
  store double %226, double* %1, !dbg !303
  br label %331, !dbg !303

; <label>:227                                     ; preds = %85
  %228 = load double* %sum, align 8, !dbg !304
  %229 = load float** %3, align 8, !dbg !304
  %230 = load float* %229, align 4, !dbg !304
  %231 = fpext float %230 to double, !dbg !304
  %232 = fdiv double %228, %231, !dbg !304
  %233 = load float** %3, align 8, !dbg !304
  %234 = load float* %233, align 4, !dbg !304
  %235 = fpext float %234 to double, !dbg !304
  %236 = fdiv double %232, %235, !dbg !304
  %237 = fadd double 1.000000e+00, %236, !dbg !304
  store double %237, double* %sum, align 8, !dbg !304
  %238 = load float** %3, align 8, !dbg !305
  %239 = load float* %238, align 4, !dbg !305
  %240 = fpext float %239 to double, !dbg !305
  %241 = fcmp ogt double %240, 0.000000e+00, !dbg !305
  br i1 %241, label %242, label %245, !dbg !305

; <label>:242                                     ; preds = %227
  %243 = load float** %3, align 8, !dbg !305
  %244 = load float* %243, align 4, !dbg !305
  br label %249, !dbg !305

; <label>:245                                     ; preds = %227
  %246 = load float** %3, align 8, !dbg !305
  %247 = load float* %246, align 4, !dbg !305
  %248 = fsub float -0.000000e+00, %247, !dbg !305
  br label %249, !dbg !305

; <label>:249                                     ; preds = %245, %242
  %250 = phi float [ %244, %242 ], [ %248, %245 ], !dbg !305
  store float %250, float* %xmax, align 4, !dbg !305
  %251 = load i32* %4, align 4, !dbg !306
  %252 = load float** %3, align 8, !dbg !306
  %253 = sext i32 %251 to i64, !dbg !306
  %254 = getelementptr inbounds float* %252, i64 %253, !dbg !306
  store float* %254, float** %3, align 8, !dbg !306
  %255 = load i32* %i, align 4, !dbg !307
  %256 = add nsw i32 %255, 1, !dbg !307
  store i32 %256, i32* %i, align 4, !dbg !307
  br label %257, !dbg !308

; <label>:257                                     ; preds = %318, %249
  %258 = load i32* %i, align 4, !dbg !308
  %259 = load i32* %2, align 4, !dbg !308
  %260 = icmp slt i32 %258, %259, !dbg !308
  br i1 %260, label %261, label %325, !dbg !308

; <label>:261                                     ; preds = %257
  %262 = load float** %3, align 8, !dbg !310
  %263 = load float* %262, align 4, !dbg !310
  %264 = fpext float %263 to double, !dbg !310
  %265 = fcmp ogt double %264, 0.000000e+00, !dbg !310
  br i1 %265, label %266, label %269, !dbg !310

; <label>:266                                     ; preds = %261
  %267 = load float** %3, align 8, !dbg !310
  %268 = load float* %267, align 4, !dbg !310
  br label %273, !dbg !310

; <label>:269                                     ; preds = %261
  %270 = load float** %3, align 8, !dbg !310
  %271 = load float* %270, align 4, !dbg !310
  %272 = fsub float -0.000000e+00, %271, !dbg !310
  br label %273, !dbg !310

; <label>:273                                     ; preds = %269, %266
  %274 = phi float [ %268, %266 ], [ %272, %269 ], !dbg !310
  %275 = load float* %xmax, align 4, !dbg !310
  %276 = fcmp ogt float %274, %275, !dbg !310
  br i1 %276, label %277, label %305, !dbg !310

; <label>:277                                     ; preds = %273
  %278 = load double* %sum, align 8, !dbg !313
  %279 = load float* %xmax, align 4, !dbg !313
  %280 = load float** %3, align 8, !dbg !313
  %281 = load float* %280, align 4, !dbg !313
  %282 = fdiv float %279, %281, !dbg !313
  %283 = fpext float %282 to double, !dbg !313
  %284 = fmul double %278, %283, !dbg !313
  %285 = load float* %xmax, align 4, !dbg !313
  %286 = load float** %3, align 8, !dbg !313
  %287 = load float* %286, align 4, !dbg !313
  %288 = fdiv float %285, %287, !dbg !313
  %289 = fpext float %288 to double, !dbg !313
  %290 = fmul double %284, %289, !dbg !313
  %291 = fadd double 1.000000e+00, %290, !dbg !313
  store double %291, double* %sum, align 8, !dbg !313
  %292 = load float** %3, align 8, !dbg !315
  %293 = load float* %292, align 4, !dbg !315
  %294 = fpext float %293 to double, !dbg !315
  %295 = fcmp ogt double %294, 0.000000e+00, !dbg !315
  br i1 %295, label %296, label %299, !dbg !315

; <label>:296                                     ; preds = %277
  %297 = load float** %3, align 8, !dbg !315
  %298 = load float* %297, align 4, !dbg !315
  br label %303, !dbg !315

; <label>:299                                     ; preds = %277
  %300 = load float** %3, align 8, !dbg !315
  %301 = load float* %300, align 4, !dbg !315
  %302 = fsub float -0.000000e+00, %301, !dbg !315
  br label %303, !dbg !315

; <label>:303                                     ; preds = %299, %296
  %304 = phi float [ %298, %296 ], [ %302, %299 ], !dbg !315
  store float %304, float* %xmax, align 4, !dbg !315
  br label %318, !dbg !316

; <label>:305                                     ; preds = %273
  %306 = load float** %3, align 8, !dbg !317
  %307 = load float* %306, align 4, !dbg !317
  %308 = load float* %xmax, align 4, !dbg !317
  %309 = fdiv float %307, %308, !dbg !317
  %310 = load float** %3, align 8, !dbg !317
  %311 = load float* %310, align 4, !dbg !317
  %312 = load float* %xmax, align 4, !dbg !317
  %313 = fdiv float %311, %312, !dbg !317
  %314 = fmul float %309, %313, !dbg !317
  %315 = fpext float %314 to double, !dbg !317
  %316 = load double* %sum, align 8, !dbg !317
  %317 = fadd double %316, %315, !dbg !317
  store double %317, double* %sum, align 8, !dbg !317
  br label %318, !dbg !318

; <label>:318                                     ; preds = %305, %303
  %319 = load i32* %i, align 4, !dbg !308
  %320 = add nsw i32 %319, 1, !dbg !308
  store i32 %320, i32* %i, align 4, !dbg !308
  %321 = load i32* %4, align 4, !dbg !308
  %322 = load float** %3, align 8, !dbg !308
  %323 = sext i32 %321 to i64, !dbg !308
  %324 = getelementptr inbounds float* %322, i64 %323, !dbg !308
  store float* %324, float** %3, align 8, !dbg !308
  br label %257, !dbg !308

; <label>:325                                     ; preds = %257
  %326 = load float* %xmax, align 4, !dbg !319
  %327 = fpext float %326 to double, !dbg !319
  %328 = load double* %sum, align 8, !dbg !319
  %329 = call double @sqrt(double %328) #3, !dbg !319
  %330 = fmul double %327, %329, !dbg !319
  store double %330, double* %1, !dbg !319
  br label %331, !dbg !319

; <label>:331                                     ; preds = %325, %221, %102, %43, %10
  %332 = load double* %1, !dbg !320
  ret double %332, !dbg !320
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @r1mach() #0 {
  %u = alloca float, align 4
  %comp = alloca float, align 4
  call void @llvm.dbg.declare(metadata !{float* %u}, metadata !321), !dbg !322
  store float 1.000000e+00, float* %u, align 4, !dbg !322
  call void @llvm.dbg.declare(metadata !{float* %comp}, metadata !323), !dbg !322
  br label %1, !dbg !324

; <label>:1                                       ; preds = %10, %0
  %2 = load float* %u, align 4, !dbg !325
  %3 = fpext float %2 to double, !dbg !325
  %4 = fmul double %3, 5.000000e-01, !dbg !325
  %5 = fptrunc double %4 to float, !dbg !325
  store float %5, float* %u, align 4, !dbg !325
  %6 = load float* %u, align 4, !dbg !327
  %7 = fpext float %6 to double, !dbg !327
  %8 = fadd double 1.000000e+00, %7, !dbg !327
  %9 = fptrunc double %8 to float, !dbg !327
  store float %9, float* %comp, align 4, !dbg !327
  br label %10, !dbg !328

; <label>:10                                      ; preds = %1
  %11 = load float* %comp, align 4, !dbg !328
  %12 = fpext float %11 to double, !dbg !328
  %13 = fcmp une double %12, 1.000000e+00, !dbg !328
  br i1 %13, label %1, label %14, !dbg !328

; <label>:14                                      ; preds = %10
  %15 = load float* %u, align 4, !dbg !329
  %16 = fpext float %15 to double, !dbg !329
  %17 = fmul double %16, 2.000000e+00, !dbg !329
  ret double %17, !dbg !329
}

; Function Attrs: nounwind uwtable
define i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %mt = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !330), !dbg !331
  store i32 %a, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !332), !dbg !331
  store i32 %b, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !333), !dbg !331
  store i32 %c, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !334), !dbg !331
  store i32 %d, i32* %6, align 4
  call void @llvm.dbg.declare(metadata !{i32* %6}, metadata !335), !dbg !331
  store i32 %e, i32* %7, align 4
  call void @llvm.dbg.declare(metadata !{i32* %7}, metadata !336), !dbg !331
  store i32 %f, i32* %8, align 4
  call void @llvm.dbg.declare(metadata !{i32* %8}, metadata !337), !dbg !331
  store i32 %g, i32* %9, align 4
  call void @llvm.dbg.declare(metadata !{i32* %9}, metadata !338), !dbg !331
  store i32 %h, i32* %10, align 4
  call void @llvm.dbg.declare(metadata !{i32* %10}, metadata !339), !dbg !331
  store i32 %i, i32* %11, align 4
  call void @llvm.dbg.declare(metadata !{i32* %11}, metadata !340), !dbg !331
  store i32 %j, i32* %12, align 4
  call void @llvm.dbg.declare(metadata !{i32* %12}, metadata !341), !dbg !331
  store i32 %k, i32* %13, align 4
  call void @llvm.dbg.declare(metadata !{i32* %13}, metadata !342), !dbg !331
  store i32 %l, i32* %14, align 4
  call void @llvm.dbg.declare(metadata !{i32* %14}, metadata !343), !dbg !331
  store i32 %m, i32* %15, align 4
  call void @llvm.dbg.declare(metadata !{i32* %15}, metadata !344), !dbg !331
  store i32 %o, i32* %16, align 4
  call void @llvm.dbg.declare(metadata !{i32* %16}, metadata !345), !dbg !331
  store i32 %p, i32* %17, align 4
  call void @llvm.dbg.declare(metadata !{i32* %17}, metadata !346), !dbg !331
  call void @llvm.dbg.declare(metadata !{i32* %mt}, metadata !347), !dbg !348
  %18 = load i32* %2, align 4, !dbg !349
  %19 = icmp slt i32 %18, 1, !dbg !349
  br i1 %19, label %23, label %20, !dbg !349

; <label>:20                                      ; preds = %0
  %21 = load i32* %2, align 4, !dbg !349
  %22 = icmp sgt i32 %21, 15, !dbg !349
  br i1 %22, label %23, label %24, !dbg !349

; <label>:23                                      ; preds = %20, %0
  store i32 -1, i32* %1, !dbg !349
  br label %181, !dbg !349

; <label>:24                                      ; preds = %20
  %25 = load i32* %3, align 4, !dbg !351
  store i32 %25, i32* %mt, align 4, !dbg !351
  %26 = load i32* %2, align 4, !dbg !352
  %27 = icmp eq i32 %26, 1, !dbg !352
  br i1 %27, label %28, label %30, !dbg !352

; <label>:28                                      ; preds = %24
  %29 = load i32* %mt, align 4, !dbg !352
  store i32 %29, i32* %1, !dbg !352
  br label %181, !dbg !352

; <label>:30                                      ; preds = %24
  %31 = load i32* %mt, align 4, !dbg !354
  %32 = load i32* %4, align 4, !dbg !354
  %33 = icmp sgt i32 %31, %32, !dbg !354
  br i1 %33, label %34, label %36, !dbg !354

; <label>:34                                      ; preds = %30
  %35 = load i32* %4, align 4, !dbg !354
  store i32 %35, i32* %mt, align 4, !dbg !354
  br label %36, !dbg !354

; <label>:36                                      ; preds = %34, %30
  %37 = load i32* %2, align 4, !dbg !356
  %38 = icmp eq i32 %37, 2, !dbg !356
  br i1 %38, label %39, label %41, !dbg !356

; <label>:39                                      ; preds = %36
  %40 = load i32* %mt, align 4, !dbg !356
  store i32 %40, i32* %1, !dbg !356
  br label %181, !dbg !356

; <label>:41                                      ; preds = %36
  %42 = load i32* %mt, align 4, !dbg !358
  %43 = load i32* %5, align 4, !dbg !358
  %44 = icmp sgt i32 %42, %43, !dbg !358
  br i1 %44, label %45, label %47, !dbg !358

; <label>:45                                      ; preds = %41
  %46 = load i32* %5, align 4, !dbg !358
  store i32 %46, i32* %mt, align 4, !dbg !358
  br label %47, !dbg !358

; <label>:47                                      ; preds = %45, %41
  %48 = load i32* %2, align 4, !dbg !360
  %49 = icmp eq i32 %48, 3, !dbg !360
  br i1 %49, label %50, label %52, !dbg !360

; <label>:50                                      ; preds = %47
  %51 = load i32* %mt, align 4, !dbg !360
  store i32 %51, i32* %1, !dbg !360
  br label %181, !dbg !360

; <label>:52                                      ; preds = %47
  %53 = load i32* %mt, align 4, !dbg !362
  %54 = load i32* %6, align 4, !dbg !362
  %55 = icmp sgt i32 %53, %54, !dbg !362
  br i1 %55, label %56, label %58, !dbg !362

; <label>:56                                      ; preds = %52
  %57 = load i32* %6, align 4, !dbg !362
  store i32 %57, i32* %mt, align 4, !dbg !362
  br label %58, !dbg !362

; <label>:58                                      ; preds = %56, %52
  %59 = load i32* %2, align 4, !dbg !364
  %60 = icmp eq i32 %59, 4, !dbg !364
  br i1 %60, label %61, label %63, !dbg !364

; <label>:61                                      ; preds = %58
  %62 = load i32* %mt, align 4, !dbg !364
  store i32 %62, i32* %1, !dbg !364
  br label %181, !dbg !364

; <label>:63                                      ; preds = %58
  %64 = load i32* %mt, align 4, !dbg !366
  %65 = load i32* %7, align 4, !dbg !366
  %66 = icmp sgt i32 %64, %65, !dbg !366
  br i1 %66, label %67, label %69, !dbg !366

; <label>:67                                      ; preds = %63
  %68 = load i32* %7, align 4, !dbg !366
  store i32 %68, i32* %mt, align 4, !dbg !366
  br label %69, !dbg !366

; <label>:69                                      ; preds = %67, %63
  %70 = load i32* %2, align 4, !dbg !368
  %71 = icmp eq i32 %70, 5, !dbg !368
  br i1 %71, label %72, label %74, !dbg !368

; <label>:72                                      ; preds = %69
  %73 = load i32* %mt, align 4, !dbg !368
  store i32 %73, i32* %1, !dbg !368
  br label %181, !dbg !368

; <label>:74                                      ; preds = %69
  %75 = load i32* %mt, align 4, !dbg !370
  %76 = load i32* %8, align 4, !dbg !370
  %77 = icmp sgt i32 %75, %76, !dbg !370
  br i1 %77, label %78, label %80, !dbg !370

; <label>:78                                      ; preds = %74
  %79 = load i32* %8, align 4, !dbg !370
  store i32 %79, i32* %mt, align 4, !dbg !370
  br label %80, !dbg !370

; <label>:80                                      ; preds = %78, %74
  %81 = load i32* %2, align 4, !dbg !372
  %82 = icmp eq i32 %81, 6, !dbg !372
  br i1 %82, label %83, label %85, !dbg !372

; <label>:83                                      ; preds = %80
  %84 = load i32* %mt, align 4, !dbg !372
  store i32 %84, i32* %1, !dbg !372
  br label %181, !dbg !372

; <label>:85                                      ; preds = %80
  %86 = load i32* %mt, align 4, !dbg !374
  %87 = load i32* %9, align 4, !dbg !374
  %88 = icmp sgt i32 %86, %87, !dbg !374
  br i1 %88, label %89, label %91, !dbg !374

; <label>:89                                      ; preds = %85
  %90 = load i32* %9, align 4, !dbg !374
  store i32 %90, i32* %mt, align 4, !dbg !374
  br label %91, !dbg !374

; <label>:91                                      ; preds = %89, %85
  %92 = load i32* %2, align 4, !dbg !376
  %93 = icmp eq i32 %92, 7, !dbg !376
  br i1 %93, label %94, label %96, !dbg !376

; <label>:94                                      ; preds = %91
  %95 = load i32* %mt, align 4, !dbg !376
  store i32 %95, i32* %1, !dbg !376
  br label %181, !dbg !376

; <label>:96                                      ; preds = %91
  %97 = load i32* %mt, align 4, !dbg !378
  %98 = load i32* %10, align 4, !dbg !378
  %99 = icmp sgt i32 %97, %98, !dbg !378
  br i1 %99, label %100, label %102, !dbg !378

; <label>:100                                     ; preds = %96
  %101 = load i32* %10, align 4, !dbg !378
  store i32 %101, i32* %mt, align 4, !dbg !378
  br label %102, !dbg !378

; <label>:102                                     ; preds = %100, %96
  %103 = load i32* %2, align 4, !dbg !380
  %104 = icmp eq i32 %103, 8, !dbg !380
  br i1 %104, label %105, label %107, !dbg !380

; <label>:105                                     ; preds = %102
  %106 = load i32* %mt, align 4, !dbg !380
  store i32 %106, i32* %1, !dbg !380
  br label %181, !dbg !380

; <label>:107                                     ; preds = %102
  %108 = load i32* %mt, align 4, !dbg !382
  %109 = load i32* %11, align 4, !dbg !382
  %110 = icmp sgt i32 %108, %109, !dbg !382
  br i1 %110, label %111, label %113, !dbg !382

; <label>:111                                     ; preds = %107
  %112 = load i32* %11, align 4, !dbg !382
  store i32 %112, i32* %mt, align 4, !dbg !382
  br label %113, !dbg !382

; <label>:113                                     ; preds = %111, %107
  %114 = load i32* %2, align 4, !dbg !384
  %115 = icmp eq i32 %114, 9, !dbg !384
  br i1 %115, label %116, label %118, !dbg !384

; <label>:116                                     ; preds = %113
  %117 = load i32* %mt, align 4, !dbg !384
  store i32 %117, i32* %1, !dbg !384
  br label %181, !dbg !384

; <label>:118                                     ; preds = %113
  %119 = load i32* %mt, align 4, !dbg !386
  %120 = load i32* %12, align 4, !dbg !386
  %121 = icmp sgt i32 %119, %120, !dbg !386
  br i1 %121, label %122, label %124, !dbg !386

; <label>:122                                     ; preds = %118
  %123 = load i32* %12, align 4, !dbg !386
  store i32 %123, i32* %mt, align 4, !dbg !386
  br label %124, !dbg !386

; <label>:124                                     ; preds = %122, %118
  %125 = load i32* %2, align 4, !dbg !388
  %126 = icmp eq i32 %125, 10, !dbg !388
  br i1 %126, label %127, label %129, !dbg !388

; <label>:127                                     ; preds = %124
  %128 = load i32* %mt, align 4, !dbg !388
  store i32 %128, i32* %1, !dbg !388
  br label %181, !dbg !388

; <label>:129                                     ; preds = %124
  %130 = load i32* %mt, align 4, !dbg !390
  %131 = load i32* %13, align 4, !dbg !390
  %132 = icmp sgt i32 %130, %131, !dbg !390
  br i1 %132, label %133, label %135, !dbg !390

; <label>:133                                     ; preds = %129
  %134 = load i32* %13, align 4, !dbg !390
  store i32 %134, i32* %mt, align 4, !dbg !390
  br label %135, !dbg !390

; <label>:135                                     ; preds = %133, %129
  %136 = load i32* %2, align 4, !dbg !392
  %137 = icmp eq i32 %136, 11, !dbg !392
  br i1 %137, label %138, label %140, !dbg !392

; <label>:138                                     ; preds = %135
  %139 = load i32* %mt, align 4, !dbg !392
  store i32 %139, i32* %1, !dbg !392
  br label %181, !dbg !392

; <label>:140                                     ; preds = %135
  %141 = load i32* %mt, align 4, !dbg !394
  %142 = load i32* %14, align 4, !dbg !394
  %143 = icmp sgt i32 %141, %142, !dbg !394
  br i1 %143, label %144, label %146, !dbg !394

; <label>:144                                     ; preds = %140
  %145 = load i32* %14, align 4, !dbg !394
  store i32 %145, i32* %mt, align 4, !dbg !394
  br label %146, !dbg !394

; <label>:146                                     ; preds = %144, %140
  %147 = load i32* %2, align 4, !dbg !396
  %148 = icmp eq i32 %147, 12, !dbg !396
  br i1 %148, label %149, label %151, !dbg !396

; <label>:149                                     ; preds = %146
  %150 = load i32* %mt, align 4, !dbg !396
  store i32 %150, i32* %1, !dbg !396
  br label %181, !dbg !396

; <label>:151                                     ; preds = %146
  %152 = load i32* %mt, align 4, !dbg !398
  %153 = load i32* %15, align 4, !dbg !398
  %154 = icmp sgt i32 %152, %153, !dbg !398
  br i1 %154, label %155, label %157, !dbg !398

; <label>:155                                     ; preds = %151
  %156 = load i32* %15, align 4, !dbg !398
  store i32 %156, i32* %mt, align 4, !dbg !398
  br label %157, !dbg !398

; <label>:157                                     ; preds = %155, %151
  %158 = load i32* %2, align 4, !dbg !400
  %159 = icmp eq i32 %158, 13, !dbg !400
  br i1 %159, label %160, label %162, !dbg !400

; <label>:160                                     ; preds = %157
  %161 = load i32* %mt, align 4, !dbg !400
  store i32 %161, i32* %1, !dbg !400
  br label %181, !dbg !400

; <label>:162                                     ; preds = %157
  %163 = load i32* %mt, align 4, !dbg !402
  %164 = load i32* %16, align 4, !dbg !402
  %165 = icmp sgt i32 %163, %164, !dbg !402
  br i1 %165, label %166, label %168, !dbg !402

; <label>:166                                     ; preds = %162
  %167 = load i32* %16, align 4, !dbg !402
  store i32 %167, i32* %mt, align 4, !dbg !402
  br label %168, !dbg !402

; <label>:168                                     ; preds = %166, %162
  %169 = load i32* %2, align 4, !dbg !404
  %170 = icmp eq i32 %169, 14, !dbg !404
  br i1 %170, label %171, label %173, !dbg !404

; <label>:171                                     ; preds = %168
  %172 = load i32* %mt, align 4, !dbg !404
  store i32 %172, i32* %1, !dbg !404
  br label %181, !dbg !404

; <label>:173                                     ; preds = %168
  %174 = load i32* %mt, align 4, !dbg !406
  %175 = load i32* %17, align 4, !dbg !406
  %176 = icmp sgt i32 %174, %175, !dbg !406
  br i1 %176, label %177, label %179, !dbg !406

; <label>:177                                     ; preds = %173
  %178 = load i32* %17, align 4, !dbg !406
  store i32 %178, i32* %mt, align 4, !dbg !406
  br label %179, !dbg !406

; <label>:179                                     ; preds = %177, %173
  %180 = load i32* %mt, align 4, !dbg !408
  store i32 %180, i32* %1, !dbg !408
  br label %181, !dbg !408

; <label>:181                                     ; preds = %179, %171, %160, %149, %138, %127, %116, %105, %94, %83, %72, %61, %50, %39, %28, %23
  %182 = load i32* %1, !dbg !409
  ret i32 %182, !dbg !409
}

; Function Attrs: nounwind uwtable
define i32 @sscal(i32 %n, double, float* %sx, i32 %incx) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  %5 = alloca float*, align 8
  %6 = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !410), !dbg !411
  store float %sa, float* %4, align 4
  call void @llvm.dbg.declare(metadata !{float* %4}, metadata !412), !dbg !413
  store float* %sx, float** %5, align 8
  call void @llvm.dbg.declare(metadata !{float** %5}, metadata !414), !dbg !413
  store i32 %incx, i32* %6, align 4
  call void @llvm.dbg.declare(metadata !{i32* %6}, metadata !415), !dbg !411
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !416), !dbg !417
  %7 = load i32* %3, align 4, !dbg !418
  %8 = icmp slt i32 %7, 1, !dbg !418
  br i1 %8, label %9, label %10, !dbg !418

; <label>:9                                       ; preds = %1
  store i32 1, i32* %2, !dbg !418
  br label %59, !dbg !418

; <label>:10                                      ; preds = %1
  %11 = load i32* %6, align 4, !dbg !420
  %12 = icmp ne i32 %11, 1, !dbg !420
  br i1 %12, label %13, label %43, !dbg !420

; <label>:13                                      ; preds = %10
  %14 = load i32* %6, align 4, !dbg !422
  %15 = icmp slt i32 %14, 0, !dbg !422
  br i1 %15, label %16, label %25, !dbg !422

; <label>:16                                      ; preds = %13
  %17 = load i32* %3, align 4, !dbg !422
  %18 = sub nsw i32 0, %17, !dbg !422
  %19 = add nsw i32 %18, 1, !dbg !422
  %20 = load i32* %6, align 4, !dbg !422
  %21 = mul nsw i32 %19, %20, !dbg !422
  %22 = load float** %5, align 8, !dbg !422
  %23 = sext i32 %21 to i64, !dbg !422
  %24 = getelementptr inbounds float* %22, i64 %23, !dbg !422
  store float* %24, float** %5, align 8, !dbg !422
  br label %25, !dbg !422

; <label>:25                                      ; preds = %16, %13
  store i32 0, i32* %i, align 4, !dbg !425
  br label %26, !dbg !425

; <label>:26                                      ; preds = %35, %25
  %27 = load i32* %i, align 4, !dbg !425
  %28 = load i32* %3, align 4, !dbg !425
  %29 = icmp slt i32 %27, %28, !dbg !425
  br i1 %29, label %30, label %42, !dbg !425

; <label>:30                                      ; preds = %26
  %31 = load float* %4, align 4, !dbg !427
  %32 = load float** %5, align 8, !dbg !427
  %33 = load float* %32, align 4, !dbg !427
  %34 = fmul float %33, %31, !dbg !427
  store float %34, float* %32, align 4, !dbg !427
  br label %35, !dbg !427

; <label>:35                                      ; preds = %30
  %36 = load i32* %i, align 4, !dbg !425
  %37 = add nsw i32 %36, 1, !dbg !425
  store i32 %37, i32* %i, align 4, !dbg !425
  %38 = load i32* %6, align 4, !dbg !425
  %39 = load float** %5, align 8, !dbg !425
  %40 = sext i32 %38 to i64, !dbg !425
  %41 = getelementptr inbounds float* %39, i64 %40, !dbg !425
  store float* %41, float** %5, align 8, !dbg !425
  br label %26, !dbg !425

; <label>:42                                      ; preds = %26
  store i32 0, i32* %2, !dbg !428
  br label %59, !dbg !428

; <label>:43                                      ; preds = %10
  store i32 0, i32* %i, align 4, !dbg !429
  br label %44, !dbg !429

; <label>:44                                      ; preds = %53, %43
  %45 = load i32* %i, align 4, !dbg !429
  %46 = load i32* %3, align 4, !dbg !429
  %47 = icmp slt i32 %45, %46, !dbg !429
  br i1 %47, label %48, label %58, !dbg !429

; <label>:48                                      ; preds = %44
  %49 = load float* %4, align 4, !dbg !431
  %50 = load float** %5, align 8, !dbg !431
  %51 = load float* %50, align 4, !dbg !431
  %52 = fmul float %51, %49, !dbg !431
  store float %52, float* %50, align 4, !dbg !431
  br label %53, !dbg !431

; <label>:53                                      ; preds = %48
  %54 = load i32* %i, align 4, !dbg !429
  %55 = add nsw i32 %54, 1, !dbg !429
  store i32 %55, i32* %i, align 4, !dbg !429
  %56 = load float** %5, align 8, !dbg !429
  %57 = getelementptr inbounds float* %56, i32 1, !dbg !429
  store float* %57, float** %5, align 8, !dbg !429
  br label %44, !dbg !429

; <label>:58                                      ; preds = %44
  store i32 0, i32* %2, !dbg !432
  br label %59, !dbg !432

; <label>:59                                      ; preds = %58, %42, %9
  %60 = load i32* %2, !dbg !433
  ret i32 %60, !dbg !433
}

; Function Attrs: nounwind uwtable
define void @vexopy(i32 %n, float* %v, float* %x, float* %y, i32 %itype) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !434), !dbg !435
  store float* %v, float** %2, align 8
  call void @llvm.dbg.declare(metadata !{float** %2}, metadata !436), !dbg !437
  store float* %x, float** %3, align 8
  call void @llvm.dbg.declare(metadata !{float** %3}, metadata !438), !dbg !437
  store float* %y, float** %4, align 8
  call void @llvm.dbg.declare(metadata !{float** %4}, metadata !439), !dbg !437
  store i32 %itype, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !440), !dbg !435
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !441), !dbg !442
  %6 = load i32* %1, align 4, !dbg !443
  %7 = icmp slt i32 %6, 1, !dbg !443
  br i1 %7, label %8, label %9, !dbg !443

; <label>:8                                       ; preds = %0
  br label %56, !dbg !443

; <label>:9                                       ; preds = %0
  %10 = load i32* %5, align 4, !dbg !445
  %11 = icmp eq i32 %10, 1, !dbg !445
  br i1 %11, label %12, label %34, !dbg !445

; <label>:12                                      ; preds = %9
  store i32 0, i32* %i, align 4, !dbg !447
  br label %13, !dbg !447

; <label>:13                                      ; preds = %24, %12
  %14 = load i32* %i, align 4, !dbg !447
  %15 = load i32* %1, align 4, !dbg !447
  %16 = icmp slt i32 %14, %15, !dbg !447
  br i1 %16, label %17, label %33, !dbg !447

; <label>:17                                      ; preds = %13
  %18 = load float** %3, align 8, !dbg !449
  %19 = load float* %18, align 4, !dbg !449
  %20 = load float** %4, align 8, !dbg !449
  %21 = load float* %20, align 4, !dbg !449
  %22 = fadd float %19, %21, !dbg !449
  %23 = load float** %2, align 8, !dbg !449
  store float %22, float* %23, align 4, !dbg !449
  br label %24, !dbg !449

; <label>:24                                      ; preds = %17
  %25 = load i32* %i, align 4, !dbg !447
  %26 = add nsw i32 %25, 1, !dbg !447
  store i32 %26, i32* %i, align 4, !dbg !447
  %27 = load float** %3, align 8, !dbg !447
  %28 = getelementptr inbounds float* %27, i32 1, !dbg !447
  store float* %28, float** %3, align 8, !dbg !447
  %29 = load float** %4, align 8, !dbg !447
  %30 = getelementptr inbounds float* %29, i32 1, !dbg !447
  store float* %30, float** %4, align 8, !dbg !447
  %31 = load float** %2, align 8, !dbg !447
  %32 = getelementptr inbounds float* %31, i32 1, !dbg !447
  store float* %32, float** %2, align 8, !dbg !447
  br label %13, !dbg !447

; <label>:33                                      ; preds = %13
  br label %56, !dbg !449

; <label>:34                                      ; preds = %9
  store i32 0, i32* %i, align 4, !dbg !450
  br label %35, !dbg !450

; <label>:35                                      ; preds = %46, %34
  %36 = load i32* %i, align 4, !dbg !450
  %37 = load i32* %1, align 4, !dbg !450
  %38 = icmp slt i32 %36, %37, !dbg !450
  br i1 %38, label %39, label %55, !dbg !450

; <label>:39                                      ; preds = %35
  %40 = load float** %3, align 8, !dbg !452
  %41 = load float* %40, align 4, !dbg !452
  %42 = load float** %4, align 8, !dbg !452
  %43 = load float* %42, align 4, !dbg !452
  %44 = fsub float %41, %43, !dbg !452
  %45 = load float** %2, align 8, !dbg !452
  store float %44, float* %45, align 4, !dbg !452
  br label %46, !dbg !452

; <label>:46                                      ; preds = %39
  %47 = load i32* %i, align 4, !dbg !450
  %48 = add nsw i32 %47, 1, !dbg !450
  store i32 %48, i32* %i, align 4, !dbg !450
  %49 = load float** %3, align 8, !dbg !450
  %50 = getelementptr inbounds float* %49, i32 1, !dbg !450
  store float* %50, float** %3, align 8, !dbg !450
  %51 = load float** %4, align 8, !dbg !450
  %52 = getelementptr inbounds float* %51, i32 1, !dbg !450
  store float* %52, float** %4, align 8, !dbg !450
  %53 = load float** %2, align 8, !dbg !450
  %54 = getelementptr inbounds float* %53, i32 1, !dbg !450
  store float* %54, float** %2, align 8, !dbg !450
  br label %35, !dbg !450

; <label>:55                                      ; preds = %35
  br label %56

; <label>:56                                      ; preds = %8, %55, %33
  ret void, !dbg !453
}

; Function Attrs: nounwind uwtable
define void @vfill(i32 %n, float* %v, double) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float*, align 8
  %4 = alloca float, align 4
  %i = alloca i32, align 4
  %val = fptrunc double %0 to float
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !454), !dbg !455
  store float* %v, float** %3, align 8
  call void @llvm.dbg.declare(metadata !{float** %3}, metadata !456), !dbg !457
  store float %val, float* %4, align 4
  call void @llvm.dbg.declare(metadata !{float* %4}, metadata !458), !dbg !457
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !459), !dbg !460
  %5 = load i32* %2, align 4, !dbg !461
  %6 = icmp slt i32 %5, 1, !dbg !461
  br i1 %6, label %7, label %8, !dbg !461

; <label>:7                                       ; preds = %1
  br label %21, !dbg !461

; <label>:8                                       ; preds = %1
  store i32 0, i32* %i, align 4, !dbg !463
  br label %9, !dbg !463

; <label>:9                                       ; preds = %16, %8
  %10 = load i32* %i, align 4, !dbg !463
  %11 = load i32* %2, align 4, !dbg !463
  %12 = icmp slt i32 %10, %11, !dbg !463
  br i1 %12, label %13, label %21, !dbg !463

; <label>:13                                      ; preds = %9
  %14 = load float* %4, align 4, !dbg !465
  %15 = load float** %3, align 8, !dbg !465
  store float %14, float* %15, align 4, !dbg !465
  br label %16, !dbg !465

; <label>:16                                      ; preds = %13
  %17 = load i32* %i, align 4, !dbg !463
  %18 = add nsw i32 %17, 1, !dbg !463
  store i32 %18, i32* %i, align 4, !dbg !463
  %19 = load float** %3, align 8, !dbg !463
  %20 = getelementptr inbounds float* %19, i32 1, !dbg !463
  store float* %20, float** %3, align 8, !dbg !463
  br label %9, !dbg !463

; <label>:21                                      ; preds = %7, %9
  ret void, !dbg !466
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!40, !41}
!llvm.ident = !{!42}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c] [DW_LANG_C99]
!1 = metadata !{metadata !"blas.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !14, metadata !15, metadata !18, metadata !22, metadata !25, metadata !28, metadata !31, metadata !34, metadata !37}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"isamax", metadata !"isamax", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, float*, i32)* @isamax, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 36] [isamax]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!10 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"saxpy", metadata !"saxpy", metadata !"", i32 69, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, double, float*, i32, float*, i32)* @saxpy, null, null, metadata !2, i32 87} ; [ DW_TAG_subprogram ] [line 69] [def] [scope 87] [saxpy]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{null, metadata !8, metadata !10, metadata !9, metadata !8, metadata !9, metadata !8}
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"saxpyx", metadata !"saxpyx", metadata !"", i32 112, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, double, float*, i32, float*, i32)* @saxpyx, null, null, metadata !2, i32 130} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 130] [saxpyx]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"scopy", metadata !"scopy", metadata !"", i32 155, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, float*, i32, float*, i32)* @scopy, null, null, metadata !2, i32 171} ; [ DW_TAG_subprogram ] [line 155] [def] [scope 171] [scopy]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !8, metadata !9, metadata !8, metadata !9, metadata !8}
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sdot", metadata !"sdot", metadata !"", i32 196, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, double (i32, float*, i32, float*, i32)* @sdot, null, null, metadata !2, i32 214} ; [ DW_TAG_subprogram ] [line 196] [def] [scope 214] [sdot]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !21, metadata !8, metadata !9, metadata !8, metadata !9, metadata !8}
!21 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"snrm2", metadata !"snrm2", metadata !"", i32 241, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, double (i32, float*, i32)* @snrm2, null, null, metadata !2, i32 262} ; [ DW_TAG_subprogram ] [line 241] [def] [scope 262] [snrm2]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !21, metadata !8, metadata !9, metadata !8}
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"r1mach", metadata !"r1mach", metadata !"", i32 327, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, double ()* @r1mach, null, null, metadata !2, i32 334} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 334] [r1mach]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !21}
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"min0", metadata !"min0", metadata !"", i32 346, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)* @min0, null, null, metadata !2, i32 359} ; [ DW_TAG_subprogram ] [line 346] [def] [scope 359] [min0]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8}
!31 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sscal", metadata !"sscal", metadata !"", i32 408, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, double, float*, i32)* @sscal, null, null, metadata !2, i32 424} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 424] [sscal]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !8, metadata !8, metadata !10, metadata !9, metadata !8}
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"vexopy", metadata !"vexopy", metadata !"", i32 441, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, float*, float*, float*, i32)* @vexopy, null, null, metadata !2, i32 459} ; [ DW_TAG_subprogram ] [line 441] [def] [scope 459] [vexopy]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{null, metadata !8, metadata !9, metadata !9, metadata !9, metadata !8}
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"vfill", metadata !"vfill", metadata !"", i32 471, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, float*, double)* @vfill, null, null, metadata !2, i32 481} ; [ DW_TAG_subprogram ] [line 471] [def] [scope 481] [vfill]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !8, metadata !9, metadata !10}
!40 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!41 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!42 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!43 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 25]
!44 = metadata !{i32 25, i32 0, metadata !4, null}
!45 = metadata !{i32 786689, metadata !4, metadata !"sx", metadata !5, i32 33554456, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 24]
!46 = metadata !{i32 24, i32 0, metadata !4, null}
!47 = metadata !{i32 786689, metadata !4, metadata !"incx", metadata !5, i32 50331673, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 25]
!48 = metadata !{i32 786688, metadata !4, metadata !"smax", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [smax] [line 37]
!49 = metadata !{i32 37, i32 0, metadata !4, null}
!50 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 38]
!51 = metadata !{i32 38, i32 0, metadata !4, null}
!52 = metadata !{i32 786688, metadata !4, metadata !"istmp", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [istmp] [line 38]
!53 = metadata !{i32 43, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !4, i32 43, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!55 = metadata !{i32 44, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !4, i32 44, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!57 = metadata !{i32 46, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !59, i32 46, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!59 = metadata !{i32 786443, metadata !1, metadata !56, i32 44, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!60 = metadata !{i32 47, i32 0, metadata !59, null}
!61 = metadata !{i32 48, i32 0, metadata !59, null}
!62 = metadata !{i32 49, i32 0, metadata !59, null}
!63 = metadata !{i32 50, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !59, i32 50, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!65 = metadata !{i32 51, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !64, i32 51, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!67 = metadata !{i32 52, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !66, i32 51, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!69 = metadata !{i32 53, i32 0, metadata !68, null}
!70 = metadata !{i32 54, i32 0, metadata !68, null}
!71 = metadata !{i32 54, i32 0, metadata !66, null}
!72 = metadata !{i32 55, i32 0, metadata !59, null}
!73 = metadata !{i32 58, i32 0, metadata !4, null} ; [ DW_TAG_imported_module ]
!74 = metadata !{i32 59, i32 0, metadata !4, null}
!75 = metadata !{i32 60, i32 0, metadata !4, null}
!76 = metadata !{i32 61, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !4, i32 61, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!78 = metadata !{i32 62, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !77, i32 62, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!80 = metadata !{i32 63, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !79, i32 62, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!82 = metadata !{i32 64, i32 0, metadata !81, null}
!83 = metadata !{i32 65, i32 0, metadata !81, null}
!84 = metadata !{i32 65, i32 0, metadata !79, null}
!85 = metadata !{i32 66, i32 0, metadata !4, null}
!86 = metadata !{i32 67, i32 0, metadata !4, null}
!87 = metadata !{i32 786689, metadata !11, metadata !"n", metadata !5, i32 16777287, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 71]
!88 = metadata !{i32 71, i32 0, metadata !11, null}
!89 = metadata !{i32 786689, metadata !11, metadata !"sa", metadata !5, i32 33554502, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sa] [line 70]
!90 = metadata !{i32 70, i32 0, metadata !11, null}
!91 = metadata !{i32 786689, metadata !11, metadata !"sx", metadata !5, i32 50331718, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 70]
!92 = metadata !{i32 786689, metadata !11, metadata !"incx", metadata !5, i32 67108935, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 71]
!93 = metadata !{i32 786689, metadata !11, metadata !"sy", metadata !5, i32 83886150, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 70]
!94 = metadata !{i32 786689, metadata !11, metadata !"incy", metadata !5, i32 100663367, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 71]
!95 = metadata !{i32 786688, metadata !11, metadata !"i", metadata !5, i32 88, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 88]
!96 = metadata !{i32 88, i32 0, metadata !11, null}
!97 = metadata !{i32 90, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !11, i32 90, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!99 = metadata !{i32 91, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !11, i32 91, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!101 = metadata !{i32 92, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !103, i32 92, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!103 = metadata !{i32 786443, metadata !1, metadata !100, i32 91, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!104 = metadata !{i32 94, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !106, i32 94, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!106 = metadata !{i32 786443, metadata !1, metadata !102, i32 92, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!107 = metadata !{i32 95, i32 0, metadata !105, null}
!108 = metadata !{i32 96, i32 0, metadata !106, null}
!109 = metadata !{i32 98, i32 0, metadata !110, null}
!110 = metadata !{i32 786443, metadata !1, metadata !103, i32 98, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!111 = metadata !{i32 100, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !113, i32 100, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!113 = metadata !{i32 786443, metadata !1, metadata !110, i32 98, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!114 = metadata !{i32 101, i32 0, metadata !112, null}
!115 = metadata !{i32 102, i32 0, metadata !113, null}
!116 = metadata !{i32 104, i32 0, metadata !103, null}
!117 = metadata !{i32 106, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !11, i32 106, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!119 = metadata !{i32 107, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !11, i32 107, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!121 = metadata !{i32 108, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !11, i32 108, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!123 = metadata !{i32 109, i32 0, metadata !122, null}
!124 = metadata !{i32 110, i32 0, metadata !11, null}
!125 = metadata !{i32 786689, metadata !14, metadata !"n", metadata !5, i32 16777330, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 114]
!126 = metadata !{i32 114, i32 0, metadata !14, null}
!127 = metadata !{i32 786689, metadata !14, metadata !"sa", metadata !5, i32 33554545, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sa] [line 113]
!128 = metadata !{i32 113, i32 0, metadata !14, null}
!129 = metadata !{i32 786689, metadata !14, metadata !"sx", metadata !5, i32 50331761, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 113]
!130 = metadata !{i32 786689, metadata !14, metadata !"incx", metadata !5, i32 67108978, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 114]
!131 = metadata !{i32 786689, metadata !14, metadata !"sy", metadata !5, i32 83886193, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 113]
!132 = metadata !{i32 786689, metadata !14, metadata !"incy", metadata !5, i32 100663410, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 114]
!133 = metadata !{i32 786688, metadata !14, metadata !"i", metadata !5, i32 131, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 131]
!134 = metadata !{i32 131, i32 0, metadata !14, null}
!135 = metadata !{i32 133, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !14, i32 133, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!137 = metadata !{i32 134, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !14, i32 134, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!139 = metadata !{i32 135, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !141, i32 135, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!141 = metadata !{i32 786443, metadata !1, metadata !138, i32 134, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!142 = metadata !{i32 137, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !144, i32 137, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!144 = metadata !{i32 786443, metadata !1, metadata !140, i32 135, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!145 = metadata !{i32 138, i32 0, metadata !143, null}
!146 = metadata !{i32 139, i32 0, metadata !144, null}
!147 = metadata !{i32 141, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !141, i32 141, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!149 = metadata !{i32 143, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !151, i32 143, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!151 = metadata !{i32 786443, metadata !1, metadata !148, i32 141, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!152 = metadata !{i32 144, i32 0, metadata !150, null}
!153 = metadata !{i32 145, i32 0, metadata !151, null}
!154 = metadata !{i32 147, i32 0, metadata !141, null}
!155 = metadata !{i32 149, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !14, i32 149, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!157 = metadata !{i32 150, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !14, i32 150, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!159 = metadata !{i32 151, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !14, i32 151, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!161 = metadata !{i32 152, i32 0, metadata !160, null}
!162 = metadata !{i32 153, i32 0, metadata !14, null}
!163 = metadata !{i32 786689, metadata !15, metadata !"n", metadata !5, i32 16777373, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 157]
!164 = metadata !{i32 157, i32 0, metadata !15, null}
!165 = metadata !{i32 786689, metadata !15, metadata !"sx", metadata !5, i32 33554588, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 156]
!166 = metadata !{i32 156, i32 0, metadata !15, null}
!167 = metadata !{i32 786689, metadata !15, metadata !"incx", metadata !5, i32 50331805, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 157]
!168 = metadata !{i32 786689, metadata !15, metadata !"sy", metadata !5, i32 67109020, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 156]
!169 = metadata !{i32 786689, metadata !15, metadata !"incy", metadata !5, i32 83886237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 157]
!170 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 172, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 172]
!171 = metadata !{i32 172, i32 0, metadata !15, null}
!172 = metadata !{i32 174, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !15, i32 174, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!174 = metadata !{i32 175, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !15, i32 175, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!176 = metadata !{i32 176, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !178, i32 176, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!178 = metadata !{i32 786443, metadata !1, metadata !175, i32 175, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!179 = metadata !{i32 178, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !181, i32 178, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!181 = metadata !{i32 786443, metadata !1, metadata !177, i32 176, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!182 = metadata !{i32 179, i32 0, metadata !180, null}
!183 = metadata !{i32 180, i32 0, metadata !181, null}
!184 = metadata !{i32 182, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !178, i32 182, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!186 = metadata !{i32 184, i32 0, metadata !187, null}
!187 = metadata !{i32 786443, metadata !1, metadata !188, i32 184, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!188 = metadata !{i32 786443, metadata !1, metadata !185, i32 182, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!189 = metadata !{i32 185, i32 0, metadata !187, null}
!190 = metadata !{i32 186, i32 0, metadata !188, null}
!191 = metadata !{i32 188, i32 0, metadata !178, null}
!192 = metadata !{i32 190, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !15, i32 190, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!194 = metadata !{i32 191, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !15, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!196 = metadata !{i32 192, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !15, i32 192, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!198 = metadata !{i32 193, i32 0, metadata !197, null}
!199 = metadata !{i32 194, i32 0, metadata !15, null}
!200 = metadata !{i32 195, i32 0, metadata !15, null}
!201 = metadata !{i32 786689, metadata !18, metadata !"n", metadata !5, i32 16777414, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 198]
!202 = metadata !{i32 198, i32 0, metadata !18, null}
!203 = metadata !{i32 786689, metadata !18, metadata !"sx", metadata !5, i32 33554629, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 197]
!204 = metadata !{i32 197, i32 0, metadata !18, null}
!205 = metadata !{i32 786689, metadata !18, metadata !"incx", metadata !5, i32 50331846, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 198]
!206 = metadata !{i32 786689, metadata !18, metadata !"sy", metadata !5, i32 67109061, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 197]
!207 = metadata !{i32 786689, metadata !18, metadata !"incy", metadata !5, i32 83886278, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 198]
!208 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 215, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 215]
!209 = metadata !{i32 215, i32 0, metadata !18, null}
!210 = metadata !{i32 786688, metadata !18, metadata !"stemp", metadata !5, i32 216, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stemp] [line 216]
!211 = metadata !{i32 216, i32 0, metadata !18, null}
!212 = metadata !{i32 218, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !18, i32 218, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!214 = metadata !{i32 219, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !18, i32 219, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!216 = metadata !{i32 220, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !218, i32 220, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!218 = metadata !{i32 786443, metadata !1, metadata !215, i32 219, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!219 = metadata !{i32 222, i32 0, metadata !220, null}
!220 = metadata !{i32 786443, metadata !1, metadata !221, i32 222, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!221 = metadata !{i32 786443, metadata !1, metadata !217, i32 220, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!222 = metadata !{i32 223, i32 0, metadata !220, null}
!223 = metadata !{i32 224, i32 0, metadata !221, null}
!224 = metadata !{i32 226, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !218, i32 226, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!226 = metadata !{i32 228, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !228, i32 228, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!228 = metadata !{i32 786443, metadata !1, metadata !225, i32 226, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!229 = metadata !{i32 229, i32 0, metadata !227, null}
!230 = metadata !{i32 230, i32 0, metadata !228, null}
!231 = metadata !{i32 232, i32 0, metadata !218, null}
!232 = metadata !{i32 234, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !18, i32 234, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!234 = metadata !{i32 235, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !18, i32 235, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!236 = metadata !{i32 236, i32 0, metadata !237, null}
!237 = metadata !{i32 786443, metadata !1, metadata !18, i32 236, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!238 = metadata !{i32 237, i32 0, metadata !237, null}
!239 = metadata !{i32 238, i32 0, metadata !18, null}
!240 = metadata !{i32 239, i32 0, metadata !18, null}
!241 = metadata !{i32 786689, metadata !22, metadata !"n", metadata !5, i32 16777459, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 243]
!242 = metadata !{i32 243, i32 0, metadata !22, null}
!243 = metadata !{i32 786689, metadata !22, metadata !"sx", metadata !5, i32 33554674, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 242]
!244 = metadata !{i32 242, i32 0, metadata !22, null}
!245 = metadata !{i32 786689, metadata !22, metadata !"incx", metadata !5, i32 50331891, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 243]
!246 = metadata !{i32 786688, metadata !22, metadata !"i", metadata !5, i32 263, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 263]
!247 = metadata !{i32 263, i32 0, metadata !22, null}
!248 = metadata !{i32 786688, metadata !22, metadata !"phase", metadata !5, i32 264, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [phase] [line 264]
!249 = metadata !{i32 264, i32 0, metadata !22, null}
!250 = metadata !{i32 786688, metadata !22, metadata !"sum", metadata !5, i32 265, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 265]
!251 = metadata !{i32 265, i32 0, metadata !22, null}
!252 = metadata !{i32 786688, metadata !22, metadata !"cutlo", metadata !5, i32 265, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutlo] [line 265]
!253 = metadata !{i32 786688, metadata !22, metadata !"cuthi", metadata !5, i32 265, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cuthi] [line 265]
!254 = metadata !{i32 786688, metadata !22, metadata !"hitst", metadata !5, i32 265, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hitst] [line 265]
!255 = metadata !{i32 786688, metadata !22, metadata !"xmax", metadata !5, i32 266, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xmax] [line 266]
!256 = metadata !{i32 266, i32 0, metadata !22, null}
!257 = metadata !{i32 268, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !22, i32 268, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!259 = metadata !{i32 270, i32 0, metadata !22, null}
!260 = metadata !{i32 271, i32 0, metadata !22, null}
!261 = metadata !{i32 272, i32 0, metadata !22, null}
!262 = metadata !{i32 273, i32 0, metadata !22, null}
!263 = metadata !{i32 276, i32 0, metadata !22, null}
!264 = metadata !{i32 277, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !22, i32 276, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!266 = metadata !{i32 278, i32 0, metadata !265, null}
!267 = metadata !{i32 279, i32 0, metadata !265, null}
!268 = metadata !{i32 280, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !22, i32 280, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!270 = metadata !{i32 283, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !22, i32 283, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!272 = metadata !{i32 284, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !274, i32 284, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!274 = metadata !{i32 786443, metadata !1, metadata !271, i32 283, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!275 = metadata !{i32 285, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !277, i32 285, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!277 = metadata !{i32 786443, metadata !1, metadata !273, i32 284, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!278 = metadata !{i32 286, i32 0, metadata !277, null}
!279 = metadata !{i32 287, i32 0, metadata !277, null}
!280 = metadata !{i32 288, i32 0, metadata !274, null}
!281 = metadata !{i32 289, i32 0, metadata !274, null}
!282 = metadata !{i32 292, i32 0, metadata !283, null}
!283 = metadata !{i32 786443, metadata !1, metadata !271, i32 291, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!284 = metadata !{i32 293, i32 0, metadata !283, null}
!285 = metadata !{i32 294, i32 0, metadata !283, null}
!286 = metadata !{i32 295, i32 0, metadata !283, null}
!287 = metadata !{i32 296, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !283, i32 296, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!289 = metadata !{i32 297, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !291, i32 297, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!291 = metadata !{i32 786443, metadata !1, metadata !288, i32 296, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!292 = metadata !{i32 298, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !290, i32 297, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!294 = metadata !{i32 299, i32 0, metadata !293, null}
!295 = metadata !{i32 301, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !291, i32 301, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!297 = metadata !{i32 302, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !296, i32 301, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!299 = metadata !{i32 303, i32 0, metadata !298, null}
!300 = metadata !{i32 304, i32 0, metadata !298, null}
!301 = metadata !{i32 306, i32 0, metadata !291, null}
!302 = metadata !{i32 307, i32 0, metadata !291, null}
!303 = metadata !{i32 308, i32 0, metadata !283, null}
!304 = metadata !{i32 312, i32 0, metadata !22, null}
!305 = metadata !{i32 313, i32 0, metadata !22, null}
!306 = metadata !{i32 314, i32 0, metadata !22, null}
!307 = metadata !{i32 315, i32 0, metadata !22, null}
!308 = metadata !{i32 316, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !22, i32 316, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!310 = metadata !{i32 317, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !1, metadata !312, i32 317, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!312 = metadata !{i32 786443, metadata !1, metadata !309, i32 316, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!313 = metadata !{i32 318, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !311, i32 317, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!315 = metadata !{i32 319, i32 0, metadata !314, null}
!316 = metadata !{i32 320, i32 0, metadata !314, null}
!317 = metadata !{i32 322, i32 0, metadata !312, null}
!318 = metadata !{i32 323, i32 0, metadata !312, null}
!319 = metadata !{i32 324, i32 0, metadata !22, null}
!320 = metadata !{i32 325, i32 0, metadata !22, null}
!321 = metadata !{i32 786688, metadata !25, metadata !"u", metadata !5, i32 335, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 335]
!322 = metadata !{i32 335, i32 0, metadata !25, null}
!323 = metadata !{i32 786688, metadata !25, metadata !"comp", metadata !5, i32 335, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp] [line 335]
!324 = metadata !{i32 337, i32 0, metadata !25, null}
!325 = metadata !{i32 338, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !25, i32 337, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!327 = metadata !{i32 339, i32 0, metadata !326, null}
!328 = metadata !{i32 340, i32 0, metadata !326, null}
!329 = metadata !{i32 342, i32 0, metadata !25, null}
!330 = metadata !{i32 786689, metadata !28, metadata !"n", metadata !5, i32 16777574, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 358]
!331 = metadata !{i32 358, i32 0, metadata !28, null}
!332 = metadata !{i32 786689, metadata !28, metadata !"a", metadata !5, i32 33554790, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 358]
!333 = metadata !{i32 786689, metadata !28, metadata !"b", metadata !5, i32 50332006, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 358]
!334 = metadata !{i32 786689, metadata !28, metadata !"c", metadata !5, i32 67109222, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 358]
!335 = metadata !{i32 786689, metadata !28, metadata !"d", metadata !5, i32 83886438, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 358]
!336 = metadata !{i32 786689, metadata !28, metadata !"e", metadata !5, i32 100663654, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [e] [line 358]
!337 = metadata !{i32 786689, metadata !28, metadata !"f", metadata !5, i32 117440870, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 358]
!338 = metadata !{i32 786689, metadata !28, metadata !"g", metadata !5, i32 134218086, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [g] [line 358]
!339 = metadata !{i32 786689, metadata !28, metadata !"h", metadata !5, i32 150995302, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [h] [line 358]
!340 = metadata !{i32 786689, metadata !28, metadata !"i", metadata !5, i32 167772518, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 358]
!341 = metadata !{i32 786689, metadata !28, metadata !"j", metadata !5, i32 184549734, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 358]
!342 = metadata !{i32 786689, metadata !28, metadata !"k", metadata !5, i32 201326950, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 358]
!343 = metadata !{i32 786689, metadata !28, metadata !"l", metadata !5, i32 218104166, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 358]
!344 = metadata !{i32 786689, metadata !28, metadata !"m", metadata !5, i32 234881382, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 358]
!345 = metadata !{i32 786689, metadata !28, metadata !"o", metadata !5, i32 251658598, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [o] [line 358]
!346 = metadata !{i32 786689, metadata !28, metadata !"p", metadata !5, i32 268435814, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 358]
!347 = metadata !{i32 786688, metadata !28, metadata !"mt", metadata !5, i32 360, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mt] [line 360]
!348 = metadata !{i32 360, i32 0, metadata !28, null}
!349 = metadata !{i32 362, i32 0, metadata !350, null}
!350 = metadata !{i32 786443, metadata !1, metadata !28, i32 362, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!351 = metadata !{i32 363, i32 0, metadata !28, null}
!352 = metadata !{i32 364, i32 0, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !28, i32 364, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!354 = metadata !{i32 366, i32 0, metadata !355, null}
!355 = metadata !{i32 786443, metadata !1, metadata !28, i32 366, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!356 = metadata !{i32 367, i32 0, metadata !357, null}
!357 = metadata !{i32 786443, metadata !1, metadata !28, i32 367, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!358 = metadata !{i32 369, i32 0, metadata !359, null}
!359 = metadata !{i32 786443, metadata !1, metadata !28, i32 369, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!360 = metadata !{i32 370, i32 0, metadata !361, null}
!361 = metadata !{i32 786443, metadata !1, metadata !28, i32 370, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!362 = metadata !{i32 372, i32 0, metadata !363, null}
!363 = metadata !{i32 786443, metadata !1, metadata !28, i32 372, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!364 = metadata !{i32 373, i32 0, metadata !365, null}
!365 = metadata !{i32 786443, metadata !1, metadata !28, i32 373, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!366 = metadata !{i32 375, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !28, i32 375, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!368 = metadata !{i32 376, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !28, i32 376, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!370 = metadata !{i32 378, i32 0, metadata !371, null}
!371 = metadata !{i32 786443, metadata !1, metadata !28, i32 378, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!372 = metadata !{i32 379, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !28, i32 379, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!374 = metadata !{i32 381, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !28, i32 381, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!376 = metadata !{i32 382, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !28, i32 382, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!378 = metadata !{i32 384, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !28, i32 384, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!380 = metadata !{i32 385, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !1, metadata !28, i32 385, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!382 = metadata !{i32 387, i32 0, metadata !383, null}
!383 = metadata !{i32 786443, metadata !1, metadata !28, i32 387, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!384 = metadata !{i32 388, i32 0, metadata !385, null}
!385 = metadata !{i32 786443, metadata !1, metadata !28, i32 388, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!386 = metadata !{i32 390, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !28, i32 390, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!388 = metadata !{i32 391, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !28, i32 391, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!390 = metadata !{i32 393, i32 0, metadata !391, null}
!391 = metadata !{i32 786443, metadata !1, metadata !28, i32 393, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!392 = metadata !{i32 394, i32 0, metadata !393, null}
!393 = metadata !{i32 786443, metadata !1, metadata !28, i32 394, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!394 = metadata !{i32 396, i32 0, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !28, i32 396, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!396 = metadata !{i32 397, i32 0, metadata !397, null}
!397 = metadata !{i32 786443, metadata !1, metadata !28, i32 397, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!398 = metadata !{i32 399, i32 0, metadata !399, null}
!399 = metadata !{i32 786443, metadata !1, metadata !28, i32 399, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!400 = metadata !{i32 400, i32 0, metadata !401, null}
!401 = metadata !{i32 786443, metadata !1, metadata !28, i32 400, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!402 = metadata !{i32 402, i32 0, metadata !403, null}
!403 = metadata !{i32 786443, metadata !1, metadata !28, i32 402, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!404 = metadata !{i32 403, i32 0, metadata !405, null}
!405 = metadata !{i32 786443, metadata !1, metadata !28, i32 403, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!406 = metadata !{i32 405, i32 0, metadata !407, null}
!407 = metadata !{i32 786443, metadata !1, metadata !28, i32 405, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!408 = metadata !{i32 406, i32 0, metadata !28, null}
!409 = metadata !{i32 407, i32 0, metadata !28, null}
!410 = metadata !{i32 786689, metadata !31, metadata !"n", metadata !5, i32 16777625, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 409]
!411 = metadata !{i32 409, i32 0, metadata !31, null}
!412 = metadata !{i32 786689, metadata !31, metadata !"sa", metadata !5, i32 33554842, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sa] [line 410]
!413 = metadata !{i32 410, i32 0, metadata !31, null}
!414 = metadata !{i32 786689, metadata !31, metadata !"sx", metadata !5, i32 50332058, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 410]
!415 = metadata !{i32 786689, metadata !31, metadata !"incx", metadata !5, i32 67109273, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 409]
!416 = metadata !{i32 786688, metadata !31, metadata !"i", metadata !5, i32 425, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 425]
!417 = metadata !{i32 425, i32 0, metadata !31, null}
!418 = metadata !{i32 427, i32 0, metadata !419, null}
!419 = metadata !{i32 786443, metadata !1, metadata !31, i32 427, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!420 = metadata !{i32 430, i32 0, metadata !421, null}
!421 = metadata !{i32 786443, metadata !1, metadata !31, i32 430, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!422 = metadata !{i32 431, i32 0, metadata !423, null}
!423 = metadata !{i32 786443, metadata !1, metadata !424, i32 431, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!424 = metadata !{i32 786443, metadata !1, metadata !421, i32 430, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!425 = metadata !{i32 432, i32 0, metadata !426, null}
!426 = metadata !{i32 786443, metadata !1, metadata !424, i32 432, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!427 = metadata !{i32 433, i32 0, metadata !426, null}
!428 = metadata !{i32 434, i32 0, metadata !424, null}
!429 = metadata !{i32 437, i32 0, metadata !430, null}
!430 = metadata !{i32 786443, metadata !1, metadata !31, i32 437, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!431 = metadata !{i32 438, i32 0, metadata !430, null}
!432 = metadata !{i32 439, i32 0, metadata !31, null}
!433 = metadata !{i32 440, i32 0, metadata !31, null}
!434 = metadata !{i32 786689, metadata !34, metadata !"n", metadata !5, i32 16777658, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 442]
!435 = metadata !{i32 442, i32 0, metadata !34, null}
!436 = metadata !{i32 786689, metadata !34, metadata !"v", metadata !5, i32 33554875, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 443]
!437 = metadata !{i32 443, i32 0, metadata !34, null}
!438 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !5, i32 50332091, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 443]
!439 = metadata !{i32 786689, metadata !34, metadata !"y", metadata !5, i32 67109307, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 443]
!440 = metadata !{i32 786689, metadata !34, metadata !"itype", metadata !5, i32 83886522, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [itype] [line 442]
!441 = metadata !{i32 786688, metadata !34, metadata !"i", metadata !5, i32 460, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 460]
!442 = metadata !{i32 460, i32 0, metadata !34, null}
!443 = metadata !{i32 462, i32 0, metadata !444, null}
!444 = metadata !{i32 786443, metadata !1, metadata !34, i32 462, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!445 = metadata !{i32 464, i32 0, metadata !446, null}
!446 = metadata !{i32 786443, metadata !1, metadata !34, i32 464, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!447 = metadata !{i32 465, i32 0, metadata !448, null}
!448 = metadata !{i32 786443, metadata !1, metadata !446, i32 465, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!449 = metadata !{i32 466, i32 0, metadata !448, null}
!450 = metadata !{i32 468, i32 0, metadata !451, null}
!451 = metadata !{i32 786443, metadata !1, metadata !446, i32 468, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!452 = metadata !{i32 469, i32 0, metadata !451, null}
!453 = metadata !{i32 470, i32 0, metadata !34, null}
!454 = metadata !{i32 786689, metadata !37, metadata !"n", metadata !5, i32 16777688, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 472]
!455 = metadata !{i32 472, i32 0, metadata !37, null}
!456 = metadata !{i32 786689, metadata !37, metadata !"v", metadata !5, i32 33554905, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 473]
!457 = metadata !{i32 473, i32 0, metadata !37, null}
!458 = metadata !{i32 786689, metadata !37, metadata !"val", metadata !5, i32 50332121, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 473]
!459 = metadata !{i32 786688, metadata !37, metadata !"i", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 482]
!460 = metadata !{i32 482, i32 0, metadata !37, null}
!461 = metadata !{i32 484, i32 0, metadata !462, null}
!462 = metadata !{i32 786443, metadata !1, metadata !37, i32 484, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!463 = metadata !{i32 485, i32 0, metadata !464, null}
!464 = metadata !{i32 786443, metadata !1, metadata !37, i32 485, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!465 = metadata !{i32 486, i32 0, metadata !464, null}
!466 = metadata !{i32 487, i32 0, metadata !37, null}
