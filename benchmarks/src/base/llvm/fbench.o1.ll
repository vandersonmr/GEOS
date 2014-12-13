; ModuleID = 'fbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@niter = global i32 1000, align 4
@spectral_line = internal unnamed_addr global [9 x double] zeroinitializer, align 16
@current_surfaces = internal unnamed_addr global i1 false
@testcase = internal unnamed_addr constant [4 x [4 x double]] [[4 x double] [double 2.705000e+01, double 1.513700e+00, double 6.360000e+01, double 5.200000e-01], [4 x double] [double -1.668000e+01, double 1.000000e+00, double 0.000000e+00, double 1.380000e-01], [4 x double] [double -1.668000e+01, double 1.616400e+00, double 3.670000e+01, double 3.800000e-01], [4 x double] [double -7.810000e+01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00]], align 16
@s = internal unnamed_addr global [10 x [5 x double]] zeroinitializer, align 16
@.str = private unnamed_addr constant [54 x i8] c"Ready to begin John Walker's floating point accuracy\0A\00", align 1
@.str1 = private unnamed_addr constant [58 x i8] c"and performance benchmark.  %d iterations will be made.\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [56 x i8] c"\0AMeasured run time in seconds should be divided by %.f\0A\00", align 1
@.str3 = private unnamed_addr constant [60 x i8] c"to normalise for reporting results.  For archival results,\0A\00", align 1
@.str4 = private unnamed_addr constant [67 x i8] c"adjust iteration count so the benchmark runs about five minutes.\0A\0A\00", align 1
@itercount = common global i32 0, align 4
@paraxial = internal unnamed_addr global i16 0, align 2
@object_distance = internal unnamed_addr global double 0.000000e+00, align 8
@od_sa = internal unnamed_addr global [2 x [2 x double]] zeroinitializer, align 16
@axis_slope_angle = internal unnamed_addr global double 0.000000e+00, align 8
@outarr = internal global [8 x [80 x i8]] zeroinitializer, align 16
@.str5 = private unnamed_addr constant [24 x i8] c"%15s   %21.11f  %14.11f\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"Marginal ray\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Paraxial ray\00", align 1
@.str8 = private unnamed_addr constant [48 x i8] c"Longitudinal spherical aberration:      %16.11f\00", align 1
@.str9 = private unnamed_addr constant [48 x i8] c"    (Maximum permissible):              %16.11f\00", align 1
@.str10 = private unnamed_addr constant [48 x i8] c"Offense against sine condition (coma):  %16.11f\00", align 1
@.str11 = private unnamed_addr constant [48 x i8] c"Axial chromatic aberration:             %16.11f\00", align 1
@refarr = internal unnamed_addr constant [8 x i8*] [i8* getelementptr inbounds ([56 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str23, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str25, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str27, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str28, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str25, i32 0, i32 0)], align 16
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
@ray_height = internal unnamed_addr global double 0.000000e+00, align 8
@from_index = internal unnamed_addr global double 0.000000e+00, align 8
@radius_of_curvature = internal unnamed_addr global double 0.000000e+00, align 8
@to_index = internal unnamed_addr global double 0.000000e+00, align 8
@str = private unnamed_addr constant [53 x i8] c"Ready to begin John Walker's floating point accuracy\00"
@str29 = private unnamed_addr constant [59 x i8] c"to normalise for reporting results.  For archival results,\00"
@str30 = private unnamed_addr constant [66 x i8] c"adjust iteration count so the benchmark runs about five minutes.\0A\00"
@str31 = private unnamed_addr constant [23 x i8] c"\0ANo errors in results.\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
.preheader6.lr.ph:
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !95
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !96
  store double 7.621000e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 1), align 8, !dbg !97, !tbaa !98
  store double 6.869955e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 2), align 16, !dbg !102, !tbaa !98
  store double 6.562816e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 3), align 8, !dbg !103, !tbaa !98
  store double 5.895944e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 4), align 16, !dbg !104, !tbaa !98
  store double 5.269557e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 5), align 8, !dbg !105, !tbaa !98
  store double 4.861344e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 6), align 16, !dbg !106, !tbaa !98
  store double 4.340477e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 7), align 8, !dbg !107, !tbaa !98
  store double 3.968494e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 8), align 16, !dbg !108, !tbaa !98
  store i32 1000000, i32* @niter, align 4, !dbg !109, !tbaa !110
  store i1 true, i1* @current_surfaces, align 1
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !15), !dbg !113
  br label %0, !dbg !113

; <label>:0                                       ; preds = %0, %.preheader6.lr.ph
  %indvar = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvar.next, %0 ]
  %i.037 = phi i32 [ 0, %.preheader6.lr.ph ], [ %2, %0 ]
  %1 = add i64 %indvar, 1, !dbg !115
  %scevgep = getelementptr [10 x [5 x double]]* @s, i64 0, i64 %1, i64 1
  %scevgep53 = bitcast double* %scevgep to i8*
  %scevgep54 = getelementptr [4 x [4 x double]]* @testcase, i64 0, i64 %indvar, i64 0
  %scevgep5455 = bitcast double* %scevgep54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep53, i8* %scevgep5455, i64 32, i32 8, i1 false), !dbg !115
  %2 = add nsw i32 %i.037, 1, !dbg !113
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !15), !dbg !113
  %3 = icmp slt i32 %2, 4, !dbg !113
  %indvar.next = add i64 %indvar, 1, !dbg !113
  br i1 %3, label %0, label %._crit_edge38, !dbg !113

