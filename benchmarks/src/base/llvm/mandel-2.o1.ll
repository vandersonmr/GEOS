; ModuleID = 'mandel-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@max_i = global i32 65536, align 4
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @sqr(double %x) #0 {
  tail call void @llvm.dbg.value(metadata !{double %x}, i64 0, metadata !10), !dbg !36
  %1 = fmul double %x, %x, !dbg !36
  ret double %1, !dbg !36
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readnone uwtable
define double @cnorm2(double %z.coerce0, double %z.coerce1) #0 {
  tail call void @llvm.dbg.declare(metadata !37, metadata !16), !dbg !38
  %1 = tail call double @sqr(double %z.coerce0), !dbg !38
  %2 = tail call double @sqr(double %z.coerce1), !dbg !38
  %3 = fadd double %1, %2, !dbg !38
  ret double %3, !dbg !38
}

; Function Attrs: nounwind readonly uwtable
define i32 @loop(double %c.coerce0, double %c.coerce1) #2 {
  tail call void @llvm.dbg.declare(metadata !37, metadata !22), !dbg !39
  tail call void @llvm.dbg.declare(metadata !37, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !41, i64 0, metadata !24), !dbg !42
  %1 = tail call double @cnorm2(double %c.coerce0, double %c.coerce1), !dbg !43
  %2 = fcmp ugt double %1, 4.000000e+00, !dbg !43
  br i1 %2, label %.critedge, label %.lr.ph, !dbg !43

.lr.ph:                                           ; preds = %0
  %3 = load i32* @max_i, align 4, !dbg !43, !tbaa !44
  br label %4, !dbg !43

; <label>:4                                       ; preds = %.lr.ph, %7
  %z.sroa.5.03 = phi double [ %c.coerce1, %.lr.ph ], [ %14, %7 ]
  %z.sroa.0.02 = phi double [ %c.coerce0, %.lr.ph ], [ %13, %7 ]
  %i.01 = phi i32 [ 1, %.lr.ph ], [ %5, %7 ]
  %5 = add nsw i32 %i.01, 1, !dbg !43
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !24), !dbg !43
  %6 = icmp slt i32 %i.01, %3, !dbg !43
  br i1 %6, label %7, label %.critedge

; <label>:7                                       ; preds = %4
  %8 = fmul double %z.sroa.0.02, %z.sroa.0.02, !dbg !48
  %9 = fmul double %z.sroa.5.03, %z.sroa.5.03, !dbg !48
  %10 = fsub double %8, %9, !dbg !48
  %11 = fmul double %z.sroa.0.02, %z.sroa.5.03, !dbg !48
  %12 = fadd double %11, %11, !dbg !48
  %13 = fadd double %10, %c.coerce0, !dbg !48
  %14 = fadd double %12, %c.coerce1, !dbg !48
  %15 = tail call double @cnorm2(double %13, double %14), !dbg !43
  %16 = fcmp ugt double %15, 4.000000e+00, !dbg !43
  br i1 %16, label %.critedge, label %4, !dbg !43

.critedge:                                        ; preds = %4, %7, %0
  %i.1 = phi i32 [ 1, %0 ], [ %5, %7 ], [ %5, %4 ]
  ret i32 %i.1, !dbg !49
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 {
  tail call void @llvm.dbg.value(metadata !50, i64 0, metadata !30), !dbg !51
  br label %.preheader, !dbg !51

.preheader:                                       ; preds = %16, %0
  %j.02 = phi i32 [ -39, %0 ], [ %17, %16 ]
  %1 = sitofp i32 %j.02 to double, !dbg !53
  %2 = fdiv double %1, 4.000000e+01, !dbg !53
  %3 = fadd double %2, -5.000000e-01, !dbg !53
  br label %4, !dbg !56

; <label>:4                                       ; preds = %4, %.preheader
  %i.01 = phi i32 [ -39, %.preheader ], [ %15, %4 ]
  %5 = sitofp i32 %i.01 to double, !dbg !53
  %6 = fdiv double %5, 4.000000e+01, !dbg !53
  %7 = fmul double %6, 0.000000e+00, !dbg !53
  %8 = fadd double %6, 0.000000e+00, !dbg !53
  %9 = fadd double %3, %7, !dbg !53
  %10 = tail call i32 @loop(double %9, double %8), !dbg !53
  %11 = load i32* @max_i, align 4, !dbg !53, !tbaa !44
  %12 = icmp sgt i32 %10, %11, !dbg !53
  %13 = select i1 %12, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0), !dbg !53
  %14 = tail call i32 (i8*, ...)* @printf(i8* %13) #5, !dbg !53
  %15 = add nsw i32 %i.01, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !29), !dbg !56
  %exitcond = icmp eq i32 %15, 39, !dbg !56
  br i1 %exitcond, label %16, label %4, !dbg !56

