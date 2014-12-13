; ModuleID = 'heapsort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@gen_random.last = internal global i64 42, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @gen_random(double %max) #0 {
  %1 = alloca double, align 8
  store double %max, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !26), !dbg !27
  %2 = load double* %1, align 8, !dbg !28
  %3 = load i64* @gen_random.last, align 8, !dbg !28
  %4 = mul nsw i64 %3, 3877, !dbg !28
  %5 = add nsw i64 %4, 29573, !dbg !28
  %6 = srem i64 %5, 139968, !dbg !28
  store i64 %6, i64* @gen_random.last, align 8, !dbg !28
  %7 = sitofp i64 %6 to double, !dbg !28
  %8 = fmul double %2, %7, !dbg !28
  %9 = fdiv double %8, 1.399680e+05, !dbg !28
  ret double %9, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @benchmark_heapsort(i32 %n, double* %ra) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ir = alloca i32, align 4
  %l = alloca i32, align 4
  %rra = alloca double, align 8
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !29), !dbg !30
  store double* %ra, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !31), !dbg !30
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !34), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %ir}, metadata !35), !dbg !36
  %3 = load i32* %1, align 4, !dbg !36
  store i32 %3, i32* %ir, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !37), !dbg !38
  %4 = load i32* %1, align 4, !dbg !38
  %5 = ashr i32 %4, 1, !dbg !38
  %6 = add nsw i32 %5, 1, !dbg !38
  store i32 %6, i32* %l, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata !{double* %rra}, metadata !39), !dbg !40
  br label %7, !dbg !41

; <label>:7                                       ; preds = %91, %0
  %8 = load i32* %l, align 4, !dbg !43
  %9 = icmp sgt i32 %8, 1, !dbg !43
  br i1 %9, label %10, label %17, !dbg !43

; <label>:10                                      ; preds = %7
  %11 = load i32* %l, align 4, !dbg !46
  %12 = add nsw i32 %11, -1, !dbg !46
  store i32 %12, i32* %l, align 4, !dbg !46
  %13 = sext i32 %12 to i64, !dbg !46
  %14 = load double** %2, align 8, !dbg !46
  %15 = getelementptr inbounds double* %14, i64 %13, !dbg !46
  %16 = load double* %15, align 8, !dbg !46
  store double %16, double* %rra, align 8, !dbg !46
  br label %38, !dbg !48

; <label>:17                                      ; preds = %7
  %18 = load i32* %ir, align 4, !dbg !49
  %19 = sext i32 %18 to i64, !dbg !49
  %20 = load double** %2, align 8, !dbg !49
  %21 = getelementptr inbounds double* %20, i64 %19, !dbg !49
  %22 = load double* %21, align 8, !dbg !49
  store double %22, double* %rra, align 8, !dbg !49
  %23 = load double** %2, align 8, !dbg !51
  %24 = getelementptr inbounds double* %23, i64 1, !dbg !51
  %25 = load double* %24, align 8, !dbg !51
  %26 = load i32* %ir, align 4, !dbg !51
  %27 = sext i32 %26 to i64, !dbg !51
  %28 = load double** %2, align 8, !dbg !51
  %29 = getelementptr inbounds double* %28, i64 %27, !dbg !51
  store double %25, double* %29, align 8, !dbg !51
  %30 = load i32* %ir, align 4, !dbg !52
  %31 = add nsw i32 %30, -1, !dbg !52
  store i32 %31, i32* %ir, align 4, !dbg !52
  %32 = icmp eq i32 %31, 1, !dbg !52
  br i1 %32, label %33, label %37, !dbg !52

; <label>:33                                      ; preds = %17
  %34 = load double* %rra, align 8, !dbg !54
  %35 = load double** %2, align 8, !dbg !54
  %36 = getelementptr inbounds double* %35, i64 1, !dbg !54
  store double %34, double* %36, align 8, !dbg !54
  ret void, !dbg !56

; <label>:37                                      ; preds = %17
  br label %38

