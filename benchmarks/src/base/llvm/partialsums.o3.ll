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
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !71), !dbg !73
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !74), !dbg !73
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !75), !dbg !76
  tail call void @llvm.dbg.value(metadata !77, i64 0, metadata !78), !dbg !76
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !78), !dbg !76
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !44), !dbg !72
  tail call void @llvm.dbg.value(metadata !80, i64 0, metadata !71), !dbg !73
  tail call void @llvm.dbg.value(metadata !80, i64 0, metadata !74), !dbg !73
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !75), !dbg !76
  tail call void @llvm.dbg.value(metadata !81, i64 0, metadata !78), !dbg !76
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !78), !dbg !76
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !45), !dbg !72
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !84), !dbg !86
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !87), !dbg !86
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !88), !dbg !89
  tail call void @llvm.dbg.value(metadata !90, i64 0, metadata !91), !dbg !89
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !91), !dbg !89
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !46), !dbg !85
  tail call void @llvm.dbg.value(metadata !80, i64 0, metadata !93), !dbg !95
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !96), !dbg !95
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !97), !dbg !98
  tail call void @llvm.dbg.value(metadata !81, i64 0, metadata !99), !dbg !98
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !99), !dbg !98
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !47), !dbg !94
  tail call void @llvm.dbg.value(metadata !80, i64 0, metadata !93), !dbg !95
  tail call void @llvm.dbg.value(metadata !101, i64 0, metadata !96), !dbg !95
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !97), !dbg !98
  tail call void @llvm.dbg.value(metadata !81, i64 0, metadata !99), !dbg !98
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !99), !dbg !98
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !50), !dbg !94
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !43), !dbg !103
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !42), !dbg !103
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !41), !dbg !103
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !40), !dbg !103
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !39), !dbg !103
  tail call void @llvm.dbg.value(metadata !80, i64 0, metadata !51), !dbg !104
  br label %1, !dbg !104

; <label>:1                                       ; preds = %0, %1
  %twoThrd.011 = phi double [ 0.000000e+00, %0 ], [ %5, %1 ]
  %Cookson.08 = phi double [ 0.000000e+00, %0 ], [ %20, %1 ]
  %k.07.int = phi i32 [ 1, %0 ], [ %.int, %1 ]
  %2 = phi <2 x double> [ zeroinitializer, %0 ], [ %16, %1 ]
  %indvar.conv = sitofp i32 %k.07.int to double
  %3 = fadd double %indvar.conv, -1.000000e+00, !dbg !106
  %4 = tail call double @pow(double 0x3FE5555555555555, double %3) #4, !dbg !106
  %5 = fadd double %twoThrd.011, %4, !dbg !106
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !35), !dbg !106
  %6 = tail call double @sqrt(double %indvar.conv) #4, !dbg !108
  tail call void @llvm.dbg.value(metadata !109, i64 0, metadata !36), !dbg !108
  %7 = fmul double %indvar.conv, %indvar.conv, !dbg !110
  %8 = fmul double %indvar.conv, %7, !dbg !110
  tail call void @llvm.dbg.value(metadata !{double %8}, i64 0, metadata !52), !dbg !110
  %9 = tail call double @sin(double %indvar.conv) #4, !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !53), !dbg !111
  %10 = tail call double @cos(double %indvar.conv) #4, !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !54), !dbg !111
  %11 = fmul double %8, %9, !dbg !112
  %12 = fmul double %9, %11, !dbg !112
  %13 = insertelement <2 x double> undef, double %6, i32 0, !dbg !108
  %14 = insertelement <2 x double> %13, double %12, i32 1, !dbg !108
  %15 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %14, !dbg !108
  %16 = fadd <2 x double> %2, %15, !dbg !108
  tail call void @llvm.dbg.value(metadata !109, i64 0, metadata !37), !dbg !112
  %17 = fmul double %8, %10, !dbg !113
  %18 = fmul double %10, %17, !dbg !113
  %19 = fdiv double 1.000000e+00, %18, !dbg !113
  %20 = fadd double %Cookson.08, %19, !dbg !113
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !38), !dbg !113
  %.int = add i32 %k.07.int, 1
  tail call void @llvm.dbg.value(metadata !109, i64 0, metadata !51), !dbg !104
  %exitcond = icmp eq i32 %.int, 2500001, !dbg !104
  br i1 %exitcond, label %.preheader, label %1, !dbg !104

