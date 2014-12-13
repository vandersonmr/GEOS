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

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca double, align 8
  %u = alloca double, align 8
  %v = alloca double, align 8
  %w = alloca double, align 8
  %x = alloca double, align 8
  %loops = alloca i64, align 8
  %NLimit = alloca i64, align 8
  %i = alloca i64, align 8
  %m = alloca i64, align 8
  %n = alloca i64, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{double* %s}, metadata !79), !dbg !80
  call void @llvm.dbg.declare(metadata !{double* %u}, metadata !81), !dbg !80
  call void @llvm.dbg.declare(metadata !{double* %v}, metadata !82), !dbg !80
  call void @llvm.dbg.declare(metadata !{double* %w}, metadata !83), !dbg !80
  call void @llvm.dbg.declare(metadata !{double* %x}, metadata !84), !dbg !80
  call void @llvm.dbg.declare(metadata !{i64* %loops}, metadata !85), !dbg !86
  call void @llvm.dbg.declare(metadata !{i64* %NLimit}, metadata !87), !dbg !86
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !88), !dbg !89
  call void @llvm.dbg.declare(metadata !{i64* %m}, metadata !90), !dbg !89
  call void @llvm.dbg.declare(metadata !{i64* %n}, metadata !91), !dbg !89
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !92
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0)), !dbg !93
  store i64 15625, i64* %loops, align 8, !dbg !94
  %4 = load i64* %loops, align 8, !dbg !95
  %5 = sitofp i64 %4 to double, !dbg !95
  %6 = fdiv double 1.000000e+06, %5, !dbg !95
  store double %6, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !95
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !96
  store i64 512000000, i64* %NLimit, align 8, !dbg !97
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !98
  store double 1.000000e+00, double* @one, align 8, !dbg !99
  store double 2.000000e+00, double* @two, align 8, !dbg !100
  store double 3.000000e+00, double* @three, align 8, !dbg !101
  store double 4.000000e+00, double* @four, align 8, !dbg !102
  store double 5.000000e+00, double* @five, align 8, !dbg !103
  %7 = load double* @one, align 8, !dbg !104
  store double %7, double* @scale, align 8, !dbg !104
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str2, i32 0, i32 0)), !dbg !105
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0)), !dbg !106
  %10 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !107
  %11 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !108
  %12 = load i64* %loops, align 8, !dbg !109
  store i64 %12, i64* %n, align 8, !dbg !109
  store double 0.000000e+00, double* @sa, align 8, !dbg !110
  br label %13, !dbg !111

; <label>:13                                      ; preds = %73, %0
  %14 = load double* @sa, align 8, !dbg !111
  %15 = load double* @TLimit, align 8, !dbg !111
  %16 = fcmp olt double %14, %15, !dbg !111
  br i1 %16, label %17, label %74, !dbg !111

; <label>:17                                      ; preds = %13
  %18 = load i64* %n, align 8, !dbg !112
  %19 = mul nsw i64 2, %18, !dbg !112
  store i64 %19, i64* %n, align 8, !dbg !112
  %20 = load double* @one, align 8, !dbg !114
  %21 = load i64* %n, align 8, !dbg !114
  %22 = sitofp i64 %21 to double, !dbg !114
  %23 = fdiv double %20, %22, !dbg !114
  store double %23, double* %x, align 8, !dbg !114
  store double 0.000000e+00, double* %s, align 8, !dbg !115
  store double 0.000000e+00, double* %v, align 8, !dbg !116
  %24 = load double* @one, align 8, !dbg !117
  store double %24, double* %w, align 8, !dbg !117
  %25 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !118
  store i64 1, i64* %i, align 8, !dbg !119
  br label %26, !dbg !119

; <label>:26                                      ; preds = %63, %17
  %27 = load i64* %i, align 8, !dbg !119
  %28 = load i64* %n, align 8, !dbg !119
  %29 = sub nsw i64 %28, 1, !dbg !119
  %30 = icmp sle i64 %27, %29, !dbg !119
  br i1 %30, label %31, label %66, !dbg !119

; <label>:31                                      ; preds = %26
  %32 = load double* %v, align 8, !dbg !121
  %33 = load double* %w, align 8, !dbg !121
  %34 = fadd double %32, %33, !dbg !121
  store double %34, double* %v, align 8, !dbg !121
  %35 = load double* %v, align 8, !dbg !123
  %36 = load double* %x, align 8, !dbg !123
  %37 = fmul double %35, %36, !dbg !123
  store double %37, double* %u, align 8, !dbg !123
  %38 = load double* %s, align 8, !dbg !124
  %39 = load double* @D1, align 8, !dbg !124
  %40 = load double* %u, align 8, !dbg !124
  %41 = load double* @D2, align 8, !dbg !124
  %42 = load double* %u, align 8, !dbg !124
  %43 = load double* @D3, align 8, !dbg !124
  %44 = fmul double %42, %43, !dbg !124
  %45 = fadd double %41, %44, !dbg !124
  %46 = fmul double %40, %45, !dbg !124
  %47 = fadd double %39, %46, !dbg !124
  %48 = load double* %w, align 8, !dbg !124
  %49 = load double* %u, align 8, !dbg !124
  %50 = load double* @D1, align 8, !dbg !124
  %51 = load double* %u, align 8, !dbg !124
  %52 = load double* @E2, align 8, !dbg !124
  %53 = load double* %u, align 8, !dbg !124
  %54 = load double* @E3, align 8, !dbg !124
  %55 = fmul double %53, %54, !dbg !124
  %56 = fadd double %52, %55, !dbg !124
  %57 = fmul double %51, %56, !dbg !124
  %58 = fadd double %50, %57, !dbg !124
  %59 = fmul double %49, %58, !dbg !124
  %60 = fadd double %48, %59, !dbg !124
  %61 = fdiv double %47, %60, !dbg !124
  %62 = fadd double %38, %61, !dbg !124
  store double %62, double* %s, align 8, !dbg !124
  br label %63, !dbg !125

; <label>:63                                      ; preds = %31
  %64 = load i64* %i, align 8, !dbg !119
  %65 = add nsw i64 %64, 1, !dbg !119
  store i64 %65, i64* %i, align 8, !dbg !119
  br label %26, !dbg !119

; <label>:66                                      ; preds = %26
  %67 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !126
  %68 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !127
  store double %68, double* @sa, align 8, !dbg !127
  %69 = load i64* %n, align 8, !dbg !128
  %70 = load i64* %NLimit, align 8, !dbg !128
  %71 = icmp eq i64 %69, %70, !dbg !128
  br i1 %71, label %72, label %73, !dbg !128

; <label>:72                                      ; preds = %66
  br label %74, !dbg !128

; <label>:73                                      ; preds = %66
  br label %13, !dbg !130

; <label>:74                                      ; preds = %72, %13
  store double 1.589500e-02, double* @scale, align 8, !dbg !131
  %75 = load double* @scale, align 8, !dbg !132
  store double %75, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !132
  %76 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !133
  store i64 1, i64* %i, align 8, !dbg !134
  br label %77, !dbg !134

; <label>:77                                      ; preds = %83, %74
  %78 = load i64* %i, align 8, !dbg !134
  %79 = load i64* %n, align 8, !dbg !134
  %80 = sub nsw i64 %79, 1, !dbg !134
  %81 = icmp sle i64 %78, %80, !dbg !134
  br i1 %81, label %82, label %86, !dbg !134

; <label>:82                                      ; preds = %77
  br label %83, !dbg !136

; <label>:83                                      ; preds = %82
  %84 = load i64* %i, align 8, !dbg !134
  %85 = add nsw i64 %84, 1, !dbg !134
  store i64 %85, i64* %i, align 8, !dbg !134
  br label %77, !dbg !134

; <label>:86                                      ; preds = %77
  %87 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !138
  %88 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !139
  %89 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !139
  %90 = fmul double %88, %89, !dbg !139
  store double %90, double* @nulltime, align 8, !dbg !139
  %91 = load double* @nulltime, align 8, !dbg !140
  %92 = fcmp olt double %91, 0.000000e+00, !dbg !140
  br i1 %92, label %93, label %94, !dbg !140

; <label>:93                                      ; preds = %86
  store double 0.000000e+00, double* @nulltime, align 8, !dbg !140
  br label %94, !dbg !140

; <label>:94                                      ; preds = %93, %86
  %95 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !142
  %96 = load double* @sa, align 8, !dbg !142
  %97 = fmul double %95, %96, !dbg !142
  %98 = load double* @nulltime, align 8, !dbg !142
  %99 = fsub double %97, %98, !dbg !142
  store double %99, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 2), align 8, !dbg !142
  %100 = load double* @D1, align 8, !dbg !143
  %101 = load double* @D2, align 8, !dbg !143
  %102 = fadd double %100, %101, !dbg !143
  %103 = load double* @D3, align 8, !dbg !143
  %104 = fadd double %102, %103, !dbg !143
  %105 = load double* @one, align 8, !dbg !143
  %106 = load double* @D1, align 8, !dbg !143
  %107 = fadd double %105, %106, !dbg !143
  %108 = load double* @E2, align 8, !dbg !143
  %109 = fadd double %107, %108, !dbg !143
  %110 = load double* @E3, align 8, !dbg !143
  %111 = fadd double %109, %110, !dbg !143
  %112 = fdiv double %104, %111, !dbg !143
  store double %112, double* @sa, align 8, !dbg !143
  %113 = load double* @D1, align 8, !dbg !144
  store double %113, double* @sb, align 8, !dbg !144
  %114 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 2), align 8, !dbg !145
  %115 = fdiv double %114, 1.400000e+01, !dbg !145
  store double %115, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 3), align 8, !dbg !145
  %116 = load double* %x, align 8, !dbg !146
  %117 = load double* @sa, align 8, !dbg !146
  %118 = load double* @sb, align 8, !dbg !146
  %119 = fadd double %117, %118, !dbg !146
  %120 = load double* @two, align 8, !dbg !146
  %121 = load double* %s, align 8, !dbg !146
  %122 = fmul double %120, %121, !dbg !146
  %123 = fadd double %119, %122, !dbg !146
  %124 = fmul double %116, %123, !dbg !146
  %125 = load double* @two, align 8, !dbg !146
  %126 = fdiv double %124, %125, !dbg !146
  store double %126, double* @sa, align 8, !dbg !146
  %127 = load double* @one, align 8, !dbg !147
  %128 = load double* @sa, align 8, !dbg !147
  %129 = fdiv double %127, %128, !dbg !147
  store double %129, double* @sb, align 8, !dbg !147
  %130 = load double* @sb, align 8, !dbg !148
  %131 = fptosi double %130 to i64, !dbg !148
  %132 = mul nsw i64 40000, %131, !dbg !148
  %133 = sitofp i64 %132 to double, !dbg !148
  %134 = load double* @scale, align 8, !dbg !148
  %135 = fdiv double %133, %134, !dbg !148
  %136 = fptosi double %135 to i64, !dbg !148
  store i64 %136, i64* %n, align 8, !dbg !148
  %137 = load double* @sb, align 8, !dbg !149
  %138 = fsub double %137, 2.520000e+01, !dbg !149
  store double %138, double* @sc, align 8, !dbg !149
  %139 = load double* @one, align 8, !dbg !150
  %140 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 3), align 8, !dbg !150
  %141 = fdiv double %139, %140, !dbg !150
  store double %141, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 4), align 8, !dbg !150
  %142 = load double* @sc, align 8, !dbg !151
  %143 = fmul double %142, 1.000000e-30, !dbg !151
  %144 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 2), align 8, !dbg !151
  %145 = fmul double %144, 1.000000e-30, !dbg !151
  %146 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 4), align 8, !dbg !151
  %147 = fmul double %146, 1.000000e-30, !dbg !151
  %148 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0), double %143, double %145, double %147), !dbg !151
  %149 = load i64* %n, align 8, !dbg !152
  store i64 %149, i64* %m, align 8, !dbg !152
  %150 = load double* @five, align 8, !dbg !153
  %151 = fsub double -0.000000e+00, %150, !dbg !153
  store double %151, double* %s, align 8, !dbg !153
  %152 = load double* @one, align 8, !dbg !154
  %153 = fsub double -0.000000e+00, %152, !dbg !154
  store double %153, double* @sa, align 8, !dbg !154
  %154 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !155
  store i64 1, i64* %i, align 8, !dbg !156
  br label %155, !dbg !156

; <label>:155                                     ; preds = %165, %94
  %156 = load i64* %i, align 8, !dbg !156
  %157 = load i64* %m, align 8, !dbg !156
  %158 = icmp sle i64 %156, %157, !dbg !156
  br i1 %158, label %159, label %168, !dbg !156

; <label>:159                                     ; preds = %155
  %160 = load double* %s, align 8, !dbg !158
  %161 = fsub double -0.000000e+00, %160, !dbg !158
  store double %161, double* %s, align 8, !dbg !158
  %162 = load double* @sa, align 8, !dbg !160
  %163 = load double* %s, align 8, !dbg !160
  %164 = fadd double %162, %163, !dbg !160
  store double %164, double* @sa, align 8, !dbg !160
  br label %165, !dbg !161

