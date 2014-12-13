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
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !115) #3, !dbg !117
  %1 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !118, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !119) #3, !dbg !118
  %2 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !120
  %3 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !121, !tbaa !122
  %4 = sitofp i64 %3 to double, !dbg !121
  %5 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !121, !tbaa !125
  %6 = sitofp i64 %5 to double, !dbg !121
  %7 = fmul double %6, 1.000000e-06, !dbg !121
  %8 = fadd double %4, %7, !dbg !121
  store double %8, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !121, !tbaa !98
  %9 = fsub double %8, %1, !dbg !126
  store double %9, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !126, !tbaa !98
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !127) #3, !dbg !129
  tail call void @llvm.dbg.value(metadata !{double %8}, i64 0, metadata !130) #3, !dbg !131
  %10 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !132
  %11 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !133, !tbaa !122
  %12 = sitofp i64 %11 to double, !dbg !133
  %13 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !133, !tbaa !125
  %14 = sitofp i64 %13 to double, !dbg !133
  %15 = fmul double %14, 1.000000e-06, !dbg !133
  %16 = fadd double %12, %15, !dbg !133
  store double %16, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !133, !tbaa !98
  %17 = fsub double %16, %8, !dbg !134
  store double %17, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !134, !tbaa !98
  tail call void @llvm.dbg.value(metadata !95, i64 0, metadata !21), !dbg !135
  store double 0.000000e+00, double* @sa, align 8, !dbg !136, !tbaa !98
  br label %18, !dbg !137

; <label>:18                                      ; preds = %._crit_edge67, %0
  %19 = phi double [ %16, %0 ], [ %72, %._crit_edge67 ]
  %20 = phi double [ 0.000000e+00, %0 ], [ %73, %._crit_edge67 ]
  %x.0 = phi double [ undef, %0 ], [ %27, %._crit_edge67 ]
  %s.0 = phi double [ undef, %0 ], [ %s.1.lcssa, %._crit_edge67 ]
  %n.0 = phi i64 [ 15625, %0 ], [ %24, %._crit_edge67 ]
  %21 = load double* @TLimit, align 8, !dbg !137, !tbaa !98
  %22 = fcmp olt double %20, %21, !dbg !137
  br i1 %22, label %23, label %75, !dbg !137

; <label>:23                                      ; preds = %18
  %24 = shl nsw i64 %n.0, 1, !dbg !138
  tail call void @llvm.dbg.value(metadata !{i64 %24}, i64 0, metadata !21), !dbg !138
  %25 = load double* @one, align 8, !dbg !140, !tbaa !98
  %26 = sitofp i64 %24 to double, !dbg !140
  %27 = fdiv double %25, %26, !dbg !140
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !15), !dbg !140
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !142
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !143
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !14), !dbg !144
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !145) #3, !dbg !147
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !148) #3, !dbg !149
  %28 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !150
  %29 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !151, !tbaa !122
  %30 = sitofp i64 %29 to double, !dbg !151
  %31 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !151, !tbaa !125
  %32 = sitofp i64 %31 to double, !dbg !151
  %33 = fmul double %32, 1.000000e-06, !dbg !151
  %34 = fadd double %30, %33, !dbg !151
  store double %34, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !151, !tbaa !98
  %35 = fsub double %34, %19, !dbg !152
  store double %35, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !152, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !154
  %36 = add nsw i64 %24, -1, !dbg !154
  %37 = icmp slt i64 %24, 2, !dbg !154
  br i1 %37, label %._crit_edge67, label %.lr.ph66, !dbg !154

.lr.ph66:                                         ; preds = %23
  %38 = load double* @D1, align 8, !dbg !156, !tbaa !98
  %39 = load double* @D2, align 8, !dbg !156, !tbaa !98
  %40 = load double* @D3, align 8, !dbg !156, !tbaa !98
  %41 = load double* @E2, align 8, !dbg !156, !tbaa !98
  %42 = load double* @E3, align 8, !dbg !156, !tbaa !98
  %43 = insertelement <2 x double> undef, double %38, i32 0, !dbg !156
  %44 = insertelement <2 x double> %43, double %25, i32 1, !dbg !156
  %45 = insertelement <2 x double> undef, double %39, i32 0, !dbg !156
  %46 = insertelement <2 x double> %45, double %38, i32 1, !dbg !156
  %47 = insertelement <2 x double> undef, double %40, i32 0, !dbg !156
  br label %48, !dbg !154

; <label>:48                                      ; preds = %48, %.lr.ph66
  %i.064 = phi i64 [ 1, %.lr.ph66 ], [ %64, %48 ]
  %s.163 = phi double [ 0.000000e+00, %.lr.ph66 ], [ %63, %48 ]
  %v.062 = phi double [ 0.000000e+00, %.lr.ph66 ], [ %49, %48 ]
  %49 = fadd double %25, %v.062, !dbg !158
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !13), !dbg !158
  %50 = fmul double %27, %49, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !12), !dbg !159
  %51 = fmul double %50, %42, !dbg !156
  %52 = fadd double %41, %51, !dbg !156
  %53 = insertelement <2 x double> undef, double %50, i32 0, !dbg !156
  %54 = insertelement <2 x double> %53, double %50, i32 1, !dbg !156
  %55 = insertelement <2 x double> %47, double %52, i32 1, !dbg !156
  %56 = fmul <2 x double> %54, %55, !dbg !156
  %57 = fadd <2 x double> %46, %56, !dbg !156
  %58 = fmul <2 x double> %57, %54, !dbg !156
  %59 = fadd <2 x double> %44, %58, !dbg !156
  %60 = extractelement <2 x double> %59, i32 0, !dbg !156
  %61 = extractelement <2 x double> %59, i32 1, !dbg !156
  %62 = fdiv double %60, %61, !dbg !156
  %63 = fadd double %s.163, %62, !dbg !156
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !10), !dbg !156
  %64 = add nsw i64 %i.064, 1, !dbg !154
  tail call void @llvm.dbg.value(metadata !{i64 %64}, i64 0, metadata !19), !dbg !154
  %65 = icmp slt i64 %i.064, %36, !dbg !154
  br i1 %65, label %48, label %._crit_edge67, !dbg !154

._crit_edge67:                                    ; preds = %48, %23
  %s.1.lcssa = phi double [ 0.000000e+00, %23 ], [ %63, %48 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !160) #3, !dbg !162
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !163) #3, !dbg !164
  %66 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !165
  %67 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !166, !tbaa !122
  %68 = sitofp i64 %67 to double, !dbg !166
  %69 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !166, !tbaa !125
  %70 = sitofp i64 %69 to double, !dbg !166
  %71 = fmul double %70, 1.000000e-06, !dbg !166
  %72 = fadd double %68, %71, !dbg !166
  store double %72, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !166, !tbaa !98
  %73 = fsub double %72, %34, !dbg !167
  store double %73, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !167, !tbaa !98
  store double %73, double* @sa, align 8, !dbg !168, !tbaa !98
  %74 = icmp eq i64 %24, 512000000, !dbg !169
  br i1 %74, label %75, label %18, !dbg !169

; <label>:75                                      ; preds = %._crit_edge67, %18
  %76 = phi double [ %72, %._crit_edge67 ], [ %19, %18 ]
  %x.1 = phi double [ %27, %._crit_edge67 ], [ %x.0, %18 ]
  %s.2 = phi double [ %s.1.lcssa, %._crit_edge67 ], [ %s.0, %18 ]
  store double 1.589500e-02, double* @scale, align 8, !dbg !171, !tbaa !98
  store double 1.589500e-02, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !172, !tbaa !98
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !173) #3, !dbg !175
  tail call void @llvm.dbg.value(metadata !{double %76}, i64 0, metadata !176) #3, !dbg !177
  %77 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !178
  %78 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !179, !tbaa !122
  %79 = sitofp i64 %78 to double, !dbg !179
  %80 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !179, !tbaa !125
  %81 = sitofp i64 %80 to double, !dbg !179
  %82 = fmul double %81, 1.000000e-06, !dbg !179
  %83 = fadd double %79, %82, !dbg !179
  store double %83, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !179, !tbaa !98
  %84 = fsub double %83, %76, !dbg !180
  store double %84, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !180, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !181
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !183) #3, !dbg !185
  tail call void @llvm.dbg.value(metadata !{double %83}, i64 0, metadata !186) #3, !dbg !187
  %85 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !188
  %86 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !189, !tbaa !122
  %87 = sitofp i64 %86 to double, !dbg !189
  %88 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !189, !tbaa !125
  %89 = sitofp i64 %88 to double, !dbg !189
  %90 = fmul double %89, 1.000000e-06, !dbg !189
  %91 = fadd double %87, %90, !dbg !189
  store double %91, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !189, !tbaa !98
  %92 = fsub double %91, %83, !dbg !190
  store double %92, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !190, !tbaa !98
  %93 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !191, !tbaa !98
  %94 = fmul double %93, %92, !dbg !191
  %95 = fcmp olt double %94, 0.000000e+00, !dbg !192
  %storemerge4 = select i1 %95, double 0.000000e+00, double %94, !dbg !192
  store double %storemerge4, double* @nulltime, align 8, !dbg !191, !tbaa !98
  %96 = load double* @sa, align 8, !dbg !194, !tbaa !98
  %97 = fmul double %93, %96, !dbg !194
  %98 = fsub double %97, %storemerge4, !dbg !194
  store double %98, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !194, !tbaa !98
  %99 = load double* @D1, align 8, !dbg !195, !tbaa !98
  %100 = load double* @D2, align 8, !dbg !195, !tbaa !98
  %101 = fadd double %99, %100, !dbg !195
  %102 = load double* @D3, align 8, !dbg !195, !tbaa !98
  %103 = fadd double %101, %102, !dbg !195
  %104 = load double* @one, align 8, !dbg !195, !tbaa !98
  %105 = fadd double %99, %104, !dbg !195
  %106 = load double* @E2, align 8, !dbg !195, !tbaa !98
  %107 = fadd double %105, %106, !dbg !195
  %108 = load double* @E3, align 8, !dbg !195, !tbaa !98
  %109 = fadd double %107, %108, !dbg !195
  %110 = fdiv double %103, %109, !dbg !195
  %111 = fdiv double %98, 1.400000e+01, !dbg !196
  store double %111, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 3), align 8, !dbg !196, !tbaa !98
  %112 = fadd double %110, %99, !dbg !197
  %113 = load double* @two, align 8, !dbg !197, !tbaa !98
  %114 = fmul double %s.2, %113, !dbg !197
  %115 = fadd double %112, %114, !dbg !197
  %116 = fmul double %x.1, %115, !dbg !197
  %117 = fdiv double %116, %113, !dbg !197
  store double %117, double* @sa, align 8, !dbg !197, !tbaa !98
  %118 = fdiv double %104, %117, !dbg !198
  store double %118, double* @sb, align 8, !dbg !198, !tbaa !98
  %119 = fptosi double %118 to i64, !dbg !199
  %120 = mul nsw i64 %119, 40000, !dbg !199
  %121 = sitofp i64 %120 to double, !dbg !199
  %122 = load double* @scale, align 8, !dbg !199, !tbaa !98
  %123 = fdiv double %121, %122, !dbg !199
  %124 = fptosi double %123 to i64, !dbg !199
  tail call void @llvm.dbg.value(metadata !{i64 %124}, i64 0, metadata !21), !dbg !199
  %125 = fadd double %118, -2.520000e+01, !dbg !200
  store double %125, double* @sc, align 8, !dbg !200, !tbaa !98
  %126 = fdiv double %104, %111, !dbg !201
  store double %126, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 4), align 16, !dbg !201, !tbaa !98
  %127 = fmul double %125, 1.000000e-30, !dbg !202
  %128 = fmul double %98, 1.000000e-30, !dbg !202
  %129 = fmul double %126, 1.000000e-30, !dbg !202
  %130 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %127, double %128, double %129) #3, !dbg !202
  tail call void @llvm.dbg.value(metadata !{i64 %124}, i64 0, metadata !20), !dbg !203
  %131 = load double* @five, align 8, !dbg !204, !tbaa !98
  %132 = load double* @one, align 8, !dbg !205, !tbaa !98
  %133 = fsub double -0.000000e+00, %132, !dbg !205
  store double %133, double* @sa, align 8, !dbg !205, !tbaa !98
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !206) #3, !dbg !208
  %134 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !209, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %134}, i64 0, metadata !210) #3, !dbg !209
  %135 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !211
  %136 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !212, !tbaa !122
  %137 = sitofp i64 %136 to double, !dbg !212
  %138 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !212, !tbaa !125
  %139 = sitofp i64 %138 to double, !dbg !212
  %140 = fmul double %139, 1.000000e-06, !dbg !212
  %141 = fadd double %137, %140, !dbg !212
  store double %141, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !212, !tbaa !98
  %142 = fsub double %141, %134, !dbg !213
  store double %142, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !213, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !214
  %s.352 = fsub double -0.000000e+00, %131, !dbg !204
  %143 = icmp slt i64 %124, 1, !dbg !214
  br i1 %143, label %148, label %.lr.ph57, !dbg !214

.lr.ph57:                                         ; preds = %75
  %sa.promoted60 = load double* @sa, align 8, !dbg !216, !tbaa !98
  br label %144, !dbg !214

; <label>:144                                     ; preds = %144, %.lr.ph57
  %145 = phi double [ %sa.promoted60, %.lr.ph57 ], [ %146, %144 ], !dbg !216
  %s.355 = phi double [ %s.352, %.lr.ph57 ], [ %s.3, %144 ]
  %i.254 = phi i64 [ 1, %.lr.ph57 ], [ %147, %144 ]
  %.pn53 = phi double [ %131, %.lr.ph57 ], [ %s.355, %144 ]
  %146 = fadd double %.pn53, %145, !dbg !216
  %147 = add nsw i64 %i.254, 1, !dbg !214
  tail call void @llvm.dbg.value(metadata !{i64 %147}, i64 0, metadata !19), !dbg !214
  %s.3 = fsub double -0.000000e+00, %s.355, !dbg !204
  %exitcond81 = icmp eq i64 %i.254, %124, !dbg !214
  br i1 %exitcond81, label %._crit_edge58, label %144, !dbg !214

