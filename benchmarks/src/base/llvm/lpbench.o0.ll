; ModuleID = 'lpbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: nounwind uwtable
define void @matgen(double** %a, double* %b) #0 {
  %1 = alloca double**, align 8
  %2 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %1, align 8
  call void @llvm.dbg.declare(metadata !{double*** %1}, metadata !55), !dbg !56
  store double* %b, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !57), !dbg !56
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !58), !dbg !59
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !60), !dbg !59
  store i32 0, i32* %i, align 4, !dbg !61
  br label %3, !dbg !61

; <label>:3                                       ; preds = %24, %0
  %4 = load i32* %i, align 4, !dbg !61
  %5 = icmp slt i32 %4, 2000, !dbg !61
  br i1 %5, label %6, label %27, !dbg !61

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4, !dbg !63
  br label %7, !dbg !63

; <label>:7                                       ; preds = %20, %6
  %8 = load i32* %j, align 4, !dbg !63
  %9 = icmp slt i32 %8, 2000, !dbg !63
  br i1 %9, label %10, label %23, !dbg !63

; <label>:10                                      ; preds = %7
  %11 = call double @random_double(), !dbg !65
  %12 = load i32* %i, align 4, !dbg !65
  %13 = sext i32 %12 to i64, !dbg !65
  %14 = load i32* %j, align 4, !dbg !65
  %15 = sext i32 %14 to i64, !dbg !65
  %16 = load double*** %1, align 8, !dbg !65
  %17 = getelementptr inbounds double** %16, i64 %15, !dbg !65
  %18 = load double** %17, align 8, !dbg !65
  %19 = getelementptr inbounds double* %18, i64 %13, !dbg !65
  store double %11, double* %19, align 8, !dbg !65
  br label %20, !dbg !65

; <label>:20                                      ; preds = %10
  %21 = load i32* %j, align 4, !dbg !63
  %22 = add nsw i32 %21, 1, !dbg !63
  store i32 %22, i32* %j, align 4, !dbg !63
  br label %7, !dbg !63

; <label>:23                                      ; preds = %7
  br label %24, !dbg !65

; <label>:24                                      ; preds = %23
  %25 = load i32* %i, align 4, !dbg !61
  %26 = add nsw i32 %25, 1, !dbg !61
  store i32 %26, i32* %i, align 4, !dbg !61
  br label %3, !dbg !61

; <label>:27                                      ; preds = %3
  store i32 0, i32* %i, align 4, !dbg !66
  br label %28, !dbg !66

; <label>:28                                      ; preds = %36, %27
  %29 = load i32* %i, align 4, !dbg !66
  %30 = icmp slt i32 %29, 2000, !dbg !66
  br i1 %30, label %31, label %39, !dbg !66

; <label>:31                                      ; preds = %28
  %32 = load i32* %i, align 4, !dbg !68
  %33 = sext i32 %32 to i64, !dbg !68
  %34 = load double** %2, align 8, !dbg !68
  %35 = getelementptr inbounds double* %34, i64 %33, !dbg !68
  store double 0.000000e+00, double* %35, align 8, !dbg !68
  br label %36, !dbg !68

; <label>:36                                      ; preds = %31
  %37 = load i32* %i, align 4, !dbg !66
  %38 = add nsw i32 %37, 1, !dbg !66
  store i32 %38, i32* %i, align 4, !dbg !66
  br label %28, !dbg !66

; <label>:39                                      ; preds = %28
  store i32 0, i32* %j, align 4, !dbg !69
  br label %40, !dbg !69

; <label>:40                                      ; preds = %67, %39
  %41 = load i32* %j, align 4, !dbg !69
  %42 = icmp slt i32 %41, 2000, !dbg !69
  br i1 %42, label %43, label %70, !dbg !69

; <label>:43                                      ; preds = %40
  store i32 0, i32* %i, align 4, !dbg !71
  br label %44, !dbg !71

; <label>:44                                      ; preds = %63, %43
  %45 = load i32* %i, align 4, !dbg !71
  %46 = icmp slt i32 %45, 2000, !dbg !71
  br i1 %46, label %47, label %66, !dbg !71

; <label>:47                                      ; preds = %44
  %48 = load i32* %i, align 4, !dbg !73
  %49 = sext i32 %48 to i64, !dbg !73
  %50 = load i32* %j, align 4, !dbg !73
  %51 = sext i32 %50 to i64, !dbg !73
  %52 = load double*** %1, align 8, !dbg !73
  %53 = getelementptr inbounds double** %52, i64 %51, !dbg !73
  %54 = load double** %53, align 8, !dbg !73
  %55 = getelementptr inbounds double* %54, i64 %49, !dbg !73
  %56 = load double* %55, align 8, !dbg !73
  %57 = load i32* %i, align 4, !dbg !73
  %58 = sext i32 %57 to i64, !dbg !73
  %59 = load double** %2, align 8, !dbg !73
  %60 = getelementptr inbounds double* %59, i64 %58, !dbg !73
  %61 = load double* %60, align 8, !dbg !73
  %62 = fadd double %61, %56, !dbg !73
  store double %62, double* %60, align 8, !dbg !73
  br label %63, !dbg !73

; <label>:63                                      ; preds = %47
  %64 = load i32* %i, align 4, !dbg !71
  %65 = add nsw i32 %64, 1, !dbg !71
  store i32 %65, i32* %i, align 4, !dbg !71
  br label %44, !dbg !71

; <label>:66                                      ; preds = %44
  br label %67, !dbg !73

; <label>:67                                      ; preds = %66
  %68 = load i32* %j, align 4, !dbg !69
  %69 = add nsw i32 %68, 1, !dbg !69
  store i32 %69, i32* %j, align 4, !dbg !69
  br label %40, !dbg !69

; <label>:70                                      ; preds = %40
  ret void, !dbg !74
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @idamax(i32 %n, double* %dx, i32 %dx_off, i32 %incx) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %dmax = alloca double, align 8
  %dtemp = alloca double, align 8
  %i = alloca i32, align 4
  %ix = alloca i32, align 4
  %itemp = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !75), !dbg !76
  store double* %dx, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !77), !dbg !76
  store i32 %dx_off, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !78), !dbg !76
  store i32 %incx, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !79), !dbg !76
  call void @llvm.dbg.declare(metadata !{double* %dmax}, metadata !80), !dbg !81
  call void @llvm.dbg.declare(metadata !{double* %dtemp}, metadata !82), !dbg !81
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !83), !dbg !84
  call void @llvm.dbg.declare(metadata !{i32* %ix}, metadata !85), !dbg !84
  call void @llvm.dbg.declare(metadata !{i32* %itemp}, metadata !86), !dbg !84
  store i32 0, i32* %itemp, align 4, !dbg !84
  %5 = load i32* %1, align 4, !dbg !87
  %6 = icmp slt i32 %5, 1, !dbg !87
  br i1 %6, label %7, label %8, !dbg !87

; <label>:7                                       ; preds = %0
  store i32 -1, i32* %itemp, align 4, !dbg !89
  br label %84, !dbg !89

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4, !dbg !90
  %10 = icmp eq i32 %9, 1, !dbg !90
  br i1 %10, label %11, label %12, !dbg !90

; <label>:11                                      ; preds = %8
  store i32 0, i32* %itemp, align 4, !dbg !93
  br label %83, !dbg !93

; <label>:12                                      ; preds = %8
  %13 = load i32* %4, align 4, !dbg !94
  %14 = icmp ne i32 %13, 1, !dbg !94
  br i1 %14, label %15, label %51, !dbg !94

; <label>:15                                      ; preds = %12
  %16 = load i32* %3, align 4, !dbg !97
  %17 = sext i32 %16 to i64, !dbg !97
  %18 = load double** %2, align 8, !dbg !97
  %19 = getelementptr inbounds double* %18, i64 %17, !dbg !97
  %20 = load double* %19, align 8, !dbg !97
  %21 = call double @fabs(double %20) #1, !dbg !97
  store double %21, double* %dmax, align 8, !dbg !97
  %22 = load i32* %4, align 4, !dbg !99
  %23 = add nsw i32 1, %22, !dbg !99
  store i32 %23, i32* %ix, align 4, !dbg !99
  store i32 1, i32* %i, align 4, !dbg !100
  br label %24, !dbg !100

; <label>:24                                      ; preds = %47, %15
  %25 = load i32* %i, align 4, !dbg !100
  %26 = load i32* %1, align 4, !dbg !100
  %27 = icmp slt i32 %25, %26, !dbg !100
  br i1 %27, label %28, label %50, !dbg !100

; <label>:28                                      ; preds = %24
  %29 = load i32* %ix, align 4, !dbg !102
  %30 = load i32* %3, align 4, !dbg !102
  %31 = add nsw i32 %29, %30, !dbg !102
  %32 = sext i32 %31 to i64, !dbg !102
  %33 = load double** %2, align 8, !dbg !102
  %34 = getelementptr inbounds double* %33, i64 %32, !dbg !102
  %35 = load double* %34, align 8, !dbg !102
  %36 = call double @fabs(double %35) #1, !dbg !102
  store double %36, double* %dtemp, align 8, !dbg !102
  %37 = load double* %dtemp, align 8, !dbg !104
  %38 = load double* %dmax, align 8, !dbg !104
  %39 = fcmp ogt double %37, %38, !dbg !104
  br i1 %39, label %40, label %43, !dbg !104

