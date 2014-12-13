; ModuleID = 'methcall.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)*, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

; Function Attrs: nounwind uwtable
define signext i8 @toggle_value(%struct.Toggle* %this) #0 {
  %1 = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %1}, metadata !64), !dbg !65
  %2 = load %struct.Toggle** %1, align 8, !dbg !66
  %3 = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 0, !dbg !66
  %4 = load i8* %3, align 1, !dbg !66
  ret i8 %4, !dbg !66
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #0 {
  %1 = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %1}, metadata !67), !dbg !68
  %2 = load %struct.Toggle** %1, align 8, !dbg !69
  %3 = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 0, !dbg !69
  %4 = load i8* %3, align 1, !dbg !69
  %5 = icmp ne i8 %4, 0, !dbg !69
  %6 = xor i1 %5, true, !dbg !69
  %7 = zext i1 %6 to i32, !dbg !69
  %8 = trunc i32 %7 to i8, !dbg !69
  %9 = load %struct.Toggle** %1, align 8, !dbg !69
  %10 = getelementptr inbounds %struct.Toggle* %9, i32 0, i32 0, !dbg !69
  store i8 %8, i8* %10, align 1, !dbg !69
  %11 = load %struct.Toggle** %1, align 8, !dbg !70
  ret %struct.Toggle* %11, !dbg !70
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #0 {
  %1 = alloca %struct.Toggle*, align 8
  %2 = alloca i8, align 1
  store %struct.Toggle* %this, %struct.Toggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %1}, metadata !71), !dbg !72
  store i8 %start_state, i8* %2, align 1
  call void @llvm.dbg.declare(metadata !{i8* %2}, metadata !73), !dbg !72
  %3 = load i8* %2, align 1, !dbg !74
  %4 = load %struct.Toggle** %1, align 8, !dbg !74
  %5 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 0, !dbg !74
  store i8 %3, i8* %5, align 1, !dbg !74
  %6 = load %struct.Toggle** %1, align 8, !dbg !75
  %7 = getelementptr inbounds %struct.Toggle* %6, i32 0, i32 1, !dbg !75
  %8 = bitcast {}** %7 to i8 (%struct.Toggle*)**, !dbg !75
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %8, align 8, !dbg !75
  %9 = load %struct.Toggle** %1, align 8, !dbg !76
  %10 = getelementptr inbounds %struct.Toggle* %9, i32 0, i32 2, !dbg !76
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %10, align 8, !dbg !76
  %11 = load %struct.Toggle** %1, align 8, !dbg !77
  ret %struct.Toggle* %11, !dbg !77
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @new_Toggle(i8 signext %start_state) #0 {
  %1 = alloca i8, align 1
  %this = alloca %struct.Toggle*, align 8
  store i8 %start_state, i8* %1, align 1
  call void @llvm.dbg.declare(metadata !{i8* %1}, metadata !78), !dbg !79
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %this}, metadata !80), !dbg !81
  %2 = call noalias i8* @malloc(i64 24) #5, !dbg !81
  %3 = bitcast i8* %2 to %struct.Toggle*, !dbg !81
  store %struct.Toggle* %3, %struct.Toggle** %this, align 8, !dbg !81
  %4 = load %struct.Toggle** %this, align 8, !dbg !82
  %5 = load i8* %1, align 1, !dbg !82
  %6 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %4, i8 signext %5), !dbg !82
  ret %struct.Toggle* %6, !dbg !82
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #0 {
  %1 = alloca %struct.NthToggle*, align 8
  store %struct.NthToggle* %this, %struct.NthToggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %1}, metadata !83), !dbg !84
  %2 = load %struct.NthToggle** %1, align 8, !dbg !85
  %3 = getelementptr inbounds %struct.NthToggle* %2, i32 0, i32 4, !dbg !85
  %4 = load i32* %3, align 4, !dbg !85
  %5 = add nsw i32 %4, 1, !dbg !85
  store i32 %5, i32* %3, align 4, !dbg !85
  %6 = load %struct.NthToggle** %1, align 8, !dbg !85
  %7 = getelementptr inbounds %struct.NthToggle* %6, i32 0, i32 3, !dbg !85
  %8 = load i32* %7, align 4, !dbg !85
  %9 = icmp sge i32 %5, %8, !dbg !85
  br i1 %9, label %10, label %22, !dbg !85