._crit_edge58:                                    ; preds = %144
  store double %146, double* @sa, align 8, !dbg !216, !tbaa !98
  br label %148, !dbg !214

; <label>:148                                     ; preds = %._crit_edge58, %75
  %s.3.lcssa = phi double [ %s.3, %._crit_edge58 ], [ %s.352, %75 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !218) #3, !dbg !220
  tail call void @llvm.dbg.value(metadata !{double %141}, i64 0, metadata !221) #3, !dbg !222
  %149 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !223
  %150 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !224, !tbaa !122
  %151 = sitofp i64 %150 to double, !dbg !224
  %152 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !224, !tbaa !125
  %153 = sitofp i64 %152 to double, !dbg !224
  %154 = fmul double %153, 1.000000e-06, !dbg !224
  %155 = fadd double %151, %154, !dbg !224
  store double %155, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !224, !tbaa !98
  %156 = fsub double %155, %141, !dbg !225
  store double %156, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !225, !tbaa !98
  %157 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !226, !tbaa !98
  %158 = fmul double %157, %156, !dbg !226
  %159 = fcmp olt double %158, 0.000000e+00, !dbg !227
  %storemerge = select i1 %159, double 0.000000e+00, double %158, !dbg !227
  store double %storemerge, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !226, !tbaa !98
  %160 = sitofp i64 %124 to double, !dbg !229
  store double %160, double* @sc, align 8, !dbg !229, !tbaa !98
  %161 = load double* @sa, align 8, !dbg !230, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %161}, i64 0, metadata !12), !dbg !230
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !231
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !14), !dbg !232
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !15), !dbg !233
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !234) #3, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !237) #3, !dbg !238
  %162 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !239
  %163 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !240, !tbaa !122
  %164 = sitofp i64 %163 to double, !dbg !240
  %165 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !240, !tbaa !125
  %166 = sitofp i64 %165 to double, !dbg !240
  %167 = fmul double %166, 1.000000e-06, !dbg !240
  %168 = fadd double %164, %167, !dbg !240
  store double %168, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !240, !tbaa !98
  %169 = fsub double %168, %155, !dbg !241
  store double %169, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !241, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !242
  br i1 %143, label %183, label %.lr.ph46, !dbg !242

.lr.ph46:                                         ; preds = %148
  %170 = load double* @two, align 8, !dbg !244, !tbaa !98
  %sa.promoted = load double* @sa, align 8, !dbg !246, !tbaa !98
  br label %171, !dbg !242

; <label>:171                                     ; preds = %171, %.lr.ph46
  %172 = phi double [ %sa.promoted, %.lr.ph46 ], [ %174, %171 ], !dbg !247
  %i.344 = phi i64 [ 1, %.lr.ph46 ], [ %182, %171 ]
  %s.443 = phi double [ %s.3.lcssa, %.lr.ph46 ], [ %173, %171 ]
  %u.042 = phi double [ %161, %.lr.ph46 ], [ %175, %171 ]
  %x.241 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %177, %171 ]
  %w.040 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %181, %171 ]
  %v.139 = phi double [ 0.000000e+00, %.lr.ph46 ], [ %179, %171 ]
  %173 = fsub double -0.000000e+00, %s.443, !dbg !247
  tail call void @llvm.dbg.value(metadata !{double %173}, i64 0, metadata !10), !dbg !247
  %174 = fsub double %172, %s.443, !dbg !246
  %175 = fadd double %u.042, %170, !dbg !244
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !12), !dbg !244
  %176 = fsub double %173, %175, !dbg !248
  %177 = fadd double %x.241, %176, !dbg !248
  tail call void @llvm.dbg.value(metadata !{double %177}, i64 0, metadata !15), !dbg !248
  %178 = fmul double %175, %173, !dbg !249
  %179 = fsub double %v.139, %178, !dbg !249
  tail call void @llvm.dbg.value(metadata !{double %179}, i64 0, metadata !13), !dbg !249
  %180 = fdiv double %173, %175, !dbg !250
  %181 = fadd double %w.040, %180, !dbg !250
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !14), !dbg !250
  %182 = add nsw i64 %i.344, 1, !dbg !242
  tail call void @llvm.dbg.value(metadata !{i64 %182}, i64 0, metadata !19), !dbg !242
  %exitcond = icmp eq i64 %i.344, %124, !dbg !242
  br i1 %exitcond, label %._crit_edge47, label %171, !dbg !242

._crit_edge47:                                    ; preds = %171
  store double %174, double* @sa, align 8, !dbg !246, !tbaa !98
  br label %183, !dbg !242

; <label>:183                                     ; preds = %._crit_edge47, %148
  %x.2.lcssa = phi double [ %177, %._crit_edge47 ], [ 0.000000e+00, %148 ]
  %w.0.lcssa = phi double [ %181, %._crit_edge47 ], [ 0.000000e+00, %148 ]
  %v.1.lcssa = phi double [ %179, %._crit_edge47 ], [ 0.000000e+00, %148 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !251) #3, !dbg !253
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !254) #3, !dbg !255
  %184 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !256
  %185 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !257, !tbaa !122
  %186 = sitofp i64 %185 to double, !dbg !257
  %187 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !257, !tbaa !125
  %188 = sitofp i64 %187 to double, !dbg !257
  %189 = fmul double %188, 1.000000e-06, !dbg !257
  %190 = fadd double %186, %189, !dbg !257
  store double %190, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !257, !tbaa !98
  %191 = fsub double %190, %168, !dbg !258
  store double %191, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !258, !tbaa !98
  %192 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !259, !tbaa !98
  %193 = fmul double %192, %191, !dbg !259
  store double %193, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !259, !tbaa !98
  %194 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !260, !tbaa !98
  %195 = fsub double %193, %194, !dbg !260
  %196 = fdiv double %195, 7.000000e+00, !dbg !260
  store double %196, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 7), align 8, !dbg !260, !tbaa !98
  %197 = load double* @sa, align 8, !dbg !261, !tbaa !98
  %198 = fmul double %x.2.lcssa, %197, !dbg !261
  %199 = load double* @sc, align 8, !dbg !261, !tbaa !98
  %200 = fdiv double %198, %199, !dbg !261
  %201 = fptosi double %200 to i64, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i64 %201}, i64 0, metadata !20), !dbg !261
  %202 = load double* @four, align 8, !dbg !262, !tbaa !98
  %203 = fmul double %w.0.lcssa, %202, !dbg !262
  %204 = load double* @five, align 8, !dbg !262, !tbaa !98
  %205 = fdiv double %203, %204, !dbg !262
  store double %205, double* @sa, align 8, !dbg !262, !tbaa !98
  %206 = fdiv double %204, %v.1.lcssa, !dbg !263
  %207 = fadd double %205, %206, !dbg !263
  store double %207, double* @sb, align 8, !dbg !263, !tbaa !98
  store double 3.125000e+01, double* @sc, align 8, !dbg !264, !tbaa !98
  %208 = fmul double %v.1.lcssa, %v.1.lcssa, !dbg !265
  %209 = fmul double %v.1.lcssa, %208, !dbg !265
  %210 = fdiv double 3.125000e+01, %209, !dbg !265
  %211 = fsub double %207, %210, !dbg !265
  store double %211, double* @piprg, align 8, !dbg !265, !tbaa !98
  %212 = load double* @piref, align 8, !dbg !266, !tbaa !98
  %213 = fsub double %211, %212, !dbg !266
  store double %213, double* @pierr, align 8, !dbg !266, !tbaa !98
  %214 = load double* @one, align 8, !dbg !267, !tbaa !98
  %215 = fdiv double %214, %196, !dbg !267
  store double %215, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 8), align 16, !dbg !267, !tbaa !98
  %216 = fmul double %213, 1.000000e-30, !dbg !268
  %217 = fmul double %195, 1.000000e-30, !dbg !268
  %218 = fmul double %215, 1.000000e-30, !dbg !268
  %219 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), double %216, double %217, double %218) #3, !dbg !268
  %220 = load double* @piref, align 8, !dbg !269, !tbaa !98
  %221 = load double* @three, align 8, !dbg !269, !tbaa !98
  %222 = sitofp i64 %201 to double, !dbg !269
  %223 = fmul double %222, %221, !dbg !269
  %224 = fdiv double %220, %223, !dbg !269
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !15), !dbg !269
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !270
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !271
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !272) #3, !dbg !274
  %225 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !275, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %225}, i64 0, metadata !276) #3, !dbg !275
  %226 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !277
  %227 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !278, !tbaa !122
  %228 = sitofp i64 %227 to double, !dbg !278
  %229 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !278, !tbaa !125
  %230 = sitofp i64 %229 to double, !dbg !278
  %231 = fmul double %230, 1.000000e-06, !dbg !278
  %232 = fadd double %228, %231, !dbg !278
  store double %232, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !278, !tbaa !98
  %233 = fsub double %232, %225, !dbg !279
  store double %233, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !279, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !280
  %234 = add nsw i64 %201, -1, !dbg !280
  %235 = icmp slt i64 %201, 2, !dbg !280
  br i1 %235, label %._crit_edge36, label %.lr.ph35, !dbg !280

.lr.ph35:                                         ; preds = %183
  %236 = load double* @one, align 8, !dbg !282, !tbaa !98
  %237 = load double* @A6, align 8, !dbg !284, !tbaa !98
  %238 = load double* @A5, align 8, !dbg !284, !tbaa !98
  %239 = load double* @A4, align 8, !dbg !284, !tbaa !98
  %240 = load double* @A3, align 8, !dbg !284, !tbaa !98
  %241 = load double* @A2, align 8, !dbg !284, !tbaa !98
  %242 = load double* @A1, align 8, !dbg !284, !tbaa !98
  br label %243, !dbg !280

; <label>:243                                     ; preds = %243, %.lr.ph35
  %i.433 = phi i64 [ 1, %.lr.ph35 ], [ %261, %243 ]
  %s.532 = phi double [ 0.000000e+00, %.lr.ph35 ], [ %260, %243 ]
  %v.231 = phi double [ 0.000000e+00, %.lr.ph35 ], [ %244, %243 ]
  %244 = fadd double %v.231, %236, !dbg !282
  tail call void @llvm.dbg.value(metadata !{double %244}, i64 0, metadata !13), !dbg !282
  %245 = fmul double %224, %244, !dbg !285
  tail call void @llvm.dbg.value(metadata !{double %245}, i64 0, metadata !12), !dbg !285
  %246 = fmul double %245, %245, !dbg !286
  tail call void @llvm.dbg.value(metadata !{double %246}, i64 0, metadata !14), !dbg !286
  %247 = fmul double %237, %246, !dbg !284
  %248 = fsub double %247, %238, !dbg !284
  %249 = fmul double %246, %248, !dbg !284
  %250 = fadd double %239, %249, !dbg !284
  %251 = fmul double %246, %250, !dbg !284
  %252 = fsub double %251, %240, !dbg !284
  %253 = fmul double %246, %252, !dbg !284
  %254 = fadd double %241, %253, !dbg !284
  %255 = fmul double %246, %254, !dbg !284
  %256 = fadd double %242, %255, !dbg !284
  %257 = fmul double %246, %256, !dbg !284
  %258 = fadd double %236, %257, !dbg !284
  %259 = fmul double %245, %258, !dbg !284
  %260 = fadd double %s.532, %259, !dbg !284
  tail call void @llvm.dbg.value(metadata !{double %260}, i64 0, metadata !10), !dbg !284
  %261 = add nsw i64 %i.433, 1, !dbg !280
  tail call void @llvm.dbg.value(metadata !{i64 %261}, i64 0, metadata !19), !dbg !280
  %262 = icmp slt i64 %i.433, %234, !dbg !280
  br i1 %262, label %243, label %._crit_edge36, !dbg !280

