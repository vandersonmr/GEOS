; ModuleID = 'fbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %errors = alloca i32, align 4
  %od_fline = alloca double, align 8
  %od_cline = alloca double, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !67), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !67), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !67), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !73, metadata !67), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %k, metadata !75, metadata !67), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %errors, metadata !77, metadata !67), !dbg !78
  call void @llvm.dbg.declare(metadata double* %od_fline, metadata !79, metadata !67), !dbg !80
  call void @llvm.dbg.declare(metadata double* %od_cline, metadata !81, metadata !67), !dbg !82
  store double 7.621000e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 1), align 8, !dbg !83
  store double 6.869955e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 2), align 8, !dbg !84
  store double 6.562816e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 3), align 8, !dbg !85
  store double 5.895944e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 4), align 8, !dbg !86
  store double 5.269557e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 5), align 8, !dbg !87
  store double 4.861344e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 6), align 8, !dbg !88
  store double 4.340477e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 7), align 8, !dbg !89
  store double 3.968494e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 8), align 8, !dbg !90
  store i32 1000000, i32* @niter, align 4, !dbg !91
  store double 4.000000e+00, double* @clear_aperture, align 8, !dbg !92
  store i16 4, i16* @current_surfaces, align 2, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i32* %i, align 4, !dbg !96
  %1 = load i16* @current_surfaces, align 2, !dbg !100
  %conv = sext i16 %1 to i32, !dbg !100
  %cmp = icmp slt i32 %0, %conv, !dbg !101
  br i1 %cmp, label %for.body, label %for.end15, !dbg !102

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !103
  br label %for.cond2, !dbg !103

for.cond2:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !105
  %cmp3 = icmp slt i32 %2, 4, !dbg !105
  br i1 %cmp3, label %for.body5, label %for.end, !dbg !109

for.body5:                                        ; preds = %for.cond2
  %3 = load i32* %j, align 4, !dbg !110
  %idxprom = sext i32 %3 to i64, !dbg !111
  %4 = load i32* %i, align 4, !dbg !112
  %idxprom6 = sext i32 %4 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [4 x [4 x double]]* @testcase, i32 0, i64 %idxprom6, !dbg !111
  %arrayidx7 = getelementptr inbounds [4 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !111
  %5 = load double* %arrayidx7, align 8, !dbg !111
  %6 = load i32* %j, align 4, !dbg !113
  %add = add nsw i32 %6, 1, !dbg !113
  %idxprom8 = sext i32 %add to i64, !dbg !114
  %7 = load i32* %i, align 4, !dbg !115
  %add9 = add nsw i32 %7, 1, !dbg !115
  %idxprom10 = sext i32 %add9 to i64, !dbg !114
  %arrayidx11 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %idxprom10, !dbg !114
  %arrayidx12 = getelementptr inbounds [5 x double]* %arrayidx11, i32 0, i64 %idxprom8, !dbg !114
  store double %5, double* %arrayidx12, align 8, !dbg !114
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body5
  %8 = load i32* %j, align 4, !dbg !116
  %inc = add nsw i32 %8, 1, !dbg !116
  store i32 %inc, i32* %j, align 4, !dbg !116
  br label %for.cond2, !dbg !117

for.end:                                          ; preds = %for.cond2
  br label %for.inc13, !dbg !118

for.inc13:                                        ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !119
  %inc14 = add nsw i32 %9, 1, !dbg !119
  store i32 %inc14, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !120

for.end15:                                        ; preds = %for.cond
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i32 0, i32 0)), !dbg !121
  %10 = load i32* @niter, align 4, !dbg !122
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0), i32 %10), !dbg !123
  %11 = load i32* @niter, align 4, !dbg !124
  %conv17 = sitofp i32 %11 to double, !dbg !124
  %div = fdiv double %conv17, 1.000000e+03, !dbg !124
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), double %div), !dbg !125
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str3, i32 0, i32 0)), !dbg !126
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([67 x i8]* @.str4, i32 0, i32 0)), !dbg !127
  store i32 0, i32* @itercount, align 4, !dbg !128
  br label %for.cond21, !dbg !128

for.cond21:                                       ; preds = %for.inc53, %for.end15
  %12 = load i32* @itercount, align 4, !dbg !130
  %13 = load i32* @niter, align 4, !dbg !134
  %cmp22 = icmp slt i32 %12, %13, !dbg !135
  br i1 %cmp22, label %for.body24, label %for.end55, !dbg !136

for.body24:                                       ; preds = %for.cond21
  store i16 0, i16* @paraxial, align 2, !dbg !137
  br label %for.cond25, !dbg !137

for.cond25:                                       ; preds = %for.inc38, %for.body24
  %14 = load i16* @paraxial, align 2, !dbg !140
  %conv26 = sext i16 %14 to i32, !dbg !140
  %cmp27 = icmp sle i32 %conv26, 1, !dbg !140
  br i1 %cmp27, label %for.body29, label %for.end40, !dbg !144

for.body29:                                       ; preds = %for.cond25
  %15 = load double* @clear_aperture, align 8, !dbg !145
  %div30 = fdiv double %15, 2.000000e+00, !dbg !145
  %call31 = call i32 @trace_line(i32 4, double %div30), !dbg !147
  %16 = load double* @object_distance, align 8, !dbg !148
  %17 = load i16* @paraxial, align 2, !dbg !149
  %idxprom32 = sext i16 %17 to i64, !dbg !150
  %arrayidx33 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i32 0, i64 %idxprom32, !dbg !150
  %arrayidx34 = getelementptr inbounds [2 x double]* %arrayidx33, i32 0, i64 0, !dbg !150
  store double %16, double* %arrayidx34, align 8, !dbg !150
  %18 = load double* @axis_slope_angle, align 8, !dbg !151
  %19 = load i16* @paraxial, align 2, !dbg !152
  %idxprom35 = sext i16 %19 to i64, !dbg !153
  %arrayidx36 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i32 0, i64 %idxprom35, !dbg !153
  %arrayidx37 = getelementptr inbounds [2 x double]* %arrayidx36, i32 0, i64 1, !dbg !153
  store double %18, double* %arrayidx37, align 8, !dbg !153
  br label %for.inc38, !dbg !154

for.inc38:                                        ; preds = %for.body29
  %20 = load i16* @paraxial, align 2, !dbg !155
  %inc39 = add i16 %20, 1, !dbg !155
  store i16 %inc39, i16* @paraxial, align 2, !dbg !155
  br label %for.cond25, !dbg !156

for.end40:                                        ; preds = %for.cond25
  store i16 0, i16* @paraxial, align 2, !dbg !157
  %21 = load double* @clear_aperture, align 8, !dbg !158
  %div41 = fdiv double %21, 2.000000e+00, !dbg !158
  %call42 = call i32 @trace_line(i32 3, double %div41), !dbg !159
  %22 = load double* @object_distance, align 8, !dbg !160
  store double %22, double* %od_cline, align 8, !dbg !161
  %23 = load double* @clear_aperture, align 8, !dbg !162
  %div43 = fdiv double %23, 2.000000e+00, !dbg !162
  %call44 = call i32 @trace_line(i32 6, double %div43), !dbg !163
  %24 = load double* @object_distance, align 8, !dbg !164
  store double %24, double* %od_fline, align 8, !dbg !165
  %25 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 0), align 8, !dbg !166
  %26 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 0), align 8, !dbg !167
  %sub = fsub double %25, %26, !dbg !166
  store double %sub, double* @aberr_lspher, align 8, !dbg !168
  %27 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 0), align 8, !dbg !169
  %28 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 1), align 8, !dbg !170
  %mul = fmul double %27, %28, !dbg !169
  %29 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 1), align 8, !dbg !171
  %call45 = call double @sin(double %29) #5, !dbg !172
  %30 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 0), align 8, !dbg !173
  %mul46 = fmul double %call45, %30, !dbg !172
  %div47 = fdiv double %mul, %mul46, !dbg !174
  %sub48 = fsub double 1.000000e+00, %div47, !dbg !175
  store double %sub48, double* @aberr_osc, align 8, !dbg !176
  %31 = load double* %od_fline, align 8, !dbg !177
  %32 = load double* %od_cline, align 8, !dbg !178
  %sub49 = fsub double %31, %32, !dbg !177
  store double %sub49, double* @aberr_lchrom, align 8, !dbg !179
  %33 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 1), align 8, !dbg !180
  %call50 = call double @sin(double %33) #5, !dbg !181
  store double %call50, double* @max_lspher, align 8, !dbg !182
  %34 = load double* @max_lspher, align 8, !dbg !183
  %35 = load double* @max_lspher, align 8, !dbg !184
  %mul51 = fmul double %34, %35, !dbg !183
  %div52 = fdiv double 9.260000e-05, %mul51, !dbg !185
  store double %div52, double* @max_lspher, align 8, !dbg !186
  store double 2.500000e-03, double* @max_osc, align 8, !dbg !187
  %36 = load double* @max_lspher, align 8, !dbg !188
  store double %36, double* @max_lchrom, align 8, !dbg !189
  br label %for.inc53, !dbg !190

