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
@str = private unnamed_addr constant [59 x i8] c"NOTE!!! All Mflops disabled to prevent diffs from failing!\00"
@str15 = private unnamed_addr constant [67 x i8] c"**                                                              **\00"
@str16 = private unnamed_addr constant [67 x i8] c"** SciMark2 Numeric Benchmark, see http://math.nist.gov/scimark **\00"
@str17 = private unnamed_addr constant [67 x i8] c"** for details. (Results can be submitted to pozo@nist.gov)     **\00"
@str18 = private unnamed_addr constant [67 x i8] c"**                                                              **\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !111
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !111
  tail call void @llvm.dbg.value(metadata !112, i64 0, metadata !15), !dbg !113
  tail call void @llvm.dbg.value(metadata !114, i64 0, metadata !17), !dbg !115
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !18), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !19), !dbg !119
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !20), !dbg !121
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !21), !dbg !122
  tail call void @llvm.dbg.declare(metadata !123, metadata !23), !dbg !124
  %1 = tail call %struct.Random_struct* @new_Random_seed(i32 101010) #7, !dbg !125
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %1}, i64 0, metadata !27), !dbg !125
  %2 = icmp sgt i32 %argc, 1, !dbg !126
  br i1 %2, label %3, label %38, !dbg !126

; <label>:3                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !127, i64 0, metadata !44), !dbg !128
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !53), !dbg !130
  %4 = getelementptr inbounds i8** %argv, i64 1, !dbg !130
  %5 = load i8** %4, align 8, !dbg !130, !tbaa !131
  %6 = tail call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #7, !dbg !130
  %7 = icmp eq i32 %6, 0, !dbg !130
  br i1 %7, label %25, label %8, !dbg !130

; <label>:8                                       ; preds = %3
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !62), !dbg !136
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !63), !dbg !137
  %9 = load i8* %5, align 1, !dbg !137, !tbaa !138
  %10 = zext i8 %9 to i32, !dbg !137
  %11 = sub nsw i32 45, %10, !dbg !137
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !65), !dbg !137
  %12 = icmp eq i8 %9, 45, !dbg !139
  br i1 %12, label %13, label %24, !dbg !139

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds i8* %5, i64 1, !dbg !141
  %15 = load i8* %14, align 1, !dbg !141, !tbaa !138
  %16 = zext i8 %15 to i32, !dbg !141
  %17 = sub nsw i32 104, %16, !dbg !141
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !65), !dbg !141
  %18 = icmp eq i8 %15, 104, !dbg !143
  br i1 %18, label %19, label %24, !dbg !143

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds i8* %5, i64 2, !dbg !145
  %21 = load i8* %20, align 1, !dbg !145, !tbaa !138
  %22 = zext i8 %21 to i32, !dbg !145
  %23 = sub nsw i32 0, %22, !dbg !145
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !65), !dbg !145
  br label %24, !dbg !147

; <label>:24                                      ; preds = %19, %13, %8
  %__result4.0 = phi i32 [ %23, %19 ], [ %17, %13 ], [ %11, %8 ]
  %phitmp = icmp eq i32 %__result4.0, 0, !dbg !137
  br i1 %phitmp, label %25, label %28, !dbg !136

; <label>:25                                      ; preds = %24, %3
  %26 = load %struct._IO_FILE** @stderr, align 8, !dbg !149, !tbaa !131
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %26) #8, !dbg !149
  tail call void @exit(i32 0) #9, !dbg !151
  unreachable, !dbg !151

