; ModuleID = 'fbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@niter = global i32 1000, align 4
@spectral_line = internal global [9 x double] zeroinitializer, align 16
@clear_aperture = internal global double 0.000000e+00, align 8
@current_surfaces = internal global i16 0, align 2
@testcase = internal global [4 x [4 x double]] [[4 x double] [double 2.705000e+01, double 1.513700e+00, double 6.360000e+01, double 5.200000e-01], [4 x double] [double -1.668000e+01, double 1.000000e+00, double 0.000000e+00, double 1.380000e-01], [4 x double] [double -1.668000e+01, double 1.616400e+00, double 3.670000e+01, double 3.800000e-01], [4 x double] [double -7.810000e+01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00]], align 16
@s = internal global [10 x [5 x double]] zeroinitializer, align 16
@.str = private unnamed_addr constant [54 x i8] c"Ready to begin John Walker's floating point accuracy\0A\00", align 1
@.str1 = private unnamed_addr constant [58 x i8] c"and performance benchmark.  %d iterations will be made.\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [56 x i8] c"\0AMeasured run time in seconds should be divided by %.f\0A\00", align 1
@.str3 = private unnamed_addr constant [60 x i8] c"to normalise for reporting results.  For archival results,\0A\00", align 1
@.str4 = private unnamed_addr constant [67 x i8] c"adjust iteration count so the benchmark runs about five minutes.\0A\0A\00", align 1
@itercount = common global i32 0, align 4
@paraxial = internal global i16 0, align 2
@object_distance = internal global double 0.000000e+00, align 8
@od_sa = internal global [2 x [2 x double]] zeroinitializer, align 16
@axis_slope_angle = internal global double 0.000000e+00, align 8
@aberr_lspher = internal global double 0.000000e+00, align 8
@aberr_osc = internal global double 0.000000e+00, align 8
@aberr_lchrom = internal global double 0.000000e+00, align 8
@max_lspher = internal global double 0.000000e+00, align 8
@max_osc = internal global double 0.000000e+00, align 8
@max_lchrom = internal global double 0.000000e+00, align 8
@outarr = internal global [8 x [80 x i8]] zeroinitializer, align 16
@.str5 = private unnamed_addr constant [24 x i8] c"%15s   %21.11f  %14.11f\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"Marginal ray\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Paraxial ray\00", align 1
@.str8 = private unnamed_addr constant [48 x i8] c"Longitudinal spherical aberration:      %16.11f\00", align 1
@.str9 = private unnamed_addr constant [48 x i8] c"    (Maximum permissible):              %16.11f\00", align 1
@.str10 = private unnamed_addr constant [48 x i8] c"Offense against sine condition (coma):  %16.11f\00", align 1
@.str11 = private unnamed_addr constant [48 x i8] c"Axial chromatic aberration:             %16.11f\00", align 1
@refarr = internal global [8 x i8*] [i8* getelementptr inbounds ([56 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str23, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str25, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str27, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str28, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str25, i32 0, i32 0)], align 16
@.str12 = private unnamed_addr constant [33 x i8] c"\0AError in results on line %d...\0A\00", align 1
@.str13 = private unnamed_addr constant [17 x i8] c"Expected:  \22%s\22\0A\00", align 1
@.str14 = private unnamed_addr constant [17 x i8] c"Received:  \22%s\22\0A\00", align 1
@.str15 = private unnamed_addr constant [13 x i8] c"(Errors)    \00", align 1
@.str16 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str17 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str18 = private unnamed_addr constant [48 x i8] c"\0A%d error%s in results.  This is VERY SERIOUS.\0A\00", align 1
@.str19 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str20 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str21 = private unnamed_addr constant [24 x i8] c"\0ANo errors in results.\0A\00", align 1
@.str22 = private unnamed_addr constant [56 x i8] c"   Marginal ray          47.09479120920   0.04178472683\00", align 1
@.str23 = private unnamed_addr constant [56 x i8] c"   Paraxial ray          47.08372160249   0.04177864821\00", align 1
@.str24 = private unnamed_addr constant [57 x i8] c"Longitudinal spherical aberration:        -0.01106960671\00", align 1
@.str25 = private unnamed_addr constant [57 x i8] c"    (Maximum permissible):                 0.05306749907\00", align 1
@.str26 = private unnamed_addr constant [57 x i8] c"Offense against sine condition (coma):     0.00008954761\00", align 1
@.str27 = private unnamed_addr constant [57 x i8] c"    (Maximum permissible):                 0.00250000000\00", align 1
@.str28 = private unnamed_addr constant [57 x i8] c"Axial chromatic aberration:                0.00448229032\00", align 1
@ray_height = internal global double 0.000000e+00, align 8
@from_index = internal global double 0.000000e+00, align 8
@radius_of_curvature = internal global double 0.000000e+00, align 8
@to_index = internal global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %errors = alloca i32, align 4
  %od_fline = alloca double, align 8
  %od_cline = alloca double, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !66), !dbg !67
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !68), !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !70), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !72), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !73), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %errors}, metadata !74), !dbg !71
  call void @llvm.dbg.declare(metadata !{double* %od_fline}, metadata !75), !dbg !76
  call void @llvm.dbg.declare(metadata !{double* %od_cline}, metadata !77), !dbg !76
  store double 7.621000e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 1), align 8, !dbg !78
  store double 6.869955e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 2), align 8, !dbg !79
  store double 6.562816e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 3), align 8, !dbg !80
  store double 5.895944e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 4), align 8, !dbg !81
  store double 5.269557e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 5), align 8, !dbg !82
  store double 4.861344e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 6), align 8, !dbg !83
  store double 4.340477e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 7), align 8, !dbg !84
  store double 3.968494e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 8), align 8, !dbg !85
  store i32 1000000, i32* @niter, align 4, !dbg !86
  store double 4.000000e+00, double* @clear_aperture, align 8, !dbg !87
  store i16 4, i16* @current_surfaces, align 2, !dbg !88
  store i32 0, i32* %i, align 4, !dbg !89
  br label %4, !dbg !89

; <label>:4                                       ; preds = %33, %0
  %5 = load i32* %i, align 4, !dbg !89
  %6 = load i16* @current_surfaces, align 2, !dbg !89
  %7 = sext i16 %6 to i32, !dbg !89
  %8 = icmp slt i32 %5, %7, !dbg !89
  br i1 %8, label %9, label %36, !dbg !89

; <label>:9                                       ; preds = %4
  store i32 0, i32* %j, align 4, !dbg !91
  br label %10, !dbg !91

; <label>:10                                      ; preds = %29, %9
  %11 = load i32* %j, align 4, !dbg !91
  %12 = icmp slt i32 %11, 4, !dbg !91
  br i1 %12, label %13, label %32, !dbg !91

