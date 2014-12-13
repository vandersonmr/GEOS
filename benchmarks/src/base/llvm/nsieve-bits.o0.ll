; ModuleID = 'nsieve-bits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %m = alloca i32, align 4
  %sz = alloca i32, align 4
  %primes = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !15), !dbg !16
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !17), !dbg !16
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !18), !dbg !20
  call void @llvm.dbg.declare(metadata !{i32* %sz}, metadata !21), !dbg !20
  store i32 40960000, i32* %sz, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata !{i32** %primes}, metadata !22), !dbg !25
  %4 = load i32* %sz, align 4, !dbg !25
  %5 = udiv i32 %4, 8, !dbg !25
  %6 = zext i32 %5 to i64, !dbg !25
  %7 = add i64 %6, 4, !dbg !25
  %8 = call noalias i8* @malloc(i64 %7) #3, !dbg !25
  %9 = bitcast i8* %8 to i32*, !dbg !25
  store i32* %9, i32** %primes, align 8, !dbg !25
  %10 = load i32** %primes, align 8, !dbg !26
  %11 = icmp ne i32* %10, null, !dbg !26
  br i1 %11, label %13, label %12, !dbg !26

; <label>:12                                      ; preds = %0
  store i32 1, i32* %1, !dbg !26
  br label %102, !dbg !26

; <label>:13                                      ; preds = %0
  store i32 0, i32* %m, align 4, !dbg !28
  br label %14, !dbg !28

; <label>:14                                      ; preds = %96, %13
  %15 = load i32* %m, align 4, !dbg !28
  %16 = icmp ule i32 %15, 2, !dbg !28
  br i1 %16, label %17, label %99, !dbg !28

; <label>:17                                      ; preds = %14
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !30), !dbg !32
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !33), !dbg !32
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !34), !dbg !32
  store i32 0, i32* %count, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !35), !dbg !32
  %18 = load i32* %sz, align 4, !dbg !32
  %19 = load i32* %m, align 4, !dbg !32
  %20 = lshr i32 %18, %19, !dbg !32
  store i32 %20, i32* %n, align 4, !dbg !32
  %21 = load i32** %primes, align 8, !dbg !36
  %22 = bitcast i32* %21 to i8*, !dbg !36
  %23 = load i32* %n, align 4, !dbg !36
  %24 = udiv i32 %23, 8, !dbg !36
  %25 = zext i32 %24 to i64, !dbg !36
  %26 = add i64 %25, 4, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* %22, i8 -1, i64 %26, i32 4, i1 false), !dbg !36
  store i32 2, i32* %i, align 4, !dbg !37
  br label %27, !dbg !37

; <label>:27                                      ; preds = %89, %17
  %28 = load i32* %i, align 4, !dbg !37
  %29 = load i32* %n, align 4, !dbg !37
  %30 = icmp ule i32 %28, %29, !dbg !37
  br i1 %30, label %31, label %92, !dbg !37

; <label>:31                                      ; preds = %27
  %32 = load i32* %i, align 4, !dbg !39
  %33 = zext i32 %32 to i64, !dbg !39
  %34 = udiv i64 %33, 32, !dbg !39
  %35 = load i32** %primes, align 8, !dbg !39
  %36 = getelementptr inbounds i32* %35, i64 %34, !dbg !39
  %37 = load i32* %36, align 4, !dbg !39
  %38 = load i32* %i, align 4, !dbg !39
  %39 = zext i32 %38 to i64, !dbg !39
  %40 = urem i64 %39, 32, !dbg !39
  %41 = trunc i64 %40 to i32, !dbg !39
  %42 = shl i32 1, %41, !dbg !39
  %43 = and i32 %37, %42, !dbg !39
  %44 = icmp ne i32 %43, 0, !dbg !39
  br i1 %44, label %45, label %88, !dbg !39

; <label>:45                                      ; preds = %31
  %46 = load i32* %count, align 4, !dbg !41
  %47 = add i32 %46, 1, !dbg !41
  store i32 %47, i32* %count, align 4, !dbg !41
  %48 = load i32* %i, align 4, !dbg !43
  %49 = load i32* %i, align 4, !dbg !43
  %50 = add i32 %48, %49, !dbg !43
  store i32 %50, i32* %j, align 4, !dbg !43
  br label %51, !dbg !43

; <label>:51                                      ; preds = %83, %45
  %52 = load i32* %j, align 4, !dbg !43
  %53 = load i32* %n, align 4, !dbg !43
  %54 = icmp ule i32 %52, %53, !dbg !43
  br i1 %54, label %55, label %87, !dbg !43

; <label>:55                                      ; preds = %51
  %56 = load i32* %j, align 4, !dbg !45
  %57 = zext i32 %56 to i64, !dbg !45
  %58 = udiv i64 %57, 32, !dbg !45
  %59 = load i32** %primes, align 8, !dbg !45
  %60 = getelementptr inbounds i32* %59, i64 %58, !dbg !45
  %61 = load i32* %60, align 4, !dbg !45
  %62 = load i32* %j, align 4, !dbg !45
  %63 = zext i32 %62 to i64, !dbg !45
  %64 = urem i64 %63, 32, !dbg !45
  %65 = trunc i64 %64 to i32, !dbg !45
  %66 = shl i32 1, %65, !dbg !45
  %67 = and i32 %61, %66, !dbg !45
  %68 = icmp ne i32 %67, 0, !dbg !45
  br i1 %68, label %69, label %82, !dbg !45

