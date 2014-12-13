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

; Function Attrs: nounwind readnone uwtable
define <2 x double> @make_vec(double %a, double %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double %a}, i64 0, metadata !14), !dbg !59
  tail call void @llvm.dbg.value(metadata !{double %b}, i64 0, metadata !15), !dbg !59
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !17), !dbg !61
  %1 = insertelement <2 x double> undef, double %a, i32 0, !dbg !61
  tail call void @llvm.dbg.value(metadata !{<2 x double> %1}, i64 0, metadata !16), !dbg !61
  %2 = insertelement <2 x double> %1, double %b, i32 1, !dbg !61
  tail call void @llvm.dbg.value(metadata !{<2 x double> %2}, i64 0, metadata !16), !dbg !61
  ret <2 x double> %2, !dbg !62
}

; Function Attrs: nounwind readnone uwtable
define double @sum_vec(<2 x double> %x) #0 {
  tail call void @llvm.dbg.value(metadata !{<2 x double> %x}, i64 0, metadata !23), !dbg !63
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !24), !dbg !64
  %1 = extractelement <2 x double> %x, i32 0, !dbg !65
  %2 = extractelement <2 x double> %x, i32 1, !dbg !65
  %3 = fadd double %1, %2, !dbg !65
  ret double %3, !dbg !65
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !33), !dbg !66
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !34), !dbg !66
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !35), !dbg !68
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !36), !dbg !68
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !37), !dbg !68
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !38), !dbg !68
  tail call void @llvm.dbg.value(metadata !69, i64 0, metadata !55), !dbg !70
  tail call void @llvm.dbg.value(metadata !{<2 x double> %3}, i64 0, metadata !44), !dbg !71
  %1 = tail call <2 x double> @make_vec(double 1.000000e+00, double 1.000000e+00), !dbg !71
  tail call void @llvm.dbg.value(metadata !{<2 x double> %1}, i64 0, metadata !45), !dbg !71
  tail call void @llvm.dbg.value(metadata !{<2 x double> %4}, i64 0, metadata !46), !dbg !72
  %2 = tail call <2 x double> @make_vec(double 1.000000e+00, double 2.000000e+00), !dbg !73
  tail call void @llvm.dbg.value(metadata !{<2 x double> %2}, i64 0, metadata !47), !dbg !73
  tail call void @llvm.dbg.value(metadata !{<2 x double> %5}, i64 0, metadata !50), !dbg !73
  tail call void @llvm.dbg.value(metadata !{<2 x double> %3}, i64 0, metadata !43), !dbg !74
  tail call void @llvm.dbg.value(metadata !{<2 x double> %3}, i64 0, metadata !42), !dbg !74
  tail call void @llvm.dbg.value(metadata !{<2 x double> %3}, i64 0, metadata !41), !dbg !74
  tail call void @llvm.dbg.value(metadata !{<2 x double> %3}, i64 0, metadata !40), !dbg !74
  tail call void @llvm.dbg.value(metadata !{<2 x double> %3}, i64 0, metadata !39), !dbg !74
  tail call void @llvm.dbg.value(metadata !75, i64 0, metadata !51), !dbg !76
  br label %8, !dbg !76

.preheader:                                       ; preds = %8
  %3 = tail call <2 x double> @make_vec(double 0.000000e+00, double 0.000000e+00), !dbg !71
  %4 = tail call <2 x double> @make_vec(double 2.000000e+00, double 2.000000e+00), !dbg !72
  %5 = tail call <2 x double> @make_vec(double 1.000000e+00, double -1.000000e+00), !dbg !73
  %6 = extractelement <2 x double> %2, i32 0, !dbg !78
  %7 = fcmp ugt double %6, 2.500000e+06, !dbg !78
  br i1 %7, label %._crit_edge, label %.lr.ph, !dbg !78

