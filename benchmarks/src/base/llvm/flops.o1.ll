; ModuleID = 'flops.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1 = private unnamed_addr constant [58 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\0A\00", align 1
@T = common global [36 x double] zeroinitializer, align 16
@TLimit = common global double 0.000000e+00, align 8
@piref = common global double 0.000000e+00, align 8
@one = common global double 0.000000e+00, align 8
@two = common global double 0.000000e+00, align 8
@three = common global double 0.000000e+00, align 8
@four = common global double 0.000000e+00, align 8
@five = common global double 0.000000e+00, align 8
@scale = common global double 0.000000e+00, align 8
@.str2 = private unnamed_addr constant [48 x i8] c"   Module     Error        RunTime      MFLOPS\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"                            (usec)\0A\00", align 1
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
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !93
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str, i64 0, i64 0)), !dbg !94
  tail call void @llvm.dbg.value(metadata !95, i64 0, metadata !16), !dbg !96
  store double 6.400000e+01, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !97, !tbaa !98
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !102, !tbaa !98
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !18), !dbg !104
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !105, !tbaa !98
  store double 1.000000e+00, double* @one, align 8, !dbg !106, !tbaa !98
  store double 2.000000e+00, double* @two, align 8, !dbg !107, !tbaa !98
  store double 3.000000e+00, double* @three, align 8, !dbg !108, !tbaa !98
  store double 4.000000e+00, double* @four, align 8, !dbg !109, !tbaa !98
  store double 5.000000e+00, double* @five, align 8, !dbg !110, !tbaa !98
  store double 1.000000e+00, double* @scale, align 8, !dbg !111, !tbaa !98
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str18, i64 0, i64 0)), !dbg !112
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str19, i64 0, i64 0)), !dbg !113
  %1 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !114
  %2 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !115
  tail call void @llvm.dbg.value(metadata !95, i64 0, metadata !21), !dbg !116
  store double 0.000000e+00, double* @sa, align 8, !dbg !117, !tbaa !98
  br label %3, !dbg !118

; <label>:3                                       ; preds = %._crit_edge67, %0
  %x.0 = phi double [ undef, %0 ], [ %11, %._crit_edge67 ]
  %s.0 = phi double [ undef, %0 ], [ %s.1.lcssa, %._crit_edge67 ]
  %n.0 = phi i64 [ 15625, %0 ], [ %8, %._crit_edge67 ]
  %4 = load double* @sa, align 8, !dbg !118, !tbaa !98
  %5 = load double* @TLimit, align 8, !dbg !118, !tbaa !98
  %6 = fcmp olt double %4, %5, !dbg !118
  br i1 %6, label %7, label %46, !dbg !118

; <label>:7                                       ; preds = %3
  %8 = shl nsw i64 %n.0, 1, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !21), !dbg !119
  %9 = load double* @one, align 8, !dbg !121, !tbaa !98
  %10 = sitofp i64 %8 to double, !dbg !121
  %11 = fdiv double %9, %10, !dbg !121
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !15), !dbg !121
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !123
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !124
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !14), !dbg !125
  %12 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !126
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !128
  %13 = add nsw i64 %8, -1, !dbg !128
  %14 = icmp slt i64 %8, 2, !dbg !128
  br i1 %14, label %._crit_edge67, label %.lr.ph66, !dbg !128

.lr.ph66:                                         ; preds = %7
  %15 = load double* @D1, align 8, !dbg !130, !tbaa !98
  %16 = load double* @D2, align 8, !dbg !130, !tbaa !98
  %17 = load double* @D3, align 8, !dbg !130, !tbaa !98
  %18 = load double* @E2, align 8, !dbg !130, !tbaa !98
  %19 = load double* @E3, align 8, !dbg !130, !tbaa !98
  %20 = insertelement <2 x double> undef, double %15, i32 0, !dbg !130
  %21 = insertelement <2 x double> %20, double %9, i32 1, !dbg !130
  %22 = insertelement <2 x double> undef, double %16, i32 0, !dbg !130
  %23 = insertelement <2 x double> %22, double %15, i32 1, !dbg !130
  %24 = insertelement <2 x double> undef, double %17, i32 0, !dbg !130
  br label %25, !dbg !128

; <label>:25                                      ; preds = %25, %.lr.ph66
  %i.064 = phi i64 [ 1, %.lr.ph66 ], [ %41, %25 ]
  %s.163 = phi double [ 0.000000e+00, %.lr.ph66 ], [ %40, %25 ]
  %v.062 = phi double [ 0.000000e+00, %.lr.ph66 ], [ %26, %25 ]
  %26 = fadd double %9, %v.062, !dbg !132
  tail call void @llvm.dbg.value(metadata !{double %26}, i64 0, metadata !13), !dbg !132
  %27 = fmul double %11, %26, !dbg !133
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !12), !dbg !133
  %28 = fmul double %27, %19, !dbg !130
  %29 = fadd double %18, %28, !dbg !130
  %30 = insertelement <2 x double> undef, double %27, i32 0, !dbg !130
  %31 = insertelement <2 x double> %30, double %27, i32 1, !dbg !130
  %32 = insertelement <2 x double> %24, double %29, i32 1, !dbg !130
  %33 = fmul <2 x double> %31, %32, !dbg !130
  %34 = fadd <2 x double> %23, %33, !dbg !130
  %35 = fmul <2 x double> %34, %31, !dbg !130
  %36 = fadd <2 x double> %21, %35, !dbg !130
  %37 = extractelement <2 x double> %36, i32 0, !dbg !130
  %38 = extractelement <2 x double> %36, i32 1, !dbg !130
  %39 = fdiv double %37, %38, !dbg !130
  %40 = fadd double %s.163, %39, !dbg !130
  tail call void @llvm.dbg.value(metadata !{double %40}, i64 0, metadata !10), !dbg !130
  %41 = add nsw i64 %i.064, 1, !dbg !128
  tail call void @llvm.dbg.value(metadata !{i64 %41}, i64 0, metadata !19), !dbg !128
  %42 = icmp slt i64 %i.064, %13, !dbg !128
  br i1 %42, label %25, label %._crit_edge67, !dbg !128

._crit_edge67:                                    ; preds = %25, %7
  %s.1.lcssa = phi double [ 0.000000e+00, %7 ], [ %40, %25 ]
  %43 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !134
  %44 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !135, !tbaa !98
  store double %44, double* @sa, align 8, !dbg !135, !tbaa !98
  %45 = icmp eq i64 %8, 512000000, !dbg !136
  br i1 %45, label %46, label %3, !dbg !136

; <label>:46                                      ; preds = %3, %._crit_edge67
  %x.1 = phi double [ %11, %._crit_edge67 ], [ %x.0, %3 ]
  %s.2 = phi double [ %s.1.lcssa, %._crit_edge67 ], [ %s.0, %3 ]
  store double 1.589500e-02, double* @scale, align 8, !dbg !138, !tbaa !98
  store double 1.589500e-02, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !139, !tbaa !98
  %47 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !140
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !141
  %48 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !143
  %49 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !144, !tbaa !98
  %50 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !144, !tbaa !98
  %51 = fmul double %49, %50, !dbg !144
  %52 = fcmp olt double %51, 0.000000e+00, !dbg !145
  %storemerge4 = select i1 %52, double 0.000000e+00, double %51, !dbg !145
  store double %storemerge4, double* @nulltime, align 8, !dbg !144, !tbaa !98
  %53 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !147, !tbaa !98
  %54 = load double* @sa, align 8, !dbg !147, !tbaa !98
  %55 = fmul double %53, %54, !dbg !147
  %56 = fsub double %55, %storemerge4, !dbg !147
  store double %56, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !147, !tbaa !98
  %57 = load double* @D1, align 8, !dbg !148, !tbaa !98
  %58 = load double* @D2, align 8, !dbg !148, !tbaa !98
  %59 = fadd double %57, %58, !dbg !148
  %60 = load double* @D3, align 8, !dbg !148, !tbaa !98
  %61 = fadd double %59, %60, !dbg !148
  %62 = load double* @one, align 8, !dbg !148, !tbaa !98
  %63 = fadd double %57, %62, !dbg !148
  %64 = load double* @E2, align 8, !dbg !148, !tbaa !98
  %65 = fadd double %63, %64, !dbg !148
  %66 = load double* @E3, align 8, !dbg !148, !tbaa !98
  %67 = fadd double %65, %66, !dbg !148
  %68 = fdiv double %61, %67, !dbg !148
  store double %68, double* @sa, align 8, !dbg !148, !tbaa !98
  %69 = load double* @D1, align 8, !dbg !149, !tbaa !98
  store double %69, double* @sb, align 8, !dbg !149, !tbaa !98
  %70 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !150, !tbaa !98
  %71 = fdiv double %70, 1.400000e+01, !dbg !150
  store double %71, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 3), align 8, !dbg !150, !tbaa !98
  %72 = load double* @sa, align 8, !dbg !151, !tbaa !98
  %73 = load double* @sb, align 8, !dbg !151, !tbaa !98
  %74 = fadd double %72, %73, !dbg !151
  %75 = load double* @two, align 8, !dbg !151, !tbaa !98
  %76 = fmul double %s.2, %75, !dbg !151
  %77 = fadd double %74, %76, !dbg !151
  %78 = fmul double %x.1, %77, !dbg !151
  %79 = fdiv double %78, %75, !dbg !151
  store double %79, double* @sa, align 8, !dbg !151, !tbaa !98
  %80 = load double* @one, align 8, !dbg !152, !tbaa !98
  %81 = fdiv double %80, %79, !dbg !152
  store double %81, double* @sb, align 8, !dbg !152, !tbaa !98
  %82 = fptosi double %81 to i64, !dbg !153
  %83 = mul nsw i64 %82, 40000, !dbg !153
  %84 = sitofp i64 %83 to double, !dbg !153
  %85 = load double* @scale, align 8, !dbg !153, !tbaa !98
  %86 = fdiv double %84, %85, !dbg !153
  %87 = fptosi double %86 to i64, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i64 %87}, i64 0, metadata !21), !dbg !153
  %88 = fadd double %81, -2.520000e+01, !dbg !154
  store double %88, double* @sc, align 8, !dbg !154, !tbaa !98
  %89 = load double* @one, align 8, !dbg !155, !tbaa !98
  %90 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 3), align 8, !dbg !155, !tbaa !98
  %91 = fdiv double %89, %90, !dbg !155
  store double %91, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 4), align 16, !dbg !155, !tbaa !98
  %92 = load double* @sc, align 8, !dbg !156, !tbaa !98
  %93 = fmul double %92, 1.000000e-30, !dbg !156
  %94 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !156, !tbaa !98
  %95 = fmul double %94, 1.000000e-30, !dbg !156
  %96 = fmul double %91, 1.000000e-30, !dbg !156
  %97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %93, double %95, double %96) #3, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i64 %87}, i64 0, metadata !20), !dbg !157
  %98 = load double* @five, align 8, !dbg !158, !tbaa !98
  %99 = load double* @one, align 8, !dbg !159, !tbaa !98
  %100 = fsub double -0.000000e+00, %99, !dbg !159
  store double %100, double* @sa, align 8, !dbg !159, !tbaa !98
  %101 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !160
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !161
  %s.352 = fsub double -0.000000e+00, %98, !dbg !158
  %102 = icmp slt i64 %87, 1, !dbg !161
  br i1 %102, label %107, label %.lr.ph57, !dbg !161

.lr.ph57:                                         ; preds = %46
  %sa.promoted60 = load double* @sa, align 8, !dbg !163, !tbaa !98
  br label %103, !dbg !161

; <label>:103                                     ; preds = %103, %.lr.ph57
  %104 = phi double [ %sa.promoted60, %.lr.ph57 ], [ %105, %103 ], !dbg !163
  %s.355 = phi double [ %s.352, %.lr.ph57 ], [ %s.3, %103 ]
  %i.254 = phi i64 [ 1, %.lr.ph57 ], [ %106, %103 ]
  %.pn53 = phi double [ %98, %.lr.ph57 ], [ %s.355, %103 ]
  %105 = fadd double %.pn53, %104, !dbg !163
  %106 = add nsw i64 %i.254, 1, !dbg !161
  tail call void @llvm.dbg.value(metadata !{i64 %106}, i64 0, metadata !19), !dbg !161
  %s.3 = fsub double -0.000000e+00, %s.355, !dbg !158
  %exitcond81 = icmp eq i64 %i.254, %87, !dbg !161
  br i1 %exitcond81, label %._crit_edge58, label %103, !dbg !161

._crit_edge58:                                    ; preds = %103
  store double %105, double* @sa, align 8, !dbg !163, !tbaa !98
  br label %107, !dbg !161

