; ModuleID = 'fib2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @fib(i64 %n) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %n, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !{i64* %2}, metadata !19), !dbg !20
  %3 = load i64* %2, align 8, !dbg !21
  %4 = icmp ult i64 %3, 2, !dbg !21
  br i1 %4, label %5, label %6, !dbg !21

; <label>:5                                       ; preds = %0
  store i64 1, i64* %1, !dbg !23
  br label %14, !dbg !23

; <label>:6                                       ; preds = %0
  %7 = load i64* %2, align 8, !dbg !24
  %8 = sub i64 %7, 2, !dbg !24
  %9 = call i64 @fib(i64 %8), !dbg !24
  %10 = load i64* %2, align 8, !dbg !24
  %11 = sub i64 %10, 1, !dbg !24
  %12 = call i64 @fib(i64 %11), !dbg !24
  %13 = add i64 %9, %12, !dbg !24
  store i64 %13, i64* %1, !dbg !24
  br label %14, !dbg !24

; <label>:14                                      ; preds = %6, %5
  %15 = load i64* %1, !dbg !25
  ret i64 %15, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %N = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !26), !dbg !27
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !28), !dbg !27
  call void @llvm.dbg.declare(metadata !{i32* %N}, metadata !29), !dbg !30
  %4 = load i32* %2, align 4, !dbg !30
  %5 = icmp eq i32 %4, 2, !dbg !30
  br i1 %5, label %6, label %11, !dbg !30

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !30
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !30
  %9 = load i8** %8, align 8, !dbg !30
  %10 = call i32 @atoi(i8* %9), !dbg !30
  br label %12, !dbg !30

; <label>:11                                      ; preds = %0
  br label %12, !dbg !30

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 43, %11 ], !dbg !30
  store i32 %13, i32* %N, align 4, !dbg !30
  %14 = load i32* %N, align 4, !dbg !31
  %15 = sext i32 %14 to i64, !dbg !31
  %16 = call i64 @fib(i64 %15), !dbg !31
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i64 %16), !dbg !31
  ret i32 0, !dbg !32
}

declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fib2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fib2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fib", metadata !"fib", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64)* @fib, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [fib]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fib2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 18] [def] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12, metadata !13}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!15 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!19 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 10]
!20 = metadata !{i32 10, i32 0, metadata !4, null}
!21 = metadata !{i32 11, i32 0, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fib2.c]
!23 = metadata !{i32 12, i32 0, metadata !22, null}
!24 = metadata !{i32 14, i32 0, metadata !22, null}
!25 = metadata !{i32 15, i32 0, metadata !4, null}
!26 = metadata !{i32 786689, metadata !9, metadata !"argc", metadata !5, i32 16777234, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!27 = metadata !{i32 18, i32 0, metadata !9, null}
!28 = metadata !{i32 786689, metadata !9, metadata !"argv", metadata !5, i32 33554450, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!29 = metadata !{i32 786688, metadata !9, metadata !"N", metadata !5, i32 24, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 24]
!30 = metadata !{i32 24, i32 0, metadata !9, null}
!31 = metadata !{i32 25, i32 0, metadata !9, null}
!32 = metadata !{i32 26, i32 0, metadata !9, null}
