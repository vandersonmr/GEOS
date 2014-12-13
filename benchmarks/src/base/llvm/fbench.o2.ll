; ModuleID = 'fbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@niter = global i32 1000, align 4
@spectral_line = internal unnamed_addr global [9 x double] zeroinitializer, align 16
@current_surfaces = internal unnamed_addr global i1 false
@testcase = internal unnamed_addr constant [4 x [4 x double]] [[4 x double] [double 2.705000e+01, double 1.513700e+00, double 6.360000e+01, double 5.200000e-01], [4 x double] [double -1.668000e+01, double 1.000000e+00, double 0.000000e+00, double 1.380000e-01], [4 x double] [double -1.668000e+01, double 1.616400e+00, double 3.670000e+01, double 3.800000e-01], [4 x double] [double -7.810000e+01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00]], align 16
@s = internal unnamed_addr global [10 x [5 x double]] zeroinitializer, align 16
@.str1 = private unnamed_addr constant [58 x i8] c"and performance benchmark.  %d iterations will be made.\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [56 x i8] c"\0AMeasured run time in seconds should be divided by %.f\0A\00", align 1
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
@.str18 = private unnamed_addr constant [48 x i8] c"\0A%d error%s in results.  This is VERY SERIOUS.\0A\00", align 1
@.str19 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str20 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
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
  br label %.preheader6, !dbg !113

.preheader6:                                      ; preds = %.preheader6.lr.ph, %.preheader6
  %indvar = phi i64 [ 0, %.preheader6.lr.ph ], [ %0, %.preheader6 ]
  %i.037 = phi i32 [ 0, %.preheader6.lr.ph ], [ %1, %.preheader6 ]
  %0 = add i64 %indvar, 1, !dbg !115
  %scevgep = getelementptr [10 x [5 x double]]* @s, i64 0, i64 %0, i64 1
  %scevgep53 = bitcast double* %scevgep to i8*
  %scevgep54 = getelementptr [4 x [4 x double]]* @testcase, i64 0, i64 %indvar, i64 0
  %scevgep5455 = bitcast double* %scevgep54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep53, i8* %scevgep5455, i64 32, i32 8, i1 false), !dbg !115
  %1 = add nsw i32 %i.037, 1, !dbg !113
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !15), !dbg !113
  %2 = icmp slt i32 %1, 4, !dbg !113
  br i1 %2, label %.preheader6, label %._crit_edge38, !dbg !113

._crit_edge38:                                    ; preds = %.preheader6
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str, i64 0, i64 0)), !dbg !117
  %3 = load i32* @niter, align 4, !dbg !118, !tbaa !110
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i64 0, i64 0), i32 %3) #4, !dbg !118
  %5 = load i32* @niter, align 4, !dbg !119, !tbaa !110
  %6 = sitofp i32 %5 to double, !dbg !119
  %7 = fdiv double %6, 1.000000e+03, !dbg !119
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i64 0, i64 0), double %7) #4, !dbg !119
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @str29, i64 0, i64 0)), !dbg !120
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8]* @str30, i64 0, i64 0)), !dbg !121
  store i32 0, i32* @itercount, align 4, !dbg !122, !tbaa !110
  %9 = load i32* @niter, align 4, !dbg !122, !tbaa !110
  %10 = icmp sgt i32 %9, 0, !dbg !122
  br i1 %10, label %.preheader, label %43, !dbg !122

.preheader:                                       ; preds = %._crit_edge38, %20
  store i16 0, i16* @paraxial, align 2, !dbg !124, !tbaa !127
  br label %11, !dbg !124

; <label>:11                                      ; preds = %.preheader, %11
  tail call fastcc void @trace_line(i32 4, double 2.000000e+00), !dbg !129
  %12 = load double* @object_distance, align 8, !dbg !131, !tbaa !98
  %13 = load i16* @paraxial, align 2, !dbg !131, !tbaa !127
  %14 = sext i16 %13 to i64, !dbg !131
  %15 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %14, i64 0, !dbg !131
  store double %12, double* %15, align 16, !dbg !131, !tbaa !98
  %16 = load double* @axis_slope_angle, align 8, !dbg !132, !tbaa !98
  %17 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %14, i64 1, !dbg !132
  store double %16, double* %17, align 8, !dbg !132, !tbaa !98
  %18 = add i16 %13, 1, !dbg !124
  store i16 %18, i16* @paraxial, align 2, !dbg !124, !tbaa !127
  %19 = icmp slt i16 %18, 2, !dbg !124
  br i1 %19, label %11, label %20, !dbg !124

