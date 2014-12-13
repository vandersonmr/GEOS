; ModuleID = 'scimark2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

@RESOLUTION_DEFAULT = constant double 2.000000e+00, align 8
@RANDOM_SEED = constant i32 101010, align 4
@FFT_SIZE = constant i32 1024, align 4
@SOR_SIZE = constant i32 100, align 4
@SPARSE_SIZE_M = constant i32 1000, align 4
@SPARSE_SIZE_nz = constant i32 5000, align 4
@LU_SIZE = constant i32 100, align 4
@LG_FFT_SIZE = constant i32 1048576, align 4
@LG_SOR_SIZE = constant i32 1000, align 4
@LG_SPARSE_SIZE_M = constant i32 100000, align 4
@LG_SPARSE_SIZE_nz = constant i32 1000000, align 4
@LG_LU_SIZE = constant i32 1000, align 4
@TINY_FFT_SIZE = constant i32 16, align 4
@TINY_SOR_SIZE = constant i32 10, align 4
@TINY_SPARSE_SIZE_M = constant i32 10, align 4
@TINY_SPARSE_SIZE_N = constant i32 10, align 4
@TINY_SPARSE_SIZE_nz = constant i32 50, align 4
@TINY_LU_SIZE = constant i32 10, align 4
@.str = private unnamed_addr constant [6 x i8] c"-help\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@stderr = external global %struct._IO_FILE*
@.str2 = private unnamed_addr constant [32 x i8] c"Usage: [-large] [minimum_time]\0A\00", align 1
@.str3 = private unnamed_addr constant [7 x i8] c"-large\00", align 1
@.str4 = private unnamed_addr constant [42 x i8] c"Using %10.2f seconds min time per kenel.\0A\00", align 1
@.str5 = private unnamed_addr constant [60 x i8] c"NOTE!!! All Mflops disabled to prevent diffs from failing!\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"Composite Score:        %8.2f\0A\00", align 1
@.str7 = private unnamed_addr constant [41 x i8] c"FFT             Mflops: %8.2f    (N=%d)\0A\00", align 1
@.str8 = private unnamed_addr constant [44 x i8] c"SOR             Mflops: %8.2f    (%d x %d)\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"MonteCarlo:     Mflops: %8.2f\0A\00", align 1
@.str10 = private unnamed_addr constant [48 x i8] c"Sparse matmult  Mflops: %8.2f    (N=%d, nz=%d)\0A\00", align 1
@.str11 = private unnamed_addr constant [47 x i8] c"LU              Mflops: %8.2f    (M=%d, N=%d)\0A\00", align 1
@.str12 = private unnamed_addr constant [68 x i8] c"**                                                              **\0A\00", align 1
@.str13 = private unnamed_addr constant [68 x i8] c"** SciMark2 Numeric Benchmark, see http://math.nist.gov/scimark **\0A\00", align 1
@.str14 = private unnamed_addr constant [68 x i8] c"** for details. (Results can be submitted to pozo@nist.gov)     **\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %min_time = alloca double, align 8
  %FFT_size = alloca i32, align 4
  %SOR_size = alloca i32, align 4
  %Sparse_size_M = alloca i32, align 4
  %Sparse_size_nz = alloca i32, align 4
  %LU_size = alloca i32, align 4
  %SCALE = alloca i32, align 4
  %res = alloca [6 x double], align 16
  %R = alloca %struct.Random_struct*, align 8
  %current_arg = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !42), !dbg !43
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !44), !dbg !43
  call void @llvm.dbg.declare(metadata !{double* %min_time}, metadata !45), !dbg !46
  store double 2.000000e+00, double* %min_time, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata !{i32* %FFT_size}, metadata !47), !dbg !48
  store i32 1024, i32* %FFT_size, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata !{i32* %SOR_size}, metadata !49), !dbg !50
  store i32 100, i32* %SOR_size, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata !{i32* %Sparse_size_M}, metadata !51), !dbg !52
  store i32 1000, i32* %Sparse_size_M, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata !{i32* %Sparse_size_nz}, metadata !53), !dbg !54
  store i32 5000, i32* %Sparse_size_nz, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %LU_size}, metadata !55), !dbg !56
  store i32 100, i32* %LU_size, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata !{i32* %SCALE}, metadata !57), !dbg !58
  call void @llvm.dbg.declare(metadata !{[6 x double]* %res}, metadata !59), !dbg !63
  %4 = bitcast [6 x double]* %res to i8*, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 48, i32 16, i1 false), !dbg !63
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %R}, metadata !64), !dbg !81
  %5 = call %struct.Random_struct* @new_Random_seed(i32 101010), !dbg !81
  store %struct.Random_struct* %5, %struct.Random_struct** %R, align 8, !dbg !81
  %6 = load i32* %2, align 4, !dbg !82
  %7 = icmp sgt i32 %6, 1, !dbg !82
  br i1 %7, label %8, label %44, !dbg !82

