; ModuleID = 'pi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @myadd(float* %sum, float* %addend) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  store float* %sum, float** %1, align 8
  call void @llvm.dbg.declare(metadata !{float** %1}, metadata !20), !dbg !21
  store float* %addend, float** %2, align 8
  call void @llvm.dbg.declare(metadata !{float** %2}, metadata !22), !dbg !21
  %3 = load float** %1, align 8, !dbg !23
  %4 = load float* %3, align 4, !dbg !23
  %5 = load float** %2, align 8, !dbg !23
  %6 = load float* %5, align 4, !dbg !23
  %7 = fadd float %4, %6, !dbg !23
  %8 = load float** %1, align 8, !dbg !23
  store float %7, float* %8, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %ztot = alloca float, align 4
  %yran = alloca float, align 4
  %ymult = alloca float, align 4
  %ymod = alloca float, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  %z = alloca float, align 4
  %pi = alloca float, align 4
  %prod = alloca float, align 4
  %low = alloca i64, align 8
  %ixran = alloca i64, align 8
  %itot = alloca i64, align 8
  %j = alloca i64, align 8
  %iprod = alloca i64, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !25), !dbg !26
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !27), !dbg !26
  call void @llvm.dbg.declare(metadata !{float* %ztot}, metadata !28), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %yran}, metadata !30), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %ymult}, metadata !31), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %ymod}, metadata !32), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %x}, metadata !33), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %y}, metadata !34), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %z}, metadata !35), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %pi}, metadata !36), !dbg !29
  call void @llvm.dbg.declare(metadata !{float* %prod}, metadata !37), !dbg !29
  call void @llvm.dbg.declare(metadata !{i64* %low}, metadata !38), !dbg !40
  call void @llvm.dbg.declare(metadata !{i64* %ixran}, metadata !41), !dbg !40
  call void @llvm.dbg.declare(metadata !{i64* %itot}, metadata !42), !dbg !40
  call void @llvm.dbg.declare(metadata !{i64* %j}, metadata !43), !dbg !40
  call void @llvm.dbg.declare(metadata !{i64* %iprod}, metadata !44), !dbg !40
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0)), !dbg !45
  store float 0.000000e+00, float* %ztot, align 4, !dbg !46
  store i64 1, i64* %low, align 8, !dbg !47
  store i64 1907, i64* %ixran, align 8, !dbg !48
  store float 5.813000e+03, float* %yran, align 4, !dbg !49
  store float 1.307000e+03, float* %ymult, align 4, !dbg !50
  store float 5.471000e+03, float* %ymod, align 4, !dbg !51
  store i64 40000000, i64* %itot, align 8, !dbg !52
  store i64 1, i64* %j, align 8, !dbg !53
  br label %5, !dbg !53

; <label>:5                                       ; preds = %51, %0
  %6 = load i64* %j, align 8, !dbg !53
  %7 = load i64* %itot, align 8, !dbg !53
  %8 = icmp sle i64 %6, %7, !dbg !53
  br i1 %8, label %9, label %54, !dbg !53