._crit_edge38:                                    ; preds = %0
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str, i64 0, i64 0)), !dbg !117
  %4 = load i32* @niter, align 4, !dbg !118, !tbaa !110
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i64 0, i64 0), i32 %4) #4, !dbg !118
  %6 = load i32* @niter, align 4, !dbg !119, !tbaa !110
  %7 = sitofp i32 %6 to double, !dbg !119
  %8 = fdiv double %7, 1.000000e+03, !dbg !119
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i64 0, i64 0), double %8) #4, !dbg !119
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @str29, i64 0, i64 0)), !dbg !120
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8]* @str30, i64 0, i64 0)), !dbg !121
  store i32 0, i32* @itercount, align 4, !dbg !122, !tbaa !110
  %10 = load i32* @niter, align 4, !dbg !122, !tbaa !110
  %11 = icmp sgt i32 %10, 0, !dbg !122
  br i1 %11, label %.preheader, label %47, !dbg !122

.preheader:                                       ; preds = %._crit_edge38, %24
  store i16 0, i16* @paraxial, align 2, !dbg !124, !tbaa !127
  br label %12, !dbg !124

; <label>:12                                      ; preds = %.preheader, %12
  tail call fastcc void @trace_line(i32 4, double 2.000000e+00), !dbg !129
  %13 = load double* @object_distance, align 8, !dbg !131, !tbaa !98
  %14 = load i16* @paraxial, align 2, !dbg !131, !tbaa !127
  %15 = sext i16 %14 to i64, !dbg !131
  %16 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %15, i64 0, !dbg !131
  store double %13, double* %16, align 16, !dbg !131, !tbaa !98
  %17 = load double* @axis_slope_angle, align 8, !dbg !132, !tbaa !98
  %18 = load i16* @paraxial, align 2, !dbg !132, !tbaa !127
  %19 = sext i16 %18 to i64, !dbg !132
  %20 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %19, i64 1, !dbg !132
  store double %17, double* %20, align 8, !dbg !132, !tbaa !98
  %21 = load i16* @paraxial, align 2, !dbg !124, !tbaa !127
  %22 = add i16 %21, 1, !dbg !124
  store i16 %22, i16* @paraxial, align 2, !dbg !124, !tbaa !127
  %23 = icmp slt i16 %22, 2, !dbg !124
  br i1 %23, label %12, label %24, !dbg !124

; <label>:24                                      ; preds = %12
  store i16 0, i16* @paraxial, align 2, !dbg !133, !tbaa !127
  tail call fastcc void @trace_line(i32 3, double 2.000000e+00), !dbg !134
  %25 = load double* @object_distance, align 8, !dbg !135, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !21), !dbg !135
  tail call fastcc void @trace_line(i32 6, double 2.000000e+00), !dbg !136
  %26 = load double* @object_distance, align 8, !dbg !137, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %26}, i64 0, metadata !19), !dbg !137
  %27 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !138, !tbaa !98
  %28 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !138, !tbaa !98
  %29 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !139, !tbaa !98
  %30 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !140, !tbaa !98
  %31 = tail call double @sin(double %30) #4, !dbg !140
  %32 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !140, !tbaa !98
  %33 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !141, !tbaa !98
  %34 = tail call double @sin(double %33) #4, !dbg !141
  %35 = load i32* @itercount, align 4, !dbg !122, !tbaa !110
  %36 = add nsw i32 %35, 1, !dbg !122
  store i32 %36, i32* @itercount, align 4, !dbg !122, !tbaa !110
  %37 = load i32* @niter, align 4, !dbg !122, !tbaa !110
  %38 = icmp slt i32 %36, %37, !dbg !122
  br i1 %38, label %.preheader, label %._crit_edge15, !dbg !122

._crit_edge15:                                    ; preds = %24
  %39 = fsub double %27, %28, !dbg !138
  %40 = fmul double %27, %29, !dbg !139
  %41 = fmul double %31, %32, !dbg !140
  %42 = fdiv double %40, %41, !dbg !140
  %43 = fsub double 1.000000e+00, %42, !dbg !140
  %44 = fsub double %26, %25, !dbg !142
  %45 = fmul double %34, %34, !dbg !143
  %46 = fdiv double 9.260000e-05, %45, !dbg !143
  br label %47, !dbg !122

; <label>:47                                      ; preds = %._crit_edge15, %._crit_edge38
  %.lcssa10 = phi double [ %39, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa9 = phi double [ %43, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa8 = phi double [ %44, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa7 = phi double [ %46, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa = phi double [ 2.500000e-03, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %48 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !144, !tbaa !98
  %49 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !144, !tbaa !98
  %50 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), double %48, double %49) #4, !dbg !144
  %51 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !145, !tbaa !98
  %52 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !145, !tbaa !98
  %53 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 1, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), double %51, double %52) #4, !dbg !145
  %54 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 2, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), double %.lcssa10) #4, !dbg !146
  %55 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 3, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa7) #4, !dbg !147
  %56 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 4, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str10, i64 0, i64 0), double %.lcssa9) #4, !dbg !148
  %57 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 5, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa) #4, !dbg !149
  %58 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 6, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str11, i64 0, i64 0), double %.lcssa8) #4, !dbg !150
  %59 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 7, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa7) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !18), !dbg !152
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !15), !dbg !153
  br label %60, !dbg !153

; <label>:60                                      ; preds = %91, %47
  %indvars.iv47 = phi i64 [ 0, %47 ], [ %indvars.iv.next48, %91 ]
  %errors.013 = phi i32 [ 0, %47 ], [ %errors.3, %91 ]
  %61 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv47, i64 0, !dbg !154
  %62 = getelementptr inbounds [8 x i8*]* @refarr, i64 0, i64 %indvars.iv47, !dbg !154
  %63 = load i8** %62, align 8, !dbg !154, !tbaa !155
  %64 = tail call i32 @strcmp(i8* %61, i8* %63) #4, !dbg !154
  %65 = icmp eq i32 %64, 0, !dbg !154
  br i1 %65, label %91, label %66, !dbg !154