; <label>:69                                      ; preds = %55
  %70 = load i32* %j, align 4, !dbg !45
  %71 = zext i32 %70 to i64, !dbg !45
  %72 = urem i64 %71, 32, !dbg !45
  %73 = trunc i64 %72 to i32, !dbg !45
  %74 = shl i32 1, %73, !dbg !45
  %75 = load i32* %j, align 4, !dbg !45
  %76 = zext i32 %75 to i64, !dbg !45
  %77 = udiv i64 %76, 32, !dbg !45
  %78 = load i32** %primes, align 8, !dbg !45
  %79 = getelementptr inbounds i32* %78, i64 %77, !dbg !45
  %80 = load i32* %79, align 4, !dbg !45
  %81 = xor i32 %80, %74, !dbg !45
  store i32 %81, i32* %79, align 4, !dbg !45
  br label %82, !dbg !45

; <label>:82                                      ; preds = %69, %55
  br label %83, !dbg !45

; <label>:83                                      ; preds = %82
  %84 = load i32* %i, align 4, !dbg !43
  %85 = load i32* %j, align 4, !dbg !43
  %86 = add i32 %85, %84, !dbg !43
  store i32 %86, i32* %j, align 4, !dbg !43
  br label %51, !dbg !43

; <label>:87                                      ; preds = %51
  br label %88, !dbg !47

; <label>:88                                      ; preds = %87, %31
  br label %89, !dbg !48

; <label>:89                                      ; preds = %88
  %90 = load i32* %i, align 4, !dbg !37
  %91 = add i32 %90, 1, !dbg !37
  store i32 %91, i32* %i, align 4, !dbg !37
  br label %27, !dbg !37

; <label>:92                                      ; preds = %27
  %93 = load i32* %n, align 4, !dbg !49
  %94 = load i32* %count, align 4, !dbg !49
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %93, i32 %94), !dbg !49
  br label %96, !dbg !50

; <label>:96                                      ; preds = %92
  %97 = load i32* %m, align 4, !dbg !28
  %98 = add i32 %97, 1, !dbg !28
  store i32 %98, i32* %m, align 4, !dbg !28
  br label %14, !dbg !28

; <label>:99                                      ; preds = %14
  %100 = load i32** %primes, align 8, !dbg !51
  %101 = bitcast i32* %100 to i8*, !dbg !51
  call void @free(i8* %101) #3, !dbg !51
  store i32 0, i32* %1, !dbg !52
  br label %102, !dbg !52

; <label>:102                                     ; preds = %99, %12
  %103 = load i32* %1, !dbg !53
  ret i32 %103, !dbg !53
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare void @free(i8*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c] [DW_LANG_C99]
!1 = metadata !{metadata !"nsieve-bits.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!16 = metadata !{i32 18, i32 0, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554450, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!18 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 20, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 20]
!19 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!20 = metadata !{i32 20, i32 0, metadata !4, null}
!21 = metadata !{i32 786688, metadata !4, metadata !"sz", metadata !5, i32 20, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sz] [line 20]
!22 = metadata !{i32 786688, metadata !4, metadata !"primes", metadata !5, i32 21, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [primes] [line 21]
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bits]
!24 = metadata !{i32 786454, metadata !1, null, metadata !"bits", i32 11, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [bits] [line 11, size 0, align 0, offset 0] [from unsigned int]
!25 = metadata !{i32 21, i32 0, metadata !4, null}
!26 = metadata !{i32 22, i32 0, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 22, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!28 = metadata !{i32 23, i32 0, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 23, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!30 = metadata !{i32 786688, metadata !31, metadata !"i", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 23, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!32 = metadata !{i32 24, i32 0, metadata !31, null}
!33 = metadata !{i32 786688, metadata !31, metadata !"j", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 24]
!34 = metadata !{i32 786688, metadata !31, metadata !"count", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 24]
!35 = metadata !{i32 786688, metadata !31, metadata !"n", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 24]
!36 = metadata !{i32 25, i32 0, metadata !31, null}
!37 = metadata !{i32 26, i32 0, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !31, i32 26, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!39 = metadata !{i32 27, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 27, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!41 = metadata !{i32 28, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!43 = metadata !{i32 29, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !42, i32 29, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!45 = metadata !{i32 30, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !44, i32 30, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nsieve-bits.c]
!47 = metadata !{i32 31, i32 0, metadata !42, null}
!48 = metadata !{i32 31, i32 0, metadata !40, null}
!49 = metadata !{i32 32, i32 0, metadata !31, null}
!50 = metadata !{i32 33, i32 0, metadata !31, null}
!51 = metadata !{i32 34, i32 0, metadata !4, null}
!52 = metadata !{i32 35, i32 0, metadata !4, null}
!53 = metadata !{i32 36, i32 0, metadata !4, null}
