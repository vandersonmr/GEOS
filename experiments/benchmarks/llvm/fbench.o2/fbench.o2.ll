; ModuleID = 'fbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
  br label %for.cond2.preheader, !dbg !115

for.cond2.preheader:                              ; preds = %for.cond2.preheader.lr.ph
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([10 x [5 x double]]* @s, i64 0, i64 1, i64 1) to i8*), i8* bitcast ([4 x [4 x double]]* @testcase to i8*), i64 32, i32 8, i1 false), !dbg !117
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !15, metadata !96), !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([10 x [5 x double]]* @s, i64 0, i64 2, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([4 x [4 x double]]* @testcase, i64 0, i64 1, i64 0) to i8*), i64 32, i32 8, i1 false), !dbg !117
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !15, metadata !96), !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([10 x [5 x double]]* @s, i64 0, i64 3, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([4 x [4 x double]]* @testcase, i64 0, i64 2, i64 0) to i8*), i64 32, i32 8, i1 false), !dbg !117
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !15, metadata !96), !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([10 x [5 x double]]* @s, i64 0, i64 4, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([4 x [4 x double]]* @testcase, i64 0, i64 3, i64 0) to i8*), i64 32, i32 8, i1 false), !dbg !117
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !15, metadata !96), !dbg !114
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str, i64 0, i64 0)), !dbg !121
  %0 = load i32* @niter, align 4, !dbg !122, !tbaa !112
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i64 0, i64 0), i32 %0) #4, !dbg !123
  %1 = load i32* @niter, align 4, !dbg !124, !tbaa !112
  %conv17 = sitofp i32 %1 to double, !dbg !124
  %div = fdiv double %conv17, 1.000000e+03, !dbg !124
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i64 0, i64 0), double %div) #4, !dbg !125
  %puts164 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @str29, i64 0, i64 0)), !dbg !126
  %puts165 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8]* @str30, i64 0, i64 0)), !dbg !127
  store i32 0, i32* @itercount, align 4, !dbg !128, !tbaa !112
  %2 = load i32* @niter, align 4, !dbg !131, !tbaa !112
  %cmp22180 = icmp sgt i32 %2, 0, !dbg !132
  br i1 %cmp22180, label %for.cond25.preheader.preheader, label %for.end55, !dbg !133

for.cond25.preheader.preheader:                   ; preds = %for.cond2.preheader
  br label %for.cond25.preheader, !dbg !134

for.cond25.preheader:                             ; preds = %for.cond25.preheader.preheader, %for.end40
  store i16 0, i16* @paraxial, align 2, !dbg !134, !tbaa !138
  br label %for.body29, !dbg !140

for.body29:                                       ; preds = %for.cond25.preheader, %for.body29
  tail call fastcc void @trace_line(i32 4, double 2.000000e+00), !dbg !141
  %3 = load double* @object_distance, align 8, !dbg !143, !tbaa !100
  %4 = load i16* @paraxial, align 2, !dbg !144, !tbaa !138
  %idxprom32 = sext i16 %4 to i64, !dbg !145
  %arrayidx34 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32, i64 0, !dbg !145
  store double %3, double* %arrayidx34, align 16, !dbg !145, !tbaa !100
  %5 = load double* @axis_slope_angle, align 8, !dbg !146, !tbaa !100
  %arrayidx37 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32, i64 1, !dbg !147
  store double %5, double* %arrayidx37, align 8, !dbg !147, !tbaa !100
  %inc39 = add i16 %4, 1, !dbg !134
  store i16 %inc39, i16* @paraxial, align 2, !dbg !134, !tbaa !138
  %cmp27 = icmp slt i16 %inc39, 2, !dbg !148
  br i1 %cmp27, label %for.body29, label %for.end40, !dbg !140

for.end40:                                        ; preds = %for.body29
  store i16 0, i16* @paraxial, align 2, !dbg !151, !tbaa !138
  tail call fastcc void @trace_line(i32 3, double 2.000000e+00), !dbg !152
  %6 = load double* @object_distance, align 8, !dbg !153, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %6, i64 0, metadata !21, metadata !96), !dbg !154
  tail call fastcc void @trace_line(i32 6, double 2.000000e+00), !dbg !155
  %7 = load double* @object_distance, align 8, !dbg !156, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %7, i64 0, metadata !19, metadata !96), !dbg !157
  %8 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !158, !tbaa !100
  %9 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !159, !tbaa !100
  %10 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !160, !tbaa !100
  %11 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !161, !tbaa !100
  %call45 = tail call double @sin(double %11) #4, !dbg !162
  %12 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !163, !tbaa !100
  %13 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !164, !tbaa !100
  %call50 = tail call double @sin(double %13) #4, !dbg !165
  %14 = load i32* @itercount, align 4, !dbg !128, !tbaa !112
  %inc54 = add nsw i32 %14, 1, !dbg !128
  store i32 %inc54, i32* @itercount, align 4, !dbg !128, !tbaa !112
  %15 = load i32* @niter, align 4, !dbg !131, !tbaa !112
  %cmp22 = icmp slt i32 %inc54, %15, !dbg !132
  br i1 %cmp22, label %for.cond25.preheader, label %for.cond21.for.end55_crit_edge, !dbg !133