; <label>:38                                      ; preds = %37, %10
  %39 = load i32* %l, align 4, !dbg !57
  store i32 %39, i32* %i, align 4, !dbg !57
  %40 = load i32* %l, align 4, !dbg !58
  %41 = shl i32 %40, 1, !dbg !58
  store i32 %41, i32* %j, align 4, !dbg !58
  br label %42, !dbg !59

; <label>:42                                      ; preds = %90, %38
  %43 = load i32* %j, align 4, !dbg !59
  %44 = load i32* %ir, align 4, !dbg !59
  %45 = icmp sle i32 %43, %44, !dbg !59
  br i1 %45, label %46, label %91, !dbg !59

; <label>:46                                      ; preds = %42
  %47 = load i32* %j, align 4, !dbg !60
  %48 = load i32* %ir, align 4, !dbg !60
  %49 = icmp slt i32 %47, %48, !dbg !60
  br i1 %49, label %50, label %66, !dbg !60

; <label>:50                                      ; preds = %46
  %51 = load i32* %j, align 4, !dbg !60
  %52 = sext i32 %51 to i64, !dbg !60
  %53 = load double** %2, align 8, !dbg !60
  %54 = getelementptr inbounds double* %53, i64 %52, !dbg !60
  %55 = load double* %54, align 8, !dbg !60
  %56 = load i32* %j, align 4, !dbg !60
  %57 = add nsw i32 %56, 1, !dbg !60
  %58 = sext i32 %57 to i64, !dbg !60
  %59 = load double** %2, align 8, !dbg !60
  %60 = getelementptr inbounds double* %59, i64 %58, !dbg !60
  %61 = load double* %60, align 8, !dbg !60
  %62 = fcmp olt double %55, %61, !dbg !60
  br i1 %62, label %63, label %66, !dbg !60

; <label>:63                                      ; preds = %50
  %64 = load i32* %j, align 4, !dbg !63
  %65 = add nsw i32 %64, 1, !dbg !63
  store i32 %65, i32* %j, align 4, !dbg !63
  br label %66, !dbg !65

; <label>:66                                      ; preds = %63, %50, %46
  %67 = load double* %rra, align 8, !dbg !66
  %68 = load i32* %j, align 4, !dbg !66
  %69 = sext i32 %68 to i64, !dbg !66
  %70 = load double** %2, align 8, !dbg !66
  %71 = getelementptr inbounds double* %70, i64 %69, !dbg !66
  %72 = load double* %71, align 8, !dbg !66
  %73 = fcmp olt double %67, %72, !dbg !66
  br i1 %73, label %74, label %87, !dbg !66

; <label>:74                                      ; preds = %66
  %75 = load i32* %j, align 4, !dbg !68
  %76 = sext i32 %75 to i64, !dbg !68
  %77 = load double** %2, align 8, !dbg !68
  %78 = getelementptr inbounds double* %77, i64 %76, !dbg !68
  %79 = load double* %78, align 8, !dbg !68
  %80 = load i32* %i, align 4, !dbg !68
  %81 = sext i32 %80 to i64, !dbg !68
  %82 = load double** %2, align 8, !dbg !68
  %83 = getelementptr inbounds double* %82, i64 %81, !dbg !68
  store double %79, double* %83, align 8, !dbg !68
  %84 = load i32* %j, align 4, !dbg !70
  store i32 %84, i32* %i, align 4, !dbg !70
  %85 = load i32* %j, align 4, !dbg !70
  %86 = add nsw i32 %85, %84, !dbg !70
  store i32 %86, i32* %j, align 4, !dbg !70
  br label %90, !dbg !71

; <label>:87                                      ; preds = %66
  %88 = load i32* %ir, align 4, !dbg !72
  %89 = add nsw i32 %88, 1, !dbg !72
  store i32 %89, i32* %j, align 4, !dbg !72
  br label %90

; <label>:90                                      ; preds = %87, %74
  br label %42, !dbg !74

