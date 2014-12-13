; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !15), !dbg !16
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !17), !dbg !16
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !18), !dbg !19
  %4 = load i32* %2, align 4, !dbg !19
  %5 = icmp eq i32 %4, 2, !dbg !19
  br i1 %5, label %6, label %11, !dbg !19

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !19
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !19
  %9 = load i8** %8, align 8, !dbg !19
  %10 = call i32 @atoi(i8* %9) #5, !dbg !19
  br label %12, !dbg !19

; <label>:11                                      ; preds = %0
  br label %12, !dbg !19

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 1500000, %11 ], !dbg !19
  store i32 %13, i32* %n, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !20), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !22), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32** %x}, metadata !23), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32** %y}, metadata !25), !dbg !21
  %14 = load i32* %n, align 4, !dbg !26
  %15 = sext i32 %14 to i64, !dbg !26
  %16 = call noalias i8* @calloc(i64 %15, i64 4) #6, !dbg !26
  %17 = bitcast i8* %16 to i32*, !dbg !26
  store i32* %17, i32** %x, align 8, !dbg !26
  %18 = load i32* %n, align 4, !dbg !27
  %19 = sext i32 %18 to i64, !dbg !27
  %20 = call noalias i8* @calloc(i64 %19, i64 4) #6, !dbg !27
  %21 = bitcast i8* %20 to i32*, !dbg !27
  store i32* %21, i32** %y, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !28
  br label %22, !dbg !28

; <label>:22                                      ; preds = %33, %12
  %23 = load i32* %i, align 4, !dbg !28
  %24 = load i32* %n, align 4, !dbg !28
  %25 = icmp slt i32 %23, %24, !dbg !28
  br i1 %25, label %26, label %36, !dbg !28

; <label>:26                                      ; preds = %22
  %27 = load i32* %i, align 4, !dbg !30
  %28 = add nsw i32 %27, 1, !dbg !30
  %29 = load i32* %i, align 4, !dbg !30
  %30 = sext i32 %29 to i64, !dbg !30
  %31 = load i32** %x, align 8, !dbg !30
  %32 = getelementptr inbounds i32* %31, i64 %30, !dbg !30
  store i32 %28, i32* %32, align 4, !dbg !30
  br label %33, !dbg !32

; <label>:33                                      ; preds = %26
  %34 = load i32* %i, align 4, !dbg !28
  %35 = add nsw i32 %34, 1, !dbg !28
  store i32 %35, i32* %i, align 4, !dbg !28
  br label %22, !dbg !28

; <label>:36                                      ; preds = %22
  store i32 0, i32* %k, align 4, !dbg !33
  br label %37, !dbg !33

; <label>:37                                      ; preds = %62, %36
  %38 = load i32* %k, align 4, !dbg !33
  %39 = icmp slt i32 %38, 1000, !dbg !33
  br i1 %39, label %40, label %65, !dbg !33

; <label>:40                                      ; preds = %37
  %41 = load i32* %n, align 4, !dbg !35
  %42 = sub nsw i32 %41, 1, !dbg !35
  store i32 %42, i32* %i, align 4, !dbg !35
  br label %43, !dbg !35

; <label>:43                                      ; preds = %58, %40
  %44 = load i32* %i, align 4, !dbg !35
  %45 = icmp sge i32 %44, 0, !dbg !35
  br i1 %45, label %46, label %61, !dbg !35

; <label>:46                                      ; preds = %43
  %47 = load i32* %i, align 4, !dbg !38
  %48 = sext i32 %47 to i64, !dbg !38
  %49 = load i32** %x, align 8, !dbg !38
  %50 = getelementptr inbounds i32* %49, i64 %48, !dbg !38
  %51 = load i32* %50, align 4, !dbg !38
  %52 = load i32* %i, align 4, !dbg !38
  %53 = sext i32 %52 to i64, !dbg !38
  %54 = load i32** %y, align 8, !dbg !38
  %55 = getelementptr inbounds i32* %54, i64 %53, !dbg !38
  %56 = load i32* %55, align 4, !dbg !38
  %57 = add nsw i32 %56, %51, !dbg !38
  store i32 %57, i32* %55, align 4, !dbg !38
  br label %58, !dbg !40

; <label>:58                                      ; preds = %46
  %59 = load i32* %i, align 4, !dbg !35
  %60 = add nsw i32 %59, -1, !dbg !35
  store i32 %60, i32* %i, align 4, !dbg !35
  br label %43, !dbg !35

; <label>:61                                      ; preds = %43
  br label %62, !dbg !41

; <label>:62                                      ; preds = %61
  %63 = load i32* %k, align 4, !dbg !33
  %64 = add nsw i32 %63, 1, !dbg !33
  store i32 %64, i32* %k, align 4, !dbg !33
  br label %37, !dbg !33

; <label>:65                                      ; preds = %37
  %66 = load i32** %y, align 8, !dbg !42
  %67 = getelementptr inbounds i32* %66, i64 0, !dbg !42
  %68 = load i32* %67, align 4, !dbg !42
  %69 = load i32* %n, align 4, !dbg !42
  %70 = sub nsw i32 %69, 1, !dbg !42
  %71 = sext i32 %70 to i64, !dbg !42
  %72 = load i32** %y, align 8, !dbg !42
  %73 = getelementptr inbounds i32* %72, i64 %71, !dbg !42
  %74 = load i32* %73, align 4, !dbg !42
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %68, i32 %74), !dbg !42
  %76 = load i32** %x, align 8, !dbg !43
  %77 = bitcast i32* %76 to i8*, !dbg !43
  call void @free(i8* %77) #6, !dbg !43
  %78 = load i32** %y, align 8, !dbg !44
  %79 = bitcast i32* %78 to i8*, !dbg !44
  call void @free(i8* %79) #6, !dbg !44
  ret i32 0, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ary3.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 17} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777233, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!16 = metadata !{i32 17, i32 0, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554449, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!18 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 23]
!19 = metadata !{i32 23, i32 0, metadata !4, null}
!20 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!21 = metadata !{i32 24, i32 0, metadata !4, null}
!22 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 24]
!23 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 24, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 24]
!24 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!25 = metadata !{i32 786688, metadata !4, metadata !"y", metadata !5, i32 24, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 24]
!26 = metadata !{i32 26, i32 0, metadata !4, null}
!27 = metadata !{i32 27, i32 0, metadata !4, null}
!28 = metadata !{i32 29, i32 0, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!30 = metadata !{i32 30, i32 0, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 29, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!32 = metadata !{i32 31, i32 0, metadata !31, null}
!33 = metadata !{i32 33, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!35 = metadata !{i32 34, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 34, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!37 = metadata !{i32 786443, metadata !1, metadata !34, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!38 = metadata !{i32 35, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !36, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!40 = metadata !{i32 36, i32 0, metadata !39, null}
!41 = metadata !{i32 37, i32 0, metadata !37, null}
!42 = metadata !{i32 39, i32 0, metadata !4, null}
!43 = metadata !{i32 41, i32 0, metadata !4, null}
!44 = metadata !{i32 42, i32 0, metadata !4, null}
!45 = metadata !{i32 44, i32 0, metadata !4, null}