; <label>:10                                      ; preds = %0
  %11 = load %struct.NthToggle** %1, align 8, !dbg !87
  %12 = getelementptr inbounds %struct.NthToggle* %11, i32 0, i32 0, !dbg !87
  %13 = load i8* %12, align 1, !dbg !87
  %14 = icmp ne i8 %13, 0, !dbg !87
  %15 = xor i1 %14, true, !dbg !87
  %16 = zext i1 %15 to i32, !dbg !87
  %17 = trunc i32 %16 to i8, !dbg !87
  %18 = load %struct.NthToggle** %1, align 8, !dbg !87
  %19 = getelementptr inbounds %struct.NthToggle* %18, i32 0, i32 0, !dbg !87
  store i8 %17, i8* %19, align 1, !dbg !87
  %20 = load %struct.NthToggle** %1, align 8, !dbg !89
  %21 = getelementptr inbounds %struct.NthToggle* %20, i32 0, i32 4, !dbg !89
  store i32 0, i32* %21, align 4, !dbg !89
  br label %22, !dbg !90

; <label>:22                                      ; preds = %10, %0
  %23 = load %struct.NthToggle** %1, align 8, !dbg !91
  ret %struct.NthToggle* %23, !dbg !91
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #0 {
  %1 = alloca %struct.NthToggle*, align 8
  %2 = alloca i32, align 4
  store %struct.NthToggle* %this, %struct.NthToggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %1}, metadata !92), !dbg !93
  store i32 %max_count, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !94), !dbg !93
  %3 = load i32* %2, align 4, !dbg !95
  %4 = load %struct.NthToggle** %1, align 8, !dbg !95
  %5 = getelementptr inbounds %struct.NthToggle* %4, i32 0, i32 3, !dbg !95
  store i32 %3, i32* %5, align 4, !dbg !95
  %6 = load %struct.NthToggle** %1, align 8, !dbg !96
  %7 = getelementptr inbounds %struct.NthToggle* %6, i32 0, i32 4, !dbg !96
  store i32 0, i32* %7, align 4, !dbg !96
  %8 = load %struct.NthToggle** %1, align 8, !dbg !97
  %9 = getelementptr inbounds %struct.NthToggle* %8, i32 0, i32 2, !dbg !97
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %9, align 8, !dbg !97
  %10 = load %struct.NthToggle** %1, align 8, !dbg !98
  ret %struct.NthToggle* %10, !dbg !98
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %this = alloca %struct.NthToggle*, align 8
  store i8 %start_state, i8* %1, align 1
  call void @llvm.dbg.declare(metadata !{i8* %1}, metadata !99), !dbg !100
  store i32 %max_count, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !101), !dbg !100
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %this}, metadata !102), !dbg !103
  %3 = call noalias i8* @malloc(i64 32) #5, !dbg !103
  %4 = bitcast i8* %3 to %struct.NthToggle*, !dbg !103
  store %struct.NthToggle* %4, %struct.NthToggle** %this, align 8, !dbg !103
  %5 = load %struct.NthToggle** %this, align 8, !dbg !104
  %6 = bitcast %struct.NthToggle* %5 to %struct.Toggle*, !dbg !104
  %7 = load i8* %1, align 1, !dbg !104
  %8 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %6, i8 signext %7), !dbg !104
  %9 = bitcast %struct.Toggle* %8 to %struct.NthToggle*, !dbg !104
  store %struct.NthToggle* %9, %struct.NthToggle** %this, align 8, !dbg !104
  %10 = load %struct.NthToggle** %this, align 8, !dbg !105
  %11 = load i32* %2, align 4, !dbg !105
  %12 = call %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %10, i32 %11), !dbg !105
  ret %struct.NthToggle* %12, !dbg !105
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %tog = alloca %struct.Toggle*, align 8
  %ntog = alloca %struct.NthToggle*, align 8
  %val = alloca i8, align 1
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !106), !dbg !107
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !108), !dbg !107
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !109), !dbg !110
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !111), !dbg !110
  %4 = load i32* %2, align 4, !dbg !110
  %5 = icmp eq i32 %4, 2, !dbg !110
  br i1 %5, label %6, label %11, !dbg !110

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !110
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !110
  %9 = load i8** %8, align 8, !dbg !110
  %10 = call i32 @atoi(i8* %9) #6, !dbg !110
  br label %12, !dbg !110

