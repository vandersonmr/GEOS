; ModuleID = 'sieve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.flags = internal global [8193 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"Count: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %NUM = alloca i32, align 4
  %i = alloca i64, align 8
  %k = alloca i64, align 8
  %count = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !20), !dbg !21
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !22), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %NUM}, metadata !23), !dbg !24
  %4 = load i32* %2, align 4, !dbg !24
  %5 = icmp eq i32 %4, 2, !dbg !24
  br i1 %5, label %6, label %11, !dbg !24

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !24
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !24
  %9 = load i8** %8, align 8, !dbg !24
  %10 = call i32 @atoi(i8* %9) #4, !dbg !24
  br label %12, !dbg !24

; <label>:11                                      ; preds = %0
  br label %12, !dbg !24

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 170000, %11 ], !dbg !24
  store i32 %13, i32* %NUM, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !25), !dbg !27
  call void @llvm.dbg.declare(metadata !{i64* %k}, metadata !28), !dbg !27
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !29), !dbg !30
  store i32 0, i32* %count, align 4, !dbg !30
  br label %14, !dbg !31

; <label>:14                                      ; preds = %58, %12
  %15 = load i32* %NUM, align 4, !dbg !31
  %16 = add nsw i32 %15, -1, !dbg !31
  store i32 %16, i32* %NUM, align 4, !dbg !31
  %17 = icmp ne i32 %15, 0, !dbg !31
  br i1 %17, label %18, label %59, !dbg !31

; <label>:18                                      ; preds = %14
  store i32 0, i32* %count, align 4, !dbg !32
  store i64 2, i64* %i, align 8, !dbg !34
  br label %19, !dbg !34

; <label>:19                                      ; preds = %25, %18
  %20 = load i64* %i, align 8, !dbg !34
  %21 = icmp sle i64 %20, 8192, !dbg !34
  br i1 %21, label %22, label %28, !dbg !34

; <label>:22                                      ; preds = %19
  %23 = load i64* %i, align 8, !dbg !36
  %24 = getelementptr inbounds [8193 x i8]* @main.flags, i32 0, i64 %23, !dbg !36
  store i8 1, i8* %24, align 1, !dbg !36
  br label %25, !dbg !38

; <label>:25                                      ; preds = %22
  %26 = load i64* %i, align 8, !dbg !34
  %27 = add nsw i64 %26, 1, !dbg !34
  store i64 %27, i64* %i, align 8, !dbg !34
  br label %19, !dbg !34

; <label>:28                                      ; preds = %19
  store i64 2, i64* %i, align 8, !dbg !39
  br label %29, !dbg !39

; <label>:29                                      ; preds = %55, %28
  %30 = load i64* %i, align 8, !dbg !39
  %31 = icmp sle i64 %30, 8192, !dbg !39
  br i1 %31, label %32, label %58, !dbg !39

; <label>:32                                      ; preds = %29
  %33 = load i64* %i, align 8, !dbg !41
  %34 = getelementptr inbounds [8193 x i8]* @main.flags, i32 0, i64 %33, !dbg !41
  %35 = load i8* %34, align 1, !dbg !41
  %36 = icmp ne i8 %35, 0, !dbg !41
  br i1 %36, label %37, label %54, !dbg !41

; <label>:37                                      ; preds = %32
  %38 = load i64* %i, align 8, !dbg !44
  %39 = load i64* %i, align 8, !dbg !44
  %40 = add nsw i64 %38, %39, !dbg !44
  store i64 %40, i64* %k, align 8, !dbg !44
  br label %41, !dbg !44

; <label>:41                                      ; preds = %47, %37
  %42 = load i64* %k, align 8, !dbg !44
  %43 = icmp sle i64 %42, 8192, !dbg !44
  br i1 %43, label %44, label %51, !dbg !44

; <label>:44                                      ; preds = %41
  %45 = load i64* %k, align 8, !dbg !47
  %46 = getelementptr inbounds [8193 x i8]* @main.flags, i32 0, i64 %45, !dbg !47
  store i8 0, i8* %46, align 1, !dbg !47
  br label %47, !dbg !49

; <label>:47                                      ; preds = %44
  %48 = load i64* %i, align 8, !dbg !44
  %49 = load i64* %k, align 8, !dbg !44
  %50 = add nsw i64 %49, %48, !dbg !44
  store i64 %50, i64* %k, align 8, !dbg !44
  br label %41, !dbg !44

; <label>:51                                      ; preds = %41
  %52 = load i32* %count, align 4, !dbg !50
  %53 = add nsw i32 %52, 1, !dbg !50
  store i32 %53, i32* %count, align 4, !dbg !50
  br label %54, !dbg !51

; <label>:54                                      ; preds = %51, %32
  br label %55, !dbg !52

; <label>:55                                      ; preds = %54
  %56 = load i64* %i, align 8, !dbg !39
  %57 = add nsw i64 %56, 1, !dbg !39
  store i64 %57, i64* %i, align 8, !dbg !39
  br label %29, !dbg !39

; <label>:58                                      ; preds = %29
  br label %14, !dbg !53

; <label>:59                                      ; preds = %14
  %60 = load i32* %count, align 4, !dbg !54
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %60), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sieve.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, metadata !4, metadata !"flags", metadata !"flags", metadata !"", metadata !5, i32 17, metadata !14, i32 1, i32 1, [8193 x i8]* @main.flags, null} ; [ DW_TAG_variable ] [flags] [line 17] [local] [def]
!14 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65544, i64 8, i32 0, i32 0, metadata !11, metadata !15, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65544, align 8, offset 0] [from char]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786465, i64 0, i64 8193}     ; [ DW_TAG_subrange_type ] [0, 8192]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!21 = metadata !{i32 10, i32 0, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554442, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!23 = metadata !{i32 786688, metadata !4, metadata !"NUM", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NUM] [line 16]
!24 = metadata !{i32 16, i32 0, metadata !4, null}
!25 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 18, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 18]
!26 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!27 = metadata !{i32 18, i32 0, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 18, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 18]
!29 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 19]
!30 = metadata !{i32 19, i32 0, metadata !4, null}
!31 = metadata !{i32 21, i32 0, metadata !4, null}
!32 = metadata !{i32 22, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!34 = metadata !{i32 23, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !33, i32 23, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!36 = metadata !{i32 24, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 23, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!38 = metadata !{i32 25, i32 0, metadata !37, null}
!39 = metadata !{i32 26, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !33, i32 26, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!41 = metadata !{i32 27, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!43 = metadata !{i32 786443, metadata !1, metadata !40, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!44 = metadata !{i32 29, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 29, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!46 = metadata !{i32 786443, metadata !1, metadata !42, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!47 = metadata !{i32 30, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !45, i32 29, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/sieve.c]
!49 = metadata !{i32 31, i32 0, metadata !48, null}
!50 = metadata !{i32 32, i32 0, metadata !46, null}
!51 = metadata !{i32 33, i32 0, metadata !46, null}
!52 = metadata !{i32 34, i32 0, metadata !43, null}
!53 = metadata !{i32 35, i32 0, metadata !33, null}
!54 = metadata !{i32 36, i32 0, metadata !4, null}
!55 = metadata !{i32 37, i32 0, metadata !4, null}
