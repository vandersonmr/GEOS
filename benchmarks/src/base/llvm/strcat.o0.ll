; ModuleID = 'strcat.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"calloc strbuf\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"realloc strbuf\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %buflen = alloca i32, align 4
  %strbuf = alloca i8*, align 8
  %strend = alloca i8*, align 8
  %stufflen = alloca i32, align 4
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
  %10 = call i32 @atoi(i8* %9) #6, !dbg !19
  br label %12, !dbg !19

; <label>:11                                      ; preds = %0
  br label %12, !dbg !19

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 10000000, %11 ], !dbg !19
  store i32 %13, i32* %n, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !20), !dbg !21
  call void @llvm.dbg.declare(metadata !{i32* %buflen}, metadata !22), !dbg !21
  store i32 32, i32* %buflen, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata !{i8** %strbuf}, metadata !23), !dbg !24
  %14 = load i32* %buflen, align 4, !dbg !24
  %15 = sext i32 %14 to i64, !dbg !24
  %16 = call noalias i8* @calloc(i64 1, i64 %15) #7, !dbg !24
  store i8* %16, i8** %strbuf, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata !{i8** %strend}, metadata !25), !dbg !26
  %17 = load i8** %strbuf, align 8, !dbg !26
  store i8* %17, i8** %strend, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata !{i32* %stufflen}, metadata !27), !dbg !28
  store i32 6, i32* %stufflen, align 4, !dbg !28
  %18 = load i8** %strbuf, align 8, !dbg !29
  %19 = icmp ne i8* %18, null, !dbg !29
  br i1 %19, label %21, label %20, !dbg !29

; <label>:20                                      ; preds = %12
  call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0)), !dbg !31
  call void @exit(i32 1) #8, !dbg !31
  unreachable, !dbg !31

; <label>:21                                      ; preds = %12
  store i32 0, i32* %i, align 4, !dbg !33
  br label %22, !dbg !33

; <label>:22                                      ; preds = %61, %21
  %23 = load i32* %i, align 4, !dbg !33
  %24 = load i32* %n, align 4, !dbg !33
  %25 = icmp slt i32 %23, %24, !dbg !33
  br i1 %25, label %26, label %64, !dbg !33

; <label>:26                                      ; preds = %22
  %27 = load i8** %strbuf, align 8, !dbg !35
  %28 = load i32* %buflen, align 4, !dbg !35
  %29 = sext i32 %28 to i64, !dbg !35
  %30 = getelementptr inbounds i8* %27, i64 %29, !dbg !35
  %31 = load i8** %strend, align 8, !dbg !35
  %32 = ptrtoint i8* %30 to i64, !dbg !35
  %33 = ptrtoint i8* %31 to i64, !dbg !35
  %34 = sub i64 %32, %33, !dbg !35
  %35 = load i32* %stufflen, align 4, !dbg !35
  %36 = add nsw i32 %35, 1, !dbg !35
  %37 = sext i32 %36 to i64, !dbg !35
  %38 = icmp slt i64 %34, %37, !dbg !35
  br i1 %38, label %39, label %54, !dbg !35

; <label>:39                                      ; preds = %26
  %40 = load i32* %buflen, align 4, !dbg !38
  %41 = mul nsw i32 2, %40, !dbg !38
  store i32 %41, i32* %buflen, align 4, !dbg !38
  %42 = load i8** %strbuf, align 8, !dbg !40
  %43 = load i32* %buflen, align 4, !dbg !40
  %44 = sext i32 %43 to i64, !dbg !40
  %45 = call i8* @realloc(i8* %42, i64 %44) #7, !dbg !40
  store i8* %45, i8** %strbuf, align 8, !dbg !40
  %46 = load i8** %strbuf, align 8, !dbg !41
  %47 = icmp ne i8* %46, null, !dbg !41
  br i1 %47, label %49, label %48, !dbg !41

; <label>:48                                      ; preds = %39
  call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0)), !dbg !43
  call void @exit(i32 1) #8, !dbg !43
  unreachable, !dbg !43

; <label>:49                                      ; preds = %39
  %50 = load i8** %strbuf, align 8, !dbg !45
  %51 = load i8** %strbuf, align 8, !dbg !45
  %52 = call i64 @strlen(i8* %51) #6, !dbg !45
  %53 = getelementptr inbounds i8* %50, i64 %52, !dbg !45
  store i8* %53, i8** %strend, align 8, !dbg !45
  br label %54, !dbg !46

; <label>:54                                      ; preds = %49, %26
  %55 = load i8** %strend, align 8, !dbg !47
  %56 = call i8* @strcat(i8* %55, i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)) #7, !dbg !47
  %57 = load i32* %stufflen, align 4, !dbg !48
  %58 = load i8** %strend, align 8, !dbg !48
  %59 = sext i32 %57 to i64, !dbg !48
  %60 = getelementptr inbounds i8* %58, i64 %59, !dbg !48
  store i8* %60, i8** %strend, align 8, !dbg !48
  br label %61, !dbg !49

; <label>:61                                      ; preds = %54
  %62 = load i32* %i, align 4, !dbg !33
  %63 = add nsw i32 %62, 1, !dbg !33
  store i32 %63, i32* %i, align 4, !dbg !33
  br label %22, !dbg !33

; <label>:64                                      ; preds = %22
  %65 = load i8** %strbuf, align 8, !dbg !50
  %66 = call i64 @strlen(i8* %65) #6, !dbg !50
  %67 = trunc i64 %66 to i32, !dbg !50
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %67), !dbg !50
  %69 = load i8** %strbuf, align 8, !dbg !51
  call void @free(i8* %69) #7, !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare void @perror(i8*) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c] [DW_LANG_C99]
!1 = metadata !{metadata !"strcat.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 13]
!16 = metadata !{i32 13, i32 0, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 13]
!18 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 14]
!19 = metadata !{i32 14, i32 0, metadata !4, null}
!20 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!21 = metadata !{i32 15, i32 0, metadata !4, null}
!22 = metadata !{i32 786688, metadata !4, metadata !"buflen", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buflen] [line 15]
!23 = metadata !{i32 786688, metadata !4, metadata !"strbuf", metadata !5, i32 16, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [strbuf] [line 16]
!24 = metadata !{i32 16, i32 0, metadata !4, null}
!25 = metadata !{i32 786688, metadata !4, metadata !"strend", metadata !5, i32 17, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [strend] [line 17]
!26 = metadata !{i32 17, i32 0, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"stufflen", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stufflen] [line 18]
!28 = metadata !{i32 18, i32 0, metadata !4, null}
!29 = metadata !{i32 20, i32 0, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!31 = metadata !{i32 20, i32 0, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!33 = metadata !{i32 21, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!35 = metadata !{i32 22, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 22, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!37 = metadata !{i32 786443, metadata !1, metadata !34, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!38 = metadata !{i32 23, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !36, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!40 = metadata !{i32 24, i32 0, metadata !39, null}
!41 = metadata !{i32 25, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !39, i32 25, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!43 = metadata !{i32 25, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !42, i32 25, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/strcat.c]
!45 = metadata !{i32 26, i32 0, metadata !39, null}
!46 = metadata !{i32 27, i32 0, metadata !39, null}
!47 = metadata !{i32 29, i32 0, metadata !37, null}
!48 = metadata !{i32 30, i32 0, metadata !37, null}
!49 = metadata !{i32 31, i32 0, metadata !37, null}
!50 = metadata !{i32 32, i32 0, metadata !4, null}
!51 = metadata !{i32 33, i32 0, metadata !4, null}
!52 = metadata !{i32 35, i32 0, metadata !4, null}
