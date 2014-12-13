; ModuleID = 'objinst.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { %struct.Toggle, i32, i32 }

@.str = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1

; Function Attrs: minsize nounwind optsize readonly uwtable
define signext i8 @toggle_value(%struct.Toggle* nocapture readonly %this) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !29), !dbg !93
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !94
  %2 = load i8* %1, align 1, !dbg !94, !tbaa !95
  ret i8 %2, !dbg !94
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !34), !dbg !100
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !101
  %2 = load i8* %1, align 1, !dbg !101, !tbaa !95
  %3 = icmp eq i8 %2, 0, !dbg !101
  %4 = zext i1 %3 to i8, !dbg !101
  store i8 %4, i8* %1, align 1, !dbg !101, !tbaa !95
  ret %struct.Toggle* %this, !dbg !102
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !39), !dbg !103
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !40), !dbg !103
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !104
  store i8 %start_state, i8* %1, align 1, !dbg !104, !tbaa !95
  %2 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 1, !dbg !105
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %2, align 8, !dbg !105, !tbaa !106
  %3 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 2, !dbg !107
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %3, align 8, !dbg !107, !tbaa !108
  ret %struct.Toggle* %this, !dbg !109
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias %struct.Toggle* @new_Toggle(i8 signext %start_state) #1 {
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !45), !dbg !110
  %1 = tail call noalias i8* @malloc(i64 24) #6, !dbg !111
  %2 = bitcast i8* %1 to %struct.Toggle*, !dbg !111
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %2}, i64 0, metadata !46), !dbg !111
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %2}, i64 0, metadata !112), !dbg !114
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !115), !dbg !114
  store i8 %start_state, i8* %1, align 1, !dbg !116, !tbaa !95
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !117
  %4 = bitcast i8* %3 to {}**, !dbg !117
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %4, align 8, !dbg !117, !tbaa !106
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !118
  %6 = bitcast i8* %5 to %struct.Toggle* (%struct.Toggle*)**, !dbg !118
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %6, align 8, !dbg !118, !tbaa !108
  ret %struct.Toggle* %2, !dbg !113
}

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: minsize nounwind optsize uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %this}, i64 0, metadata !59), !dbg !119
  %1 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !120
  %2 = load i32* %1, align 4, !dbg !120, !tbaa !122
  %3 = add nsw i32 %2, 1, !dbg !120
  store i32 %3, i32* %1, align 4, !dbg !120, !tbaa !122
  %4 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !120
  %5 = load i32* %4, align 4, !dbg !120, !tbaa !125
  %6 = icmp slt i32 %3, %5, !dbg !120
  br i1 %6, label %12, label %7, !dbg !120

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 0, !dbg !126
  %9 = load i8* %8, align 1, !dbg !126, !tbaa !128
  %10 = icmp eq i8 %9, 0, !dbg !126
  %11 = zext i1 %10 to i8, !dbg !126
  store i8 %11, i8* %8, align 1, !dbg !126, !tbaa !128
  store i32 0, i32* %1, align 4, !dbg !129, !tbaa !122
  br label %12, !dbg !130