.preheader:                                       ; preds = %1, %.preheader
  %Harmonic.06 = phi <2 x double> [ %26, %.preheader ], [ zeroinitializer, %1 ]
  %kv.05 = phi <2 x double> [ %36, %.preheader ], [ <double 1.000000e+00, double 2.000000e+00>, %1 ]
  %zeta.04 = phi <2 x double> [ %29, %.preheader ], [ zeroinitializer, %1 ]
  %poly.03 = phi <2 x double> [ %24, %.preheader ], [ zeroinitializer, %1 ]
  %alt.02 = phi <2 x double> [ %31, %.preheader ], [ zeroinitializer, %1 ]
  %Gregory.01 = phi <2 x double> [ %35, %.preheader ], [ zeroinitializer, %1 ]
  %21 = fadd <2 x double> %kv.05, <double 1.000000e+00, double 1.000000e+00>, !dbg !114
  %22 = fmul <2 x double> %kv.05, %21, !dbg !114
  %23 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %22, !dbg !114
  %24 = fadd <2 x double> %poly.03, %23, !dbg !114
  tail call void @llvm.dbg.value(metadata !{<2 x double> %24}, i64 0, metadata !41), !dbg !114
  %25 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %kv.05, !dbg !117
  %26 = fadd <2 x double> %Harmonic.06, %25, !dbg !117
  tail call void @llvm.dbg.value(metadata !{<2 x double> %26}, i64 0, metadata !39), !dbg !117
  %27 = fmul <2 x double> %kv.05, %kv.05, !dbg !118
  %28 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %27, !dbg !118
  %29 = fadd <2 x double> %zeta.04, %28, !dbg !118
  tail call void @llvm.dbg.value(metadata !{<2 x double> %29}, i64 0, metadata !40), !dbg !118
  %30 = fdiv <2 x double> <double 1.000000e+00, double -1.000000e+00>, %kv.05, !dbg !119
  %31 = fadd <2 x double> %alt.02, %30, !dbg !119
  tail call void @llvm.dbg.value(metadata !{<2 x double> %31}, i64 0, metadata !42), !dbg !119
  %32 = fmul <2 x double> %kv.05, <double 2.000000e+00, double 2.000000e+00>, !dbg !120
  %33 = fadd <2 x double> %32, <double -1.000000e+00, double -1.000000e+00>, !dbg !120
  %34 = fdiv <2 x double> <double 1.000000e+00, double -1.000000e+00>, %33, !dbg !120
  %35 = fadd <2 x double> %Gregory.01, %34, !dbg !120
  tail call void @llvm.dbg.value(metadata !{<2 x double> %35}, i64 0, metadata !43), !dbg !120
  %36 = fadd <2 x double> %kv.05, <double 2.000000e+00, double 2.000000e+00>, !dbg !121
  tail call void @llvm.dbg.value(metadata !{<2 x double> %36}, i64 0, metadata !49), !dbg !121
  %37 = extractelement <2 x double> %36, i32 0, !dbg !121
  %38 = fcmp ugt double %37, 2.500000e+06, !dbg !121
  br i1 %38, label %39, label %.preheader, !dbg !121