; <label>:11                                      ; preds = %0
  br label %12, !dbg !110

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 500000000, %11 ], !dbg !110
  store i32 %13, i32* %n, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %tog}, metadata !112), !dbg !113
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %ntog}, metadata !114), !dbg !115
  call void @llvm.dbg.declare(metadata !{i8* %val}, metadata !116), !dbg !117
  store i8 1, i8* %val, align 1, !dbg !117
  %14 = call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !118
  store %struct.Toggle* %14, %struct.Toggle** %tog, align 8, !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %15, !dbg !119

; <label>:15                                      ; preds = %30, %12
  %16 = load i32* %i, align 4, !dbg !119
  %17 = load i32* %n, align 4, !dbg !119
  %18 = icmp slt i32 %16, %17, !dbg !119
  br i1 %18, label %19, label %33, !dbg !119

; <label>:19                                      ; preds = %15
  %20 = load %struct.Toggle** %tog, align 8, !dbg !121
  %21 = getelementptr inbounds %struct.Toggle* %20, i32 0, i32 2, !dbg !121
  %22 = load %struct.Toggle* (%struct.Toggle*)** %21, align 8, !dbg !121
  %23 = load %struct.Toggle** %tog, align 8, !dbg !121
  %24 = call %struct.Toggle* %22(%struct.Toggle* %23), !dbg !121
  %25 = getelementptr inbounds %struct.Toggle* %24, i32 0, i32 1, !dbg !121
  %26 = bitcast {}** %25 to i8 (%struct.Toggle*)**, !dbg !121
  %27 = load i8 (%struct.Toggle*)** %26, align 8, !dbg !121
  %28 = load %struct.Toggle** %tog, align 8, !dbg !121
  %29 = call signext i8 %27(%struct.Toggle* %28), !dbg !121
  store i8 %29, i8* %val, align 1, !dbg !121
  br label %30, !dbg !123

; <label>:30                                      ; preds = %19
  %31 = load i32* %i, align 4, !dbg !119
  %32 = add nsw i32 %31, 1, !dbg !119
  store i32 %32, i32* %i, align 4, !dbg !119
  br label %15, !dbg !119

; <label>:33                                      ; preds = %15
  %34 = load i8* %val, align 1, !dbg !124
  %35 = sext i8 %34 to i32, !dbg !124
  %36 = icmp ne i32 %35, 0, !dbg !124
  %37 = select i1 %36, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), !dbg !124
  %38 = call i32 @puts(i8* %37), !dbg !124
  %39 = load %struct.Toggle** %tog, align 8, !dbg !125
  %40 = bitcast %struct.Toggle* %39 to i8*, !dbg !125
  call void @free(i8* %40) #5, !dbg !125
  store i8 1, i8* %val, align 1, !dbg !126
  %41 = load i8* %val, align 1, !dbg !127
  %42 = call %struct.NthToggle* @new_NthToggle(i8 signext %41, i32 3), !dbg !127
  store %struct.NthToggle* %42, %struct.NthToggle** %ntog, align 8, !dbg !127
  store i32 0, i32* %i, align 4, !dbg !128
  br label %43, !dbg !128

; <label>:43                                      ; preds = %60, %33
  %44 = load i32* %i, align 4, !dbg !128
  %45 = load i32* %n, align 4, !dbg !128
  %46 = icmp slt i32 %44, %45, !dbg !128
  br i1 %46, label %47, label %63, !dbg !128

