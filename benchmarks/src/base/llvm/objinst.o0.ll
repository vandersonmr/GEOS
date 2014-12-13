; ModuleID = 'objinst.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { %struct.Toggle, i32, i32 }

@.str = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define signext i8 @toggle_value(%struct.Toggle* %this) #0 {
  %1 = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %1}, metadata !62), !dbg !63
  %2 = load %struct.Toggle** %1, align 8, !dbg !64
  %3 = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 0, !dbg !64
  %4 = load i8* %3, align 1, !dbg !64
  ret i8 %4, !dbg !64
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #0 {
  %1 = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %1}, metadata !65), !dbg !66
  %2 = load %struct.Toggle** %1, align 8, !dbg !67
  %3 = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 0, !dbg !67
  %4 = load i8* %3, align 1, !dbg !67
  %5 = icmp ne i8 %4, 0, !dbg !67
  %6 = xor i1 %5, true, !dbg !67
  %7 = zext i1 %6 to i32, !dbg !67
  %8 = trunc i32 %7 to i8, !dbg !67
  %9 = load %struct.Toggle** %1, align 8, !dbg !67
  %10 = getelementptr inbounds %struct.Toggle* %9, i32 0, i32 0, !dbg !67
  store i8 %8, i8* %10, align 1, !dbg !67
  %11 = load %struct.Toggle** %1, align 8, !dbg !68
  ret %struct.Toggle* %11, !dbg !68
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #0 {
  %1 = alloca %struct.Toggle*, align 8
  %2 = alloca i8, align 1
  store %struct.Toggle* %this, %struct.Toggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %1}, metadata !69), !dbg !70
  store i8 %start_state, i8* %2, align 1
  call void @llvm.dbg.declare(metadata !{i8* %2}, metadata !71), !dbg !70
  %3 = load i8* %2, align 1, !dbg !72
  %4 = load %struct.Toggle** %1, align 8, !dbg !72
  %5 = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 0, !dbg !72
  store i8 %3, i8* %5, align 1, !dbg !72
  %6 = load %struct.Toggle** %1, align 8, !dbg !73
  %7 = getelementptr inbounds %struct.Toggle* %6, i32 0, i32 1, !dbg !73
  %8 = bitcast {}** %7 to i8 (%struct.Toggle*)**, !dbg !73
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %8, align 8, !dbg !73
  %9 = load %struct.Toggle** %1, align 8, !dbg !74
  %10 = getelementptr inbounds %struct.Toggle* %9, i32 0, i32 2, !dbg !74
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %10, align 8, !dbg !74
  %11 = load %struct.Toggle** %1, align 8, !dbg !75
  ret %struct.Toggle* %11, !dbg !75
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @new_Toggle(i8 signext %start_state) #0 {
  %1 = alloca i8, align 1
  %this = alloca %struct.Toggle*, align 8
  store i8 %start_state, i8* %1, align 1
  call void @llvm.dbg.declare(metadata !{i8* %1}, metadata !76), !dbg !77
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %this}, metadata !78), !dbg !79
  %2 = call noalias i8* @malloc(i64 24) #5, !dbg !79
  %3 = bitcast i8* %2 to %struct.Toggle*, !dbg !79
  store %struct.Toggle* %3, %struct.Toggle** %this, align 8, !dbg !79
  %4 = load %struct.Toggle** %this, align 8, !dbg !80
  %5 = load i8* %1, align 1, !dbg !80
  %6 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %4, i8 signext %5), !dbg !80
  ret %struct.Toggle* %6, !dbg !80
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #0 {
  %1 = alloca %struct.NthToggle*, align 8
  store %struct.NthToggle* %this, %struct.NthToggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %1}, metadata !81), !dbg !82
  %2 = load %struct.NthToggle** %1, align 8, !dbg !83
  %3 = getelementptr inbounds %struct.NthToggle* %2, i32 0, i32 2, !dbg !83
  %4 = load i32* %3, align 4, !dbg !83
  %5 = add nsw i32 %4, 1, !dbg !83
  store i32 %5, i32* %3, align 4, !dbg !83
  %6 = load %struct.NthToggle** %1, align 8, !dbg !83
  %7 = getelementptr inbounds %struct.NthToggle* %6, i32 0, i32 1, !dbg !83
  %8 = load i32* %7, align 4, !dbg !83
  %9 = icmp sge i32 %5, %8, !dbg !83
  br i1 %9, label %10, label %24, !dbg !83

