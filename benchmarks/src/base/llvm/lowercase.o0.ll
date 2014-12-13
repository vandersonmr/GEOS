; ModuleID = 'lowercase.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !41), !dbg !42
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !43), !dbg !42
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !44), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %4, !dbg !46

; <label>:4                                       ; preds = %9, %0
  %5 = load i64* %i, align 8, !dbg !46
  %6 = icmp ult i64 %5, 32, !dbg !46
  br i1 %6, label %7, label %12, !dbg !46

; <label>:7                                       ; preds = %4
  %8 = load i64* %i, align 8, !dbg !48
  call void @doTest(i64 %8), !dbg !48
  br label %9, !dbg !48

; <label>:9                                       ; preds = %7
  %10 = load i64* %i, align 8, !dbg !46
  %11 = add i64 %10, 1, !dbg !46
  store i64 %11, i64* %i, align 8, !dbg !46
  br label %4, !dbg !46

; <label>:12                                      ; preds = %4
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @doTest(i64 %numberOfIterations) #0 {
  %1 = alloca i64, align 8
  %numberOfCharacters = alloca i64, align 8
  %testDataLength = alloca i64, align 8
  %testData = alloca i16*, align 8
  %i = alloca i64, align 8
  %result = alloca i16*, align 8
  store i64 %numberOfIterations, i64* %1, align 8
  call void @llvm.dbg.declare(metadata !{i64* %1}, metadata !50), !dbg !51
  call void @llvm.dbg.declare(metadata !{i64* %numberOfCharacters}, metadata !52), !dbg !53
  %2 = load i64* %1, align 8, !dbg !53
  store i64 %2, i64* %numberOfCharacters, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata !{i64* %testDataLength}, metadata !54), !dbg !55
  %3 = load i64* %numberOfCharacters, align 8, !dbg !55
  %4 = add i64 %3, 16, !dbg !55
  %5 = sub i64 %4, 1, !dbg !55
  %6 = udiv i64 %5, 16, !dbg !55
  %7 = mul i64 %6, 16, !dbg !55
  store i64 %7, i64* %testDataLength, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata !{i16** %testData}, metadata !56), !dbg !57
  %8 = load i64* %testDataLength, align 8, !dbg !57
  %9 = mul i64 2, %8, !dbg !57
  %10 = call i8* @malloc(i64 %9), !dbg !57
  %11 = bitcast i8* %10 to i16*, !dbg !57
  store i16* %11, i16** %testData, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !58), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %12, !dbg !60

; <label>:12                                      ; preds = %21, %0
  %13 = load i64* %i, align 8, !dbg !60
  %14 = load i64* %testDataLength, align 8, !dbg !60
  %15 = icmp ult i64 %13, %14, !dbg !60
  br i1 %15, label %16, label %24, !dbg !60

; <label>:16                                      ; preds = %12
  %17 = load i16** %testData, align 8, !dbg !62
  %18 = load i64* %i, align 8, !dbg !62
  %19 = getelementptr inbounds i16* %17, i64 %18, !dbg !62
  %20 = bitcast i16* %19 to i8*, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* bitcast ([16 x i16]* @staticData to i8*), i64 32, i32 2, i1 false), !dbg !62
  br label %21, !dbg !62

; <label>:21                                      ; preds = %16
  %22 = load i64* %i, align 8, !dbg !60
  %23 = add i64 %22, 16, !dbg !60
  store i64 %23, i64* %i, align 8, !dbg !60
  br label %12, !dbg !60