; <label>:47                                      ; preds = %43
  %48 = load %struct.NthToggle** %ntog, align 8, !dbg !130
  %49 = getelementptr inbounds %struct.NthToggle* %48, i32 0, i32 2, !dbg !130
  %50 = load %struct.Toggle* (%struct.Toggle*)** %49, align 8, !dbg !130
  %51 = load %struct.NthToggle** %ntog, align 8, !dbg !130
  %52 = bitcast %struct.NthToggle* %51 to %struct.Toggle*, !dbg !130
  %53 = call %struct.Toggle* %50(%struct.Toggle* %52), !dbg !130
  %54 = getelementptr inbounds %struct.Toggle* %53, i32 0, i32 1, !dbg !130
  %55 = bitcast {}** %54 to i8 (%struct.Toggle*)**, !dbg !130
  %56 = load i8 (%struct.Toggle*)** %55, align 8, !dbg !130
  %57 = load %struct.NthToggle** %ntog, align 8, !dbg !130
  %58 = bitcast %struct.NthToggle* %57 to %struct.Toggle*, !dbg !130
  %59 = call signext i8 %56(%struct.Toggle* %58), !dbg !130
  store i8 %59, i8* %val, align 1, !dbg !130
  br label %60, !dbg !132

; <label>:60                                      ; preds = %47
  %61 = load i32* %i, align 4, !dbg !128
  %62 = add nsw i32 %61, 1, !dbg !128
  store i32 %62, i32* %i, align 4, !dbg !128
  br label %43, !dbg !128

; <label>:63                                      ; preds = %43
  %64 = load i8* %val, align 1, !dbg !133
  %65 = sext i8 %64 to i32, !dbg !133
  %66 = icmp ne i32 %65, 0, !dbg !133
  %67 = select i1 %66, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), !dbg !133
  %68 = call i32 @puts(i8* %67), !dbg !133
  %69 = load %struct.NthToggle** %ntog, align 8, !dbg !134
  %70 = bitcast %struct.NthToggle* %69 to i8*, !dbg !134
  call void @free(i8* %70) #5, !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @puts(i8*) #4