; <label>:10                                      ; preds = %0
  %11 = load %struct.NthToggle** %1, align 8, !dbg !85
  %12 = getelementptr inbounds %struct.NthToggle* %11, i32 0, i32 0, !dbg !85
  %13 = getelementptr inbounds %struct.Toggle* %12, i32 0, i32 0, !dbg !85
  %14 = load i8* %13, align 1, !dbg !85
  %15 = icmp ne i8 %14, 0, !dbg !85
  %16 = xor i1 %15, true, !dbg !85
  %17 = zext i1 %16 to i32, !dbg !85
  %18 = trunc i32 %17 to i8, !dbg !85
  %19 = load %struct.NthToggle** %1, align 8, !dbg !85
  %20 = getelementptr inbounds %struct.NthToggle* %19, i32 0, i32 0, !dbg !85
  %21 = getelementptr inbounds %struct.Toggle* %20, i32 0, i32 0, !dbg !85
  store i8 %18, i8* %21, align 1, !dbg !85
  %22 = load %struct.NthToggle** %1, align 8, !dbg !87
  %23 = getelementptr inbounds %struct.NthToggle* %22, i32 0, i32 2, !dbg !87
  store i32 0, i32* %23, align 4, !dbg !87
  br label %24, !dbg !88

; <label>:24                                      ; preds = %10, %0
  %25 = load %struct.NthToggle** %1, align 8, !dbg !89
  ret %struct.NthToggle* %25, !dbg !89
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #0 {
  %1 = alloca %struct.NthToggle*, align 8
  %2 = alloca i32, align 4
  store %struct.NthToggle* %this, %struct.NthToggle** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %1}, metadata !90), !dbg !91
  store i32 %max_count, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !92), !dbg !91
  %3 = load i32* %2, align 4, !dbg !93
  %4 = load %struct.NthToggle** %1, align 8, !dbg !93
  %5 = getelementptr inbounds %struct.NthToggle* %4, i32 0, i32 1, !dbg !93
  store i32 %3, i32* %5, align 4, !dbg !93
  %6 = load %struct.NthToggle** %1, align 8, !dbg !94
  %7 = getelementptr inbounds %struct.NthToggle* %6, i32 0, i32 2, !dbg !94
  store i32 0, i32* %7, align 4, !dbg !94
  %8 = load %struct.NthToggle** %1, align 8, !dbg !95
  %9 = getelementptr inbounds %struct.NthToggle* %8, i32 0, i32 0, !dbg !95
  %10 = getelementptr inbounds %struct.Toggle* %9, i32 0, i32 2, !dbg !95
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %10, align 8, !dbg !95
  %11 = load %struct.NthToggle** %1, align 8, !dbg !96
  ret %struct.NthToggle* %11, !dbg !96
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %this = alloca %struct.NthToggle*, align 8
  store i8 %start_state, i8* %1, align 1
  call void @llvm.dbg.declare(metadata !{i8* %1}, metadata !97), !dbg !98
  store i32 %max_count, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !99), !dbg !98
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %this}, metadata !100), !dbg !101
  %3 = call noalias i8* @malloc(i64 32) #5, !dbg !101
  %4 = bitcast i8* %3 to %struct.NthToggle*, !dbg !101
  store %struct.NthToggle* %4, %struct.NthToggle** %this, align 8, !dbg !101
  %5 = load %struct.NthToggle** %this, align 8, !dbg !102
  %6 = bitcast %struct.NthToggle* %5 to %struct.Toggle*, !dbg !102
  %7 = load i8* %1, align 1, !dbg !102
  %8 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %6, i8 signext %7), !dbg !102
  %9 = bitcast %struct.Toggle* %8 to %struct.NthToggle*, !dbg !102
  store %struct.NthToggle* %9, %struct.NthToggle** %this, align 8, !dbg !102
  %10 = load %struct.NthToggle** %this, align 8, !dbg !103
  %11 = load i32* %2, align 4, !dbg !103
  %12 = call %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %10, i32 %11), !dbg !103
  ret %struct.NthToggle* %12, !dbg !103
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
  %Msg = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !104), !dbg !105
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !106), !dbg !105
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !107), !dbg !108
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !109), !dbg !108
  %4 = load i32* %2, align 4, !dbg !108
  %5 = icmp eq i32 %4, 2, !dbg !108
  br i1 %5, label %6, label %11, !dbg !108

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !108
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !108
  %9 = load i8** %8, align 8, !dbg !108
  %10 = call i32 @atoi(i8* %9) #6, !dbg !108
  br label %12, !dbg !108