for.cond21.for.end55_crit_edge:                   ; preds = %for.end40
  %call50.lcssa = phi double [ %call50, %for.end40 ]
  %.lcssa225 = phi double [ %12, %for.end40 ]
  %call45.lcssa = phi double [ %call45, %for.end40 ]
  %.lcssa224 = phi double [ %10, %for.end40 ]
  %.lcssa223 = phi double [ %9, %for.end40 ]
  %.lcssa222 = phi double [ %8, %for.end40 ]
  %.lcssa221 = phi double [ %7, %for.end40 ]
  %.lcssa220 = phi double [ %6, %for.end40 ]
  %sub.le = fsub double %.lcssa222, %.lcssa223, !dbg !158
  %mul.le = fmul double %.lcssa222, %.lcssa224, !dbg !166
  %mul46.le = fmul double %call45.lcssa, %.lcssa225, !dbg !162
  %div47.le = fdiv double %mul.le, %mul46.le, !dbg !167
  %sub48.le = fsub double 1.000000e+00, %div47.le, !dbg !168
  %sub49.le = fsub double %.lcssa221, %.lcssa220, !dbg !169
  %mul51.le = fmul double %call50.lcssa, %call50.lcssa, !dbg !170
  %div52.le = fdiv double 9.260000e-05, %mul51.le, !dbg !171
  br label %for.end55, !dbg !133

for.end55:                                        ; preds = %for.cond21.for.end55_crit_edge, %for.cond2.preheader
  %.lcssa174 = phi double [ %sub.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.cond2.preheader ]
  %.lcssa173 = phi double [ %sub48.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.cond2.preheader ]
  %.lcssa172 = phi double [ %sub49.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.cond2.preheader ]
  %.lcssa171 = phi double [ %div52.le, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.cond2.preheader ]
  %.lcssa = phi double [ 2.500000e-03, %for.cond21.for.end55_crit_edge ], [ 0.000000e+00, %for.cond2.preheader ]
  %16 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !dbg !172, !tbaa !100
  %17 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !dbg !173, !tbaa !100
  %call56 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), double %16, double %17) #4, !dbg !174
  %18 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !dbg !175, !tbaa !100
  %19 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !dbg !176, !tbaa !100
  %call57 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 1, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), double %18, double %19) #4, !dbg !177
  %call58 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 2, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), double %.lcssa174) #4, !dbg !178
  %call59 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 3, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa171) #4, !dbg !179
  %call60 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 4, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str10, i64 0, i64 0), double %.lcssa173) #4, !dbg !180
  %call61 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 5, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa) #4, !dbg !181
  %call62 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 6, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str11, i64 0, i64 0), double %.lcssa172) #4, !dbg !182
  %call63 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]]* @outarr, i64 0, i64 7, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str9, i64 0, i64 0), double %.lcssa171) #4, !dbg !183
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !96), !dbg !184
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !96), !dbg !114
  br label %for.body67, !dbg !185

for.body67:                                       ; preds = %for.inc125, %for.end55
  %indvars.iv204 = phi i64 [ 0, %for.end55 ], [ %indvars.iv.next205.pre, %for.inc125 ]
  %errors.0178 = phi i32 [ 0, %for.end55 ], [ %errors.3, %for.inc125 ]
  %arraydecay = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv204, i64 0, !dbg !186
  %arrayidx71 = getelementptr inbounds [8 x i8*]* @refarr, i64 0, i64 %indvars.iv204, !dbg !186
  %20 = load i8** %arrayidx71, align 8, !dbg !186, !tbaa !187
  %call72 = tail call i32 @strcmp(i8* %arraydecay, i8* %20) #4, !dbg !186
  %cmp73 = icmp eq i32 %call72, 0, !dbg !189
  %indvars.iv.next205.pre = add nuw nsw i64 %indvars.iv204, 1, !dbg !185
  br i1 %cmp73, label %for.inc125, label %if.then, !dbg !190

if.then:                                          ; preds = %for.body67
  %21 = trunc i64 %indvars.iv.next205.pre to i32, !dbg !191
  %call76 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str12, i64 0, i64 0), i32 %21) #4, !dbg !191
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i64 0, i64 0), i8* %20) #4, !dbg !193
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), i8* %arraydecay) #4, !dbg !194
  %call84 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0)) #4, !dbg !195
  %call87 = tail call i64 @strlen(i8* %20) #5, !dbg !196
  %conv88 = trunc i64 %call87 to i32, !dbg !196
  tail call void @llvm.dbg.value(metadata i32 %conv88, i64 0, metadata !17, metadata !96), !dbg !197
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !96), !dbg !198
  %cmp90175 = icmp sgt i32 %conv88, 0, !dbg !199
  br i1 %cmp90175, label %for.body92.lr.ph, label %for.end122, !dbg !202

for.body92.lr.ph:                                 ; preds = %if.then
  %22 = add i32 %conv88, -1, !dbg !202
  br label %for.body92, !dbg !202

for.body92:                                       ; preds = %for.body92, %for.body92.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body92.lr.ph ], [ %indvars.iv.next, %for.body92 ]
  %errors.1176 = phi i32 [ %errors.0178, %for.body92.lr.ph ], [ %errors.1.inc119, %for.body92 ]
  %arrayidx96 = getelementptr inbounds i8* %20, i64 %indvars.iv, !dbg !203
  %23 = load i8* %arrayidx96, align 1, !dbg !203, !tbaa !205
  %arrayidx101 = getelementptr inbounds [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv204, i64 %indvars.iv, !dbg !206
  %24 = load i8* %arrayidx101, align 1, !dbg !206, !tbaa !205
  %cmp103 = icmp eq i8 %23, %24, !dbg !203
  %cond = select i1 %cmp103, i32 32, i32 94, !dbg !203
  %putchar167 = tail call i32 @putchar(i32 %cond) #4, !dbg !207
  %25 = load i8* %arrayidx96, align 1, !dbg !208, !tbaa !205
  %26 = load i8* %arrayidx101, align 1, !dbg !210, !tbaa !205
  %not.cmp116 = icmp ne i8 %25, %26, !dbg !211
  %inc119 = zext i1 %not.cmp116 to i32, !dbg !211
  %errors.1.inc119 = add nsw i32 %inc119, %errors.1176, !dbg !211
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !202
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !202
  %exitcond = icmp eq i32 %lftr.wideiv, %22, !dbg !202
  br i1 %exitcond, label %for.end122.loopexit, label %for.body92, !dbg !202

for.end122.loopexit:                              ; preds = %for.body92
  %errors.1.inc119.lcssa = phi i32 [ %errors.1.inc119, %for.body92 ]
  br label %for.end122

for.end122:                                       ; preds = %for.end122.loopexit, %if.then
  %errors.1.lcssa = phi i32 [ %errors.0178, %if.then ], [ %errors.1.inc119.lcssa, %for.end122.loopexit ]
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !212
  br label %for.inc125, !dbg !213

for.inc125:                                       ; preds = %for.body67, %for.end122
  %errors.3 = phi i32 [ %errors.1.lcssa, %for.end122 ], [ %errors.0178, %for.body67 ]
  %exitcond207 = icmp eq i64 %indvars.iv.next205.pre, 8, !dbg !185
  br i1 %exitcond207, label %for.end127, label %for.body67, !dbg !185

for.end127:                                       ; preds = %for.inc125
  %errors.3.lcssa = phi i32 [ %errors.3, %for.inc125 ]
  %cmp128 = icmp sgt i32 %errors.3.lcssa, 0, !dbg !214
  br i1 %cmp128, label %if.then130, label %if.else, !dbg !216

if.then130:                                       ; preds = %for.end127
  %cmp131 = icmp sgt i32 %errors.3.lcssa, 1, !dbg !217
  %cond133 = select i1 %cmp131, i8* getelementptr inbounds ([2 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str20, i64 0, i64 0), !dbg !217
  %call134 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str18, i64 0, i64 0), i32 %errors.3.lcssa, i8* %cond133) #4, !dbg !219
  br label %if.end136, !dbg !220