; <label>:40                                      ; preds = %28
  %41 = load i32* %i, align 4, !dbg !106
  store i32 %41, i32* %itemp, align 4, !dbg !106
  %42 = load double* %dtemp, align 8, !dbg !108
  store double %42, double* %dmax, align 8, !dbg !108
  br label %43, !dbg !109

; <label>:43                                      ; preds = %40, %28
  %44 = load i32* %4, align 4, !dbg !110
  %45 = load i32* %ix, align 4, !dbg !110
  %46 = add nsw i32 %45, %44, !dbg !110
  store i32 %46, i32* %ix, align 4, !dbg !110
  br label %47, !dbg !111

; <label>:47                                      ; preds = %43
  %48 = load i32* %i, align 4, !dbg !100
  %49 = add nsw i32 %48, 1, !dbg !100
  store i32 %49, i32* %i, align 4, !dbg !100
  br label %24, !dbg !100

; <label>:50                                      ; preds = %24
  br label %82, !dbg !112

; <label>:51                                      ; preds = %12
  store i32 0, i32* %itemp, align 4, !dbg !113
  %52 = load i32* %3, align 4, !dbg !115
  %53 = sext i32 %52 to i64, !dbg !115
  %54 = load double** %2, align 8, !dbg !115
  %55 = getelementptr inbounds double* %54, i64 %53, !dbg !115
  %56 = load double* %55, align 8, !dbg !115
  %57 = call double @fabs(double %56) #1, !dbg !115
  store double %57, double* %dmax, align 8, !dbg !115
  store i32 1, i32* %i, align 4, !dbg !116
  br label %58, !dbg !116

; <label>:58                                      ; preds = %78, %51
  %59 = load i32* %i, align 4, !dbg !116
  %60 = load i32* %1, align 4, !dbg !116
  %61 = icmp slt i32 %59, %60, !dbg !116
  br i1 %61, label %62, label %81, !dbg !116

; <label>:62                                      ; preds = %58
  %63 = load i32* %i, align 4, !dbg !118
  %64 = load i32* %3, align 4, !dbg !118
  %65 = add nsw i32 %63, %64, !dbg !118
  %66 = sext i32 %65 to i64, !dbg !118
  %67 = load double** %2, align 8, !dbg !118
  %68 = getelementptr inbounds double* %67, i64 %66, !dbg !118
  %69 = load double* %68, align 8, !dbg !118
  %70 = call double @fabs(double %69) #1, !dbg !118
  store double %70, double* %dtemp, align 8, !dbg !118
  %71 = load double* %dtemp, align 8, !dbg !120
  %72 = load double* %dmax, align 8, !dbg !120
  %73 = fcmp ogt double %71, %72, !dbg !120
  br i1 %73, label %74, label %77, !dbg !120

; <label>:74                                      ; preds = %62
  %75 = load i32* %i, align 4, !dbg !122
  store i32 %75, i32* %itemp, align 4, !dbg !122
  %76 = load double* %dtemp, align 8, !dbg !124
  store double %76, double* %dmax, align 8, !dbg !124
  br label %77, !dbg !125

; <label>:77                                      ; preds = %74, %62
  br label %78, !dbg !126

; <label>:78                                      ; preds = %77
  %79 = load i32* %i, align 4, !dbg !116
  %80 = add nsw i32 %79, 1, !dbg !116
  store i32 %80, i32* %i, align 4, !dbg !116
  br label %58, !dbg !116

; <label>:81                                      ; preds = %58
  br label %82

; <label>:82                                      ; preds = %81, %50
  br label %83

; <label>:83                                      ; preds = %82, %11
  br label %84

; <label>:84                                      ; preds = %83, %7
  %85 = load i32* %itemp, align 4, !dbg !127
  ret i32 %85, !dbg !127
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind uwtable
define void @dscal(i32 %n, double %da, double* %dx, i32 %dx_off, i32 %incx) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %nincx = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !128), !dbg !129
  store double %da, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !130), !dbg !129
  store double* %dx, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !131), !dbg !129
  store i32 %dx_off, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !132), !dbg !129
  store i32 %incx, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !133), !dbg !129
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !134), !dbg !135
  %6 = load i32* %1, align 4, !dbg !136
  %7 = icmp sgt i32 %6, 0, !dbg !136
  br i1 %7, label %8, label %54, !dbg !136

; <label>:8                                       ; preds = %0
  %9 = load i32* %5, align 4, !dbg !138
  %10 = icmp ne i32 %9, 1, !dbg !138
  br i1 %10, label %11, label %34, !dbg !138

; <label>:11                                      ; preds = %8
  call void @llvm.dbg.declare(metadata !{i32* %nincx}, metadata !141), !dbg !143
  %12 = load i32* %1, align 4, !dbg !143
  %13 = load i32* %5, align 4, !dbg !143
  %14 = mul nsw i32 %12, %13, !dbg !143
  store i32 %14, i32* %nincx, align 4, !dbg !143
  store i32 0, i32* %i, align 4, !dbg !144
  br label %15, !dbg !144

; <label>:15                                      ; preds = %29, %11
  %16 = load i32* %i, align 4, !dbg !144
  %17 = load i32* %nincx, align 4, !dbg !144
  %18 = icmp slt i32 %16, %17, !dbg !144
  br i1 %18, label %19, label %33, !dbg !144

; <label>:19                                      ; preds = %15
  %20 = load double* %2, align 8, !dbg !146
  %21 = load i32* %i, align 4, !dbg !146
  %22 = load i32* %4, align 4, !dbg !146
  %23 = add nsw i32 %21, %22, !dbg !146
  %24 = sext i32 %23 to i64, !dbg !146
  %25 = load double** %3, align 8, !dbg !146
  %26 = getelementptr inbounds double* %25, i64 %24, !dbg !146
  %27 = load double* %26, align 8, !dbg !146
  %28 = fmul double %27, %20, !dbg !146
  store double %28, double* %26, align 8, !dbg !146
  br label %29, !dbg !146

; <label>:29                                      ; preds = %19
  %30 = load i32* %5, align 4, !dbg !144
  %31 = load i32* %i, align 4, !dbg !144
  %32 = add nsw i32 %31, %30, !dbg !144
  store i32 %32, i32* %i, align 4, !dbg !144
  br label %15, !dbg !144

; <label>:33                                      ; preds = %15
  br label %53, !dbg !147

; <label>:34                                      ; preds = %8
  store i32 0, i32* %i, align 4, !dbg !148
  br label %35, !dbg !148

; <label>:35                                      ; preds = %49, %34
  %36 = load i32* %i, align 4, !dbg !148
  %37 = load i32* %1, align 4, !dbg !148
  %38 = icmp slt i32 %36, %37, !dbg !148
  br i1 %38, label %39, label %52, !dbg !148

; <label>:39                                      ; preds = %35
  %40 = load double* %2, align 8, !dbg !151
  %41 = load i32* %i, align 4, !dbg !151
  %42 = load i32* %4, align 4, !dbg !151
  %43 = add nsw i32 %41, %42, !dbg !151
  %44 = sext i32 %43 to i64, !dbg !151
  %45 = load double** %3, align 8, !dbg !151
  %46 = getelementptr inbounds double* %45, i64 %44, !dbg !151
  %47 = load double* %46, align 8, !dbg !151
  %48 = fmul double %47, %40, !dbg !151
  store double %48, double* %46, align 8, !dbg !151
  br label %49, !dbg !151

; <label>:49                                      ; preds = %39
  %50 = load i32* %i, align 4, !dbg !148
  %51 = add nsw i32 %50, 1, !dbg !148
  store i32 %51, i32* %i, align 4, !dbg !148
  br label %35, !dbg !148

; <label>:52                                      ; preds = %35
  br label %53

; <label>:53                                      ; preds = %52, %33
  br label %54, !dbg !152

; <label>:54                                      ; preds = %53, %0
  ret void, !dbg !153
}

; Function Attrs: nounwind uwtable
define void @daxpy(i32 %n, double %da, double* %dx, i32 %dx_off, i32 %incx, double* %dy, i32 %dy_off, i32 %incy) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %i = alloca i32, align 4
  %ix = alloca i32, align 4
  %iy = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !154), !dbg !155
  store double %da, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !156), !dbg !155
  store double* %dx, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !157), !dbg !155
  store i32 %dx_off, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !158), !dbg !155
  store i32 %incx, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !159), !dbg !155
  store double* %dy, double** %6, align 8
  call void @llvm.dbg.declare(metadata !{double** %6}, metadata !160), !dbg !155
  store i32 %dy_off, i32* %7, align 4
  call void @llvm.dbg.declare(metadata !{i32* %7}, metadata !161), !dbg !155
  store i32 %incy, i32* %8, align 4
  call void @llvm.dbg.declare(metadata !{i32* %8}, metadata !162), !dbg !155
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !163), !dbg !164
  %9 = load i32* %1, align 4, !dbg !165
  %10 = icmp sgt i32 %9, 0, !dbg !165
  br i1 %10, label %11, label %97, !dbg !165

; <label>:11                                      ; preds = %0
  %12 = load double* %2, align 8, !dbg !165
  %13 = fcmp une double %12, 0.000000e+00, !dbg !165
  br i1 %13, label %14, label %97, !dbg !165

; <label>:14                                      ; preds = %11
  %15 = load i32* %5, align 4, !dbg !167
  %16 = icmp ne i32 %15, 1, !dbg !167
  br i1 %16, label %20, label %17, !dbg !167

; <label>:17                                      ; preds = %14
  %18 = load i32* %8, align 4, !dbg !167
  %19 = icmp ne i32 %18, 1, !dbg !167
  br i1 %19, label %20, label %69, !dbg !167