; <label>:165                                     ; preds = %159
  %166 = load i64* %i, align 8, !dbg !156
  %167 = add nsw i64 %166, 1, !dbg !156
  store i64 %167, i64* %i, align 8, !dbg !156
  br label %155, !dbg !156

; <label>:168                                     ; preds = %155
  %169 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !162
  %170 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !163
  %171 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !163
  %172 = fmul double %170, %171, !dbg !163
  store double %172, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 5), align 8, !dbg !163
  %173 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 5), align 8, !dbg !164
  %174 = fcmp olt double %173, 0.000000e+00, !dbg !164
  br i1 %174, label %175, label %176, !dbg !164

; <label>:175                                     ; preds = %168
  store double 0.000000e+00, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 5), align 8, !dbg !164
  br label %176, !dbg !164

; <label>:176                                     ; preds = %175, %168
  %177 = load i64* %m, align 8, !dbg !166
  %178 = sitofp i64 %177 to double, !dbg !166
  store double %178, double* @sc, align 8, !dbg !166
  %179 = load double* @sa, align 8, !dbg !167
  store double %179, double* %u, align 8, !dbg !167
  store double 0.000000e+00, double* %v, align 8, !dbg !168
  store double 0.000000e+00, double* %w, align 8, !dbg !169
  store double 0.000000e+00, double* %x, align 8, !dbg !170
  %180 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !171
  store i64 1, i64* %i, align 8, !dbg !172
  br label %181, !dbg !172

; <label>:181                                     ; preds = %209, %176
  %182 = load i64* %i, align 8, !dbg !172
  %183 = load i64* %m, align 8, !dbg !172
  %184 = icmp sle i64 %182, %183, !dbg !172
  br i1 %184, label %185, label %212, !dbg !172

; <label>:185                                     ; preds = %181
  %186 = load double* %s, align 8, !dbg !174
  %187 = fsub double -0.000000e+00, %186, !dbg !174
  store double %187, double* %s, align 8, !dbg !174
  %188 = load double* @sa, align 8, !dbg !176
  %189 = load double* %s, align 8, !dbg !176
  %190 = fadd double %188, %189, !dbg !176
  store double %190, double* @sa, align 8, !dbg !176
  %191 = load double* %u, align 8, !dbg !177
  %192 = load double* @two, align 8, !dbg !177
  %193 = fadd double %191, %192, !dbg !177
  store double %193, double* %u, align 8, !dbg !177
  %194 = load double* %x, align 8, !dbg !178
  %195 = load double* %s, align 8, !dbg !178
  %196 = load double* %u, align 8, !dbg !178
  %197 = fsub double %195, %196, !dbg !178
  %198 = fadd double %194, %197, !dbg !178
  store double %198, double* %x, align 8, !dbg !178
  %199 = load double* %v, align 8, !dbg !179
  %200 = load double* %s, align 8, !dbg !179
  %201 = load double* %u, align 8, !dbg !179
  %202 = fmul double %200, %201, !dbg !179
  %203 = fsub double %199, %202, !dbg !179
  store double %203, double* %v, align 8, !dbg !179
  %204 = load double* %w, align 8, !dbg !180
  %205 = load double* %s, align 8, !dbg !180
  %206 = load double* %u, align 8, !dbg !180
  %207 = fdiv double %205, %206, !dbg !180
  %208 = fadd double %204, %207, !dbg !180
  store double %208, double* %w, align 8, !dbg !180
  br label %209, !dbg !181

; <label>:209                                     ; preds = %185
  %210 = load i64* %i, align 8, !dbg !172
  %211 = add nsw i64 %210, 1, !dbg !172
  store i64 %211, i64* %i, align 8, !dbg !172
  br label %181, !dbg !172

; <label>:212                                     ; preds = %181
  %213 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !182
  %214 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !183
  %215 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !183
  %216 = fmul double %214, %215, !dbg !183
  store double %216, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 6), align 8, !dbg !183
  %217 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 6), align 8, !dbg !184
  %218 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 5), align 8, !dbg !184
  %219 = fsub double %217, %218, !dbg !184
  %220 = fdiv double %219, 7.000000e+00, !dbg !184
  store double %220, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 7), align 8, !dbg !184
  %221 = load double* @sa, align 8, !dbg !185
  %222 = load double* %x, align 8, !dbg !185
  %223 = fmul double %221, %222, !dbg !185
  %224 = load double* @sc, align 8, !dbg !185
  %225 = fdiv double %223, %224, !dbg !185
  %226 = fptosi double %225 to i64, !dbg !185
  store i64 %226, i64* %m, align 8, !dbg !185
  %227 = load double* @four, align 8, !dbg !186
  %228 = load double* %w, align 8, !dbg !186
  %229 = fmul double %227, %228, !dbg !186
  %230 = load double* @five, align 8, !dbg !186
  %231 = fdiv double %229, %230, !dbg !186
  store double %231, double* @sa, align 8, !dbg !186
  %232 = load double* @sa, align 8, !dbg !187
  %233 = load double* @five, align 8, !dbg !187
  %234 = load double* %v, align 8, !dbg !187
  %235 = fdiv double %233, %234, !dbg !187
  %236 = fadd double %232, %235, !dbg !187
  store double %236, double* @sb, align 8, !dbg !187
  store double 3.125000e+01, double* @sc, align 8, !dbg !188
  %237 = load double* @sb, align 8, !dbg !189
  %238 = load double* @sc, align 8, !dbg !189
  %239 = load double* %v, align 8, !dbg !189
  %240 = load double* %v, align 8, !dbg !189
  %241 = fmul double %239, %240, !dbg !189
  %242 = load double* %v, align 8, !dbg !189
  %243 = fmul double %241, %242, !dbg !189
  %244 = fdiv double %238, %243, !dbg !189
  %245 = fsub double %237, %244, !dbg !189
  store double %245, double* @piprg, align 8, !dbg !189
  %246 = load double* @piprg, align 8, !dbg !190
  %247 = load double* @piref, align 8, !dbg !190
  %248 = fsub double %246, %247, !dbg !190
  store double %248, double* @pierr, align 8, !dbg !190
  %249 = load double* @one, align 8, !dbg !191
  %250 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 7), align 8, !dbg !191
  %251 = fdiv double %249, %250, !dbg !191
  store double %251, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 8), align 8, !dbg !191
  %252 = load double* @pierr, align 8, !dbg !192
  %253 = fmul double %252, 1.000000e-30, !dbg !192
  %254 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 6), align 8, !dbg !192
  %255 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 5), align 8, !dbg !192
  %256 = fsub double %254, %255, !dbg !192
  %257 = fmul double %256, 1.000000e-30, !dbg !192
  %258 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 8), align 8, !dbg !192
  %259 = fmul double %258, 1.000000e-30, !dbg !192
  %260 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str5, i32 0, i32 0), double %253, double %257, double %259), !dbg !192
  %261 = load double* @piref, align 8, !dbg !193
  %262 = load double* @three, align 8, !dbg !193
  %263 = load i64* %m, align 8, !dbg !193
  %264 = sitofp i64 %263 to double, !dbg !193
  %265 = fmul double %262, %264, !dbg !193
  %266 = fdiv double %261, %265, !dbg !193
  store double %266, double* %x, align 8, !dbg !193
  store double 0.000000e+00, double* %s, align 8, !dbg !194
  store double 0.000000e+00, double* %v, align 8, !dbg !195
  %267 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !196
  store i64 1, i64* %i, align 8, !dbg !197
  br label %268, !dbg !197

; <label>:268                                     ; preds = %312, %212
  %269 = load i64* %i, align 8, !dbg !197
  %270 = load i64* %m, align 8, !dbg !197
  %271 = sub nsw i64 %270, 1, !dbg !197
  %272 = icmp sle i64 %269, %271, !dbg !197
  br i1 %272, label %273, label %315, !dbg !197

; <label>:273                                     ; preds = %268
  %274 = load double* %v, align 8, !dbg !199
  %275 = load double* @one, align 8, !dbg !199
  %276 = fadd double %274, %275, !dbg !199
  store double %276, double* %v, align 8, !dbg !199
  %277 = load double* %v, align 8, !dbg !201
  %278 = load double* %x, align 8, !dbg !201
  %279 = fmul double %277, %278, !dbg !201
  store double %279, double* %u, align 8, !dbg !201
  %280 = load double* %u, align 8, !dbg !202
  %281 = load double* %u, align 8, !dbg !202
  %282 = fmul double %280, %281, !dbg !202
  store double %282, double* %w, align 8, !dbg !202
  %283 = load double* %s, align 8, !dbg !203
  %284 = load double* %u, align 8, !dbg !203
  %285 = load double* @A6, align 8, !dbg !203
  %286 = load double* %w, align 8, !dbg !203
  %287 = fmul double %285, %286, !dbg !203
  %288 = load double* @A5, align 8, !dbg !203
  %289 = fsub double %287, %288, !dbg !203
  %290 = load double* %w, align 8, !dbg !203
  %291 = fmul double %289, %290, !dbg !203
  %292 = load double* @A4, align 8, !dbg !203
  %293 = fadd double %291, %292, !dbg !203
  %294 = load double* %w, align 8, !dbg !203
  %295 = fmul double %293, %294, !dbg !203
  %296 = load double* @A3, align 8, !dbg !203
  %297 = fsub double %295, %296, !dbg !203
  %298 = load double* %w, align 8, !dbg !203
  %299 = fmul double %297, %298, !dbg !203
  %300 = load double* @A2, align 8, !dbg !203
  %301 = fadd double %299, %300, !dbg !203
  %302 = load double* %w, align 8, !dbg !203
  %303 = fmul double %301, %302, !dbg !203
  %304 = load double* @A1, align 8, !dbg !203
  %305 = fadd double %303, %304, !dbg !203
  %306 = load double* %w, align 8, !dbg !203
  %307 = fmul double %305, %306, !dbg !203
  %308 = load double* @one, align 8, !dbg !203
  %309 = fadd double %307, %308, !dbg !203
  %310 = fmul double %284, %309, !dbg !203
  %311 = fadd double %283, %310, !dbg !203
  store double %311, double* %s, align 8, !dbg !203
  br label %312, !dbg !204

; <label>:312                                     ; preds = %273
  %313 = load i64* %i, align 8, !dbg !197
  %314 = add nsw i64 %313, 1, !dbg !197
  store i64 %314, i64* %i, align 8, !dbg !197
  br label %268, !dbg !197

; <label>:315                                     ; preds = %268
  %316 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !205
  %317 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !206
  %318 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !206
  %319 = fmul double %317, %318, !dbg !206
  %320 = load double* @nulltime, align 8, !dbg !206
  %321 = fsub double %319, %320, !dbg !206
  store double %321, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !206
  %322 = load double* @piref, align 8, !dbg !207
  %323 = load double* @three, align 8, !dbg !207
  %324 = fdiv double %322, %323, !dbg !207
  store double %324, double* %u, align 8, !dbg !207
  %325 = load double* %u, align 8, !dbg !208
  %326 = load double* %u, align 8, !dbg !208
  %327 = fmul double %325, %326, !dbg !208
  store double %327, double* %w, align 8, !dbg !208
  %328 = load double* %u, align 8, !dbg !209
  %329 = load double* @A6, align 8, !dbg !209
  %330 = load double* %w, align 8, !dbg !209
  %331 = fmul double %329, %330, !dbg !209
  %332 = load double* @A5, align 8, !dbg !209
  %333 = fsub double %331, %332, !dbg !209
  %334 = load double* %w, align 8, !dbg !209
  %335 = fmul double %333, %334, !dbg !209
  %336 = load double* @A4, align 8, !dbg !209
  %337 = fadd double %335, %336, !dbg !209
  %338 = load double* %w, align 8, !dbg !209
  %339 = fmul double %337, %338, !dbg !209
  %340 = load double* @A3, align 8, !dbg !209
  %341 = fsub double %339, %340, !dbg !209
  %342 = load double* %w, align 8, !dbg !209
  %343 = fmul double %341, %342, !dbg !209
  %344 = load double* @A2, align 8, !dbg !209
  %345 = fadd double %343, %344, !dbg !209
  %346 = load double* %w, align 8, !dbg !209
  %347 = fmul double %345, %346, !dbg !209
  %348 = load double* @A1, align 8, !dbg !209
  %349 = fadd double %347, %348, !dbg !209
  %350 = load double* %w, align 8, !dbg !209
  %351 = fmul double %349, %350, !dbg !209
  %352 = load double* @one, align 8, !dbg !209
  %353 = fadd double %351, %352, !dbg !209
  %354 = fmul double %328, %353, !dbg !209
  store double %354, double* @sa, align 8, !dbg !209
  %355 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !210
  %356 = fdiv double %355, 1.700000e+01, !dbg !210
  store double %356, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 10), align 8, !dbg !210
  %357 = load double* %x, align 8, !dbg !211
  %358 = load double* @sa, align 8, !dbg !211
  %359 = load double* @two, align 8, !dbg !211
  %360 = load double* %s, align 8, !dbg !211
  %361 = fmul double %359, %360, !dbg !211
  %362 = fadd double %358, %361, !dbg !211
  %363 = fmul double %357, %362, !dbg !211
  %364 = load double* @two, align 8, !dbg !211
  %365 = fdiv double %363, %364, !dbg !211
  store double %365, double* @sa, align 8, !dbg !211
  store double 5.000000e-01, double* @sb, align 8, !dbg !212
  %366 = load double* @sa, align 8, !dbg !213
  %367 = load double* @sb, align 8, !dbg !213
  %368 = fsub double %366, %367, !dbg !213
  store double %368, double* @sc, align 8, !dbg !213
  %369 = load double* @one, align 8, !dbg !214
  %370 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 10), align 8, !dbg !214
  %371 = fdiv double %369, %370, !dbg !214
  store double %371, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 11), align 8, !dbg !214
  %372 = load double* @sc, align 8, !dbg !215
  %373 = fmul double %372, 1.000000e-30, !dbg !215
  %374 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !215
  %375 = fmul double %374, 1.000000e-30, !dbg !215
  %376 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 11), align 8, !dbg !215
  %377 = fmul double %376, 1.000000e-30, !dbg !215
  %378 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str6, i32 0, i32 0), double %373, double %375, double %377), !dbg !215
  %379 = load double* @A3, align 8, !dbg !216
  %380 = fsub double -0.000000e+00, %379, !dbg !216
  store double %380, double* @A3, align 8, !dbg !216
  %381 = load double* @A5, align 8, !dbg !217
  %382 = fsub double -0.000000e+00, %381, !dbg !217
  store double %382, double* @A5, align 8, !dbg !217
  %383 = load double* @piref, align 8, !dbg !218
  %384 = load double* @three, align 8, !dbg !218
  %385 = load i64* %m, align 8, !dbg !218
  %386 = sitofp i64 %385 to double, !dbg !218
  %387 = fmul double %384, %386, !dbg !218
  %388 = fdiv double %383, %387, !dbg !218
  store double %388, double* %x, align 8, !dbg !218
  store double 0.000000e+00, double* %s, align 8, !dbg !219
  store double 0.000000e+00, double* %v, align 8, !dbg !220
  %389 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !221
  store i64 1, i64* %i, align 8, !dbg !222
  br label %390, !dbg !222

