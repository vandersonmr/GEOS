; ModuleID = 'fbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
for.cond2.preheader.lr.ph:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !13, metadata !96), !dbg !97
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !14, metadata !96), !dbg !98
  store double 7.621000e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 1), align 8, !dbg !99, !tbaa !100
  store double 6.869955e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 2), align 16, !dbg !104, !tbaa !100
  store double 6.562816e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 3), align 8, !dbg !105, !tbaa !100
  store double 5.895944e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 4), align 16, !dbg !106, !tbaa !100
  store double 5.269557e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 5), align 8, !dbg !107, !tbaa !100
  store double 4.861344e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 6), align 16, !dbg !108, !tbaa !100
  store double 4.340477e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 7), align 8, !dbg !109, !tbaa !100
  store double 3.968494e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 8), align 16, !dbg !110, !tbaa !100
  store i32 1000000, i32* @niter, align 4, !dbg !111, !tbaa !112
  store i1 true, i1* @current_surfaces, align 1
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !96), !dbg !114
  br label %for.inc13, !dbg !115

for.inc13:                                        ; preds = %for.inc13, %for.cond2.preheader.lr.ph
  %indvar = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvar.next, %for.inc13 ]
  %i.0197 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %inc14, %for.inc13 ]
  %0 = add nuw nsw i64 %indvar, 1, !dbg !117
  %scevgep = getelementptr [10 x [5 x double]]* @s, i64 0, i64 %0, i64 1
  %scevgep211 = bitcast double* %scevgep to i8*
  %scevgep212 = getelementptr [4 x [4 x double]]* @testcase, i64 0, i64 %indvar, i64 0
  %scevgep212213 = bitcast double* %scevgep212 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep211, i8* %scevgep212213, i64 32, i32 8, i1 false), !dbg !121
  %inc14 = add nuw nsw i32 %i.0197, 1, !dbg !122
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !15, metadata !96), !dbg !114
  %cmp = icmp slt i32 %inc14, 4, !dbg !123
  %indvar.next = add nuw nsw i64 %indvar, 1, !dbg !115
  br i1 %cmp, label %for.inc13, label %for.end15, !dbg !115

for.end15:                                        ; preds = %for.inc13
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str, i64 0, i64 0)), !dbg !124
  %1 = load i32* @niter, align 4, !dbg !125, !tbaa !112
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i64 0, i64 0), i32 %1) #4, !dbg !126
  %2 = load i32* @niter, align 4, !dbg !127, !tbaa !112
  %conv17 = sitofp i32 %2 to double, !dbg !127
  %div = fdiv double %conv17, 1.000000e+03, !dbg !127
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i64 0, i64 0), double %div) #4, !dbg !128
  %puts164 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @str29, i64 0, i64 0)), !dbg !129
  %puts165 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8]* @str30, i64 0, i64 0)), !dbg !130
  store i32 0, i32* @itercount, align 4, !dbg !131, !tbaa !112
  %3 = load i32* @niter, align 4, !dbg !134, !tbaa !112
  %cmp22180 = icmp sgt i32 %3, 0, !dbg !135
  br i1 %cmp22180, label %for.cond25.preheader, label %for.end55, !dbg !136

for.cond25.preheader:                             ; preds = %for.end15, %for.end40
  store i16 0, i16* @paraxial, align 2, !dbg !137, !tbaa !141
  br label %for.body29, !dbg !143

for.body29:                                       ; preds = %for.cond25.preheader, %for.body29
  tail call fastcc void @trace_line(i32 4, double 2.000000e+00), !dbg !144
  %4 = load double* @object_distance, align 8, !dbg !146, !tbaa !100
  %5 = load i16* @paraxial, align 2, !dbg !147, !tbaa !141
  %idxprom32 = sext i16 %5 to i64, !dbg !148
  %arrayidx34 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32, i64 0, !dbg !148
  store double %4, double* %arrayidx34, align 16, !dbg !148, !tbaa !100
  %6 = load double* @axis_slope_angle, align 8, !dbg !149, !tbaa !100
  %7 = load i16* @paraxial, align 2, !dbg !150, !tbaa !141
  %idxprom35 = sext i16 %7 to i64, !dbg !151
  %arrayidx37 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom35, i64 1, !dbg !151
  store double %6, double* %arrayidx37, align 8, !dbg !151, !tbaa !100
  %8 = load i16* @paraxial, align 2, !dbg !137, !tbaa !141
  %inc39 = add i16 %8, 1, !dbg !137
  store i16 %inc39, i16* @paraxial, align 2, !dbg !137, !tbaa !141
  %cmp27 = icmp slt i16 %inc39, 2, !dbg !152
  br i1 %cmp27, label %for.body29, label %for.end40, !dbg !143

for.end40:                                        ; preds = %for.body29
  store i16 0, i16* @paraxial, align 2, !dbg !155, !tbaa !141
  tail call fastcc void @trace_line(i32 3, double 2.000000e+00), !dbg !156
  %9 = load double* @object_distance, align 8, !dbg !157, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %9, i64 0, metadata !21, metadata !96), !dbg !158
  tail call fastcc void @trace_line(i32 6, double 2.000000e+00), !dbg !159
  %10 = load double* @object_distance, align 8, !dbg !160, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %10, i64 0, metadata !19, metadata !96), !dbg !161
  %11 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !162, !tbaa !100
  %12 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !163, !tbaa !100
  %13 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !164, !tbaa !100
  %14 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !165, !tbaa !100
  %call45 = tail call double @sin(double %14) #4, !dbg !166
  %15 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !167, !tbaa !100
  %16 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !168, !tbaa !100
  %call50 = tail call double @sin(double %16) #4, !dbg !169
  %17 = load i32* @itercount, align 4, !dbg !131, !tbaa !112
  %inc54 = add nsw i32 %17, 1, !dbg !131
  store i32 %inc54, i32* @itercount, align 4, !dbg !131, !tbaa !112
  %18 = load i32* @niter, align 4, !dbg !134, !tbaa !112
  %cmp22 = icmp slt i32 %inc54, %18, !dbg !135
  br i1 %cmp22, label %for.cond25.preheader, label %for.cond21.for.end55_crit_edge, !dbg !136

for.cond21.for.end55_crit_edge:                   ; preds = %for.end40
  %sub.le = fsub double %11, %12, !dbg !162
  %mul.le = fmul double %11, %13, !dbg !170
  %mul46.le = fmul double %call45, %15, !dbg !166
  %div47.le = fdiv double %mul.le, %mul46.le, !dbg !171
  %sub48.le = fsub double 1.000000e+00, %div47.le, !dbg !172
  %sub49.le = fsub double %10, %9, !dbg !173
  %mul51.le = fmul double %call50, %call50, !dbg !174
  %div52.le = fdiv double 9.260000e-05, %mul51.le, !dbg !175
  br label %for.end55, !dbg !136

