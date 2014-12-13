; ModuleID = 'objinst.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { %struct.Toggle, i32, i32 }

@.str = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1

; Function Attrs: nounwind readonly uwtable
define signext i8 @toggle_value(%struct.Toggle* nocapture readonly %this) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !29), !dbg !100
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !101
  %2 = load i8* %1, align 1, !dbg !101, !tbaa !102
  ret i8 %2, !dbg !101
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !34), !dbg !107
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !108
  %2 = load i8* %1, align 1, !dbg !108, !tbaa !102
  %3 = icmp eq i8 %2, 0, !dbg !108
  %4 = zext i1 %3 to i8, !dbg !108
  store i8 %4, i8* %1, align 1, !dbg !108, !tbaa !102
  ret %struct.Toggle* %this, !dbg !109
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %this}, i64 0, metadata !39), !dbg !110
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !40), !dbg !110
  %1 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !111
  store i8 %start_state, i8* %1, align 1, !dbg !111, !tbaa !102
  %2 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 1, !dbg !112
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %2, align 8, !dbg !112, !tbaa !113
  %3 = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 2, !dbg !114
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %3, align 8, !dbg !114, !tbaa !115
  ret %struct.Toggle* %this, !dbg !116
}

; Function Attrs: nounwind uwtable
define noalias %struct.Toggle* @new_Toggle(i8 signext %start_state) #1 {
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !45), !dbg !117
  %1 = tail call noalias i8* @malloc(i64 24) #4, !dbg !118
  %2 = bitcast i8* %1 to %struct.Toggle*, !dbg !118
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %2}, i64 0, metadata !46), !dbg !118
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %2}, i64 0, metadata !119), !dbg !121
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !122), !dbg !121
  store i8 %start_state, i8* %1, align 1, !dbg !123, !tbaa !102
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !124
  %4 = bitcast i8* %3 to {}**, !dbg !124
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %4, align 8, !dbg !124, !tbaa !113
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !125
  %6 = bitcast i8* %5 to %struct.Toggle* (%struct.Toggle*)**, !dbg !125
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %6, align 8, !dbg !125, !tbaa !115
  ret %struct.Toggle* %2, !dbg !120
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %this}, i64 0, metadata !59), !dbg !126
  %1 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !127
  %2 = load i32* %1, align 4, !dbg !127, !tbaa !129
  %3 = add nsw i32 %2, 1, !dbg !127
  store i32 %3, i32* %1, align 4, !dbg !127, !tbaa !129
  %4 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !127
  %5 = load i32* %4, align 4, !dbg !127, !tbaa !132
  %6 = icmp slt i32 %3, %5, !dbg !127
  br i1 %6, label %12, label %7, !dbg !127

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 0, !dbg !133
  %9 = load i8* %8, align 1, !dbg !133, !tbaa !135
  %10 = icmp eq i8 %9, 0, !dbg !133
  %11 = zext i1 %10 to i8, !dbg !133
  store i8 %11, i8* %8, align 1, !dbg !133, !tbaa !135
  store i32 0, i32* %1, align 4, !dbg !136, !tbaa !129
  br label %12, !dbg !137

; <label>:12                                      ; preds = %0, %7
  ret %struct.NthToggle* %this, !dbg !138
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %this}, i64 0, metadata !64), !dbg !139
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !65), !dbg !139
  %1 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !140
  store i32 %max_count, i32* %1, align 4, !dbg !140, !tbaa !132
  %2 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !141
  store i32 0, i32* %2, align 4, !dbg !141, !tbaa !129
  %3 = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 2, !dbg !142
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %3, align 8, !dbg !142, !tbaa !143
  ret %struct.NthToggle* %this, !dbg !144
}

