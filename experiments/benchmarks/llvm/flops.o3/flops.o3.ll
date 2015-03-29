; ModuleID = 'flops.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@A0 = global double 1.000000e+00, align 8
@A1 = global double 0xBFC5555555559705, align 8
@A2 = global double 0x3F811111113AE9A3, align 8
@A3 = global double 0x3F2A01A03FB1CA71, align 8
@A4 = global double 0x3EC71DF284AA3566, align 8
@A5 = global double 0x3E5AEB5A8CF8A426, align 8
@A6 = global double 0x3DE68DF75229C1A6, align 8
@B0 = global double 1.000000e+00, align 8
@B1 = global double 0xBFDFFFFFFFFF8156, align 8
@B2 = global double 0x3FA5555555290224, align 8
@B3 = global double 0xBF56C16BFFE76516, align 8
@B4 = global double 0x3EFA019528242DB7, align 8
@B5 = global double 0xBE927BB3D47DDB8E, align 8
@B6 = global double 0x3E2157B275DF182A, align 8
@C0 = global double 1.000000e+00, align 8
@C1 = global double 0x3FEFFFFFFE37B3E2, align 8
@C2 = global double 0x3FDFFFFFCC2BA4B8, align 8
@C3 = global double 0x3FC555587C476915, align 8
@C4 = global double 0x3FA5555B7E795548, align 8
@C5 = global double 0x3F810D9A4AD9120C, align 8
@C6 = global double 0x3F5713187EDB8C05, align 8
@C7 = global double 0x3F26C077C8173F3A, align 8
@C8 = global double 3.931683e-05, align 8
@D1 = global double 0x3FA47AE143138374, align 8
@D2 = global double 9.600000e-04, align 8
@D3 = global double 1.233153e-06, align 8
@E2 = global double 4.800000e-04, align 8
@E3 = global double 4.110510e-07, align 8
@T = common global [36 x double] zeroinitializer, align 16
@TLimit = common global double 0.000000e+00, align 8
@piref = common global double 0.000000e+00, align 8
@one = common global double 0.000000e+00, align 8
@two = common global double 0.000000e+00, align 8
@three = common global double 0.000000e+00, align 8
@four = common global double 0.000000e+00, align 8
@five = common global double 0.000000e+00, align 8
@scale = common global double 0.000000e+00, align 8
@TimeArray = common global [3 x double] zeroinitializer, align 16
@sa = common global double 0.000000e+00, align 8
@nulltime = common global double 0.000000e+00, align 8
@sb = common global double 0.000000e+00, align 8
@sc = common global double 0.000000e+00, align 8
@.str4 = private unnamed_addr constant [36 x i8] c"     1   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@piprg = common global double 0.000000e+00, align 8
@pierr = common global double 0.000000e+00, align 8
@.str5 = private unnamed_addr constant [36 x i8] c"     2   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str6 = private unnamed_addr constant [36 x i8] c"     3   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str7 = private unnamed_addr constant [36 x i8] c"     4   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str8 = private unnamed_addr constant [36 x i8] c"     5   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str9 = private unnamed_addr constant [36 x i8] c"     6   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str10 = private unnamed_addr constant [36 x i8] c"     7   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str11 = private unnamed_addr constant [36 x i8] c"     8   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"   Iterations      = %10ld\0A\00", align 1
@.str13 = private unnamed_addr constant [30 x i8] c"   NullTime (usec) = %10.4lf\0A\00", align 1
@.str14 = private unnamed_addr constant [30 x i8] c"   MFLOPS(1)       = %10.4lf\0A\00", align 1
@.str15 = private unnamed_addr constant [30 x i8] c"   MFLOPS(2)       = %10.4lf\0A\00", align 1
@.str16 = private unnamed_addr constant [30 x i8] c"   MFLOPS(3)       = %10.4lf\0A\00", align 1
@.str17 = private unnamed_addr constant [31 x i8] c"   MFLOPS(4)       = %10.4lf\0A\0A\00", align 1
@tnow = common global %struct.timeval zeroinitializer, align 8
@sd = common global double 0.000000e+00, align 8
@str = private unnamed_addr constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00"
@str18 = private unnamed_addr constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00"
@str19 = private unnamed_addr constant [35 x i8] c"                            (usec)\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !94
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str, i64 0, i64 0)), !dbg !95
  tail call void @llvm.dbg.value(metadata i64 15625, i64 0, metadata !18, metadata !96), !dbg !97
  store double 6.400000e+01, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !98, !tbaa !99
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !103, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 512000000, i64 0, metadata !19, metadata !96), !dbg !104
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !105, !tbaa !99
  store double 1.000000e+00, double* @one, align 8, !dbg !106, !tbaa !99
  store double 2.000000e+00, double* @two, align 8, !dbg !107, !tbaa !99
  store double 3.000000e+00, double* @three, align 8, !dbg !108, !tbaa !99
  store double 4.000000e+00, double* @four, align 8, !dbg !109, !tbaa !99
  store double 5.000000e+00, double* @five, align 8, !dbg !110, !tbaa !99
  store double 1.000000e+00, double* @scale, align 8, !dbg !111, !tbaa !99
  %puts868 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str18, i64 0, i64 0)), !dbg !112
  %puts869 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str19, i64 0, i64 0)), !dbg !113
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !114, metadata !96) #3, !dbg !116
  %0 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !117, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %0, i64 0, metadata !118, metadata !96) #3, !dbg !119
  %call.i = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !120
  %1 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !121, !tbaa !122
  %conv.i = sitofp i64 %1 to double, !dbg !125
  %2 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !126, !tbaa !127
  %conv1.i = sitofp i64 %2 to double, !dbg !128
  %mul.i = fmul double %conv1.i, 1.000000e-06, !dbg !128
  %add.i = fadd double %conv.i, %mul.i, !dbg !125
  store double %add.i, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !129, !tbaa !99
  %sub.i = fsub double %add.i, %0, !dbg !130
  store double %sub.i, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !131, !tbaa !99
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !132, metadata !96) #3, !dbg !134
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !135, metadata !96) #3, !dbg !136
  %call.i872 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !137
  %3 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !138, !tbaa !122
  %conv.i873 = sitofp i64 %3 to double, !dbg !139
  %4 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !140, !tbaa !127
  %conv1.i874 = sitofp i64 %4 to double, !dbg !141
  %mul.i875 = fmul double %conv1.i874, 1.000000e-06, !dbg !141
  %add.i876 = fadd double %conv.i873, %mul.i875, !dbg !139
  store double %add.i876, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !142, !tbaa !99
  %sub.i877 = fsub double %add.i876, %add.i, !dbg !143
  store double %sub.i877, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !144, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 15625, i64 0, metadata !22, metadata !96), !dbg !145
  store double 0.000000e+00, double* @sa, align 8, !dbg !146, !tbaa !99
  br label %while.cond, !dbg !147

while.cond:                                       ; preds = %for.end, %entry
  %5 = phi double [ %add.i876, %entry ], [ %add.i888, %for.end ]
  %6 = phi double [ 0.000000e+00, %entry ], [ %sub.i889, %for.end ]
  %x.0 = phi double [ undef, %entry ], [ %div8, %for.end ]
  %s.0 = phi double [ undef, %entry ], [ %s.1.lcssa, %for.end ]
  %n.0 = phi i64 [ 15625, %entry ], [ %mul, %for.end ]
  %7 = load double* @TLimit, align 8, !dbg !148, !tbaa !99
  %cmp = fcmp olt double %6, %7, !dbg !149
  br i1 %cmp, label %while.body, label %while.end, !dbg !147

while.body:                                       ; preds = %while.cond
  %mul = shl nsw i64 %n.0, 1, !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !22, metadata !96), !dbg !145
  %8 = load double* @one, align 8, !dbg !152, !tbaa !99
  %conv7 = sitofp i64 %mul to double, !dbg !153
  %div8 = fdiv double %8, %conv7, !dbg !152
  tail call void @llvm.dbg.value(metadata double %div8, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata double %8, i64 0, metadata !16, metadata !96), !dbg !157
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !158, metadata !96) #3, !dbg !160
  tail call void @llvm.dbg.value(metadata double %5, i64 0, metadata !161, metadata !96) #3, !dbg !162
  %call.i878 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !163
  %9 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !164, !tbaa !122
  %conv.i879 = sitofp i64 %9 to double, !dbg !165
  %10 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !166, !tbaa !127
  %conv1.i880 = sitofp i64 %10 to double, !dbg !167
  %mul.i881 = fmul double %conv1.i880, 1.000000e-06, !dbg !167
  %add.i882 = fadd double %conv.i879, %mul.i881, !dbg !165
  store double %add.i882, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !168, !tbaa !99
  %sub.i883 = fsub double %add.i882, %5, !dbg !169
  store double %sub.i883, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !170, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  %sub = add nsw i64 %mul, -1, !dbg !172
  %cmp101042 = icmp slt i64 %mul, 2, !dbg !175
  br i1 %cmp101042, label %for.end, label %for.body.lr.ph, !dbg !176

for.body.lr.ph:                                   ; preds = %while.body
  %11 = load double* @D1, align 8, !dbg !177, !tbaa !99
  %12 = load double* @D2, align 8, !dbg !179, !tbaa !99
  %13 = load double* @D3, align 8, !dbg !180, !tbaa !99
  %14 = load double* @E2, align 8, !dbg !181, !tbaa !99
  %15 = load double* @E3, align 8, !dbg !182, !tbaa !99
  %16 = insertelement <2 x double> undef, double %11, i32 0, !dbg !177
  %17 = insertelement <2 x double> %16, double %8, i32 1, !dbg !177
  %18 = insertelement <2 x double> undef, double %12, i32 0, !dbg !179
  %19 = insertelement <2 x double> %18, double %11, i32 1, !dbg !179
  %20 = insertelement <2 x double> undef, double %13, i32 0, !dbg !183
  br label %for.body, !dbg !176

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.01045 = phi i64 [ 1, %for.body.lr.ph ], [ %inc, %for.body ]
  %s.11044 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add24, %for.body ]
  %v.01043 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add, %for.body ]
  %add = fadd double %8, %v.01043, !dbg !184
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !15, metadata !96), !dbg !156
  %mul12 = fmul double %div8, %add, !dbg !185
  tail call void @llvm.dbg.value(metadata double %mul12, i64 0, metadata !14, metadata !96), !dbg !186
  %mul17 = fmul double %mul12, %15, !dbg !187
  %add18 = fadd double %14, %mul17, !dbg !181
  %21 = insertelement <2 x double> undef, double %mul12, i32 0, !dbg !183
  %22 = insertelement <2 x double> %21, double %mul12, i32 1, !dbg !183
  %23 = insertelement <2 x double> %20, double %add18, i32 1, !dbg !183
  %24 = fmul <2 x double> %22, %23, !dbg !183
  %25 = fadd <2 x double> %19, %24, !dbg !179
  %26 = fmul <2 x double> %25, %22, !dbg !188
  %27 = fadd <2 x double> %17, %26, !dbg !177
  %28 = extractelement <2 x double> %27, i32 0, !dbg !189
  %29 = extractelement <2 x double> %27, i32 1, !dbg !189
  %div23 = fdiv double %28, %29, !dbg !189
  %add24 = fadd double %s.11044, %div23, !dbg !190
  tail call void @llvm.dbg.value(metadata double %add24, i64 0, metadata !13, metadata !96), !dbg !155
  %inc = add nuw nsw i64 %i.01045, 1, !dbg !191
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp10 = icmp slt i64 %i.01045, %sub, !dbg !175
  br i1 %cmp10, label %for.body, label %for.end.loopexit, !dbg !176

for.end.loopexit:                                 ; preds = %for.body
  %add24.lcssa = phi double [ %add24, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.body
  %s.1.lcssa = phi double [ 0.000000e+00, %while.body ], [ %add24.lcssa, %for.end.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !192, metadata !96) #3, !dbg !194
  tail call void @llvm.dbg.value(metadata double %add.i882, i64 0, metadata !195, metadata !96) #3, !dbg !196
  %call.i884 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !197
  %30 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !198, !tbaa !122
  %conv.i885 = sitofp i64 %30 to double, !dbg !199
  %31 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !200, !tbaa !127
  %conv1.i886 = sitofp i64 %31 to double, !dbg !201
  %mul.i887 = fmul double %conv1.i886, 1.000000e-06, !dbg !201
  %add.i888 = fadd double %conv.i885, %mul.i887, !dbg !199
  store double %add.i888, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !202, !tbaa !99
  %sub.i889 = fsub double %add.i888, %add.i882, !dbg !203
  store double %sub.i889, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !204, !tbaa !99
  store double %sub.i889, double* @sa, align 8, !dbg !205, !tbaa !99
  %cmp26 = icmp eq i64 %mul, 512000000, !dbg !206
  br i1 %cmp26, label %while.end, label %while.cond, !dbg !208

while.end:                                        ; preds = %for.end, %while.cond
  %32 = phi double [ %add.i888, %for.end ], [ %5, %while.cond ]
  %x.1 = phi double [ %div8, %for.end ], [ %x.0, %while.cond ]
  %s.2 = phi double [ %s.1.lcssa, %for.end ], [ %s.0, %while.cond ]
  store double 1.589500e-02, double* @scale, align 8, !dbg !209, !tbaa !99
  store double 1.589500e-02, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !210, !tbaa !99
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !211, metadata !96) #3, !dbg !213
  tail call void @llvm.dbg.value(metadata double %32, i64 0, metadata !214, metadata !96) #3, !dbg !215
  %call.i890 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !216
  %33 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !217, !tbaa !122
  %conv.i891 = sitofp i64 %33 to double, !dbg !218
  %34 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !219, !tbaa !127
  %conv1.i892 = sitofp i64 %34 to double, !dbg !220
  %mul.i893 = fmul double %conv1.i892, 1.000000e-06, !dbg !220
  %add.i894 = fadd double %conv.i891, %mul.i893, !dbg !218
  store double %add.i894, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !221, !tbaa !99
  %sub.i895 = fsub double %add.i894, %32, !dbg !222
  store double %sub.i895, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !223, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !224, metadata !96) #3, !dbg !226
  tail call void @llvm.dbg.value(metadata double %add.i894, i64 0, metadata !227, metadata !96) #3, !dbg !228
  %call.i896 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !229
  %35 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !230, !tbaa !122
  %conv.i897 = sitofp i64 %35 to double, !dbg !231
  %36 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !232, !tbaa !127
  %conv1.i898 = sitofp i64 %36 to double, !dbg !233
  %mul.i899 = fmul double %conv1.i898, 1.000000e-06, !dbg !233
  %add.i900 = fadd double %conv.i897, %mul.i899, !dbg !231
  store double %add.i900, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !234, !tbaa !99
  %sub.i901 = fsub double %add.i900, %add.i894, !dbg !235
  store double %sub.i901, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !236, !tbaa !99
  %37 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !237, !tbaa !99
  %mul38 = fmul double %37, %sub.i901, !dbg !237
  %cmp39 = fcmp olt double %mul38, 0.000000e+00, !dbg !238
  %storemerge871 = select i1 %cmp39, double 0.000000e+00, double %mul38, !dbg !240
  store double %storemerge871, double* @nulltime, align 8, !dbg !241, !tbaa !99
  %38 = load double* @sa, align 8, !dbg !242, !tbaa !99
  %mul43 = fmul double %37, %38, !dbg !243
  %sub44 = fsub double %mul43, %storemerge871, !dbg !243
  store double %sub44, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !244, !tbaa !99
  %39 = load double* @D1, align 8, !dbg !245, !tbaa !99
  %40 = load double* @D2, align 8, !dbg !246, !tbaa !99
  %add45 = fadd double %39, %40, !dbg !245
  %41 = load double* @D3, align 8, !dbg !247, !tbaa !99
  %add46 = fadd double %add45, %41, !dbg !245
  %42 = load double* @one, align 8, !dbg !248, !tbaa !99
  %add47 = fadd double %39, %42, !dbg !248
  %43 = load double* @E2, align 8, !dbg !249, !tbaa !99
  %add48 = fadd double %add47, %43, !dbg !248
  %44 = load double* @E3, align 8, !dbg !250, !tbaa !99
  %add49 = fadd double %add48, %44, !dbg !248
  %div50 = fdiv double %add46, %add49, !dbg !251
  %div51 = fdiv double %sub44, 1.400000e+01, !dbg !252
  store double %div51, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 3), align 8, !dbg !253, !tbaa !99
  %add52 = fadd double %div50, %39, !dbg !254
  %45 = load double* @two, align 8, !dbg !255, !tbaa !99
  %mul53 = fmul double %s.2, %45, !dbg !255
  %add54 = fadd double %add52, %mul53, !dbg !254
  %mul55 = fmul double %x.1, %add54, !dbg !256
  %div56 = fdiv double %mul55, %45, !dbg !256
  store double %div56, double* @sa, align 8, !dbg !257, !tbaa !99
  %div57 = fdiv double %42, %div56, !dbg !258
  store double %div57, double* @sb, align 8, !dbg !259, !tbaa !99
  %conv58 = fptosi double %div57 to i64, !dbg !260
  %mul59 = mul nsw i64 %conv58, 40000, !dbg !261
  %conv60 = sitofp i64 %mul59 to double, !dbg !262
  %46 = load double* @scale, align 8, !dbg !263, !tbaa !99
  %div61 = fdiv double %conv60, %46, !dbg !262
  %conv62 = fptosi double %div61 to i64, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %conv62, i64 0, metadata !22, metadata !96), !dbg !145
  %sub63 = fadd double %div57, -2.520000e+01, !dbg !265
  store double %sub63, double* @sc, align 8, !dbg !266, !tbaa !99
  %div64 = fdiv double %42, %div51, !dbg !267
  store double %div64, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 4), align 16, !dbg !268, !tbaa !99
  %mul65 = fmul double %sub63, 1.000000e-30, !dbg !269
  %mul66 = fmul double %sub44, 1.000000e-30, !dbg !270
  %mul67 = fmul double %div64, 1.000000e-30, !dbg !271
  %call68 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %mul65, double %mul66, double %mul67) #3, !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %conv62, i64 0, metadata !21, metadata !96), !dbg !273
  %47 = load double* @five, align 8, !dbg !274, !tbaa !99
  %48 = load double* @one, align 8, !dbg !275, !tbaa !99
  %sub70 = fsub double -0.000000e+00, %48, !dbg !276
  store double %sub70, double* @sa, align 8, !dbg !277, !tbaa !99
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !278, metadata !96) #3, !dbg !280
  %49 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !281, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %49, i64 0, metadata !282, metadata !96) #3, !dbg !283
  %call.i902 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !284
  %50 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !285, !tbaa !122
  %conv.i903 = sitofp i64 %50 to double, !dbg !286
  %51 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !287, !tbaa !127
  %conv1.i904 = sitofp i64 %51 to double, !dbg !288
  %mul.i905 = fmul double %conv1.i904, 1.000000e-06, !dbg !288
  %add.i906 = fadd double %conv.i903, %mul.i905, !dbg !286
  store double %add.i906, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !289, !tbaa !99
  %sub.i907 = fsub double %add.i906, %49, !dbg !290
  store double %sub.i907, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !291, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  %s.31034 = fsub double -0.000000e+00, %47, !dbg !292
  %cmp731035 = icmp slt i64 %conv62, 1, !dbg !293
  br i1 %cmp731035, label %for.end80, label %for.body75.lr.ph, !dbg !296

for.body75.lr.ph:                                 ; preds = %while.end
  %sa.promoted1040 = load double* @sa, align 8, !dbg !297, !tbaa !99
  %xtraiter1051 = and i64 %conv62, 7
  %lcmp.mod1052 = icmp ne i64 %xtraiter1051, 0
  %lcmp.overflow1053 = icmp eq i64 %conv62, 0
  %lcmp.or1054 = or i1 %lcmp.overflow1053, %lcmp.mod1052
  br i1 %lcmp.or1054, label %for.body75.prol, label %for.body75.lr.ph.split

for.body75.prol:                                  ; preds = %for.body75.prol, %for.body75.lr.ph
  %add771041.prol = phi double [ %sa.promoted1040, %for.body75.lr.ph ], [ %add77.prol, %for.body75.prol ], !dbg !299
  %s.31038.prol = phi double [ %s.31034, %for.body75.lr.ph ], [ %s.3.prol, %for.body75.prol ]
  %i.21037.prol = phi i64 [ 1, %for.body75.lr.ph ], [ %inc79.prol, %for.body75.prol ]
  %.pn1036.prol = phi double [ %47, %for.body75.lr.ph ], [ %s.31038.prol, %for.body75.prol ]
  %prol.iter1055 = phi i64 [ %xtraiter1051, %for.body75.lr.ph ], [ %prol.iter1055.sub, %for.body75.prol ]
  %add77.prol = fadd double %.pn1036.prol, %add771041.prol, !dbg !299
  %inc79.prol = add nuw nsw i64 %i.21037.prol, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79.prol, i64 0, metadata !20, metadata !96), !dbg !171
  %s.3.prol = fsub double -0.000000e+00, %s.31038.prol, !dbg !292
  %exitcond1048.prol = icmp eq i64 %i.21037.prol, %conv62, !dbg !296
  %prol.iter1055.sub = sub i64 %prol.iter1055, 1, !dbg !296
  %prol.iter1055.cmp = icmp ne i64 %prol.iter1055.sub, 0, !dbg !296
  br i1 %prol.iter1055.cmp, label %for.body75.prol, label %for.body75.lr.ph.split, !llvm.loop !301

