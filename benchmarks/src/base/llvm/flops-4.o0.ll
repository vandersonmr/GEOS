; ModuleID = 'flops-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
@sa = common global double 0.000000e+00, align 8
@sb = common global double 0.000000e+00, align 8
@sc = common global double 0.000000e+00, align 8
@.str4 = private unnamed_addr constant [36 x i8] c"     4   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@nulltime = common global double 0.000000e+00, align 8
@TimeArray = common global [3 x double] zeroinitializer, align 16
@T = common global [36 x double] zeroinitializer, align 16
@sd = common global double 0.000000e+00, align 8
@piprg = common global double 0.000000e+00, align 8
@pierr = common global double 0.000000e+00, align 8

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
  call void @llvm.dbg.declare(metadata !{double* %s}, metadata !65), !dbg !66
  call void @llvm.dbg.declare(metadata !{double* %u}, metadata !67), !dbg !66
  call void @llvm.dbg.declare(metadata !{double* %v}, metadata !68), !dbg !66
  call void @llvm.dbg.declare(metadata !{double* %w}, metadata !69), !dbg !66
  call void @llvm.dbg.declare(metadata !{double* %x}, metadata !70), !dbg !66
  call void @llvm.dbg.declare(metadata !{i64* %loops}, metadata !71), !dbg !73
  call void @llvm.dbg.declare(metadata !{i64* %NLimit}, metadata !74), !dbg !73
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !75), !dbg !76
  call void @llvm.dbg.declare(metadata !{i64* %m}, metadata !77), !dbg !76
  call void @llvm.dbg.declare(metadata !{i64* %n}, metadata !78), !dbg !76
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !79
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0)), !dbg !80
  store i64 15625, i64* %loops, align 8, !dbg !81
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !82
  store i64 512000000, i64* %NLimit, align 8, !dbg !83
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !84
  store double 1.000000e+00, double* @one, align 8, !dbg !85
  store double 2.000000e+00, double* @two, align 8, !dbg !86
  store double 3.000000e+00, double* @three, align 8, !dbg !87
  store double 4.000000e+00, double* @four, align 8, !dbg !88
  store double 5.000000e+00, double* @five, align 8, !dbg !89
  %4 = load double* @one, align 8, !dbg !90
  store double %4, double* @scale, align 8, !dbg !90
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str2, i32 0, i32 0)), !dbg !91
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0)), !dbg !92
  %7 = load i64* %loops, align 8, !dbg !93
  %8 = mul nsw i64 %7, 10000, !dbg !93
  store i64 %8, i64* %m, align 8, !dbg !93
  %9 = load double* @A3, align 8, !dbg !94
  %10 = fsub double -0.000000e+00, %9, !dbg !94
  store double %10, double* @A3, align 8, !dbg !94
  %11 = load double* @A5, align 8, !dbg !95
  %12 = fsub double -0.000000e+00, %11, !dbg !95
  store double %12, double* @A5, align 8, !dbg !95
  %13 = load double* @piref, align 8, !dbg !96
  %14 = load double* @three, align 8, !dbg !96
  %15 = load i64* %m, align 8, !dbg !96
  %16 = sitofp i64 %15 to double, !dbg !96
  %17 = fmul double %14, %16, !dbg !96
  %18 = fdiv double %13, %17, !dbg !96
  store double %18, double* %x, align 8, !dbg !96
  store double 0.000000e+00, double* %s, align 8, !dbg !97
  store double 0.000000e+00, double* %v, align 8, !dbg !98
  store i64 1, i64* %i, align 8, !dbg !99
  br label %19, !dbg !99

; <label>:19                                      ; preds = %59, %0
  %20 = load i64* %i, align 8, !dbg !99
  %21 = load i64* %m, align 8, !dbg !99
  %22 = sub nsw i64 %21, 1, !dbg !99
  %23 = icmp sle i64 %20, %22, !dbg !99
  br i1 %23, label %24, label %62, !dbg !99