; <label>:20                                      ; preds = %11
  store i16 0, i16* @paraxial, align 2, !dbg !133, !tbaa !127
  tail call fastcc void @trace_line(i32 3, double 2.000000e+00), !dbg !134
  %21 = load double* @object_distance, align 8, !dbg !135, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %21}, i64 0, metadata !21), !dbg !135
  tail call fastcc void @trace_line(i32 6, double 2.000000e+00), !dbg !136
  %22 = load double* @object_distance, align 8, !dbg !137, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !19), !dbg !137
  %23 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !138, !tbaa !98
  %24 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !138, !tbaa !98
  %25 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !139, !tbaa !98
  %26 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !140, !tbaa !98
  %27 = tail call double @sin(double %26) #4, !dbg !140
  %28 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !140, !tbaa !98
  %29 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !141, !tbaa !98
  %30 = tail call double @sin(double %29) #4, !dbg !141
  %31 = load i32* @itercount, align 4, !dbg !122, !tbaa !110
  %32 = add nsw i32 %31, 1, !dbg !122
  store i32 %32, i32* @itercount, align 4, !dbg !122, !tbaa !110
  %33 = load i32* @niter, align 4, !dbg !122, !tbaa !110
  %34 = icmp slt i32 %32, %33, !dbg !122
  br i1 %34, label %.preheader, label %._crit_edge15, !dbg !122

._crit_edge15:                                    ; preds = %20
  %35 = fsub double %23, %24, !dbg !138
  %36 = fmul double %23, %25, !dbg !139
  %37 = fmul double %27, %28, !dbg !140
  %38 = fdiv double %36, %37, !dbg !140
  %39 = fsub double 1.000000e+00, %38, !dbg !140
  %40 = fsub double %22, %21, !dbg !142
  %41 = fmul double %30, %30, !dbg !143
  %42 = fdiv double 9.260000e-05, %41, !dbg !143
  br label %43, !dbg !122

; <label>:43                                      ; preds = %._crit_edge15, %._crit_edge38
  %.lcssa10 = phi double [ %35, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa9 = phi double [ %39, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa8 = phi double [ %40, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa7 = phi double [ %42, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %.lcssa = phi double [ 2.500000e-03, %._crit_edge15 ], [ 0.000000e+00, %._crit_edge38 ]
  %44 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !144, !tbaa !98
  %45 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !144, !tbaa !98
  %46 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), double %44, double %45) #4, !dbg !144
  %47 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !145, !tbaa !98
  %48 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !145, !tbaa !98
  %49 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 1, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), double %47, double %48) #4, !dbg !145
  %50 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 2, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), double %.lcssa10) #4, !dbg !146
  %51 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 3, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa7) #4, !dbg !147
  %52 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 4, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str10, i64 0, i64 0), double %.lcssa9) #4, !dbg !148
  %53 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 5, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa) #4, !dbg !149
  %54 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 6, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str11, i64 0, i64 0), double %.lcssa8) #4, !dbg !150
  %55 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 7, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa7) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !18), !dbg !152
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !15), !dbg !153
  br label %56, !dbg !153

; <label>:56                                      ; preds = %._crit_edge57, %43
  %indvars.iv47 = phi i64 [ 0, %43 ], [ %indvars.iv.next48.pre, %._crit_edge57 ]
  %errors.013 = phi i32 [ 0, %43 ], [ %errors.3, %._crit_edge57 ]
  %57 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv47, i64 0, !dbg !154
  %58 = getelementptr inbounds [8 x i8*]* @refarr, i64 0, i64 %indvars.iv47, !dbg !154
  %59 = load i8** %58, align 8, !dbg !154, !tbaa !155
  %60 = tail call i32 @strcmp(i8* %57, i8* %59) #4, !dbg !154
  %61 = icmp eq i32 %60, 0, !dbg !154
  %indvars.iv.next48.pre = add nsw i64 %indvars.iv47, 1, !dbg !153
  br i1 %61, label %._crit_edge57, label %62, !dbg !154