; <label>:13                                      ; preds = %10
  %14 = load i32* %j, align 4, !dbg !93
  %15 = sext i32 %14 to i64, !dbg !93
  %16 = load i32* %i, align 4, !dbg !93
  %17 = sext i32 %16 to i64, !dbg !93
  %18 = getelementptr inbounds [4 x [4 x double]]* @testcase, i32 0, i64 %17, !dbg !93
  %19 = getelementptr inbounds [4 x double]* %18, i32 0, i64 %15, !dbg !93
  %20 = load double* %19, align 8, !dbg !93
  %21 = load i32* %j, align 4, !dbg !93
  %22 = add nsw i32 %21, 1, !dbg !93
  %23 = sext i32 %22 to i64, !dbg !93
  %24 = load i32* %i, align 4, !dbg !93
  %25 = add nsw i32 %24, 1, !dbg !93
  %26 = sext i32 %25 to i64, !dbg !93
  %27 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %26, !dbg !93
  %28 = getelementptr inbounds [5 x double]* %27, i32 0, i64 %23, !dbg !93
  store double %20, double* %28, align 8, !dbg !93
  br label %29, !dbg !93

; <label>:29                                      ; preds = %13
  %30 = load i32* %j, align 4, !dbg !91
  %31 = add nsw i32 %30, 1, !dbg !91
  store i32 %31, i32* %j, align 4, !dbg !91
  br label %10, !dbg !91

; <label>:32                                      ; preds = %10
  br label %33, !dbg !93

; <label>:33                                      ; preds = %32
  %34 = load i32* %i, align 4, !dbg !89
  %35 = add nsw i32 %34, 1, !dbg !89
  store i32 %35, i32* %i, align 4, !dbg !89
  br label %4, !dbg !89

; <label>:36                                      ; preds = %4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i32 0, i32 0)), !dbg !94
  %38 = load i32* @niter, align 4, !dbg !95
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0), i32 %38), !dbg !95
  %40 = load i32* @niter, align 4, !dbg !96
  %41 = sitofp i32 %40 to double, !dbg !96
  %42 = fdiv double %41, 1.000000e+03, !dbg !96
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), double %42), !dbg !96
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str3, i32 0, i32 0)), !dbg !97
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([67 x i8]* @.str4, i32 0, i32 0)), !dbg !98
  store i32 0, i32* @itercount, align 4, !dbg !99
  br label %46, !dbg !99

; <label>:46                                      ; preds = %103, %36
  %47 = load i32* @itercount, align 4, !dbg !99
  %48 = load i32* @niter, align 4, !dbg !99
  %49 = icmp slt i32 %47, %48, !dbg !99
  br i1 %49, label %50, label %106, !dbg !99

; <label>:50                                      ; preds = %46
  store i16 0, i16* @paraxial, align 2, !dbg !101
  br label %51, !dbg !101

; <label>:51                                      ; preds = %69, %50
  %52 = load i16* @paraxial, align 2, !dbg !101
  %53 = sext i16 %52 to i32, !dbg !101
  %54 = icmp sle i32 %53, 1, !dbg !101
  br i1 %54, label %55, label %72, !dbg !101

; <label>:55                                      ; preds = %51
  %56 = load double* @clear_aperture, align 8, !dbg !104
  %57 = fdiv double %56, 2.000000e+00, !dbg !104
  %58 = call i32 @trace_line(i32 4, double %57), !dbg !104
  %59 = load double* @object_distance, align 8, !dbg !106
  %60 = load i16* @paraxial, align 2, !dbg !106
  %61 = sext i16 %60 to i64, !dbg !106
  %62 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i32 0, i64 %61, !dbg !106
  %63 = getelementptr inbounds [2 x double]* %62, i32 0, i64 0, !dbg !106
  store double %59, double* %63, align 8, !dbg !106
  %64 = load double* @axis_slope_angle, align 8, !dbg !107
  %65 = load i16* @paraxial, align 2, !dbg !107
  %66 = sext i16 %65 to i64, !dbg !107
  %67 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i32 0, i64 %66, !dbg !107
  %68 = getelementptr inbounds [2 x double]* %67, i32 0, i64 1, !dbg !107
  store double %64, double* %68, align 8, !dbg !107
  br label %69, !dbg !108

; <label>:69                                      ; preds = %55
  %70 = load i16* @paraxial, align 2, !dbg !101
  %71 = add i16 %70, 1, !dbg !101
  store i16 %71, i16* @paraxial, align 2, !dbg !101
  br label %51, !dbg !101

; <label>:72                                      ; preds = %51
  store i16 0, i16* @paraxial, align 2, !dbg !109
  %73 = load double* @clear_aperture, align 8, !dbg !110
  %74 = fdiv double %73, 2.000000e+00, !dbg !110
  %75 = call i32 @trace_line(i32 3, double %74), !dbg !110
  %76 = load double* @object_distance, align 8, !dbg !111
  store double %76, double* %od_cline, align 8, !dbg !111
  %77 = load double* @clear_aperture, align 8, !dbg !112
  %78 = fdiv double %77, 2.000000e+00, !dbg !112
  %79 = call i32 @trace_line(i32 6, double %78), !dbg !112
  %80 = load double* @object_distance, align 8, !dbg !113
  store double %80, double* %od_fline, align 8, !dbg !113
  %81 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 0), align 8, !dbg !114
  %82 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 0), align 8, !dbg !114
  %83 = fsub double %81, %82, !dbg !114
  store double %83, double* @aberr_lspher, align 8, !dbg !114
  %84 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 0), align 8, !dbg !115
  %85 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 1), align 8, !dbg !115
  %86 = fmul double %84, %85, !dbg !115
  %87 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 1), align 8, !dbg !116
  %88 = call double @sin(double %87) #5, !dbg !116
  %89 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 0), align 8, !dbg !116
  %90 = fmul double %88, %89, !dbg !116
  %91 = fdiv double %86, %90, !dbg !116
  %92 = fsub double 1.000000e+00, %91, !dbg !116
  store double %92, double* @aberr_osc, align 8, !dbg !116
  %93 = load double* %od_fline, align 8, !dbg !117
  %94 = load double* %od_cline, align 8, !dbg !117
  %95 = fsub double %93, %94, !dbg !117
  store double %95, double* @aberr_lchrom, align 8, !dbg !117
  %96 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 1), align 8, !dbg !118
  %97 = call double @sin(double %96) #5, !dbg !118
  store double %97, double* @max_lspher, align 8, !dbg !118
  %98 = load double* @max_lspher, align 8, !dbg !119
  %99 = load double* @max_lspher, align 8, !dbg !119
  %100 = fmul double %98, %99, !dbg !119
  %101 = fdiv double 9.260000e-05, %100, !dbg !119
  store double %101, double* @max_lspher, align 8, !dbg !119
  store double 2.500000e-03, double* @max_osc, align 8, !dbg !120
  %102 = load double* @max_lspher, align 8, !dbg !121
  store double %102, double* @max_lchrom, align 8, !dbg !121
  br label %103, !dbg !122

; <label>:103                                     ; preds = %72
  %104 = load i32* @itercount, align 4, !dbg !99
  %105 = add nsw i32 %104, 1, !dbg !99
  store i32 %105, i32* @itercount, align 4, !dbg !99
  br label %46, !dbg !99