; <label>:12                                      ; preds = %0, %7
  ret %struct.NthToggle* %this, !dbg !131
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %this}, i64 0, metadata !64), !dbg !132
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !65), !dbg !132
  %1 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !133
  store i32 %max_count, i32* %1, align 4, !dbg !133, !tbaa !125
  %2 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !134
  store i32 0, i32* %2, align 4, !dbg !134, !tbaa !122
  %3 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 2, !dbg !135
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %3, align 8, !dbg !135, !tbaa !136
  ret %struct.NthToggle* %this, !dbg !137
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #1 {
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !70), !dbg !138
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !71), !dbg !138
  %1 = tail call noalias i8* @malloc(i64 32) #6, !dbg !139
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !140), !dbg !142
  store i8 %start_state, i8* %1, align 1, !dbg !143, !tbaa !95
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !144
  %3 = bitcast i8* %2 to {}**, !dbg !144
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %3, align 8, !dbg !144, !tbaa !106
  %4 = getelementptr inbounds i8* %1, i64 16, !dbg !145
  %5 = bitcast i8* %4 to %struct.Toggle* (%struct.Toggle*)**, !dbg !145
  %6 = bitcast i8* %1 to %struct.NthToggle*, !dbg !141
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %6}, i64 0, metadata !72), !dbg !141
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %6}, i64 0, metadata !146), !dbg !148
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !149), !dbg !148
  %7 = getelementptr inbounds i8* %1, i64 24, !dbg !150
  %8 = bitcast i8* %7 to i32*, !dbg !150
  store i32 %max_count, i32* %8, align 4, !dbg !150, !tbaa !125
  %9 = getelementptr inbounds i8* %1, i64 28, !dbg !151
  %10 = bitcast i8* %9 to i32*, !dbg !151
  store i32 0, i32* %10, align 4, !dbg !151, !tbaa !122
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %5, align 8, !dbg !152, !tbaa !136
  ret %struct.NthToggle* %6, !dbg !147
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !79), !dbg !153
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !80), !dbg !153
  %1 = icmp eq i32 %argc, 2, !dbg !154
  br i1 %1, label %2, label %6, !dbg !154

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !154
  %4 = load i8** %3, align 8, !dbg !154, !tbaa !155
  %5 = tail call i32 @atoi(i8* %4) #7, !dbg !154
  br label %6, !dbg !154

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 70000000, %0 ], !dbg !154
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !82), !dbg !154
  %8 = tail call %struct.Toggle* @new_Toggle(i8 signext 1) #8, !dbg !156
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %8}, i64 0, metadata !83), !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !81), !dbg !158
  %9 = getelementptr inbounds %struct.Toggle* %8, i64 0, i32 2, !dbg !160
  br label %10, !dbg !158

; <label>:10                                      ; preds = %10, %6
  %i.07 = phi i32 [ 0, %6 ], [ %20, %10 ]
  %11 = load %struct.Toggle* (%struct.Toggle*)** %9, align 8, !dbg !160, !tbaa !108
  %12 = tail call %struct.Toggle* %11(%struct.Toggle* %8) #6, !dbg !160
  %13 = getelementptr inbounds %struct.Toggle* %12, i64 0, i32 1, !dbg !160
  %14 = load {}** %13, align 8, !dbg !160
  %15 = bitcast {}* %14 to i8 (%struct.Toggle*)*, !dbg !160
  %16 = tail call signext i8 %15(%struct.Toggle* %8) #6, !dbg !160
  %17 = icmp ne i8 %16, 0, !dbg !160
  %18 = select i1 %17, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), !dbg !160
  %19 = tail call i32 @puts(i8* %18) #6, !dbg !160
  %20 = add nsw i32 %i.07, 1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !81), !dbg !158
  %exitcond10 = icmp eq i32 %20, 5, !dbg !158
  br i1 %exitcond10, label %21, label %10, !dbg !158

; <label>:21                                      ; preds = %10
  %22 = getelementptr inbounds %struct.Toggle* %8, i64 0, i32 0, !dbg !162
  tail call void @free(i8* %22) #6, !dbg !162
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !81), !dbg !163
  %23 = icmp sgt i32 %7, 0, !dbg !163
  br i1 %23, label %.lr.ph5, label %._crit_edge6, !dbg !163

.lr.ph5:                                          ; preds = %21, %.lr.ph5
  %i.13 = phi i32 [ %26, %.lr.ph5 ], [ 0, %21 ]
  %24 = tail call %struct.Toggle* @new_Toggle(i8 signext 1) #8, !dbg !165
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %24}, i64 0, metadata !83), !dbg !165
  %25 = getelementptr inbounds %struct.Toggle* %24, i64 0, i32 0, !dbg !167
  tail call void @free(i8* %25) #6, !dbg !167
  %26 = add nsw i32 %i.13, 1, !dbg !163
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !81), !dbg !163
  %exitcond9 = icmp eq i32 %26, %7, !dbg !163
  br i1 %exitcond9, label %._crit_edge6, label %.lr.ph5, !dbg !163

._crit_edge6:                                     ; preds = %.lr.ph5, %21
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !168
  %27 = tail call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3) #8, !dbg !169
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %27}, i64 0, metadata !84), !dbg !169
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !81), !dbg !170
  %28 = getelementptr inbounds %struct.NthToggle* %27, i64 0, i32 0, i32 2, !dbg !171
  %29 = getelementptr inbounds %struct.NthToggle* %27, i64 0, i32 0, !dbg !171
  br label %30, !dbg !170