._crit_edge36:                                    ; preds = %243, %183
  %s.5.lcssa = phi double [ 0.000000e+00, %183 ], [ %260, %243 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !287) #3, !dbg !289
  tail call void @llvm.dbg.value(metadata !{double %232}, i64 0, metadata !290) #3, !dbg !291
  %263 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !292
  %264 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !293, !tbaa !122
  %265 = sitofp i64 %264 to double, !dbg !293
  %266 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !293, !tbaa !125
  %267 = sitofp i64 %266 to double, !dbg !293
  %268 = fmul double %267, 1.000000e-06, !dbg !293
  %269 = fadd double %265, %268, !dbg !293
  store double %269, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !293, !tbaa !98
  %270 = fsub double %269, %232, !dbg !294
  store double %270, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !294, !tbaa !98
  %271 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !295, !tbaa !98
  %272 = fmul double %271, %270, !dbg !295
  %273 = load double* @nulltime, align 8, !dbg !295, !tbaa !98
  %274 = fsub double %272, %273, !dbg !295
  store double %274, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !295, !tbaa !98
  %275 = load double* @piref, align 8, !dbg !296, !tbaa !98
  %276 = load double* @three, align 8, !dbg !296, !tbaa !98
  %277 = fdiv double %275, %276, !dbg !296
  tail call void @llvm.dbg.value(metadata !{double %277}, i64 0, metadata !12), !dbg !296
  %278 = fmul double %277, %277, !dbg !297
  tail call void @llvm.dbg.value(metadata !{double %278}, i64 0, metadata !14), !dbg !297
  %279 = load double* @A6, align 8, !dbg !298, !tbaa !98
  %280 = fmul double %279, %278, !dbg !298
  %281 = load double* @A5, align 8, !dbg !298, !tbaa !98
  %282 = fsub double %280, %281, !dbg !298
  %283 = fmul double %278, %282, !dbg !298
  %284 = load double* @A4, align 8, !dbg !298, !tbaa !98
  %285 = fadd double %284, %283, !dbg !298
  %286 = fmul double %278, %285, !dbg !298
  %287 = load double* @A3, align 8, !dbg !298, !tbaa !98
  %288 = fsub double %286, %287, !dbg !298
  %289 = fmul double %278, %288, !dbg !298
  %290 = load double* @A2, align 8, !dbg !298, !tbaa !98
  %291 = fadd double %290, %289, !dbg !298
  %292 = fmul double %278, %291, !dbg !298
  %293 = load double* @A1, align 8, !dbg !298, !tbaa !98
  %294 = fadd double %293, %292, !dbg !298
  %295 = fmul double %278, %294, !dbg !298
  %296 = load double* @one, align 8, !dbg !298, !tbaa !98
  %297 = fadd double %296, %295, !dbg !298
  %298 = fmul double %277, %297, !dbg !298
  %299 = fdiv double %274, 1.700000e+01, !dbg !299
  store double %299, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 10), align 16, !dbg !299, !tbaa !98
  %300 = load double* @two, align 8, !dbg !300, !tbaa !98
  %301 = fmul double %s.5.lcssa, %300, !dbg !300
  %302 = fadd double %298, %301, !dbg !300
  %303 = fmul double %224, %302, !dbg !300
  %304 = fdiv double %303, %300, !dbg !300
  store double %304, double* @sa, align 8, !dbg !300, !tbaa !98
  store double 5.000000e-01, double* @sb, align 8, !dbg !301, !tbaa !98
  %305 = fadd double %304, -5.000000e-01, !dbg !302
  store double %305, double* @sc, align 8, !dbg !302, !tbaa !98
  %306 = fdiv double %296, %299, !dbg !303
  store double %306, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 11), align 8, !dbg !303, !tbaa !98
  %307 = fmul double %305, 1.000000e-30, !dbg !304
  %308 = fmul double %274, 1.000000e-30, !dbg !304
  %309 = fmul double %306, 1.000000e-30, !dbg !304
  %310 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str6, i64 0, i64 0), double %307, double %308, double %309) #3, !dbg !304
  %311 = load double* @A3, align 8, !dbg !305, !tbaa !98
  %312 = fsub double -0.000000e+00, %311, !dbg !305
  store double %312, double* @A3, align 8, !dbg !305, !tbaa !98
  %313 = load double* @A5, align 8, !dbg !306, !tbaa !98
  %314 = fsub double -0.000000e+00, %313, !dbg !306
  store double %314, double* @A5, align 8, !dbg !306, !tbaa !98
  %315 = load double* @piref, align 8, !dbg !307, !tbaa !98
  %316 = load double* @three, align 8, !dbg !307, !tbaa !98
  %317 = fmul double %222, %316, !dbg !307
  %318 = fdiv double %315, %317, !dbg !307
  tail call void @llvm.dbg.value(metadata !{double %318}, i64 0, metadata !15), !dbg !307
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !308
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !309
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !310) #3, !dbg !312
  %319 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !313, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %319}, i64 0, metadata !314) #3, !dbg !313
  %320 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !315
  %321 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !316, !tbaa !122
  %322 = sitofp i64 %321 to double, !dbg !316
  %323 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !316, !tbaa !125
  %324 = sitofp i64 %323 to double, !dbg !316
  %325 = fmul double %324, 1.000000e-06, !dbg !316
  %326 = fadd double %322, %325, !dbg !316
  store double %326, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !316, !tbaa !98
  %327 = fsub double %326, %319, !dbg !317
  store double %327, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !317, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !318
  br i1 %235, label %._crit_edge29, label %.lr.ph28, !dbg !318

.lr.ph28:                                         ; preds = %._crit_edge36
  %328 = load double* @B6, align 8, !dbg !320, !tbaa !98
  %329 = load double* @B5, align 8, !dbg !320, !tbaa !98
  %330 = load double* @B4, align 8, !dbg !320, !tbaa !98
  %331 = load double* @B3, align 8, !dbg !320, !tbaa !98
  %332 = load double* @B2, align 8, !dbg !320, !tbaa !98
  %333 = load double* @B1, align 8, !dbg !320, !tbaa !98
  %334 = load double* @one, align 8, !dbg !320, !tbaa !98
  br label %335, !dbg !318

; <label>:335                                     ; preds = %335, %.lr.ph28
  %i.526 = phi i64 [ 1, %.lr.ph28 ], [ %352, %335 ]
  %s.625 = phi double [ 0.000000e+00, %.lr.ph28 ], [ %351, %335 ]
  %336 = sitofp i64 %i.526 to double, !dbg !322
  %337 = fmul double %318, %336, !dbg !322
  tail call void @llvm.dbg.value(metadata !{double %337}, i64 0, metadata !12), !dbg !322
  %338 = fmul double %337, %337, !dbg !323
  tail call void @llvm.dbg.value(metadata !{double %338}, i64 0, metadata !14), !dbg !323
  %339 = fmul double %338, %328, !dbg !320
  %340 = fadd double %339, %329, !dbg !320
  %341 = fmul double %338, %340, !dbg !320
  %342 = fadd double %330, %341, !dbg !320
  %343 = fmul double %338, %342, !dbg !320
  %344 = fadd double %331, %343, !dbg !320
  %345 = fmul double %338, %344, !dbg !320
  %346 = fadd double %332, %345, !dbg !320
  %347 = fmul double %338, %346, !dbg !320
  %348 = fadd double %333, %347, !dbg !320
  %349 = fmul double %338, %348, !dbg !320
  %350 = fadd double %s.625, %349, !dbg !320
  %351 = fadd double %334, %350, !dbg !320
  tail call void @llvm.dbg.value(metadata !{double %351}, i64 0, metadata !10), !dbg !320
  %352 = add nsw i64 %i.526, 1, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i64 %352}, i64 0, metadata !19), !dbg !318
  %353 = icmp slt i64 %i.526, %234, !dbg !318
  br i1 %353, label %335, label %._crit_edge29, !dbg !318

._crit_edge29:                                    ; preds = %335, %._crit_edge36
  %s.6.lcssa = phi double [ 0.000000e+00, %._crit_edge36 ], [ %351, %335 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !324) #3, !dbg !326
  tail call void @llvm.dbg.value(metadata !{double %326}, i64 0, metadata !327) #3, !dbg !328
  %354 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !329
  %355 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !330, !tbaa !122
  %356 = sitofp i64 %355 to double, !dbg !330
  %357 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !330, !tbaa !125
  %358 = sitofp i64 %357 to double, !dbg !330
  %359 = fmul double %358, 1.000000e-06, !dbg !330
  %360 = fadd double %356, %359, !dbg !330
  store double %360, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !330, !tbaa !98
  %361 = fsub double %360, %326, !dbg !331
  store double %361, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !331, !tbaa !98
  %362 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !332, !tbaa !98
  %363 = fmul double %362, %361, !dbg !332
  %364 = load double* @nulltime, align 8, !dbg !332, !tbaa !98
  %365 = fsub double %363, %364, !dbg !332
  store double %365, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !332, !tbaa !98
  %366 = load double* @piref, align 8, !dbg !333, !tbaa !98
  %367 = load double* @three, align 8, !dbg !333, !tbaa !98
  %368 = fdiv double %366, %367, !dbg !333
  tail call void @llvm.dbg.value(metadata !{double %368}, i64 0, metadata !12), !dbg !333
  %369 = fmul double %368, %368, !dbg !334
  tail call void @llvm.dbg.value(metadata !{double %369}, i64 0, metadata !14), !dbg !334
  %370 = load double* @B6, align 8, !dbg !335, !tbaa !98
  %371 = fmul double %370, %369, !dbg !335
  %372 = load double* @B5, align 8, !dbg !335, !tbaa !98
  %373 = fadd double %371, %372, !dbg !335
  %374 = fmul double %369, %373, !dbg !335
  %375 = load double* @B4, align 8, !dbg !335, !tbaa !98
  %376 = fadd double %375, %374, !dbg !335
  %377 = fmul double %369, %376, !dbg !335
  %378 = load double* @B3, align 8, !dbg !335, !tbaa !98
  %379 = fadd double %378, %377, !dbg !335
  %380 = fmul double %369, %379, !dbg !335
  %381 = load double* @B2, align 8, !dbg !335, !tbaa !98
  %382 = fadd double %381, %380, !dbg !335
  %383 = fmul double %369, %382, !dbg !335
  %384 = load double* @B1, align 8, !dbg !335, !tbaa !98
  %385 = fadd double %384, %383, !dbg !335
  %386 = fmul double %369, %385, !dbg !335
  %387 = load double* @one, align 8, !dbg !335, !tbaa !98
  %388 = fadd double %387, %386, !dbg !335
  %389 = fdiv double %365, 1.500000e+01, !dbg !336
  store double %389, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 13), align 8, !dbg !336, !tbaa !98
  %390 = fadd double %388, %387, !dbg !337
  %391 = load double* @two, align 8, !dbg !337, !tbaa !98
  %392 = fmul double %s.6.lcssa, %391, !dbg !337
  %393 = fadd double %390, %392, !dbg !337
  %394 = fmul double %318, %393, !dbg !337
  %395 = fdiv double %394, %391, !dbg !337
  store double %395, double* @sa, align 8, !dbg !337, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %368}, i64 0, metadata !12), !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %369}, i64 0, metadata !14), !dbg !339
  %396 = load double* @A6, align 8, !dbg !340, !tbaa !98
  %397 = fmul double %396, %369, !dbg !340
  %398 = load double* @A5, align 8, !dbg !340, !tbaa !98
  %399 = fadd double %397, %398, !dbg !340
  %400 = fmul double %369, %399, !dbg !340
  %401 = load double* @A4, align 8, !dbg !340, !tbaa !98
  %402 = fadd double %401, %400, !dbg !340
  %403 = fmul double %369, %402, !dbg !340
  %404 = load double* @A3, align 8, !dbg !340, !tbaa !98
  %405 = fadd double %404, %403, !dbg !340
  %406 = fmul double %369, %405, !dbg !340
  %407 = load double* @A2, align 8, !dbg !340, !tbaa !98
  %408 = fadd double %407, %406, !dbg !340
  %409 = fmul double %369, %408, !dbg !340
  %410 = load double* @A1, align 8, !dbg !340, !tbaa !98
  %411 = fadd double %410, %409, !dbg !340
  %412 = fmul double %369, %411, !dbg !340
  %413 = load double* @A0, align 8, !dbg !340, !tbaa !98
  %414 = fadd double %413, %412, !dbg !340
  %415 = fmul double %368, %414, !dbg !340
  store double %415, double* @sb, align 8, !dbg !340, !tbaa !98
  %416 = fsub double %395, %415, !dbg !341
  store double %416, double* @sc, align 8, !dbg !341, !tbaa !98
  %417 = fdiv double %387, %389, !dbg !342
  store double %417, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 14), align 16, !dbg !342, !tbaa !98
  %418 = fmul double %416, 1.000000e-30, !dbg !343
  %419 = fmul double %365, 1.000000e-30, !dbg !343
  %420 = fmul double %417, 1.000000e-30, !dbg !343
  %421 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str7, i64 0, i64 0), double %418, double %419, double %420) #3, !dbg !343
  %422 = load double* @piref, align 8, !dbg !344, !tbaa !98
  %423 = load double* @three, align 8, !dbg !344, !tbaa !98
  %424 = fmul double %222, %423, !dbg !344
  %425 = fdiv double %422, %424, !dbg !344
  tail call void @llvm.dbg.value(metadata !{double %425}, i64 0, metadata !15), !dbg !344
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !345
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !346
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !347) #3, !dbg !349
  %426 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !350, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %426}, i64 0, metadata !351) #3, !dbg !350
  %427 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !352
  %428 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !353, !tbaa !122
  %429 = sitofp i64 %428 to double, !dbg !353
  %430 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !353, !tbaa !125
  %431 = sitofp i64 %430 to double, !dbg !353
  %432 = fmul double %431, 1.000000e-06, !dbg !353
  %433 = fadd double %429, %432, !dbg !353
  store double %433, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !353, !tbaa !98
  %434 = fsub double %433, %426, !dbg !354
  store double %434, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !354, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !355
  br i1 %235, label %._crit_edge23, label %.lr.ph22, !dbg !355

.lr.ph22:                                         ; preds = %._crit_edge29
  %435 = load double* @A6, align 8, !dbg !357, !tbaa !98
  %436 = load double* @A5, align 8, !dbg !357, !tbaa !98
  %437 = load double* @A4, align 8, !dbg !357, !tbaa !98
  %438 = load double* @A3, align 8, !dbg !357, !tbaa !98
  %439 = load double* @A2, align 8, !dbg !357, !tbaa !98
  %440 = load double* @A1, align 8, !dbg !357, !tbaa !98
  %441 = load double* @one, align 8, !dbg !357, !tbaa !98
  %442 = load double* @B6, align 8, !dbg !359, !tbaa !98
  %443 = load double* @B5, align 8, !dbg !359, !tbaa !98
  %444 = load double* @B4, align 8, !dbg !359, !tbaa !98
  %445 = load double* @B3, align 8, !dbg !359, !tbaa !98
  %446 = load double* @B2, align 8, !dbg !359, !tbaa !98
  %447 = load double* @B1, align 8, !dbg !359, !tbaa !98
  %448 = insertelement <2 x double> undef, double %441, i32 0, !dbg !357
  %449 = insertelement <2 x double> %448, double %447, i32 1, !dbg !357
  %450 = insertelement <2 x double> undef, double %440, i32 0, !dbg !357
  %451 = insertelement <2 x double> %450, double %446, i32 1, !dbg !357
  %452 = insertelement <2 x double> undef, double %439, i32 0, !dbg !357
  %453 = insertelement <2 x double> %452, double %445, i32 1, !dbg !357
  %454 = insertelement <2 x double> undef, double %438, i32 0, !dbg !357
  %455 = insertelement <2 x double> %454, double %444, i32 1, !dbg !357
  %456 = insertelement <2 x double> undef, double %437, i32 0, !dbg !357
  %457 = insertelement <2 x double> %456, double %443, i32 1, !dbg !357
  br label %458, !dbg !355