for.inc53:                                        ; preds = %for.end40
  %37 = load i32* @itercount, align 4, !dbg !191
  %inc54 = add nsw i32 %37, 1, !dbg !191
  store i32 %inc54, i32* @itercount, align 4, !dbg !191
  br label %for.cond21, !dbg !192

for.end55:                                        ; preds = %for.cond21
  %38 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 0), align 8, !dbg !193
  %39 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 0, i64 1), align 8, !dbg !194
  %call56 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 0, i32 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0), double %38, double %39) #5, !dbg !195
  %40 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 0), align 8, !dbg !196
  %41 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i64 1, i64 1), align 8, !dbg !197
  %call57 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 1, i32 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), double %40, double %41) #5, !dbg !198
  %42 = load double* @aberr_lspher, align 8, !dbg !199
  %call58 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 2, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str8, i32 0, i32 0), double %42) #5, !dbg !200
  %43 = load double* @max_lspher, align 8, !dbg !201
  %call59 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 3, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %43) #5, !dbg !202
  %44 = load double* @aberr_osc, align 8, !dbg !203
  %call60 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 4, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str10, i32 0, i32 0), double %44) #5, !dbg !204
  %45 = load double* @max_osc, align 8, !dbg !205
  %call61 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 5, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %45) #5, !dbg !206
  %46 = load double* @aberr_lchrom, align 8, !dbg !207
  %call62 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 6, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str11, i32 0, i32 0), double %46) #5, !dbg !208
  %47 = load double* @max_lchrom, align 8, !dbg !209
  %call63 = call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i64 7, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %47) #5, !dbg !210
  store i32 0, i32* %errors, align 4, !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond64, !dbg !212

for.cond64:                                       ; preds = %for.inc125, %for.end55
  %48 = load i32* %i, align 4, !dbg !214
  %cmp65 = icmp slt i32 %48, 8, !dbg !214
  br i1 %cmp65, label %for.body67, label %for.end127, !dbg !218

for.body67:                                       ; preds = %for.cond64
  %49 = load i32* %i, align 4, !dbg !219
  %idxprom68 = sext i32 %49 to i64, !dbg !222
  %arrayidx69 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %idxprom68, !dbg !222
  %arraydecay = getelementptr inbounds [80 x i8]* %arrayidx69, i32 0, i32 0, !dbg !222
  %50 = load i32* %i, align 4, !dbg !223
  %idxprom70 = sext i32 %50 to i64, !dbg !224
  %arrayidx71 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %idxprom70, !dbg !224
  %51 = load i8** %arrayidx71, align 8, !dbg !224
  %call72 = call i32 @strcmp(i8* %arraydecay, i8* %51) #6, !dbg !225
  %cmp73 = icmp ne i32 %call72, 0, !dbg !225
  br i1 %cmp73, label %if.then, label %if.end124, !dbg !226

if.then:                                          ; preds = %for.body67
  %52 = load i32* %i, align 4, !dbg !227
  %add75 = add nsw i32 %52, 1, !dbg !227
  %call76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str12, i32 0, i32 0), i32 %add75), !dbg !229
  %53 = load i32* %i, align 4, !dbg !230
  %idxprom77 = sext i32 %53 to i64, !dbg !231
  %arrayidx78 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %idxprom77, !dbg !231
  %54 = load i8** %arrayidx78, align 8, !dbg !231
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i32 0, i32 0), i8* %54), !dbg !232
  %55 = load i32* %i, align 4, !dbg !233
  %idxprom80 = sext i32 %55 to i64, !dbg !234
  %arrayidx81 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %idxprom80, !dbg !234
  %arraydecay82 = getelementptr inbounds [80 x i8]* %arrayidx81, i32 0, i32 0, !dbg !234
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i32 0, i32 0), i8* %arraydecay82), !dbg !235
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str15, i32 0, i32 0)), !dbg !236
  %56 = load i32* %i, align 4, !dbg !237
  %idxprom85 = sext i32 %56 to i64, !dbg !238
  %arrayidx86 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %idxprom85, !dbg !238
  %57 = load i8** %arrayidx86, align 8, !dbg !238
  %call87 = call i64 @strlen(i8* %57) #6, !dbg !239
  %conv88 = trunc i64 %call87 to i32, !dbg !239
  store i32 %conv88, i32* %k, align 4, !dbg !240
  store i32 0, i32* %j, align 4, !dbg !241
  br label %for.cond89, !dbg !241

for.cond89:                                       ; preds = %for.inc120, %if.then
  %58 = load i32* %j, align 4, !dbg !243
  %59 = load i32* %k, align 4, !dbg !247
  %cmp90 = icmp slt i32 %58, %59, !dbg !248
  br i1 %cmp90, label %for.body92, label %for.end122, !dbg !249

for.body92:                                       ; preds = %for.cond89
  %60 = load i32* %j, align 4, !dbg !250
  %idxprom93 = sext i32 %60 to i64, !dbg !252
  %61 = load i32* %i, align 4, !dbg !253
  %idxprom94 = sext i32 %61 to i64, !dbg !252
  %arrayidx95 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %idxprom94, !dbg !252
  %62 = load i8** %arrayidx95, align 8, !dbg !252
  %arrayidx96 = getelementptr inbounds i8* %62, i64 %idxprom93, !dbg !252
  %63 = load i8* %arrayidx96, align 1, !dbg !252
  %conv97 = sext i8 %63 to i32, !dbg !252
  %64 = load i32* %j, align 4, !dbg !254
  %idxprom98 = sext i32 %64 to i64, !dbg !255
  %65 = load i32* %i, align 4, !dbg !256
  %idxprom99 = sext i32 %65 to i64, !dbg !255
  %arrayidx100 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %idxprom99, !dbg !255
  %arrayidx101 = getelementptr inbounds [80 x i8]* %arrayidx100, i32 0, i64 %idxprom98, !dbg !255
  %66 = load i8* %arrayidx101, align 1, !dbg !255
  %conv102 = sext i8 %66 to i32, !dbg !255
  %cmp103 = icmp eq i32 %conv97, %conv102, !dbg !252
  %cond = select i1 %cmp103, i32 32, i32 94, !dbg !252
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str16, i32 0, i32 0), i32 %cond), !dbg !257
  %67 = load i32* %j, align 4, !dbg !258
  %idxprom106 = sext i32 %67 to i64, !dbg !260
  %68 = load i32* %i, align 4, !dbg !261
  %idxprom107 = sext i32 %68 to i64, !dbg !260
  %arrayidx108 = getelementptr inbounds [8 x i8*]* @refarr, i32 0, i64 %idxprom107, !dbg !260
  %69 = load i8** %arrayidx108, align 8, !dbg !260
  %arrayidx109 = getelementptr inbounds i8* %69, i64 %idxprom106, !dbg !260
  %70 = load i8* %arrayidx109, align 1, !dbg !260
  %conv110 = sext i8 %70 to i32, !dbg !260
  %71 = load i32* %j, align 4, !dbg !262
  %idxprom111 = sext i32 %71 to i64, !dbg !263
  %72 = load i32* %i, align 4, !dbg !264
  %idxprom112 = sext i32 %72 to i64, !dbg !263
  %arrayidx113 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i32 0, i64 %idxprom112, !dbg !263
  %arrayidx114 = getelementptr inbounds [80 x i8]* %arrayidx113, i32 0, i64 %idxprom111, !dbg !263
  %73 = load i8* %arrayidx114, align 1, !dbg !263
  %conv115 = sext i8 %73 to i32, !dbg !263
  %cmp116 = icmp ne i32 %conv110, %conv115, !dbg !260
  br i1 %cmp116, label %if.then118, label %if.end, !dbg !265

if.then118:                                       ; preds = %for.body92
  %74 = load i32* %errors, align 4, !dbg !266
  %inc119 = add nsw i32 %74, 1, !dbg !266
  store i32 %inc119, i32* %errors, align 4, !dbg !266
  br label %if.end, !dbg !266

if.end:                                           ; preds = %if.then118, %for.body92
  br label %for.inc120, !dbg !267

for.inc120:                                       ; preds = %if.end
  %75 = load i32* %j, align 4, !dbg !268
  %inc121 = add nsw i32 %75, 1, !dbg !268
  store i32 %inc121, i32* %j, align 4, !dbg !268
  br label %for.cond89, !dbg !269

for.end122:                                       ; preds = %for.cond89
  %call123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str17, i32 0, i32 0)), !dbg !270
  br label %if.end124, !dbg !271

if.end124:                                        ; preds = %for.end122, %for.body67
  br label %for.inc125, !dbg !272

for.inc125:                                       ; preds = %if.end124
  %76 = load i32* %i, align 4, !dbg !273
  %inc126 = add nsw i32 %76, 1, !dbg !273
  store i32 %inc126, i32* %i, align 4, !dbg !273
  br label %for.cond64, !dbg !274

for.end127:                                       ; preds = %for.cond64
  %77 = load i32* %errors, align 4, !dbg !275
  %cmp128 = icmp sgt i32 %77, 0, !dbg !275
  br i1 %cmp128, label %if.then130, label %if.else, !dbg !277

