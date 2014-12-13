; ModuleID = 'array.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double** @new_Array2D_double(i32 %M, i32 %N) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %failed = alloca i32, align 4
  %A = alloca double**, align 8
  store i32 %M, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !21), !dbg !22
  store i32 %N, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !23), !dbg !22
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !24), !dbg !25
  store i32 0, i32* %i, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata !{i32* %failed}, metadata !26), !dbg !27
  store i32 0, i32* %failed, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata !{double*** %A}, metadata !28), !dbg !29
  %4 = load i32* %2, align 4, !dbg !29
  %5 = sext i32 %4 to i64, !dbg !29
  %6 = mul i64 8, %5, !dbg !29
  %7 = call noalias i8* @malloc(i64 %6) #3, !dbg !29
  %8 = bitcast i8* %7 to double**, !dbg !29
  store double** %8, double*** %A, align 8, !dbg !29
  %9 = load double*** %A, align 8, !dbg !30
  %10 = icmp eq double** %9, null, !dbg !30
  br i1 %10, label %11, label %12, !dbg !30

; <label>:11                                      ; preds = %0
  store double** null, double*** %1, !dbg !32
  br label %62, !dbg !32

; <label>:12                                      ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !33
  br label %13, !dbg !33

; <label>:13                                      ; preds = %35, %12
  %14 = load i32* %i, align 4, !dbg !33
  %15 = load i32* %2, align 4, !dbg !33
  %16 = icmp slt i32 %14, %15, !dbg !33
  br i1 %16, label %17, label %38, !dbg !33

; <label>:17                                      ; preds = %13
  %18 = load i32* %3, align 4, !dbg !35
  %19 = sext i32 %18 to i64, !dbg !35
  %20 = mul i64 %19, 8, !dbg !35
  %21 = call noalias i8* @malloc(i64 %20) #3, !dbg !35
  %22 = bitcast i8* %21 to double*, !dbg !35
  %23 = load i32* %i, align 4, !dbg !35
  %24 = sext i32 %23 to i64, !dbg !35
  %25 = load double*** %A, align 8, !dbg !35
  %26 = getelementptr inbounds double** %25, i64 %24, !dbg !35
  store double* %22, double** %26, align 8, !dbg !35
  %27 = load i32* %i, align 4, !dbg !37
  %28 = sext i32 %27 to i64, !dbg !37
  %29 = load double*** %A, align 8, !dbg !37
  %30 = getelementptr inbounds double** %29, i64 %28, !dbg !37
  %31 = load double** %30, align 8, !dbg !37
  %32 = icmp eq double* %31, null, !dbg !37
  br i1 %32, label %33, label %34, !dbg !37

; <label>:33                                      ; preds = %17
  store i32 1, i32* %failed, align 4, !dbg !39
  br label %38, !dbg !41

; <label>:34                                      ; preds = %17
  br label %35, !dbg !42

; <label>:35                                      ; preds = %34
  %36 = load i32* %i, align 4, !dbg !33
  %37 = add nsw i32 %36, 1, !dbg !33
  store i32 %37, i32* %i, align 4, !dbg !33
  br label %13, !dbg !33

; <label>:38                                      ; preds = %33, %13
  %39 = load i32* %failed, align 4, !dbg !43
  %40 = icmp ne i32 %39, 0, !dbg !43
  br i1 %40, label %41, label %60, !dbg !43

; <label>:41                                      ; preds = %38
  %42 = load i32* %i, align 4, !dbg !45
  %43 = add nsw i32 %42, -1, !dbg !45
  store i32 %43, i32* %i, align 4, !dbg !45
  br label %44, !dbg !47

; <label>:44                                      ; preds = %54, %41
  %45 = load i32* %i, align 4, !dbg !47
  %46 = icmp sle i32 %45, 0, !dbg !47
  br i1 %46, label %47, label %57, !dbg !47