; <label>:458                                     ; preds = %458, %.lr.ph22
  %i.620 = phi i64 [ 1, %.lr.ph22 ], [ %486, %458 ]
  %s.719 = phi double [ 0.000000e+00, %.lr.ph22 ], [ %485, %458 ]
  %459 = sitofp i64 %i.620 to double, !dbg !360
  %460 = fmul double %425, %459, !dbg !360
  tail call void @llvm.dbg.value(metadata !{double %460}, i64 0, metadata !12), !dbg !360
  %461 = fmul double %460, %460, !dbg !361
  tail call void @llvm.dbg.value(metadata !{double %461}, i64 0, metadata !14), !dbg !361
  %462 = fmul double %461, %435, !dbg !357
  %463 = fadd double %462, %436, !dbg !357
  tail call void @llvm.dbg.value(metadata !362, i64 0, metadata !13), !dbg !357
  %464 = insertelement <2 x double> undef, double %461, i32 0, !dbg !357
  %465 = insertelement <2 x double> %464, double %461, i32 1, !dbg !357
  %466 = insertelement <2 x double> undef, double %463, i32 0, !dbg !357
  %467 = insertelement <2 x double> %466, double %442, i32 1, !dbg !357
  %468 = fmul <2 x double> %465, %467, !dbg !357
  %469 = fadd <2 x double> %468, %457, !dbg !357
  %470 = fmul <2 x double> %469, %465, !dbg !357
  %471 = fadd <2 x double> %455, %470, !dbg !357
  %472 = fmul <2 x double> %471, %465, !dbg !357
  %473 = fadd <2 x double> %453, %472, !dbg !357
  %474 = fmul <2 x double> %473, %465, !dbg !357
  %475 = fadd <2 x double> %451, %474, !dbg !357
  %476 = fmul <2 x double> %475, %465, !dbg !357
  %477 = fadd <2 x double> %449, %476, !dbg !357
  %478 = insertelement <2 x double> undef, double %460, i32 0, !dbg !357
  %479 = insertelement <2 x double> %478, double %461, i32 1, !dbg !357
  %480 = fmul <2 x double> %479, %477, !dbg !357
  %481 = extractelement <2 x double> %480, i32 1, !dbg !359
  %482 = extractelement <2 x double> %480, i32 0, !dbg !359
  %483 = fadd double %441, %481, !dbg !359
  %484 = fdiv double %482, %483, !dbg !359
  %485 = fadd double %s.719, %484, !dbg !359
  tail call void @llvm.dbg.value(metadata !{double %485}, i64 0, metadata !10), !dbg !359
  %486 = add nsw i64 %i.620, 1, !dbg !355
  tail call void @llvm.dbg.value(metadata !{i64 %486}, i64 0, metadata !19), !dbg !355
  %487 = icmp slt i64 %i.620, %234, !dbg !355
  br i1 %487, label %458, label %._crit_edge23, !dbg !355

._crit_edge23:                                    ; preds = %458, %._crit_edge29
  %s.7.lcssa = phi double [ 0.000000e+00, %._crit_edge29 ], [ %485, %458 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !363) #3, !dbg !365
  tail call void @llvm.dbg.value(metadata !{double %433}, i64 0, metadata !366) #3, !dbg !367
  %488 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !368
  %489 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !369, !tbaa !122
  %490 = sitofp i64 %489 to double, !dbg !369
  %491 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !369, !tbaa !125
  %492 = sitofp i64 %491 to double, !dbg !369
  %493 = fmul double %492, 1.000000e-06, !dbg !369
  %494 = fadd double %490, %493, !dbg !369
  store double %494, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !369, !tbaa !98
  %495 = fsub double %494, %433, !dbg !370
  store double %495, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !370, !tbaa !98
  %496 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !371, !tbaa !98
  %497 = fmul double %496, %495, !dbg !371
  %498 = load double* @nulltime, align 8, !dbg !371, !tbaa !98
  %499 = fsub double %497, %498, !dbg !371
  store double %499, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !371, !tbaa !98
  %500 = load double* @piref, align 8, !dbg !372, !tbaa !98
  %501 = load double* @three, align 8, !dbg !372, !tbaa !98
  %502 = fdiv double %500, %501, !dbg !372
  tail call void @llvm.dbg.value(metadata !{double %502}, i64 0, metadata !12), !dbg !372
  %503 = fmul double %502, %502, !dbg !373
  tail call void @llvm.dbg.value(metadata !{double %503}, i64 0, metadata !14), !dbg !373
  %504 = load double* @A6, align 8, !dbg !374, !tbaa !98
  %505 = fmul double %504, %503, !dbg !374
  %506 = load double* @A5, align 8, !dbg !374, !tbaa !98
  %507 = fadd double %505, %506, !dbg !374
  %508 = fmul double %503, %507, !dbg !374
  %509 = load double* @A4, align 8, !dbg !374, !tbaa !98
  %510 = fadd double %509, %508, !dbg !374
  %511 = fmul double %503, %510, !dbg !374
  %512 = load double* @A3, align 8, !dbg !374, !tbaa !98
  %513 = fadd double %512, %511, !dbg !374
  %514 = fmul double %503, %513, !dbg !374
  %515 = load double* @A2, align 8, !dbg !374, !tbaa !98
  %516 = fadd double %515, %514, !dbg !374
  %517 = fmul double %503, %516, !dbg !374
  %518 = load double* @A1, align 8, !dbg !374, !tbaa !98
  %519 = fadd double %518, %517, !dbg !374
  %520 = fmul double %503, %519, !dbg !374
  %521 = load double* @one, align 8, !dbg !374, !tbaa !98
  %522 = fadd double %521, %520, !dbg !374
  %523 = fmul double %502, %522, !dbg !374
  %524 = load double* @B6, align 8, !dbg !375, !tbaa !98
  %525 = fmul double %503, %524, !dbg !375
  %526 = load double* @B5, align 8, !dbg !375, !tbaa !98
  %527 = fadd double %525, %526, !dbg !375
  %528 = fmul double %503, %527, !dbg !375
  %529 = load double* @B4, align 8, !dbg !375, !tbaa !98
  %530 = fadd double %529, %528, !dbg !375
  %531 = fmul double %503, %530, !dbg !375
  %532 = load double* @B3, align 8, !dbg !375, !tbaa !98
  %533 = fadd double %532, %531, !dbg !375
  %534 = fmul double %503, %533, !dbg !375
  %535 = load double* @B2, align 8, !dbg !375, !tbaa !98
  %536 = fadd double %535, %534, !dbg !375
  %537 = fmul double %503, %536, !dbg !375
  %538 = load double* @B1, align 8, !dbg !375, !tbaa !98
  %539 = fadd double %538, %537, !dbg !375
  %540 = fmul double %503, %539, !dbg !375
  %541 = fadd double %521, %540, !dbg !375
  %542 = fdiv double %523, %541, !dbg !376
  %543 = fdiv double %499, 2.900000e+01, !dbg !377
  store double %543, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 16), align 16, !dbg !377, !tbaa !98
  %544 = load double* @two, align 8, !dbg !378, !tbaa !98
  %545 = fmul double %s.7.lcssa, %544, !dbg !378
  %546 = fadd double %542, %545, !dbg !378
  %547 = fmul double %425, %546, !dbg !378
  %548 = fdiv double %547, %544, !dbg !378
  store double %548, double* @sa, align 8, !dbg !378, !tbaa !98
  store double 0x3FE62E42FEFA39EF, double* @sb, align 8, !dbg !379, !tbaa !98
  %549 = fadd double %548, 0xBFE62E42FEFA39EF, !dbg !380
  store double %549, double* @sc, align 8, !dbg !380, !tbaa !98
  %550 = fdiv double %521, %543, !dbg !381
  store double %550, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 17), align 8, !dbg !381, !tbaa !98
  %551 = fmul double %549, 1.000000e-30, !dbg !382
  %552 = fmul double %499, 1.000000e-30, !dbg !382
  %553 = fmul double %550, 1.000000e-30, !dbg !382
  %554 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i64 0, i64 0), double %551, double %552, double %553) #3, !dbg !382
  %555 = load double* @piref, align 8, !dbg !383, !tbaa !98
  %556 = load double* @four, align 8, !dbg !383, !tbaa !98
  %557 = fmul double %222, %556, !dbg !383
  %558 = fdiv double %555, %557, !dbg !383
  tail call void @llvm.dbg.value(metadata !{double %558}, i64 0, metadata !15), !dbg !383
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !384
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !385
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !386) #3, !dbg !388
  %559 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !389, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %559}, i64 0, metadata !390) #3, !dbg !389
  %560 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !391
  %561 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !392, !tbaa !122
  %562 = sitofp i64 %561 to double, !dbg !392
  %563 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !392, !tbaa !125
  %564 = sitofp i64 %563 to double, !dbg !392
  %565 = fmul double %564, 1.000000e-06, !dbg !392
  %566 = fadd double %562, %565, !dbg !392
  store double %566, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !392, !tbaa !98
  %567 = fsub double %566, %559, !dbg !393
  store double %567, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !393, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !394
  br i1 %235, label %._crit_edge17, label %.lr.ph16, !dbg !394

.lr.ph16:                                         ; preds = %._crit_edge23
  %568 = load double* @A6, align 8, !dbg !396, !tbaa !98
  %569 = load double* @A5, align 8, !dbg !396, !tbaa !98
  %570 = load double* @A4, align 8, !dbg !396, !tbaa !98
  %571 = load double* @A3, align 8, !dbg !396, !tbaa !98
  %572 = load double* @A2, align 8, !dbg !396, !tbaa !98
  %573 = load double* @A1, align 8, !dbg !396, !tbaa !98
  %574 = load double* @one, align 8, !dbg !396, !tbaa !98
  %575 = load double* @B6, align 8, !dbg !398, !tbaa !98
  %576 = load double* @B5, align 8, !dbg !398, !tbaa !98
  %577 = load double* @B4, align 8, !dbg !398, !tbaa !98
  %578 = load double* @B3, align 8, !dbg !398, !tbaa !98
  %579 = load double* @B2, align 8, !dbg !398, !tbaa !98
  %580 = load double* @B1, align 8, !dbg !398, !tbaa !98
  %581 = insertelement <2 x double> undef, double %574, i32 0, !dbg !396
  %582 = insertelement <2 x double> %581, double %580, i32 1, !dbg !396
  %583 = insertelement <2 x double> undef, double %573, i32 0, !dbg !396
  %584 = insertelement <2 x double> %583, double %579, i32 1, !dbg !396
  %585 = insertelement <2 x double> undef, double %572, i32 0, !dbg !396
  %586 = insertelement <2 x double> %585, double %578, i32 1, !dbg !396
  %587 = insertelement <2 x double> undef, double %571, i32 0, !dbg !396
  %588 = insertelement <2 x double> %587, double %577, i32 1, !dbg !396
  %589 = insertelement <2 x double> undef, double %570, i32 0, !dbg !396
  %590 = insertelement <2 x double> %589, double %576, i32 1, !dbg !396
  br label %591, !dbg !394

; <label>:591                                     ; preds = %591, %.lr.ph16
  %i.714 = phi i64 [ 1, %.lr.ph16 ], [ %619, %591 ]
  %s.813 = phi double [ 0.000000e+00, %.lr.ph16 ], [ %618, %591 ]
  %592 = sitofp i64 %i.714 to double, !dbg !399
  %593 = fmul double %558, %592, !dbg !399
  tail call void @llvm.dbg.value(metadata !{double %593}, i64 0, metadata !12), !dbg !399
  %594 = fmul double %593, %593, !dbg !400
  tail call void @llvm.dbg.value(metadata !{double %594}, i64 0, metadata !14), !dbg !400
  %595 = fmul double %594, %568, !dbg !396
  %596 = fadd double %595, %569, !dbg !396
  tail call void @llvm.dbg.value(metadata !362, i64 0, metadata !13), !dbg !396
  %597 = insertelement <2 x double> undef, double %594, i32 0, !dbg !396
  %598 = insertelement <2 x double> %597, double %594, i32 1, !dbg !396
  %599 = insertelement <2 x double> undef, double %596, i32 0, !dbg !396
  %600 = insertelement <2 x double> %599, double %575, i32 1, !dbg !396
  %601 = fmul <2 x double> %598, %600, !dbg !396
  %602 = fadd <2 x double> %601, %590, !dbg !396
  %603 = fmul <2 x double> %602, %598, !dbg !396
  %604 = fadd <2 x double> %588, %603, !dbg !396
  %605 = fmul <2 x double> %604, %598, !dbg !396
  %606 = fadd <2 x double> %586, %605, !dbg !396
  %607 = fmul <2 x double> %606, %598, !dbg !396
  %608 = fadd <2 x double> %584, %607, !dbg !396
  %609 = fmul <2 x double> %608, %598, !dbg !396
  %610 = fadd <2 x double> %582, %609, !dbg !396
  %611 = insertelement <2 x double> undef, double %593, i32 0, !dbg !396
  %612 = insertelement <2 x double> %611, double %594, i32 1, !dbg !396
  %613 = fmul <2 x double> %612, %610, !dbg !396
  %614 = extractelement <2 x double> %613, i32 1, !dbg !398
  %615 = extractelement <2 x double> %613, i32 0, !dbg !398
  %616 = fadd double %574, %614, !dbg !398
  %617 = fmul double %615, %616, !dbg !398
  %618 = fadd double %s.813, %617, !dbg !398
  tail call void @llvm.dbg.value(metadata !{double %618}, i64 0, metadata !10), !dbg !398
  %619 = add nsw i64 %i.714, 1, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i64 %619}, i64 0, metadata !19), !dbg !394
  %620 = icmp slt i64 %i.714, %234, !dbg !394
  br i1 %620, label %591, label %._crit_edge17, !dbg !394

