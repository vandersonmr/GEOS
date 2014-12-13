; ModuleID = 'mandel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@accum = common global { double, double } zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @emit(double %X.coerce0, double %X.coerce1) #0 {
  %X = alloca { double, double }, align 8
  %1 = getelementptr { double, double }* %X, i32 0, i32 0
  store double %X.coerce0, double* %1
  %2 = getelementptr { double, double }* %X, i32 0, i32 1
  store double %X.coerce1, double* %2
  call void @llvm.dbg.declare(metadata !{{ double, double }* %X}, metadata !28), !dbg !29
  %3 = getelementptr inbounds { double, double }* %X, i32 0, i32 0, !dbg !30
  %4 = load double* %3, align 8, !dbg !30
  %5 = getelementptr inbounds { double, double }* %X, i32 0, i32 1, !dbg !30
  %6 = load double* %5, align 8, !dbg !30
  %7 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 0), align 8, !dbg !30
  %8 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 1), align 8, !dbg !30
  %9 = fadd double %7, %4, !dbg !30
  %10 = fadd double %8, %6, !dbg !30
  store volatile double %9, double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 0), align 8, !dbg !30
  store volatile double %10, double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 1), align 8, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @mandel() #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %n = alloca i32, align 4
  %c = alloca { double, double }, align 8
  %z = alloca { double, double }, align 8
  %3 = alloca { double, double }, align 8
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %y}, metadata !34), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !35), !dbg !33
  store i32 0, i32* %x, align 4, !dbg !36
  br label %4, !dbg !36

; <label>:4                                       ; preds = %86, %0
  %5 = load i32* %x, align 4, !dbg !36
  %6 = icmp slt i32 %5, 5000, !dbg !36
  br i1 %6, label %7, label %89, !dbg !36

; <label>:7                                       ; preds = %4
  store i32 0, i32* %y, align 4, !dbg !38
  br label %8, !dbg !38

; <label>:8                                       ; preds = %82, %7
  %9 = load i32* %y, align 4, !dbg !38
  %10 = icmp slt i32 %9, 5000, !dbg !38
  br i1 %10, label %11, label %85, !dbg !38

; <label>:11                                      ; preds = %8
  call void @llvm.dbg.declare(metadata !{{ double, double }* %c}, metadata !41), !dbg !43
  %12 = load i32* %x, align 4, !dbg !43
  %13 = sitofp i32 %12 to double, !dbg !43
  %14 = fmul double %13, 4.000000e+00, !dbg !43
  %15 = fdiv double %14, 5.000000e+03, !dbg !43
  %16 = fadd double -2.000000e+00, %15, !dbg !43
  %17 = load i32* %y, align 4, !dbg !43
  %18 = sitofp i32 %17 to double, !dbg !43
  %19 = fmul double %18, 4.000000e+00, !dbg !43
  %20 = fdiv double %19, 5.000000e+03, !dbg !43
  %21 = fsub double -2.000000e+00, %20, !dbg !43
  %22 = fmul double %21, 0.000000e+00, !dbg !43
  %23 = fsub double %22, 0.000000e+00, !dbg !43
  %24 = fmul double %21, 1.000000e+00, !dbg !43
  %25 = fadd double 0.000000e+00, %24, !dbg !43
  %26 = fadd double %16, %23, !dbg !43
  %27 = fadd double 0.000000e+00, %25, !dbg !43
  %28 = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !43
  %29 = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !43
  store double %26, double* %28, align 8, !dbg !43
  store double %27, double* %29, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata !{{ double, double }* %z}, metadata !44), !dbg !45
  %30 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !45
  %31 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !45
  store double 0.000000e+00, double* %30, align 8, !dbg !45
  store double 0.000000e+00, double* %31, align 8, !dbg !45
  store i32 0, i32* %n, align 4, !dbg !46
  br label %32, !dbg !46