for.end55:                                        ; preds = %for.cond21.for.end55_crit_edge, %for.end15
  %.lcssa174 = phi double [ %sub.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.end15 ]
  %.lcssa173 = phi double [ %sub48.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.end15 ]
  %.lcssa172 = phi double [ %sub49.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.end15 ]
  %.lcssa171 = phi double [ %div52.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.end15 ]
  %.lcssa = phi double [ 2.500000e-03, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.end15 ]
  %19 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !176, !tbaa !100
  %20 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !177, !tbaa !100
  %call56 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), double %19, double %20) #4, !dbg !178
  %21 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !179, !tbaa !100
  %22 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !180, !tbaa !100
  %call57 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 1, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), double %21, double %22) #4, !dbg !181
  %call58 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 2, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), double %.lcssa174) #4, !dbg !182
  %call59 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 3, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa171) #4, !dbg !183
  %call60 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 4, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str10, i64 0, i64 0), double %.lcssa173) #4, !dbg !184
  %call61 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 5, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa) #4, !dbg !185
  %call62 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 6, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str11, i64 0, i64 0), double %.lcssa172) #4, !dbg !186
  %call63 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 7, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa171) #4, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !96), !dbg !188
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !96), !dbg !114
  br label %for.body67, !dbg !189

for.body67:                                       ; preds = %for.inc125, %for.end55
  %indvars.iv204 = phi i64 [ 0, %for.end55 ], [ %indvars.iv.next205, %for.inc125 ]
  %errors.0178 = phi i32 [ 0, %for.end55 ], [ %errors.3, %for.inc125 ]
  %arraydecay = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv204, i64 0, !dbg !190
  %arrayidx71 = getelementptr inbounds [8 x i8*]* @refarr, i64 0, i64 %indvars.iv204, !dbg !190
  %23 = load i8** %arrayidx71, align 8, !dbg !190, !tbaa !191
  %call72 = tail call i32 @strcmp(i8* %arraydecay, i8* %23) #4, !dbg !190
  %cmp73 = icmp eq i32 %call72, 0, !dbg !193
  br i1 %cmp73, label %for.inc125, label %if.then, !dbg !194

if.then:                                          ; preds = %for.body67
  %24 = add nuw nsw i64 %indvars.iv204, 1, !dbg !195
  %25 = trunc i64 %24 to i32, !dbg !197
  %call76 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str12, i64 0, i64 0), i32 %25) #4, !dbg !197
  %26 = load i8** %arrayidx71, align 8, !dbg !198, !tbaa !191
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i64 0, i64 0), i8* %26) #4, !dbg !199
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), i8* %arraydecay) #4, !dbg !200
  %call84 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0)) #4, !dbg !201
  %27 = load i8** %arrayidx71, align 8, !dbg !202, !tbaa !191
  %call87 = tail call i64 @strlen(i8* %27) #5, !dbg !203
  %conv88 = trunc i64 %call87 to i32, !dbg !203
  tail call void @llvm.dbg.value(metadata i32 %conv88, i64 0, metadata !17, metadata !96), !dbg !204
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !96), !dbg !205
  %cmp90175 = icmp sgt i32 %conv88, 0, !dbg !206
  br i1 %cmp90175, label %for.body92.lr.ph, label %for.end122, !dbg !209

for.body92.lr.ph:                                 ; preds = %if.then
  %28 = load i8** %arrayidx71, align 8, !dbg !210, !tbaa !191
  %29 = trunc i64 %call87 to i32
  %30 = add i32 %29, -1, !dbg !209
  br label %for.body92, !dbg !209

for.body92:                                       ; preds = %for.body92, %for.body92.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body92.lr.ph ], [ %indvars.iv.next, %for.body92 ]
  %errors.1176 = phi i32 [ %errors.0178, %for.body92.lr.ph ], [ %errors.1.inc119, %for.body92 ]
  %arrayidx96 = getelementptr inbounds i8* %28, i64 %indvars.iv, !dbg !210
  %31 = load i8* %arrayidx96, align 1, !dbg !210, !tbaa !212
  %arrayidx101 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv204, i64 %indvars.iv, !dbg !213
  %32 = load i8* %arrayidx101, align 1, !dbg !213, !tbaa !212
  %cmp103 = icmp eq i8 %31, %32, !dbg !210
  %cond = select i1 %cmp103, i32 32, i32 94, !dbg !210
  %putchar167 = tail call i32 @putchar(i32 %cond) #4, !dbg !214
  %arrayidx109 = getelementptr inbounds i8* %28, i64 %indvars.iv, !dbg !215
  %33 = load i8* %arrayidx109, align 1, !dbg !215, !tbaa !212
  %34 = load i8* %arrayidx101, align 1, !dbg !217, !tbaa !212
  %not.cmp116 = icmp ne i8 %33, %34, !dbg !218
  %inc119 = zext i1 %not.cmp116 to i32, !dbg !218
  %errors.1.inc119 = add nsw i32 %inc119, %errors.1176, !dbg !218
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !209
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !209
  %exitcond = icmp eq i32 %lftr.wideiv, %30, !dbg !209
  br i1 %exitcond, label %for.end122, label %for.body92, !dbg !209

for.end122:                                       ; preds = %for.body92, %if.then
  %errors.1.lcssa = phi i32 [ %errors.0178, %if.then ], [ %errors.1.inc119, %for.body92 ]
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !219
  br label %for.inc125, !dbg !220

for.inc125:                                       ; preds = %for.body67, %for.end122
  %errors.3 = phi i32 [ %errors.1.lcssa, %for.end122 ], [ %errors.0178, %for.body67 ]
  %indvars.iv.next205 = add nuw nsw i64 %indvars.iv204, 1, !dbg !189
  %exitcond207 = icmp eq i64 %indvars.iv.next205, 8, !dbg !189
  br i1 %exitcond207, label %for.end127, label %for.body67, !dbg !189

for.end127:                                       ; preds = %for.inc125
  %cmp128 = icmp sgt i32 %errors.3, 0, !dbg !221
  br i1 %cmp128, label %if.then130, label %if.else, !dbg !223

if.then130:                                       ; preds = %for.end127
  %cmp131 = icmp sgt i32 %errors.3, 1, !dbg !224
  %cond133 = select i1 %cmp131, i8* getelementptr inbounds ([2 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str20, i64 0, i64 0), !dbg !224
  %call134 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str18, i64 0, i64 0), i32 %errors.3, i8* %cond133) #4, !dbg !226
  br label %if.end136, !dbg !227

if.else:                                          ; preds = %for.end127
  %puts166 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str31, i64 0, i64 0)), !dbg !228
  br label %if.end136

if.end136:                                        ; preds = %if.else, %if.then130
  ret i32 0, !dbg !229
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @trace_line(i32 %line, double %ray_h) #0 {
entry:
  store double 0.000000e+00, double* @object_distance, align 8, !dbg !230, !tbaa !100
  store double %ray_h, double* @ray_height, align 8, !dbg !231, !tbaa !100
  store double 1.000000e+00, double* @from_index, align 8, !dbg !232, !tbaa !100
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !96), !dbg !233
  %.b351 = load i1* @current_surfaces, align 1
  br i1 %.b351, label %for.body.lr.ph, label %for.end, !dbg !234