; Function Attrs: nounwind uwtable
define noalias %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #1 {
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !70), !dbg !145
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !71), !dbg !145
  %1 = tail call noalias i8* @malloc(i64 32) #4, !dbg !146
  tail call void @llvm.dbg.value(metadata !{i8 %start_state}, i64 0, metadata !147), !dbg !149
  store i8 %start_state, i8* %1, align 1, !dbg !150, !tbaa !102
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !151
  %3 = bitcast i8* %2 to {}**, !dbg !151
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %3, align 8, !dbg !151, !tbaa !113
  %4 = getelementptr inbounds i8* %1, i64 16, !dbg !152
  %5 = bitcast i8* %4 to %struct.Toggle* (%struct.Toggle*)**, !dbg !152
  %6 = bitcast i8* %1 to %struct.NthToggle*, !dbg !148
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %6}, i64 0, metadata !72), !dbg !148
  tail call void @llvm.dbg.value(metadata !{%struct.NthToggle* %6}, i64 0, metadata !153), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %max_count}, i64 0, metadata !156), !dbg !155
  %7 = getelementptr inbounds i8* %1, i64 24, !dbg !157
  %8 = bitcast i8* %7 to i32*, !dbg !157
  store i32 %max_count, i32* %8, align 4, !dbg !157, !tbaa !132
  %9 = getelementptr inbounds i8* %1, i64 28, !dbg !158
  %10 = bitcast i8* %9 to i32*, !dbg !158
  store i32 0, i32* %10, align 4, !dbg !158, !tbaa !129
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %5, align 8, !dbg !159, !tbaa !143
  ret %struct.NthToggle* %6, !dbg !154
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !79), !dbg !160
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !80), !dbg !160
  %1 = icmp eq i32 %argc, 2, !dbg !161
  br i1 %1, label %2, label %nth_toggle_activate.exit4, !dbg !161

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !162
  %4 = load i8** %3, align 8, !dbg !162, !tbaa !163
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !164) #4, !dbg !165
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #4, !dbg !166
  br label %nth_toggle_activate.exit4, !dbg !162