; <label>:32                                      ; preds = %68, %11
  %33 = load i32* %n, align 4, !dbg !46
  %34 = icmp slt i32 %33, 10, !dbg !46
  br i1 %34, label %35, label %71, !dbg !46

; <label>:35                                      ; preds = %32
  %36 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !48
  %37 = load double* %36, align 8, !dbg !48
  %38 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !48
  %39 = load double* %38, align 8, !dbg !48
  %40 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !48
  %41 = load double* %40, align 8, !dbg !48
  %42 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !48
  %43 = load double* %42, align 8, !dbg !48
  %44 = fmul double %37, %41, !dbg !48
  %45 = fmul double %39, %43, !dbg !48
  %46 = fsub double %44, %45, !dbg !48
  %47 = fmul double %39, %41, !dbg !48
  %48 = fmul double %37, %43, !dbg !48
  %49 = fadd double %47, %48, !dbg !48
  %50 = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !48
  %51 = load double* %50, align 8, !dbg !48
  %52 = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !48
  %53 = load double* %52, align 8, !dbg !48
  %54 = fadd double %46, %51, !dbg !48
  %55 = fadd double %49, %53, !dbg !48
  %56 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !48
  %57 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !48
  store double %54, double* %56, align 8, !dbg !48
  store double %55, double* %57, align 8, !dbg !48
  %58 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !50
  %59 = load double* %58, !dbg !50
  %60 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !50
  %61 = load double* %60, !dbg !50
  store double %59, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !52) #4, !dbg !53
  store double %61, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !54) #4, !dbg !53
  %62 = load double* %1, align 8, !dbg !55
  %63 = load double* %2, align 8, !dbg !55
  %64 = call double @hypot(double %62, double %63) #4, !dbg !55
  %65 = fcmp oge double %64, 2.000000e+00, !dbg !50
  br i1 %65, label %66, label %67, !dbg !50

; <label>:66                                      ; preds = %35
  br label %71, !dbg !57

; <label>:67                                      ; preds = %35
  br label %68, !dbg !58

; <label>:68                                      ; preds = %67
  %69 = load i32* %n, align 4, !dbg !46
  %70 = add nsw i32 %69, 1, !dbg !46
  store i32 %70, i32* %n, align 4, !dbg !46
  br label %32, !dbg !46

; <label>:71                                      ; preds = %66, %32
  %72 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !59
  %73 = load double* %72, align 8, !dbg !59
  %74 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !59
  %75 = load double* %74, align 8, !dbg !59
  %76 = getelementptr inbounds { double, double }* %3, i32 0, i32 0, !dbg !59
  %77 = getelementptr inbounds { double, double }* %3, i32 0, i32 1, !dbg !59
  store double %73, double* %76, align 8, !dbg !59
  store double %75, double* %77, align 8, !dbg !59
  %78 = getelementptr { double, double }* %3, i32 0, i32 0, !dbg !59
  %79 = load double* %78, align 1, !dbg !59
  %80 = getelementptr { double, double }* %3, i32 0, i32 1, !dbg !59
  %81 = load double* %80, align 1, !dbg !59
  call void @emit(double %79, double %81), !dbg !59
  br label %82, !dbg !60

; <label>:82                                      ; preds = %71
  %83 = load i32* %y, align 4, !dbg !38
  %84 = add nsw i32 %83, 1, !dbg !38
  store i32 %84, i32* %y, align 4, !dbg !38
  br label %8, !dbg !38

; <label>:85                                      ; preds = %8
  br label %86, !dbg !61

; <label>:86                                      ; preds = %85
  %87 = load i32* %x, align 4, !dbg !36
  %88 = add nsw i32 %87, 1, !dbg !36
  store i32 %88, i32* %x, align 4, !dbg !36
  br label %4, !dbg !36