; <label>:62                                      ; preds = %56
  %63 = trunc i64 %indvars.iv.next48.pre to i32, !dbg !157
  %64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str12, i64 0, i64 0), i32 %63) #4, !dbg !157
  %65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i64 0, i64 0), i8* %59) #4, !dbg !159
  %66 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), i8* %57) #4, !dbg !160
  %67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0)) #4, !dbg !161
  %68 = tail call i64 @strlen(i8* %59) #5, !dbg !162
  %69 = trunc i64 %68 to i32, !dbg !162
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !17), !dbg !162
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !16), !dbg !163
  %70 = icmp sgt i32 %69, 0, !dbg !163
  br i1 %70, label %.lr.ph, label %._crit_edge, !dbg !163

.lr.ph:                                           ; preds = %62, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %62 ]
  %errors.111 = phi i32 [ %errors.1., %.lr.ph ], [ %errors.013, %62 ]
  %71 = getelementptr inbounds i8* %59, i64 %indvars.iv, !dbg !165
  %72 = load i8* %71, align 1, !dbg !165, !tbaa !167
  %73 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv47, i64 %indvars.iv, !dbg !165
  %74 = load i8* %73, align 1, !dbg !165, !tbaa !167
  %75 = icmp eq i8 %72, %74, !dbg !165
  %76 = select i1 %75, i32 32, i32 94, !dbg !165
  %putchar4 = tail call i32 @putchar(i32 %76) #4, !dbg !165
  %77 = load i8* %71, align 1, !dbg !168, !tbaa !167
  %78 = load i8* %73, align 1, !dbg !168, !tbaa !167
  %not. = icmp ne i8 %77, %78, !dbg !168
  %79 = zext i1 %not. to i32, !dbg !168
  %errors.1. = add nsw i32 %79, %errors.111, !dbg !168
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !163
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !163
  %exitcond = icmp eq i32 %lftr.wideiv, %69, !dbg !163
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !163

._crit_edge:                                      ; preds = %.lr.ph, %62
  %errors.1.lcssa = phi i32 [ %errors.013, %62 ], [ %errors.1., %.lr.ph ]
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !170
  br label %._crit_edge57, !dbg !171

._crit_edge57:                                    ; preds = %56, %._crit_edge
  %errors.3 = phi i32 [ %errors.1.lcssa, %._crit_edge ], [ %errors.013, %56 ]
  %exitcond49 = icmp eq i64 %indvars.iv.next48.pre, 8, !dbg !153
  br i1 %exitcond49, label %80, label %56, !dbg !153

; <label>:80                                      ; preds = %._crit_edge57
  %81 = icmp sgt i32 %errors.3, 0, !dbg !172
  br i1 %81, label %82, label %86, !dbg !172

; <label>:82                                      ; preds = %80
  %83 = icmp sgt i32 %errors.3, 1, !dbg !174
  %84 = select i1 %83, i8* getelementptr inbounds ([2 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str20, i64 0, i64 0), !dbg !174
  %85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str18, i64 0, i64 0), i32 %errors.3, i8* %84) #4, !dbg !174
  br label %87, !dbg !176

; <label>:86                                      ; preds = %80
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str31, i64 0, i64 0)), !dbg !177
  br label %87

; <label>:87                                      ; preds = %86, %82
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

; <label>:3                                       ; preds = %.thread, %.lr.ph
  %4 = phi double [ 1.000000e+00, %.lr.ph ], [ %111, %.thread ]
  %5 = phi double [ 0.000000e+00, %.lr.ph ], [ %117, %.thread ]
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next3, %.thread ]
  %6 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 1, !dbg !188
  %7 = load double* %6, align 8, !dbg !188, !tbaa !98
  store double %7, double* @radius_of_curvature, align 8, !dbg !188, !tbaa !98
  %8 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 2, !dbg !189
  %9 = load double* %8, align 8, !dbg !189, !tbaa !98
  store double %9, double* @to_index, align 8, !dbg !189, !tbaa !98
  %10 = fcmp ogt double %9, 1.000000e+00, !dbg !190
  br i1 %10, label %11, label %25, !dbg !190