; <label>:47                                      ; preds = %44
  %48 = load i32* %i, align 4, !dbg !49
  %49 = sext i32 %48 to i64, !dbg !49
  %50 = load double*** %A, align 8, !dbg !49
  %51 = getelementptr inbounds double** %50, i64 %49, !dbg !49
  %52 = load double** %51, align 8, !dbg !49
  %53 = bitcast double* %52 to i8*, !dbg !49
  call void @free(i8* %53) #3, !dbg !49
  br label %54, !dbg !49

; <label>:54                                      ; preds = %47
  %55 = load i32* %i, align 4, !dbg !47
  %56 = add nsw i32 %55, -1, !dbg !47
  store i32 %56, i32* %i, align 4, !dbg !47
  br label %44, !dbg !47

; <label>:57                                      ; preds = %44
  %58 = load double*** %A, align 8, !dbg !50
  %59 = bitcast double** %58 to i8*, !dbg !50
  call void @free(i8* %59) #3, !dbg !50
  store double** null, double*** %1, !dbg !51
  br label %62, !dbg !51

; <label>:60                                      ; preds = %38
  %61 = load double*** %A, align 8, !dbg !52
  store double** %61, double*** %1, !dbg !52
  br label %62, !dbg !52

; <label>:62                                      ; preds = %60, %57, %11
  %63 = load double*** %1, !dbg !53
  ret double** %63, !dbg !53
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @Array2D_double_delete(i32 %M, i32 %N, double** %A) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double**, align 8
  %i = alloca i32, align 4
  store i32 %M, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !54), !dbg !55
  store i32 %N, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !56), !dbg !55
  store double** %A, double*** %3, align 8
  call void @llvm.dbg.declare(metadata !{double*** %3}, metadata !57), !dbg !55
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !58), !dbg !59
  %4 = load double*** %3, align 8, !dbg !60
  %5 = icmp eq double** %4, null, !dbg !60
  br i1 %5, label %6, label %7, !dbg !60

; <label>:6                                       ; preds = %0
  br label %25, !dbg !60

; <label>:7                                       ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !62
  br label %8, !dbg !62

; <label>:8                                       ; preds = %19, %7
  %9 = load i32* %i, align 4, !dbg !62
  %10 = load i32* %1, align 4, !dbg !62
  %11 = icmp slt i32 %9, %10, !dbg !62
  br i1 %11, label %12, label %22, !dbg !62

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4, !dbg !64
  %14 = sext i32 %13 to i64, !dbg !64
  %15 = load double*** %3, align 8, !dbg !64
  %16 = getelementptr inbounds double** %15, i64 %14, !dbg !64
  %17 = load double** %16, align 8, !dbg !64
  %18 = bitcast double* %17 to i8*, !dbg !64
  call void @free(i8* %18) #3, !dbg !64
  br label %19, !dbg !64

; <label>:19                                      ; preds = %12
  %20 = load i32* %i, align 4, !dbg !62
  %21 = add nsw i32 %20, 1, !dbg !62
  store i32 %21, i32* %i, align 4, !dbg !62
  br label %8, !dbg !62

; <label>:22                                      ; preds = %8
  %23 = load double*** %3, align 8, !dbg !65
  %24 = bitcast double** %23 to i8*, !dbg !65
  call void @free(i8* %24) #3, !dbg !65
  br label %25, !dbg !66

; <label>:25                                      ; preds = %22, %6
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @Array2D_double_copy(i32 %M, i32 %N, double** %B, double** %A) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double**, align 8
  %4 = alloca double**, align 8
  %remainder = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %Bi = alloca double*, align 8
  %Ai = alloca double*, align 8
  store i32 %M, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !67), !dbg !68
  store i32 %N, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !69), !dbg !68
  store double** %B, double*** %3, align 8
  call void @llvm.dbg.declare(metadata !{double*** %3}, metadata !70), !dbg !68
  store double** %A, double*** %4, align 8
  call void @llvm.dbg.declare(metadata !{double*** %4}, metadata !71), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %remainder}, metadata !72), !dbg !73
  %5 = load i32* %2, align 4, !dbg !73
  %6 = and i32 %5, 3, !dbg !73
  store i32 %6, i32* %remainder, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !74), !dbg !75
  store i32 0, i32* %i, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !76), !dbg !77
  store i32 0, i32* %j, align 4, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %7, !dbg !78