; <label>:24                                      ; preds = %19
  %25 = load i64* %i, align 8, !dbg !101
  %26 = sitofp i64 %25 to double, !dbg !101
  %27 = load double* %x, align 8, !dbg !101
  %28 = fmul double %26, %27, !dbg !101
  store double %28, double* %u, align 8, !dbg !101
  %29 = load double* %u, align 8, !dbg !103
  %30 = load double* %u, align 8, !dbg !103
  %31 = fmul double %29, %30, !dbg !103
  store double %31, double* %w, align 8, !dbg !103
  %32 = load double* %s, align 8, !dbg !104
  %33 = load double* %w, align 8, !dbg !104
  %34 = load double* %w, align 8, !dbg !104
  %35 = load double* %w, align 8, !dbg !104
  %36 = load double* %w, align 8, !dbg !104
  %37 = load double* %w, align 8, !dbg !104
  %38 = load double* @B6, align 8, !dbg !104
  %39 = load double* %w, align 8, !dbg !104
  %40 = fmul double %38, %39, !dbg !104
  %41 = load double* @B5, align 8, !dbg !104
  %42 = fadd double %40, %41, !dbg !104
  %43 = fmul double %37, %42, !dbg !104
  %44 = load double* @B4, align 8, !dbg !104
  %45 = fadd double %43, %44, !dbg !104
  %46 = fmul double %36, %45, !dbg !104
  %47 = load double* @B3, align 8, !dbg !104
  %48 = fadd double %46, %47, !dbg !104
  %49 = fmul double %35, %48, !dbg !104
  %50 = load double* @B2, align 8, !dbg !104
  %51 = fadd double %49, %50, !dbg !104
  %52 = fmul double %34, %51, !dbg !104
  %53 = load double* @B1, align 8, !dbg !104
  %54 = fadd double %52, %53, !dbg !104
  %55 = fmul double %33, %54, !dbg !104
  %56 = fadd double %32, %55, !dbg !104
  %57 = load double* @one, align 8, !dbg !104
  %58 = fadd double %56, %57, !dbg !104
  store double %58, double* %s, align 8, !dbg !104
  br label %59, !dbg !105

; <label>:59                                      ; preds = %24
  %60 = load i64* %i, align 8, !dbg !99
  %61 = add nsw i64 %60, 1, !dbg !99
  store i64 %61, i64* %i, align 8, !dbg !99
  br label %19, !dbg !99