; <label>:11                                      ; preds = %3
  %12 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 4), align 16, !dbg !185, !tbaa !98
  %13 = load double* %2, align 8, !dbg !185, !tbaa !98
  %14 = fsub double %12, %13, !dbg !185
  %15 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 3), align 8, !dbg !185, !tbaa !98
  %16 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 6), align 16, !dbg !185, !tbaa !98
  %17 = fsub double %15, %16, !dbg !185
  %18 = fdiv double %14, %17, !dbg !185
  %19 = fadd double %9, -1.000000e+00, !dbg !185
  %20 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 3, !dbg !185
  %21 = load double* %20, align 8, !dbg !185, !tbaa !98
  %22 = fdiv double %19, %21, !dbg !185
  %23 = fmul double %18, %22, !dbg !185
  %24 = fadd double %9, %23, !dbg !185
  store double %24, double* @to_index, align 8, !dbg !185, !tbaa !98
  br label %25, !dbg !185

; <label>:25                                      ; preds = %11, %3
  %26 = phi double [ %24, %11 ], [ %9, %3 ]
  %27 = load i16* @paraxial, align 2, !dbg !191, !tbaa !127
  %28 = icmp eq i16 %27, 0, !dbg !191
  %29 = fcmp une double %7, 0.000000e+00, !dbg !194
  br i1 %28, label %59, label %30, !dbg !191

; <label>:30                                      ; preds = %25
  br i1 %29, label %31, label %53, !dbg !194

; <label>:31                                      ; preds = %30
  %32 = fcmp oeq double %5, 0.000000e+00, !dbg !197
  br i1 %32, label %33, label %36, !dbg !197

; <label>:33                                      ; preds = %31
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !200, !tbaa !98
  %34 = load double* @ray_height, align 8, !dbg !202, !tbaa !98
  %35 = fdiv double %34, %7, !dbg !202
  tail call void @llvm.dbg.value(metadata !{double %35}, i64 0, metadata !203) #4, !dbg !202
  br label %41, !dbg !204

; <label>:36                                      ; preds = %31
  %37 = fsub double %5, %7, !dbg !205
  %38 = fdiv double %37, %7, !dbg !205
  %39 = load double* @axis_slope_angle, align 8, !dbg !205, !tbaa !98
  %40 = fmul double %38, %39, !dbg !205
  tail call void @llvm.dbg.value(metadata !{double %40}, i64 0, metadata !203) #4, !dbg !205
  br label %41

; <label>:41                                      ; preds = %36, %33
  %42 = phi double [ 0.000000e+00, %33 ], [ %39, %36 ]
  %iang_sin.0.i = phi double [ %35, %33 ], [ %40, %36 ]
  %43 = fdiv double %4, %26, !dbg !206
  %44 = fmul double %iang_sin.0.i, %43, !dbg !206
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !207) #4, !dbg !206
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !208) #4, !dbg !209
  %45 = fadd double %42, %iang_sin.0.i, !dbg !210
  %46 = fsub double %45, %44, !dbg !210
  store double %46, double* @axis_slope_angle, align 8, !dbg !210, !tbaa !98
  %47 = fcmp une double %5, 0.000000e+00, !dbg !211
  br i1 %47, label %48, label %._crit_edge.i, !dbg !211

._crit_edge.i:                                    ; preds = %41
  %.pre.i = load double* @ray_height, align 8, !dbg !213, !tbaa !98
  br label %50, !dbg !211

; <label>:48                                      ; preds = %41
  %49 = fmul double %5, %42, !dbg !214
  store double %49, double* @ray_height, align 8, !dbg !214, !tbaa !98
  br label %50, !dbg !214