; <label>:107                                     ; preds = %._crit_edge58, %46
  %s.3.lcssa = phi double [ %s.3, %._crit_edge58 ], [ %s.352, %46 ]
  %108 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !165
  %109 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !166, !tbaa !98
  %110 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !166, !tbaa !98
  %111 = fmul double %109, %110, !dbg !166
  %112 = fcmp olt double %111, 0.000000e+00, !dbg !167
  %storemerge = select i1 %112, double 0.000000e+00, double %111, !dbg !167
  store double %storemerge, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !166, !tbaa !98
  %113 = sitofp i64 %87 to double, !dbg !169
  store double %113, double* @sc, align 8, !dbg !169, !tbaa !98
  %114 = load double* @sa, align 8, !dbg !170, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !12), !dbg !170
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !171
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !14), !dbg !172
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !15), !dbg !173
  %115 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !174
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !175
  %116 = icmp slt i64 %87, 1, !dbg !175
  br i1 %116, label %130, label %.lr.ph46, !dbg !175

.lr.ph46:                                         ; preds = %107
  %117 = load double* @two, align 8, !dbg !177, !tbaa !98
  %sa.promoted = load double* @sa, align 8, !dbg !179, !tbaa !98
  br label %118, !dbg !175

; <label>:118                                     ; preds = %118, %.lr.ph46
  %119 = phi double [ %sa.promoted, %.lr.ph46 ], [ %121, %118 ], !dbg !180
  %i.344 = phi i64 [ 1, %.lr.ph46 ], [ %129, %118 ]
  %s.443 = phi double [ %s.3.lcssa, %.lr.ph46 ], [ %120, %118 ]
  %u.042 = phi double [ %114, %.lr.ph46 ], [ %122, %118 ]
  %x.241 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %124, %118 ]
  %w.040 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %128, %118 ]
  %v.139 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %126, %118 ]
  %120 = fsub double -0.000000e+00, %s.443, !dbg !180
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !10), !dbg !180
  %121 = fsub double %119, %s.443, !dbg !179
  %122 = fadd double %u.042, %117, !dbg !177
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !12), !dbg !177
  %123 = fsub double %120, %122, !dbg !181
  %124 = fadd double %x.241, %123, !dbg !181
  tail call void @llvm.dbg.value(metadata !{double %124}, i64 0, metadata !15), !dbg !181
  %125 = fmul double %122, %120, !dbg !182
  %126 = fsub double %v.139, %125, !dbg !182
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !13), !dbg !182
  %127 = fdiv double %120, %122, !dbg !183
  %128 = fadd double %w.040, %127, !dbg !183
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !14), !dbg !183
  %129 = add nsw i64 %i.344, 1, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i64 %129}, i64 0, metadata !19), !dbg !175
  %exitcond = icmp eq i64 %i.344, %87, !dbg !175
  br i1 %exitcond, label %._crit_edge47, label %118, !dbg !175

._crit_edge47:                                    ; preds = %118
  store double %121, double* @sa, align 8, !dbg !179, !tbaa !98
  br label %130, !dbg !175

; <label>:130                                     ; preds = %._crit_edge47, %107
  %x.2.lcssa = phi double [ %124, %._crit_edge47 ], [ 0.000000e+00, %107 ]
  %w.0.lcssa = phi double [ %128, %._crit_edge47 ], [ 0.000000e+00, %107 ]
  %v.1.lcssa = phi double [ %126, %._crit_edge47 ], [ 0.000000e+00, %107 ]
  %131 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !184
  %132 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !185, !tbaa !98
  %133 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !185, !tbaa !98
  %134 = fmul double %132, %133, !dbg !185
  store double %134, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !185, !tbaa !98
  %135 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !186, !tbaa !98
  %136 = fsub double %134, %135, !dbg !186
  %137 = fdiv double %136, 7.000000e+00, !dbg !186
  store double %137, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 7), align 8, !dbg !186, !tbaa !98
  %138 = load double* @sa, align 8, !dbg !187, !tbaa !98
  %139 = fmul double %x.2.lcssa, %138, !dbg !187
  %140 = load double* @sc, align 8, !dbg !187, !tbaa !98
  %141 = fdiv double %139, %140, !dbg !187
  %142 = fptosi double %141 to i64, !dbg !187
  tail call void @llvm.dbg.value(metadata !{i64 %142}, i64 0, metadata !20), !dbg !187
  %143 = load double* @four, align 8, !dbg !188, !tbaa !98
  %144 = fmul double %w.0.lcssa, %143, !dbg !188
  %145 = load double* @five, align 8, !dbg !188, !tbaa !98
  %146 = fdiv double %144, %145, !dbg !188
  store double %146, double* @sa, align 8, !dbg !188, !tbaa !98
  %147 = fdiv double %145, %v.1.lcssa, !dbg !189
  %148 = fadd double %146, %147, !dbg !189
  store double %148, double* @sb, align 8, !dbg !189, !tbaa !98
  store double 3.125000e+01, double* @sc, align 8, !dbg !190, !tbaa !98
  %149 = fmul double %v.1.lcssa, %v.1.lcssa, !dbg !191
  %150 = fmul double %v.1.lcssa, %149, !dbg !191
  %151 = fdiv double 3.125000e+01, %150, !dbg !191
  %152 = fsub double %148, %151, !dbg !191
  store double %152, double* @piprg, align 8, !dbg !191, !tbaa !98
  %153 = load double* @piref, align 8, !dbg !192, !tbaa !98
  %154 = fsub double %152, %153, !dbg !192
  store double %154, double* @pierr, align 8, !dbg !192, !tbaa !98
  %155 = load double* @one, align 8, !dbg !193, !tbaa !98
  %156 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 7), align 8, !dbg !193, !tbaa !98
  %157 = fdiv double %155, %156, !dbg !193
  store double %157, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 8), align 16, !dbg !193, !tbaa !98
  %158 = load double* @pierr, align 8, !dbg !194, !tbaa !98
  %159 = fmul double %158, 1.000000e-30, !dbg !194
  %160 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !194, !tbaa !98
  %161 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !194, !tbaa !98
  %162 = fsub double %160, %161, !dbg !194
  %163 = fmul double %162, 1.000000e-30, !dbg !194
  %164 = fmul double %157, 1.000000e-30, !dbg !194
  %165 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), double %159, double %163, double %164) #3, !dbg !194
  %166 = load double* @piref, align 8, !dbg !195, !tbaa !98
  %167 = load double* @three, align 8, !dbg !195, !tbaa !98
  %168 = sitofp i64 %142 to double, !dbg !195
  %169 = fmul double %168, %167, !dbg !195
  %170 = fdiv double %166, %169, !dbg !195
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !15), !dbg !195
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !196
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !197
  %171 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !198
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !199
  %172 = add nsw i64 %142, -1, !dbg !199
  %173 = icmp slt i64 %142, 2, !dbg !199
  br i1 %173, label %._crit_edge36, label %.lr.ph35, !dbg !199

.lr.ph35:                                         ; preds = %130
  %174 = load double* @one, align 8, !dbg !201, !tbaa !98
  %175 = load double* @A6, align 8, !dbg !203, !tbaa !98
  %176 = load double* @A5, align 8, !dbg !203, !tbaa !98
  %177 = load double* @A4, align 8, !dbg !203, !tbaa !98
  %178 = load double* @A3, align 8, !dbg !203, !tbaa !98
  %179 = load double* @A2, align 8, !dbg !203, !tbaa !98
  %180 = load double* @A1, align 8, !dbg !203, !tbaa !98
  br label %181, !dbg !199

; <label>:181                                     ; preds = %181, %.lr.ph35
  %i.433 = phi i64 [ 1, %.lr.ph35 ], [ %199, %181 ]
  %s.532 = phi double [ 0.000000e+00, %.lr.ph35 ], [ %198, %181 ]
  %v.231 = phi double [ 0.000000e+00, %.lr.ph35 ], [ %182, %181 ]
  %182 = fadd double %v.231, %174, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !13), !dbg !201
  %183 = fmul double %170, %182, !dbg !204
  tail call void @llvm.dbg.value(metadata !{double %183}, i64 0, metadata !12), !dbg !204
  %184 = fmul double %183, %183, !dbg !205
  tail call void @llvm.dbg.value(metadata !{double %184}, i64 0, metadata !14), !dbg !205
  %185 = fmul double %175, %184, !dbg !203
  %186 = fsub double %185, %176, !dbg !203
  %187 = fmul double %184, %186, !dbg !203
  %188 = fadd double %177, %187, !dbg !203
  %189 = fmul double %184, %188, !dbg !203
  %190 = fsub double %189, %178, !dbg !203
  %191 = fmul double %184, %190, !dbg !203
  %192 = fadd double %179, %191, !dbg !203
  %193 = fmul double %184, %192, !dbg !203
  %194 = fadd double %180, %193, !dbg !203
  %195 = fmul double %184, %194, !dbg !203
  %196 = fadd double %174, %195, !dbg !203
  %197 = fmul double %183, %196, !dbg !203
  %198 = fadd double %s.532, %197, !dbg !203
  tail call void @llvm.dbg.value(metadata !{double %198}, i64 0, metadata !10), !dbg !203
  %199 = add nsw i64 %i.433, 1, !dbg !199
  tail call void @llvm.dbg.value(metadata !{i64 %199}, i64 0, metadata !19), !dbg !199
  %200 = icmp slt i64 %i.433, %172, !dbg !199
  br i1 %200, label %181, label %._crit_edge36, !dbg !199

._crit_edge36:                                    ; preds = %181, %130
  %s.5.lcssa = phi double [ 0.000000e+00, %130 ], [ %198, %181 ]
  %201 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !206
  %202 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !207, !tbaa !98
  %203 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !207, !tbaa !98
  %204 = fmul double %202, %203, !dbg !207
  %205 = load double* @nulltime, align 8, !dbg !207, !tbaa !98
  %206 = fsub double %204, %205, !dbg !207
  store double %206, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !207, !tbaa !98
  %207 = load double* @piref, align 8, !dbg !208, !tbaa !98
  %208 = load double* @three, align 8, !dbg !208, !tbaa !98
  %209 = fdiv double %207, %208, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %209}, i64 0, metadata !12), !dbg !208
  %210 = fmul double %209, %209, !dbg !209
  tail call void @llvm.dbg.value(metadata !{double %210}, i64 0, metadata !14), !dbg !209
  %211 = load double* @A6, align 8, !dbg !210, !tbaa !98
  %212 = fmul double %211, %210, !dbg !210
  %213 = load double* @A5, align 8, !dbg !210, !tbaa !98
  %214 = fsub double %212, %213, !dbg !210
  %215 = fmul double %210, %214, !dbg !210
  %216 = load double* @A4, align 8, !dbg !210, !tbaa !98
  %217 = fadd double %216, %215, !dbg !210
  %218 = fmul double %210, %217, !dbg !210
  %219 = load double* @A3, align 8, !dbg !210, !tbaa !98
  %220 = fsub double %218, %219, !dbg !210
  %221 = fmul double %210, %220, !dbg !210
  %222 = load double* @A2, align 8, !dbg !210, !tbaa !98
  %223 = fadd double %222, %221, !dbg !210
  %224 = fmul double %210, %223, !dbg !210
  %225 = load double* @A1, align 8, !dbg !210, !tbaa !98
  %226 = fadd double %225, %224, !dbg !210
  %227 = fmul double %210, %226, !dbg !210
  %228 = load double* @one, align 8, !dbg !210, !tbaa !98
  %229 = fadd double %228, %227, !dbg !210
  %230 = fmul double %209, %229, !dbg !210
  store double %230, double* @sa, align 8, !dbg !210, !tbaa !98
  %231 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !211, !tbaa !98
  %232 = fdiv double %231, 1.700000e+01, !dbg !211
  store double %232, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 10), align 16, !dbg !211, !tbaa !98
  %233 = load double* @sa, align 8, !dbg !212, !tbaa !98
  %234 = load double* @two, align 8, !dbg !212, !tbaa !98
  %235 = fmul double %s.5.lcssa, %234, !dbg !212
  %236 = fadd double %233, %235, !dbg !212
  %237 = fmul double %170, %236, !dbg !212
  %238 = fdiv double %237, %234, !dbg !212
  store double %238, double* @sa, align 8, !dbg !212, !tbaa !98
  store double 5.000000e-01, double* @sb, align 8, !dbg !213, !tbaa !98
  %239 = fadd double %238, -5.000000e-01, !dbg !214
  store double %239, double* @sc, align 8, !dbg !214, !tbaa !98
  %240 = load double* @one, align 8, !dbg !215, !tbaa !98
  %241 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 10), align 16, !dbg !215, !tbaa !98
  %242 = fdiv double %240, %241, !dbg !215
  store double %242, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 11), align 8, !dbg !215, !tbaa !98
  %243 = load double* @sc, align 8, !dbg !216, !tbaa !98
  %244 = fmul double %243, 1.000000e-30, !dbg !216
  %245 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !216, !tbaa !98
  %246 = fmul double %245, 1.000000e-30, !dbg !216
  %247 = fmul double %242, 1.000000e-30, !dbg !216
  %248 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str6, i64 0, i64 0), double %244, double %246, double %247) #3, !dbg !216
  %249 = load double* @A3, align 8, !dbg !217, !tbaa !98
  %250 = fsub double -0.000000e+00, %249, !dbg !217
  store double %250, double* @A3, align 8, !dbg !217, !tbaa !98
  %251 = load double* @A5, align 8, !dbg !218, !tbaa !98
  %252 = fsub double -0.000000e+00, %251, !dbg !218
  store double %252, double* @A5, align 8, !dbg !218, !tbaa !98
  %253 = load double* @piref, align 8, !dbg !219, !tbaa !98
  %254 = load double* @three, align 8, !dbg !219, !tbaa !98
  %255 = fmul double %168, %254, !dbg !219
  %256 = fdiv double %253, %255, !dbg !219
  tail call void @llvm.dbg.value(metadata !{double %256}, i64 0, metadata !15), !dbg !219
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !220
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !221
  %257 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !222
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !223
  %258 = icmp slt i64 %142, 2, !dbg !223
  br i1 %258, label %._crit_edge29, label %.lr.ph28, !dbg !223