; <label>:28                                      ; preds = %24
  tail call void @llvm.dbg.value(metadata !152, i64 0, metadata !69), !dbg !153
  %29 = load i8** %4, align 8, !dbg !153, !tbaa !131
  %30 = tail call i32 @strcmp(i8* %29, i8* getelementptr inbounds ([7 x i8]* @.str3, i64 0, i64 0)) #7, !dbg !153
  %31 = icmp eq i32 %30, 0, !dbg !153
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !17), !dbg !155
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !18), !dbg !157
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !19), !dbg !159
  tail call void @llvm.dbg.value(metadata !160, i64 0, metadata !20), !dbg !161
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !21), !dbg !162
  tail call void @llvm.dbg.value(metadata !163, i64 0, metadata !44), !dbg !164
  %. = select i1 %31, i32 2, i32 1, !dbg !153
  %.26 = select i1 %31, i32 1000, i32 100, !dbg !153
  %.27 = select i1 %31, i32 1000000, i32 5000, !dbg !153
  %.28 = select i1 %31, i32 100000, i32 1000, !dbg !153
  %.29 = select i1 %31, i32 1048576, i32 1024, !dbg !153
  %32 = icmp slt i32 %., %argc, !dbg !165
  br i1 %32, label %33, label %38, !dbg !165

; <label>:33                                      ; preds = %28
  %34 = zext i32 %. to i64, !dbg !167
  %35 = getelementptr inbounds i8** %argv, i64 %34, !dbg !167
  %36 = load i8** %35, align 8, !dbg !167, !tbaa !131
  %37 = tail call double @atof(i8* %36) #10, !dbg !167
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !15), !dbg !167
  br label %38, !dbg !169

; <label>:38                                      ; preds = %28, %33, %0
  %LU_size.1 = phi i32 [ %.26, %33 ], [ %.26, %28 ], [ 100, %0 ]
  %Sparse_size_nz.1 = phi i32 [ %.27, %33 ], [ %.27, %28 ], [ 5000, %0 ]
  %Sparse_size_M.1 = phi i32 [ %.28, %33 ], [ %.28, %28 ], [ 1000, %0 ]
  %FFT_size.1 = phi i32 [ %.29, %33 ], [ %.29, %28 ], [ 1024, %0 ]
  %min_time.0 = phi double [ %37, %33 ], [ 2.000000e+00, %28 ], [ 2.000000e+00, %0 ]
  tail call void @print_banner(), !dbg !170
  %39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str4, i64 0, i64 0), double %min_time.0) #7, !dbg !171
  %40 = tail call double @kernel_measureFFT(i32 %FFT_size.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !172
  %41 = tail call double @kernel_measureSOR(i32 %LU_size.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !173
  %42 = tail call double @kernel_measureMonteCarlo(double %min_time.0, %struct.Random_struct* %1) #7, !dbg !174
  %43 = tail call double @kernel_measureSparseMatMult(i32 %Sparse_size_M.1, i32 %Sparse_size_nz.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !175
  %44 = tail call double @kernel_measureLU(i32 %LU_size.1, double %min_time.0, %struct.Random_struct* %1) #7, !dbg !176
  tail call void @llvm.dbg.value(metadata !177, i64 0, metadata !22), !dbg !178
  %45 = fadd double %40, %41, !dbg !179
  %46 = fadd double %45, %42, !dbg !179
  %47 = fadd double %46, %43, !dbg !179
  %48 = fadd double %47, %44, !dbg !179
  %49 = fdiv double %48, 5.000000e+00, !dbg !179
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @str, i64 0, i64 0)), !dbg !180
  %50 = fdiv double %49, 1.000000e+07, !dbg !181
  %51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i64 0, i64 0), double %50) #7, !dbg !181
  %52 = fdiv double %40, 1.000000e+07, !dbg !182
  %53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str7, i64 0, i64 0), double %52, i32 %FFT_size.1) #7, !dbg !182
  %54 = fdiv double %41, 1.000000e+07, !dbg !183
  %55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str8, i64 0, i64 0), double %54, i32 %LU_size.1, i32 %LU_size.1) #7, !dbg !183
  %56 = fdiv double %42, 1.000000e+07, !dbg !184
  %57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i64 0, i64 0), double %56) #7, !dbg !184
  %58 = fdiv double %43, 1.000000e+07, !dbg !185
  %59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str10, i64 0, i64 0), double %58, i32 %Sparse_size_M.1, i32 %Sparse_size_nz.1) #7, !dbg !185
  %60 = fdiv double %44, 1.000000e+07, !dbg !186
  %61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str11, i64 0, i64 0), double %60, i32 %LU_size.1, i32 %LU_size.1) #7, !dbg !186
  tail call void @Random_delete(%struct.Random_struct* %1) #7, !dbg !187
  ret i32 0, !dbg !188
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare %struct.Random_struct* @new_Random_seed(i32) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally double @atof(i8* nocapture readonly %__nptr) #5 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !84), !dbg !189
  %1 = tail call double @strtod(i8* nocapture %__nptr, i8** null) #7, !dbg !190
  ret double %1, !dbg !190
}

