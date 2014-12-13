; ModuleID = 'partialsums.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%.9f\09%s\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"(2/3)^k\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"k^-0.5\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"1/k(k+1)\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"Flint Hills\00", align 1
@.str5 = private unnamed_addr constant [14 x i8] c"Cookson Hills\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"Harmonic\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Riemann Zeta\00", align 1
@.str8 = private unnamed_addr constant [21 x i8] c"Alternating Harmonic\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"Gregory\00", align 1

; Function Attrs: nounwind uwtable
define <2 x double> @make_vec(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %v = alloca <2 x double>, align 16
  %tmp = alloca double*, align 8
  store double %a, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !26), !dbg !27
  store double %b, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !28), !dbg !27
  call void @llvm.dbg.declare(metadata !{<2 x double>* %v}, metadata !29), !dbg !30
  call void @llvm.dbg.declare(metadata !{double** %tmp}, metadata !31), !dbg !33
  %3 = bitcast <2 x double>* %v to double*, !dbg !34
  store double* %3, double** %tmp, align 8, !dbg !34
  %4 = load double* %1, align 8, !dbg !34
  %5 = load double** %tmp, align 8, !dbg !34
  store double %4, double* %5, align 8, !dbg !34
  %6 = load double* %2, align 8, !dbg !34
  %7 = load double** %tmp, align 8, !dbg !34
  %8 = getelementptr inbounds double* %7, i64 1, !dbg !34
  store double %6, double* %8, align 8, !dbg !34
  %9 = load <2 x double>* %v, align 16, !dbg !35
  ret <2 x double> %9, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @sum_vec(<2 x double> %x) #0 {
  %1 = alloca <2 x double>, align 16
  %tmp = alloca double*, align 8
  store <2 x double> %x, <2 x double>* %1, align 16
  call void @llvm.dbg.declare(metadata !{<2 x double>* %1}, metadata !36), !dbg !37
  call void @llvm.dbg.declare(metadata !{double** %tmp}, metadata !38), !dbg !39
  %2 = bitcast <2 x double>* %1 to double*, !dbg !39
  store double* %2, double** %tmp, align 8, !dbg !39
  %3 = load double** %tmp, align 8, !dbg !40
  %4 = load double* %3, align 8, !dbg !40
  %5 = load double** %tmp, align 8, !dbg !40
  %6 = getelementptr inbounds double* %5, i64 1, !dbg !40
  %7 = load double* %6, align 8, !dbg !40
  %8 = fadd double %4, %7, !dbg !40
  ret double %8, !dbg !40
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %twoThrd = alloca double, align 8
  %sqrts = alloca double, align 8
  %Flint = alloca double, align 8
  %Cookson = alloca double, align 8
  %Harmonic = alloca <2 x double>, align 16
  %zeta = alloca <2 x double>, align 16
  %poly = alloca <2 x double>, align 16
  %alt = alloca <2 x double>, align 16
  %Gregory = alloca <2 x double>, align 16
  %zero = alloca <2 x double>, align 16
  %one = alloca <2 x double>, align 16
  %two = alloca <2 x double>, align 16
  %init = alloca <2 x double>, align 16
  %m_one = alloca <2 x double>, align 16
  %kv = alloca <2 x double>, align 16
  %av = alloca <2 x double>, align 16
  %k = alloca double, align 8
  %k3 = alloca double, align 8
  %s = alloca double, align 8
  %c = alloca double, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !41), !dbg !42
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !43), !dbg !42
  call void @llvm.dbg.declare(metadata !{double* %twoThrd}, metadata !44), !dbg !45
  store double 0.000000e+00, double* %twoThrd, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata !{double* %sqrts}, metadata !46), !dbg !45
  store double 0.000000e+00, double* %sqrts, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata !{double* %Flint}, metadata !47), !dbg !45
  store double 0.000000e+00, double* %Flint, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata !{double* %Cookson}, metadata !48), !dbg !45
  store double 0.000000e+00, double* %Cookson, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata !{<2 x double>* %Harmonic}, metadata !49), !dbg !50
  call void @llvm.dbg.declare(metadata !{<2 x double>* %zeta}, metadata !51), !dbg !50
  call void @llvm.dbg.declare(metadata !{<2 x double>* %poly}, metadata !52), !dbg !50
  call void @llvm.dbg.declare(metadata !{<2 x double>* %alt}, metadata !53), !dbg !50
  call void @llvm.dbg.declare(metadata !{<2 x double>* %Gregory}, metadata !54), !dbg !50
  call void @llvm.dbg.declare(metadata !{<2 x double>* %zero}, metadata !55), !dbg !56
  call void @llvm.dbg.declare(metadata !{<2 x double>* %one}, metadata !57), !dbg !56
  call void @llvm.dbg.declare(metadata !{<2 x double>* %two}, metadata !58), !dbg !56
  call void @llvm.dbg.declare(metadata !{<2 x double>* %init}, metadata !59), !dbg !56
  call void @llvm.dbg.declare(metadata !{<2 x double>* %m_one}, metadata !60), !dbg !56
  call void @llvm.dbg.declare(metadata !{<2 x double>* %kv}, metadata !61), !dbg !56
  call void @llvm.dbg.declare(metadata !{<2 x double>* %av}, metadata !62), !dbg !56
  call void @llvm.dbg.declare(metadata !{double* %k}, metadata !63), !dbg !64
  call void @llvm.dbg.declare(metadata !{double* %k3}, metadata !65), !dbg !64
  call void @llvm.dbg.declare(metadata !{double* %s}, metadata !66), !dbg !64
  call void @llvm.dbg.declare(metadata !{double* %c}, metadata !67), !dbg !64
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !68), !dbg !69
  store i32 2500000, i32* %n, align 4, !dbg !69
  %4 = call <2 x double> @make_vec(double 0.000000e+00, double 0.000000e+00), !dbg !70
  store <2 x double> %4, <2 x double>* %zero, align 16, !dbg !70
  %5 = call <2 x double> @make_vec(double 1.000000e+00, double 1.000000e+00), !dbg !70
  store <2 x double> %5, <2 x double>* %one, align 16, !dbg !70
  %6 = call <2 x double> @make_vec(double 2.000000e+00, double 2.000000e+00), !dbg !71
  store <2 x double> %6, <2 x double>* %two, align 16, !dbg !71
  %7 = call <2 x double> @make_vec(double -1.000000e+00, double -1.000000e+00), !dbg !71
  store <2 x double> %7, <2 x double>* %m_one, align 16, !dbg !71
  %8 = call <2 x double> @make_vec(double 1.000000e+00, double 2.000000e+00), !dbg !72
  store <2 x double> %8, <2 x double>* %init, align 16, !dbg !72
  %9 = call <2 x double> @make_vec(double 1.000000e+00, double -1.000000e+00), !dbg !72
  store <2 x double> %9, <2 x double>* %av, align 16, !dbg !72
  %10 = load <2 x double>* %zero, align 16, !dbg !73
  store <2 x double> %10, <2 x double>* %Gregory, align 16, !dbg !73
  store <2 x double> %10, <2 x double>* %alt, align 16, !dbg !73
  store <2 x double> %10, <2 x double>* %poly, align 16, !dbg !73
  store <2 x double> %10, <2 x double>* %zeta, align 16, !dbg !73
  store <2 x double> %10, <2 x double>* %Harmonic, align 16, !dbg !73
  store double 1.000000e+00, double* %k, align 8, !dbg !74
  br label %11, !dbg !74