; <label>:390                                     ; preds = %430, %315
  %391 = load i64* %i, align 8, !dbg !222
  %392 = load i64* %m, align 8, !dbg !222
  %393 = sub nsw i64 %392, 1, !dbg !222
  %394 = icmp sle i64 %391, %393, !dbg !222
  br i1 %394, label %395, label %433, !dbg !222

; <label>:395                                     ; preds = %390
  %396 = load i64* %i, align 8, !dbg !224
  %397 = sitofp i64 %396 to double, !dbg !224
  %398 = load double* %x, align 8, !dbg !224
  %399 = fmul double %397, %398, !dbg !224
  store double %399, double* %u, align 8, !dbg !224
  %400 = load double* %u, align 8, !dbg !226
  %401 = load double* %u, align 8, !dbg !226
  %402 = fmul double %400, %401, !dbg !226
  store double %402, double* %w, align 8, !dbg !226
  %403 = load double* %s, align 8, !dbg !227
  %404 = load double* %w, align 8, !dbg !227
  %405 = load double* %w, align 8, !dbg !227
  %406 = load double* %w, align 8, !dbg !227
  %407 = load double* %w, align 8, !dbg !227
  %408 = load double* %w, align 8, !dbg !227
  %409 = load double* @B6, align 8, !dbg !227
  %410 = load double* %w, align 8, !dbg !227
  %411 = fmul double %409, %410, !dbg !227
  %412 = load double* @B5, align 8, !dbg !227
  %413 = fadd double %411, %412, !dbg !227
  %414 = fmul double %408, %413, !dbg !227
  %415 = load double* @B4, align 8, !dbg !227
  %416 = fadd double %414, %415, !dbg !227
  %417 = fmul double %407, %416, !dbg !227
  %418 = load double* @B3, align 8, !dbg !227
  %419 = fadd double %417, %418, !dbg !227
  %420 = fmul double %406, %419, !dbg !227
  %421 = load double* @B2, align 8, !dbg !227
  %422 = fadd double %420, %421, !dbg !227
  %423 = fmul double %405, %422, !dbg !227
  %424 = load double* @B1, align 8, !dbg !227
  %425 = fadd double %423, %424, !dbg !227
  %426 = fmul double %404, %425, !dbg !227
  %427 = fadd double %403, %426, !dbg !227
  %428 = load double* @one, align 8, !dbg !227
  %429 = fadd double %427, %428, !dbg !227
  store double %429, double* %s, align 8, !dbg !227
  br label %430, !dbg !228

; <label>:430                                     ; preds = %395
  %431 = load i64* %i, align 8, !dbg !222
  %432 = add nsw i64 %431, 1, !dbg !222
  store i64 %432, i64* %i, align 8, !dbg !222
  br label %390, !dbg !222

; <label>:433                                     ; preds = %390
  %434 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !229
  %435 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !230
  %436 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !230
  %437 = fmul double %435, %436, !dbg !230
  %438 = load double* @nulltime, align 8, !dbg !230
  %439 = fsub double %437, %438, !dbg !230
  store double %439, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 12), align 8, !dbg !230
  %440 = load double* @piref, align 8, !dbg !231
  %441 = load double* @three, align 8, !dbg !231
  %442 = fdiv double %440, %441, !dbg !231
  store double %442, double* %u, align 8, !dbg !231
  %443 = load double* %u, align 8, !dbg !232
  %444 = load double* %u, align 8, !dbg !232
  %445 = fmul double %443, %444, !dbg !232
  store double %445, double* %w, align 8, !dbg !232
  %446 = load double* %w, align 8, !dbg !233
  %447 = load double* %w, align 8, !dbg !233
  %448 = load double* %w, align 8, !dbg !233
  %449 = load double* %w, align 8, !dbg !233
  %450 = load double* %w, align 8, !dbg !233
  %451 = load double* @B6, align 8, !dbg !233
  %452 = load double* %w, align 8, !dbg !233
  %453 = fmul double %451, %452, !dbg !233
  %454 = load double* @B5, align 8, !dbg !233
  %455 = fadd double %453, %454, !dbg !233
  %456 = fmul double %450, %455, !dbg !233
  %457 = load double* @B4, align 8, !dbg !233
  %458 = fadd double %456, %457, !dbg !233
  %459 = fmul double %449, %458, !dbg !233
  %460 = load double* @B3, align 8, !dbg !233
  %461 = fadd double %459, %460, !dbg !233
  %462 = fmul double %448, %461, !dbg !233
  %463 = load double* @B2, align 8, !dbg !233
  %464 = fadd double %462, %463, !dbg !233
  %465 = fmul double %447, %464, !dbg !233
  %466 = load double* @B1, align 8, !dbg !233
  %467 = fadd double %465, %466, !dbg !233
  %468 = fmul double %446, %467, !dbg !233
  %469 = load double* @one, align 8, !dbg !233
  %470 = fadd double %468, %469, !dbg !233
  store double %470, double* @sa, align 8, !dbg !233
  %471 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 12), align 8, !dbg !234
  %472 = fdiv double %471, 1.500000e+01, !dbg !234
  store double %472, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 13), align 8, !dbg !234
  %473 = load double* %x, align 8, !dbg !235
  %474 = load double* @sa, align 8, !dbg !235
  %475 = load double* @one, align 8, !dbg !235
  %476 = fadd double %474, %475, !dbg !235
  %477 = load double* @two, align 8, !dbg !235
  %478 = load double* %s, align 8, !dbg !235
  %479 = fmul double %477, %478, !dbg !235
  %480 = fadd double %476, %479, !dbg !235
  %481 = fmul double %473, %480, !dbg !235
  %482 = load double* @two, align 8, !dbg !235
  %483 = fdiv double %481, %482, !dbg !235
  store double %483, double* @sa, align 8, !dbg !235
  %484 = load double* @piref, align 8, !dbg !236
  %485 = load double* @three, align 8, !dbg !236
  %486 = fdiv double %484, %485, !dbg !236
  store double %486, double* %u, align 8, !dbg !236
  %487 = load double* %u, align 8, !dbg !237
  %488 = load double* %u, align 8, !dbg !237
  %489 = fmul double %487, %488, !dbg !237
  store double %489, double* %w, align 8, !dbg !237
  %490 = load double* %u, align 8, !dbg !238
  %491 = load double* @A6, align 8, !dbg !238
  %492 = load double* %w, align 8, !dbg !238
  %493 = fmul double %491, %492, !dbg !238
  %494 = load double* @A5, align 8, !dbg !238
  %495 = fadd double %493, %494, !dbg !238
  %496 = load double* %w, align 8, !dbg !238
  %497 = fmul double %495, %496, !dbg !238
  %498 = load double* @A4, align 8, !dbg !238
  %499 = fadd double %497, %498, !dbg !238
  %500 = load double* %w, align 8, !dbg !238
  %501 = fmul double %499, %500, !dbg !238
  %502 = load double* @A3, align 8, !dbg !238
  %503 = fadd double %501, %502, !dbg !238
  %504 = load double* %w, align 8, !dbg !238
  %505 = fmul double %503, %504, !dbg !238
  %506 = load double* @A2, align 8, !dbg !238
  %507 = fadd double %505, %506, !dbg !238
  %508 = load double* %w, align 8, !dbg !238
  %509 = fmul double %507, %508, !dbg !238
  %510 = load double* @A1, align 8, !dbg !238
  %511 = fadd double %509, %510, !dbg !238
  %512 = load double* %w, align 8, !dbg !238
  %513 = fmul double %511, %512, !dbg !238
  %514 = load double* @A0, align 8, !dbg !238
  %515 = fadd double %513, %514, !dbg !238
  %516 = fmul double %490, %515, !dbg !238
  store double %516, double* @sb, align 8, !dbg !238
  %517 = load double* @sa, align 8, !dbg !239
  %518 = load double* @sb, align 8, !dbg !239
  %519 = fsub double %517, %518, !dbg !239
  store double %519, double* @sc, align 8, !dbg !239
  %520 = load double* @one, align 8, !dbg !240
  %521 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 13), align 8, !dbg !240
  %522 = fdiv double %520, %521, !dbg !240
  store double %522, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 14), align 8, !dbg !240
  %523 = load double* @sc, align 8, !dbg !241
  %524 = fmul double %523, 1.000000e-30, !dbg !241
  %525 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 12), align 8, !dbg !241
  %526 = fmul double %525, 1.000000e-30, !dbg !241
  %527 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 14), align 8, !dbg !241
  %528 = fmul double %527, 1.000000e-30, !dbg !241
  %529 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str7, i32 0, i32 0), double %524, double %526, double %528), !dbg !241
  %530 = load double* @piref, align 8, !dbg !242
  %531 = load double* @three, align 8, !dbg !242
  %532 = load i64* %m, align 8, !dbg !242
  %533 = sitofp i64 %532 to double, !dbg !242
  %534 = fmul double %531, %533, !dbg !242
  %535 = fdiv double %530, %534, !dbg !242
  store double %535, double* %x, align 8, !dbg !242
  store double 0.000000e+00, double* %s, align 8, !dbg !243
  store double 0.000000e+00, double* %v, align 8, !dbg !244
  %536 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !245
  store i64 1, i64* %i, align 8, !dbg !246
  br label %537, !dbg !246

; <label>:537                                     ; preds = %606, %433
  %538 = load i64* %i, align 8, !dbg !246
  %539 = load i64* %m, align 8, !dbg !246
  %540 = sub nsw i64 %539, 1, !dbg !246
  %541 = icmp sle i64 %538, %540, !dbg !246
  br i1 %541, label %542, label %609, !dbg !246