; <label>:20                                      ; preds = %17, %14
  call void @llvm.dbg.declare(metadata !{i32* %ix}, metadata !170), !dbg !172
  store i32 0, i32* %ix, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata !{i32* %iy}, metadata !173), !dbg !174
  store i32 0, i32* %iy, align 4, !dbg !174
  %21 = load i32* %5, align 4, !dbg !175
  %22 = icmp slt i32 %21, 0, !dbg !175
  br i1 %22, label %23, label %28, !dbg !175

; <label>:23                                      ; preds = %20
  %24 = load i32* %1, align 4, !dbg !177
  %25 = sub nsw i32 1, %24, !dbg !177
  %26 = load i32* %5, align 4, !dbg !177
  %27 = mul nsw i32 %25, %26, !dbg !177
  store i32 %27, i32* %ix, align 4, !dbg !177
  br label %28, !dbg !177

; <label>:28                                      ; preds = %23, %20
  %29 = load i32* %8, align 4, !dbg !178
  %30 = icmp slt i32 %29, 0, !dbg !178
  br i1 %30, label %31, label %36, !dbg !178

; <label>:31                                      ; preds = %28
  %32 = load i32* %1, align 4, !dbg !180
  %33 = sub nsw i32 1, %32, !dbg !180
  %34 = load i32* %8, align 4, !dbg !180
  %35 = mul nsw i32 %33, %34, !dbg !180
  store i32 %35, i32* %iy, align 4, !dbg !180
  br label %36, !dbg !180

; <label>:36                                      ; preds = %31, %28
  store i32 0, i32* %i, align 4, !dbg !181
  br label %37, !dbg !181

; <label>:37                                      ; preds = %65, %36
  %38 = load i32* %i, align 4, !dbg !181
  %39 = load i32* %1, align 4, !dbg !181
  %40 = icmp slt i32 %38, %39, !dbg !181
  br i1 %40, label %41, label %68, !dbg !181

; <label>:41                                      ; preds = %37
  %42 = load double* %2, align 8, !dbg !183
  %43 = load i32* %ix, align 4, !dbg !183
  %44 = load i32* %4, align 4, !dbg !183
  %45 = add nsw i32 %43, %44, !dbg !183
  %46 = sext i32 %45 to i64, !dbg !183
  %47 = load double** %3, align 8, !dbg !183
  %48 = getelementptr inbounds double* %47, i64 %46, !dbg !183
  %49 = load double* %48, align 8, !dbg !183
  %50 = fmul double %42, %49, !dbg !183
  %51 = load i32* %iy, align 4, !dbg !183
  %52 = load i32* %7, align 4, !dbg !183
  %53 = add nsw i32 %51, %52, !dbg !183
  %54 = sext i32 %53 to i64, !dbg !183
  %55 = load double** %6, align 8, !dbg !183
  %56 = getelementptr inbounds double* %55, i64 %54, !dbg !183
  %57 = load double* %56, align 8, !dbg !183
  %58 = fadd double %57, %50, !dbg !183
  store double %58, double* %56, align 8, !dbg !183
  %59 = load i32* %5, align 4, !dbg !185
  %60 = load i32* %ix, align 4, !dbg !185
  %61 = add nsw i32 %60, %59, !dbg !185
  store i32 %61, i32* %ix, align 4, !dbg !185
  %62 = load i32* %8, align 4, !dbg !186
  %63 = load i32* %iy, align 4, !dbg !186
  %64 = add nsw i32 %63, %62, !dbg !186
  store i32 %64, i32* %iy, align 4, !dbg !186
  br label %65, !dbg !187

; <label>:65                                      ; preds = %41
  %66 = load i32* %i, align 4, !dbg !181
  %67 = add nsw i32 %66, 1, !dbg !181
  store i32 %67, i32* %i, align 4, !dbg !181
  br label %37, !dbg !181

; <label>:68                                      ; preds = %37
  br label %97, !dbg !188

; <label>:69                                      ; preds = %17
  store i32 0, i32* %i, align 4, !dbg !189
  br label %70, !dbg !189

; <label>:70                                      ; preds = %92, %69
  %71 = load i32* %i, align 4, !dbg !189
  %72 = load i32* %1, align 4, !dbg !189
  %73 = icmp slt i32 %71, %72, !dbg !189
  br i1 %73, label %74, label %95, !dbg !189

; <label>:74                                      ; preds = %70
  %75 = load double* %2, align 8, !dbg !192
  %76 = load i32* %i, align 4, !dbg !192
  %77 = load i32* %4, align 4, !dbg !192
  %78 = add nsw i32 %76, %77, !dbg !192
  %79 = sext i32 %78 to i64, !dbg !192
  %80 = load double** %3, align 8, !dbg !192
  %81 = getelementptr inbounds double* %80, i64 %79, !dbg !192
  %82 = load double* %81, align 8, !dbg !192
  %83 = fmul double %75, %82, !dbg !192
  %84 = load i32* %i, align 4, !dbg !192
  %85 = load i32* %7, align 4, !dbg !192
  %86 = add nsw i32 %84, %85, !dbg !192
  %87 = sext i32 %86 to i64, !dbg !192
  %88 = load double** %6, align 8, !dbg !192
  %89 = getelementptr inbounds double* %88, i64 %87, !dbg !192
  %90 = load double* %89, align 8, !dbg !192
  %91 = fadd double %90, %83, !dbg !192
  store double %91, double* %89, align 8, !dbg !192
  br label %92, !dbg !192

; <label>:92                                      ; preds = %74
  %93 = load i32* %i, align 4, !dbg !189
  %94 = add nsw i32 %93, 1, !dbg !189
  store i32 %94, i32* %i, align 4, !dbg !189
  br label %70, !dbg !189

; <label>:95                                      ; preds = %70
  br label %96

; <label>:96                                      ; preds = %95
  br label %97, !dbg !193

; <label>:97                                      ; preds = %68, %96, %11, %0
  ret void, !dbg !194
}

; Function Attrs: nounwind uwtable
define void @dgefa(double** %a, i32* %ipvt) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32*, align 8
  %temp = alloca double, align 8
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %col_k = alloca double*, align 8
  %kp1 = alloca i32, align 4
  %l = alloca i32, align 4
  %col_j = alloca double*, align 8
  store double** %a, double*** %1, align 8
  call void @llvm.dbg.declare(metadata !{double*** %1}, metadata !195), !dbg !196
  store i32* %ipvt, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !197), !dbg !196
  call void @llvm.dbg.declare(metadata !{double* %temp}, metadata !198), !dbg !199
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !200), !dbg !201
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !202), !dbg !201
  store i32 0, i32* %k, align 4, !dbg !203
  br label %3, !dbg !203

; <label>:3                                       ; preds = %114, %0
  %4 = load i32* %k, align 4, !dbg !203
  %5 = icmp slt i32 %4, 1999, !dbg !203
  br i1 %5, label %6, label %117, !dbg !203

; <label>:6                                       ; preds = %3
  call void @llvm.dbg.declare(metadata !{double** %col_k}, metadata !205), !dbg !207
  %7 = load i32* %k, align 4, !dbg !207
  %8 = sext i32 %7 to i64, !dbg !207
  %9 = load double*** %1, align 8, !dbg !207
  %10 = getelementptr inbounds double** %9, i64 %8, !dbg !207
  %11 = load double** %10, align 8, !dbg !207
  store double* %11, double** %col_k, align 8, !dbg !207
  call void @llvm.dbg.declare(metadata !{i32* %kp1}, metadata !208), !dbg !209
  %12 = load i32* %k, align 4, !dbg !209
  %13 = add nsw i32 %12, 1, !dbg !209
  store i32 %13, i32* %kp1, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !210), !dbg !211
  %14 = load i32* %k, align 4, !dbg !211
  %15 = sub nsw i32 2000, %14, !dbg !211
  %16 = load double** %col_k, align 8, !dbg !211
  %17 = load i32* %k, align 4, !dbg !211
  %18 = call i32 @idamax(i32 %15, double* %16, i32 %17, i32 1), !dbg !211
  %19 = load i32* %k, align 4, !dbg !211
  %20 = add nsw i32 %18, %19, !dbg !211
  store i32 %20, i32* %l, align 4, !dbg !211
  %21 = load i32* %l, align 4, !dbg !212
  %22 = load i32* %k, align 4, !dbg !212
  %23 = sext i32 %22 to i64, !dbg !212
  %24 = load i32** %2, align 8, !dbg !212
  %25 = getelementptr inbounds i32* %24, i64 %23, !dbg !212
  store i32 %21, i32* %25, align 4, !dbg !212
  %26 = load i32* %l, align 4, !dbg !213
  %27 = sext i32 %26 to i64, !dbg !213
  %28 = load double** %col_k, align 8, !dbg !213
  %29 = getelementptr inbounds double* %28, i64 %27, !dbg !213
  %30 = load double* %29, align 8, !dbg !213
  %31 = fcmp une double %30, 0.000000e+00, !dbg !213
  br i1 %31, label %32, label %113, !dbg !213

; <label>:32                                      ; preds = %6
  %33 = load i32* %l, align 4, !dbg !215
  %34 = load i32* %k, align 4, !dbg !215
  %35 = icmp ne i32 %33, %34, !dbg !215
  br i1 %35, label %36, label %56, !dbg !215