; <label>:66                                      ; preds = %60
  %67 = add nsw i64 %indvars.iv47, 1, !dbg !157
  %68 = trunc i64 %67 to i32, !dbg !157
  %69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str12, i64 0, i64 0), i32 %68) #4, !dbg !157
  %70 = load i8** %62, align 8, !dbg !159, !tbaa !155
  %71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i64 0, i64 0), i8* %70) #4, !dbg !159
  %72 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), i8* %61) #4, !dbg !160
  %73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0)) #4, !dbg !161
  %74 = load i8** %62, align 8, !dbg !162, !tbaa !155
  %75 = tail call i64 @strlen(i8* %74) #5, !dbg !162
  %76 = trunc i64 %75 to i32, !dbg !162
  tail call void @llvm.dbg.value(metadata !{i32 %76}, i64 0, metadata !17), !dbg !162
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !16), !dbg !163
  %77 = icmp sgt i32 %76, 0, !dbg !163
  br i1 %77, label %.lr.ph, label %._crit_edge, !dbg !163

.lr.ph:                                           ; preds = %66
  %78 = load i8** %62, align 8, !dbg !165, !tbaa !155
  %79 = trunc i64 %75 to i32
  br label %80, !dbg !163

; <label>:80                                      ; preds = %80, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %80 ]
  %errors.111 = phi i32 [ %errors.013, %.lr.ph ], [ %errors.1., %80 ]
  %81 = getelementptr inbounds i8* %78, i64 %indvars.iv, !dbg !165
  %82 = load i8* %81, align 1, !dbg !165, !tbaa !167
  %83 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv47, i64 %indvars.iv, !dbg !165
  %84 = load i8* %83, align 1, !dbg !165, !tbaa !167
  %85 = icmp eq i8 %82, %84, !dbg !165
  %86 = select i1 %85, i32 32, i32 94, !dbg !165
  %putchar4 = tail call i32 @putchar(i32 %86) #4, !dbg !165
  %87 = getelementptr inbounds i8* %78, i64 %indvars.iv, !dbg !168
  %88 = load i8* %87, align 1, !dbg !168, !tbaa !167
  %89 = load i8* %83, align 1, !dbg !168, !tbaa !167
  %not. = icmp ne i8 %88, %89, !dbg !168
  %90 = zext i1 %not. to i32, !dbg !168
  %errors.1. = add nsw i32 %90, %errors.111, !dbg !168
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !163
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !163
  %exitcond = icmp eq i32 %lftr.wideiv, %79, !dbg !163
  br i1 %exitcond, label %._crit_edge, label %80, !dbg !163

._crit_edge:                                      ; preds = %80, %66
  %errors.1.lcssa = phi i32 [ %errors.013, %66 ], [ %errors.1., %80 ]
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !170
  br label %91, !dbg !171

; <label>:91                                      ; preds = %60, %._crit_edge
  %errors.3 = phi i32 [ %errors.1.lcssa, %._crit_edge ], [ %errors.013, %60 ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1, !dbg !153
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 8, !dbg !153
  br i1 %exitcond49, label %92, label %60, !dbg !153

; <label>:92                                      ; preds = %91
  %93 = icmp sgt i32 %errors.3, 0, !dbg !172
  br i1 %93, label %94, label %98, !dbg !172

; <label>:94                                      ; preds = %92
  %95 = icmp sgt i32 %errors.3, 1, !dbg !174
  %96 = select i1 %95, i8* getelementptr inbounds ([2 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str20, i64 0, i64 0), !dbg !174
  %97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str18, i64 0, i64 0), i32 %errors.3, i8* %96) #4, !dbg !174
  br label %99, !dbg !176

; <label>:98                                      ; preds = %92
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str31, i64 0, i64 0)), !dbg !177
  br label %99

; <label>:99                                      ; preds = %98, %94
  ret i32 0, !dbg !178
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @trace_line(i32 %line, double %ray_h) #0 {
  store double 0.000000e+00, double* @object_distance, align 8, !dbg !179, !tbaa !98
  store double %ray_h, double* @ray_height, align 8, !dbg !180, !tbaa !98
  store double 1.000000e+00, double* @from_index, align 8, !dbg !181, !tbaa !98
  tail call void @llvm.dbg.value(metadata !182, i64 0, metadata !37), !dbg !183
  %.b11 = load i1* @current_surfaces, align 1
  br i1 %.b11, label %.lr.ph, label %._crit_edge, !dbg !183

.lr.ph:                                           ; preds = %0
  %1 = sext i32 %line to i64, !dbg !185
  %2 = getelementptr inbounds [9 x double]* @spectral_line, i64 0, i64 %1, !dbg !185
  br label %3, !dbg !183

; <label>:3                                       ; preds = %34, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %34 ], [ 1, %.lr.ph ]
  %4 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 1, !dbg !188
  %5 = load double* %4, align 8, !dbg !188, !tbaa !98
  store double %5, double* @radius_of_curvature, align 8, !dbg !188, !tbaa !98
  %6 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 2, !dbg !189
  %7 = load double* %6, align 8, !dbg !189, !tbaa !98
  store double %7, double* @to_index, align 8, !dbg !189, !tbaa !98
  %8 = fcmp ogt double %7, 1.000000e+00, !dbg !190
  br i1 %8, label %9, label %24, !dbg !190

