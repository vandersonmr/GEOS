; ModuleID = 'puzzle.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@next = internal global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @rand() #0 {
  %1 = load i64* @next, align 8, !dbg !33
  %2 = mul i64 %1, 1103515245, !dbg !33
  %3 = add i64 %2, 12345, !dbg !33
  store i64 %3, i64* @next, align 8, !dbg !33
  %4 = load i64* @next, align 8, !dbg !34
  %5 = udiv i64 %4, 65536, !dbg !34
  %6 = trunc i64 %5 to i32, !dbg !34
  %7 = urem i32 %6, 32767, !dbg !34
  %8 = add i32 %7, 1, !dbg !34
  ret i32 %8, !dbg !34
}

; Function Attrs: nounwind uwtable
define void @srand(i32 %seed) #0 {
  %1 = alloca i32, align 4
  store i32 %seed, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !35), !dbg !36
  %2 = load i32* %1, align 4, !dbg !37
  %3 = zext i32 %2 to i64, !dbg !37
  store i64 %3, i64* @next, align 8, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @randInt(i32 %min, i32 %max) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %min, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !39), !dbg !40
  store i32 %max, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !41), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !42), !dbg !43
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !44), !dbg !43
  %3 = load i32* %2, align 4, !dbg !45
  %4 = load i32* %1, align 4, !dbg !45
  %5 = sub nsw i32 %3, %4, !dbg !45
  %6 = add nsw i32 %5, 1, !dbg !45
  store i32 %6, i32* %n, align 4, !dbg !45
  %7 = load i32* %n, align 4, !dbg !46
  %8 = sitofp i32 %7 to double, !dbg !46
  %9 = call i32 @rand() #4, !dbg !46
  %10 = sitofp i32 %9 to double, !dbg !46
  %11 = fdiv double %10, 3.276800e+04, !dbg !46
  %12 = fmul double %8, %11, !dbg !46
  %13 = fptosi double %12 to i32, !dbg !46
  store i32 %13, i32* %k, align 4, !dbg !46
  %14 = load i32* %k, align 4, !dbg !47
  %15 = load i32* %n, align 4, !dbg !47
  %16 = icmp eq i32 %14, %15, !dbg !47
  br i1 %16, label %17, label %22, !dbg !47

; <label>:17                                      ; preds = %0
  %18 = load i32* %k, align 4, !dbg !47
  %19 = load i32* %1, align 4, !dbg !47
  %20 = add nsw i32 %18, %19, !dbg !47
  %21 = sub nsw i32 %20, 1, !dbg !47
  br label %26, !dbg !47

; <label>:22                                      ; preds = %0
  %23 = load i32* %k, align 4, !dbg !47
  %24 = load i32* %1, align 4, !dbg !47
  %25 = add nsw i32 %23, %24, !dbg !47
  br label %26, !dbg !47

; <label>:26                                      ; preds = %22, %17
  %27 = phi i32 [ %21, %17 ], [ %25, %22 ], !dbg !47
  ret i32 %27, !dbg !47
}

; Function Attrs: nounwind uwtable
define void @shuffle(i32* %items, i32 %len) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  %aux = alloca i32, align 4
  store i32* %items, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !48), !dbg !49
  store i32 %len, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !50), !dbg !49
  call void @llvm.dbg.declare(metadata !{i64* %j}, metadata !51), !dbg !55
  call void @llvm.dbg.declare(metadata !{i64* %k}, metadata !56), !dbg !55
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !57), !dbg !55
  call void @llvm.dbg.declare(metadata !{i32* %aux}, metadata !58), !dbg !59
  %3 = load i32* %2, align 4, !dbg !60
  %4 = sub nsw i32 %3, 1, !dbg !60
  %5 = sext i32 %4 to i64, !dbg !60
  store i64 %5, i64* %i, align 8, !dbg !60
  br label %6, !dbg !60

; <label>:6                                       ; preds = %45, %0
  %7 = load i64* %i, align 8, !dbg !60
  %8 = icmp ugt i64 %7, 0, !dbg !60
  br i1 %8, label %9, label %48, !dbg !60