; <label>:36                                      ; preds = %32
  %37 = load i32* %l, align 4, !dbg !218
  %38 = sext i32 %37 to i64, !dbg !218
  %39 = load double** %col_k, align 8, !dbg !218
  %40 = getelementptr inbounds double* %39, i64 %38, !dbg !218
  %41 = load double* %40, align 8, !dbg !218
  store double %41, double* %temp, align 8, !dbg !218
  %42 = load i32* %k, align 4, !dbg !220
  %43 = sext i32 %42 to i64, !dbg !220
  %44 = load double** %col_k, align 8, !dbg !220
  %45 = getelementptr inbounds double* %44, i64 %43, !dbg !220
  %46 = load double* %45, align 8, !dbg !220
  %47 = load i32* %l, align 4, !dbg !220
  %48 = sext i32 %47 to i64, !dbg !220
  %49 = load double** %col_k, align 8, !dbg !220
  %50 = getelementptr inbounds double* %49, i64 %48, !dbg !220
  store double %46, double* %50, align 8, !dbg !220
  %51 = load double* %temp, align 8, !dbg !221
  %52 = load i32* %k, align 4, !dbg !221
  %53 = sext i32 %52 to i64, !dbg !221
  %54 = load double** %col_k, align 8, !dbg !221
  %55 = getelementptr inbounds double* %54, i64 %53, !dbg !221
  store double %51, double* %55, align 8, !dbg !221
  br label %56, !dbg !222

; <label>:56                                      ; preds = %36, %32
  %57 = load i32* %k, align 4, !dbg !223
  %58 = sext i32 %57 to i64, !dbg !223
  %59 = load double** %col_k, align 8, !dbg !223
  %60 = getelementptr inbounds double* %59, i64 %58, !dbg !223
  %61 = load double* %60, align 8, !dbg !223
  %62 = fdiv double -1.000000e+00, %61, !dbg !223
  store double %62, double* %temp, align 8, !dbg !223
  %63 = load i32* %kp1, align 4, !dbg !224
  %64 = sub nsw i32 2000, %63, !dbg !224
  %65 = load double* %temp, align 8, !dbg !224
  %66 = load double** %col_k, align 8, !dbg !224
  %67 = load i32* %kp1, align 4, !dbg !224
  call void @dscal(i32 %64, double %65, double* %66, i32 %67, i32 1), !dbg !224
  %68 = load i32* %kp1, align 4, !dbg !225
  store i32 %68, i32* %j, align 4, !dbg !225
  br label %69, !dbg !225

; <label>:69                                      ; preds = %109, %56
  %70 = load i32* %j, align 4, !dbg !225
  %71 = icmp slt i32 %70, 2000, !dbg !225
  br i1 %71, label %72, label %112, !dbg !225

; <label>:72                                      ; preds = %69
  call void @llvm.dbg.declare(metadata !{double** %col_j}, metadata !227), !dbg !229
  %73 = load i32* %j, align 4, !dbg !229
  %74 = sext i32 %73 to i64, !dbg !229
  %75 = load double*** %1, align 8, !dbg !229
  %76 = getelementptr inbounds double** %75, i64 %74, !dbg !229
  %77 = load double** %76, align 8, !dbg !229
  store double* %77, double** %col_j, align 8, !dbg !229
  %78 = load i32* %l, align 4, !dbg !230
  %79 = sext i32 %78 to i64, !dbg !230
  %80 = load double** %col_j, align 8, !dbg !230
  %81 = getelementptr inbounds double* %80, i64 %79, !dbg !230
  %82 = load double* %81, align 8, !dbg !230
  store double %82, double* %temp, align 8, !dbg !230
  %83 = load i32* %l, align 4, !dbg !231
  %84 = load i32* %k, align 4, !dbg !231
  %85 = icmp ne i32 %83, %84, !dbg !231
  br i1 %85, label %86, label %101, !dbg !231

; <label>:86                                      ; preds = %72
  %87 = load i32* %k, align 4, !dbg !233
  %88 = sext i32 %87 to i64, !dbg !233
  %89 = load double** %col_j, align 8, !dbg !233
  %90 = getelementptr inbounds double* %89, i64 %88, !dbg !233
  %91 = load double* %90, align 8, !dbg !233
  %92 = load i32* %l, align 4, !dbg !233
  %93 = sext i32 %92 to i64, !dbg !233
  %94 = load double** %col_j, align 8, !dbg !233
  %95 = getelementptr inbounds double* %94, i64 %93, !dbg !233
  store double %91, double* %95, align 8, !dbg !233
  %96 = load double* %temp, align 8, !dbg !235
  %97 = load i32* %k, align 4, !dbg !235
  %98 = sext i32 %97 to i64, !dbg !235
  %99 = load double** %col_j, align 8, !dbg !235
  %100 = getelementptr inbounds double* %99, i64 %98, !dbg !235
  store double %96, double* %100, align 8, !dbg !235
  br label %101, !dbg !236

; <label>:101                                     ; preds = %86, %72
  %102 = load i32* %kp1, align 4, !dbg !237
  %103 = sub nsw i32 2000, %102, !dbg !237
  %104 = load double* %temp, align 8, !dbg !237
  %105 = load double** %col_k, align 8, !dbg !237
  %106 = load i32* %kp1, align 4, !dbg !237
  %107 = load double** %col_j, align 8, !dbg !237
  %108 = load i32* %kp1, align 4, !dbg !237
  call void @daxpy(i32 %103, double %104, double* %105, i32 %106, i32 1, double* %107, i32 %108, i32 1), !dbg !237
  br label %109, !dbg !238

; <label>:109                                     ; preds = %101
  %110 = load i32* %j, align 4, !dbg !225
  %111 = add nsw i32 %110, 1, !dbg !225
  store i32 %111, i32* %j, align 4, !dbg !225
  br label %69, !dbg !225

; <label>:112                                     ; preds = %69
  br label %113, !dbg !239

; <label>:113                                     ; preds = %112, %6
  br label %114, !dbg !240

; <label>:114                                     ; preds = %113
  %115 = load i32* %k, align 4, !dbg !203
  %116 = add nsw i32 %115, 1, !dbg !203
  store i32 %116, i32* %k, align 4, !dbg !203
  br label %3, !dbg !203

; <label>:117                                     ; preds = %3
  %118 = load i32** %2, align 8, !dbg !241
  %119 = getelementptr inbounds i32* %118, i64 1999, !dbg !241
  store i32 1999, i32* %119, align 4, !dbg !241
  ret void, !dbg !242
}

; Function Attrs: nounwind uwtable
define void @dgesl(double** %a, i32* %ipvt, double* %b) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca double*, align 8
  %t = alloca double, align 8
  %k = alloca i32, align 4
  %kb = alloca i32, align 4
  %l = alloca i32, align 4
  %kp1 = alloca i32, align 4
  store double** %a, double*** %1, align 8
  call void @llvm.dbg.declare(metadata !{double*** %1}, metadata !243), !dbg !244
  store i32* %ipvt, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !245), !dbg !244
  store double* %b, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !246), !dbg !244
  call void @llvm.dbg.declare(metadata !{double* %t}, metadata !247), !dbg !248
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !249), !dbg !250
  call void @llvm.dbg.declare(metadata !{i32* %kb}, metadata !251), !dbg !250
  store i32 0, i32* %k, align 4, !dbg !252
  br label %4, !dbg !252

; <label>:4                                       ; preds = %50, %0
  %5 = load i32* %k, align 4, !dbg !252
  %6 = icmp slt i32 %5, 1999, !dbg !252
  br i1 %6, label %7, label %53, !dbg !252

; <label>:7                                       ; preds = %4
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !254), !dbg !256
  %8 = load i32* %k, align 4, !dbg !256
  %9 = sext i32 %8 to i64, !dbg !256
  %10 = load i32** %2, align 8, !dbg !256
  %11 = getelementptr inbounds i32* %10, i64 %9, !dbg !256
  %12 = load i32* %11, align 4, !dbg !256
  store i32 %12, i32* %l, align 4, !dbg !256
  %13 = load i32* %l, align 4, !dbg !257
  %14 = sext i32 %13 to i64, !dbg !257
  %15 = load double** %3, align 8, !dbg !257
  %16 = getelementptr inbounds double* %15, i64 %14, !dbg !257
  %17 = load double* %16, align 8, !dbg !257
  store double %17, double* %t, align 8, !dbg !257
  %18 = load i32* %l, align 4, !dbg !258
  %19 = load i32* %k, align 4, !dbg !258
  %20 = icmp ne i32 %18, %19, !dbg !258
  br i1 %20, label %21, label %36, !dbg !258

; <label>:21                                      ; preds = %7
  %22 = load i32* %k, align 4, !dbg !260
  %23 = sext i32 %22 to i64, !dbg !260
  %24 = load double** %3, align 8, !dbg !260
  %25 = getelementptr inbounds double* %24, i64 %23, !dbg !260
  %26 = load double* %25, align 8, !dbg !260
  %27 = load i32* %l, align 4, !dbg !260
  %28 = sext i32 %27 to i64, !dbg !260
  %29 = load double** %3, align 8, !dbg !260
  %30 = getelementptr inbounds double* %29, i64 %28, !dbg !260
  store double %26, double* %30, align 8, !dbg !260
  %31 = load double* %t, align 8, !dbg !262
  %32 = load i32* %k, align 4, !dbg !262
  %33 = sext i32 %32 to i64, !dbg !262
  %34 = load double** %3, align 8, !dbg !262
  %35 = getelementptr inbounds double* %34, i64 %33, !dbg !262
  store double %31, double* %35, align 8, !dbg !262
  br label %36, !dbg !263