; <label>:30                                      ; preds = %30, %._crit_edge6
  %i.22 = phi i32 [ 0, %._crit_edge6 ], [ %39, %30 ]
  %31 = load %struct.Toggle* (%struct.Toggle*)** %28, align 8, !dbg !171, !tbaa !136
  %32 = tail call %struct.Toggle* %31(%struct.Toggle* %29) #6, !dbg !171
  %33 = getelementptr inbounds %struct.Toggle* %32, i64 0, i32 1, !dbg !171
  %34 = load {}** %33, align 8, !dbg !171
  %35 = bitcast {}* %34 to i8 (%struct.Toggle*)*, !dbg !171
  %36 = tail call signext i8 %35(%struct.Toggle* %29) #6, !dbg !171
  %37 = icmp eq i8 %36, 0, !dbg !171
  %. = select i1 %37, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %38 = tail call i32 @puts(i8* %.) #6, !dbg !173
  %39 = add nsw i32 %i.22, 1, !dbg !170
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !81), !dbg !170
  %exitcond8 = icmp eq i32 %39, 8, !dbg !170
  br i1 %exitcond8, label %40, label %30, !dbg !170

; <label>:40                                      ; preds = %30
  %41 = getelementptr inbounds %struct.NthToggle* %27, i64 0, i32 0, i32 0, !dbg !174
  tail call void @free(i8* %41) #6, !dbg !174
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !81), !dbg !175
  br i1 %23, label %.lr.ph, label %._crit_edge, !dbg !175

.lr.ph:                                           ; preds = %40, %.lr.ph
  %i.31 = phi i32 [ %44, %.lr.ph ], [ 0, %40 ]
  %42 = tail call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3) #8, !dbg !177
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %42}, i64 0, metadata !84), !dbg !177
  %43 = getelementptr inbounds %struct.NthToggle* %42, i64 0, i32 0, i32 0, !dbg !179
  tail call void @free(i8* %43) #6, !dbg !179
  %44 = add nsw i32 %i.31, 1, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !81), !dbg !175
  %exitcond = icmp eq i32 %44, %7, !dbg !175
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !175

._crit_edge:                                      ; preds = %.lr.ph, %40
  ret i32 0, !dbg !180
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #3

; Function Attrs: minsize nounwind optsize
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

