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

; Function Attrs: minsize nounwind optsize uwtable
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
  %1 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !114
  %2 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !115
  tail call void @llvm.dbg.value(metadata !95, i64 0, metadata !21), !dbg !116
  store double 0.000000e+00, double* @sa, align 8, !dbg !117, !tbaa !98
  br label %3, !dbg !118

; <label>:3                                       ; preds = %._crit_edge67, %0
  %4 = phi double [ 0.000000e+00, %0 ], [ %44, %._crit_edge67 ]
  %x.0 = phi double [ undef, %0 ], [ %11, %._crit_edge67 ]
  %s.0 = phi double [ undef, %0 ], [ %s.1.lcssa, %._crit_edge67 ]
  %n.0 = phi i64 [ 15625, %0 ], [ %8, %._crit_edge67 ]
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
  %12 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !126
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
  %43 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !134
  %44 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !135, !tbaa !98
  store double %44, double* @sa, align 8, !dbg !135, !tbaa !98
  %45 = icmp eq i64 %8, 512000000, !dbg !136
  br i1 %45, label %46, label %3, !dbg !136

; <label>:46                                      ; preds = %._crit_edge67, %3
  %x.1 = phi double [ %11, %._crit_edge67 ], [ %x.0, %3 ]
  %s.2 = phi double [ %s.1.lcssa, %._crit_edge67 ], [ %s.0, %3 ]
  store double 1.589500e-02, double* @scale, align 8, !dbg !138, !tbaa !98
  store double 1.589500e-02, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !139, !tbaa !98
  %47 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !140
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !141
  %48 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !143
  %49 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !144, !tbaa !98
  %50 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !144, !tbaa !98
  %51 = fmul double %49, %50, !dbg !144
  %52 = fcmp olt double %51, 0.000000e+00, !dbg !145
  %storemerge4 = select i1 %52, double 0.000000e+00, double %51, !dbg !145
  store double %storemerge4, double* @nulltime, align 8, !dbg !144, !tbaa !98
  %53 = load double* @sa, align 8, !dbg !147, !tbaa !98
  %54 = fmul double %49, %53, !dbg !147
  %55 = fsub double %54, %storemerge4, !dbg !147
  store double %55, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !147, !tbaa !98
  %56 = load double* @D1, align 8, !dbg !148, !tbaa !98
  %57 = load double* @D2, align 8, !dbg !148, !tbaa !98
  %58 = fadd double %56, %57, !dbg !148
  %59 = load double* @D3, align 8, !dbg !148, !tbaa !98
  %60 = fadd double %58, %59, !dbg !148
  %61 = load double* @one, align 8, !dbg !148, !tbaa !98
  %62 = fadd double %56, %61, !dbg !148
  %63 = load double* @E2, align 8, !dbg !148, !tbaa !98
  %64 = fadd double %62, %63, !dbg !148
  %65 = load double* @E3, align 8, !dbg !148, !tbaa !98
  %66 = fadd double %64, %65, !dbg !148
  %67 = fdiv double %60, %66, !dbg !148
  %68 = fdiv double %55, 1.400000e+01, !dbg !149
  store double %68, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 3), align 8, !dbg !149, !tbaa !98
  %69 = fadd double %67, %56, !dbg !150
  %70 = load double* @two, align 8, !dbg !150, !tbaa !98
  %71 = fmul double %s.2, %70, !dbg !150
  %72 = fadd double %69, %71, !dbg !150
  %73 = fmul double %x.1, %72, !dbg !150
  %74 = fdiv double %73, %70, !dbg !150
  store double %74, double* @sa, align 8, !dbg !150, !tbaa !98
  %75 = fdiv double %61, %74, !dbg !151
  store double %75, double* @sb, align 8, !dbg !151, !tbaa !98
  %76 = fptosi double %75 to i64, !dbg !152
  %77 = mul nsw i64 %76, 40000, !dbg !152
  %78 = sitofp i64 %77 to double, !dbg !152
  %79 = load double* @scale, align 8, !dbg !152, !tbaa !98
  %80 = fdiv double %78, %79, !dbg !152
  %81 = fptosi double %80 to i64, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i64 %81}, i64 0, metadata !21), !dbg !152
  %82 = fadd double %75, -2.520000e+01, !dbg !153
  store double %82, double* @sc, align 8, !dbg !153, !tbaa !98
  %83 = fdiv double %61, %68, !dbg !154
  store double %83, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 4), align 16, !dbg !154, !tbaa !98
  %84 = fmul double %82, 1.000000e-30, !dbg !155
  %85 = fmul double %55, 1.000000e-30, !dbg !155
  %86 = fmul double %83, 1.000000e-30, !dbg !155
  %87 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %84, double %85, double %86) #5, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i64 %81}, i64 0, metadata !20), !dbg !156
  %88 = load double* @five, align 8, !dbg !157, !tbaa !98
  %89 = load double* @one, align 8, !dbg !158, !tbaa !98
  %90 = fsub double -0.000000e+00, %89, !dbg !158
  store double %90, double* @sa, align 8, !dbg !158, !tbaa !98
  %91 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !160
  %s.352 = fsub double -0.000000e+00, %88, !dbg !157
  %92 = icmp slt i64 %81, 1, !dbg !160
  br i1 %92, label %97, label %.lr.ph57, !dbg !160

.lr.ph57:                                         ; preds = %46
  %sa.promoted60 = load double* @sa, align 8, !dbg !162, !tbaa !98
  br label %93, !dbg !160

; <label>:93                                      ; preds = %93, %.lr.ph57
  %94 = phi double [ %sa.promoted60, %.lr.ph57 ], [ %95, %93 ], !dbg !162
  %s.355 = phi double [ %s.352, %.lr.ph57 ], [ %s.3, %93 ]
  %i.254 = phi i64 [ 1, %.lr.ph57 ], [ %96, %93 ]
  %.pn53 = phi double [ %88, %.lr.ph57 ], [ %s.355, %93 ]
  %95 = fadd double %.pn53, %94, !dbg !162
  %96 = add nsw i64 %i.254, 1, !dbg !160
  tail call void @llvm.dbg.value(metadata !{i64 %96}, i64 0, metadata !19), !dbg !160
  %s.3 = fsub double -0.000000e+00, %s.355, !dbg !157
  %exitcond81 = icmp eq i64 %i.254, %81, !dbg !160
  br i1 %exitcond81, label %._crit_edge58, label %93, !dbg !160

._crit_edge58:                                    ; preds = %93
  store double %95, double* @sa, align 8, !dbg !162, !tbaa !98
  br label %97, !dbg !160

; <label>:97                                      ; preds = %._crit_edge58, %46
  %s.3.lcssa = phi double [ %s.3, %._crit_edge58 ], [ %s.352, %46 ]
  %98 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !164
  %99 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !165, !tbaa !98
  %100 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !165, !tbaa !98
  %101 = fmul double %99, %100, !dbg !165
  %102 = fcmp olt double %101, 0.000000e+00, !dbg !166
  %storemerge = select i1 %102, double 0.000000e+00, double %101, !dbg !166
  store double %storemerge, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !165, !tbaa !98
  %103 = sitofp i64 %81 to double, !dbg !168
  store double %103, double* @sc, align 8, !dbg !168, !tbaa !98
  %104 = load double* @sa, align 8, !dbg !169, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !12), !dbg !169
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !170
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !14), !dbg !171
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !15), !dbg !172
  %105 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !173
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !174
  br i1 %92, label %119, label %.lr.ph46, !dbg !174

.lr.ph46:                                         ; preds = %97
  %106 = load double* @two, align 8, !dbg !176, !tbaa !98
  %sa.promoted = load double* @sa, align 8, !dbg !178, !tbaa !98
  br label %107, !dbg !174

; <label>:107                                     ; preds = %107, %.lr.ph46
  %108 = phi double [ %sa.promoted, %.lr.ph46 ], [ %110, %107 ], !dbg !179
  %i.344 = phi i64 [ 1, %.lr.ph46 ], [ %118, %107 ]
  %s.443 = phi double [ %s.3.lcssa, %.lr.ph46 ], [ %109, %107 ]
  %u.042 = phi double [ %104, %.lr.ph46 ], [ %111, %107 ]
  %x.241 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %113, %107 ]
  %w.040 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %117, %107 ]
  %v.139 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %115, %107 ]
  %109 = fsub double -0.000000e+00, %s.443, !dbg !179
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !10), !dbg !179
  %110 = fsub double %108, %s.443, !dbg !178
  %111 = fadd double %u.042, %106, !dbg !176
  tail call void @llvm.dbg.value(metadata !{double %111}, i64 0, metadata !12), !dbg !176
  %112 = fsub double %109, %111, !dbg !180
  %113 = fadd double %x.241, %112, !dbg !180
  tail call void @llvm.dbg.value(metadata !{double %113}, i64 0, metadata !15), !dbg !180
  %114 = fmul double %111, %109, !dbg !181
  %115 = fsub double %v.139, %114, !dbg !181
  tail call void @llvm.dbg.value(metadata !{double %115}, i64 0, metadata !13), !dbg !181
  %116 = fdiv double %109, %111, !dbg !182
  %117 = fadd double %w.040, %116, !dbg !182
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !14), !dbg !182
  %118 = add nsw i64 %i.344, 1, !dbg !174
  tail call void @llvm.dbg.value(metadata !{i64 %118}, i64 0, metadata !19), !dbg !174
  %exitcond = icmp eq i64 %i.344, %81, !dbg !174
  br i1 %exitcond, label %._crit_edge47, label %107, !dbg !174

._crit_edge47:                                    ; preds = %107
  store double %110, double* @sa, align 8, !dbg !178, !tbaa !98
  br label %119, !dbg !174