; <label>:9                                       ; preds = %6
  %10 = load i64* %i, align 8, !dbg !62
  %11 = add i64 %10, 1, !dbg !62
  %12 = uitofp i64 %11 to double, !dbg !62
  %13 = call i32 @rand() #4, !dbg !62
  %14 = sitofp i32 %13 to double, !dbg !62
  %15 = fdiv double %14, 3.276800e+04, !dbg !62
  %16 = fmul double %12, %15, !dbg !62
  %17 = fptosi double %16 to i32, !dbg !62
  %18 = sext i32 %17 to i64, !dbg !62
  store i64 %18, i64* %k, align 8, !dbg !62
  %19 = load i64* %k, align 8, !dbg !64
  %20 = load i64* %i, align 8, !dbg !64
  %21 = add i64 %20, 1, !dbg !64
  %22 = icmp eq i64 %19, %21, !dbg !64
  br i1 %22, label %23, label %26, !dbg !64

; <label>:23                                      ; preds = %9
  %24 = load i64* %k, align 8, !dbg !64
  %25 = sub i64 %24, 1, !dbg !64
  br label %28, !dbg !64

; <label>:26                                      ; preds = %9
  %27 = load i64* %k, align 8, !dbg !64
  br label %28, !dbg !64

; <label>:28                                      ; preds = %26, %23
  %29 = phi i64 [ %25, %23 ], [ %27, %26 ], !dbg !64
  store i64 %29, i64* %j, align 8, !dbg !64
  %30 = load i64* %i, align 8, !dbg !65
  %31 = load i32** %1, align 8, !dbg !65
  %32 = getelementptr inbounds i32* %31, i64 %30, !dbg !65
  %33 = load i32* %32, align 4, !dbg !65
  store i32 %33, i32* %aux, align 4, !dbg !65
  %34 = load i64* %j, align 8, !dbg !66
  %35 = load i32** %1, align 8, !dbg !66
  %36 = getelementptr inbounds i32* %35, i64 %34, !dbg !66
  %37 = load i32* %36, align 4, !dbg !66
  %38 = load i64* %i, align 8, !dbg !66
  %39 = load i32** %1, align 8, !dbg !66
  %40 = getelementptr inbounds i32* %39, i64 %38, !dbg !66
  store i32 %37, i32* %40, align 4, !dbg !66
  %41 = load i32* %aux, align 4, !dbg !67
  %42 = load i64* %j, align 8, !dbg !67
  %43 = load i32** %1, align 8, !dbg !67
  %44 = getelementptr inbounds i32* %43, i64 %42, !dbg !67
  store i32 %41, i32* %44, align 4, !dbg !67
  br label %45, !dbg !68

; <label>:45                                      ; preds = %28
  %46 = load i64* %i, align 8, !dbg !60
  %47 = add i64 %46, -1, !dbg !60
  store i64 %47, i64* %i, align 8, !dbg !60
  br label %6, !dbg !60

; <label>:48                                      ; preds = %6
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define i32* @createRandomArray(i32 %size) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i32*, align 8
  store i32 %size, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !70), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %len}, metadata !74), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32** %result}, metadata !75), !dbg !76
  %2 = load i32* %1, align 4, !dbg !77
  %3 = add nsw i32 %2, 1, !dbg !77
  store i32 %3, i32* %len, align 4, !dbg !77
  %4 = load i32* %len, align 4, !dbg !78
  %5 = sext i32 %4 to i64, !dbg !78
  %6 = mul i64 %5, 4, !dbg !78
  %7 = call noalias i8* @malloc(i64 %6) #4, !dbg !78
  %8 = bitcast i8* %7 to i32*, !dbg !78
  store i32* %8, i32** %result, align 8, !dbg !78
  store i32 0, i32* %i, align 4, !dbg !79
  br label %9, !dbg !79

; <label>:9                                       ; preds = %19, %0
  %10 = load i32* %i, align 4, !dbg !79
  %11 = load i32* %len, align 4, !dbg !79
  %12 = icmp slt i32 %10, %11, !dbg !79
  br i1 %12, label %13, label %22, !dbg !79

; <label>:13                                      ; preds = %9
  %14 = load i32* %i, align 4, !dbg !81
  %15 = load i32* %i, align 4, !dbg !81
  %16 = sext i32 %15 to i64, !dbg !81
  %17 = load i32** %result, align 8, !dbg !81
  %18 = getelementptr inbounds i32* %17, i64 %16, !dbg !81
  store i32 %14, i32* %18, align 4, !dbg !81
  br label %19, !dbg !81