.lr.ph28:                                         ; preds = %._crit_edge36
  %259 = load double* @B6, align 8, !dbg !225, !tbaa !98
  %260 = load double* @B5, align 8, !dbg !225, !tbaa !98
  %261 = load double* @B4, align 8, !dbg !225, !tbaa !98
  %262 = load double* @B3, align 8, !dbg !225, !tbaa !98
  %263 = load double* @B2, align 8, !dbg !225, !tbaa !98
  %264 = load double* @B1, align 8, !dbg !225, !tbaa !98
  %265 = load double* @one, align 8, !dbg !225, !tbaa !98
  br label %266, !dbg !223

; <label>:266                                     ; preds = %266, %.lr.ph28
  %i.526 = phi i64 [ 1, %.lr.ph28 ], [ %283, %266 ]
  %s.625 = phi double [ 0.000000e+00, %.lr.ph28 ], [ %282, %266 ]
  %267 = sitofp i64 %i.526 to double, !dbg !227
  %268 = fmul double %256, %267, !dbg !227
  tail call void @llvm.dbg.value(metadata !{double %268}, i64 0, metadata !12), !dbg !227
  %269 = fmul double %268, %268, !dbg !228
  tail call void @llvm.dbg.value(metadata !{double %269}, i64 0, metadata !14), !dbg !228
  %270 = fmul double %269, %259, !dbg !225
  %271 = fadd double %270, %260, !dbg !225
  %272 = fmul double %269, %271, !dbg !225
  %273 = fadd double %261, %272, !dbg !225
  %274 = fmul double %269, %273, !dbg !225
  %275 = fadd double %262, %274, !dbg !225
  %276 = fmul double %269, %275, !dbg !225
  %277 = fadd double %263, %276, !dbg !225
  %278 = fmul double %269, %277, !dbg !225
  %279 = fadd double %264, %278, !dbg !225
  %280 = fmul double %269, %279, !dbg !225
  %281 = fadd double %s.625, %280, !dbg !225
  %282 = fadd double %265, %281, !dbg !225
  tail call void @llvm.dbg.value(metadata !{double %282}, i64 0, metadata !10), !dbg !225
  %283 = add nsw i64 %i.526, 1, !dbg !223
  tail call void @llvm.dbg.value(metadata !{i64 %283}, i64 0, metadata !19), !dbg !223
  %284 = icmp slt i64 %i.526, %172, !dbg !223
  br i1 %284, label %266, label %._crit_edge29, !dbg !223

._crit_edge29:                                    ; preds = %266, %._crit_edge36
  %s.6.lcssa = phi double [ 0.000000e+00, %._crit_edge36 ], [ %282, %266 ]
  %285 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !229
  %286 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !230, !tbaa !98
  %287 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !230, !tbaa !98
  %288 = fmul double %286, %287, !dbg !230
  %289 = load double* @nulltime, align 8, !dbg !230, !tbaa !98
  %290 = fsub double %288, %289, !dbg !230
  store double %290, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !230, !tbaa !98
  %291 = load double* @piref, align 8, !dbg !231, !tbaa !98
  %292 = load double* @three, align 8, !dbg !231, !tbaa !98
  %293 = fdiv double %291, %292, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %293}, i64 0, metadata !12), !dbg !231
  %294 = fmul double %293, %293, !dbg !232
  tail call void @llvm.dbg.value(metadata !{double %294}, i64 0, metadata !14), !dbg !232
  %295 = load double* @B6, align 8, !dbg !233, !tbaa !98
  %296 = fmul double %295, %294, !dbg !233
  %297 = load double* @B5, align 8, !dbg !233, !tbaa !98
  %298 = fadd double %296, %297, !dbg !233
  %299 = fmul double %294, %298, !dbg !233
  %300 = load double* @B4, align 8, !dbg !233, !tbaa !98
  %301 = fadd double %300, %299, !dbg !233
  %302 = fmul double %294, %301, !dbg !233
  %303 = load double* @B3, align 8, !dbg !233, !tbaa !98
  %304 = fadd double %303, %302, !dbg !233
  %305 = fmul double %294, %304, !dbg !233
  %306 = load double* @B2, align 8, !dbg !233, !tbaa !98
  %307 = fadd double %306, %305, !dbg !233
  %308 = fmul double %294, %307, !dbg !233
  %309 = load double* @B1, align 8, !dbg !233, !tbaa !98
  %310 = fadd double %309, %308, !dbg !233
  %311 = fmul double %294, %310, !dbg !233
  %312 = load double* @one, align 8, !dbg !233, !tbaa !98
  %313 = fadd double %312, %311, !dbg !233
  store double %313, double* @sa, align 8, !dbg !233, !tbaa !98
  %314 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !234, !tbaa !98
  %315 = fdiv double %314, 1.500000e+01, !dbg !234
  store double %315, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 13), align 8, !dbg !234, !tbaa !98
  %316 = load double* @sa, align 8, !dbg !235, !tbaa !98
  %317 = load double* @one, align 8, !dbg !235, !tbaa !98
  %318 = fadd double %316, %317, !dbg !235
  %319 = load double* @two, align 8, !dbg !235, !tbaa !98
  %320 = fmul double %s.6.lcssa, %319, !dbg !235
  %321 = fadd double %318, %320, !dbg !235
  %322 = fmul double %256, %321, !dbg !235
  %323 = fdiv double %322, %319, !dbg !235
  store double %323, double* @sa, align 8, !dbg !235, !tbaa !98
  %324 = load double* @piref, align 8, !dbg !236, !tbaa !98
  %325 = load double* @three, align 8, !dbg !236, !tbaa !98
  %326 = fdiv double %324, %325, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %326}, i64 0, metadata !12), !dbg !236
  %327 = fmul double %326, %326, !dbg !237
  tail call void @llvm.dbg.value(metadata !{double %327}, i64 0, metadata !14), !dbg !237
  %328 = load double* @A6, align 8, !dbg !238, !tbaa !98
  %329 = fmul double %328, %327, !dbg !238
  %330 = load double* @A5, align 8, !dbg !238, !tbaa !98
  %331 = fadd double %329, %330, !dbg !238
  %332 = fmul double %327, %331, !dbg !238
  %333 = load double* @A4, align 8, !dbg !238, !tbaa !98
  %334 = fadd double %333, %332, !dbg !238
  %335 = fmul double %327, %334, !dbg !238
  %336 = load double* @A3, align 8, !dbg !238, !tbaa !98
  %337 = fadd double %336, %335, !dbg !238
  %338 = fmul double %327, %337, !dbg !238
  %339 = load double* @A2, align 8, !dbg !238, !tbaa !98
  %340 = fadd double %339, %338, !dbg !238
  %341 = fmul double %327, %340, !dbg !238
  %342 = load double* @A1, align 8, !dbg !238, !tbaa !98
  %343 = fadd double %342, %341, !dbg !238
  %344 = fmul double %327, %343, !dbg !238
  %345 = load double* @A0, align 8, !dbg !238, !tbaa !98
  %346 = fadd double %345, %344, !dbg !238
  %347 = fmul double %326, %346, !dbg !238
  store double %347, double* @sb, align 8, !dbg !238, !tbaa !98
  %348 = load double* @sa, align 8, !dbg !239, !tbaa !98
  %349 = fsub double %348, %347, !dbg !239
  store double %349, double* @sc, align 8, !dbg !239, !tbaa !98
  %350 = load double* @one, align 8, !dbg !240, !tbaa !98
  %351 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 13), align 8, !dbg !240, !tbaa !98
  %352 = fdiv double %350, %351, !dbg !240
  store double %352, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 14), align 16, !dbg !240, !tbaa !98
  %353 = load double* @sc, align 8, !dbg !241, !tbaa !98
  %354 = fmul double %353, 1.000000e-30, !dbg !241
  %355 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !241, !tbaa !98
  %356 = fmul double %355, 1.000000e-30, !dbg !241
  %357 = fmul double %352, 1.000000e-30, !dbg !241
  %358 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str7, i64 0, i64 0), double %354, double %356, double %357) #3, !dbg !241
  %359 = load double* @piref, align 8, !dbg !242, !tbaa !98
  %360 = load double* @three, align 8, !dbg !242, !tbaa !98
  %361 = fmul double %168, %360, !dbg !242
  %362 = fdiv double %359, %361, !dbg !242
  tail call void @llvm.dbg.value(metadata !{double %362}, i64 0, metadata !15), !dbg !242
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !243
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !244
  %363 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !245
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !246
  %364 = icmp slt i64 %142, 2, !dbg !246
  br i1 %364, label %._crit_edge23, label %.lr.ph22, !dbg !246

.lr.ph22:                                         ; preds = %._crit_edge29
  %365 = load double* @A6, align 8, !dbg !248, !tbaa !98
  %366 = load double* @A5, align 8, !dbg !248, !tbaa !98
  %367 = load double* @A4, align 8, !dbg !248, !tbaa !98
  %368 = load double* @A3, align 8, !dbg !248, !tbaa !98
  %369 = load double* @A2, align 8, !dbg !248, !tbaa !98
  %370 = load double* @A1, align 8, !dbg !248, !tbaa !98
  %371 = load double* @one, align 8, !dbg !248, !tbaa !98
  %372 = load double* @B6, align 8, !dbg !250, !tbaa !98
  %373 = load double* @B5, align 8, !dbg !250, !tbaa !98
  %374 = load double* @B4, align 8, !dbg !250, !tbaa !98
  %375 = load double* @B3, align 8, !dbg !250, !tbaa !98
  %376 = load double* @B2, align 8, !dbg !250, !tbaa !98
  %377 = load double* @B1, align 8, !dbg !250, !tbaa !98
  %378 = insertelement <2 x double> undef, double %371, i32 0, !dbg !248
  %379 = insertelement <2 x double> %378, double %377, i32 1, !dbg !248
  %380 = insertelement <2 x double> undef, double %370, i32 0, !dbg !248
  %381 = insertelement <2 x double> %380, double %376, i32 1, !dbg !248
  %382 = insertelement <2 x double> undef, double %369, i32 0, !dbg !248
  %383 = insertelement <2 x double> %382, double %375, i32 1, !dbg !248
  %384 = insertelement <2 x double> undef, double %368, i32 0, !dbg !248
  %385 = insertelement <2 x double> %384, double %374, i32 1, !dbg !248
  %386 = insertelement <2 x double> undef, double %367, i32 0, !dbg !248
  %387 = insertelement <2 x double> %386, double %373, i32 1, !dbg !248
  br label %388, !dbg !246