; <label>:11                                      ; preds = %0
  br label %12, !dbg !108

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 70000000, %11 ], !dbg !108
  store i32 %13, i32* %n, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata !{%struct.Toggle** %tog}, metadata !110), !dbg !111
  call void @llvm.dbg.declare(metadata !{%struct.NthToggle** %ntog}, metadata !112), !dbg !113
  %14 = call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !114
  store %struct.Toggle* %14, %struct.Toggle** %tog, align 8, !dbg !114
  store i32 0, i32* %i, align 4, !dbg !115
  br label %15, !dbg !115

; <label>:15                                      ; preds = %33, %12
  %16 = load i32* %i, align 4, !dbg !115
  %17 = icmp slt i32 %16, 5, !dbg !115
  br i1 %17, label %18, label %36, !dbg !115

; <label>:18                                      ; preds = %15
  %19 = load %struct.Toggle** %tog, align 8, !dbg !117
  %20 = getelementptr inbounds %struct.Toggle* %19, i32 0, i32 2, !dbg !117
  %21 = load %struct.Toggle* (%struct.Toggle*)** %20, align 8, !dbg !117
  %22 = load %struct.Toggle** %tog, align 8, !dbg !117
  %23 = call %struct.Toggle* %21(%struct.Toggle* %22), !dbg !117
  %24 = getelementptr inbounds %struct.Toggle* %23, i32 0, i32 1, !dbg !117
  %25 = bitcast {}** %24 to i8 (%struct.Toggle*)**, !dbg !117
  %26 = load i8 (%struct.Toggle*)** %25, align 8, !dbg !117
  %27 = load %struct.Toggle** %tog, align 8, !dbg !117
  %28 = call signext i8 %26(%struct.Toggle* %27), !dbg !117
  %29 = sext i8 %28 to i32, !dbg !117
  %30 = icmp ne i32 %29, 0, !dbg !117
  %31 = select i1 %30, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), !dbg !117
  %32 = call i32 @puts(i8* %31), !dbg !117
  br label %33, !dbg !119

; <label>:33                                      ; preds = %18
  %34 = load i32* %i, align 4, !dbg !115
  %35 = add nsw i32 %34, 1, !dbg !115
  store i32 %35, i32* %i, align 4, !dbg !115
  br label %15, !dbg !115

; <label>:36                                      ; preds = %15
  %37 = load %struct.Toggle** %tog, align 8, !dbg !120
  %38 = bitcast %struct.Toggle* %37 to i8*, !dbg !120
  call void @free(i8* %38) #5, !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %39, !dbg !121

; <label>:39                                      ; preds = %47, %36
  %40 = load i32* %i, align 4, !dbg !121
  %41 = load i32* %n, align 4, !dbg !121
  %42 = icmp slt i32 %40, %41, !dbg !121
  br i1 %42, label %43, label %50, !dbg !121

; <label>:43                                      ; preds = %39
  %44 = call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !123
  store %struct.Toggle* %44, %struct.Toggle** %tog, align 8, !dbg !123
  %45 = load %struct.Toggle** %tog, align 8, !dbg !125
  %46 = bitcast %struct.Toggle* %45 to i8*, !dbg !125
  call void @free(i8* %46) #5, !dbg !125
  br label %47, !dbg !126