; <label>:11                                      ; preds = %52, %0
  %12 = load double* %k, align 8, !dbg !74
  %13 = load i32* %n, align 4, !dbg !74
  %14 = sitofp i32 %13 to double, !dbg !74
  %15 = fcmp ole double %12, %14, !dbg !74
  br i1 %15, label %16, label %55, !dbg !74

; <label>:16                                      ; preds = %11
  %17 = load double* %k, align 8, !dbg !76
  %18 = fsub double %17, 1.000000e+00, !dbg !76
  %19 = call double @pow(double 0x3FE5555555555555, double %18) #4, !dbg !76
  %20 = load double* %twoThrd, align 8, !dbg !76
  %21 = fadd double %20, %19, !dbg !76
  store double %21, double* %twoThrd, align 8, !dbg !76
  %22 = load double* %k, align 8, !dbg !78
  %23 = call double @sqrt(double %22) #4, !dbg !78
  %24 = fdiv double 1.000000e+00, %23, !dbg !78
  %25 = load double* %sqrts, align 8, !dbg !78
  %26 = fadd double %25, %24, !dbg !78
  store double %26, double* %sqrts, align 8, !dbg !78
  %27 = load double* %k, align 8, !dbg !79
  %28 = load double* %k, align 8, !dbg !79
  %29 = fmul double %27, %28, !dbg !79
  %30 = load double* %k, align 8, !dbg !79
  %31 = fmul double %29, %30, !dbg !79
  store double %31, double* %k3, align 8, !dbg !79
  %32 = load double* %k, align 8, !dbg !80
  %33 = call double @sin(double %32) #4, !dbg !80
  store double %33, double* %s, align 8, !dbg !80
  %34 = load double* %k, align 8, !dbg !80
  %35 = call double @cos(double %34) #4, !dbg !80
  store double %35, double* %c, align 8, !dbg !80
  %36 = load double* %k3, align 8, !dbg !81
  %37 = load double* %s, align 8, !dbg !81
  %38 = fmul double %36, %37, !dbg !81
  %39 = load double* %s, align 8, !dbg !81
  %40 = fmul double %38, %39, !dbg !81
  %41 = fdiv double 1.000000e+00, %40, !dbg !81
  %42 = load double* %Flint, align 8, !dbg !81
  %43 = fadd double %42, %41, !dbg !81
  store double %43, double* %Flint, align 8, !dbg !81
  %44 = load double* %k3, align 8, !dbg !82
  %45 = load double* %c, align 8, !dbg !82
  %46 = fmul double %44, %45, !dbg !82
  %47 = load double* %c, align 8, !dbg !82
  %48 = fmul double %46, %47, !dbg !82
  %49 = fdiv double 1.000000e+00, %48, !dbg !82
  %50 = load double* %Cookson, align 8, !dbg !82
  %51 = fadd double %50, %49, !dbg !82
  store double %51, double* %Cookson, align 8, !dbg !82
  br label %52, !dbg !83

