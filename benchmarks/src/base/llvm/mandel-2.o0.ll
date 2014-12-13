; ModuleID = 'mandel-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@max_i = global i32 65536, align 4
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @sqr(double %x) #0 {
  %1 = alloca double, align 8
  store double %x, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !25), !dbg !26
  %2 = load double* %1, align 8, !dbg !26
  %3 = load double* %1, align 8, !dbg !26
  %4 = fmul double %2, %3, !dbg !26
  ret double %4, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @cnorm2(double %z.coerce0, double %z.coerce1) #0 {
  %z = alloca { double, double }, align 8
  %1 = getelementptr { double, double }* %z, i32 0, i32 0
  store double %z.coerce0, double* %1
  %2 = getelementptr { double, double }* %z, i32 0, i32 1
  store double %z.coerce1, double* %2
  call void @llvm.dbg.declare(metadata !{{ double, double }* %z}, metadata !27), !dbg !28
  %3 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !28
  %4 = load double* %3, align 8, !dbg !28
  %5 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !28
  %6 = load double* %5, align 8, !dbg !28
  %7 = call double @sqr(double %4), !dbg !28
  %8 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !28
  %9 = load double* %8, align 8, !dbg !28
  %10 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !28
  %11 = load double* %10, align 8, !dbg !28
  %12 = call double @sqr(double %11), !dbg !28
  %13 = fadd double %7, %12, !dbg !28
  ret double %13, !dbg !28
}

; Function Attrs: nounwind uwtable
define i32 @loop(double %c.coerce0, double %c.coerce1) #0 {
  %c = alloca { double, double }, align 8
  %z = alloca { double, double }, align 8
  %i = alloca i32, align 4
  %1 = alloca { double, double }, align 8
  %2 = getelementptr { double, double }* %c, i32 0, i32 0
  store double %c.coerce0, double* %2
  %3 = getelementptr { double, double }* %c, i32 0, i32 1
  store double %c.coerce1, double* %3
  call void @llvm.dbg.declare(metadata !{{ double, double }* %c}, metadata !29), !dbg !30
  call void @llvm.dbg.declare(metadata !{{ double, double }* %z}, metadata !31), !dbg !32
  %4 = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !32
  %5 = load double* %4, align 8, !dbg !32
  %6 = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !32
  %7 = load double* %6, align 8, !dbg !32
  %8 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !32
  %9 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !32
  store double %5, double* %8, align 8, !dbg !32
  store double %7, double* %9, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !33), !dbg !34
  store i32 1, i32* %i, align 4, !dbg !34
  br label %10, !dbg !35

; <label>:10                                      ; preds = %30, %0
  %11 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !35
  %12 = load double* %11, align 8, !dbg !35
  %13 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !35
  %14 = load double* %13, align 8, !dbg !35
  %15 = getelementptr inbounds { double, double }* %1, i32 0, i32 0, !dbg !35
  %16 = getelementptr inbounds { double, double }* %1, i32 0, i32 1, !dbg !35
  store double %12, double* %15, align 8, !dbg !35
  store double %14, double* %16, align 8, !dbg !35
  %17 = getelementptr { double, double }* %1, i32 0, i32 0, !dbg !35
  %18 = load double* %17, align 1, !dbg !35
  %19 = getelementptr { double, double }* %1, i32 0, i32 1, !dbg !35
  %20 = load double* %19, align 1, !dbg !35
  %21 = call double @cnorm2(double %18, double %20), !dbg !35
  %22 = fcmp ole double %21, 4.000000e+00, !dbg !35
  br i1 %22, label %23, label %28, !dbg !35

; <label>:23                                      ; preds = %10
  %24 = load i32* %i, align 4, !dbg !35
  %25 = add nsw i32 %24, 1, !dbg !35
  store i32 %25, i32* %i, align 4, !dbg !35
  %26 = load i32* @max_i, align 4, !dbg !35
  %27 = icmp slt i32 %24, %26, !dbg !35
  br label %28

; <label>:28                                      ; preds = %23, %10
  %29 = phi i1 [ false, %10 ], [ %27, %23 ]
  br i1 %29, label %30, label %53

; <label>:30                                      ; preds = %28
  %31 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !36
  %32 = load double* %31, align 8, !dbg !36
  %33 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !36
  %34 = load double* %33, align 8, !dbg !36
  %35 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !36
  %36 = load double* %35, align 8, !dbg !36
  %37 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !36
  %38 = load double* %37, align 8, !dbg !36
  %39 = fmul double %32, %36, !dbg !36
  %40 = fmul double %34, %38, !dbg !36
  %41 = fsub double %39, %40, !dbg !36
  %42 = fmul double %34, %36, !dbg !36
  %43 = fmul double %32, %38, !dbg !36
  %44 = fadd double %42, %43, !dbg !36
  %45 = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !36
  %46 = load double* %45, align 8, !dbg !36
  %47 = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !36
  %48 = load double* %47, align 8, !dbg !36
  %49 = fadd double %41, %46, !dbg !36
  %50 = fadd double %44, %48, !dbg !36
  %51 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !36
  %52 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !36
  store double %49, double* %51, align 8, !dbg !36
  store double %50, double* %52, align 8, !dbg !36
  br label %10, !dbg !36

; <label>:53                                      ; preds = %28
  %54 = load i32* %i, align 4, !dbg !37
  ret i32 %54, !dbg !37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = alloca { double, double }, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !38), !dbg !39
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !40), !dbg !39
  store i32 -39, i32* %j, align 4, !dbg !41
  br label %3, !dbg !41