; <label>:62                                      ; preds = %19
  %63 = load double* @piref, align 8, !dbg !106
  %64 = load double* @three, align 8, !dbg !106
  %65 = fdiv double %63, %64, !dbg !106
  store double %65, double* %u, align 8, !dbg !106
  %66 = load double* %u, align 8, !dbg !107
  %67 = load double* %u, align 8, !dbg !107
  %68 = fmul double %66, %67, !dbg !107
  store double %68, double* %w, align 8, !dbg !107
  %69 = load double* %w, align 8, !dbg !108
  %70 = load double* %w, align 8, !dbg !108
  %71 = load double* %w, align 8, !dbg !108
  %72 = load double* %w, align 8, !dbg !108
  %73 = load double* %w, align 8, !dbg !108
  %74 = load double* @B6, align 8, !dbg !108
  %75 = load double* %w, align 8, !dbg !108
  %76 = fmul double %74, %75, !dbg !108
  %77 = load double* @B5, align 8, !dbg !108
  %78 = fadd double %76, %77, !dbg !108
  %79 = fmul double %73, %78, !dbg !108
  %80 = load double* @B4, align 8, !dbg !108
  %81 = fadd double %79, %80, !dbg !108
  %82 = fmul double %72, %81, !dbg !108
  %83 = load double* @B3, align 8, !dbg !108
  %84 = fadd double %82, %83, !dbg !108
  %85 = fmul double %71, %84, !dbg !108
  %86 = load double* @B2, align 8, !dbg !108
  %87 = fadd double %85, %86, !dbg !108
  %88 = fmul double %70, %87, !dbg !108
  %89 = load double* @B1, align 8, !dbg !108
  %90 = fadd double %88, %89, !dbg !108
  %91 = fmul double %69, %90, !dbg !108
  %92 = load double* @one, align 8, !dbg !108
  %93 = fadd double %91, %92, !dbg !108
  store double %93, double* @sa, align 8, !dbg !108
  %94 = load double* %x, align 8, !dbg !109
  %95 = load double* @sa, align 8, !dbg !109
  %96 = load double* @one, align 8, !dbg !109
  %97 = fadd double %95, %96, !dbg !109
  %98 = load double* @two, align 8, !dbg !109
  %99 = load double* %s, align 8, !dbg !109
  %100 = fmul double %98, %99, !dbg !109
  %101 = fadd double %97, %100, !dbg !109
  %102 = fmul double %94, %101, !dbg !109
  %103 = load double* @two, align 8, !dbg !109
  %104 = fdiv double %102, %103, !dbg !109
  store double %104, double* @sa, align 8, !dbg !109
  %105 = load double* @piref, align 8, !dbg !110
  %106 = load double* @three, align 8, !dbg !110
  %107 = fdiv double %105, %106, !dbg !110
  store double %107, double* %u, align 8, !dbg !110
  %108 = load double* %u, align 8, !dbg !111
  %109 = load double* %u, align 8, !dbg !111
  %110 = fmul double %108, %109, !dbg !111
  store double %110, double* %w, align 8, !dbg !111
  %111 = load double* %u, align 8, !dbg !112
  %112 = load double* @A6, align 8, !dbg !112
  %113 = load double* %w, align 8, !dbg !112
  %114 = fmul double %112, %113, !dbg !112
  %115 = load double* @A5, align 8, !dbg !112
  %116 = fadd double %114, %115, !dbg !112
  %117 = load double* %w, align 8, !dbg !112
  %118 = fmul double %116, %117, !dbg !112
  %119 = load double* @A4, align 8, !dbg !112
  %120 = fadd double %118, %119, !dbg !112
  %121 = load double* %w, align 8, !dbg !112
  %122 = fmul double %120, %121, !dbg !112
  %123 = load double* @A3, align 8, !dbg !112
  %124 = fadd double %122, %123, !dbg !112
  %125 = load double* %w, align 8, !dbg !112
  %126 = fmul double %124, %125, !dbg !112
  %127 = load double* @A2, align 8, !dbg !112
  %128 = fadd double %126, %127, !dbg !112
  %129 = load double* %w, align 8, !dbg !112
  %130 = fmul double %128, %129, !dbg !112
  %131 = load double* @A1, align 8, !dbg !112
  %132 = fadd double %130, %131, !dbg !112
  %133 = load double* %w, align 8, !dbg !112
  %134 = fmul double %132, %133, !dbg !112
  %135 = load double* @A0, align 8, !dbg !112
  %136 = fadd double %134, %135, !dbg !112
  %137 = fmul double %111, %136, !dbg !112
  store double %137, double* @sb, align 8, !dbg !112
  %138 = load double* @sa, align 8, !dbg !113
  %139 = load double* @sb, align 8, !dbg !113
  %140 = fsub double %138, %139, !dbg !113
  store double %140, double* @sc, align 8, !dbg !113
  %141 = load double* @sc, align 8, !dbg !114
  %142 = fmul double %141, 1.000000e-30, !dbg !114
  %143 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0), double %142, double 0.000000e+00, double 0.000000e+00), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!62, !63}