; <label>:91                                      ; preds = %42
  %92 = load double* %rra, align 8, !dbg !75
  %93 = load i32* %i, align 4, !dbg !75
  %94 = sext i32 %93 to i64, !dbg !75
  %95 = load double** %2, align 8, !dbg !75
  %96 = getelementptr inbounds double* %95, i64 %94, !dbg !75
  store double %92, double* %96, align 8, !dbg !75
  br label %7, !dbg !76
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %N = alloca i32, align 4
  %ary = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !77), !dbg !78
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !79), !dbg !78
  call void @llvm.dbg.declare(metadata !{i32* %N}, metadata !80), !dbg !81
  %4 = load i32* %2, align 4, !dbg !81
  %5 = icmp eq i32 %4, 2, !dbg !81
  br i1 %5, label %6, label %11, !dbg !81

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !81
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !81
  %9 = load i8** %8, align 8, !dbg !81
  %10 = call i32 @atoi(i8* %9) #5, !dbg !81
  br label %12, !dbg !81

; <label>:11                                      ; preds = %0
  br label %12, !dbg !81

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 8000000, %11 ], !dbg !81
  store i32 %13, i32* %N, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata !{double** %ary}, metadata !82), !dbg !83
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !84), !dbg !85
  %14 = load i32* %N, align 4, !dbg !86
  %15 = add nsw i32 %14, 1, !dbg !86
  %16 = sext i32 %15 to i64, !dbg !86
  %17 = mul i64 %16, 8, !dbg !86
  %18 = call noalias i8* @malloc(i64 %17) #6, !dbg !86
  %19 = bitcast i8* %18 to double*, !dbg !86
  store double* %19, double** %ary, align 8, !dbg !86
  store i32 1, i32* %i, align 4, !dbg !87
  br label %20, !dbg !87

; <label>:20                                      ; preds = %30, %12
  %21 = load i32* %i, align 4, !dbg !87
  %22 = load i32* %N, align 4, !dbg !87
  %23 = icmp sle i32 %21, %22, !dbg !87
  br i1 %23, label %24, label %33, !dbg !87

; <label>:24                                      ; preds = %20
  %25 = call double @gen_random(double 1.000000e+00), !dbg !89
  %26 = load i32* %i, align 4, !dbg !89
  %27 = sext i32 %26 to i64, !dbg !89
  %28 = load double** %ary, align 8, !dbg !89
  %29 = getelementptr inbounds double* %28, i64 %27, !dbg !89
  store double %25, double* %29, align 8, !dbg !89
  br label %30, !dbg !91

; <label>:30                                      ; preds = %24
  %31 = load i32* %i, align 4, !dbg !87
  %32 = add nsw i32 %31, 1, !dbg !87
  store i32 %32, i32* %i, align 4, !dbg !87
  br label %20, !dbg !87