; <label>:106                                     ; preds = %46
  %107 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 0), align 8, !dbg !123
  %108 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 1), align 8, !dbg !123
  %109 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 0, i32 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0), double %107, double %108) #5, !dbg !123
  %110 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 0), align 8, !dbg !124
  %111 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 1), align 8, !dbg !124
  %112 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 1, i32 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), double %110, double %111) #5, !dbg !124
  %113 = load double* @aberr_lspher, align 8, !dbg !125
  %114 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 2, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str8, i32 0, i32 0), double %113) #5, !dbg !125
  %115 = load double* @max_lspher, align 8, !dbg !126
  %116 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 3, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %115) #5, !dbg !126
  %117 = load double* @aberr_osc, align 8, !dbg !127
  %118 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 4, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str10, i32 0, i32 0), double %117) #5, !dbg !127
  %119 = load double* @max_osc, align 8, !dbg !128
  %120 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 5, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %119) #5, !dbg !128
  %121 = load double* @aberr_lchrom, align 8, !dbg !129
  %122 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 6, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str11, i32 0, i32 0), double %121) #5, !dbg !129
  %123 = load double* @max_lchrom, align 8, !dbg !130
  %124 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 7, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %123) #5, !dbg !130
  store i32 0, i32* %errors, align 4, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %125, !dbg !132

; <label>:125                                     ; preds = %213, %106
  %126 = load i32* %i, align 4, !dbg !132
  %127 = icmp slt i32 %126, 8, !dbg !132
  br i1 %127, label %128, label %216, !dbg !132

; <label>:128                                     ; preds = %125
  %129 = load i32* %i, align 4, !dbg !134
  %130 = sext i32 %129 to i64, !dbg !134
  %131 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %130, !dbg !134
  %132 = getelementptr inbounds [80 x i8]* %131, i32 0, i32 0, !dbg !134
  %133 = load i32* %i, align 4, !dbg !134
  %134 = sext i32 %133 to i64, !dbg !134
  %135 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %134, !dbg !134
  %136 = load i8** %135, align 8, !dbg !134
  %137 = call i32 @strcmp(i8* %132, i8* %136) #6, !dbg !134
  %138 = icmp ne i32 %137, 0, !dbg !134
  br i1 %138, label %139, label %212, !dbg !134

; <label>:139                                     ; preds = %128
  %140 = load i32* %i, align 4, !dbg !137
  %141 = add nsw i32 %140, 1, !dbg !137
  %142 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str12, i32 0, i32 0), i32 %141), !dbg !137
  %143 = load i32* %i, align 4, !dbg !139
  %144 = sext i32 %143 to i64, !dbg !139
  %145 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %144, !dbg !139
  %146 = load i8** %145, align 8, !dbg !139
  %147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i32 0, i32 0), i8* %146), !dbg !139
  %148 = load i32* %i, align 4, !dbg !140
  %149 = sext i32 %148 to i64, !dbg !140
  %150 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %149, !dbg !140
  %151 = getelementptr inbounds [80 x i8]* %150, i32 0, i32 0, !dbg !140
  %152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i32 0, i32 0), i8* %151), !dbg !140
  %153 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str15, i32 0, i32 0)), !dbg !141
  %154 = load i32* %i, align 4, !dbg !142
  %155 = sext i32 %154 to i64, !dbg !142
  %156 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %155, !dbg !142
  %157 = load i8** %156, align 8, !dbg !142
  %158 = call i64 @strlen(i8* %157) #6, !dbg !142
  %159 = trunc i64 %158 to i32, !dbg !142
  store i32 %159, i32* %k, align 4, !dbg !142
  store i32 0, i32* %j, align 4, !dbg !143
  br label %160, !dbg !143

; <label>:160                                     ; preds = %207, %139
  %161 = load i32* %j, align 4, !dbg !143
  %162 = load i32* %k, align 4, !dbg !143
  %163 = icmp slt i32 %161, %162, !dbg !143
  br i1 %163, label %164, label %210, !dbg !143

; <label>:164                                     ; preds = %160
  %165 = load i32* %j, align 4, !dbg !145
  %166 = sext i32 %165 to i64, !dbg !145
  %167 = load i32* %i, align 4, !dbg !145
  %168 = sext i32 %167 to i64, !dbg !145
  %169 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %168, !dbg !145
  %170 = load i8** %169, align 8, !dbg !145
  %171 = getelementptr inbounds i8* %170, i64 %166, !dbg !145
  %172 = load i8* %171, align 1, !dbg !145
  %173 = sext i8 %172 to i32, !dbg !145
  %174 = load i32* %j, align 4, !dbg !145
  %175 = sext i32 %174 to i64, !dbg !145
  %176 = load i32* %i, align 4, !dbg !145
  %177 = sext i32 %176 to i64, !dbg !145
  %178 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %177, !dbg !145
  %179 = getelementptr inbounds [80 x i8]* %178, i32 0, i64 %175, !dbg !145
  %180 = load i8* %179, align 1, !dbg !145
  %181 = sext i8 %180 to i32, !dbg !145
  %182 = icmp eq i32 %173, %181, !dbg !145
  %183 = select i1 %182, i32 32, i32 94, !dbg !145
  %184 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str16, i32 0, i32 0), i32 %183), !dbg !145
  %185 = load i32* %j, align 4, !dbg !147
  %186 = sext i32 %185 to i64, !dbg !147
  %187 = load i32* %i, align 4, !dbg !147
  %188 = sext i32 %187 to i64, !dbg !147
  %189 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %188, !dbg !147
  %190 = load i8** %189, align 8, !dbg !147
  %191 = getelementptr inbounds i8* %190, i64 %186, !dbg !147
  %192 = load i8* %191, align 1, !dbg !147
  %193 = sext i8 %192 to i32, !dbg !147
  %194 = load i32* %j, align 4, !dbg !147
  %195 = sext i32 %194 to i64, !dbg !147
  %196 = load i32* %i, align 4, !dbg !147
  %197 = sext i32 %196 to i64, !dbg !147
  %198 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %197, !dbg !147
  %199 = getelementptr inbounds [80 x i8]* %198, i32 0, i64 %195, !dbg !147
  %200 = load i8* %199, align 1, !dbg !147
  %201 = sext i8 %200 to i32, !dbg !147
  %202 = icmp ne i32 %193, %201, !dbg !147
  br i1 %202, label %203, label %206, !dbg !147

; <label>:203                                     ; preds = %164
  %204 = load i32* %errors, align 4, !dbg !149
  %205 = add nsw i32 %204, 1, !dbg !149
  store i32 %205, i32* %errors, align 4, !dbg !149
  br label %206, !dbg !149

; <label>:206                                     ; preds = %203, %164
  br label %207, !dbg !150

; <label>:207                                     ; preds = %206
  %208 = load i32* %j, align 4, !dbg !143
  %209 = add nsw i32 %208, 1, !dbg !143
  store i32 %209, i32* %j, align 4, !dbg !143
  br label %160, !dbg !143

; <label>:210                                     ; preds = %160
  %211 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str17, i32 0, i32 0)), !dbg !151
  br label %212, !dbg !152

; <label>:212                                     ; preds = %210, %128
  br label %213, !dbg !153

; <label>:213                                     ; preds = %212
  %214 = load i32* %i, align 4, !dbg !132
  %215 = add nsw i32 %214, 1, !dbg !132
  store i32 %215, i32* %i, align 4, !dbg !132
  br label %125, !dbg !132

; <label>:216                                     ; preds = %125
  %217 = load i32* %errors, align 4, !dbg !154
  %218 = icmp sgt i32 %217, 0, !dbg !154
  br i1 %218, label %219, label %225, !dbg !154