; <label>:16                                      ; preds = %4
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !57
  %17 = add nsw i32 %j.02, 1, !dbg !51
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !30), !dbg !51
  %exitcond3 = icmp eq i32 %17, 39, !dbg !51
  br i1 %exitcond3, label %18, label %.preheader, !dbg !51

; <label>:18                                      ; preds = %16
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !31, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"mandel-2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !17, metadata !25}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sqr", metadata !"sqr", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @sqr, null, null, metadata !9, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [sqr]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 7]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cnorm2", metadata !"cnorm2", metadata !"", i32 9, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double, double)* @cnorm2, null, null, metadata !15, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [cnorm2]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !8, metadata !14}
!14 = metadata !{i32 786468, null, null, metadata !"complex", i32 0, i64 128, i64 64, i64 0, i32 0, i32 3} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786689, metadata !11, metadata !"z", metadata !5, i32 16777225, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 9]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"loop", metadata !"loop", metadata !"", i32 11, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (double, double)* @loop, null, null, metadata !21, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [loop]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !14}
!20 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{metadata !22, metadata !23, metadata !24}
!22 = metadata !{i32 786689, metadata !17, metadata !"c", metadata !5, i32 16777227, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 11]
!23 = metadata !{i32 786688, metadata !17, metadata !"z", metadata !5, i32 12, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 12]
!24 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 13, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !28, i32 19} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !20}
!28 = metadata !{metadata !29, metadata !30}
!29 = metadata !{i32 786688, metadata !25, metadata !"i", metadata !5, i32 20, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 20]
!30 = metadata !{i32 786688, metadata !25, metadata !"j", metadata !5, i32 20, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 20]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786484, i32 0, null, metadata !"max_i", metadata !"max_i", metadata !"", metadata !5, i32 5, metadata !20, i32 0, i32 1, i32* @max_i, null} ; [ DW_TAG_variable ] [max_i] [line 5] [def]
!33 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!34 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!35 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!36 = metadata !{i32 7, i32 0, metadata !4, null}
!37 = metadata !{{ double, double }* undef}
!38 = metadata !{i32 9, i32 0, metadata !11, null}
!39 = metadata !{i32 11, i32 0, metadata !17, null}
!40 = metadata !{i32 12, i32 0, metadata !17, null}
!41 = metadata !{i32 1}
!42 = metadata !{i32 13, i32 0, metadata !17, null}
!43 = metadata !{i32 14, i32 0, metadata !17, null}
!44 = metadata !{metadata !45, metadata !45, i64 0}
!45 = metadata !{metadata !"int", metadata !46, i64 0}
!46 = metadata !{metadata !"omnipotent char", metadata !47, i64 0}
!47 = metadata !{metadata !"Simple C/C++ TBAA"}
!48 = metadata !{i32 15, i32 0, metadata !17, null}
!49 = metadata !{i32 16, i32 0, metadata !17, null}
!50 = metadata !{i32 -39}
!51 = metadata !{i32 21, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !25, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!53 = metadata !{i32 23, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 22, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!55 = metadata !{i32 786443, metadata !1, metadata !52, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!56 = metadata !{i32 22, i32 0, metadata !54, null}
!57 = metadata !{i32 24, i32 0, metadata !55, null}
!58 = metadata !{i32 26, i32 0, metadata !25, null}