if.then130:                                       ; preds = %for.end127
  %78 = load i32* %errors, align 4, !dbg !278
  %79 = load i32* %errors, align 4, !dbg !280
  %cmp131 = icmp sgt i32 %79, 1, !dbg !280
  %cond133 = select i1 %cmp131, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str20, i32 0, i32 0), !dbg !280
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str18, i32 0, i32 0), i32 %78, i8* %cond133), !dbg !281
  br label %if.end136, !dbg !282

if.else:                                          ; preds = %for.end127
  %call135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0)), !dbg !283
  br label %if.end136

if.end136:                                        ; preds = %if.else, %if.then130
  ret i32 0, !dbg !284
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal i32 @trace_line(i32 %line, double %ray_h) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i32, align 4
  %ray_h.addr = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %line, i32* %line.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %line.addr, metadata !285, metadata !67), !dbg !286
  store double %ray_h, double* %ray_h.addr, align 8
  call void @llvm.dbg.declare(metadata double* %ray_h.addr, metadata !287, metadata !67), !dbg !288
  call void @llvm.dbg.declare(metadata i32* %i, metadata !289, metadata !67), !dbg !290
  store double 0.000000e+00, double* @object_distance, align 8, !dbg !291
  %0 = load double* %ray_h.addr, align 8, !dbg !292
  store double %0, double* @ray_height, align 8, !dbg !293
  store double 1.000000e+00, double* @from_index, align 8, !dbg !294
  store i32 1, i32* %i, align 4, !dbg !295
  br label %for.cond, !dbg !295

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4, !dbg !297
  %2 = load i16* @current_surfaces, align 2, !dbg !301
  %conv = sext i16 %2 to i32, !dbg !301
  %cmp = icmp sle i32 %1, %conv, !dbg !302
  br i1 %cmp, label %for.body, label %for.end, !dbg !303

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !304
  %idxprom = sext i32 %3 to i64, !dbg !306
  %arrayidx = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %idxprom, !dbg !306
  %arrayidx2 = getelementptr inbounds [5 x double]* %arrayidx, i32 0, i64 1, !dbg !306
  %4 = load double* %arrayidx2, align 8, !dbg !306
  store double %4, double* @radius_of_curvature, align 8, !dbg !307
  %5 = load i32* %i, align 4, !dbg !308
  %idxprom3 = sext i32 %5 to i64, !dbg !309
  %arrayidx4 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %idxprom3, !dbg !309
  %arrayidx5 = getelementptr inbounds [5 x double]* %arrayidx4, i32 0, i64 2, !dbg !309
  %6 = load double* %arrayidx5, align 8, !dbg !309
  store double %6, double* @to_index, align 8, !dbg !310
  %7 = load double* @to_index, align 8, !dbg !311
  %cmp6 = fcmp ogt double %7, 1.000000e+00, !dbg !311
  br i1 %cmp6, label %if.then, label %if.end, !dbg !313

if.then:                                          ; preds = %for.body
  %8 = load double* @to_index, align 8, !dbg !314
  %9 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 4), align 8, !dbg !315
  %10 = load i32* %line.addr, align 4, !dbg !316
  %idxprom8 = sext i32 %10 to i64, !dbg !317
  %arrayidx9 = getelementptr inbounds [9 x double]* @spectral_line, i32 0, i64 %idxprom8, !dbg !317
  %11 = load double* %arrayidx9, align 8, !dbg !317
  %sub = fsub double %9, %11, !dbg !315
  %12 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 3), align 8, !dbg !318
  %13 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i64 6), align 8, !dbg !319
  %sub10 = fsub double %12, %13, !dbg !318
  %div = fdiv double %sub, %sub10, !dbg !320
  %14 = load i32* %i, align 4, !dbg !321
  %idxprom11 = sext i32 %14 to i64, !dbg !322
  %arrayidx12 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %idxprom11, !dbg !322
  %arrayidx13 = getelementptr inbounds [5 x double]* %arrayidx12, i32 0, i64 2, !dbg !322
  %15 = load double* %arrayidx13, align 8, !dbg !322
  %sub14 = fsub double %15, 1.000000e+00, !dbg !322
  %16 = load i32* %i, align 4, !dbg !323
  %idxprom15 = sext i32 %16 to i64, !dbg !324
  %arrayidx16 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %idxprom15, !dbg !324
  %arrayidx17 = getelementptr inbounds [5 x double]* %arrayidx16, i32 0, i64 3, !dbg !324
  %17 = load double* %arrayidx17, align 8, !dbg !324
  %div18 = fdiv double %sub14, %17, !dbg !325
  %mul = fmul double %div, %div18, !dbg !326
  %add = fadd double %8, %mul, !dbg !314
  store double %add, double* @to_index, align 8, !dbg !327
  br label %if.end, !dbg !327

if.end:                                           ; preds = %if.then, %for.body
  call void @transit_surface(), !dbg !328
  %18 = load double* @to_index, align 8, !dbg !329
  store double %18, double* @from_index, align 8, !dbg !330
  %19 = load i32* %i, align 4, !dbg !331
  %20 = load i16* @current_surfaces, align 2, !dbg !333
  %conv19 = sext i16 %20 to i32, !dbg !333
  %cmp20 = icmp slt i32 %19, %conv19, !dbg !331
  br i1 %cmp20, label %if.then22, label %if.end27, !dbg !334

if.then22:                                        ; preds = %if.end
  %21 = load double* @object_distance, align 8, !dbg !335
  %22 = load i32* %i, align 4, !dbg !336
  %idxprom23 = sext i32 %22 to i64, !dbg !337
  %arrayidx24 = getelementptr inbounds [10 x [5 x double]]* @s, i32 0, i64 %idxprom23, !dbg !337
  %arrayidx25 = getelementptr inbounds [5 x double]* %arrayidx24, i32 0, i64 4, !dbg !337
  %23 = load double* %arrayidx25, align 8, !dbg !337
  %sub26 = fsub double %21, %23, !dbg !335
  store double %sub26, double* @object_distance, align 8, !dbg !338
  br label %if.end27, !dbg !338

if.end27:                                         ; preds = %if.then22, %if.end
  br label %for.inc, !dbg !339

for.inc:                                          ; preds = %if.end27
  %24 = load i32* %i, align 4, !dbg !340
  %inc = add nsw i32 %24, 1, !dbg !340
  store i32 %inc, i32* %i, align 4, !dbg !340
  br label %for.cond, !dbg !341

for.end:                                          ; preds = %for.cond
  %25 = load i32* %retval, !dbg !342
  ret i32 %25, !dbg !342
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
entry:
  %iang = alloca double, align 8
  %rang = alloca double, align 8
  %iang_sin = alloca double, align 8
  %rang_sin = alloca double, align 8
  %old_axis_slope_angle = alloca double, align 8
  %sagitta = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %iang, metadata !343, metadata !67), !dbg !344
  call void @llvm.dbg.declare(metadata double* %rang, metadata !345, metadata !67), !dbg !346
  call void @llvm.dbg.declare(metadata double* %iang_sin, metadata !347, metadata !67), !dbg !348
  call void @llvm.dbg.declare(metadata double* %rang_sin, metadata !349, metadata !67), !dbg !350
  call void @llvm.dbg.declare(metadata double* %old_axis_slope_angle, metadata !351, metadata !67), !dbg !352
  call void @llvm.dbg.declare(metadata double* %sagitta, metadata !353, metadata !67), !dbg !354
  %0 = load i16* @paraxial, align 2, !dbg !355
  %tobool = icmp ne i16 %0, 0, !dbg !357
  br i1 %tobool, label %if.then, label %if.end18, !dbg !357

if.then:                                          ; preds = %entry
  %1 = load double* @radius_of_curvature, align 8, !dbg !358
  %cmp = fcmp une double %1, 0.000000e+00, !dbg !358
  br i1 %cmp, label %if.then1, label %if.end13, !dbg !361

if.then1:                                         ; preds = %if.then
  %2 = load double* @object_distance, align 8, !dbg !362
  %cmp2 = fcmp oeq double %2, 0.000000e+00, !dbg !362
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !365

if.then3:                                         ; preds = %if.then1
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !366
  %3 = load double* @ray_height, align 8, !dbg !368
  %4 = load double* @radius_of_curvature, align 8, !dbg !369
  %div = fdiv double %3, %4, !dbg !368
  store double %div, double* %iang_sin, align 8, !dbg !370
  br label %if.end, !dbg !371

if.else:                                          ; preds = %if.then1
  %5 = load double* @object_distance, align 8, !dbg !372
  %6 = load double* @radius_of_curvature, align 8, !dbg !373
  %sub = fsub double %5, %6, !dbg !372
  %7 = load double* @radius_of_curvature, align 8, !dbg !374
  %div4 = fdiv double %sub, %7, !dbg !375
  %8 = load double* @axis_slope_angle, align 8, !dbg !376
  %mul = fmul double %div4, %8, !dbg !377
  store double %mul, double* %iang_sin, align 8, !dbg !378
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %9 = load double* @from_index, align 8, !dbg !379
  %10 = load double* @to_index, align 8, !dbg !380
  %div5 = fdiv double %9, %10, !dbg !379
  %11 = load double* %iang_sin, align 8, !dbg !381
  %mul6 = fmul double %div5, %11, !dbg !382
  store double %mul6, double* %rang_sin, align 8, !dbg !383
  %12 = load double* @axis_slope_angle, align 8, !dbg !384
  store double %12, double* %old_axis_slope_angle, align 8, !dbg !385
  %13 = load double* @axis_slope_angle, align 8, !dbg !386
  %14 = load double* %iang_sin, align 8, !dbg !387
  %add = fadd double %13, %14, !dbg !386
  %15 = load double* %rang_sin, align 8, !dbg !388
  %sub7 = fsub double %add, %15, !dbg !386
  store double %sub7, double* @axis_slope_angle, align 8, !dbg !389
  %16 = load double* @object_distance, align 8, !dbg !390
  %cmp8 = fcmp une double %16, 0.000000e+00, !dbg !390
  br i1 %cmp8, label %if.then9, label %if.end11, !dbg !392