; <label>:388                                     ; preds = %388, %.lr.ph22
  %i.620 = phi i64 [ 1, %.lr.ph22 ], [ %416, %388 ]
  %s.719 = phi double [ 0.000000e+00, %.lr.ph22 ], [ %415, %388 ]
  %389 = sitofp i64 %i.620 to double, !dbg !251
  %390 = fmul double %362, %389, !dbg !251
  tail call void @llvm.dbg.value(metadata !{double %390}, i64 0, metadata !12), !dbg !251
  %391 = fmul double %390, %390, !dbg !252
  tail call void @llvm.dbg.value(metadata !{double %391}, i64 0, metadata !14), !dbg !252
  %392 = fmul double %391, %365, !dbg !248
  %393 = fadd double %392, %366, !dbg !248
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !13), !dbg !248
  %394 = insertelement <2 x double> undef, double %391, i32 0, !dbg !248
  %395 = insertelement <2 x double> %394, double %391, i32 1, !dbg !248
  %396 = insertelement <2 x double> undef, double %393, i32 0, !dbg !248
  %397 = insertelement <2 x double> %396, double %372, i32 1, !dbg !248
  %398 = fmul <2 x double> %395, %397, !dbg !248
  %399 = fadd <2 x double> %398, %387, !dbg !248
  %400 = fmul <2 x double> %399, %395, !dbg !248
  %401 = fadd <2 x double> %385, %400, !dbg !248
  %402 = fmul <2 x double> %401, %395, !dbg !248
  %403 = fadd <2 x double> %383, %402, !dbg !248
  %404 = fmul <2 x double> %403, %395, !dbg !248
  %405 = fadd <2 x double> %381, %404, !dbg !248
  %406 = fmul <2 x double> %405, %395, !dbg !248
  %407 = fadd <2 x double> %379, %406, !dbg !248
  %408 = insertelement <2 x double> undef, double %390, i32 0, !dbg !248
  %409 = insertelement <2 x double> %408, double %391, i32 1, !dbg !248
  %410 = fmul <2 x double> %409, %407, !dbg !248
  %411 = extractelement <2 x double> %410, i32 1, !dbg !250
  %412 = extractelement <2 x double> %410, i32 0, !dbg !250
  %413 = fadd double %371, %411, !dbg !250
  %414 = fdiv double %412, %413, !dbg !250
  %415 = fadd double %s.719, %414, !dbg !250
  tail call void @llvm.dbg.value(metadata !{double %415}, i64 0, metadata !10), !dbg !250
  %416 = add nsw i64 %i.620, 1, !dbg !246
  tail call void @llvm.dbg.value(metadata !{i64 %416}, i64 0, metadata !19), !dbg !246
  %417 = icmp slt i64 %i.620, %172, !dbg !246
  br i1 %417, label %388, label %._crit_edge23, !dbg !246

._crit_edge23:                                    ; preds = %388, %._crit_edge29
  %s.7.lcssa = phi double [ 0.000000e+00, %._crit_edge29 ], [ %415, %388 ]
  %418 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !254
  %419 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !255, !tbaa !98
  %420 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !255, !tbaa !98
  %421 = fmul double %419, %420, !dbg !255
  %422 = load double* @nulltime, align 8, !dbg !255, !tbaa !98
  %423 = fsub double %421, %422, !dbg !255
  store double %423, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !255, !tbaa !98
  %424 = load double* @piref, align 8, !dbg !256, !tbaa !98
  %425 = load double* @three, align 8, !dbg !256, !tbaa !98
  %426 = fdiv double %424, %425, !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %426}, i64 0, metadata !12), !dbg !256
  %427 = fmul double %426, %426, !dbg !257
  tail call void @llvm.dbg.value(metadata !{double %427}, i64 0, metadata !14), !dbg !257
  %428 = load double* @A6, align 8, !dbg !258, !tbaa !98
  %429 = fmul double %428, %427, !dbg !258
  %430 = load double* @A5, align 8, !dbg !258, !tbaa !98
  %431 = fadd double %429, %430, !dbg !258
  %432 = fmul double %427, %431, !dbg !258
  %433 = load double* @A4, align 8, !dbg !258, !tbaa !98
  %434 = fadd double %433, %432, !dbg !258
  %435 = fmul double %427, %434, !dbg !258
  %436 = load double* @A3, align 8, !dbg !258, !tbaa !98
  %437 = fadd double %436, %435, !dbg !258
  %438 = fmul double %427, %437, !dbg !258
  %439 = load double* @A2, align 8, !dbg !258, !tbaa !98
  %440 = fadd double %439, %438, !dbg !258
  %441 = fmul double %427, %440, !dbg !258
  %442 = load double* @A1, align 8, !dbg !258, !tbaa !98
  %443 = fadd double %442, %441, !dbg !258
  %444 = fmul double %427, %443, !dbg !258
  %445 = load double* @one, align 8, !dbg !258, !tbaa !98
  %446 = fadd double %445, %444, !dbg !258
  %447 = fmul double %426, %446, !dbg !258
  store double %447, double* @sa, align 8, !dbg !258, !tbaa !98
  %448 = load double* @B6, align 8, !dbg !259, !tbaa !98
  %449 = fmul double %427, %448, !dbg !259
  %450 = load double* @B5, align 8, !dbg !259, !tbaa !98
  %451 = fadd double %449, %450, !dbg !259
  %452 = fmul double %427, %451, !dbg !259
  %453 = load double* @B4, align 8, !dbg !259, !tbaa !98
  %454 = fadd double %453, %452, !dbg !259
  %455 = fmul double %427, %454, !dbg !259
  %456 = load double* @B3, align 8, !dbg !259, !tbaa !98
  %457 = fadd double %456, %455, !dbg !259
  %458 = fmul double %427, %457, !dbg !259
  %459 = load double* @B2, align 8, !dbg !259, !tbaa !98
  %460 = fadd double %459, %458, !dbg !259
  %461 = fmul double %427, %460, !dbg !259
  %462 = load double* @B1, align 8, !dbg !259, !tbaa !98
  %463 = fadd double %462, %461, !dbg !259
  %464 = fmul double %427, %463, !dbg !259
  %465 = load double* @one, align 8, !dbg !259, !tbaa !98
  %466 = fadd double %465, %464, !dbg !259
  %467 = load double* @sa, align 8, !dbg !260, !tbaa !98
  %468 = fdiv double %467, %466, !dbg !260
  store double %468, double* @sa, align 8, !dbg !260, !tbaa !98
  %469 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !261, !tbaa !98
  %470 = fdiv double %469, 2.900000e+01, !dbg !261
  store double %470, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 16), align 16, !dbg !261, !tbaa !98
  %471 = load double* @sa, align 8, !dbg !262, !tbaa !98
  %472 = load double* @two, align 8, !dbg !262, !tbaa !98
  %473 = fmul double %s.7.lcssa, %472, !dbg !262
  %474 = fadd double %471, %473, !dbg !262
  %475 = fmul double %362, %474, !dbg !262
  %476 = fdiv double %475, %472, !dbg !262
  store double %476, double* @sa, align 8, !dbg !262, !tbaa !98
  store double 0x3FE62E42FEFA39EF, double* @sb, align 8, !dbg !263, !tbaa !98
  %477 = fadd double %476, 0xBFE62E42FEFA39EF, !dbg !264
  store double %477, double* @sc, align 8, !dbg !264, !tbaa !98
  %478 = load double* @one, align 8, !dbg !265, !tbaa !98
  %479 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 16), align 16, !dbg !265, !tbaa !98
  %480 = fdiv double %478, %479, !dbg !265
  store double %480, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 17), align 8, !dbg !265, !tbaa !98
  %481 = load double* @sc, align 8, !dbg !266, !tbaa !98
  %482 = fmul double %481, 1.000000e-30, !dbg !266
  %483 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !266, !tbaa !98
  %484 = fmul double %483, 1.000000e-30, !dbg !266
  %485 = fmul double %480, 1.000000e-30, !dbg !266
  %486 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i64 0, i64 0), double %482, double %484, double %485) #3, !dbg !266
  %487 = load double* @piref, align 8, !dbg !267, !tbaa !98
  %488 = load double* @four, align 8, !dbg !267, !tbaa !98
  %489 = fmul double %168, %488, !dbg !267
  %490 = fdiv double %487, %489, !dbg !267
  tail call void @llvm.dbg.value(metadata !{double %490}, i64 0, metadata !15), !dbg !267
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !268
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !269
  %491 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !270
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !271
  %492 = icmp slt i64 %142, 2, !dbg !271
  br i1 %492, label %._crit_edge17, label %.lr.ph16, !dbg !271

.lr.ph16:                                         ; preds = %._crit_edge23
  %493 = load double* @A6, align 8, !dbg !273, !tbaa !98
  %494 = load double* @A5, align 8, !dbg !273, !tbaa !98
  %495 = load double* @A4, align 8, !dbg !273, !tbaa !98
  %496 = load double* @A3, align 8, !dbg !273, !tbaa !98
  %497 = load double* @A2, align 8, !dbg !273, !tbaa !98
  %498 = load double* @A1, align 8, !dbg !273, !tbaa !98
  %499 = load double* @one, align 8, !dbg !273, !tbaa !98
  %500 = load double* @B6, align 8, !dbg !275, !tbaa !98
  %501 = load double* @B5, align 8, !dbg !275, !tbaa !98
  %502 = load double* @B4, align 8, !dbg !275, !tbaa !98
  %503 = load double* @B3, align 8, !dbg !275, !tbaa !98
  %504 = load double* @B2, align 8, !dbg !275, !tbaa !98
  %505 = load double* @B1, align 8, !dbg !275, !tbaa !98
  %506 = insertelement <2 x double> undef, double %499, i32 0, !dbg !273
  %507 = insertelement <2 x double> %506, double %505, i32 1, !dbg !273
  %508 = insertelement <2 x double> undef, double %498, i32 0, !dbg !273
  %509 = insertelement <2 x double> %508, double %504, i32 1, !dbg !273
  %510 = insertelement <2 x double> undef, double %497, i32 0, !dbg !273
  %511 = insertelement <2 x double> %510, double %503, i32 1, !dbg !273
  %512 = insertelement <2 x double> undef, double %496, i32 0, !dbg !273
  %513 = insertelement <2 x double> %512, double %502, i32 1, !dbg !273
  %514 = insertelement <2 x double> undef, double %495, i32 0, !dbg !273
  %515 = insertelement <2 x double> %514, double %501, i32 1, !dbg !273
  br label %516, !dbg !271

; <label>:516                                     ; preds = %516, %.lr.ph16
  %i.714 = phi i64 [ 1, %.lr.ph16 ], [ %544, %516 ]
  %s.813 = phi double [ 0.000000e+00, %.lr.ph16 ], [ %543, %516 ]
  %517 = sitofp i64 %i.714 to double, !dbg !276
  %518 = fmul double %490, %517, !dbg !276
  tail call void @llvm.dbg.value(metadata !{double %518}, i64 0, metadata !12), !dbg !276
  %519 = fmul double %518, %518, !dbg !277
  tail call void @llvm.dbg.value(metadata !{double %519}, i64 0, metadata !14), !dbg !277
  %520 = fmul double %519, %493, !dbg !273
  %521 = fadd double %520, %494, !dbg !273
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !13), !dbg !273
  %522 = insertelement <2 x double> undef, double %519, i32 0, !dbg !273
  %523 = insertelement <2 x double> %522, double %519, i32 1, !dbg !273
  %524 = insertelement <2 x double> undef, double %521, i32 0, !dbg !273
  %525 = insertelement <2 x double> %524, double %500, i32 1, !dbg !273
  %526 = fmul <2 x double> %523, %525, !dbg !273
  %527 = fadd <2 x double> %526, %515, !dbg !273
  %528 = fmul <2 x double> %527, %523, !dbg !273
  %529 = fadd <2 x double> %513, %528, !dbg !273
  %530 = fmul <2 x double> %529, %523, !dbg !273
  %531 = fadd <2 x double> %511, %530, !dbg !273
  %532 = fmul <2 x double> %531, %523, !dbg !273
  %533 = fadd <2 x double> %509, %532, !dbg !273
  %534 = fmul <2 x double> %533, %523, !dbg !273
  %535 = fadd <2 x double> %507, %534, !dbg !273
  %536 = insertelement <2 x double> undef, double %518, i32 0, !dbg !273
  %537 = insertelement <2 x double> %536, double %519, i32 1, !dbg !273
  %538 = fmul <2 x double> %537, %535, !dbg !273
  %539 = extractelement <2 x double> %538, i32 1, !dbg !275
  %540 = extractelement <2 x double> %538, i32 0, !dbg !275
  %541 = fadd double %499, %539, !dbg !275
  %542 = fmul double %540, %541, !dbg !275
  %543 = fadd double %s.813, %542, !dbg !275
  tail call void @llvm.dbg.value(metadata !{double %543}, i64 0, metadata !10), !dbg !275
  %544 = add nsw i64 %i.714, 1, !dbg !271
  tail call void @llvm.dbg.value(metadata !{i64 %544}, i64 0, metadata !19), !dbg !271
  %545 = icmp slt i64 %i.714, %172, !dbg !271
  br i1 %545, label %516, label %._crit_edge17, !dbg !271