; <label>:50                                      ; preds = %48, %._crit_edge.i
  %51 = phi double [ %.pre.i, %._crit_edge.i ], [ %49, %48 ]
  %52 = fdiv double %51, %46, !dbg !213
  store double %52, double* @object_distance, align 8, !dbg !213, !tbaa !98
  br label %transit_surface.exit, !dbg !215

; <label>:53                                      ; preds = %30
  %54 = fdiv double %26, %4, !dbg !216
  %55 = fmul double %5, %54, !dbg !216
  store double %55, double* @object_distance, align 8, !dbg !216, !tbaa !98
  %56 = load double* @axis_slope_angle, align 8, !dbg !217, !tbaa !98
  %57 = fdiv double %4, %26, !dbg !217
  %58 = fmul double %56, %57, !dbg !217
  store double %58, double* @axis_slope_angle, align 8, !dbg !217, !tbaa !98
  br label %transit_surface.exit, !dbg !218

; <label>:59                                      ; preds = %25
  br i1 %29, label %60, label %94, !dbg !219

; <label>:60                                      ; preds = %59
  %61 = fcmp oeq double %5, 0.000000e+00, !dbg !221
  br i1 %61, label %62, label %65, !dbg !221

; <label>:62                                      ; preds = %60
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !224, !tbaa !98
  %63 = load double* @ray_height, align 8, !dbg !226, !tbaa !98
  %64 = fdiv double %63, %7, !dbg !226
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !203) #4, !dbg !226
  br label %71, !dbg !227

; <label>:65                                      ; preds = %60
  %66 = fsub double %5, %7, !dbg !228
  %67 = fdiv double %66, %7, !dbg !228
  %68 = load double* @axis_slope_angle, align 8, !dbg !230, !tbaa !98
  %69 = tail call double @sin(double %68) #4, !dbg !230
  %70 = fmul double %67, %69, !dbg !230
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !203) #4, !dbg !230
  br label %71

; <label>:71                                      ; preds = %65, %62
  %iang_sin.1.i = phi double [ %64, %62 ], [ %70, %65 ]
  %72 = tail call double @asin(double %iang_sin.1.i) #4, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !232) #4, !dbg !231
  %73 = load double* @from_index, align 8, !dbg !233, !tbaa !98
  %74 = load double* @to_index, align 8, !dbg !233, !tbaa !98
  %75 = fdiv double %73, %74, !dbg !233
  %76 = fmul double %iang_sin.1.i, %75, !dbg !233
  tail call void @llvm.dbg.value(metadata !{double %76}, i64 0, metadata !207) #4, !dbg !233
  %77 = load double* @axis_slope_angle, align 8, !dbg !234, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !208) #4, !dbg !234
  %78 = fadd double %72, %77, !dbg !235
  %79 = tail call double @asin(double %76) #4, !dbg !236
  %80 = fsub double %78, %79, !dbg !236
  store double %80, double* @axis_slope_angle, align 8, !dbg !236, !tbaa !98
  %81 = fmul double %78, 5.000000e-01, !dbg !237
  %82 = tail call double @sin(double %81) #4, !dbg !237
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !238) #4, !dbg !237
  %83 = load double* @radius_of_curvature, align 8, !dbg !239, !tbaa !98
  %84 = fmul double %83, 2.000000e+00, !dbg !239
  %85 = fmul double %82, %84, !dbg !239
  %86 = fmul double %82, %85, !dbg !239
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !238) #4, !dbg !239
  %87 = tail call double @sin(double %78) #4, !dbg !240
  %88 = fmul double %83, %87, !dbg !240
  %89 = load double* @axis_slope_angle, align 8, !dbg !241, !tbaa !98
  %90 = tail call double @tan(double %89) #4, !dbg !241
  %91 = fdiv double 1.000000e+00, %90, !dbg !241
  %92 = fmul double %88, %91, !dbg !241
  %93 = fadd double %86, %92, !dbg !241
  store double %93, double* @object_distance, align 8, !dbg !241, !tbaa !98
  br label %transit_surface.exit, !dbg !242