; <label>:89                                      ; preds = %4
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @mandel(), !dbg !63
  %2 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 0), align 8, !dbg !64
  %3 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 1), align 8, !dbg !64
  %4 = fptosi double %2 to i32, !dbg !64
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %4), !dbg !64
  ret i32 0, !dbg !65
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare double @hypot(double, double) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !22, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c] [DW_LANG_C99]
!1 = metadata !{metadata !"mandel.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"emit", metadata !"emit", metadata !"", i32 25, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double, double)* @emit, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [emit]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"complex", i32 0, i64 128, i64 64, i64 0, i32 0, i32 3} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mandel", metadata !"mandel", metadata !"", i32 29, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @mandel, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [mandel]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 46, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{i32 786478, metadata !17, metadata !18, metadata !"__tg_hypot", metadata !"__tg_hypot", metadata !"_ZL10__tg_hypotdd", i32 833, metadata !19, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !2, i32 833} ; [ DW_TAG_subprogram ] [line 833] [local] [def] [__tg_hypot]
!17 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/tgmath.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!18 = metadata !{i32 786473, metadata !17}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/bin/../lib/clang/3.5/include/tgmath.h]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !21, metadata !21, metadata !21}
!21 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786484, i32 0, null, metadata !"accum", metadata !"accum", metadata !"", metadata !5, i32 24, metadata !24, i32 0, i32 1, { double, double }* @accum, null} ; [ DW_TAG_variable ] [accum] [line 24] [def]
!24 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from complex]
!25 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!26 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!27 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!28 = metadata !{i32 786689, metadata !4, metadata !"X", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X] [line 25]
!29 = metadata !{i32 25, i32 0, metadata !4, null}
!30 = metadata !{i32 26, i32 0, metadata !4, null}
!31 = metadata !{i32 27, i32 0, metadata !4, null}
!32 = metadata !{i32 786688, metadata !9, metadata !"x", metadata !5, i32 30, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 30]
!33 = metadata !{i32 30, i32 0, metadata !9, null}
!34 = metadata !{i32 786688, metadata !9, metadata !"y", metadata !5, i32 30, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 30]
!35 = metadata !{i32 786688, metadata !9, metadata !"n", metadata !5, i32 30, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 30]
!36 = metadata !{i32 31, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !9, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!38 = metadata !{i32 32, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !40, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!40 = metadata !{i32 786443, metadata !1, metadata !37, i32 31, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!41 = metadata !{i32 786688, metadata !42, metadata !"c", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 33]
!42 = metadata !{i32 786443, metadata !1, metadata !39, i32 32, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!43 = metadata !{i32 33, i32 0, metadata !42, null}
!44 = metadata !{i32 786688, metadata !42, metadata !"z", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 34]
!45 = metadata !{i32 34, i32 0, metadata !42, null}
!46 = metadata !{i32 36, i32 0, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !42, i32 36, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!48 = metadata !{i32 37, i32 0, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 36, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!50 = metadata !{i32 38, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !49, i32 38, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!52 = metadata !{i32 786689, metadata !16, metadata !"__x", metadata !18, i32 16778049, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__x] [line 833]
!53 = metadata !{i32 833, i32 0, metadata !16, metadata !50}
!54 = metadata !{i32 786689, metadata !16, metadata !"__y", metadata !18, i32 33555265, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__y] [line 833]
!55 = metadata !{i32 833, i32 0, metadata !56, metadata !50}
!56 = metadata !{i32 786443, metadata !17, metadata !16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/bin/../lib/clang/3.5/include/tgmath.h]
!57 = metadata !{i32 39, i32 0, metadata !51, null}
!58 = metadata !{i32 40, i32 0, metadata !49, null}
!59 = metadata !{i32 41, i32 0, metadata !42, null}
!60 = metadata !{i32 42, i32 0, metadata !42, null}
!61 = metadata !{i32 43, i32 0, metadata !40, null}
!62 = metadata !{i32 44, i32 0, metadata !9, null}
!63 = metadata !{i32 47, i32 0, metadata !12, null}
!64 = metadata !{i32 48, i32 0, metadata !12, null}
!65 = metadata !{i32 49, i32 0, metadata !12, null}