; <label>:119                                     ; preds = %._crit_edge47, %97
  %x.2.lcssa = phi double [ %113, %._crit_edge47 ], [ 0.000000e+00, %97 ]
  %w.0.lcssa = phi double [ %117, %._crit_edge47 ], [ 0.000000e+00, %97 ]
  %v.1.lcssa = phi double [ %115, %._crit_edge47 ], [ 0.000000e+00, %97 ]
  %120 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !183
  %121 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !184, !tbaa !98
  %122 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !184, !tbaa !98
  %123 = fmul double %121, %122, !dbg !184
  store double %123, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !184, !tbaa !98
  %124 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !185, !tbaa !98
  %125 = fsub double %123, %124, !dbg !185
  %126 = fdiv double %125, 7.000000e+00, !dbg !185
  store double %126, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 7), align 8, !dbg !185, !tbaa !98
  %127 = load double* @sa, align 8, !dbg !186, !tbaa !98
  %128 = fmul double %x.2.lcssa, %127, !dbg !186
  %129 = load double* @sc, align 8, !dbg !186, !tbaa !98
  %130 = fdiv double %128, %129, !dbg !186
  %131 = fptosi double %130 to i64, !dbg !186
  tail call void @llvm.dbg.value(metadata !{i64 %131}, i64 0, metadata !20), !dbg !186
  %132 = load double* @four, align 8, !dbg !187, !tbaa !98
  %133 = fmul double %w.0.lcssa, %132, !dbg !187
  %134 = load double* @five, align 8, !dbg !187, !tbaa !98
  %135 = fdiv double %133, %134, !dbg !187
  store double %135, double* @sa, align 8, !dbg !187, !tbaa !98
  %136 = fdiv double %134, %v.1.lcssa, !dbg !188
  %137 = fadd double %135, %136, !dbg !188
  store double %137, double* @sb, align 8, !dbg !188, !tbaa !98
  store double 3.125000e+01, double* @sc, align 8, !dbg !189, !tbaa !98
  %138 = fmul double %v.1.lcssa, %v.1.lcssa, !dbg !190
  %139 = fmul double %v.1.lcssa, %138, !dbg !190
  %140 = fdiv double 3.125000e+01, %139, !dbg !190
  %141 = fsub double %137, %140, !dbg !190
  store double %141, double* @piprg, align 8, !dbg !190, !tbaa !98
  %142 = load double* @piref, align 8, !dbg !191, !tbaa !98
  %143 = fsub double %141, %142, !dbg !191
  store double %143, double* @pierr, align 8, !dbg !191, !tbaa !98
  %144 = load double* @one, align 8, !dbg !192, !tbaa !98
  %145 = fdiv double %144, %126, !dbg !192
  store double %145, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 8), align 16, !dbg !192, !tbaa !98
  %146 = fmul double %143, 1.000000e-30, !dbg !193
  %147 = fmul double %125, 1.000000e-30, !dbg !193
  %148 = fmul double %145, 1.000000e-30, !dbg !193
  %149 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), double %146, double %147, double %148) #5, !dbg !193
  %150 = load double* @piref, align 8, !dbg !194, !tbaa !98
  %151 = load double* @three, align 8, !dbg !194, !tbaa !98
  %152 = sitofp i64 %131 to double, !dbg !194
  %153 = fmul double %152, %151, !dbg !194
  %154 = fdiv double %150, %153, !dbg !194
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !15), !dbg !194
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !195
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !196
  %155 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !198
  %156 = add nsw i64 %131, -1, !dbg !198
  %157 = icmp slt i64 %131, 2, !dbg !198
  br i1 %157, label %._crit_edge36, label %.lr.ph35, !dbg !198

.lr.ph35:                                         ; preds = %119
  %158 = load double* @one, align 8, !dbg !200, !tbaa !98
  %159 = load double* @A6, align 8, !dbg !202, !tbaa !98
  %160 = load double* @A5, align 8, !dbg !202, !tbaa !98
  %161 = load double* @A4, align 8, !dbg !202, !tbaa !98
  %162 = load double* @A3, align 8, !dbg !202, !tbaa !98
  %163 = load double* @A2, align 8, !dbg !202, !tbaa !98
  %164 = load double* @A1, align 8, !dbg !202, !tbaa !98
  br label %165, !dbg !198

; <label>:165                                     ; preds = %165, %.lr.ph35
  %i.433 = phi i64 [ 1, %.lr.ph35 ], [ %183, %165 ]
  %s.532 = phi double [ 0.000000e+00, %.lr.ph35 ], [ %182, %165 ]
  %v.231 = phi double [ 0.000000e+00, %.lr.ph35 ], [ %166, %165 ]
  %166 = fadd double %v.231, %158, !dbg !200
  tail call void @llvm.dbg.value(metadata !{double %166}, i64 0, metadata !13), !dbg !200
  %167 = fmul double %154, %166, !dbg !203
  tail call void @llvm.dbg.value(metadata !{double %167}, i64 0, metadata !12), !dbg !203
  %168 = fmul double %167, %167, !dbg !204
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !14), !dbg !204
  %169 = fmul double %159, %168, !dbg !202
  %170 = fsub double %169, %160, !dbg !202
  %171 = fmul double %168, %170, !dbg !202
  %172 = fadd double %161, %171, !dbg !202
  %173 = fmul double %168, %172, !dbg !202
  %174 = fsub double %173, %162, !dbg !202
  %175 = fmul double %168, %174, !dbg !202
  %176 = fadd double %163, %175, !dbg !202
  %177 = fmul double %168, %176, !dbg !202
  %178 = fadd double %164, %177, !dbg !202
  %179 = fmul double %168, %178, !dbg !202
  %180 = fadd double %158, %179, !dbg !202
  %181 = fmul double %167, %180, !dbg !202
  %182 = fadd double %s.532, %181, !dbg !202
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !10), !dbg !202
  %183 = add nsw i64 %i.433, 1, !dbg !198
  tail call void @llvm.dbg.value(metadata !{i64 %183}, i64 0, metadata !19), !dbg !198
  %184 = icmp slt i64 %i.433, %156, !dbg !198
  br i1 %184, label %165, label %._crit_edge36, !dbg !198

._crit_edge36:                                    ; preds = %165, %119
  %s.5.lcssa = phi double [ 0.000000e+00, %119 ], [ %182, %165 ]
  %185 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !205
  %186 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !206, !tbaa !98
  %187 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !206, !tbaa !98
  %188 = fmul double %186, %187, !dbg !206
  %189 = load double* @nulltime, align 8, !dbg !206, !tbaa !98
  %190 = fsub double %188, %189, !dbg !206
  store double %190, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !206, !tbaa !98
  %191 = load double* @piref, align 8, !dbg !207, !tbaa !98
  %192 = load double* @three, align 8, !dbg !207, !tbaa !98
  %193 = fdiv double %191, %192, !dbg !207
  tail call void @llvm.dbg.value(metadata !{double %193}, i64 0, metadata !12), !dbg !207
  %194 = fmul double %193, %193, !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !14), !dbg !208
  %195 = load double* @A6, align 8, !dbg !209, !tbaa !98
  %196 = fmul double %195, %194, !dbg !209
  %197 = load double* @A5, align 8, !dbg !209, !tbaa !98
  %198 = fsub double %196, %197, !dbg !209
  %199 = fmul double %194, %198, !dbg !209
  %200 = load double* @A4, align 8, !dbg !209, !tbaa !98
  %201 = fadd double %200, %199, !dbg !209
  %202 = fmul double %194, %201, !dbg !209
  %203 = load double* @A3, align 8, !dbg !209, !tbaa !98
  %204 = fsub double %202, %203, !dbg !209
  %205 = fmul double %194, %204, !dbg !209
  %206 = load double* @A2, align 8, !dbg !209, !tbaa !98
  %207 = fadd double %206, %205, !dbg !209
  %208 = fmul double %194, %207, !dbg !209
  %209 = load double* @A1, align 8, !dbg !209, !tbaa !98
  %210 = fadd double %209, %208, !dbg !209
  %211 = fmul double %194, %210, !dbg !209
  %212 = load double* @one, align 8, !dbg !209, !tbaa !98
  %213 = fadd double %212, %211, !dbg !209
  %214 = fmul double %193, %213, !dbg !209
  %215 = fdiv double %190, 1.700000e+01, !dbg !210
  store double %215, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 10), align 16, !dbg !210, !tbaa !98
  %216 = load double* @two, align 8, !dbg !211, !tbaa !98
  %217 = fmul double %s.5.lcssa, %216, !dbg !211
  %218 = fadd double %214, %217, !dbg !211
  %219 = fmul double %154, %218, !dbg !211
  %220 = fdiv double %219, %216, !dbg !211
  store double %220, double* @sa, align 8, !dbg !211, !tbaa !98
  store double 5.000000e-01, double* @sb, align 8, !dbg !212, !tbaa !98
  %221 = fadd double %220, -5.000000e-01, !dbg !213
  store double %221, double* @sc, align 8, !dbg !213, !tbaa !98
  %222 = fdiv double %212, %215, !dbg !214
  store double %222, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 11), align 8, !dbg !214, !tbaa !98
  %223 = fmul double %221, 1.000000e-30, !dbg !215
  %224 = fmul double %190, 1.000000e-30, !dbg !215
  %225 = fmul double %222, 1.000000e-30, !dbg !215
  %226 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str6, i64 0, i64 0), double %223, double %224, double %225) #5, !dbg !215
  %227 = load double* @A3, align 8, !dbg !216, !tbaa !98
  %228 = fsub double -0.000000e+00, %227, !dbg !216
  store double %228, double* @A3, align 8, !dbg !216, !tbaa !98
  %229 = load double* @A5, align 8, !dbg !217, !tbaa !98
  %230 = fsub double -0.000000e+00, %229, !dbg !217
  store double %230, double* @A5, align 8, !dbg !217, !tbaa !98
  %231 = load double* @piref, align 8, !dbg !218, !tbaa !98
  %232 = load double* @three, align 8, !dbg !218, !tbaa !98
  %233 = fmul double %152, %232, !dbg !218
  %234 = fdiv double %231, %233, !dbg !218
  tail call void @llvm.dbg.value(metadata !{double %234}, i64 0, metadata !15), !dbg !218
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !219
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !220
  %235 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !221
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !222
  br i1 %157, label %._crit_edge29, label %.lr.ph28, !dbg !222