for.body.lr.ph:                                   ; preds = %entry
  %idxprom8 = sext i32 %line to i64, !dbg !236
  %arrayidx9 = getelementptr inbounds [9 x double]* @spectral_line, i64 0, i64 %idxprom8, !dbg !236
  br label %for.body, !dbg !234

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.body.lr.ph ]
  %arrayidx2 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 1, !dbg !240
  %0 = load double* %arrayidx2, align 8, !dbg !240, !tbaa !100
  store double %0, double* @radius_of_curvature, align 8, !dbg !241, !tbaa !100
  %arrayidx5 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 2, !dbg !242
  %1 = load double* %arrayidx5, align 8, !dbg !242, !tbaa !100
  store double %1, double* @to_index, align 8, !dbg !243, !tbaa !100
  %cmp6 = fcmp ogt double %1, 1.000000e+00, !dbg !244
  br i1 %cmp6, label %if.then, label %if.end, !dbg !245

if.then:                                          ; preds = %for.body
  %2 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 4), align 16, !dbg !246, !tbaa !100
  %3 = load double* %arrayidx9, align 8, !dbg !236, !tbaa !100
  %sub = fsub double %2, %3, !dbg !246
  %4 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 3), align 8, !dbg !247, !tbaa !100
  %5 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 6), align 16, !dbg !248, !tbaa !100
  %sub10 = fsub double %4, %5, !dbg !247
  %div = fdiv double %sub, %sub10, !dbg !249
  %6 = load double* %arrayidx5, align 8, !dbg !250, !tbaa !100
  %sub14 = fadd double %6, -1.000000e+00, !dbg !250
  %arrayidx17 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 3, !dbg !251
  %7 = load double* %arrayidx17, align 8, !dbg !251, !tbaa !100
  %div18 = fdiv double %sub14, %7, !dbg !252
  %mul = fmul double %div, %div18, !dbg !253
  %add = fadd double %1, %mul, !dbg !254
  store double %add, double* @to_index, align 8, !dbg !255, !tbaa !100
  br label %if.end, !dbg !255

if.end:                                           ; preds = %if.then, %for.body
  tail call fastcc void @transit_surface(), !dbg !256
  %8 = load double* @to_index, align 8, !dbg !257, !tbaa !100
  store double %8, double* @from_index, align 8, !dbg !258, !tbaa !100
  %.b = load i1* @current_surfaces, align 1
  %9 = select i1 %.b, i64 4, i64 0, !dbg !259
  %cmp20 = icmp slt i64 %indvars.iv, %9, !dbg !259
  br i1 %cmp20, label %if.then22, label %for.inc, !dbg !261

if.then22:                                        ; preds = %if.end
  %10 = load double* @object_distance, align 8, !dbg !262, !tbaa !100
  %arrayidx25 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 4, !dbg !263
  %11 = load double* %arrayidx25, align 8, !dbg !263, !tbaa !100
  %sub26 = fsub double %10, %11, !dbg !262
  store double %sub26, double* @object_distance, align 8, !dbg !264, !tbaa !100
  br label %for.inc, !dbg !264

for.inc:                                          ; preds = %if.end, %if.then22
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !234
  %.b35 = load i1* @current_surfaces, align 1
  %12 = select i1 %.b35, i64 4, i64 0, !dbg !265
  %cmp = icmp slt i64 %indvars.iv, %12, !dbg !265
  br i1 %cmp, label %for.body, label %for.end, !dbg !234

for.end:                                          ; preds = %for.inc, %entry
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
entry:
  %0 = load i16* @paraxial, align 2, !dbg !266, !tbaa !141
  %tobool = icmp eq i16 %0, 0, !dbg !268
  %1 = load double* @radius_of_curvature, align 8, !dbg !269, !tbaa !100
  %cmp = fcmp une double %1, 0.000000e+00, !dbg !269
  br i1 %tobool, label %if.end18, label %if.then, !dbg !268

if.then:                                          ; preds = %entry
  %2 = load double* @object_distance, align 8, !dbg !272, !tbaa !100
  br i1 %cmp, label %if.then1, label %if.end13, !dbg !275

if.then1:                                         ; preds = %if.then
  %cmp2 = fcmp oeq double %2, 0.000000e+00, !dbg !272
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !276

if.then3:                                         ; preds = %if.then1
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !277, !tbaa !100
  %3 = load double* @ray_height, align 8, !dbg !279, !tbaa !100
  %4 = load double* @radius_of_curvature, align 8, !dbg !280, !tbaa !100
  %div = fdiv double %3, %4, !dbg !279
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !45, metadata !96), !dbg !281
  br label %if.end, !dbg !282

if.else:                                          ; preds = %if.then1
  %sub = fsub double %2, %1, !dbg !283
  %div4 = fdiv double %sub, %1, !dbg !284
  %5 = load double* @axis_slope_angle, align 8, !dbg !285, !tbaa !100
  %mul = fmul double %div4, %5, !dbg !286
  tail call void @llvm.dbg.value(metadata double %mul, i64 0, metadata !45, metadata !96), !dbg !281
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %iang_sin.0 = phi double [ %div, %if.then3 ], [ %mul, %if.else ]
  %6 = load double* @from_index, align 8, !dbg !287, !tbaa !100
  %7 = load double* @to_index, align 8, !dbg !288, !tbaa !100
  %div5 = fdiv double %6, %7, !dbg !287
  %mul6 = fmul double %iang_sin.0, %div5, !dbg !289
  tail call void @llvm.dbg.value(metadata double %mul6, i64 0, metadata !46, metadata !96), !dbg !290
  %8 = load double* @axis_slope_angle, align 8, !dbg !291, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %8, i64 0, metadata !47, metadata !96), !dbg !292
  %add = fadd double %iang_sin.0, %8, !dbg !293
  %sub7 = fsub double %add, %mul6, !dbg !293
  store double %sub7, double* @axis_slope_angle, align 8, !dbg !294, !tbaa !100
  %9 = load double* @object_distance, align 8, !dbg !295, !tbaa !100
  %cmp8 = fcmp une double %9, 0.000000e+00, !dbg !295
  br i1 %cmp8, label %if.then9, label %if.end11, !dbg !297

if.then9:                                         ; preds = %if.end
  %mul10 = fmul double %8, %9, !dbg !298
  store double %mul10, double* @ray_height, align 8, !dbg !299, !tbaa !100
  br label %if.end11, !dbg !299

if.end11:                                         ; preds = %if.then9, %if.end
  %10 = load double* @ray_height, align 8, !dbg !300, !tbaa !100
  %11 = load double* @axis_slope_angle, align 8, !dbg !301, !tbaa !100
  %div12 = fdiv double %10, %11, !dbg !300
  store double %div12, double* @object_distance, align 8, !dbg !302, !tbaa !100
  br label %return, !dbg !303