; <label>:542                                     ; preds = %537
  %543 = load i64* %i, align 8, !dbg !248
  %544 = sitofp i64 %543 to double, !dbg !248
  %545 = load double* %x, align 8, !dbg !248
  %546 = fmul double %544, %545, !dbg !248
  store double %546, double* %u, align 8, !dbg !248
  %547 = load double* %u, align 8, !dbg !250
  %548 = load double* %u, align 8, !dbg !250
  %549 = fmul double %547, %548, !dbg !250
  store double %549, double* %w, align 8, !dbg !250
  %550 = load double* %u, align 8, !dbg !251
  %551 = load double* @A6, align 8, !dbg !251
  %552 = load double* %w, align 8, !dbg !251
  %553 = fmul double %551, %552, !dbg !251
  %554 = load double* @A5, align 8, !dbg !251
  %555 = fadd double %553, %554, !dbg !251
  %556 = load double* %w, align 8, !dbg !251
  %557 = fmul double %555, %556, !dbg !251
  %558 = load double* @A4, align 8, !dbg !251
  %559 = fadd double %557, %558, !dbg !251
  %560 = load double* %w, align 8, !dbg !251
  %561 = fmul double %559, %560, !dbg !251
  %562 = load double* @A3, align 8, !dbg !251
  %563 = fadd double %561, %562, !dbg !251
  %564 = load double* %w, align 8, !dbg !251
  %565 = fmul double %563, %564, !dbg !251
  %566 = load double* @A2, align 8, !dbg !251
  %567 = fadd double %565, %566, !dbg !251
  %568 = load double* %w, align 8, !dbg !251
  %569 = fmul double %567, %568, !dbg !251
  %570 = load double* @A1, align 8, !dbg !251
  %571 = fadd double %569, %570, !dbg !251
  %572 = load double* %w, align 8, !dbg !251
  %573 = fmul double %571, %572, !dbg !251
  %574 = load double* @one, align 8, !dbg !251
  %575 = fadd double %573, %574, !dbg !251
  %576 = fmul double %550, %575, !dbg !251
  store double %576, double* %v, align 8, !dbg !251
  %577 = load double* %s, align 8, !dbg !252
  %578 = load double* %v, align 8, !dbg !252
  %579 = load double* %w, align 8, !dbg !252
  %580 = load double* %w, align 8, !dbg !252
  %581 = load double* %w, align 8, !dbg !252
  %582 = load double* %w, align 8, !dbg !252
  %583 = load double* %w, align 8, !dbg !252
  %584 = load double* @B6, align 8, !dbg !252
  %585 = load double* %w, align 8, !dbg !252
  %586 = fmul double %584, %585, !dbg !252
  %587 = load double* @B5, align 8, !dbg !252
  %588 = fadd double %586, %587, !dbg !252
  %589 = fmul double %583, %588, !dbg !252
  %590 = load double* @B4, align 8, !dbg !252
  %591 = fadd double %589, %590, !dbg !252
  %592 = fmul double %582, %591, !dbg !252
  %593 = load double* @B3, align 8, !dbg !252
  %594 = fadd double %592, %593, !dbg !252
  %595 = fmul double %581, %594, !dbg !252
  %596 = load double* @B2, align 8, !dbg !252
  %597 = fadd double %595, %596, !dbg !252
  %598 = fmul double %580, %597, !dbg !252
  %599 = load double* @B1, align 8, !dbg !252
  %600 = fadd double %598, %599, !dbg !252
  %601 = fmul double %579, %600, !dbg !252
  %602 = load double* @one, align 8, !dbg !252
  %603 = fadd double %601, %602, !dbg !252
  %604 = fdiv double %578, %603, !dbg !252
  %605 = fadd double %577, %604, !dbg !252
  store double %605, double* %s, align 8, !dbg !252
  br label %606, !dbg !253

; <label>:606                                     ; preds = %542
  %607 = load i64* %i, align 8, !dbg !246
  %608 = add nsw i64 %607, 1, !dbg !246
  store i64 %608, i64* %i, align 8, !dbg !246
  br label %537, !dbg !246

; <label>:609                                     ; preds = %537
  %610 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !254
  %611 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !255
  %612 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !255
  %613 = fmul double %611, %612, !dbg !255
  %614 = load double* @nulltime, align 8, !dbg !255
  %615 = fsub double %613, %614, !dbg !255
  store double %615, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 15), align 8, !dbg !255
  %616 = load double* @piref, align 8, !dbg !256
  %617 = load double* @three, align 8, !dbg !256
  %618 = fdiv double %616, %617, !dbg !256
  store double %618, double* %u, align 8, !dbg !256
  %619 = load double* %u, align 8, !dbg !257
  %620 = load double* %u, align 8, !dbg !257
  %621 = fmul double %619, %620, !dbg !257
  store double %621, double* %w, align 8, !dbg !257
  %622 = load double* %u, align 8, !dbg !258
  %623 = load double* @A6, align 8, !dbg !258
  %624 = load double* %w, align 8, !dbg !258
  %625 = fmul double %623, %624, !dbg !258
  %626 = load double* @A5, align 8, !dbg !258
  %627 = fadd double %625, %626, !dbg !258
  %628 = load double* %w, align 8, !dbg !258
  %629 = fmul double %627, %628, !dbg !258
  %630 = load double* @A4, align 8, !dbg !258
  %631 = fadd double %629, %630, !dbg !258
  %632 = load double* %w, align 8, !dbg !258
  %633 = fmul double %631, %632, !dbg !258
  %634 = load double* @A3, align 8, !dbg !258
  %635 = fadd double %633, %634, !dbg !258
  %636 = load double* %w, align 8, !dbg !258
  %637 = fmul double %635, %636, !dbg !258
  %638 = load double* @A2, align 8, !dbg !258
  %639 = fadd double %637, %638, !dbg !258
  %640 = load double* %w, align 8, !dbg !258
  %641 = fmul double %639, %640, !dbg !258
  %642 = load double* @A1, align 8, !dbg !258
  %643 = fadd double %641, %642, !dbg !258
  %644 = load double* %w, align 8, !dbg !258
  %645 = fmul double %643, %644, !dbg !258
  %646 = load double* @one, align 8, !dbg !258
  %647 = fadd double %645, %646, !dbg !258
  %648 = fmul double %622, %647, !dbg !258
  store double %648, double* @sa, align 8, !dbg !258
  %649 = load double* %w, align 8, !dbg !259
  %650 = load double* %w, align 8, !dbg !259
  %651 = load double* %w, align 8, !dbg !259
  %652 = load double* %w, align 8, !dbg !259
  %653 = load double* %w, align 8, !dbg !259
  %654 = load double* @B6, align 8, !dbg !259
  %655 = load double* %w, align 8, !dbg !259
  %656 = fmul double %654, %655, !dbg !259
  %657 = load double* @B5, align 8, !dbg !259
  %658 = fadd double %656, %657, !dbg !259
  %659 = fmul double %653, %658, !dbg !259
  %660 = load double* @B4, align 8, !dbg !259
  %661 = fadd double %659, %660, !dbg !259
  %662 = fmul double %652, %661, !dbg !259
  %663 = load double* @B3, align 8, !dbg !259
  %664 = fadd double %662, %663, !dbg !259
  %665 = fmul double %651, %664, !dbg !259
  %666 = load double* @B2, align 8, !dbg !259
  %667 = fadd double %665, %666, !dbg !259
  %668 = fmul double %650, %667, !dbg !259
  %669 = load double* @B1, align 8, !dbg !259
  %670 = fadd double %668, %669, !dbg !259
  %671 = fmul double %649, %670, !dbg !259
  %672 = load double* @one, align 8, !dbg !259
  %673 = fadd double %671, %672, !dbg !259
  store double %673, double* @sb, align 8, !dbg !259
  %674 = load double* @sa, align 8, !dbg !260
  %675 = load double* @sb, align 8, !dbg !260
  %676 = fdiv double %674, %675, !dbg !260
  store double %676, double* @sa, align 8, !dbg !260
  %677 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 15), align 8, !dbg !261
  %678 = fdiv double %677, 2.900000e+01, !dbg !261
  store double %678, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 16), align 8, !dbg !261
  %679 = load double* %x, align 8, !dbg !262
  %680 = load double* @sa, align 8, !dbg !262
  %681 = load double* @two, align 8, !dbg !262
  %682 = load double* %s, align 8, !dbg !262
  %683 = fmul double %681, %682, !dbg !262
  %684 = fadd double %680, %683, !dbg !262
  %685 = fmul double %679, %684, !dbg !262
  %686 = load double* @two, align 8, !dbg !262
  %687 = fdiv double %685, %686, !dbg !262
  store double %687, double* @sa, align 8, !dbg !262
  store double 0x3FE62E42FEFA39EF, double* @sb, align 8, !dbg !263
  %688 = load double* @sa, align 8, !dbg !264
  %689 = load double* @sb, align 8, !dbg !264
  %690 = fsub double %688, %689, !dbg !264
  store double %690, double* @sc, align 8, !dbg !264
  %691 = load double* @one, align 8, !dbg !265
  %692 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 16), align 8, !dbg !265
  %693 = fdiv double %691, %692, !dbg !265
  store double %693, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 17), align 8, !dbg !265
  %694 = load double* @sc, align 8, !dbg !266
  %695 = fmul double %694, 1.000000e-30, !dbg !266
  %696 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 15), align 8, !dbg !266
  %697 = fmul double %696, 1.000000e-30, !dbg !266
  %698 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 17), align 8, !dbg !266
  %699 = fmul double %698, 1.000000e-30, !dbg !266
  %700 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str8, i32 0, i32 0), double %695, double %697, double %699), !dbg !266
  %701 = load double* @piref, align 8, !dbg !267
  %702 = load double* @four, align 8, !dbg !267
  %703 = load i64* %m, align 8, !dbg !267
  %704 = sitofp i64 %703 to double, !dbg !267
  %705 = fmul double %702, %704, !dbg !267
  %706 = fdiv double %701, %705, !dbg !267
  store double %706, double* %x, align 8, !dbg !267
  store double 0.000000e+00, double* %s, align 8, !dbg !268
  store double 0.000000e+00, double* %v, align 8, !dbg !269
  %707 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !270
  store i64 1, i64* %i, align 8, !dbg !271
  br label %708, !dbg !271

; <label>:708                                     ; preds = %777, %609
  %709 = load i64* %i, align 8, !dbg !271
  %710 = load i64* %m, align 8, !dbg !271
  %711 = sub nsw i64 %710, 1, !dbg !271
  %712 = icmp sle i64 %709, %711, !dbg !271
  br i1 %712, label %713, label %780, !dbg !271

; <label>:713                                     ; preds = %708
  %714 = load i64* %i, align 8, !dbg !273
  %715 = sitofp i64 %714 to double, !dbg !273
  %716 = load double* %x, align 8, !dbg !273
  %717 = fmul double %715, %716, !dbg !273
  store double %717, double* %u, align 8, !dbg !273
  %718 = load double* %u, align 8, !dbg !275
  %719 = load double* %u, align 8, !dbg !275
  %720 = fmul double %718, %719, !dbg !275
  store double %720, double* %w, align 8, !dbg !275
  %721 = load double* %u, align 8, !dbg !276
  %722 = load double* @A6, align 8, !dbg !276
  %723 = load double* %w, align 8, !dbg !276
  %724 = fmul double %722, %723, !dbg !276
  %725 = load double* @A5, align 8, !dbg !276
  %726 = fadd double %724, %725, !dbg !276
  %727 = load double* %w, align 8, !dbg !276
  %728 = fmul double %726, %727, !dbg !276
  %729 = load double* @A4, align 8, !dbg !276
  %730 = fadd double %728, %729, !dbg !276
  %731 = load double* %w, align 8, !dbg !276
  %732 = fmul double %730, %731, !dbg !276
  %733 = load double* @A3, align 8, !dbg !276
  %734 = fadd double %732, %733, !dbg !276
  %735 = load double* %w, align 8, !dbg !276
  %736 = fmul double %734, %735, !dbg !276
  %737 = load double* @A2, align 8, !dbg !276
  %738 = fadd double %736, %737, !dbg !276
  %739 = load double* %w, align 8, !dbg !276
  %740 = fmul double %738, %739, !dbg !276
  %741 = load double* @A1, align 8, !dbg !276
  %742 = fadd double %740, %741, !dbg !276
  %743 = load double* %w, align 8, !dbg !276
  %744 = fmul double %742, %743, !dbg !276
  %745 = load double* @one, align 8, !dbg !276
  %746 = fadd double %744, %745, !dbg !276
  %747 = fmul double %721, %746, !dbg !276
  store double %747, double* %v, align 8, !dbg !276
  %748 = load double* %s, align 8, !dbg !277
  %749 = load double* %v, align 8, !dbg !277
  %750 = load double* %w, align 8, !dbg !277
  %751 = load double* %w, align 8, !dbg !277
  %752 = load double* %w, align 8, !dbg !277
  %753 = load double* %w, align 8, !dbg !277
  %754 = load double* %w, align 8, !dbg !277
  %755 = load double* @B6, align 8, !dbg !277
  %756 = load double* %w, align 8, !dbg !277
  %757 = fmul double %755, %756, !dbg !277
  %758 = load double* @B5, align 8, !dbg !277
  %759 = fadd double %757, %758, !dbg !277
  %760 = fmul double %754, %759, !dbg !277
  %761 = load double* @B4, align 8, !dbg !277
  %762 = fadd double %760, %761, !dbg !277
  %763 = fmul double %753, %762, !dbg !277
  %764 = load double* @B3, align 8, !dbg !277
  %765 = fadd double %763, %764, !dbg !277
  %766 = fmul double %752, %765, !dbg !277
  %767 = load double* @B2, align 8, !dbg !277
  %768 = fadd double %766, %767, !dbg !277
  %769 = fmul double %751, %768, !dbg !277
  %770 = load double* @B1, align 8, !dbg !277
  %771 = fadd double %769, %770, !dbg !277
  %772 = fmul double %750, %771, !dbg !277
  %773 = load double* @one, align 8, !dbg !277
  %774 = fadd double %772, %773, !dbg !277
  %775 = fmul double %749, %774, !dbg !277
  %776 = fadd double %748, %775, !dbg !277
  store double %776, double* %s, align 8, !dbg !277
  br label %777, !dbg !278

; <label>:777                                     ; preds = %713
  %778 = load i64* %i, align 8, !dbg !271
  %779 = add nsw i64 %778, 1, !dbg !271
  store i64 %779, i64* %i, align 8, !dbg !271
  br label %708, !dbg !271