._crit_edge17:                                    ; preds = %591, %._crit_edge23
  %s.8.lcssa = phi double [ 0.000000e+00, %._crit_edge23 ], [ %618, %591 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !401) #3, !dbg !403
  tail call void @llvm.dbg.value(metadata !{double %566}, i64 0, metadata !404) #3, !dbg !405
  %621 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !406
  %622 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !407, !tbaa !122
  %623 = sitofp i64 %622 to double, !dbg !407
  %624 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !407, !tbaa !125
  %625 = sitofp i64 %624 to double, !dbg !407
  %626 = fmul double %625, 1.000000e-06, !dbg !407
  %627 = fadd double %623, %626, !dbg !407
  store double %627, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !407, !tbaa !98
  %628 = fsub double %627, %566, !dbg !408
  store double %628, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !408, !tbaa !98
  %629 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !409, !tbaa !98
  %630 = fmul double %629, %628, !dbg !409
  %631 = load double* @nulltime, align 8, !dbg !409, !tbaa !98
  %632 = fsub double %630, %631, !dbg !409
  store double %632, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !409, !tbaa !98
  %633 = load double* @piref, align 8, !dbg !410, !tbaa !98
  %634 = load double* @four, align 8, !dbg !410, !tbaa !98
  %635 = fdiv double %633, %634, !dbg !410
  tail call void @llvm.dbg.value(metadata !{double %635}, i64 0, metadata !12), !dbg !410
  %636 = fmul double %635, %635, !dbg !411
  tail call void @llvm.dbg.value(metadata !{double %636}, i64 0, metadata !14), !dbg !411
  %637 = load double* @A6, align 8, !dbg !412, !tbaa !98
  %638 = fmul double %637, %636, !dbg !412
  %639 = load double* @A5, align 8, !dbg !412, !tbaa !98
  %640 = fadd double %638, %639, !dbg !412
  %641 = fmul double %636, %640, !dbg !412
  %642 = load double* @A4, align 8, !dbg !412, !tbaa !98
  %643 = fadd double %642, %641, !dbg !412
  %644 = fmul double %636, %643, !dbg !412
  %645 = load double* @A3, align 8, !dbg !412, !tbaa !98
  %646 = fadd double %645, %644, !dbg !412
  %647 = fmul double %636, %646, !dbg !412
  %648 = load double* @A2, align 8, !dbg !412, !tbaa !98
  %649 = fadd double %648, %647, !dbg !412
  %650 = fmul double %636, %649, !dbg !412
  %651 = load double* @A1, align 8, !dbg !412, !tbaa !98
  %652 = fadd double %651, %650, !dbg !412
  %653 = fmul double %636, %652, !dbg !412
  %654 = load double* @one, align 8, !dbg !412, !tbaa !98
  %655 = fadd double %654, %653, !dbg !412
  %656 = fmul double %635, %655, !dbg !412
  %657 = load double* @B6, align 8, !dbg !413, !tbaa !98
  %658 = fmul double %636, %657, !dbg !413
  %659 = load double* @B5, align 8, !dbg !413, !tbaa !98
  %660 = fadd double %658, %659, !dbg !413
  %661 = fmul double %636, %660, !dbg !413
  %662 = load double* @B4, align 8, !dbg !413, !tbaa !98
  %663 = fadd double %662, %661, !dbg !413
  %664 = fmul double %636, %663, !dbg !413
  %665 = load double* @B3, align 8, !dbg !413, !tbaa !98
  %666 = fadd double %665, %664, !dbg !413
  %667 = fmul double %636, %666, !dbg !413
  %668 = load double* @B2, align 8, !dbg !413, !tbaa !98
  %669 = fadd double %668, %667, !dbg !413
  %670 = fmul double %636, %669, !dbg !413
  %671 = load double* @B1, align 8, !dbg !413, !tbaa !98
  %672 = fadd double %671, %670, !dbg !413
  %673 = fmul double %636, %672, !dbg !413
  %674 = fadd double %654, %673, !dbg !413
  %675 = fmul double %656, %674, !dbg !414
  %676 = fdiv double %632, 2.900000e+01, !dbg !415
  store double %676, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 19), align 8, !dbg !415, !tbaa !98
  %677 = load double* @two, align 8, !dbg !416, !tbaa !98
  %678 = fmul double %s.8.lcssa, %677, !dbg !416
  %679 = fadd double %675, %678, !dbg !416
  %680 = fmul double %558, %679, !dbg !416
  %681 = fdiv double %680, %677, !dbg !416
  store double %681, double* @sa, align 8, !dbg !416, !tbaa !98
  store double 2.500000e-01, double* @sb, align 8, !dbg !417, !tbaa !98
  %682 = fadd double %681, -2.500000e-01, !dbg !418
  store double %682, double* @sc, align 8, !dbg !418, !tbaa !98
  %683 = fdiv double %654, %676, !dbg !419
  store double %683, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 20), align 16, !dbg !419, !tbaa !98
  %684 = fmul double %682, 1.000000e-30, !dbg !420
  %685 = fmul double %632, 1.000000e-30, !dbg !420
  %686 = fmul double %683, 1.000000e-30, !dbg !420
  %687 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str9, i64 0, i64 0), double %684, double %685, double %686) #3, !dbg !420
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !421
  %688 = load double* @one, align 8, !dbg !422, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %688}, i64 0, metadata !14), !dbg !422
  store double 0x40599541F7F192A4, double* @sa, align 8, !dbg !423, !tbaa !98
  %689 = fdiv double 0x40599541F7F192A4, %222, !dbg !424
  tail call void @llvm.dbg.value(metadata !{double %689}, i64 0, metadata !13), !dbg !424
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !425) #3, !dbg !427
  %690 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !428, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %690}, i64 0, metadata !429) #3, !dbg !428
  %691 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !430
  %692 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !431, !tbaa !122
  %693 = sitofp i64 %692 to double, !dbg !431
  %694 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !431, !tbaa !125
  %695 = sitofp i64 %694 to double, !dbg !431
  %696 = fmul double %695, 1.000000e-06, !dbg !431
  %697 = fadd double %693, %696, !dbg !431
  store double %697, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !431, !tbaa !98
  %698 = fsub double %697, %690, !dbg !432
  store double %698, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !432, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !433
  br i1 %235, label %._crit_edge11, label %.lr.ph10, !dbg !433

.lr.ph10:                                         ; preds = %._crit_edge17, %.lr.ph10
  %i.88 = phi i64 [ %712, %.lr.ph10 ], [ 1, %._crit_edge17 ]
  %s.97 = phi double [ %711, %.lr.ph10 ], [ 0.000000e+00, %._crit_edge17 ]
  %699 = sitofp i64 %i.88 to double, !dbg !435
  %700 = fmul double %689, %699, !dbg !435
  tail call void @llvm.dbg.value(metadata !{double %700}, i64 0, metadata !15), !dbg !435
  %701 = fmul double %700, %700, !dbg !437
  tail call void @llvm.dbg.value(metadata !{double %701}, i64 0, metadata !12), !dbg !437
  %702 = fadd double %688, %700, !dbg !438
  %703 = fdiv double %688, %702, !dbg !438
  %704 = fsub double %s.97, %703, !dbg !438
  %705 = fadd double %688, %701, !dbg !438
  %706 = fdiv double %700, %705, !dbg !438
  %707 = fsub double %704, %706, !dbg !438
  %708 = fmul double %700, %701, !dbg !438
  %709 = fadd double %688, %708, !dbg !438
  %710 = fdiv double %701, %709, !dbg !438
  %711 = fsub double %707, %710, !dbg !438
  tail call void @llvm.dbg.value(metadata !{double %711}, i64 0, metadata !10), !dbg !438
  %712 = add nsw i64 %i.88, 1, !dbg !433
  tail call void @llvm.dbg.value(metadata !{i64 %712}, i64 0, metadata !19), !dbg !433
  %713 = icmp slt i64 %i.88, %234, !dbg !433
  br i1 %713, label %.lr.ph10, label %._crit_edge11, !dbg !433

._crit_edge11:                                    ; preds = %.lr.ph10, %._crit_edge17
  %s.9.lcssa = phi double [ 0.000000e+00, %._crit_edge17 ], [ %711, %.lr.ph10 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !439) #3, !dbg !441
  tail call void @llvm.dbg.value(metadata !{double %697}, i64 0, metadata !442) #3, !dbg !443
  %714 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !444
  %715 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !445, !tbaa !122
  %716 = sitofp i64 %715 to double, !dbg !445
  %717 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !445, !tbaa !125
  %718 = sitofp i64 %717 to double, !dbg !445
  %719 = fmul double %718, 1.000000e-06, !dbg !445
  %720 = fadd double %716, %719, !dbg !445
  store double %720, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !445, !tbaa !98
  %721 = fsub double %720, %697, !dbg !446
  store double %721, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !446, !tbaa !98
  %722 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !447, !tbaa !98
  %723 = fmul double %722, %721, !dbg !447
  %724 = load double* @nulltime, align 8, !dbg !447, !tbaa !98
  %725 = fsub double %723, %724, !dbg !447
  store double %725, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !447, !tbaa !98
  %726 = fdiv double %725, 1.200000e+01, !dbg !448
  store double %726, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 22), align 16, !dbg !448, !tbaa !98
  %727 = load double* @sa, align 8, !dbg !449, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %727}, i64 0, metadata !15), !dbg !449
  %728 = fmul double %727, %727, !dbg !450
  tail call void @llvm.dbg.value(metadata !{double %728}, i64 0, metadata !12), !dbg !450
  %729 = fsub double -0.000000e+00, %688, !dbg !451
  %730 = fadd double %688, %727, !dbg !451
  %731 = fdiv double %688, %730, !dbg !451
  %732 = fsub double %729, %731, !dbg !451
  %733 = fadd double %688, %728, !dbg !451
  %734 = fdiv double %727, %733, !dbg !451
  %735 = fsub double %732, %734, !dbg !451
  %736 = fmul double %727, %728, !dbg !451
  %737 = fadd double %688, %736, !dbg !451
  %738 = fdiv double %728, %737, !dbg !451
  %739 = fsub double %735, %738, !dbg !451
  %740 = fmul double %689, 1.800000e+01, !dbg !452
  %741 = load double* @two, align 8, !dbg !452, !tbaa !98
  %742 = fmul double %s.9.lcssa, %741, !dbg !452
  %743 = fadd double %739, %742, !dbg !452
  %744 = fmul double %740, %743, !dbg !452
  store double %744, double* @sa, align 8, !dbg !452, !tbaa !98
  %745 = fptosi double %744 to i64, !dbg !453
  %746 = mul nsw i64 %745, -2000, !dbg !453
  tail call void @llvm.dbg.value(metadata !{i64 %746}, i64 0, metadata !20), !dbg !453
  %747 = sitofp i64 %746 to double, !dbg !454
  %748 = load double* @scale, align 8, !dbg !454, !tbaa !98
  %749 = fdiv double %747, %748, !dbg !454
  %750 = fptosi double %749 to i64, !dbg !454
  tail call void @llvm.dbg.value(metadata !{i64 %750}, i64 0, metadata !20), !dbg !454
  %751 = fadd double %744, 5.002000e+02, !dbg !455
  store double %751, double* @sc, align 8, !dbg !455, !tbaa !98
  %752 = load double* @one, align 8, !dbg !456, !tbaa !98
  %753 = fdiv double %752, %726, !dbg !456
  store double %753, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 23), align 8, !dbg !456, !tbaa !98
  %754 = fmul double %751, 1.000000e-30, !dbg !457
  %755 = fmul double %725, 1.000000e-30, !dbg !457
  %756 = fmul double %753, 1.000000e-30, !dbg !457
  %757 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str10, i64 0, i64 0), double %754, double %755, double %756) #3, !dbg !457
  %758 = load double* @piref, align 8, !dbg !458, !tbaa !98
  %759 = load double* @three, align 8, !dbg !458, !tbaa !98
  %760 = sitofp i64 %750 to double, !dbg !458
  %761 = fmul double %760, %759, !dbg !458
  %762 = fdiv double %758, %761, !dbg !458
  tail call void @llvm.dbg.value(metadata !{double %762}, i64 0, metadata !15), !dbg !458
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !10), !dbg !459
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !13), !dbg !460
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !461) #3, !dbg !463
  %763 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !464, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %763}, i64 0, metadata !465) #3, !dbg !464
  %764 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !466
  %765 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !467, !tbaa !122
  %766 = sitofp i64 %765 to double, !dbg !467
  %767 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !467, !tbaa !125
  %768 = sitofp i64 %767 to double, !dbg !467
  %769 = fmul double %768, 1.000000e-06, !dbg !467
  %770 = fadd double %766, %769, !dbg !467
  store double %770, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !467, !tbaa !98
  %771 = fsub double %770, %763, !dbg !468
  store double %771, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !468, !tbaa !98
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !19), !dbg !469
  %772 = add nsw i64 %750, -1, !dbg !469
  %773 = icmp slt i64 %750, 2, !dbg !469
  br i1 %773, label %._crit_edge, label %.lr.ph, !dbg !469

.lr.ph:                                           ; preds = %._crit_edge11
  %774 = load double* @B6, align 8, !dbg !471, !tbaa !98
  %775 = load double* @B5, align 8, !dbg !471, !tbaa !98
  %776 = load double* @B4, align 8, !dbg !471, !tbaa !98
  %777 = load double* @B3, align 8, !dbg !471, !tbaa !98
  %778 = load double* @B2, align 8, !dbg !471, !tbaa !98
  %779 = load double* @B1, align 8, !dbg !471, !tbaa !98
  %780 = load double* @one, align 8, !dbg !471, !tbaa !98
  %781 = load double* @A6, align 8, !dbg !473, !tbaa !98
  %782 = load double* @A5, align 8, !dbg !473, !tbaa !98
  %783 = load double* @A4, align 8, !dbg !473, !tbaa !98
  %784 = load double* @A3, align 8, !dbg !473, !tbaa !98
  %785 = load double* @A2, align 8, !dbg !473, !tbaa !98
  %786 = load double* @A1, align 8, !dbg !473, !tbaa !98
  br label %787, !dbg !469

