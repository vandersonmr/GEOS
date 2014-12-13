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
@.str6 = private unnamed_addr constant [31 x i8] c"Composite Score:        %8.2f\0A\00", align 1
@.str7 = private unnamed_addr constant [41 x i8] c"FFT             Mflops: %8.2f    (N=%d)\0A\00", align 1
@.str8 = private unnamed_addr constant [44 x i8] c"SOR             Mflops: %8.2f    (%d x %d)\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"MonteCarlo:     Mflops: %8.2f\0A\00", align 1
@.str10 = private unnamed_addr constant [48 x i8] c"Sparse matmult  Mflops: %8.2f    (N=%d, nz=%d)\0A\00", align 1
@.str11 = private unnamed_addr constant [47 x i8] c"LU              Mflops: %8.2f    (M=%d, N=%d)\0A\00", align 1
@str = private unnamed_addr constant [59 x i8] c"NOTE!!! All Mflops disabled to prevent diffs from failing!\00"
@str16 = private unnamed_addr constant [67 x i8] c"** SciMark2 Numeric Benchmark, see http://math.nist.gov/scimark **\00"
@str17 = private unnamed_addr constant [67 x i8] c"** for details. (Results can be submitted to pozo@nist.gov)     **\00"
@str18 = private unnamed_addr constant [67 x i8] c"**                                                              **\00"

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !76
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !76
  tail call void @llvm.dbg.value(metadata !77, i64 0, metadata !15), !dbg !78
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !17), !dbg !80
  tail call void @llvm.dbg.value(metadata !81, i64 0, metadata !18), !dbg !82
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !19), !dbg !84
  tail call void @llvm.dbg.value(metadata !85, i64 0, metadata !20), !dbg !86
  tail call void @llvm.dbg.value(metadata !81, i64 0, metadata !21), !dbg !87
  tail call void @llvm.dbg.declare(metadata !88, metadata !23), !dbg !89
  %1 = tail call %struct.Random_struct* @new_Random_seed(i32 101010) #7, !dbg !90
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %1}, i64 0, metadata !27), !dbg !90
  %2 = icmp sgt i32 %argc, 1, !dbg !91
  br i1 %2, label %3, label %23, !dbg !91

; <label>:3                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !44), !dbg !93
  %4 = getelementptr inbounds i8** %argv, i64 1, !dbg !94
  %5 = load i8** %4, align 8, !dbg !94, !tbaa !96
  %6 = tail call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #8, !dbg !94
  %7 = icmp eq i32 %6, 0, !dbg !94
  br i1 %7, label %11, label %8, !dbg !94

; <label>:8                                       ; preds = %3
  %9 = tail call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0)) #8, !dbg !100
  %10 = icmp eq i32 %9, 0, !dbg !100
  br i1 %10, label %11, label %14, !dbg !100

; <label>:11                                      ; preds = %8, %3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !101, !tbaa !96
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %12) #9, !dbg !101
  tail call void @exit(i32 0) #10, !dbg !103
  unreachable, !dbg !103

; <label>:14                                      ; preds = %8
  %15 = tail call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([7 x i8]* @.str3, i64 0, i64 0)) #8, !dbg !104
  %16 = icmp eq i32 %15, 0, !dbg !104
  tail call void @llvm.dbg.value(metadata !106, i64 0, metadata !17), !dbg !107
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !18), !dbg !109
  tail call void @llvm.dbg.value(metadata !110, i64 0, metadata !19), !dbg !111
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !20), !dbg !113
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !21), !dbg !114
  tail call void @llvm.dbg.value(metadata !115, i64 0, metadata !44), !dbg !116
  %. = select i1 %16, i32 1000, i32 100, !dbg !104
  %.1 = select i1 %16, i32 100000, i32 1000, !dbg !104
  %.2 = select i1 %16, i32 1000000, i32 5000, !dbg !104
  %.4 = select i1 %16, i32 1048576, i32 1024, !dbg !104
  %.5 = select i1 %16, i32 2, i32 1, !dbg !104
  %17 = icmp slt i32 %.5, %argc, !dbg !117
  br i1 %17, label %18, label %23, !dbg !117