; <label>:780                                     ; preds = %708
  %781 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !279
  %782 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !280
  %783 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !280
  %784 = fmul double %782, %783, !dbg !280
  %785 = load double* @nulltime, align 8, !dbg !280
  %786 = fsub double %784, %785, !dbg !280
  store double %786, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 18), align 8, !dbg !280
  %787 = load double* @piref, align 8, !dbg !281
  %788 = load double* @four, align 8, !dbg !281
  %789 = fdiv double %787, %788, !dbg !281
  store double %789, double* %u, align 8, !dbg !281
  %790 = load double* %u, align 8, !dbg !282
  %791 = load double* %u, align 8, !dbg !282
  %792 = fmul double %790, %791, !dbg !282
  store double %792, double* %w, align 8, !dbg !282
  %793 = load double* %u, align 8, !dbg !283
  %794 = load double* @A6, align 8, !dbg !283
  %795 = load double* %w, align 8, !dbg !283
  %796 = fmul double %794, %795, !dbg !283
  %797 = load double* @A5, align 8, !dbg !283
  %798 = fadd double %796, %797, !dbg !283
  %799 = load double* %w, align 8, !dbg !283
  %800 = fmul double %798, %799, !dbg !283
  %801 = load double* @A4, align 8, !dbg !283
  %802 = fadd double %800, %801, !dbg !283
  %803 = load double* %w, align 8, !dbg !283
  %804 = fmul double %802, %803, !dbg !283
  %805 = load double* @A3, align 8, !dbg !283
  %806 = fadd double %804, %805, !dbg !283
  %807 = load double* %w, align 8, !dbg !283
  %808 = fmul double %806, %807, !dbg !283
  %809 = load double* @A2, align 8, !dbg !283
  %810 = fadd double %808, %809, !dbg !283
  %811 = load double* %w, align 8, !dbg !283
  %812 = fmul double %810, %811, !dbg !283
  %813 = load double* @A1, align 8, !dbg !283
  %814 = fadd double %812, %813, !dbg !283
  %815 = load double* %w, align 8, !dbg !283
  %816 = fmul double %814, %815, !dbg !283
  %817 = load double* @one, align 8, !dbg !283
  %818 = fadd double %816, %817, !dbg !283
  %819 = fmul double %793, %818, !dbg !283
  store double %819, double* @sa, align 8, !dbg !283
  %820 = load double* %w, align 8, !dbg !284
  %821 = load double* %w, align 8, !dbg !284
  %822 = load double* %w, align 8, !dbg !284
  %823 = load double* %w, align 8, !dbg !284
  %824 = load double* %w, align 8, !dbg !284
  %825 = load double* @B6, align 8, !dbg !284
  %826 = load double* %w, align 8, !dbg !284
  %827 = fmul double %825, %826, !dbg !284
  %828 = load double* @B5, align 8, !dbg !284
  %829 = fadd double %827, %828, !dbg !284
  %830 = fmul double %824, %829, !dbg !284
  %831 = load double* @B4, align 8, !dbg !284
  %832 = fadd double %830, %831, !dbg !284
  %833 = fmul double %823, %832, !dbg !284
  %834 = load double* @B3, align 8, !dbg !284
  %835 = fadd double %833, %834, !dbg !284
  %836 = fmul double %822, %835, !dbg !284
  %837 = load double* @B2, align 8, !dbg !284
  %838 = fadd double %836, %837, !dbg !284
  %839 = fmul double %821, %838, !dbg !284
  %840 = load double* @B1, align 8, !dbg !284
  %841 = fadd double %839, %840, !dbg !284
  %842 = fmul double %820, %841, !dbg !284
  %843 = load double* @one, align 8, !dbg !284
  %844 = fadd double %842, %843, !dbg !284
  store double %844, double* @sb, align 8, !dbg !284
  %845 = load double* @sa, align 8, !dbg !285
  %846 = load double* @sb, align 8, !dbg !285
  %847 = fmul double %845, %846, !dbg !285
  store double %847, double* @sa, align 8, !dbg !285
  %848 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 18), align 8, !dbg !286
  %849 = fdiv double %848, 2.900000e+01, !dbg !286
  store double %849, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 19), align 8, !dbg !286
  %850 = load double* %x, align 8, !dbg !287
  %851 = load double* @sa, align 8, !dbg !287
  %852 = load double* @two, align 8, !dbg !287
  %853 = load double* %s, align 8, !dbg !287
  %854 = fmul double %852, %853, !dbg !287
  %855 = fadd double %851, %854, !dbg !287
  %856 = fmul double %850, %855, !dbg !287
  %857 = load double* @two, align 8, !dbg !287
  %858 = fdiv double %856, %857, !dbg !287
  store double %858, double* @sa, align 8, !dbg !287
  store double 2.500000e-01, double* @sb, align 8, !dbg !288
  %859 = load double* @sa, align 8, !dbg !289
  %860 = load double* @sb, align 8, !dbg !289
  %861 = fsub double %859, %860, !dbg !289
  store double %861, double* @sc, align 8, !dbg !289
  %862 = load double* @one, align 8, !dbg !290
  %863 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 19), align 8, !dbg !290
  %864 = fdiv double %862, %863, !dbg !290
  store double %864, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 20), align 8, !dbg !290
  %865 = load double* @sc, align 8, !dbg !291
  %866 = fmul double %865, 1.000000e-30, !dbg !291
  %867 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 18), align 8, !dbg !291
  %868 = fmul double %867, 1.000000e-30, !dbg !291
  %869 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 20), align 8, !dbg !291
  %870 = fmul double %869, 1.000000e-30, !dbg !291
  %871 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str9, i32 0, i32 0), double %866, double %868, double %870), !dbg !291
  store double 0.000000e+00, double* %s, align 8, !dbg !292
  %872 = load double* @one, align 8, !dbg !293
  store double %872, double* %w, align 8, !dbg !293
  store double 0x40599541F7F192A4, double* @sa, align 8, !dbg !294
  %873 = load double* @sa, align 8, !dbg !295
  %874 = load i64* %m, align 8, !dbg !295
  %875 = sitofp i64 %874 to double, !dbg !295
  %876 = fdiv double %873, %875, !dbg !295
  store double %876, double* %v, align 8, !dbg !295
  %877 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !296
  store i64 1, i64* %i, align 8, !dbg !297
  br label %878, !dbg !297

; <label>:878                                     ; preds = %912, %780
  %879 = load i64* %i, align 8, !dbg !297
  %880 = load i64* %m, align 8, !dbg !297
  %881 = sub nsw i64 %880, 1, !dbg !297
  %882 = icmp sle i64 %879, %881, !dbg !297
  br i1 %882, label %883, label %915, !dbg !297

; <label>:883                                     ; preds = %878
  %884 = load i64* %i, align 8, !dbg !299
  %885 = sitofp i64 %884 to double, !dbg !299
  %886 = load double* %v, align 8, !dbg !299
  %887 = fmul double %885, %886, !dbg !299
  store double %887, double* %x, align 8, !dbg !299
  %888 = load double* %x, align 8, !dbg !301
  %889 = load double* %x, align 8, !dbg !301
  %890 = fmul double %888, %889, !dbg !301
  store double %890, double* %u, align 8, !dbg !301
  %891 = load double* %s, align 8, !dbg !302
  %892 = load double* %w, align 8, !dbg !302
  %893 = load double* %x, align 8, !dbg !302
  %894 = load double* %w, align 8, !dbg !302
  %895 = fadd double %893, %894, !dbg !302
  %896 = fdiv double %892, %895, !dbg !302
  %897 = fsub double %891, %896, !dbg !302
  %898 = load double* %x, align 8, !dbg !302
  %899 = load double* %u, align 8, !dbg !302
  %900 = load double* %w, align 8, !dbg !302
  %901 = fadd double %899, %900, !dbg !302
  %902 = fdiv double %898, %901, !dbg !302
  %903 = fsub double %897, %902, !dbg !302
  %904 = load double* %u, align 8, !dbg !302
  %905 = load double* %x, align 8, !dbg !302
  %906 = load double* %u, align 8, !dbg !302
  %907 = fmul double %905, %906, !dbg !302
  %908 = load double* %w, align 8, !dbg !302
  %909 = fadd double %907, %908, !dbg !302
  %910 = fdiv double %904, %909, !dbg !302
  %911 = fsub double %903, %910, !dbg !302
  store double %911, double* %s, align 8, !dbg !302
  br label %912, !dbg !303

; <label>:912                                     ; preds = %883
  %913 = load i64* %i, align 8, !dbg !297
  %914 = add nsw i64 %913, 1, !dbg !297
  store i64 %914, i64* %i, align 8, !dbg !297
  br label %878, !dbg !297

; <label>:915                                     ; preds = %878
  %916 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !304
  %917 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !305
  %918 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !305
  %919 = fmul double %917, %918, !dbg !305
  %920 = load double* @nulltime, align 8, !dbg !305
  %921 = fsub double %919, %920, !dbg !305
  store double %921, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 21), align 8, !dbg !305
  %922 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 21), align 8, !dbg !306
  %923 = fdiv double %922, 1.200000e+01, !dbg !306
  store double %923, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 22), align 8, !dbg !306
  %924 = load double* @sa, align 8, !dbg !307
  store double %924, double* %x, align 8, !dbg !307
  %925 = load double* %x, align 8, !dbg !308
  %926 = load double* %x, align 8, !dbg !308
  %927 = fmul double %925, %926, !dbg !308
  store double %927, double* %u, align 8, !dbg !308
  %928 = load double* %w, align 8, !dbg !309
  %929 = fsub double -0.000000e+00, %928, !dbg !309
  %930 = load double* %w, align 8, !dbg !309
  %931 = load double* %x, align 8, !dbg !309
  %932 = load double* %w, align 8, !dbg !309
  %933 = fadd double %931, %932, !dbg !309
  %934 = fdiv double %930, %933, !dbg !309
  %935 = fsub double %929, %934, !dbg !309
  %936 = load double* %x, align 8, !dbg !309
  %937 = load double* %u, align 8, !dbg !309
  %938 = load double* %w, align 8, !dbg !309
  %939 = fadd double %937, %938, !dbg !309
  %940 = fdiv double %936, %939, !dbg !309
  %941 = fsub double %935, %940, !dbg !309
  %942 = load double* %u, align 8, !dbg !309
  %943 = load double* %x, align 8, !dbg !309
  %944 = load double* %u, align 8, !dbg !309
  %945 = fmul double %943, %944, !dbg !309
  %946 = load double* %w, align 8, !dbg !309
  %947 = fadd double %945, %946, !dbg !309
  %948 = fdiv double %942, %947, !dbg !309
  %949 = fsub double %941, %948, !dbg !309
  store double %949, double* @sa, align 8, !dbg !309
  %950 = load double* %v, align 8, !dbg !310
  %951 = fmul double 1.800000e+01, %950, !dbg !310
  %952 = load double* @sa, align 8, !dbg !310
  %953 = load double* @two, align 8, !dbg !310
  %954 = load double* %s, align 8, !dbg !310
  %955 = fmul double %953, %954, !dbg !310
  %956 = fadd double %952, %955, !dbg !310
  %957 = fmul double %951, %956, !dbg !310
  store double %957, double* @sa, align 8, !dbg !310
  %958 = load double* @sa, align 8, !dbg !311
  %959 = fptosi double %958 to i64, !dbg !311
  %960 = mul nsw i64 -2000, %959, !dbg !311
  store i64 %960, i64* %m, align 8, !dbg !311
  %961 = load i64* %m, align 8, !dbg !312
  %962 = sitofp i64 %961 to double, !dbg !312
  %963 = load double* @scale, align 8, !dbg !312
  %964 = fdiv double %962, %963, !dbg !312
  %965 = fptosi double %964 to i64, !dbg !312
  store i64 %965, i64* %m, align 8, !dbg !312
  %966 = load double* @sa, align 8, !dbg !313
  %967 = fadd double %966, 5.002000e+02, !dbg !313
  store double %967, double* @sc, align 8, !dbg !313
  %968 = load double* @one, align 8, !dbg !314
  %969 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 22), align 8, !dbg !314
  %970 = fdiv double %968, %969, !dbg !314
  store double %970, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 23), align 8, !dbg !314
  %971 = load double* @sc, align 8, !dbg !315
  %972 = fmul double %971, 1.000000e-30, !dbg !315
  %973 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 21), align 8, !dbg !315
  %974 = fmul double %973, 1.000000e-30, !dbg !315
  %975 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 23), align 8, !dbg !315
  %976 = fmul double %975, 1.000000e-30, !dbg !315
  %977 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str10, i32 0, i32 0), double %972, double %974, double %976), !dbg !315
  %978 = load double* @piref, align 8, !dbg !316
  %979 = load double* @three, align 8, !dbg !316
  %980 = load i64* %m, align 8, !dbg !316
  %981 = sitofp i64 %980 to double, !dbg !316
  %982 = fmul double %979, %981, !dbg !316
  %983 = fdiv double %978, %982, !dbg !316
  store double %983, double* %x, align 8, !dbg !316
  store double 0.000000e+00, double* %s, align 8, !dbg !317
  store double 0.000000e+00, double* %v, align 8, !dbg !318
  %984 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !319
  store i64 1, i64* %i, align 8, !dbg !320
  br label %985, !dbg !320

