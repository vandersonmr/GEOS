; ModuleID = 'ackermann.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @Ack(i32 %M, i32 %N) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %M, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !18), !dbg !19
  store i32 %N, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !20), !dbg !19
  %4 = load i32* %2, align 4, !dbg !21
  %5 = icmp eq i32 %4, 0, !dbg !21
  br i1 %5, label %6, label %9, !dbg !21

; <label>:6                                       ; preds = %0
  %7 = load i32* %3, align 4, !dbg !21
  %8 = add nsw i32 %7, 1, !dbg !21
  store i32 %8, i32* %1, !dbg !21
  br label %24, !dbg !21

; <label>:9                                       ; preds = %0
  %10 = load i32* %3, align 4, !dbg !23
  %11 = icmp eq i32 %10, 0, !dbg !23
  br i1 %11, label %12, label %16, !dbg !23

; <label>:12                                      ; preds = %9
  %13 = load i32* %2, align 4, !dbg !23
  %14 = sub nsw i32 %13, 1, !dbg !23
  %15 = call i32 @Ack(i32 %14, i32 1), !dbg !23
  store i32 %15, i32* %1, !dbg !23
  br label %24, !dbg !23

; <label>:16                                      ; preds = %9
  %17 = load i32* %2, align 4, !dbg !25
  %18 = sub nsw i32 %17, 1, !dbg !25
  %19 = load i32* %2, align 4, !dbg !25
  %20 = load i32* %3, align 4, !dbg !25
  %21 = sub nsw i32 %20, 1, !dbg !25
  %22 = call i32 @Ack(i32 %19, i32 %21), !dbg !25
  %23 = call i32 @Ack(i32 %18, i32 %22), !dbg !25
  store i32 %23, i32* %1, !dbg !25
  br label %24, !dbg !25

; <label>:24                                      ; preds = %16, %12, %6
  %25 = load i32* %1, !dbg !26
  ret i32 %25, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !27), !dbg !28
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !29), !dbg !28
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !30), !dbg !31
  %4 = load i32* %2, align 4, !dbg !31
  %5 = icmp eq i32 %4, 2, !dbg !31
  br i1 %5, label %6, label %11, !dbg !31

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !31
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !31
  %9 = load i8** %8, align 8, !dbg !31
  %10 = call i32 @atoi(i8* %9) #4, !dbg !31
  br label %12, !dbg !31

; <label>:11                                      ; preds = %0
  br label %12, !dbg !31

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 8, %11 ], !dbg !31
  store i32 %13, i32* %n, align 4, !dbg !31
  %14 = load i32* %n, align 4, !dbg !32
  %15 = load i32* %n, align 4, !dbg !32
  %16 = call i32 @Ack(i32 3, i32 %15), !dbg !32
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %14, i32 %16), !dbg !32
  ret i32 0, !dbg !33
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ackermann.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Ack", metadata !"Ack", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @Ack, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [Ack]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 17} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !12}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"M", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 10]
!19 = metadata !{i32 10, i32 0, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 10]
!21 = metadata !{i32 11, i32 0, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!23 = metadata !{i32 12, i32 0, metadata !24, null}
!24 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!25 = metadata !{i32 13, i32 0, metadata !4, null}
!26 = metadata !{i32 14, i32 0, metadata !4, null}
!27 = metadata !{i32 786689, metadata !9, metadata !"argc", metadata !5, i32 16777233, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!28 = metadata !{i32 17, i32 0, metadata !9, null}
!29 = metadata !{i32 786689, metadata !9, metadata !"argv", metadata !5, i32 33554449, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!30 = metadata !{i32 786688, metadata !9, metadata !"n", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 18]
!31 = metadata !{i32 18, i32 0, metadata !9, null}
!32 = metadata !{i32 20, i32 0, metadata !9, null}
!33 = metadata !{i32 21, i32 0, metadata !9, null}