.lr.ph28:                                         ; preds = %._crit_edge36
  %236 = load double* @B6, align 8, !dbg !224, !tbaa !98
  %237 = load double* @B5, align 8, !dbg !224, !tbaa !98
  %238 = load double* @B4, align 8, !dbg !224, !tbaa !98
  %239 = load double* @B3, align 8, !dbg !224, !tbaa !98
  %240 = load double* @B2, align 8, !dbg !224, !tbaa !98
  %241 = load double* @B1, align 8, !dbg !224, !tbaa !98
  %242 = load double* @one, align 8, !dbg !224, !tbaa !98
  br label %243, !dbg !222

; <label>:243                                     ; preds = %243, %.lr.ph28
  %i.526 = phi i64 [ 1, %.lr.ph28 ], [ %260, %243 ]
  %s.625 = phi double [ 0.000000e+00, %.lr.ph28 ], [ %259, %243 ]
  %244 = sitofp i64 %i.526 to double, !dbg !226
  %245 = fmul double %234, %244, !dbg !226
  tail call void @llvm.dbg.value(metadata !{double %245}, i64 0, metadata !12), !dbg !226
  %246 = fmul double %245, %245, !dbg !227
  tail call void @llvm.dbg.value(metadata !{double %246}, i64 0, metadata !14), !dbg !227
  %247 = fmul double %246, %236, !dbg !224
  %248 = fadd double %247, %237, !dbg !224
  %249 = fmul double %246, %248, !dbg !224
  %250 = fadd double %238, %249, !dbg !224
  %251 = fmul double %246, %250, !dbg !224
  %252 = fadd double %239, %251, !dbg !224
  %253 = fmul double %246, %252, !dbg !224
  %254 = fadd double %240, %253, !dbg !224
  %255 = fmul double %246, %254, !dbg !224
  %256 = fadd double %241, %255, !dbg !224
  %257 = fmul double %246, %256, !dbg !224
  %258 = fadd double %s.625, %257, !dbg !224
  %259 = fadd double %242, %258, !dbg !224
  tail call void @llvm.dbg.value(metadata !{double %259}, i64 0, metadata !10), !dbg !224
  %260 = add nsw i64 %i.526, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i64 %260}, i64 0, metadata !19), !dbg !222
  %261 = icmp slt i64 %i.526, %156, !dbg !222
  br i1 %261, label %243, label %._crit_edge29, !dbg !222

._crit_edge29:                                    ; preds = %243, %._crit_edge36
  %s.6.lcssa = phi double [ 0.000000e+00, %._crit_edge36 ], [ %259, %243 ]
  %262 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !228
  %263 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !229, !tbaa !98
  %264 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !229, !tbaa !98
  %265 = fmul double %263, %264, !dbg !229
  %266 = load double* @nulltime, align 8, !dbg !229, !tbaa !98
  %267 = fsub double %265, %266, !dbg !229
  store double %267, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !229, !tbaa !98
  %268 = load double* @piref, align 8, !dbg !230, !tbaa !98
  %269 = load double* @three, align 8, !dbg !230, !tbaa !98
  %270 = fdiv double %268, %269, !dbg !230
  tail call void @llvm.dbg.value(metadata !{double %270}, i64 0, metadata !12), !dbg !230
  %271 = fmul double %270, %270, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %271}, i64 0, metadata !14), !dbg !231
  %272 = load double* @B6, align 8, !dbg !232, !tbaa !98
  %273 = fmul double %272, %271, !dbg !232
  %274 = load double* @B5, align 8, !dbg !232, !tbaa !98
  %275 = fadd double %273, %274, !dbg !232
  %276 = fmul double %271, %275, !dbg !232
  %277 = load double* @B4, align 8, !dbg !232, !tbaa !98
  %278 = fadd double %277, %276, !dbg !232
  %279 = fmul double %271, %278, !dbg !232
  %280 = load double* @B3, align 8, !dbg !232, !tbaa !98
  %281 = fadd double %280, %279, !dbg !232
  %282 = fmul double %271, %281, !dbg !232
  %283 = load double* @B2, align 8, !dbg !232, !tbaa !98
  %284 = fadd double %283, %282, !dbg !232
  %285 = fmul double %271, %284, !dbg !232
  %286 = load double* @B1, align 8, !dbg !232, !tbaa !98
  %287 = fadd double %286, %285, !dbg !232
  %288 = fmul double %271, %287, !dbg !232
  %289 = load double* @one, align 8, !dbg !232, !tbaa !98
  %290 = fadd double %289, %288, !dbg !232
  %291 = fdiv double %267, 1.500000e+01, !dbg !233
  store double %291, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 13), align 8, !dbg !233, !tbaa !98
  %292 = fadd double %290, %289, !dbg !234
  %293 = load double* @two, align 8, !dbg !234, !tbaa !98
  %294 = fmul double %s.6.lcssa, %293, !dbg !234
  %295 = fadd double %292, %294, !dbg !234
  %296 = fmul double %234, %295, !dbg !234
  %297 = fdiv double %296, %293, !dbg !234
  store double %297, double* @sa, align 8, !dbg !234, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %270}, i64 0, metadata !12), !dbg !235
  tail call void @llvm.dbg.value(metadata !{double %271}, i64 0, metadata !14), !dbg !236
  %298 = load double* @A6, align 8, !dbg !237, !tbaa !98
  %299 = fmul double %298, %271, !dbg !237
  %300 = load double* @A5, align 8, !dbg !237, !tbaa !98
  %301 = fadd double %299, %300, !dbg !237
  %302 = fmul double %271, %301, !dbg !237
  %303 = load double* @A4, align 8, !dbg !237, !tbaa !98
  %304 = fadd double %303, %302, !dbg !237
  %305 = fmul double %271, %304, !dbg !237
  %306 = load double* @A3, align 8, !dbg !237, !tbaa !98
  %307 = fadd double %306, %305, !dbg !237
  %308 = fmul double %271, %307, !dbg !237
  %309 = load double* @A2, align 8, !dbg !237, !tbaa !98
  %310 = fadd double %309, %308, !dbg !237
  %311 = fmul double %271, %310, !dbg !237
  %312 = load double* @A1, align 8, !dbg !237, !tbaa !98
  %313 = fadd double %312, %311, !dbg !237
  %314 = fmul double %271, %313, !dbg !237
  %315 = load double* @A0, align 8, !dbg !237, !tbaa !98
  %316 = fadd double %315, %314, !dbg !237
  %317 = fmul double %270, %316, !dbg !237
  store double %317, double* @sb, align 8, !dbg !237, !tbaa !98
  %318 = fsub double %297, %317, !dbg !238
  store double %318, double* @sc, align 8, !dbg !238, !tbaa !98
  %319 = fdiv double %289, %291, !dbg !239
  store double %319, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 14), align 16, !dbg !239, !tbaa !98
  %320 = fmul double %318, 1.000000e-30, !dbg !240
  %321 = fmul double %267, 1.000000e-30, !dbg !240
  %322 = fmul double %319, 1.000000e-30, !dbg !240
  %323 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str7, i64 0, i64 0), double %320, double %321, double %322) #5, !dbg !240
  %324 = load double* @piref, align 8, !dbg !241, !tbaa !98
  %325 = load double* @three, align 8, !dbg !241, !tbaa !98
  %326 = fmul double %152, %325, !dbg !241
  %327 = fdiv double %324, %326, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %327}, i64 0, metadata !15), !dbg !241
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !242
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !243
  %328 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !244
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !245
  br i1 %157, label %._crit_edge23, label %.lr.ph22, !dbg !245

.lr.ph22:                                         ; preds = %._crit_edge29
  %329 = load double* @A6, align 8, !dbg !247, !tbaa !98
  %330 = load double* @A5, align 8, !dbg !247, !tbaa !98
  %331 = load double* @A4, align 8, !dbg !247, !tbaa !98
  %332 = load double* @A3, align 8, !dbg !247, !tbaa !98
  %333 = load double* @A2, align 8, !dbg !247, !tbaa !98
  %334 = load double* @A1, align 8, !dbg !247, !tbaa !98
  %335 = load double* @one, align 8, !dbg !247, !tbaa !98
  %336 = load double* @B6, align 8, !dbg !249, !tbaa !98
  %337 = load double* @B5, align 8, !dbg !249, !tbaa !98
  %338 = load double* @B4, align 8, !dbg !249, !tbaa !98
  %339 = load double* @B3, align 8, !dbg !249, !tbaa !98
  %340 = load double* @B2, align 8, !dbg !249, !tbaa !98
  %341 = load double* @B1, align 8, !dbg !249, !tbaa !98
  %342 = insertelement <2 x double> undef, double %335, i32 0, !dbg !247
  %343 = insertelement <2 x double> %342, double %341, i32 1, !dbg !247
  %344 = insertelement <2 x double> undef, double %334, i32 0, !dbg !247
  %345 = insertelement <2 x double> %344, double %340, i32 1, !dbg !247
  %346 = insertelement <2 x double> undef, double %333, i32 0, !dbg !247
  %347 = insertelement <2 x double> %346, double %339, i32 1, !dbg !247
  %348 = insertelement <2 x double> undef, double %332, i32 0, !dbg !247
  %349 = insertelement <2 x double> %348, double %338, i32 1, !dbg !247
  %350 = insertelement <2 x double> undef, double %331, i32 0, !dbg !247
  %351 = insertelement <2 x double> %350, double %337, i32 1, !dbg !247
  br label %352, !dbg !245