for.body75.lr.ph.split:                           ; preds = %for.body75.prol, %for.body75.lr.ph
  %s.3.lcssa1050.unr = phi double [ 0.000000e+00, %for.body75.lr.ph ], [ %s.3.prol, %for.body75.prol ]
  %add77.lcssa.unr = phi double [ 0.000000e+00, %for.body75.lr.ph ], [ %add77.prol, %for.body75.prol ]
  %add771041.unr = phi double [ %sa.promoted1040, %for.body75.lr.ph ], [ %add77.prol, %for.body75.prol ]
  %s.31038.unr = phi double [ %s.31034, %for.body75.lr.ph ], [ %s.3.prol, %for.body75.prol ]
  %i.21037.unr = phi i64 [ 1, %for.body75.lr.ph ], [ %inc79.prol, %for.body75.prol ]
  %.pn1036.unr = phi double [ %47, %for.body75.lr.ph ], [ %s.31038.prol, %for.body75.prol ]
  %52 = icmp ult i64 %conv62, 8
  br i1 %52, label %for.cond72.for.end80_crit_edge, label %for.body75.lr.ph.split.split

for.body75.lr.ph.split.split:                     ; preds = %for.body75.lr.ph.split
  br label %for.body75, !dbg !296

for.body75:                                       ; preds = %for.body75, %for.body75.lr.ph.split.split
  %add771041 = phi double [ %add771041.unr, %for.body75.lr.ph.split.split ], [ %add77.7, %for.body75 ], !dbg !299
  %i.21037 = phi i64 [ %i.21037.unr, %for.body75.lr.ph.split.split ], [ %inc79.7, %for.body75 ]
  %.pn1036 = phi double [ %.pn1036.unr, %for.body75.lr.ph.split.split ], [ %s.3.6, %for.body75 ]
  %add77 = fadd double %.pn1036, %add771041, !dbg !299
  %inc79 = add nuw nsw i64 %i.21037, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %s.3 = fsub double -0.000000e+00, %s.31038.unr, !dbg !292
  %add77.1 = fadd double %s.31038.unr, %add77, !dbg !299
  %inc79.1 = add nuw nsw i64 %inc79, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %add77.2 = fadd double %s.3, %add77.1, !dbg !299
  %inc79.2 = add nuw nsw i64 %inc79.1, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %s.3.2 = fsub double -0.000000e+00, %s.31038.unr, !dbg !292
  %add77.3 = fadd double %s.31038.unr, %add77.2, !dbg !299
  %inc79.3 = add nuw nsw i64 %inc79.2, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %add77.4 = fadd double %s.3.2, %add77.3, !dbg !299
  %inc79.4 = add nuw nsw i64 %inc79.3, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %s.3.4 = fsub double -0.000000e+00, %s.31038.unr, !dbg !292
  %add77.5 = fadd double %s.31038.unr, %add77.4, !dbg !299
  %inc79.5 = add nuw nsw i64 %inc79.4, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %add77.6 = fadd double %s.3.4, %add77.5, !dbg !299
  %inc79.6 = add nuw nsw i64 %inc79.5, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %s.3.6 = fsub double -0.000000e+00, %s.31038.unr, !dbg !292
  %add77.7 = fadd double %s.31038.unr, %add77.6, !dbg !299
  %inc79.7 = add nuw nsw i64 %inc79.6, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc79, i64 0, metadata !20, metadata !96), !dbg !171
  %exitcond1048.7 = icmp eq i64 %inc79.6, %conv62, !dbg !296
  br i1 %exitcond1048.7, label %for.cond72.for.end80_crit_edge.unr-lcssa, label %for.body75, !dbg !296

for.cond72.for.end80_crit_edge.unr-lcssa:         ; preds = %for.body75
  %s.3.lcssa1050.ph = phi double [ %s.31038.unr, %for.body75 ]
  %add77.lcssa.ph = phi double [ %add77.7, %for.body75 ]
  br label %for.cond72.for.end80_crit_edge

for.cond72.for.end80_crit_edge:                   ; preds = %for.body75.lr.ph.split, %for.cond72.for.end80_crit_edge.unr-lcssa
  %s.3.lcssa1050 = phi double [ %s.3.lcssa1050.unr, %for.body75.lr.ph.split ], [ %s.3.lcssa1050.ph, %for.cond72.for.end80_crit_edge.unr-lcssa ]
  %add77.lcssa = phi double [ %add77.lcssa.unr, %for.body75.lr.ph.split ], [ %add77.lcssa.ph, %for.cond72.for.end80_crit_edge.unr-lcssa ]
  store double %add77.lcssa, double* @sa, align 8, !dbg !297, !tbaa !99
  br label %for.end80, !dbg !296

for.end80:                                        ; preds = %for.cond72.for.end80_crit_edge, %while.end
  %s.3.lcssa = phi double [ %s.3.lcssa1050, %for.cond72.for.end80_crit_edge ], [ %s.31034, %while.end ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !303, metadata !96) #3, !dbg !305
  tail call void @llvm.dbg.value(metadata double %add.i906, i64 0, metadata !306, metadata !96) #3, !dbg !307
  %call.i908 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !308
  %53 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !309, !tbaa !122
  %conv.i909 = sitofp i64 %53 to double, !dbg !310
  %54 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !311, !tbaa !127
  %conv1.i910 = sitofp i64 %54 to double, !dbg !312
  %mul.i911 = fmul double %conv1.i910, 1.000000e-06, !dbg !312
  %add.i912 = fadd double %conv.i909, %mul.i911, !dbg !310
  store double %add.i912, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !313, !tbaa !99
  %sub.i913 = fsub double %add.i912, %add.i906, !dbg !314
  store double %sub.i913, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !315, !tbaa !99
  %55 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !316, !tbaa !99
  %mul82 = fmul double %55, %sub.i913, !dbg !316
  %cmp83 = fcmp olt double %mul82, 0.000000e+00, !dbg !317
  %storemerge = select i1 %cmp83, double 0.000000e+00, double %mul82, !dbg !319
  store double %storemerge, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !320, !tbaa !99
  %conv87 = sitofp i64 %conv62 to double, !dbg !321
  store double %conv87, double* @sc, align 8, !dbg !322, !tbaa !99
  %56 = load double* @sa, align 8, !dbg !323, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %56, i64 0, metadata !14, metadata !96), !dbg !186
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !16, metadata !96), !dbg !157
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !324, metadata !96) #3, !dbg !326
  tail call void @llvm.dbg.value(metadata double %add.i912, i64 0, metadata !327, metadata !96) #3, !dbg !328
  %call.i914 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !329
  %57 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !330, !tbaa !122
  %conv.i915 = sitofp i64 %57 to double, !dbg !331
  %58 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !332, !tbaa !127
  %conv1.i916 = sitofp i64 %58 to double, !dbg !333
  %mul.i917 = fmul double %conv1.i916, 1.000000e-06, !dbg !333
  %add.i918 = fadd double %conv.i915, %mul.i917, !dbg !331
  store double %add.i918, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !334, !tbaa !99
  %sub.i919 = fsub double %add.i918, %add.i912, !dbg !335
  store double %sub.i919, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !336, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  br i1 %cmp731035, label %for.end104, label %for.body92.lr.ph, !dbg !337

for.body92.lr.ph:                                 ; preds = %for.end80
  %59 = load double* @two, align 8, !dbg !339, !tbaa !99
  %sa.promoted = load double* @sa, align 8, !dbg !342, !tbaa !99
  %xtraiter = and i64 %conv62, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %conv62, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body92.prol, label %for.body92.lr.ph.split

for.body92.prol:                                  ; preds = %for.body92.prol, %for.body92.lr.ph
  %add941033.prol = phi double [ %sa.promoted, %for.body92.lr.ph ], [ %add94.prol, %for.body92.prol ], !dbg !343
  %i.31029.prol = phi i64 [ 1, %for.body92.lr.ph ], [ %inc103.prol, %for.body92.prol ]
  %s.41028.prol = phi double [ %s.3.lcssa, %for.body92.lr.ph ], [ %sub93.prol, %for.body92.prol ]
  %u.01027.prol = phi double [ %56, %for.body92.lr.ph ], [ %add95.prol, %for.body92.prol ]
  %x.21026.prol = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add97.prol, %for.body92.prol ]
  %w.01025.prol = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add101.prol, %for.body92.prol ]
  %v.11024.prol = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %sub99.prol, %for.body92.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body92.lr.ph ], [ %prol.iter.sub, %for.body92.prol ]
  %sub93.prol = fsub double -0.000000e+00, %s.41028.prol, !dbg !343
  tail call void @llvm.dbg.value(metadata double %sub93.prol, i64 0, metadata !13, metadata !96), !dbg !155
  %add94.prol = fsub double %add941033.prol, %s.41028.prol, !dbg !344
  %add95.prol = fadd double %u.01027.prol, %59, !dbg !345
  tail call void @llvm.dbg.value(metadata double %add95.prol, i64 0, metadata !14, metadata !96), !dbg !186
  %sub96.prol = fsub double %sub93.prol, %add95.prol, !dbg !346
  %add97.prol = fadd double %x.21026.prol, %sub96.prol, !dbg !347
  tail call void @llvm.dbg.value(metadata double %add97.prol, i64 0, metadata !17, metadata !96), !dbg !154
  %mul98.prol = fmul double %add95.prol, %sub93.prol, !dbg !348
  %sub99.prol = fsub double %v.11024.prol, %mul98.prol, !dbg !349
  tail call void @llvm.dbg.value(metadata double %sub99.prol, i64 0, metadata !15, metadata !96), !dbg !156
  %div100.prol = fdiv double %sub93.prol, %add95.prol, !dbg !350
  %add101.prol = fadd double %w.01025.prol, %div100.prol, !dbg !351
  tail call void @llvm.dbg.value(metadata double %add101.prol, i64 0, metadata !16, metadata !96), !dbg !157
  %inc103.prol = add nuw nsw i64 %i.31029.prol, 1, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 %inc103.prol, i64 0, metadata !20, metadata !96), !dbg !171
  %exitcond.prol = icmp eq i64 %i.31029.prol, %conv62, !dbg !337
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !337
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !337
  br i1 %prol.iter.cmp, label %for.body92.prol, label %for.body92.lr.ph.split, !llvm.loop !353

for.body92.lr.ph.split:                           ; preds = %for.body92.prol, %for.body92.lr.ph
  %add101.lcssa.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add101.prol, %for.body92.prol ]
  %sub99.lcssa.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %sub99.prol, %for.body92.prol ]
  %add97.lcssa.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add97.prol, %for.body92.prol ]
  %add94.lcssa.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add94.prol, %for.body92.prol ]
  %add941033.unr = phi double [ %sa.promoted, %for.body92.lr.ph ], [ %add94.prol, %for.body92.prol ]
  %i.31029.unr = phi i64 [ 1, %for.body92.lr.ph ], [ %inc103.prol, %for.body92.prol ]
  %s.41028.unr = phi double [ %s.3.lcssa, %for.body92.lr.ph ], [ %sub93.prol, %for.body92.prol ]
  %u.01027.unr = phi double [ %56, %for.body92.lr.ph ], [ %add95.prol, %for.body92.prol ]
  %x.21026.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add97.prol, %for.body92.prol ]
  %w.01025.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %add101.prol, %for.body92.prol ]
  %v.11024.unr = phi double [ 0.000000e+00, %for.body92.lr.ph ], [ %sub99.prol, %for.body92.prol ]
  %60 = icmp ult i64 %conv62, 2
  br i1 %60, label %for.cond89.for.end104_crit_edge, label %for.body92.lr.ph.split.split

for.body92.lr.ph.split.split:                     ; preds = %for.body92.lr.ph.split
  br label %for.body92, !dbg !337

for.body92:                                       ; preds = %for.body92, %for.body92.lr.ph.split.split
  %add941033 = phi double [ %add941033.unr, %for.body92.lr.ph.split.split ], [ %add94.1, %for.body92 ], !dbg !343
  %i.31029 = phi i64 [ %i.31029.unr, %for.body92.lr.ph.split.split ], [ %inc103.1, %for.body92 ]
  %u.01027 = phi double [ %u.01027.unr, %for.body92.lr.ph.split.split ], [ %add95.1, %for.body92 ]
  %x.21026 = phi double [ %x.21026.unr, %for.body92.lr.ph.split.split ], [ %add97.1, %for.body92 ]
  %w.01025 = phi double [ %w.01025.unr, %for.body92.lr.ph.split.split ], [ %add101.1, %for.body92 ]
  %v.11024 = phi double [ %v.11024.unr, %for.body92.lr.ph.split.split ], [ %sub99.1, %for.body92 ]
  %sub93 = fsub double -0.000000e+00, %s.41028.unr, !dbg !343
  tail call void @llvm.dbg.value(metadata double %sub93, i64 0, metadata !13, metadata !96), !dbg !155
  %add94 = fsub double %add941033, %s.41028.unr, !dbg !344
  %add95 = fadd double %u.01027, %59, !dbg !345
  tail call void @llvm.dbg.value(metadata double %add95, i64 0, metadata !14, metadata !96), !dbg !186
  %sub96 = fsub double %sub93, %add95, !dbg !346
  %add97 = fadd double %x.21026, %sub96, !dbg !347
  tail call void @llvm.dbg.value(metadata double %add97, i64 0, metadata !17, metadata !96), !dbg !154
  %mul98 = fmul double %add95, %sub93, !dbg !348
  %sub99 = fsub double %v.11024, %mul98, !dbg !349
  tail call void @llvm.dbg.value(metadata double %sub99, i64 0, metadata !15, metadata !96), !dbg !156
  %div100 = fdiv double %sub93, %add95, !dbg !350
  %add101 = fadd double %w.01025, %div100, !dbg !351
  tail call void @llvm.dbg.value(metadata double %add101, i64 0, metadata !16, metadata !96), !dbg !157
  %inc103 = add nuw nsw i64 %i.31029, 1, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 %inc103, i64 0, metadata !20, metadata !96), !dbg !171
  tail call void @llvm.dbg.value(metadata double %sub93, i64 0, metadata !13, metadata !96), !dbg !155
  %add94.1 = fsub double %add94, %sub93, !dbg !344
  %add95.1 = fadd double %add95, %59, !dbg !345
  tail call void @llvm.dbg.value(metadata double %add95, i64 0, metadata !14, metadata !96), !dbg !186
  %sub96.1 = fsub double %s.41028.unr, %add95.1, !dbg !346
  %add97.1 = fadd double %add97, %sub96.1, !dbg !347
  tail call void @llvm.dbg.value(metadata double %add97, i64 0, metadata !17, metadata !96), !dbg !154
  %mul98.1 = fmul double %add95.1, %s.41028.unr, !dbg !348
  %sub99.1 = fsub double %sub99, %mul98.1, !dbg !349
  tail call void @llvm.dbg.value(metadata double %sub99, i64 0, metadata !15, metadata !96), !dbg !156
  %div100.1 = fdiv double %s.41028.unr, %add95.1, !dbg !350
  %add101.1 = fadd double %add101, %div100.1, !dbg !351
  tail call void @llvm.dbg.value(metadata double %add101, i64 0, metadata !16, metadata !96), !dbg !157
  %inc103.1 = add nuw nsw i64 %inc103, 1, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 %inc103, i64 0, metadata !20, metadata !96), !dbg !171
  %exitcond.1 = icmp eq i64 %inc103, %conv62, !dbg !337
  br i1 %exitcond.1, label %for.cond89.for.end104_crit_edge.unr-lcssa, label %for.body92, !dbg !337

for.cond89.for.end104_crit_edge.unr-lcssa:        ; preds = %for.body92
  %add101.lcssa.ph = phi double [ %add101.1, %for.body92 ]
  %sub99.lcssa.ph = phi double [ %sub99.1, %for.body92 ]
  %add97.lcssa.ph = phi double [ %add97.1, %for.body92 ]
  %add94.lcssa.ph = phi double [ %add94.1, %for.body92 ]
  br label %for.cond89.for.end104_crit_edge

for.cond89.for.end104_crit_edge:                  ; preds = %for.body92.lr.ph.split, %for.cond89.for.end104_crit_edge.unr-lcssa
  %add101.lcssa = phi double [ %add101.lcssa.unr, %for.body92.lr.ph.split ], [ %add101.lcssa.ph, %for.cond89.for.end104_crit_edge.unr-lcssa ]
  %sub99.lcssa = phi double [ %sub99.lcssa.unr, %for.body92.lr.ph.split ], [ %sub99.lcssa.ph, %for.cond89.for.end104_crit_edge.unr-lcssa ]
  %add97.lcssa = phi double [ %add97.lcssa.unr, %for.body92.lr.ph.split ], [ %add97.lcssa.ph, %for.cond89.for.end104_crit_edge.unr-lcssa ]
  %add94.lcssa = phi double [ %add94.lcssa.unr, %for.body92.lr.ph.split ], [ %add94.lcssa.ph, %for.cond89.for.end104_crit_edge.unr-lcssa ]
  store double %add94.lcssa, double* @sa, align 8, !dbg !342, !tbaa !99
  br label %for.end104, !dbg !337

for.end104:                                       ; preds = %for.cond89.for.end104_crit_edge, %for.end80
  %x.2.lcssa = phi double [ %add97.lcssa, %for.cond89.for.end104_crit_edge ], [ 0.000000e+00, %for.end80 ]
  %w.0.lcssa = phi double [ %add101.lcssa, %for.cond89.for.end104_crit_edge ], [ 0.000000e+00, %for.end80 ]
  %v.1.lcssa = phi double [ %sub99.lcssa, %for.cond89.for.end104_crit_edge ], [ 0.000000e+00, %for.end80 ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !354, metadata !96) #3, !dbg !356
  tail call void @llvm.dbg.value(metadata double %add.i918, i64 0, metadata !357, metadata !96) #3, !dbg !358
  %call.i920 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !359
  %61 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !360, !tbaa !122
  %conv.i921 = sitofp i64 %61 to double, !dbg !361
  %62 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !362, !tbaa !127
  %conv1.i922 = sitofp i64 %62 to double, !dbg !363
  %mul.i923 = fmul double %conv1.i922, 1.000000e-06, !dbg !363
  %add.i924 = fadd double %conv.i921, %mul.i923, !dbg !361
  store double %add.i924, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !364, !tbaa !99
  %sub.i925 = fsub double %add.i924, %add.i918, !dbg !365
  store double %sub.i925, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !366, !tbaa !99
  %63 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !367, !tbaa !99
  %mul106 = fmul double %63, %sub.i925, !dbg !367
  store double %mul106, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !368, !tbaa !99
  %64 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !369, !tbaa !99
  %sub107 = fsub double %mul106, %64, !dbg !370
  %div108 = fdiv double %sub107, 7.000000e+00, !dbg !371
  store double %div108, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 7), align 8, !dbg !372, !tbaa !99
  %65 = load double* @sa, align 8, !dbg !373, !tbaa !99
  %mul109 = fmul double %x.2.lcssa, %65, !dbg !373
  %66 = load double* @sc, align 8, !dbg !374, !tbaa !99
  %div110 = fdiv double %mul109, %66, !dbg !373
  %conv111 = fptosi double %div110 to i64, !dbg !375
  tail call void @llvm.dbg.value(metadata i64 %conv111, i64 0, metadata !21, metadata !96), !dbg !273
  %67 = load double* @four, align 8, !dbg !376, !tbaa !99
  %mul112 = fmul double %w.0.lcssa, %67, !dbg !376
  %68 = load double* @five, align 8, !dbg !377, !tbaa !99
  %div113 = fdiv double %mul112, %68, !dbg !376
  store double %div113, double* @sa, align 8, !dbg !378, !tbaa !99
  %div114 = fdiv double %68, %v.1.lcssa, !dbg !379
  %add115 = fadd double %div113, %div114, !dbg !380
  store double %add115, double* @sb, align 8, !dbg !381, !tbaa !99
  store double 3.125000e+01, double* @sc, align 8, !dbg !382, !tbaa !99
  %mul116 = fmul double %v.1.lcssa, %v.1.lcssa, !dbg !383
  %mul117 = fmul double %v.1.lcssa, %mul116, !dbg !383
  %div118 = fdiv double 3.125000e+01, %mul117, !dbg !384
  %sub119 = fsub double %add115, %div118, !dbg !385
  store double %sub119, double* @piprg, align 8, !dbg !386, !tbaa !99
  %69 = load double* @piref, align 8, !dbg !387, !tbaa !99
  %sub120 = fsub double %sub119, %69, !dbg !388
  store double %sub120, double* @pierr, align 8, !dbg !389, !tbaa !99
  %70 = load double* @one, align 8, !dbg !390, !tbaa !99
  %div121 = fdiv double %70, %div108, !dbg !390
  store double %div121, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 8), align 16, !dbg !391, !tbaa !99
  %mul122 = fmul double %sub120, 1.000000e-30, !dbg !392
  %mul124 = fmul double %sub107, 1.000000e-30, !dbg !393
  %mul125 = fmul double %div121, 1.000000e-30, !dbg !394
  %call126 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), double %mul122, double %mul124, double %mul125) #3, !dbg !395
  %71 = load double* @piref, align 8, !dbg !396, !tbaa !99
  %72 = load double* @three, align 8, !dbg !397, !tbaa !99
  %conv127 = sitofp i64 %conv111 to double, !dbg !398
  %mul128 = fmul double %conv127, %72, !dbg !397
  %div129 = fdiv double %71, %mul128, !dbg !396
  tail call void @llvm.dbg.value(metadata double %div129, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !399, metadata !96) #3, !dbg !401
  %73 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !402, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %73, i64 0, metadata !403, metadata !96) #3, !dbg !404
  %call.i926 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !405
  %74 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !406, !tbaa !122
  %conv.i927 = sitofp i64 %74 to double, !dbg !407
  %75 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !408, !tbaa !127
  %conv1.i928 = sitofp i64 %75 to double, !dbg !409
  %mul.i929 = fmul double %conv1.i928, 1.000000e-06, !dbg !409
  %add.i930 = fadd double %conv.i927, %mul.i929, !dbg !407
  store double %add.i930, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !410, !tbaa !99
  %sub.i931 = fsub double %add.i930, %73, !dbg !411
  store double %sub.i931, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !412, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  %sub132 = add nsw i64 %conv111, -1, !dbg !413
  %cmp1331017 = icmp slt i64 %conv111, 2, !dbg !416
  br i1 %cmp1331017, label %for.end155, label %for.body135.lr.ph, !dbg !417

