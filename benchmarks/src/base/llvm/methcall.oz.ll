; ModuleID = 'methcall.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)*, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

; Function Attrs: minsize nounwind optsize readonly uwtable
define signext i8 @toggle_value(%struct.Toggle* nocapture readonly %this) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !29), !dbg !91
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !92
  %2 = load i8* %1, align 1, !dbg !92, !tbaa !93
  ret i8 %2, !dbg !92
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !34), !dbg !98
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !99
  %2 = load i8* %1, align 1, !dbg !99, !tbaa !93
  %3 = icmp eq i8 %2, 0, !dbg !99
  %4 = zext i1 %3 to i8, !dbg !99
  store i8 %4, i8* %1, align 1, !dbg !99, !tbaa !93
  ret %struct.Toggle* %this, !dbg !100
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !39), !dbg !101
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !40), !dbg !101
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !102
  store i8 %start_state, i8* %1, align 1, !dbg !102, !tbaa !93
  %2 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 1, !dbg !103
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %2, align 8, !dbg !103, !tbaa !104
  %3 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 2, !dbg !105
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %3, align 8, !dbg !105, !tbaa !106
  ret %struct.Toggle* %this, !dbg !107
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias %struct.Toggle* @new_Toggle(i8 signext %start_state) #1 {
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !45), !dbg !108
  %1 = tail call noalias i8* @malloc(i64 24) #5, !dbg !109
  %2 = bitcast i8* %1 to %struct.Toggle*, !dbg !109
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %2}, i64 0, metadata !46), !dbg !109
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %2}, i64 0, metadata !110), !dbg !112
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !113), !dbg !112
  store i8 %start_state, i8* %1, align 1, !dbg !114, !tbaa !93
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !115
  %4 = bitcast i8* %3 to {}**, !dbg !115
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %4, align 8, !dbg !115, !tbaa !104
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !116
  %6 = bitcast i8* %5 to %struct.Toggle* (%struct.Toggle*)**, !dbg !116
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %6, align 8, !dbg !116, !tbaa !106
  ret %struct.Toggle* %2, !dbg !111
}

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: minsize nounwind optsize uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %this}, i64 0, metadata !61), !dbg !117
  %1 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 4, !dbg !118
  %2 = load i32* %1, align 4, !dbg !118, !tbaa !120
  %3 = add nsw i32 %2, 1, !dbg !118
  store i32 %3, i32* %1, align 4, !dbg !118, !tbaa !120
  %4 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 3, !dbg !118
  %5 = load i32* %4, align 4, !dbg !118, !tbaa !123
  %6 = icmp slt i32 %3, %5, !dbg !118
  br i1 %6, label %12, label %7, !dbg !118

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, !dbg !124
  %9 = load i8* %8, align 1, !dbg !124, !tbaa !126
  %10 = icmp eq i8 %9, 0, !dbg !124
  %11 = zext i1 %10 to i8, !dbg !124
  store i8 %11, i8* %8, align 1, !dbg !124, !tbaa !126
  store i32 0, i32* %1, align 4, !dbg !127, !tbaa !120
  br label %12, !dbg !128