; <label>:52                                      ; preds = %16
  %53 = load double* %k, align 8, !dbg !74
  %54 = fadd double %53, 1.000000e+00, !dbg !74
  store double %54, double* %k, align 8, !dbg !74
  br label %11, !dbg !74

; <label>:55                                      ; preds = %11
  %56 = load <2 x double>* %init, align 16, !dbg !84
  store <2 x double> %56, <2 x double>* %kv, align 16, !dbg !84
  br label %57, !dbg !84

; <label>:57                                      ; preds = %99, %55
  %58 = bitcast <2 x double>* %kv to double*, !dbg !84
  %59 = load double* %58, align 8, !dbg !84
  %60 = load i32* %n, align 4, !dbg !84
  %61 = sitofp i32 %60 to double, !dbg !84
  %62 = fcmp ole double %59, %61, !dbg !84
  br i1 %62, label %63, label %103, !dbg !84

; <label>:63                                      ; preds = %57
  %64 = load <2 x double>* %one, align 16, !dbg !86
  %65 = load <2 x double>* %kv, align 16, !dbg !86
  %66 = load <2 x double>* %kv, align 16, !dbg !86
  %67 = load <2 x double>* %one, align 16, !dbg !86
  %68 = fadd <2 x double> %66, %67, !dbg !86
  %69 = fmul <2 x double> %65, %68, !dbg !86
  %70 = fdiv <2 x double> %64, %69, !dbg !86
  %71 = load <2 x double>* %poly, align 16, !dbg !86
  %72 = fadd <2 x double> %71, %70, !dbg !86
  store <2 x double> %72, <2 x double>* %poly, align 16, !dbg !86
  %73 = load <2 x double>* %one, align 16, !dbg !88
  %74 = load <2 x double>* %kv, align 16, !dbg !88
  %75 = fdiv <2 x double> %73, %74, !dbg !88
  %76 = load <2 x double>* %Harmonic, align 16, !dbg !88
  %77 = fadd <2 x double> %76, %75, !dbg !88
  store <2 x double> %77, <2 x double>* %Harmonic, align 16, !dbg !88
  %78 = load <2 x double>* %one, align 16, !dbg !89
  %79 = load <2 x double>* %kv, align 16, !dbg !89
  %80 = load <2 x double>* %kv, align 16, !dbg !89
  %81 = fmul <2 x double> %79, %80, !dbg !89
  %82 = fdiv <2 x double> %78, %81, !dbg !89
  %83 = load <2 x double>* %zeta, align 16, !dbg !89
  %84 = fadd <2 x double> %83, %82, !dbg !89
  store <2 x double> %84, <2 x double>* %zeta, align 16, !dbg !89
  %85 = load <2 x double>* %av, align 16, !dbg !90
  %86 = load <2 x double>* %kv, align 16, !dbg !90
  %87 = fdiv <2 x double> %85, %86, !dbg !90
  %88 = load <2 x double>* %alt, align 16, !dbg !90
  %89 = fadd <2 x double> %88, %87, !dbg !90
  store <2 x double> %89, <2 x double>* %alt, align 16, !dbg !90
  %90 = load <2 x double>* %av, align 16, !dbg !91
  %91 = load <2 x double>* %two, align 16, !dbg !91
  %92 = load <2 x double>* %kv, align 16, !dbg !91
  %93 = fmul <2 x double> %91, %92, !dbg !91
  %94 = load <2 x double>* %one, align 16, !dbg !91
  %95 = fsub <2 x double> %93, %94, !dbg !91
  %96 = fdiv <2 x double> %90, %95, !dbg !91
  %97 = load <2 x double>* %Gregory, align 16, !dbg !91
  %98 = fadd <2 x double> %97, %96, !dbg !91
  store <2 x double> %98, <2 x double>* %Gregory, align 16, !dbg !91
  br label %99, !dbg !92