if.end13:                                         ; preds = %if.then
  %12 = load double* @to_index, align 8, !dbg !304, !tbaa !100
  %13 = load double* @from_index, align 8, !dbg !305, !tbaa !100
  %div14 = fdiv double %12, %13, !dbg !304
  %mul15 = fmul double %2, %div14, !dbg !306
  store double %mul15, double* @object_distance, align 8, !dbg !307, !tbaa !100
  %14 = load double* @axis_slope_angle, align 8, !dbg !308, !tbaa !100
  %div16 = fdiv double %13, %12, !dbg !309
  %mul17 = fmul double %14, %div16, !dbg !308
  store double %mul17, double* @axis_slope_angle, align 8, !dbg !310, !tbaa !100
  br label %return, !dbg !311

if.end18:                                         ; preds = %entry
  br i1 %cmp, label %if.then20, label %if.end48, !dbg !312

if.then20:                                        ; preds = %if.end18
  %15 = load double* @object_distance, align 8, !dbg !313, !tbaa !100
  %cmp21 = fcmp oeq double %15, 0.000000e+00, !dbg !313
  br i1 %cmp21, label %if.then22, label %if.else24, !dbg !317

if.then22:                                        ; preds = %if.then20
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !318, !tbaa !100
  %16 = load double* @ray_height, align 8, !dbg !320, !tbaa !100
  %17 = load double* @radius_of_curvature, align 8, !dbg !321, !tbaa !100
  %div23 = fdiv double %16, %17, !dbg !320
  tail call void @llvm.dbg.value(metadata double %div23, i64 0, metadata !45, metadata !96), !dbg !281
  br label %if.end28, !dbg !322

if.else24:                                        ; preds = %if.then20
  %sub25 = fsub double %15, %1, !dbg !323
  %div26 = fdiv double %sub25, %1, !dbg !325
  %18 = load double* @axis_slope_angle, align 8, !dbg !326, !tbaa !100
  %call = tail call double @sin(double %18) #4, !dbg !327
  %mul27 = fmul double %div26, %call, !dbg !328
  tail call void @llvm.dbg.value(metadata double %mul27, i64 0, metadata !45, metadata !96), !dbg !281
  br label %if.end28

if.end28:                                         ; preds = %if.else24, %if.then22
  %iang_sin.1 = phi double [ %div23, %if.then22 ], [ %mul27, %if.else24 ]
  %call29 = tail call double @asin(double %iang_sin.1) #4, !dbg !329
  tail call void @llvm.dbg.value(metadata double %call29, i64 0, metadata !43, metadata !96), !dbg !330
  %19 = load double* @from_index, align 8, !dbg !331, !tbaa !100
  %20 = load double* @to_index, align 8, !dbg !332, !tbaa !100
  %div30 = fdiv double %19, %20, !dbg !331
  %mul31 = fmul double %iang_sin.1, %div30, !dbg !333
  tail call void @llvm.dbg.value(metadata double %mul31, i64 0, metadata !46, metadata !96), !dbg !290
  %21 = load double* @axis_slope_angle, align 8, !dbg !334, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %21, i64 0, metadata !47, metadata !96), !dbg !292
  %add32 = fadd double %call29, %21, !dbg !335
  %call33 = tail call double @asin(double %mul31) #4, !dbg !336
  %sub34 = fsub double %add32, %call33, !dbg !335
  store double %sub34, double* @axis_slope_angle, align 8, !dbg !337, !tbaa !100
  %div36 = fmul double %add32, 5.000000e-01, !dbg !338
  %call37 = tail call double @sin(double %div36) #4, !dbg !339
  tail call void @llvm.dbg.value(metadata double %call37, i64 0, metadata !48, metadata !96), !dbg !340
  %22 = load double* @radius_of_curvature, align 8, !dbg !341, !tbaa !100
  %mul38 = fmul double %22, 2.000000e+00, !dbg !342
  %mul39 = fmul double %call37, %mul38, !dbg !342
  %mul40 = fmul double %call37, %mul39, !dbg !342
  tail call void @llvm.dbg.value(metadata double %mul40, i64 0, metadata !48, metadata !96), !dbg !340
  %call42 = tail call double @sin(double %add32) #4, !dbg !343
  %mul43 = fmul double %22, %call42, !dbg !344
  %23 = load double* @axis_slope_angle, align 8, !dbg !345, !tbaa !100
  %call44 = tail call double @tan(double %23) #4, !dbg !345
  %div45 = fdiv double 1.000000e+00, %call44, !dbg !345
  %mul46 = fmul double %mul43, %div45, !dbg !346
  %add47 = fadd double %mul40, %mul46, !dbg !347
  store double %add47, double* @object_distance, align 8, !dbg !348, !tbaa !100
  br label %return, !dbg !349

if.end48:                                         ; preds = %if.end18
  %24 = load double* @from_index, align 8, !dbg !350, !tbaa !100
  %25 = load double* @to_index, align 8, !dbg !351, !tbaa !100
  %div49 = fdiv double %24, %25, !dbg !350
  %26 = load double* @axis_slope_angle, align 8, !dbg !352, !tbaa !100
  %call50 = tail call double @sin(double %26) #4, !dbg !353
  %mul51 = fmul double %div49, %call50, !dbg !354
  %call52 = tail call double @asin(double %mul51) #4, !dbg !355
  %27 = load double* @object_distance, align 8, !dbg !356, !tbaa !100
  %28 = load double* @to_index, align 8, !dbg !357, !tbaa !100
  %call55 = tail call double @cos(double %call52) #4, !dbg !358
  %mul56 = fmul double %28, %call55, !dbg !357
  %29 = load double* @from_index, align 8, !dbg !359, !tbaa !100
  %30 = load double* @axis_slope_angle, align 8, !dbg !360, !tbaa !100
  %call57 = tail call double @cos(double %30) #4, !dbg !361
  %mul58 = fmul double %29, %call57, !dbg !359
  %div59 = fdiv double %mul56, %mul58, !dbg !362
  %mul60 = fmul double %27, %div59, !dbg !356
  store double %mul60, double* @object_distance, align 8, !dbg !363, !tbaa !100
  store double %call52, double* @axis_slope_angle, align 8, !dbg !364, !tbaa !100
  br label %return, !dbg !365

return:                                           ; preds = %if.end48, %if.end28, %if.end13, %if.end11
  ret void, !dbg !366
}

; Function Attrs: nounwind
declare double @asin(double) #1