; Function Attrs: nounwind uwtable
define void @print_banner() #0 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str15, i64 0, i64 0)), !dbg !192
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str16, i64 0, i64 0)), !dbg !193
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str17, i64 0, i64 0)), !dbg !194
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str18, i64 0, i64 0)), !dbg !195
  ret void, !dbg !196
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #6

declare double @kernel_measureFFT(i32, double, %struct.Random_struct*) #2

declare double @kernel_measureSOR(i32, double, %struct.Random_struct*) #2

declare double @kernel_measureMonteCarlo(double, %struct.Random_struct*) #2

declare double @kernel_measureSparseMatMult(i32, i32, double, %struct.Random_struct*) #2

declare double @kernel_measureLU(i32, double, %struct.Random_struct*) #2

declare void @Random_delete(%struct.Random_struct*) #2

; Function Attrs: nounwind
declare double @strtod(i8* readonly, i8** nocapture) #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #7

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!108, !109}
!llvm.ident = !{!110}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !85, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"scimark2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !73, metadata !76}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !27, metadata !44, metadata !47, metadata !53, metadata !54, metadata !59, metadata !60, metadata !62, metadata !63, metadata !65, metadata !66, metadata !69, metadata !70, metadata !72}
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
!47 = metadata !{i32 786688, metadata !48, metadata !"__s1_len", metadata !5, i32 35, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 35]
!48 = metadata !{i32 786443, metadata !1, metadata !49, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!49 = metadata !{i32 786443, metadata !1, metadata !45, i32 35, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!50 = metadata !{i32 786454, metadata !51, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!51 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!52 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!53 = metadata !{i32 786688, metadata !48, metadata !"__s2_len", metadata !5, i32 35, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 35]
!54 = metadata !{i32 786688, metadata !55, metadata !"__s2", metadata !5, i32 35, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2] [line 35]
!55 = metadata !{i32 786443, metadata !1, metadata !48, i32 35, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!56 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!57 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !58} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!58 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!59 = metadata !{i32 786688, metadata !55, metadata !"__result", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__result] [line 35]
!60 = metadata !{i32 786688, metadata !61, metadata !"__s1_len", metadata !5, i32 36, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 36]
!61 = metadata !{i32 786443, metadata !1, metadata !49, i32 36, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!62 = metadata !{i32 786688, metadata !61, metadata !"__s2_len", metadata !5, i32 36, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 36]
!63 = metadata !{i32 786688, metadata !64, metadata !"__s2", metadata !5, i32 36, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2] [line 36]
!64 = metadata !{i32 786443, metadata !1, metadata !61, i32 36, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!65 = metadata !{i32 786688, metadata !64, metadata !"__result", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__result] [line 36]
!66 = metadata !{i32 786688, metadata !67, metadata !"__s1_len", metadata !5, i32 42, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 42]
!67 = metadata !{i32 786443, metadata !1, metadata !68, i32 42, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!68 = metadata !{i32 786443, metadata !1, metadata !45, i32 42, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!69 = metadata !{i32 786688, metadata !67, metadata !"__s2_len", metadata !5, i32 42, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 42]
!70 = metadata !{i32 786688, metadata !71, metadata !"__s2", metadata !5, i32 42, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2] [line 42]
!71 = metadata !{i32 786443, metadata !1, metadata !67, i32 42, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!72 = metadata !{i32 786688, metadata !71, metadata !"__result", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__result] [line 42]
!73 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"print_banner", metadata !"print_banner", metadata !"", i32 96, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @print_banner, null, null, metadata !2, i32 97} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 97] [print_banner]
!74 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{null}
!76 = metadata !{i32 786478, metadata !77, metadata !78, metadata !"atof", metadata !"atof", metadata !"", i32 26, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i8*)* @atof, null, null, metadata !83, i32 27} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [atof]
!77 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!78 = metadata !{i32 786473, metadata !77}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C//usr/include/x86_64-linux-gnu/bits/stdlib-float.h]
!79 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{metadata !16, metadata !81}
!81 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!82 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786689, metadata !76, metadata !"__nptr", metadata !78, i32 16777242, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 26]
!85 = metadata !{metadata !86, metadata !90, metadata !92, metadata !93, metadata !94, metadata !95, metadata !96, metadata !97, metadata !98, metadata !99, metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !105, metadata !106, metadata !107}
!86 = metadata !{i32 786484, i32 0, null, metadata !"RESOLUTION_DEFAULT", metadata !"RESOLUTION_DEFAULT", metadata !"", metadata !87, i32 4, metadata !89, i32 0, i32 1, double* @RESOLUTION_DEFAULT, null} ; [ DW_TAG_variable ] [RESOLUTION_DEFAULT] [line 4] [def]
!87 = metadata !{i32 786473, metadata !88}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/./constants.h]
!88 = metadata !{metadata !"./constants.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!89 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!90 = metadata !{i32 786484, i32 0, null, metadata !"RANDOM_SEED", metadata !"RANDOM_SEED", metadata !"", metadata !87, i32 5, metadata !91, i32 0, i32 1, i32* @RANDOM_SEED, null} ; [ DW_TAG_variable ] [RANDOM_SEED] [line 5] [def]
!91 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!92 = metadata !{i32 786484, i32 0, null, metadata !"FFT_SIZE", metadata !"FFT_SIZE", metadata !"", metadata !87, i32 9, metadata !91, i32 0, i32 1, i32* @FFT_SIZE, null} ; [ DW_TAG_variable ] [FFT_SIZE] [line 9] [def]
!93 = metadata !{i32 786484, i32 0, null, metadata !"SOR_SIZE", metadata !"SOR_SIZE", metadata !"", metadata !87, i32 10, metadata !91, i32 0, i32 1, i32* @SOR_SIZE, null} ; [ DW_TAG_variable ] [SOR_SIZE] [line 10] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"SPARSE_SIZE_M", metadata !"SPARSE_SIZE_M", metadata !"", metadata !87, i32 11, metadata !91, i32 0, i32 1, i32* @SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [SPARSE_SIZE_M] [line 11] [def]
!95 = metadata !{i32 786484, i32 0, null, metadata !"SPARSE_SIZE_nz", metadata !"SPARSE_SIZE_nz", metadata !"", metadata !87, i32 12, metadata !91, i32 0, i32 1, i32* @SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [SPARSE_SIZE_nz] [line 12] [def]
!96 = metadata !{i32 786484, i32 0, null, metadata !"LU_SIZE", metadata !"LU_SIZE", metadata !"", metadata !87, i32 13, metadata !91, i32 0, i32 1, i32* @LU_SIZE, null} ; [ DW_TAG_variable ] [LU_SIZE] [line 13] [def]
!97 = metadata !{i32 786484, i32 0, null, metadata !"LG_FFT_SIZE", metadata !"LG_FFT_SIZE", metadata !"", metadata !87, i32 17, metadata !91, i32 0, i32 1, i32* @LG_FFT_SIZE, null} ; [ DW_TAG_variable ] [LG_FFT_SIZE] [line 17] [def]
!98 = metadata !{i32 786484, i32 0, null, metadata !"LG_SOR_SIZE", metadata !"LG_SOR_SIZE", metadata !"", metadata !87, i32 18, metadata !91, i32 0, i32 1, i32* @LG_SOR_SIZE, null} ; [ DW_TAG_variable ] [LG_SOR_SIZE] [line 18] [def]
!99 = metadata !{i32 786484, i32 0, null, metadata !"LG_SPARSE_SIZE_M", metadata !"LG_SPARSE_SIZE_M", metadata !"", metadata !87, i32 19, metadata !91, i32 0, i32 1, i32* @LG_SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [LG_SPARSE_SIZE_M] [line 19] [def]
!100 = metadata !{i32 786484, i32 0, null, metadata !"LG_SPARSE_SIZE_nz", metadata !"LG_SPARSE_SIZE_nz", metadata !"", metadata !87, i32 20, metadata !91, i32 0, i32 1, i32* @LG_SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [LG_SPARSE_SIZE_nz] [line 20] [def]
!101 = metadata !{i32 786484, i32 0, null, metadata !"LG_LU_SIZE", metadata !"LG_LU_SIZE", metadata !"", metadata !87, i32 21, metadata !91, i32 0, i32 1, i32* @LG_LU_SIZE, null} ; [ DW_TAG_variable ] [LG_LU_SIZE] [line 21] [def]
!102 = metadata !{i32 786484, i32 0, null, metadata !"TINY_FFT_SIZE", metadata !"TINY_FFT_SIZE", metadata !"", metadata !87, i32 27, metadata !91, i32 0, i32 1, i32* @TINY_FFT_SIZE, null} ; [ DW_TAG_variable ] [TINY_FFT_SIZE] [line 27] [def]
!103 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SOR_SIZE", metadata !"TINY_SOR_SIZE", metadata !"", metadata !87, i32 28, metadata !91, i32 0, i32 1, i32* @TINY_SOR_SIZE, null} ; [ DW_TAG_variable ] [TINY_SOR_SIZE] [line 28] [def]
!104 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_M", metadata !"TINY_SPARSE_SIZE_M", metadata !"", metadata !87, i32 29, metadata !91, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_M, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_M] [line 29] [def]
!105 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_N", metadata !"TINY_SPARSE_SIZE_N", metadata !"", metadata !87, i32 30, metadata !91, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_N, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_N] [line 30] [def]
!106 = metadata !{i32 786484, i32 0, null, metadata !"TINY_SPARSE_SIZE_nz", metadata !"TINY_SPARSE_SIZE_nz", metadata !"", metadata !87, i32 31, metadata !91, i32 0, i32 1, i32* @TINY_SPARSE_SIZE_nz, null} ; [ DW_TAG_variable ] [TINY_SPARSE_SIZE_nz] [line 31] [def]
!107 = metadata !{i32 786484, i32 0, null, metadata !"TINY_LU_SIZE", metadata !"TINY_LU_SIZE", metadata !"", metadata !87, i32 32, metadata !91, i32 0, i32 1, i32* @TINY_LU_SIZE, null} ; [ DW_TAG_variable ] [TINY_LU_SIZE] [line 32] [def]
!108 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!109 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!110 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!111 = metadata !{i32 11, i32 0, metadata !4, null}
!112 = metadata !{double 2.000000e+00}
!113 = metadata !{i32 15, i32 0, metadata !4, null}
!114 = metadata !{i32 1024}
!115 = metadata !{i32 17, i32 0, metadata !4, null}
!116 = metadata !{i32 100}
!117 = metadata !{i32 18, i32 0, metadata !4, null}
!118 = metadata !{i32 1000}
!119 = metadata !{i32 19, i32 0, metadata !4, null}
!120 = metadata !{i32 5000}
!121 = metadata !{i32 20, i32 0, metadata !4, null}
!122 = metadata !{i32 21, i32 0, metadata !4, null}
!123 = metadata !{[6 x double]* undef}
!124 = metadata !{i32 27, i32 0, metadata !4, null}
!125 = metadata !{i32 28, i32 0, metadata !4, null}
!126 = metadata !{i32 31, i32 0, metadata !46, null}
!127 = metadata !{i32 1}
!128 = metadata !{i32 33, i32 0, metadata !45, null}
!129 = metadata !{i64 5}
!130 = metadata !{i32 35, i32 0, metadata !48, null}
!131 = metadata !{metadata !132, metadata !132, i64 0}
!132 = metadata !{metadata !"any pointer", metadata !133, i64 0}
!133 = metadata !{metadata !"omnipotent char", metadata !134, i64 0}
!134 = metadata !{metadata !"Simple C/C++ TBAA"}
!135 = metadata !{i64 2}
!136 = metadata !{i32 36, i32 0, metadata !61, null}
!137 = metadata !{i32 36, i32 0, metadata !64, null}
!138 = metadata !{metadata !133, metadata !133, i64 0}
!139 = metadata !{i32 36, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !64, i32 36, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!141 = metadata !{i32 36, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !140, i32 36, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!143 = metadata !{i32 36, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !142, i32 36, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!145 = metadata !{i32 36, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !144, i32 36, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!147 = metadata !{i32 36, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !146, i32 36, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!149 = metadata !{i32 38, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !49, i32 37, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!151 = metadata !{i32 39, i32 0, metadata !150, null}
!152 = metadata !{i64 6}
!153 = metadata !{i32 42, i32 0, metadata !67, null}
!154 = metadata !{i32 1048576}
!155 = metadata !{i32 44, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !68, i32 43, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!157 = metadata !{i32 45, i32 0, metadata !156, null}
!158 = metadata !{i32 100000}
!159 = metadata !{i32 46, i32 0, metadata !156, null}
!160 = metadata !{i32 1000000}
!161 = metadata !{i32 47, i32 0, metadata !156, null}
!162 = metadata !{i32 48, i32 0, metadata !156, null}
!163 = metadata !{i32 2}
!164 = metadata !{i32 50, i32 0, metadata !156, null}
!165 = metadata !{i32 53, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !45, i32 53, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!167 = metadata !{i32 55, i32 16, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !166, i32 54, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/scimark2.c]
!169 = metadata !{i32 56, i32 0, metadata !168, null}
!170 = metadata !{i32 61, i32 0, metadata !4, null}
!171 = metadata !{i32 62, i32 0, metadata !4, null}
!172 = metadata !{i32 64, i32 0, metadata !4, null}
!173 = metadata !{i32 65, i32 0, metadata !4, null}
!174 = metadata !{i32 66, i32 0, metadata !4, null}
!175 = metadata !{i32 67, i32 0, metadata !4, null}
!176 = metadata !{i32 69, i32 0, metadata !4, null}
!177 = metadata !{i32 10000000}
!178 = metadata !{i32 73, i32 0, metadata !4, null}
!179 = metadata !{i32 75, i32 0, metadata !4, null}
!180 = metadata !{i32 78, i32 0, metadata !4, null}
!181 = metadata !{i32 79, i32 0, metadata !4, null}
!182 = metadata !{i32 80, i32 0, metadata !4, null}
!183 = metadata !{i32 81, i32 0, metadata !4, null}
!184 = metadata !{i32 83, i32 0, metadata !4, null}
!185 = metadata !{i32 84, i32 0, metadata !4, null}
!186 = metadata !{i32 86, i32 0, metadata !4, null}
!187 = metadata !{i32 90, i32 0, metadata !4, null}
!188 = metadata !{i32 94, i32 0, metadata !4, null}
!189 = metadata !{i32 26, i32 0, metadata !76, null}
!190 = metadata !{i32 28, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !77, metadata !76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C//usr/include/x86_64-linux-gnu/bits/stdlib-float.h]
!192 = metadata !{i32 98, i32 0, metadata !73, null}
!193 = metadata !{i32 99, i32 0, metadata !73, null}
!194 = metadata !{i32 100, i32 0, metadata !73, null}
!195 = metadata !{i32 101, i32 0, metadata !73, null}
!196 = metadata !{i32 102, i32 0, metadata !73, null}