; <label>:8                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %current_arg}, metadata !84), !dbg !86
  store i32 1, i32* %current_arg, align 4, !dbg !86
  %9 = load i8*** %3, align 8, !dbg !87
  %10 = getelementptr inbounds i8** %9, i64 1, !dbg !87
  %11 = load i8** %10, align 8, !dbg !87
  %12 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)) #6, !dbg !87
  %13 = icmp eq i32 %12, 0, !dbg !87
  br i1 %13, label %20, label %14, !dbg !87

; <label>:14                                      ; preds = %8
  %15 = load i8*** %3, align 8, !dbg !89
  %16 = getelementptr inbounds i8** %15, i64 1, !dbg !89
  %17 = load i8** %16, align 8, !dbg !89
  %18 = call i32 @strcmp(i8* %17, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)) #6, !dbg !89
  %19 = icmp eq i32 %18, 0, !dbg !89
  br i1 %19, label %20, label %23, !dbg !89

; <label>:20                                      ; preds = %14, %8
  %21 = load %struct._IO_FILE** @stderr, align 8, !dbg !90
  %22 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)), !dbg !90
  call void @exit(i32 0) #7, !dbg !92
  unreachable, !dbg !92

; <label>:23                                      ; preds = %14
  %24 = load i8*** %3, align 8, !dbg !93
  %25 = getelementptr inbounds i8** %24, i64 1, !dbg !93
  %26 = load i8** %25, align 8, !dbg !93
  %27 = call i32 @strcmp(i8* %26, i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0)) #6, !dbg !93
  %28 = icmp eq i32 %27, 0, !dbg !93
  br i1 %28, label %29, label %32, !dbg !93

; <label>:29                                      ; preds = %23
  store i32 1048576, i32* %FFT_size, align 4, !dbg !95
  store i32 1000, i32* %SOR_size, align 4, !dbg !97
  store i32 100000, i32* %Sparse_size_M, align 4, !dbg !98
  store i32 1000000, i32* %Sparse_size_nz, align 4, !dbg !99
  store i32 1000, i32* %LU_size, align 4, !dbg !100
  %30 = load i32* %current_arg, align 4, !dbg !101
  %31 = add nsw i32 %30, 1, !dbg !101
  store i32 %31, i32* %current_arg, align 4, !dbg !101
  br label %32, !dbg !102

; <label>:32                                      ; preds = %29, %23
  %33 = load i32* %current_arg, align 4, !dbg !103
  %34 = load i32* %2, align 4, !dbg !103
  %35 = icmp slt i32 %33, %34, !dbg !103
  br i1 %35, label %36, label %43, !dbg !103