if.then9:                                         ; preds = %if.end
  %17 = load double* @object_distance, align 8, !dbg !393
  %18 = load double* %old_axis_slope_angle, align 8, !dbg !394
  %mul10 = fmul double %17, %18, !dbg !393
  store double %mul10, double* @ray_height, align 8, !dbg !395
  br label %if.end11, !dbg !395

if.end11:                                         ; preds = %if.then9, %if.end
  %19 = load double* @ray_height, align 8, !dbg !396
  %20 = load double* @axis_slope_angle, align 8, !dbg !397
  %div12 = fdiv double %19, %20, !dbg !396
  store double %div12, double* @object_distance, align 8, !dbg !398
  br label %return, !dbg !399

if.end13:                                         ; preds = %if.then
  %21 = load double* @object_distance, align 8, !dbg !400
  %22 = load double* @to_index, align 8, !dbg !401
  %23 = load double* @from_index, align 8, !dbg !402
  %div14 = fdiv double %22, %23, !dbg !401
  %mul15 = fmul double %21, %div14, !dbg !400
  store double %mul15, double* @object_distance, align 8, !dbg !403
  %24 = load double* @axis_slope_angle, align 8, !dbg !404
  %25 = load double* @from_index, align 8, !dbg !405
  %26 = load double* @to_index, align 8, !dbg !406
  %div16 = fdiv double %25, %26, !dbg !405
  %mul17 = fmul double %24, %div16, !dbg !404
  store double %mul17, double* @axis_slope_angle, align 8, !dbg !407
  br label %return, !dbg !408

if.end18:                                         ; preds = %entry
  %27 = load double* @radius_of_curvature, align 8, !dbg !409
  %cmp19 = fcmp une double %27, 0.000000e+00, !dbg !409
  br i1 %cmp19, label %if.then20, label %if.end48, !dbg !411

if.then20:                                        ; preds = %if.end18
  %28 = load double* @object_distance, align 8, !dbg !412
  %cmp21 = fcmp oeq double %28, 0.000000e+00, !dbg !412
  br i1 %cmp21, label %if.then22, label %if.else24, !dbg !415

if.then22:                                        ; preds = %if.then20
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !416
  %29 = load double* @ray_height, align 8, !dbg !418
  %30 = load double* @radius_of_curvature, align 8, !dbg !419
  %div23 = fdiv double %29, %30, !dbg !418
  store double %div23, double* %iang_sin, align 8, !dbg !420
  br label %if.end28, !dbg !421

if.else24:                                        ; preds = %if.then20
  %31 = load double* @object_distance, align 8, !dbg !422
  %32 = load double* @radius_of_curvature, align 8, !dbg !424
  %sub25 = fsub double %31, %32, !dbg !422
  %33 = load double* @radius_of_curvature, align 8, !dbg !425
  %div26 = fdiv double %sub25, %33, !dbg !426
  %34 = load double* @axis_slope_angle, align 8, !dbg !427
  %call = call double @sin(double %34) #5, !dbg !428
  %mul27 = fmul double %div26, %call, !dbg !429
  store double %mul27, double* %iang_sin, align 8, !dbg !430
  br label %if.end28

if.end28:                                         ; preds = %if.else24, %if.then22
  %35 = load double* %iang_sin, align 8, !dbg !431
  %call29 = call double @asin(double %35) #5, !dbg !432
  store double %call29, double* %iang, align 8, !dbg !433
  %36 = load double* @from_index, align 8, !dbg !434
  %37 = load double* @to_index, align 8, !dbg !435
  %div30 = fdiv double %36, %37, !dbg !434
  %38 = load double* %iang_sin, align 8, !dbg !436
  %mul31 = fmul double %div30, %38, !dbg !437
  store double %mul31, double* %rang_sin, align 8, !dbg !438
  %39 = load double* @axis_slope_angle, align 8, !dbg !439
  store double %39, double* %old_axis_slope_angle, align 8, !dbg !440
  %40 = load double* @axis_slope_angle, align 8, !dbg !441
  %41 = load double* %iang, align 8, !dbg !442
  %add32 = fadd double %40, %41, !dbg !441
  %42 = load double* %rang_sin, align 8, !dbg !443
  %call33 = call double @asin(double %42) #5, !dbg !444
  %sub34 = fsub double %add32, %call33, !dbg !441
  store double %sub34, double* @axis_slope_angle, align 8, !dbg !445
  %43 = load double* %old_axis_slope_angle, align 8, !dbg !446
  %44 = load double* %iang, align 8, !dbg !447
  %add35 = fadd double %43, %44, !dbg !446
  %div36 = fdiv double %add35, 2.000000e+00, !dbg !448
  %call37 = call double @sin(double %div36) #5, !dbg !449
  store double %call37, double* %sagitta, align 8, !dbg !450
  %45 = load double* @radius_of_curvature, align 8, !dbg !451
  %mul38 = fmul double 2.000000e+00, %45, !dbg !452
  %46 = load double* %sagitta, align 8, !dbg !453
  %mul39 = fmul double %mul38, %46, !dbg !452
  %47 = load double* %sagitta, align 8, !dbg !454
  %mul40 = fmul double %mul39, %47, !dbg !452
  store double %mul40, double* %sagitta, align 8, !dbg !455
  %48 = load double* @radius_of_curvature, align 8, !dbg !456
  %49 = load double* %old_axis_slope_angle, align 8, !dbg !457
  %50 = load double* %iang, align 8, !dbg !458
  %add41 = fadd double %49, %50, !dbg !457
  %call42 = call double @sin(double %add41) #5, !dbg !459
  %mul43 = fmul double %48, %call42, !dbg !456
  %51 = load double* @axis_slope_angle, align 8, !dbg !460
  %call44 = call double @tan(double %51) #5, !dbg !460
  %div45 = fdiv double 1.000000e+00, %call44, !dbg !460
  %mul46 = fmul double %mul43, %div45, !dbg !461
  %52 = load double* %sagitta, align 8, !dbg !462
  %add47 = fadd double %mul46, %52, !dbg !463
  store double %add47, double* @object_distance, align 8, !dbg !464
  br label %return, !dbg !465

if.end48:                                         ; preds = %if.end18
  %53 = load double* @from_index, align 8, !dbg !466
  %54 = load double* @to_index, align 8, !dbg !467
  %div49 = fdiv double %53, %54, !dbg !466
  %55 = load double* @axis_slope_angle, align 8, !dbg !468
  %call50 = call double @sin(double %55) #5, !dbg !469
  %mul51 = fmul double %div49, %call50, !dbg !470
  %call52 = call double @asin(double %mul51) #5, !dbg !471
  %sub53 = fsub double -0.000000e+00, %call52, !dbg !472
  store double %sub53, double* %rang, align 8, !dbg !473
  %56 = load double* @object_distance, align 8, !dbg !474
  %57 = load double* @to_index, align 8, !dbg !475
  %58 = load double* %rang, align 8, !dbg !476
  %sub54 = fsub double -0.000000e+00, %58, !dbg !477
  %call55 = call double @cos(double %sub54) #5, !dbg !478
  %mul56 = fmul double %57, %call55, !dbg !475
  %59 = load double* @from_index, align 8, !dbg !479
  %60 = load double* @axis_slope_angle, align 8, !dbg !480
  %call57 = call double @cos(double %60) #5, !dbg !481
  %mul58 = fmul double %59, %call57, !dbg !479
  %div59 = fdiv double %mul56, %mul58, !dbg !482
  %mul60 = fmul double %56, %div59, !dbg !474
  store double %mul60, double* @object_distance, align 8, !dbg !483
  %61 = load double* %rang, align 8, !dbg !484
  %sub61 = fsub double -0.000000e+00, %61, !dbg !485
  store double %sub61, double* @axis_slope_angle, align 8, !dbg !486
  br label %return, !dbg !487