; <label>:352                                     ; preds = %352, %.lr.ph22
  %i.620 = phi i64 [ 1, %.lr.ph22 ], [ %380, %352 ]
  %s.719 = phi double [ 0.000000e+00, %.lr.ph22 ], [ %379, %352 ]
  %353 = sitofp i64 %i.620 to double, !dbg !250
  %354 = fmul double %327, %353, !dbg !250
  tail call void @llvm.dbg.value(metadata !{double %354}, i64 0, metadata !12), !dbg !250
  %355 = fmul double %354, %354, !dbg !251
  tail call void @llvm.dbg.value(metadata !{double %355}, i64 0, metadata !14), !dbg !251
  %356 = fmul double %355, %329, !dbg !247
  %357 = fadd double %356, %330, !dbg !247
  tail call void @llvm.dbg.value(metadata !252, i64 0, metadata !13), !dbg !247
  %358 = insertelement <2 x double> undef, double %355, i32 0, !dbg !247
  %359 = insertelement <2 x double> %358, double %355, i32 1, !dbg !247
  %360 = insertelement <2 x double> undef, double %357, i32 0, !dbg !247
  %361 = insertelement <2 x double> %360, double %336, i32 1, !dbg !247
  %362 = fmul <2 x double> %359, %361, !dbg !247
  %363 = fadd <2 x double> %362, %351, !dbg !247
  %364 = fmul <2 x double> %363, %359, !dbg !247
  %365 = fadd <2 x double> %349, %364, !dbg !247
  %366 = fmul <2 x double> %365, %359, !dbg !247
  %367 = fadd <2 x double> %347, %366, !dbg !247
  %368 = fmul <2 x double> %367, %359, !dbg !247
  %369 = fadd <2 x double> %345, %368, !dbg !247
  %370 = fmul <2 x double> %369, %359, !dbg !247
  %371 = fadd <2 x double> %343, %370, !dbg !247
  %372 = insertelement <2 x double> undef, double %354, i32 0, !dbg !247
  %373 = insertelement <2 x double> %372, double %355, i32 1, !dbg !247
  %374 = fmul <2 x double> %373, %371, !dbg !247
  %375 = extractelement <2 x double> %374, i32 1, !dbg !249
  %376 = extractelement <2 x double> %374, i32 0, !dbg !249
  %377 = fadd double %335, %375, !dbg !249
  %378 = fdiv double %376, %377, !dbg !249
  %379 = fadd double %s.719, %378, !dbg !249
  tail call void @llvm.dbg.value(metadata !{double %379}, i64 0, metadata !10), !dbg !249
  %380 = add nsw i64 %i.620, 1, !dbg !245
  tail call void @llvm.dbg.value(metadata !{i64 %380}, i64 0, metadata !19), !dbg !245
  %381 = icmp slt i64 %i.620, %156, !dbg !245
  br i1 %381, label %352, label %._crit_edge23, !dbg !245

._crit_edge23:                                    ; preds = %352, %._crit_edge29
  %s.7.lcssa = phi double [ 0.000000e+00, %._crit_edge29 ], [ %379, %352 ]
  %382 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !253
  %383 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !254, !tbaa !98
  %384 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !254, !tbaa !98
  %385 = fmul double %383, %384, !dbg !254
  %386 = load double* @nulltime, align 8, !dbg !254, !tbaa !98
  %387 = fsub double %385, %386, !dbg !254
  store double %387, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !254, !tbaa !98
  %388 = load double* @piref, align 8, !dbg !255, !tbaa !98
  %389 = load double* @three, align 8, !dbg !255, !tbaa !98
  %390 = fdiv double %388, %389, !dbg !255
  tail call void @llvm.dbg.value(metadata !{double %390}, i64 0, metadata !12), !dbg !255
  %391 = fmul double %390, %390, !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %391}, i64 0, metadata !14), !dbg !256
  %392 = load double* @A6, align 8, !dbg !257, !tbaa !98
  %393 = fmul double %392, %391, !dbg !257
  %394 = load double* @A5, align 8, !dbg !257, !tbaa !98
  %395 = fadd double %393, %394, !dbg !257
  %396 = fmul double %391, %395, !dbg !257
  %397 = load double* @A4, align 8, !dbg !257, !tbaa !98
  %398 = fadd double %397, %396, !dbg !257
  %399 = fmul double %391, %398, !dbg !257
  %400 = load double* @A3, align 8, !dbg !257, !tbaa !98
  %401 = fadd double %400, %399, !dbg !257
  %402 = fmul double %391, %401, !dbg !257
  %403 = load double* @A2, align 8, !dbg !257, !tbaa !98
  %404 = fadd double %403, %402, !dbg !257
  %405 = fmul double %391, %404, !dbg !257
  %406 = load double* @A1, align 8, !dbg !257, !tbaa !98
  %407 = fadd double %406, %405, !dbg !257
  %408 = fmul double %391, %407, !dbg !257
  %409 = load double* @one, align 8, !dbg !257, !tbaa !98
  %410 = fadd double %409, %408, !dbg !257
  %411 = fmul double %390, %410, !dbg !257
  %412 = load double* @B6, align 8, !dbg !258, !tbaa !98
  %413 = fmul double %391, %412, !dbg !258
  %414 = load double* @B5, align 8, !dbg !258, !tbaa !98
  %415 = fadd double %413, %414, !dbg !258
  %416 = fmul double %391, %415, !dbg !258
  %417 = load double* @B4, align 8, !dbg !258, !tbaa !98
  %418 = fadd double %417, %416, !dbg !258
  %419 = fmul double %391, %418, !dbg !258
  %420 = load double* @B3, align 8, !dbg !258, !tbaa !98
  %421 = fadd double %420, %419, !dbg !258
  %422 = fmul double %391, %421, !dbg !258
  %423 = load double* @B2, align 8, !dbg !258, !tbaa !98
  %424 = fadd double %423, %422, !dbg !258
  %425 = fmul double %391, %424, !dbg !258
  %426 = load double* @B1, align 8, !dbg !258, !tbaa !98
  %427 = fadd double %426, %425, !dbg !258
  %428 = fmul double %391, %427, !dbg !258
  %429 = fadd double %409, %428, !dbg !258
  %430 = fdiv double %411, %429, !dbg !259
  %431 = fdiv double %387, 2.900000e+01, !dbg !260
  store double %431, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 16), align 16, !dbg !260, !tbaa !98
  %432 = load double* @two, align 8, !dbg !261, !tbaa !98
  %433 = fmul double %s.7.lcssa, %432, !dbg !261
  %434 = fadd double %430, %433, !dbg !261
  %435 = fmul double %327, %434, !dbg !261
  %436 = fdiv double %435, %432, !dbg !261
  store double %436, double* @sa, align 8, !dbg !261, !tbaa !98
  store double 0x3FE62E42FEFA39EF, double* @sb, align 8, !dbg !262, !tbaa !98
  %437 = fadd double %436, 0xBFE62E42FEFA39EF, !dbg !263
  store double %437, double* @sc, align 8, !dbg !263, !tbaa !98
  %438 = fdiv double %409, %431, !dbg !264
  store double %438, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 17), align 8, !dbg !264, !tbaa !98
  %439 = fmul double %437, 1.000000e-30, !dbg !265
  %440 = fmul double %387, 1.000000e-30, !dbg !265
  %441 = fmul double %438, 1.000000e-30, !dbg !265
  %442 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i64 0, i64 0), double %439, double %440, double %441) #5, !dbg !265
  %443 = load double* @piref, align 8, !dbg !266, !tbaa !98
  %444 = load double* @four, align 8, !dbg !266, !tbaa !98
  %445 = fmul double %152, %444, !dbg !266
  %446 = fdiv double %443, %445, !dbg !266
  tail call void @llvm.dbg.value(metadata !{double %446}, i64 0, metadata !15), !dbg !266
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !267
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !268
  %447 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !269
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !270
  br i1 %157, label %._crit_edge17, label %.lr.ph16, !dbg !270

.lr.ph16:                                         ; preds = %._crit_edge23
  %448 = load double* @A6, align 8, !dbg !272, !tbaa !98
  %449 = load double* @A5, align 8, !dbg !272, !tbaa !98
  %450 = load double* @A4, align 8, !dbg !272, !tbaa !98
  %451 = load double* @A3, align 8, !dbg !272, !tbaa !98
  %452 = load double* @A2, align 8, !dbg !272, !tbaa !98
  %453 = load double* @A1, align 8, !dbg !272, !tbaa !98
  %454 = load double* @one, align 8, !dbg !272, !tbaa !98
  %455 = load double* @B6, align 8, !dbg !274, !tbaa !98
  %456 = load double* @B5, align 8, !dbg !274, !tbaa !98
  %457 = load double* @B4, align 8, !dbg !274, !tbaa !98
  %458 = load double* @B3, align 8, !dbg !274, !tbaa !98
  %459 = load double* @B2, align 8, !dbg !274, !tbaa !98
  %460 = load double* @B1, align 8, !dbg !274, !tbaa !98
  %461 = insertelement <2 x double> undef, double %454, i32 0, !dbg !272
  %462 = insertelement <2 x double> %461, double %460, i32 1, !dbg !272
  %463 = insertelement <2 x double> undef, double %453, i32 0, !dbg !272
  %464 = insertelement <2 x double> %463, double %459, i32 1, !dbg !272
  %465 = insertelement <2 x double> undef, double %452, i32 0, !dbg !272
  %466 = insertelement <2 x double> %465, double %458, i32 1, !dbg !272
  %467 = insertelement <2 x double> undef, double %451, i32 0, !dbg !272
  %468 = insertelement <2 x double> %467, double %457, i32 1, !dbg !272
  %469 = insertelement <2 x double> undef, double %450, i32 0, !dbg !272
  %470 = insertelement <2 x double> %469, double %456, i32 1, !dbg !272
  br label %471, !dbg !270