; <label>:9                                       ; preds = %3
  %10 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 4), align 16, !dbg !185, !tbaa !98
  %11 = load double* %2, align 8, !dbg !185, !tbaa !98
  %12 = fsub double %10, %11, !dbg !185
  %13 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 3), align 8, !dbg !185, !tbaa !98
  %14 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 6), align 16, !dbg !185, !tbaa !98
  %15 = fsub double %13, %14, !dbg !185
  %16 = fdiv double %12, %15, !dbg !185
  %17 = load double* %6, align 8, !dbg !185, !tbaa !98
  %18 = fadd double %17, -1.000000e+00, !dbg !185
  %19 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 3, !dbg !185
  %20 = load double* %19, align 8, !dbg !185, !tbaa !98
  %21 = fdiv double %18, %20, !dbg !185
  %22 = fmul double %16, %21, !dbg !185
  %23 = fadd double %7, %22, !dbg !185
  store double %23, double* @to_index, align 8, !dbg !185, !tbaa !98
  br label %24, !dbg !185

; <label>:24                                      ; preds = %9, %3
  tail call fastcc void @transit_surface(), !dbg !191
  %25 = load double* @to_index, align 8, !dbg !192, !tbaa !98
  store double %25, double* @from_index, align 8, !dbg !192, !tbaa !98
  %.b = load i1* @current_surfaces, align 1
  %26 = select i1 %.b, i32 4, i32 0, !dbg !193
  %27 = trunc i64 %indvars.iv to i32, !dbg !193
  %28 = icmp slt i32 %27, %26, !dbg !193
  br i1 %28, label %29, label %34, !dbg !193

; <label>:29                                      ; preds = %24
  %30 = load double* @object_distance, align 8, !dbg !195, !tbaa !98
  %31 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 4, !dbg !195
  %32 = load double* %31, align 8, !dbg !195, !tbaa !98
  %33 = fsub double %30, %32, !dbg !195
  store double %33, double* @object_distance, align 8, !dbg !195, !tbaa !98
  br label %34, !dbg !195

; <label>:34                                      ; preds = %24, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !183
  %.b1 = load i1* @current_surfaces, align 1
  %35 = select i1 %.b1, i32 4, i32 0, !dbg !183
  %36 = trunc i64 %indvars.iv to i32, !dbg !183
  %37 = icmp slt i32 %36, %35, !dbg !183
  br i1 %37, label %3, label %._crit_edge, !dbg !183

._crit_edge:                                      ; preds = %34, %0
  ret void
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define internal fastcc void @transit_surface() #0 {
  %1 = load i16* @paraxial, align 2, !dbg !196, !tbaa !127
  %2 = icmp eq i16 %1, 0, !dbg !196
  %3 = load double* @radius_of_curvature, align 8, !dbg !198, !tbaa !98
  %4 = fcmp une double %3, 0.000000e+00, !dbg !198
  br i1 %2, label %42, label %5, !dbg !196

; <label>:5                                       ; preds = %0
  %6 = load double* @object_distance, align 8, !dbg !201, !tbaa !98
  br i1 %4, label %7, label %34, !dbg !198

; <label>:7                                       ; preds = %5
  %8 = fcmp oeq double %6, 0.000000e+00, !dbg !201
  br i1 %8, label %9, label %13, !dbg !201

; <label>:9                                       ; preds = %7
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !204, !tbaa !98
  %10 = load double* @ray_height, align 8, !dbg !206, !tbaa !98
  %11 = load double* @radius_of_curvature, align 8, !dbg !206, !tbaa !98
  %12 = fdiv double %10, %11, !dbg !206
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !44), !dbg !206
  br label %18, !dbg !207

; <label>:13                                      ; preds = %7
  %14 = fsub double %6, %3, !dbg !208
  %15 = fdiv double %14, %3, !dbg !208
  %16 = load double* @axis_slope_angle, align 8, !dbg !208, !tbaa !98
  %17 = fmul double %15, %16, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %17}, i64 0, metadata !44), !dbg !208
  br label %18

; <label>:18                                      ; preds = %13, %9
  %iang_sin.0 = phi double [ %12, %9 ], [ %17, %13 ]
  %19 = load double* @from_index, align 8, !dbg !209, !tbaa !98
  %20 = load double* @to_index, align 8, !dbg !209, !tbaa !98
  %21 = fdiv double %19, %20, !dbg !209
  %22 = fmul double %iang_sin.0, %21, !dbg !209
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !45), !dbg !209
  %23 = load double* @axis_slope_angle, align 8, !dbg !210, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %23}, i64 0, metadata !46), !dbg !210
  %24 = fadd double %iang_sin.0, %23, !dbg !211
  %25 = fsub double %24, %22, !dbg !211
  store double %25, double* @axis_slope_angle, align 8, !dbg !211, !tbaa !98
  %26 = load double* @object_distance, align 8, !dbg !212, !tbaa !98
  %27 = fcmp une double %26, 0.000000e+00, !dbg !212
  br i1 %27, label %28, label %30, !dbg !212

; <label>:28                                      ; preds = %18
  %29 = fmul double %23, %26, !dbg !214
  store double %29, double* @ray_height, align 8, !dbg !214, !tbaa !98
  br label %30, !dbg !214

; <label>:30                                      ; preds = %28, %18
  %31 = load double* @ray_height, align 8, !dbg !215, !tbaa !98
  %32 = load double* @axis_slope_angle, align 8, !dbg !215, !tbaa !98
  %33 = fdiv double %31, %32, !dbg !215
  store double %33, double* @object_distance, align 8, !dbg !215, !tbaa !98
  br label %97, !dbg !216

; <label>:34                                      ; preds = %5
  %35 = load double* @to_index, align 8, !dbg !217, !tbaa !98
  %36 = load double* @from_index, align 8, !dbg !217, !tbaa !98
  %37 = fdiv double %35, %36, !dbg !217
  %38 = fmul double %6, %37, !dbg !217
  store double %38, double* @object_distance, align 8, !dbg !217, !tbaa !98
  %39 = load double* @axis_slope_angle, align 8, !dbg !218, !tbaa !98
  %40 = fdiv double %36, %35, !dbg !218
  %41 = fmul double %39, %40, !dbg !218
  store double %41, double* @axis_slope_angle, align 8, !dbg !218, !tbaa !98
  br label %97, !dbg !219