; <label>:12                                      ; preds = %0, %7
  ret %struct.NthToggle* %this, !dbg !129
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %this}, i64 0, metadata !66), !dbg !130
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !67), !dbg !130
  %1 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 3, !dbg !131
  store i32 %max_count, i32* %1, align 4, !dbg !131, !tbaa !123
  %2 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 4, !dbg !132
  store i32 0, i32* %2, align 4, !dbg !132, !tbaa !120
  %3 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !133
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %3, align 8, !dbg !133, !tbaa !134
  ret %struct.NthToggle* %this, !dbg !135
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #1 {
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !72), !dbg !136
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !73), !dbg !136
  %1 = tail call noalias i8* @malloc(i64 32) #5, !dbg !137
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !138), !dbg !140
  store i8 %start_state, i8* %1, align 1, !dbg !141, !tbaa !93
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !142
  %3 = bitcast i8* %2 to {}**, !dbg !142
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %3, align 8, !dbg !142, !tbaa !104
  %4 = getelementptr inbounds i8* %1, i64 16, !dbg !143
  %5 = bitcast i8* %4 to %struct.Toggle* (%struct.Toggle*)**, !dbg !143
  %6 = bitcast i8* %1 to %struct.NthToggle*, !dbg !139
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %6}, i64 0, metadata !74), !dbg !139
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %6}, i64 0, metadata !144), !dbg !146
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !147), !dbg !146
  %7 = getelementptr inbounds i8* %1, i64 24, !dbg !148
  %8 = bitcast i8* %7 to i32*, !dbg !148
  store i32 %max_count, i32* %8, align 4, !dbg !148, !tbaa !123
  %9 = getelementptr inbounds i8* %1, i64 28, !dbg !149
  %10 = bitcast i8* %9 to i32*, !dbg !149
  store i32 0, i32* %10, align 4, !dbg !149, !tbaa !120
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %5, align 8, !dbg !150, !tbaa !134
  ret %struct.NthToggle* %6, !dbg !145
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !81), !dbg !151
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !82), !dbg !151
  %1 = icmp eq i32 %argc, 2, !dbg !152
  br i1 %1, label %3, label %.thread, !dbg !152

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !84), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !87), !dbg !154
  %2 = tail call %struct.Toggle* @new_Toggle(i8 signext 1) #6, !dbg !155
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %9}, i64 0, metadata !85), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !83), !dbg !157
  br label %.lr.ph5, !dbg !157

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds i8** %argv, i64 1, !dbg !152
  %5 = load i8** %4, align 8, !dbg !152, !tbaa !159
  %6 = tail call i32 @atoi(i8* %5) #7, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !84), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !87), !dbg !154
  %7 = tail call %struct.Toggle* @new_Toggle(i8 signext 1) #6, !dbg !155
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %9}, i64 0, metadata !85), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !83), !dbg !157
  %8 = icmp sgt i32 %6, 0, !dbg !157
  br i1 %8, label %.lr.ph5, label %20, !dbg !157

.lr.ph5:                                          ; preds = %.thread, %3
  %9 = phi %struct.Toggle* [ %2, %.thread ], [ %7, %3 ]
  %10 = phi i32 [ 500000000, %.thread ], [ %6, %3 ]
  %11 = getelementptr inbounds %struct.Toggle* %9, i64 0, i32 2, !dbg !160
  br label %12, !dbg !157

; <label>:12                                      ; preds = %12, %.lr.ph5
  %i.03 = phi i32 [ 0, %.lr.ph5 ], [ %19, %12 ]
  %13 = load %struct.Toggle* (%struct.Toggle*)** %11, align 8, !dbg !160, !tbaa !106
  %14 = tail call %struct.Toggle* %13(%struct.Toggle* %9) #5, !dbg !160
  %15 = getelementptr inbounds %struct.Toggle* %14, i64 0, i32 1, !dbg !160
  %16 = load {}** %15, align 8, !dbg !160
  %17 = bitcast {}* %16 to i8 (%struct.Toggle*)*, !dbg !160
  %18 = tail call signext i8 %17(%struct.Toggle* %9) #5, !dbg !160
  tail call void @llvm.dbg.value(metadata !{i8 %18}, i64 0, metadata !87), !dbg !160
  %19 = add nsw i32 %i.03, 1, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !83), !dbg !157
  %exitcond12 = icmp eq i32 %19, %10, !dbg !157
  br i1 %exitcond12, label %._crit_edge6, label %12, !dbg !157

._crit_edge6:                                     ; preds = %12
  %phitmp = icmp ne i8 %18, 0, !dbg !157
  %phitmp8 = select i1 %phitmp, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), !dbg !157
  br label %20, !dbg !157

; <label>:20                                      ; preds = %._crit_edge6, %3
  %21 = phi i1 [ true, %._crit_edge6 ], [ false, %3 ]
  %22 = phi %struct.Toggle* [ %9, %._crit_edge6 ], [ %7, %3 ]
  %23 = phi i32 [ %10, %._crit_edge6 ], [ %6, %3 ]
  %val.0.lcssa = phi i8* [ %phitmp8, %._crit_edge6 ], [ getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), %3 ]
  %24 = tail call i32 @puts(i8* %val.0.lcssa) #5, !dbg !162
  %25 = getelementptr inbounds %struct.Toggle* %22, i64 0, i32 0, !dbg !163
  tail call void @free(i8* %25) #5, !dbg !163
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !87), !dbg !164
  %26 = tail call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3) #6, !dbg !165
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %26}, i64 0, metadata !86), !dbg !165
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !83), !dbg !166
  br i1 %21, label %.lr.ph, label %37, !dbg !166

.lr.ph:                                           ; preds = %20
  %27 = getelementptr inbounds %struct.NthToggle* %26, i64 0, i32 2, !dbg !168
  %28 = bitcast %struct.NthToggle* %26 to %struct.Toggle*, !dbg !168
  br label %29, !dbg !166