; <label>:471                                     ; preds = %471, %.lr.ph16
  %i.714 = phi i64 [ 1, %.lr.ph16 ], [ %499, %471 ]
  %s.813 = phi double [ 0.000000e+00, %.lr.ph16 ], [ %498, %471 ]
  %472 = sitofp i64 %i.714 to double, !dbg !275
  %473 = fmul double %446, %472, !dbg !275
  tail call void @llvm.dbg.value(metadata !{double %473}, i64 0, metadata !12), !dbg !275
  %474 = fmul double %473, %473, !dbg !276
  tail call void @llvm.dbg.value(metadata !{double %474}, i64 0, metadata !14), !dbg !276
  %475 = fmul double %474, %448, !dbg !272
  %476 = fadd double %475, %449, !dbg !272
  tail call void @llvm.dbg.value(metadata !252, i64 0, metadata !13), !dbg !272
  %477 = insertelement <2 x double> undef, double %474, i32 0, !dbg !272
  %478 = insertelement <2 x double> %477, double %474, i32 1, !dbg !272
  %479 = insertelement <2 x double> undef, double %476, i32 0, !dbg !272
  %480 = insertelement <2 x double> %479, double %455, i32 1, !dbg !272
  %481 = fmul <2 x double> %478, %480, !dbg !272
  %482 = fadd <2 x double> %481, %470, !dbg !272
  %483 = fmul <2 x double> %482, %478, !dbg !272
  %484 = fadd <2 x double> %468, %483, !dbg !272
  %485 = fmul <2 x double> %484, %478, !dbg !272
  %486 = fadd <2 x double> %466, %485, !dbg !272
  %487 = fmul <2 x double> %486, %478, !dbg !272
  %488 = fadd <2 x double> %464, %487, !dbg !272
  %489 = fmul <2 x double> %488, %478, !dbg !272
  %490 = fadd <2 x double> %462, %489, !dbg !272
  %491 = insertelement <2 x double> undef, double %473, i32 0, !dbg !272
  %492 = insertelement <2 x double> %491, double %474, i32 1, !dbg !272
  %493 = fmul <2 x double> %492, %490, !dbg !272
  %494 = extractelement <2 x double> %493, i32 1, !dbg !274
  %495 = extractelement <2 x double> %493, i32 0, !dbg !274
  %496 = fadd double %454, %494, !dbg !274
  %497 = fmul double %495, %496, !dbg !274
  %498 = fadd double %s.813, %497, !dbg !274
  tail call void @llvm.dbg.value(metadata !{double %498}, i64 0, metadata !10), !dbg !274
  %499 = add nsw i64 %i.714, 1, !dbg !270
  tail call void @llvm.dbg.value(metadata !{i64 %499}, i64 0, metadata !19), !dbg !270
  %500 = icmp slt i64 %i.714, %156, !dbg !270
  br i1 %500, label %471, label %._crit_edge17, !dbg !270

._crit_edge17:                                    ; preds = %471, %._crit_edge23
  %s.8.lcssa = phi double [ 0.000000e+00, %._crit_edge23 ], [ %498, %471 ]
  %501 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !277
  %502 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !278, !tbaa !98
  %503 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !278, !tbaa !98
  %504 = fmul double %502, %503, !dbg !278
  %505 = load double* @nulltime, align 8, !dbg !278, !tbaa !98
  %506 = fsub double %504, %505, !dbg !278
  store double %506, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !278, !tbaa !98
  %507 = load double* @piref, align 8, !dbg !279, !tbaa !98
  %508 = load double* @four, align 8, !dbg !279, !tbaa !98
  %509 = fdiv double %507, %508, !dbg !279
  tail call void @llvm.dbg.value(metadata !{double %509}, i64 0, metadata !12), !dbg !279
  %510 = fmul double %509, %509, !dbg !280
  tail call void @llvm.dbg.value(metadata !{double %510}, i64 0, metadata !14), !dbg !280
  %511 = load double* @A6, align 8, !dbg !281, !tbaa !98
  %512 = fmul double %511, %510, !dbg !281
  %513 = load double* @A5, align 8, !dbg !281, !tbaa !98
  %514 = fadd double %512, %513, !dbg !281
  %515 = fmul double %510, %514, !dbg !281
  %516 = load double* @A4, align 8, !dbg !281, !tbaa !98
  %517 = fadd double %516, %515, !dbg !281
  %518 = fmul double %510, %517, !dbg !281
  %519 = load double* @A3, align 8, !dbg !281, !tbaa !98
  %520 = fadd double %519, %518, !dbg !281
  %521 = fmul double %510, %520, !dbg !281
  %522 = load double* @A2, align 8, !dbg !281, !tbaa !98
  %523 = fadd double %522, %521, !dbg !281
  %524 = fmul double %510, %523, !dbg !281
  %525 = load double* @A1, align 8, !dbg !281, !tbaa !98
  %526 = fadd double %525, %524, !dbg !281
  %527 = fmul double %510, %526, !dbg !281
  %528 = load double* @one, align 8, !dbg !281, !tbaa !98
  %529 = fadd double %528, %527, !dbg !281
  %530 = fmul double %509, %529, !dbg !281
  %531 = load double* @B6, align 8, !dbg !282, !tbaa !98
  %532 = fmul double %510, %531, !dbg !282
  %533 = load double* @B5, align 8, !dbg !282, !tbaa !98
  %534 = fadd double %532, %533, !dbg !282
  %535 = fmul double %510, %534, !dbg !282
  %536 = load double* @B4, align 8, !dbg !282, !tbaa !98
  %537 = fadd double %536, %535, !dbg !282
  %538 = fmul double %510, %537, !dbg !282
  %539 = load double* @B3, align 8, !dbg !282, !tbaa !98
  %540 = fadd double %539, %538, !dbg !282
  %541 = fmul double %510, %540, !dbg !282
  %542 = load double* @B2, align 8, !dbg !282, !tbaa !98
  %543 = fadd double %542, %541, !dbg !282
  %544 = fmul double %510, %543, !dbg !282
  %545 = load double* @B1, align 8, !dbg !282, !tbaa !98
  %546 = fadd double %545, %544, !dbg !282
  %547 = fmul double %510, %546, !dbg !282
  %548 = fadd double %528, %547, !dbg !282
  %549 = fmul double %530, %548, !dbg !283
  %550 = fdiv double %506, 2.900000e+01, !dbg !284
  store double %550, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 19), align 8, !dbg !284, !tbaa !98
  %551 = load double* @two, align 8, !dbg !285, !tbaa !98
  %552 = fmul double %s.8.lcssa, %551, !dbg !285
  %553 = fadd double %549, %552, !dbg !285
  %554 = fmul double %446, %553, !dbg !285
  %555 = fdiv double %554, %551, !dbg !285
  store double %555, double* @sa, align 8, !dbg !285, !tbaa !98
  store double 2.500000e-01, double* @sb, align 8, !dbg !286, !tbaa !98
  %556 = fadd double %555, -2.500000e-01, !dbg !287
  store double %556, double* @sc, align 8, !dbg !287, !tbaa !98
  %557 = fdiv double %528, %550, !dbg !288
  store double %557, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 20), align 16, !dbg !288, !tbaa !98
  %558 = fmul double %556, 1.000000e-30, !dbg !289
  %559 = fmul double %506, 1.000000e-30, !dbg !289
  %560 = fmul double %557, 1.000000e-30, !dbg !289
  %561 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str9, i64 0, i64 0), double %558, double %559, double %560) #5, !dbg !289
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !290
  %562 = load double* @one, align 8, !dbg !291, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %562}, i64 0, metadata !14), !dbg !291
  store double 0x40599541F7F192A4, double* @sa, align 8, !dbg !292, !tbaa !98
  %563 = fdiv double 0x40599541F7F192A4, %152, !dbg !293
  tail call void @llvm.dbg.value(metadata !{double %563}, i64 0, metadata !13), !dbg !293
  %564 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !294
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !295
  br i1 %157, label %._crit_edge11, label %.lr.ph10, !dbg !295

.lr.ph10:                                         ; preds = %._crit_edge17, %.lr.ph10
  %i.88 = phi i64 [ %578, %.lr.ph10 ], [ 1, %._crit_edge17 ]
  %s.97 = phi double [ %577, %.lr.ph10 ], [ 0.000000e+00, %._crit_edge17 ]
  %565 = sitofp i64 %i.88 to double, !dbg !297
  %566 = fmul double %563, %565, !dbg !297
  tail call void @llvm.dbg.value(metadata !{double %566}, i64 0, metadata !15), !dbg !297
  %567 = fmul double %566, %566, !dbg !299
  tail call void @llvm.dbg.value(metadata !{double %567}, i64 0, metadata !12), !dbg !299
  %568 = fadd double %562, %566, !dbg !300
  %569 = fdiv double %562, %568, !dbg !300
  %570 = fsub double %s.97, %569, !dbg !300
  %571 = fadd double %562, %567, !dbg !300
  %572 = fdiv double %566, %571, !dbg !300
  %573 = fsub double %570, %572, !dbg !300
  %574 = fmul double %566, %567, !dbg !300
  %575 = fadd double %562, %574, !dbg !300
  %576 = fdiv double %567, %575, !dbg !300
  %577 = fsub double %573, %576, !dbg !300
  tail call void @llvm.dbg.value(metadata !{double %577}, i64 0, metadata !10), !dbg !300
  %578 = add nsw i64 %i.88, 1, !dbg !295
  tail call void @llvm.dbg.value(metadata !{i64 %578}, i64 0, metadata !19), !dbg !295
  %579 = icmp slt i64 %i.88, %156, !dbg !295
  br i1 %579, label %.lr.ph10, label %._crit_edge11, !dbg !295