; <label>:3                                       ; preds = %40, %0
  %4 = load i32* %j, align 4, !dbg !41
  %5 = icmp slt i32 %4, 39, !dbg !41
  br i1 %5, label %6, label %43, !dbg !41

; <label>:6                                       ; preds = %3
  store i32 -39, i32* %i, align 4, !dbg !43
  br label %7, !dbg !43

; <label>:7                                       ; preds = %35, %6
  %8 = load i32* %i, align 4, !dbg !43
  %9 = icmp slt i32 %8, 39, !dbg !43
  br i1 %9, label %10, label %38, !dbg !43

; <label>:10                                      ; preds = %7
  %11 = load i32* %j, align 4, !dbg !46
  %12 = sitofp i32 %11 to double, !dbg !46
  %13 = fdiv double %12, 4.000000e+01, !dbg !46
  %14 = fsub double %13, 5.000000e-01, !dbg !46
  %15 = load i32* %i, align 4, !dbg !46
  %16 = sitofp i32 %15 to double, !dbg !46
  %17 = fdiv double %16, 4.000000e+01, !dbg !46
  %18 = fmul double %17, 0.000000e+00, !dbg !46
  %19 = fsub double %18, 0.000000e+00, !dbg !46
  %20 = fmul double %17, 1.000000e+00, !dbg !46
  %21 = fadd double 0.000000e+00, %20, !dbg !46
  %22 = fadd double %14, %19, !dbg !46
  %23 = fadd double 0.000000e+00, %21, !dbg !46
  %24 = getelementptr inbounds { double, double }* %2, i32 0, i32 0, !dbg !46
  %25 = getelementptr inbounds { double, double }* %2, i32 0, i32 1, !dbg !46
  store double %22, double* %24, align 8, !dbg !46
  store double %23, double* %25, align 8, !dbg !46
  %26 = getelementptr { double, double }* %2, i32 0, i32 0, !dbg !46
  %27 = load double* %26, align 1, !dbg !46
  %28 = getelementptr { double, double }* %2, i32 0, i32 1, !dbg !46
  %29 = load double* %28, align 1, !dbg !46
  %30 = call i32 @loop(double %27, double %29), !dbg !46
  %31 = load i32* @max_i, align 4, !dbg !46
  %32 = icmp sgt i32 %30, %31, !dbg !46
  %33 = select i1 %32, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), !dbg !46
  %34 = call i32 (i8*, ...)* @printf(i8* %33), !dbg !46
  br label %35, !dbg !46

; <label>:35                                      ; preds = %10
  %36 = load i32* %i, align 4, !dbg !43
  %37 = add nsw i32 %36, 1, !dbg !43
  store i32 %37, i32* %i, align 4, !dbg !43
  br label %7, !dbg !43

; <label>:38                                      ; preds = %7
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !47
  br label %40, !dbg !48

; <label>:40                                      ; preds = %38
  %41 = load i32* %j, align 4, !dbg !41
  %42 = add nsw i32 %41, 1, !dbg !41
  store i32 %42, i32* %j, align 4, !dbg !41
  br label %3, !dbg !41

; <label>:43                                      ; preds = %3
  ret i32 0, !dbg !49
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !20, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"mandel-2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !17}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sqr", metadata !"sqr", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @sqr, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [sqr]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cnorm2", metadata !"cnorm2", metadata !"", i32 9, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double, double)* @cnorm2, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [cnorm2]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"complex", i32 0, i64 128, i64 64, i64 0, i32 0, i32 3} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"loop", metadata !"loop", metadata !"", i32 11, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (double, double)* @loop, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [loop]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16, metadata !12}
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !16}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786484, i32 0, null, metadata !"max_i", metadata !"max_i", metadata !"", metadata !5, i32 5, metadata !16, i32 0, i32 1, i32* @max_i, null} ; [ DW_TAG_variable ] [max_i] [line 5] [def]
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!25 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 7]
!26 = metadata !{i32 7, i32 0, metadata !4, null}
!27 = metadata !{i32 786689, metadata !9, metadata !"z", metadata !5, i32 16777225, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 9]
!28 = metadata !{i32 9, i32 0, metadata !9, null}
!29 = metadata !{i32 786689, metadata !13, metadata !"c", metadata !5, i32 16777227, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 11]
!30 = metadata !{i32 11, i32 0, metadata !13, null}
!31 = metadata !{i32 786688, metadata !13, metadata !"z", metadata !5, i32 12, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 12]
!32 = metadata !{i32 12, i32 0, metadata !13, null}
!33 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 13, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!34 = metadata !{i32 13, i32 0, metadata !13, null}
!35 = metadata !{i32 14, i32 0, metadata !13, null}
!36 = metadata !{i32 15, i32 0, metadata !13, null}
!37 = metadata !{i32 16, i32 0, metadata !13, null}
!38 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 20, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 20]
!39 = metadata !{i32 20, i32 0, metadata !17, null}
!40 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !5, i32 20, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 20]
!41 = metadata !{i32 21, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !17, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!43 = metadata !{i32 22, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 22, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!45 = metadata !{i32 786443, metadata !1, metadata !42, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!46 = metadata !{i32 23, i32 0, metadata !44, null}
!47 = metadata !{i32 24, i32 0, metadata !45, null}
!48 = metadata !{i32 25, i32 0, metadata !45, null}
!49 = metadata !{i32 26, i32 0, metadata !17, null}