for.body135.lr.ph:                                ; preds = %for.end104
  %76 = load double* @one, align 8, !dbg !418, !tbaa !99
  %77 = load double* @A6, align 8, !dbg !420, !tbaa !99
  %78 = load double* @A5, align 8, !dbg !421, !tbaa !99
  %79 = load double* @A4, align 8, !dbg !422, !tbaa !99
  %80 = load double* @A3, align 8, !dbg !423, !tbaa !99
  %81 = load double* @A2, align 8, !dbg !424, !tbaa !99
  %82 = load double* @A1, align 8, !dbg !425, !tbaa !99
  br label %for.body135, !dbg !417

for.body135:                                      ; preds = %for.body135, %for.body135.lr.ph
  %i.41020 = phi i64 [ 1, %for.body135.lr.ph ], [ %inc154, %for.body135 ]
  %s.51019 = phi double [ 0.000000e+00, %for.body135.lr.ph ], [ %add152, %for.body135 ]
  %v.21018 = phi double [ 0.000000e+00, %for.body135.lr.ph ], [ %add136, %for.body135 ]
  %add136 = fadd double %v.21018, %76, !dbg !426
  tail call void @llvm.dbg.value(metadata double %add136, i64 0, metadata !15, metadata !96), !dbg !156
  %mul137 = fmul double %div129, %add136, !dbg !427
  tail call void @llvm.dbg.value(metadata double %mul137, i64 0, metadata !14, metadata !96), !dbg !186
  %mul138 = fmul double %mul137, %mul137, !dbg !428
  tail call void @llvm.dbg.value(metadata double %mul138, i64 0, metadata !16, metadata !96), !dbg !157
  %mul139 = fmul double %77, %mul138, !dbg !420
  %sub140 = fsub double %mul139, %78, !dbg !420
  %mul141 = fmul double %mul138, %sub140, !dbg !429
  %add142 = fadd double %79, %mul141, !dbg !429
  %mul143 = fmul double %mul138, %add142, !dbg !430
  %sub144 = fsub double %mul143, %80, !dbg !430
  %mul145 = fmul double %mul138, %sub144, !dbg !431
  %add146 = fadd double %81, %mul145, !dbg !431
  %mul147 = fmul double %mul138, %add146, !dbg !432
  %add148 = fadd double %82, %mul147, !dbg !432
  %mul149 = fmul double %mul138, %add148, !dbg !433
  %add150 = fadd double %76, %mul149, !dbg !433
  %mul151 = fmul double %mul137, %add150, !dbg !434
  %add152 = fadd double %s.51019, %mul151, !dbg !435
  tail call void @llvm.dbg.value(metadata double %add152, i64 0, metadata !13, metadata !96), !dbg !155
  %inc154 = add nuw nsw i64 %i.41020, 1, !dbg !436
  tail call void @llvm.dbg.value(metadata i64 %inc154, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp133 = icmp slt i64 %i.41020, %sub132, !dbg !416
  br i1 %cmp133, label %for.body135, label %for.end155.loopexit, !dbg !417

for.end155.loopexit:                              ; preds = %for.body135
  %add152.lcssa = phi double [ %add152, %for.body135 ]
  br label %for.end155

for.end155:                                       ; preds = %for.end155.loopexit, %for.end104
  %s.5.lcssa = phi double [ 0.000000e+00, %for.end104 ], [ %add152.lcssa, %for.end155.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !437, metadata !96) #3, !dbg !439
  tail call void @llvm.dbg.value(metadata double %add.i930, i64 0, metadata !440, metadata !96) #3, !dbg !441
  %call.i932 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !442
  %83 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !443, !tbaa !122
  %conv.i933 = sitofp i64 %83 to double, !dbg !444
  %84 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !445, !tbaa !127
  %conv1.i934 = sitofp i64 %84 to double, !dbg !446
  %mul.i935 = fmul double %conv1.i934, 1.000000e-06, !dbg !446
  %add.i936 = fadd double %conv.i933, %mul.i935, !dbg !444
  store double %add.i936, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !447, !tbaa !99
  %sub.i937 = fsub double %add.i936, %add.i930, !dbg !448
  store double %sub.i937, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !449, !tbaa !99
  %85 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !450, !tbaa !99
  %mul157 = fmul double %85, %sub.i937, !dbg !450
  %86 = load double* @nulltime, align 8, !dbg !451, !tbaa !99
  %sub158 = fsub double %mul157, %86, !dbg !450
  store double %sub158, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !452, !tbaa !99
  %87 = load double* @piref, align 8, !dbg !453, !tbaa !99
  %88 = load double* @three, align 8, !dbg !454, !tbaa !99
  %div159 = fdiv double %87, %88, !dbg !453
  tail call void @llvm.dbg.value(metadata double %div159, i64 0, metadata !14, metadata !96), !dbg !186
  %mul160 = fmul double %div159, %div159, !dbg !455
  tail call void @llvm.dbg.value(metadata double %mul160, i64 0, metadata !16, metadata !96), !dbg !157
  %89 = load double* @A6, align 8, !dbg !456, !tbaa !99
  %mul161 = fmul double %89, %mul160, !dbg !456
  %90 = load double* @A5, align 8, !dbg !457, !tbaa !99
  %sub162 = fsub double %mul161, %90, !dbg !456
  %mul163 = fmul double %mul160, %sub162, !dbg !458
  %91 = load double* @A4, align 8, !dbg !459, !tbaa !99
  %add164 = fadd double %91, %mul163, !dbg !458
  %mul165 = fmul double %mul160, %add164, !dbg !460
  %92 = load double* @A3, align 8, !dbg !461, !tbaa !99
  %sub166 = fsub double %mul165, %92, !dbg !460
  %mul167 = fmul double %mul160, %sub166, !dbg !462
  %93 = load double* @A2, align 8, !dbg !463, !tbaa !99
  %add168 = fadd double %93, %mul167, !dbg !462
  %mul169 = fmul double %mul160, %add168, !dbg !464
  %94 = load double* @A1, align 8, !dbg !465, !tbaa !99
  %add170 = fadd double %94, %mul169, !dbg !464
  %mul171 = fmul double %mul160, %add170, !dbg !466
  %95 = load double* @one, align 8, !dbg !467, !tbaa !99
  %add172 = fadd double %95, %mul171, !dbg !466
  %mul173 = fmul double %div159, %add172, !dbg !468
  %div174 = fdiv double %sub158, 1.700000e+01, !dbg !469
  store double %div174, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 10), align 16, !dbg !470, !tbaa !99
  %96 = load double* @two, align 8, !dbg !471, !tbaa !99
  %mul175 = fmul double %s.5.lcssa, %96, !dbg !471
  %add176 = fadd double %mul173, %mul175, !dbg !472
  %mul177 = fmul double %div129, %add176, !dbg !473
  %div178 = fdiv double %mul177, %96, !dbg !473
  store double %div178, double* @sa, align 8, !dbg !474, !tbaa !99
  store double 5.000000e-01, double* @sb, align 8, !dbg !475, !tbaa !99
  %sub179 = fadd double %div178, -5.000000e-01, !dbg !476
  store double %sub179, double* @sc, align 8, !dbg !477, !tbaa !99
  %div180 = fdiv double %95, %div174, !dbg !478
  store double %div180, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 11), align 8, !dbg !479, !tbaa !99
  %mul181 = fmul double %sub179, 1.000000e-30, !dbg !480
  %mul182 = fmul double %sub158, 1.000000e-30, !dbg !481
  %mul183 = fmul double %div180, 1.000000e-30, !dbg !482
  %call184 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str6, i64 0, i64 0), double %mul181, double %mul182, double %mul183) #3, !dbg !483
  %97 = load double* @A3, align 8, !dbg !484, !tbaa !99
  %sub185 = fsub double -0.000000e+00, %97, !dbg !485
  store double %sub185, double* @A3, align 8, !dbg !486, !tbaa !99
  %98 = load double* @A5, align 8, !dbg !487, !tbaa !99
  %sub186 = fsub double -0.000000e+00, %98, !dbg !488
  store double %sub186, double* @A5, align 8, !dbg !489, !tbaa !99
  %99 = load double* @piref, align 8, !dbg !490, !tbaa !99
  %100 = load double* @three, align 8, !dbg !491, !tbaa !99
  %mul188 = fmul double %conv127, %100, !dbg !491
  %div189 = fdiv double %99, %mul188, !dbg !490
  tail call void @llvm.dbg.value(metadata double %div189, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !492, metadata !96) #3, !dbg !494
  %101 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !495, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %101, i64 0, metadata !496, metadata !96) #3, !dbg !497
  %call.i938 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !498
  %102 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !499, !tbaa !122
  %conv.i939 = sitofp i64 %102 to double, !dbg !500
  %103 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !501, !tbaa !127
  %conv1.i940 = sitofp i64 %103 to double, !dbg !502
  %mul.i941 = fmul double %conv1.i940, 1.000000e-06, !dbg !502
  %add.i942 = fadd double %conv.i939, %mul.i941, !dbg !500
  store double %add.i942, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !503, !tbaa !99
  %sub.i943 = fsub double %add.i942, %101, !dbg !504
  store double %sub.i943, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !505, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  br i1 %cmp1331017, label %for.end214, label %for.body195.lr.ph, !dbg !506

for.body195.lr.ph:                                ; preds = %for.end155
  %104 = load double* @B6, align 8, !dbg !508, !tbaa !99
  %105 = load double* @B5, align 8, !dbg !511, !tbaa !99
  %106 = load double* @B4, align 8, !dbg !512, !tbaa !99
  %107 = load double* @B3, align 8, !dbg !513, !tbaa !99
  %108 = load double* @B2, align 8, !dbg !514, !tbaa !99
  %109 = load double* @B1, align 8, !dbg !515, !tbaa !99
  %110 = load double* @one, align 8, !dbg !516, !tbaa !99
  br label %for.body195, !dbg !506

for.body195:                                      ; preds = %for.body195, %for.body195.lr.ph
  %i.51015 = phi i64 [ 1, %for.body195.lr.ph ], [ %inc213, %for.body195 ]
  %s.61014 = phi double [ 0.000000e+00, %for.body195.lr.ph ], [ %add211, %for.body195 ]
  %conv196 = sitofp i64 %i.51015 to double, !dbg !517
  %mul197 = fmul double %div189, %conv196, !dbg !517
  tail call void @llvm.dbg.value(metadata double %mul197, i64 0, metadata !14, metadata !96), !dbg !186
  %mul198 = fmul double %mul197, %mul197, !dbg !518
  tail call void @llvm.dbg.value(metadata double %mul198, i64 0, metadata !16, metadata !96), !dbg !157
  %mul199 = fmul double %mul198, %104, !dbg !508
  %add200 = fadd double %mul199, %105, !dbg !508
  %mul201 = fmul double %mul198, %add200, !dbg !519
  %add202 = fadd double %106, %mul201, !dbg !519
  %mul203 = fmul double %mul198, %add202, !dbg !520
  %add204 = fadd double %107, %mul203, !dbg !520
  %mul205 = fmul double %mul198, %add204, !dbg !521
  %add206 = fadd double %108, %mul205, !dbg !521
  %mul207 = fmul double %mul198, %add206, !dbg !522
  %add208 = fadd double %109, %mul207, !dbg !522
  %mul209 = fmul double %mul198, %add208, !dbg !523
  %add210 = fadd double %s.61014, %mul209, !dbg !524
  %add211 = fadd double %110, %add210, !dbg !524
  tail call void @llvm.dbg.value(metadata double %add211, i64 0, metadata !13, metadata !96), !dbg !155
  %inc213 = add nuw nsw i64 %i.51015, 1, !dbg !525
  tail call void @llvm.dbg.value(metadata i64 %inc213, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp193 = icmp slt i64 %i.51015, %sub132, !dbg !526
  br i1 %cmp193, label %for.body195, label %for.end214.loopexit, !dbg !506

for.end214.loopexit:                              ; preds = %for.body195
  %add211.lcssa = phi double [ %add211, %for.body195 ]
  br label %for.end214

for.end214:                                       ; preds = %for.end214.loopexit, %for.end155
  %s.6.lcssa = phi double [ 0.000000e+00, %for.end155 ], [ %add211.lcssa, %for.end214.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !527, metadata !96) #3, !dbg !529
  tail call void @llvm.dbg.value(metadata double %add.i942, i64 0, metadata !530, metadata !96) #3, !dbg !531
  %call.i944 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !532
  %111 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !533, !tbaa !122
  %conv.i945 = sitofp i64 %111 to double, !dbg !534
  %112 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !535, !tbaa !127
  %conv1.i946 = sitofp i64 %112 to double, !dbg !536
  %mul.i947 = fmul double %conv1.i946, 1.000000e-06, !dbg !536
  %add.i948 = fadd double %conv.i945, %mul.i947, !dbg !534
  store double %add.i948, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !537, !tbaa !99
  %sub.i949 = fsub double %add.i948, %add.i942, !dbg !538
  store double %sub.i949, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !539, !tbaa !99
  %113 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !540, !tbaa !99
  %mul216 = fmul double %113, %sub.i949, !dbg !540
  %114 = load double* @nulltime, align 8, !dbg !541, !tbaa !99
  %sub217 = fsub double %mul216, %114, !dbg !540
  store double %sub217, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !542, !tbaa !99
  %115 = load double* @piref, align 8, !dbg !543, !tbaa !99
  %116 = load double* @three, align 8, !dbg !544, !tbaa !99
  %div218 = fdiv double %115, %116, !dbg !543
  tail call void @llvm.dbg.value(metadata double %div218, i64 0, metadata !14, metadata !96), !dbg !186
  %mul219 = fmul double %div218, %div218, !dbg !545
  tail call void @llvm.dbg.value(metadata double %mul219, i64 0, metadata !16, metadata !96), !dbg !157
  %117 = load double* @B6, align 8, !dbg !546, !tbaa !99
  %mul220 = fmul double %117, %mul219, !dbg !546
  %118 = load double* @B5, align 8, !dbg !547, !tbaa !99
  %add221 = fadd double %mul220, %118, !dbg !546
  %mul222 = fmul double %mul219, %add221, !dbg !548
  %119 = load double* @B4, align 8, !dbg !549, !tbaa !99
  %add223 = fadd double %119, %mul222, !dbg !548
  %mul224 = fmul double %mul219, %add223, !dbg !550
  %120 = load double* @B3, align 8, !dbg !551, !tbaa !99
  %add225 = fadd double %120, %mul224, !dbg !550
  %mul226 = fmul double %mul219, %add225, !dbg !552
  %121 = load double* @B2, align 8, !dbg !553, !tbaa !99
  %add227 = fadd double %121, %mul226, !dbg !552
  %mul228 = fmul double %mul219, %add227, !dbg !554
  %122 = load double* @B1, align 8, !dbg !555, !tbaa !99
  %add229 = fadd double %122, %mul228, !dbg !554
  %mul230 = fmul double %mul219, %add229, !dbg !556
  %123 = load double* @one, align 8, !dbg !557, !tbaa !99
  %add231 = fadd double %123, %mul230, !dbg !556
  %div232 = fdiv double %sub217, 1.500000e+01, !dbg !558
  store double %div232, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 13), align 8, !dbg !559, !tbaa !99
  %add233 = fadd double %add231, %123, !dbg !560
  %124 = load double* @two, align 8, !dbg !561, !tbaa !99
  %mul234 = fmul double %s.6.lcssa, %124, !dbg !561
  %add235 = fadd double %add233, %mul234, !dbg !560
  %mul236 = fmul double %div189, %add235, !dbg !562
  %div237 = fdiv double %mul236, %124, !dbg !562
  store double %div237, double* @sa, align 8, !dbg !563, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %div218, i64 0, metadata !14, metadata !96), !dbg !186
  tail call void @llvm.dbg.value(metadata double %mul219, i64 0, metadata !16, metadata !96), !dbg !157
  %125 = load double* @A6, align 8, !dbg !564, !tbaa !99
  %mul240 = fmul double %125, %mul219, !dbg !564
  %126 = load double* @A5, align 8, !dbg !565, !tbaa !99
  %add241 = fadd double %mul240, %126, !dbg !564
  %mul242 = fmul double %mul219, %add241, !dbg !566
  %127 = load double* @A4, align 8, !dbg !567, !tbaa !99
  %add243 = fadd double %127, %mul242, !dbg !566
  %mul244 = fmul double %mul219, %add243, !dbg !568
  %128 = load double* @A3, align 8, !dbg !569, !tbaa !99
  %add245 = fadd double %128, %mul244, !dbg !568
  %mul246 = fmul double %mul219, %add245, !dbg !570
  %129 = load double* @A2, align 8, !dbg !571, !tbaa !99
  %add247 = fadd double %129, %mul246, !dbg !570
  %mul248 = fmul double %mul219, %add247, !dbg !572
  %130 = load double* @A1, align 8, !dbg !573, !tbaa !99
  %add249 = fadd double %130, %mul248, !dbg !572
  %mul250 = fmul double %mul219, %add249, !dbg !574
  %131 = load double* @A0, align 8, !dbg !575, !tbaa !99
  %add251 = fadd double %131, %mul250, !dbg !574
  %mul252 = fmul double %div218, %add251, !dbg !576
  store double %mul252, double* @sb, align 8, !dbg !577, !tbaa !99
  %sub253 = fsub double %div237, %mul252, !dbg !578
  store double %sub253, double* @sc, align 8, !dbg !579, !tbaa !99
  %div254 = fdiv double %123, %div232, !dbg !580
  store double %div254, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 14), align 16, !dbg !581, !tbaa !99
  %mul255 = fmul double %sub253, 1.000000e-30, !dbg !582
  %mul256 = fmul double %sub217, 1.000000e-30, !dbg !583
  %mul257 = fmul double %div254, 1.000000e-30, !dbg !584
  %call258 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str7, i64 0, i64 0), double %mul255, double %mul256, double %mul257) #3, !dbg !585
  %132 = load double* @piref, align 8, !dbg !586, !tbaa !99
  %133 = load double* @three, align 8, !dbg !587, !tbaa !99
  %mul260 = fmul double %conv127, %133, !dbg !587
  %div261 = fdiv double %132, %mul260, !dbg !586
  tail call void @llvm.dbg.value(metadata double %div261, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !588, metadata !96) #3, !dbg !590
  %134 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !591, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %134, i64 0, metadata !592, metadata !96) #3, !dbg !593
  %call.i950 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !594
  %135 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !595, !tbaa !122
  %conv.i951 = sitofp i64 %135 to double, !dbg !596
  %136 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !597, !tbaa !127
  %conv1.i952 = sitofp i64 %136 to double, !dbg !598
  %mul.i953 = fmul double %conv1.i952, 1.000000e-06, !dbg !598
  %add.i954 = fadd double %conv.i951, %mul.i953, !dbg !596
  store double %add.i954, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !599, !tbaa !99
  %sub.i955 = fsub double %add.i954, %134, !dbg !600
  store double %sub.i955, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !601, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  br i1 %cmp1331017, label %for.end300, label %for.body267.lr.ph, !dbg !602

for.body267.lr.ph:                                ; preds = %for.end214
  %137 = load double* @A6, align 8, !dbg !604, !tbaa !99
  %138 = load double* @A5, align 8, !dbg !607, !tbaa !99
  %139 = load double* @A4, align 8, !dbg !608, !tbaa !99
  %140 = load double* @A3, align 8, !dbg !609, !tbaa !99
  %141 = load double* @A2, align 8, !dbg !610, !tbaa !99
  %142 = load double* @A1, align 8, !dbg !611, !tbaa !99
  %143 = load double* @one, align 8, !dbg !612, !tbaa !99
  %144 = load double* @B6, align 8, !dbg !613, !tbaa !99
  %145 = load double* @B5, align 8, !dbg !614, !tbaa !99
  %146 = load double* @B4, align 8, !dbg !615, !tbaa !99
  %147 = load double* @B3, align 8, !dbg !616, !tbaa !99
  %148 = load double* @B2, align 8, !dbg !617, !tbaa !99
  %149 = load double* @B1, align 8, !dbg !618, !tbaa !99
  %150 = insertelement <2 x double> undef, double %143, i32 0, !dbg !619
  %151 = insertelement <2 x double> %150, double %149, i32 1, !dbg !619
  %152 = insertelement <2 x double> undef, double %142, i32 0, !dbg !620
  %153 = insertelement <2 x double> %152, double %148, i32 1, !dbg !620
  %154 = insertelement <2 x double> undef, double %141, i32 0, !dbg !621
  %155 = insertelement <2 x double> %154, double %147, i32 1, !dbg !621
  %156 = insertelement <2 x double> undef, double %140, i32 0, !dbg !622
  %157 = insertelement <2 x double> %156, double %146, i32 1, !dbg !622
  %158 = insertelement <2 x double> undef, double %139, i32 0, !dbg !623
  %159 = insertelement <2 x double> %158, double %145, i32 1, !dbg !623
  br label %for.body267, !dbg !602