if.else:                                          ; preds = %for.end127
  %puts166 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str31, i64 0, i64 0)), !dbg !221
  br label %if.end136

if.end136:                                        ; preds = %if.else, %if.then130
  ret i32 0, !dbg !222
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @trace_line(i32 %line, double %ray_h) #0 {
entry:
  store double 0.000000e+00, double* @object_distance, align 8, !dbg !223, !tbaa !100
  store double %ray_h, double* @ray_height, align 8, !dbg !224, !tbaa !100
  store double 1.000000e+00, double* @from_index, align 8, !dbg !225, !tbaa !100
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !96), !dbg !226
  %.b351 = load i1* @current_surfaces, align 1
  br i1 %.b351, label %for.body.lr.ph, label %for.end, !dbg !227

for.body.lr.ph:                                   ; preds = %entry
  %idxprom8 = sext i32 %line to i64, !dbg !229
  %arrayidx9 = getelementptr inbounds [9 x double]* @spectral_line, i64 0, i64 %idxprom8, !dbg !229
  br label %for.body, !dbg !227

for.body:                                         ; preds = %for.inc.thread, %for.body.lr.ph
  %0 = phi double [ 1.000000e+00, %for.body.lr.ph ], [ %29, %for.inc.thread ]
  %1 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %sub26, %for.inc.thread ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next5, %for.inc.thread ]
  %arrayidx2 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 1, !dbg !233
  %2 = load double* %arrayidx2, align 8, !dbg !233, !tbaa !100
  store double %2, double* @radius_of_curvature, align 8, !dbg !234, !tbaa !100
  %arrayidx5 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 2, !dbg !235
  %3 = load double* %arrayidx5, align 8, !dbg !235, !tbaa !100
  store double %3, double* @to_index, align 8, !dbg !236, !tbaa !100
  %cmp6 = fcmp ogt double %3, 1.000000e+00, !dbg !237
  br i1 %cmp6, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %for.body
  %4 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 4), align 16, !dbg !239, !tbaa !100
  %5 = load double* %arrayidx9, align 8, !dbg !229, !tbaa !100
  %sub = fsub double %4, %5, !dbg !239
  %6 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 3), align 8, !dbg !240, !tbaa !100
  %7 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i64 0, i64 6), align 16, !dbg !241, !tbaa !100
  %sub10 = fsub double %6, %7, !dbg !240
  %div = fdiv double %sub, %sub10, !dbg !242
  %sub14 = fadd double %3, -1.000000e+00, !dbg !243
  %arrayidx17 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 3, !dbg !244
  %8 = load double* %arrayidx17, align 8, !dbg !244, !tbaa !100
  %div18 = fdiv double %sub14, %8, !dbg !245
  %mul = fmul double %div, %div18, !dbg !246
  %add = fadd double %3, %mul, !dbg !247
  store double %add, double* @to_index, align 8, !dbg !248, !tbaa !100
  br label %if.end, !dbg !248

if.end:                                           ; preds = %if.then, %for.body
  %9 = phi double [ %add, %if.then ], [ %3, %for.body ]
  %10 = load i16* @paraxial, align 2, !dbg !249, !tbaa !138
  %tobool.i = icmp eq i16 %10, 0, !dbg !252
  %cmp.i = fcmp une double %2, 0.000000e+00, !dbg !253
  br i1 %tobool.i, label %if.end18.i, label %if.then.i, !dbg !252

if.then.i:                                        ; preds = %if.end
  br i1 %cmp.i, label %if.then1.i, label %if.end13.i, !dbg !256

if.then1.i:                                       ; preds = %if.then.i
  %cmp2.i = fcmp oeq double %1, 0.000000e+00, !dbg !257
  br i1 %cmp2.i, label %if.then3.i, label %if.else.i, !dbg !260

if.then3.i:                                       ; preds = %if.then1.i
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !261, !tbaa !100
  %11 = load double* @ray_height, align 8, !dbg !263, !tbaa !100
  %div.i = fdiv double %11, %2, !dbg !263
  tail call void @llvm.dbg.value(metadata double %div.i, i64 0, metadata !264, metadata !96) #4, !dbg !265
  br label %if.end.i, !dbg !266