; <label>:19                                      ; preds = %13
  %20 = load i32* %i, align 4, !dbg !79
  %21 = add nsw i32 %20, 1, !dbg !79
  store i32 %21, i32* %i, align 4, !dbg !79
  br label %9, !dbg !79

; <label>:22                                      ; preds = %9
  %23 = load i32* %1, align 4, !dbg !82
  %24 = call i32 @randInt(i32 1, i32 %23), !dbg !82
  %25 = load i32** %result, align 8, !dbg !82
  %26 = getelementptr inbounds i32* %25, i64 0, !dbg !82
  store i32 %24, i32* %26, align 4, !dbg !82
  %27 = load i32** %result, align 8, !dbg !83
  %28 = load i32* %len, align 4, !dbg !83
  call void @shuffle(i32* %27, i32 %28), !dbg !83
  %29 = load i32** %result, align 8, !dbg !84
  ret i32* %29, !dbg !84
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @findDuplicate(i32* %data, i32 %len) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !85), !dbg !86
  store i32 %len, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !87), !dbg !86
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !88), !dbg !89
  call void @llvm.dbg.declare(metadata !{i32* %result}, metadata !90), !dbg !91
  store i32 0, i32* %result, align 4, !dbg !91
  store i32 0, i32* %i, align 4, !dbg !92
  br label %3, !dbg !92

; <label>:3                                       ; preds = %18, %0
  %4 = load i32* %i, align 4, !dbg !92
  %5 = load i32* %2, align 4, !dbg !92
  %6 = icmp slt i32 %4, %5, !dbg !92
  br i1 %6, label %7, label %21, !dbg !92

; <label>:7                                       ; preds = %3
  %8 = load i32* %result, align 4, !dbg !94
  %9 = load i32* %i, align 4, !dbg !94
  %10 = add nsw i32 %9, 1, !dbg !94
  %11 = xor i32 %8, %10, !dbg !94
  %12 = load i32* %i, align 4, !dbg !94
  %13 = sext i32 %12 to i64, !dbg !94
  %14 = load i32** %1, align 8, !dbg !94
  %15 = getelementptr inbounds i32* %14, i64 %13, !dbg !94
  %16 = load i32* %15, align 4, !dbg !94
  %17 = xor i32 %11, %16, !dbg !94
  store i32 %17, i32* %result, align 4, !dbg !94
  br label %18, !dbg !94

; <label>:18                                      ; preds = %7
  %19 = load i32* %i, align 4, !dbg !92
  %20 = add nsw i32 %19, 1, !dbg !92
  store i32 %20, i32* %i, align 4, !dbg !92
  br label %3, !dbg !92

; <label>:21                                      ; preds = %3
  %22 = load i32* %2, align 4, !dbg !95
  %23 = load i32* %result, align 4, !dbg !95
  %24 = xor i32 %23, %22, !dbg !95
  store i32 %24, i32* %result, align 4, !dbg !95
  %25 = load i32* %result, align 4, !dbg !96
  ret i32 %25, !dbg !96
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %duplicate = alloca i32, align 4
  %rndArr = alloca i32*, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !97), !dbg !98
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !99), !dbg !98
  call void @llvm.dbg.declare(metadata !{i32* %duplicate}, metadata !100), !dbg !98
  call void @llvm.dbg.declare(metadata !{i32** %rndArr}, metadata !101), !dbg !102
  call void @srand(i32 1) #4, !dbg !103
  store i32 0, i32* %i, align 4, !dbg !104
  br label %2, !dbg !104

; <label>:2                                       ; preds = %21, %0
  %3 = load i32* %i, align 4, !dbg !104
  %4 = icmp slt i32 %3, 5, !dbg !104
  br i1 %4, label %5, label %24, !dbg !104

; <label>:5                                       ; preds = %2
  %6 = call i32* @createRandomArray(i32 500000), !dbg !106
  store i32* %6, i32** %rndArr, align 8, !dbg !106
  store i32 0, i32* %j, align 4, !dbg !108
  br label %7, !dbg !108