!llvm.ident = !{!64}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !9, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-4.c] [DW_LANG_C99]
!1 = metadata !{metadata !"flops-4.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 173, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 174} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-4.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !44, metadata !45, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61}
!10 = metadata !{i32 786484, i32 0, null, metadata !"A0", metadata !"A0", metadata !"", metadata !5, i32 140, metadata !11, i32 0, i32 1, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!11 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!12 = metadata !{i32 786484, i32 0, null, metadata !"A1", metadata !"A1", metadata !"", metadata !5, i32 141, metadata !11, i32 0, i32 1, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!13 = metadata !{i32 786484, i32 0, null, metadata !"A2", metadata !"A2", metadata !"", metadata !5, i32 142, metadata !11, i32 0, i32 1, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!14 = metadata !{i32 786484, i32 0, null, metadata !"A3", metadata !"A3", metadata !"", metadata !5, i32 143, metadata !11, i32 0, i32 1, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!15 = metadata !{i32 786484, i32 0, null, metadata !"A4", metadata !"A4", metadata !"", metadata !5, i32 144, metadata !11, i32 0, i32 1, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!16 = metadata !{i32 786484, i32 0, null, metadata !"A5", metadata !"A5", metadata !"", metadata !5, i32 145, metadata !11, i32 0, i32 1, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!17 = metadata !{i32 786484, i32 0, null, metadata !"A6", metadata !"A6", metadata !"", metadata !5, i32 146, metadata !11, i32 0, i32 1, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"B0", metadata !"B0", metadata !"", metadata !5, i32 148, metadata !11, i32 0, i32 1, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!19 = metadata !{i32 786484, i32 0, null, metadata !"B1", metadata !"B1", metadata !"", metadata !5, i32 149, metadata !11, i32 0, i32 1, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!20 = metadata !{i32 786484, i32 0, null, metadata !"B2", metadata !"B2", metadata !"", metadata !5, i32 150, metadata !11, i32 0, i32 1, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"B3", metadata !"B3", metadata !"", metadata !5, i32 151, metadata !11, i32 0, i32 1, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!22 = metadata !{i32 786484, i32 0, null, metadata !"B4", metadata !"B4", metadata !"", metadata !5, i32 152, metadata !11, i32 0, i32 1, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!23 = metadata !{i32 786484, i32 0, null, metadata !"B5", metadata !"B5", metadata !"", metadata !5, i32 153, metadata !11, i32 0, i32 1, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"B6", metadata !"B6", metadata !"", metadata !5, i32 154, metadata !11, i32 0, i32 1, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"C0", metadata !"C0", metadata !"", metadata !5, i32 156, metadata !11, i32 0, i32 1, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"C1", metadata !"C1", metadata !"", metadata !5, i32 157, metadata !11, i32 0, i32 1, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"C2", metadata !"C2", metadata !"", metadata !5, i32 158, metadata !11, i32 0, i32 1, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!28 = metadata !{i32 786484, i32 0, null, metadata !"C3", metadata !"C3", metadata !"", metadata !5, i32 159, metadata !11, i32 0, i32 1, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"C4", metadata !"C4", metadata !"", metadata !5, i32 160, metadata !11, i32 0, i32 1, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!30 = metadata !{i32 786484, i32 0, null, metadata !"C5", metadata !"C5", metadata !"", metadata !5, i32 161, metadata !11, i32 0, i32 1, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"C6", metadata !"C6", metadata !"", metadata !5, i32 162, metadata !11, i32 0, i32 1, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"C7", metadata !"C7", metadata !"", metadata !5, i32 163, metadata !11, i32 0, i32 1, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"C8", metadata !"C8", metadata !"", metadata !5, i32 164, metadata !11, i32 0, i32 1, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"D1", metadata !"D1", metadata !"", metadata !5, i32 166, metadata !11, i32 0, i32 1, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"D2", metadata !"D2", metadata !"", metadata !5, i32 167, metadata !11, i32 0, i32 1, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"D3", metadata !"D3", metadata !"", metadata !5, i32 168, metadata !11, i32 0, i32 1, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"E2", metadata !"E2", metadata !"", metadata !5, i32 170, metadata !11, i32 0, i32 1, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!38 = metadata !{i32 786484, i32 0, null, metadata !"E3", metadata !"E3", metadata !"", metadata !5, i32 171, metadata !11, i32 0, i32 1, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!39 = metadata !{i32 786484, i32 0, null, metadata !"nulltime", metadata !"nulltime", metadata !"", metadata !5, i32 129, metadata !11, i32 0, i32 1, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"TimeArray", metadata !"TimeArray", metadata !"", metadata !5, i32 129, metadata !41, i32 0, i32 1, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!41 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !11, metadata !42, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!44 = metadata !{i32 786484, i32 0, null, metadata !"TLimit", metadata !"TLimit", metadata !"", metadata !5, i32 130, metadata !11, i32 0, i32 1, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!45 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 133, metadata !46, i32 0, i32 1, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!46 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2304, i64 64, i32 0, i32 0, metadata !11, metadata !47, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!47 = metadata !{metadata !48}
!48 = metadata !{i32 786465, i64 0, i64 36}       ; [ DW_TAG_subrange_type ] [0, 35]
!49 = metadata !{i32 786484, i32 0, null, metadata !"sa", metadata !"sa", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"sb", metadata !"sb", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!51 = metadata !{i32 786484, i32 0, null, metadata !"sc", metadata !"sc", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!52 = metadata !{i32 786484, i32 0, null, metadata !"sd", metadata !"sd", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!53 = metadata !{i32 786484, i32 0, null, metadata !"one", metadata !"one", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"two", metadata !"two", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"three", metadata !"three", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"four", metadata !"four", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"five", metadata !"five", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"piref", metadata !"piref", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"piprg", metadata !"piprg", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"scale", metadata !"scale", metadata !"", metadata !5, i32 138, metadata !11, i32 0, i32 1, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"pierr", metadata !"pierr", metadata !"", metadata !5, i32 138, metadata !11, i32 0, i32 1, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!62 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!63 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!64 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!65 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 179]
!66 = metadata !{i32 179, i32 0, metadata !4, null}
!67 = metadata !{i32 786688, metadata !4, metadata !"u", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 179]
!68 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 179]
!69 = metadata !{i32 786688, metadata !4, metadata !"w", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 179]
!70 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 179]
!71 = metadata !{i32 786688, metadata !4, metadata !"loops", metadata !5, i32 182, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loops] [line 182]
!72 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!73 = metadata !{i32 182, i32 0, metadata !4, null}
!74 = metadata !{i32 786688, metadata !4, metadata !"NLimit", metadata !5, i32 182, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!75 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 183, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 183]
!76 = metadata !{i32 183, i32 0, metadata !4, null}
!77 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 183, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 183]
!78 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 183, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 183]
!79 = metadata !{i32 185, i32 0, metadata !4, null}
!80 = metadata !{i32 186, i32 0, metadata !4, null}
!81 = metadata !{i32 189, i32 0, metadata !4, null}
!82 = metadata !{i32 207, i32 0, metadata !4, null}
!83 = metadata !{i32 208, i32 0, metadata !4, null}
!84 = metadata !{i32 210, i32 0, metadata !4, null}
!85 = metadata !{i32 211, i32 0, metadata !4, null}
!86 = metadata !{i32 212, i32 0, metadata !4, null}
!87 = metadata !{i32 213, i32 0, metadata !4, null}
!88 = metadata !{i32 214, i32 0, metadata !4, null}
!89 = metadata !{i32 215, i32 0, metadata !4, null}
!90 = metadata !{i32 216, i32 0, metadata !4, null}
!91 = metadata !{i32 218, i32 0, metadata !4, null}
!92 = metadata !{i32 219, i32 0, metadata !4, null}
!93 = metadata !{i32 226, i32 0, metadata !4, null}
!94 = metadata !{i32 238, i32 0, metadata !4, null}
!95 = metadata !{i32 239, i32 0, metadata !4, null}
!96 = metadata !{i32 240, i32 0, metadata !4, null}
!97 = metadata !{i32 241, i32 0, metadata !4, null}
!98 = metadata !{i32 242, i32 0, metadata !4, null}
!99 = metadata !{i32 244, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !4, i32 244, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-4.c]
!101 = metadata !{i32 246, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !100, i32 245, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-4.c]
!103 = metadata !{i32 247, i32 0, metadata !102, null}
!104 = metadata !{i32 248, i32 0, metadata !102, null}
!105 = metadata !{i32 249, i32 0, metadata !102, null}
!106 = metadata !{i32 251, i32 0, metadata !4, null}
!107 = metadata !{i32 252, i32 0, metadata !4, null}
!108 = metadata !{i32 253, i32 0, metadata !4, null}
!109 = metadata !{i32 255, i32 0, metadata !4, null}
!110 = metadata !{i32 256, i32 0, metadata !4, null}
!111 = metadata !{i32 257, i32 0, metadata !4, null}
!112 = metadata !{i32 258, i32 0, metadata !4, null}
!113 = metadata !{i32 259, i32 0, metadata !4, null}
!114 = metadata !{i32 264, i32 0, metadata !4, null}
!115 = metadata !{i32 269, i32 0, metadata !4, null}