; <label>:36                                      ; preds = %21, %7
  call void @llvm.dbg.declare(metadata !{i32* %kp1}, metadata !264), !dbg !265
  %37 = load i32* %k, align 4, !dbg !265
  %38 = add nsw i32 %37, 1, !dbg !265
  store i32 %38, i32* %kp1, align 4, !dbg !265
  %39 = load i32* %kp1, align 4, !dbg !266
  %40 = sub nsw i32 2000, %39, !dbg !266
  %41 = load double* %t, align 8, !dbg !266
  %42 = load i32* %k, align 4, !dbg !266
  %43 = sext i32 %42 to i64, !dbg !266
  %44 = load double*** %1, align 8, !dbg !266
  %45 = getelementptr inbounds double** %44, i64 %43, !dbg !266
  %46 = load double** %45, align 8, !dbg !266
  %47 = load i32* %kp1, align 4, !dbg !266
  %48 = load double** %3, align 8, !dbg !266
  %49 = load i32* %kp1, align 4, !dbg !266
  call void @daxpy(i32 %40, double %41, double* %46, i32 %47, i32 1, double* %48, i32 %49, i32 1), !dbg !266
  br label %50, !dbg !267

; <label>:50                                      ; preds = %36
  %51 = load i32* %k, align 4, !dbg !252
  %52 = add nsw i32 %51, 1, !dbg !252
  store i32 %52, i32* %k, align 4, !dbg !252
  br label %4, !dbg !252

; <label>:53                                      ; preds = %4
  store i32 0, i32* %kb, align 4, !dbg !268
  br label %54, !dbg !268

; <label>:54                                      ; preds = %90, %53
  %55 = load i32* %kb, align 4, !dbg !268
  %56 = icmp slt i32 %55, 2000, !dbg !268
  br i1 %56, label %57, label %93, !dbg !268

; <label>:57                                      ; preds = %54
  %58 = load i32* %kb, align 4, !dbg !270
  %59 = add nsw i32 %58, 1, !dbg !270
  %60 = sub nsw i32 2000, %59, !dbg !270
  store i32 %60, i32* %k, align 4, !dbg !270
  %61 = load i32* %k, align 4, !dbg !272
  %62 = sext i32 %61 to i64, !dbg !272
  %63 = load i32* %k, align 4, !dbg !272
  %64 = sext i32 %63 to i64, !dbg !272
  %65 = load double*** %1, align 8, !dbg !272
  %66 = getelementptr inbounds double** %65, i64 %64, !dbg !272
  %67 = load double** %66, align 8, !dbg !272
  %68 = getelementptr inbounds double* %67, i64 %62, !dbg !272
  %69 = load double* %68, align 8, !dbg !272
  %70 = load i32* %k, align 4, !dbg !272
  %71 = sext i32 %70 to i64, !dbg !272
  %72 = load double** %3, align 8, !dbg !272
  %73 = getelementptr inbounds double* %72, i64 %71, !dbg !272
  %74 = load double* %73, align 8, !dbg !272
  %75 = fdiv double %74, %69, !dbg !272
  store double %75, double* %73, align 8, !dbg !272
  %76 = load i32* %k, align 4, !dbg !273
  %77 = sext i32 %76 to i64, !dbg !273
  %78 = load double** %3, align 8, !dbg !273
  %79 = getelementptr inbounds double* %78, i64 %77, !dbg !273
  %80 = load double* %79, align 8, !dbg !273
  %81 = fsub double -0.000000e+00, %80, !dbg !273
  store double %81, double* %t, align 8, !dbg !273
  %82 = load i32* %k, align 4, !dbg !274
  %83 = load double* %t, align 8, !dbg !274
  %84 = load i32* %k, align 4, !dbg !274
  %85 = sext i32 %84 to i64, !dbg !274
  %86 = load double*** %1, align 8, !dbg !274
  %87 = getelementptr inbounds double** %86, i64 %85, !dbg !274
  %88 = load double** %87, align 8, !dbg !274
  %89 = load double** %3, align 8, !dbg !274
  call void @daxpy(i32 %82, double %83, double* %88, i32 0, i32 1, double* %89, i32 0, i32 1), !dbg !274
  br label %90, !dbg !275

; <label>:90                                      ; preds = %57
  %91 = load i32* %kb, align 4, !dbg !268
  %92 = add nsw i32 %91, 1, !dbg !268
  store i32 %92, i32* %kb, align 4, !dbg !268
  br label %54, !dbg !268

; <label>:93                                      ; preds = %54
  ret void, !dbg !276
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %ga_testing = alloca i8, align 1
  %a = alloca double**, align 8
  %b = alloca double*, align 8
  %x = alloca double*, align 8
  %ipvt = alloca i32*, align 8
  %ops = alloca double, align 8
  %run_time = alloca double, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !277), !dbg !278
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !279), !dbg !278
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !280), !dbg !281
  call void @llvm.dbg.declare(metadata !{i8* %ga_testing}, metadata !282), !dbg !284
  store i8 0, i8* %ga_testing, align 1, !dbg !284
  %4 = load i32* %2, align 4, !dbg !285
  %5 = icmp sgt i32 %4, 1, !dbg !285
  br i1 %5, label %6, label %23, !dbg !285

; <label>:6                                       ; preds = %0
  store i32 1, i32* %i, align 4, !dbg !287
  br label %7, !dbg !287

; <label>:7                                       ; preds = %19, %6
  %8 = load i32* %i, align 4, !dbg !287
  %9 = load i32* %2, align 4, !dbg !287
  %10 = icmp slt i32 %8, %9, !dbg !287
  br i1 %10, label %11, label %22, !dbg !287

; <label>:11                                      ; preds = %7
  %12 = load i8*** %3, align 8, !dbg !290
  %13 = getelementptr inbounds i8** %12, i64 1, !dbg !290
  %14 = load i8** %13, align 8, !dbg !290
  %15 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0)) #6, !dbg !290
  %16 = icmp ne i32 %15, 0, !dbg !290
  br i1 %16, label %18, label %17, !dbg !290

; <label>:17                                      ; preds = %11
  store i8 1, i8* %ga_testing, align 1, !dbg !293
  br label %22, !dbg !295

; <label>:18                                      ; preds = %11
  br label %19, !dbg !296

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4, !dbg !287
  %21 = add nsw i32 %20, 1, !dbg !287
  store i32 %21, i32* %i, align 4, !dbg !287
  br label %7, !dbg !287

; <label>:22                                      ; preds = %17, %7
  br label %23, !dbg !297

; <label>:23                                      ; preds = %22, %0
  call void @llvm.dbg.declare(metadata !{double*** %a}, metadata !298), !dbg !299
  %24 = call noalias i8* @malloc(i64 16000) #7, !dbg !299
  %25 = bitcast i8* %24 to double**, !dbg !299
  store double** %25, double*** %a, align 8, !dbg !299
  store i32 0, i32* %i, align 4, !dbg !300
  br label %26, !dbg !300

; <label>:26                                      ; preds = %36, %23
  %27 = load i32* %i, align 4, !dbg !300
  %28 = icmp slt i32 %27, 2000, !dbg !300
  br i1 %28, label %29, label %39, !dbg !300

; <label>:29                                      ; preds = %26
  %30 = call noalias i8* @malloc(i64 16008) #7, !dbg !302
  %31 = bitcast i8* %30 to double*, !dbg !302
  %32 = load i32* %i, align 4, !dbg !302
  %33 = sext i32 %32 to i64, !dbg !302
  %34 = load double*** %a, align 8, !dbg !302
  %35 = getelementptr inbounds double** %34, i64 %33, !dbg !302
  store double* %31, double** %35, align 8, !dbg !302
  br label %36, !dbg !302

; <label>:36                                      ; preds = %29
  %37 = load i32* %i, align 4, !dbg !300
  %38 = add nsw i32 %37, 1, !dbg !300
  store i32 %38, i32* %i, align 4, !dbg !300
  br label %26, !dbg !300

; <label>:39                                      ; preds = %26
  call void @llvm.dbg.declare(metadata !{double** %b}, metadata !303), !dbg !304
  %40 = call noalias i8* @malloc(i64 16000) #7, !dbg !304
  %41 = bitcast i8* %40 to double*, !dbg !304
  store double* %41, double** %b, align 8, !dbg !304
  call void @llvm.dbg.declare(metadata !{double** %x}, metadata !305), !dbg !306
  %42 = call noalias i8* @malloc(i64 16000) #7, !dbg !306
  %43 = bitcast i8* %42 to double*, !dbg !306
  store double* %43, double** %x, align 8, !dbg !306
  call void @llvm.dbg.declare(metadata !{i32** %ipvt}, metadata !307), !dbg !308
  %44 = call noalias i8* @malloc(i64 8000) #7, !dbg !308
  %45 = bitcast i8* %44 to i32*, !dbg !308
  store i32* %45, i32** %ipvt, align 8, !dbg !308
  call void @llvm.dbg.declare(metadata !{double* %ops}, metadata !309), !dbg !310
  store double 0x41F3E5E475555555, double* %ops, align 8, !dbg !310
  %46 = load double*** %a, align 8, !dbg !311
  %47 = load double** %b, align 8, !dbg !311
  call void @matgen(double** %46, double* %47), !dbg !311
  %48 = load double*** %a, align 8, !dbg !312
  %49 = load i32** %ipvt, align 8, !dbg !312
  call void @dgefa(double** %48, i32* %49), !dbg !312
  %50 = load double*** %a, align 8, !dbg !313
  %51 = load i32** %ipvt, align 8, !dbg !313
  %52 = load double** %b, align 8, !dbg !313
  call void @dgesl(double** %50, i32* %51, double* %52), !dbg !313
  call void @llvm.dbg.declare(metadata !{double* %run_time}, metadata !314), !dbg !315
  store double 0.000000e+00, double* %run_time, align 8, !dbg !315
  %53 = load i32** %ipvt, align 8, !dbg !316
  %54 = bitcast i32* %53 to i8*, !dbg !316
  call void @free(i8* %54) #7, !dbg !316
  %55 = load double** %x, align 8, !dbg !317
  %56 = bitcast double* %55 to i8*, !dbg !317
  call void @free(i8* %56) #7, !dbg !317
  %57 = load double** %b, align 8, !dbg !318
  %58 = bitcast double* %57 to i8*, !dbg !318
  call void @free(i8* %58) #7, !dbg !318
  store i32 0, i32* %i, align 4, !dbg !319
  br label %59, !dbg !319