; <label>:787                                     ; preds = %787, %.lr.ph
  %i.96 = phi i64 [ 1, %.lr.ph ], [ %819, %787 ]
  %s.105 = phi double [ 0.000000e+00, %.lr.ph ], [ %818, %787 ]
  %788 = sitofp i64 %i.96 to double, !dbg !474
  %789 = fmul double %762, %788, !dbg !474
  tail call void @llvm.dbg.value(metadata !{double %789}, i64 0, metadata !12), !dbg !474
  %790 = fmul double %789, %789, !dbg !475
  tail call void @llvm.dbg.value(metadata !{double %790}, i64 0, metadata !14), !dbg !475
  %791 = fmul double %790, %774, !dbg !471
  %792 = fadd double %791, %775, !dbg !471
  %793 = fmul double %790, %792, !dbg !471
  %794 = fadd double %776, %793, !dbg !471
  %795 = fmul double %790, %794, !dbg !471
  %796 = fadd double %777, %795, !dbg !471
  %797 = fmul double %790, %796, !dbg !471
  %798 = fadd double %778, %797, !dbg !471
  %799 = fmul double %790, %798, !dbg !471
  %800 = fadd double %779, %799, !dbg !471
  %801 = fmul double %790, %800, !dbg !471
  %802 = fadd double %780, %801, !dbg !471
  tail call void @llvm.dbg.value(metadata !{double %802}, i64 0, metadata !13), !dbg !471
  %803 = fmul double %802, %802, !dbg !473
  %804 = fmul double %789, %803, !dbg !473
  %805 = fmul double %790, %781, !dbg !473
  %806 = fadd double %805, %782, !dbg !473
  %807 = fmul double %790, %806, !dbg !473
  %808 = fadd double %783, %807, !dbg !473
  %809 = fmul double %790, %808, !dbg !473
  %810 = fadd double %784, %809, !dbg !473
  %811 = fmul double %790, %810, !dbg !473
  %812 = fadd double %785, %811, !dbg !473
  %813 = fmul double %790, %812, !dbg !473
  %814 = fadd double %786, %813, !dbg !473
  %815 = fmul double %790, %814, !dbg !473
  %816 = fadd double %780, %815, !dbg !473
  %817 = fmul double %804, %816, !dbg !473
  %818 = fadd double %s.105, %817, !dbg !473
  tail call void @llvm.dbg.value(metadata !{double %818}, i64 0, metadata !10), !dbg !473
  %819 = add nsw i64 %i.96, 1, !dbg !469
  tail call void @llvm.dbg.value(metadata !{i64 %819}, i64 0, metadata !19), !dbg !469
  %820 = icmp slt i64 %i.96, %772, !dbg !469
  br i1 %820, label %787, label %._crit_edge, !dbg !469