; <label>:18                                      ; preds = %14
  %19 = zext i32 %.5 to i64, !dbg !119
  %20 = getelementptr inbounds i8** %argv, i64 %19, !dbg !119
  %21 = load i8** %20, align 8, !dbg !119, !tbaa !96
  %22 = tail call double @atof(i8* %21) #8, !dbg !119
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !15), !dbg !119
  br label %23, !dbg !121

; <label>:23                                      ; preds = %14, %18, %0
  %SOR_size.1 = phi i32 [ %., %18 ], [ %., %14 ], [ 100, %0 ]
  %Sparse_size_M.1 = phi i32 [ %.1, %18 ], [ %.1, %14 ], [ 1000, %0 ]
  %Sparse_size_nz.1 = phi i32 [ %.2, %18 ], [ %.2, %14 ], [ 5000, %0 ]
  %FFT_size.1 = phi i32 [ %.4, %18 ], [ %.4, %14 ], [ 1024, %0 ]
  %min_time.0 = phi double [ %22, %18 ], [ 2.000000e+00, %14 ], [ 2.000000e+00, %0 ]
  tail call void @print_banner() #11, !dbg !122
  %24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str4, i64 0, i64 0), double %min_time.0) #7, !dbg !123
  %25 = tail call double @kernel_measureFFT(i32 %FFT_size.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !124
  %26 = tail call double @kernel_measureSOR(i32 %SOR_size.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !125
  %27 = tail call double @kernel_measureMonteCarlo(double %min_time.0, %struct.Random_struct* %1) #7, !dbg !126
  %28 = tail call double @kernel_measureSparseMatMult(i32 %Sparse_size_M.1, i32 %Sparse_size_nz.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !127
  %29 = tail call double @kernel_measureLU(i32 %SOR_size.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !128
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !22), !dbg !130
  %30 = fadd double %25, %26, !dbg !131
  %31 = fadd double %30, %27, !dbg !131
  %32 = fadd double %31, %28, !dbg !131
  %33 = fadd double %32, %29, !dbg !131
  %34 = fdiv double %33, 5.000000e+00, !dbg !131
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @str, i64 0, i64 0)), !dbg !132
  %35 = fdiv double %34, 1.000000e+07, !dbg !133
  %36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i64 0, i64 0), double %35) #7, !dbg !133
  %37 = fdiv double %25, 1.000000e+07, !dbg !134
  %38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str7, i64 0, i64 0), double %37, i32 %FFT_size.1) #7, !dbg !134
  %39 = fdiv double %26, 1.000000e+07, !dbg !135
  %40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str8, i64 0, i64 0), double %39, i32 %SOR_size.1, i32 %SOR_size.1) #7, !dbg !135
  %41 = fdiv double %27, 1.000000e+07, !dbg !136
  %42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i64 0, i64 0), double %41) #7, !dbg !136
  %43 = fdiv double %28, 1.000000e+07, !dbg !137
  %44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str10, i64 0, i64 0), double %43, i32 %Sparse_size_M.1, i32 %Sparse_size_nz.1) #7, !dbg !137
  %45 = fdiv double %29, 1.000000e+07, !dbg !138
  %46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str11, i64 0, i64 0), double %45, i32 %SOR_size.1, i32 %SOR_size.1) #7, !dbg !138
  tail call void @Random_delete(%struct.Random_struct* %1) #7, !dbg !139
  ret i32 0, !dbg !140
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize optsize
declare %struct.Random_struct* @new_Random_seed(i32) #2

; Function Attrs: minsize nounwind optsize readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #3

; Function Attrs: minsize noreturn nounwind optsize
declare void @exit(i32) #4

; Function Attrs: minsize nounwind optsize readonly
declare double @atof(i8* nocapture) #3

; Function Attrs: minsize nounwind optsize uwtable
define void @print_banner() #0 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str18, i64 0, i64 0)), !dbg !141
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str16, i64 0, i64 0)), !dbg !142
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str17, i64 0, i64 0)), !dbg !143
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str18, i64 0, i64 0)), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #5

; Function Attrs: minsize optsize
declare double @kernel_measureFFT(i32, double, %struct.Random_struct*) #2