; <label>:42                                      ; preds = %0
  br i1 %4, label %43, label %79, !dbg !220

; <label>:43                                      ; preds = %42
  %44 = load double* @object_distance, align 8, !dbg !222, !tbaa !98
  %45 = fcmp oeq double %44, 0.000000e+00, !dbg !222
  br i1 %45, label %46, label %50, !dbg !222

; <label>:46                                      ; preds = %43
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !225, !tbaa !98
  %47 = load double* @ray_height, align 8, !dbg !227, !tbaa !98
  %48 = load double* @radius_of_curvature, align 8, !dbg !227, !tbaa !98
  %49 = fdiv double %47, %48, !dbg !227
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !44), !dbg !227
  br label %56, !dbg !228

; <label>:50                                      ; preds = %43
  %51 = fsub double %44, %3, !dbg !229
  %52 = fdiv double %51, %3, !dbg !229
  %53 = load double* @axis_slope_angle, align 8, !dbg !231, !tbaa !98
  %54 = tail call double @sin(double %53) #4, !dbg !231
  %55 = fmul double %52, %54, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !44), !dbg !231
  br label %56

; <label>:56                                      ; preds = %50, %46
  %iang_sin.1 = phi double [ %49, %46 ], [ %55, %50 ]
  %57 = tail call double @asin(double %iang_sin.1) #4, !dbg !232
  tail call void @llvm.dbg.value(metadata !{double %57}, i64 0, metadata !42), !dbg !232
  %58 = load double* @from_index, align 8, !dbg !233, !tbaa !98
  %59 = load double* @to_index, align 8, !dbg !233, !tbaa !98
  %60 = fdiv double %58, %59, !dbg !233
  %61 = fmul double %iang_sin.1, %60, !dbg !233
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !45), !dbg !233
  %62 = load double* @axis_slope_angle, align 8, !dbg !234, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !46), !dbg !234
  %63 = fadd double %57, %62, !dbg !235
  %64 = tail call double @asin(double %61) #4, !dbg !236
  %65 = fsub double %63, %64, !dbg !236
  store double %65, double* @axis_slope_angle, align 8, !dbg !236, !tbaa !98
  %66 = fmul double %63, 5.000000e-01, !dbg !237
  %67 = tail call double @sin(double %66) #4, !dbg !237
  tail call void @llvm.dbg.value(metadata !{double %67}, i64 0, metadata !47), !dbg !237
  %68 = load double* @radius_of_curvature, align 8, !dbg !238, !tbaa !98
  %69 = fmul double %68, 2.000000e+00, !dbg !238
  %70 = fmul double %67, %69, !dbg !238
  %71 = fmul double %67, %70, !dbg !238
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !47), !dbg !238
  %72 = tail call double @sin(double %63) #4, !dbg !239
  %73 = fmul double %68, %72, !dbg !239
  %74 = load double* @axis_slope_angle, align 8, !dbg !240, !tbaa !98
  %75 = tail call double @tan(double %74) #4, !dbg !240
  %76 = fdiv double 1.000000e+00, %75, !dbg !240
  %77 = fmul double %73, %76, !dbg !240
  %78 = fadd double %71, %77, !dbg !240
  store double %78, double* @object_distance, align 8, !dbg !240, !tbaa !98
  br label %97, !dbg !241

; <label>:79                                      ; preds = %42
  %80 = load double* @from_index, align 8, !dbg !242, !tbaa !98
  %81 = load double* @to_index, align 8, !dbg !242, !tbaa !98
  %82 = fdiv double %80, %81, !dbg !242
  %83 = load double* @axis_slope_angle, align 8, !dbg !243, !tbaa !98
  %84 = tail call double @sin(double %83) #4, !dbg !243
  %85 = fmul double %82, %84, !dbg !243
  %86 = tail call double @asin(double %85) #4, !dbg !242
  %87 = load double* @object_distance, align 8, !dbg !244, !tbaa !98
  %88 = load double* @to_index, align 8, !dbg !244, !tbaa !98
  %89 = tail call double @cos(double %86) #4, !dbg !245
  %90 = fmul double %88, %89, !dbg !245
  %91 = load double* @from_index, align 8, !dbg !245, !tbaa !98
  %92 = load double* @axis_slope_angle, align 8, !dbg !246, !tbaa !98
  %93 = tail call double @cos(double %92) #4, !dbg !246
  %94 = fmul double %91, %93, !dbg !246
  %95 = fdiv double %90, %94, !dbg !246
  %96 = fmul double %87, %95, !dbg !246
  store double %96, double* @object_distance, align 8, !dbg !246, !tbaa !98
  store double %86, double* @axis_slope_angle, align 8, !dbg !247, !tbaa !98
  br label %97, !dbg !248

; <label>:97                                      ; preds = %79, %56, %34, %30
  ret void, !dbg !248
}

; Function Attrs: nounwind
declare double @asin(double) #1