; <label>:94                                      ; preds = %59
  %95 = fdiv double %4, %26, !dbg !243
  %96 = load double* @axis_slope_angle, align 8, !dbg !244, !tbaa !98
  %97 = tail call double @sin(double %96) #4, !dbg !244
  %98 = fmul double %95, %97, !dbg !244
  %99 = tail call double @asin(double %98) #4, !dbg !243
  %100 = load double* @object_distance, align 8, !dbg !245, !tbaa !98
  %101 = load double* @to_index, align 8, !dbg !245, !tbaa !98
  %102 = tail call double @cos(double %99) #4, !dbg !246
  %103 = fmul double %101, %102, !dbg !246
  %104 = load double* @from_index, align 8, !dbg !246, !tbaa !98
  %105 = load double* @axis_slope_angle, align 8, !dbg !247, !tbaa !98
  %106 = tail call double @cos(double %105) #4, !dbg !247
  %107 = fmul double %104, %106, !dbg !247
  %108 = fdiv double %103, %107, !dbg !247
  %109 = fmul double %100, %108, !dbg !247
  store double %109, double* @object_distance, align 8, !dbg !247, !tbaa !98
  store double %99, double* @axis_slope_angle, align 8, !dbg !248, !tbaa !98
  br label %transit_surface.exit, !dbg !249

transit_surface.exit:                             ; preds = %50, %53, %71, %94
  %110 = phi double [ %52, %50 ], [ %55, %53 ], [ %93, %71 ], [ %109, %94 ]
  %111 = load double* @to_index, align 8, !dbg !250, !tbaa !98
  store double %111, double* @from_index, align 8, !dbg !250, !tbaa !98
  %.b = load i1* @current_surfaces, align 1
  %112 = select i1 %.b, i32 4, i32 0, !dbg !251
  %113 = trunc i64 %indvars.iv to i32, !dbg !251
  %114 = icmp slt i32 %113, %112, !dbg !251
  br i1 %114, label %.thread, label %._crit_edge, !dbg !251

.thread:                                          ; preds = %transit_surface.exit
  %115 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 4, !dbg !253
  %116 = load double* %115, align 8, !dbg !253, !tbaa !98
  %117 = fsub double %110, %116, !dbg !253
  store double %117, double* @object_distance, align 8, !dbg !253, !tbaa !98
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv, 1, !dbg !183
  br label %3, !dbg !183