; <label>:219                                     ; preds = %216
  %220 = load i32* %errors, align 4, !dbg !156
  %221 = load i32* %errors, align 4, !dbg !156
  %222 = icmp sgt i32 %221, 1, !dbg !156
  %223 = select i1 %222, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str20, i32 0, i32 0), !dbg !156
  %224 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str18, i32 0, i32 0), i32 %220, i8* %223), !dbg !156
  br label %227, !dbg !158

; <label>:225                                     ; preds = %216
  %226 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0)), !dbg !159
  br label %227

; <label>:227                                     ; preds = %225, %219
  ret i32 0, !dbg !160
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal i32 @trace_line(i32 %line, double %ray_h) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %line, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !161), !dbg !162
  store double %ray_h, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !163), !dbg !164
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !165), !dbg !166
  store double 0.000000e+00, double* @object_distance, align 8, !dbg !167
  %4 = load double* %3, align 8, !dbg !168
  store double %4, double* @ray_height, align 8, !dbg !168
  store double 1.000000e+00, double* @from_index, align 8, !dbg !169
  store i32 1, i32* %i, align 4, !dbg !170
  br label %5, !dbg !170

; <label>:5                                       ; preds = %64, %0
  %6 = load i32* %i, align 4, !dbg !170
  %7 = load i16* @current_surfaces, align 2, !dbg !170
  %8 = sext i16 %7 to i32, !dbg !170
  %9 = icmp sle i32 %6, %8, !dbg !170
  br i1 %9, label %10, label %67, !dbg !170

; <label>:10                                      ; preds = %5
  %11 = load i32* %i, align 4, !dbg !172
  %12 = sext i32 %11 to i64, !dbg !172
  %13 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %12, !dbg !172
  %14 = getelementptr inbounds [5 x double]* %13, i32 0, i64 1, !dbg !172
  %15 = load double* %14, align 8, !dbg !172
  store double %15, double* @radius_of_curvature, align 8, !dbg !172
  %16 = load i32* %i, align 4, !dbg !174
  %17 = sext i32 %16 to i64, !dbg !174
  %18 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %17, !dbg !174
  %19 = getelementptr inbounds [5 x double]* %18, i32 0, i64 2, !dbg !174
  %20 = load double* %19, align 8, !dbg !174
  store double %20, double* @to_index, align 8, !dbg !174
  %21 = load double* @to_index, align 8, !dbg !175
  %22 = fcmp ogt double %21, 1.000000e+00, !dbg !175
  br i1 %22, label %23, label %49, !dbg !175

; <label>:23                                      ; preds = %10
  %24 = load double* @to_index, align 8, !dbg !177
  %25 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 4), align 8, !dbg !177
  %26 = load i32* %2, align 4, !dbg !177
  %27 = sext i32 %26 to i64, !dbg !177
  %28 = getelementptr inbounds [9 x double]* @spectral_line, i32 0, i64 %27, !dbg !177
  %29 = load double* %28, align 8, !dbg !177
  %30 = fsub double %25, %29, !dbg !177
  %31 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 3), align 8, !dbg !177
  %32 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 6), align 8, !dbg !177
  %33 = fsub double %31, %32, !dbg !177
  %34 = fdiv double %30, %33, !dbg !177
  %35 = load i32* %i, align 4, !dbg !177
  %36 = sext i32 %35 to i64, !dbg !177
  %37 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %36, !dbg !177
  %38 = getelementptr inbounds [5 x double]* %37, i32 0, i64 2, !dbg !177
  %39 = load double* %38, align 8, !dbg !177
  %40 = fsub double %39, 1.000000e+00, !dbg !177
  %41 = load i32* %i, align 4, !dbg !177
  %42 = sext i32 %41 to i64, !dbg !177
  %43 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %42, !dbg !177
  %44 = getelementptr inbounds [5 x double]* %43, i32 0, i64 3, !dbg !177
  %45 = load double* %44, align 8, !dbg !177
  %46 = fdiv double %40, %45, !dbg !177
  %47 = fmul double %34, %46, !dbg !177
  %48 = fadd double %24, %47, !dbg !177
  store double %48, double* @to_index, align 8, !dbg !177
  br label %49, !dbg !177

; <label>:49                                      ; preds = %23, %10
  call void @transit_surface(), !dbg !178
  %50 = load double* @to_index, align 8, !dbg !179
  store double %50, double* @from_index, align 8, !dbg !179
  %51 = load i32* %i, align 4, !dbg !180
  %52 = load i16* @current_surfaces, align 2, !dbg !180
  %53 = sext i16 %52 to i32, !dbg !180
  %54 = icmp slt i32 %51, %53, !dbg !180
  br i1 %54, label %55, label %63, !dbg !180

; <label>:55                                      ; preds = %49
  %56 = load double* @object_distance, align 8, !dbg !182
  %57 = load i32* %i, align 4, !dbg !182
  %58 = sext i32 %57 to i64, !dbg !182
  %59 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %58, !dbg !182
  %60 = getelementptr inbounds [5 x double]* %59, i32 0, i64 4, !dbg !182
  %61 = load double* %60, align 8, !dbg !182
  %62 = fsub double %56, %61, !dbg !182
  store double %62, double* @object_distance, align 8, !dbg !182
  br label %63, !dbg !182

; <label>:63                                      ; preds = %55, %49
  br label %64, !dbg !183

; <label>:64                                      ; preds = %63
  %65 = load i32* %i, align 4, !dbg !170
  %66 = add nsw i32 %65, 1, !dbg !170
  store i32 %66, i32* %i, align 4, !dbg !170
  br label %5, !dbg !170

; <label>:67                                      ; preds = %5
  %68 = load i32* %1, !dbg !184
  ret i32 %68, !dbg !184
}

; Function Attrs: nounwind
declare double @sin(double) #3

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind uwtable
define internal void @transit_surface() #0 {
  %iang = alloca double, align 8
  %rang = alloca double, align 8
  %iang_sin = alloca double, align 8
  %rang_sin = alloca double, align 8
  %old_axis_slope_angle = alloca double, align 8
  %sagitta = alloca double, align 8
  call void @llvm.dbg.declare(metadata !{double* %iang}, metadata !185), !dbg !186
  call void @llvm.dbg.declare(metadata !{double* %rang}, metadata !187), !dbg !188
  call void @llvm.dbg.declare(metadata !{double* %iang_sin}, metadata !189), !dbg !190
  call void @llvm.dbg.declare(metadata !{double* %rang_sin}, metadata !191), !dbg !192
  call void @llvm.dbg.declare(metadata !{double* %old_axis_slope_angle}, metadata !193), !dbg !194
  call void @llvm.dbg.declare(metadata !{double* %sagitta}, metadata !195), !dbg !194
  %1 = load i16* @paraxial, align 2, !dbg !196
  %2 = icmp ne i16 %1, 0, !dbg !196
  br i1 %2, label %3, label %54, !dbg !196

; <label>:3                                       ; preds = %0
  %4 = load double* @radius_of_curvature, align 8, !dbg !198
  %5 = fcmp une double %4, 0.000000e+00, !dbg !198
  br i1 %5, label %6, label %43, !dbg !198