; Function Attrs: nounwind
declare double @tan(double) #1

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!92, !93}
!llvm.ident = !{!94}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !48, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !31, metadata !38}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 679, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 682} ; [ DW_TAG_subprogram ] [line 679] [def] [scope 682] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !21, metadata !22, metadata !30}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777896, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 680]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33555113, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 681]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 683]
!16 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 683]
!17 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 683]
!18 = metadata !{i32 786688, metadata !4, metadata !"errors", metadata !5, i32 683, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [errors] [line 683]
!19 = metadata !{i32 786688, metadata !4, metadata !"od_fline", metadata !5, i32 684, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [od_fline] [line 684]
!20 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!21 = metadata !{i32 786688, metadata !4, metadata !"od_cline", metadata !5, i32 684, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [od_cline] [line 684]
!22 = metadata !{i32 786688, metadata !23, metadata !"__s1_len", metadata !5, i32 800, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 800]
!23 = metadata !{i32 786443, metadata !1, metadata !24, i32 800, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!24 = metadata !{i32 786443, metadata !1, metadata !25, i32 800, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!25 = metadata !{i32 786443, metadata !1, metadata !26, i32 799, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 799, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!27 = metadata !{i32 786454, metadata !28, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!28 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!29 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{i32 786688, metadata !23, metadata !"__s2_len", metadata !5, i32 800, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 800]
!31 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"trace_line", metadata !"trace_line", metadata !"", i32 651, metadata !32, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32, double)* @trace_line, null, null, metadata !34, i32 654} ; [ DW_TAG_subprogram ] [line 651] [local] [def] [scope 654] [trace_line]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !8, metadata !8, metadata !20}
!34 = metadata !{metadata !35, metadata !36, metadata !37}
!35 = metadata !{i32 786689, metadata !31, metadata !"line", metadata !5, i32 16777868, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [line] [line 652]
!36 = metadata !{i32 786689, metadata !31, metadata !"ray_h", metadata !5, i32 33555085, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ray_h] [line 653]
!37 = metadata !{i32 786688, metadata !31, metadata !"i", metadata !5, i32 655, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 655]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"transit_surface", metadata !"transit_surface", metadata !"", i32 586, metadata !39, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @transit_surface, null, null, metadata !41, i32 586} ; [ DW_TAG_subprogram ] [line 586] [local] [def] [transit_surface]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{null}
!41 = metadata !{metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47}
!42 = metadata !{i32 786688, metadata !38, metadata !"iang", metadata !5, i32 587, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iang] [line 587]
!43 = metadata !{i32 786688, metadata !38, metadata !"rang", metadata !5, i32 588, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rang] [line 588]
!44 = metadata !{i32 786688, metadata !38, metadata !"iang_sin", metadata !5, i32 589, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iang_sin] [line 589]
!45 = metadata !{i32 786688, metadata !38, metadata !"rang_sin", metadata !5, i32 590, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rang_sin] [line 590]
!46 = metadata !{i32 786688, metadata !38, metadata !"old_axis_slope_angle", metadata !5, i32 591, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_axis_slope_angle] [line 591]
!47 = metadata !{i32 786688, metadata !38, metadata !"sagitta", metadata !5, i32 591, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sagitta] [line 591]
!48 = metadata !{metadata !49, metadata !50, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !66, metadata !71, metadata !75, metadata !80, metadata !81, metadata !84, metadata !85, metadata !86, metadata !87, metadata !88}
!49 = metadata !{i32 786484, i32 0, null, metadata !"niter", metadata !"niter", metadata !"", metadata !5, i32 283, metadata !8, i32 0, i32 1, i32* @niter, null} ; [ DW_TAG_variable ] [niter] [line 283] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"current_surfaces", metadata !"current_surfaces", metadata !"", metadata !5, i32 248, metadata !51, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [current_surfaces] [line 248] [local] [def]
!51 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!52 = metadata !{i32 786484, i32 0, null, metadata !"paraxial", metadata !"paraxial", metadata !"", metadata !5, i32 249, metadata !51, i32 1, i32 1, i16* @paraxial, null} ; [ DW_TAG_variable ] [paraxial] [line 249] [local] [def]
!53 = metadata !{i32 786484, i32 0, null, metadata !"clear_aperture", metadata !"clear_aperture", metadata !"", metadata !5, i32 251, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [clear_aperture] [line 251] [local] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"aberr_lspher", metadata !"aberr_lspher", metadata !"", metadata !5, i32 253, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [aberr_lspher] [line 253] [local] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"aberr_osc", metadata !"aberr_osc", metadata !"", metadata !5, i32 254, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [aberr_osc] [line 254] [local] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"aberr_lchrom", metadata !"aberr_lchrom", metadata !"", metadata !5, i32 255, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [aberr_lchrom] [line 255] [local] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"max_lspher", metadata !"max_lspher", metadata !"", metadata !5, i32 257, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [max_lspher] [line 257] [local] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"max_osc", metadata !"max_osc", metadata !"", metadata !5, i32 258, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [max_osc] [line 258] [local] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"max_lchrom", metadata !"max_lchrom", metadata !"", metadata !5, i32 259, metadata !20, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [max_lchrom] [line 259] [local] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"object_distance", metadata !"object_distance", metadata !"", metadata !5, i32 262, metadata !20, i32 1, i32 1, double* @object_distance, null} ; [ DW_TAG_variable ] [object_distance] [line 262] [local] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"axis_slope_angle", metadata !"axis_slope_angle", metadata !"", metadata !5, i32 264, metadata !20, i32 1, i32 1, double* @axis_slope_angle, null} ; [ DW_TAG_variable ] [axis_slope_angle] [line 264] [local] [def]
!62 = metadata !{i32 786484, i32 0, null, metadata !"spectral_line", metadata !"spectral_line", metadata !"", metadata !5, i32 268, metadata !63, i32 1, i32 1, [9 x double]* @spectral_line, null} ; [ DW_TAG_variable ] [spectral_line] [line 268] [local] [def]
!63 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 576, i64 64, i32 0, i32 0, metadata !20, metadata !64, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 576, align 64, offset 0] [from double]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ] [0, 8]
!66 = metadata !{i32 786484, i32 0, null, metadata !"s", metadata !"s", metadata !"", metadata !5, i32 269, metadata !67, i32 1, i32 1, [10 x [5 x double]]* @s, null} ; [ DW_TAG_variable ] [s] [line 269] [local] [def]
!67 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200, i64 64, i32 0, i32 0, metadata !20, metadata !68, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 64, offset 0] [from double]
!68 = metadata !{metadata !69, metadata !70}
!69 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!70 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!71 = metadata !{i32 786484, i32 0, null, metadata !"od_sa", metadata !"od_sa", metadata !"", metadata !5, i32 270, metadata !72, i32 1, i32 1, [2 x [2 x double]]* @od_sa, null} ; [ DW_TAG_variable ] [od_sa] [line 270] [local] [def]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !20, metadata !73, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from double]
!73 = metadata !{metadata !74, metadata !74}
!74 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!75 = metadata !{i32 786484, i32 0, null, metadata !"outarr", metadata !"outarr", metadata !"", metadata !5, i32 272, metadata !76, i32 1, i32 1, [8 x [80 x i8]]* @outarr, null} ; [ DW_TAG_variable ] [outarr] [line 272] [local] [def]
!76 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 5120, i64 8, i32 0, i32 0, metadata !11, metadata !77, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5120, align 8, offset 0] [from char]
!77 = metadata !{metadata !78, metadata !79}
!78 = metadata !{i32 786465, i64 0, i64 8}        ; [ DW_TAG_subrange_type ] [0, 7]
!79 = metadata !{i32 786465, i64 0, i64 80}       ; [ DW_TAG_subrange_type ] [0, 79]
!80 = metadata !{i32 786484, i32 0, null, metadata !"itercount", metadata !"itercount", metadata !"", metadata !5, i32 274, metadata !8, i32 0, i32 1, i32* @itercount, null} ; [ DW_TAG_variable ] [itercount] [line 274] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"refarr", metadata !"refarr", metadata !"", metadata !5, i32 285, metadata !82, i32 1, i32 1, [8 x i8*]* @refarr, null} ; [ DW_TAG_variable ] [refarr] [line 285] [local] [def]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 64, i32 0, i32 0, metadata !10, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!83 = metadata !{metadata !78}
!84 = metadata !{i32 786484, i32 0, null, metadata !"to_index", metadata !"to_index", metadata !"", metadata !5, i32 266, metadata !20, i32 1, i32 1, double* @to_index, null} ; [ DW_TAG_variable ] [to_index] [line 266] [local] [def]
!85 = metadata !{i32 786484, i32 0, null, metadata !"radius_of_curvature", metadata !"radius_of_curvature", metadata !"", metadata !5, i32 261, metadata !20, i32 1, i32 1, double* @radius_of_curvature, null} ; [ DW_TAG_variable ] [radius_of_curvature] [line 261] [local] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"from_index", metadata !"from_index", metadata !"", metadata !5, i32 265, metadata !20, i32 1, i32 1, double* @from_index, null} ; [ DW_TAG_variable ] [from_index] [line 265] [local] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"ray_height", metadata !"ray_height", metadata !"", metadata !5, i32 263, metadata !20, i32 1, i32 1, double* @ray_height, null} ; [ DW_TAG_variable ] [ray_height] [line 263] [local] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"testcase", metadata !"testcase", metadata !"", metadata !5, i32 304, metadata !89, i32 1, i32 1, [4 x [4 x double]]* @testcase, null} ; [ DW_TAG_variable ] [testcase] [line 304] [local] [def]
!89 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !20, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from double]
!90 = metadata !{metadata !91, metadata !91}
!91 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!92 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!93 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!94 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!95 = metadata !{i32 680, i32 0, metadata !4, null}
!96 = metadata !{i32 681, i32 0, metadata !4, null}
!97 = metadata !{i32 689, i32 0, metadata !4, null}
!98 = metadata !{metadata !99, metadata !99, i64 0}
!99 = metadata !{metadata !"double", metadata !100, i64 0}
!100 = metadata !{metadata !"omnipotent char", metadata !101, i64 0}
!101 = metadata !{metadata !"Simple C/C++ TBAA"}
!102 = metadata !{i32 690, i32 0, metadata !4, null}
!103 = metadata !{i32 691, i32 0, metadata !4, null}
!104 = metadata !{i32 692, i32 0, metadata !4, null}
!105 = metadata !{i32 693, i32 0, metadata !4, null}
!106 = metadata !{i32 694, i32 0, metadata !4, null}
!107 = metadata !{i32 695, i32 0, metadata !4, null}
!108 = metadata !{i32 696, i32 0, metadata !4, null}
!109 = metadata !{i32 700, i32 0, metadata !4, null}
!110 = metadata !{metadata !111, metadata !111, i64 0}
!111 = metadata !{metadata !"int", metadata !100, i64 0}
!112 = metadata !{i32 0}
!113 = metadata !{i32 706, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !4, i32 706, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!115 = metadata !{i32 708, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !114, i32 707, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!117 = metadata !{i32 714, i32 0, metadata !4, null}
!118 = metadata !{i32 715, i32 0, metadata !4, null}
!119 = metadata !{i32 718, i32 0, metadata !4, null}
!120 = metadata !{i32 719, i32 0, metadata !4, null}
!121 = metadata !{i32 720, i32 0, metadata !4, null}
!122 = metadata !{i32 732, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !4, i32 732, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!124 = metadata !{i32 735, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !126, i32 735, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!126 = metadata !{i32 786443, metadata !1, metadata !123, i32 732, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!127 = metadata !{metadata !128, metadata !128, i64 0}
!128 = metadata !{metadata !"short", metadata !100, i64 0}
!129 = metadata !{i32 739, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !125, i32 735, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!131 = metadata !{i32 740, i32 0, metadata !130, null}
!132 = metadata !{i32 741, i32 0, metadata !130, null}
!133 = metadata !{i32 743, i32 0, metadata !126, null}
!134 = metadata !{i32 747, i32 0, metadata !126, null}
!135 = metadata !{i32 748, i32 0, metadata !126, null}
!136 = metadata !{i32 752, i32 0, metadata !126, null}
!137 = metadata !{i32 753, i32 0, metadata !126, null}
!138 = metadata !{i32 755, i32 0, metadata !126, null}
!139 = metadata !{i32 756, i32 0, metadata !126, null}
!140 = metadata !{i32 757, i32 0, metadata !126, null}
!141 = metadata !{i32 759, i32 0, metadata !126, null}
!142 = metadata !{i32 758, i32 0, metadata !126, null}
!143 = metadata !{i32 763, i32 0, metadata !126, null}
!144 = metadata !{i32 772, i32 0, metadata !4, null}
!145 = metadata !{i32 774, i32 0, metadata !4, null}
!146 = metadata !{i32 776, i32 0, metadata !4, null}
!147 = metadata !{i32 779, i32 0, metadata !4, null}
!148 = metadata !{i32 782, i32 0, metadata !4, null}
!149 = metadata !{i32 785, i32 0, metadata !4, null}
!150 = metadata !{i32 788, i32 0, metadata !4, null}
!151 = metadata !{i32 791, i32 0, metadata !4, null}
!152 = metadata !{i32 798, i32 0, metadata !4, null}
!153 = metadata !{i32 799, i32 0, metadata !26, null}
!154 = metadata !{i32 800, i32 0, metadata !23, null}
!155 = metadata !{metadata !156, metadata !156, i64 0}
!156 = metadata !{metadata !"any pointer", metadata !100, i64 0}
!157 = metadata !{i32 805, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !24, i32 800, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!159 = metadata !{i32 807, i32 0, metadata !158, null}
!160 = metadata !{i32 808, i32 0, metadata !158, null}
!161 = metadata !{i32 809, i32 0, metadata !158, null}
!162 = metadata !{i32 810, i32 0, metadata !158, null}
!163 = metadata !{i32 811, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !158, i32 811, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!165 = metadata !{i32 812, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !164, i32 811, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!167 = metadata !{metadata !100, metadata !100, i64 0}
!168 = metadata !{i32 813, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !166, i32 813, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!170 = metadata !{i32 816, i32 0, metadata !158, null}
!171 = metadata !{i32 817, i32 0, metadata !158, null}
!172 = metadata !{i32 822, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !4, i32 822, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!174 = metadata !{i32 823, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 822, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!176 = metadata !{i32 825, i32 0, metadata !175, null}
!177 = metadata !{i32 826, i32 0, metadata !173, null}
!178 = metadata !{i32 828, i32 0, metadata !4, null}
!179 = metadata !{i32 657, i32 0, metadata !31, null}
!180 = metadata !{i32 658, i32 0, metadata !31, null}
!181 = metadata !{i32 659, i32 0, metadata !31, null}
!182 = metadata !{i32 1}
!183 = metadata !{i32 661, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !31, i32 661, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!185 = metadata !{i32 665, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !187, i32 664, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!187 = metadata !{i32 786443, metadata !1, metadata !184, i32 661, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!188 = metadata !{i32 662, i32 0, metadata !187, null}
!189 = metadata !{i32 663, i32 0, metadata !187, null}
!190 = metadata !{i32 664, i32 0, metadata !186, null}
!191 = metadata !{i32 669, i32 0, metadata !187, null}
!192 = metadata !{i32 670, i32 0, metadata !187, null}
!193 = metadata !{i32 671, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !187, i32 671, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!195 = metadata !{i32 672, i32 0, metadata !194, null}
!196 = metadata !{i32 593, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !38, i32 593, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!198 = metadata !{i32 594, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !200, i32 594, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!200 = metadata !{i32 786443, metadata !1, metadata !197, i32 593, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!201 = metadata !{i32 595, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !203, i32 595, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!203 = metadata !{i32 786443, metadata !1, metadata !199, i32 594, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!204 = metadata !{i32 596, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !202, i32 595, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!206 = metadata !{i32 597, i32 0, metadata !205, null}
!207 = metadata !{i32 598, i32 0, metadata !205, null}
!208 = metadata !{i32 599, i32 0, metadata !202, null}
!209 = metadata !{i32 603, i32 0, metadata !203, null}
!210 = metadata !{i32 605, i32 0, metadata !203, null}
!211 = metadata !{i32 606, i32 0, metadata !203, null}
!212 = metadata !{i32 608, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !203, i32 608, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!214 = metadata !{i32 609, i32 0, metadata !213, null}
!215 = metadata !{i32 610, i32 0, metadata !203, null}
!216 = metadata !{i32 611, i32 0, metadata !203, null}
!217 = metadata !{i32 613, i32 0, metadata !200, null}
!218 = metadata !{i32 614, i32 0, metadata !200, null}
!219 = metadata !{i32 615, i32 0, metadata !200, null}
!220 = metadata !{i32 618, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !38, i32 618, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!222 = metadata !{i32 619, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !224, i32 619, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!224 = metadata !{i32 786443, metadata !1, metadata !221, i32 618, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!225 = metadata !{i32 620, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !223, i32 619, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!227 = metadata !{i32 621, i32 0, metadata !226, null}
!228 = metadata !{i32 622, i32 0, metadata !226, null}
!229 = metadata !{i32 623, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !223, i32 622, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
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
!242 = metadata !{i32 641, i32 0, metadata !38, null}
!243 = metadata !{i32 642, i32 0, metadata !38, null}
!244 = metadata !{i32 643, i32 0, metadata !38, null}
!245 = metadata !{i32 644, i32 0, metadata !38, null}
!246 = metadata !{i32 645, i32 0, metadata !38, null}
!247 = metadata !{i32 646, i32 0, metadata !38, null}
!248 = metadata !{i32 647, i32 0, metadata !38, null}