; <label>:985                                     ; preds = %1056, %915
  %986 = load i64* %i, align 8, !dbg !320
  %987 = load i64* %m, align 8, !dbg !320
  %988 = sub nsw i64 %987, 1, !dbg !320
  %989 = icmp sle i64 %986, %988, !dbg !320
  br i1 %989, label %990, label %1059, !dbg !320

; <label>:990                                     ; preds = %985
  %991 = load i64* %i, align 8, !dbg !322
  %992 = sitofp i64 %991 to double, !dbg !322
  %993 = load double* %x, align 8, !dbg !322
  %994 = fmul double %992, %993, !dbg !322
  store double %994, double* %u, align 8, !dbg !322
  %995 = load double* %u, align 8, !dbg !324
  %996 = load double* %u, align 8, !dbg !324
  %997 = fmul double %995, %996, !dbg !324
  store double %997, double* %w, align 8, !dbg !324
  %998 = load double* %w, align 8, !dbg !325
  %999 = load double* %w, align 8, !dbg !325
  %1000 = load double* %w, align 8, !dbg !325
  %1001 = load double* %w, align 8, !dbg !325
  %1002 = load double* %w, align 8, !dbg !325
  %1003 = load double* @B6, align 8, !dbg !325
  %1004 = load double* %w, align 8, !dbg !325
  %1005 = fmul double %1003, %1004, !dbg !325
  %1006 = load double* @B5, align 8, !dbg !325
  %1007 = fadd double %1005, %1006, !dbg !325
  %1008 = fmul double %1002, %1007, !dbg !325
  %1009 = load double* @B4, align 8, !dbg !325
  %1010 = fadd double %1008, %1009, !dbg !325
  %1011 = fmul double %1001, %1010, !dbg !325
  %1012 = load double* @B3, align 8, !dbg !325
  %1013 = fadd double %1011, %1012, !dbg !325
  %1014 = fmul double %1000, %1013, !dbg !325
  %1015 = load double* @B2, align 8, !dbg !325
  %1016 = fadd double %1014, %1015, !dbg !325
  %1017 = fmul double %999, %1016, !dbg !325
  %1018 = load double* @B1, align 8, !dbg !325
  %1019 = fadd double %1017, %1018, !dbg !325
  %1020 = fmul double %998, %1019, !dbg !325
  %1021 = load double* @one, align 8, !dbg !325
  %1022 = fadd double %1020, %1021, !dbg !325
  store double %1022, double* %v, align 8, !dbg !325
  %1023 = load double* %s, align 8, !dbg !326
  %1024 = load double* %v, align 8, !dbg !326
  %1025 = load double* %v, align 8, !dbg !326
  %1026 = fmul double %1024, %1025, !dbg !326
  %1027 = load double* %u, align 8, !dbg !326
  %1028 = fmul double %1026, %1027, !dbg !326
  %1029 = load double* @A6, align 8, !dbg !326
  %1030 = load double* %w, align 8, !dbg !326
  %1031 = fmul double %1029, %1030, !dbg !326
  %1032 = load double* @A5, align 8, !dbg !326
  %1033 = fadd double %1031, %1032, !dbg !326
  %1034 = load double* %w, align 8, !dbg !326
  %1035 = fmul double %1033, %1034, !dbg !326
  %1036 = load double* @A4, align 8, !dbg !326
  %1037 = fadd double %1035, %1036, !dbg !326
  %1038 = load double* %w, align 8, !dbg !326
  %1039 = fmul double %1037, %1038, !dbg !326
  %1040 = load double* @A3, align 8, !dbg !326
  %1041 = fadd double %1039, %1040, !dbg !326
  %1042 = load double* %w, align 8, !dbg !326
  %1043 = fmul double %1041, %1042, !dbg !326
  %1044 = load double* @A2, align 8, !dbg !326
  %1045 = fadd double %1043, %1044, !dbg !326
  %1046 = load double* %w, align 8, !dbg !326
  %1047 = fmul double %1045, %1046, !dbg !326
  %1048 = load double* @A1, align 8, !dbg !326
  %1049 = fadd double %1047, %1048, !dbg !326
  %1050 = load double* %w, align 8, !dbg !326
  %1051 = fmul double %1049, %1050, !dbg !326
  %1052 = load double* @one, align 8, !dbg !326
  %1053 = fadd double %1051, %1052, !dbg !326
  %1054 = fmul double %1028, %1053, !dbg !326
  %1055 = fadd double %1023, %1054, !dbg !326
  store double %1055, double* %s, align 8, !dbg !326
  br label %1056, !dbg !327

; <label>:1056                                    ; preds = %990
  %1057 = load i64* %i, align 8, !dbg !320
  %1058 = add nsw i64 %1057, 1, !dbg !320
  store i64 %1058, i64* %i, align 8, !dbg !320
  br label %985, !dbg !320