._crit_edge17:                                    ; preds = %516, %._crit_edge23
  %s.8.lcssa = phi double [ 0.000000e+00, %._crit_edge23 ], [ %543, %516 ]
  %546 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !278
  %547 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !279, !tbaa !98
  %548 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !279, !tbaa !98
  %549 = fmul double %547, %548, !dbg !279
  %550 = load double* @nulltime, align 8, !dbg !279, !tbaa !98
  %551 = fsub double %549, %550, !dbg !279
  store double %551, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !279, !tbaa !98
  %552 = load double* @piref, align 8, !dbg !280, !tbaa !98
  %553 = load double* @four, align 8, !dbg !280, !tbaa !98
  %554 = fdiv double %552, %553, !dbg !280
  tail call void @llvm.dbg.value(metadata !{double %554}, i64 0, metadata !12), !dbg !280
  %555 = fmul double %554, %554, !dbg !281
  tail call void @llvm.dbg.value(metadata !{double %555}, i64 0, metadata !14), !dbg !281
  %556 = load double* @A6, align 8, !dbg !282, !tbaa !98
  %557 = fmul double %556, %555, !dbg !282
  %558 = load double* @A5, align 8, !dbg !282, !tbaa !98
  %559 = fadd double %557, %558, !dbg !282
  %560 = fmul double %555, %559, !dbg !282
  %561 = load double* @A4, align 8, !dbg !282, !tbaa !98
  %562 = fadd double %561, %560, !dbg !282
  %563 = fmul double %555, %562, !dbg !282
  %564 = load double* @A3, align 8, !dbg !282, !tbaa !98
  %565 = fadd double %564, %563, !dbg !282
  %566 = fmul double %555, %565, !dbg !282
  %567 = load double* @A2, align 8, !dbg !282, !tbaa !98
  %568 = fadd double %567, %566, !dbg !282
  %569 = fmul double %555, %568, !dbg !282
  %570 = load double* @A1, align 8, !dbg !282, !tbaa !98
  %571 = fadd double %570, %569, !dbg !282
  %572 = fmul double %555, %571, !dbg !282
  %573 = load double* @one, align 8, !dbg !282, !tbaa !98
  %574 = fadd double %573, %572, !dbg !282
  %575 = fmul double %554, %574, !dbg !282
  store double %575, double* @sa, align 8, !dbg !282, !tbaa !98
  %576 = load double* @B6, align 8, !dbg !283, !tbaa !98
  %577 = fmul double %555, %576, !dbg !283
  %578 = load double* @B5, align 8, !dbg !283, !tbaa !98
  %579 = fadd double %577, %578, !dbg !283
  %580 = fmul double %555, %579, !dbg !283
  %581 = load double* @B4, align 8, !dbg !283, !tbaa !98
  %582 = fadd double %581, %580, !dbg !283
  %583 = fmul double %555, %582, !dbg !283
  %584 = load double* @B3, align 8, !dbg !283, !tbaa !98
  %585 = fadd double %584, %583, !dbg !283
  %586 = fmul double %555, %585, !dbg !283
  %587 = load double* @B2, align 8, !dbg !283, !tbaa !98
  %588 = fadd double %587, %586, !dbg !283
  %589 = fmul double %555, %588, !dbg !283
  %590 = load double* @B1, align 8, !dbg !283, !tbaa !98
  %591 = fadd double %590, %589, !dbg !283
  %592 = fmul double %555, %591, !dbg !283
  %593 = load double* @one, align 8, !dbg !283, !tbaa !98
  %594 = fadd double %593, %592, !dbg !283
  %595 = load double* @sa, align 8, !dbg !284, !tbaa !98
  %596 = fmul double %595, %594, !dbg !284
  store double %596, double* @sa, align 8, !dbg !284, !tbaa !98
  %597 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !285, !tbaa !98
  %598 = fdiv double %597, 2.900000e+01, !dbg !285
  store double %598, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 19), align 8, !dbg !285, !tbaa !98
  %599 = load double* @sa, align 8, !dbg !286, !tbaa !98
  %600 = load double* @two, align 8, !dbg !286, !tbaa !98
  %601 = fmul double %s.8.lcssa, %600, !dbg !286
  %602 = fadd double %599, %601, !dbg !286
  %603 = fmul double %490, %602, !dbg !286
  %604 = fdiv double %603, %600, !dbg !286
  store double %604, double* @sa, align 8, !dbg !286, !tbaa !98
  store double 2.500000e-01, double* @sb, align 8, !dbg !287, !tbaa !98
  %605 = fadd double %604, -2.500000e-01, !dbg !288
  store double %605, double* @sc, align 8, !dbg !288, !tbaa !98
  %606 = load double* @one, align 8, !dbg !289, !tbaa !98
  %607 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 19), align 8, !dbg !289, !tbaa !98
  %608 = fdiv double %606, %607, !dbg !289
  store double %608, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 20), align 16, !dbg !289, !tbaa !98
  %609 = load double* @sc, align 8, !dbg !290, !tbaa !98
  %610 = fmul double %609, 1.000000e-30, !dbg !290
  %611 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !290, !tbaa !98
  %612 = fmul double %611, 1.000000e-30, !dbg !290
  %613 = fmul double %608, 1.000000e-30, !dbg !290
  %614 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str9, i64 0, i64 0), double %610, double %612, double %613) #3, !dbg !290
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !291
  %615 = load double* @one, align 8, !dbg !292, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %615}, i64 0, metadata !14), !dbg !292
  store double 0x40599541F7F192A4, double* @sa, align 8, !dbg !293, !tbaa !98
  %616 = fdiv double 0x40599541F7F192A4, %168, !dbg !294
  tail call void @llvm.dbg.value(metadata !{double %616}, i64 0, metadata !13), !dbg !294
  %617 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !295
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !296
  %618 = icmp slt i64 %142, 2, !dbg !296
  br i1 %618, label %._crit_edge11, label %.lr.ph10, !dbg !296

.lr.ph10:                                         ; preds = %._crit_edge17, %.lr.ph10
  %i.88 = phi i64 [ %632, %.lr.ph10 ], [ 1, %._crit_edge17 ]
  %s.97 = phi double [ %631, %.lr.ph10 ], [ 0.000000e+00, %._crit_edge17 ]
  %619 = sitofp i64 %i.88 to double, !dbg !298
  %620 = fmul double %616, %619, !dbg !298
  tail call void @llvm.dbg.value(metadata !{double %620}, i64 0, metadata !15), !dbg !298
  %621 = fmul double %620, %620, !dbg !300
  tail call void @llvm.dbg.value(metadata !{double %621}, i64 0, metadata !12), !dbg !300
  %622 = fadd double %615, %620, !dbg !301
  %623 = fdiv double %615, %622, !dbg !301
  %624 = fsub double %s.97, %623, !dbg !301
  %625 = fadd double %615, %621, !dbg !301
  %626 = fdiv double %620, %625, !dbg !301
  %627 = fsub double %624, %626, !dbg !301
  %628 = fmul double %620, %621, !dbg !301
  %629 = fadd double %615, %628, !dbg !301
  %630 = fdiv double %621, %629, !dbg !301
  %631 = fsub double %627, %630, !dbg !301
  tail call void @llvm.dbg.value(metadata !{double %631}, i64 0, metadata !10), !dbg !301
  %632 = add nsw i64 %i.88, 1, !dbg !296
  tail call void @llvm.dbg.value(metadata !{i64 %632}, i64 0, metadata !19), !dbg !296
  %633 = icmp slt i64 %i.88, %172, !dbg !296
  br i1 %633, label %.lr.ph10, label %._crit_edge11, !dbg !296

._crit_edge11:                                    ; preds = %.lr.ph10, %._crit_edge17
  %s.9.lcssa = phi double [ 0.000000e+00, %._crit_edge17 ], [ %631, %.lr.ph10 ]
  %634 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !302
  %635 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !303, !tbaa !98
  %636 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !303, !tbaa !98
  %637 = fmul double %635, %636, !dbg !303
  %638 = load double* @nulltime, align 8, !dbg !303, !tbaa !98
  %639 = fsub double %637, %638, !dbg !303
  store double %639, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !303, !tbaa !98
  %640 = fdiv double %639, 1.200000e+01, !dbg !304
  store double %640, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 22), align 16, !dbg !304, !tbaa !98
  %641 = load double* @sa, align 8, !dbg !305, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %641}, i64 0, metadata !15), !dbg !305
  %642 = fmul double %641, %641, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %642}, i64 0, metadata !12), !dbg !306
  %643 = fsub double -0.000000e+00, %615, !dbg !307
  %644 = fadd double %615, %641, !dbg !307
  %645 = fdiv double %615, %644, !dbg !307
  %646 = fsub double %643, %645, !dbg !307
  %647 = fadd double %615, %642, !dbg !307
  %648 = fdiv double %641, %647, !dbg !307
  %649 = fsub double %646, %648, !dbg !307
  %650 = fmul double %641, %642, !dbg !307
  %651 = fadd double %615, %650, !dbg !307
  %652 = fdiv double %642, %651, !dbg !307
  %653 = fsub double %649, %652, !dbg !307
  %654 = fmul double %616, 1.800000e+01, !dbg !308
  %655 = load double* @two, align 8, !dbg !308, !tbaa !98
  %656 = fmul double %s.9.lcssa, %655, !dbg !308
  %657 = fadd double %653, %656, !dbg !308
  %658 = fmul double %654, %657, !dbg !308
  store double %658, double* @sa, align 8, !dbg !308, !tbaa !98
  %659 = fptosi double %658 to i64, !dbg !309
  %660 = mul nsw i64 %659, -2000, !dbg !309
  tail call void @llvm.dbg.value(metadata !{i64 %660}, i64 0, metadata !20), !dbg !309
  %661 = sitofp i64 %660 to double, !dbg !310
  %662 = load double* @scale, align 8, !dbg !310, !tbaa !98
  %663 = fdiv double %661, %662, !dbg !310
  %664 = fptosi double %663 to i64, !dbg !310
  tail call void @llvm.dbg.value(metadata !{i64 %664}, i64 0, metadata !20), !dbg !310
  %665 = fadd double %658, 5.002000e+02, !dbg !311
  store double %665, double* @sc, align 8, !dbg !311, !tbaa !98
  %666 = load double* @one, align 8, !dbg !312, !tbaa !98
  %667 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 22), align 16, !dbg !312, !tbaa !98
  %668 = fdiv double %666, %667, !dbg !312
  store double %668, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 23), align 8, !dbg !312, !tbaa !98
  %669 = load double* @sc, align 8, !dbg !313, !tbaa !98
  %670 = fmul double %669, 1.000000e-30, !dbg !313
  %671 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !313, !tbaa !98
  %672 = fmul double %671, 1.000000e-30, !dbg !313
  %673 = fmul double %668, 1.000000e-30, !dbg !313
  %674 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str10, i64 0, i64 0), double %670, double %672, double %673) #3, !dbg !313
  %675 = load double* @piref, align 8, !dbg !314, !tbaa !98
  %676 = load double* @three, align 8, !dbg !314, !tbaa !98
  %677 = sitofp i64 %664 to double, !dbg !314
  %678 = fmul double %677, %676, !dbg !314
  %679 = fdiv double %675, %678, !dbg !314
  tail call void @llvm.dbg.value(metadata !{double %679}, i64 0, metadata !15), !dbg !314
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !315
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !316
  %680 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !317
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !318
  %681 = add nsw i64 %664, -1, !dbg !318
  %682 = icmp slt i64 %664, 2, !dbg !318
  br i1 %682, label %._crit_edge, label %.lr.ph, !dbg !318

.lr.ph:                                           ; preds = %._crit_edge11
  %683 = load double* @B6, align 8, !dbg !320, !tbaa !98
  %684 = load double* @B5, align 8, !dbg !320, !tbaa !98
  %685 = load double* @B4, align 8, !dbg !320, !tbaa !98
  %686 = load double* @B3, align 8, !dbg !320, !tbaa !98
  %687 = load double* @B2, align 8, !dbg !320, !tbaa !98
  %688 = load double* @B1, align 8, !dbg !320, !tbaa !98
  %689 = load double* @one, align 8, !dbg !320, !tbaa !98
  %690 = load double* @A6, align 8, !dbg !322, !tbaa !98
  %691 = load double* @A5, align 8, !dbg !322, !tbaa !98
  %692 = load double* @A4, align 8, !dbg !322, !tbaa !98
  %693 = load double* @A3, align 8, !dbg !322, !tbaa !98
  %694 = load double* @A2, align 8, !dbg !322, !tbaa !98
  %695 = load double* @A1, align 8, !dbg !322, !tbaa !98
  br label %696, !dbg !318