; <label>:33                                      ; preds = %20
  %34 = load i32* %N, align 4, !dbg !92
  %35 = load double** %ary, align 8, !dbg !92
  call void @benchmark_heapsort(i32 %34, double* %35), !dbg !92
  %36 = load i32* %N, align 4, !dbg !93
  %37 = sext i32 %36 to i64, !dbg !93
  %38 = load double** %ary, align 8, !dbg !93
  %39 = getelementptr inbounds double* %38, i64 %37, !dbg !93
  %40 = load double* %39, align 8, !dbg !93
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %40), !dbg !93
  %42 = load double** %ary, align 8, !dbg !94
  %43 = bitcast double* %42 to i8*, !dbg !94
  call void @free(i8* %43) #6, !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !20, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"heapsort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !14}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_random", metadata !"gen_random", metadata !"", i32 16, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @gen_random, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 16] [def] [gen_random]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"benchmark_heapsort", metadata !"benchmark_heapsort", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*)* @benchmark_heapsort, null, null, metadata !2, i32 22} ; [ DW_TAG_subprogram ] [line 22] [def] [benchmark_heapsort]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null, metadata !12, metadata !13}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 58, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 58} ; [ DW_TAG_subprogram ] [line 58] [def] [main]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !12, metadata !12, metadata !17}
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786484, i32 0, metadata !4, metadata !"last", metadata !"last", metadata !"", metadata !5, i32 17, metadata !22, i32 1, i32 1, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!22 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!26 = metadata !{i32 786689, metadata !4, metadata !"max", metadata !5, i32 16777232, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 16]
!27 = metadata !{i32 16, i32 0, metadata !4, null}
!28 = metadata !{i32 18, i32 0, metadata !4, null}
!29 = metadata !{i32 786689, metadata !9, metadata !"n", metadata !5, i32 16777238, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 22]
!30 = metadata !{i32 22, i32 0, metadata !9, null}
!31 = metadata !{i32 786689, metadata !9, metadata !"ra", metadata !5, i32 33554454, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ra] [line 22]
!32 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 23, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!33 = metadata !{i32 23, i32 0, metadata !9, null}
!34 = metadata !{i32 786688, metadata !9, metadata !"j", metadata !5, i32 23, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 23]
!35 = metadata !{i32 786688, metadata !9, metadata !"ir", metadata !5, i32 24, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ir] [line 24]
!36 = metadata !{i32 24, i32 0, metadata !9, null}
!37 = metadata !{i32 786688, metadata !9, metadata !"l", metadata !5, i32 25, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 25]
!38 = metadata !{i32 25, i32 0, metadata !9, null}
!39 = metadata !{i32 786688, metadata !9, metadata !"rra", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rra] [line 26]
!40 = metadata !{i32 26, i32 0, metadata !9, null}
!41 = metadata !{i32 28, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!43 = metadata !{i32 29, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 29, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!45 = metadata !{i32 786443, metadata !1, metadata !42, i32 28, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!46 = metadata !{i32 30, i32 0, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !44, i32 29, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!48 = metadata !{i32 31, i32 0, metadata !47, null}
!49 = metadata !{i32 32, i32 0, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !44, i32 31, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!51 = metadata !{i32 33, i32 0, metadata !50, null}
!52 = metadata !{i32 34, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !50, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!54 = metadata !{i32 35, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 34, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!56 = metadata !{i32 55, i32 0, metadata !9, null}
!57 = metadata !{i32 40, i32 0, metadata !45, null}
!58 = metadata !{i32 41, i32 0, metadata !45, null}
!59 = metadata !{i32 42, i32 0, metadata !45, null}
!60 = metadata !{i32 43, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 43, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!62 = metadata !{i32 786443, metadata !1, metadata !45, i32 42, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!63 = metadata !{i32 44, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !61, i32 43, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!65 = metadata !{i32 45, i32 0, metadata !64, null}
!66 = metadata !{i32 46, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !62, i32 46, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!68 = metadata !{i32 47, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !67, i32 46, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!70 = metadata !{i32 48, i32 0, metadata !69, null}
!71 = metadata !{i32 49, i32 0, metadata !69, null}
!72 = metadata !{i32 50, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !67, i32 49, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!74 = metadata !{i32 52, i32 0, metadata !62, null}
!75 = metadata !{i32 53, i32 0, metadata !45, null}
!76 = metadata !{i32 54, i32 0, metadata !45, null}
!77 = metadata !{i32 786689, metadata !14, metadata !"argc", metadata !5, i32 16777274, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 58]
!78 = metadata !{i32 58, i32 0, metadata !14, null} ; [ DW_TAG_imported_module ]
!79 = metadata !{i32 786689, metadata !14, metadata !"argv", metadata !5, i32 33554490, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 58]
!80 = metadata !{i32 786688, metadata !14, metadata !"N", metadata !5, i32 64, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 64]
!81 = metadata !{i32 64, i32 0, metadata !14, null}
!82 = metadata !{i32 786688, metadata !14, metadata !"ary", metadata !5, i32 65, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ary] [line 65]
!83 = metadata !{i32 65, i32 0, metadata !14, null}
!84 = metadata !{i32 786688, metadata !14, metadata !"i", metadata !5, i32 66, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 66]
!85 = metadata !{i32 66, i32 0, metadata !14, null}
!86 = metadata !{i32 69, i32 0, metadata !14, null}
!87 = metadata !{i32 70, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !14, i32 70, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!89 = metadata !{i32 71, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !88, i32 70, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!91 = metadata !{i32 72, i32 0, metadata !90, null}
!92 = metadata !{i32 74, i32 0, metadata !14, null}
!93 = metadata !{i32 76, i32 0, metadata !14, null}
!94 = metadata !{i32 78, i32 0, metadata !14, null}
!95 = metadata !{i32 79, i32 0, metadata !14, null}
