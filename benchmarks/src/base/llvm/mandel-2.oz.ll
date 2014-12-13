; ModuleID = 'mandel-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@max_i = global i32 65536, align 4
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1

; Function Attrs: minsize nounwind optsize readnone uwtable
define double @sqr(double %x) #0 {
  tail call void @llvm.dbg.value(metadata !{double %x}, i64 0, metadata !10), !dbg !36
  %1 = fmul double %x, %x, !dbg !36
  ret double %1, !dbg !36
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize nounwind optsize readnone uwtable
define double @cnorm2(double %z.coerce0, double %z.coerce1) #0 {
  tail call void @llvm.dbg.declare(metadata !37, metadata !16), !dbg !38
  tail call void @llvm.dbg.value(metadata !{double %z.coerce0}, i64 0, metadata !39), !dbg !40
  %1 = fmul double %z.coerce0, %z.coerce0, !dbg !40
  tail call void @llvm.dbg.value(metadata !{double %z.coerce1}, i64 0, metadata !39), !dbg !40
  %2 = fmul double %z.coerce1, %z.coerce1, !dbg !40
  %3 = fadd double %1, %2, !dbg !38
  ret double %3, !dbg !38
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define i32 @loop(double %c.coerce0, double %c.coerce1) #2 {
  tail call void @llvm.dbg.declare(metadata !37, metadata !22), !dbg !41
  tail call void @llvm.dbg.declare(metadata !37, metadata !23), !dbg !42
  tail call void @llvm.dbg.value(metadata !43, i64 0, metadata !24), !dbg !44
  tail call void @llvm.dbg.declare(metadata !37, metadata !16), !dbg !45
  tail call void @llvm.dbg.value(metadata !{double %c.coerce0}, i64 0, metadata !47), !dbg !48
  %1 = fmul double %c.coerce0, %c.coerce0, !dbg !48
  tail call void @llvm.dbg.value(metadata !{double %c.coerce1}, i64 0, metadata !47), !dbg !48
  %2 = fmul double %c.coerce1, %c.coerce1, !dbg !48
  %3 = fadd double %1, %2, !dbg !45
  %4 = fcmp ugt double %3, 4.000000e+00, !dbg !46
  br i1 %4, label %.critedge, label %.lr.ph, !dbg !46

.lr.ph:                                           ; preds = %0
  %5 = load i32* @max_i, align 4, !dbg !46, !tbaa !49
  br label %6, !dbg !46

; <label>:6                                       ; preds = %.lr.ph, %11
  %7 = phi double [ %2, %.lr.ph ], [ %18, %11 ]
  %8 = phi double [ %1, %.lr.ph ], [ %17, %11 ]
  %z.sroa.5.03 = phi double [ %c.coerce1, %.lr.ph ], [ %16, %11 ]
  %z.sroa.0.02 = phi double [ %c.coerce0, %.lr.ph ], [ %15, %11 ]
  %i.01 = phi i32 [ 1, %.lr.ph ], [ %9, %11 ]
  %9 = add nsw i32 %i.01, 1, !dbg !46
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !24), !dbg !46
  %10 = icmp slt i32 %i.01, %5, !dbg !46
  br i1 %10, label %11, label %.critedge

; <label>:11                                      ; preds = %6
  %12 = fsub double %8, %7, !dbg !53
  %13 = fmul double %z.sroa.0.02, %z.sroa.5.03, !dbg !53
  %14 = fadd double %13, %13, !dbg !53
  %15 = fadd double %12, %c.coerce0, !dbg !53
  %16 = fadd double %14, %c.coerce1, !dbg !53
  tail call void @llvm.dbg.declare(metadata !37, metadata !16), !dbg !45
  tail call void @llvm.dbg.value(metadata !{double %z.sroa.0.02}, i64 0, metadata !47), !dbg !48
  %17 = fmul double %15, %15, !dbg !48
  tail call void @llvm.dbg.value(metadata !{double %z.sroa.5.03}, i64 0, metadata !47), !dbg !48
  %18 = fmul double %16, %16, !dbg !48
  %19 = fadd double %17, %18, !dbg !45
  %20 = fcmp ugt double %19, 4.000000e+00, !dbg !46
  br i1 %20, label %.critedge, label %6, !dbg !46