; <label>:29                                      ; preds = %29, %.lr.ph
  %i.12 = phi i32 [ 0, %.lr.ph ], [ %36, %29 ]
  %30 = load %struct.Toggle* (%struct.Toggle*)** %27, align 8, !dbg !168, !tbaa !134
  %31 = tail call %struct.Toggle* %30(%struct.Toggle* %28) #5, !dbg !168
  %32 = getelementptr inbounds %struct.Toggle* %31, i64 0, i32 1, !dbg !168
  %33 = load {}** %32, align 8, !dbg !168
  %34 = bitcast {}* %33 to i8 (%struct.Toggle*)*, !dbg !168
  %35 = tail call signext i8 %34(%struct.Toggle* %28) #5, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i8 %35}, i64 0, metadata !87), !dbg !168
  %36 = add nsw i32 %i.12, 1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !83), !dbg !166
  %exitcond = icmp eq i32 %36, %23, !dbg !166
  br i1 %exitcond, label %._crit_edge, label %29, !dbg !166

._crit_edge:                                      ; preds = %29
  %phitmp9 = icmp ne i8 %35, 0, !dbg !166
  %phitmp10 = select i1 %phitmp9, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), !dbg !166
  br label %37, !dbg !166

; <label>:37                                      ; preds = %._crit_edge, %20
  %val.1.lcssa = phi i8* [ %phitmp10, %._crit_edge ], [ getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), %20 ]
  %38 = tail call i32 @puts(i8* %val.1.lcssa) #5, !dbg !170
  %39 = getelementptr inbounds %struct.NthToggle* %26, i64 0, i32 0, !dbg !171
  tail call void @free(i8* %39) #5, !dbg !171
  ret i32 0, !dbg !172
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #3