; <label>:1059                                    ; preds = %985
  %1060 = call i32 @dtime(double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i32 0)), !dbg !328
  %1061 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !329
  %1062 = load double* getelementptr inbounds ([3 x double]* @TimeArray, i32 0, i64 1), align 8, !dbg !329
  %1063 = fmul double %1061, %1062, !dbg !329
  %1064 = load double* @nulltime, align 8, !dbg !329
  %1065 = fsub double %1063, %1064, !dbg !329
  store double %1065, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 24), align 8, !dbg !329
  %1066 = load double* @piref, align 8, !dbg !330
  %1067 = load double* @three, align 8, !dbg !330
  %1068 = fdiv double %1066, %1067, !dbg !330
  store double %1068, double* %u, align 8, !dbg !330
  %1069 = load double* %u, align 8, !dbg !331
  %1070 = load double* %u, align 8, !dbg !331
  %1071 = fmul double %1069, %1070, !dbg !331
  store double %1071, double* %w, align 8, !dbg !331
  %1072 = load double* %u, align 8, !dbg !332
  %1073 = load double* @A6, align 8, !dbg !332
  %1074 = load double* %w, align 8, !dbg !332
  %1075 = fmul double %1073, %1074, !dbg !332
  %1076 = load double* @A5, align 8, !dbg !332
  %1077 = fadd double %1075, %1076, !dbg !332
  %1078 = load double* %w, align 8, !dbg !332
  %1079 = fmul double %1077, %1078, !dbg !332
  %1080 = load double* @A4, align 8, !dbg !332
  %1081 = fadd double %1079, %1080, !dbg !332
  %1082 = load double* %w, align 8, !dbg !332
  %1083 = fmul double %1081, %1082, !dbg !332
  %1084 = load double* @A3, align 8, !dbg !332
  %1085 = fadd double %1083, %1084, !dbg !332
  %1086 = load double* %w, align 8, !dbg !332
  %1087 = fmul double %1085, %1086, !dbg !332
  %1088 = load double* @A2, align 8, !dbg !332
  %1089 = fadd double %1087, %1088, !dbg !332
  %1090 = load double* %w, align 8, !dbg !332
  %1091 = fmul double %1089, %1090, !dbg !332
  %1092 = load double* @A1, align 8, !dbg !332
  %1093 = fadd double %1091, %1092, !dbg !332
  %1094 = load double* %w, align 8, !dbg !332
  %1095 = fmul double %1093, %1094, !dbg !332
  %1096 = load double* @one, align 8, !dbg !332
  %1097 = fadd double %1095, %1096, !dbg !332
  %1098 = fmul double %1072, %1097, !dbg !332
  store double %1098, double* @sa, align 8, !dbg !332
  %1099 = load double* %w, align 8, !dbg !333
  %1100 = load double* %w, align 8, !dbg !333
  %1101 = load double* %w, align 8, !dbg !333
  %1102 = load double* %w, align 8, !dbg !333
  %1103 = load double* %w, align 8, !dbg !333
  %1104 = load double* @B6, align 8, !dbg !333
  %1105 = load double* %w, align 8, !dbg !333
  %1106 = fmul double %1104, %1105, !dbg !333
  %1107 = load double* @B5, align 8, !dbg !333
  %1108 = fadd double %1106, %1107, !dbg !333
  %1109 = fmul double %1103, %1108, !dbg !333
  %1110 = load double* @B4, align 8, !dbg !333
  %1111 = fadd double %1109, %1110, !dbg !333
  %1112 = fmul double %1102, %1111, !dbg !333
  %1113 = load double* @B3, align 8, !dbg !333
  %1114 = fadd double %1112, %1113, !dbg !333
  %1115 = fmul double %1101, %1114, !dbg !333
  %1116 = load double* @B2, align 8, !dbg !333
  %1117 = fadd double %1115, %1116, !dbg !333
  %1118 = fmul double %1100, %1117, !dbg !333
  %1119 = load double* @B1, align 8, !dbg !333
  %1120 = fadd double %1118, %1119, !dbg !333
  %1121 = fmul double %1099, %1120, !dbg !333
  %1122 = load double* @one, align 8, !dbg !333
  %1123 = fadd double %1121, %1122, !dbg !333
  store double %1123, double* @sb, align 8, !dbg !333
  %1124 = load double* @sa, align 8, !dbg !334
  %1125 = load double* @sb, align 8, !dbg !334
  %1126 = fmul double %1124, %1125, !dbg !334
  %1127 = load double* @sb, align 8, !dbg !334
  %1128 = fmul double %1126, %1127, !dbg !334
  store double %1128, double* @sa, align 8, !dbg !334
  %1129 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 24), align 8, !dbg !335
  %1130 = fdiv double %1129, 3.000000e+01, !dbg !335
  store double %1130, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 25), align 8, !dbg !335
  %1131 = load double* %x, align 8, !dbg !336
  %1132 = load double* @sa, align 8, !dbg !336
  %1133 = load double* @two, align 8, !dbg !336
  %1134 = load double* %s, align 8, !dbg !336
  %1135 = fmul double %1133, %1134, !dbg !336
  %1136 = fadd double %1132, %1135, !dbg !336
  %1137 = fmul double %1131, %1136, !dbg !336
  %1138 = load double* @two, align 8, !dbg !336
  %1139 = fdiv double %1137, %1138, !dbg !336
  store double %1139, double* @sa, align 8, !dbg !336
  store double 0x3FD2AAAAAAAAAAAB, double* @sb, align 8, !dbg !337
  %1140 = load double* @sa, align 8, !dbg !338
  %1141 = load double* @sb, align 8, !dbg !338
  %1142 = fsub double %1140, %1141, !dbg !338
  store double %1142, double* @sc, align 8, !dbg !338
  %1143 = load double* @one, align 8, !dbg !339
  %1144 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 25), align 8, !dbg !339
  %1145 = fdiv double %1143, %1144, !dbg !339
  store double %1145, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 26), align 8, !dbg !339
  %1146 = load double* @sc, align 8, !dbg !340
  %1147 = fmul double %1146, 1.000000e-30, !dbg !340
  %1148 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 24), align 8, !dbg !340
  %1149 = fmul double %1148, 1.000000e-30, !dbg !340
  %1150 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 26), align 8, !dbg !340
  %1151 = fmul double %1150, 1.000000e-30, !dbg !340
  %1152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i32 0, i32 0), double %1147, double %1149, double %1151), !dbg !340
  %1153 = load double* @five, align 8, !dbg !341
  %1154 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 6), align 8, !dbg !341
  %1155 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 5), align 8, !dbg !341
  %1156 = fsub double %1154, %1155, !dbg !341
  %1157 = fmul double %1153, %1156, !dbg !341
  %1158 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !341
  %1159 = fadd double %1157, %1158, !dbg !341
  %1160 = fdiv double %1159, 5.200000e+01, !dbg !341
  store double %1160, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 27), align 8, !dbg !341
  %1161 = load double* @one, align 8, !dbg !342
  %1162 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 27), align 8, !dbg !342
  %1163 = fdiv double %1161, %1162, !dbg !342
  store double %1163, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 28), align 8, !dbg !342
  %1164 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 2), align 8, !dbg !343
  %1165 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !343
  %1166 = fadd double %1164, %1165, !dbg !343
  %1167 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 12), align 8, !dbg !343
  %1168 = fadd double %1166, %1167, !dbg !343
  %1169 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 15), align 8, !dbg !343
  %1170 = fadd double %1168, %1169, !dbg !343
  %1171 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 18), align 8, !dbg !343
  %1172 = fadd double %1170, %1171, !dbg !343
  store double %1172, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 29), align 8, !dbg !343
  %1173 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 29), align 8, !dbg !344
  %1174 = load double* @four, align 8, !dbg !344
  %1175 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 21), align 8, !dbg !344
  %1176 = fmul double %1174, %1175, !dbg !344
  %1177 = fadd double %1173, %1176, !dbg !344
  %1178 = fdiv double %1177, 1.520000e+02, !dbg !344
  store double %1178, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 29), align 8, !dbg !344
  %1179 = load double* @one, align 8, !dbg !345
  %1180 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 29), align 8, !dbg !345
  %1181 = fdiv double %1179, %1180, !dbg !345
  store double %1181, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 30), align 8, !dbg !345
  %1182 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 2), align 8, !dbg !346
  %1183 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !346
  %1184 = fadd double %1182, %1183, !dbg !346
  %1185 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 12), align 8, !dbg !346
  %1186 = fadd double %1184, %1185, !dbg !346
  %1187 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 15), align 8, !dbg !346
  %1188 = fadd double %1186, %1187, !dbg !346
  %1189 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 18), align 8, !dbg !346
  %1190 = fadd double %1188, %1189, !dbg !346
  store double %1190, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 31), align 8, !dbg !346
  %1191 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 31), align 8, !dbg !347
  %1192 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 21), align 8, !dbg !347
  %1193 = fadd double %1191, %1192, !dbg !347
  %1194 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 24), align 8, !dbg !347
  %1195 = fadd double %1193, %1194, !dbg !347
  %1196 = fdiv double %1195, 1.460000e+02, !dbg !347
  store double %1196, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 31), align 8, !dbg !347
  %1197 = load double* @one, align 8, !dbg !348
  %1198 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 31), align 8, !dbg !348
  %1199 = fdiv double %1197, %1198, !dbg !348
  store double %1199, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 32), align 8, !dbg !348
  %1200 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 9), align 8, !dbg !349
  %1201 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 12), align 8, !dbg !349
  %1202 = fadd double %1200, %1201, !dbg !349
  %1203 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 18), align 8, !dbg !349
  %1204 = fadd double %1202, %1203, !dbg !349
  %1205 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 24), align 8, !dbg !349
  %1206 = fadd double %1204, %1205, !dbg !349
  %1207 = fdiv double %1206, 9.100000e+01, !dbg !349
  store double %1207, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 33), align 8, !dbg !349
  %1208 = load double* @one, align 8, !dbg !350
  %1209 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 33), align 8, !dbg !350
  %1210 = fdiv double %1208, %1209, !dbg !350
  store double %1210, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 34), align 8, !dbg !350
  %1211 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !351
  %1212 = load i64* %m, align 8, !dbg !352
  %1213 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i64 %1212), !dbg !352
  %1214 = load double* @nulltime, align 8, !dbg !353
  %1215 = fmul double %1214, 1.000000e-30, !dbg !353
  %1216 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str13, i32 0, i32 0), double %1215), !dbg !353
  %1217 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 28), align 8, !dbg !354
  %1218 = fmul double %1217, 1.000000e-30, !dbg !354
  %1219 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str14, i32 0, i32 0), double %1218), !dbg !354
  %1220 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 30), align 8, !dbg !355
  %1221 = fmul double %1220, 1.000000e-30, !dbg !355
  %1222 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str15, i32 0, i32 0), double %1221), !dbg !355
  %1223 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 32), align 8, !dbg !356
  %1224 = fmul double %1223, 1.000000e-30, !dbg !356
  %1225 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i32 0, i32 0), double %1224), !dbg !356
  %1226 = load double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 34), align 8, !dbg !357
  %1227 = fmul double %1226, 1.000000e-30, !dbg !357
  %1228 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i32 0, i32 0), double %1227), !dbg !357
  ret i32 0, !dbg !358
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @dtime(double* %p) #0 {
  %1 = alloca double*, align 8
  %q = alloca double, align 8
  store double* %p, double** %1, align 8
  call void @llvm.dbg.declare(metadata !{double** %1}, metadata !359), !dbg !360
  call void @llvm.dbg.declare(metadata !{double* %q}, metadata !361), !dbg !362
  %2 = load double** %1, align 8, !dbg !363
  %3 = getelementptr inbounds double* %2, i64 2, !dbg !363
  %4 = load double* %3, align 8, !dbg !363
  store double %4, double* %q, align 8, !dbg !363
  %5 = call i32 @gettimeofday(%struct.timeval* @tnow, %struct.timezone* null) #4, !dbg !364
  %6 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i32 0, i32 0), align 8, !dbg !365
  %7 = sitofp i64 %6 to double, !dbg !365
  %8 = load i64* getelementptr inbounds (%struct.timeval* @tnow, i32 0, i32 1), align 8, !dbg !365
  %9 = sitofp i64 %8 to double, !dbg !365
  %10 = fmul double %9, 1.000000e-06, !dbg !365
  %11 = fadd double %7, %10, !dbg !365
  %12 = load double** %1, align 8, !dbg !365
  %13 = getelementptr inbounds double* %12, i64 2, !dbg !365
  store double %11, double* %13, align 8, !dbg !365
  %14 = load double** %1, align 8, !dbg !366
  %15 = getelementptr inbounds double* %14, i64 2, !dbg !366
  %16 = load double* %15, align 8, !dbg !366
  %17 = load double* %q, align 8, !dbg !366
  %18 = fsub double %16, %17, !dbg !366
  %19 = load double** %1, align 8, !dbg !366
  %20 = getelementptr inbounds double* %19, i64 1, !dbg !366
  store double %18, double* %20, align 8, !dbg !366
  ret i32 0, !dbg !367
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!76, !77}
!llvm.ident = !{!78}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !14, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c] [DW_LANG_C99]
!1 = metadata !{metadata !"flops.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 173, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 174} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dtime", metadata !"dtime", metadata !"", i32 986, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (double*)* @dtime, null, null, metadata !2, i32 988} ; [ DW_TAG_subprogram ] [line 986] [def] [scope 988] [dtime]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !12}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!13 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !48, metadata !49, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66}
!15 = metadata !{i32 786484, i32 0, null, metadata !"A0", metadata !"A0", metadata !"", metadata !5, i32 140, metadata !13, i32 0, i32 1, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!16 = metadata !{i32 786484, i32 0, null, metadata !"A1", metadata !"A1", metadata !"", metadata !5, i32 141, metadata !13, i32 0, i32 1, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!17 = metadata !{i32 786484, i32 0, null, metadata !"A2", metadata !"A2", metadata !"", metadata !5, i32 142, metadata !13, i32 0, i32 1, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"A3", metadata !"A3", metadata !"", metadata !5, i32 143, metadata !13, i32 0, i32 1, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!19 = metadata !{i32 786484, i32 0, null, metadata !"A4", metadata !"A4", metadata !"", metadata !5, i32 144, metadata !13, i32 0, i32 1, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!20 = metadata !{i32 786484, i32 0, null, metadata !"A5", metadata !"A5", metadata !"", metadata !5, i32 145, metadata !13, i32 0, i32 1, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"A6", metadata !"A6", metadata !"", metadata !5, i32 146, metadata !13, i32 0, i32 1, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!22 = metadata !{i32 786484, i32 0, null, metadata !"B0", metadata !"B0", metadata !"", metadata !5, i32 148, metadata !13, i32 0, i32 1, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!23 = metadata !{i32 786484, i32 0, null, metadata !"B1", metadata !"B1", metadata !"", metadata !5, i32 149, metadata !13, i32 0, i32 1, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"B2", metadata !"B2", metadata !"", metadata !5, i32 150, metadata !13, i32 0, i32 1, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"B3", metadata !"B3", metadata !"", metadata !5, i32 151, metadata !13, i32 0, i32 1, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"B4", metadata !"B4", metadata !"", metadata !5, i32 152, metadata !13, i32 0, i32 1, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"B5", metadata !"B5", metadata !"", metadata !5, i32 153, metadata !13, i32 0, i32 1, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!28 = metadata !{i32 786484, i32 0, null, metadata !"B6", metadata !"B6", metadata !"", metadata !5, i32 154, metadata !13, i32 0, i32 1, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"C0", metadata !"C0", metadata !"", metadata !5, i32 156, metadata !13, i32 0, i32 1, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!30 = metadata !{i32 786484, i32 0, null, metadata !"C1", metadata !"C1", metadata !"", metadata !5, i32 157, metadata !13, i32 0, i32 1, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"C2", metadata !"C2", metadata !"", metadata !5, i32 158, metadata !13, i32 0, i32 1, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"C3", metadata !"C3", metadata !"", metadata !5, i32 159, metadata !13, i32 0, i32 1, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"C4", metadata !"C4", metadata !"", metadata !5, i32 160, metadata !13, i32 0, i32 1, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"C5", metadata !"C5", metadata !"", metadata !5, i32 161, metadata !13, i32 0, i32 1, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"C6", metadata !"C6", metadata !"", metadata !5, i32 162, metadata !13, i32 0, i32 1, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"C7", metadata !"C7", metadata !"", metadata !5, i32 163, metadata !13, i32 0, i32 1, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"C8", metadata !"C8", metadata !"", metadata !5, i32 164, metadata !13, i32 0, i32 1, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!38 = metadata !{i32 786484, i32 0, null, metadata !"D1", metadata !"D1", metadata !"", metadata !5, i32 166, metadata !13, i32 0, i32 1, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!39 = metadata !{i32 786484, i32 0, null, metadata !"D2", metadata !"D2", metadata !"", metadata !5, i32 167, metadata !13, i32 0, i32 1, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"D3", metadata !"D3", metadata !"", metadata !5, i32 168, metadata !13, i32 0, i32 1, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!41 = metadata !{i32 786484, i32 0, null, metadata !"E2", metadata !"E2", metadata !"", metadata !5, i32 170, metadata !13, i32 0, i32 1, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"E3", metadata !"E3", metadata !"", metadata !5, i32 171, metadata !13, i32 0, i32 1, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"nulltime", metadata !"nulltime", metadata !"", metadata !5, i32 129, metadata !13, i32 0, i32 1, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!44 = metadata !{i32 786484, i32 0, null, metadata !"TimeArray", metadata !"TimeArray", metadata !"", metadata !5, i32 129, metadata !45, i32 0, i32 1, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!45 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !13, metadata !46, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!46 = metadata !{metadata !47}
!47 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!48 = metadata !{i32 786484, i32 0, null, metadata !"TLimit", metadata !"TLimit", metadata !"", metadata !5, i32 130, metadata !13, i32 0, i32 1, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!49 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 133, metadata !50, i32 0, i32 1, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!50 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2304, i64 64, i32 0, i32 0, metadata !13, metadata !51, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!51 = metadata !{metadata !52}
!52 = metadata !{i32 786465, i64 0, i64 36}       ; [ DW_TAG_subrange_type ] [0, 35]
!53 = metadata !{i32 786484, i32 0, null, metadata !"sa", metadata !"sa", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"sb", metadata !"sb", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"sc", metadata !"sc", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"sd", metadata !"sd", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"one", metadata !"one", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"two", metadata !"two", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"three", metadata !"three", metadata !"", metadata !5, i32 136, metadata !13, i32 0, i32 1, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"four", metadata !"four", metadata !"", metadata !5, i32 137, metadata !13, i32 0, i32 1, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"five", metadata !"five", metadata !"", metadata !5, i32 137, metadata !13, i32 0, i32 1, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!62 = metadata !{i32 786484, i32 0, null, metadata !"piref", metadata !"piref", metadata !"", metadata !5, i32 137, metadata !13, i32 0, i32 1, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!63 = metadata !{i32 786484, i32 0, null, metadata !"piprg", metadata !"piprg", metadata !"", metadata !5, i32 137, metadata !13, i32 0, i32 1, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"scale", metadata !"scale", metadata !"", metadata !5, i32 138, metadata !13, i32 0, i32 1, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"pierr", metadata !"pierr", metadata !"", metadata !5, i32 138, metadata !13, i32 0, i32 1, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"tnow", metadata !"tnow", metadata !"", metadata !5, i32 984, metadata !67, i32 0, i32 1, %struct.timeval* @tnow, null} ; [ DW_TAG_variable ] [tnow] [line 984] [def]
!67 = metadata !{i32 786451, metadata !68, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !69, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!68 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!69 = metadata !{metadata !70, metadata !74}
!70 = metadata !{i32 786445, metadata !68, metadata !67, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!71 = metadata !{i32 786454, metadata !72, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!72 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!73 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!74 = metadata !{i32 786445, metadata !68, metadata !67, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !75} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!75 = metadata !{i32 786454, metadata !72, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!76 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!77 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!78 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!79 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !5, i32 179, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 179]
!80 = metadata !{i32 179, i32 0, metadata !4, null}
!81 = metadata !{i32 786688, metadata !4, metadata !"u", metadata !5, i32 179, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 179]
!82 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 179, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 179]
!83 = metadata !{i32 786688, metadata !4, metadata !"w", metadata !5, i32 179, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 179]
!84 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 179, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 179]
!85 = metadata !{i32 786688, metadata !4, metadata !"loops", metadata !5, i32 182, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loops] [line 182]
!86 = metadata !{i32 182, i32 0, metadata !4, null}
!87 = metadata !{i32 786688, metadata !4, metadata !"NLimit", metadata !5, i32 182, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!88 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 183, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 183]
!89 = metadata !{i32 183, i32 0, metadata !4, null}
!90 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 183, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 183]
!91 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 183, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 183]
!92 = metadata !{i32 185, i32 0, metadata !4, null}
!93 = metadata !{i32 186, i32 0, metadata !4, null}
!94 = metadata !{i32 189, i32 0, metadata !4, null}
!95 = metadata !{i32 207, i32 0, metadata !4, null}
!96 = metadata !{i32 209, i32 0, metadata !4, null}
!97 = metadata !{i32 210, i32 0, metadata !4, null}
!98 = metadata !{i32 212, i32 0, metadata !4, null}
!99 = metadata !{i32 213, i32 0, metadata !4, null}
!100 = metadata !{i32 214, i32 0, metadata !4, null}
!101 = metadata !{i32 215, i32 0, metadata !4, null}
!102 = metadata !{i32 216, i32 0, metadata !4, null}
!103 = metadata !{i32 217, i32 0, metadata !4, null}
!104 = metadata !{i32 218, i32 0, metadata !4, null}
!105 = metadata !{i32 220, i32 0, metadata !4, null}
!106 = metadata !{i32 221, i32 0, metadata !4, null}
!107 = metadata !{i32 226, i32 0, metadata !4, null}
!108 = metadata !{i32 227, i32 0, metadata !4, null}
!109 = metadata !{i32 237, i32 0, metadata !4, null}
!110 = metadata !{i32 238, i32 0, metadata !4, null}
!111 = metadata !{i32 240, i32 0, metadata !4, null}
!112 = metadata !{i32 242, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !4, i32 241, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!114 = metadata !{i32 243, i32 0, metadata !113, null}
!115 = metadata !{i32 244, i32 0, metadata !113, null}
!116 = metadata !{i32 245, i32 0, metadata !113, null}
!117 = metadata !{i32 246, i32 0, metadata !113, null}
!118 = metadata !{i32 248, i32 0, metadata !113, null}
!119 = metadata !{i32 249, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !113, i32 249, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!121 = metadata !{i32 251, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !120, i32 250, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!123 = metadata !{i32 252, i32 0, metadata !122, null}
!124 = metadata !{i32 253, i32 0, metadata !122, null}
!125 = metadata !{i32 254, i32 0, metadata !122, null}
!126 = metadata !{i32 255, i32 0, metadata !113, null}
!127 = metadata !{i32 256, i32 0, metadata !113, null}
!128 = metadata !{i32 258, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !113, i32 258, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!130 = metadata !{i32 260, i32 0, metadata !113, null}
!131 = metadata !{i32 264, i32 0, metadata !4, null}
!132 = metadata !{i32 266, i32 0, metadata !4, null}
!133 = metadata !{i32 271, i32 0, metadata !4, null}
!134 = metadata !{i32 272, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !4, i32 272, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!136 = metadata !{i32 274, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !135, i32 273, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!138 = metadata !{i32 275, i32 0, metadata !4, null}
!139 = metadata !{i32 276, i32 0, metadata !4, null}
!140 = metadata !{i32 277, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!142 = metadata !{i32 279, i32 0, metadata !4, null}
!143 = metadata !{i32 281, i32 0, metadata !4, null}
!144 = metadata !{i32 282, i32 0, metadata !4, null}
!145 = metadata !{i32 284, i32 0, metadata !4, null}
!146 = metadata !{i32 285, i32 0, metadata !4, null}
!147 = metadata !{i32 286, i32 0, metadata !4, null}
!148 = metadata !{i32 287, i32 0, metadata !4, null}
!149 = metadata !{i32 288, i32 0, metadata !4, null}
!150 = metadata !{i32 289, i32 0, metadata !4, null}
!151 = metadata !{i32 294, i32 0, metadata !4, null}
!152 = metadata !{i32 299, i32 0, metadata !4, null}
!153 = metadata !{i32 310, i32 0, metadata !4, null}
!154 = metadata !{i32 311, i32 0, metadata !4, null}
!155 = metadata !{i32 313, i32 0, metadata !4, null}
!156 = metadata !{i32 314, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!158 = metadata !{i32 316, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !157, i32 315, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!160 = metadata !{i32 317, i32 0, metadata !159, null}
!161 = metadata !{i32 318, i32 0, metadata !159, null}
!162 = metadata !{i32 319, i32 0, metadata !4, null}
!163 = metadata !{i32 320, i32 0, metadata !4, null}
!164 = metadata !{i32 321, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !4, i32 321, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!166 = metadata !{i32 323, i32 0, metadata !4, null}
!167 = metadata !{i32 325, i32 0, metadata !4, null}
!168 = metadata !{i32 326, i32 0, metadata !4, null}
!169 = metadata !{i32 327, i32 0, metadata !4, null}
!170 = metadata !{i32 328, i32 0, metadata !4, null}
!171 = metadata !{i32 330, i32 0, metadata !4, null}
!172 = metadata !{i32 331, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !4, i32 331, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!174 = metadata !{i32 333, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 332, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!176 = metadata !{i32 334, i32 0, metadata !175, null}
!177 = metadata !{i32 335, i32 0, metadata !175, null}
!178 = metadata !{i32 336, i32 0, metadata !175, null}
!179 = metadata !{i32 337, i32 0, metadata !175, null}
!180 = metadata !{i32 338, i32 0, metadata !175, null}
!181 = metadata !{i32 339, i32 0, metadata !175, null}
!182 = metadata !{i32 340, i32 0, metadata !4, null}
!183 = metadata !{i32 341, i32 0, metadata !4, null}
!184 = metadata !{i32 343, i32 0, metadata !4, null}
!185 = metadata !{i32 344, i32 0, metadata !4, null}
!186 = metadata !{i32 345, i32 0, metadata !4, null}
!187 = metadata !{i32 346, i32 0, metadata !4, null}
!188 = metadata !{i32 347, i32 0, metadata !4, null}
!189 = metadata !{i32 348, i32 0, metadata !4, null}
!190 = metadata !{i32 349, i32 0, metadata !4, null}
!191 = metadata !{i32 350, i32 0, metadata !4, null}
!192 = metadata !{i32 355, i32 0, metadata !4, null}
!193 = metadata !{i32 369, i32 0, metadata !4, null}
!194 = metadata !{i32 370, i32 0, metadata !4, null}
!195 = metadata !{i32 371, i32 0, metadata !4, null}
!196 = metadata !{i32 373, i32 0, metadata !4, null}
!197 = metadata !{i32 374, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !4, i32 374, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!199 = metadata !{i32 376, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !198, i32 375, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!201 = metadata !{i32 377, i32 0, metadata !200, null}
!202 = metadata !{i32 378, i32 0, metadata !200, null}
!203 = metadata !{i32 379, i32 0, metadata !200, null}
!204 = metadata !{i32 380, i32 0, metadata !200, null}
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
!224 = metadata !{i32 419, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !223, i32 418, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!226 = metadata !{i32 420, i32 0, metadata !225, null}
!227 = metadata !{i32 421, i32 0, metadata !225, null}
!228 = metadata !{i32 422, i32 0, metadata !225, null}
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
!248 = metadata !{i32 462, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !247, i32 461, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!250 = metadata !{i32 463, i32 0, metadata !249, null}
!251 = metadata !{i32 464, i32 0, metadata !249, null}
!252 = metadata !{i32 465, i32 0, metadata !249, null}
!253 = metadata !{i32 466, i32 0, metadata !249, null}
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
!273 = metadata !{i32 506, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !272, i32 505, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!275 = metadata !{i32 507, i32 0, metadata !274, null}
!276 = metadata !{i32 508, i32 0, metadata !274, null}
!277 = metadata !{i32 509, i32 0, metadata !274, null}
!278 = metadata !{i32 510, i32 0, metadata !274, null}
!279 = metadata !{i32 511, i32 0, metadata !4, null}
!280 = metadata !{i32 512, i32 0, metadata !4, null}
!281 = metadata !{i32 514, i32 0, metadata !4, null}
!282 = metadata !{i32 515, i32 0, metadata !4, null}
!283 = metadata !{i32 516, i32 0, metadata !4, null}
!284 = metadata !{i32 517, i32 0, metadata !4, null}
!285 = metadata !{i32 518, i32 0, metadata !4, null}
!286 = metadata !{i32 520, i32 0, metadata !4, null}
!287 = metadata !{i32 521, i32 0, metadata !4, null}
!288 = metadata !{i32 522, i32 0, metadata !4, null}
!289 = metadata !{i32 523, i32 0, metadata !4, null}
!290 = metadata !{i32 524, i32 0, metadata !4, null}
!291 = metadata !{i32 529, i32 0, metadata !4, null}
!292 = metadata !{i32 546, i32 0, metadata !4, null}
!293 = metadata !{i32 547, i32 0, metadata !4, null}
!294 = metadata !{i32 548, i32 0, metadata !4, null}
!295 = metadata !{i32 549, i32 0, metadata !4, null}
!296 = metadata !{i32 551, i32 0, metadata !4, null}
!297 = metadata !{i32 552, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !4, i32 552, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!299 = metadata !{i32 554, i32 0, metadata !300, null}
!300 = metadata !{i32 786443, metadata !1, metadata !298, i32 553, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!301 = metadata !{i32 555, i32 0, metadata !300, null}
!302 = metadata !{i32 556, i32 0, metadata !300, null}
!303 = metadata !{i32 557, i32 0, metadata !300, null}
!304 = metadata !{i32 558, i32 0, metadata !4, null}
!305 = metadata !{i32 559, i32 0, metadata !4, null}
!306 = metadata !{i32 563, i32 0, metadata !4, null}
!307 = metadata !{i32 564, i32 0, metadata !4, null}
!308 = metadata !{i32 565, i32 0, metadata !4, null}
!309 = metadata !{i32 566, i32 0, metadata !4, null}
!310 = metadata !{i32 567, i32 0, metadata !4, null}
!311 = metadata !{i32 569, i32 0, metadata !4, null}
!312 = metadata !{i32 570, i32 0, metadata !4, null}
!313 = metadata !{i32 572, i32 0, metadata !4, null}
!314 = metadata !{i32 573, i32 0, metadata !4, null}
!315 = metadata !{i32 578, i32 0, metadata !4, null}
!316 = metadata !{i32 593, i32 0, metadata !4, null}
!317 = metadata !{i32 594, i32 0, metadata !4, null}
!318 = metadata !{i32 595, i32 0, metadata !4, null}
!319 = metadata !{i32 597, i32 0, metadata !4, null}
!320 = metadata !{i32 598, i32 0, metadata !321, null}
!321 = metadata !{i32 786443, metadata !1, metadata !4, i32 598, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!322 = metadata !{i32 600, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !1, metadata !321, i32 599, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops.c]
!324 = metadata !{i32 601, i32 0, metadata !323, null}
!325 = metadata !{i32 602, i32 0, metadata !323, null}
!326 = metadata !{i32 603, i32 0, metadata !323, null}
!327 = metadata !{i32 604, i32 0, metadata !323, null}
!328 = metadata !{i32 605, i32 0, metadata !4, null}
!329 = metadata !{i32 606, i32 0, metadata !4, null}
!330 = metadata !{i32 608, i32 0, metadata !4, null}
!331 = metadata !{i32 609, i32 0, metadata !4, null}
!332 = metadata !{i32 610, i32 0, metadata !4, null}
!333 = metadata !{i32 611, i32 0, metadata !4, null}
!334 = metadata !{i32 612, i32 0, metadata !4, null}
!335 = metadata !{i32 614, i32 0, metadata !4, null}
!336 = metadata !{i32 615, i32 0, metadata !4, null}
!337 = metadata !{i32 616, i32 0, metadata !4, null}
!338 = metadata !{i32 617, i32 0, metadata !4, null}
!339 = metadata !{i32 618, i32 0, metadata !4, null}
!340 = metadata !{i32 623, i32 0, metadata !4, null}
!341 = metadata !{i32 633, i32 0, metadata !4, null}
!342 = metadata !{i32 634, i32 0, metadata !4, null}
!343 = metadata !{i32 640, i32 0, metadata !4, null}
!344 = metadata !{i32 641, i32 0, metadata !4, null}
!345 = metadata !{i32 642, i32 0, metadata !4, null}
!346 = metadata !{i32 648, i32 0, metadata !4, null}
!347 = metadata !{i32 649, i32 0, metadata !4, null}
!348 = metadata !{i32 650, i32 0, metadata !4, null}
!349 = metadata !{i32 656, i32 0, metadata !4, null}
!350 = metadata !{i32 657, i32 0, metadata !4, null}
!351 = metadata !{i32 660, i32 0, metadata !4, null}
!352 = metadata !{i32 661, i32 0, metadata !4, null}
!353 = metadata !{i32 662, i32 0, metadata !4, null}
!354 = metadata !{i32 663, i32 0, metadata !4, null}
!355 = metadata !{i32 664, i32 0, metadata !4, null}
!356 = metadata !{i32 665, i32 0, metadata !4, null}
!357 = metadata !{i32 666, i32 0, metadata !4, null}
!358 = metadata !{i32 667, i32 0, metadata !4, null}
!359 = metadata !{i32 786689, metadata !9, metadata !"p", metadata !5, i32 16778203, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 987]
!360 = metadata !{i32 987, i32 0, metadata !9, null}
!361 = metadata !{i32 786688, metadata !9, metadata !"q", metadata !5, i32 989, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 989]
!362 = metadata !{i32 989, i32 0, metadata !9, null}
!363 = metadata !{i32 991, i32 0, metadata !9, null}
!364 = metadata !{i32 993, i32 0, metadata !9, null}
!365 = metadata !{i32 994, i32 0, metadata !9, null}
!366 = metadata !{i32 995, i32 0, metadata !9, null}
!367 = metadata !{i32 997, i32 0, metadata !9, null}