; <label>:8                                       ; preds = %0, %8
  %twoThrd.015 = phi double [ 0.000000e+00, %0 ], [ %12, %8 ]
  %Cookson.012 = phi double [ 0.000000e+00, %0 ], [ %27, %8 ]
  %k.011.int = phi i32 [ 1, %0 ], [ %.int, %8 ]
  %9 = phi <2 x double> [ zeroinitializer, %0 ], [ %23, %8 ]
  %indvar.conv = sitofp i32 %k.011.int to double
  %10 = fadd double %indvar.conv, -1.000000e+00, !dbg !80
  %11 = tail call double @pow(double 0x3FE5555555555555, double %10) #4, !dbg !80
  %12 = fadd double %twoThrd.015, %11, !dbg !80
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !35), !dbg !80
  %13 = tail call double @sqrt(double %indvar.conv) #4, !dbg !82
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !36), !dbg !82
  %14 = fmul double %indvar.conv, %indvar.conv, !dbg !84
  %15 = fmul double %indvar.conv, %14, !dbg !84
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !52), !dbg !84
  %16 = tail call double @sin(double %indvar.conv) #4, !dbg !85
  tail call void @llvm.dbg.value(metadata !{double %16}, i64 0, metadata !53), !dbg !85
  %17 = tail call double @cos(double %indvar.conv) #4, !dbg !85
  tail call void @llvm.dbg.value(metadata !{double %17}, i64 0, metadata !54), !dbg !85
  %18 = fmul double %15, %16, !dbg !86
  %19 = fmul double %16, %18, !dbg !86
  %20 = insertelement <2 x double> undef, double %13, i32 0, !dbg !82
  %21 = insertelement <2 x double> %20, double %19, i32 1, !dbg !82
  %22 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %21, !dbg !82
  %23 = fadd <2 x double> %9, %22, !dbg !82
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !37), !dbg !86
  %24 = fmul double %15, %17, !dbg !87
  %25 = fmul double %17, %24, !dbg !87
  %26 = fdiv double 1.000000e+00, %25, !dbg !87
  %27 = fadd double %Cookson.012, %26, !dbg !87
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !38), !dbg !87
  %.int = add i32 %k.011.int, 1
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !51), !dbg !76
  %exitcond = icmp eq i32 %.int, 2500001, !dbg !76
  br i1 %exitcond, label %.preheader, label %8, !dbg !76

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %Harmonic.06 = phi <2 x double> [ %33, %.lr.ph ], [ %3, %.preheader ]
  %kv.05 = phi <2 x double> [ %43, %.lr.ph ], [ %2, %.preheader ]
  %zeta.04 = phi <2 x double> [ %36, %.lr.ph ], [ %3, %.preheader ]
  %poly.03 = phi <2 x double> [ %31, %.lr.ph ], [ %3, %.preheader ]
  %alt.02 = phi <2 x double> [ %38, %.lr.ph ], [ %3, %.preheader ]
  %Gregory.01 = phi <2 x double> [ %42, %.lr.ph ], [ %3, %.preheader ]
  %28 = fadd <2 x double> %1, %kv.05, !dbg !88
  %29 = fmul <2 x double> %kv.05, %28, !dbg !88
  %30 = fdiv <2 x double> %1, %29, !dbg !88
  %31 = fadd <2 x double> %poly.03, %30, !dbg !88
  tail call void @llvm.dbg.value(metadata !{<2 x double> %31}, i64 0, metadata !41), !dbg !88
  %32 = fdiv <2 x double> %1, %kv.05, !dbg !90
  %33 = fadd <2 x double> %Harmonic.06, %32, !dbg !90
  tail call void @llvm.dbg.value(metadata !{<2 x double> %33}, i64 0, metadata !39), !dbg !90
  %34 = fmul <2 x double> %kv.05, %kv.05, !dbg !91
  %35 = fdiv <2 x double> %1, %34, !dbg !91
  %36 = fadd <2 x double> %zeta.04, %35, !dbg !91
  tail call void @llvm.dbg.value(metadata !{<2 x double> %36}, i64 0, metadata !40), !dbg !91
  %37 = fdiv <2 x double> %5, %kv.05, !dbg !92
  %38 = fadd <2 x double> %alt.02, %37, !dbg !92
  tail call void @llvm.dbg.value(metadata !{<2 x double> %38}, i64 0, metadata !42), !dbg !92
  %39 = fmul <2 x double> %4, %kv.05, !dbg !93
  %40 = fsub <2 x double> %39, %1, !dbg !93
  %41 = fdiv <2 x double> %5, %40, !dbg !93
  %42 = fadd <2 x double> %Gregory.01, %41, !dbg !93
  tail call void @llvm.dbg.value(metadata !{<2 x double> %42}, i64 0, metadata !43), !dbg !93
  %43 = fadd <2 x double> %4, %kv.05, !dbg !78
  tail call void @llvm.dbg.value(metadata !{<2 x double> %43}, i64 0, metadata !49), !dbg !78
  %44 = extractelement <2 x double> %43, i32 0, !dbg !78
  %45 = fcmp ugt double %44, 2.500000e+06, !dbg !78
  br i1 %45, label %._crit_edge, label %.lr.ph, !dbg !78

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %Harmonic.0.lcssa = phi <2 x double> [ %3, %.preheader ], [ %33, %.lr.ph ]
  %zeta.0.lcssa = phi <2 x double> [ %3, %.preheader ], [ %36, %.lr.ph ]
  %poly.0.lcssa = phi <2 x double> [ %3, %.preheader ], [ %31, %.lr.ph ]
  %alt.0.lcssa = phi <2 x double> [ %3, %.preheader ], [ %38, %.lr.ph ]
  %Gregory.0.lcssa = phi <2 x double> [ %3, %.preheader ], [ %42, %.lr.ph ]
  %46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %12, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !94
  %47 = extractelement <2 x double> %23, i32 0, !dbg !94
  %48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %47, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0)) #4, !dbg !94
  %49 = tail call double @sum_vec(<2 x double> %poly.0.lcssa), !dbg !95
  %50 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %49, i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)) #4, !dbg !95
  %51 = extractelement <2 x double> %23, i32 1, !dbg !95
  %52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %51, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #4, !dbg !95
  %53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %27, i8* getelementptr inbounds ([14 x i8]* @.str5, i64 0, i64 0)) #4, !dbg !96
  %54 = tail call double @sum_vec(<2 x double> %Harmonic.0.lcssa), !dbg !96
  %55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %54, i8* getelementptr inbounds ([9 x i8]* @.str6, i64 0, i64 0)) #4, !dbg !96
  %56 = tail call double @sum_vec(<2 x double> %zeta.0.lcssa), !dbg !97
  %57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %56, i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0)) #4, !dbg !97
  %58 = tail call double @sum_vec(<2 x double> %alt.0.lcssa), !dbg !97
  %59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %58, i8* getelementptr inbounds ([21 x i8]* @.str8, i64 0, i64 0)) #4, !dbg !97
  %60 = tail call double @sum_vec(<2 x double> %Gregory.0.lcssa), !dbg !98
  %61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %60, i8* getelementptr inbounds ([8 x i8]* @.str9, i64 0, i64 0)) #4, !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!56, !57}