._crit_edge11:                                    ; preds = %.lr.ph10, %._crit_edge17
  %s.9.lcssa = phi double [ 0.000000e+00, %._crit_edge17 ], [ %577, %.lr.ph10 ]
  %580 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !301
  %581 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !302, !tbaa !98
  %582 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !302, !tbaa !98
  %583 = fmul double %581, %582, !dbg !302
  %584 = load double* @nulltime, align 8, !dbg !302, !tbaa !98
  %585 = fsub double %583, %584, !dbg !302
  store double %585, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !302, !tbaa !98
  %586 = fdiv double %585, 1.200000e+01, !dbg !303
  store double %586, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 22), align 16, !dbg !303, !tbaa !98
  %587 = load double* @sa, align 8, !dbg !304, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %587}, i64 0, metadata !15), !dbg !304
  %588 = fmul double %587, %587, !dbg !305
  tail call void @llvm.dbg.value(metadata !{double %588}, i64 0, metadata !12), !dbg !305
  %589 = fsub double -0.000000e+00, %562, !dbg !306
  %590 = fadd double %562, %587, !dbg !306
  %591 = fdiv double %562, %590, !dbg !306
  %592 = fsub double %589, %591, !dbg !306
  %593 = fadd double %562, %588, !dbg !306
  %594 = fdiv double %587, %593, !dbg !306
  %595 = fsub double %592, %594, !dbg !306
  %596 = fmul double %587, %588, !dbg !306
  %597 = fadd double %562, %596, !dbg !306
  %598 = fdiv double %588, %597, !dbg !306
  %599 = fsub double %595, %598, !dbg !306
  %600 = fmul double %563, 1.800000e+01, !dbg !307
  %601 = load double* @two, align 8, !dbg !307, !tbaa !98
  %602 = fmul double %s.9.lcssa, %601, !dbg !307
  %603 = fadd double %599, %602, !dbg !307
  %604 = fmul double %600, %603, !dbg !307
  store double %604, double* @sa, align 8, !dbg !307, !tbaa !98
  %605 = fptosi double %604 to i64, !dbg !308
  %606 = mul nsw i64 %605, -2000, !dbg !308
  tail call void @llvm.dbg.value(metadata !{i64 %606}, i64 0, metadata !20), !dbg !308
  %607 = sitofp i64 %606 to double, !dbg !309
  %608 = load double* @scale, align 8, !dbg !309, !tbaa !98
  %609 = fdiv double %607, %608, !dbg !309
  %610 = fptosi double %609 to i64, !dbg !309
  tail call void @llvm.dbg.value(metadata !{i64 %610}, i64 0, metadata !20), !dbg !309
  %611 = fadd double %604, 5.002000e+02, !dbg !310
  store double %611, double* @sc, align 8, !dbg !310, !tbaa !98
  %612 = load double* @one, align 8, !dbg !311, !tbaa !98
  %613 = fdiv double %612, %586, !dbg !311
  store double %613, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 23), align 8, !dbg !311, !tbaa !98
  %614 = fmul double %611, 1.000000e-30, !dbg !312
  %615 = fmul double %585, 1.000000e-30, !dbg !312
  %616 = fmul double %613, 1.000000e-30, !dbg !312
  %617 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str10, i64 0, i64 0), double %614, double %615, double %616) #5, !dbg !312
  %618 = load double* @piref, align 8, !dbg !313, !tbaa !98
  %619 = load double* @three, align 8, !dbg !313, !tbaa !98
  %620 = sitofp i64 %610 to double, !dbg !313
  %621 = fmul double %620, %619, !dbg !313
  %622 = fdiv double %618, %621, !dbg !313
  tail call void @llvm.dbg.value(metadata !{double %622}, i64 0, metadata !15), !dbg !313
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !10), !dbg !314
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !13), !dbg !315
  %623 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !316
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !19), !dbg !317
  %624 = add nsw i64 %610, -1, !dbg !317
  %625 = icmp slt i64 %610, 2, !dbg !317
  br i1 %625, label %._crit_edge, label %.lr.ph, !dbg !317

.lr.ph:                                           ; preds = %._crit_edge11
  %626 = load double* @B6, align 8, !dbg !319, !tbaa !98
  %627 = load double* @B5, align 8, !dbg !319, !tbaa !98
  %628 = load double* @B4, align 8, !dbg !319, !tbaa !98
  %629 = load double* @B3, align 8, !dbg !319, !tbaa !98
  %630 = load double* @B2, align 8, !dbg !319, !tbaa !98
  %631 = load double* @B1, align 8, !dbg !319, !tbaa !98
  %632 = load double* @one, align 8, !dbg !319, !tbaa !98
  %633 = load double* @A6, align 8, !dbg !321, !tbaa !98
  %634 = load double* @A5, align 8, !dbg !321, !tbaa !98
  %635 = load double* @A4, align 8, !dbg !321, !tbaa !98
  %636 = load double* @A3, align 8, !dbg !321, !tbaa !98
  %637 = load double* @A2, align 8, !dbg !321, !tbaa !98
  %638 = load double* @A1, align 8, !dbg !321, !tbaa !98
  br label %639, !dbg !317

; <label>:639                                     ; preds = %639, %.lr.ph
  %i.96 = phi i64 [ 1, %.lr.ph ], [ %671, %639 ]
  %s.105 = phi double [ 0.000000e+00, %.lr.ph ], [ %670, %639 ]
  %640 = sitofp i64 %i.96 to double, !dbg !322
  %641 = fmul double %622, %640, !dbg !322
  tail call void @llvm.dbg.value(metadata !{double %641}, i64 0, metadata !12), !dbg !322
  %642 = fmul double %641, %641, !dbg !323
  tail call void @llvm.dbg.value(metadata !{double %642}, i64 0, metadata !14), !dbg !323
  %643 = fmul double %642, %626, !dbg !319
  %644 = fadd double %643, %627, !dbg !319
  %645 = fmul double %642, %644, !dbg !319
  %646 = fadd double %628, %645, !dbg !319
  %647 = fmul double %642, %646, !dbg !319
  %648 = fadd double %629, %647, !dbg !319
  %649 = fmul double %642, %648, !dbg !319
  %650 = fadd double %630, %649, !dbg !319
  %651 = fmul double %642, %650, !dbg !319
  %652 = fadd double %631, %651, !dbg !319
  %653 = fmul double %642, %652, !dbg !319
  %654 = fadd double %632, %653, !dbg !319
  tail call void @llvm.dbg.value(metadata !{double %654}, i64 0, metadata !13), !dbg !319
  %655 = fmul double %654, %654, !dbg !321
  %656 = fmul double %641, %655, !dbg !321
  %657 = fmul double %642, %633, !dbg !321
  %658 = fadd double %657, %634, !dbg !321
  %659 = fmul double %642, %658, !dbg !321
  %660 = fadd double %635, %659, !dbg !321
  %661 = fmul double %642, %660, !dbg !321
  %662 = fadd double %636, %661, !dbg !321
  %663 = fmul double %642, %662, !dbg !321
  %664 = fadd double %637, %663, !dbg !321
  %665 = fmul double %642, %664, !dbg !321
  %666 = fadd double %638, %665, !dbg !321
  %667 = fmul double %642, %666, !dbg !321
  %668 = fadd double %632, %667, !dbg !321
  %669 = fmul double %656, %668, !dbg !321
  %670 = fadd double %s.105, %669, !dbg !321
  tail call void @llvm.dbg.value(metadata !{double %670}, i64 0, metadata !10), !dbg !321
  %671 = add nsw i64 %i.96, 1, !dbg !317
  tail call void @llvm.dbg.value(metadata !{i64 %671}, i64 0, metadata !19), !dbg !317
  %672 = icmp slt i64 %i.96, %624, !dbg !317
  br i1 %672, label %639, label %._crit_edge, !dbg !317