; <label>:99                                      ; preds = %63
  %100 = load <2 x double>* %two, align 16, !dbg !84
  %101 = load <2 x double>* %kv, align 16, !dbg !84
  %102 = fadd <2 x double> %101, %100, !dbg !84
  store <2 x double> %102, <2 x double>* %kv, align 16, !dbg !84
  br label %57, !dbg !84

; <label>:103                                     ; preds = %57
  %104 = load double* %twoThrd, align 8, !dbg !93
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %104, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0)), !dbg !93
  %106 = load double* %sqrts, align 8, !dbg !93
  %107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %106, i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)), !dbg !93
  %108 = load <2 x double>* %poly, align 16, !dbg !94
  %109 = call double @sum_vec(<2 x double> %108), !dbg !94
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %109, i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0)), !dbg !94
  %111 = load double* %Flint, align 8, !dbg !94
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %111, i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0)), !dbg !94
  %113 = load double* %Cookson, align 8, !dbg !95
  %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %113, i8* getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0)), !dbg !95
  %115 = load <2 x double>* %Harmonic, align 16, !dbg !95
  %116 = call double @sum_vec(<2 x double> %115), !dbg !95
  %117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %116, i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0)), !dbg !95
  %118 = load <2 x double>* %zeta, align 16, !dbg !96
  %119 = call double @sum_vec(<2 x double> %118), !dbg !96
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %119, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0)), !dbg !96
  %121 = load <2 x double>* %alt, align 16, !dbg !96
  %122 = call double @sum_vec(<2 x double> %121), !dbg !96
  %123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %122, i8* getelementptr inbounds ([21 x i8]* @.str8, i32 0, i32 0)), !dbg !96
  %124 = load <2 x double>* %Gregory, align 16, !dbg !97
  %125 = call double @sum_vec(<2 x double> %124), !dbg !97
  %126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %125, i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c] [DW_LANG_C99]