for.body267:                                      ; preds = %for.body267, %for.body267.lr.ph
  %i.61011 = phi i64 [ 1, %for.body267.lr.ph ], [ %inc299, %for.body267 ]
  %s.71010 = phi double [ 0.000000e+00, %for.body267.lr.ph ], [ %add297, %for.body267 ]
  %conv268 = sitofp i64 %i.61011 to double, !dbg !624
  %mul269 = fmul double %div261, %conv268, !dbg !624
  tail call void @llvm.dbg.value(metadata double %mul269, i64 0, metadata !14, metadata !96), !dbg !186
  %mul270 = fmul double %mul269, %mul269, !dbg !625
  tail call void @llvm.dbg.value(metadata double %mul270, i64 0, metadata !16, metadata !96), !dbg !157
  %mul271 = fmul double %mul270, %137, !dbg !604
  %add272 = fadd double %mul271, %138, !dbg !604
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !15, metadata !96), !dbg !156
  %160 = insertelement <2 x double> undef, double %mul270, i32 0, !dbg !623
  %161 = insertelement <2 x double> %160, double %mul270, i32 1, !dbg !623
  %162 = insertelement <2 x double> undef, double %add272, i32 0, !dbg !623
  %163 = insertelement <2 x double> %162, double %144, i32 1, !dbg !623
  %164 = fmul <2 x double> %161, %163, !dbg !623
  %165 = fadd <2 x double> %164, %159, !dbg !623
  %166 = fmul <2 x double> %165, %161, !dbg !622
  %167 = fadd <2 x double> %157, %166, !dbg !622
  %168 = fmul <2 x double> %167, %161, !dbg !621
  %169 = fadd <2 x double> %155, %168, !dbg !621
  %170 = fmul <2 x double> %169, %161, !dbg !620
  %171 = fadd <2 x double> %153, %170, !dbg !620
  %172 = fmul <2 x double> %171, %161, !dbg !619
  %173 = fadd <2 x double> %151, %172, !dbg !619
  %174 = insertelement <2 x double> undef, double %mul269, i32 0, !dbg !626
  %175 = insertelement <2 x double> %174, double %mul270, i32 1, !dbg !626
  %176 = fmul <2 x double> %175, %173, !dbg !626
  %177 = extractelement <2 x double> %176, i32 1, !dbg !627
  %add295 = fadd double %143, %177, !dbg !627
  %178 = extractelement <2 x double> %176, i32 0, !dbg !628
  %div296 = fdiv double %178, %add295, !dbg !628
  %add297 = fadd double %s.71010, %div296, !dbg !629
  tail call void @llvm.dbg.value(metadata double %add297, i64 0, metadata !13, metadata !96), !dbg !155
  %inc299 = add nuw nsw i64 %i.61011, 1, !dbg !630
  tail call void @llvm.dbg.value(metadata i64 %inc299, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp265 = icmp slt i64 %i.61011, %sub132, !dbg !631
  br i1 %cmp265, label %for.body267, label %for.end300.loopexit, !dbg !602

for.end300.loopexit:                              ; preds = %for.body267
  %add297.lcssa = phi double [ %add297, %for.body267 ]
  br label %for.end300

for.end300:                                       ; preds = %for.end300.loopexit, %for.end214
  %s.7.lcssa = phi double [ 0.000000e+00, %for.end214 ], [ %add297.lcssa, %for.end300.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !632, metadata !96) #3, !dbg !634
  tail call void @llvm.dbg.value(metadata double %add.i954, i64 0, metadata !635, metadata !96) #3, !dbg !636
  %call.i956 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !637
  %179 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !638, !tbaa !122
  %conv.i957 = sitofp i64 %179 to double, !dbg !639
  %180 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !640, !tbaa !127
  %conv1.i958 = sitofp i64 %180 to double, !dbg !641
  %mul.i959 = fmul double %conv1.i958, 1.000000e-06, !dbg !641
  %add.i960 = fadd double %conv.i957, %mul.i959, !dbg !639
  store double %add.i960, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !642, !tbaa !99
  %sub.i961 = fsub double %add.i960, %add.i954, !dbg !643
  store double %sub.i961, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !644, !tbaa !99
  %181 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !645, !tbaa !99
  %mul302 = fmul double %181, %sub.i961, !dbg !645
  %182 = load double* @nulltime, align 8, !dbg !646, !tbaa !99
  %sub303 = fsub double %mul302, %182, !dbg !645
  store double %sub303, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !647, !tbaa !99
  %183 = load double* @piref, align 8, !dbg !648, !tbaa !99
  %184 = load double* @three, align 8, !dbg !649, !tbaa !99
  %div304 = fdiv double %183, %184, !dbg !648
  tail call void @llvm.dbg.value(metadata double %div304, i64 0, metadata !14, metadata !96), !dbg !186
  %mul305 = fmul double %div304, %div304, !dbg !650
  tail call void @llvm.dbg.value(metadata double %mul305, i64 0, metadata !16, metadata !96), !dbg !157
  %185 = load double* @A6, align 8, !dbg !651, !tbaa !99
  %mul306 = fmul double %185, %mul305, !dbg !651
  %186 = load double* @A5, align 8, !dbg !652, !tbaa !99
  %add307 = fadd double %mul306, %186, !dbg !651
  %mul308 = fmul double %mul305, %add307, !dbg !653
  %187 = load double* @A4, align 8, !dbg !654, !tbaa !99
  %add309 = fadd double %187, %mul308, !dbg !653
  %mul310 = fmul double %mul305, %add309, !dbg !655
  %188 = load double* @A3, align 8, !dbg !656, !tbaa !99
  %add311 = fadd double %188, %mul310, !dbg !655
  %mul312 = fmul double %mul305, %add311, !dbg !657
  %189 = load double* @A2, align 8, !dbg !658, !tbaa !99
  %add313 = fadd double %189, %mul312, !dbg !657
  %mul314 = fmul double %mul305, %add313, !dbg !659
  %190 = load double* @A1, align 8, !dbg !660, !tbaa !99
  %add315 = fadd double %190, %mul314, !dbg !659
  %mul316 = fmul double %mul305, %add315, !dbg !661
  %191 = load double* @one, align 8, !dbg !662, !tbaa !99
  %add317 = fadd double %191, %mul316, !dbg !661
  %mul318 = fmul double %div304, %add317, !dbg !663
  %192 = load double* @B6, align 8, !dbg !664, !tbaa !99
  %mul319 = fmul double %mul305, %192, !dbg !664
  %193 = load double* @B5, align 8, !dbg !665, !tbaa !99
  %add320 = fadd double %mul319, %193, !dbg !664
  %mul321 = fmul double %mul305, %add320, !dbg !666
  %194 = load double* @B4, align 8, !dbg !667, !tbaa !99
  %add322 = fadd double %194, %mul321, !dbg !666
  %mul323 = fmul double %mul305, %add322, !dbg !668
  %195 = load double* @B3, align 8, !dbg !669, !tbaa !99
  %add324 = fadd double %195, %mul323, !dbg !668
  %mul325 = fmul double %mul305, %add324, !dbg !670
  %196 = load double* @B2, align 8, !dbg !671, !tbaa !99
  %add326 = fadd double %196, %mul325, !dbg !670
  %mul327 = fmul double %mul305, %add326, !dbg !672
  %197 = load double* @B1, align 8, !dbg !673, !tbaa !99
  %add328 = fadd double %197, %mul327, !dbg !672
  %mul329 = fmul double %mul305, %add328, !dbg !674
  %add330 = fadd double %191, %mul329, !dbg !674
  %div331 = fdiv double %mul318, %add330, !dbg !675
  %div332 = fdiv double %sub303, 2.900000e+01, !dbg !676
  store double %div332, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 16), align 16, !dbg !677, !tbaa !99
  %198 = load double* @two, align 8, !dbg !678, !tbaa !99
  %mul333 = fmul double %s.7.lcssa, %198, !dbg !678
  %add334 = fadd double %div331, %mul333, !dbg !679
  %mul335 = fmul double %div261, %add334, !dbg !680
  %div336 = fdiv double %mul335, %198, !dbg !680
  store double %div336, double* @sa, align 8, !dbg !681, !tbaa !99
  store double 0x3FE62E42FEFA39EF, double* @sb, align 8, !dbg !682, !tbaa !99
  %sub337 = fadd double %div336, 0xBFE62E42FEFA39EF, !dbg !683
  store double %sub337, double* @sc, align 8, !dbg !684, !tbaa !99
  %div338 = fdiv double %191, %div332, !dbg !685
  store double %div338, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 17), align 8, !dbg !686, !tbaa !99
  %mul339 = fmul double %sub337, 1.000000e-30, !dbg !687
  %mul340 = fmul double %sub303, 1.000000e-30, !dbg !688
  %mul341 = fmul double %div338, 1.000000e-30, !dbg !689
  %call342 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i64 0, i64 0), double %mul339, double %mul340, double %mul341) #3, !dbg !690
  %199 = load double* @piref, align 8, !dbg !691, !tbaa !99
  %200 = load double* @four, align 8, !dbg !692, !tbaa !99
  %mul344 = fmul double %conv127, %200, !dbg !692
  %div345 = fdiv double %199, %mul344, !dbg !691
  tail call void @llvm.dbg.value(metadata double %div345, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !693, metadata !96) #3, !dbg !695
  %201 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !696, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %201, i64 0, metadata !697, metadata !96) #3, !dbg !698
  %call.i962 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !699
  %202 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !700, !tbaa !122
  %conv.i963 = sitofp i64 %202 to double, !dbg !701
  %203 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !702, !tbaa !127
  %conv1.i964 = sitofp i64 %203 to double, !dbg !703
  %mul.i965 = fmul double %conv1.i964, 1.000000e-06, !dbg !703
  %add.i966 = fadd double %conv.i963, %mul.i965, !dbg !701
  store double %add.i966, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !704, !tbaa !99
  %sub.i967 = fsub double %add.i966, %201, !dbg !705
  store double %sub.i967, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !706, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  br i1 %cmp1331017, label %for.end384, label %for.body351.lr.ph, !dbg !707

for.body351.lr.ph:                                ; preds = %for.end300
  %204 = load double* @A6, align 8, !dbg !709, !tbaa !99
  %205 = load double* @A5, align 8, !dbg !712, !tbaa !99
  %206 = load double* @A4, align 8, !dbg !713, !tbaa !99
  %207 = load double* @A3, align 8, !dbg !714, !tbaa !99
  %208 = load double* @A2, align 8, !dbg !715, !tbaa !99
  %209 = load double* @A1, align 8, !dbg !716, !tbaa !99
  %210 = load double* @one, align 8, !dbg !717, !tbaa !99
  %211 = load double* @B6, align 8, !dbg !718, !tbaa !99
  %212 = load double* @B5, align 8, !dbg !719, !tbaa !99
  %213 = load double* @B4, align 8, !dbg !720, !tbaa !99
  %214 = load double* @B3, align 8, !dbg !721, !tbaa !99
  %215 = load double* @B2, align 8, !dbg !722, !tbaa !99
  %216 = load double* @B1, align 8, !dbg !723, !tbaa !99
  %217 = insertelement <2 x double> undef, double %210, i32 0, !dbg !724
  %218 = insertelement <2 x double> %217, double %216, i32 1, !dbg !724
  %219 = insertelement <2 x double> undef, double %209, i32 0, !dbg !725
  %220 = insertelement <2 x double> %219, double %215, i32 1, !dbg !725
  %221 = insertelement <2 x double> undef, double %208, i32 0, !dbg !726
  %222 = insertelement <2 x double> %221, double %214, i32 1, !dbg !726
  %223 = insertelement <2 x double> undef, double %207, i32 0, !dbg !727
  %224 = insertelement <2 x double> %223, double %213, i32 1, !dbg !727
  %225 = insertelement <2 x double> undef, double %206, i32 0, !dbg !728
  %226 = insertelement <2 x double> %225, double %212, i32 1, !dbg !728
  br label %for.body351, !dbg !707

for.body351:                                      ; preds = %for.body351, %for.body351.lr.ph
  %i.71007 = phi i64 [ 1, %for.body351.lr.ph ], [ %inc383, %for.body351 ]
  %s.81006 = phi double [ 0.000000e+00, %for.body351.lr.ph ], [ %add381, %for.body351 ]
  %conv352 = sitofp i64 %i.71007 to double, !dbg !729
  %mul353 = fmul double %div345, %conv352, !dbg !729
  tail call void @llvm.dbg.value(metadata double %mul353, i64 0, metadata !14, metadata !96), !dbg !186
  %mul354 = fmul double %mul353, %mul353, !dbg !730
  tail call void @llvm.dbg.value(metadata double %mul354, i64 0, metadata !16, metadata !96), !dbg !157
  %mul355 = fmul double %mul354, %204, !dbg !709
  %add356 = fadd double %mul355, %205, !dbg !709
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !15, metadata !96), !dbg !156
  %227 = insertelement <2 x double> undef, double %mul354, i32 0, !dbg !728
  %228 = insertelement <2 x double> %227, double %mul354, i32 1, !dbg !728
  %229 = insertelement <2 x double> undef, double %add356, i32 0, !dbg !728
  %230 = insertelement <2 x double> %229, double %211, i32 1, !dbg !728
  %231 = fmul <2 x double> %228, %230, !dbg !728
  %232 = fadd <2 x double> %231, %226, !dbg !728
  %233 = fmul <2 x double> %232, %228, !dbg !727
  %234 = fadd <2 x double> %224, %233, !dbg !727
  %235 = fmul <2 x double> %234, %228, !dbg !726
  %236 = fadd <2 x double> %222, %235, !dbg !726
  %237 = fmul <2 x double> %236, %228, !dbg !725
  %238 = fadd <2 x double> %220, %237, !dbg !725
  %239 = fmul <2 x double> %238, %228, !dbg !724
  %240 = fadd <2 x double> %218, %239, !dbg !724
  %241 = insertelement <2 x double> undef, double %mul353, i32 0, !dbg !731
  %242 = insertelement <2 x double> %241, double %mul354, i32 1, !dbg !731
  %243 = fmul <2 x double> %242, %240, !dbg !731
  %244 = extractelement <2 x double> %243, i32 1, !dbg !732
  %add379 = fadd double %210, %244, !dbg !732
  %245 = extractelement <2 x double> %243, i32 0, !dbg !733
  %mul380 = fmul double %245, %add379, !dbg !733
  %add381 = fadd double %s.81006, %mul380, !dbg !734
  tail call void @llvm.dbg.value(metadata double %add381, i64 0, metadata !13, metadata !96), !dbg !155
  %inc383 = add nuw nsw i64 %i.71007, 1, !dbg !735
  tail call void @llvm.dbg.value(metadata i64 %inc383, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp349 = icmp slt i64 %i.71007, %sub132, !dbg !736
  br i1 %cmp349, label %for.body351, label %for.end384.loopexit, !dbg !707

for.end384.loopexit:                              ; preds = %for.body351
  %add381.lcssa = phi double [ %add381, %for.body351 ]
  br label %for.end384

for.end384:                                       ; preds = %for.end384.loopexit, %for.end300
  %s.8.lcssa = phi double [ 0.000000e+00, %for.end300 ], [ %add381.lcssa, %for.end384.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !737, metadata !96) #3, !dbg !739
  tail call void @llvm.dbg.value(metadata double %add.i966, i64 0, metadata !740, metadata !96) #3, !dbg !741
  %call.i968 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !742
  %246 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !743, !tbaa !122
  %conv.i969 = sitofp i64 %246 to double, !dbg !744
  %247 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !745, !tbaa !127
  %conv1.i970 = sitofp i64 %247 to double, !dbg !746
  %mul.i971 = fmul double %conv1.i970, 1.000000e-06, !dbg !746
  %add.i972 = fadd double %conv.i969, %mul.i971, !dbg !744
  store double %add.i972, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !747, !tbaa !99
  %sub.i973 = fsub double %add.i972, %add.i966, !dbg !748
  store double %sub.i973, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !749, !tbaa !99
  %248 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !750, !tbaa !99
  %mul386 = fmul double %248, %sub.i973, !dbg !750
  %249 = load double* @nulltime, align 8, !dbg !751, !tbaa !99
  %sub387 = fsub double %mul386, %249, !dbg !750
  store double %sub387, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !752, !tbaa !99
  %250 = load double* @piref, align 8, !dbg !753, !tbaa !99
  %251 = load double* @four, align 8, !dbg !754, !tbaa !99
  %div388 = fdiv double %250, %251, !dbg !753
  tail call void @llvm.dbg.value(metadata double %div388, i64 0, metadata !14, metadata !96), !dbg !186
  %mul389 = fmul double %div388, %div388, !dbg !755
  tail call void @llvm.dbg.value(metadata double %mul389, i64 0, metadata !16, metadata !96), !dbg !157
  %252 = load double* @A6, align 8, !dbg !756, !tbaa !99
  %mul390 = fmul double %252, %mul389, !dbg !756
  %253 = load double* @A5, align 8, !dbg !757, !tbaa !99
  %add391 = fadd double %mul390, %253, !dbg !756
  %mul392 = fmul double %mul389, %add391, !dbg !758
  %254 = load double* @A4, align 8, !dbg !759, !tbaa !99
  %add393 = fadd double %254, %mul392, !dbg !758
  %mul394 = fmul double %mul389, %add393, !dbg !760
  %255 = load double* @A3, align 8, !dbg !761, !tbaa !99
  %add395 = fadd double %255, %mul394, !dbg !760
  %mul396 = fmul double %mul389, %add395, !dbg !762
  %256 = load double* @A2, align 8, !dbg !763, !tbaa !99
  %add397 = fadd double %256, %mul396, !dbg !762
  %mul398 = fmul double %mul389, %add397, !dbg !764
  %257 = load double* @A1, align 8, !dbg !765, !tbaa !99
  %add399 = fadd double %257, %mul398, !dbg !764
  %mul400 = fmul double %mul389, %add399, !dbg !766
  %258 = load double* @one, align 8, !dbg !767, !tbaa !99
  %add401 = fadd double %258, %mul400, !dbg !766
  %mul402 = fmul double %div388, %add401, !dbg !768
  %259 = load double* @B6, align 8, !dbg !769, !tbaa !99
  %mul403 = fmul double %mul389, %259, !dbg !769
  %260 = load double* @B5, align 8, !dbg !770, !tbaa !99
  %add404 = fadd double %mul403, %260, !dbg !769
  %mul405 = fmul double %mul389, %add404, !dbg !771
  %261 = load double* @B4, align 8, !dbg !772, !tbaa !99
  %add406 = fadd double %261, %mul405, !dbg !771
  %mul407 = fmul double %mul389, %add406, !dbg !773
  %262 = load double* @B3, align 8, !dbg !774, !tbaa !99
  %add408 = fadd double %262, %mul407, !dbg !773
  %mul409 = fmul double %mul389, %add408, !dbg !775
  %263 = load double* @B2, align 8, !dbg !776, !tbaa !99
  %add410 = fadd double %263, %mul409, !dbg !775
  %mul411 = fmul double %mul389, %add410, !dbg !777
  %264 = load double* @B1, align 8, !dbg !778, !tbaa !99
  %add412 = fadd double %264, %mul411, !dbg !777
  %mul413 = fmul double %mul389, %add412, !dbg !779
  %add414 = fadd double %258, %mul413, !dbg !779
  %mul415 = fmul double %mul402, %add414, !dbg !780
  %div416 = fdiv double %sub387, 2.900000e+01, !dbg !781
  store double %div416, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 19), align 8, !dbg !782, !tbaa !99
  %265 = load double* @two, align 8, !dbg !783, !tbaa !99
  %mul417 = fmul double %s.8.lcssa, %265, !dbg !783
  %add418 = fadd double %mul415, %mul417, !dbg !784
  %mul419 = fmul double %div345, %add418, !dbg !785
  %div420 = fdiv double %mul419, %265, !dbg !785
  store double %div420, double* @sa, align 8, !dbg !786, !tbaa !99
  store double 2.500000e-01, double* @sb, align 8, !dbg !787, !tbaa !99
  %sub421 = fadd double %div420, -2.500000e-01, !dbg !788
  store double %sub421, double* @sc, align 8, !dbg !789, !tbaa !99
  %div422 = fdiv double %258, %div416, !dbg !790
  store double %div422, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 20), align 16, !dbg !791, !tbaa !99
  %mul423 = fmul double %sub421, 1.000000e-30, !dbg !792
  %mul424 = fmul double %sub387, 1.000000e-30, !dbg !793
  %mul425 = fmul double %div422, 1.000000e-30, !dbg !794
  %call426 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str9, i64 0, i64 0), double %mul423, double %mul424, double %mul425) #3, !dbg !795
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  %266 = load double* @one, align 8, !dbg !796, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %266, i64 0, metadata !16, metadata !96), !dbg !157
  store double 0x40599541F7F192A4, double* @sa, align 8, !dbg !797, !tbaa !99
  %div428 = fdiv double 0x40599541F7F192A4, %conv127, !dbg !798
  tail call void @llvm.dbg.value(metadata double %div428, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !799, metadata !96) #3, !dbg !801
  %267 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !802, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %267, i64 0, metadata !803, metadata !96) #3, !dbg !804
  %call.i974 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !805
  %268 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !806, !tbaa !122
  %conv.i975 = sitofp i64 %268 to double, !dbg !807
  %269 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !808, !tbaa !127
  %conv1.i976 = sitofp i64 %269 to double, !dbg !809
  %mul.i977 = fmul double %conv1.i976, 1.000000e-06, !dbg !809
  %add.i978 = fadd double %conv.i975, %mul.i977, !dbg !807
  store double %add.i978, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !810, !tbaa !99
  %sub.i979 = fsub double %add.i978, %267, !dbg !811
  store double %sub.i979, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !812, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  br i1 %cmp1331017, label %for.end450, label %for.body434.preheader, !dbg !813

