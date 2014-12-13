; ModuleID = 'mandel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@accum = common global { double, double } zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind optsize uwtable
define void @emit(double %X.coerce0, double %X.coerce1) #0 {
  tail call void @llvm.dbg.declare(metadata !43, metadata !10), !dbg !44
  %1 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !45
  %2 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !45
  %3 = fadd double %1, %X.coerce0, !dbg !45
  %4 = fadd double %2, %X.coerce1, !dbg !45
  store volatile double %3, double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !45
  store volatile double %4, double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind optsize uwtable
define void @mandel() #0 {
  tail call void @llvm.dbg.value(metadata !47, i64 0, metadata !15), !dbg !48
  br label %.preheader, !dbg !48

.preheader:                                       ; preds = %31, %0
  %x.05 = phi i32 [ 0, %0 ], [ %32, %31 ]
  %1 = sitofp i32 %x.05 to double, !dbg !49
  %2 = fmul double %1, 4.000000e+00, !dbg !49
  %3 = fdiv double %2, 5.000000e+03, !dbg !49
  %4 = fadd double %3, -2.000000e+00, !dbg !49
  br label %5, !dbg !50

; <label>:5                                       ; preds = %25, %.preheader
  %y.04 = phi i32 [ 0, %.preheader ], [ %30, %25 ]
  tail call void @llvm.dbg.declare(metadata !43, metadata !19), !dbg !49
  %6 = sitofp i32 %y.04 to double, !dbg !49
  %7 = fmul double %6, 4.000000e+00, !dbg !49
  %8 = fdiv double %7, 5.000000e+03, !dbg !49
  %9 = fsub double -2.000000e+00, %8, !dbg !49
  %10 = fmul double %9, 0.000000e+00, !dbg !49
  %11 = fadd double %9, 0.000000e+00, !dbg !49
  %12 = fadd double %4, %10, !dbg !49
  tail call void @llvm.dbg.declare(metadata !43, metadata !24), !dbg !51
  tail call void @llvm.dbg.value(metadata !47, i64 0, metadata !18), !dbg !52
  br label %13, !dbg !52

; <label>:13                                      ; preds = %13, %5
  %z.sroa.0.03 = phi double [ 0.000000e+00, %5 ], [ %19, %13 ]
  %z.sroa.6.02 = phi double [ 0.000000e+00, %5 ], [ %20, %13 ]
  %n.01 = phi i32 [ 0, %5 ], [ %23, %13 ]
  %14 = fmul double %z.sroa.0.03, %z.sroa.0.03, !dbg !54
  %15 = fmul double %z.sroa.6.02, %z.sroa.6.02, !dbg !54
  %16 = fsub double %14, %15, !dbg !54
  %17 = fmul double %z.sroa.6.02, %z.sroa.0.03, !dbg !54
  %18 = fadd double %17, %17, !dbg !54
  %19 = fadd double %12, %16, !dbg !54
  %20 = fadd double %11, %18, !dbg !54
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !56) #3, !dbg !59
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !60) #3, !dbg !59
  %21 = tail call double @hypot(double %19, double %20) #4, !dbg !61
  %22 = fcmp ult double %21, 2.000000e+00, !dbg !57
  %23 = add nsw i32 %n.01, 1, !dbg !52
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !18), !dbg !52
  %24 = icmp slt i32 %23, 10, !dbg !52
  %or.cond = and i1 %22, %24, !dbg !57
  br i1 %or.cond, label %13, label %25, !dbg !57

; <label>:25                                      ; preds = %13
  tail call void @llvm.dbg.declare(metadata !43, metadata !10), !dbg !63
  %26 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !65
  %27 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !65
  %28 = fadd double %19, %26, !dbg !65
  %29 = fadd double %20, %27, !dbg !65
  store volatile double %28, double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !65
  store volatile double %29, double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !65
  %30 = add nsw i32 %y.04, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !17), !dbg !50
  %exitcond = icmp eq i32 %30, 5000, !dbg !50
  br i1 %exitcond, label %31, label %5, !dbg !50

; <label>:31                                      ; preds = %25
  %32 = add nsw i32 %x.05, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !15), !dbg !48
  %exitcond7 = icmp eq i32 %32, 5000, !dbg !48
  br i1 %exitcond7, label %33, label %.preheader, !dbg !48