; <label>:36                                      ; preds = %32
  %37 = load i32* %current_arg, align 4, !dbg !105
  %38 = sext i32 %37 to i64, !dbg !105
  %39 = load i8*** %3, align 8, !dbg !105
  %40 = getelementptr inbounds i8** %39, i64 %38, !dbg !105
  %41 = load i8** %40, align 8, !dbg !105
  %42 = call double @atof(i8* %41) #6, !dbg !105
  store double %42, double* %min_time, align 8, !dbg !105
  br label %43, !dbg !107

; <label>:43                                      ; preds = %36, %32
  br label %44, !dbg !108

; <label>:44                                      ; preds = %43, %0
  call void @print_banner(), !dbg !109
  %45 = load double* %min_time, align 8, !dbg !110
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str4, i32 0, i32 0), double %45), !dbg !110
  %47 = load i32* %FFT_size, align 4, !dbg !111
  %48 = load double* %min_time, align 8, !dbg !111
  %49 = load %struct.Random_struct** %R, align 8, !dbg !111
  %50 = call double @kernel_measureFFT(i32 %47, double %48, %struct.Random_struct* %49), !dbg !111
  %51 = getelementptr inbounds [6 x double]* %res, i32 0, i64 1, !dbg !111
  store double %50, double* %51, align 8, !dbg !111
  %52 = load i32* %SOR_size, align 4, !dbg !112
  %53 = load double* %min_time, align 8, !dbg !112
  %54 = load %struct.Random_struct** %R, align 8, !dbg !112
  %55 = call double @kernel_measureSOR(i32 %52, double %53, %struct.Random_struct* %54), !dbg !112
  %56 = getelementptr inbounds [6 x double]* %res, i32 0, i64 2, !dbg !112
  store double %55, double* %56, align 8, !dbg !112
  %57 = load double* %min_time, align 8, !dbg !113
  %58 = load %struct.Random_struct** %R, align 8, !dbg !113
  %59 = call double @kernel_measureMonteCarlo(double %57, %struct.Random_struct* %58), !dbg !113
  %60 = getelementptr inbounds [6 x double]* %res, i32 0, i64 3, !dbg !113
  store double %59, double* %60, align 8, !dbg !113
  %61 = load i32* %Sparse_size_M, align 4, !dbg !114
  %62 = load i32* %Sparse_size_nz, align 4, !dbg !114
  %63 = load double* %min_time, align 8, !dbg !114
  %64 = load %struct.Random_struct** %R, align 8, !dbg !114
  %65 = call double @kernel_measureSparseMatMult(i32 %61, i32 %62, double %63, %struct.Random_struct* %64), !dbg !114
  %66 = getelementptr inbounds [6 x double]* %res, i32 0, i64 4, !dbg !114
  store double %65, double* %66, align 8, !dbg !114
  %67 = load i32* %LU_size, align 4, !dbg !115
  %68 = load double* %min_time, align 8, !dbg !115
  %69 = load %struct.Random_struct** %R, align 8, !dbg !115
  %70 = call double @kernel_measureLU(i32 %67, double %68, %struct.Random_struct* %69), !dbg !115
  %71 = getelementptr inbounds [6 x double]* %res, i32 0, i64 5, !dbg !115
  store double %70, double* %71, align 8, !dbg !115
  store i32 10000000, i32* %SCALE, align 4, !dbg !116
  %72 = getelementptr inbounds [6 x double]* %res, i32 0, i64 1, !dbg !117
  %73 = load double* %72, align 8, !dbg !117
  %74 = getelementptr inbounds [6 x double]* %res, i32 0, i64 2, !dbg !117
  %75 = load double* %74, align 8, !dbg !117
  %76 = fadd double %73, %75, !dbg !117
  %77 = getelementptr inbounds [6 x double]* %res, i32 0, i64 3, !dbg !117
  %78 = load double* %77, align 8, !dbg !117
  %79 = fadd double %76, %78, !dbg !117
  %80 = getelementptr inbounds [6 x double]* %res, i32 0, i64 4, !dbg !117
  %81 = load double* %80, align 8, !dbg !117
  %82 = fadd double %79, %81, !dbg !117
  %83 = getelementptr inbounds [6 x double]* %res, i32 0, i64 5, !dbg !117
  %84 = load double* %83, align 8, !dbg !117
  %85 = fadd double %82, %84, !dbg !117
  %86 = fdiv double %85, 5.000000e+00, !dbg !117
  %87 = getelementptr inbounds [6 x double]* %res, i32 0, i64 0, !dbg !117
  store double %86, double* %87, align 8, !dbg !117
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str5, i32 0, i32 0)), !dbg !118
  %89 = getelementptr inbounds [6 x double]* %res, i32 0, i64 0, !dbg !119
  %90 = load double* %89, align 8, !dbg !119
  %91 = load i32* %SCALE, align 4, !dbg !119
  %92 = sitofp i32 %91 to double, !dbg !119
  %93 = fdiv double %90, %92, !dbg !119
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), double %93), !dbg !119
  %95 = getelementptr inbounds [6 x double]* %res, i32 0, i64 1, !dbg !120
  %96 = load double* %95, align 8, !dbg !120
  %97 = load i32* %SCALE, align 4, !dbg !120
  %98 = sitofp i32 %97 to double, !dbg !120
  %99 = fdiv double %96, %98, !dbg !120
  %100 = load i32* %FFT_size, align 4, !dbg !120
  %101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str7, i32 0, i32 0), double %99, i32 %100), !dbg !120
  %102 = getelementptr inbounds [6 x double]* %res, i32 0, i64 2, !dbg !121
  %103 = load double* %102, align 8, !dbg !121
  %104 = load i32* %SCALE, align 4, !dbg !121
  %105 = sitofp i32 %104 to double, !dbg !121
  %106 = fdiv double %103, %105, !dbg !121
  %107 = load i32* %SOR_size, align 4, !dbg !121
  %108 = load i32* %SOR_size, align 4, !dbg !121
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str8, i32 0, i32 0), double %106, i32 %107, i32 %108), !dbg !121
  %110 = getelementptr inbounds [6 x double]* %res, i32 0, i64 3, !dbg !122
  %111 = load double* %110, align 8, !dbg !122
  %112 = load i32* %SCALE, align 4, !dbg !122
  %113 = sitofp i32 %112 to double, !dbg !122
  %114 = fdiv double %111, %113, !dbg !122
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), double %114), !dbg !122
  %116 = getelementptr inbounds [6 x double]* %res, i32 0, i64 4, !dbg !123
  %117 = load double* %116, align 8, !dbg !123
  %118 = load i32* %SCALE, align 4, !dbg !123
  %119 = sitofp i32 %118 to double, !dbg !123
  %120 = fdiv double %117, %119, !dbg !123
  %121 = load i32* %Sparse_size_M, align 4, !dbg !123
  %122 = load i32* %Sparse_size_nz, align 4, !dbg !123
  %123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str10, i32 0, i32 0), double %120, i32 %121, i32 %122), !dbg !123
  %124 = getelementptr inbounds [6 x double]* %res, i32 0, i64 5, !dbg !124
  %125 = load double* %124, align 8, !dbg !124
  %126 = load i32* %SCALE, align 4, !dbg !124
  %127 = sitofp i32 %126 to double, !dbg !124
  %128 = fdiv double %125, %127, !dbg !124
  %129 = load i32* %LU_size, align 4, !dbg !124
  %130 = load i32* %LU_size, align 4, !dbg !124
  %131 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str11, i32 0, i32 0), double %128, i32 %129, i32 %130), !dbg !124
  %132 = load %struct.Random_struct** %R, align 8, !dbg !125
  call void @Random_delete(%struct.Random_struct* %132), !dbg !125
  ret i32 0, !dbg !126
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

