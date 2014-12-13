; ModuleID = 'dt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c" %i iterations of each test. \00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c" inner loop / array size %i.\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  %dvec1 = alloca double*, align 8
  %dvec2 = alloca double*, align 8
  call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !18), !dbg !38
  call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !19), !dbg !38
  call void @llvm.dbg.declare(metadata !{double** %dvec1}, metadata !20), !dbg !39
  call void @llvm.dbg.declare(metadata !{double** %dvec2}, metadata !23), !dbg !39
  %1 = bitcast double** %dvec1 to i8**, !dbg !40
  %2 = call i32 @posix_memalign(i8** %1, i64 16, i64 16384) #4, !dbg !40
  %3 = bitcast double** %dvec2 to i8**, !dbg !41
  %4 = call i32 @posix_memalign(i8** %3, i64 16, i64 16384) #4, !dbg !41
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i64 0, i64 0), i32 131072) #4, !dbg !42
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 2048) #4, !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !24), !dbg !45
  br label %7, !dbg !45

; <label>:7                                       ; preds = %7, %0
  %i.01 = phi i64 [ 0, %0 ], [ %22, %7 ]
  %8 = sub nsw i64 2048, %i.01, !dbg !47
  %9 = sitofp i64 %8 to float, !dbg !47
  %10 = call float @cosf(float %9) #4, !dbg !47
  %11 = fpext float %10 to double, !dbg !47
  %12 = fmul double %11, 0x3FF000001AD7F29B, !dbg !47
  call void @llvm.dbg.value(metadata !{double** %dvec1}, i64 0, metadata !20), !dbg !47
  %13 = load double** %dvec1, align 8, !dbg !47, !tbaa !49
  %14 = getelementptr inbounds double* %13, i64 %i.01, !dbg !47
  store double %12, double* %14, align 8, !dbg !47, !tbaa !53
  %15 = sitofp i64 %i.01 to float, !dbg !55
  %16 = call float @sinf(float %15) #4, !dbg !55
  %17 = fpext float %16 to double, !dbg !55
  %18 = fmul double %17, 1.000000e-10, !dbg !55
  %19 = fadd double %18, 1.000000e+00, !dbg !55
  call void @llvm.dbg.value(metadata !{double** %dvec2}, i64 0, metadata !23), !dbg !55
  %20 = load double** %dvec2, align 8, !dbg !55, !tbaa !49
  %21 = getelementptr inbounds double* %20, i64 %i.01, !dbg !55
  store double %19, double* %21, align 8, !dbg !55, !tbaa !53
  %22 = add nsw i64 %i.01, 1, !dbg !45
  call void @llvm.dbg.value(metadata !{i64 %22}, i64 0, metadata !24), !dbg !45
  %exitcond = icmp eq i64 %22, 2048, !dbg !45
  br i1 %exitcond, label %23, label %7, !dbg !45

; <label>:23                                      ; preds = %7
  call void @llvm.dbg.value(metadata !{double** %dvec1}, i64 0, metadata !20), !dbg !56
  %24 = load double** %dvec1, align 8, !dbg !56, !tbaa !49
  call void @llvm.dbg.value(metadata !{double** %dvec2}, i64 0, metadata !23), !dbg !56
  %25 = load double** %dvec2, align 8, !dbg !56, !tbaa !49
  call fastcc void @double_array_divs_variable(double* %24, double* %25), !dbg !56
  call void @llvm.dbg.value(metadata !{double** %dvec1}, i64 0, metadata !20), !dbg !57
  %26 = load double** %dvec1, align 8, !dbg !57, !tbaa !49
  %27 = load double* %26, align 8, !dbg !57, !tbaa !53
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), double %27) #4, !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare float @cosf(float) #2

; Function Attrs: nounwind
declare float @sinf(float) #2

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @double_array_divs_variable(double* noalias nocapture %dvec1, double* noalias nocapture readonly %dvec2) #3 {
  tail call void @llvm.dbg.value(metadata !{double* %dvec1}, i64 0, metadata !31), !dbg !59
  tail call void @llvm.dbg.value(metadata !{double* %dvec2}, i64 0, metadata !32), !dbg !60
  tail call void @llvm.dbg.value(metadata !44, i64 0, metadata !34), !dbg !61
  br label %.preheader, !dbg !61

.preheader:                                       ; preds = %8, %0
  %j.02 = phi i64 [ 0, %0 ], [ %9, %8 ]
  br label %1, !dbg !63