; <label>:6                                       ; preds = %3
  %7 = load double* @object_distance, align 8, !dbg !201
  %8 = fcmp oeq double %7, 0.000000e+00, !dbg !201
  br i1 %8, label %9, label %13, !dbg !201

; <label>:9                                       ; preds = %6
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !204
  %10 = load double* @ray_height, align 8, !dbg !206
  %11 = load double* @radius_of_curvature, align 8, !dbg !206
  %12 = fdiv double %10, %11, !dbg !206
  store double %12, double* %iang_sin, align 8, !dbg !206
  br label %21, !dbg !207

; <label>:13                                      ; preds = %6
  %14 = load double* @object_distance, align 8, !dbg !208
  %15 = load double* @radius_of_curvature, align 8, !dbg !208
  %16 = fsub double %14, %15, !dbg !208
  %17 = load double* @radius_of_curvature, align 8, !dbg !208
  %18 = fdiv double %16, %17, !dbg !208
  %19 = load double* @axis_slope_angle, align 8, !dbg !208
  %20 = fmul double %18, %19, !dbg !208
  store double %20, double* %iang_sin, align 8, !dbg !208
  br label %21

; <label>:21                                      ; preds = %13, %9
  %22 = load double* @from_index, align 8, !dbg !209
  %23 = load double* @to_index, align 8, !dbg !209
  %24 = fdiv double %22, %23, !dbg !209
  %25 = load double* %iang_sin, align 8, !dbg !209
  %26 = fmul double %24, %25, !dbg !209
  store double %26, double* %rang_sin, align 8, !dbg !209
  %27 = load double* @axis_slope_angle, align 8, !dbg !210
  store double %27, double* %old_axis_slope_angle, align 8, !dbg !210
  %28 = load double* @axis_slope_angle, align 8, !dbg !211
  %29 = load double* %iang_sin, align 8, !dbg !211
  %30 = fadd double %28, %29, !dbg !211
  %31 = load double* %rang_sin, align 8, !dbg !211
  %32 = fsub double %30, %31, !dbg !211
  store double %32, double* @axis_slope_angle, align 8, !dbg !211
  %33 = load double* @object_distance, align 8, !dbg !212
  %34 = fcmp une double %33, 0.000000e+00, !dbg !212
  br i1 %34, label %35, label %39, !dbg !212

; <label>:35                                      ; preds = %21
  %36 = load double* @object_distance, align 8, !dbg !214
  %37 = load double* %old_axis_slope_angle, align 8, !dbg !214
  %38 = fmul double %36, %37, !dbg !214
  store double %38, double* @ray_height, align 8, !dbg !214
  br label %39, !dbg !214

; <label>:39                                      ; preds = %35, %21
  %40 = load double* @ray_height, align 8, !dbg !215
  %41 = load double* @axis_slope_angle, align 8, !dbg !215
  %42 = fdiv double %40, %41, !dbg !215
  store double %42, double* @object_distance, align 8, !dbg !215
  br label %134, !dbg !216

; <label>:43                                      ; preds = %3
  %44 = load double* @object_distance, align 8, !dbg !217
  %45 = load double* @to_index, align 8, !dbg !217
  %46 = load double* @from_index, align 8, !dbg !217
  %47 = fdiv double %45, %46, !dbg !217
  %48 = fmul double %44, %47, !dbg !217
  store double %48, double* @object_distance, align 8, !dbg !217
  %49 = load double* @axis_slope_angle, align 8, !dbg !218
  %50 = load double* @from_index, align 8, !dbg !218
  %51 = load double* @to_index, align 8, !dbg !218
  %52 = fdiv double %50, %51, !dbg !218
  %53 = fmul double %49, %52, !dbg !218
  store double %53, double* @axis_slope_angle, align 8, !dbg !218
  br label %134, !dbg !219

; <label>:54                                      ; preds = %0
  %55 = load double* @radius_of_curvature, align 8, !dbg !220
  %56 = fcmp une double %55, 0.000000e+00, !dbg !220
  br i1 %56, label %57, label %111, !dbg !220

; <label>:57                                      ; preds = %54
  %58 = load double* @object_distance, align 8, !dbg !222
  %59 = fcmp oeq double %58, 0.000000e+00, !dbg !222
  br i1 %59, label %60, label %64, !dbg !222

; <label>:60                                      ; preds = %57
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !225
  %61 = load double* @ray_height, align 8, !dbg !227
  %62 = load double* @radius_of_curvature, align 8, !dbg !227
  %63 = fdiv double %61, %62, !dbg !227
  store double %63, double* %iang_sin, align 8, !dbg !227
  br label %73, !dbg !228

; <label>:64                                      ; preds = %57
  %65 = load double* @object_distance, align 8, !dbg !229
  %66 = load double* @radius_of_curvature, align 8, !dbg !229
  %67 = fsub double %65, %66, !dbg !229
  %68 = load double* @radius_of_curvature, align 8, !dbg !229
  %69 = fdiv double %67, %68, !dbg !229
  %70 = load double* @axis_slope_angle, align 8, !dbg !231
  %71 = call double @sin(double %70) #5, !dbg !231
  %72 = fmul double %69, %71, !dbg !231
  store double %72, double* %iang_sin, align 8, !dbg !231
  br label %73

; <label>:73                                      ; preds = %64, %60
  %74 = load double* %iang_sin, align 8, !dbg !232
  %75 = call double @asin(double %74) #5, !dbg !232
  store double %75, double* %iang, align 8, !dbg !232
  %76 = load double* @from_index, align 8, !dbg !233
  %77 = load double* @to_index, align 8, !dbg !233
  %78 = fdiv double %76, %77, !dbg !233
  %79 = load double* %iang_sin, align 8, !dbg !233
  %80 = fmul double %78, %79, !dbg !233
  store double %80, double* %rang_sin, align 8, !dbg !233
  %81 = load double* @axis_slope_angle, align 8, !dbg !234
  store double %81, double* %old_axis_slope_angle, align 8, !dbg !234
  %82 = load double* @axis_slope_angle, align 8, !dbg !235
  %83 = load double* %iang, align 8, !dbg !235
  %84 = fadd double %82, %83, !dbg !235
  %85 = load double* %rang_sin, align 8, !dbg !236
  %86 = call double @asin(double %85) #5, !dbg !236
  %87 = fsub double %84, %86, !dbg !236
  store double %87, double* @axis_slope_angle, align 8, !dbg !236
  %88 = load double* %old_axis_slope_angle, align 8, !dbg !237
  %89 = load double* %iang, align 8, !dbg !237
  %90 = fadd double %88, %89, !dbg !237
  %91 = fdiv double %90, 2.000000e+00, !dbg !237
  %92 = call double @sin(double %91) #5, !dbg !237
  store double %92, double* %sagitta, align 8, !dbg !237
  %93 = load double* @radius_of_curvature, align 8, !dbg !238
  %94 = fmul double 2.000000e+00, %93, !dbg !238
  %95 = load double* %sagitta, align 8, !dbg !238
  %96 = fmul double %94, %95, !dbg !238
  %97 = load double* %sagitta, align 8, !dbg !238
  %98 = fmul double %96, %97, !dbg !238
  store double %98, double* %sagitta, align 8, !dbg !238
  %99 = load double* @radius_of_curvature, align 8, !dbg !239
  %100 = load double* %old_axis_slope_angle, align 8, !dbg !239
  %101 = load double* %iang, align 8, !dbg !239
  %102 = fadd double %100, %101, !dbg !239
  %103 = call double @sin(double %102) #5, !dbg !239
  %104 = fmul double %99, %103, !dbg !239
  %105 = load double* @axis_slope_angle, align 8, !dbg !240
  %106 = call double @tan(double %105) #5, !dbg !240
  %107 = fdiv double 1.000000e+00, %106, !dbg !240
  %108 = fmul double %104, %107, !dbg !240
  %109 = load double* %sagitta, align 8, !dbg !240
  %110 = fadd double %108, %109, !dbg !240
  store double %110, double* @object_distance, align 8, !dbg !240
  br label %134, !dbg !241