; <label>:7                                       ; preds = %92, %0
  %8 = load i32* %i, align 4, !dbg !78
  %9 = load i32* %1, align 4, !dbg !78
  %10 = icmp slt i32 %8, %9, !dbg !78
  br i1 %10, label %11, label %95, !dbg !78

; <label>:11                                      ; preds = %7
  call void @llvm.dbg.declare(metadata !{double** %Bi}, metadata !80), !dbg !82
  %12 = load i32* %i, align 4, !dbg !82
  %13 = sext i32 %12 to i64, !dbg !82
  %14 = load double*** %3, align 8, !dbg !82
  %15 = getelementptr inbounds double** %14, i64 %13, !dbg !82
  %16 = load double** %15, align 8, !dbg !82
  store double* %16, double** %Bi, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata !{double** %Ai}, metadata !83), !dbg !84
  %17 = load i32* %i, align 4, !dbg !84
  %18 = sext i32 %17 to i64, !dbg !84
  %19 = load double*** %4, align 8, !dbg !84
  %20 = getelementptr inbounds double** %19, i64 %18, !dbg !84
  %21 = load double** %20, align 8, !dbg !84
  store double* %21, double** %Ai, align 8, !dbg !84
  store i32 0, i32* %j, align 4, !dbg !85
  br label %22, !dbg !85

; <label>:22                                      ; preds = %36, %11
  %23 = load i32* %j, align 4, !dbg !85
  %24 = load i32* %remainder, align 4, !dbg !85
  %25 = icmp slt i32 %23, %24, !dbg !85
  br i1 %25, label %26, label %39, !dbg !85

; <label>:26                                      ; preds = %22
  %27 = load i32* %j, align 4, !dbg !87
  %28 = sext i32 %27 to i64, !dbg !87
  %29 = load double** %Ai, align 8, !dbg !87
  %30 = getelementptr inbounds double* %29, i64 %28, !dbg !87
  %31 = load double* %30, align 8, !dbg !87
  %32 = load i32* %j, align 4, !dbg !87
  %33 = sext i32 %32 to i64, !dbg !87
  %34 = load double** %Bi, align 8, !dbg !87
  %35 = getelementptr inbounds double* %34, i64 %33, !dbg !87
  store double %31, double* %35, align 8, !dbg !87
  br label %36, !dbg !87

; <label>:36                                      ; preds = %26
  %37 = load i32* %j, align 4, !dbg !85
  %38 = add nsw i32 %37, 1, !dbg !85
  store i32 %38, i32* %j, align 4, !dbg !85
  br label %22, !dbg !85

; <label>:39                                      ; preds = %22
  %40 = load i32* %remainder, align 4, !dbg !88
  store i32 %40, i32* %j, align 4, !dbg !88
  br label %41, !dbg !88

; <label>:41                                      ; preds = %88, %39
  %42 = load i32* %j, align 4, !dbg !88
  %43 = load i32* %2, align 4, !dbg !88
  %44 = icmp slt i32 %42, %43, !dbg !88
  br i1 %44, label %45, label %91, !dbg !88