; <label>:1                                       ; preds = %1, %.preheader
  %i.01 = phi i64 [ 0, %.preheader ], [ %7, %1 ]
  %2 = getelementptr inbounds double* %dvec2, i64 %i.01, !dbg !65
  %3 = load double* %2, align 8, !dbg !65, !tbaa !53
  %4 = getelementptr inbounds double* %dvec1, i64 %i.01, !dbg !65
  %5 = load double* %4, align 8, !dbg !65, !tbaa !53
  %6 = fdiv double %5, %3, !dbg !65
  store double %6, double* %4, align 8, !dbg !65, !tbaa !53
  %7 = add nsw i64 %i.01, 1, !dbg !63
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !33), !dbg !63
  %exitcond = icmp eq i64 %7, 2048, !dbg !63
  br i1 %exitcond, label %8, label %1, !dbg !63

; <label>:8                                       ; preds = %1
  %9 = add nsw i64 %j.02, 1, !dbg !61
  tail call void @llvm.dbg.value(metadata !{i64 %9}, i64 0, metadata !34), !dbg !61
  %exitcond3 = icmp eq i64 %9, 131072, !dbg !61
  br i1 %exitcond3, label %10, label %.preheader, !dbg !61

; <label>:10                                      ; preds = %8
  ret void, !dbg !66
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!35, !36}
!llvm.ident = !{!37}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c] [DW_LANG_C99]
!1 = metadata !{metadata !"dt.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 5, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 5, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"ITERATIONS", i64 131072} ; [ DW_TAG_enumerator ] [ITERATIONS :: 131072]
!6 = metadata !{i32 786472, metadata !"size", i64 2048} ; [ DW_TAG_enumerator ] [size :: 2048]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !26}
!9 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"main", metadata !"main", metadata !"", i32 30, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !17, i32 30} ; [ DW_TAG_subprogram ] [line 30] [def] [main]
!10 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13, metadata !13, metadata !14}
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{metadata !18, metadata !19, metadata !20, metadata !23, metadata !24}
!18 = metadata !{i32 786689, metadata !9, metadata !"argc", metadata !10, i32 16777246, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 30]
!19 = metadata !{i32 786689, metadata !9, metadata !"argv", metadata !10, i32 33554462, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 30]
!20 = metadata !{i32 786688, metadata !9, metadata !"dvec1", metadata !10, i32 31, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dvec1] [line 31]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!22 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!23 = metadata !{i32 786688, metadata !9, metadata !"dvec2", metadata !10, i32 31, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dvec2] [line 31]
!24 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !10, i32 32, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 32]
!25 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!26 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"double_array_divs_variable", metadata !"double_array_divs_variable", metadata !"", i32 11, metadata !27, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double*, double*)* @double_array_divs_variable, null, null, metadata !30, i32 12} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [double_array_divs_variable]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{null, metadata !29, metadata !29}
!29 = metadata !{i32 786487, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !31, metadata !32, metadata !33, metadata !34}
!31 = metadata !{i32 786689, metadata !26, metadata !"dvec1", metadata !10, i32 16777227, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dvec1] [line 11]
!32 = metadata !{i32 786689, metadata !26, metadata !"dvec2", metadata !10, i32 33554444, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dvec2] [line 12]
!33 = metadata !{i32 786688, metadata !26, metadata !"i", metadata !10, i32 13, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!34 = metadata !{i32 786688, metadata !26, metadata !"j", metadata !10, i32 13, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!35 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!36 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!37 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!38 = metadata !{i32 30, i32 0, metadata !9, null}
!39 = metadata !{i32 31, i32 0, metadata !9, null}
!40 = metadata !{i32 34, i32 0, metadata !9, null}
!41 = metadata !{i32 35, i32 0, metadata !9, null}
!42 = metadata !{i32 37, i32 0, metadata !9, null}
!43 = metadata !{i32 38, i32 0, metadata !9, null}
!44 = metadata !{i64 0}
!45 = metadata !{i32 42, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !9, i32 42, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!47 = metadata !{i32 43, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !46, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!49 = metadata !{metadata !50, metadata !50, i64 0}
!50 = metadata !{metadata !"any pointer", metadata !51, i64 0}
!51 = metadata !{metadata !"omnipotent char", metadata !52, i64 0}
!52 = metadata !{metadata !"Simple C/C++ TBAA"}
!53 = metadata !{metadata !54, metadata !54, i64 0}
!54 = metadata !{metadata !"double", metadata !51, i64 0}
!55 = metadata !{i32 44, i32 0, metadata !48, null}
!56 = metadata !{i32 47, i32 0, metadata !9, null}
!57 = metadata !{i32 48, i32 0, metadata !9, null}
!58 = metadata !{i32 49, i32 0, metadata !9, null}
!59 = metadata !{i32 11, i32 0, metadata !26, null}
!60 = metadata !{i32 12, i32 0, metadata !26, null}
!61 = metadata !{i32 14, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !26, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!63 = metadata !{i32 15, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 15, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!65 = metadata !{i32 16, i32 0, metadata !64, null}
!66 = metadata !{i32 28, i32 0, metadata !26, null}