; Function Attrs: nounwind
declare void @free(i8*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!61, !62}
!llvm.ident = !{!63}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c] [DW_LANG_C99]
!1 = metadata !{metadata !"methcall.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"false", i64 0} ; [ DW_TAG_enumerator ] [false :: 0]
!6 = metadata !{i32 786472, metadata !"true", i64 1} ; [ DW_TAG_enumerator ] [true :: 1]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !28, metadata !31, metadata !34, metadata !37, metadata !50, metadata !53, metadata !56}
!9 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"toggle_value", metadata !"toggle_value", metadata !"", i32 23, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8 (%struct.Toggle*)* @toggle_value, null, null, metadata !7, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
!10 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13, metadata !14}
!13 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Toggle]
!15 = metadata !{i32 786454, metadata !1, null, metadata !"Toggle", i32 21, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [Toggle] [line 21, size 0, align 0, offset 0] [from Toggle]
!16 = metadata !{i32 786451, metadata !1, null, metadata !"Toggle", i32 19, i64 192, i64 64, i32 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Toggle] [line 19, size 192, align 64, offset 0] [def] [from ]
!17 = metadata !{metadata !18, metadata !19, metadata !24}
!18 = metadata !{i32 786445, metadata !1, metadata !16, metadata !"state", i32 20, i64 8, i64 8, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [state] [line 20, size 8, align 8, offset 0] [from char]
!19 = metadata !{i32 786445, metadata !1, metadata !16, metadata !"value", i32 20, i64 64, i64 64, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [value] [line 20, size 64, align 64, offset 64] [from ]
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !13, metadata !23}
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Toggle]
!24 = metadata !{i32 786445, metadata !1, metadata !16, metadata !"activate", i32 20, i64 64, i64 64, i64 128, i32 0, metadata !25} ; [ DW_TAG_member ] [activate] [line 20, size 64, align 64, offset 128] [from ]
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !23, metadata !23}
!28 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"toggle_activate", metadata !"toggle_activate", metadata !"", i32 26, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.Toggle* (%struct.Toggle*)* @toggle_activate, null, null, metadata !7, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [toggle_activate]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !14, metadata !14}
!31 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"init_Toggle", metadata !"init_Toggle", metadata !"", i32 30, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.Toggle* (%struct.Toggle*, i8)* @init_Toggle, null, null, metadata !7, i32 30} ; [ DW_TAG_subprogram ] [line 30] [def] [init_Toggle]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !14, metadata !14, metadata !13}
!34 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"new_Toggle", metadata !"new_Toggle", metadata !"", i32 36, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.Toggle* (i8)* @new_Toggle, null, null, metadata !7, i32 36} ; [ DW_TAG_subprogram ] [line 36] [def] [new_Toggle]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !14, metadata !13}
!37 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"nth_toggle_activate", metadata !"nth_toggle_activate", metadata !"", i32 48, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, metadata !7, i32 48} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !40, metadata !40}
!40 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from NthToggle]
!41 = metadata !{i32 786454, metadata !1, null, metadata !"NthToggle", i32 46, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [NthToggle] [line 46, size 0, align 0, offset 0] [from NthToggle]
!42 = metadata !{i32 786451, metadata !1, null, metadata !"NthToggle", i32 42, i64 256, i64 64, i32 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NthToggle] [line 42, size 256, align 64, offset 0] [def] [from ]
!43 = metadata !{metadata !44, metadata !45, metadata !46, metadata !47, metadata !49}
!44 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"state", i32 43, i64 8, i64 8, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [state] [line 43, size 8, align 8, offset 0] [from char]
!45 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"value", i32 43, i64 64, i64 64, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [value] [line 43, size 64, align 64, offset 64] [from ]
!46 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"activate", i32 43, i64 64, i64 64, i64 128, i32 0, metadata !25} ; [ DW_TAG_member ] [activate] [line 43, size 64, align 64, offset 128] [from ]
!47 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"count_max", i32 44, i64 32, i64 32, i64 192, i32 0, metadata !48} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!48 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!49 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"counter", i32 45, i64 32, i64 32, i64 224, i32 0, metadata !48} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!50 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"init_NthToggle", metadata !"init_NthToggle", metadata !"", i32 55, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, metadata !7, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{metadata !40, metadata !40, metadata !48}
!53 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"new_NthToggle", metadata !"new_NthToggle", metadata !"", i32 61, metadata !54, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, metadata !7, i32 61} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!54 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{metadata !40, metadata !13, metadata !48}
!56 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"main", metadata !"main", metadata !"", i32 68, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !7, i32 68} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !48, metadata !48, metadata !59}
!59 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!61 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!62 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!63 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!64 = metadata !{i32 786689, metadata !9, metadata !"this", metadata !10, i32 16777239, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 23]
!65 = metadata !{i32 23, i32 0, metadata !9, null}
!66 = metadata !{i32 24, i32 0, metadata !9, null}
!67 = metadata !{i32 786689, metadata !28, metadata !"this", metadata !10, i32 16777242, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 26]
!68 = metadata !{i32 26, i32 0, metadata !28, null}
!69 = metadata !{i32 27, i32 0, metadata !28, null}
!70 = metadata !{i32 28, i32 0, metadata !28, null}
!71 = metadata !{i32 786689, metadata !31, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 30]
!72 = metadata !{i32 30, i32 0, metadata !31, null}
!73 = metadata !{i32 786689, metadata !31, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!74 = metadata !{i32 31, i32 0, metadata !31, null}
!75 = metadata !{i32 32, i32 0, metadata !31, null}
!76 = metadata !{i32 33, i32 0, metadata !31, null}
!77 = metadata !{i32 34, i32 0, metadata !31, null}
!78 = metadata !{i32 786689, metadata !34, metadata !"start_state", metadata !10, i32 16777252, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!79 = metadata !{i32 36, i32 0, metadata !34, null}
!80 = metadata !{i32 786688, metadata !34, metadata !"this", metadata !10, i32 37, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 37]
!81 = metadata !{i32 37, i32 0, metadata !34, null}
!82 = metadata !{i32 38, i32 0, metadata !34, null}
!83 = metadata !{i32 786689, metadata !37, metadata !"this", metadata !10, i32 16777264, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 48]
!84 = metadata !{i32 48, i32 0, metadata !37, null}
!85 = metadata !{i32 49, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !37, i32 49, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!87 = metadata !{i32 50, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !86, i32 49, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!89 = metadata !{i32 51, i32 0, metadata !88, null}
!90 = metadata !{i32 52, i32 0, metadata !88, null}
!91 = metadata !{i32 53, i32 0, metadata !37, null}
!92 = metadata !{i32 786689, metadata !50, metadata !"this", metadata !10, i32 16777271, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 55]
!93 = metadata !{i32 55, i32 0, metadata !50, null}
!94 = metadata !{i32 786689, metadata !50, metadata !"max_count", metadata !10, i32 33554487, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!95 = metadata !{i32 56, i32 0, metadata !50, null}
!96 = metadata !{i32 57, i32 0, metadata !50, null}
!97 = metadata !{i32 58, i32 0, metadata !50, null} ; [ DW_TAG_imported_module ]
!98 = metadata !{i32 59, i32 0, metadata !50, null}
!99 = metadata !{i32 786689, metadata !53, metadata !"start_state", metadata !10, i32 16777277, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!100 = metadata !{i32 61, i32 0, metadata !53, null}
!101 = metadata !{i32 786689, metadata !53, metadata !"max_count", metadata !10, i32 33554493, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!102 = metadata !{i32 786688, metadata !53, metadata !"this", metadata !10, i32 62, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 62]
!103 = metadata !{i32 62, i32 0, metadata !53, null}
!104 = metadata !{i32 63, i32 0, metadata !53, null}
!105 = metadata !{i32 64, i32 0, metadata !53, null}
!106 = metadata !{i32 786689, metadata !56, metadata !"argc", metadata !10, i32 16777284, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!107 = metadata !{i32 68, i32 0, metadata !56, null}
!108 = metadata !{i32 786689, metadata !56, metadata !"argv", metadata !10, i32 33554500, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!109 = metadata !{i32 786688, metadata !56, metadata !"i", metadata !10, i32 74, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 74]
!110 = metadata !{i32 74, i32 0, metadata !56, null}
!111 = metadata !{i32 786688, metadata !56, metadata !"n", metadata !10, i32 74, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 74]
!112 = metadata !{i32 786688, metadata !56, metadata !"tog", metadata !10, i32 75, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tog] [line 75]
!113 = metadata !{i32 75, i32 0, metadata !56, null}
!114 = metadata !{i32 786688, metadata !56, metadata !"ntog", metadata !10, i32 76, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!115 = metadata !{i32 76, i32 0, metadata !56, null}
!116 = metadata !{i32 786688, metadata !56, metadata !"val", metadata !10, i32 77, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 77]
!117 = metadata !{i32 77, i32 0, metadata !56, null}
!118 = metadata !{i32 79, i32 0, metadata !56, null}
!119 = metadata !{i32 80, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !56, i32 80, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!121 = metadata !{i32 81, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !120, i32 80, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!123 = metadata !{i32 82, i32 0, metadata !122, null}
!124 = metadata !{i32 83, i32 0, metadata !56, null}
!125 = metadata !{i32 84, i32 0, metadata !56, null}
!126 = metadata !{i32 86, i32 0, metadata !56, null}
!127 = metadata !{i32 87, i32 0, metadata !56, null}
!128 = metadata !{i32 88, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !56, i32 88, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!130 = metadata !{i32 89, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !129, i32 88, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!132 = metadata !{i32 90, i32 0, metadata !131, null}
!133 = metadata !{i32 91, i32 0, metadata !56, null}
!134 = metadata !{i32 92, i32 0, metadata !56, null}
!135 = metadata !{i32 93, i32 0, metadata !56, null}