for.body434.preheader:                            ; preds = %for.end384
  br label %for.body434, !dbg !815

for.body434:                                      ; preds = %for.body434.preheader, %for.body434
  %i.81003 = phi i64 [ %inc449, %for.body434 ], [ 1, %for.body434.preheader ]
  %s.91002 = phi double [ %sub447, %for.body434 ], [ 0.000000e+00, %for.body434.preheader ]
  %conv435 = sitofp i64 %i.81003 to double, !dbg !815
  %mul436 = fmul double %div428, %conv435, !dbg !815
  tail call void @llvm.dbg.value(metadata double %mul436, i64 0, metadata !17, metadata !96), !dbg !154
  %mul437 = fmul double %mul436, %mul436, !dbg !818
  tail call void @llvm.dbg.value(metadata double %mul437, i64 0, metadata !14, metadata !96), !dbg !186
  %add438 = fadd double %266, %mul436, !dbg !819
  %div439 = fdiv double %266, %add438, !dbg !820
  %sub440 = fsub double %s.91002, %div439, !dbg !821
  %add441 = fadd double %266, %mul437, !dbg !822
  %div442 = fdiv double %mul436, %add441, !dbg !823
  %sub443 = fsub double %sub440, %div442, !dbg !821
  %mul444 = fmul double %mul436, %mul437, !dbg !824
  %add445 = fadd double %266, %mul444, !dbg !824
  %div446 = fdiv double %mul437, %add445, !dbg !825
  %sub447 = fsub double %sub443, %div446, !dbg !821
  tail call void @llvm.dbg.value(metadata double %sub447, i64 0, metadata !13, metadata !96), !dbg !155
  %inc449 = add nuw nsw i64 %i.81003, 1, !dbg !826
  tail call void @llvm.dbg.value(metadata i64 %inc449, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp432 = icmp slt i64 %i.81003, %sub132, !dbg !827
  br i1 %cmp432, label %for.body434, label %for.end450.loopexit, !dbg !813

for.end450.loopexit:                              ; preds = %for.body434
  %sub447.lcssa = phi double [ %sub447, %for.body434 ]
  br label %for.end450

for.end450:                                       ; preds = %for.end450.loopexit, %for.end384
  %s.9.lcssa = phi double [ 0.000000e+00, %for.end384 ], [ %sub447.lcssa, %for.end450.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !828, metadata !96) #3, !dbg !830
  tail call void @llvm.dbg.value(metadata double %add.i978, i64 0, metadata !831, metadata !96) #3, !dbg !832
  %call.i980 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !833
  %270 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !834, !tbaa !122
  %conv.i981 = sitofp i64 %270 to double, !dbg !835
  %271 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !836, !tbaa !127
  %conv1.i982 = sitofp i64 %271 to double, !dbg !837
  %mul.i983 = fmul double %conv1.i982, 1.000000e-06, !dbg !837
  %add.i984 = fadd double %conv.i981, %mul.i983, !dbg !835
  store double %add.i984, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !838, !tbaa !99
  %sub.i985 = fsub double %add.i984, %add.i978, !dbg !839
  store double %sub.i985, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !840, !tbaa !99
  %272 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !841, !tbaa !99
  %mul452 = fmul double %272, %sub.i985, !dbg !841
  %273 = load double* @nulltime, align 8, !dbg !842, !tbaa !99
  %sub453 = fsub double %mul452, %273, !dbg !841
  store double %sub453, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !843, !tbaa !99
  %div454 = fdiv double %sub453, 1.200000e+01, !dbg !844
  store double %div454, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 22), align 16, !dbg !845, !tbaa !99
  %274 = load double* @sa, align 8, !dbg !846, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %274, i64 0, metadata !17, metadata !96), !dbg !154
  %mul455 = fmul double %274, %274, !dbg !847
  tail call void @llvm.dbg.value(metadata double %mul455, i64 0, metadata !14, metadata !96), !dbg !186
  %sub456 = fsub double -0.000000e+00, %266, !dbg !848
  %add457 = fadd double %266, %274, !dbg !849
  %div458 = fdiv double %266, %add457, !dbg !850
  %sub459 = fsub double %sub456, %div458, !dbg !848
  %add460 = fadd double %266, %mul455, !dbg !851
  %div461 = fdiv double %274, %add460, !dbg !852
  %sub462 = fsub double %sub459, %div461, !dbg !848
  %mul463 = fmul double %274, %mul455, !dbg !853
  %add464 = fadd double %266, %mul463, !dbg !853
  %div465 = fdiv double %mul455, %add464, !dbg !854
  %sub466 = fsub double %sub462, %div465, !dbg !848
  %mul467 = fmul double %div428, 1.800000e+01, !dbg !855
  %275 = load double* @two, align 8, !dbg !856, !tbaa !99
  %mul468 = fmul double %s.9.lcssa, %275, !dbg !856
  %add469 = fadd double %sub466, %mul468, !dbg !857
  %mul470 = fmul double %mul467, %add469, !dbg !855
  store double %mul470, double* @sa, align 8, !dbg !858, !tbaa !99
  %conv471 = fptosi double %mul470 to i64, !dbg !859
  %mul472 = mul nsw i64 %conv471, -2000, !dbg !860
  tail call void @llvm.dbg.value(metadata i64 %mul472, i64 0, metadata !21, metadata !96), !dbg !273
  %conv473 = sitofp i64 %mul472 to double, !dbg !861
  %276 = load double* @scale, align 8, !dbg !862, !tbaa !99
  %div474 = fdiv double %conv473, %276, !dbg !861
  %conv475 = fptosi double %div474 to i64, !dbg !863
  tail call void @llvm.dbg.value(metadata i64 %conv475, i64 0, metadata !21, metadata !96), !dbg !273
  %add476 = fadd double %mul470, 5.002000e+02, !dbg !864
  store double %add476, double* @sc, align 8, !dbg !865, !tbaa !99
  %277 = load double* @one, align 8, !dbg !866, !tbaa !99
  %div477 = fdiv double %277, %div454, !dbg !866
  store double %div477, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 23), align 8, !dbg !867, !tbaa !99
  %mul478 = fmul double %add476, 1.000000e-30, !dbg !868
  %mul479 = fmul double %sub453, 1.000000e-30, !dbg !869
  %mul480 = fmul double %div477, 1.000000e-30, !dbg !870
  %call481 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str10, i64 0, i64 0), double %mul478, double %mul479, double %mul480) #3, !dbg !871
  %278 = load double* @piref, align 8, !dbg !872, !tbaa !99
  %279 = load double* @three, align 8, !dbg !873, !tbaa !99
  %conv482 = sitofp i64 %conv475 to double, !dbg !874
  %mul483 = fmul double %conv482, %279, !dbg !873
  %div484 = fdiv double %278, %mul483, !dbg !872
  tail call void @llvm.dbg.value(metadata double %div484, i64 0, metadata !17, metadata !96), !dbg !154
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !96), !dbg !155
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !96), !dbg !156
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !875, metadata !96) #3, !dbg !877
  %280 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !878, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %280, i64 0, metadata !879, metadata !96) #3, !dbg !880
  %call.i986 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !881
  %281 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !882, !tbaa !122
  %conv.i987 = sitofp i64 %281 to double, !dbg !883
  %282 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !884, !tbaa !127
  %conv1.i988 = sitofp i64 %282 to double, !dbg !885
  %mul.i989 = fmul double %conv1.i988, 1.000000e-06, !dbg !885
  %add.i990 = fadd double %conv.i987, %mul.i989, !dbg !883
  store double %add.i990, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !886, !tbaa !99
  %sub.i991 = fsub double %add.i990, %280, !dbg !887
  store double %sub.i991, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !888, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !96), !dbg !171
  %sub487 = add nsw i64 %conv475, -1, !dbg !889
  %cmp488998 = icmp slt i64 %conv475, 2, !dbg !892
  br i1 %cmp488998, label %for.end524, label %for.body490.lr.ph, !dbg !893

for.body490.lr.ph:                                ; preds = %for.end450
  %283 = load double* @B6, align 8, !dbg !894, !tbaa !99
  %284 = load double* @B5, align 8, !dbg !896, !tbaa !99
  %285 = load double* @B4, align 8, !dbg !897, !tbaa !99
  %286 = load double* @B3, align 8, !dbg !898, !tbaa !99
  %287 = load double* @B2, align 8, !dbg !899, !tbaa !99
  %288 = load double* @B1, align 8, !dbg !900, !tbaa !99
  %289 = load double* @one, align 8, !dbg !901, !tbaa !99
  %290 = load double* @A6, align 8, !dbg !902, !tbaa !99
  %291 = load double* @A5, align 8, !dbg !903, !tbaa !99
  %292 = load double* @A4, align 8, !dbg !904, !tbaa !99
  %293 = load double* @A3, align 8, !dbg !905, !tbaa !99
  %294 = load double* @A2, align 8, !dbg !906, !tbaa !99
  %295 = load double* @A1, align 8, !dbg !907, !tbaa !99
  br label %for.body490, !dbg !893

for.body490:                                      ; preds = %for.body490, %for.body490.lr.ph
  %i.91000 = phi i64 [ 1, %for.body490.lr.ph ], [ %inc523, %for.body490 ]
  %s.10999 = phi double [ 0.000000e+00, %for.body490.lr.ph ], [ %add521, %for.body490 ]
  %conv491 = sitofp i64 %i.91000 to double, !dbg !908
  %mul492 = fmul double %div484, %conv491, !dbg !908
  tail call void @llvm.dbg.value(metadata double %mul492, i64 0, metadata !14, metadata !96), !dbg !186
  %mul493 = fmul double %mul492, %mul492, !dbg !909
  tail call void @llvm.dbg.value(metadata double %mul493, i64 0, metadata !16, metadata !96), !dbg !157
  %mul494 = fmul double %mul493, %283, !dbg !894
  %add495 = fadd double %mul494, %284, !dbg !894
  %mul496 = fmul double %mul493, %add495, !dbg !910
  %add497 = fadd double %285, %mul496, !dbg !910
  %mul498 = fmul double %mul493, %add497, !dbg !911
  %add499 = fadd double %286, %mul498, !dbg !911
  %mul500 = fmul double %mul493, %add499, !dbg !912
  %add501 = fadd double %287, %mul500, !dbg !912
  %mul502 = fmul double %mul493, %add501, !dbg !913
  %add503 = fadd double %288, %mul502, !dbg !913
  %mul504 = fmul double %mul493, %add503, !dbg !914
  %add505 = fadd double %289, %mul504, !dbg !914
  tail call void @llvm.dbg.value(metadata double %add505, i64 0, metadata !15, metadata !96), !dbg !156
  %mul506 = fmul double %add505, %add505, !dbg !915
  %mul507 = fmul double %mul492, %mul506, !dbg !915
  %mul508 = fmul double %mul493, %290, !dbg !902
  %add509 = fadd double %mul508, %291, !dbg !902
  %mul510 = fmul double %mul493, %add509, !dbg !916
  %add511 = fadd double %292, %mul510, !dbg !916
  %mul512 = fmul double %mul493, %add511, !dbg !917
  %add513 = fadd double %293, %mul512, !dbg !917
  %mul514 = fmul double %mul493, %add513, !dbg !918
  %add515 = fadd double %294, %mul514, !dbg !918
  %mul516 = fmul double %mul493, %add515, !dbg !919
  %add517 = fadd double %295, %mul516, !dbg !919
  %mul518 = fmul double %mul493, %add517, !dbg !920
  %add519 = fadd double %289, %mul518, !dbg !920
  %mul520 = fmul double %mul507, %add519, !dbg !915
  %add521 = fadd double %s.10999, %mul520, !dbg !921
  tail call void @llvm.dbg.value(metadata double %add521, i64 0, metadata !13, metadata !96), !dbg !155
  %inc523 = add nuw nsw i64 %i.91000, 1, !dbg !922
  tail call void @llvm.dbg.value(metadata i64 %inc523, i64 0, metadata !20, metadata !96), !dbg !171
  %cmp488 = icmp slt i64 %i.91000, %sub487, !dbg !892
  br i1 %cmp488, label %for.body490, label %for.end524.loopexit, !dbg !893

for.end524.loopexit:                              ; preds = %for.body490
  %add521.lcssa = phi double [ %add521, %for.body490 ]
  br label %for.end524