; <label>:59                                      ; preds = %69, %39
  %60 = load i32* %i, align 4, !dbg !319
  %61 = icmp slt i32 %60, 2000, !dbg !319
  br i1 %61, label %62, label %72, !dbg !319

; <label>:62                                      ; preds = %59
  %63 = load i32* %i, align 4, !dbg !321
  %64 = sext i32 %63 to i64, !dbg !321
  %65 = load double*** %a, align 8, !dbg !321
  %66 = getelementptr inbounds double** %65, i64 %64, !dbg !321
  %67 = load double** %66, align 8, !dbg !321
  %68 = bitcast double* %67 to i8*, !dbg !321
  call void @free(i8* %68) #7, !dbg !321
  br label %69, !dbg !321

; <label>:69                                      ; preds = %62
  %70 = load i32* %i, align 4, !dbg !319
  %71 = add nsw i32 %70, 1, !dbg !319
  store i32 %71, i32* %i, align 4, !dbg !319
  br label %59, !dbg !319

; <label>:72                                      ; preds = %59
  %73 = load double*** %a, align 8, !dbg !322
  %74 = bitcast double** %73 to i8*, !dbg !322
  call void @free(i8* %74) #7, !dbg !322
  %75 = load i8* %ga_testing, align 1, !dbg !323
  %76 = trunc i8 %75 to i1, !dbg !323
  br i1 %76, label %77, label %81, !dbg !323

; <label>:77                                      ; preds = %72
  %78 = load %struct._IO_FILE** @stdout, align 8, !dbg !325
  %79 = load double* %run_time, align 8, !dbg !325
  %80 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), double %79), !dbg !325
  br label %85, !dbg !325

; <label>:81                                      ; preds = %72
  %82 = load %struct._IO_FILE** @stdout, align 8, !dbg !326
  %83 = load double* %run_time, align 8, !dbg !326
  %84 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0), double %83), !dbg !326
  br label %85

; <label>:85                                      ; preds = %81, %77
  %86 = load %struct._IO_FILE** @stdout, align 8, !dbg !327
  %87 = call i32 @fflush(%struct._IO_FILE* %86), !dbg !327
  ret i32 0, !dbg !328
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #5

declare i32 @fflush(%struct._IO_FILE*) #5

; Function Attrs: nounwind uwtable
define internal double @random_double() #0 {
  %k = alloca i64, align 8
  %result = alloca double, align 8
  call void @llvm.dbg.declare(metadata !{i64* %k}, metadata !329), !dbg !330
  call void @llvm.dbg.declare(metadata !{double* %result}, metadata !331), !dbg !332
  %1 = load i64* @seed, align 8, !dbg !333
  %2 = xor i64 %1, 123459876, !dbg !333
  store i64 %2, i64* @seed, align 8, !dbg !333
  %3 = load i64* @seed, align 8, !dbg !334
  %4 = sdiv i64 %3, 127773, !dbg !334
  store i64 %4, i64* %k, align 8, !dbg !334
  %5 = load i64* @seed, align 8, !dbg !335
  %6 = load i64* %k, align 8, !dbg !335
  %7 = mul nsw i64 %6, 127773, !dbg !335
  %8 = sub nsw i64 %5, %7, !dbg !335
  %9 = mul nsw i64 16807, %8, !dbg !335
  %10 = load i64* %k, align 8, !dbg !335
  %11 = mul nsw i64 2836, %10, !dbg !335
  %12 = sub nsw i64 %9, %11, !dbg !335
  store i64 %12, i64* @seed, align 8, !dbg !335
  %13 = load i64* @seed, align 8, !dbg !336
  %14 = icmp slt i64 %13, 0, !dbg !336
  br i1 %14, label %15, label %18, !dbg !336

; <label>:15                                      ; preds = %0
  %16 = load i64* @seed, align 8, !dbg !338
  %17 = add nsw i64 %16, 2147483647, !dbg !338
  store i64 %17, i64* @seed, align 8, !dbg !338
  br label %18, !dbg !338