; Function Attrs: minsize nounwind optsize
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { minsize nounwind optsize }
attributes #6 = { minsize optsize }
attributes #7 = { minsize nounwind optsize readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!88, !89}
!llvm.ident = !{!90}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c] [DW_LANG_C99]
!1 = metadata !{metadata !"methcall.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"false", i64 0} ; [ DW_TAG_enumerator ] [false :: 0]
!6 = metadata !{i32 786472, metadata !"true", i64 1} ; [ DW_TAG_enumerator ] [true :: 1]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !30, metadata !35, metadata !41, metadata !47, metadata !62, metadata !68, metadata !75}
!9 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"toggle_value", metadata !"toggle_value", metadata !"", i32 23, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8 (%struct.Toggle*)* @toggle_value, null, null, metadata !28, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
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
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786689, metadata !9, metadata !"this", metadata !10, i32 16777239, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 23]
!30 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"toggle_activate", metadata !"toggle_activate", metadata !"", i32 26, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Toggle* (%struct.Toggle*)* @toggle_activate, null, null, metadata !33, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [toggle_activate]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !14, metadata !14}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786689, metadata !30, metadata !"this", metadata !10, i32 16777242, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 26]
!35 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"init_Toggle", metadata !"init_Toggle", metadata !"", i32 30, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Toggle* (%struct.Toggle*, i8)* @init_Toggle, null, null, metadata !38, i32 30} ; [ DW_TAG_subprogram ] [line 30] [def] [init_Toggle]
!36 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{metadata !14, metadata !14, metadata !13}
!38 = metadata !{metadata !39, metadata !40}
!39 = metadata !{i32 786689, metadata !35, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 30]
!40 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!41 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"new_Toggle", metadata !"new_Toggle", metadata !"", i32 36, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Toggle* (i8)* @new_Toggle, null, null, metadata !44, i32 36} ; [ DW_TAG_subprogram ] [line 36] [def] [new_Toggle]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !14, metadata !13}
!44 = metadata !{metadata !45, metadata !46}
!45 = metadata !{i32 786689, metadata !41, metadata !"start_state", metadata !10, i32 16777252, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!46 = metadata !{i32 786688, metadata !41, metadata !"this", metadata !10, i32 37, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 37]
!47 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"nth_toggle_activate", metadata !"nth_toggle_activate", metadata !"", i32 48, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, metadata !60, i32 48} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !50, metadata !50}
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from NthToggle]
!51 = metadata !{i32 786454, metadata !1, null, metadata !"NthToggle", i32 46, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [NthToggle] [line 46, size 0, align 0, offset 0] [from NthToggle]
!52 = metadata !{i32 786451, metadata !1, null, metadata !"NthToggle", i32 42, i64 256, i64 64, i32 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NthToggle] [line 42, size 256, align 64, offset 0] [def] [from ]
!53 = metadata !{metadata !54, metadata !55, metadata !56, metadata !57, metadata !59}
!54 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"state", i32 43, i64 8, i64 8, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [state] [line 43, size 8, align 8, offset 0] [from char]
!55 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"value", i32 43, i64 64, i64 64, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [value] [line 43, size 64, align 64, offset 64] [from ]
!56 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"activate", i32 43, i64 64, i64 64, i64 128, i32 0, metadata !25} ; [ DW_TAG_member ] [activate] [line 43, size 64, align 64, offset 128] [from ]
!57 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"count_max", i32 44, i64 32, i64 32, i64 192, i32 0, metadata !58} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!58 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!59 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"counter", i32 45, i64 32, i64 32, i64 224, i32 0, metadata !58} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786689, metadata !47, metadata !"this", metadata !10, i32 16777264, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 48]
!62 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"init_NthToggle", metadata !"init_NthToggle", metadata !"", i32 55, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, metadata !65, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !50, metadata !50, metadata !58}
!65 = metadata !{metadata !66, metadata !67}
!66 = metadata !{i32 786689, metadata !62, metadata !"this", metadata !10, i32 16777271, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 55]
!67 = metadata !{i32 786689, metadata !62, metadata !"max_count", metadata !10, i32 33554487, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!68 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"new_NthToggle", metadata !"new_NthToggle", metadata !"", i32 61, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, metadata !71, i32 61} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!69 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{metadata !50, metadata !13, metadata !58}
!71 = metadata !{metadata !72, metadata !73, metadata !74}
!72 = metadata !{i32 786689, metadata !68, metadata !"start_state", metadata !10, i32 16777277, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!73 = metadata !{i32 786689, metadata !68, metadata !"max_count", metadata !10, i32 33554493, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!74 = metadata !{i32 786688, metadata !68, metadata !"this", metadata !10, i32 62, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 62]
!75 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"main", metadata !"main", metadata !"", i32 68, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !80, i32 68} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!76 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = metadata !{metadata !58, metadata !58, metadata !78}
!78 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!79 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!80 = metadata !{metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !86, metadata !87}
!81 = metadata !{i32 786689, metadata !75, metadata !"argc", metadata !10, i32 16777284, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!82 = metadata !{i32 786689, metadata !75, metadata !"argv", metadata !10, i32 33554500, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!83 = metadata !{i32 786688, metadata !75, metadata !"i", metadata !10, i32 74, metadata !58, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 74]
!84 = metadata !{i32 786688, metadata !75, metadata !"n", metadata !10, i32 74, metadata !58, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 74]
!85 = metadata !{i32 786688, metadata !75, metadata !"tog", metadata !10, i32 75, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tog] [line 75]
!86 = metadata !{i32 786688, metadata !75, metadata !"ntog", metadata !10, i32 76, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!87 = metadata !{i32 786688, metadata !75, metadata !"val", metadata !10, i32 77, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 77]
!88 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!89 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!90 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!91 = metadata !{i32 23, i32 0, metadata !9, null}
!92 = metadata !{i32 24, i32 0, metadata !9, null}
!93 = metadata !{metadata !94, metadata !95, i64 0}
!94 = metadata !{metadata !"Toggle", metadata !95, i64 0, metadata !97, i64 8, metadata !97, i64 16}
!95 = metadata !{metadata !"omnipotent char", metadata !96, i64 0}
!96 = metadata !{metadata !"Simple C/C++ TBAA"}
!97 = metadata !{metadata !"any pointer", metadata !95, i64 0}
!98 = metadata !{i32 26, i32 0, metadata !30, null}
!99 = metadata !{i32 27, i32 0, metadata !30, null}
!100 = metadata !{i32 28, i32 0, metadata !30, null}
!101 = metadata !{i32 30, i32 0, metadata !35, null}
!102 = metadata !{i32 31, i32 0, metadata !35, null}
!103 = metadata !{i32 32, i32 0, metadata !35, null}
!104 = metadata !{metadata !94, metadata !97, i64 8}
!105 = metadata !{i32 33, i32 0, metadata !35, null}
!106 = metadata !{metadata !94, metadata !97, i64 16}
!107 = metadata !{i32 34, i32 0, metadata !35, null}
!108 = metadata !{i32 36, i32 0, metadata !41, null}
!109 = metadata !{i32 37, i32 0, metadata !41, null}
!110 = metadata !{i32 786689, metadata !35, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, metadata !111} ; [ DW_TAG_arg_variable ] [this] [line 30]
!111 = metadata !{i32 38, i32 0, metadata !41, null}
!112 = metadata !{i32 30, i32 0, metadata !35, metadata !111}
!113 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !111} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!114 = metadata !{i32 31, i32 0, metadata !35, metadata !111}
!115 = metadata !{i32 32, i32 0, metadata !35, metadata !111}
!116 = metadata !{i32 33, i32 0, metadata !35, metadata !111}
!117 = metadata !{i32 48, i32 0, metadata !47, null}
!118 = metadata !{i32 49, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !47, i32 49, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!120 = metadata !{metadata !121, metadata !122, i64 28}
!121 = metadata !{metadata !"NthToggle", metadata !95, i64 0, metadata !97, i64 8, metadata !97, i64 16, metadata !122, i64 24, metadata !122, i64 28}
!122 = metadata !{metadata !"int", metadata !95, i64 0}
!123 = metadata !{metadata !121, metadata !122, i64 24}
!124 = metadata !{i32 50, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !119, i32 49, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!126 = metadata !{metadata !121, metadata !95, i64 0}
!127 = metadata !{i32 51, i32 0, metadata !125, null}
!128 = metadata !{i32 52, i32 0, metadata !125, null}
!129 = metadata !{i32 53, i32 0, metadata !47, null}
!130 = metadata !{i32 55, i32 0, metadata !62, null}
!131 = metadata !{i32 56, i32 0, metadata !62, null}
!132 = metadata !{i32 57, i32 0, metadata !62, null}
!133 = metadata !{i32 58, i32 0, metadata !62, null} ; [ DW_TAG_imported_module ]
!134 = metadata !{metadata !121, metadata !97, i64 16}
!135 = metadata !{i32 59, i32 0, metadata !62, null}
!136 = metadata !{i32 61, i32 0, metadata !68, null}
!137 = metadata !{i32 62, i32 0, metadata !68, null}
!138 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!139 = metadata !{i32 63, i32 0, metadata !68, null}
!140 = metadata !{i32 30, i32 0, metadata !35, metadata !139}
!141 = metadata !{i32 31, i32 0, metadata !35, metadata !139}
!142 = metadata !{i32 32, i32 0, metadata !35, metadata !139}
!143 = metadata !{i32 33, i32 0, metadata !35, metadata !139}
!144 = metadata !{i32 786689, metadata !62, metadata !"this", metadata !10, i32 16777271, metadata !50, i32 0, metadata !145} ; [ DW_TAG_arg_variable ] [this] [line 55]
!145 = metadata !{i32 64, i32 0, metadata !68, null}
!146 = metadata !{i32 55, i32 0, metadata !62, metadata !145}
!147 = metadata !{i32 786689, metadata !62, metadata !"max_count", metadata !10, i32 33554487, metadata !58, i32 0, metadata !145} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!148 = metadata !{i32 56, i32 0, metadata !62, metadata !145}
!149 = metadata !{i32 57, i32 0, metadata !62, metadata !145}
!150 = metadata !{i32 58, i32 0, metadata !62, metadata !145} ; [ DW_TAG_imported_module ]
!151 = metadata !{i32 68, i32 0, metadata !75, null}
!152 = metadata !{i32 74, i32 0, metadata !75, null}
!153 = metadata !{i8 1}
!154 = metadata !{i32 77, i32 0, metadata !75, null}
!155 = metadata !{i32 79, i32 0, metadata !75, null}
!156 = metadata !{i32 0}
!157 = metadata !{i32 80, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !75, i32 80, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!159 = metadata !{metadata !97, metadata !97, i64 0}
!160 = metadata !{i32 81, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !158, i32 80, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!162 = metadata !{i32 83, i32 0, metadata !75, null}
!163 = metadata !{i32 84, i32 0, metadata !75, null}
!164 = metadata !{i32 86, i32 0, metadata !75, null}
!165 = metadata !{i32 87, i32 0, metadata !75, null}
!166 = metadata !{i32 88, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !75, i32 88, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!168 = metadata !{i32 89, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !167, i32 88, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/methcall.c]
!170 = metadata !{i32 91, i32 0, metadata !75, null}
!171 = metadata !{i32 92, i32 0, metadata !75, null}
!172 = metadata !{i32 93, i32 0, metadata !75, null}