declare %struct.Random_struct* @new_Random_seed(i32) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind readonly
declare double @atof(i8*) #4

; Function Attrs: nounwind uwtable
define void @print_banner() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([68 x i8]* @.str12, i32 0, i32 0)), !dbg !127
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([68 x i8]* @.str13, i32 0, i32 0)), !dbg !128
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([68 x i8]* @.str14, i32 0, i32 0)), !dbg !129
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([68 x i8]* @.str12, i32 0, i32 0)), !dbg !130
  ret void, !dbg !131
}

declare i32 @printf(i8*, ...) #3

declare double @kernel_measureFFT(i32, double, %struct.Random_struct*) #3

declare double @kernel_measureSOR(i32, double, %struct.Random_struct*) #3

declare double @kernel_measureMonteCarlo(double, %struct.Random_struct*) #3

declare double @kernel_measureSparseMatMult(i32, i32, double, %struct.Random_struct*) #3

declare double @kernel_measureLU(i32, double, %struct.Random_struct*) #3

declare void @Random_delete(%struct.Random_struct*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"scimark2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"print_banner", metadata !"print_banner", metadata !"", i32 96, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @print_banner, null, null, metadata !2, i32 97} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 97] [print_banner]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16, metadata !21, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38}
!16 = metadata !{i32 786484, i32 0, null, metadata !"RESOLUTION_DEFAULT", metadata !"RESOLUTION_DEFAULT", metadata !"", metadata !17, i32 4, metadata !19, i32 0, i32 1, double* @RESOLUTION_DEFAULT, null} ; [ DW_TAG_variable ] [RESOLUTION_DEFAULT] [line 4] [def]
!17 = metadata !{i32 786473, metadata !18}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/./constants.h]
!18 = metadata !{metadata !"./constants.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!19 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!20 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!21 = metadata !{i32 786484, i32 0, null, metadata !"RANDOM_SEED", metadata !"RANDOM_SEED", metadata !"", metadata !17, i32 5, metadata !22, i32 0, i32 1, i32* @RANDOM_SEED, null} ; [ DW_TAG_variable ] [RANDOM_SEED] [line 5] [def]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!23 = metadata !{i32 786484, i32 0, null, metadata !"FFT_SIZE", metadata !"FFT_SIZE", metadata !"", metadata !17, i32 9, metadata !22, i32 0, i32 1, i32* @FFT_SIZE, null} ; [ DW_TAG_variable ] [FFT_SIZE] [line 9] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"SOR_SIZE", metadata !"SOR_SIZE", metadata !"", metadata !17, i32 10, metadata !22, i32 0, i32 1, i32* @SOR_SIZE, null} ; [ DW_TAG_variable ] [SOR_SIZE] [line 10] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"SPARSE_SIZE_M", metadata !"SPARSE_SIZE_M", metadata !"", metadata !17, i32 11, metadata !22, i32 0, i32 1, i32* @SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [SPARSE_SIZE_M] [line 11] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"SPARSE_SIZE_nz", metadata !"SPARSE_SIZE_nz", metadata !"", metadata !17, i32 12, metadata !22, i32 0, i32 1, i32* @SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [SPARSE_SIZE_nz] [line 12] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"LU_SIZE", metadata !"LU_SIZE", metadata !"", metadata !17, i32 13, metadata !22, i32 0, i32 1, i32* @LU_SIZE, null} ; [ DW_TAG_variable ] [LU_SIZE] [line 13] [def]
!28 = metadata !{i32 786484, i32 0, null, metadata !"LG_FFT_SIZE", metadata !"LG_FFT_SIZE", metadata !"", metadata !17, i32 17, metadata !22, i32 0, i32 1, i32* @LG_FFT_SIZE, null} ; [ DW_TAG_variable ] [LG_FFT_SIZE] [line 17] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"LG_SOR_SIZE", metadata !"LG_SOR_SIZE", metadata !"", metadata !17, i32 18, metadata !22, i32 0, i32 1, i32* @LG_SOR_SIZE, null} ; [ DW_TAG_variable ] [LG_SOR_SIZE] [line 18] [def]
!30 = metadata !{i32 786484, i32 0, null, metadata !"LG_SPARSE_SIZE_M", metadata !"LG_SPARSE_SIZE_M", metadata !"", metadata !17, i32 19, metadata !22, i32 0, i32 1, i32* @LG_SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [LG_SPARSE_SIZE_M] [line 19] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"LG_SPARSE_SIZE_nz", metadata !"LG_SPARSE_SIZE_nz", metadata !"", metadata !17, i32 20, metadata !22, i32 0, i32 1, i32* @LG_SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [LG_SPARSE_SIZE_nz] [line 20] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"LG_LU_SIZE", metadata !"LG_LU_SIZE", metadata !"", metadata !17, i32 21, metadata !22, i32 0, i32 1, i32* @LG_LU_SIZE, null} ; [ DW_TAG_variable ] [LG_LU_SIZE] [line 21] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"TINY_FFT_SIZE", metadata !"TINY_FFT_SIZE", metadata !"", metadata !17, i32 27, metadata !22, i32 0, i32 1, i32* @TINY_FFT_SIZE, null} ; [ DW_TAG_variable ] [TINY_FFT_SIZE] [line 27] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SOR_SIZE", metadata !"TINY_SOR_SIZE", metadata !"", metadata !17, i32 28, metadata !22, i32 0, i32 1, i32* @TINY_SOR_SIZE, null} ; [ DW_TAG_variable ] [TINY_SOR_SIZE] [line 28] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_M", metadata !"TINY_SPARSE_SIZE_M", metadata !"", metadata !17, i32 29, metadata !22, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_M] [line 29] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_N", metadata !"TINY_SPARSE_SIZE_N", metadata !"", metadata !17, i32 30, metadata !22, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_N, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_N] [line 30] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_nz", metadata !"TINY_SPARSE_SIZE_nz", metadata !"", metadata !17, i32 31, metadata !22, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_nz] [line 31] [def]
!38 = metadata !{i32 786484, i32 0, null, metadata !"TINY_LU_SIZE", metadata !"TINY_LU_SIZE", metadata !"", metadata !17, i32 32, metadata !22, i32 0, i32 1, i32* @TINY_LU_SIZE, null} ; [ DW_TAG_variable ] [TINY_LU_SIZE] [line 32] [def]
!39 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!40 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!41 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!42 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 11]
!43 = metadata !{i32 11, i32 0, metadata !4, null}
!44 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 11]
!45 = metadata !{i32 786688, metadata !4, metadata !"min_time", metadata !5, i32 15, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min_time] [line 15]
!46 = metadata !{i32 15, i32 0, metadata !4, null}
!47 = metadata !{i32 786688, metadata !4, metadata !"FFT_size", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [FFT_size] [line 17]
!48 = metadata !{i32 17, i32 0, metadata !4, null}
!49 = metadata !{i32 786688, metadata !4, metadata !"SOR_size", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [SOR_size] [line 18]
!50 = metadata !{i32 18, i32 0, metadata !4, null}
!51 = metadata !{i32 786688, metadata !4, metadata !"Sparse_size_M", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Sparse_size_M] [line 19]
!52 = metadata !{i32 19, i32 0, metadata !4, null}
!53 = metadata !{i32 786688, metadata !4, metadata !"Sparse_size_nz", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Sparse_size_nz] [line 20]
!54 = metadata !{i32 20, i32 0, metadata !4, null}
!55 = metadata !{i32 786688, metadata !4, metadata !"LU_size", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [LU_size] [line 21]
!56 = metadata !{i32 21, i32 0, metadata !4, null}
!57 = metadata !{i32 786688, metadata !4, metadata !"SCALE", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [SCALE] [line 22]
!58 = metadata !{i32 22, i32 0, metadata !4, null}
!59 = metadata !{i32 786688, metadata !4, metadata !"res", metadata !5, i32 27, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 27]
!60 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 384, i64 64, i32 0, i32 0, metadata !20, metadata !61, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 384, align 64, offset 0] [from double]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786465, i64 0, i64 6}        ; [ DW_TAG_subrange_type ] [0, 5]
!63 = metadata !{i32 27, i32 0, metadata !4, null}
!64 = metadata !{i32 786688, metadata !4, metadata !"R", metadata !5, i32 28, metadata !65, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 28]
!65 = metadata !{i32 786454, metadata !66, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786451, metadata !66, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !69, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!69 = metadata !{metadata !70, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80}
!70 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !71} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!71 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !8, metadata !72, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!74 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !8} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!75 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !8} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!76 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !8} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!77 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !8} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!78 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !20} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!79 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !20} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!80 = metadata !{i32 786445, metadata !66, metadata !68, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !20} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!81 = metadata !{i32 28, i32 0, metadata !4, null}
!82 = metadata !{i32 31, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!84 = metadata !{i32 786688, metadata !85, metadata !"current_arg", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current_arg] [line 33]
!85 = metadata !{i32 786443, metadata !1, metadata !83, i32 32, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!86 = metadata !{i32 33, i32 0, metadata !85, null}
!87 = metadata !{i32 35, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !85, i32 35, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!89 = metadata !{i32 36, i32 0, metadata !88, null}
!90 = metadata !{i32 38, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !88, i32 37, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!92 = metadata !{i32 39, i32 0, metadata !91, null}
!93 = metadata !{i32 42, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !85, i32 42, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!95 = metadata !{i32 44, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !94, i32 43, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!97 = metadata !{i32 45, i32 0, metadata !96, null}
!98 = metadata !{i32 46, i32 0, metadata !96, null}
!99 = metadata !{i32 47, i32 0, metadata !96, null}
!100 = metadata !{i32 48, i32 0, metadata !96, null}
!101 = metadata !{i32 50, i32 0, metadata !96, null}
!102 = metadata !{i32 51, i32 0, metadata !96, null}
!103 = metadata !{i32 53, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !85, i32 53, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!105 = metadata !{i32 55, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !104, i32 54, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!107 = metadata !{i32 56, i32 0, metadata !106, null}
!108 = metadata !{i32 58, i32 0, metadata !85, null} ; [ DW_TAG_imported_module ]
!109 = metadata !{i32 61, i32 0, metadata !4, null}
!110 = metadata !{i32 62, i32 0, metadata !4, null}
!111 = metadata !{i32 64, i32 0, metadata !4, null}
!112 = metadata !{i32 65, i32 0, metadata !4, null}
!113 = metadata !{i32 66, i32 0, metadata !4, null}
!114 = metadata !{i32 67, i32 0, metadata !4, null}
!115 = metadata !{i32 69, i32 0, metadata !4, null}
!116 = metadata !{i32 73, i32 0, metadata !4, null}
!117 = metadata !{i32 75, i32 0, metadata !4, null}
!118 = metadata !{i32 78, i32 0, metadata !4, null}
!119 = metadata !{i32 79, i32 0, metadata !4, null}
!120 = metadata !{i32 80, i32 0, metadata !4, null}
!121 = metadata !{i32 81, i32 0, metadata !4, null}
!122 = metadata !{i32 83, i32 0, metadata !4, null}
!123 = metadata !{i32 84, i32 0, metadata !4, null}
!124 = metadata !{i32 86, i32 0, metadata !4, null}
!125 = metadata !{i32 90, i32 0, metadata !4, null}
!126 = metadata !{i32 92, i32 0, metadata !4, null}
!127 = metadata !{i32 98, i32 0, metadata !12, null}
!128 = metadata !{i32 99, i32 0, metadata !12, null}
!129 = metadata !{i32 100, i32 0, metadata !12, null}
!130 = metadata !{i32 101, i32 0, metadata !12, null}
!131 = metadata !{i32 102, i32 0, metadata !12, null}