; <label>:111                                     ; preds = %54
  %112 = load double* @from_index, align 8, !dbg !242
  %113 = load double* @to_index, align 8, !dbg !242
  %114 = fdiv double %112, %113, !dbg !242
  %115 = load double* @axis_slope_angle, align 8, !dbg !243
  %116 = call double @sin(double %115) #5, !dbg !243
  %117 = fmul double %114, %116, !dbg !243
  %118 = call double @asin(double %117) #5, !dbg !242
  %119 = fsub double -0.000000e+00, %118, !dbg !242
  store double %119, double* %rang, align 8, !dbg !242
  %120 = load double* @object_distance, align 8, !dbg !244
  %121 = load double* @to_index, align 8, !dbg !244
  %122 = load double* %rang, align 8, !dbg !245
  %123 = fsub double -0.000000e+00, %122, !dbg !245
  %124 = call double @cos(double %123) #5, !dbg !245
  %125 = fmul double %121, %124, !dbg !245
  %126 = load double* @from_index, align 8, !dbg !245
  %127 = load double* @axis_slope_angle, align 8, !dbg !246
  %128 = call double @cos(double %127) #5, !dbg !246
  %129 = fmul double %126, %128, !dbg !246
  %130 = fdiv double %125, %129, !dbg !246
  %131 = fmul double %120, %130, !dbg !246
  store double %131, double* @object_distance, align 8, !dbg !246
  %132 = load double* %rang, align 8, !dbg !247
  %133 = fsub double -0.000000e+00, %132, !dbg !247
  store double %133, double* @axis_slope_angle, align 8, !dbg !247
  br label %134, !dbg !248

; <label>:134                                     ; preds = %111, %73, %43, %39
  ret void, !dbg !248
}

; Function Attrs: nounwind
declare double @asin(double) #3

; Function Attrs: nounwind
declare double @tan(double) #3