; <label>:696                                     ; preds = %696, %.lr.ph
  %i.96 = phi i64 [ 1, %.lr.ph ], [ %728, %696 ]
  %s.105 = phi double [ 0.000000e+00, %.lr.ph ], [ %727, %696 ]
  %697 = sitofp i64 %i.96 to double, !dbg !323
  %698 = fmul double %679, %697, !dbg !323
  tail call void @llvm.dbg.value(metadata !{double %698}, i64 0, metadata !12), !dbg !323
  %699 = fmul double %698, %698, !dbg !324
  tail call void @llvm.dbg.value(metadata !{double %699}, i64 0, metadata !14), !dbg !324
  %700 = fmul double %699, %683, !dbg !320
  %701 = fadd double %700, %684, !dbg !320
  %702 = fmul double %699, %701, !dbg !320
  %703 = fadd double %685, %702, !dbg !320
  %704 = fmul double %699, %703, !dbg !320
  %705 = fadd double %686, %704, !dbg !320
  %706 = fmul double %699, %705, !dbg !320
  %707 = fadd double %687, %706, !dbg !320
  %708 = fmul double %699, %707, !dbg !320
  %709 = fadd double %688, %708, !dbg !320
  %710 = fmul double %699, %709, !dbg !320
  %711 = fadd double %689, %710, !dbg !320
  tail call void @llvm.dbg.value(metadata !{double %711}, i64 0, metadata !13), !dbg !320
  %712 = fmul double %711, %711, !dbg !322
  %713 = fmul double %698, %712, !dbg !322
  %714 = fmul double %699, %690, !dbg !322
  %715 = fadd double %714, %691, !dbg !322
  %716 = fmul double %699, %715, !dbg !322
  %717 = fadd double %692, %716, !dbg !322
  %718 = fmul double %699, %717, !dbg !322
  %719 = fadd double %693, %718, !dbg !322
  %720 = fmul double %699, %719, !dbg !322
  %721 = fadd double %694, %720, !dbg !322
  %722 = fmul double %699, %721, !dbg !322
  %723 = fadd double %695, %722, !dbg !322
  %724 = fmul double %699, %723, !dbg !322
  %725 = fadd double %689, %724, !dbg !322
  %726 = fmul double %713, %725, !dbg !322
  %727 = fadd double %s.105, %726, !dbg !322
  tail call void @llvm.dbg.value(metadata !{double %727}, i64 0, metadata !10), !dbg !322
  %728 = add nsw i64 %i.96, 1, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i64 %728}, i64 0, metadata !19), !dbg !318
  %729 = icmp slt i64 %i.96, %681, !dbg !318
  br i1 %729, label %696, label %._crit_edge, !dbg !318