; <label>:7                                       ; preds = %13, %5
  %8 = load i32* %j, align 4, !dbg !108
  %9 = icmp slt i32 %8, 200, !dbg !108
  br i1 %9, label %10, label %16, !dbg !108

; <label>:10                                      ; preds = %7
  %11 = load i32** %rndArr, align 8, !dbg !110
  %12 = call i32 @findDuplicate(i32* %11, i32 500001), !dbg !110
  store i32 %12, i32* %duplicate, align 4, !dbg !110
  br label %13, !dbg !110

; <label>:13                                      ; preds = %10
  %14 = load i32* %j, align 4, !dbg !108
  %15 = add nsw i32 %14, 1, !dbg !108
  store i32 %15, i32* %j, align 4, !dbg !108
  br label %7, !dbg !108

; <label>:16                                      ; preds = %7
  %17 = load i32** %rndArr, align 8, !dbg !111
  %18 = bitcast i32* %17 to i8*, !dbg !111
  call void @free(i8* %18) #4, !dbg !111
  %19 = load i32* %duplicate, align 4, !dbg !112
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %19), !dbg !112
  br label %21, !dbg !113

; <label>:21                                      ; preds = %16
  %22 = load i32* %i, align 4, !dbg !104
  %23 = add nsw i32 %22, 1, !dbg !104
  store i32 %23, i32* %i, align 4, !dbg !104
  br label %2, !dbg !104