; <label>:9                                       ; preds = %5
  %10 = load i64* %ixran, align 8, !dbg !55
  %11 = mul nsw i64 27611, %10, !dbg !55
  store i64 %11, i64* %iprod, align 8, !dbg !55
  %12 = load i64* %iprod, align 8, !dbg !57
  %13 = load i64* %iprod, align 8, !dbg !57
  %14 = sdiv i64 %13, 74383, !dbg !57
  %15 = mul nsw i64 74383, %14, !dbg !57
  %16 = sub nsw i64 %12, %15, !dbg !57
  store i64 %16, i64* %ixran, align 8, !dbg !57
  %17 = load i64* %ixran, align 8, !dbg !58
  %18 = sitofp i64 %17 to float, !dbg !58
  %19 = fpext float %18 to double, !dbg !58
  %20 = fdiv double %19, 7.438300e+04, !dbg !58
  %21 = fptrunc double %20 to float, !dbg !58
  store float %21, float* %x, align 4, !dbg !58
  %22 = load float* %ymult, align 4, !dbg !59
  %23 = load float* %yran, align 4, !dbg !59
  %24 = fmul float %22, %23, !dbg !59
  store float %24, float* %prod, align 4, !dbg !59
  %25 = load float* %prod, align 4, !dbg !60
  %26 = load float* %ymod, align 4, !dbg !60
  %27 = load float* %prod, align 4, !dbg !60
  %28 = load float* %ymod, align 4, !dbg !60
  %29 = fdiv float %27, %28, !dbg !60
  %30 = fptosi float %29 to i64, !dbg !60
  %31 = sitofp i64 %30 to float, !dbg !60
  %32 = fmul float %26, %31, !dbg !60
  %33 = fsub float %25, %32, !dbg !60
  store float %33, float* %yran, align 4, !dbg !60
  %34 = load float* %yran, align 4, !dbg !61
  %35 = load float* %ymod, align 4, !dbg !61
  %36 = fdiv float %34, %35, !dbg !61
  store float %36, float* %y, align 4, !dbg !61
  %37 = load float* %x, align 4, !dbg !62
  %38 = load float* %x, align 4, !dbg !62
  %39 = fmul float %37, %38, !dbg !62
  %40 = load float* %y, align 4, !dbg !62
  %41 = load float* %y, align 4, !dbg !62
  %42 = fmul float %40, %41, !dbg !62
  %43 = fadd float %39, %42, !dbg !62
  store float %43, float* %z, align 4, !dbg !62
  call void @myadd(float* %ztot, float* %z), !dbg !63
  %44 = load float* %z, align 4, !dbg !64
  %45 = fpext float %44 to double, !dbg !64
  %46 = fcmp ole double %45, 1.000000e+00, !dbg !64
  br i1 %46, label %47, label %50, !dbg !64

; <label>:47                                      ; preds = %9
  %48 = load i64* %low, align 8, !dbg !66
  %49 = add nsw i64 %48, 1, !dbg !66
  store i64 %49, i64* %low, align 8, !dbg !66
  br label %50, !dbg !68

; <label>:50                                      ; preds = %47, %9
  br label %51, !dbg !69

; <label>:51                                      ; preds = %50
  %52 = load i64* %j, align 8, !dbg !53
  %53 = add nsw i64 %52, 1, !dbg !53
  store i64 %53, i64* %j, align 8, !dbg !53
  br label %5, !dbg !53