for.end524:                                       ; preds = %for.end524.loopexit, %for.end450
  %s.10.lcssa = phi double [ 0.000000e+00, %for.end450 ], [ %add521.lcssa, %for.end524.loopexit ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !923, metadata !96) #3, !dbg !925
  tail call void @llvm.dbg.value(metadata double %add.i990, i64 0, metadata !926, metadata !96) #3, !dbg !927
  %call.i992 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !928
  %296 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !929, !tbaa !122
  %conv.i993 = sitofp i64 %296 to double, !dbg !930
  %297 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !931, !tbaa !127
  %conv1.i994 = sitofp i64 %297 to double, !dbg !932
  %mul.i995 = fmul double %conv1.i994, 1.000000e-06, !dbg !932
  %add.i996 = fadd double %conv.i993, %mul.i995, !dbg !930
  store double %add.i996, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !933, !tbaa !99
  %sub.i997 = fsub double %add.i996, %add.i990, !dbg !934
  store double %sub.i997, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !935, !tbaa !99
  %298 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !936, !tbaa !99
  %mul526 = fmul double %298, %sub.i997, !dbg !936
  %299 = load double* @nulltime, align 8, !dbg !937, !tbaa !99
  %sub527 = fsub double %mul526, %299, !dbg !936
  store double %sub527, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !938, !tbaa !99
  %300 = load double* @piref, align 8, !dbg !939, !tbaa !99
  %301 = load double* @three, align 8, !dbg !940, !tbaa !99
  %div528 = fdiv double %300, %301, !dbg !939
  tail call void @llvm.dbg.value(metadata double %div528, i64 0, metadata !14, metadata !96), !dbg !186
  %mul529 = fmul double %div528, %div528, !dbg !941
  tail call void @llvm.dbg.value(metadata double %mul529, i64 0, metadata !16, metadata !96), !dbg !157
  %302 = load double* @A6, align 8, !dbg !942, !tbaa !99
  %mul530 = fmul double %302, %mul529, !dbg !942
  %303 = load double* @A5, align 8, !dbg !943, !tbaa !99
  %add531 = fadd double %mul530, %303, !dbg !942
  %mul532 = fmul double %mul529, %add531, !dbg !944
  %304 = load double* @A4, align 8, !dbg !945, !tbaa !99
  %add533 = fadd double %304, %mul532, !dbg !944
  %mul534 = fmul double %mul529, %add533, !dbg !946
  %305 = load double* @A3, align 8, !dbg !947, !tbaa !99
  %add535 = fadd double %305, %mul534, !dbg !946
  %mul536 = fmul double %mul529, %add535, !dbg !948
  %306 = load double* @A2, align 8, !dbg !949, !tbaa !99
  %add537 = fadd double %306, %mul536, !dbg !948
  %mul538 = fmul double %mul529, %add537, !dbg !950
  %307 = load double* @A1, align 8, !dbg !951, !tbaa !99
  %add539 = fadd double %307, %mul538, !dbg !950
  %mul540 = fmul double %mul529, %add539, !dbg !952
  %308 = load double* @one, align 8, !dbg !953, !tbaa !99
  %add541 = fadd double %308, %mul540, !dbg !952
  %mul542 = fmul double %div528, %add541, !dbg !954
  %309 = load double* @B6, align 8, !dbg !955, !tbaa !99
  %mul543 = fmul double %mul529, %309, !dbg !955
  %310 = load double* @B5, align 8, !dbg !956, !tbaa !99
  %add544 = fadd double %mul543, %310, !dbg !955
  %mul545 = fmul double %mul529, %add544, !dbg !957
  %311 = load double* @B4, align 8, !dbg !958, !tbaa !99
  %add546 = fadd double %311, %mul545, !dbg !957
  %mul547 = fmul double %mul529, %add546, !dbg !959
  %312 = load double* @B3, align 8, !dbg !960, !tbaa !99
  %add548 = fadd double %312, %mul547, !dbg !959
  %mul549 = fmul double %mul529, %add548, !dbg !961
  %313 = load double* @B2, align 8, !dbg !962, !tbaa !99
  %add550 = fadd double %313, %mul549, !dbg !961
  %mul551 = fmul double %mul529, %add550, !dbg !963
  %314 = load double* @B1, align 8, !dbg !964, !tbaa !99
  %add552 = fadd double %314, %mul551, !dbg !963
  %mul553 = fmul double %mul529, %add552, !dbg !965
  %add554 = fadd double %308, %mul553, !dbg !965
  %mul555 = fmul double %mul542, %add554, !dbg !966
  %mul556 = fmul double %add554, %mul555, !dbg !966
  %div557 = fdiv double %sub527, 3.000000e+01, !dbg !967
  store double %div557, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 25), align 8, !dbg !968, !tbaa !99
  %315 = load double* @two, align 8, !dbg !969, !tbaa !99
  %mul558 = fmul double %s.10.lcssa, %315, !dbg !969
  %add559 = fadd double %mul556, %mul558, !dbg !970
  %mul560 = fmul double %div484, %add559, !dbg !971
  %div561 = fdiv double %mul560, %315, !dbg !971
  store double %div561, double* @sa, align 8, !dbg !972, !tbaa !99
  store double 0x3FD2AAAAAAAAAAAB, double* @sb, align 8, !dbg !973, !tbaa !99
  %sub562 = fadd double %div561, 0xBFD2AAAAAAAAAAAB, !dbg !974
  store double %sub562, double* @sc, align 8, !dbg !975, !tbaa !99
  %div563 = fdiv double %308, %div557, !dbg !976
  store double %div563, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 26), align 16, !dbg !977, !tbaa !99
  %mul564 = fmul double %sub562, 1.000000e-30, !dbg !978
  %mul565 = fmul double %sub527, 1.000000e-30, !dbg !979
  %mul566 = fmul double %div563, 1.000000e-30, !dbg !980
  %call567 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i64 0, i64 0), double %mul564, double %mul565, double %mul566) #3, !dbg !981
  %316 = load double* @five, align 8, !dbg !982, !tbaa !99
  %317 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !983, !tbaa !99
  %318 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !984, !tbaa !99
  %sub568 = fsub double %317, %318, !dbg !983
  %mul569 = fmul double %316, %sub568, !dbg !982
  %319 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !985, !tbaa !99
  %add570 = fadd double %319, %mul569, !dbg !982
  %div571 = fdiv double %add570, 5.200000e+01, !dbg !986
  store double %div571, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 27), align 8, !dbg !987, !tbaa !99
  %320 = load double* @one, align 8, !dbg !988, !tbaa !99
  %div572 = fdiv double %320, %div571, !dbg !988
  store double %div572, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !989, !tbaa !99
  %321 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !990, !tbaa !99
  %add573 = fadd double %321, %319, !dbg !990
  %322 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !991, !tbaa !99
  %add574 = fadd double %add573, %322, !dbg !990
  %323 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !992, !tbaa !99
  %add575 = fadd double %add574, %323, !dbg !990
  %324 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !993, !tbaa !99
  %add576 = fadd double %add575, %324, !dbg !990
  %325 = load double* @four, align 8, !dbg !994, !tbaa !99
  %326 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !995, !tbaa !99
  %mul577 = fmul double %325, %326, !dbg !994
  %add578 = fadd double %add576, %mul577, !dbg !996
  %div579 = fdiv double %add578, 1.520000e+02, !dbg !997
  store double %div579, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 29), align 8, !dbg !998, !tbaa !99
  %div580 = fdiv double %320, %div579, !dbg !999
  store double %div580, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !1000, !tbaa !99
  %add585 = fadd double %add576, %326, !dbg !1001
  %327 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !1002, !tbaa !99
  %add586 = fadd double %add585, %327, !dbg !1001
  %div587 = fdiv double %add586, 1.460000e+02, !dbg !1003
  store double %div587, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 31), align 8, !dbg !1004, !tbaa !99
  %div588 = fdiv double %320, %div587, !dbg !1005
  store double %div588, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !1006, !tbaa !99
  %add589 = fadd double %319, %322, !dbg !1007
  %add590 = fadd double %add589, %324, !dbg !1007
  %add591 = fadd double %add590, %327, !dbg !1007
  %div592 = fdiv double %add591, 9.100000e+01, !dbg !1008
  store double %div592, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 33), align 8, !dbg !1009, !tbaa !99
  %div593 = fdiv double %320, %div592, !dbg !1010
  store double %div593, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !1011, !tbaa !99
  %putchar870 = tail call i32 @putchar(i32 10) #3, !dbg !1012
  %call595 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 %conv475) #3, !dbg !1013
  %328 = load double* @nulltime, align 8, !dbg !1014, !tbaa !99
  %mul596 = fmul double %328, 1.000000e-30, !dbg !1014
  %call597 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str13, i64 0, i64 0), double %mul596) #3, !dbg !1015
  %329 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !1016, !tbaa !99
  %mul598 = fmul double %329, 1.000000e-30, !dbg !1016
  %call599 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str14, i64 0, i64 0), double %mul598) #3, !dbg !1017
  %330 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !1018, !tbaa !99
  %mul600 = fmul double %330, 1.000000e-30, !dbg !1018
  %call601 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str15, i64 0, i64 0), double %mul600) #3, !dbg !1019
  %331 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !1020, !tbaa !99
  %mul602 = fmul double %331, 1.000000e-30, !dbg !1020
  %call603 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i64 0, i64 0), double %mul602) #3, !dbg !1021
  %332 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !1022, !tbaa !99
  %mul604 = fmul double %332, 1.000000e-30, !dbg !1022
  %call605 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i64 0, i64 0), double %mul604) #3, !dbg !1023
  ret i32 0, !dbg !1024
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @dtime(double* nocapture %p) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double* %p, i64 0, metadata !28, metadata !96), !dbg !1025
  %arrayidx = getelementptr inbounds double* %p, i64 2, !dbg !1026
  %0 = load double* %arrayidx, align 8, !dbg !1026, !tbaa !99
  tail call void @llvm.dbg.value(metadata double %0, i64 0, metadata !29, metadata !96), !dbg !1027
  %call = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !1028
  %1 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !1029, !tbaa !122
  %conv = sitofp i64 %1 to double, !dbg !1030
  %2 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !1031, !tbaa !127
  %conv1 = sitofp i64 %2 to double, !dbg !1032
  %mul = fmul double %conv1, 1.000000e-06, !dbg !1032
  %add = fadd double %conv, %mul, !dbg !1030
  store double %add, double* %arrayidx, align 8, !dbg !1033, !tbaa !99
  %sub = fsub double %add, %0, !dbg !1034
  %arrayidx4 = getelementptr inbounds double* %p, i64 1, !dbg !1035
  store double %sub, double* %arrayidx4, align 8, !dbg !1035, !tbaa !99
  ret i32 0, !dbg !1036
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!91, !92}
!llvm.ident = !{!93}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !30, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c] [DW_LANG_C99]
!1 = !{!"flops.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!6 = !{!7, !23}
!7 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\001\00174", !1, !8, !9, null, i32 ()* @main, null, null, !12} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11}
!11 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22}
!13 = !{!"0x100\00s\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [s] [line 179]
!14 = !{!"0x100\00u\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [u] [line 179]
!15 = !{!"0x100\00v\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [v] [line 179]
!16 = !{!"0x100\00w\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [w] [line 179]
!17 = !{!"0x100\00x\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [x] [line 179]
!18 = !{!"0x100\00loops\00182\000", !7, !8, !5}   ; [ DW_TAG_auto_variable ] [loops] [line 182]
!19 = !{!"0x100\00NLimit\00182\000", !7, !8, !5}  ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!20 = !{!"0x100\00i\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [i] [line 183]
!21 = !{!"0x100\00m\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [m] [line 183]
!22 = !{!"0x100\00n\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [n] [line 183]
!23 = !{!"0x2e\00dtime\00dtime\00\00986\000\001\000\000\000\001\00988", !1, !8, !24, null, i32 (double*)* @dtime, null, null, !27} ; [ DW_TAG_subprogram ] [line 986] [def] [scope 988] [dtime]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!11, !26}
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!27 = !{!28, !29}
!28 = !{!"0x101\00p\0016778203\000", !23, !8, !26} ; [ DW_TAG_arg_variable ] [p] [line 987]
!29 = !{!"0x100\00q\00989\000", !23, !8, !4}      ; [ DW_TAG_auto_variable ] [q] [line 989]
!30 = !{!31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !64, !65, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82}
!31 = !{!"0x34\00A0\00A0\00\00140\000\001", null, !8, !4, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!32 = !{!"0x34\00A1\00A1\00\00141\000\001", null, !8, !4, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!33 = !{!"0x34\00A2\00A2\00\00142\000\001", null, !8, !4, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!34 = !{!"0x34\00A3\00A3\00\00143\000\001", null, !8, !4, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!35 = !{!"0x34\00A4\00A4\00\00144\000\001", null, !8, !4, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!36 = !{!"0x34\00A5\00A5\00\00145\000\001", null, !8, !4, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!37 = !{!"0x34\00A6\00A6\00\00146\000\001", null, !8, !4, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!38 = !{!"0x34\00B0\00B0\00\00148\000\001", null, !8, !4, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!39 = !{!"0x34\00B1\00B1\00\00149\000\001", null, !8, !4, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!40 = !{!"0x34\00B2\00B2\00\00150\000\001", null, !8, !4, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!41 = !{!"0x34\00B3\00B3\00\00151\000\001", null, !8, !4, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!42 = !{!"0x34\00B4\00B4\00\00152\000\001", null, !8, !4, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!43 = !{!"0x34\00B5\00B5\00\00153\000\001", null, !8, !4, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!44 = !{!"0x34\00B6\00B6\00\00154\000\001", null, !8, !4, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!45 = !{!"0x34\00C0\00C0\00\00156\000\001", null, !8, !4, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!46 = !{!"0x34\00C1\00C1\00\00157\000\001", null, !8, !4, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!47 = !{!"0x34\00C2\00C2\00\00158\000\001", null, !8, !4, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!48 = !{!"0x34\00C3\00C3\00\00159\000\001", null, !8, !4, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!49 = !{!"0x34\00C4\00C4\00\00160\000\001", null, !8, !4, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!50 = !{!"0x34\00C5\00C5\00\00161\000\001", null, !8, !4, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!51 = !{!"0x34\00C6\00C6\00\00162\000\001", null, !8, !4, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!52 = !{!"0x34\00C7\00C7\00\00163\000\001", null, !8, !4, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!53 = !{!"0x34\00C8\00C8\00\00164\000\001", null, !8, !4, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!54 = !{!"0x34\00D1\00D1\00\00166\000\001", null, !8, !4, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!55 = !{!"0x34\00D2\00D2\00\00167\000\001", null, !8, !4, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!56 = !{!"0x34\00D3\00D3\00\00168\000\001", null, !8, !4, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!57 = !{!"0x34\00E2\00E2\00\00170\000\001", null, !8, !4, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!58 = !{!"0x34\00E3\00E3\00\00171\000\001", null, !8, !4, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!59 = !{!"0x34\00nulltime\00nulltime\00\00129\000\001", null, !8, !4, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!60 = !{!"0x34\00TimeArray\00TimeArray\00\00129\000\001", null, !8, !61, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!61 = !{!"0x1\00\000\00192\0064\000\000\000", null, null, !4, !62, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!62 = !{!63}
!63 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!64 = !{!"0x34\00TLimit\00TLimit\00\00130\000\001", null, !8, !4, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!65 = !{!"0x34\00T\00T\00\00133\000\001", null, !8, !66, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!66 = !{!"0x1\00\000\002304\0064\000\000\000", null, null, !4, !67, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!67 = !{!68}
!68 = !{!"0x21\000\0036"}                         ; [ DW_TAG_subrange_type ] [0, 35]
!69 = !{!"0x34\00sa\00sa\00\00136\000\001", null, !8, !4, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!70 = !{!"0x34\00sb\00sb\00\00136\000\001", null, !8, !4, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!71 = !{!"0x34\00sc\00sc\00\00136\000\001", null, !8, !4, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!72 = !{!"0x34\00sd\00sd\00\00136\000\001", null, !8, !4, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!73 = !{!"0x34\00one\00one\00\00136\000\001", null, !8, !4, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!74 = !{!"0x34\00two\00two\00\00136\000\001", null, !8, !4, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!75 = !{!"0x34\00three\00three\00\00136\000\001", null, !8, !4, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!76 = !{!"0x34\00four\00four\00\00137\000\001", null, !8, !4, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!77 = !{!"0x34\00five\00five\00\00137\000\001", null, !8, !4, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!78 = !{!"0x34\00piref\00piref\00\00137\000\001", null, !8, !4, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!79 = !{!"0x34\00piprg\00piprg\00\00137\000\001", null, !8, !4, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!80 = !{!"0x34\00scale\00scale\00\00138\000\001", null, !8, !4, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!81 = !{!"0x34\00pierr\00pierr\00\00138\000\001", null, !8, !4, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!82 = !{!"0x34\00tnow\00tnow\00\00984\000\001", null, !8, !83, %struct.timeval* @tnow, null} ; [ DW_TAG_variable ] [tnow] [line 984] [def]
!83 = !{!"0x13\00timeval\0030\00128\0064\000\000\000", !84, null, null, !85, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!84 = !{!"/usr/include/x86_64-linux-gnu/bits/time.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!85 = !{!86, !89}
!86 = !{!"0xd\00tv_sec\0032\0064\0064\000\000", !84, !83, !87} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!87 = !{!"0x16\00__time_t\00139\000\000\000\000", !88, null, !5} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!88 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!89 = !{!"0xd\00tv_usec\0033\0064\0064\0064\000", !84, !83, !90} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!90 = !{!"0x16\00__suseconds_t\00141\000\000\000\000", !88, null, !5} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!91 = !{i32 2, !"Dwarf Version", i32 4}
!92 = !{i32 2, !"Debug Info Version", i32 2}
!93 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!94 = !MDLocation(line: 185, column: 4, scope: !7)
!95 = !MDLocation(line: 186, column: 4, scope: !7)
!96 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!97 = !MDLocation(line: 182, column: 9, scope: !7)
!98 = !MDLocation(line: 207, column: 4, scope: !7)
!99 = !{!100, !100, i64 0}
!100 = !{!"double", !101, i64 0}
!101 = !{!"omnipotent char", !102, i64 0}
!102 = !{!"Simple C/C++ TBAA"}
!103 = !MDLocation(line: 209, column: 4, scope: !7)
!104 = !MDLocation(line: 182, column: 16, scope: !7)
!105 = !MDLocation(line: 212, column: 4, scope: !7)
!106 = !MDLocation(line: 213, column: 4, scope: !7)
!107 = !MDLocation(line: 214, column: 4, scope: !7)
!108 = !MDLocation(line: 215, column: 4, scope: !7)
!109 = !MDLocation(line: 216, column: 4, scope: !7)
!110 = !MDLocation(line: 217, column: 4, scope: !7)
!111 = !MDLocation(line: 218, column: 4, scope: !7)
!112 = !MDLocation(line: 220, column: 4, scope: !7)
!113 = !MDLocation(line: 221, column: 4, scope: !7)
!114 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !115} ; [ DW_TAG_arg_variable ] [p] [line 987]
!115 = !MDLocation(line: 226, column: 4, scope: !7)
!116 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !115)
!117 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !115)
!118 = !{!"0x100\00q\00989\000", !23, !8, !4, !115} ; [ DW_TAG_auto_variable ] [q] [line 989]
!119 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !115)
!120 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !115)
!121 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !115)
!122 = !{!123, !124, i64 0}
!123 = !{!"timeval", !124, i64 0, !124, i64 8}
!124 = !{!"long", !101, i64 0}
!125 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !115)
!126 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !115)
!127 = !{!123, !124, i64 8}
!128 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !115)
!129 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !115)
!130 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !115)
!131 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !115)
!132 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !133} ; [ DW_TAG_arg_variable ] [p] [line 987]
!133 = !MDLocation(line: 227, column: 4, scope: !7)
!134 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !133)
!135 = !{!"0x100\00q\00989\000", !23, !8, !4, !133} ; [ DW_TAG_auto_variable ] [q] [line 989]
!136 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !133)
!137 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !133)
!138 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !133)
!139 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !133)
!140 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !133)
!141 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !133)
!142 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !133)
!143 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !133)
!144 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !133)
!145 = !MDLocation(line: 183, column: 24, scope: !7)
!146 = !MDLocation(line: 238, column: 4, scope: !7)
!147 = !MDLocation(line: 240, column: 4, scope: !7)
!148 = !MDLocation(line: 240, column: 17, scope: !7)
!149 = !MDLocation(line: 240, column: 12, scope: !7)
!150 = !MDLocation(line: 242, column: 8, scope: !151)
!151 = !{!"0xb\00241\004\000", !1, !7}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!152 = !MDLocation(line: 243, column: 8, scope: !151)
!153 = !MDLocation(line: 243, column: 14, scope: !151)
!154 = !MDLocation(line: 179, column: 19, scope: !7)
!155 = !MDLocation(line: 179, column: 11, scope: !7)
!156 = !MDLocation(line: 179, column: 15, scope: !7)
!157 = !MDLocation(line: 179, column: 17, scope: !7)
!158 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !159} ; [ DW_TAG_arg_variable ] [p] [line 987]
!159 = !MDLocation(line: 248, column: 8, scope: !151)
!160 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !159)
!161 = !{!"0x100\00q\00989\000", !23, !8, !4, !159} ; [ DW_TAG_auto_variable ] [q] [line 989]
!162 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !159)
!163 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !159)
!164 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !159)
!165 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !159)
!166 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !159)
!167 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !159)
!168 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !159)
!169 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !159)
!170 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !159)
!171 = !MDLocation(line: 183, column: 18, scope: !7)
!172 = !MDLocation(line: 249, column: 26, scope: !173)
!173 = !{!"0xb\00249\008\002", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!174 = !{!"0xb\00249\008\001", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!175 = !MDLocation(line: 249, column: 21, scope: !173)
!176 = !MDLocation(line: 249, column: 8, scope: !174)
!177 = !MDLocation(line: 253, column: 17, scope: !178)
!178 = !{!"0xb\00250\008\003", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!179 = !MDLocation(line: 253, column: 23, scope: !178)
!180 = !MDLocation(line: 253, column: 28, scope: !178)
!181 = !MDLocation(line: 253, column: 45, scope: !178)
!182 = !MDLocation(line: 253, column: 50, scope: !178)
!183 = !MDLocation(line: 253, column: 26, scope: !178)
!184 = !MDLocation(line: 251, column: 12, scope: !178)
!185 = !MDLocation(line: 252, column: 12, scope: !178)
!186 = !MDLocation(line: 179, column: 13, scope: !7)
!187 = !MDLocation(line: 253, column: 48, scope: !178)
!188 = !MDLocation(line: 253, column: 20, scope: !178)
!189 = !MDLocation(line: 253, column: 16, scope: !178)
!190 = !MDLocation(line: 253, column: 12, scope: !178)
!191 = !MDLocation(line: 249, column: 32, scope: !173)
!192 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !193} ; [ DW_TAG_arg_variable ] [p] [line 987]
!193 = !MDLocation(line: 255, column: 8, scope: !151)
!194 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !193)
!195 = !{!"0x100\00q\00989\000", !23, !8, !4, !193} ; [ DW_TAG_auto_variable ] [q] [line 989]
!196 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !193)
!197 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !193)
!198 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !193)
!199 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !193)
!200 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !193)
!201 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !193)
!202 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !193)
!203 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !193)
!204 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !193)
!205 = !MDLocation(line: 256, column: 8, scope: !151)
!206 = !MDLocation(line: 258, column: 9, scope: !207)
!207 = !{!"0xb\00258\009\004", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!208 = !MDLocation(line: 258, column: 9, scope: !151)
!209 = !MDLocation(line: 264, column: 4, scope: !7)
!210 = !MDLocation(line: 266, column: 4, scope: !7)
!211 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !212} ; [ DW_TAG_arg_variable ] [p] [line 987]
!212 = !MDLocation(line: 271, column: 4, scope: !7)
!213 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !212)
!214 = !{!"0x100\00q\00989\000", !23, !8, !4, !212} ; [ DW_TAG_auto_variable ] [q] [line 989]
!215 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !212)
!216 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !212)
!217 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !212)
!218 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !212)
!219 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !212)
!220 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !212)
!221 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !212)
!222 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !212)
!223 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !212)
!224 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !225} ; [ DW_TAG_arg_variable ] [p] [line 987]
!225 = !MDLocation(line: 275, column: 4, scope: !7)
!226 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !225)
!227 = !{!"0x100\00q\00989\000", !23, !8, !4, !225} ; [ DW_TAG_auto_variable ] [q] [line 989]
!228 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !225)
!229 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !225)
!230 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !225)
!231 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !225)
!232 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !225)
!233 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !225)
!234 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !225)
!235 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !225)
!236 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !225)
!237 = !MDLocation(line: 276, column: 15, scope: !7)
!238 = !MDLocation(line: 277, column: 9, scope: !239)
!239 = !{!"0xb\00277\009\008", !1, !7}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!240 = !MDLocation(line: 277, column: 9, scope: !7)
!241 = !MDLocation(line: 276, column: 4, scope: !7)
!242 = !MDLocation(line: 279, column: 18, scope: !7)
!243 = !MDLocation(line: 279, column: 11, scope: !7)
!244 = !MDLocation(line: 279, column: 4, scope: !7)
!245 = !MDLocation(line: 281, column: 10, scope: !7)
!246 = !MDLocation(line: 281, column: 13, scope: !7)
!247 = !MDLocation(line: 281, column: 16, scope: !7)
!248 = !MDLocation(line: 281, column: 21, scope: !7)
!249 = !MDLocation(line: 281, column: 28, scope: !7)
!250 = !MDLocation(line: 281, column: 31, scope: !7)
!251 = !MDLocation(line: 281, column: 9, scope: !7)
!252 = !MDLocation(line: 284, column: 11, scope: !7)
!253 = !MDLocation(line: 284, column: 4, scope: !7)
!254 = !MDLocation(line: 285, column: 15, scope: !7)
!255 = !MDLocation(line: 285, column: 25, scope: !7)
!256 = !MDLocation(line: 285, column: 9, scope: !7)
!257 = !MDLocation(line: 285, column: 4, scope: !7)
!258 = !MDLocation(line: 286, column: 9, scope: !7)
!259 = !MDLocation(line: 286, column: 4, scope: !7)
!260 = !MDLocation(line: 287, column: 35, scope: !7)
!261 = !MDLocation(line: 287, column: 27, scope: !7)
!262 = !MDLocation(line: 287, column: 17, scope: !7)
!263 = !MDLocation(line: 287, column: 48, scope: !7)
!264 = !MDLocation(line: 287, column: 9, scope: !7)
!265 = !MDLocation(line: 288, column: 9, scope: !7)
!266 = !MDLocation(line: 288, column: 4, scope: !7)
!267 = !MDLocation(line: 289, column: 11, scope: !7)
!268 = !MDLocation(line: 289, column: 4, scope: !7)
!269 = !MDLocation(line: 295, column: 11, scope: !7)
!270 = !MDLocation(line: 296, column: 11, scope: !7)
!271 = !MDLocation(line: 297, column: 11, scope: !7)
!272 = !MDLocation(line: 294, column: 4, scope: !7)
!273 = !MDLocation(line: 183, column: 21, scope: !7)
!274 = !MDLocation(line: 310, column: 10, scope: !7)
!275 = !MDLocation(line: 311, column: 10, scope: !7)
!276 = !MDLocation(line: 311, column: 9, scope: !7)
!277 = !MDLocation(line: 311, column: 4, scope: !7)
!278 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !279} ; [ DW_TAG_arg_variable ] [p] [line 987]
!279 = !MDLocation(line: 313, column: 4, scope: !7)
!280 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !279)
!281 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !279)
!282 = !{!"0x100\00q\00989\000", !23, !8, !4, !279} ; [ DW_TAG_auto_variable ] [q] [line 989]
!283 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !279)
!284 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !279)
!285 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !279)
!286 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !279)
!287 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !279)
!288 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !279)
!289 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !279)
!290 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !279)
!291 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !279)
!292 = !MDLocation(line: 310, column: 9, scope: !7)
!293 = !MDLocation(line: 314, column: 18, scope: !294)
!294 = !{!"0xb\00314\004\0010", !1, !295}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!295 = !{!"0xb\00314\004\009", !1, !7}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!296 = !MDLocation(line: 314, column: 4, scope: !295)
!297 = !MDLocation(line: 317, column: 4, scope: !298)
!298 = !{!"0xb\00315\004\0011", !1, !294}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!299 = !MDLocation(line: 317, column: 9, scope: !298)
!300 = !MDLocation(line: 314, column: 27, scope: !294)
!301 = distinct !{!301, !302}
!302 = !{!"llvm.loop.unroll.disable"}
!303 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !304} ; [ DW_TAG_arg_variable ] [p] [line 987]
!304 = !MDLocation(line: 319, column: 4, scope: !7)
!305 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !304)
!306 = !{!"0x100\00q\00989\000", !23, !8, !4, !304} ; [ DW_TAG_auto_variable ] [q] [line 989]
!307 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !304)
!308 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !304)
!309 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !304)
!310 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !304)
!311 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !304)
!312 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !304)
!313 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !304)
!314 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !304)
!315 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !304)
!316 = !MDLocation(line: 320, column: 11, scope: !7)
!317 = !MDLocation(line: 321, column: 9, scope: !318)
!318 = !{!"0xb\00321\009\0012", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!319 = !MDLocation(line: 321, column: 9, scope: !7)
!320 = !MDLocation(line: 320, column: 4, scope: !7)
!321 = !MDLocation(line: 323, column: 11, scope: !7)
!322 = !MDLocation(line: 323, column: 4, scope: !7)
!323 = !MDLocation(line: 325, column: 8, scope: !7)
!324 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !325} ; [ DW_TAG_arg_variable ] [p] [line 987]
!325 = !MDLocation(line: 330, column: 4, scope: !7)
!326 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !325)
!327 = !{!"0x100\00q\00989\000", !23, !8, !4, !325} ; [ DW_TAG_auto_variable ] [q] [line 989]
!328 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !325)
!329 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !325)
!330 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !325)
!331 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !325)
!332 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !325)
!333 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !325)
!334 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !325)
!335 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !325)
!336 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !325)
!337 = !MDLocation(line: 331, column: 4, scope: !338)
!338 = !{!"0xb\00331\004\0013", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!339 = !MDLocation(line: 335, column: 13, scope: !340)
!340 = !{!"0xb\00332\004\0015", !1, !341}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!341 = !{!"0xb\00331\004\0014", !1, !338}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!342 = !MDLocation(line: 334, column: 4, scope: !340)
!343 = !MDLocation(line: 333, column: 9, scope: !340)
!344 = !MDLocation(line: 334, column: 9, scope: !340)
!345 = !MDLocation(line: 335, column: 9, scope: !340)
!346 = !MDLocation(line: 336, column: 13, scope: !340)
!347 = !MDLocation(line: 336, column: 9, scope: !340)
!348 = !MDLocation(line: 337, column: 13, scope: !340)
!349 = !MDLocation(line: 337, column: 9, scope: !340)
!350 = !MDLocation(line: 338, column: 13, scope: !340)
!351 = !MDLocation(line: 338, column: 9, scope: !340)
!352 = !MDLocation(line: 331, column: 27, scope: !341)
!353 = distinct !{!353, !302}
!354 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !355} ; [ DW_TAG_arg_variable ] [p] [line 987]
!355 = !MDLocation(line: 340, column: 4, scope: !7)
!356 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !355)
!357 = !{!"0x100\00q\00989\000", !23, !8, !4, !355} ; [ DW_TAG_auto_variable ] [q] [line 989]
!358 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !355)
!359 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !355)
!360 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !355)
!361 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !355)
!362 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !355)
!363 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !355)
!364 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !355)
!365 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !355)
!366 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !355)
!367 = !MDLocation(line: 341, column: 11, scope: !7)
!368 = !MDLocation(line: 341, column: 4, scope: !7)
!369 = !MDLocation(line: 343, column: 20, scope: !7)
!370 = !MDLocation(line: 343, column: 13, scope: !7)
!371 = !MDLocation(line: 343, column: 11, scope: !7)
!372 = !MDLocation(line: 343, column: 4, scope: !7)
!373 = !MDLocation(line: 344, column: 17, scope: !7)
!374 = !MDLocation(line: 344, column: 27, scope: !7)
!375 = !MDLocation(line: 344, column: 9, scope: !7)
!376 = !MDLocation(line: 345, column: 9, scope: !7)
!377 = !MDLocation(line: 345, column: 20, scope: !7)
!378 = !MDLocation(line: 345, column: 4, scope: !7)
!379 = !MDLocation(line: 346, column: 14, scope: !7)
!380 = !MDLocation(line: 346, column: 9, scope: !7)
!381 = !MDLocation(line: 346, column: 4, scope: !7)
!382 = !MDLocation(line: 347, column: 4, scope: !7)
!383 = !MDLocation(line: 348, column: 23, scope: !7)
!384 = !MDLocation(line: 348, column: 17, scope: !7)
!385 = !MDLocation(line: 348, column: 12, scope: !7)
!386 = !MDLocation(line: 348, column: 4, scope: !7)
!387 = !MDLocation(line: 349, column: 20, scope: !7)
!388 = !MDLocation(line: 349, column: 12, scope: !7)
!389 = !MDLocation(line: 349, column: 4, scope: !7)
!390 = !MDLocation(line: 350, column: 12, scope: !7)
!391 = !MDLocation(line: 350, column: 4, scope: !7)
!392 = !MDLocation(line: 356, column: 11, scope: !7)
!393 = !MDLocation(line: 357, column: 11, scope: !7)
!394 = !MDLocation(line: 358, column: 11, scope: !7)
!395 = !MDLocation(line: 355, column: 4, scope: !7)
!396 = !MDLocation(line: 369, column: 8, scope: !7)
!397 = !MDLocation(line: 369, column: 18, scope: !7)
!398 = !MDLocation(line: 369, column: 26, scope: !7)
!399 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !400} ; [ DW_TAG_arg_variable ] [p] [line 987]
!400 = !MDLocation(line: 373, column: 4, scope: !7)
!401 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !400)
!402 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !400)
!403 = !{!"0x100\00q\00989\000", !23, !8, !4, !400} ; [ DW_TAG_auto_variable ] [q] [line 989]
!404 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !400)
!405 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !400)
!406 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !400)
!407 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !400)
!408 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !400)
!409 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !400)
!410 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !400)
!411 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !400)
!412 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !400)
!413 = !MDLocation(line: 374, column: 22, scope: !414)
!414 = !{!"0xb\00374\004\0017", !1, !415}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!415 = !{!"0xb\00374\004\0016", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!416 = !MDLocation(line: 374, column: 17, scope: !414)
!417 = !MDLocation(line: 374, column: 4, scope: !415)
!418 = !MDLocation(line: 376, column: 12, scope: !419)
!419 = !{!"0xb\00375\004\0018", !1, !414}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!420 = !MDLocation(line: 379, column: 22, scope: !419)
!421 = !MDLocation(line: 379, column: 27, scope: !419)
!422 = !MDLocation(line: 379, column: 33, scope: !419)
!423 = !MDLocation(line: 379, column: 39, scope: !419)
!424 = !MDLocation(line: 379, column: 45, scope: !419)
!425 = !MDLocation(line: 379, column: 51, scope: !419)
!426 = !MDLocation(line: 376, column: 8, scope: !419)
!427 = !MDLocation(line: 377, column: 8, scope: !419)
!428 = !MDLocation(line: 378, column: 8, scope: !419)
!429 = !MDLocation(line: 379, column: 21, scope: !419)
!430 = !MDLocation(line: 379, column: 20, scope: !419)
!431 = !MDLocation(line: 379, column: 19, scope: !419)
!432 = !MDLocation(line: 379, column: 18, scope: !419)
!433 = !MDLocation(line: 379, column: 17, scope: !419)
!434 = !MDLocation(line: 379, column: 12, scope: !419)
!435 = !MDLocation(line: 379, column: 8, scope: !419)
!436 = !MDLocation(line: 374, column: 28, scope: !414)
!437 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !438} ; [ DW_TAG_arg_variable ] [p] [line 987]
!438 = !MDLocation(line: 381, column: 4, scope: !7)
!439 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !438)
!440 = !{!"0x100\00q\00989\000", !23, !8, !4, !438} ; [ DW_TAG_auto_variable ] [q] [line 989]
!441 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !438)
!442 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !438)
!443 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !438)
!444 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !438)
!445 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !438)
!446 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !438)
!447 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !438)
!448 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !438)
!449 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !438)
!450 = !MDLocation(line: 382, column: 12, scope: !7)
!451 = !MDLocation(line: 382, column: 34, scope: !7)
!452 = !MDLocation(line: 382, column: 4, scope: !7)
!453 = !MDLocation(line: 384, column: 9, scope: !7)
!454 = !MDLocation(line: 384, column: 17, scope: !7)
!455 = !MDLocation(line: 385, column: 9, scope: !7)
!456 = !MDLocation(line: 386, column: 19, scope: !7)
!457 = !MDLocation(line: 386, column: 24, scope: !7)
!458 = !MDLocation(line: 386, column: 18, scope: !7)
!459 = !MDLocation(line: 386, column: 30, scope: !7)
!460 = !MDLocation(line: 386, column: 17, scope: !7)
!461 = !MDLocation(line: 386, column: 36, scope: !7)
!462 = !MDLocation(line: 386, column: 16, scope: !7)
!463 = !MDLocation(line: 386, column: 42, scope: !7)
!464 = !MDLocation(line: 386, column: 15, scope: !7)
!465 = !MDLocation(line: 386, column: 48, scope: !7)
!466 = !MDLocation(line: 386, column: 14, scope: !7)
!467 = !MDLocation(line: 386, column: 54, scope: !7)
!468 = !MDLocation(line: 386, column: 9, scope: !7)
!469 = !MDLocation(line: 388, column: 12, scope: !7)
!470 = !MDLocation(line: 388, column: 4, scope: !7)
!471 = !MDLocation(line: 389, column: 20, scope: !7)
!472 = !MDLocation(line: 389, column: 15, scope: !7)
!473 = !MDLocation(line: 389, column: 9, scope: !7)
!474 = !MDLocation(line: 389, column: 4, scope: !7)
!475 = !MDLocation(line: 390, column: 4, scope: !7)
!476 = !MDLocation(line: 391, column: 9, scope: !7)
!477 = !MDLocation(line: 391, column: 4, scope: !7)
!478 = !MDLocation(line: 392, column: 12, scope: !7)
!479 = !MDLocation(line: 392, column: 4, scope: !7)
!480 = !MDLocation(line: 398, column: 11, scope: !7)
!481 = !MDLocation(line: 399, column: 11, scope: !7)
!482 = !MDLocation(line: 400, column: 11, scope: !7)
!483 = !MDLocation(line: 397, column: 4, scope: !7)
!484 = !MDLocation(line: 410, column: 10, scope: !7)
!485 = !MDLocation(line: 410, column: 9, scope: !7)
!486 = !MDLocation(line: 410, column: 4, scope: !7)
!487 = !MDLocation(line: 411, column: 10, scope: !7)
!488 = !MDLocation(line: 411, column: 9, scope: !7)
!489 = !MDLocation(line: 411, column: 4, scope: !7)
!490 = !MDLocation(line: 412, column: 8, scope: !7)
!491 = !MDLocation(line: 412, column: 18, scope: !7)
!492 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !493} ; [ DW_TAG_arg_variable ] [p] [line 987]
!493 = !MDLocation(line: 416, column: 4, scope: !7)
!494 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !493)
!495 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !493)
!496 = !{!"0x100\00q\00989\000", !23, !8, !4, !493} ; [ DW_TAG_auto_variable ] [q] [line 989]
!497 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !493)
!498 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !493)
!499 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !493)
!500 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !493)
!501 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !493)
!502 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !493)
!503 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !493)
!504 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !493)
!505 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !493)
!506 = !MDLocation(line: 417, column: 4, scope: !507)
!507 = !{!"0xb\00417\004\0019", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!508 = !MDLocation(line: 421, column: 27, scope: !509)
!509 = !{!"0xb\00418\004\0021", !1, !510}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!510 = !{!"0xb\00417\004\0020", !1, !507}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!511 = !MDLocation(line: 421, column: 32, scope: !509)
!512 = !MDLocation(line: 421, column: 36, scope: !509)
!513 = !MDLocation(line: 421, column: 40, scope: !509)
!514 = !MDLocation(line: 421, column: 44, scope: !509)
!515 = !MDLocation(line: 421, column: 48, scope: !509)
!516 = !MDLocation(line: 421, column: 52, scope: !509)
!517 = !MDLocation(line: 419, column: 8, scope: !509)
!518 = !MDLocation(line: 420, column: 8, scope: !509)
!519 = !MDLocation(line: 421, column: 24, scope: !509)
!520 = !MDLocation(line: 421, column: 21, scope: !509)
!521 = !MDLocation(line: 421, column: 18, scope: !509)
!522 = !MDLocation(line: 421, column: 15, scope: !509)
!523 = !MDLocation(line: 421, column: 12, scope: !509)
!524 = !MDLocation(line: 421, column: 8, scope: !509)
!525 = !MDLocation(line: 417, column: 28, scope: !510)
!526 = !MDLocation(line: 417, column: 17, scope: !510)
!527 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !528} ; [ DW_TAG_arg_variable ] [p] [line 987]
!528 = !MDLocation(line: 423, column: 4, scope: !7)
!529 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !528)
!530 = !{!"0x100\00q\00989\000", !23, !8, !4, !528} ; [ DW_TAG_auto_variable ] [q] [line 989]
!531 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !528)
!532 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !528)
!533 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !528)
!534 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !528)
!535 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !528)
!536 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !528)
!537 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !528)
!538 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !528)
!539 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !528)
!540 = !MDLocation(line: 424, column: 13, scope: !7)
!541 = !MDLocation(line: 424, column: 35, scope: !7)
!542 = !MDLocation(line: 424, column: 4, scope: !7)
!543 = !MDLocation(line: 426, column: 9, scope: !7)
!544 = !MDLocation(line: 426, column: 17, scope: !7)
!545 = !MDLocation(line: 427, column: 9, scope: !7)
!546 = !MDLocation(line: 428, column: 24, scope: !7)
!547 = !MDLocation(line: 428, column: 29, scope: !7)
!548 = !MDLocation(line: 428, column: 21, scope: !7)
!549 = !MDLocation(line: 428, column: 33, scope: !7)
!550 = !MDLocation(line: 428, column: 18, scope: !7)
!551 = !MDLocation(line: 428, column: 37, scope: !7)
!552 = !MDLocation(line: 428, column: 15, scope: !7)
!553 = !MDLocation(line: 428, column: 41, scope: !7)
!554 = !MDLocation(line: 428, column: 12, scope: !7)
!555 = !MDLocation(line: 428, column: 45, scope: !7)
!556 = !MDLocation(line: 428, column: 9, scope: !7)
!557 = !MDLocation(line: 428, column: 49, scope: !7)
!558 = !MDLocation(line: 430, column: 12, scope: !7)
!559 = !MDLocation(line: 430, column: 4, scope: !7)
!560 = !MDLocation(line: 431, column: 15, scope: !7)
!561 = !MDLocation(line: 431, column: 26, scope: !7)
!562 = !MDLocation(line: 431, column: 9, scope: !7)
!563 = !MDLocation(line: 431, column: 4, scope: !7)
!564 = !MDLocation(line: 434, column: 19, scope: !7)
!565 = !MDLocation(line: 434, column: 24, scope: !7)
!566 = !MDLocation(line: 434, column: 18, scope: !7)
!567 = !MDLocation(line: 434, column: 30, scope: !7)
!568 = !MDLocation(line: 434, column: 17, scope: !7)
!569 = !MDLocation(line: 434, column: 36, scope: !7)
!570 = !MDLocation(line: 434, column: 16, scope: !7)
!571 = !MDLocation(line: 434, column: 42, scope: !7)
!572 = !MDLocation(line: 434, column: 15, scope: !7)
!573 = !MDLocation(line: 434, column: 48, scope: !7)
!574 = !MDLocation(line: 434, column: 14, scope: !7)
!575 = !MDLocation(line: 434, column: 54, scope: !7)
!576 = !MDLocation(line: 434, column: 9, scope: !7)
!577 = !MDLocation(line: 434, column: 4, scope: !7)
!578 = !MDLocation(line: 435, column: 9, scope: !7)
!579 = !MDLocation(line: 435, column: 4, scope: !7)
!580 = !MDLocation(line: 436, column: 12, scope: !7)
!581 = !MDLocation(line: 436, column: 4, scope: !7)
!582 = !MDLocation(line: 442, column: 11, scope: !7)
!583 = !MDLocation(line: 443, column: 11, scope: !7)
!584 = !MDLocation(line: 444, column: 11, scope: !7)
!585 = !MDLocation(line: 441, column: 4, scope: !7)
!586 = !MDLocation(line: 455, column: 8, scope: !7)
!587 = !MDLocation(line: 455, column: 18, scope: !7)
!588 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !589} ; [ DW_TAG_arg_variable ] [p] [line 987]
!589 = !MDLocation(line: 459, column: 4, scope: !7)
!590 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !589)
!591 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !589)
!592 = !{!"0x100\00q\00989\000", !23, !8, !4, !589} ; [ DW_TAG_auto_variable ] [q] [line 989]
!593 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !589)
!594 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !589)
!595 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !589)
!596 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !589)
!597 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !589)
!598 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !589)
!599 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !589)
!600 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !589)
!601 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !589)
!602 = !MDLocation(line: 460, column: 4, scope: !603)
!603 = !{!"0xb\00460\004\0022", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!604 = !MDLocation(line: 464, column: 18, scope: !605)
!605 = !{!"0xb\00461\004\0024", !1, !606}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!606 = !{!"0xb\00460\004\0023", !1, !603}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!607 = !MDLocation(line: 464, column: 23, scope: !605)
!608 = !MDLocation(line: 464, column: 29, scope: !605)
!609 = !MDLocation(line: 464, column: 35, scope: !605)
!610 = !MDLocation(line: 464, column: 41, scope: !605)
!611 = !MDLocation(line: 464, column: 47, scope: !605)
!612 = !MDLocation(line: 464, column: 53, scope: !605)
!613 = !MDLocation(line: 465, column: 32, scope: !605)
!614 = !MDLocation(line: 465, column: 37, scope: !605)
!615 = !MDLocation(line: 465, column: 41, scope: !605)
!616 = !MDLocation(line: 465, column: 45, scope: !605)
!617 = !MDLocation(line: 465, column: 49, scope: !605)
!618 = !MDLocation(line: 465, column: 53, scope: !605)
!619 = !MDLocation(line: 464, column: 13, scope: !605)
!620 = !MDLocation(line: 464, column: 14, scope: !605)
!621 = !MDLocation(line: 464, column: 15, scope: !605)
!622 = !MDLocation(line: 464, column: 16, scope: !605)
!623 = !MDLocation(line: 464, column: 17, scope: !605)
!624 = !MDLocation(line: 462, column: 8, scope: !605)
!625 = !MDLocation(line: 463, column: 8, scope: !605)
!626 = !MDLocation(line: 464, column: 8, scope: !605)
!627 = !MDLocation(line: 465, column: 17, scope: !605)
!628 = !MDLocation(line: 465, column: 12, scope: !605)
!629 = !MDLocation(line: 465, column: 8, scope: !605)
!630 = !MDLocation(line: 460, column: 28, scope: !606)
!631 = !MDLocation(line: 460, column: 17, scope: !606)
!632 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !633} ; [ DW_TAG_arg_variable ] [p] [line 987]
!633 = !MDLocation(line: 467, column: 4, scope: !7)
!634 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !633)
!635 = !{!"0x100\00q\00989\000", !23, !8, !4, !633} ; [ DW_TAG_auto_variable ] [q] [line 989]
!636 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !633)
!637 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !633)
!638 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !633)
!639 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !633)
!640 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !633)
!641 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !633)
!642 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !633)
!643 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !633)
!644 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !633)
!645 = !MDLocation(line: 468, column: 13, scope: !7)
!646 = !MDLocation(line: 468, column: 35, scope: !7)
!647 = !MDLocation(line: 468, column: 4, scope: !7)
!648 = !MDLocation(line: 470, column: 9, scope: !7)
!649 = !MDLocation(line: 470, column: 17, scope: !7)
!650 = !MDLocation(line: 471, column: 9, scope: !7)
!651 = !MDLocation(line: 472, column: 17, scope: !7)
!652 = !MDLocation(line: 472, column: 22, scope: !7)
!653 = !MDLocation(line: 472, column: 16, scope: !7)
!654 = !MDLocation(line: 472, column: 28, scope: !7)
!655 = !MDLocation(line: 472, column: 15, scope: !7)
!656 = !MDLocation(line: 472, column: 34, scope: !7)
!657 = !MDLocation(line: 472, column: 14, scope: !7)
!658 = !MDLocation(line: 472, column: 40, scope: !7)
!659 = !MDLocation(line: 472, column: 13, scope: !7)
!660 = !MDLocation(line: 472, column: 46, scope: !7)
!661 = !MDLocation(line: 472, column: 12, scope: !7)
!662 = !MDLocation(line: 472, column: 52, scope: !7)
!663 = !MDLocation(line: 472, column: 9, scope: !7)
!664 = !MDLocation(line: 473, column: 24, scope: !7)
!665 = !MDLocation(line: 473, column: 29, scope: !7)
!666 = !MDLocation(line: 473, column: 21, scope: !7)
!667 = !MDLocation(line: 473, column: 33, scope: !7)
!668 = !MDLocation(line: 473, column: 18, scope: !7)
!669 = !MDLocation(line: 473, column: 37, scope: !7)
!670 = !MDLocation(line: 473, column: 15, scope: !7)
!671 = !MDLocation(line: 473, column: 41, scope: !7)
!672 = !MDLocation(line: 473, column: 12, scope: !7)
!673 = !MDLocation(line: 473, column: 45, scope: !7)
!674 = !MDLocation(line: 473, column: 9, scope: !7)
!675 = !MDLocation(line: 474, column: 9, scope: !7)
!676 = !MDLocation(line: 476, column: 12, scope: !7)
!677 = !MDLocation(line: 476, column: 4, scope: !7)
!678 = !MDLocation(line: 477, column: 20, scope: !7)
!679 = !MDLocation(line: 477, column: 15, scope: !7)
!680 = !MDLocation(line: 477, column: 9, scope: !7)
!681 = !MDLocation(line: 477, column: 4, scope: !7)
!682 = !MDLocation(line: 478, column: 4, scope: !7)
!683 = !MDLocation(line: 479, column: 9, scope: !7)
!684 = !MDLocation(line: 479, column: 4, scope: !7)
!685 = !MDLocation(line: 480, column: 12, scope: !7)
!686 = !MDLocation(line: 480, column: 4, scope: !7)
!687 = !MDLocation(line: 486, column: 11, scope: !7)
!688 = !MDLocation(line: 487, column: 11, scope: !7)
!689 = !MDLocation(line: 488, column: 11, scope: !7)
!690 = !MDLocation(line: 485, column: 4, scope: !7)
!691 = !MDLocation(line: 499, column: 8, scope: !7)
!692 = !MDLocation(line: 499, column: 18, scope: !7)
!693 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !694} ; [ DW_TAG_arg_variable ] [p] [line 987]
!694 = !MDLocation(line: 503, column: 4, scope: !7)
!695 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !694)
!696 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !694)
!697 = !{!"0x100\00q\00989\000", !23, !8, !4, !694} ; [ DW_TAG_auto_variable ] [q] [line 989]
!698 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !694)
!699 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !694)
!700 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !694)
!701 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !694)
!702 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !694)
!703 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !694)
!704 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !694)
!705 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !694)
!706 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !694)
!707 = !MDLocation(line: 504, column: 4, scope: !708)
!708 = !{!"0xb\00504\004\0025", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!709 = !MDLocation(line: 508, column: 18, scope: !710)
!710 = !{!"0xb\00505\004\0027", !1, !711}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!711 = !{!"0xb\00504\004\0026", !1, !708}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!712 = !MDLocation(line: 508, column: 23, scope: !710)
!713 = !MDLocation(line: 508, column: 29, scope: !710)
!714 = !MDLocation(line: 508, column: 35, scope: !710)
!715 = !MDLocation(line: 508, column: 41, scope: !710)
!716 = !MDLocation(line: 508, column: 47, scope: !710)
!717 = !MDLocation(line: 508, column: 53, scope: !710)
!718 = !MDLocation(line: 509, column: 30, scope: !710)
!719 = !MDLocation(line: 509, column: 35, scope: !710)
!720 = !MDLocation(line: 509, column: 39, scope: !710)
!721 = !MDLocation(line: 509, column: 43, scope: !710)
!722 = !MDLocation(line: 509, column: 47, scope: !710)
!723 = !MDLocation(line: 509, column: 51, scope: !710)
!724 = !MDLocation(line: 508, column: 13, scope: !710)
!725 = !MDLocation(line: 508, column: 14, scope: !710)
!726 = !MDLocation(line: 508, column: 15, scope: !710)
!727 = !MDLocation(line: 508, column: 16, scope: !710)
!728 = !MDLocation(line: 508, column: 17, scope: !710)
!729 = !MDLocation(line: 506, column: 8, scope: !710)
!730 = !MDLocation(line: 507, column: 8, scope: !710)
!731 = !MDLocation(line: 508, column: 8, scope: !710)
!732 = !MDLocation(line: 509, column: 15, scope: !710)
!733 = !MDLocation(line: 509, column: 12, scope: !710)
!734 = !MDLocation(line: 509, column: 8, scope: !710)
!735 = !MDLocation(line: 504, column: 28, scope: !711)
!736 = !MDLocation(line: 504, column: 17, scope: !711)
!737 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !738} ; [ DW_TAG_arg_variable ] [p] [line 987]
!738 = !MDLocation(line: 511, column: 4, scope: !7)
!739 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !738)
!740 = !{!"0x100\00q\00989\000", !23, !8, !4, !738} ; [ DW_TAG_auto_variable ] [q] [line 989]
!741 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !738)
!742 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !738)
!743 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !738)
!744 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !738)
!745 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !738)
!746 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !738)
!747 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !738)
!748 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !738)
!749 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !738)
!750 = !MDLocation(line: 512, column: 13, scope: !7)
!751 = !MDLocation(line: 512, column: 35, scope: !7)
!752 = !MDLocation(line: 512, column: 4, scope: !7)
!753 = !MDLocation(line: 514, column: 9, scope: !7)
!754 = !MDLocation(line: 514, column: 17, scope: !7)
!755 = !MDLocation(line: 515, column: 9, scope: !7)
!756 = !MDLocation(line: 516, column: 17, scope: !7)
!757 = !MDLocation(line: 516, column: 22, scope: !7)
!758 = !MDLocation(line: 516, column: 16, scope: !7)
!759 = !MDLocation(line: 516, column: 28, scope: !7)
!760 = !MDLocation(line: 516, column: 15, scope: !7)
!761 = !MDLocation(line: 516, column: 34, scope: !7)
!762 = !MDLocation(line: 516, column: 14, scope: !7)
!763 = !MDLocation(line: 516, column: 40, scope: !7)
!764 = !MDLocation(line: 516, column: 13, scope: !7)
!765 = !MDLocation(line: 516, column: 46, scope: !7)
!766 = !MDLocation(line: 516, column: 12, scope: !7)
!767 = !MDLocation(line: 516, column: 52, scope: !7)
!768 = !MDLocation(line: 516, column: 9, scope: !7)
!769 = !MDLocation(line: 517, column: 24, scope: !7)
!770 = !MDLocation(line: 517, column: 29, scope: !7)
!771 = !MDLocation(line: 517, column: 21, scope: !7)
!772 = !MDLocation(line: 517, column: 33, scope: !7)
!773 = !MDLocation(line: 517, column: 18, scope: !7)
!774 = !MDLocation(line: 517, column: 37, scope: !7)
!775 = !MDLocation(line: 517, column: 15, scope: !7)
!776 = !MDLocation(line: 517, column: 41, scope: !7)
!777 = !MDLocation(line: 517, column: 12, scope: !7)
!778 = !MDLocation(line: 517, column: 45, scope: !7)
!779 = !MDLocation(line: 517, column: 9, scope: !7)
!780 = !MDLocation(line: 518, column: 9, scope: !7)
!781 = !MDLocation(line: 520, column: 12, scope: !7)
!782 = !MDLocation(line: 520, column: 4, scope: !7)
!783 = !MDLocation(line: 521, column: 20, scope: !7)
!784 = !MDLocation(line: 521, column: 15, scope: !7)
!785 = !MDLocation(line: 521, column: 9, scope: !7)
!786 = !MDLocation(line: 521, column: 4, scope: !7)
!787 = !MDLocation(line: 522, column: 4, scope: !7)
!788 = !MDLocation(line: 523, column: 9, scope: !7)
!789 = !MDLocation(line: 523, column: 4, scope: !7)
!790 = !MDLocation(line: 524, column: 12, scope: !7)
!791 = !MDLocation(line: 524, column: 4, scope: !7)
!792 = !MDLocation(line: 530, column: 11, scope: !7)
!793 = !MDLocation(line: 531, column: 11, scope: !7)
!794 = !MDLocation(line: 532, column: 11, scope: !7)
!795 = !MDLocation(line: 529, column: 4, scope: !7)
!796 = !MDLocation(line: 547, column: 8, scope: !7)
!797 = !MDLocation(line: 548, column: 4, scope: !7)
!798 = !MDLocation(line: 549, column: 8, scope: !7)
!799 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !800} ; [ DW_TAG_arg_variable ] [p] [line 987]
!800 = !MDLocation(line: 551, column: 4, scope: !7)
!801 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !800)
!802 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !800)
!803 = !{!"0x100\00q\00989\000", !23, !8, !4, !800} ; [ DW_TAG_auto_variable ] [q] [line 989]
!804 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !800)
!805 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !800)
!806 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !800)
!807 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !800)
!808 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !800)
!809 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !800)
!810 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !800)
!811 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !800)
!812 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !800)
!813 = !MDLocation(line: 552, column: 4, scope: !814)
!814 = !{!"0xb\00552\004\0028", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!815 = !MDLocation(line: 554, column: 8, scope: !816)
!816 = !{!"0xb\00553\004\0030", !1, !817}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!817 = !{!"0xb\00552\004\0029", !1, !814}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!818 = !MDLocation(line: 555, column: 8, scope: !816)
!819 = !MDLocation(line: 556, column: 18, scope: !816)
!820 = !MDLocation(line: 556, column: 12, scope: !816)
!821 = !MDLocation(line: 556, column: 8, scope: !816)
!822 = !MDLocation(line: 556, column: 34, scope: !816)
!823 = !MDLocation(line: 556, column: 28, scope: !816)
!824 = !MDLocation(line: 556, column: 50, scope: !816)
!825 = !MDLocation(line: 556, column: 44, scope: !816)
!826 = !MDLocation(line: 552, column: 29, scope: !817)
!827 = !MDLocation(line: 552, column: 18, scope: !817)
!828 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !829} ; [ DW_TAG_arg_variable ] [p] [line 987]
!829 = !MDLocation(line: 558, column: 4, scope: !7)
!830 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !829)
!831 = !{!"0x100\00q\00989\000", !23, !8, !4, !829} ; [ DW_TAG_auto_variable ] [q] [line 989]
!832 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !829)
!833 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !829)
!834 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !829)
!835 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !829)
!836 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !829)
!837 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !829)
!838 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !829)
!839 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !829)
!840 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !829)
!841 = !MDLocation(line: 559, column: 12, scope: !7)
!842 = !MDLocation(line: 559, column: 34, scope: !7)
!843 = !MDLocation(line: 559, column: 4, scope: !7)
!844 = !MDLocation(line: 563, column: 12, scope: !7)
!845 = !MDLocation(line: 563, column: 4, scope: !7)
!846 = !MDLocation(line: 564, column: 9, scope: !7)
!847 = !MDLocation(line: 565, column: 9, scope: !7)
!848 = !MDLocation(line: 566, column: 9, scope: !7)
!849 = !MDLocation(line: 566, column: 20, scope: !7)
!850 = !MDLocation(line: 566, column: 14, scope: !7)
!851 = !MDLocation(line: 566, column: 36, scope: !7)
!852 = !MDLocation(line: 566, column: 30, scope: !7)
!853 = !MDLocation(line: 566, column: 52, scope: !7)
!854 = !MDLocation(line: 566, column: 46, scope: !7)
!855 = !MDLocation(line: 567, column: 9, scope: !7)
!856 = !MDLocation(line: 567, column: 26, scope: !7)
!857 = !MDLocation(line: 567, column: 21, scope: !7)
!858 = !MDLocation(line: 567, column: 4, scope: !7)
!859 = !MDLocation(line: 569, column: 17, scope: !7)
!860 = !MDLocation(line: 569, column: 9, scope: !7)
!861 = !MDLocation(line: 570, column: 16, scope: !7)
!862 = !MDLocation(line: 570, column: 28, scope: !7)
!863 = !MDLocation(line: 570, column: 8, scope: !7)
!864 = !MDLocation(line: 572, column: 9, scope: !7)
!865 = !MDLocation(line: 572, column: 4, scope: !7)
!866 = !MDLocation(line: 573, column: 12, scope: !7)
!867 = !MDLocation(line: 573, column: 4, scope: !7)
!868 = !MDLocation(line: 579, column: 11, scope: !7)
!869 = !MDLocation(line: 580, column: 11, scope: !7)
!870 = !MDLocation(line: 581, column: 11, scope: !7)
!871 = !MDLocation(line: 578, column: 4, scope: !7)
!872 = !MDLocation(line: 593, column: 8, scope: !7)
!873 = !MDLocation(line: 593, column: 18, scope: !7)
!874 = !MDLocation(line: 593, column: 26, scope: !7)
!875 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !876} ; [ DW_TAG_arg_variable ] [p] [line 987]
!876 = !MDLocation(line: 597, column: 4, scope: !7)
!877 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !876)
!878 = !MDLocation(line: 991, column: 6, scope: !23, inlinedAt: !876)
!879 = !{!"0x100\00q\00989\000", !23, !8, !4, !876} ; [ DW_TAG_auto_variable ] [q] [line 989]
!880 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !876)
!881 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !876)
!882 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !876)
!883 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !876)
!884 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !876)
!885 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !876)
!886 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !876)
!887 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !876)
!888 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !876)
!889 = !MDLocation(line: 598, column: 22, scope: !890)
!890 = !{!"0xb\00598\004\0032", !1, !891}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!891 = !{!"0xb\00598\004\0031", !1, !7}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!892 = !MDLocation(line: 598, column: 17, scope: !890)
!893 = !MDLocation(line: 598, column: 4, scope: !891)
!894 = !MDLocation(line: 602, column: 23, scope: !895)
!895 = !{!"0xb\00599\004\0033", !1, !890}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops.c]
!896 = !MDLocation(line: 602, column: 28, scope: !895)
!897 = !MDLocation(line: 602, column: 32, scope: !895)
!898 = !MDLocation(line: 602, column: 36, scope: !895)
!899 = !MDLocation(line: 602, column: 40, scope: !895)
!900 = !MDLocation(line: 602, column: 44, scope: !895)
!901 = !MDLocation(line: 602, column: 48, scope: !895)
!902 = !MDLocation(line: 603, column: 24, scope: !895)
!903 = !MDLocation(line: 603, column: 29, scope: !895)
!904 = !MDLocation(line: 603, column: 35, scope: !895)
!905 = !MDLocation(line: 603, column: 41, scope: !895)
!906 = !MDLocation(line: 603, column: 47, scope: !895)
!907 = !MDLocation(line: 603, column: 53, scope: !895)
!908 = !MDLocation(line: 600, column: 8, scope: !895)
!909 = !MDLocation(line: 601, column: 8, scope: !895)
!910 = !MDLocation(line: 602, column: 20, scope: !895)
!911 = !MDLocation(line: 602, column: 17, scope: !895)
!912 = !MDLocation(line: 602, column: 14, scope: !895)
!913 = !MDLocation(line: 602, column: 11, scope: !895)
!914 = !MDLocation(line: 602, column: 8, scope: !895)
!915 = !MDLocation(line: 603, column: 12, scope: !895)
!916 = !MDLocation(line: 603, column: 23, scope: !895)
!917 = !MDLocation(line: 603, column: 22, scope: !895)
!918 = !MDLocation(line: 603, column: 21, scope: !895)
!919 = !MDLocation(line: 603, column: 20, scope: !895)
!920 = !MDLocation(line: 603, column: 19, scope: !895)
!921 = !MDLocation(line: 603, column: 8, scope: !895)
!922 = !MDLocation(line: 598, column: 28, scope: !890)
!923 = !{!"0x101\00p\0016778203\000", !23, !8, !26, !924} ; [ DW_TAG_arg_variable ] [p] [line 987]
!924 = !MDLocation(line: 605, column: 4, scope: !7)
!925 = !MDLocation(line: 987, column: 8, scope: !23, inlinedAt: !924)
!926 = !{!"0x100\00q\00989\000", !23, !8, !4, !924} ; [ DW_TAG_auto_variable ] [q] [line 989]
!927 = !MDLocation(line: 989, column: 9, scope: !23, inlinedAt: !924)
!928 = !MDLocation(line: 993, column: 2, scope: !23, inlinedAt: !924)
!929 = !MDLocation(line: 994, column: 17, scope: !23, inlinedAt: !924)
!930 = !MDLocation(line: 994, column: 9, scope: !23, inlinedAt: !924)
!931 = !MDLocation(line: 994, column: 39, scope: !23, inlinedAt: !924)
!932 = !MDLocation(line: 994, column: 31, scope: !23, inlinedAt: !924)
!933 = !MDLocation(line: 994, column: 2, scope: !23, inlinedAt: !924)
!934 = !MDLocation(line: 995, column: 9, scope: !23, inlinedAt: !924)
!935 = !MDLocation(line: 995, column: 2, scope: !23, inlinedAt: !924)
!936 = !MDLocation(line: 606, column: 13, scope: !7)
!937 = !MDLocation(line: 606, column: 35, scope: !7)
!938 = !MDLocation(line: 606, column: 4, scope: !7)
!939 = !MDLocation(line: 608, column: 9, scope: !7)
!940 = !MDLocation(line: 608, column: 17, scope: !7)
!941 = !MDLocation(line: 609, column: 9, scope: !7)
!942 = !MDLocation(line: 610, column: 17, scope: !7)
!943 = !MDLocation(line: 610, column: 22, scope: !7)
!944 = !MDLocation(line: 610, column: 16, scope: !7)
!945 = !MDLocation(line: 610, column: 28, scope: !7)
!946 = !MDLocation(line: 610, column: 15, scope: !7)
!947 = !MDLocation(line: 610, column: 34, scope: !7)
!948 = !MDLocation(line: 610, column: 14, scope: !7)
!949 = !MDLocation(line: 610, column: 40, scope: !7)
!950 = !MDLocation(line: 610, column: 13, scope: !7)
!951 = !MDLocation(line: 610, column: 46, scope: !7)
!952 = !MDLocation(line: 610, column: 12, scope: !7)
!953 = !MDLocation(line: 610, column: 52, scope: !7)
!954 = !MDLocation(line: 610, column: 9, scope: !7)
!955 = !MDLocation(line: 611, column: 24, scope: !7)
!956 = !MDLocation(line: 611, column: 29, scope: !7)
!957 = !MDLocation(line: 611, column: 21, scope: !7)
!958 = !MDLocation(line: 611, column: 33, scope: !7)
!959 = !MDLocation(line: 611, column: 18, scope: !7)
!960 = !MDLocation(line: 611, column: 37, scope: !7)
!961 = !MDLocation(line: 611, column: 15, scope: !7)
!962 = !MDLocation(line: 611, column: 41, scope: !7)
!963 = !MDLocation(line: 611, column: 12, scope: !7)
!964 = !MDLocation(line: 611, column: 45, scope: !7)
!965 = !MDLocation(line: 611, column: 9, scope: !7)
!966 = !MDLocation(line: 612, column: 9, scope: !7)
!967 = !MDLocation(line: 614, column: 12, scope: !7)
!968 = !MDLocation(line: 614, column: 4, scope: !7)
!969 = !MDLocation(line: 615, column: 20, scope: !7)
!970 = !MDLocation(line: 615, column: 15, scope: !7)
!971 = !MDLocation(line: 615, column: 9, scope: !7)
!972 = !MDLocation(line: 615, column: 4, scope: !7)
!973 = !MDLocation(line: 616, column: 4, scope: !7)
!974 = !MDLocation(line: 617, column: 9, scope: !7)
!975 = !MDLocation(line: 617, column: 4, scope: !7)
!976 = !MDLocation(line: 618, column: 12, scope: !7)
!977 = !MDLocation(line: 618, column: 4, scope: !7)
!978 = !MDLocation(line: 624, column: 11, scope: !7)
!979 = !MDLocation(line: 625, column: 11, scope: !7)
!980 = !MDLocation(line: 626, column: 11, scope: !7)
!981 = !MDLocation(line: 623, column: 4, scope: !7)
!982 = !MDLocation(line: 633, column: 14, scope: !7)
!983 = !MDLocation(line: 633, column: 22, scope: !7)
!984 = !MDLocation(line: 633, column: 29, scope: !7)
!985 = !MDLocation(line: 633, column: 37, scope: !7)
!986 = !MDLocation(line: 633, column: 12, scope: !7)
!987 = !MDLocation(line: 633, column: 4, scope: !7)
!988 = !MDLocation(line: 634, column: 12, scope: !7)
!989 = !MDLocation(line: 634, column: 4, scope: !7)
!990 = !MDLocation(line: 640, column: 12, scope: !7)
!991 = !MDLocation(line: 640, column: 26, scope: !7)
!992 = !MDLocation(line: 640, column: 34, scope: !7)
!993 = !MDLocation(line: 640, column: 42, scope: !7)
!994 = !MDLocation(line: 641, column: 21, scope: !7)
!995 = !MDLocation(line: 641, column: 28, scope: !7)
!996 = !MDLocation(line: 641, column: 13, scope: !7)
!997 = !MDLocation(line: 641, column: 12, scope: !7)
!998 = !MDLocation(line: 641, column: 4, scope: !7)
!999 = !MDLocation(line: 642, column: 12, scope: !7)
!1000 = !MDLocation(line: 642, column: 4, scope: !7)
!1001 = !MDLocation(line: 649, column: 13, scope: !7)
!1002 = !MDLocation(line: 649, column: 29, scope: !7)
!1003 = !MDLocation(line: 649, column: 12, scope: !7)
!1004 = !MDLocation(line: 649, column: 4, scope: !7)
!1005 = !MDLocation(line: 650, column: 12, scope: !7)
!1006 = !MDLocation(line: 650, column: 4, scope: !7)
!1007 = !MDLocation(line: 656, column: 13, scope: !7)
!1008 = !MDLocation(line: 656, column: 12, scope: !7)
!1009 = !MDLocation(line: 656, column: 4, scope: !7)
!1010 = !MDLocation(line: 657, column: 12, scope: !7)
!1011 = !MDLocation(line: 657, column: 4, scope: !7)
!1012 = !MDLocation(line: 660, column: 4, scope: !7)
!1013 = !MDLocation(line: 661, column: 4, scope: !7)
!1014 = !MDLocation(line: 662, column: 44, scope: !7)
!1015 = !MDLocation(line: 662, column: 4, scope: !7)
!1016 = !MDLocation(line: 663, column: 44, scope: !7)
!1017 = !MDLocation(line: 663, column: 4, scope: !7)
!1018 = !MDLocation(line: 664, column: 44, scope: !7)
!1019 = !MDLocation(line: 664, column: 4, scope: !7)
!1020 = !MDLocation(line: 665, column: 44, scope: !7)
!1021 = !MDLocation(line: 665, column: 4, scope: !7)
!1022 = !MDLocation(line: 666, column: 46, scope: !7)
!1023 = !MDLocation(line: 666, column: 4, scope: !7)
!1024 = !MDLocation(line: 667, column: 4, scope: !7)
!1025 = !MDLocation(line: 987, column: 8, scope: !23)
!1026 = !MDLocation(line: 991, column: 6, scope: !23)
!1027 = !MDLocation(line: 989, column: 9, scope: !23)
!1028 = !MDLocation(line: 993, column: 2, scope: !23)
!1029 = !MDLocation(line: 994, column: 17, scope: !23)
!1030 = !MDLocation(line: 994, column: 9, scope: !23)
!1031 = !MDLocation(line: 994, column: 39, scope: !23)
!1032 = !MDLocation(line: 994, column: 31, scope: !23)
!1033 = !MDLocation(line: 994, column: 2, scope: !23)
!1034 = !MDLocation(line: 995, column: 9, scope: !23)
!1035 = !MDLocation(line: 995, column: 2, scope: !23)
!1036 = !MDLocation(line: 997, column: 2, scope: !23)