._crit_edge:                                      ; preds = %787, %._crit_edge11
  %s.10.lcssa = phi double [ 0.000000e+00, %._crit_edge11 ], [ %818, %787 ]
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !476) #3, !dbg !478
  tail call void @llvm.dbg.value(metadata !{double %770}, i64 0, metadata !479) #3, !dbg !480
  %821 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !481
  %822 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !482, !tbaa !122
  %823 = sitofp i64 %822 to double, !dbg !482
  %824 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !482, !tbaa !125
  %825 = sitofp i64 %824 to double, !dbg !482
  %826 = fmul double %825, 1.000000e-06, !dbg !482
  %827 = fadd double %823, %826, !dbg !482
  store double %827, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 2), align 16, !dbg !482, !tbaa !98
  %828 = fsub double %827, %770, !dbg !483
  store double %828, double* getelementptr inbounds ([3 x double]* @TimeArray, i64 0, i64 1), align 8, !dbg !483, !tbaa !98
  %829 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !484, !tbaa !98
  %830 = fmul double %829, %828, !dbg !484
  %831 = load double* @nulltime, align 8, !dbg !484, !tbaa !98
  %832 = fsub double %830, %831, !dbg !484
  store double %832, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !484, !tbaa !98
  %833 = load double* @piref, align 8, !dbg !485, !tbaa !98
  %834 = load double* @three, align 8, !dbg !485, !tbaa !98
  %835 = fdiv double %833, %834, !dbg !485
  tail call void @llvm.dbg.value(metadata !{double %835}, i64 0, metadata !12), !dbg !485
  %836 = fmul double %835, %835, !dbg !486
  tail call void @llvm.dbg.value(metadata !{double %836}, i64 0, metadata !14), !dbg !486
  %837 = load double* @A6, align 8, !dbg !487, !tbaa !98
  %838 = fmul double %837, %836, !dbg !487
  %839 = load double* @A5, align 8, !dbg !487, !tbaa !98
  %840 = fadd double %838, %839, !dbg !487
  %841 = fmul double %836, %840, !dbg !487
  %842 = load double* @A4, align 8, !dbg !487, !tbaa !98
  %843 = fadd double %842, %841, !dbg !487
  %844 = fmul double %836, %843, !dbg !487
  %845 = load double* @A3, align 8, !dbg !487, !tbaa !98
  %846 = fadd double %845, %844, !dbg !487
  %847 = fmul double %836, %846, !dbg !487
  %848 = load double* @A2, align 8, !dbg !487, !tbaa !98
  %849 = fadd double %848, %847, !dbg !487
  %850 = fmul double %836, %849, !dbg !487
  %851 = load double* @A1, align 8, !dbg !487, !tbaa !98
  %852 = fadd double %851, %850, !dbg !487
  %853 = fmul double %836, %852, !dbg !487
  %854 = load double* @one, align 8, !dbg !487, !tbaa !98
  %855 = fadd double %854, %853, !dbg !487
  %856 = fmul double %835, %855, !dbg !487
  %857 = load double* @B6, align 8, !dbg !488, !tbaa !98
  %858 = fmul double %836, %857, !dbg !488
  %859 = load double* @B5, align 8, !dbg !488, !tbaa !98
  %860 = fadd double %858, %859, !dbg !488
  %861 = fmul double %836, %860, !dbg !488
  %862 = load double* @B4, align 8, !dbg !488, !tbaa !98
  %863 = fadd double %862, %861, !dbg !488
  %864 = fmul double %836, %863, !dbg !488
  %865 = load double* @B3, align 8, !dbg !488, !tbaa !98
  %866 = fadd double %865, %864, !dbg !488
  %867 = fmul double %836, %866, !dbg !488
  %868 = load double* @B2, align 8, !dbg !488, !tbaa !98
  %869 = fadd double %868, %867, !dbg !488
  %870 = fmul double %836, %869, !dbg !488
  %871 = load double* @B1, align 8, !dbg !488, !tbaa !98
  %872 = fadd double %871, %870, !dbg !488
  %873 = fmul double %836, %872, !dbg !488
  %874 = fadd double %854, %873, !dbg !488
  %875 = fmul double %856, %874, !dbg !489
  %876 = fmul double %874, %875, !dbg !489
  %877 = fdiv double %832, 3.000000e+01, !dbg !490
  store double %877, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 25), align 8, !dbg !490, !tbaa !98
  %878 = load double* @two, align 8, !dbg !491, !tbaa !98
  %879 = fmul double %s.10.lcssa, %878, !dbg !491
  %880 = fadd double %876, %879, !dbg !491
  %881 = fmul double %762, %880, !dbg !491
  %882 = fdiv double %881, %878, !dbg !491
  store double %882, double* @sa, align 8, !dbg !491, !tbaa !98
  store double 0x3FD2AAAAAAAAAAAB, double* @sb, align 8, !dbg !492, !tbaa !98
  %883 = fadd double %882, 0xBFD2AAAAAAAAAAAB, !dbg !493
  store double %883, double* @sc, align 8, !dbg !493, !tbaa !98
  %884 = fdiv double %854, %877, !dbg !494
  store double %884, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 26), align 16, !dbg !494, !tbaa !98
  %885 = fmul double %883, 1.000000e-30, !dbg !495
  %886 = fmul double %832, 1.000000e-30, !dbg !495
  %887 = fmul double %884, 1.000000e-30, !dbg !495
  %888 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i64 0, i64 0), double %885, double %886, double %887) #3, !dbg !495
  %889 = load double* @five, align 8, !dbg !496, !tbaa !98
  %890 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 6), align 16, !dbg !496, !tbaa !98
  %891 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 5), align 8, !dbg !496, !tbaa !98
  %892 = fsub double %890, %891, !dbg !496
  %893 = fmul double %889, %892, !dbg !496
  %894 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 9), align 8, !dbg !496, !tbaa !98
  %895 = fadd double %894, %893, !dbg !496
  %896 = fdiv double %895, 5.200000e+01, !dbg !496
  store double %896, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 27), align 8, !dbg !496, !tbaa !98
  %897 = load double* @one, align 8, !dbg !497, !tbaa !98
  %898 = fdiv double %897, %896, !dbg !497
  store double %898, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !497, !tbaa !98
  %899 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 2), align 16, !dbg !498, !tbaa !98
  %900 = fadd double %899, %894, !dbg !498
  %901 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 12), align 16, !dbg !498, !tbaa !98
  %902 = fadd double %900, %901, !dbg !498
  %903 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 15), align 8, !dbg !498, !tbaa !98
  %904 = fadd double %902, %903, !dbg !498
  %905 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 18), align 16, !dbg !498, !tbaa !98
  %906 = fadd double %904, %905, !dbg !498
  %907 = load double* @four, align 8, !dbg !499, !tbaa !98
  %908 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 21), align 8, !dbg !499, !tbaa !98
  %909 = fmul double %907, %908, !dbg !499
  %910 = fadd double %906, %909, !dbg !499
  %911 = fdiv double %910, 1.520000e+02, !dbg !499
  store double %911, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 29), align 8, !dbg !499, !tbaa !98
  %912 = fdiv double %897, %911, !dbg !500
  store double %912, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !500, !tbaa !98
  %913 = fadd double %906, %908, !dbg !501
  %914 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 24), align 16, !dbg !501, !tbaa !98
  %915 = fadd double %913, %914, !dbg !501
  %916 = fdiv double %915, 1.460000e+02, !dbg !501
  store double %916, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 31), align 8, !dbg !501, !tbaa !98
  %917 = fdiv double %897, %916, !dbg !502
  store double %917, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !502, !tbaa !98
  %918 = fadd double %894, %901, !dbg !503
  %919 = fadd double %918, %905, !dbg !503
  %920 = fadd double %919, %914, !dbg !503
  %921 = fdiv double %920, 9.100000e+01, !dbg !503
  store double %921, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 33), align 8, !dbg !503, !tbaa !98
  %922 = fdiv double %897, %921, !dbg !504
  store double %922, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !504, !tbaa !98
  %putchar3 = tail call i32 @putchar(i32 10) #3, !dbg !505
  %923 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 %750) #3, !dbg !506
  %924 = load double* @nulltime, align 8, !dbg !507, !tbaa !98
  %925 = fmul double %924, 1.000000e-30, !dbg !507
  %926 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str13, i64 0, i64 0), double %925) #3, !dbg !507
  %927 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 28), align 16, !dbg !508, !tbaa !98
  %928 = fmul double %927, 1.000000e-30, !dbg !508
  %929 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str14, i64 0, i64 0), double %928) #3, !dbg !508
  %930 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 30), align 16, !dbg !509, !tbaa !98
  %931 = fmul double %930, 1.000000e-30, !dbg !509
  %932 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str15, i64 0, i64 0), double %931) #3, !dbg !509
  %933 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 32), align 16, !dbg !510, !tbaa !98
  %934 = fmul double %933, 1.000000e-30, !dbg !510
  %935 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i64 0, i64 0), double %934) #3, !dbg !510
  %936 = load double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 34), align 16, !dbg !511, !tbaa !98
  %937 = fmul double %936, 1.000000e-30, !dbg !511
  %938 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i64 0, i64 0), double %937) #3, !dbg !511
  ret i32 0, !dbg !512
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @dtime(double* nocapture %p) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %p}, i64 0, metadata !27), !dbg !513
  %1 = getelementptr inbounds double* %p, i64 2, !dbg !514
  %2 = load double* %1, align 8, !dbg !514, !tbaa !98
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !28), !dbg !514
  %3 = tail call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #3, !dbg !515
  %4 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 0), align 8, !dbg !516, !tbaa !122
  %5 = sitofp i64 %4 to double, !dbg !516
  %6 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i64 0, i32 1), align 8, !dbg !516, !tbaa !125
  %7 = sitofp i64 %6 to double, !dbg !516
  %8 = fmul double %7, 1.000000e-06, !dbg !516
  %9 = fadd double %5, %8, !dbg !516
  store double %9, double* %1, align 8, !dbg !516, !tbaa !98
  %10 = fsub double %9, %2, !dbg !517
  %11 = getelementptr inbounds double* %p, i64 1, !dbg !517
  store double %10, double* %11, align 8, !dbg !517, !tbaa !98
  ret i32 0, !dbg !518
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
!114 = metadata !{null}
!115 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [p] [line 987]
!116 = metadata !{i32 226, i32 0, metadata !4, null}
!117 = metadata !{i32 987, i32 0, metadata !22, metadata !116}
!118 = metadata !{i32 991, i32 0, metadata !22, metadata !116}
!119 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !116} ; [ DW_TAG_auto_variable ] [q] [line 989]
!120 = metadata !{i32 993, i32 0, metadata !22, metadata !116}
!121 = metadata !{i32 994, i32 0, metadata !22, metadata !116}
!122 = metadata !{metadata !123, metadata !124, i64 0}
!123 = metadata !{metadata !"timeval", metadata !124, i64 0, metadata !124, i64 8}
!124 = metadata !{metadata !"long", metadata !100, i64 0}
!125 = metadata !{metadata !123, metadata !124, i64 8}
!126 = metadata !{i32 995, i32 0, metadata !22, metadata !116}
!127 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !128} ; [ DW_TAG_arg_variable ] [p] [line 987]
!128 = metadata !{i32 227, i32 0, metadata !4, null}
!129 = metadata !{i32 987, i32 0, metadata !22, metadata !128}
!130 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !128} ; [ DW_TAG_auto_variable ] [q] [line 989]
!131 = metadata !{i32 991, i32 0, metadata !22, metadata !128}
!132 = metadata !{i32 993, i32 0, metadata !22, metadata !128}
!133 = metadata !{i32 994, i32 0, metadata !22, metadata !128}
!134 = metadata !{i32 995, i32 0, metadata !22, metadata !128}
!135 = metadata !{i32 237, i32 0, metadata !4, null}
!136 = metadata !{i32 238, i32 0, metadata !4, null}
!137 = metadata !{i32 240, i32 0, metadata !4, null}
!138 = metadata !{i32 242, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !4, i32 241, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!140 = metadata !{i32 243, i32 0, metadata !139, null}
!141 = metadata !{double 0.000000e+00}
!142 = metadata !{i32 244, i32 0, metadata !139, null}
!143 = metadata !{i32 245, i32 0, metadata !139, null}
!144 = metadata !{i32 246, i32 0, metadata !139, null}
!145 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [p] [line 987]
!146 = metadata !{i32 248, i32 0, metadata !139, null}
!147 = metadata !{i32 987, i32 0, metadata !22, metadata !146}
!148 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !146} ; [ DW_TAG_auto_variable ] [q] [line 989]
!149 = metadata !{i32 991, i32 0, metadata !22, metadata !146}
!150 = metadata !{i32 993, i32 0, metadata !22, metadata !146}
!151 = metadata !{i32 994, i32 0, metadata !22, metadata !146}
!152 = metadata !{i32 995, i32 0, metadata !22, metadata !146}
!153 = metadata !{i64 1}
!154 = metadata !{i32 249, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !139, i32 249, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!156 = metadata !{i32 253, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !155, i32 250, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!158 = metadata !{i32 251, i32 0, metadata !157, null}
!159 = metadata !{i32 252, i32 0, metadata !157, null}
!160 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !161} ; [ DW_TAG_arg_variable ] [p] [line 987]
!161 = metadata !{i32 255, i32 0, metadata !139, null}
!162 = metadata !{i32 987, i32 0, metadata !22, metadata !161}
!163 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !161} ; [ DW_TAG_auto_variable ] [q] [line 989]
!164 = metadata !{i32 991, i32 0, metadata !22, metadata !161}
!165 = metadata !{i32 993, i32 0, metadata !22, metadata !161}
!166 = metadata !{i32 994, i32 0, metadata !22, metadata !161}
!167 = metadata !{i32 995, i32 0, metadata !22, metadata !161}
!168 = metadata !{i32 256, i32 0, metadata !139, null}
!169 = metadata !{i32 258, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !139, i32 258, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!171 = metadata !{i32 264, i32 0, metadata !4, null}
!172 = metadata !{i32 266, i32 0, metadata !4, null}
!173 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !174} ; [ DW_TAG_arg_variable ] [p] [line 987]
!174 = metadata !{i32 271, i32 0, metadata !4, null}
!175 = metadata !{i32 987, i32 0, metadata !22, metadata !174}
!176 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !174} ; [ DW_TAG_auto_variable ] [q] [line 989]
!177 = metadata !{i32 991, i32 0, metadata !22, metadata !174}
!178 = metadata !{i32 993, i32 0, metadata !22, metadata !174}
!179 = metadata !{i32 994, i32 0, metadata !22, metadata !174}
!180 = metadata !{i32 995, i32 0, metadata !22, metadata !174}
!181 = metadata !{i32 272, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !4, i32 272, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!183 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !184} ; [ DW_TAG_arg_variable ] [p] [line 987]
!184 = metadata !{i32 275, i32 0, metadata !4, null}
!185 = metadata !{i32 987, i32 0, metadata !22, metadata !184}
!186 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !184} ; [ DW_TAG_auto_variable ] [q] [line 989]
!187 = metadata !{i32 991, i32 0, metadata !22, metadata !184}
!188 = metadata !{i32 993, i32 0, metadata !22, metadata !184}
!189 = metadata !{i32 994, i32 0, metadata !22, metadata !184}
!190 = metadata !{i32 995, i32 0, metadata !22, metadata !184}
!191 = metadata !{i32 276, i32 0, metadata !4, null}
!192 = metadata !{i32 277, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!194 = metadata !{i32 279, i32 0, metadata !4, null}
!195 = metadata !{i32 281, i32 0, metadata !4, null}
!196 = metadata !{i32 284, i32 0, metadata !4, null}
!197 = metadata !{i32 285, i32 0, metadata !4, null}
!198 = metadata !{i32 286, i32 0, metadata !4, null}
!199 = metadata !{i32 287, i32 0, metadata !4, null}
!200 = metadata !{i32 288, i32 0, metadata !4, null}
!201 = metadata !{i32 289, i32 0, metadata !4, null}
!202 = metadata !{i32 294, i32 0, metadata !4, null}
!203 = metadata !{i32 299, i32 0, metadata !4, null}
!204 = metadata !{i32 310, i32 0, metadata !4, null}
!205 = metadata !{i32 311, i32 0, metadata !4, null}
!206 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !207} ; [ DW_TAG_arg_variable ] [p] [line 987]
!207 = metadata !{i32 313, i32 0, metadata !4, null}
!208 = metadata !{i32 987, i32 0, metadata !22, metadata !207}
!209 = metadata !{i32 991, i32 0, metadata !22, metadata !207}
!210 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !207} ; [ DW_TAG_auto_variable ] [q] [line 989]
!211 = metadata !{i32 993, i32 0, metadata !22, metadata !207}
!212 = metadata !{i32 994, i32 0, metadata !22, metadata !207}
!213 = metadata !{i32 995, i32 0, metadata !22, metadata !207}
!214 = metadata !{i32 314, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!216 = metadata !{i32 317, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !215, i32 315, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!218 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !219} ; [ DW_TAG_arg_variable ] [p] [line 987]
!219 = metadata !{i32 319, i32 0, metadata !4, null}
!220 = metadata !{i32 987, i32 0, metadata !22, metadata !219}
!221 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !219} ; [ DW_TAG_auto_variable ] [q] [line 989]
!222 = metadata !{i32 991, i32 0, metadata !22, metadata !219}
!223 = metadata !{i32 993, i32 0, metadata !22, metadata !219}
!224 = metadata !{i32 994, i32 0, metadata !22, metadata !219}
!225 = metadata !{i32 995, i32 0, metadata !22, metadata !219}
!226 = metadata !{i32 320, i32 0, metadata !4, null}
!227 = metadata !{i32 321, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !4, i32 321, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!229 = metadata !{i32 323, i32 0, metadata !4, null}
!230 = metadata !{i32 325, i32 0, metadata !4, null}
!231 = metadata !{i32 326, i32 0, metadata !4, null}
!232 = metadata !{i32 327, i32 0, metadata !4, null}
!233 = metadata !{i32 328, i32 0, metadata !4, null}
!234 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !235} ; [ DW_TAG_arg_variable ] [p] [line 987]
!235 = metadata !{i32 330, i32 0, metadata !4, null}
!236 = metadata !{i32 987, i32 0, metadata !22, metadata !235}
!237 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !235} ; [ DW_TAG_auto_variable ] [q] [line 989]
!238 = metadata !{i32 991, i32 0, metadata !22, metadata !235}
!239 = metadata !{i32 993, i32 0, metadata !22, metadata !235}
!240 = metadata !{i32 994, i32 0, metadata !22, metadata !235}
!241 = metadata !{i32 995, i32 0, metadata !22, metadata !235}
!242 = metadata !{i32 331, i32 0, metadata !243, null}
!243 = metadata !{i32 786443, metadata !1, metadata !4, i32 331, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!244 = metadata !{i32 335, i32 0, metadata !245, null}
!245 = metadata !{i32 786443, metadata !1, metadata !243, i32 332, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!246 = metadata !{i32 334, i32 0, metadata !245, null}
!247 = metadata !{i32 333, i32 0, metadata !245, null}
!248 = metadata !{i32 336, i32 0, metadata !245, null}
!249 = metadata !{i32 337, i32 0, metadata !245, null}
!250 = metadata !{i32 338, i32 0, metadata !245, null}
!251 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !252} ; [ DW_TAG_arg_variable ] [p] [line 987]
!252 = metadata !{i32 340, i32 0, metadata !4, null}
!253 = metadata !{i32 987, i32 0, metadata !22, metadata !252}
!254 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !252} ; [ DW_TAG_auto_variable ] [q] [line 989]
!255 = metadata !{i32 991, i32 0, metadata !22, metadata !252}
!256 = metadata !{i32 993, i32 0, metadata !22, metadata !252}
!257 = metadata !{i32 994, i32 0, metadata !22, metadata !252}
!258 = metadata !{i32 995, i32 0, metadata !22, metadata !252}
!259 = metadata !{i32 341, i32 0, metadata !4, null}
!260 = metadata !{i32 343, i32 0, metadata !4, null}
!261 = metadata !{i32 344, i32 0, metadata !4, null}
!262 = metadata !{i32 345, i32 0, metadata !4, null}
!263 = metadata !{i32 346, i32 0, metadata !4, null}
!264 = metadata !{i32 347, i32 0, metadata !4, null}
!265 = metadata !{i32 348, i32 0, metadata !4, null}
!266 = metadata !{i32 349, i32 0, metadata !4, null}
!267 = metadata !{i32 350, i32 0, metadata !4, null}
!268 = metadata !{i32 355, i32 0, metadata !4, null}
!269 = metadata !{i32 369, i32 0, metadata !4, null}
!270 = metadata !{i32 370, i32 0, metadata !4, null}
!271 = metadata !{i32 371, i32 0, metadata !4, null}
!272 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !273} ; [ DW_TAG_arg_variable ] [p] [line 987]
!273 = metadata !{i32 373, i32 0, metadata !4, null}
!274 = metadata !{i32 987, i32 0, metadata !22, metadata !273}
!275 = metadata !{i32 991, i32 0, metadata !22, metadata !273}
!276 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !273} ; [ DW_TAG_auto_variable ] [q] [line 989]
!277 = metadata !{i32 993, i32 0, metadata !22, metadata !273}
!278 = metadata !{i32 994, i32 0, metadata !22, metadata !273}
!279 = metadata !{i32 995, i32 0, metadata !22, metadata !273}
!280 = metadata !{i32 374, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !1, metadata !4, i32 374, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!282 = metadata !{i32 376, i32 0, metadata !283, null}
!283 = metadata !{i32 786443, metadata !1, metadata !281, i32 375, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!284 = metadata !{i32 379, i32 0, metadata !283, null}
!285 = metadata !{i32 377, i32 0, metadata !283, null}
!286 = metadata !{i32 378, i32 0, metadata !283, null}
!287 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !288} ; [ DW_TAG_arg_variable ] [p] [line 987]
!288 = metadata !{i32 381, i32 0, metadata !4, null}
!289 = metadata !{i32 987, i32 0, metadata !22, metadata !288}
!290 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !288} ; [ DW_TAG_auto_variable ] [q] [line 989]
!291 = metadata !{i32 991, i32 0, metadata !22, metadata !288}
!292 = metadata !{i32 993, i32 0, metadata !22, metadata !288}
!293 = metadata !{i32 994, i32 0, metadata !22, metadata !288}
!294 = metadata !{i32 995, i32 0, metadata !22, metadata !288}
!295 = metadata !{i32 382, i32 0, metadata !4, null}
!296 = metadata !{i32 384, i32 0, metadata !4, null}
!297 = metadata !{i32 385, i32 0, metadata !4, null}
!298 = metadata !{i32 386, i32 0, metadata !4, null}
!299 = metadata !{i32 388, i32 0, metadata !4, null}
!300 = metadata !{i32 389, i32 0, metadata !4, null}
!301 = metadata !{i32 390, i32 0, metadata !4, null}
!302 = metadata !{i32 391, i32 0, metadata !4, null}
!303 = metadata !{i32 392, i32 0, metadata !4, null}
!304 = metadata !{i32 397, i32 0, metadata !4, null}
!305 = metadata !{i32 410, i32 0, metadata !4, null}
!306 = metadata !{i32 411, i32 0, metadata !4, null}
!307 = metadata !{i32 412, i32 0, metadata !4, null}
!308 = metadata !{i32 413, i32 0, metadata !4, null}
!309 = metadata !{i32 414, i32 0, metadata !4, null}
!310 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [p] [line 987]
!311 = metadata !{i32 416, i32 0, metadata !4, null}
!312 = metadata !{i32 987, i32 0, metadata !22, metadata !311}
!313 = metadata !{i32 991, i32 0, metadata !22, metadata !311}
!314 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !311} ; [ DW_TAG_auto_variable ] [q] [line 989]
!315 = metadata !{i32 993, i32 0, metadata !22, metadata !311}
!316 = metadata !{i32 994, i32 0, metadata !22, metadata !311}
!317 = metadata !{i32 995, i32 0, metadata !22, metadata !311}
!318 = metadata !{i32 417, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !4, i32 417, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!320 = metadata !{i32 421, i32 0, metadata !321, null}
!321 = metadata !{i32 786443, metadata !1, metadata !319, i32 418, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!322 = metadata !{i32 419, i32 0, metadata !321, null}
!323 = metadata !{i32 420, i32 0, metadata !321, null}
!324 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !325} ; [ DW_TAG_arg_variable ] [p] [line 987]
!325 = metadata !{i32 423, i32 0, metadata !4, null}
!326 = metadata !{i32 987, i32 0, metadata !22, metadata !325}
!327 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !325} ; [ DW_TAG_auto_variable ] [q] [line 989]
!328 = metadata !{i32 991, i32 0, metadata !22, metadata !325}
!329 = metadata !{i32 993, i32 0, metadata !22, metadata !325}
!330 = metadata !{i32 994, i32 0, metadata !22, metadata !325}
!331 = metadata !{i32 995, i32 0, metadata !22, metadata !325}
!332 = metadata !{i32 424, i32 0, metadata !4, null}
!333 = metadata !{i32 426, i32 0, metadata !4, null}
!334 = metadata !{i32 427, i32 0, metadata !4, null}
!335 = metadata !{i32 428, i32 0, metadata !4, null}
!336 = metadata !{i32 430, i32 0, metadata !4, null}
!337 = metadata !{i32 431, i32 0, metadata !4, null}
!338 = metadata !{i32 432, i32 0, metadata !4, null}
!339 = metadata !{i32 433, i32 0, metadata !4, null}
!340 = metadata !{i32 434, i32 0, metadata !4, null}
!341 = metadata !{i32 435, i32 0, metadata !4, null}
!342 = metadata !{i32 436, i32 0, metadata !4, null}
!343 = metadata !{i32 441, i32 0, metadata !4, null}
!344 = metadata !{i32 455, i32 0, metadata !4, null}
!345 = metadata !{i32 456, i32 0, metadata !4, null}
!346 = metadata !{i32 457, i32 0, metadata !4, null}
!347 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !348} ; [ DW_TAG_arg_variable ] [p] [line 987]
!348 = metadata !{i32 459, i32 0, metadata !4, null}
!349 = metadata !{i32 987, i32 0, metadata !22, metadata !348}
!350 = metadata !{i32 991, i32 0, metadata !22, metadata !348}
!351 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !348} ; [ DW_TAG_auto_variable ] [q] [line 989]
!352 = metadata !{i32 993, i32 0, metadata !22, metadata !348}
!353 = metadata !{i32 994, i32 0, metadata !22, metadata !348}
!354 = metadata !{i32 995, i32 0, metadata !22, metadata !348}
!355 = metadata !{i32 460, i32 0, metadata !356, null}
!356 = metadata !{i32 786443, metadata !1, metadata !4, i32 460, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!357 = metadata !{i32 464, i32 0, metadata !358, null}
!358 = metadata !{i32 786443, metadata !1, metadata !356, i32 461, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!359 = metadata !{i32 465, i32 0, metadata !358, null}
!360 = metadata !{i32 462, i32 0, metadata !358, null}
!361 = metadata !{i32 463, i32 0, metadata !358, null}
!362 = metadata !{double undef}
!363 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !364} ; [ DW_TAG_arg_variable ] [p] [line 987]
!364 = metadata !{i32 467, i32 0, metadata !4, null}
!365 = metadata !{i32 987, i32 0, metadata !22, metadata !364}
!366 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !364} ; [ DW_TAG_auto_variable ] [q] [line 989]
!367 = metadata !{i32 991, i32 0, metadata !22, metadata !364}
!368 = metadata !{i32 993, i32 0, metadata !22, metadata !364}
!369 = metadata !{i32 994, i32 0, metadata !22, metadata !364}
!370 = metadata !{i32 995, i32 0, metadata !22, metadata !364}
!371 = metadata !{i32 468, i32 0, metadata !4, null}
!372 = metadata !{i32 470, i32 0, metadata !4, null}
!373 = metadata !{i32 471, i32 0, metadata !4, null}
!374 = metadata !{i32 472, i32 0, metadata !4, null}
!375 = metadata !{i32 473, i32 0, metadata !4, null}
!376 = metadata !{i32 474, i32 0, metadata !4, null}
!377 = metadata !{i32 476, i32 0, metadata !4, null}
!378 = metadata !{i32 477, i32 0, metadata !4, null}
!379 = metadata !{i32 478, i32 0, metadata !4, null}
!380 = metadata !{i32 479, i32 0, metadata !4, null}
!381 = metadata !{i32 480, i32 0, metadata !4, null}
!382 = metadata !{i32 485, i32 0, metadata !4, null}
!383 = metadata !{i32 499, i32 0, metadata !4, null}
!384 = metadata !{i32 500, i32 0, metadata !4, null}
!385 = metadata !{i32 501, i32 0, metadata !4, null}
!386 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [p] [line 987]
!387 = metadata !{i32 503, i32 0, metadata !4, null}
!388 = metadata !{i32 987, i32 0, metadata !22, metadata !387}
!389 = metadata !{i32 991, i32 0, metadata !22, metadata !387}
!390 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [q] [line 989]
!391 = metadata !{i32 993, i32 0, metadata !22, metadata !387}
!392 = metadata !{i32 994, i32 0, metadata !22, metadata !387}
!393 = metadata !{i32 995, i32 0, metadata !22, metadata !387}
!394 = metadata !{i32 504, i32 0, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !4, i32 504, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!396 = metadata !{i32 508, i32 0, metadata !397, null}
!397 = metadata !{i32 786443, metadata !1, metadata !395, i32 505, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!398 = metadata !{i32 509, i32 0, metadata !397, null}
!399 = metadata !{i32 506, i32 0, metadata !397, null}
!400 = metadata !{i32 507, i32 0, metadata !397, null}
!401 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !402} ; [ DW_TAG_arg_variable ] [p] [line 987]
!402 = metadata !{i32 511, i32 0, metadata !4, null}
!403 = metadata !{i32 987, i32 0, metadata !22, metadata !402}
!404 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !402} ; [ DW_TAG_auto_variable ] [q] [line 989]
!405 = metadata !{i32 991, i32 0, metadata !22, metadata !402}
!406 = metadata !{i32 993, i32 0, metadata !22, metadata !402}
!407 = metadata !{i32 994, i32 0, metadata !22, metadata !402}
!408 = metadata !{i32 995, i32 0, metadata !22, metadata !402}
!409 = metadata !{i32 512, i32 0, metadata !4, null}
!410 = metadata !{i32 514, i32 0, metadata !4, null}
!411 = metadata !{i32 515, i32 0, metadata !4, null}
!412 = metadata !{i32 516, i32 0, metadata !4, null}
!413 = metadata !{i32 517, i32 0, metadata !4, null}
!414 = metadata !{i32 518, i32 0, metadata !4, null}
!415 = metadata !{i32 520, i32 0, metadata !4, null}
!416 = metadata !{i32 521, i32 0, metadata !4, null}
!417 = metadata !{i32 522, i32 0, metadata !4, null}
!418 = metadata !{i32 523, i32 0, metadata !4, null}
!419 = metadata !{i32 524, i32 0, metadata !4, null}
!420 = metadata !{i32 529, i32 0, metadata !4, null}
!421 = metadata !{i32 546, i32 0, metadata !4, null}
!422 = metadata !{i32 547, i32 0, metadata !4, null}
!423 = metadata !{i32 548, i32 0, metadata !4, null}
!424 = metadata !{i32 549, i32 0, metadata !4, null}
!425 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !426} ; [ DW_TAG_arg_variable ] [p] [line 987]
!426 = metadata !{i32 551, i32 0, metadata !4, null}
!427 = metadata !{i32 987, i32 0, metadata !22, metadata !426}
!428 = metadata !{i32 991, i32 0, metadata !22, metadata !426}
!429 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !426} ; [ DW_TAG_auto_variable ] [q] [line 989]
!430 = metadata !{i32 993, i32 0, metadata !22, metadata !426}
!431 = metadata !{i32 994, i32 0, metadata !22, metadata !426}
!432 = metadata !{i32 995, i32 0, metadata !22, metadata !426}
!433 = metadata !{i32 552, i32 0, metadata !434, null}
!434 = metadata !{i32 786443, metadata !1, metadata !4, i32 552, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!435 = metadata !{i32 554, i32 0, metadata !436, null}
!436 = metadata !{i32 786443, metadata !1, metadata !434, i32 553, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!437 = metadata !{i32 555, i32 0, metadata !436, null}
!438 = metadata !{i32 556, i32 0, metadata !436, null}
!439 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !440} ; [ DW_TAG_arg_variable ] [p] [line 987]
!440 = metadata !{i32 558, i32 0, metadata !4, null}
!441 = metadata !{i32 987, i32 0, metadata !22, metadata !440}
!442 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !440} ; [ DW_TAG_auto_variable ] [q] [line 989]
!443 = metadata !{i32 991, i32 0, metadata !22, metadata !440}
!444 = metadata !{i32 993, i32 0, metadata !22, metadata !440}
!445 = metadata !{i32 994, i32 0, metadata !22, metadata !440}
!446 = metadata !{i32 995, i32 0, metadata !22, metadata !440}
!447 = metadata !{i32 559, i32 0, metadata !4, null}
!448 = metadata !{i32 563, i32 0, metadata !4, null}
!449 = metadata !{i32 564, i32 0, metadata !4, null}
!450 = metadata !{i32 565, i32 0, metadata !4, null}
!451 = metadata !{i32 566, i32 0, metadata !4, null}
!452 = metadata !{i32 567, i32 0, metadata !4, null}
!453 = metadata !{i32 569, i32 0, metadata !4, null}
!454 = metadata !{i32 570, i32 0, metadata !4, null}
!455 = metadata !{i32 572, i32 0, metadata !4, null}
!456 = metadata !{i32 573, i32 0, metadata !4, null}
!457 = metadata !{i32 578, i32 0, metadata !4, null}
!458 = metadata !{i32 593, i32 0, metadata !4, null}
!459 = metadata !{i32 594, i32 0, metadata !4, null}
!460 = metadata !{i32 595, i32 0, metadata !4, null}
!461 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !462} ; [ DW_TAG_arg_variable ] [p] [line 987]
!462 = metadata !{i32 597, i32 0, metadata !4, null}
!463 = metadata !{i32 987, i32 0, metadata !22, metadata !462}
!464 = metadata !{i32 991, i32 0, metadata !22, metadata !462}
!465 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !462} ; [ DW_TAG_auto_variable ] [q] [line 989]
!466 = metadata !{i32 993, i32 0, metadata !22, metadata !462}
!467 = metadata !{i32 994, i32 0, metadata !22, metadata !462}
!468 = metadata !{i32 995, i32 0, metadata !22, metadata !462}
!469 = metadata !{i32 598, i32 0, metadata !470, null}
!470 = metadata !{i32 786443, metadata !1, metadata !4, i32 598, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!471 = metadata !{i32 602, i32 0, metadata !472, null}
!472 = metadata !{i32 786443, metadata !1, metadata !470, i32 599, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!473 = metadata !{i32 603, i32 0, metadata !472, null}
!474 = metadata !{i32 600, i32 0, metadata !472, null}
!475 = metadata !{i32 601, i32 0, metadata !472, null}
!476 = metadata !{i32 786689, metadata !22, metadata !"p", metadata !5, i32 16778203, metadata !25, i32 0, metadata !477} ; [ DW_TAG_arg_variable ] [p] [line 987]
!477 = metadata !{i32 605, i32 0, metadata !4, null}
!478 = metadata !{i32 987, i32 0, metadata !22, metadata !477}
!479 = metadata !{i32 786688, metadata !22, metadata !"q", metadata !5, i32 989, metadata !11, i32 0, metadata !477} ; [ DW_TAG_auto_variable ] [q] [line 989]
!480 = metadata !{i32 991, i32 0, metadata !22, metadata !477}
!481 = metadata !{i32 993, i32 0, metadata !22, metadata !477}
!482 = metadata !{i32 994, i32 0, metadata !22, metadata !477}
!483 = metadata !{i32 995, i32 0, metadata !22, metadata !477}
!484 = metadata !{i32 606, i32 0, metadata !4, null}
!485 = metadata !{i32 608, i32 0, metadata !4, null}
!486 = metadata !{i32 609, i32 0, metadata !4, null}
!487 = metadata !{i32 610, i32 0, metadata !4, null}
!488 = metadata !{i32 611, i32 0, metadata !4, null}
!489 = metadata !{i32 612, i32 0, metadata !4, null}
!490 = metadata !{i32 614, i32 0, metadata !4, null}
!491 = metadata !{i32 615, i32 0, metadata !4, null}
!492 = metadata !{i32 616, i32 0, metadata !4, null}
!493 = metadata !{i32 617, i32 0, metadata !4, null}
!494 = metadata !{i32 618, i32 0, metadata !4, null}
!495 = metadata !{i32 623, i32 0, metadata !4, null}
!496 = metadata !{i32 633, i32 0, metadata !4, null}
!497 = metadata !{i32 634, i32 0, metadata !4, null}
!498 = metadata !{i32 640, i32 0, metadata !4, null}
!499 = metadata !{i32 641, i32 0, metadata !4, null}
!500 = metadata !{i32 642, i32 0, metadata !4, null}
!501 = metadata !{i32 649, i32 0, metadata !4, null}
!502 = metadata !{i32 650, i32 0, metadata !4, null}
!503 = metadata !{i32 656, i32 0, metadata !4, null}
!504 = metadata !{i32 657, i32 0, metadata !4, null}
!505 = metadata !{i32 660, i32 0, metadata !4, null}
!506 = metadata !{i32 661, i32 0, metadata !4, null}
!507 = metadata !{i32 662, i32 0, metadata !4, null}
!508 = metadata !{i32 663, i32 0, metadata !4, null}
!509 = metadata !{i32 664, i32 0, metadata !4, null}
!510 = metadata !{i32 665, i32 0, metadata !4, null}
!511 = metadata !{i32 666, i32 0, metadata !4, null}
!512 = metadata !{i32 667, i32 0, metadata !4, null}
!513 = metadata !{i32 987, i32 0, metadata !22, null}
!514 = metadata !{i32 991, i32 0, metadata !22, null}
!515 = metadata !{i32 993, i32 0, metadata !22, null}
!516 = metadata !{i32 994, i32 0, metadata !22, null}
!517 = metadata !{i32 995, i32 0, metadata !22, null}
!518 = metadata !{i32 997, i32 0, metadata !22, null}