; <label>:39                                      ; preds = %.preheader
  %40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %5, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !122
  %41 = extractelement <2 x double> %16, i32 0, !dbg !122
  %42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %41, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0)) #4, !dbg !122
  tail call void @llvm.dbg.value(metadata !{<2 x double> %24}, i64 0, metadata !123), !dbg !125
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !126), !dbg !127
  %43 = extractelement <2 x double> %24, i32 0, !dbg !128
  %44 = extractelement <2 x double> %24, i32 1, !dbg !128
  %45 = fadd double %43, %44, !dbg !128
  %46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %45, i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)) #4, !dbg !124
  %47 = extractelement <2 x double> %16, i32 1, !dbg !124
  %48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %47, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #4, !dbg !124
  %49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %20, i8* getelementptr inbounds ([14 x i8]* @.str5, i64 0, i64 0)) #4, !dbg !129
  tail call void @llvm.dbg.value(metadata !{<2 x double> %26}, i64 0, metadata !130), !dbg !131
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !132), !dbg !133
  %50 = extractelement <2 x double> %26, i32 0, !dbg !134
  %51 = extractelement <2 x double> %26, i32 1, !dbg !134
  %52 = fadd double %50, %51, !dbg !134
  %53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %52, i8* getelementptr inbounds ([9 x i8]* @.str6, i64 0, i64 0)) #4, !dbg !129
  tail call void @llvm.dbg.value(metadata !{<2 x double> %29}, i64 0, metadata !135), !dbg !137
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !138), !dbg !139
  %54 = extractelement <2 x double> %29, i32 0, !dbg !140
  %55 = extractelement <2 x double> %29, i32 1, !dbg !140
  %56 = fadd double %54, %55, !dbg !140
  %57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %56, i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0)) #4, !dbg !136
  tail call void @llvm.dbg.value(metadata !{<2 x double> %31}, i64 0, metadata !135), !dbg !137
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !138), !dbg !139
  %58 = extractelement <2 x double> %31, i32 0, !dbg !140
  %59 = extractelement <2 x double> %31, i32 1, !dbg !140
  %60 = fadd double %58, %59, !dbg !140
  %61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %60, i8* getelementptr inbounds ([21 x i8]* @.str8, i64 0, i64 0)) #4, !dbg !136
  tail call void @llvm.dbg.value(metadata !{<2 x double> %35}, i64 0, metadata !141), !dbg !143
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !144), !dbg !145
  %62 = extractelement <2 x double> %35, i32 0, !dbg !146
  %63 = extractelement <2 x double> %35, i32 1, !dbg !146
  %64 = fadd double %62, %63, !dbg !146
  %65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %64, i8* getelementptr inbounds ([8 x i8]* @.str9, i64 0, i64 0)) #4, !dbg !142
  ret i32 0, !dbg !147
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
!71 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !10, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [a] [line 12]
!72 = metadata !{i32 35, i32 0, metadata !25, null}
!73 = metadata !{i32 12, i32 0, metadata !4, metadata !72}
!74 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554444, metadata !10, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [b] [line 12]
!75 = metadata !{i32 786688, metadata !4, metadata !"tmp", metadata !5, i32 15, metadata !18, i32 0, metadata !72} ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!76 = metadata !{i32 16, i32 0, metadata !4, metadata !72}
!77 = metadata !{<2 x double> <double 0.000000e+00, double undef>}
!78 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 14, metadata !8, i32 0, metadata !72} ; [ DW_TAG_auto_variable ] [v] [line 14]
!79 = metadata !{<2 x double> zeroinitializer}
!80 = metadata !{double 1.000000e+00}
!81 = metadata !{<2 x double> <double 1.000000e+00, double undef>}
!82 = metadata !{<2 x double> <double 1.000000e+00, double 1.000000e+00>}
!83 = metadata !{double 2.000000e+00}
!84 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !10, i32 0, metadata !85} ; [ DW_TAG_arg_variable ] [a] [line 12]
!85 = metadata !{i32 36, i32 0, metadata !25, null}
!86 = metadata !{i32 12, i32 0, metadata !4, metadata !85}
!87 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554444, metadata !10, i32 0, metadata !85} ; [ DW_TAG_arg_variable ] [b] [line 12]
!88 = metadata !{i32 786688, metadata !4, metadata !"tmp", metadata !5, i32 15, metadata !18, i32 0, metadata !85} ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!89 = metadata !{i32 16, i32 0, metadata !4, metadata !85}
!90 = metadata !{<2 x double> <double 2.000000e+00, double undef>}
!91 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 14, metadata !8, i32 0, metadata !85} ; [ DW_TAG_auto_variable ] [v] [line 14]
!92 = metadata !{<2 x double> <double 2.000000e+00, double 2.000000e+00>}
!93 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !10, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [a] [line 12]
!94 = metadata !{i32 37, i32 0, metadata !25, null}
!95 = metadata !{i32 12, i32 0, metadata !4, metadata !94}
!96 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554444, metadata !10, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [b] [line 12]
!97 = metadata !{i32 786688, metadata !4, metadata !"tmp", metadata !5, i32 15, metadata !18, i32 0, metadata !94} ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!98 = metadata !{i32 16, i32 0, metadata !4, metadata !94}
!99 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 14, metadata !8, i32 0, metadata !94} ; [ DW_TAG_auto_variable ] [v] [line 14]
!100 = metadata !{<2 x double> <double 1.000000e+00, double 2.000000e+00>}
!101 = metadata !{double -1.000000e+00}
!102 = metadata !{<2 x double> <double 1.000000e+00, double -1.000000e+00>}
!103 = metadata !{i32 39, i32 0, metadata !25, null}
!104 = metadata !{i32 41, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !25, i32 41, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!106 = metadata !{i32 43, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !105, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!108 = metadata !{i32 44, i32 0, metadata !107, null}
!109 = metadata !{double undef}
!110 = metadata !{i32 45, i32 0, metadata !107, null}
!111 = metadata !{i32 46, i32 0, metadata !107, null}
!112 = metadata !{i32 47, i32 0, metadata !107, null}
!113 = metadata !{i32 48, i32 0, metadata !107, null}
!114 = metadata !{i32 53, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !116, i32 52, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!116 = metadata !{i32 786443, metadata !1, metadata !25, i32 51, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/partialsums.c]
!117 = metadata !{i32 54, i32 0, metadata !115, null}
!118 = metadata !{i32 55, i32 0, metadata !115, null}
!119 = metadata !{i32 56, i32 0, metadata !115, null}
!120 = metadata !{i32 57, i32 0, metadata !115, null}
!121 = metadata !{i32 51, i32 0, metadata !116, null}
!122 = metadata !{i32 61, i32 0, metadata !25, null}
!123 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !5, i32 16777236, metadata !8, i32 0, metadata !124} ; [ DW_TAG_arg_variable ] [x] [line 20]
!124 = metadata !{i32 62, i32 0, metadata !25, null}
!125 = metadata !{i32 20, i32 0, metadata !19, metadata !124}
!126 = metadata !{i32 786688, metadata !19, metadata !"tmp", metadata !5, i32 22, metadata !18, i32 0, metadata !124} ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!127 = metadata !{i32 22, i32 0, metadata !19, metadata !124}
!128 = metadata !{i32 23, i32 0, metadata !19, metadata !124}
!129 = metadata !{i32 63, i32 0, metadata !25, null}
!130 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !5, i32 16777236, metadata !8, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [x] [line 20]
!131 = metadata !{i32 20, i32 0, metadata !19, metadata !129}
!132 = metadata !{i32 786688, metadata !19, metadata !"tmp", metadata !5, i32 22, metadata !18, i32 0, metadata !129} ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!133 = metadata !{i32 22, i32 0, metadata !19, metadata !129}
!134 = metadata !{i32 23, i32 0, metadata !19, metadata !129}
!135 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !5, i32 16777236, metadata !8, i32 0, metadata !136} ; [ DW_TAG_arg_variable ] [x] [line 20]
!136 = metadata !{i32 64, i32 0, metadata !25, null}
!137 = metadata !{i32 20, i32 0, metadata !19, metadata !136}
!138 = metadata !{i32 786688, metadata !19, metadata !"tmp", metadata !5, i32 22, metadata !18, i32 0, metadata !136} ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!139 = metadata !{i32 22, i32 0, metadata !19, metadata !136}
!140 = metadata !{i32 23, i32 0, metadata !19, metadata !136}
!141 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !5, i32 16777236, metadata !8, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [x] [line 20]
!142 = metadata !{i32 65, i32 0, metadata !25, null}
!143 = metadata !{i32 20, i32 0, metadata !19, metadata !142}
!144 = metadata !{i32 786688, metadata !19, metadata !"tmp", metadata !5, i32 22, metadata !18, i32 0, metadata !142} ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!145 = metadata !{i32 22, i32 0, metadata !19, metadata !142}
!146 = metadata !{i32 23, i32 0, metadata !19, metadata !142}
!147 = metadata !{i32 67, i32 0, metadata !25, null}