; Function Attrs: minsize optsize
declare double @kernel_measureSOR(i32, double, %struct.Random_struct*) #2

; Function Attrs: minsize optsize
declare double @kernel_measureMonteCarlo(double, %struct.Random_struct*) #2

; Function Attrs: minsize optsize
declare double @kernel_measureSparseMatMult(i32, i32, double, %struct.Random_struct*) #2

; Function Attrs: minsize optsize
declare double @kernel_measureLU(i32, double, %struct.Random_struct*) #2

; Function Attrs: minsize optsize
declare void @Random_delete(%struct.Random_struct*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { minsize nounwind optsize }
attributes #8 = { minsize nounwind optsize readonly }
attributes #9 = { cold }
attributes #10 = { minsize noreturn nounwind optsize }
attributes #11 = { minsize optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!73, !74}
!llvm.ident = !{!75}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !50, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"scimark2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !47}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !27, metadata !44}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 11]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 11]
!15 = metadata !{i32 786688, metadata !4, metadata !"min_time", metadata !5, i32 15, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min_time] [line 15]
!16 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!17 = metadata !{i32 786688, metadata !4, metadata !"FFT_size", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [FFT_size] [line 17]
!18 = metadata !{i32 786688, metadata !4, metadata !"SOR_size", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [SOR_size] [line 18]
!19 = metadata !{i32 786688, metadata !4, metadata !"Sparse_size_M", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Sparse_size_M] [line 19]
!20 = metadata !{i32 786688, metadata !4, metadata !"Sparse_size_nz", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Sparse_size_nz] [line 20]
!21 = metadata !{i32 786688, metadata !4, metadata !"LU_size", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [LU_size] [line 21]
!22 = metadata !{i32 786688, metadata !4, metadata !"SCALE", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [SCALE] [line 22]
!23 = metadata !{i32 786688, metadata !4, metadata !"res", metadata !5, i32 27, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 27]
!24 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 384, i64 64, i32 0, i32 0, metadata !16, metadata !25, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 384, align 64, offset 0] [from double]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786465, i64 0, i64 6}        ; [ DW_TAG_subrange_type ] [0, 5]
!27 = metadata !{i32 786688, metadata !4, metadata !"R", metadata !5, i32 28, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 28]
!28 = metadata !{i32 786454, metadata !29, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!29 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786451, metadata !29, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!32 = metadata !{metadata !33, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43}
!33 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !34} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !8, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!37 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !8} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!38 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !8} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!39 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !8} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!40 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !8} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!41 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !16} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!42 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !16} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!43 = metadata !{i32 786445, metadata !29, metadata !31, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !16} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!44 = metadata !{i32 786688, metadata !45, metadata !"current_arg", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current_arg] [line 33]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 32, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!46 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"print_banner", metadata !"print_banner", metadata !"", i32 96, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @print_banner, null, null, metadata !2, i32 97} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 97] [print_banner]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{null}
!50 = metadata !{metadata !51, metadata !55, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71, metadata !72}
!51 = metadata !{i32 786484, i32 0, null, metadata !"RESOLUTION_DEFAULT", metadata !"RESOLUTION_DEFAULT", metadata !"", metadata !52, i32 4, metadata !54, i32 0, i32 1, double* @RESOLUTION_DEFAULT, null} ; [ DW_TAG_variable ] [RESOLUTION_DEFAULT] [line 4] [def]
!52 = metadata !{i32 786473, metadata !53}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/./constants.h]
!53 = metadata !{metadata !"./constants.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!54 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!55 = metadata !{i32 786484, i32 0, null, metadata !"RANDOM_SEED", metadata !"RANDOM_SEED", metadata !"", metadata !52, i32 5, metadata !56, i32 0, i32 1, i32* @RANDOM_SEED, null} ; [ DW_TAG_variable ] [RANDOM_SEED] [line 5] [def]
!56 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!57 = metadata !{i32 786484, i32 0, null, metadata !"FFT_SIZE", metadata !"FFT_SIZE", metadata !"", metadata !52, i32 9, metadata !56, i32 0, i32 1, i32* @FFT_SIZE, null} ; [ DW_TAG_variable ] [FFT_SIZE] [line 9] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"SOR_SIZE", metadata !"SOR_SIZE", metadata !"", metadata !52, i32 10, metadata !56, i32 0, i32 1, i32* @SOR_SIZE, null} ; [ DW_TAG_variable ] [SOR_SIZE] [line 10] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"SPARSE_SIZE_M", metadata !"SPARSE_SIZE_M", metadata !"", metadata !52, i32 11, metadata !56, i32 0, i32 1, i32* @SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [SPARSE_SIZE_M] [line 11] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"SPARSE_SIZE_nz", metadata !"SPARSE_SIZE_nz", metadata !"", metadata !52, i32 12, metadata !56, i32 0, i32 1, i32* @SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [SPARSE_SIZE_nz] [line 12] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"LU_SIZE", metadata !"LU_SIZE", metadata !"", metadata !52, i32 13, metadata !56, i32 0, i32 1, i32* @LU_SIZE, null} ; [ DW_TAG_variable ] [LU_SIZE] [line 13] [def]
!62 = metadata !{i32 786484, i32 0, null, metadata !"LG_FFT_SIZE", metadata !"LG_FFT_SIZE", metadata !"", metadata !52, i32 17, metadata !56, i32 0, i32 1, i32* @LG_FFT_SIZE, null} ; [ DW_TAG_variable ] [LG_FFT_SIZE] [line 17] [def]
!63 = metadata !{i32 786484, i32 0, null, metadata !"LG_SOR_SIZE", metadata !"LG_SOR_SIZE", metadata !"", metadata !52, i32 18, metadata !56, i32 0, i32 1, i32* @LG_SOR_SIZE, null} ; [ DW_TAG_variable ] [LG_SOR_SIZE] [line 18] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"LG_SPARSE_SIZE_M", metadata !"LG_SPARSE_SIZE_M", metadata !"", metadata !52, i32 19, metadata !56, i32 0, i32 1, i32* @LG_SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [LG_SPARSE_SIZE_M] [line 19] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"LG_SPARSE_SIZE_nz", metadata !"LG_SPARSE_SIZE_nz", metadata !"", metadata !52, i32 20, metadata !56, i32 0, i32 1, i32* @LG_SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [LG_SPARSE_SIZE_nz] [line 20] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"LG_LU_SIZE", metadata !"LG_LU_SIZE", metadata !"", metadata !52, i32 21, metadata !56, i32 0, i32 1, i32* @LG_LU_SIZE, null} ; [ DW_TAG_variable ] [LG_LU_SIZE] [line 21] [def]
!67 = metadata !{i32 786484, i32 0, null, metadata !"TINY_FFT_SIZE", metadata !"TINY_FFT_SIZE", metadata !"", metadata !52, i32 27, metadata !56, i32 0, i32 1, i32* @TINY_FFT_SIZE, null} ; [ DW_TAG_variable ] [TINY_FFT_SIZE] [line 27] [def]
!68 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SOR_SIZE", metadata !"TINY_SOR_SIZE", metadata !"", metadata !52, i32 28, metadata !56, i32 0, i32 1, i32* @TINY_SOR_SIZE, null} ; [ DW_TAG_variable ] [TINY_SOR_SIZE] [line 28] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_M", metadata !"TINY_SPARSE_SIZE_M", metadata !"", metadata !52, i32 29, metadata !56, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_M] [line 29] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_N", metadata !"TINY_SPARSE_SIZE_N", metadata !"", metadata !52, i32 30, metadata !56, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_N, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_N] [line 30] [def]
!71 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_nz", metadata !"TINY_SPARSE_SIZE_nz", metadata !"", metadata !52, i32 31, metadata !56, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_nz] [line 31] [def]
!72 = metadata !{i32 786484, i32 0, null, metadata !"TINY_LU_SIZE", metadata !"TINY_LU_SIZE", metadata !"", metadata !52, i32 32, metadata !56, i32 0, i32 1, i32* @TINY_LU_SIZE, null} ; [ DW_TAG_variable ] [TINY_LU_SIZE] [line 32] [def]
!73 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!74 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!75 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!76 = metadata !{i32 11, i32 0, metadata !4, null}
!77 = metadata !{double 2.000000e+00}
!78 = metadata !{i32 15, i32 0, metadata !4, null}
!79 = metadata !{i32 1024}
!80 = metadata !{i32 17, i32 0, metadata !4, null}
!81 = metadata !{i32 100}
!82 = metadata !{i32 18, i32 0, metadata !4, null}
!83 = metadata !{i32 1000}
!84 = metadata !{i32 19, i32 0, metadata !4, null}
!85 = metadata !{i32 5000}
!86 = metadata !{i32 20, i32 0, metadata !4, null}
!87 = metadata !{i32 21, i32 0, metadata !4, null}
!88 = metadata !{[6 x double]* undef}
!89 = metadata !{i32 27, i32 0, metadata !4, null}
!90 = metadata !{i32 28, i32 0, metadata !4, null}
!91 = metadata !{i32 31, i32 0, metadata !46, null}
!92 = metadata !{i32 1}
!93 = metadata !{i32 33, i32 0, metadata !45, null}
!94 = metadata !{i32 35, i32 0, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !45, i32 35, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!96 = metadata !{metadata !97, metadata !97, i64 0}
!97 = metadata !{metadata !"any pointer", metadata !98, i64 0}
!98 = metadata !{metadata !"omnipotent char", metadata !99, i64 0}
!99 = metadata !{metadata !"Simple C/C++ TBAA"}
!100 = metadata !{i32 36, i32 0, metadata !95, null}
!101 = metadata !{i32 38, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !95, i32 37, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!103 = metadata !{i32 39, i32 0, metadata !102, null}
!104 = metadata !{i32 42, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !45, i32 42, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!106 = metadata !{i32 1048576}
!107 = metadata !{i32 44, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !105, i32 43, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!109 = metadata !{i32 45, i32 0, metadata !108, null}
!110 = metadata !{i32 100000}
!111 = metadata !{i32 46, i32 0, metadata !108, null}
!112 = metadata !{i32 1000000}
!113 = metadata !{i32 47, i32 0, metadata !108, null}
!114 = metadata !{i32 48, i32 0, metadata !108, null}
!115 = metadata !{i32 2}
!116 = metadata !{i32 50, i32 0, metadata !108, null}
!117 = metadata !{i32 53, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !45, i32 53, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!119 = metadata !{i32 55, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !118, i32 54, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!121 = metadata !{i32 56, i32 0, metadata !120, null}
!122 = metadata !{i32 61, i32 0, metadata !4, null}
!123 = metadata !{i32 62, i32 0, metadata !4, null}
!124 = metadata !{i32 64, i32 0, metadata !4, null}
!125 = metadata !{i32 65, i32 0, metadata !4, null}
!126 = metadata !{i32 66, i32 0, metadata !4, null}
!127 = metadata !{i32 67, i32 0, metadata !4, null}
!128 = metadata !{i32 69, i32 0, metadata !4, null}
!129 = metadata !{i32 10000000}
!130 = metadata !{i32 73, i32 0, metadata !4, null}
!131 = metadata !{i32 75, i32 0, metadata !4, null}
!132 = metadata !{i32 78, i32 0, metadata !4, null}
!133 = metadata !{i32 79, i32 0, metadata !4, null}
!134 = metadata !{i32 80, i32 0, metadata !4, null}
!135 = metadata !{i32 81, i32 0, metadata !4, null}
!136 = metadata !{i32 83, i32 0, metadata !4, null}
!137 = metadata !{i32 84, i32 0, metadata !4, null}
!138 = metadata !{i32 86, i32 0, metadata !4, null}
!139 = metadata !{i32 90, i32 0, metadata !4, null}
!140 = metadata !{i32 94, i32 0, metadata !4, null}
!141 = metadata !{i32 98, i32 0, metadata !47, null}
!142 = metadata !{i32 99, i32 0, metadata !47, null}
!143 = metadata !{i32 100, i32 0, metadata !47, null}
!144 = metadata !{i32 101, i32 0, metadata !47, null}
!145 = metadata !{i32 102, i32 0, metadata !47, null}