if.else.i:                                        ; preds = %if.then1.i
  %sub.i = fsub double %1, %2, !dbg !267
  %div4.i = fdiv double %sub.i, %2, !dbg !268
  %12 = load double* @axis_slope_angle, align 8, !dbg !269, !tbaa !100
  %mul.i = fmul double %div4.i, %12, !dbg !270
  tail call void @llvm.dbg.value(metadata double %mul.i, i64 0, metadata !264, metadata !96) #4, !dbg !265
  br label %if.end.i, !dbg !251

if.end.i:                                         ; preds = %if.else.i, %if.then3.i
  %13 = phi double [ 0.000000e+00, %if.then3.i ], [ %12, %if.else.i ], !dbg !251
  %iang_sin.0.i = phi double [ %div.i, %if.then3.i ], [ %mul.i, %if.else.i ], !dbg !251
  %div5.i = fdiv double %0, %9, !dbg !271
  %mul6.i = fmul double %iang_sin.0.i, %div5.i, !dbg !272
  tail call void @llvm.dbg.value(metadata double %mul6.i, i64 0, metadata !273, metadata !96) #4, !dbg !274
  tail call void @llvm.dbg.value(metadata double %13, i64 0, metadata !275, metadata !96) #4, !dbg !276
  %add.i = fadd double %13, %iang_sin.0.i, !dbg !277
  %sub7.i = fsub double %add.i, %mul6.i, !dbg !277
  store double %sub7.i, double* @axis_slope_angle, align 8, !dbg !278, !tbaa !100
  %cmp8.i = fcmp une double %1, 0.000000e+00, !dbg !279
  br i1 %cmp8.i, label %if.then9.i, label %if.end.if.end11_crit_edge.i, !dbg !281

if.end.if.end11_crit_edge.i:                      ; preds = %if.end.i
  %.pre.i = load double* @ray_height, align 8, !dbg !282, !tbaa !100
  br label %if.end11.i, !dbg !281

if.then9.i:                                       ; preds = %if.end.i
  %mul10.i = fmul double %1, %13, !dbg !283
  store double %mul10.i, double* @ray_height, align 8, !dbg !284, !tbaa !100
  br label %if.end11.i, !dbg !284

if.end11.i:                                       ; preds = %if.then9.i, %if.end.if.end11_crit_edge.i
  %14 = phi double [ %.pre.i, %if.end.if.end11_crit_edge.i ], [ %mul10.i, %if.then9.i ], !dbg !251
  %div12.i = fdiv double %14, %sub7.i, !dbg !282
  store double %div12.i, double* @object_distance, align 8, !dbg !285, !tbaa !100
  br label %transit_surface.exit, !dbg !286

if.end13.i:                                       ; preds = %if.then.i
  %div14.i = fdiv double %9, %0, !dbg !287
  %mul15.i = fmul double %1, %div14.i, !dbg !288
  store double %mul15.i, double* @object_distance, align 8, !dbg !289, !tbaa !100
  %15 = load double* @axis_slope_angle, align 8, !dbg !290, !tbaa !100
  %div16.i = fdiv double %0, %9, !dbg !291
  %mul17.i = fmul double %15, %div16.i, !dbg !290
  store double %mul17.i, double* @axis_slope_angle, align 8, !dbg !292, !tbaa !100
  br label %transit_surface.exit, !dbg !293

if.end18.i:                                       ; preds = %if.end
  br i1 %cmp.i, label %if.then20.i, label %if.end48.i, !dbg !294

if.then20.i:                                      ; preds = %if.end18.i
  %cmp21.i = fcmp oeq double %1, 0.000000e+00, !dbg !295
  br i1 %cmp21.i, label %if.then22.i, label %if.else24.i, !dbg !299

if.then22.i:                                      ; preds = %if.then20.i
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !dbg !300, !tbaa !100
  %16 = load double* @ray_height, align 8, !dbg !302, !tbaa !100
  %div23.i = fdiv double %16, %2, !dbg !302
  tail call void @llvm.dbg.value(metadata double %div23.i, i64 0, metadata !264, metadata !96) #4, !dbg !265
  br label %if.end28.i, !dbg !303

if.else24.i:                                      ; preds = %if.then20.i
  %sub25.i = fsub double %1, %2, !dbg !304
  %div26.i = fdiv double %sub25.i, %2, !dbg !306
  %17 = load double* @axis_slope_angle, align 8, !dbg !307, !tbaa !100
  %call.i = tail call double @sin(double %17) #4, !dbg !308
  %mul27.i = fmul double %div26.i, %call.i, !dbg !309
  tail call void @llvm.dbg.value(metadata double %mul27.i, i64 0, metadata !264, metadata !96) #4, !dbg !265
  br label %if.end28.i, !dbg !251