._crit_edge:                                      ; preds = %transit_surface.exit, %0
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
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"transit_surface", metadata !"transit_surface", metadata !"", i32 586, metadata !39, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !41, i32 586} ; [ DW_TAG_subprogram ] [line 586] [local] [def] [transit_surface]
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
!191 = metadata !{i32 593, i32 0, metadata !192, metadata !193}
!192 = metadata !{i32 786443, metadata !1, metadata !38, i32 593, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!193 = metadata !{i32 669, i32 0, metadata !187, null}
!194 = metadata !{i32 594, i32 0, metadata !195, metadata !193}
!195 = metadata !{i32 786443, metadata !1, metadata !196, i32 594, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!196 = metadata !{i32 786443, metadata !1, metadata !192, i32 593, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!197 = metadata !{i32 595, i32 0, metadata !198, metadata !193}
!198 = metadata !{i32 786443, metadata !1, metadata !199, i32 595, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!199 = metadata !{i32 786443, metadata !1, metadata !195, i32 594, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!200 = metadata !{i32 596, i32 0, metadata !201, metadata !193}
!201 = metadata !{i32 786443, metadata !1, metadata !198, i32 595, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!202 = metadata !{i32 597, i32 0, metadata !201, metadata !193}
!203 = metadata !{i32 786688, metadata !38, metadata !"iang_sin", metadata !5, i32 589, metadata !20, i32 0, metadata !193} ; [ DW_TAG_auto_variable ] [iang_sin] [line 589]
!204 = metadata !{i32 598, i32 0, metadata !201, metadata !193}
!205 = metadata !{i32 599, i32 0, metadata !198, metadata !193}
!206 = metadata !{i32 603, i32 0, metadata !199, metadata !193}
!207 = metadata !{i32 786688, metadata !38, metadata !"rang_sin", metadata !5, i32 590, metadata !20, i32 0, metadata !193} ; [ DW_TAG_auto_variable ] [rang_sin] [line 590]
!208 = metadata !{i32 786688, metadata !38, metadata !"old_axis_slope_angle", metadata !5, i32 591, metadata !20, i32 0, metadata !193} ; [ DW_TAG_auto_variable ] [old_axis_slope_angle] [line 591]
!209 = metadata !{i32 605, i32 0, metadata !199, metadata !193}
!210 = metadata !{i32 606, i32 0, metadata !199, metadata !193}
!211 = metadata !{i32 608, i32 0, metadata !212, metadata !193}
!212 = metadata !{i32 786443, metadata !1, metadata !199, i32 608, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!213 = metadata !{i32 610, i32 0, metadata !199, metadata !193}
!214 = metadata !{i32 609, i32 0, metadata !212, metadata !193}
!215 = metadata !{i32 611, i32 0, metadata !199, metadata !193}
!216 = metadata !{i32 613, i32 0, metadata !196, metadata !193}
!217 = metadata !{i32 614, i32 0, metadata !196, metadata !193}
!218 = metadata !{i32 615, i32 0, metadata !196, metadata !193}
!219 = metadata !{i32 618, i32 0, metadata !220, metadata !193}
!220 = metadata !{i32 786443, metadata !1, metadata !38, i32 618, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!221 = metadata !{i32 619, i32 0, metadata !222, metadata !193}
!222 = metadata !{i32 786443, metadata !1, metadata !223, i32 619, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!223 = metadata !{i32 786443, metadata !1, metadata !220, i32 618, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!224 = metadata !{i32 620, i32 0, metadata !225, metadata !193}
!225 = metadata !{i32 786443, metadata !1, metadata !222, i32 619, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!226 = metadata !{i32 621, i32 0, metadata !225, metadata !193}
!227 = metadata !{i32 622, i32 0, metadata !225, metadata !193}
!228 = metadata !{i32 623, i32 0, metadata !229, metadata !193}
!229 = metadata !{i32 786443, metadata !1, metadata !222, i32 622, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!230 = metadata !{i32 625, i32 0, metadata !229, metadata !193}
!231 = metadata !{i32 627, i32 0, metadata !223, metadata !193}
!232 = metadata !{i32 786688, metadata !38, metadata !"iang", metadata !5, i32 587, metadata !20, i32 0, metadata !193} ; [ DW_TAG_auto_variable ] [iang] [line 587]
!233 = metadata !{i32 628, i32 0, metadata !223, metadata !193}
!234 = metadata !{i32 630, i32 0, metadata !223, metadata !193}
!235 = metadata !{i32 631, i32 0, metadata !223, metadata !193}
!236 = metadata !{i32 632, i32 0, metadata !223, metadata !193}
!237 = metadata !{i32 633, i32 0, metadata !223, metadata !193}
!238 = metadata !{i32 786688, metadata !38, metadata !"sagitta", metadata !5, i32 591, metadata !20, i32 0, metadata !193} ; [ DW_TAG_auto_variable ] [sagitta] [line 591]
!239 = metadata !{i32 634, i32 0, metadata !223, metadata !193}
!240 = metadata !{i32 635, i32 0, metadata !223, metadata !193}
!241 = metadata !{i32 637, i32 0, metadata !223, metadata !193}
!242 = metadata !{i32 638, i32 0, metadata !223, metadata !193}
!243 = metadata !{i32 641, i32 0, metadata !38, metadata !193}
!244 = metadata !{i32 642, i32 0, metadata !38, metadata !193}
!245 = metadata !{i32 643, i32 0, metadata !38, metadata !193}
!246 = metadata !{i32 644, i32 0, metadata !38, metadata !193}
!247 = metadata !{i32 645, i32 0, metadata !38, metadata !193}
!248 = metadata !{i32 646, i32 0, metadata !38, metadata !193}
!249 = metadata !{i32 647, i32 0, metadata !38, metadata !193}
!250 = metadata !{i32 670, i32 0, metadata !187, null}
!251 = metadata !{i32 671, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !187, i32 671, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fbench.c]
!253 = metadata !{i32 672, i32 0, metadata !252, null}