; <label>:45                                      ; preds = %41
  %46 = load i32* %j, align 4, !dbg !90
  %47 = sext i32 %46 to i64, !dbg !90
  %48 = load double** %Ai, align 8, !dbg !90
  %49 = getelementptr inbounds double* %48, i64 %47, !dbg !90
  %50 = load double* %49, align 8, !dbg !90
  %51 = load i32* %j, align 4, !dbg !90
  %52 = sext i32 %51 to i64, !dbg !90
  %53 = load double** %Bi, align 8, !dbg !90
  %54 = getelementptr inbounds double* %53, i64 %52, !dbg !90
  store double %50, double* %54, align 8, !dbg !90
  %55 = load i32* %j, align 4, !dbg !92
  %56 = add nsw i32 %55, 1, !dbg !92
  %57 = sext i32 %56 to i64, !dbg !92
  %58 = load double** %Ai, align 8, !dbg !92
  %59 = getelementptr inbounds double* %58, i64 %57, !dbg !92
  %60 = load double* %59, align 8, !dbg !92
  %61 = load i32* %j, align 4, !dbg !92
  %62 = add nsw i32 %61, 1, !dbg !92
  %63 = sext i32 %62 to i64, !dbg !92
  %64 = load double** %Bi, align 8, !dbg !92
  %65 = getelementptr inbounds double* %64, i64 %63, !dbg !92
  store double %60, double* %65, align 8, !dbg !92
  %66 = load i32* %j, align 4, !dbg !93
  %67 = add nsw i32 %66, 2, !dbg !93
  %68 = sext i32 %67 to i64, !dbg !93
  %69 = load double** %Ai, align 8, !dbg !93
  %70 = getelementptr inbounds double* %69, i64 %68, !dbg !93
  %71 = load double* %70, align 8, !dbg !93
  %72 = load i32* %j, align 4, !dbg !93
  %73 = add nsw i32 %72, 2, !dbg !93
  %74 = sext i32 %73 to i64, !dbg !93
  %75 = load double** %Bi, align 8, !dbg !93
  %76 = getelementptr inbounds double* %75, i64 %74, !dbg !93
  store double %71, double* %76, align 8, !dbg !93
  %77 = load i32* %j, align 4, !dbg !94
  %78 = add nsw i32 %77, 3, !dbg !94
  %79 = sext i32 %78 to i64, !dbg !94
  %80 = load double** %Ai, align 8, !dbg !94
  %81 = getelementptr inbounds double* %80, i64 %79, !dbg !94
  %82 = load double* %81, align 8, !dbg !94
  %83 = load i32* %j, align 4, !dbg !94
  %84 = add nsw i32 %83, 3, !dbg !94
  %85 = sext i32 %84 to i64, !dbg !94
  %86 = load double** %Bi, align 8, !dbg !94
  %87 = getelementptr inbounds double* %86, i64 %85, !dbg !94
  store double %82, double* %87, align 8, !dbg !94
  br label %88, !dbg !95

; <label>:88                                      ; preds = %45
  %89 = load i32* %j, align 4, !dbg !88
  %90 = add nsw i32 %89, 4, !dbg !88
  store i32 %90, i32* %j, align 4, !dbg !88
  br label %41, !dbg !88

; <label>:91                                      ; preds = %41
  br label %92, !dbg !96

; <label>:92                                      ; preds = %91
  %93 = load i32* %i, align 4, !dbg !78
  %94 = add nsw i32 %93, 1, !dbg !78
  store i32 %94, i32* %i, align 4, !dbg !78
  br label %7, !dbg !78