; <label>:18                                      ; preds = %15, %0
  %19 = load i64* @seed, align 8, !dbg !339
  %20 = sitofp i64 %19 to double, !dbg !339
  %21 = fmul double 0x3E00000000200FE1, %20, !dbg !339
  store double %21, double* %result, align 8, !dbg !339
  %22 = load i64* @seed, align 8, !dbg !340
  %23 = xor i64 %22, 123459876, !dbg !340
  store i64 %23, i64* @seed, align 8, !dbg !340
  %24 = load double* %result, align 8, !dbg !341
  ret double %24, !dbg !341
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!52, !53}
!llvm.ident = !{!54}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !37, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lpbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !15, metadata !18, metadata !21, metadata !25, metadata !28, metadata !34}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matgen", metadata !"matgen", metadata !"", i32 93, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double**, double*)* @matgen, null, null, metadata !2, i32 94} ; [ DW_TAG_subprogram ] [line 93] [def] [scope 94] [matgen]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!10 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"idamax", metadata !"idamax", metadata !"", i32 111, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, double*, i32, i32)* @idamax, null, null, metadata !2, i32 112} ; [ DW_TAG_subprogram ] [line 111] [def] [scope 112] [idamax]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !14, metadata !14, metadata !9, metadata !14, metadata !14}
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dscal", metadata !"dscal", metadata !"", i32 205, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double, double*, i32, i32)* @dscal, null, null, metadata !2, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [dscal]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !14, metadata !10, metadata !9, metadata !14, metadata !14}
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"daxpy", metadata !"daxpy", metadata !"", i32 229, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double, double*, i32, i32, double*, i32, i32)* @daxpy, null, null, metadata !2, i32 230} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [daxpy]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{null, metadata !14, metadata !10, metadata !9, metadata !14, metadata !14, metadata !9, metadata !14, metadata !14}
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dgefa", metadata !"dgefa", metadata !"", i32 266, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double**, i32*)* @dgefa, null, null, metadata !2, i32 267} ; [ DW_TAG_subprogram ] [line 266] [def] [scope 267] [dgefa]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{null, metadata !8, metadata !24}
!24 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dgesl", metadata !"dgesl", metadata !"", i32 317, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double**, i32*, double*)* @dgesl, null, null, metadata !2, i32 318} ; [ DW_TAG_subprogram ] [line 317] [def] [scope 318] [dgesl]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !8, metadata !24, metadata !9}
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 348, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 349} ; [ DW_TAG_subprogram ] [line 348] [def] [scope 349] [main]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !14, metadata !14, metadata !31}
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!33 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random_double", metadata !"random_double", metadata !"", i32 52, metadata !35, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, double ()* @random_double, null, null, metadata !2, i32 53} ; [ DW_TAG_subprogram ] [line 52] [local] [def] [scope 53] [random_double]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !10}
!37 = metadata !{metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !40, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !40, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !41, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !38, metadata !42, metadata !45, metadata !46, metadata !45, metadata !47, metadata !48, metadata !49, metadata !42, metadata !51}
!38 = metadata !{i32 786484, i32 0, metadata !5, metadata !"N", metadata !"N", metadata !"N", metadata !5, i32 86, metadata !39, i32 1, i32 1, i32 2000, null} ; [ DW_TAG_variable ] [N] [line 86] [local] [def]
!39 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!40 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NM1", metadata !"NM1", metadata !"NM1", metadata !5, i32 87, metadata !39, i32 1, i32 1, i32 1999, null} ; [ DW_TAG_variable ] [NM1] [line 87] [local] [def]
!41 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NP1", metadata !"NP1", metadata !"NP1", metadata !5, i32 88, metadata !39, i32 1, i32 1, i32 2001, null} ; [ DW_TAG_variable ] [NP1] [line 88] [local] [def]
!42 = metadata !{i32 786484, i32 0, metadata !5, metadata !"MASK", metadata !"MASK", metadata !"MASK", metadata !5, i32 50, metadata !43, i32 1, i32 1, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 50] [local] [def]
!43 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!44 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!45 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IQ", metadata !"IQ", metadata !"IQ", metadata !5, i32 48, metadata !43, i32 1, i32 1, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 48] [local] [def]
!46 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IA", metadata !"IA", metadata !"IA", metadata !5, i32 45, metadata !43, i32 1, i32 1, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 45] [local] [def]
!47 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IR", metadata !"IR", metadata !"IR", metadata !5, i32 49, metadata !43, i32 1, i32 1, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 49] [local] [def]
!48 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IM", metadata !"IM", metadata !"IM", metadata !5, i32 46, metadata !43, i32 1, i32 1, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 46] [local] [def]
!49 = metadata !{i32 786484, i32 0, metadata !5, metadata !"AM", metadata !"AM", metadata !"AM", metadata !5, i32 47, metadata !50, i32 1, i32 1, double 0x3E00000000200FE1, null} ; [ DW_TAG_variable ] [AM] [line 47] [local] [def]
!50 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!51 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 44, metadata !44, i32 1, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 44] [local] [def]
!52 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!53 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!54 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!55 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777309, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 93]
!56 = metadata !{i32 93, i32 0, metadata !4, null}
!57 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554525, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 93]
!58 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 96, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 96]
!59 = metadata !{i32 96, i32 0, metadata !4, null}
!60 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 96, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 96]
!61 = metadata !{i32 98, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !4, i32 98, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!63 = metadata !{i32 99, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 99, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!65 = metadata !{i32 100, i32 0, metadata !64, null}
!66 = metadata !{i32 102, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!68 = metadata !{i32 103, i32 0, metadata !67, null}
!69 = metadata !{i32 105, i32 0, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!71 = metadata !{i32 106, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !70, i32 106, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!73 = metadata !{i32 107, i32 0, metadata !72, null}
!74 = metadata !{i32 108, i32 0, metadata !4, null}
!75 = metadata !{i32 786689, metadata !11, metadata !"n", metadata !5, i32 16777327, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 111]
!76 = metadata !{i32 111, i32 0, metadata !11, null}
!77 = metadata !{i32 786689, metadata !11, metadata !"dx", metadata !5, i32 33554543, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx] [line 111]
!78 = metadata !{i32 786689, metadata !11, metadata !"dx_off", metadata !5, i32 50331759, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx_off] [line 111]
!79 = metadata !{i32 786689, metadata !11, metadata !"incx", metadata !5, i32 67108975, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 111]
!80 = metadata !{i32 786688, metadata !11, metadata !"dmax", metadata !5, i32 113, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dmax] [line 113]
!81 = metadata !{i32 113, i32 0, metadata !11, null}
!82 = metadata !{i32 786688, metadata !11, metadata !"dtemp", metadata !5, i32 113, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dtemp] [line 113]
!83 = metadata !{i32 786688, metadata !11, metadata !"i", metadata !5, i32 114, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 114]
!84 = metadata !{i32 114, i32 0, metadata !11, null}
!85 = metadata !{i32 786688, metadata !11, metadata !"ix", metadata !5, i32 114, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ix] [line 114]
!86 = metadata !{i32 786688, metadata !11, metadata !"itemp", metadata !5, i32 114, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [itemp] [line 114]
!87 = metadata !{i32 116, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !11, i32 116, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!89 = metadata !{i32 117, i32 0, metadata !88, null}
!90 = metadata !{i32 120, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !92, i32 120, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!92 = metadata !{i32 786443, metadata !1, metadata !88, i32 119, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!93 = metadata !{i32 121, i32 0, metadata !91, null}
!94 = metadata !{i32 124, i32 0, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !96, i32 124, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!96 = metadata !{i32 786443, metadata !1, metadata !91, i32 123, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!97 = metadata !{i32 127, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !95, i32 125, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!99 = metadata !{i32 128, i32 0, metadata !98, null}
!100 = metadata !{i32 130, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !98, i32 130, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!102 = metadata !{i32 132, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !101, i32 131, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!104 = metadata !{i32 134, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !103, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!106 = metadata !{i32 136, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !105, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!108 = metadata !{i32 137, i32 0, metadata !107, null}
!109 = metadata !{i32 138, i32 0, metadata !107, null}
!110 = metadata !{i32 140, i32 0, metadata !103, null}
!111 = metadata !{i32 141, i32 0, metadata !103, null}
!112 = metadata !{i32 142, i32 0, metadata !98, null}
!113 = metadata !{i32 146, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !95, i32 144, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!115 = metadata !{i32 147, i32 0, metadata !114, null}
!116 = metadata !{i32 149, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !114, i32 149, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!118 = metadata !{i32 151, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !117, i32 150, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!120 = metadata !{i32 153, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !119, i32 153, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!122 = metadata !{i32 155, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !121, i32 154, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!124 = metadata !{i32 156, i32 0, metadata !123, null}
!125 = metadata !{i32 157, i32 0, metadata !123, null}
!126 = metadata !{i32 158, i32 0, metadata !119, null}
!127 = metadata !{i32 163, i32 0, metadata !11, null}
!128 = metadata !{i32 786689, metadata !15, metadata !"n", metadata !5, i32 16777421, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 205]
!129 = metadata !{i32 205, i32 0, metadata !15, null}
!130 = metadata !{i32 786689, metadata !15, metadata !"da", metadata !5, i32 33554637, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [da] [line 205]
!131 = metadata !{i32 786689, metadata !15, metadata !"dx", metadata !5, i32 50331853, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx] [line 205]
!132 = metadata !{i32 786689, metadata !15, metadata !"dx_off", metadata !5, i32 67109069, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx_off] [line 205]
!133 = metadata !{i32 786689, metadata !15, metadata !"incx", metadata !5, i32 83886285, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 205]
!134 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 207, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 207]
!135 = metadata !{i32 207, i32 0, metadata !15, null}
!136 = metadata !{i32 209, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !15, i32 209, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!138 = metadata !{i32 211, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !140, i32 211, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!140 = metadata !{i32 786443, metadata !1, metadata !137, i32 210, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!141 = metadata !{i32 786688, metadata !142, metadata !"nincx", metadata !5, i32 214, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nincx] [line 214]
!142 = metadata !{i32 786443, metadata !1, metadata !139, i32 212, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!143 = metadata !{i32 214, i32 0, metadata !142, null}
!144 = metadata !{i32 216, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !142, i32 216, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!146 = metadata !{i32 217, i32 0, metadata !145, null}
!147 = metadata !{i32 218, i32 0, metadata !142, null}
!148 = metadata !{i32 222, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !150, i32 222, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!150 = metadata !{i32 786443, metadata !1, metadata !139, i32 220, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!151 = metadata !{i32 223, i32 0, metadata !149, null}
!152 = metadata !{i32 225, i32 0, metadata !140, null}
!153 = metadata !{i32 226, i32 0, metadata !15, null}
!154 = metadata !{i32 786689, metadata !18, metadata !"n", metadata !5, i32 16777445, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 229]
!155 = metadata !{i32 229, i32 0, metadata !18, null}
!156 = metadata !{i32 786689, metadata !18, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [da] [line 229]
!157 = metadata !{i32 786689, metadata !18, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!158 = metadata !{i32 786689, metadata !18, metadata !"dx_off", metadata !5, i32 67109093, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!159 = metadata !{i32 786689, metadata !18, metadata !"incx", metadata !5, i32 83886309, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!160 = metadata !{i32 786689, metadata !18, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!161 = metadata !{i32 786689, metadata !18, metadata !"dy_off", metadata !5, i32 117440741, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!162 = metadata !{i32 786689, metadata !18, metadata !"incy", metadata !5, i32 134217957, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!163 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 231, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 231]
!164 = metadata !{i32 231, i32 0, metadata !18, null}
!165 = metadata !{i32 233, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !18, i32 233, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!167 = metadata !{i32 235, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !169, i32 235, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!169 = metadata !{i32 786443, metadata !1, metadata !166, i32 234, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!170 = metadata !{i32 786688, metadata !171, metadata !"ix", metadata !5, i32 238, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ix] [line 238]
!171 = metadata !{i32 786443, metadata !1, metadata !168, i32 236, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!172 = metadata !{i32 238, i32 0, metadata !171, null}
!173 = metadata !{i32 786688, metadata !171, metadata !"iy", metadata !5, i32 239, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iy] [line 239]
!174 = metadata !{i32 239, i32 0, metadata !171, null}
!175 = metadata !{i32 241, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !171, i32 241, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!177 = metadata !{i32 242, i32 0, metadata !176, null}
!178 = metadata !{i32 244, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !171, i32 244, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!180 = metadata !{i32 245, i32 0, metadata !179, null}
!181 = metadata !{i32 247, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !171, i32 247, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!183 = metadata !{i32 249, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !182, i32 248, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!185 = metadata !{i32 250, i32 0, metadata !184, null}
!186 = metadata !{i32 251, i32 0, metadata !184, null}
!187 = metadata !{i32 252, i32 0, metadata !184, null}
!188 = metadata !{i32 254, i32 0, metadata !171, null}
!189 = metadata !{i32 259, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !191, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!191 = metadata !{i32 786443, metadata !1, metadata !168, i32 257, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!192 = metadata !{i32 260, i32 0, metadata !190, null}
!193 = metadata !{i32 262, i32 0, metadata !169, null}
!194 = metadata !{i32 263, i32 0, metadata !18, null}
!195 = metadata !{i32 786689, metadata !21, metadata !"a", metadata !5, i32 16777482, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 266]
!196 = metadata !{i32 266, i32 0, metadata !21, null}
!197 = metadata !{i32 786689, metadata !21, metadata !"ipvt", metadata !5, i32 33554698, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 266]
!198 = metadata !{i32 786688, metadata !21, metadata !"temp", metadata !5, i32 268, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 268]
!199 = metadata !{i32 268, i32 0, metadata !21, null}
!200 = metadata !{i32 786688, metadata !21, metadata !"k", metadata !5, i32 269, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 269]
!201 = metadata !{i32 269, i32 0, metadata !21, null}
!202 = metadata !{i32 786688, metadata !21, metadata !"j", metadata !5, i32 269, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 269]
!203 = metadata !{i32 271, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !21, i32 271, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!205 = metadata !{i32 786688, metadata !206, metadata !"col_k", metadata !5, i32 273, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col_k] [line 273]
!206 = metadata !{i32 786443, metadata !1, metadata !204, i32 272, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!207 = metadata !{i32 273, i32 0, metadata !206, null}
!208 = metadata !{i32 786688, metadata !206, metadata !"kp1", metadata !5, i32 274, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kp1] [line 274]
!209 = metadata !{i32 274, i32 0, metadata !206, null}
!210 = metadata !{i32 786688, metadata !206, metadata !"l", metadata !5, i32 277, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 277]
!211 = metadata !{i32 277, i32 0, metadata !206, null}
!212 = metadata !{i32 278, i32 0, metadata !206, null}
!213 = metadata !{i32 281, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !206, i32 281, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!215 = metadata !{i32 284, i32 0, metadata !216, null}
!216 = metadata !{i32 786443, metadata !1, metadata !217, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!217 = metadata !{i32 786443, metadata !1, metadata !214, i32 282, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!218 = metadata !{i32 286, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !216, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!220 = metadata !{i32 287, i32 0, metadata !219, null}
!221 = metadata !{i32 288, i32 0, metadata !219, null}
!222 = metadata !{i32 289, i32 0, metadata !219, null}
!223 = metadata !{i32 292, i32 0, metadata !217, null}
!224 = metadata !{i32 293, i32 0, metadata !217, null}
!225 = metadata !{i32 296, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !217, i32 296, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!227 = metadata !{i32 786688, metadata !228, metadata !"col_j", metadata !5, i32 298, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col_j] [line 298]
!228 = metadata !{i32 786443, metadata !1, metadata !226, i32 297, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!229 = metadata !{i32 298, i32 0, metadata !228, null}
!230 = metadata !{i32 299, i32 0, metadata !228, null}
!231 = metadata !{i32 301, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !228, i32 301, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!233 = metadata !{i32 303, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !232, i32 302, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!235 = metadata !{i32 304, i32 0, metadata !234, null}
!236 = metadata !{i32 305, i32 0, metadata !234, null}
!237 = metadata !{i32 307, i32 0, metadata !228, null}
!238 = metadata !{i32 308, i32 0, metadata !228, null}
!239 = metadata !{i32 309, i32 0, metadata !217, null}
!240 = metadata !{i32 310, i32 0, metadata !206, null}
!241 = metadata !{i32 312, i32 0, metadata !21, null}
!242 = metadata !{i32 313, i32 0, metadata !21, null}
!243 = metadata !{i32 786689, metadata !25, metadata !"a", metadata !5, i32 16777533, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 317]
!244 = metadata !{i32 317, i32 0, metadata !25, null}
!245 = metadata !{i32 786689, metadata !25, metadata !"ipvt", metadata !5, i32 33554749, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 317]
!246 = metadata !{i32 786689, metadata !25, metadata !"b", metadata !5, i32 50331965, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 317]
!247 = metadata !{i32 786688, metadata !25, metadata !"t", metadata !5, i32 319, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 319]
!248 = metadata !{i32 319, i32 0, metadata !25, null}
!249 = metadata !{i32 786688, metadata !25, metadata !"k", metadata !5, i32 320, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 320]
!250 = metadata !{i32 320, i32 0, metadata !25, null}
!251 = metadata !{i32 786688, metadata !25, metadata !"kb", metadata !5, i32 320, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kb] [line 320]
!252 = metadata !{i32 323, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !25, i32 323, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!254 = metadata !{i32 786688, metadata !255, metadata !"l", metadata !5, i32 325, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 325]
!255 = metadata !{i32 786443, metadata !1, metadata !253, i32 324, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!256 = metadata !{i32 325, i32 0, metadata !255, null}
!257 = metadata !{i32 326, i32 0, metadata !255, null}
!258 = metadata !{i32 328, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !255, i32 328, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!260 = metadata !{i32 330, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !259, i32 329, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!262 = metadata !{i32 331, i32 0, metadata !261, null}
!263 = metadata !{i32 332, i32 0, metadata !261, null}
!264 = metadata !{i32 786688, metadata !255, metadata !"kp1", metadata !5, i32 334, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kp1] [line 334]
!265 = metadata !{i32 334, i32 0, metadata !255, null}
!266 = metadata !{i32 335, i32 0, metadata !255, null}
!267 = metadata !{i32 336, i32 0, metadata !255, null}
!268 = metadata !{i32 339, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !25, i32 339, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!270 = metadata !{i32 341, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !269, i32 340, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!272 = metadata !{i32 342, i32 0, metadata !271, null}
!273 = metadata !{i32 343, i32 0, metadata !271, null}
!274 = metadata !{i32 344, i32 0, metadata !271, null}
!275 = metadata !{i32 345, i32 0, metadata !271, null}
!276 = metadata !{i32 346, i32 0, metadata !25, null}
!277 = metadata !{i32 786689, metadata !28, metadata !"argc", metadata !5, i32 16777564, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 348]
!278 = metadata !{i32 348, i32 0, metadata !28, null}
!279 = metadata !{i32 786689, metadata !28, metadata !"argv", metadata !5, i32 33554780, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 348]
!280 = metadata !{i32 786688, metadata !28, metadata !"i", metadata !5, i32 350, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 350]
!281 = metadata !{i32 350, i32 0, metadata !28, null}
!282 = metadata !{i32 786688, metadata !28, metadata !"ga_testing", metadata !5, i32 353, metadata !283, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ga_testing] [line 353]
!283 = metadata !{i32 786468, null, null, metadata !"_Bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!284 = metadata !{i32 353, i32 0, metadata !28, null}
!285 = metadata !{i32 355, i32 0, metadata !286, null}
!286 = metadata !{i32 786443, metadata !1, metadata !28, i32 355, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!287 = metadata !{i32 357, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !289, i32 357, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!289 = metadata !{i32 786443, metadata !1, metadata !286, i32 356, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!290 = metadata !{i32 359, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !292, i32 359, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!292 = metadata !{i32 786443, metadata !1, metadata !288, i32 358, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!293 = metadata !{i32 361, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !291, i32 360, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!295 = metadata !{i32 362, i32 0, metadata !294, null}
!296 = metadata !{i32 364, i32 0, metadata !292, null}
!297 = metadata !{i32 365, i32 0, metadata !289, null}
!298 = metadata !{i32 786688, metadata !28, metadata !"a", metadata !5, i32 367, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 367]
!299 = metadata !{i32 367, i32 0, metadata !28, null}
!300 = metadata !{i32 369, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !28, i32 369, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!302 = metadata !{i32 370, i32 0, metadata !301, null}
!303 = metadata !{i32 786688, metadata !28, metadata !"b", metadata !5, i32 372, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 372]
!304 = metadata !{i32 372, i32 0, metadata !28, null}
!305 = metadata !{i32 786688, metadata !28, metadata !"x", metadata !5, i32 373, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 373]
!306 = metadata !{i32 373, i32 0, metadata !28, null}
!307 = metadata !{i32 786688, metadata !28, metadata !"ipvt", metadata !5, i32 374, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ipvt] [line 374]
!308 = metadata !{i32 374, i32 0, metadata !28, null}
!309 = metadata !{i32 786688, metadata !28, metadata !"ops", metadata !5, i32 377, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ops] [line 377]
!310 = metadata !{i32 377, i32 0, metadata !28, null}
!311 = metadata !{i32 380, i32 0, metadata !28, null}
!312 = metadata !{i32 387, i32 0, metadata !28, null}
!313 = metadata !{i32 388, i32 0, metadata !28, null}
!314 = metadata !{i32 786688, metadata !28, metadata !"run_time", metadata !5, i32 392, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [run_time] [line 392]
!315 = metadata !{i32 392, i32 0, metadata !28, null}
!316 = metadata !{i32 395, i32 0, metadata !28, null}
!317 = metadata !{i32 396, i32 0, metadata !28, null}
!318 = metadata !{i32 397, i32 0, metadata !28, null}
!319 = metadata !{i32 399, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !28, i32 399, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!321 = metadata !{i32 400, i32 0, metadata !320, null}
!322 = metadata !{i32 402, i32 0, metadata !28, null}
!323 = metadata !{i32 405, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !28, i32 405, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!325 = metadata !{i32 406, i32 0, metadata !324, null}
!326 = metadata !{i32 408, i32 0, metadata !324, null}
!327 = metadata !{i32 410, i32 0, metadata !28, null}
!328 = metadata !{i32 413, i32 0, metadata !28, null}
!329 = metadata !{i32 786688, metadata !34, metadata !"k", metadata !5, i32 54, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 54]
!330 = metadata !{i32 54, i32 0, metadata !34, null}
!331 = metadata !{i32 786688, metadata !34, metadata !"result", metadata !5, i32 55, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 55]
!332 = metadata !{i32 55, i32 0, metadata !34, null}
!333 = metadata !{i32 57, i32 0, metadata !34, null}
!334 = metadata !{i32 58, i32 0, metadata !34, null} ; [ DW_TAG_imported_module ]
!335 = metadata !{i32 59, i32 0, metadata !34, null}
!336 = metadata !{i32 61, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !1, metadata !34, i32 61, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!338 = metadata !{i32 62, i32 0, metadata !337, null}
!339 = metadata !{i32 64, i32 0, metadata !34, null}
!340 = metadata !{i32 65, i32 0, metadata !34, null}
!341 = metadata !{i32 67, i32 0, metadata !34, null}