.critedge:                                        ; preds = %6, %11, %0
  %i.1 = phi i32 [ 1, %0 ], [ %9, %11 ], [ %9, %6 ]
  ret i32 %i.1, !dbg !54
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #3 {
  tail call void @llvm.dbg.value(metadata !55, i64 0, metadata !30), !dbg !56
  br label %.preheader, !dbg !56

.preheader:                                       ; preds = %16, %0
  %j.02 = phi i32 [ -39, %0 ], [ %17, %16 ]
  %1 = sitofp i32 %j.02 to double, !dbg !58
  %2 = fdiv double %1, 4.000000e+01, !dbg !58
  %3 = fadd double %2, -5.000000e-01, !dbg !58
  br label %4, !dbg !61

; <label>:4                                       ; preds = %4, %.preheader
  %i.01 = phi i32 [ -39, %.preheader ], [ %15, %4 ]
  %5 = sitofp i32 %i.01 to double, !dbg !58
  %6 = fdiv double %5, 4.000000e+01, !dbg !58
  %7 = fmul double %6, 0.000000e+00, !dbg !58
  %8 = fadd double %6, 0.000000e+00, !dbg !58
  %9 = fadd double %3, %7, !dbg !58
  %10 = tail call i32 @loop(double %9, double %8) #6, !dbg !58
  %11 = load i32* @max_i, align 4, !dbg !58, !tbaa !49
  %12 = icmp sgt i32 %10, %11, !dbg !58
  %13 = select i1 %12, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0), !dbg !58
  %14 = tail call i32 (i8*, ...)* @printf(i8* %13) #7, !dbg !58
  %15 = add nsw i32 %i.01, 1, !dbg !61
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !29), !dbg !61
  %exitcond = icmp eq i32 %15, 39, !dbg !61
  br i1 %exitcond, label %16, label %4, !dbg !61

; <label>:16                                      ; preds = %4
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !62
  %17 = add nsw i32 %j.02, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !30), !dbg !56
  %exitcond3 = icmp eq i32 %17, 39, !dbg !56
  br i1 %exitcond3, label %18, label %.preheader, !dbg !56

; <label>:18                                      ; preds = %16
  ret i32 0, !dbg !63
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

attributes #0 = { minsize nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { minsize optsize }
attributes #7 = { minsize nounwind optsize }

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
!39 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777223, metadata !8, i32 0, metadata !38} ; [ DW_TAG_arg_variable ] [x] [line 7]
!40 = metadata !{i32 7, i32 0, metadata !4, metadata !38}
!41 = metadata !{i32 11, i32 0, metadata !17, null}
!42 = metadata !{i32 12, i32 0, metadata !17, null}
!43 = metadata !{i32 1}
!44 = metadata !{i32 13, i32 0, metadata !17, null}
!45 = metadata !{i32 9, i32 0, metadata !11, metadata !46}
!46 = metadata !{i32 14, i32 0, metadata !17, null}
!47 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777223, metadata !8, i32 0, metadata !45} ; [ DW_TAG_arg_variable ] [x] [line 7]
!48 = metadata !{i32 7, i32 0, metadata !4, metadata !45}
!49 = metadata !{metadata !50, metadata !50, i64 0}
!50 = metadata !{metadata !"int", metadata !51, i64 0}
!51 = metadata !{metadata !"omnipotent char", metadata !52, i64 0}
!52 = metadata !{metadata !"Simple C/C++ TBAA"}
!53 = metadata !{i32 15, i32 0, metadata !17, null}
!54 = metadata !{i32 16, i32 0, metadata !17, null}
!55 = metadata !{i32 -39}
!56 = metadata !{i32 21, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !25, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!58 = metadata !{i32 23, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 22, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!60 = metadata !{i32 786443, metadata !1, metadata !57, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/mandel-2.c]
!61 = metadata !{i32 22, i32 0, metadata !59, null}
!62 = metadata !{i32 24, i32 0, metadata !60, null}
!63 = metadata !{i32 26, i32 0, metadata !25, null}