; <label>:95                                      ; preds = %7
  ret void, !dbg !97
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c] [DW_LANG_C99]
!1 = metadata !{metadata !"array.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Array2D_double", metadata !"new_Array2D_double", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double** (i32, i32)* @new_Array2D_double, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [new_Array2D_double]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !11, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!10 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Array2D_double_delete", metadata !"Array2D_double_delete", metadata !"", i32 44, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, double**)* @Array2D_double_delete, null, null, metadata !2, i32 45} ; [ DW_TAG_subprogram ] [line 44] [def] [scope 45] [Array2D_double_delete]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !11, metadata !11, metadata !8}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Array2D_double_copy", metadata !"Array2D_double_copy", metadata !"", i32 56, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, double**, double**)* @Array2D_double_copy, null, null, metadata !2, i32 57} ; [ DW_TAG_subprogram ] [line 56] [def] [scope 57] [Array2D_double_copy]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !11, metadata !11, metadata !8, metadata !8}
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"M", metadata !5, i32 16777226, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 10]
!22 = metadata !{i32 10, i32 0, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 33554442, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 10]
!24 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 12]
!25 = metadata !{i32 12, i32 0, metadata !4, null}
!26 = metadata !{i32 786688, metadata !4, metadata !"failed", metadata !5, i32 13, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [failed] [line 13]
!27 = metadata !{i32 13, i32 0, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"A", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 15]
!29 = metadata !{i32 15, i32 0, metadata !4, null}
!30 = metadata !{i32 16, i32 0, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!32 = metadata !{i32 17, i32 0, metadata !31, null}
!33 = metadata !{i32 19, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!35 = metadata !{i32 21, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 20, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!37 = metadata !{i32 22, i32 0, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !36, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!39 = metadata !{i32 24, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 23, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!41 = metadata !{i32 25, i32 0, metadata !40, null}
!42 = metadata !{i32 27, i32 0, metadata !36, null}
!43 = metadata !{i32 33, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!45 = metadata !{i32 35, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !44, i32 34, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!47 = metadata !{i32 36, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !46, i32 36, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!49 = metadata !{i32 37, i32 0, metadata !48, null}
!50 = metadata !{i32 38, i32 0, metadata !46, null}
!51 = metadata !{i32 39, i32 0, metadata !46, null}
!52 = metadata !{i32 42, i32 0, metadata !44, null}
!53 = metadata !{i32 43, i32 0, metadata !4, null}
!54 = metadata !{i32 786689, metadata !12, metadata !"M", metadata !5, i32 16777260, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 44]
!55 = metadata !{i32 44, i32 0, metadata !12, null}
!56 = metadata !{i32 786689, metadata !12, metadata !"N", metadata !5, i32 33554476, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 44]
!57 = metadata !{i32 786689, metadata !12, metadata !"A", metadata !5, i32 50331692, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 44]
!58 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 46, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 46]
!59 = metadata !{i32 46, i32 0, metadata !12, null}
!60 = metadata !{i32 47, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !12, i32 47, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!62 = metadata !{i32 49, i32 0, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !12, i32 49, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!64 = metadata !{i32 50, i32 0, metadata !63, null}
!65 = metadata !{i32 52, i32 0, metadata !12, null}
!66 = metadata !{i32 53, i32 0, metadata !12, null}
!67 = metadata !{i32 786689, metadata !15, metadata !"M", metadata !5, i32 16777272, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 56]
!68 = metadata !{i32 56, i32 0, metadata !15, null}
!69 = metadata !{i32 786689, metadata !15, metadata !"N", metadata !5, i32 33554488, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 56]
!70 = metadata !{i32 786689, metadata !15, metadata !"B", metadata !5, i32 50331704, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [B] [line 56]
!71 = metadata !{i32 786689, metadata !15, metadata !"A", metadata !5, i32 67108920, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 56]
!72 = metadata !{i32 786688, metadata !15, metadata !"remainder", metadata !5, i32 59, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [remainder] [line 59]
!73 = metadata !{i32 59, i32 0, metadata !15, null}
!74 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 60, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 60]
!75 = metadata !{i32 60, i32 0, metadata !15, null}
!76 = metadata !{i32 786688, metadata !15, metadata !"j", metadata !5, i32 61, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 61]
!77 = metadata !{i32 61, i32 0, metadata !15, null}
!78 = metadata !{i32 63, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !15, i32 63, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!80 = metadata !{i32 786688, metadata !81, metadata !"Bi", metadata !5, i32 65, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Bi] [line 65]
!81 = metadata !{i32 786443, metadata !1, metadata !79, i32 64, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!82 = metadata !{i32 65, i32 0, metadata !81, null}
!83 = metadata !{i32 786688, metadata !81, metadata !"Ai", metadata !5, i32 66, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Ai] [line 66]
!84 = metadata !{i32 66, i32 0, metadata !81, null}
!85 = metadata !{i32 67, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !81, i32 67, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!87 = metadata !{i32 68, i32 0, metadata !86, null}
!88 = metadata !{i32 69, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !81, i32 69, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!90 = metadata !{i32 71, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 70, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!92 = metadata !{i32 72, i32 0, metadata !91, null}
!93 = metadata !{i32 73, i32 0, metadata !91, null}
!94 = metadata !{i32 74, i32 0, metadata !91, null}
!95 = metadata !{i32 75, i32 0, metadata !91, null}
!96 = metadata !{i32 76, i32 0, metadata !81, null}
!97 = metadata !{i32 77, i32 0, metadata !15, null}