._crit_edge:                                      ; preds = %639, %._crit_edge11
  %s.10.lcssa = phi double [ 0.000000e+00, %._crit_edge11 ], [ %670, %639 ]
  %673 = tail call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 0)) #4, !dbg !324
  %674 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !325, !tbaa !98
  %675 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !325, !tbaa !98
  %676 = fmul double %674, %675, !dbg !325
  %677 = load double* @nulltime, align 8, !dbg !325, !tbaa !98
  %678 = fsub double %676, %677, !dbg !325
  store double %678, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !325, !tbaa !98
  %679 = load double* @piref, align 8, !dbg !326, !tbaa !98
  %680 = load double* @three, align 8, !dbg !326, !tbaa !98
  %681 = fdiv double %679, %680, !dbg !326
  tail call void @llvm.dbg.value(metadata !{double %681}, i64 0, metadata !12), !dbg !326
  %682 = fmul double %681, %681, !dbg !327
  tail call void @llvm.dbg.value(metadata !{double %682}, i64 0, metadata !14), !dbg !327
  %683 = load double* @A6, align 8, !dbg !328, !tbaa !98
  %684 = fmul double %683, %682, !dbg !328
  %685 = load double* @A5, align 8, !dbg !328, !tbaa !98
  %686 = fadd double %684, %685, !dbg !328
  %687 = fmul double %682, %686, !dbg !328
  %688 = load double* @A4, align 8, !dbg !328, !tbaa !98
  %689 = fadd double %688, %687, !dbg !328
  %690 = fmul double %682, %689, !dbg !328
  %691 = load double* @A3, align 8, !dbg !328, !tbaa !98
  %692 = fadd double %691, %690, !dbg !328
  %693 = fmul double %682, %692, !dbg !328
  %694 = load double* @A2, align 8, !dbg !328, !tbaa !98
  %695 = fadd double %694, %693, !dbg !328
  %696 = fmul double %682, %695, !dbg !328
  %697 = load double* @A1, align 8, !dbg !328, !tbaa !98
  %698 = fadd double %697, %696, !dbg !328
  %699 = fmul double %682, %698, !dbg !328
  %700 = load double* @one, align 8, !dbg !328, !tbaa !98
  %701 = fadd double %700, %699, !dbg !328
  %702 = fmul double %681, %701, !dbg !328
  %703 = load double* @B6, align 8, !dbg !329, !tbaa !98
  %704 = fmul double %682, %703, !dbg !329
  %705 = load double* @B5, align 8, !dbg !329, !tbaa !98
  %706 = fadd double %704, %705, !dbg !329
  %707 = fmul double %682, %706, !dbg !329
  %708 = load double* @B4, align 8, !dbg !329, !tbaa !98
  %709 = fadd double %708, %707, !dbg !329
  %710 = fmul double %682, %709, !dbg !329
  %711 = load double* @B3, align 8, !dbg !329, !tbaa !98
  %712 = fadd double %711, %710, !dbg !329
  %713 = fmul double %682, %712, !dbg !329
  %714 = load double* @B2, align 8, !dbg !329, !tbaa !98
  %715 = fadd double %714, %713, !dbg !329
  %716 = fmul double %682, %715, !dbg !329
  %717 = load double* @B1, align 8, !dbg !329, !tbaa !98
  %718 = fadd double %717, %716, !dbg !329
  %719 = fmul double %682, %718, !dbg !329
  %720 = fadd double %700, %719, !dbg !329
  %721 = fmul double %702, %720, !dbg !330
  %722 = fmul double %720, %721, !dbg !330
  %723 = fdiv double %678, 3.000000e+01, !dbg !331
  store double %723, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 25), align 8, !dbg !331, !tbaa !98
  %724 = load double* @two, align 8, !dbg !332, !tbaa !98
  %725 = fmul double %s.10.lcssa, %724, !dbg !332
  %726 = fadd double %722, %725, !dbg !332
  %727 = fmul double %622, %726, !dbg !332
  %728 = fdiv double %727, %724, !dbg !332
  store double %728, double* @sa, align 8, !dbg !332, !tbaa !98
  store double 0x3FD2AAAAAAAAAAAB, double* @sb, align 8, !dbg !333, !tbaa !98
  %729 = fadd double %728, 0xBFD2AAAAAAAAAAAB, !dbg !334
  store double %729, double* @sc, align 8, !dbg !334, !tbaa !98
  %730 = fdiv double %700, %723, !dbg !335
  store double %730, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 26), align 16, !dbg !335, !tbaa !98
  %731 = fmul double %729, 1.000000e-30, !dbg !336
  %732 = fmul double %678, 1.000000e-30, !dbg !336
  %733 = fmul double %730, 1.000000e-30, !dbg !336
  %734 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i64 0, i64 0), double %731, double %732, double %733) #5, !dbg !336
  %735 = load double* @five, align 8, !dbg !337, !tbaa !98
  %736 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !337, !tbaa !98
  %737 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !337, !tbaa !98
  %738 = fsub double %736, %737, !dbg !337
  %739 = fmul double %735, %738, !dbg !337
  %740 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !337, !tbaa !98
  %741 = fadd double %740, %739, !dbg !337
  %742 = fdiv double %741, 5.200000e+01, !dbg !337
  store double %742, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 27), align 8, !dbg !337, !tbaa !98
  %743 = load double* @one, align 8, !dbg !338, !tbaa !98
  %744 = fdiv double %743, %742, !dbg !338
  store double %744, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !338, !tbaa !98
  %745 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !339, !tbaa !98
  %746 = fadd double %745, %740, !dbg !339
  %747 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !339, !tbaa !98
  %748 = fadd double %746, %747, !dbg !339
  %749 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !339, !tbaa !98
  %750 = fadd double %748, %749, !dbg !339
  %751 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !339, !tbaa !98
  %752 = fadd double %750, %751, !dbg !339
  %753 = load double* @four, align 8, !dbg !340, !tbaa !98
  %754 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !340, !tbaa !98
  %755 = fmul double %753, %754, !dbg !340
  %756 = fadd double %752, %755, !dbg !340
  %757 = fdiv double %756, 1.520000e+02, !dbg !340
  store double %757, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 29), align 8, !dbg !340, !tbaa !98
  %758 = fdiv double %743, %757, !dbg !341
  store double %758, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !341, !tbaa !98
  %759 = fadd double %752, %754, !dbg !342
  %760 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !342, !tbaa !98
  %761 = fadd double %759, %760, !dbg !342
  %762 = fdiv double %761, 1.460000e+02, !dbg !342
  store double %762, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 31), align 8, !dbg !342, !tbaa !98
  %763 = fdiv double %743, %762, !dbg !343
  store double %763, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !343, !tbaa !98
  %764 = fadd double %740, %747, !dbg !344
  %765 = fadd double %764, %751, !dbg !344
  %766 = fadd double %765, %760, !dbg !344
  %767 = fdiv double %766, 9.100000e+01, !dbg !344
  store double %767, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 33), align 8, !dbg !344, !tbaa !98
  %768 = fdiv double %743, %767, !dbg !345
  store double %768, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !345, !tbaa !98
  %putchar3 = tail call i32 @putchar(i32 10) #3, !dbg !346
  %769 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 %610) #5, !dbg !347
  %770 = load double* @nulltime, align 8, !dbg !348, !tbaa !98
  %771 = fmul double %770, 1.000000e-30, !dbg !348
  %772 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str13, i64 0, i64 0), double %771) #5, !dbg !348
  %773 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !349, !tbaa !98
  %774 = fmul double %773, 1.000000e-30, !dbg !349
  %775 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str14, i64 0, i64 0), double %774) #5, !dbg !349
  %776 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !350, !tbaa !98
  %777 = fmul double %776, 1.000000e-30, !dbg !350
  %778 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str15, i64 0, i64 0), double %777) #5, !dbg !350
  %779 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !351, !tbaa !98
  %780 = fmul double %779, 1.000000e-30, !dbg !351
  %781 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i64 0, i64 0), double %780) #5, !dbg !351
  %782 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !352, !tbaa !98
  %783 = fmul double %782, 1.000000e-30, !dbg !352
  %784 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i64 0, i64 0), double %783) #5, !dbg !352
  ret i32 0, !dbg !353
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @dtime(double* nocapture %p) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %p}, i64 0, metadata !27), !dbg !354
  %1 = getelementptr inbounds double* %p, i64 2, !dbg !355
  %2 = load double* %1, align 8, !dbg !355, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !28), !dbg !355
  %3 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #5, !dbg !356
  %4 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !357, !tbaa !358
  %5 = sitofp i64 %4 to double, !dbg !357
  %6 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !357, !tbaa !361
  %7 = sitofp i64 %6 to double, !dbg !357
  %8 = fmul double %7, 1.000000e-06, !dbg !357
  %9 = fadd double %5, %8, !dbg !357
  store double %9, double* %1, align 8, !dbg !357, !tbaa !98
  %10 = fsub double %9, %2, !dbg !362
  %11 = getelementptr inbounds double* %p, i64 1, !dbg !362
  store double %10, double* %11, align 8, !dbg !362, !tbaa !98
  ret i32 0, !dbg !363
}