; <label>:24                                      ; preds = %12
  call void @llvm.dbg.declare(metadata !{i16** %result}, metadata !63), !dbg !64
  %25 = load i64* %testDataLength, align 8, !dbg !64
  %26 = mul i64 2, %25, !dbg !64
  %27 = call i8* @malloc(i64 %26), !dbg !64
  %28 = bitcast i8* %27 to i16*, !dbg !64
  store i16* %28, i16** %result, align 8, !dbg !64
  %29 = load i64* %1, align 8, !dbg !65
  %30 = load i64* %numberOfCharacters, align 8, !dbg !65
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0), i64 %29, i64 %30), !dbg !65
  %32 = load i16** %result, align 8, !dbg !66
  %33 = bitcast i16* %32 to i8*, !dbg !66
  %34 = load i64* %testDataLength, align 8, !dbg !66
  %35 = mul i64 2, %34, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 %35, i32 2, i1 false), !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %36, !dbg !67

; <label>:36                                      ; preds = %44, %24
  %37 = load i64* %i, align 8, !dbg !67
  %38 = icmp ult i64 %37, 10000000, !dbg !67
  br i1 %38, label %39, label %47, !dbg !67

; <label>:39                                      ; preds = %36
  %40 = load i16** %testData, align 8, !dbg !69
  %41 = load i64* %numberOfCharacters, align 8, !dbg !69
  %42 = load i16** %result, align 8, !dbg !69
  %43 = call i64 @lower_StringImpl(i16* %40, i64 %41, i16* %42), !dbg !69
  br label %44, !dbg !69

; <label>:44                                      ; preds = %39
  %45 = load i64* %i, align 8, !dbg !67
  %46 = add i64 %45, 1, !dbg !67
  store i64 %46, i64* %i, align 8, !dbg !67
  br label %36, !dbg !67

; <label>:47                                      ; preds = %36
  ret void, !dbg !70
}

declare i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal i64 @lower_StringImpl(i16* noalias %data, i64 %length, i16* noalias %output) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i16*, align 8
  %ored = alloca i16, align 2
  %i = alloca i64, align 8
  %c = alloca i16, align 2
  store i16* %data, i16** %2, align 8
  call void @llvm.dbg.declare(metadata !{i16** %2}, metadata !71), !dbg !72
  store i64 %length, i64* %3, align 8
  call void @llvm.dbg.declare(metadata !{i64* %3}, metadata !73), !dbg !72
  store i16* %output, i16** %4, align 8
  call void @llvm.dbg.declare(metadata !{i16** %4}, metadata !74), !dbg !72
  call void @llvm.dbg.declare(metadata !{i16* %ored}, metadata !75), !dbg !76
  store i16 0, i16* %ored, align 2, !dbg !76
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !77), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %5, !dbg !79

; <label>:5                                       ; preds = %25, %0
  %6 = load i64* %i, align 8, !dbg !79
  %7 = load i64* %3, align 8, !dbg !79
  %8 = icmp ult i64 %6, %7, !dbg !79
  br i1 %8, label %9, label %28, !dbg !79

; <label>:9                                       ; preds = %5
  call void @llvm.dbg.declare(metadata !{i16* %c}, metadata !81), !dbg !83
  %10 = load i64* %i, align 8, !dbg !83
  %11 = load i16** %2, align 8, !dbg !83
  %12 = getelementptr inbounds i16* %11, i64 %10, !dbg !83
  %13 = load i16* %12, align 2, !dbg !83
  store i16 %13, i16* %c, align 2, !dbg !83
  %14 = load i16* %c, align 2, !dbg !84
  %15 = zext i16 %14 to i32, !dbg !84
  %16 = load i16* %ored, align 2, !dbg !84
  %17 = zext i16 %16 to i32, !dbg !84
  %18 = or i32 %17, %15, !dbg !84
  %19 = trunc i32 %18 to i16, !dbg !84
  store i16 %19, i16* %ored, align 2, !dbg !84
  %20 = load i16* %c, align 2, !dbg !85
  %21 = call zeroext i16 @toASCIILower(i16 zeroext %20), !dbg !85
  %22 = load i64* %i, align 8, !dbg !85
  %23 = load i16** %4, align 8, !dbg !85
  %24 = getelementptr inbounds i16* %23, i64 %22, !dbg !85
  store i16 %21, i16* %24, align 2, !dbg !85
  br label %25, !dbg !86