!llvm.ident = !{!58}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c] [DW_LANG_C99]
!1 = metadata !{metadata !"partialsums.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !19, metadata !25}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_vec", metadata !"make_vec", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, <2 x double> (double, double)* @make_vec, null, null, metadata !13, i32 13} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [make_vec]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !10}
!8 = metadata !{i32 786454, metadata !1, null, metadata !"v2df", i32 10, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [v2df] [line 10, size 0, align 0, offset 0] [from ]
!9 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 128, i32 0, i32 2048, metadata !10, metadata !11, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 128, offset 0] [vector] [from double]
!10 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17}
!14 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 12]
!15 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 12]
!16 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 14]
!17 = metadata !{i32 786688, metadata !4, metadata !"tmp", metadata !5, i32 15, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sum_vec", metadata !"sum_vec", metadata !"", i32 20, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (<2 x double>)* @sum_vec, null, null, metadata !22, i32 21} ; [ DW_TAG_subprogram ] [line 20] [def] [scope 21] [sum_vec]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !10, metadata !8}
!22 = metadata !{metadata !23, metadata !24}
!23 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !5, i32 16777236, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 20]
!24 = metadata !{i32 786688, metadata !19, metadata !"tmp", metadata !5, i32 22, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 26, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !32, i32 27} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [main]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !28, metadata !28, metadata !29}
!28 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!31 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55}
!33 = metadata !{i32 786689, metadata !25, metadata !"argc", metadata !5, i32 16777242, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 26]
!34 = metadata !{i32 786689, metadata !25, metadata !"argv", metadata !5, i32 33554458, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 26]
!35 = metadata !{i32 786688, metadata !25, metadata !"twoThrd", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [twoThrd] [line 28]
!36 = metadata !{i32 786688, metadata !25, metadata !"sqrts", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sqrts] [line 28]
!37 = metadata !{i32 786688, metadata !25, metadata !"Flint", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Flint] [line 28]
!38 = metadata !{i32 786688, metadata !25, metadata !"Cookson", metadata !5, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Cookson] [line 28]
!39 = metadata !{i32 786688, metadata !25, metadata !"Harmonic", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Harmonic] [line 29]
!40 = metadata !{i32 786688, metadata !25, metadata !"zeta", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zeta] [line 29]
!41 = metadata !{i32 786688, metadata !25, metadata !"poly", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [poly] [line 29]
!42 = metadata !{i32 786688, metadata !25, metadata !"alt", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [alt] [line 29]
!43 = metadata !{i32 786688, metadata !25, metadata !"Gregory", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gregory] [line 29]
!44 = metadata !{i32 786688, metadata !25, metadata !"zero", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zero] [line 30]
!45 = metadata !{i32 786688, metadata !25, metadata !"one", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [one] [line 30]
!46 = metadata !{i32 786688, metadata !25, metadata !"two", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [two] [line 30]
!47 = metadata !{i32 786688, metadata !25, metadata !"init", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [init] [line 30]
!48 = metadata !{i32 786688, metadata !25, metadata !"m_one", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m_one] [line 30]
!49 = metadata !{i32 786688, metadata !25, metadata !"kv", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kv] [line 30]
!50 = metadata !{i32 786688, metadata !25, metadata !"av", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [av] [line 30]
!51 = metadata !{i32 786688, metadata !25, metadata !"k", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 32]
!52 = metadata !{i32 786688, metadata !25, metadata !"k3", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k3] [line 32]
!53 = metadata !{i32 786688, metadata !25, metadata !"s", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 32]
!54 = metadata !{i32 786688, metadata !25, metadata !"c", metadata !5, i32 32, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 32]
!55 = metadata !{i32 786688, metadata !25, metadata !"n", metadata !5, i32 33, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 33]
!56 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!57 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!58 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!59 = metadata !{i32 12, i32 0, metadata !4, null}
!60 = metadata !{double* undef}
!61 = metadata !{i32 16, i32 0, metadata !4, null}
!62 = metadata !{i32 17, i32 0, metadata !4, null}
!63 = metadata !{i32 20, i32 0, metadata !19, null}
!64 = metadata !{i32 22, i32 0, metadata !19, null}
!65 = metadata !{i32 23, i32 0, metadata !19, null}
!66 = metadata !{i32 26, i32 0, metadata !25, null}
!67 = metadata !{double 0.000000e+00}
!68 = metadata !{i32 28, i32 0, metadata !25, null}
!69 = metadata !{i32 2500000}
!70 = metadata !{i32 33, i32 0, metadata !25, null}
!71 = metadata !{i32 35, i32 0, metadata !25, null}
!72 = metadata !{i32 36, i32 0, metadata !25, null}
!73 = metadata !{i32 37, i32 0, metadata !25, null}
!74 = metadata !{i32 39, i32 0, metadata !25, null}
!75 = metadata !{double 1.000000e+00}
!76 = metadata !{i32 41, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !25, i32 41, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!78 = metadata !{i32 51, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !25, i32 51, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!80 = metadata !{i32 43, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !77, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!82 = metadata !{i32 44, i32 0, metadata !81, null}
!83 = metadata !{double undef}
!84 = metadata !{i32 45, i32 0, metadata !81, null}
!85 = metadata !{i32 46, i32 0, metadata !81, null}
!86 = metadata !{i32 47, i32 0, metadata !81, null}
!87 = metadata !{i32 48, i32 0, metadata !81, null}
!88 = metadata !{i32 53, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !79, i32 52, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!90 = metadata !{i32 54, i32 0, metadata !89, null}
!91 = metadata !{i32 55, i32 0, metadata !89, null}
!92 = metadata !{i32 56, i32 0, metadata !89, null}
!93 = metadata !{i32 57, i32 0, metadata !89, null}
!94 = metadata !{i32 61, i32 0, metadata !25, null}
!95 = metadata !{i32 62, i32 0, metadata !25, null}
!96 = metadata !{i32 63, i32 0, metadata !25, null}
!97 = metadata !{i32 64, i32 0, metadata !25, null}
!98 = metadata !{i32 65, i32 0, metadata !25, null}
!99 = metadata !{i32 67, i32 0, metadata !25, null}