; <label>:33                                      ; preds = %31
  ret void, !dbg !66
}

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @mandel() #5, !dbg !67
  %1 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !68
  %2 = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !68
  %3 = fptosi double %1 to i32, !dbg !68
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %3) #4, !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind optsize
declare double @hypot(double, double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind optsize }
attributes #5 = { optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!40, !41}
!llvm.ident = !{!42}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !37, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c] [DW_LANG_C99]
!1 = metadata !{metadata !"mandel.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !25, metadata !28}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"emit", metadata !"emit", metadata !"", i32 25, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double, double)* @emit, null, null, metadata !9, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [emit]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"complex", i32 0, i64 128, i64 64, i64 0, i32 0, i32 3} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786689, metadata !4, metadata !"X", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X] [line 25]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mandel", metadata !"mandel", metadata !"", i32 29, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @mandel, null, null, metadata !14, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [mandel]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{null}
!14 = metadata !{metadata !15, metadata !17, metadata !18, metadata !19, metadata !24}
!15 = metadata !{i32 786688, metadata !11, metadata !"x", metadata !5, i32 30, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 30]
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786688, metadata !11, metadata !"y", metadata !5, i32 30, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 30]
!18 = metadata !{i32 786688, metadata !11, metadata !"n", metadata !5, i32 30, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 30]
!19 = metadata !{i32 786688, metadata !20, metadata !"c", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 33]
!20 = metadata !{i32 786443, metadata !1, metadata !21, i32 32, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!21 = metadata !{i32 786443, metadata !1, metadata !22, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!22 = metadata !{i32 786443, metadata !1, metadata !23, i32 31, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!23 = metadata !{i32 786443, metadata !1, metadata !11, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!24 = metadata !{i32 786688, metadata !20, metadata !"z", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 34]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 46, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !2, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [main]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !16}
!28 = metadata !{i32 786478, metadata !29, metadata !30, metadata !"__tg_hypot", metadata !"__tg_hypot", metadata !"_ZL10__tg_hypotdd", i32 833, metadata !31, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !34, i32 833} ; [ DW_TAG_subprogram ] [line 833] [local] [def] [__tg_hypot]
!29 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/tgmath.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!30 = metadata !{i32 786473, metadata !29}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/bin/../lib/clang/3.5/include/tgmath.h]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !33, metadata !33, metadata !33}
!33 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!34 = metadata !{metadata !35, metadata !36}
!35 = metadata !{i32 786689, metadata !28, metadata !"__x", metadata !30, i32 16778049, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__x] [line 833]
!36 = metadata !{i32 786689, metadata !28, metadata !"__y", metadata !30, i32 33555265, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__y] [line 833]
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786484, i32 0, null, metadata !"accum", metadata !"accum", metadata !"", metadata !5, i32 24, metadata !39, i32 0, i32 1, { double, double }* @accum, null} ; [ DW_TAG_variable ] [accum] [line 24] [def]
!39 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from complex]
!40 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!41 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!42 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!43 = metadata !{{ double, double }* undef}
!44 = metadata !{i32 25, i32 0, metadata !4, null}
!45 = metadata !{i32 26, i32 0, metadata !4, null}
!46 = metadata !{i32 27, i32 0, metadata !4, null}
!47 = metadata !{i32 0}
!48 = metadata !{i32 31, i32 0, metadata !23, null}
!49 = metadata !{i32 33, i32 0, metadata !20, null}
!50 = metadata !{i32 32, i32 0, metadata !21, null}
!51 = metadata !{i32 34, i32 0, metadata !20, null}
!52 = metadata !{i32 36, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !20, i32 36, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!54 = metadata !{i32 37, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 36, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!56 = metadata !{i32 786689, metadata !28, metadata !"__x", metadata !30, i32 16778049, metadata !33, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [__x] [line 833]
!57 = metadata !{i32 38, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !55, i32 38, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel.c]
!59 = metadata !{i32 833, i32 0, metadata !28, metadata !57}
!60 = metadata !{i32 786689, metadata !28, metadata !"__y", metadata !30, i32 33555265, metadata !33, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [__y] [line 833]
!61 = metadata !{i32 833, i32 0, metadata !62, metadata !57}
!62 = metadata !{i32 786443, metadata !29, metadata !28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/bin/../lib/clang/3.5/include/tgmath.h]
!63 = metadata !{i32 25, i32 0, metadata !4, metadata !64}
!64 = metadata !{i32 41, i32 0, metadata !20, null}
!65 = metadata !{i32 26, i32 0, metadata !4, metadata !64}
!66 = metadata !{i32 44, i32 0, metadata !11, null}
!67 = metadata !{i32 47, i32 0, metadata !25, null}
!68 = metadata !{i32 48, i32 0, metadata !25, null}
!69 = metadata !{i32 49, i32 0, metadata !25, null}