; <label>:24                                      ; preds = %2
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !27, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c] [DW_LANG_C99]
!1 = metadata !{metadata !"puzzle.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !16, metadata !20, metadata !23, metadata !26}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rand", metadata !"rand", metadata !"", i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @rand, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [rand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"srand", metadata !"srand", metadata !"", i32 20, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @srand, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [srand]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"randInt", metadata !"randInt", metadata !"", i32 25, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @randInt, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [randInt]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !8, metadata !8, metadata !8}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"shuffle", metadata !"shuffle", metadata !"", i32 32, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32)* @shuffle, null, null, metadata !2, i32 32} ; [ DW_TAG_subprogram ] [line 32] [def] [shuffle]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19, metadata !8}
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"createRandomArray", metadata !"createRandomArray", metadata !"", i32 46, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* (i32)* @createRandomArray, null, null, metadata !2, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [createRandomArray]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !19, metadata !8}
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"findDuplicate", metadata !"findDuplicate", metadata !"", i32 59, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32)* @findDuplicate, null, null, metadata !2, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [findDuplicate]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !8, metadata !19, metadata !8}
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 69, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 69} ; [ DW_TAG_subprogram ] [line 69] [def] [main]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786484, i32 0, null, metadata !"next", metadata !"next", metadata !"", metadata !5, i32 13, metadata !29, i32 1, i32 1, i64* @next, null} ; [ DW_TAG_variable ] [next] [line 13] [local] [def]
!29 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!31 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!32 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!33 = metadata !{i32 16, i32 0, metadata !4, null}
!34 = metadata !{i32 17, i32 0, metadata !4, null}
!35 = metadata !{i32 786689, metadata !9, metadata !"seed", metadata !5, i32 16777236, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!36 = metadata !{i32 20, i32 0, metadata !9, null}
!37 = metadata !{i32 21, i32 0, metadata !9, null}
!38 = metadata !{i32 22, i32 0, metadata !9, null}
!39 = metadata !{i32 786689, metadata !13, metadata !"min", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min] [line 25]
!40 = metadata !{i32 25, i32 0, metadata !13, null}
!41 = metadata !{i32 786689, metadata !13, metadata !"max", metadata !5, i32 33554457, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 25]
!42 = metadata !{i32 786688, metadata !13, metadata !"k", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 26]
!43 = metadata !{i32 26, i32 0, metadata !13, null}
!44 = metadata !{i32 786688, metadata !13, metadata !"n", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 26]
!45 = metadata !{i32 27, i32 0, metadata !13, null}
!46 = metadata !{i32 28, i32 0, metadata !13, null}
!47 = metadata !{i32 29, i32 0, metadata !13, null}
!48 = metadata !{i32 786689, metadata !16, metadata !"items", metadata !5, i32 16777248, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [items] [line 32]
!49 = metadata !{i32 32, i32 0, metadata !16, null}
!50 = metadata !{i32 786689, metadata !16, metadata !"len", metadata !5, i32 33554464, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!51 = metadata !{i32 786688, metadata !16, metadata !"j", metadata !5, i32 33, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 33]
!52 = metadata !{i32 786454, metadata !53, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!53 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!54 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!55 = metadata !{i32 33, i32 0, metadata !16, null}
!56 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 33, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 33]
!57 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 33, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 33]
!58 = metadata !{i32 786688, metadata !16, metadata !"aux", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [aux] [line 34]
!59 = metadata !{i32 34, i32 0, metadata !16, null}
!60 = metadata !{i32 36, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !16, i32 36, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!62 = metadata !{i32 37, i32 0, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 36, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!64 = metadata !{i32 38, i32 0, metadata !63, null}
!65 = metadata !{i32 40, i32 0, metadata !63, null}
!66 = metadata !{i32 41, i32 0, metadata !63, null}
!67 = metadata !{i32 42, i32 0, metadata !63, null}
!68 = metadata !{i32 43, i32 0, metadata !63, null}
!69 = metadata !{i32 44, i32 0, metadata !16, null}
!70 = metadata !{i32 786689, metadata !20, metadata !"size", metadata !5, i32 16777262, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 46]
!71 = metadata !{i32 46, i32 0, metadata !20, null}
!72 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 47]
!73 = metadata !{i32 47, i32 0, metadata !20, null}
!74 = metadata !{i32 786688, metadata !20, metadata !"len", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 47]
!75 = metadata !{i32 786688, metadata !20, metadata !"result", metadata !5, i32 48, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 48]
!76 = metadata !{i32 48, i32 0, metadata !20, null}
!77 = metadata !{i32 50, i32 0, metadata !20, null}
!78 = metadata !{i32 51, i32 0, metadata !20, null}
!79 = metadata !{i32 52, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !20, i32 52, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!81 = metadata !{i32 53, i32 0, metadata !80, null}
!82 = metadata !{i32 54, i32 0, metadata !20, null}
!83 = metadata !{i32 55, i32 0, metadata !20, null}
!84 = metadata !{i32 56, i32 0, metadata !20, null}
!85 = metadata !{i32 786689, metadata !23, metadata !"data", metadata !5, i32 16777275, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 59]
!86 = metadata !{i32 59, i32 0, metadata !23, null}
!87 = metadata !{i32 786689, metadata !23, metadata !"len", metadata !5, i32 33554491, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 59]
!88 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 60]
!89 = metadata !{i32 60, i32 0, metadata !23, null}
!90 = metadata !{i32 786688, metadata !23, metadata !"result", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 61]
!91 = metadata !{i32 61, i32 0, metadata !23, null}
!92 = metadata !{i32 63, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !23, i32 63, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!94 = metadata !{i32 64, i32 0, metadata !93, null}
!95 = metadata !{i32 65, i32 0, metadata !23, null}
!96 = metadata !{i32 66, i32 0, metadata !23, null}
!97 = metadata !{i32 786688, metadata !26, metadata !"i", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 70]
!98 = metadata !{i32 70, i32 0, metadata !26, null}
!99 = metadata !{i32 786688, metadata !26, metadata !"j", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 70]
!100 = metadata !{i32 786688, metadata !26, metadata !"duplicate", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [duplicate] [line 70]
!101 = metadata !{i32 786688, metadata !26, metadata !"rndArr", metadata !5, i32 71, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rndArr] [line 71]
!102 = metadata !{i32 71, i32 0, metadata !26, null}
!103 = metadata !{i32 73, i32 0, metadata !26, null}
!104 = metadata !{i32 75, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !26, i32 75, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!106 = metadata !{i32 76, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !105, i32 75, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!108 = metadata !{i32 77, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !107, i32 77, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!110 = metadata !{i32 78, i32 0, metadata !109, null}
!111 = metadata !{i32 79, i32 0, metadata !107, null}
!112 = metadata !{i32 80, i32 0, metadata !107, null}
!113 = metadata !{i32 81, i32 0, metadata !107, null}
!114 = metadata !{i32 83, i32 0, metadata !26, null}
