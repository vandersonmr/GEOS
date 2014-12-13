; ModuleID = 'random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1
@gen_random.last = internal global i64 42, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %N = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !22), !dbg !23
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !24), !dbg !23
  call void @llvm.dbg.declare(metadata !{i32* %N}, metadata !25), !dbg !26
  %4 = load i32* %2, align 4, !dbg !26
  %5 = icmp eq i32 %4, 2, !dbg !26
  br i1 %5, label %6, label %11, !dbg !26

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !26
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !26
  %9 = load i8** %8, align 8, !dbg !26
  %10 = call i32 @atoi(i8* %9) #4, !dbg !26
  br label %12, !dbg !26

; <label>:11                                      ; preds = %0
  br label %12, !dbg !26

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 400000000, %11 ], !dbg !26
  %14 = sub nsw i32 %13, 1, !dbg !26
  store i32 %14, i32* %N, align 4, !dbg !26
  br label %15, !dbg !27

; <label>:15                                      ; preds = %19, %12
  %16 = load i32* %N, align 4, !dbg !27
  %17 = add nsw i32 %16, -1, !dbg !27
  store i32 %17, i32* %N, align 4, !dbg !27
  %18 = icmp ne i32 %16, 0, !dbg !27
  br i1 %18, label %19, label %21, !dbg !27

; <label>:19                                      ; preds = %15
  %20 = call double @gen_random(double 1.000000e+02), !dbg !28
  br label %15, !dbg !30

; <label>:21                                      ; preds = %15
  %22 = call double @gen_random(double 1.000000e+02), !dbg !31
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %22), !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind uwtable
define internal double @gen_random(double %max) #0 {
  %1 = alloca double, align 8
  store double %max, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !33), !dbg !34
  %2 = load i64* @gen_random.last, align 8, !dbg !35
  %3 = mul nsw i64 %2, 3877, !dbg !35
  %4 = add nsw i64 %3, 29573, !dbg !35
  %5 = srem i64 %4, 139968, !dbg !35
  store i64 %5, i64* @gen_random.last, align 8, !dbg !35
  %6 = load double* %1, align 8, !dbg !36
  %7 = load i64* @gen_random.last, align 8, !dbg !36
  %8 = sitofp i64 %7 to double, !dbg !36
  %9 = fmul double %6, %8, !dbg !36
  %10 = fdiv double %9, 1.399680e+05, !dbg !36
  ret double %10, !dbg !36
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c] [DW_LANG_C99]
!1 = metadata !{metadata !"random.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_random", metadata !"gen_random", metadata !"", i32 16, metadata !13, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @gen_random, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 16] [local] [def] [gen_random]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, metadata !12, metadata !"last", metadata !"last", metadata !"", metadata !5, i32 17, metadata !18, i32 1, i32 1, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!18 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!22 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 23]
!23 = metadata !{i32 23, i32 0, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554455, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 23]
!25 = metadata !{i32 786688, metadata !4, metadata !"N", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 29]
!26 = metadata !{i32 29, i32 0, metadata !4, null}
!27 = metadata !{i32 31, i32 0, metadata !4, null}
!28 = metadata !{i32 32, i32 0, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c]
!30 = metadata !{i32 33, i32 0, metadata !29, null}
!31 = metadata !{i32 34, i32 0, metadata !4, null}
!32 = metadata !{i32 35, i32 0, metadata !4, null}
!33 = metadata !{i32 786689, metadata !12, metadata !"max", metadata !5, i32 16777232, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 16]
!34 = metadata !{i32 16, i32 0, metadata !12, null}
!35 = metadata !{i32 19, i32 0, metadata !12, null}
!36 = metadata !{i32 20, i32 0, metadata !12, null}