; Function Attrs: minsize nounwind optsize
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { minsize optsize }
attributes #5 = { minsize nounwind optsize }

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
!149 = metadata !{i32 284, i32 0, metadata !4, null}
!150 = metadata !{i32 285, i32 0, metadata !4, null}
!151 = metadata !{i32 286, i32 0, metadata !4, null}
!152 = metadata !{i32 287, i32 0, metadata !4, null}
!153 = metadata !{i32 288, i32 0, metadata !4, null}
!154 = metadata !{i32 289, i32 0, metadata !4, null}
!155 = metadata !{i32 294, i32 0, metadata !4, null}
!156 = metadata !{i32 299, i32 0, metadata !4, null}
!157 = metadata !{i32 310, i32 0, metadata !4, null}
!158 = metadata !{i32 311, i32 0, metadata !4, null}
!159 = metadata !{i32 313, i32 0, metadata !4, null}
!160 = metadata !{i32 314, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!162 = metadata !{i32 317, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !161, i32 315, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!164 = metadata !{i32 319, i32 0, metadata !4, null}
!165 = metadata !{i32 320, i32 0, metadata !4, null}
!166 = metadata !{i32 321, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !4, i32 321, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!168 = metadata !{i32 323, i32 0, metadata !4, null}
!169 = metadata !{i32 325, i32 0, metadata !4, null}
!170 = metadata !{i32 326, i32 0, metadata !4, null}
!171 = metadata !{i32 327, i32 0, metadata !4, null}
!172 = metadata !{i32 328, i32 0, metadata !4, null}
!173 = metadata !{i32 330, i32 0, metadata !4, null}
!174 = metadata !{i32 331, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !4, i32 331, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!176 = metadata !{i32 335, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !175, i32 332, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!178 = metadata !{i32 334, i32 0, metadata !177, null}
!179 = metadata !{i32 333, i32 0, metadata !177, null}
!180 = metadata !{i32 336, i32 0, metadata !177, null}
!181 = metadata !{i32 337, i32 0, metadata !177, null}
!182 = metadata !{i32 338, i32 0, metadata !177, null}
!183 = metadata !{i32 340, i32 0, metadata !4, null}
!184 = metadata !{i32 341, i32 0, metadata !4, null}
!185 = metadata !{i32 343, i32 0, metadata !4, null}
!186 = metadata !{i32 344, i32 0, metadata !4, null}
!187 = metadata !{i32 345, i32 0, metadata !4, null}
!188 = metadata !{i32 346, i32 0, metadata !4, null}
!189 = metadata !{i32 347, i32 0, metadata !4, null}
!190 = metadata !{i32 348, i32 0, metadata !4, null}
!191 = metadata !{i32 349, i32 0, metadata !4, null}
!192 = metadata !{i32 350, i32 0, metadata !4, null}
!193 = metadata !{i32 355, i32 0, metadata !4, null}
!194 = metadata !{i32 369, i32 0, metadata !4, null}
!195 = metadata !{i32 370, i32 0, metadata !4, null}
!196 = metadata !{i32 371, i32 0, metadata !4, null}
!197 = metadata !{i32 373, i32 0, metadata !4, null}
!198 = metadata !{i32 374, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !4, i32 374, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!200 = metadata !{i32 376, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !1, metadata !199, i32 375, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!202 = metadata !{i32 379, i32 0, metadata !201, null}
!203 = metadata !{i32 377, i32 0, metadata !201, null}
!204 = metadata !{i32 378, i32 0, metadata !201, null}
!205 = metadata !{i32 381, i32 0, metadata !4, null}
!206 = metadata !{i32 382, i32 0, metadata !4, null}
!207 = metadata !{i32 384, i32 0, metadata !4, null}
!208 = metadata !{i32 385, i32 0, metadata !4, null}
!209 = metadata !{i32 386, i32 0, metadata !4, null}
!210 = metadata !{i32 388, i32 0, metadata !4, null}
!211 = metadata !{i32 389, i32 0, metadata !4, null}
!212 = metadata !{i32 390, i32 0, metadata !4, null}
!213 = metadata !{i32 391, i32 0, metadata !4, null}
!214 = metadata !{i32 392, i32 0, metadata !4, null}
!215 = metadata !{i32 397, i32 0, metadata !4, null}
!216 = metadata !{i32 410, i32 0, metadata !4, null}
!217 = metadata !{i32 411, i32 0, metadata !4, null}
!218 = metadata !{i32 412, i32 0, metadata !4, null}
!219 = metadata !{i32 413, i32 0, metadata !4, null}
!220 = metadata !{i32 414, i32 0, metadata !4, null}
!221 = metadata !{i32 416, i32 0, metadata !4, null}
!222 = metadata !{i32 417, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !4, i32 417, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!224 = metadata !{i32 421, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !223, i32 418, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!226 = metadata !{i32 419, i32 0, metadata !225, null}
!227 = metadata !{i32 420, i32 0, metadata !225, null}
!228 = metadata !{i32 423, i32 0, metadata !4, null}
!229 = metadata !{i32 424, i32 0, metadata !4, null}
!230 = metadata !{i32 426, i32 0, metadata !4, null}
!231 = metadata !{i32 427, i32 0, metadata !4, null}
!232 = metadata !{i32 428, i32 0, metadata !4, null}
!233 = metadata !{i32 430, i32 0, metadata !4, null}
!234 = metadata !{i32 431, i32 0, metadata !4, null}
!235 = metadata !{i32 432, i32 0, metadata !4, null}
!236 = metadata !{i32 433, i32 0, metadata !4, null}
!237 = metadata !{i32 434, i32 0, metadata !4, null}
!238 = metadata !{i32 435, i32 0, metadata !4, null}
!239 = metadata !{i32 436, i32 0, metadata !4, null}
!240 = metadata !{i32 441, i32 0, metadata !4, null}
!241 = metadata !{i32 455, i32 0, metadata !4, null}
!242 = metadata !{i32 456, i32 0, metadata !4, null}
!243 = metadata !{i32 457, i32 0, metadata !4, null}
!244 = metadata !{i32 459, i32 0, metadata !4, null}
!245 = metadata !{i32 460, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !4, i32 460, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!247 = metadata !{i32 464, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !246, i32 461, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!249 = metadata !{i32 465, i32 0, metadata !248, null}
!250 = metadata !{i32 462, i32 0, metadata !248, null}
!251 = metadata !{i32 463, i32 0, metadata !248, null}
!252 = metadata !{double undef}
!253 = metadata !{i32 467, i32 0, metadata !4, null}
!254 = metadata !{i32 468, i32 0, metadata !4, null}
!255 = metadata !{i32 470, i32 0, metadata !4, null}
!256 = metadata !{i32 471, i32 0, metadata !4, null}
!257 = metadata !{i32 472, i32 0, metadata !4, null}
!258 = metadata !{i32 473, i32 0, metadata !4, null}
!259 = metadata !{i32 474, i32 0, metadata !4, null}
!260 = metadata !{i32 476, i32 0, metadata !4, null}
!261 = metadata !{i32 477, i32 0, metadata !4, null}
!262 = metadata !{i32 478, i32 0, metadata !4, null}
!263 = metadata !{i32 479, i32 0, metadata !4, null}
!264 = metadata !{i32 480, i32 0, metadata !4, null}
!265 = metadata !{i32 485, i32 0, metadata !4, null}
!266 = metadata !{i32 499, i32 0, metadata !4, null}
!267 = metadata !{i32 500, i32 0, metadata !4, null}
!268 = metadata !{i32 501, i32 0, metadata !4, null}
!269 = metadata !{i32 503, i32 0, metadata !4, null}
!270 = metadata !{i32 504, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !4, i32 504, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!272 = metadata !{i32 508, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !271, i32 505, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!274 = metadata !{i32 509, i32 0, metadata !273, null}
!275 = metadata !{i32 506, i32 0, metadata !273, null}
!276 = metadata !{i32 507, i32 0, metadata !273, null}
!277 = metadata !{i32 511, i32 0, metadata !4, null}
!278 = metadata !{i32 512, i32 0, metadata !4, null}
!279 = metadata !{i32 514, i32 0, metadata !4, null}
!280 = metadata !{i32 515, i32 0, metadata !4, null}
!281 = metadata !{i32 516, i32 0, metadata !4, null}
!282 = metadata !{i32 517, i32 0, metadata !4, null}
!283 = metadata !{i32 518, i32 0, metadata !4, null}
!284 = metadata !{i32 520, i32 0, metadata !4, null}
!285 = metadata !{i32 521, i32 0, metadata !4, null}
!286 = metadata !{i32 522, i32 0, metadata !4, null}
!287 = metadata !{i32 523, i32 0, metadata !4, null}
!288 = metadata !{i32 524, i32 0, metadata !4, null}
!289 = metadata !{i32 529, i32 0, metadata !4, null}
!290 = metadata !{i32 546, i32 0, metadata !4, null}
!291 = metadata !{i32 547, i32 0, metadata !4, null}
!292 = metadata !{i32 548, i32 0, metadata !4, null}
!293 = metadata !{i32 549, i32 0, metadata !4, null}
!294 = metadata !{i32 551, i32 0, metadata !4, null}
!295 = metadata !{i32 552, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !4, i32 552, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!297 = metadata !{i32 554, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !296, i32 553, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!299 = metadata !{i32 555, i32 0, metadata !298, null}
!300 = metadata !{i32 556, i32 0, metadata !298, null}
!301 = metadata !{i32 558, i32 0, metadata !4, null}
!302 = metadata !{i32 559, i32 0, metadata !4, null}
!303 = metadata !{i32 563, i32 0, metadata !4, null}
!304 = metadata !{i32 564, i32 0, metadata !4, null}
!305 = metadata !{i32 565, i32 0, metadata !4, null}
!306 = metadata !{i32 566, i32 0, metadata !4, null}
!307 = metadata !{i32 567, i32 0, metadata !4, null}
!308 = metadata !{i32 569, i32 0, metadata !4, null}
!309 = metadata !{i32 570, i32 0, metadata !4, null}
!310 = metadata !{i32 572, i32 0, metadata !4, null}
!311 = metadata !{i32 573, i32 0, metadata !4, null}
!312 = metadata !{i32 578, i32 0, metadata !4, null}
!313 = metadata !{i32 593, i32 0, metadata !4, null}
!314 = metadata !{i32 594, i32 0, metadata !4, null}
!315 = metadata !{i32 595, i32 0, metadata !4, null}
!316 = metadata !{i32 597, i32 0, metadata !4, null}
!317 = metadata !{i32 598, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !4, i32 598, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!319 = metadata !{i32 602, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !318, i32 599, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!321 = metadata !{i32 603, i32 0, metadata !320, null}
!322 = metadata !{i32 600, i32 0, metadata !320, null}
!323 = metadata !{i32 601, i32 0, metadata !320, null}
!324 = metadata !{i32 605, i32 0, metadata !4, null}
!325 = metadata !{i32 606, i32 0, metadata !4, null}
!326 = metadata !{i32 608, i32 0, metadata !4, null}
!327 = metadata !{i32 609, i32 0, metadata !4, null}
!328 = metadata !{i32 610, i32 0, metadata !4, null}
!329 = metadata !{i32 611, i32 0, metadata !4, null}
!330 = metadata !{i32 612, i32 0, metadata !4, null}
!331 = metadata !{i32 614, i32 0, metadata !4, null}
!332 = metadata !{i32 615, i32 0, metadata !4, null}
!333 = metadata !{i32 616, i32 0, metadata !4, null}
!334 = metadata !{i32 617, i32 0, metadata !4, null}
!335 = metadata !{i32 618, i32 0, metadata !4, null}
!336 = metadata !{i32 623, i32 0, metadata !4, null}
!337 = metadata !{i32 633, i32 0, metadata !4, null}
!338 = metadata !{i32 634, i32 0, metadata !4, null}
!339 = metadata !{i32 640, i32 0, metadata !4, null}
!340 = metadata !{i32 641, i32 0, metadata !4, null}
!341 = metadata !{i32 642, i32 0, metadata !4, null}
!342 = metadata !{i32 649, i32 0, metadata !4, null}
!343 = metadata !{i32 650, i32 0, metadata !4, null}
!344 = metadata !{i32 656, i32 0, metadata !4, null}
!345 = metadata !{i32 657, i32 0, metadata !4, null}
!346 = metadata !{i32 660, i32 0, metadata !4, null}
!347 = metadata !{i32 661, i32 0, metadata !4, null}
!348 = metadata !{i32 662, i32 0, metadata !4, null}
!349 = metadata !{i32 663, i32 0, metadata !4, null}
!350 = metadata !{i32 664, i32 0, metadata !4, null}
!351 = metadata !{i32 665, i32 0, metadata !4, null}
!352 = metadata !{i32 666, i32 0, metadata !4, null}
!353 = metadata !{i32 667, i32 0, metadata !4, null}
!354 = metadata !{i32 987, i32 0, metadata !22, null}
!355 = metadata !{i32 991, i32 0, metadata !22, null}
!356 = metadata !{i32 993, i32 0, metadata !22, null}
!357 = metadata !{i32 994, i32 0, metadata !22, null}
!358 = metadata !{metadata !359, metadata !360, i64 0}
!359 = metadata !{metadata !"timeval", metadata !360, i64 0, metadata !360, i64 8}
!360 = metadata !{metadata !"long", metadata !100, i64 0}
!361 = metadata !{metadata !359, metadata !360, i64 8}
!362 = metadata !{i32 995, i32 0, metadata !22, null}
!363 = metadata !{i32 997, i32 0, metadata !22, null}