; <label>:47                                      ; preds = %43
  %48 = load i32* %i, align 4, !dbg !121
  %49 = add nsw i32 %48, 1, !dbg !121
  store i32 %49, i32* %i, align 4, !dbg !121
  br label %39, !dbg !121

; <label>:50                                      ; preds = %39
  %51 = call i32 @puts(i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)), !dbg !127
  %52 = call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3), !dbg !128
  store %struct.NthToggle* %52, %struct.NthToggle** %ntog, align 8, !dbg !128
  store i32 0, i32* %i, align 4, !dbg !129
  br label %53, !dbg !129

; <label>:53                                      ; preds = %76, %50
  %54 = load i32* %i, align 4, !dbg !129
  %55 = icmp slt i32 %54, 8, !dbg !129
  br i1 %55, label %56, label %79, !dbg !129

; <label>:56                                      ; preds = %53
  call void @llvm.dbg.declare(metadata !{i8** %Msg}, metadata !131), !dbg !135
  %57 = load %struct.NthToggle** %ntog, align 8, !dbg !136
  %58 = getelementptr inbounds %struct.NthToggle* %57, i32 0, i32 0, !dbg !136
  %59 = getelementptr inbounds %struct.Toggle* %58, i32 0, i32 2, !dbg !136
  %60 = load %struct.Toggle* (%struct.Toggle*)** %59, align 8, !dbg !136
  %61 = load %struct.NthToggle** %ntog, align 8, !dbg !136
  %62 = bitcast %struct.NthToggle* %61 to %struct.Toggle*, !dbg !136
  %63 = call %struct.Toggle* %60(%struct.Toggle* %62), !dbg !136
  %64 = getelementptr inbounds %struct.Toggle* %63, i32 0, i32 1, !dbg !136
  %65 = bitcast {}** %64 to i8 (%struct.Toggle*)**, !dbg !136
  %66 = load i8 (%struct.Toggle*)** %65, align 8, !dbg !136
  %67 = load %struct.NthToggle** %ntog, align 8, !dbg !136
  %68 = bitcast %struct.NthToggle* %67 to %struct.Toggle*, !dbg !136
  %69 = call signext i8 %66(%struct.Toggle* %68), !dbg !136
  %70 = icmp ne i8 %69, 0, !dbg !136
  br i1 %70, label %71, label %72, !dbg !136

; <label>:71                                      ; preds = %56
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** %Msg, align 8, !dbg !138
  br label %73, !dbg !138

; <label>:72                                      ; preds = %56
  store i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8** %Msg, align 8, !dbg !139
  br label %73

; <label>:73                                      ; preds = %72, %71
  %74 = load i8** %Msg, align 8, !dbg !140
  %75 = call i32 @puts(i8* %74), !dbg !140
  br label %76, !dbg !141

; <label>:76                                      ; preds = %73
  %77 = load i32* %i, align 4, !dbg !129
  %78 = add nsw i32 %77, 1, !dbg !129
  store i32 %78, i32* %i, align 4, !dbg !129
  br label %53, !dbg !129

; <label>:79                                      ; preds = %53
  %80 = load %struct.NthToggle** %ntog, align 8, !dbg !142
  %81 = bitcast %struct.NthToggle* %80 to i8*, !dbg !142
  call void @free(i8* %81) #5, !dbg !142
  store i32 0, i32* %i, align 4, !dbg !143
  br label %82, !dbg !143

; <label>:82                                      ; preds = %90, %79
  %83 = load i32* %i, align 4, !dbg !143
  %84 = load i32* %n, align 4, !dbg !143
  %85 = icmp slt i32 %83, %84, !dbg !143
  br i1 %85, label %86, label %93, !dbg !143

; <label>:86                                      ; preds = %82
  %87 = call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3), !dbg !145
  store %struct.NthToggle* %87, %struct.NthToggle** %ntog, align 8, !dbg !145
  %88 = load %struct.NthToggle** %ntog, align 8, !dbg !147
  %89 = bitcast %struct.NthToggle* %88 to i8*, !dbg !147
  call void @free(i8* %89) #5, !dbg !147
  br label %90, !dbg !148