; <label>:25                                      ; preds = %9
  %26 = load i64* %i, align 8, !dbg !79
  %27 = add i64 %26, 1, !dbg !79
  store i64 %27, i64* %i, align 8, !dbg !79
  br label %5, !dbg !79

; <label>:28                                      ; preds = %5
  %29 = load i16* %ored, align 2, !dbg !87
  %30 = zext i16 %29 to i32, !dbg !87
  %31 = and i32 %30, -128, !dbg !87
  %32 = icmp ne i32 %31, 0, !dbg !87
  br i1 %32, label %34, label %33, !dbg !87

; <label>:33                                      ; preds = %28
  store i64 1, i64* %1, !dbg !89
  br label %35, !dbg !89

; <label>:34                                      ; preds = %28
  store i64 0, i64* %1, !dbg !90
  br label %35, !dbg !90

; <label>:35                                      ; preds = %34, %33
  %36 = load i64* %1, !dbg !91
  ret i64 %36, !dbg !91
}

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i16 @toASCIILower(i16 zeroext %c) #4 {
  %1 = alloca i16, align 2
  store i16 %c, i16* %1, align 2
  call void @llvm.dbg.declare(metadata !{i16* %1}, metadata !92), !dbg !93
  %2 = load i16* %1, align 2, !dbg !93
  %3 = zext i16 %2 to i32, !dbg !93
  %4 = load i16* %1, align 2, !dbg !93
  %5 = zext i16 %4 to i32, !dbg !93
  %6 = icmp sge i32 %5, 65, !dbg !93
  br i1 %6, label %7, label %11, !dbg !93

; <label>:7                                       ; preds = %0
  %8 = load i16* %1, align 2, !dbg !93
  %9 = zext i16 %8 to i32, !dbg !93
  %10 = icmp sle i32 %9, 90, !dbg !93
  br label %11