; <label>:54                                      ; preds = %5
  %55 = load float* %x, align 4, !dbg !70
  %56 = fpext float %55 to double, !dbg !70
  %57 = load float* %y, align 4, !dbg !70
  %58 = fpext float %57 to double, !dbg !70
  %59 = load i64* %low, align 8, !dbg !70
  %60 = trunc i64 %59 to i32, !dbg !70
  %61 = load i64* %j, align 8, !dbg !70
  %62 = trunc i64 %61 to i32, !dbg !70
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i32 0, i32 0), double %56, double %58, i32 %60, i32 %62), !dbg !70
  %64 = load i64* %low, align 8, !dbg !71
  %65 = sitofp i64 %64 to float, !dbg !71
  %66 = fpext float %65 to double, !dbg !71
  %67 = fmul double 4.000000e+00, %66, !dbg !71
  %68 = load i64* %itot, align 8, !dbg !71
  %69 = sitofp i64 %68 to float, !dbg !71
  %70 = fpext float %69 to double, !dbg !71
  %71 = fdiv double %67, %70, !dbg !71
  %72 = fptrunc double %71 to float, !dbg !71
  store float %72, float* %pi, align 4, !dbg !71
  %73 = load float* %pi, align 4, !dbg !72
  %74 = fpext float %73 to double, !dbg !72
  %75 = load float* %ztot, align 4, !dbg !72
  %76 = fpext float %75 to double, !dbg !72
  %77 = fmul double %76, 0.000000e+00, !dbg !72
  %78 = load i64* %itot, align 8, !dbg !72
  %79 = trunc i64 %78 to i32, !dbg !72
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str2, i32 0, i32 0), double %74, double %77, i32 %79), !dbg !72
  ret i32 0, !dbg !73
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c] [DW_LANG_C99]
!1 = metadata !{metadata !"pi.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"myadd", metadata !"myadd", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, float*)* @myadd, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [myadd]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!9 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 21, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 21} ; [ DW_TAG_subprogram ] [line 21] [def] [main]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13, metadata !13, metadata !14}
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"sum", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sum] [line 12]
!21 = metadata !{i32 12, i32 0, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"addend", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [addend] [line 12]
!23 = metadata !{i32 17, i32 0, metadata !4, null}
!24 = metadata !{i32 18, i32 0, metadata !4, null}
!25 = metadata !{i32 786689, metadata !10, metadata !"argc", metadata !5, i32 16777237, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 21]
!26 = metadata !{i32 21, i32 0, metadata !10, null}
!27 = metadata !{i32 786689, metadata !10, metadata !"argv", metadata !5, i32 33554453, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 21]
!28 = metadata !{i32 786688, metadata !10, metadata !"ztot", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ztot] [line 22]
!29 = metadata !{i32 22, i32 0, metadata !10, null}
!30 = metadata !{i32 786688, metadata !10, metadata !"yran", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yran] [line 22]
!31 = metadata !{i32 786688, metadata !10, metadata !"ymult", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ymult] [line 22]
!32 = metadata !{i32 786688, metadata !10, metadata !"ymod", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ymod] [line 22]
!33 = metadata !{i32 786688, metadata !10, metadata !"x", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 22]
!34 = metadata !{i32 786688, metadata !10, metadata !"y", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 22]
!35 = metadata !{i32 786688, metadata !10, metadata !"z", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 22]
!36 = metadata !{i32 786688, metadata !10, metadata !"pi", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pi] [line 22]
!37 = metadata !{i32 786688, metadata !10, metadata !"prod", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prod] [line 22]
!38 = metadata !{i32 786688, metadata !10, metadata !"low", metadata !5, i32 23, metadata !39, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [low] [line 23]
!39 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!40 = metadata !{i32 23, i32 0, metadata !10, null}
!41 = metadata !{i32 786688, metadata !10, metadata !"ixran", metadata !5, i32 23, metadata !39, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ixran] [line 23]
!42 = metadata !{i32 786688, metadata !10, metadata !"itot", metadata !5, i32 23, metadata !39, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [itot] [line 23]
!43 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 23, metadata !39, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 23]
!44 = metadata !{i32 786688, metadata !10, metadata !"iprod", metadata !5, i32 23, metadata !39, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iprod] [line 23]
!45 = metadata !{i32 25, i32 0, metadata !10, null}
!46 = metadata !{i32 26, i32 0, metadata !10, null}
!47 = metadata !{i32 27, i32 0, metadata !10, null}
!48 = metadata !{i32 28, i32 0, metadata !10, null}
!49 = metadata !{i32 29, i32 0, metadata !10, null}
!50 = metadata !{i32 30, i32 0, metadata !10, null}
!51 = metadata !{i32 31, i32 0, metadata !10, null}
!52 = metadata !{i32 35, i32 0, metadata !10, null}
!53 = metadata !{i32 38, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !10, i32 38, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!55 = metadata !{i32 48, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !54, i32 38, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!57 = metadata !{i32 49, i32 0, metadata !56, null}
!58 = metadata !{i32 50, i32 0, metadata !56, null}
!59 = metadata !{i32 51, i32 0, metadata !56, null}
!60 = metadata !{i32 52, i32 0, metadata !56, null}
!61 = metadata !{i32 53, i32 0, metadata !56, null}
!62 = metadata !{i32 54, i32 0, metadata !56, null}
!63 = metadata !{i32 55, i32 0, metadata !56, null}
!64 = metadata !{i32 56, i32 0, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !56, i32 56, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!66 = metadata !{i32 57, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !65, i32 56, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!68 = metadata !{i32 58, i32 0, metadata !67, null} ; [ DW_TAG_imported_module ]
!69 = metadata !{i32 59, i32 0, metadata !56, null}
!70 = metadata !{i32 60, i32 0, metadata !10, null}
!71 = metadata !{i32 61, i32 0, metadata !10, null}
!72 = metadata !{i32 62, i32 0, metadata !10, null}
!73 = metadata !{i32 63, i32 0, metadata !10, null}