return:                                           ; preds = %if.end48, %if.end28, %if.end13, %if.end11
  ret void, !dbg !488
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !19, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c] [DW_LANG_C99]
!1 = !{!"fbench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !12, !16}
!4 = !{!"0x2e\00main\00main\00\00679\000\001\000\000\000\000\00682", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 679] [def] [scope 682] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!"0x2e\00trace_line\00trace_line\00\00651\001\001\000\000\000\000\00654", !1, !5, !13, null, i32 (i32, double)* @trace_line, null, null, !2} ; [ DW_TAG_subprogram ] [line 651] [local] [def] [scope 654] [trace_line]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!8, !8, !15}
!15 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = !{!"0x2e\00transit_surface\00transit_surface\00\00586\001\001\000\000\000\000\00586", !1, !5, !17, null, void ()* @transit_surface, null, null, !2} ; [ DW_TAG_subprogram ] [line 586] [local] [def] [transit_surface]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{null}
!19 = !{!20, !21, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !37, !42, !46, !51, !52, !55, !56, !57, !58, !59}
!20 = !{!"0x34\00niter\00niter\00\00283\000\001", null, !5, !8, i32* @niter, null} ; [ DW_TAG_variable ] [niter] [line 283] [def]
!21 = !{!"0x34\00current_surfaces\00current_surfaces\00\00248\001\001", null, !5, !22, i16* @current_surfaces, null} ; [ DW_TAG_variable ] [current_surfaces] [line 248] [local] [def]
!22 = !{!"0x24\00short\000\0016\0016\000\000\005", null, null} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!23 = !{!"0x34\00paraxial\00paraxial\00\00249\001\001", null, !5, !22, i16* @paraxial, null} ; [ DW_TAG_variable ] [paraxial] [line 249] [local] [def]
!24 = !{!"0x34\00clear_aperture\00clear_aperture\00\00251\001\001", null, !5, !15, double* @clear_aperture, null} ; [ DW_TAG_variable ] [clear_aperture] [line 251] [local] [def]
!25 = !{!"0x34\00aberr_lspher\00aberr_lspher\00\00253\001\001", null, !5, !15, double* @aberr_lspher, null} ; [ DW_TAG_variable ] [aberr_lspher] [line 253] [local] [def]
!26 = !{!"0x34\00aberr_osc\00aberr_osc\00\00254\001\001", null, !5, !15, double* @aberr_osc, null} ; [ DW_TAG_variable ] [aberr_osc] [line 254] [local] [def]
!27 = !{!"0x34\00aberr_lchrom\00aberr_lchrom\00\00255\001\001", null, !5, !15, double* @aberr_lchrom, null} ; [ DW_TAG_variable ] [aberr_lchrom] [line 255] [local] [def]
!28 = !{!"0x34\00max_lspher\00max_lspher\00\00257\001\001", null, !5, !15, double* @max_lspher, null} ; [ DW_TAG_variable ] [max_lspher] [line 257] [local] [def]
!29 = !{!"0x34\00max_osc\00max_osc\00\00258\001\001", null, !5, !15, double* @max_osc, null} ; [ DW_TAG_variable ] [max_osc] [line 258] [local] [def]
!30 = !{!"0x34\00max_lchrom\00max_lchrom\00\00259\001\001", null, !5, !15, double* @max_lchrom, null} ; [ DW_TAG_variable ] [max_lchrom] [line 259] [local] [def]
!31 = !{!"0x34\00object_distance\00object_distance\00\00262\001\001", null, !5, !15, double* @object_distance, null} ; [ DW_TAG_variable ] [object_distance] [line 262] [local] [def]
!32 = !{!"0x34\00axis_slope_angle\00axis_slope_angle\00\00264\001\001", null, !5, !15, double* @axis_slope_angle, null} ; [ DW_TAG_variable ] [axis_slope_angle] [line 264] [local] [def]
!33 = !{!"0x34\00spectral_line\00spectral_line\00\00268\001\001", null, !5, !34, [9 x double]* @spectral_line, null} ; [ DW_TAG_variable ] [spectral_line] [line 268] [local] [def]
!34 = !{!"0x1\00\000\00576\0064\000\000\000", null, null, !15, !35, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 576, align 64, offset 0] [from double]
!35 = !{!36}
!36 = !{!"0x21\000\009"}                          ; [ DW_TAG_subrange_type ] [0, 8]
!37 = !{!"0x34\00s\00s\00\00269\001\001", null, !5, !38, [10 x [5 x double]]* @s, null} ; [ DW_TAG_variable ] [s] [line 269] [local] [def]
!38 = !{!"0x1\00\000\003200\0064\000\000\000", null, null, !15, !39, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 64, offset 0] [from double]
!39 = !{!40, !41}
!40 = !{!"0x21\000\0010"}                         ; [ DW_TAG_subrange_type ] [0, 9]
!41 = !{!"0x21\000\005"}                          ; [ DW_TAG_subrange_type ] [0, 4]
!42 = !{!"0x34\00od_sa\00od_sa\00\00270\001\001", null, !5, !43, [2 x [2 x double]]* @od_sa, null} ; [ DW_TAG_variable ] [od_sa] [line 270] [local] [def]
!43 = !{!"0x1\00\000\00256\0064\000\000\000", null, null, !15, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from double]
!44 = !{!45, !45}
!45 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!46 = !{!"0x34\00outarr\00outarr\00\00272\001\001", null, !5, !47, [8 x [80 x i8]]* @outarr, null} ; [ DW_TAG_variable ] [outarr] [line 272] [local] [def]
!47 = !{!"0x1\00\000\005120\008\000\000\000", null, null, !11, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5120, align 8, offset 0] [from char]
!48 = !{!49, !50}
!49 = !{!"0x21\000\008"}                          ; [ DW_TAG_subrange_type ] [0, 7]
!50 = !{!"0x21\000\0080"}                         ; [ DW_TAG_subrange_type ] [0, 79]
!51 = !{!"0x34\00itercount\00itercount\00\00274\000\001", null, !5, !8, i32* @itercount, null} ; [ DW_TAG_variable ] [itercount] [line 274] [def]
!52 = !{!"0x34\00refarr\00refarr\00\00285\001\001", null, !5, !53, [8 x i8*]* @refarr, null} ; [ DW_TAG_variable ] [refarr] [line 285] [local] [def]
!53 = !{!"0x1\00\000\00512\0064\000\000\000", null, null, !10, !54, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!54 = !{!49}
!55 = !{!"0x34\00to_index\00to_index\00\00266\001\001", null, !5, !15, double* @to_index, null} ; [ DW_TAG_variable ] [to_index] [line 266] [local] [def]
!56 = !{!"0x34\00radius_of_curvature\00radius_of_curvature\00\00261\001\001", null, !5, !15, double* @radius_of_curvature, null} ; [ DW_TAG_variable ] [radius_of_curvature] [line 261] [local] [def]
!57 = !{!"0x34\00from_index\00from_index\00\00265\001\001", null, !5, !15, double* @from_index, null} ; [ DW_TAG_variable ] [from_index] [line 265] [local] [def]
!58 = !{!"0x34\00ray_height\00ray_height\00\00263\001\001", null, !5, !15, double* @ray_height, null} ; [ DW_TAG_variable ] [ray_height] [line 263] [local] [def]
!59 = !{!"0x34\00testcase\00testcase\00\00304\001\001", null, !5, !60, [4 x [4 x double]]* @testcase, null} ; [ DW_TAG_variable ] [testcase] [line 304] [local] [def]
!60 = !{!"0x1\00\000\001024\0064\000\000\000", null, null, !15, !61, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from double]
!61 = !{!62, !62}
!62 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!63 = !{i32 2, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 2}
!65 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!66 = !{!"0x101\00argc\0016777896\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 680]
!67 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!68 = !MDLocation(line: 680, column: 5, scope: !4)
!69 = !{!"0x101\00argv\0033555113\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 681]
!70 = !MDLocation(line: 681, column: 7, scope: !4)
!71 = !{!"0x100\00i\00683\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 683]
!72 = !MDLocation(line: 683, column: 6, scope: !4)
!73 = !{!"0x100\00j\00683\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [j] [line 683]
!74 = !MDLocation(line: 683, column: 9, scope: !4)
!75 = !{!"0x100\00k\00683\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [k] [line 683]
!76 = !MDLocation(line: 683, column: 12, scope: !4)
!77 = !{!"0x100\00errors\00683\000", !4, !5, !8}  ; [ DW_TAG_auto_variable ] [errors] [line 683]
!78 = !MDLocation(line: 683, column: 15, scope: !4)
!79 = !{!"0x100\00od_fline\00684\000", !4, !5, !15} ; [ DW_TAG_auto_variable ] [od_fline] [line 684]
!80 = !MDLocation(line: 684, column: 9, scope: !4)
!81 = !{!"0x100\00od_cline\00684\000", !4, !5, !15} ; [ DW_TAG_auto_variable ] [od_cline] [line 684]
!82 = !MDLocation(line: 684, column: 19, scope: !4)
!83 = !MDLocation(line: 689, column: 2, scope: !4)
!84 = !MDLocation(line: 690, column: 2, scope: !4)
!85 = !MDLocation(line: 691, column: 2, scope: !4)
!86 = !MDLocation(line: 692, column: 2, scope: !4)
!87 = !MDLocation(line: 693, column: 2, scope: !4)
!88 = !MDLocation(line: 694, column: 2, scope: !4)
!89 = !MDLocation(line: 695, column: 9, scope: !4)
!90 = !MDLocation(line: 696, column: 2, scope: !4)
!91 = !MDLocation(line: 700, column: 3, scope: !4)
!92 = !MDLocation(line: 704, column: 2, scope: !4)
!93 = !MDLocation(line: 705, column: 2, scope: !4)
!94 = !MDLocation(line: 706, column: 7, scope: !95)
!95 = !{!"0xb\00706\002\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!96 = !MDLocation(line: 706, column: 14, scope: !97)
!97 = !{!"0xb\002", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!98 = !{!"0xb\001", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!99 = !{!"0xb\00706\002\001", !1, !95}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!100 = !MDLocation(line: 706, column: 18, scope: !99)
!101 = !MDLocation(line: 706, column: 14, scope: !99)
!102 = !MDLocation(line: 706, column: 2, scope: !95)
!103 = !MDLocation(line: 707, column: 10, scope: !104)
!104 = !{!"0xb\00707\005\002", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!105 = !MDLocation(line: 707, column: 17, scope: !106)
!106 = !{!"0xb\002", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!107 = !{!"0xb\001", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!108 = !{!"0xb\00707\005\003", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!109 = !MDLocation(line: 707, column: 5, scope: !104)
!110 = !MDLocation(line: 708, column: 38, scope: !108)
!111 = !MDLocation(line: 708, column: 26, scope: !108)
!112 = !MDLocation(line: 708, column: 35, scope: !108)
!113 = !MDLocation(line: 708, column: 17, scope: !108)
!114 = !MDLocation(line: 708, column: 8, scope: !108)
!115 = !MDLocation(line: 708, column: 10, scope: !108)
!116 = !MDLocation(line: 707, column: 24, scope: !108)
!117 = !MDLocation(line: 707, column: 5, scope: !108)
!118 = !MDLocation(line: 708, column: 39, scope: !104)
!119 = !MDLocation(line: 706, column: 36, scope: !99)
!120 = !MDLocation(line: 706, column: 2, scope: !99)
!121 = !MDLocation(line: 714, column: 9, scope: !4)
!122 = !MDLocation(line: 716, column: 5, scope: !4)
!123 = !MDLocation(line: 715, column: 9, scope: !4)
!124 = !MDLocation(line: 718, column: 77, scope: !4)
!125 = !MDLocation(line: 718, column: 9, scope: !4)
!126 = !MDLocation(line: 719, column: 9, scope: !4)
!127 = !MDLocation(line: 720, column: 9, scope: !4)
!128 = !MDLocation(line: 732, column: 7, scope: !129)
!129 = !{!"0xb\00732\002\004", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!130 = !MDLocation(line: 732, column: 22, scope: !131)
!131 = !{!"0xb\002", !1, !132}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!132 = !{!"0xb\001", !1, !133}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!133 = !{!"0xb\00732\002\005", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!134 = !MDLocation(line: 732, column: 34, scope: !133)
!135 = !MDLocation(line: 732, column: 22, scope: !133)
!136 = !MDLocation(line: 732, column: 2, scope: !129)
!137 = !MDLocation(line: 735, column: 10, scope: !138)
!138 = !{!"0xb\00735\005\007", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!139 = !{!"0xb\00732\0054\006", !1, !133}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!140 = !MDLocation(line: 735, column: 24, scope: !141)
!141 = !{!"0xb\002", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!142 = !{!"0xb\001", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!143 = !{!"0xb\00735\005\008", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!144 = !MDLocation(line: 735, column: 5, scope: !138)
!145 = !MDLocation(line: 739, column: 22, scope: !146)
!146 = !{!"0xb\00735\0051\009", !1, !143}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!147 = !MDLocation(line: 739, column: 8, scope: !146)
!148 = !MDLocation(line: 740, column: 29, scope: !146)
!149 = !MDLocation(line: 740, column: 14, scope: !146)
!150 = !MDLocation(line: 740, column: 8, scope: !146)
!151 = !MDLocation(line: 741, column: 29, scope: !146)
!152 = !MDLocation(line: 741, column: 14, scope: !146)
!153 = !MDLocation(line: 741, column: 8, scope: !146)
!154 = !MDLocation(line: 742, column: 5, scope: !146)
!155 = !MDLocation(line: 735, column: 39, scope: !143)
!156 = !MDLocation(line: 735, column: 5, scope: !143)
!157 = !MDLocation(line: 743, column: 5, scope: !139)
!158 = !MDLocation(line: 747, column: 19, scope: !139)
!159 = !MDLocation(line: 747, column: 5, scope: !139)
!160 = !MDLocation(line: 748, column: 16, scope: !139)
!161 = !MDLocation(line: 748, column: 5, scope: !139)
!162 = !MDLocation(line: 752, column: 19, scope: !139)
!163 = !MDLocation(line: 752, column: 5, scope: !139)
!164 = !MDLocation(line: 753, column: 16, scope: !139)
!165 = !MDLocation(line: 753, column: 5, scope: !139)
!166 = !MDLocation(line: 755, column: 20, scope: !139)
!167 = !MDLocation(line: 755, column: 34, scope: !139)
!168 = !MDLocation(line: 755, column: 5, scope: !139)
!169 = !MDLocation(line: 756, column: 24, scope: !139)
!170 = !MDLocation(line: 756, column: 38, scope: !139)
!171 = !MDLocation(line: 757, column: 13, scope: !139)
!172 = !MDLocation(line: 757, column: 9, scope: !139)
!173 = !MDLocation(line: 757, column: 28, scope: !139)
!174 = !MDLocation(line: 756, column: 23, scope: !139)
!175 = !MDLocation(line: 756, column: 17, scope: !139)
!176 = !MDLocation(line: 756, column: 5, scope: !139)
!177 = !MDLocation(line: 758, column: 20, scope: !139)
!178 = !MDLocation(line: 758, column: 31, scope: !139)
!179 = !MDLocation(line: 758, column: 5, scope: !139)
!180 = !MDLocation(line: 759, column: 22, scope: !139)
!181 = !MDLocation(line: 759, column: 18, scope: !139)
!182 = !MDLocation(line: 759, column: 5, scope: !139)
!183 = !MDLocation(line: 763, column: 31, scope: !139)
!184 = !MDLocation(line: 763, column: 44, scope: !139)
!185 = !MDLocation(line: 763, column: 18, scope: !139)
!186 = !MDLocation(line: 763, column: 5, scope: !139)
!187 = !MDLocation(line: 764, column: 5, scope: !139)
!188 = !MDLocation(line: 765, column: 18, scope: !139)
!189 = !MDLocation(line: 765, column: 5, scope: !139)
!190 = !MDLocation(line: 767, column: 2, scope: !139)
!191 = !MDLocation(line: 732, column: 41, scope: !133)
!192 = !MDLocation(line: 732, column: 2, scope: !133)
!193 = !MDLocation(line: 773, column: 28, scope: !4)
!194 = !MDLocation(line: 773, column: 41, scope: !4)
!195 = !MDLocation(line: 772, column: 9, scope: !4)
!196 = !MDLocation(line: 775, column: 28, scope: !4)
!197 = !MDLocation(line: 775, column: 41, scope: !4)
!198 = !MDLocation(line: 774, column: 9, scope: !4)
!199 = !MDLocation(line: 778, column: 5, scope: !4)
!200 = !MDLocation(line: 776, column: 2, scope: !4)
!201 = !MDLocation(line: 781, column: 5, scope: !4)
!202 = !MDLocation(line: 779, column: 2, scope: !4)
!203 = !MDLocation(line: 784, column: 5, scope: !4)
!204 = !MDLocation(line: 782, column: 2, scope: !4)
!205 = !MDLocation(line: 787, column: 5, scope: !4)
!206 = !MDLocation(line: 785, column: 2, scope: !4)
!207 = !MDLocation(line: 790, column: 5, scope: !4)
!208 = !MDLocation(line: 788, column: 2, scope: !4)
!209 = !MDLocation(line: 793, column: 5, scope: !4)
!210 = !MDLocation(line: 791, column: 2, scope: !4)
!211 = !MDLocation(line: 798, column: 2, scope: !4)
!212 = !MDLocation(line: 799, column: 7, scope: !213)
!213 = !{!"0xb\00799\002\0010", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!214 = !MDLocation(line: 799, column: 14, scope: !215)
!215 = !{!"0xb\002", !1, !216}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!216 = !{!"0xb\001", !1, !217}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!217 = !{!"0xb\00799\002\0011", !1, !213}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!218 = !MDLocation(line: 799, column: 2, scope: !213)
!219 = !MDLocation(line: 800, column: 23, scope: !220)
!220 = !{!"0xb\00800\009\0013", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!221 = !{!"0xb\00799\0026\0012", !1, !217}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!222 = !MDLocation(line: 800, column: 16, scope: !220)
!223 = !MDLocation(line: 800, column: 34, scope: !220)
!224 = !MDLocation(line: 800, column: 27, scope: !220)
!225 = !MDLocation(line: 800, column: 9, scope: !220)
!226 = !MDLocation(line: 800, column: 9, scope: !221)
!227 = !MDLocation(line: 805, column: 60, scope: !228)
!228 = !{!"0xb\00800\0044\0014", !1, !220}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!229 = !MDLocation(line: 805, column: 15, scope: !228)
!230 = !MDLocation(line: 807, column: 52, scope: !228)
!231 = !MDLocation(line: 807, column: 45, scope: !228)
!232 = !MDLocation(line: 807, column: 15, scope: !228)
!233 = !MDLocation(line: 808, column: 52, scope: !228)
!234 = !MDLocation(line: 808, column: 45, scope: !228)
!235 = !MDLocation(line: 808, column: 15, scope: !228)
!236 = !MDLocation(line: 809, column: 15, scope: !228)
!237 = !MDLocation(line: 810, column: 26, scope: !228)
!238 = !MDLocation(line: 810, column: 19, scope: !228)
!239 = !MDLocation(line: 810, column: 12, scope: !228)
!240 = !MDLocation(line: 810, column: 8, scope: !228)
!241 = !MDLocation(line: 811, column: 13, scope: !242)
!242 = !{!"0xb\00811\008\0015", !1, !228}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!243 = !MDLocation(line: 811, column: 20, scope: !244)
!244 = !{!"0xb\002", !1, !245}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!245 = !{!"0xb\001", !1, !246}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!246 = !{!"0xb\00811\008\0016", !1, !242}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!247 = !MDLocation(line: 811, column: 24, scope: !246)
!248 = !MDLocation(line: 811, column: 20, scope: !246)
!249 = !MDLocation(line: 811, column: 8, scope: !242)
!250 = !MDLocation(line: 812, column: 41, scope: !251)
!251 = !{!"0xb\00811\0032\0017", !1, !246}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!252 = !MDLocation(line: 812, column: 31, scope: !251)
!253 = !MDLocation(line: 812, column: 38, scope: !251)
!254 = !MDLocation(line: 812, column: 57, scope: !251)
!255 = !MDLocation(line: 812, column: 47, scope: !251)
!256 = !MDLocation(line: 812, column: 54, scope: !251)
!257 = !MDLocation(line: 812, column: 18, scope: !251)
!258 = !MDLocation(line: 813, column: 18, scope: !259)
!259 = !{!"0xb\00813\008\0018", !1, !251}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!260 = !MDLocation(line: 813, column: 8, scope: !259)
!261 = !MDLocation(line: 813, column: 15, scope: !259)
!262 = !MDLocation(line: 813, column: 34, scope: !259)
!263 = !MDLocation(line: 813, column: 24, scope: !259)
!264 = !MDLocation(line: 813, column: 31, scope: !259)
!265 = !MDLocation(line: 813, column: 8, scope: !251)
!266 = !MDLocation(line: 814, column: 7, scope: !259)
!267 = !MDLocation(line: 815, column: 8, scope: !251)
!268 = !MDLocation(line: 811, column: 27, scope: !246)
!269 = !MDLocation(line: 811, column: 8, scope: !246)
!270 = !MDLocation(line: 816, column: 15, scope: !228)
!271 = !MDLocation(line: 817, column: 5, scope: !228)
!272 = !MDLocation(line: 818, column: 2, scope: !221)
!273 = !MDLocation(line: 799, column: 21, scope: !217)
!274 = !MDLocation(line: 799, column: 2, scope: !217)
!275 = !MDLocation(line: 822, column: 6, scope: !276)
!276 = !{!"0xb\00822\006\0019", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!277 = !MDLocation(line: 822, column: 6, scope: !4)
!278 = !MDLocation(line: 824, column: 15, scope: !279)
!279 = !{!"0xb\00822\0018\0020", !1, !276}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!280 = !MDLocation(line: 824, column: 23, scope: !279)
!281 = !MDLocation(line: 823, column: 12, scope: !279)
!282 = !MDLocation(line: 825, column: 2, scope: !279)
!283 = !MDLocation(line: 826, column: 12, scope: !276)
!284 = !MDLocation(line: 828, column: 2, scope: !4)
!285 = !{!"0x101\00line\0016777868\000", !12, !5, !8} ; [ DW_TAG_arg_variable ] [line] [line 652]
!286 = !MDLocation(line: 652, column: 5, scope: !12)
!287 = !{!"0x101\00ray_h\0033555085\000", !12, !5, !15} ; [ DW_TAG_arg_variable ] [ray_h] [line 653]
!288 = !MDLocation(line: 653, column: 8, scope: !12)
!289 = !{!"0x100\00i\00655\000", !12, !5, !8}     ; [ DW_TAG_auto_variable ] [i] [line 655]
!290 = !MDLocation(line: 655, column: 6, scope: !12)
!291 = !MDLocation(line: 657, column: 2, scope: !12)
!292 = !MDLocation(line: 658, column: 15, scope: !12)
!293 = !MDLocation(line: 658, column: 2, scope: !12)
!294 = !MDLocation(line: 659, column: 2, scope: !12)
!295 = !MDLocation(line: 661, column: 7, scope: !296)
!296 = !{!"0xb\00661\002\0021", !1, !12}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!297 = !MDLocation(line: 661, column: 14, scope: !298)
!298 = !{!"0xb\002", !1, !299}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!299 = !{!"0xb\001", !1, !300}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!300 = !{!"0xb\00661\002\0022", !1, !296}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!301 = !MDLocation(line: 661, column: 19, scope: !300)
!302 = !MDLocation(line: 661, column: 14, scope: !300)
!303 = !MDLocation(line: 661, column: 2, scope: !296)
!304 = !MDLocation(line: 662, column: 29, scope: !305)
!305 = !{!"0xb\00661\0042\0023", !1, !300}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!306 = !MDLocation(line: 662, column: 27, scope: !305)
!307 = !MDLocation(line: 662, column: 5, scope: !305)
!308 = !MDLocation(line: 663, column: 18, scope: !305)
!309 = !MDLocation(line: 663, column: 16, scope: !305)
!310 = !MDLocation(line: 663, column: 5, scope: !305)
!311 = !MDLocation(line: 664, column: 9, scope: !312)
!312 = !{!"0xb\00664\009\0024", !1, !305}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!313 = !MDLocation(line: 664, column: 9, scope: !305)
!314 = !MDLocation(line: 665, column: 19, scope: !312)
!315 = !MDLocation(line: 665, column: 32, scope: !312)
!316 = !MDLocation(line: 666, column: 18, scope: !312)
!317 = !MDLocation(line: 666, column: 4, scope: !312)
!318 = !MDLocation(line: 667, column: 5, scope: !312)
!319 = !MDLocation(line: 667, column: 24, scope: !312)
!320 = !MDLocation(line: 665, column: 31, scope: !312)
!321 = !MDLocation(line: 667, column: 49, scope: !312)
!322 = !MDLocation(line: 667, column: 47, scope: !312)
!323 = !MDLocation(line: 668, column: 6, scope: !312)
!324 = !MDLocation(line: 668, column: 4, scope: !312)
!325 = !MDLocation(line: 667, column: 46, scope: !312)
!326 = !MDLocation(line: 665, column: 30, scope: !312)
!327 = !MDLocation(line: 665, column: 8, scope: !312)
!328 = !MDLocation(line: 669, column: 5, scope: !305)
!329 = !MDLocation(line: 670, column: 18, scope: !305)
!330 = !MDLocation(line: 670, column: 5, scope: !305)
!331 = !MDLocation(line: 671, column: 9, scope: !332)
!332 = !{!"0xb\00671\009\0025", !1, !305}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!333 = !MDLocation(line: 671, column: 13, scope: !332)
!334 = !MDLocation(line: 671, column: 9, scope: !305)
!335 = !MDLocation(line: 672, column: 26, scope: !332)
!336 = !MDLocation(line: 672, column: 46, scope: !332)
!337 = !MDLocation(line: 672, column: 44, scope: !332)
!338 = !MDLocation(line: 672, column: 8, scope: !332)
!339 = !MDLocation(line: 673, column: 2, scope: !305)
!340 = !MDLocation(line: 661, column: 37, scope: !300)
!341 = !MDLocation(line: 661, column: 2, scope: !300)
!342 = !MDLocation(line: 674, column: 1, scope: !12)
!343 = !{!"0x100\00iang\00587\000", !16, !5, !15} ; [ DW_TAG_auto_variable ] [iang] [line 587]
!344 = !MDLocation(line: 587, column: 9, scope: !16)
!345 = !{!"0x100\00rang\00588\000", !16, !5, !15} ; [ DW_TAG_auto_variable ] [rang] [line 588]
!346 = !MDLocation(line: 588, column: 9, scope: !16)
!347 = !{!"0x100\00iang_sin\00589\000", !16, !5, !15} ; [ DW_TAG_auto_variable ] [iang_sin] [line 589]
!348 = !MDLocation(line: 589, column: 9, scope: !16)
!349 = !{!"0x100\00rang_sin\00590\000", !16, !5, !15} ; [ DW_TAG_auto_variable ] [rang_sin] [line 590]
!350 = !MDLocation(line: 590, column: 9, scope: !16)
!351 = !{!"0x100\00old_axis_slope_angle\00591\000", !16, !5, !15} ; [ DW_TAG_auto_variable ] [old_axis_slope_angle] [line 591]
!352 = !MDLocation(line: 591, column: 9, scope: !16)
!353 = !{!"0x100\00sagitta\00591\000", !16, !5, !15} ; [ DW_TAG_auto_variable ] [sagitta] [line 591]
!354 = !MDLocation(line: 591, column: 31, scope: !16)
!355 = !MDLocation(line: 593, column: 6, scope: !356)
!356 = !{!"0xb\00593\006\0026", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!357 = !MDLocation(line: 593, column: 6, scope: !16)
!358 = !MDLocation(line: 594, column: 9, scope: !359)
!359 = !{!"0xb\00594\009\0028", !1, !360}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!360 = !{!"0xb\00593\0016\0027", !1, !356}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!361 = !MDLocation(line: 594, column: 9, scope: !360)
!362 = !MDLocation(line: 595, column: 12, scope: !363)
!363 = !{!"0xb\00595\0012\0030", !1, !364}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!364 = !{!"0xb\00594\0037\0029", !1, !359}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!365 = !MDLocation(line: 595, column: 12, scope: !364)
!366 = !MDLocation(line: 596, column: 4, scope: !367)
!367 = !{!"0xb\00595\0036\0031", !1, !363}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!368 = !MDLocation(line: 597, column: 15, scope: !367)
!369 = !MDLocation(line: 597, column: 28, scope: !367)
!370 = !MDLocation(line: 597, column: 4, scope: !367)
!371 = !MDLocation(line: 598, column: 8, scope: !367)
!372 = !MDLocation(line: 599, column: 17, scope: !363)
!373 = !MDLocation(line: 600, column: 7, scope: !363)
!374 = !MDLocation(line: 600, column: 30, scope: !363)
!375 = !MDLocation(line: 599, column: 16, scope: !363)
!376 = !MDLocation(line: 601, column: 7, scope: !363)
!377 = !MDLocation(line: 599, column: 15, scope: !363)
!378 = !MDLocation(line: 599, column: 4, scope: !363)
!379 = !MDLocation(line: 603, column: 20, scope: !364)
!380 = !MDLocation(line: 603, column: 33, scope: !364)
!381 = !MDLocation(line: 604, column: 4, scope: !364)
!382 = !MDLocation(line: 603, column: 19, scope: !364)
!383 = !MDLocation(line: 603, column: 8, scope: !364)
!384 = !MDLocation(line: 605, column: 31, scope: !364)
!385 = !MDLocation(line: 605, column: 8, scope: !364)
!386 = !MDLocation(line: 606, column: 27, scope: !364)
!387 = !MDLocation(line: 607, column: 4, scope: !364)
!388 = !MDLocation(line: 607, column: 15, scope: !364)
!389 = !MDLocation(line: 606, column: 8, scope: !364)
!390 = !MDLocation(line: 608, column: 12, scope: !391)
!391 = !{!"0xb\00608\0012\0032", !1, !364}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!392 = !MDLocation(line: 608, column: 12, scope: !364)
!393 = !MDLocation(line: 609, column: 17, scope: !391)
!394 = !MDLocation(line: 609, column: 35, scope: !391)
!395 = !MDLocation(line: 609, column: 4, scope: !391)
!396 = !MDLocation(line: 610, column: 26, scope: !364)
!397 = !MDLocation(line: 610, column: 39, scope: !364)
!398 = !MDLocation(line: 610, column: 8, scope: !364)
!399 = !MDLocation(line: 611, column: 8, scope: !364)
!400 = !MDLocation(line: 613, column: 23, scope: !360)
!401 = !MDLocation(line: 613, column: 42, scope: !360)
!402 = !MDLocation(line: 613, column: 53, scope: !360)
!403 = !MDLocation(line: 613, column: 5, scope: !360)
!404 = !MDLocation(line: 614, column: 24, scope: !360)
!405 = !MDLocation(line: 614, column: 44, scope: !360)
!406 = !MDLocation(line: 614, column: 57, scope: !360)
!407 = !MDLocation(line: 614, column: 5, scope: !360)
!408 = !MDLocation(line: 615, column: 5, scope: !360)
!409 = !MDLocation(line: 618, column: 6, scope: !410)
!410 = !{!"0xb\00618\006\0033", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!411 = !MDLocation(line: 618, column: 6, scope: !16)
!412 = !MDLocation(line: 619, column: 9, scope: !413)
!413 = !{!"0xb\00619\009\0035", !1, !414}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!414 = !{!"0xb\00618\0034\0034", !1, !410}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!415 = !MDLocation(line: 619, column: 9, scope: !414)
!416 = !MDLocation(line: 620, column: 8, scope: !417)
!417 = !{!"0xb\00619\0033\0036", !1, !413}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!418 = !MDLocation(line: 621, column: 19, scope: !417)
!419 = !MDLocation(line: 621, column: 32, scope: !417)
!420 = !MDLocation(line: 621, column: 8, scope: !417)
!421 = !MDLocation(line: 622, column: 5, scope: !417)
!422 = !MDLocation(line: 623, column: 21, scope: !423)
!423 = !{!"0xb\00622\0012\0037", !1, !413}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!424 = !MDLocation(line: 624, column: 4, scope: !423)
!425 = !MDLocation(line: 624, column: 27, scope: !423)
!426 = !MDLocation(line: 623, column: 20, scope: !423)
!427 = !MDLocation(line: 625, column: 8, scope: !423)
!428 = !MDLocation(line: 625, column: 4, scope: !423)
!429 = !MDLocation(line: 623, column: 19, scope: !423)
!430 = !MDLocation(line: 623, column: 8, scope: !423)
!431 = !MDLocation(line: 627, column: 17, scope: !414)
!432 = !MDLocation(line: 627, column: 12, scope: !414)
!433 = !MDLocation(line: 627, column: 5, scope: !414)
!434 = !MDLocation(line: 628, column: 17, scope: !414)
!435 = !MDLocation(line: 628, column: 30, scope: !414)
!436 = !MDLocation(line: 629, column: 8, scope: !414)
!437 = !MDLocation(line: 628, column: 16, scope: !414)
!438 = !MDLocation(line: 628, column: 5, scope: !414)
!439 = !MDLocation(line: 630, column: 28, scope: !414)
!440 = !MDLocation(line: 630, column: 5, scope: !414)
!441 = !MDLocation(line: 631, column: 24, scope: !414)
!442 = !MDLocation(line: 632, column: 8, scope: !414)
!443 = !MDLocation(line: 632, column: 20, scope: !414)
!444 = !MDLocation(line: 632, column: 15, scope: !414)
!445 = !MDLocation(line: 631, column: 5, scope: !414)
!446 = !MDLocation(line: 633, column: 20, scope: !414)
!447 = !MDLocation(line: 633, column: 43, scope: !414)
!448 = !MDLocation(line: 633, column: 19, scope: !414)
!449 = !MDLocation(line: 633, column: 15, scope: !414)
!450 = !MDLocation(line: 633, column: 5, scope: !414)
!451 = !MDLocation(line: 634, column: 21, scope: !414)
!452 = !MDLocation(line: 634, column: 15, scope: !414)
!453 = !MDLocation(line: 634, column: 41, scope: !414)
!454 = !MDLocation(line: 634, column: 49, scope: !414)
!455 = !MDLocation(line: 634, column: 5, scope: !414)
!456 = !MDLocation(line: 635, column: 25, scope: !414)
!457 = !MDLocation(line: 636, column: 8, scope: !414)
!458 = !MDLocation(line: 636, column: 31, scope: !414)
!459 = !MDLocation(line: 635, column: 47, scope: !414)
!460 = !MDLocation(line: 637, column: 8, scope: !414)
!461 = !MDLocation(line: 635, column: 24, scope: !414)
!462 = !MDLocation(line: 637, column: 33, scope: !414)
!463 = !MDLocation(line: 635, column: 23, scope: !414)
!464 = !MDLocation(line: 635, column: 5, scope: !414)
!465 = !MDLocation(line: 638, column: 5, scope: !414)
!466 = !MDLocation(line: 641, column: 16, scope: !16)
!467 = !MDLocation(line: 641, column: 29, scope: !16)
!468 = !MDLocation(line: 642, column: 9, scope: !16)
!469 = !MDLocation(line: 642, column: 5, scope: !16)
!470 = !MDLocation(line: 641, column: 15, scope: !16)
!471 = !MDLocation(line: 641, column: 10, scope: !16)
!472 = !MDLocation(line: 641, column: 9, scope: !16)
!473 = !MDLocation(line: 641, column: 2, scope: !16)
!474 = !MDLocation(line: 643, column: 20, scope: !16)
!475 = !MDLocation(line: 643, column: 40, scope: !16)
!476 = !MDLocation(line: 644, column: 10, scope: !16)
!477 = !MDLocation(line: 644, column: 9, scope: !16)
!478 = !MDLocation(line: 644, column: 5, scope: !16)
!479 = !MDLocation(line: 644, column: 20, scope: !16)
!480 = !MDLocation(line: 645, column: 9, scope: !16)
!481 = !MDLocation(line: 645, column: 5, scope: !16)
!482 = !MDLocation(line: 643, column: 39, scope: !16)
!483 = !MDLocation(line: 643, column: 2, scope: !16)
!484 = !MDLocation(line: 646, column: 22, scope: !16)
!485 = !MDLocation(line: 646, column: 21, scope: !16)
!486 = !MDLocation(line: 646, column: 2, scope: !16)
!487 = !MDLocation(line: 647, column: 1, scope: !16)
!488 = !MDLocation(line: 647, column: 1, scope: !489)
!489 = !{!"0xb\001", !1, !16}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