; <label>:11                                      ; preds = %7, %0
  %12 = phi i1 [ false, %0 ], [ %10, %7 ]
  %13 = zext i1 %12 to i32
  %14 = shl i32 %13, 5
  %15 = or i32 %3, %14
  %16 = trunc i32 %15 to i16
  ret i16 %16, !dbg !93
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !31, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lowercase.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !18, metadata !28}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 51, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 52} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"doTest", metadata !"doTest", metadata !"", i32 30, metadata !13, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64)* @doTest, null, null, metadata !2, i32 31} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [scope 31] [doTest]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786454, metadata !16, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!16 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!17 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lower_StringImpl", metadata !"lower_StringImpl", metadata !"", i32 11, metadata !19, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i16*, i64, i16*)* @lower_StringImpl, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [lower_StringImpl]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !15, metadata !21, metadata !15, metadata !26}
!21 = metadata !{i32 786487, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from UChar]
!24 = metadata !{i32 786454, metadata !1, null, metadata !"UChar", i32 6, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ] [UChar] [line 6, size 0, align 0, offset 0] [from unsigned short]
!25 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!26 = metadata !{i32 786487, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from UChar]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"toASCIILower", metadata !"toASCIILower", metadata !"", i32 8, metadata !29, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16)* @toASCIILower, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 8] [local] [def] [toASCIILower]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !24, metadata !24}
!31 = metadata !{metadata !32, metadata !32, metadata !32, metadata !32, metadata !32, metadata !34}
!32 = metadata !{i32 786484, i32 0, metadata !5, metadata !"staticDataLength", metadata !"staticDataLength", metadata !"staticDataLength", metadata !5, i32 28, metadata !33, i32 1, i32 1, i64 16, null} ; [ DW_TAG_variable ] [staticDataLength] [line 28] [local] [def]
!33 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from size_t]
!34 = metadata !{i32 786484, i32 0, null, metadata !"staticData", metadata !"staticData", metadata !"", metadata !5, i32 27, metadata !35, i32 1, i32 1, [16 x i16]* @staticData, null} ; [ DW_TAG_variable ] [staticData] [line 27] [local] [def]
!35 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 16, i32 0, i32 0, metadata !24, metadata !36, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 16, offset 0] [from UChar]
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!38 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!39 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!40 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!41 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777267, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 51]
!42 = metadata !{i32 51, i32 0, metadata !4, null}
!43 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554483, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 51]
!44 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 53, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 53]
!45 = metadata !{i32 53, i32 0, metadata !4, null}
!46 = metadata !{i32 54, i32 0, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !4, i32 54, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!48 = metadata !{i32 55, i32 0, metadata !47, null}
!49 = metadata !{i32 57, i32 0, metadata !4, null}
!50 = metadata !{i32 786689, metadata !12, metadata !"numberOfIterations", metadata !5, i32 16777246, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numberOfIterations] [line 30]
!51 = metadata !{i32 30, i32 0, metadata !12, null}
!52 = metadata !{i32 786688, metadata !12, metadata !"numberOfCharacters", metadata !5, i32 32, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numberOfCharacters] [line 32]
!53 = metadata !{i32 32, i32 0, metadata !12, null}
!54 = metadata !{i32 786688, metadata !12, metadata !"testDataLength", metadata !5, i32 33, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [testDataLength] [line 33]
!55 = metadata !{i32 33, i32 0, metadata !12, null}
!56 = metadata !{i32 786688, metadata !12, metadata !"testData", metadata !5, i32 34, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [testData] [line 34]
!57 = metadata !{i32 34, i32 0, metadata !12, null}
!58 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 35, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 35]
!59 = metadata !{i32 35, i32 0, metadata !12, null}
!60 = metadata !{i32 36, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !12, i32 36, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!62 = metadata !{i32 37, i32 0, metadata !61, null}
!63 = metadata !{i32 786688, metadata !12, metadata !"result", metadata !5, i32 39, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 39]
!64 = metadata !{i32 39, i32 0, metadata !12, null}
!65 = metadata !{i32 40, i32 0, metadata !12, null}
!66 = metadata !{i32 42, i32 0, metadata !12, null}
!67 = metadata !{i32 46, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !12, i32 46, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!69 = metadata !{i32 48, i32 0, metadata !68, null}
!70 = metadata !{i32 49, i32 0, metadata !12, null}
!71 = metadata !{i32 786689, metadata !18, metadata !"data", metadata !5, i32 16777227, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 11]
!72 = metadata !{i32 11, i32 0, metadata !18, null}
!73 = metadata !{i32 786689, metadata !18, metadata !"length", metadata !5, i32 33554443, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 11]
!74 = metadata !{i32 786689, metadata !18, metadata !"output", metadata !5, i32 50331659, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [output] [line 11]
!75 = metadata !{i32 786688, metadata !18, metadata !"ored", metadata !5, i32 14, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ored] [line 14]
!76 = metadata !{i32 14, i32 0, metadata !18, null}
!77 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 15, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!78 = metadata !{i32 15, i32 0, metadata !18, null}
!79 = metadata !{i32 16, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !18, i32 16, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!81 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !5, i32 17, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 17]
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 16, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!83 = metadata !{i32 17, i32 0, metadata !82, null}
!84 = metadata !{i32 18, i32 0, metadata !82, null}
!85 = metadata !{i32 19, i32 17, metadata !82, null}
!86 = metadata !{i32 20, i32 0, metadata !82, null}
!87 = metadata !{i32 21, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !18, i32 21, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!89 = metadata !{i32 22, i32 0, metadata !88, null}
!90 = metadata !{i32 24, i32 0, metadata !18, null}
!91 = metadata !{i32 25, i32 0, metadata !18, null}
!92 = metadata !{i32 786689, metadata !28, metadata !"c", metadata !5, i32 16777224, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 8]
!93 = metadata !{i32 8, i32 0, metadata !28, null} ; [ DW_TAG_imported_declaration ]
