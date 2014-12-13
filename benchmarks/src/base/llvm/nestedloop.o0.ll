; ModuleID = 'nestedloop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %x = alloca i32, align 4
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
  %10 = call i32 @atoi(i8* %9) #4, !dbg !19
  br label %12, !dbg !19

; <label>:11                                      ; preds = %0
  br label %12, !dbg !19

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 46, %11 ], !dbg !19
  store i32 %13, i32* %n, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata !{i32* %a}, metadata !20), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %b}, metadata !22), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !23), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %d}, metadata !24), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %e}, metadata !25), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %f}, metadata !26), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !27), !dbg !21
  store i32 0, i32* %x, align 4, !dbg !21
  store i32 0, i32* %a, align 4, !dbg !28
  br label %14, !dbg !28

; <label>:14                                      ; preds = %66, %12
  %15 = load i32* %a, align 4, !dbg !28
  %16 = load i32* %n, align 4, !dbg !28
  %17 = icmp slt i32 %15, %16, !dbg !28
  br i1 %17, label %18, label %69, !dbg !28

; <label>:18                                      ; preds = %14
  store i32 0, i32* %b, align 4, !dbg !30
  br label %19, !dbg !30

; <label>:19                                      ; preds = %62, %18
  %20 = load i32* %b, align 4, !dbg !30
  %21 = load i32* %n, align 4, !dbg !30
  %22 = icmp slt i32 %20, %21, !dbg !30
  br i1 %22, label %23, label %65, !dbg !30

; <label>:23                                      ; preds = %19
  store i32 0, i32* %c, align 4, !dbg !32
  br label %24, !dbg !32

; <label>:24                                      ; preds = %58, %23
  %25 = load i32* %c, align 4, !dbg !32
  %26 = load i32* %n, align 4, !dbg !32
  %27 = icmp slt i32 %25, %26, !dbg !32
  br i1 %27, label %28, label %61, !dbg !32

; <label>:28                                      ; preds = %24
  store i32 0, i32* %d, align 4, !dbg !34
  br label %29, !dbg !34

; <label>:29                                      ; preds = %54, %28
  %30 = load i32* %d, align 4, !dbg !34
  %31 = load i32* %n, align 4, !dbg !34
  %32 = icmp slt i32 %30, %31, !dbg !34
  br i1 %32, label %33, label %57, !dbg !34

; <label>:33                                      ; preds = %29
  store i32 0, i32* %e, align 4, !dbg !36
  br label %34, !dbg !36

; <label>:34                                      ; preds = %50, %33
  %35 = load i32* %e, align 4, !dbg !36
  %36 = load i32* %n, align 4, !dbg !36
  %37 = icmp slt i32 %35, %36, !dbg !36
  br i1 %37, label %38, label %53, !dbg !36

; <label>:38                                      ; preds = %34
  store i32 0, i32* %f, align 4, !dbg !38
  br label %39, !dbg !38

; <label>:39                                      ; preds = %46, %38
  %40 = load i32* %f, align 4, !dbg !38
  %41 = load i32* %n, align 4, !dbg !38
  %42 = icmp slt i32 %40, %41, !dbg !38
  br i1 %42, label %43, label %49, !dbg !38

; <label>:43                                      ; preds = %39
  %44 = load i32* %x, align 4, !dbg !40
  %45 = add nsw i32 %44, 1, !dbg !40
  store i32 %45, i32* %x, align 4, !dbg !40
  br label %46, !dbg !40

; <label>:46                                      ; preds = %43
  %47 = load i32* %f, align 4, !dbg !38
  %48 = add nsw i32 %47, 1, !dbg !38
  store i32 %48, i32* %f, align 4, !dbg !38
  br label %39, !dbg !38

; <label>:49                                      ; preds = %39
  br label %50, !dbg !40

; <label>:50                                      ; preds = %49
  %51 = load i32* %e, align 4, !dbg !36
  %52 = add nsw i32 %51, 1, !dbg !36
  store i32 %52, i32* %e, align 4, !dbg !36
  br label %34, !dbg !36

; <label>:53                                      ; preds = %34
  br label %54, !dbg !41

; <label>:54                                      ; preds = %53
  %55 = load i32* %d, align 4, !dbg !34
  %56 = add nsw i32 %55, 1, !dbg !34
  store i32 %56, i32* %d, align 4, !dbg !34
  br label %29, !dbg !34

; <label>:57                                      ; preds = %29
  br label %58, !dbg !42

; <label>:58                                      ; preds = %57
  %59 = load i32* %c, align 4, !dbg !32
  %60 = add nsw i32 %59, 1, !dbg !32
  store i32 %60, i32* %c, align 4, !dbg !32
  br label %24, !dbg !32

; <label>:61                                      ; preds = %24
  br label %62, !dbg !43

; <label>:62                                      ; preds = %61
  %63 = load i32* %b, align 4, !dbg !30
  %64 = add nsw i32 %63, 1, !dbg !30
  store i32 %64, i32* %b, align 4, !dbg !30
  br label %19, !dbg !30

; <label>:65                                      ; preds = %19
  br label %66, !dbg !44

; <label>:66                                      ; preds = %65
  %67 = load i32* %a, align 4, !dbg !28
  %68 = add nsw i32 %67, 1, !dbg !28
  store i32 %68, i32* %a, align 4, !dbg !28
  br label %14, !dbg !28

; <label>:69                                      ; preds = %14
  %70 = load i32* %x, align 4, !dbg !45
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %70), !dbg !45
  ret i32 0, !dbg !46
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
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c] [DW_LANG_C99]
!1 = metadata !{metadata !"nestedloop.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!16 = metadata !{i32 10, i32 0, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554442, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!18 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 16]
!19 = metadata !{i32 16, i32 0, metadata !4, null}
!20 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 17]
!21 = metadata !{i32 17, i32 0, metadata !4, null}
!22 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 17]
!23 = metadata !{i32 786688, metadata !4, metadata !"c", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 17]
!24 = metadata !{i32 786688, metadata !4, metadata !"d", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 17]
!25 = metadata !{i32 786688, metadata !4, metadata !"e", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 17]
!26 = metadata !{i32 786688, metadata !4, metadata !"f", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 17]
!27 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 17]
!28 = metadata !{i32 19, i32 0, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!30 = metadata !{i32 20, i32 0, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!32 = metadata !{i32 21, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!34 = metadata !{i32 22, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !33, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!36 = metadata !{i32 23, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 23, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!38 = metadata !{i32 24, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !37, i32 24, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!40 = metadata !{i32 25, i32 0, metadata !39, null}
!41 = metadata !{i32 25, i32 0, metadata !37, null}
!42 = metadata !{i32 25, i32 0, metadata !35, null}
!43 = metadata !{i32 25, i32 0, metadata !33, null}
!44 = metadata !{i32 25, i32 0, metadata !31, null}
!45 = metadata !{i32 27, i32 0, metadata !4, null}
!46 = metadata !{i32 28, i32 0, metadata !4, null}