!1 = metadata !{metadata !"partialsums.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !13, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_vec", metadata !"make_vec", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, <2 x double> (double, double)* @make_vec, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [make_vec]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !10}
!8 = metadata !{i32 786454, metadata !1, null, metadata !"v2df", i32 10, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [v2df] [line 10, size 0, align 0, offset 0] [from ]
!9 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 128, i32 0, i32 2048, metadata !10, metadata !11, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 128, offset 0] [vector] [from double]
!10 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sum_vec", metadata !"sum_vec", metadata !"", i32 20, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (<2 x double>)* @sum_vec, null, null, metadata !2, i32 21} ; [ DW_TAG_subprogram ] [line 20] [def] [scope 21] [sum_vec]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !10, metadata !8}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 26, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 27} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [main]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19, metadata !20}
!19 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!22 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!26 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 12]
!27 = metadata !{i32 12, i32 0, metadata !4, null}
!28 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 12]
!29 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 14]
!30 = metadata !{i32 14, i32 0, metadata !4, null}
!31 = metadata !{i32 786688, metadata !4, metadata !"tmp", metadata !5, i32 15, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!33 = metadata !{i32 15, i32 0, metadata !4, null}
!34 = metadata !{i32 16, i32 0, metadata !4, null}
!35 = metadata !{i32 17, i32 0, metadata !4, null}
!36 = metadata !{i32 786689, metadata !13, metadata !"x", metadata !5, i32 16777236, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 20]
!37 = metadata !{i32 20, i32 0, metadata !13, null}
!38 = metadata !{i32 786688, metadata !13, metadata !"tmp", metadata !5, i32 22, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!39 = metadata !{i32 22, i32 0, metadata !13, null}
!40 = metadata !{i32 23, i32 0, metadata !13, null}
!41 = metadata !{i32 786689, metadata !16, metadata !"argc", metadata !5, i32 16777242, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 26]
!42 = metadata !{i32 26, i32 0, metadata !16, null}
!43 = metadata !{i32 786689, metadata !16, metadata !"argv", metadata !5, i32 33554458, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 26]
!44 = metadata !{i32 786688, metadata !16, metadata !"twoThrd", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [twoThrd] [line 28]
!45 = metadata !{i32 28, i32 0, metadata !16, null}
!46 = metadata !{i32 786688, metadata !16, metadata !"sqrts", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sqrts] [line 28]
!47 = metadata !{i32 786688, metadata !16, metadata !"Flint", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Flint] [line 28]
!48 = metadata !{i32 786688, metadata !16, metadata !"Cookson", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Cookson] [line 28]
!49 = metadata !{i32 786688, metadata !16, metadata !"Harmonic", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Harmonic] [line 29]
!50 = metadata !{i32 29, i32 0, metadata !16, null}
!51 = metadata !{i32 786688, metadata !16, metadata !"zeta", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zeta] [line 29]
!52 = metadata !{i32 786688, metadata !16, metadata !"poly", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [poly] [line 29]
!53 = metadata !{i32 786688, metadata !16, metadata !"alt", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [alt] [line 29]
!54 = metadata !{i32 786688, metadata !16, metadata !"Gregory", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gregory] [line 29]
!55 = metadata !{i32 786688, metadata !16, metadata !"zero", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zero] [line 30]
!56 = metadata !{i32 30, i32 0, metadata !16, null}
!57 = metadata !{i32 786688, metadata !16, metadata !"one", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [one] [line 30]
!58 = metadata !{i32 786688, metadata !16, metadata !"two", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [two] [line 30]
!59 = metadata !{i32 786688, metadata !16, metadata !"init", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [init] [line 30]
!60 = metadata !{i32 786688, metadata !16, metadata !"m_one", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m_one] [line 30]
!61 = metadata !{i32 786688, metadata !16, metadata !"kv", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kv] [line 30]
!62 = metadata !{i32 786688, metadata !16, metadata !"av", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [av] [line 30]
!63 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 32]
!64 = metadata !{i32 32, i32 0, metadata !16, null}
!65 = metadata !{i32 786688, metadata !16, metadata !"k3", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k3] [line 32]
!66 = metadata !{i32 786688, metadata !16, metadata !"s", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 32]
!67 = metadata !{i32 786688, metadata !16, metadata !"c", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 32]
!68 = metadata !{i32 786688, metadata !16, metadata !"n", metadata !5, i32 33, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 33]
!69 = metadata !{i32 33, i32 0, metadata !16, null}
!70 = metadata !{i32 35, i32 0, metadata !16, null}
!71 = metadata !{i32 36, i32 0, metadata !16, null}
!72 = metadata !{i32 37, i32 0, metadata !16, null}
!73 = metadata !{i32 39, i32 0, metadata !16, null}
!74 = metadata !{i32 41, i32 0, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !16, i32 41, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!76 = metadata !{i32 43, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !75, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!78 = metadata !{i32 44, i32 0, metadata !77, null}
!79 = metadata !{i32 45, i32 0, metadata !77, null}
!80 = metadata !{i32 46, i32 0, metadata !77, null}
!81 = metadata !{i32 47, i32 0, metadata !77, null}
!82 = metadata !{i32 48, i32 0, metadata !77, null}
!83 = metadata !{i32 49, i32 0, metadata !77, null}
!84 = metadata !{i32 51, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !16, i32 51, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!86 = metadata !{i32 53, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 52, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!88 = metadata !{i32 54, i32 0, metadata !87, null}
!89 = metadata !{i32 55, i32 0, metadata !87, null}
!90 = metadata !{i32 56, i32 0, metadata !87, null}
!91 = metadata !{i32 57, i32 0, metadata !87, null}
!92 = metadata !{i32 58, i32 0, metadata !87, null} ; [ DW_TAG_imported_module ]
!93 = metadata !{i32 61, i32 0, metadata !16, null}
!94 = metadata !{i32 62, i32 0, metadata !16, null}
!95 = metadata !{i32 63, i32 0, metadata !16, null}
!96 = metadata !{i32 64, i32 0, metadata !16, null}
!97 = metadata !{i32 65, i32 0, metadata !16, null}
!98 = metadata !{i32 67, i32 0, metadata !16, null}