; Function Attrs: nounwind
declare double @cos(double) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !19, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 679, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 682} ; [ DW_TAG_subprogram ] [line 679] [def] [scope 682] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"trace_line", metadata !"trace_line", metadata !"", i32 651, metadata !13, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, double)* @trace_line, null, null, metadata !2, i32 654} ; [ DW_TAG_subprogram ] [line 651] [local] [def] [scope 654] [trace_line]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8, metadata !8, metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"transit_surface", metadata !"transit_surface", metadata !"", i32 586, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @transit_surface, null, null, metadata !2, i32 586} ; [ DW_TAG_subprogram ] [line 586] [local] [def] [transit_surface]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null}
!19 = metadata !{metadata !20, metadata !21, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !37, metadata !42, metadata !46, metadata !51, metadata !52, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59}
!20 = metadata !{i32 786484, i32 0, null, metadata !"niter", metadata !"niter", metadata !"", metadata !5, i32 283, metadata !8, i32 0, i32 1, i32* @niter, null} ; [ DW_TAG_variable ] [niter] [line 283] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"current_surfaces", metadata !"current_surfaces", metadata !"", metadata !5, i32 248, metadata !22, i32 1, i32 1, i16* @current_surfaces, null} ; [ DW_TAG_variable ] [current_surfaces] [line 248] [local] [def]
!22 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!23 = metadata !{i32 786484, i32 0, null, metadata !"paraxial", metadata !"paraxial", metadata !"", metadata !5, i32 249, metadata !22, i32 1, i32 1, i16* @paraxial, null} ; [ DW_TAG_variable ] [paraxial] [line 249] [local] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"clear_aperture", metadata !"clear_aperture", metadata !"", metadata !5, i32 251, metadata !15, i32 1, i32 1, double* @clear_aperture, null} ; [ DW_TAG_variable ] [clear_aperture] [line 251] [local] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"aberr_lspher", metadata !"aberr_lspher", metadata !"", metadata !5, i32 253, metadata !15, i32 1, i32 1, double* @aberr_lspher, null} ; [ DW_TAG_variable ] [aberr_lspher] [line 253] [local] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"aberr_osc", metadata !"aberr_osc", metadata !"", metadata !5, i32 254, metadata !15, i32 1, i32 1, double* @aberr_osc, null} ; [ DW_TAG_variable ] [aberr_osc] [line 254] [local] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"aberr_lchrom", metadata !"aberr_lchrom", metadata !"", metadata !5, i32 255, metadata !15, i32 1, i32 1, double* @aberr_lchrom, null} ; [ DW_TAG_variable ] [aberr_lchrom] [line 255] [local] [def]
!28 = metadata !{i32 786484, i32 0, null, metadata !"max_lspher", metadata !"max_lspher", metadata !"", metadata !5, i32 257, metadata !15, i32 1, i32 1, double* @max_lspher, null} ; [ DW_TAG_variable ] [max_lspher] [line 257] [local] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"max_osc", metadata !"max_osc", metadata !"", metadata !5, i32 258, metadata !15, i32 1, i32 1, double* @max_osc, null} ; [ DW_TAG_variable ] [max_osc] [line 258] [local] [def]
!30 = metadata !{i32 786484, i32 0, null, metadata !"max_lchrom", metadata !"max_lchrom", metadata !"", metadata !5, i32 259, metadata !15, i32 1, i32 1, double* @max_lchrom, null} ; [ DW_TAG_variable ] [max_lchrom] [line 259] [local] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"object_distance", metadata !"object_distance", metadata !"", metadata !5, i32 262, metadata !15, i32 1, i32 1, double* @object_distance, null} ; [ DW_TAG_variable ] [object_distance] [line 262] [local] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"axis_slope_angle", metadata !"axis_slope_angle", metadata !"", metadata !5, i32 264, metadata !15, i32 1, i32 1, double* @axis_slope_angle, null} ; [ DW_TAG_variable ] [axis_slope_angle] [line 264] [local] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"spectral_line", metadata !"spectral_line", metadata !"", metadata !5, i32 268, metadata !34, i32 1, i32 1, [9 x double]* @spectral_line, null} ; [ DW_TAG_variable ] [spectral_line] [line 268] [local] [def]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 576, i64 64, i32 0, i32 0, metadata !15, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 576, align 64, offset 0] [from double]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ] [0, 8]
!37 = metadata !{i32 786484, i32 0, null, metadata !"s", metadata !"s", metadata !"", metadata !5, i32 269, metadata !38, i32 1, i32 1, [10 x [5 x double]]* @s, null} ; [ DW_TAG_variable ] [s] [line 269] [local] [def]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200, i64 64, i32 0, i32 0, metadata !15, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 64, offset 0] [from double]
!39 = metadata !{metadata !40, metadata !41}
!40 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!41 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!42 = metadata !{i32 786484, i32 0, null, metadata !"od_sa", metadata !"od_sa", metadata !"", metadata !5, i32 270, metadata !43, i32 1, i32 1, [2 x [2 x double]]* @od_sa, null} ; [ DW_TAG_variable ] [od_sa] [line 270] [local] [def]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !15, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from double]
!44 = metadata !{metadata !45, metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!46 = metadata !{i32 786484, i32 0, null, metadata !"outarr", metadata !"outarr", metadata !"", metadata !5, i32 272, metadata !47, i32 1, i32 1, [8 x [80 x i8]]* @outarr, null} ; [ DW_TAG_variable ] [outarr] [line 272] [local] [def]
!47 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 5120, i64 8, i32 0, i32 0, metadata !11, metadata !48, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5120, align 8, offset 0] [from char]
!48 = metadata !{metadata !49, metadata !50}
!49 = metadata !{i32 786465, i64 0, i64 8}        ; [ DW_TAG_subrange_type ] [0, 7]
!50 = metadata !{i32 786465, i64 0, i64 80}       ; [ DW_TAG_subrange_type ] [0, 79]
!51 = metadata !{i32 786484, i32 0, null, metadata !"itercount", metadata !"itercount", metadata !"", metadata !5, i32 274, metadata !8, i32 0, i32 1, i32* @itercount, null} ; [ DW_TAG_variable ] [itercount] [line 274] [def]
!52 = metadata !{i32 786484, i32 0, null, metadata !"refarr", metadata !"refarr", metadata !"", metadata !5, i32 285, metadata !53, i32 1, i32 1, [8 x i8*]* @refarr, null} ; [ DW_TAG_variable ] [refarr] [line 285] [local] [def]
!53 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 64, i32 0, i32 0, metadata !10, metadata !54, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!54 = metadata !{metadata !49}
!55 = metadata !{i32 786484, i32 0, null, metadata !"to_index", metadata !"to_index", metadata !"", metadata !5, i32 266, metadata !15, i32 1, i32 1, double* @to_index, null} ; [ DW_TAG_variable ] [to_index] [line 266] [local] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"radius_of_curvature", metadata !"radius_of_curvature", metadata !"", metadata !5, i32 261, metadata !15, i32 1, i32 1, double* @radius_of_curvature, null} ; [ DW_TAG_variable ] [radius_of_curvature] [line 261] [local] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"from_index", metadata !"from_index", metadata !"", metadata !5, i32 265, metadata !15, i32 1, i32 1, double* @from_index, null} ; [ DW_TAG_variable ] [from_index] [line 265] [local] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"ray_height", metadata !"ray_height", metadata !"", metadata !5, i32 263, metadata !15, i32 1, i32 1, double* @ray_height, null} ; [ DW_TAG_variable ] [ray_height] [line 263] [local] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"testcase", metadata !"testcase", metadata !"", metadata !5, i32 304, metadata !60, i32 1, i32 1, [4 x [4 x double]]* @testcase, null} ; [ DW_TAG_variable ] [testcase] [line 304] [local] [def]
!60 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !15, metadata !61, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from double]
!61 = metadata !{metadata !62, metadata !62}
!62 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!63 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!64 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!65 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!66 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777896, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 680]
!67 = metadata !{i32 680, i32 0, metadata !4, null}
!68 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33555113, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 681]
!69 = metadata !{i32 681, i32 0, metadata !4, null}
!70 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 683]
!71 = metadata !{i32 683, i32 0, metadata !4, null}
!72 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 683]
!73 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 683]
!74 = metadata !{i32 786688, metadata !4, metadata !"errors", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [errors] [line 683]
!75 = metadata !{i32 786688, metadata !4, metadata !"od_fline", metadata !5, i32 684, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [od_fline] [line 684]
!76 = metadata !{i32 684, i32 0, metadata !4, null}
!77 = metadata !{i32 786688, metadata !4, metadata !"od_cline", metadata !5, i32 684, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [od_cline] [line 684]
!78 = metadata !{i32 689, i32 0, metadata !4, null}
!79 = metadata !{i32 690, i32 0, metadata !4, null}
!80 = metadata !{i32 691, i32 0, metadata !4, null}
!81 = metadata !{i32 692, i32 0, metadata !4, null}
!82 = metadata !{i32 693, i32 0, metadata !4, null}
!83 = metadata !{i32 694, i32 0, metadata !4, null}
!84 = metadata !{i32 695, i32 0, metadata !4, null}
!85 = metadata !{i32 696, i32 0, metadata !4, null}
!86 = metadata !{i32 700, i32 0, metadata !4, null}
!87 = metadata !{i32 704, i32 0, metadata !4, null}
!88 = metadata !{i32 705, i32 0, metadata !4, null}
!89 = metadata !{i32 706, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !4, i32 706, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!91 = metadata !{i32 707, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !90, i32 707, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!93 = metadata !{i32 708, i32 0, metadata !92, null}
!94 = metadata !{i32 714, i32 0, metadata !4, null}
!95 = metadata !{i32 715, i32 0, metadata !4, null}
!96 = metadata !{i32 718, i32 0, metadata !4, null}
!97 = metadata !{i32 719, i32 0, metadata !4, null}
!98 = metadata !{i32 720, i32 0, metadata !4, null}
!99 = metadata !{i32 732, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !4, i32 732, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!101 = metadata !{i32 735, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !103, i32 735, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!103 = metadata !{i32 786443, metadata !1, metadata !100, i32 732, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!104 = metadata !{i32 739, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !102, i32 735, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!106 = metadata !{i32 740, i32 0, metadata !105, null}
!107 = metadata !{i32 741, i32 0, metadata !105, null}
!108 = metadata !{i32 742, i32 0, metadata !105, null}
!109 = metadata !{i32 743, i32 0, metadata !103, null}
!110 = metadata !{i32 747, i32 0, metadata !103, null}
!111 = metadata !{i32 748, i32 0, metadata !103, null}
!112 = metadata !{i32 752, i32 0, metadata !103, null}
!113 = metadata !{i32 753, i32 0, metadata !103, null}
!114 = metadata !{i32 755, i32 0, metadata !103, null}
!115 = metadata !{i32 756, i32 0, metadata !103, null}
!116 = metadata !{i32 757, i32 0, metadata !103, null}
!117 = metadata !{i32 758, i32 0, metadata !103, null}
!118 = metadata !{i32 759, i32 0, metadata !103, null}
!119 = metadata !{i32 763, i32 0, metadata !103, null}
!120 = metadata !{i32 764, i32 0, metadata !103, null}
!121 = metadata !{i32 765, i32 0, metadata !103, null}
!122 = metadata !{i32 767, i32 0, metadata !103, null}
!123 = metadata !{i32 772, i32 0, metadata !4, null}
!124 = metadata !{i32 774, i32 0, metadata !4, null}
!125 = metadata !{i32 776, i32 0, metadata !4, null}
!126 = metadata !{i32 779, i32 0, metadata !4, null}
!127 = metadata !{i32 782, i32 0, metadata !4, null}
!128 = metadata !{i32 785, i32 0, metadata !4, null}
!129 = metadata !{i32 788, i32 0, metadata !4, null}
!130 = metadata !{i32 791, i32 0, metadata !4, null}
!131 = metadata !{i32 798, i32 0, metadata !4, null}
!132 = metadata !{i32 799, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !4, i32 799, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!134 = metadata !{i32 800, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !136, i32 800, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!136 = metadata !{i32 786443, metadata !1, metadata !133, i32 799, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!137 = metadata !{i32 805, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !135, i32 800, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!139 = metadata !{i32 807, i32 0, metadata !138, null}
!140 = metadata !{i32 808, i32 0, metadata !138, null}
!141 = metadata !{i32 809, i32 0, metadata !138, null}
!142 = metadata !{i32 810, i32 0, metadata !138, null}
!143 = metadata !{i32 811, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !138, i32 811, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!145 = metadata !{i32 812, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !144, i32 811, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!147 = metadata !{i32 813, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !146, i32 813, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!149 = metadata !{i32 814, i32 0, metadata !148, null}
!150 = metadata !{i32 815, i32 0, metadata !146, null}
!151 = metadata !{i32 816, i32 0, metadata !138, null}
!152 = metadata !{i32 817, i32 0, metadata !138, null}
!153 = metadata !{i32 818, i32 0, metadata !136, null}
!154 = metadata !{i32 822, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !4, i32 822, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!156 = metadata !{i32 823, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !155, i32 822, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!158 = metadata !{i32 825, i32 0, metadata !157, null}
!159 = metadata !{i32 826, i32 0, metadata !155, null}
!160 = metadata !{i32 828, i32 0, metadata !4, null}
!161 = metadata !{i32 786689, metadata !12, metadata !"line", metadata !5, i32 16777868, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [line] [line 652]
!162 = metadata !{i32 652, i32 0, metadata !12, null}
!163 = metadata !{i32 786689, metadata !12, metadata !"ray_h", metadata !5, i32 33555085, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ray_h] [line 653]
!164 = metadata !{i32 653, i32 0, metadata !12, null}
!165 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 655, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 655]
!166 = metadata !{i32 655, i32 0, metadata !12, null}
!167 = metadata !{i32 657, i32 0, metadata !12, null}
!168 = metadata !{i32 658, i32 0, metadata !12, null}
!169 = metadata !{i32 659, i32 0, metadata !12, null}
!170 = metadata !{i32 661, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !12, i32 661, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!172 = metadata !{i32 662, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !171, i32 661, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!174 = metadata !{i32 663, i32 0, metadata !173, null}
!175 = metadata !{i32 664, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !173, i32 664, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!177 = metadata !{i32 665, i32 0, metadata !176, null}
!178 = metadata !{i32 669, i32 0, metadata !173, null}
!179 = metadata !{i32 670, i32 0, metadata !173, null}
!180 = metadata !{i32 671, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !173, i32 671, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!182 = metadata !{i32 672, i32 0, metadata !181, null}
!183 = metadata !{i32 673, i32 0, metadata !173, null}
!184 = metadata !{i32 674, i32 0, metadata !12, null}
!185 = metadata !{i32 786688, metadata !16, metadata !"iang", metadata !5, i32 587, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iang] [line 587]
!186 = metadata !{i32 587, i32 0, metadata !16, null}
!187 = metadata !{i32 786688, metadata !16, metadata !"rang", metadata !5, i32 588, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rang] [line 588]
!188 = metadata !{i32 588, i32 0, metadata !16, null}
!189 = metadata !{i32 786688, metadata !16, metadata !"iang_sin", metadata !5, i32 589, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iang_sin] [line 589]
!190 = metadata !{i32 589, i32 0, metadata !16, null}
!191 = metadata !{i32 786688, metadata !16, metadata !"rang_sin", metadata !5, i32 590, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rang_sin] [line 590]
!192 = metadata !{i32 590, i32 0, metadata !16, null}
!193 = metadata !{i32 786688, metadata !16, metadata !"old_axis_slope_angle", metadata !5, i32 591, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_axis_slope_angle] [line 591]
!194 = metadata !{i32 591, i32 0, metadata !16, null}
!195 = metadata !{i32 786688, metadata !16, metadata !"sagitta", metadata !5, i32 591, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sagitta] [line 591]
!196 = metadata !{i32 593, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !16, i32 593, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!198 = metadata !{i32 594, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !200, i32 594, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!200 = metadata !{i32 786443, metadata !1, metadata !197, i32 593, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!201 = metadata !{i32 595, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !203, i32 595, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!203 = metadata !{i32 786443, metadata !1, metadata !199, i32 594, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!204 = metadata !{i32 596, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !202, i32 595, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!206 = metadata !{i32 597, i32 0, metadata !205, null}
!207 = metadata !{i32 598, i32 0, metadata !205, null}
!208 = metadata !{i32 599, i32 0, metadata !202, null}
!209 = metadata !{i32 603, i32 0, metadata !203, null}
!210 = metadata !{i32 605, i32 0, metadata !203, null}
!211 = metadata !{i32 606, i32 0, metadata !203, null}
!212 = metadata !{i32 608, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !203, i32 608, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!214 = metadata !{i32 609, i32 0, metadata !213, null}
!215 = metadata !{i32 610, i32 0, metadata !203, null}
!216 = metadata !{i32 611, i32 0, metadata !203, null}
!217 = metadata !{i32 613, i32 0, metadata !200, null}
!218 = metadata !{i32 614, i32 0, metadata !200, null}
!219 = metadata !{i32 615, i32 0, metadata !200, null}
!220 = metadata !{i32 618, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !16, i32 618, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!222 = metadata !{i32 619, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !224, i32 619, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!224 = metadata !{i32 786443, metadata !1, metadata !221, i32 618, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!225 = metadata !{i32 620, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !223, i32 619, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!227 = metadata !{i32 621, i32 0, metadata !226, null}
!228 = metadata !{i32 622, i32 0, metadata !226, null}
!229 = metadata !{i32 623, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !223, i32 622, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!231 = metadata !{i32 625, i32 0, metadata !230, null}
!232 = metadata !{i32 627, i32 0, metadata !224, null}
!233 = metadata !{i32 628, i32 0, metadata !224, null}
!234 = metadata !{i32 630, i32 0, metadata !224, null}
!235 = metadata !{i32 631, i32 0, metadata !224, null}
!236 = metadata !{i32 632, i32 0, metadata !224, null}
!237 = metadata !{i32 633, i32 0, metadata !224, null}
!238 = metadata !{i32 634, i32 0, metadata !224, null}
!239 = metadata !{i32 635, i32 0, metadata !224, null}
!240 = metadata !{i32 637, i32 0, metadata !224, null}
!241 = metadata !{i32 638, i32 0, metadata !224, null}
!242 = metadata !{i32 641, i32 0, metadata !16, null}
!243 = metadata !{i32 642, i32 0, metadata !16, null}
!244 = metadata !{i32 643, i32 0, metadata !16, null}
!245 = metadata !{i32 644, i32 0, metadata !16, null}
!246 = metadata !{i32 645, i32 0, metadata !16, null}
!247 = metadata !{i32 646, i32 0, metadata !16, null}
!248 = metadata !{i32 647, i32 0, metadata !16, null}