if.end28.i:                                       ; preds = %if.else24.i, %if.then22.i
  %iang_sin.1.i = phi double [ %div23.i, %if.then22.i ], [ %mul27.i, %if.else24.i ], !dbg !251
  %call29.i = tail call double @asin(double %iang_sin.1.i) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata double %call29.i, i64 0, metadata !311, metadata !96) #4, !dbg !312
  %18 = load double* @from_index, align 8, !dbg !313, !tbaa !100
  %19 = load double* @to_index, align 8, !dbg !314, !tbaa !100
  %div30.i = fdiv double %18, %19, !dbg !313
  %mul31.i = fmul double %iang_sin.1.i, %div30.i, !dbg !315
  tail call void @llvm.dbg.value(metadata double %mul31.i, i64 0, metadata !273, metadata !96) #4, !dbg !274
  %20 = load double* @axis_slope_angle, align 8, !dbg !316, !tbaa !100
  tail call void @llvm.dbg.value(metadata double %20, i64 0, metadata !275, metadata !96) #4, !dbg !276
  %add32.i = fadd double %call29.i, %20, !dbg !317
  %call33.i = tail call double @asin(double %mul31.i) #4, !dbg !318
  %sub34.i = fsub double %add32.i, %call33.i, !dbg !317
  store double %sub34.i, double* @axis_slope_angle, align 8, !dbg !319, !tbaa !100
  %div36.i = fmul double %add32.i, 5.000000e-01, !dbg !320
  %call37.i = tail call double @sin(double %div36.i) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata double %call37.i, i64 0, metadata !322, metadata !96) #4, !dbg !323
  %21 = load double* @radius_of_curvature, align 8, !dbg !324, !tbaa !100
  %mul38.i = fmul double %21, 2.000000e+00, !dbg !325
  %mul39.i = fmul double %call37.i, %mul38.i, !dbg !325
  %mul40.i = fmul double %call37.i, %mul39.i, !dbg !325
  tail call void @llvm.dbg.value(metadata double %mul40.i, i64 0, metadata !322, metadata !96) #4, !dbg !323
  %call42.i = tail call double @sin(double %add32.i) #4, !dbg !326
  %mul43.i = fmul double %21, %call42.i, !dbg !327
  %22 = load double* @axis_slope_angle, align 8, !dbg !328, !tbaa !100
  %call44.i = tail call double @tan(double %22) #4, !dbg !328
  %div45.i = fdiv double 1.000000e+00, %call44.i, !dbg !328
  %mul46.i = fmul double %mul43.i, %div45.i, !dbg !329
  %add47.i = fadd double %mul40.i, %mul46.i, !dbg !330
  store double %add47.i, double* @object_distance, align 8, !dbg !331, !tbaa !100
  br label %transit_surface.exit, !dbg !332

if.end48.i:                                       ; preds = %if.end18.i
  %div49.i = fdiv double %0, %9, !dbg !333
  %23 = load double* @axis_slope_angle, align 8, !dbg !334, !tbaa !100
  %call50.i = tail call double @sin(double %23) #4, !dbg !335
  %mul51.i = fmul double %div49.i, %call50.i, !dbg !336
  %call52.i = tail call double @asin(double %mul51.i) #4, !dbg !337
  %24 = load double* @object_distance, align 8, !dbg !338, !tbaa !100
  %25 = load double* @to_index, align 8, !dbg !339, !tbaa !100
  %call55.i = tail call double @cos(double %call52.i) #4, !dbg !340
  %mul56.i = fmul double %25, %call55.i, !dbg !339
  %26 = load double* @from_index, align 8, !dbg !341, !tbaa !100
  %27 = load double* @axis_slope_angle, align 8, !dbg !342, !tbaa !100
  %call57.i = tail call double @cos(double %27) #4, !dbg !343
  %mul58.i = fmul double %26, %call57.i, !dbg !341
  %div59.i = fdiv double %mul56.i, %mul58.i, !dbg !344
  %mul60.i = fmul double %24, %div59.i, !dbg !338
  store double %mul60.i, double* @object_distance, align 8, !dbg !345, !tbaa !100
  store double %call52.i, double* @axis_slope_angle, align 8, !dbg !346, !tbaa !100
  br label %transit_surface.exit, !dbg !347

transit_surface.exit:                             ; preds = %if.end11.i, %if.end13.i, %if.end28.i, %if.end48.i
  %28 = phi double [ %div12.i, %if.end11.i ], [ %mul15.i, %if.end13.i ], [ %add47.i, %if.end28.i ], [ %mul60.i, %if.end48.i ]
  %29 = load double* @to_index, align 8, !dbg !348, !tbaa !100
  store double %29, double* @from_index, align 8, !dbg !349, !tbaa !100
  %.b = load i1* @current_surfaces, align 1
  %30 = select i1 %.b, i64 4, i64 0, !dbg !350
  %cmp20 = icmp slt i64 %indvars.iv, %30, !dbg !350
  br i1 %cmp20, label %for.inc.thread, label %for.end.loopexit, !dbg !352