; <label>:90                                      ; preds = %86
  %91 = load i32* %i, align 4, !dbg !143
  %92 = add nsw i32 %91, 1, !dbg !143
  store i32 %92, i32* %i, align 4, !dbg !143
  br label %82, !dbg !143

; <label>:93                                      ; preds = %82
  ret i32 0, !dbg !149
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
!llvm.module.flags = !{!59, !60}
!llvm.ident = !{!61}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c] [DW_LANG_C99]
!1 = metadata !{metadata !"objinst.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"false", i64 0} ; [ DW_TAG_enumerator ] [false :: 0]
!6 = metadata !{i32 786472, metadata !"true", i64 1} ; [ DW_TAG_enumerator ] [true :: 1]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !28, metadata !31, metadata !34, metadata !37, metadata !48, metadata !51, metadata !54}
!9 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"toggle_value", metadata !"toggle_value", metadata !"", i32 23, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8 (%struct.Toggle*)* @toggle_value, null, null, metadata !7, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
!10 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
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
!43 = metadata !{metadata !44, metadata !45, metadata !47}
!44 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"base", i32 43, i64 192, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [base] [line 43, size 192, align 64, offset 0] [from Toggle]
!45 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"count_max", i32 44, i64 32, i64 32, i64 192, i32 0, metadata !46} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!46 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!47 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"counter", i32 45, i64 32, i64 32, i64 224, i32 0, metadata !46} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!48 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"init_NthToggle", metadata !"init_NthToggle", metadata !"", i32 55, metadata !49, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, metadata !7, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!49 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{metadata !40, metadata !40, metadata !46}
!51 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"new_NthToggle", metadata !"new_NthToggle", metadata !"", i32 61, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, metadata !7, i32 61} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{metadata !40, metadata !13, metadata !46}
!54 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"main", metadata !"main", metadata !"", i32 68, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !7, i32 68} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{metadata !46, metadata !46, metadata !57}
!57 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!58 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!59 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!60 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!61 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!62 = metadata !{i32 786689, metadata !9, metadata !"this", metadata !10, i32 16777239, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 23]
!63 = metadata !{i32 23, i32 0, metadata !9, null}
!64 = metadata !{i32 24, i32 0, metadata !9, null}
!65 = metadata !{i32 786689, metadata !28, metadata !"this", metadata !10, i32 16777242, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 26]
!66 = metadata !{i32 26, i32 0, metadata !28, null}
!67 = metadata !{i32 27, i32 0, metadata !28, null}
!68 = metadata !{i32 28, i32 0, metadata !28, null}
!69 = metadata !{i32 786689, metadata !31, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 30]
!70 = metadata !{i32 30, i32 0, metadata !31, null}
!71 = metadata !{i32 786689, metadata !31, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!72 = metadata !{i32 31, i32 0, metadata !31, null}
!73 = metadata !{i32 32, i32 0, metadata !31, null}
!74 = metadata !{i32 33, i32 0, metadata !31, null}
!75 = metadata !{i32 34, i32 0, metadata !31, null}
!76 = metadata !{i32 786689, metadata !34, metadata !"start_state", metadata !10, i32 16777252, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!77 = metadata !{i32 36, i32 0, metadata !34, null}
!78 = metadata !{i32 786688, metadata !34, metadata !"this", metadata !10, i32 37, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 37]
!79 = metadata !{i32 37, i32 0, metadata !34, null}
!80 = metadata !{i32 38, i32 0, metadata !34, null}
!81 = metadata !{i32 786689, metadata !37, metadata !"this", metadata !10, i32 16777264, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 48]
!82 = metadata !{i32 48, i32 0, metadata !37, null}
!83 = metadata !{i32 49, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !37, i32 49, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!85 = metadata !{i32 50, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !84, i32 49, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!87 = metadata !{i32 51, i32 0, metadata !86, null}
!88 = metadata !{i32 52, i32 0, metadata !86, null}
!89 = metadata !{i32 53, i32 0, metadata !37, null}
!90 = metadata !{i32 786689, metadata !48, metadata !"this", metadata !10, i32 16777271, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 55]
!91 = metadata !{i32 55, i32 0, metadata !48, null}
!92 = metadata !{i32 786689, metadata !48, metadata !"max_count", metadata !10, i32 33554487, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!93 = metadata !{i32 56, i32 0, metadata !48, null}
!94 = metadata !{i32 57, i32 0, metadata !48, null}
!95 = metadata !{i32 58, i32 0, metadata !48, null} ; [ DW_TAG_imported_module ]
!96 = metadata !{i32 59, i32 0, metadata !48, null}
!97 = metadata !{i32 786689, metadata !51, metadata !"start_state", metadata !10, i32 16777277, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!98 = metadata !{i32 61, i32 0, metadata !51, null}
!99 = metadata !{i32 786689, metadata !51, metadata !"max_count", metadata !10, i32 33554493, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!100 = metadata !{i32 786688, metadata !51, metadata !"this", metadata !10, i32 62, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 62]
!101 = metadata !{i32 62, i32 0, metadata !51, null}
!102 = metadata !{i32 63, i32 0, metadata !51, null}
!103 = metadata !{i32 64, i32 0, metadata !51, null}
!104 = metadata !{i32 786689, metadata !54, metadata !"argc", metadata !10, i32 16777284, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!105 = metadata !{i32 68, i32 0, metadata !54, null}
!106 = metadata !{i32 786689, metadata !54, metadata !"argv", metadata !10, i32 33554500, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!107 = metadata !{i32 786688, metadata !54, metadata !"i", metadata !10, i32 74, metadata !46, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 74]
!108 = metadata !{i32 74, i32 0, metadata !54, null}
!109 = metadata !{i32 786688, metadata !54, metadata !"n", metadata !10, i32 74, metadata !46, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 74]
!110 = metadata !{i32 786688, metadata !54, metadata !"tog", metadata !10, i32 75, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tog] [line 75]
!111 = metadata !{i32 75, i32 0, metadata !54, null}
!112 = metadata !{i32 786688, metadata !54, metadata !"ntog", metadata !10, i32 76, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!113 = metadata !{i32 76, i32 0, metadata !54, null}
!114 = metadata !{i32 78, i32 0, metadata !54, null}
!115 = metadata !{i32 79, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !54, i32 79, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!117 = metadata !{i32 80, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !116, i32 79, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!119 = metadata !{i32 81, i32 0, metadata !118, null}
!120 = metadata !{i32 82, i32 0, metadata !54, null}
!121 = metadata !{i32 83, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !54, i32 83, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!123 = metadata !{i32 84, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !122, i32 83, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!125 = metadata !{i32 85, i32 0, metadata !124, null}
!126 = metadata !{i32 86, i32 0, metadata !124, null}
!127 = metadata !{i32 88, i32 0, metadata !54, null}
!128 = metadata !{i32 90, i32 0, metadata !54, null}
!129 = metadata !{i32 91, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !54, i32 91, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!131 = metadata !{i32 786688, metadata !132, metadata !"Msg", metadata !10, i32 92, metadata !133, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Msg] [line 92]
!132 = metadata !{i32 786443, metadata !1, metadata !130, i32 91, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!133 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !134} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!134 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!135 = metadata !{i32 92, i32 0, metadata !132, null}
!136 = metadata !{i32 93, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !132, i32 93, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!138 = metadata !{i32 94, i32 0, metadata !137, null}
!139 = metadata !{i32 96, i32 0, metadata !137, null}
!140 = metadata !{i32 97, i32 0, metadata !132, null}
!141 = metadata !{i32 98, i32 0, metadata !132, null}
!142 = metadata !{i32 99, i32 0, metadata !54, null}
!143 = metadata !{i32 100, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !54, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!145 = metadata !{i32 101, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !144, i32 100, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!147 = metadata !{i32 102, i32 0, metadata !146, null}
!148 = metadata !{i32 103, i32 0, metadata !146, null}
!149 = metadata !{i32 104, i32 0, metadata !54, null}