; Function Attrs: nounwind
declare double @tan(double) #1

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

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
!llvm.module.flags = !{!93, !94}
!llvm.ident = !{!95}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !49, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c] [DW_LANG_C99]
!1 = !{!"fbench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !32, !39}
!4 = !{!"0x2e\00main\00main\00\00679\000\001\000\000\000\001\00682", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !12} ; [ DW_TAG_subprogram ] [line 679] [def] [scope 682] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!13, !14, !15, !16, !17, !18, !19, !21, !22, !31}
!13 = !{!"0x101\00argc\0016777896\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 680]
!14 = !{!"0x101\00argv\0033555113\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 681]
!15 = !{!"0x100\00i\00683\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 683]
!16 = !{!"0x100\00j\00683\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [j] [line 683]
!17 = !{!"0x100\00k\00683\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [k] [line 683]
!18 = !{!"0x100\00errors\00683\000", !4, !5, !8}  ; [ DW_TAG_auto_variable ] [errors] [line 683]
!19 = !{!"0x100\00od_fline\00684\000", !4, !5, !20} ; [ DW_TAG_auto_variable ] [od_fline] [line 684]
!20 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!21 = !{!"0x100\00od_cline\00684\000", !4, !5, !20} ; [ DW_TAG_auto_variable ] [od_cline] [line 684]
!22 = !{!"0x100\00__s1_len\00800\000", !23, !5, !28} ; [ DW_TAG_auto_variable ] [__s1_len] [line 800]
!23 = !{!"0xb\00800\009\0014", !1, !24}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!24 = !{!"0xb\00800\009\0013", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!25 = !{!"0xb\00799\0026\0012", !1, !26}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!26 = !{!"0xb\00799\002\0011", !1, !27}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!27 = !{!"0xb\00799\002\0010", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!28 = !{!"0x16\00size_t\0062\000\000\000\000", !29, null, !30} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!29 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!30 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!31 = !{!"0x100\00__s2_len\00800\000", !23, !5, !28} ; [ DW_TAG_auto_variable ] [__s2_len] [line 800]
!32 = !{!"0x2e\00trace_line\00trace_line\00\00651\001\001\000\000\000\001\00654", !1, !5, !33, null, void (i32, double)* @trace_line, null, null, !35} ; [ DW_TAG_subprogram ] [line 651] [local] [def] [scope 654] [trace_line]
!33 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !34, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = !{!8, !8, !20}
!35 = !{!36, !37, !38}
!36 = !{!"0x101\00line\0016777868\000", !32, !5, !8} ; [ DW_TAG_arg_variable ] [line] [line 652]
!37 = !{!"0x101\00ray_h\0033555085\000", !32, !5, !20} ; [ DW_TAG_arg_variable ] [ray_h] [line 653]
!38 = !{!"0x100\00i\00655\000", !32, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 655]
!39 = !{!"0x2e\00transit_surface\00transit_surface\00\00586\001\001\000\000\000\001\00586", !1, !5, !40, null, void ()* @transit_surface, null, null, !42} ; [ DW_TAG_subprogram ] [line 586] [local] [def] [transit_surface]
!40 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !41, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = !{null}
!42 = !{!43, !44, !45, !46, !47, !48}
!43 = !{!"0x100\00iang\00587\000", !39, !5, !20}  ; [ DW_TAG_auto_variable ] [iang] [line 587]
!44 = !{!"0x100\00rang\00588\000", !39, !5, !20}  ; [ DW_TAG_auto_variable ] [rang] [line 588]
!45 = !{!"0x100\00iang_sin\00589\000", !39, !5, !20} ; [ DW_TAG_auto_variable ] [iang_sin] [line 589]
!46 = !{!"0x100\00rang_sin\00590\000", !39, !5, !20} ; [ DW_TAG_auto_variable ] [rang_sin] [line 590]
!47 = !{!"0x100\00old_axis_slope_angle\00591\000", !39, !5, !20} ; [ DW_TAG_auto_variable ] [old_axis_slope_angle] [line 591]
!48 = !{!"0x100\00sagitta\00591\000", !39, !5, !20} ; [ DW_TAG_auto_variable ] [sagitta] [line 591]
!49 = !{!50, !51, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !67, !72, !76, !81, !82, !85, !86, !87, !88, !89}
!50 = !{!"0x34\00niter\00niter\00\00283\000\001", null, !5, !8, i32* @niter, null} ; [ DW_TAG_variable ] [niter] [line 283] [def]
!51 = !{!"0x34\00current_surfaces\00current_surfaces\00\00248\001\001", null, !5, !52, null, null} ; [ DW_TAG_variable ] [current_surfaces] [line 248] [local] [def]
!52 = !{!"0x24\00short\000\0016\0016\000\000\005", null, null} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!53 = !{!"0x34\00paraxial\00paraxial\00\00249\001\001", null, !5, !52, i16* @paraxial, null} ; [ DW_TAG_variable ] [paraxial] [line 249] [local] [def]
!54 = !{!"0x34\00clear_aperture\00clear_aperture\00\00251\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [clear_aperture] [line 251] [local] [def]
!55 = !{!"0x34\00aberr_lspher\00aberr_lspher\00\00253\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [aberr_lspher] [line 253] [local] [def]
!56 = !{!"0x34\00aberr_osc\00aberr_osc\00\00254\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [aberr_osc] [line 254] [local] [def]
!57 = !{!"0x34\00aberr_lchrom\00aberr_lchrom\00\00255\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [aberr_lchrom] [line 255] [local] [def]
!58 = !{!"0x34\00max_lspher\00max_lspher\00\00257\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [max_lspher] [line 257] [local] [def]
!59 = !{!"0x34\00max_osc\00max_osc\00\00258\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [max_osc] [line 258] [local] [def]
!60 = !{!"0x34\00max_lchrom\00max_lchrom\00\00259\001\001", null, !5, !20, null, null} ; [ DW_TAG_variable ] [max_lchrom] [line 259] [local] [def]
!61 = !{!"0x34\00object_distance\00object_distance\00\00262\001\001", null, !5, !20, double* @object_distance, null} ; [ DW_TAG_variable ] [object_distance] [line 262] [local] [def]
!62 = !{!"0x34\00axis_slope_angle\00axis_slope_angle\00\00264\001\001", null, !5, !20, double* @axis_slope_angle, null} ; [ DW_TAG_variable ] [axis_slope_angle] [line 264] [local] [def]
!63 = !{!"0x34\00spectral_line\00spectral_line\00\00268\001\001", null, !5, !64, [9 x double]* @spectral_line, null} ; [ DW_TAG_variable ] [spectral_line] [line 268] [local] [def]
!64 = !{!"0x1\00\000\00576\0064\000\000\000", null, null, !20, !65, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 576, align 64, offset 0] [from double]
!65 = !{!66}
!66 = !{!"0x21\000\009"}                          ; [ DW_TAG_subrange_type ] [0, 8]
!67 = !{!"0x34\00s\00s\00\00269\001\001", null, !5, !68, [10 x [5 x double]]* @s, null} ; [ DW_TAG_variable ] [s] [line 269] [local] [def]
!68 = !{!"0x1\00\000\003200\0064\000\000\000", null, null, !20, !69, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 64, offset 0] [from double]
!69 = !{!70, !71}
!70 = !{!"0x21\000\0010"}                         ; [ DW_TAG_subrange_type ] [0, 9]
!71 = !{!"0x21\000\005"}                          ; [ DW_TAG_subrange_type ] [0, 4]
!72 = !{!"0x34\00od_sa\00od_sa\00\00270\001\001", null, !5, !73, [2 x [2 x double]]* @od_sa, null} ; [ DW_TAG_variable ] [od_sa] [line 270] [local] [def]
!73 = !{!"0x1\00\000\00256\0064\000\000\000", null, null, !20, !74, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from double]
!74 = !{!75, !75}
!75 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!76 = !{!"0x34\00outarr\00outarr\00\00272\001\001", null, !5, !77, [8 x [80 x i8]]* @outarr, null} ; [ DW_TAG_variable ] [outarr] [line 272] [local] [def]
!77 = !{!"0x1\00\000\005120\008\000\000\000", null, null, !11, !78, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5120, align 8, offset 0] [from char]
!78 = !{!79, !80}
!79 = !{!"0x21\000\008"}                          ; [ DW_TAG_subrange_type ] [0, 7]
!80 = !{!"0x21\000\0080"}                         ; [ DW_TAG_subrange_type ] [0, 79]
!81 = !{!"0x34\00itercount\00itercount\00\00274\000\001", null, !5, !8, i32* @itercount, null} ; [ DW_TAG_variable ] [itercount] [line 274] [def]
!82 = !{!"0x34\00refarr\00refarr\00\00285\001\001", null, !5, !83, [8 x i8*]* @refarr, null} ; [ DW_TAG_variable ] [refarr] [line 285] [local] [def]
!83 = !{!"0x1\00\000\00512\0064\000\000\000", null, null, !10, !84, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!84 = !{!79}
!85 = !{!"0x34\00to_index\00to_index\00\00266\001\001", null, !5, !20, double* @to_index, null} ; [ DW_TAG_variable ] [to_index] [line 266] [local] [def]
!86 = !{!"0x34\00radius_of_curvature\00radius_of_curvature\00\00261\001\001", null, !5, !20, double* @radius_of_curvature, null} ; [ DW_TAG_variable ] [radius_of_curvature] [line 261] [local] [def]
!87 = !{!"0x34\00from_index\00from_index\00\00265\001\001", null, !5, !20, double* @from_index, null} ; [ DW_TAG_variable ] [from_index] [line 265] [local] [def]
!88 = !{!"0x34\00ray_height\00ray_height\00\00263\001\001", null, !5, !20, double* @ray_height, null} ; [ DW_TAG_variable ] [ray_height] [line 263] [local] [def]
!89 = !{!"0x34\00testcase\00testcase\00\00304\001\001", null, !5, !90, [4 x [4 x double]]* @testcase, null} ; [ DW_TAG_variable ] [testcase] [line 304] [local] [def]
!90 = !{!"0x1\00\000\001024\0064\000\000\000", null, null, !20, !91, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from double]
!91 = !{!92, !92}
!92 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!93 = !{i32 2, !"Dwarf Version", i32 4}
!94 = !{i32 2, !"Debug Info Version", i32 2}
!95 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!96 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!97 = !MDLocation(line: 680, column: 5, scope: !4)
!98 = !MDLocation(line: 681, column: 7, scope: !4)
!99 = !MDLocation(line: 689, column: 2, scope: !4)
!100 = !{!101, !101, i64 0}
!101 = !{!"double", !102, i64 0}
!102 = !{!"omnipotent char", !103, i64 0}
!103 = !{!"Simple C/C++ TBAA"}
!104 = !MDLocation(line: 690, column: 2, scope: !4)
!105 = !MDLocation(line: 691, column: 2, scope: !4)
!106 = !MDLocation(line: 692, column: 2, scope: !4)
!107 = !MDLocation(line: 693, column: 2, scope: !4)
!108 = !MDLocation(line: 694, column: 2, scope: !4)
!109 = !MDLocation(line: 695, column: 9, scope: !4)
!110 = !MDLocation(line: 696, column: 2, scope: !4)
!111 = !MDLocation(line: 700, column: 3, scope: !4)
!112 = !{!113, !113, i64 0}
!113 = !{!"int", !102, i64 0}
!114 = !MDLocation(line: 683, column: 6, scope: !4)
!115 = !MDLocation(line: 706, column: 2, scope: !116)
!116 = !{!"0xb\00706\002\000", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!117 = !MDLocation(line: 708, column: 26, scope: !118)
!118 = !{!"0xb\00707\005\003", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!119 = !{!"0xb\00707\005\002", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!120 = !{!"0xb\00706\002\001", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!121 = !MDLocation(line: 708, column: 8, scope: !118)
!122 = !MDLocation(line: 706, column: 36, scope: !120)
!123 = !MDLocation(line: 706, column: 14, scope: !120)
!124 = !MDLocation(line: 714, column: 9, scope: !4)
!125 = !MDLocation(line: 716, column: 5, scope: !4)
!126 = !MDLocation(line: 715, column: 9, scope: !4)
!127 = !MDLocation(line: 718, column: 77, scope: !4)
!128 = !MDLocation(line: 718, column: 9, scope: !4)
!129 = !MDLocation(line: 719, column: 9, scope: !4)
!130 = !MDLocation(line: 720, column: 9, scope: !4)
!131 = !MDLocation(line: 732, column: 41, scope: !132)
!132 = !{!"0xb\00732\002\005", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!133 = !{!"0xb\00732\002\004", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!134 = !MDLocation(line: 732, column: 34, scope: !132)
!135 = !MDLocation(line: 732, column: 22, scope: !132)
!136 = !MDLocation(line: 732, column: 2, scope: !133)
!137 = !MDLocation(line: 735, column: 39, scope: !138)
!138 = !{!"0xb\00735\005\008", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!139 = !{!"0xb\00735\005\007", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!140 = !{!"0xb\00732\0054\006", !1, !132}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!141 = !{!142, !142, i64 0}
!142 = !{!"short", !102, i64 0}
!143 = !MDLocation(line: 735, column: 5, scope: !139)
!144 = !MDLocation(line: 739, column: 8, scope: !145)
!145 = !{!"0xb\00735\0051\009", !1, !138}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!146 = !MDLocation(line: 740, column: 29, scope: !145)
!147 = !MDLocation(line: 740, column: 14, scope: !145)
!148 = !MDLocation(line: 740, column: 8, scope: !145)
!149 = !MDLocation(line: 741, column: 29, scope: !145)
!150 = !MDLocation(line: 741, column: 14, scope: !145)
!151 = !MDLocation(line: 741, column: 8, scope: !145)
!152 = !MDLocation(line: 735, column: 24, scope: !153)
!153 = !{!"0xb\002", !1, !154}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!154 = !{!"0xb\001", !1, !138}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!155 = !MDLocation(line: 743, column: 5, scope: !140)
!156 = !MDLocation(line: 747, column: 5, scope: !140)
!157 = !MDLocation(line: 748, column: 16, scope: !140)
!158 = !MDLocation(line: 684, column: 19, scope: !4)
!159 = !MDLocation(line: 752, column: 5, scope: !140)
!160 = !MDLocation(line: 753, column: 16, scope: !140)
!161 = !MDLocation(line: 684, column: 9, scope: !4)
!162 = !MDLocation(line: 755, column: 20, scope: !140)
!163 = !MDLocation(line: 755, column: 34, scope: !140)
!164 = !MDLocation(line: 756, column: 38, scope: !140)
!165 = !MDLocation(line: 757, column: 13, scope: !140)
!166 = !MDLocation(line: 757, column: 9, scope: !140)
!167 = !MDLocation(line: 757, column: 28, scope: !140)
!168 = !MDLocation(line: 759, column: 22, scope: !140)
!169 = !MDLocation(line: 759, column: 18, scope: !140)
!170 = !MDLocation(line: 756, column: 24, scope: !140)
!171 = !MDLocation(line: 756, column: 23, scope: !140)
!172 = !MDLocation(line: 756, column: 17, scope: !140)
!173 = !MDLocation(line: 758, column: 20, scope: !140)
!174 = !MDLocation(line: 763, column: 31, scope: !140)
!175 = !MDLocation(line: 763, column: 18, scope: !140)
!176 = !MDLocation(line: 773, column: 28, scope: !4)
!177 = !MDLocation(line: 773, column: 41, scope: !4)
!178 = !MDLocation(line: 772, column: 9, scope: !4)
!179 = !MDLocation(line: 775, column: 28, scope: !4)
!180 = !MDLocation(line: 775, column: 41, scope: !4)
!181 = !MDLocation(line: 774, column: 9, scope: !4)
!182 = !MDLocation(line: 776, column: 2, scope: !4)
!183 = !MDLocation(line: 779, column: 2, scope: !4)
!184 = !MDLocation(line: 782, column: 2, scope: !4)
!185 = !MDLocation(line: 785, column: 2, scope: !4)
!186 = !MDLocation(line: 788, column: 2, scope: !4)
!187 = !MDLocation(line: 791, column: 2, scope: !4)
!188 = !MDLocation(line: 683, column: 15, scope: !4)
!189 = !MDLocation(line: 799, column: 2, scope: !27)
!190 = !MDLocation(line: 800, column: 9, scope: !23)
!191 = !{!192, !192, i64 0}
!192 = !{!"any pointer", !102, i64 0}
!193 = !MDLocation(line: 800, column: 9, scope: !24)
!194 = !MDLocation(line: 800, column: 9, scope: !25)
!195 = !MDLocation(line: 805, column: 60, scope: !196)
!196 = !{!"0xb\00800\0044\0015", !1, !24}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!197 = !MDLocation(line: 805, column: 15, scope: !196)
!198 = !MDLocation(line: 807, column: 45, scope: !196)
!199 = !MDLocation(line: 807, column: 15, scope: !196)
!200 = !MDLocation(line: 808, column: 15, scope: !196)
!201 = !MDLocation(line: 809, column: 15, scope: !196)
!202 = !MDLocation(line: 810, column: 19, scope: !196)
!203 = !MDLocation(line: 810, column: 12, scope: !196)
!204 = !MDLocation(line: 683, column: 12, scope: !4)
!205 = !MDLocation(line: 683, column: 9, scope: !4)
!206 = !MDLocation(line: 811, column: 20, scope: !207)
!207 = !{!"0xb\00811\008\0017", !1, !208}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!208 = !{!"0xb\00811\008\0016", !1, !196}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!209 = !MDLocation(line: 811, column: 8, scope: !208)
!210 = !MDLocation(line: 812, column: 31, scope: !211)
!211 = !{!"0xb\00811\0032\0018", !1, !207}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!212 = !{!102, !102, i64 0}
!213 = !MDLocation(line: 812, column: 47, scope: !211)
!214 = !MDLocation(line: 812, column: 18, scope: !211)
!215 = !MDLocation(line: 813, column: 8, scope: !216)
!216 = !{!"0xb\00813\008\0019", !1, !211}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!217 = !MDLocation(line: 813, column: 24, scope: !216)
!218 = !MDLocation(line: 813, column: 8, scope: !211)
!219 = !MDLocation(line: 816, column: 15, scope: !196)
!220 = !MDLocation(line: 817, column: 5, scope: !196)
!221 = !MDLocation(line: 822, column: 6, scope: !222)
!222 = !{!"0xb\00822\006\0020", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!223 = !MDLocation(line: 822, column: 6, scope: !4)
!224 = !MDLocation(line: 824, column: 23, scope: !225)
!225 = !{!"0xb\00822\0018\0021", !1, !222}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!226 = !MDLocation(line: 823, column: 12, scope: !225)
!227 = !MDLocation(line: 825, column: 2, scope: !225)
!228 = !MDLocation(line: 826, column: 12, scope: !222)
!229 = !MDLocation(line: 828, column: 2, scope: !4)
!230 = !MDLocation(line: 657, column: 2, scope: !32)
!231 = !MDLocation(line: 658, column: 2, scope: !32)
!232 = !MDLocation(line: 659, column: 2, scope: !32)
!233 = !MDLocation(line: 655, column: 6, scope: !32)
!234 = !MDLocation(line: 661, column: 2, scope: !235)
!235 = !{!"0xb\00661\002\0022", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!236 = !MDLocation(line: 666, column: 4, scope: !237)
!237 = !{!"0xb\00664\009\0025", !1, !238}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!238 = !{!"0xb\00661\0042\0024", !1, !239}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!239 = !{!"0xb\00661\002\0023", !1, !235}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!240 = !MDLocation(line: 662, column: 27, scope: !238)
!241 = !MDLocation(line: 662, column: 5, scope: !238)
!242 = !MDLocation(line: 663, column: 16, scope: !238)
!243 = !MDLocation(line: 663, column: 5, scope: !238)
!244 = !MDLocation(line: 664, column: 9, scope: !237)
!245 = !MDLocation(line: 664, column: 9, scope: !238)
!246 = !MDLocation(line: 665, column: 32, scope: !237)
!247 = !MDLocation(line: 667, column: 5, scope: !237)
!248 = !MDLocation(line: 667, column: 24, scope: !237)
!249 = !MDLocation(line: 665, column: 31, scope: !237)
!250 = !MDLocation(line: 667, column: 47, scope: !237)
!251 = !MDLocation(line: 668, column: 4, scope: !237)
!252 = !MDLocation(line: 667, column: 46, scope: !237)
!253 = !MDLocation(line: 665, column: 30, scope: !237)
!254 = !MDLocation(line: 665, column: 19, scope: !237)
!255 = !MDLocation(line: 665, column: 8, scope: !237)
!256 = !MDLocation(line: 669, column: 5, scope: !238)
!257 = !MDLocation(line: 670, column: 18, scope: !238)
!258 = !MDLocation(line: 670, column: 5, scope: !238)
!259 = !MDLocation(line: 671, column: 9, scope: !260)
!260 = !{!"0xb\00671\009\0026", !1, !238}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!261 = !MDLocation(line: 671, column: 9, scope: !238)
!262 = !MDLocation(line: 672, column: 26, scope: !260)
!263 = !MDLocation(line: 672, column: 44, scope: !260)
!264 = !MDLocation(line: 672, column: 8, scope: !260)
!265 = !MDLocation(line: 661, column: 14, scope: !239)
!266 = !MDLocation(line: 593, column: 6, scope: !267)
!267 = !{!"0xb\00593\006\0027", !1, !39}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!268 = !MDLocation(line: 593, column: 6, scope: !39)
!269 = !MDLocation(line: 594, column: 9, scope: !270)
!270 = !{!"0xb\00594\009\0029", !1, !271}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!271 = !{!"0xb\00593\0016\0028", !1, !267}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!272 = !MDLocation(line: 595, column: 12, scope: !273)
!273 = !{!"0xb\00595\0012\0031", !1, !274}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!274 = !{!"0xb\00594\0037\0030", !1, !270}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!275 = !MDLocation(line: 594, column: 9, scope: !271)
!276 = !MDLocation(line: 595, column: 12, scope: !274)
!277 = !MDLocation(line: 596, column: 4, scope: !278)
!278 = !{!"0xb\00595\0036\0032", !1, !273}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!279 = !MDLocation(line: 597, column: 15, scope: !278)
!280 = !MDLocation(line: 597, column: 28, scope: !278)
!281 = !MDLocation(line: 589, column: 9, scope: !39)
!282 = !MDLocation(line: 598, column: 8, scope: !278)
!283 = !MDLocation(line: 599, column: 17, scope: !273)
!284 = !MDLocation(line: 599, column: 16, scope: !273)
!285 = !MDLocation(line: 601, column: 7, scope: !273)
!286 = !MDLocation(line: 599, column: 15, scope: !273)
!287 = !MDLocation(line: 603, column: 20, scope: !274)
!288 = !MDLocation(line: 603, column: 33, scope: !274)
!289 = !MDLocation(line: 603, column: 19, scope: !274)
!290 = !MDLocation(line: 590, column: 9, scope: !39)
!291 = !MDLocation(line: 605, column: 31, scope: !274)
!292 = !MDLocation(line: 591, column: 9, scope: !39)
!293 = !MDLocation(line: 606, column: 27, scope: !274)
!294 = !MDLocation(line: 606, column: 8, scope: !274)
!295 = !MDLocation(line: 608, column: 12, scope: !296)
!296 = !{!"0xb\00608\0012\0033", !1, !274}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!297 = !MDLocation(line: 608, column: 12, scope: !274)
!298 = !MDLocation(line: 609, column: 17, scope: !296)
!299 = !MDLocation(line: 609, column: 4, scope: !296)
!300 = !MDLocation(line: 610, column: 26, scope: !274)
!301 = !MDLocation(line: 610, column: 39, scope: !274)
!302 = !MDLocation(line: 610, column: 8, scope: !274)
!303 = !MDLocation(line: 611, column: 8, scope: !274)
!304 = !MDLocation(line: 613, column: 42, scope: !271)
!305 = !MDLocation(line: 613, column: 53, scope: !271)
!306 = !MDLocation(line: 613, column: 23, scope: !271)
!307 = !MDLocation(line: 613, column: 5, scope: !271)
!308 = !MDLocation(line: 614, column: 24, scope: !271)
!309 = !MDLocation(line: 614, column: 44, scope: !271)
!310 = !MDLocation(line: 614, column: 5, scope: !271)
!311 = !MDLocation(line: 615, column: 5, scope: !271)
!312 = !MDLocation(line: 618, column: 6, scope: !39)
!313 = !MDLocation(line: 619, column: 9, scope: !314)
!314 = !{!"0xb\00619\009\0036", !1, !315}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!315 = !{!"0xb\00618\0034\0035", !1, !316}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!316 = !{!"0xb\00618\006\0034", !1, !39}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!317 = !MDLocation(line: 619, column: 9, scope: !315)
!318 = !MDLocation(line: 620, column: 8, scope: !319)
!319 = !{!"0xb\00619\0033\0037", !1, !314}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!320 = !MDLocation(line: 621, column: 19, scope: !319)
!321 = !MDLocation(line: 621, column: 32, scope: !319)
!322 = !MDLocation(line: 622, column: 5, scope: !319)
!323 = !MDLocation(line: 623, column: 21, scope: !324)
!324 = !{!"0xb\00622\0012\0038", !1, !314}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!325 = !MDLocation(line: 623, column: 20, scope: !324)
!326 = !MDLocation(line: 625, column: 8, scope: !324)
!327 = !MDLocation(line: 625, column: 4, scope: !324)
!328 = !MDLocation(line: 623, column: 19, scope: !324)
!329 = !MDLocation(line: 627, column: 12, scope: !315)
!330 = !MDLocation(line: 587, column: 9, scope: !39)
!331 = !MDLocation(line: 628, column: 17, scope: !315)
!332 = !MDLocation(line: 628, column: 30, scope: !315)
!333 = !MDLocation(line: 628, column: 16, scope: !315)
!334 = !MDLocation(line: 630, column: 28, scope: !315)
!335 = !MDLocation(line: 631, column: 24, scope: !315)
!336 = !MDLocation(line: 632, column: 15, scope: !315)
!337 = !MDLocation(line: 631, column: 5, scope: !315)
!338 = !MDLocation(line: 633, column: 19, scope: !315)
!339 = !MDLocation(line: 633, column: 15, scope: !315)
!340 = !MDLocation(line: 591, column: 31, scope: !39)
!341 = !MDLocation(line: 634, column: 21, scope: !315)
!342 = !MDLocation(line: 634, column: 15, scope: !315)
!343 = !MDLocation(line: 635, column: 47, scope: !315)
!344 = !MDLocation(line: 635, column: 25, scope: !315)
!345 = !MDLocation(line: 637, column: 8, scope: !315)
!346 = !MDLocation(line: 635, column: 24, scope: !315)
!347 = !MDLocation(line: 635, column: 23, scope: !315)
!348 = !MDLocation(line: 635, column: 5, scope: !315)
!349 = !MDLocation(line: 638, column: 5, scope: !315)
!350 = !MDLocation(line: 641, column: 16, scope: !39)
!351 = !MDLocation(line: 641, column: 29, scope: !39)
!352 = !MDLocation(line: 642, column: 9, scope: !39)
!353 = !MDLocation(line: 642, column: 5, scope: !39)
!354 = !MDLocation(line: 641, column: 15, scope: !39)
!355 = !MDLocation(line: 641, column: 10, scope: !39)
!356 = !MDLocation(line: 643, column: 20, scope: !39)
!357 = !MDLocation(line: 643, column: 40, scope: !39)
!358 = !MDLocation(line: 644, column: 5, scope: !39)
!359 = !MDLocation(line: 644, column: 20, scope: !39)
!360 = !MDLocation(line: 645, column: 9, scope: !39)
!361 = !MDLocation(line: 645, column: 5, scope: !39)
!362 = !MDLocation(line: 643, column: 39, scope: !39)
!363 = !MDLocation(line: 643, column: 2, scope: !39)
!364 = !MDLocation(line: 646, column: 2, scope: !39)
!365 = !MDLocation(line: 647, column: 1, scope: !39)
!366 = !MDLocation(line: 647, column: 1, scope: !367)
!367 = !{!"0xb\001", !1, !39}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