for.inc.thread:                                   ; preds = %transit_surface.exit
  %arrayidx25 = getelementptr inbounds [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 4, !dbg !353
  %31 = load double* %arrayidx25, align 8, !dbg !353, !tbaa !100
  %sub26 = fsub double %28, %31, !dbg !354
  store double %sub26, double* @object_distance, align 8, !dbg !355, !tbaa !100
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv, 1, !dbg !227
  br label %for.body, !dbg !227

for.end.loopexit:                                 ; preds = %transit_surface.exit
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
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
!39 = !{!"0x2e\00transit_surface\00transit_surface\00\00586\001\001\000\000\000\001\00586", !1, !5, !40, null, null, null, null, !42} ; [ DW_TAG_subprogram ] [line 586] [local] [def] [transit_surface]
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
!117 = !MDLocation(line: 708, column: 8, scope: !118)
!118 = !{!"0xb\00707\005\003", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!119 = !{!"0xb\00707\005\002", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!120 = !{!"0xb\00706\002\001", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!121 = !MDLocation(line: 714, column: 9, scope: !4)
!122 = !MDLocation(line: 716, column: 5, scope: !4)
!123 = !MDLocation(line: 715, column: 9, scope: !4)
!124 = !MDLocation(line: 718, column: 77, scope: !4)
!125 = !MDLocation(line: 718, column: 9, scope: !4)
!126 = !MDLocation(line: 719, column: 9, scope: !4)
!127 = !MDLocation(line: 720, column: 9, scope: !4)
!128 = !MDLocation(line: 732, column: 41, scope: !129)
!129 = !{!"0xb\00732\002\005", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!130 = !{!"0xb\00732\002\004", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!131 = !MDLocation(line: 732, column: 34, scope: !129)
!132 = !MDLocation(line: 732, column: 22, scope: !129)
!133 = !MDLocation(line: 732, column: 2, scope: !130)
!134 = !MDLocation(line: 735, column: 39, scope: !135)
!135 = !{!"0xb\00735\005\008", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!136 = !{!"0xb\00735\005\007", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!137 = !{!"0xb\00732\0054\006", !1, !129}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!138 = !{!139, !139, i64 0}
!139 = !{!"short", !102, i64 0}
!140 = !MDLocation(line: 735, column: 5, scope: !136)
!141 = !MDLocation(line: 739, column: 8, scope: !142)
!142 = !{!"0xb\00735\0051\009", !1, !135}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!143 = !MDLocation(line: 740, column: 29, scope: !142)
!144 = !MDLocation(line: 740, column: 14, scope: !142)
!145 = !MDLocation(line: 740, column: 8, scope: !142)
!146 = !MDLocation(line: 741, column: 29, scope: !142)
!147 = !MDLocation(line: 741, column: 8, scope: !142)
!148 = !MDLocation(line: 735, column: 24, scope: !149)
!149 = !{!"0xb\002", !1, !150}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!150 = !{!"0xb\001", !1, !135}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!151 = !MDLocation(line: 743, column: 5, scope: !137)
!152 = !MDLocation(line: 747, column: 5, scope: !137)
!153 = !MDLocation(line: 748, column: 16, scope: !137)
!154 = !MDLocation(line: 684, column: 19, scope: !4)
!155 = !MDLocation(line: 752, column: 5, scope: !137)
!156 = !MDLocation(line: 753, column: 16, scope: !137)
!157 = !MDLocation(line: 684, column: 9, scope: !4)
!158 = !MDLocation(line: 755, column: 20, scope: !137)
!159 = !MDLocation(line: 755, column: 34, scope: !137)
!160 = !MDLocation(line: 756, column: 38, scope: !137)
!161 = !MDLocation(line: 757, column: 13, scope: !137)
!162 = !MDLocation(line: 757, column: 9, scope: !137)
!163 = !MDLocation(line: 757, column: 28, scope: !137)
!164 = !MDLocation(line: 759, column: 22, scope: !137)
!165 = !MDLocation(line: 759, column: 18, scope: !137)
!166 = !MDLocation(line: 756, column: 24, scope: !137)
!167 = !MDLocation(line: 756, column: 23, scope: !137)
!168 = !MDLocation(line: 756, column: 17, scope: !137)
!169 = !MDLocation(line: 758, column: 20, scope: !137)
!170 = !MDLocation(line: 763, column: 31, scope: !137)
!171 = !MDLocation(line: 763, column: 18, scope: !137)
!172 = !MDLocation(line: 773, column: 28, scope: !4)
!173 = !MDLocation(line: 773, column: 41, scope: !4)
!174 = !MDLocation(line: 772, column: 9, scope: !4)
!175 = !MDLocation(line: 775, column: 28, scope: !4)
!176 = !MDLocation(line: 775, column: 41, scope: !4)
!177 = !MDLocation(line: 774, column: 9, scope: !4)
!178 = !MDLocation(line: 776, column: 2, scope: !4)
!179 = !MDLocation(line: 779, column: 2, scope: !4)
!180 = !MDLocation(line: 782, column: 2, scope: !4)
!181 = !MDLocation(line: 785, column: 2, scope: !4)
!182 = !MDLocation(line: 788, column: 2, scope: !4)
!183 = !MDLocation(line: 791, column: 2, scope: !4)
!184 = !MDLocation(line: 683, column: 15, scope: !4)
!185 = !MDLocation(line: 799, column: 2, scope: !27)
!186 = !MDLocation(line: 800, column: 9, scope: !23)
!187 = !{!188, !188, i64 0}
!188 = !{!"any pointer", !102, i64 0}
!189 = !MDLocation(line: 800, column: 9, scope: !24)
!190 = !MDLocation(line: 800, column: 9, scope: !25)
!191 = !MDLocation(line: 805, column: 15, scope: !192)
!192 = !{!"0xb\00800\0044\0015", !1, !24}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!193 = !MDLocation(line: 807, column: 15, scope: !192)
!194 = !MDLocation(line: 808, column: 15, scope: !192)
!195 = !MDLocation(line: 809, column: 15, scope: !192)
!196 = !MDLocation(line: 810, column: 12, scope: !192)
!197 = !MDLocation(line: 683, column: 12, scope: !4)
!198 = !MDLocation(line: 683, column: 9, scope: !4)
!199 = !MDLocation(line: 811, column: 20, scope: !200)
!200 = !{!"0xb\00811\008\0017", !1, !201}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!201 = !{!"0xb\00811\008\0016", !1, !192}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!202 = !MDLocation(line: 811, column: 8, scope: !201)
!203 = !MDLocation(line: 812, column: 31, scope: !204)
!204 = !{!"0xb\00811\0032\0018", !1, !200}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!205 = !{!102, !102, i64 0}
!206 = !MDLocation(line: 812, column: 47, scope: !204)
!207 = !MDLocation(line: 812, column: 18, scope: !204)
!208 = !MDLocation(line: 813, column: 8, scope: !209)
!209 = !{!"0xb\00813\008\0019", !1, !204}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!210 = !MDLocation(line: 813, column: 24, scope: !209)
!211 = !MDLocation(line: 813, column: 8, scope: !204)
!212 = !MDLocation(line: 816, column: 15, scope: !192)
!213 = !MDLocation(line: 817, column: 5, scope: !192)
!214 = !MDLocation(line: 822, column: 6, scope: !215)
!215 = !{!"0xb\00822\006\0020", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!216 = !MDLocation(line: 822, column: 6, scope: !4)
!217 = !MDLocation(line: 824, column: 23, scope: !218)
!218 = !{!"0xb\00822\0018\0021", !1, !215}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!219 = !MDLocation(line: 823, column: 12, scope: !218)
!220 = !MDLocation(line: 825, column: 2, scope: !218)
!221 = !MDLocation(line: 826, column: 12, scope: !215)
!222 = !MDLocation(line: 828, column: 2, scope: !4)
!223 = !MDLocation(line: 657, column: 2, scope: !32)
!224 = !MDLocation(line: 658, column: 2, scope: !32)
!225 = !MDLocation(line: 659, column: 2, scope: !32)
!226 = !MDLocation(line: 655, column: 6, scope: !32)
!227 = !MDLocation(line: 661, column: 2, scope: !228)
!228 = !{!"0xb\00661\002\0022", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!229 = !MDLocation(line: 666, column: 4, scope: !230)
!230 = !{!"0xb\00664\009\0025", !1, !231}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!231 = !{!"0xb\00661\0042\0024", !1, !232}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!232 = !{!"0xb\00661\002\0023", !1, !228}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!233 = !MDLocation(line: 662, column: 27, scope: !231)
!234 = !MDLocation(line: 662, column: 5, scope: !231)
!235 = !MDLocation(line: 663, column: 16, scope: !231)
!236 = !MDLocation(line: 663, column: 5, scope: !231)
!237 = !MDLocation(line: 664, column: 9, scope: !230)
!238 = !MDLocation(line: 664, column: 9, scope: !231)
!239 = !MDLocation(line: 665, column: 32, scope: !230)
!240 = !MDLocation(line: 667, column: 5, scope: !230)
!241 = !MDLocation(line: 667, column: 24, scope: !230)
!242 = !MDLocation(line: 665, column: 31, scope: !230)
!243 = !MDLocation(line: 667, column: 47, scope: !230)
!244 = !MDLocation(line: 668, column: 4, scope: !230)
!245 = !MDLocation(line: 667, column: 46, scope: !230)
!246 = !MDLocation(line: 665, column: 30, scope: !230)
!247 = !MDLocation(line: 665, column: 19, scope: !230)
!248 = !MDLocation(line: 665, column: 8, scope: !230)
!249 = !MDLocation(line: 593, column: 6, scope: !250, inlinedAt: !251)
!250 = !{!"0xb\00593\006\0027", !1, !39}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!251 = !MDLocation(line: 669, column: 5, scope: !231)
!252 = !MDLocation(line: 593, column: 6, scope: !39, inlinedAt: !251)
!253 = !MDLocation(line: 594, column: 9, scope: !254, inlinedAt: !251)
!254 = !{!"0xb\00594\009\0029", !1, !255}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!255 = !{!"0xb\00593\0016\0028", !1, !250}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!256 = !MDLocation(line: 594, column: 9, scope: !255, inlinedAt: !251)
!257 = !MDLocation(line: 595, column: 12, scope: !258, inlinedAt: !251)
!258 = !{!"0xb\00595\0012\0031", !1, !259}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!259 = !{!"0xb\00594\0037\0030", !1, !254}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!260 = !MDLocation(line: 595, column: 12, scope: !259, inlinedAt: !251)
!261 = !MDLocation(line: 596, column: 4, scope: !262, inlinedAt: !251)
!262 = !{!"0xb\00595\0036\0032", !1, !258}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!263 = !MDLocation(line: 597, column: 15, scope: !262, inlinedAt: !251)
!264 = !{!"0x100\00iang_sin\00589\000", !39, !5, !20, !251} ; [ DW_TAG_auto_variable ] [iang_sin] [line 589]
!265 = !MDLocation(line: 589, column: 9, scope: !39, inlinedAt: !251)
!266 = !MDLocation(line: 598, column: 8, scope: !262, inlinedAt: !251)
!267 = !MDLocation(line: 599, column: 17, scope: !258, inlinedAt: !251)
!268 = !MDLocation(line: 599, column: 16, scope: !258, inlinedAt: !251)
!269 = !MDLocation(line: 601, column: 7, scope: !258, inlinedAt: !251)
!270 = !MDLocation(line: 599, column: 15, scope: !258, inlinedAt: !251)
!271 = !MDLocation(line: 603, column: 20, scope: !259, inlinedAt: !251)
!272 = !MDLocation(line: 603, column: 19, scope: !259, inlinedAt: !251)
!273 = !{!"0x100\00rang_sin\00590\000", !39, !5, !20, !251} ; [ DW_TAG_auto_variable ] [rang_sin] [line 590]
!274 = !MDLocation(line: 590, column: 9, scope: !39, inlinedAt: !251)
!275 = !{!"0x100\00old_axis_slope_angle\00591\000", !39, !5, !20, !251} ; [ DW_TAG_auto_variable ] [old_axis_slope_angle] [line 591]
!276 = !MDLocation(line: 591, column: 9, scope: !39, inlinedAt: !251)
!277 = !MDLocation(line: 606, column: 27, scope: !259, inlinedAt: !251)
!278 = !MDLocation(line: 606, column: 8, scope: !259, inlinedAt: !251)
!279 = !MDLocation(line: 608, column: 12, scope: !280, inlinedAt: !251)
!280 = !{!"0xb\00608\0012\0033", !1, !259}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!281 = !MDLocation(line: 608, column: 12, scope: !259, inlinedAt: !251)
!282 = !MDLocation(line: 610, column: 26, scope: !259, inlinedAt: !251)
!283 = !MDLocation(line: 609, column: 17, scope: !280, inlinedAt: !251)
!284 = !MDLocation(line: 609, column: 4, scope: !280, inlinedAt: !251)
!285 = !MDLocation(line: 610, column: 8, scope: !259, inlinedAt: !251)
!286 = !MDLocation(line: 611, column: 8, scope: !259, inlinedAt: !251)
!287 = !MDLocation(line: 613, column: 42, scope: !255, inlinedAt: !251)
!288 = !MDLocation(line: 613, column: 23, scope: !255, inlinedAt: !251)
!289 = !MDLocation(line: 613, column: 5, scope: !255, inlinedAt: !251)
!290 = !MDLocation(line: 614, column: 24, scope: !255, inlinedAt: !251)
!291 = !MDLocation(line: 614, column: 44, scope: !255, inlinedAt: !251)
!292 = !MDLocation(line: 614, column: 5, scope: !255, inlinedAt: !251)
!293 = !MDLocation(line: 615, column: 5, scope: !255, inlinedAt: !251)
!294 = !MDLocation(line: 618, column: 6, scope: !39, inlinedAt: !251)
!295 = !MDLocation(line: 619, column: 9, scope: !296, inlinedAt: !251)
!296 = !{!"0xb\00619\009\0036", !1, !297}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!297 = !{!"0xb\00618\0034\0035", !1, !298}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!298 = !{!"0xb\00618\006\0034", !1, !39}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!299 = !MDLocation(line: 619, column: 9, scope: !297, inlinedAt: !251)
!300 = !MDLocation(line: 620, column: 8, scope: !301, inlinedAt: !251)
!301 = !{!"0xb\00619\0033\0037", !1, !296}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!302 = !MDLocation(line: 621, column: 19, scope: !301, inlinedAt: !251)
!303 = !MDLocation(line: 622, column: 5, scope: !301, inlinedAt: !251)
!304 = !MDLocation(line: 623, column: 21, scope: !305, inlinedAt: !251)
!305 = !{!"0xb\00622\0012\0038", !1, !296}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!306 = !MDLocation(line: 623, column: 20, scope: !305, inlinedAt: !251)
!307 = !MDLocation(line: 625, column: 8, scope: !305, inlinedAt: !251)
!308 = !MDLocation(line: 625, column: 4, scope: !305, inlinedAt: !251)
!309 = !MDLocation(line: 623, column: 19, scope: !305, inlinedAt: !251)
!310 = !MDLocation(line: 627, column: 12, scope: !297, inlinedAt: !251)
!311 = !{!"0x100\00iang\00587\000", !39, !5, !20, !251} ; [ DW_TAG_auto_variable ] [iang] [line 587]
!312 = !MDLocation(line: 587, column: 9, scope: !39, inlinedAt: !251)
!313 = !MDLocation(line: 628, column: 17, scope: !297, inlinedAt: !251)
!314 = !MDLocation(line: 628, column: 30, scope: !297, inlinedAt: !251)
!315 = !MDLocation(line: 628, column: 16, scope: !297, inlinedAt: !251)
!316 = !MDLocation(line: 630, column: 28, scope: !297, inlinedAt: !251)
!317 = !MDLocation(line: 631, column: 24, scope: !297, inlinedAt: !251)
!318 = !MDLocation(line: 632, column: 15, scope: !297, inlinedAt: !251)
!319 = !MDLocation(line: 631, column: 5, scope: !297, inlinedAt: !251)
!320 = !MDLocation(line: 633, column: 19, scope: !297, inlinedAt: !251)
!321 = !MDLocation(line: 633, column: 15, scope: !297, inlinedAt: !251)
!322 = !{!"0x100\00sagitta\00591\000", !39, !5, !20, !251} ; [ DW_TAG_auto_variable ] [sagitta] [line 591]
!323 = !MDLocation(line: 591, column: 31, scope: !39, inlinedAt: !251)
!324 = !MDLocation(line: 634, column: 21, scope: !297, inlinedAt: !251)
!325 = !MDLocation(line: 634, column: 15, scope: !297, inlinedAt: !251)
!326 = !MDLocation(line: 635, column: 47, scope: !297, inlinedAt: !251)
!327 = !MDLocation(line: 635, column: 25, scope: !297, inlinedAt: !251)
!328 = !MDLocation(line: 637, column: 8, scope: !297, inlinedAt: !251)
!329 = !MDLocation(line: 635, column: 24, scope: !297, inlinedAt: !251)
!330 = !MDLocation(line: 635, column: 23, scope: !297, inlinedAt: !251)
!331 = !MDLocation(line: 635, column: 5, scope: !297, inlinedAt: !251)
!332 = !MDLocation(line: 638, column: 5, scope: !297, inlinedAt: !251)
!333 = !MDLocation(line: 641, column: 16, scope: !39, inlinedAt: !251)
!334 = !MDLocation(line: 642, column: 9, scope: !39, inlinedAt: !251)
!335 = !MDLocation(line: 642, column: 5, scope: !39, inlinedAt: !251)
!336 = !MDLocation(line: 641, column: 15, scope: !39, inlinedAt: !251)
!337 = !MDLocation(line: 641, column: 10, scope: !39, inlinedAt: !251)
!338 = !MDLocation(line: 643, column: 20, scope: !39, inlinedAt: !251)
!339 = !MDLocation(line: 643, column: 40, scope: !39, inlinedAt: !251)
!340 = !MDLocation(line: 644, column: 5, scope: !39, inlinedAt: !251)
!341 = !MDLocation(line: 644, column: 20, scope: !39, inlinedAt: !251)
!342 = !MDLocation(line: 645, column: 9, scope: !39, inlinedAt: !251)
!343 = !MDLocation(line: 645, column: 5, scope: !39, inlinedAt: !251)
!344 = !MDLocation(line: 643, column: 39, scope: !39, inlinedAt: !251)
!345 = !MDLocation(line: 643, column: 2, scope: !39, inlinedAt: !251)
!346 = !MDLocation(line: 646, column: 2, scope: !39, inlinedAt: !251)
!347 = !MDLocation(line: 647, column: 1, scope: !39, inlinedAt: !251)
!348 = !MDLocation(line: 670, column: 18, scope: !231)
!349 = !MDLocation(line: 670, column: 5, scope: !231)
!350 = !MDLocation(line: 671, column: 9, scope: !351)
!351 = !{!"0xb\00671\009\0026", !1, !231}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fbench.c]
!352 = !MDLocation(line: 671, column: 9, scope: !231)
!353 = !MDLocation(line: 672, column: 44, scope: !351)
!354 = !MDLocation(line: 672, column: 26, scope: !351)
!355 = !MDLocation(line: 672, column: 8, scope: !351)