._crit_edge:                                      ; preds = %696, %._crit_edge11
  %s.10.lcssa = phi double [ 0.000000e+00, %._crit_edge11 ], [ %727, %696 ]
  %730 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)), !dbg !325
  %731 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !326, !tbaa !98
  %732 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !326, !tbaa !98
  %733 = fmul double %731, %732, !dbg !326
  %734 = load double* @nulltime, align 8, !dbg !326, !tbaa !98
  %735 = fsub double %733, %734, !dbg !326
  store double %735, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !326, !tbaa !98
  %736 = load double* @piref, align 8, !dbg !327, !tbaa !98
  %737 = load double* @three, align 8, !dbg !327, !tbaa !98
  %738 = fdiv double %736, %737, !dbg !327
  tail call void @llvm.dbg.value(metadata !{double %738}, i64 0, metadata !12), !dbg !327
  %739 = fmul double %738, %738, !dbg !328
  tail call void @llvm.dbg.value(metadata !{double %739}, i64 0, metadata !14), !dbg !328
  %740 = load double* @A6, align 8, !dbg !329, !tbaa !98
  %741 = fmul double %740, %739, !dbg !329
  %742 = load double* @A5, align 8, !dbg !329, !tbaa !98
  %743 = fadd double %741, %742, !dbg !329
  %744 = fmul double %739, %743, !dbg !329
  %745 = load double* @A4, align 8, !dbg !329, !tbaa !98
  %746 = fadd double %745, %744, !dbg !329
  %747 = fmul double %739, %746, !dbg !329
  %748 = load double* @A3, align 8, !dbg !329, !tbaa !98
  %749 = fadd double %748, %747, !dbg !329
  %750 = fmul double %739, %749, !dbg !329
  %751 = load double* @A2, align 8, !dbg !329, !tbaa !98
  %752 = fadd double %751, %750, !dbg !329
  %753 = fmul double %739, %752, !dbg !329
  %754 = load double* @A1, align 8, !dbg !329, !tbaa !98
  %755 = fadd double %754, %753, !dbg !329
  %756 = fmul double %739, %755, !dbg !329
  %757 = load double* @one, align 8, !dbg !329, !tbaa !98
  %758 = fadd double %757, %756, !dbg !329
  %759 = fmul double %738, %758, !dbg !329
  store double %759, double* @sa, align 8, !dbg !329, !tbaa !98
  %760 = load double* @B6, align 8, !dbg !330, !tbaa !98
  %761 = fmul double %739, %760, !dbg !330
  %762 = load double* @B5, align 8, !dbg !330, !tbaa !98
  %763 = fadd double %761, %762, !dbg !330
  %764 = fmul double %739, %763, !dbg !330
  %765 = load double* @B4, align 8, !dbg !330, !tbaa !98
  %766 = fadd double %765, %764, !dbg !330
  %767 = fmul double %739, %766, !dbg !330
  %768 = load double* @B3, align 8, !dbg !330, !tbaa !98
  %769 = fadd double %768, %767, !dbg !330
  %770 = fmul double %739, %769, !dbg !330
  %771 = load double* @B2, align 8, !dbg !330, !tbaa !98
  %772 = fadd double %771, %770, !dbg !330
  %773 = fmul double %739, %772, !dbg !330
  %774 = load double* @B1, align 8, !dbg !330, !tbaa !98
  %775 = fadd double %774, %773, !dbg !330
  %776 = fmul double %739, %775, !dbg !330
  %777 = load double* @one, align 8, !dbg !330, !tbaa !98
  %778 = fadd double %777, %776, !dbg !330
  %779 = load double* @sa, align 8, !dbg !331, !tbaa !98
  %780 = fmul double %779, %778, !dbg !331
  %781 = fmul double %778, %780, !dbg !331
  store double %781, double* @sa, align 8, !dbg !331, !tbaa !98
  %782 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !332, !tbaa !98
  %783 = fdiv double %782, 3.000000e+01, !dbg !332
  store double %783, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 25), align 8, !dbg !332, !tbaa !98
  %784 = load double* @sa, align 8, !dbg !333, !tbaa !98
  %785 = load double* @two, align 8, !dbg !333, !tbaa !98
  %786 = fmul double %s.10.lcssa, %785, !dbg !333
  %787 = fadd double %784, %786, !dbg !333
  %788 = fmul double %679, %787, !dbg !333
  %789 = fdiv double %788, %785, !dbg !333
  store double %789, double* @sa, align 8, !dbg !333, !tbaa !98
  store double 0x3FD2AAAAAAAAAAAB, double* @sb, align 8, !dbg !334, !tbaa !98
  %790 = fadd double %789, 0xBFD2AAAAAAAAAAAB, !dbg !335
  store double %790, double* @sc, align 8, !dbg !335, !tbaa !98
  %791 = load double* @one, align 8, !dbg !336, !tbaa !98
  %792 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 25), align 8, !dbg !336, !tbaa !98
  %793 = fdiv double %791, %792, !dbg !336
  store double %793, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 26), align 16, !dbg !336, !tbaa !98
  %794 = load double* @sc, align 8, !dbg !337, !tbaa !98
  %795 = fmul double %794, 1.000000e-30, !dbg !337
  %796 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !337, !tbaa !98
  %797 = fmul double %796, 1.000000e-30, !dbg !337
  %798 = fmul double %793, 1.000000e-30, !dbg !337
  %799 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i64 0, i64 0), double %795, double %797, double %798) #3, !dbg !337
  %800 = load double* @five, align 8, !dbg !338, !tbaa !98
  %801 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !338, !tbaa !98
  %802 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !338, !tbaa !98
  %803 = fsub double %801, %802, !dbg !338
  %804 = fmul double %800, %803, !dbg !338
  %805 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !338, !tbaa !98
  %806 = fadd double %805, %804, !dbg !338
  %807 = fdiv double %806, 5.200000e+01, !dbg !338
  store double %807, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 27), align 8, !dbg !338, !tbaa !98
  %808 = load double* @one, align 8, !dbg !339, !tbaa !98
  %809 = fdiv double %808, %807, !dbg !339
  store double %809, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !339, !tbaa !98
  %810 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !340, !tbaa !98
  %811 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !340, !tbaa !98
  %812 = fadd double %810, %811, !dbg !340
  %813 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !340, !tbaa !98
  %814 = fadd double %812, %813, !dbg !340
  %815 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !340, !tbaa !98
  %816 = fadd double %814, %815, !dbg !340
  %817 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !340, !tbaa !98
  %818 = fadd double %816, %817, !dbg !340
  %819 = load double* @four, align 8, !dbg !341, !tbaa !98
  %820 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !341, !tbaa !98
  %821 = fmul double %819, %820, !dbg !341
  %822 = fadd double %818, %821, !dbg !341
  %823 = fdiv double %822, 1.520000e+02, !dbg !341
  store double %823, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 29), align 8, !dbg !341, !tbaa !98
  %824 = load double* @one, align 8, !dbg !342, !tbaa !98
  %825 = fdiv double %824, %823, !dbg !342
  store double %825, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !342, !tbaa !98
  %826 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !343, !tbaa !98
  %827 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !343, !tbaa !98
  %828 = fadd double %826, %827, !dbg !343
  %829 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !343, !tbaa !98
  %830 = fadd double %828, %829, !dbg !343
  %831 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !343, !tbaa !98
  %832 = fadd double %830, %831, !dbg !343
  %833 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !343, !tbaa !98
  %834 = fadd double %832, %833, !dbg !343
  %835 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !344, !tbaa !98
  %836 = fadd double %834, %835, !dbg !344
  %837 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !344, !tbaa !98
  %838 = fadd double %836, %837, !dbg !344
  %839 = fdiv double %838, 1.460000e+02, !dbg !344
  store double %839, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 31), align 8, !dbg !344, !tbaa !98
  %840 = load double* @one, align 8, !dbg !345, !tbaa !98
  %841 = fdiv double %840, %839, !dbg !345
  store double %841, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !345, !tbaa !98
  %842 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !346, !tbaa !98
  %843 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !346, !tbaa !98
  %844 = fadd double %842, %843, !dbg !346
  %845 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !346, !tbaa !98
  %846 = fadd double %844, %845, !dbg !346
  %847 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !346, !tbaa !98
  %848 = fadd double %846, %847, !dbg !346
  %849 = fdiv double %848, 9.100000e+01, !dbg !346
  store double %849, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 33), align 8, !dbg !346, !tbaa !98
  %850 = load double* @one, align 8, !dbg !347, !tbaa !98
  %851 = fdiv double %850, %849, !dbg !347
  store double %851, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !347, !tbaa !98
  %putchar3 = tail call i32 @putchar(i32 10) #3, !dbg !348
  %852 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 %664) #3, !dbg !349
  %853 = load double* @nulltime, align 8, !dbg !350, !tbaa !98
  %854 = fmul double %853, 1.000000e-30, !dbg !350
  %855 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str13, i64 0, i64 0), double %854) #3, !dbg !350
  %856 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !351, !tbaa !98
  %857 = fmul double %856, 1.000000e-30, !dbg !351
  %858 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str14, i64 0, i64 0), double %857) #3, !dbg !351
  %859 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !352, !tbaa !98
  %860 = fmul double %859, 1.000000e-30, !dbg !352
  %861 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str15, i64 0, i64 0), double %860) #3, !dbg !352
  %862 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !353, !tbaa !98
  %863 = fmul double %862, 1.000000e-30, !dbg !353
  %864 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i64 0, i64 0), double %863) #3, !dbg !353
  %865 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !354, !tbaa !98
  %866 = fmul double %865, 1.000000e-30, !dbg !354
  %867 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i64 0, i64 0), double %866) #3, !dbg !354
  ret i32 0, !dbg !355
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @dtime(double* nocapture %p) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %p}, i64 0, metadata !27), !dbg !356
  %1 = getelementptr inbounds double* %p, i64 2, !dbg !357
  %2 = load double* %1, align 8, !dbg !357, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !28), !dbg !357
  %3 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !358
  %4 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !359, !tbaa !360
  %5 = sitofp i64 %4 to double, !dbg !359
  %6 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !359, !tbaa !363
  %7 = sitofp i64 %6 to double, !dbg !359
  %8 = fmul double %7, 1.000000e-06, !dbg !359
  %9 = fadd double %5, %8, !dbg !359
  store double %9, double* %1, align 8, !dbg !359, !tbaa !98
  %10 = fsub double %9, %2, !dbg !364
  %11 = getelementptr inbounds double* %p, i64 1, !dbg !364
  store double %10, double* %11, align 8, !dbg !364, !tbaa !98
  ret i32 0, !dbg !365
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!90, !91}
!llvm.ident = !{!92}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !29, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c] [DW_LANG_C99]
!1 = metadata !{metadata !"flops.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !22}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 173, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !9, i32 174} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !18, metadata !19, metadata !20, metadata !21}
!10 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 179]
!11 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!12 = metadata !{i32 786688, metadata !4, metadata !"u", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 179]
!13 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 179]
!14 = metadata !{i32 786688, metadata !4, metadata !"w", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 179]
!15 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 179]
!16 = metadata !{i32 786688, metadata !4, metadata !"loops", metadata !5, i32 182, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loops] [line 182]
!17 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786688, metadata !4, metadata !"NLimit", metadata !5, i32 182, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!19 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 183, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 183]
!20 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 183, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 183]
!21 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 183, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 183]
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dtime", metadata !"dtime", metadata !"", i32 986, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (double*)* @dtime, null, null, metadata !26, i32 988} ; [ DW_TAG_subprogram ] [line 986] [def] [scope 988] [dtime]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !8, metadata !25}
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!26 = metadata !{metadata !27, metadata !28}
!27 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 987]
!28 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 989]
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !63, metadata !64, metadata !68, metadata !69, metadata !70, metadata !71, metadata !72, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81}
!30 = metadata !{i32 786484, i32 0, null, metadata !"A0", metadata !"A0", metadata !"", metadata !5, i32 140, metadata !11, i32 0, i32 1, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"A1", metadata !"A1", metadata !"", metadata !5, i32 141, metadata !11, i32 0, i32 1, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"A2", metadata !"A2", metadata !"", metadata !5, i32 142, metadata !11, i32 0, i32 1, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"A3", metadata !"A3", metadata !"", metadata !5, i32 143, metadata !11, i32 0, i32 1, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"A4", metadata !"A4", metadata !"", metadata !5, i32 144, metadata !11, i32 0, i32 1, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"A5", metadata !"A5", metadata !"", metadata !5, i32 145, metadata !11, i32 0, i32 1, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"A6", metadata !"A6", metadata !"", metadata !5, i32 146, metadata !11, i32 0, i32 1, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"B0", metadata !"B0", metadata !"", metadata !5, i32 148, metadata !11, i32 0, i32 1, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!38 = metadata !{i32 786484, i32 0, null, metadata !"B1", metadata !"B1", metadata !"", metadata !5, i32 149, metadata !11, i32 0, i32 1, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!39 = metadata !{i32 786484, i32 0, null, metadata !"B2", metadata !"B2", metadata !"", metadata !5, i32 150, metadata !11, i32 0, i32 1, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"B3", metadata !"B3", metadata !"", metadata !5, i32 151, metadata !11, i32 0, i32 1, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!41 = metadata !{i32 786484, i32 0, null, metadata !"B4", metadata !"B4", metadata !"", metadata !5, i32 152, metadata !11, i32 0, i32 1, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"B5", metadata !"B5", metadata !"", metadata !5, i32 153, metadata !11, i32 0, i32 1, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"B6", metadata !"B6", metadata !"", metadata !5, i32 154, metadata !11, i32 0, i32 1, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!44 = metadata !{i32 786484, i32 0, null, metadata !"C0", metadata !"C0", metadata !"", metadata !5, i32 156, metadata !11, i32 0, i32 1, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!45 = metadata !{i32 786484, i32 0, null, metadata !"C1", metadata !"C1", metadata !"", metadata !5, i32 157, metadata !11, i32 0, i32 1, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!46 = metadata !{i32 786484, i32 0, null, metadata !"C2", metadata !"C2", metadata !"", metadata !5, i32 158, metadata !11, i32 0, i32 1, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!47 = metadata !{i32 786484, i32 0, null, metadata !"C3", metadata !"C3", metadata !"", metadata !5, i32 159, metadata !11, i32 0, i32 1, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!48 = metadata !{i32 786484, i32 0, null, metadata !"C4", metadata !"C4", metadata !"", metadata !5, i32 160, metadata !11, i32 0, i32 1, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!49 = metadata !{i32 786484, i32 0, null, metadata !"C5", metadata !"C5", metadata !"", metadata !5, i32 161, metadata !11, i32 0, i32 1, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"C6", metadata !"C6", metadata !"", metadata !5, i32 162, metadata !11, i32 0, i32 1, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!51 = metadata !{i32 786484, i32 0, null, metadata !"C7", metadata !"C7", metadata !"", metadata !5, i32 163, metadata !11, i32 0, i32 1, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!52 = metadata !{i32 786484, i32 0, null, metadata !"C8", metadata !"C8", metadata !"", metadata !5, i32 164, metadata !11, i32 0, i32 1, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!53 = metadata !{i32 786484, i32 0, null, metadata !"D1", metadata !"D1", metadata !"", metadata !5, i32 166, metadata !11, i32 0, i32 1, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"D2", metadata !"D2", metadata !"", metadata !5, i32 167, metadata !11, i32 0, i32 1, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"D3", metadata !"D3", metadata !"", metadata !5, i32 168, metadata !11, i32 0, i32 1, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"E2", metadata !"E2", metadata !"", metadata !5, i32 170, metadata !11, i32 0, i32 1, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"E3", metadata !"E3", metadata !"", metadata !5, i32 171, metadata !11, i32 0, i32 1, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"nulltime", metadata !"nulltime", metadata !"", metadata !5, i32 129, metadata !11, i32 0, i32 1, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"TimeArray", metadata !"TimeArray", metadata !"", metadata !5, i32 129, metadata !60, i32 0, i32 1, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!60 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !11, metadata !61, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!63 = metadata !{i32 786484, i32 0, null, metadata !"TLimit", metadata !"TLimit", metadata !"", metadata !5, i32 130, metadata !11, i32 0, i32 1, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 133, metadata !65, i32 0, i32 1, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!65 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2304, i64 64, i32 0, i32 0, metadata !11, metadata !66, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786465, i64 0, i64 36}       ; [ DW_TAG_subrange_type ] [0, 35]
!68 = metadata !{i32 786484, i32 0, null, metadata !"sa", metadata !"sa", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"sb", metadata !"sb", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"sc", metadata !"sc", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!71 = metadata !{i32 786484, i32 0, null, metadata !"sd", metadata !"sd", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!72 = metadata !{i32 786484, i32 0, null, metadata !"one", metadata !"one", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!73 = metadata !{i32 786484, i32 0, null, metadata !"two", metadata !"two", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!74 = metadata !{i32 786484, i32 0, null, metadata !"three", metadata !"three", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"four", metadata !"four", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!76 = metadata !{i32 786484, i32 0, null, metadata !"five", metadata !"five", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!77 = metadata !{i32 786484, i32 0, null, metadata !"piref", metadata !"piref", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"piprg", metadata !"piprg", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"scale", metadata !"scale", metadata !"", metadata !5, i32 138, metadata !11, i32 0, i32 1, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"pierr", metadata !"pierr", metadata !"", metadata !5, i32 138, metadata !11, i32 0, i32 1, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"tnow", metadata !"tnow", metadata !"", metadata !5, i32 984, metadata !82, i32 0, i32 1, %struct.timeval* @tnow, null} ; [ DW_TAG_variable ] [tnow] [line 984] [def]
!82 = metadata !{i32 786451, metadata !83, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !84, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!83 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!84 = metadata !{metadata !85, metadata !88}
!85 = metadata !{i32 786445, metadata !83, metadata !82, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!86 = metadata !{i32 786454, metadata !87, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!87 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!88 = metadata !{i32 786445, metadata !83, metadata !82, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !89} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!89 = metadata !{i32 786454, metadata !87, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!90 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!91 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!92 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!93 = metadata !{i32 185, i32 0, metadata !4, null}
!94 = metadata !{i32 186, i32 0, metadata !4, null}
!95 = metadata !{i64 15625}
!96 = metadata !{i32 189, i32 0, metadata !4, null}
!97 = metadata !{i32 207, i32 0, metadata !4, null}
!98 = metadata !{metadata !99, metadata !99, i64 0}
!99 = metadata !{metadata !"double", metadata !100, i64 0}
!100 = metadata !{metadata !"omnipotent char", metadata !101, i64 0}
!101 = metadata !{metadata !"Simple C/C++ TBAA"}
!102 = metadata !{i32 209, i32 0, metadata !4, null}
!103 = metadata !{i64 512000000}
!104 = metadata !{i32 210, i32 0, metadata !4, null}
!105 = metadata !{i32 212, i32 0, metadata !4, null}
!106 = metadata !{i32 213, i32 0, metadata !4, null}
!107 = metadata !{i32 214, i32 0, metadata !4, null}
!108 = metadata !{i32 215, i32 0, metadata !4, null}
!109 = metadata !{i32 216, i32 0, metadata !4, null}
!110 = metadata !{i32 217, i32 0, metadata !4, null}
!111 = metadata !{i32 218, i32 0, metadata !4, null}
!112 = metadata !{i32 220, i32 0, metadata !4, null}
!113 = metadata !{i32 221, i32 0, metadata !4, null}
!114 = metadata !{i32 226, i32 0, metadata !4, null}
!115 = metadata !{i32 227, i32 0, metadata !4, null}
!116 = metadata !{i32 237, i32 0, metadata !4, null}
!117 = metadata !{i32 238, i32 0, metadata !4, null}
!118 = metadata !{i32 240, i32 0, metadata !4, null}
!119 = metadata !{i32 242, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !4, i32 241, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!121 = metadata !{i32 243, i32 0, metadata !120, null}
!122 = metadata !{double 0.000000e+00}
!123 = metadata !{i32 244, i32 0, metadata !120, null}
!124 = metadata !{i32 245, i32 0, metadata !120, null}
!125 = metadata !{i32 246, i32 0, metadata !120, null}
!126 = metadata !{i32 248, i32 0, metadata !120, null}
!127 = metadata !{i64 1}
!128 = metadata !{i32 249, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !120, i32 249, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!130 = metadata !{i32 253, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !129, i32 250, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!132 = metadata !{i32 251, i32 0, metadata !131, null}
!133 = metadata !{i32 252, i32 0, metadata !131, null}
!134 = metadata !{i32 255, i32 0, metadata !120, null}
!135 = metadata !{i32 256, i32 0, metadata !120, null}
!136 = metadata !{i32 258, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !120, i32 258, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!138 = metadata !{i32 264, i32 0, metadata !4, null}
!139 = metadata !{i32 266, i32 0, metadata !4, null}
!140 = metadata !{i32 271, i32 0, metadata !4, null}
!141 = metadata !{i32 272, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !4, i32 272, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!143 = metadata !{i32 275, i32 0, metadata !4, null}
!144 = metadata !{i32 276, i32 0, metadata !4, null}
!145 = metadata !{i32 277, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!147 = metadata !{i32 279, i32 0, metadata !4, null}
!148 = metadata !{i32 281, i32 0, metadata !4, null}
!149 = metadata !{i32 282, i32 0, metadata !4, null}
!150 = metadata !{i32 284, i32 0, metadata !4, null}
!151 = metadata !{i32 285, i32 0, metadata !4, null}
!152 = metadata !{i32 286, i32 0, metadata !4, null}
!153 = metadata !{i32 287, i32 0, metadata !4, null}
!154 = metadata !{i32 288, i32 0, metadata !4, null}
!155 = metadata !{i32 289, i32 0, metadata !4, null}
!156 = metadata !{i32 294, i32 0, metadata !4, null}
!157 = metadata !{i32 299, i32 0, metadata !4, null}
!158 = metadata !{i32 310, i32 0, metadata !4, null}
!159 = metadata !{i32 311, i32 0, metadata !4, null}
!160 = metadata !{i32 313, i32 0, metadata !4, null}
!161 = metadata !{i32 314, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!163 = metadata !{i32 317, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !162, i32 315, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!165 = metadata !{i32 319, i32 0, metadata !4, null}
!166 = metadata !{i32 320, i32 0, metadata !4, null}
!167 = metadata !{i32 321, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !4, i32 321, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!169 = metadata !{i32 323, i32 0, metadata !4, null}
!170 = metadata !{i32 325, i32 0, metadata !4, null}
!171 = metadata !{i32 326, i32 0, metadata !4, null}
!172 = metadata !{i32 327, i32 0, metadata !4, null}
!173 = metadata !{i32 328, i32 0, metadata !4, null}
!174 = metadata !{i32 330, i32 0, metadata !4, null}
!175 = metadata !{i32 331, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !4, i32 331, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!177 = metadata !{i32 335, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !176, i32 332, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!179 = metadata !{i32 334, i32 0, metadata !178, null}
!180 = metadata !{i32 333, i32 0, metadata !178, null}
!181 = metadata !{i32 336, i32 0, metadata !178, null}
!182 = metadata !{i32 337, i32 0, metadata !178, null}
!183 = metadata !{i32 338, i32 0, metadata !178, null}
!184 = metadata !{i32 340, i32 0, metadata !4, null}
!185 = metadata !{i32 341, i32 0, metadata !4, null}
!186 = metadata !{i32 343, i32 0, metadata !4, null}
!187 = metadata !{i32 344, i32 0, metadata !4, null}
!188 = metadata !{i32 345, i32 0, metadata !4, null}
!189 = metadata !{i32 346, i32 0, metadata !4, null}
!190 = metadata !{i32 347, i32 0, metadata !4, null}
!191 = metadata !{i32 348, i32 0, metadata !4, null}
!192 = metadata !{i32 349, i32 0, metadata !4, null}
!193 = metadata !{i32 350, i32 0, metadata !4, null}
!194 = metadata !{i32 355, i32 0, metadata !4, null}
!195 = metadata !{i32 369, i32 0, metadata !4, null}
!196 = metadata !{i32 370, i32 0, metadata !4, null}
!197 = metadata !{i32 371, i32 0, metadata !4, null}
!198 = metadata !{i32 373, i32 0, metadata !4, null}
!199 = metadata !{i32 374, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !4, i32 374, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!201 = metadata !{i32 376, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 375, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!203 = metadata !{i32 379, i32 0, metadata !202, null}
!204 = metadata !{i32 377, i32 0, metadata !202, null}
!205 = metadata !{i32 378, i32 0, metadata !202, null}
!206 = metadata !{i32 381, i32 0, metadata !4, null}
!207 = metadata !{i32 382, i32 0, metadata !4, null}
!208 = metadata !{i32 384, i32 0, metadata !4, null}
!209 = metadata !{i32 385, i32 0, metadata !4, null}
!210 = metadata !{i32 386, i32 0, metadata !4, null}
!211 = metadata !{i32 388, i32 0, metadata !4, null}
!212 = metadata !{i32 389, i32 0, metadata !4, null}
!213 = metadata !{i32 390, i32 0, metadata !4, null}
!214 = metadata !{i32 391, i32 0, metadata !4, null}
!215 = metadata !{i32 392, i32 0, metadata !4, null}
!216 = metadata !{i32 397, i32 0, metadata !4, null}
!217 = metadata !{i32 410, i32 0, metadata !4, null}
!218 = metadata !{i32 411, i32 0, metadata !4, null}
!219 = metadata !{i32 412, i32 0, metadata !4, null}
!220 = metadata !{i32 413, i32 0, metadata !4, null}
!221 = metadata !{i32 414, i32 0, metadata !4, null}
!222 = metadata !{i32 416, i32 0, metadata !4, null}
!223 = metadata !{i32 417, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !4, i32 417, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!225 = metadata !{i32 421, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !224, i32 418, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!227 = metadata !{i32 419, i32 0, metadata !226, null}
!228 = metadata !{i32 420, i32 0, metadata !226, null}
!229 = metadata !{i32 423, i32 0, metadata !4, null}
!230 = metadata !{i32 424, i32 0, metadata !4, null}
!231 = metadata !{i32 426, i32 0, metadata !4, null}
!232 = metadata !{i32 427, i32 0, metadata !4, null}
!233 = metadata !{i32 428, i32 0, metadata !4, null}
!234 = metadata !{i32 430, i32 0, metadata !4, null}
!235 = metadata !{i32 431, i32 0, metadata !4, null}
!236 = metadata !{i32 432, i32 0, metadata !4, null}
!237 = metadata !{i32 433, i32 0, metadata !4, null}
!238 = metadata !{i32 434, i32 0, metadata !4, null}
!239 = metadata !{i32 435, i32 0, metadata !4, null}
!240 = metadata !{i32 436, i32 0, metadata !4, null}
!241 = metadata !{i32 441, i32 0, metadata !4, null}
!242 = metadata !{i32 455, i32 0, metadata !4, null}
!243 = metadata !{i32 456, i32 0, metadata !4, null}
!244 = metadata !{i32 457, i32 0, metadata !4, null}
!245 = metadata !{i32 459, i32 0, metadata !4, null}
!246 = metadata !{i32 460, i32 0, metadata !247, null}
!247 = metadata !{i32 786443, metadata !1, metadata !4, i32 460, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!248 = metadata !{i32 464, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !247, i32 461, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!250 = metadata !{i32 465, i32 0, metadata !249, null}
!251 = metadata !{i32 462, i32 0, metadata !249, null}
!252 = metadata !{i32 463, i32 0, metadata !249, null}
!253 = metadata !{double undef}
!254 = metadata !{i32 467, i32 0, metadata !4, null}
!255 = metadata !{i32 468, i32 0, metadata !4, null}
!256 = metadata !{i32 470, i32 0, metadata !4, null}
!257 = metadata !{i32 471, i32 0, metadata !4, null}
!258 = metadata !{i32 472, i32 0, metadata !4, null}
!259 = metadata !{i32 473, i32 0, metadata !4, null}
!260 = metadata !{i32 474, i32 0, metadata !4, null}
!261 = metadata !{i32 476, i32 0, metadata !4, null}
!262 = metadata !{i32 477, i32 0, metadata !4, null}
!263 = metadata !{i32 478, i32 0, metadata !4, null}
!264 = metadata !{i32 479, i32 0, metadata !4, null}
!265 = metadata !{i32 480, i32 0, metadata !4, null}
!266 = metadata !{i32 485, i32 0, metadata !4, null}
!267 = metadata !{i32 499, i32 0, metadata !4, null}
!268 = metadata !{i32 500, i32 0, metadata !4, null}
!269 = metadata !{i32 501, i32 0, metadata !4, null}
!270 = metadata !{i32 503, i32 0, metadata !4, null}
!271 = metadata !{i32 504, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !4, i32 504, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!273 = metadata !{i32 508, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !272, i32 505, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!275 = metadata !{i32 509, i32 0, metadata !274, null}
!276 = metadata !{i32 506, i32 0, metadata !274, null}
!277 = metadata !{i32 507, i32 0, metadata !274, null}
!278 = metadata !{i32 511, i32 0, metadata !4, null}
!279 = metadata !{i32 512, i32 0, metadata !4, null}
!280 = metadata !{i32 514, i32 0, metadata !4, null}
!281 = metadata !{i32 515, i32 0, metadata !4, null}
!282 = metadata !{i32 516, i32 0, metadata !4, null}
!283 = metadata !{i32 517, i32 0, metadata !4, null}
!284 = metadata !{i32 518, i32 0, metadata !4, null}
!285 = metadata !{i32 520, i32 0, metadata !4, null}
!286 = metadata !{i32 521, i32 0, metadata !4, null}
!287 = metadata !{i32 522, i32 0, metadata !4, null}
!288 = metadata !{i32 523, i32 0, metadata !4, null}
!289 = metadata !{i32 524, i32 0, metadata !4, null}
!290 = metadata !{i32 529, i32 0, metadata !4, null}
!291 = metadata !{i32 546, i32 0, metadata !4, null}
!292 = metadata !{i32 547, i32 0, metadata !4, null}
!293 = metadata !{i32 548, i32 0, metadata !4, null}
!294 = metadata !{i32 549, i32 0, metadata !4, null}
!295 = metadata !{i32 551, i32 0, metadata !4, null}
!296 = metadata !{i32 552, i32 0, metadata !297, null}
!297 = metadata !{i32 786443, metadata !1, metadata !4, i32 552, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!298 = metadata !{i32 554, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !297, i32 553, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!300 = metadata !{i32 555, i32 0, metadata !299, null}
!301 = metadata !{i32 556, i32 0, metadata !299, null}
!302 = metadata !{i32 558, i32 0, metadata !4, null}
!303 = metadata !{i32 559, i32 0, metadata !4, null}
!304 = metadata !{i32 563, i32 0, metadata !4, null}
!305 = metadata !{i32 564, i32 0, metadata !4, null}
!306 = metadata !{i32 565, i32 0, metadata !4, null}
!307 = metadata !{i32 566, i32 0, metadata !4, null}
!308 = metadata !{i32 567, i32 0, metadata !4, null}
!309 = metadata !{i32 569, i32 0, metadata !4, null}
!310 = metadata !{i32 570, i32 0, metadata !4, null}
!311 = metadata !{i32 572, i32 0, metadata !4, null}
!312 = metadata !{i32 573, i32 0, metadata !4, null}
!313 = metadata !{i32 578, i32 0, metadata !4, null}
!314 = metadata !{i32 593, i32 0, metadata !4, null}
!315 = metadata !{i32 594, i32 0, metadata !4, null}
!316 = metadata !{i32 595, i32 0, metadata !4, null}
!317 = metadata !{i32 597, i32 0, metadata !4, null}
!318 = metadata !{i32 598, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !4, i32 598, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!320 = metadata !{i32 602, i32 0, metadata !321, null}
!321 = metadata !{i32 786443, metadata !1, metadata !319, i32 599, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!322 = metadata !{i32 603, i32 0, metadata !321, null}
!323 = metadata !{i32 600, i32 0, metadata !321, null}
!324 = metadata !{i32 601, i32 0, metadata !321, null}
!325 = metadata !{i32 605, i32 0, metadata !4, null}
!326 = metadata !{i32 606, i32 0, metadata !4, null}
!327 = metadata !{i32 608, i32 0, metadata !4, null}
!328 = metadata !{i32 609, i32 0, metadata !4, null}
!329 = metadata !{i32 610, i32 0, metadata !4, null}
!330 = metadata !{i32 611, i32 0, metadata !4, null}
!331 = metadata !{i32 612, i32 0, metadata !4, null}
!332 = metadata !{i32 614, i32 0, metadata !4, null}
!333 = metadata !{i32 615, i32 0, metadata !4, null}
!334 = metadata !{i32 616, i32 0, metadata !4, null}
!335 = metadata !{i32 617, i32 0, metadata !4, null}
!336 = metadata !{i32 618, i32 0, metadata !4, null}
!337 = metadata !{i32 623, i32 0, metadata !4, null}
!338 = metadata !{i32 633, i32 0, metadata !4, null}
!339 = metadata !{i32 634, i32 0, metadata !4, null}
!340 = metadata !{i32 640, i32 0, metadata !4, null}
!341 = metadata !{i32 641, i32 0, metadata !4, null}
!342 = metadata !{i32 642, i32 0, metadata !4, null}
!343 = metadata !{i32 648, i32 0, metadata !4, null}
!344 = metadata !{i32 649, i32 0, metadata !4, null}
!345 = metadata !{i32 650, i32 0, metadata !4, null}
!346 = metadata !{i32 656, i32 0, metadata !4, null}
!347 = metadata !{i32 657, i32 0, metadata !4, null}
!348 = metadata !{i32 660, i32 0, metadata !4, null}
!349 = metadata !{i32 661, i32 0, metadata !4, null}
!350 = metadata !{i32 662, i32 0, metadata !4, null}
!351 = metadata !{i32 663, i32 0, metadata !4, null}
!352 = metadata !{i32 664, i32 0, metadata !4, null}
!353 = metadata !{i32 665, i32 0, metadata !4, null}
!354 = metadata !{i32 666, i32 0, metadata !4, null}
!355 = metadata !{i32 667, i32 0, metadata !4, null}
!356 = metadata !{i32 987, i32 0, metadata !22, null}
!357 = metadata !{i32 991, i32 0, metadata !22, null}
!358 = metadata !{i32 993, i32 0, metadata !22, null}
!359 = metadata !{i32 994, i32 0, metadata !22, null}
!360 = metadata !{metadata !361, metadata !362, i64 0}
!361 = metadata !{metadata !"timeval", metadata !362, i64 0, metadata !362, i64 8}
!362 = metadata !{metadata !"long", metadata !100, i64 0}
!363 = metadata !{metadata !361, metadata !362, i64 8}
!364 = metadata !{i32 995, i32 0, metadata !22, null}
!365 = metadata !{i32 997, i32 0, metadata !22, null}