nth_toggle_activate.exit4:                        ; preds = %2, %0
  tail call void @llvm.dbg.value(metadata !168, i64 0, metadata !169) #4, !dbg !171
  %6 = tail call noalias i8* @malloc(i64 24) #4, !dbg !172
  %7 = bitcast i8* %6 to %struct.Toggle*, !dbg !172
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !173) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !174) #4, !dbg !176
  tail call void @llvm.dbg.value(metadata !168, i64 0, metadata !177) #4, !dbg !176
  %8 = getelementptr inbounds i8* %6, i64 8, !dbg !178
  %9 = bitcast i8* %8 to {}**, !dbg !178
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %9, align 8, !dbg !178, !tbaa !113
  %10 = getelementptr inbounds i8* %6, i64 16, !dbg !179
  %11 = bitcast i8* %10 to %struct.Toggle* (%struct.Toggle*)**, !dbg !179
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %11, align 8, !dbg !179, !tbaa !115
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !83), !dbg !170
  tail call void @llvm.dbg.value(metadata !180, i64 0, metadata !81), !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !183), !dbg !186
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !187), !dbg !188
  %12 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !183), !dbg !186
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !187), !dbg !188
  %13 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !183), !dbg !186
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !187), !dbg !188
  %14 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %7}, i64 0, metadata !183), !dbg !186
  store i8 1, i8* %6, align 1, !dbg !190, !tbaa !102
  %15 = tail call signext i8 @toggle_value(%struct.Toggle* %7) #4, !dbg !184
  %16 = icmp ne i8 %15, 0, !dbg !184
  %17 = select i1 %16, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), !dbg !184
  %18 = tail call i32 @puts(i8* %17) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !181
  %19 = tail call %struct.Toggle* @toggle_activate(%struct.Toggle* %7) #4, !dbg !184
  %20 = getelementptr inbounds %struct.Toggle* %19, i64 0, i32 1, !dbg !184
  %21 = load {}** %20, align 8, !dbg !184
  %22 = bitcast {}* %21 to i8 (%struct.Toggle*)*, !dbg !184
  %23 = tail call signext i8 %22(%struct.Toggle* %7) #4, !dbg !184
  %24 = icmp ne i8 %23, 0, !dbg !184
  %25 = select i1 %24, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), !dbg !184
  %26 = tail call i32 @puts(i8* %25) #4, !dbg !184
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !181
  tail call void @free(i8* %6) #4, !dbg !191
  tail call void @llvm.dbg.value(metadata !180, i64 0, metadata !81), !dbg !192
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !194
  tail call void @llvm.dbg.value(metadata !168, i64 0, metadata !195) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !199) #4, !dbg !197
  %27 = tail call noalias i8* @malloc(i64 32) #4, !dbg !200
  tail call void @llvm.dbg.value(metadata !168, i64 0, metadata !201) #4, !dbg !203
  %28 = getelementptr inbounds i8* %27, i64 8, !dbg !204
  %29 = bitcast i8* %28 to {}**, !dbg !204
  store {}* bitcast (i8 (%struct.Toggle*)* @toggle_value to {}*), {}** %29, align 8, !dbg !204, !tbaa !113
  %30 = getelementptr inbounds i8* %27, i64 16, !dbg !205
  %31 = bitcast i8* %30 to %struct.Toggle* (%struct.Toggle*)**, !dbg !205
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !206) #4, !dbg !208
  %32 = getelementptr inbounds i8* %27, i64 24, !dbg !209
  %33 = bitcast i8* %32 to i32*, !dbg !209
  store i32 3, i32* %33, align 4, !dbg !209, !tbaa !132
  %34 = getelementptr inbounds i8* %27, i64 28, !dbg !210
  %35 = bitcast i8* %34 to i32*, !dbg !210
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %31, align 8, !dbg !211, !tbaa !143
  tail call void @llvm.dbg.value(metadata !180, i64 0, metadata !81), !dbg !212
  %36 = bitcast i8* %27 to %struct.Toggle*, !dbg !213
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %36}, i64 0, metadata !215), !dbg !216
  %37 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %36}, i64 0, metadata !215), !dbg !216
  %38 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  store i8 0, i8* %27, align 1, !dbg !218, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{%struct.Toggle* %36}, i64 0, metadata !215), !dbg !216
  %39 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  store i32 1, i32* %35, align 4, !dbg !219, !tbaa !129
  %40 = tail call signext i8 @toggle_value(%struct.Toggle* %36) #4, !dbg !213
  %41 = icmp eq i8 %40, 0, !dbg !213
  %..3 = select i1 %41, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %42 = tail call i32 @puts(i8* %..3) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  %43 = bitcast i8* %27 to %struct.NthToggle*, !dbg !213
  %44 = tail call %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %43) #4, !dbg !213
  %45 = getelementptr inbounds %struct.NthToggle* %44, i64 0, i32 0, i32 1, !dbg !213
  %46 = load {}** %45, align 8, !dbg !213
  %47 = bitcast {}* %46 to i8 (%struct.Toggle*)*, !dbg !213
  %48 = tail call signext i8 %47(%struct.Toggle* %36) #4, !dbg !213
  %49 = icmp eq i8 %48, 0, !dbg !213
  %..4 = select i1 %49, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %50 = tail call i32 @puts(i8* %..4) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  %51 = load %struct.Toggle* (%struct.Toggle*)** %31, align 8, !dbg !213, !tbaa !143
  %52 = tail call %struct.Toggle* %51(%struct.Toggle* %36) #4, !dbg !213
  %53 = getelementptr inbounds %struct.Toggle* %52, i64 0, i32 1, !dbg !213
  %54 = load {}** %53, align 8, !dbg !213
  %55 = bitcast {}* %54 to i8 (%struct.Toggle*)*, !dbg !213
  %56 = tail call signext i8 %55(%struct.Toggle* %36) #4, !dbg !213
  %57 = icmp eq i8 %56, 0, !dbg !213
  %..5 = select i1 %57, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %58 = tail call i32 @puts(i8* %..5) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  %59 = load %struct.Toggle* (%struct.Toggle*)** %31, align 8, !dbg !213, !tbaa !143
  %60 = tail call %struct.Toggle* %59(%struct.Toggle* %36) #4, !dbg !213
  %61 = getelementptr inbounds %struct.Toggle* %60, i64 0, i32 1, !dbg !213
  %62 = load {}** %61, align 8, !dbg !213
  %63 = bitcast {}* %62 to i8 (%struct.Toggle*)*, !dbg !213
  %64 = tail call signext i8 %63(%struct.Toggle* %36) #4, !dbg !213
  %65 = icmp eq i8 %64, 0, !dbg !213
  %..6 = select i1 %65, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %66 = tail call i32 @puts(i8* %..6) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  %67 = load %struct.Toggle* (%struct.Toggle*)** %31, align 8, !dbg !213, !tbaa !143
  %68 = tail call %struct.Toggle* %67(%struct.Toggle* %36) #4, !dbg !213
  %69 = getelementptr inbounds %struct.Toggle* %68, i64 0, i32 1, !dbg !213
  %70 = load {}** %69, align 8, !dbg !213
  %71 = bitcast {}* %70 to i8 (%struct.Toggle*)*, !dbg !213
  %72 = tail call signext i8 %71(%struct.Toggle* %36) #4, !dbg !213
  %73 = icmp eq i8 %72, 0, !dbg !213
  %..7 = select i1 %73, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %74 = tail call i32 @puts(i8* %..7) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !81), !dbg !212
  tail call void @free(i8* %27) #4, !dbg !220
  tail call void @llvm.dbg.value(metadata !180, i64 0, metadata !81), !dbg !221
  ret i32 0, !dbg !223
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!97, !98}
!llvm.ident = !{!99}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c] [DW_LANG_C99]
!1 = metadata !{metadata !"objinst.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"false", i64 0} ; [ DW_TAG_enumerator ] [false :: 0]
!6 = metadata !{i32 786472, metadata !"true", i64 1} ; [ DW_TAG_enumerator ] [true :: 1]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !30, metadata !35, metadata !41, metadata !47, metadata !60, metadata !66, metadata !73, metadata !90}
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
!90 = metadata !{i32 786478, metadata !91, metadata !92, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !95, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!91 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!92 = metadata !{i32 786473, metadata !91}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!93 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !56, metadata !88}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786689, metadata !90, metadata !"__nptr", metadata !92, i32 16777494, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!97 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!98 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!99 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!100 = metadata !{i32 23, i32 0, metadata !9, null}
!101 = metadata !{i32 24, i32 0, metadata !9, null}
!102 = metadata !{metadata !103, metadata !104, i64 0}
!103 = metadata !{metadata !"Toggle", metadata !104, i64 0, metadata !106, i64 8, metadata !106, i64 16}
!104 = metadata !{metadata !"omnipotent char", metadata !105, i64 0}
!105 = metadata !{metadata !"Simple C/C++ TBAA"}
!106 = metadata !{metadata !"any pointer", metadata !104, i64 0}
!107 = metadata !{i32 26, i32 0, metadata !30, null}
!108 = metadata !{i32 27, i32 0, metadata !30, null}
!109 = metadata !{i32 28, i32 0, metadata !30, null}
!110 = metadata !{i32 30, i32 0, metadata !35, null}
!111 = metadata !{i32 31, i32 0, metadata !35, null}
!112 = metadata !{i32 32, i32 0, metadata !35, null}
!113 = metadata !{metadata !103, metadata !106, i64 8}
!114 = metadata !{i32 33, i32 0, metadata !35, null}
!115 = metadata !{metadata !103, metadata !106, i64 16}
!116 = metadata !{i32 34, i32 0, metadata !35, null}
!117 = metadata !{i32 36, i32 0, metadata !41, null}
!118 = metadata !{i32 37, i32 0, metadata !41, null}
!119 = metadata !{i32 786689, metadata !35, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [this] [line 30]
!120 = metadata !{i32 38, i32 0, metadata !41, null}
!121 = metadata !{i32 30, i32 0, metadata !35, metadata !120}
!122 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!123 = metadata !{i32 31, i32 0, metadata !35, metadata !120}
!124 = metadata !{i32 32, i32 0, metadata !35, metadata !120}
!125 = metadata !{i32 33, i32 0, metadata !35, metadata !120}
!126 = metadata !{i32 48, i32 0, metadata !47, null}
!127 = metadata !{i32 49, i32 0, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !47, i32 49, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!129 = metadata !{metadata !130, metadata !131, i64 28}
!130 = metadata !{metadata !"NthToggle", metadata !103, i64 0, metadata !131, i64 24, metadata !131, i64 28}
!131 = metadata !{metadata !"int", metadata !104, i64 0}
!132 = metadata !{metadata !130, metadata !131, i64 24}
!133 = metadata !{i32 50, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !128, i32 49, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!135 = metadata !{metadata !130, metadata !104, i64 0}
!136 = metadata !{i32 51, i32 0, metadata !134, null}
!137 = metadata !{i32 52, i32 0, metadata !134, null}
!138 = metadata !{i32 53, i32 0, metadata !47, null}
!139 = metadata !{i32 55, i32 0, metadata !60, null}
!140 = metadata !{i32 56, i32 0, metadata !60, null}
!141 = metadata !{i32 57, i32 0, metadata !60, null}
!142 = metadata !{i32 58, i32 0, metadata !60, null} ; [ DW_TAG_imported_module ]
!143 = metadata !{metadata !130, metadata !106, i64 16}
!144 = metadata !{i32 59, i32 0, metadata !60, null}
!145 = metadata !{i32 61, i32 0, metadata !66, null}
!146 = metadata !{i32 62, i32 0, metadata !66, null}
!147 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !148} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!148 = metadata !{i32 63, i32 0, metadata !66, null}
!149 = metadata !{i32 30, i32 0, metadata !35, metadata !148}
!150 = metadata !{i32 31, i32 0, metadata !35, metadata !148}
!151 = metadata !{i32 32, i32 0, metadata !35, metadata !148}
!152 = metadata !{i32 33, i32 0, metadata !35, metadata !148}
!153 = metadata !{i32 786689, metadata !60, metadata !"this", metadata !10, i32 16777271, metadata !50, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [this] [line 55]
!154 = metadata !{i32 64, i32 0, metadata !66, null}
!155 = metadata !{i32 55, i32 0, metadata !60, metadata !154}
!156 = metadata !{i32 786689, metadata !60, metadata !"max_count", metadata !10, i32 33554487, metadata !56, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!157 = metadata !{i32 56, i32 0, metadata !60, metadata !154}
!158 = metadata !{i32 57, i32 0, metadata !60, metadata !154}
!159 = metadata !{i32 58, i32 0, metadata !60, metadata !154} ; [ DW_TAG_imported_module ]
!160 = metadata !{i32 68, i32 0, metadata !73, null}
!161 = metadata !{i32 74, i32 0, metadata !73, null}
!162 = metadata !{i32 74, i32 31, metadata !73, null}
!163 = metadata !{metadata !106, metadata !106, i64 0}
!164 = metadata !{i32 786689, metadata !90, metadata !"__nptr", metadata !92, i32 16777494, metadata !88, i32 0, metadata !162} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!165 = metadata !{i32 278, i32 0, metadata !90, metadata !162}
!166 = metadata !{i32 280, i32 0, metadata !167, metadata !162}
!167 = metadata !{i32 786443, metadata !91, metadata !90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!168 = metadata !{i8 1}
!169 = metadata !{i32 786689, metadata !41, metadata !"start_state", metadata !10, i32 16777252, metadata !13, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!170 = metadata !{i32 78, i32 0, metadata !73, null}
!171 = metadata !{i32 36, i32 0, metadata !41, metadata !170}
!172 = metadata !{i32 37, i32 0, metadata !41, metadata !170}
!173 = metadata !{i32 786688, metadata !41, metadata !"this", metadata !10, i32 37, metadata !14, i32 0, metadata !170} ; [ DW_TAG_auto_variable ] [this] [line 37]
!174 = metadata !{i32 786689, metadata !35, metadata !"this", metadata !10, i32 16777246, metadata !14, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [this] [line 30]
!175 = metadata !{i32 38, i32 0, metadata !41, metadata !170}
!176 = metadata !{i32 30, i32 0, metadata !35, metadata !175}
!177 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!178 = metadata !{i32 32, i32 0, metadata !35, metadata !175}
!179 = metadata !{i32 33, i32 0, metadata !35, metadata !175}
!180 = metadata !{i32 0}
!181 = metadata !{i32 79, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !73, i32 79, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!183 = metadata !{i32 786689, metadata !30, metadata !"this", metadata !10, i32 16777242, metadata !14, i32 0, metadata !184} ; [ DW_TAG_arg_variable ] [this] [line 26]
!184 = metadata !{i32 80, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !182, i32 79, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!186 = metadata !{i32 26, i32 0, metadata !30, metadata !184}
!187 = metadata !{i32 786689, metadata !9, metadata !"this", metadata !10, i32 16777239, metadata !14, i32 0, metadata !184} ; [ DW_TAG_arg_variable ] [this] [line 23]
!188 = metadata !{i32 23, i32 0, metadata !9, metadata !184}
!189 = metadata !{i32 1}
!190 = metadata !{i32 27, i32 0, metadata !30, metadata !184}
!191 = metadata !{i32 82, i32 0, metadata !73, null}
!192 = metadata !{i32 83, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !73, i32 83, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!194 = metadata !{i32 88, i32 0, metadata !73, null}
!195 = metadata !{i32 786689, metadata !66, metadata !"start_state", metadata !10, i32 16777277, metadata !13, i32 0, metadata !196} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!196 = metadata !{i32 90, i32 0, metadata !73, null}
!197 = metadata !{i32 61, i32 0, metadata !66, metadata !196}
!198 = metadata !{i32 3}
!199 = metadata !{i32 786689, metadata !66, metadata !"max_count", metadata !10, i32 33554493, metadata !56, i32 0, metadata !196} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!200 = metadata !{i32 62, i32 0, metadata !66, metadata !196}
!201 = metadata !{i32 786689, metadata !35, metadata !"start_state", metadata !10, i32 33554462, metadata !13, i32 0, metadata !202} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!202 = metadata !{i32 63, i32 0, metadata !66, metadata !196}
!203 = metadata !{i32 30, i32 0, metadata !35, metadata !202}
!204 = metadata !{i32 32, i32 0, metadata !35, metadata !202}
!205 = metadata !{i32 33, i32 0, metadata !35, metadata !202}
!206 = metadata !{i32 786689, metadata !60, metadata !"max_count", metadata !10, i32 33554487, metadata !56, i32 0, metadata !207} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!207 = metadata !{i32 64, i32 0, metadata !66, metadata !196}
!208 = metadata !{i32 55, i32 0, metadata !60, metadata !207}
!209 = metadata !{i32 56, i32 0, metadata !60, metadata !207}
!210 = metadata !{i32 57, i32 0, metadata !60, metadata !207}
!211 = metadata !{i32 58, i32 0, metadata !60, metadata !207} ; [ DW_TAG_imported_module ]
!212 = metadata !{i32 91, i32 0, metadata !87, null}
!213 = metadata !{i32 93, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !86, i32 93, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!215 = metadata !{i32 786689, metadata !9, metadata !"this", metadata !10, i32 16777239, metadata !14, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [this] [line 23]
!216 = metadata !{i32 23, i32 0, metadata !9, metadata !213}
!217 = metadata !{i32 97, i32 0, metadata !86, null}
!218 = metadata !{i32 50, i32 0, metadata !134, metadata !213}
!219 = metadata !{i32 49, i32 0, metadata !128, metadata !213}
!220 = metadata !{i32 99, i32 0, metadata !73, null}
!221 = metadata !{i32 100, i32 0, metadata !222, null}
!222 = metadata !{i32 786443, metadata !1, metadata !73, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/objinst.c]
!223 = metadata !{i32 104, i32 0, metadata !73, null}