attributes #0 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { minsize nounwind optsize }
attributes #7 = { minsize nounwind optsize readonly }
attributes #8 = { minsize optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!90, !91}
!llvm.ident = !{!92}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c] [DW_LANG_C99]
!1 = metadata !{metadata !"objinst.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"false", i64 0} ; [ DW_TAG_enumerator ] [false :: 0]
!6 = metadata !{i32 786472, metadata !"true", i64 1} ; [ DW_TAG_enumerator ] [true :: 1]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !30, metadata !35, metadata !41, metadata !47, metadata !60, metadata !66, metadata !73}
!9 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"toggle_value", metadata !"toggle_value", metadata !"", i32 23, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8 (%struct.Toggle*)* @toggle_value, null, null, metadata !28, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
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
!47 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"nth_toggle_activate", metadata !"nth_toggle_activate", metadata !"", i32 48, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, metadata !58, i32 48} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !50, metadata !50}
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from NthToggle]
!51 = metadata !{i32 786454, metadata !1, null, metadata !"NthToggle", i32 46, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [NthToggle] [line 46, size 0, align 0, offset 0] [from NthToggle]
!52 = metadata !{i32 786451, metadata !1, null, metadata !"NthToggle", i32 42, i64 256, i64 64, i32 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NthToggle] [line 42, size 256, align 64, offset 0] [def] [from ]
!53 = metadata !{metadata !54, metadata !55, metadata !57}
!54 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"base", i32 43, i64 192, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [base] [line 43, size 192, align 64, offset 0] [from Toggle]
!55 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"count_max", i32 44, i64 32, i64 32, i64 192, i32 0, metadata !56} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!56 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!57 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"counter", i32 45, i64 32, i64 32, i64 224, i32 0, metadata !56} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!58 = metadata !{metadata !59}
!59 = metadata !{i32 786689, metadata !47, metadata !"this", metadata !10, i32 16777264, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 48]
!60 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"init_NthToggle", metadata !"init_NthToggle", metadata !"", i32 55, metadata !61, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, metadata !63, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!61 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{metadata !50, metadata !50, metadata !56}
!63 = metadata !{metadata !64, metadata !65}
!64 = metadata !{i32 786689, metadata !60, metadata !"this", metadata !10, i32 16777271, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 55]
!65 = metadata !{i32 786689, metadata !60, metadata !"max_count", metadata !10, i32 33554487, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!66 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"new_NthToggle", metadata !"new_NthToggle", metadata !"", i32 61, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, metadata !69, i32 61} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!67 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{metadata !50, metadata !13, metadata !56}
!69 = metadata !{metadata !70, metadata !71, metadata !72}
!70 = metadata !{i32 786689, metadata !66, metadata !"start_state", metadata !10, i32 16777277, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!71 = metadata !{i32 786689, metadata !66, metadata !"max_count", metadata !10, i32 33554493, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!72 = metadata !{i32 786688, metadata !66, metadata !"this", metadata !10, i32 62, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [this] [line 62]
!73 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"main", metadata !"main", metadata !"", i32 68, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !78, i32 68} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!74 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{metadata !56, metadata !56, metadata !76}
!76 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!77 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!78 = metadata !{metadata !79, metadata !80, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85}
!79 = metadata !{i32 786689, metadata !73, metadata !"argc", metadata !10, i32 16777284, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!80 = metadata !{i32 786689, metadata !73, metadata !"argv", metadata !10, i32 33554500, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!81 = metadata !{i32 786688, metadata !73, metadata !"i", metadata !10, i32 74, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 74]
!82 = metadata !{i32 786688, metadata !73, metadata !"n", metadata !10, i32 74, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 74]
!83 = metadata !{i32 786688, metadata !73, metadata !"tog", metadata !10, i32 75, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tog] [line 75]
!84 = metadata !{i32 786688, metadata !73, metadata !"ntog", metadata !10, i32 76, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!85 = metadata !{i32 786688, metadata !86, metadata !"Msg", metadata !10, i32 92, metadata !88, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Msg] [line 92]
!86 = metadata !{i32 786443, metadata !1, metadata !87, i32 91, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!87 = metadata !{i32 786443, metadata !1, metadata !73, i32 91, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!88 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!89 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!90 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!91 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!92 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!93 = metadata !{i32 23, i32 0, metadata !9, null}
!94 = metadata !{i32 24, i32 0, metadata !9, null}
!95 = metadata !{metadata !96, metadata !97, i64 0}
!96 = metadata !{metadata !"Toggle", metadata !97, i64 0, metadata !99, i64 8, metadata !99, i64 16}
!97 = metadata !{metadata !"omnipotent char", metadata !98, i64 0}
!98 = metadata !{metadata !"Simple C/C++ TBAA"}
!99 = metadata !{metadata !"any pointer", metadata !97, i64 0}
!100 = metadata !{i32 26, i32 0, metadata !30, null}
!101 = metadata !{i32 27, i32 0, metadata !30, null}
!102 = metadata !{i32 28, i32 0, metadata !30, null}
!103 = metadata !{i32 30, i32 0, metadata !35, null}
!104 = metadata !{i32 31, i32 0, metadata !35, null}
!105 = metadata !{i32 32, i32 0, metadata !35, null}
!106 = metadata !{metadata !96, metadata !99, i64 8}
!107 = metadata !{i32 33, i32 0, metadata !35, null}
!108 = metadata !{metadata !96, metadata !99, i64 16}
!109 = metadata !{i32 34, i32 0, metadata !35, null}
!110 = metadata !{i32 36, i32 0, metadata !41, null}
!111 = metadata !{i32 37, i32 0, metadata !41, null}
!112 = metadata !{i32 786689, metadata !35, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [this] [line 30]
!113 = metadata !{i32 38, i32 0, metadata !41, null}
!114 = metadata !{i32 30, i32 0, metadata !35, metadata !113}
!115 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!116 = metadata !{i32 31, i32 0, metadata !35, metadata !113}
!117 = metadata !{i32 32, i32 0, metadata !35, metadata !113}
!118 = metadata !{i32 33, i32 0, metadata !35, metadata !113}
!119 = metadata !{i32 48, i32 0, metadata !47, null}
!120 = metadata !{i32 49, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !47, i32 49, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!122 = metadata !{metadata !123, metadata !124, i64 28}
!123 = metadata !{metadata !"NthToggle", metadata !96, i64 0, metadata !124, i64 24, metadata !124, i64 28}
!124 = metadata !{metadata !"int", metadata !97, i64 0}
!125 = metadata !{metadata !123, metadata !124, i64 24}
!126 = metadata !{i32 50, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !121, i32 49, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!128 = metadata !{metadata !123, metadata !97, i64 0}
!129 = metadata !{i32 51, i32 0, metadata !127, null}
!130 = metadata !{i32 52, i32 0, metadata !127, null}
!131 = metadata !{i32 53, i32 0, metadata !47, null}
!132 = metadata !{i32 55, i32 0, metadata !60, null}
!133 = metadata !{i32 56, i32 0, metadata !60, null}
!134 = metadata !{i32 57, i32 0, metadata !60, null}
!135 = metadata !{i32 58, i32 0, metadata !60, null} ; [ DW_TAG_imported_module ]
!136 = metadata !{metadata !123, metadata !99, i64 16}
!137 = metadata !{i32 59, i32 0, metadata !60, null}
!138 = metadata !{i32 61, i32 0, metadata !66, null}
!139 = metadata !{i32 62, i32 0, metadata !66, null}
!140 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !141} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!141 = metadata !{i32 63, i32 0, metadata !66, null}
!142 = metadata !{i32 30, i32 0, metadata !35, metadata !141}
!143 = metadata !{i32 31, i32 0, metadata !35, metadata !141}
!144 = metadata !{i32 32, i32 0, metadata !35, metadata !141}
!145 = metadata !{i32 33, i32 0, metadata !35, metadata !141}
!146 = metadata !{i32 786689, metadata !60, metadata !"this", metadata !10, i32 16777271, metadata !50, i32 0, metadata !147} ; [ DW_TAG_arg_variable ] [this] [line 55]
!147 = metadata !{i32 64, i32 0, metadata !66, null}
!148 = metadata !{i32 55, i32 0, metadata !60, metadata !147}
!149 = metadata !{i32 786689, metadata !60, metadata !"max_count", metadata !10, i32 33554487, metadata !56, i32 0, metadata !147} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!150 = metadata !{i32 56, i32 0, metadata !60, metadata !147}
!151 = metadata !{i32 57, i32 0, metadata !60, metadata !147}
!152 = metadata !{i32 58, i32 0, metadata !60, metadata !147} ; [ DW_TAG_imported_module ]
!153 = metadata !{i32 68, i32 0, metadata !73, null}
!154 = metadata !{i32 74, i32 0, metadata !73, null}
!155 = metadata !{metadata !99, metadata !99, i64 0}
!156 = metadata !{i32 78, i32 0, metadata !73, null}
!157 = metadata !{i32 0}
!158 = metadata !{i32 79, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !73, i32 79, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!160 = metadata !{i32 80, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !159, i32 79, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!162 = metadata !{i32 82, i32 0, metadata !73, null}
!163 = metadata !{i32 83, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !73, i32 83, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!165 = metadata !{i32 84, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !164, i32 83, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!167 = metadata !{i32 85, i32 0, metadata !166, null}
!168 = metadata !{i32 88, i32 0, metadata !73, null}
!169 = metadata !{i32 90, i32 0, metadata !73, null}
!170 = metadata !{i32 91, i32 0, metadata !87, null}
!171 = metadata !{i32 93, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !86, i32 93, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!173 = metadata !{i32 97, i32 0, metadata !86, null}
!174 = metadata !{i32 99, i32 0, metadata !73, null}
!175 = metadata !{i32 100, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !73, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!177 = metadata !{i32 101, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !176, i32 100, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!179 = metadata !{i32 102, i32 0, metadata !178, null}
!180 = metadata !{i32 104, i32 0, metadata !73, null}
