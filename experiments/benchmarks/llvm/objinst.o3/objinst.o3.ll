; ModuleID = 'objinst.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { %struct.Toggle, i32, i32 }

@.str = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1

; Function Attrs: nounwind readonly uwtable
define signext i8 @toggle_value(%struct.Toggle* nocapture readonly %this) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %this, i64 0, metadata !43, metadata !104), !dbg !105
  %state = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !106
  %0 = load i8* %state, align 1, !dbg !106, !tbaa !107
  ret i8 %0, !dbg !112
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %this, i64 0, metadata !46, metadata !104), !dbg !113
  %state = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !114
  %0 = load i8* %state, align 1, !dbg !114, !tbaa !107
  %lnot = icmp eq i8 %0, 0, !dbg !115
  %conv = zext i1 %lnot to i8, !dbg !115
  store i8 %conv, i8* %state, align 1, !dbg !116, !tbaa !107
  ret %struct.Toggle* %this, !dbg !117
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %this, i64 0, metadata !51, metadata !104), !dbg !118
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !52, metadata !104), !dbg !119
  %state = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !120
  store i8 %start_state, i8* %state, align 1, !dbg !120, !tbaa !107
  %value = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 1, !dbg !121
  %value1 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !121
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1, align 8, !dbg !121, !tbaa !122
  %activate = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 2, !dbg !123
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !123, !tbaa !124
  ret %struct.Toggle* %this, !dbg !125
}

; Function Attrs: nounwind uwtable
define noalias %struct.Toggle* @new_Toggle(i8 signext %start_state) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !57, metadata !104), !dbg !126
  %call = tail call noalias i8* @malloc(i64 24) #4, !dbg !127
  %0 = bitcast i8* %call to %struct.Toggle*, !dbg !128
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %0, i64 0, metadata !58, metadata !104), !dbg !129
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %0, i64 0, metadata !130, metadata !104), !dbg !132
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !133, metadata !104), !dbg !134
  store i8 %start_state, i8* %call, align 1, !dbg !135, !tbaa !107
  %value.i = getelementptr inbounds i8* %call, i64 8, !dbg !136
  %value1.i = bitcast i8* %value.i to i8 (%struct.Toggle*)**, !dbg !136
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i, align 8, !dbg !136, !tbaa !122
  %activate.i = getelementptr inbounds i8* %call, i64 16, !dbg !137
  %1 = bitcast i8* %activate.i to %struct.Toggle* (%struct.Toggle*)**, !dbg !137
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %1, align 8, !dbg !137, !tbaa !124
  ret %struct.Toggle* %0, !dbg !138
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %this, i64 0, metadata !63, metadata !104), !dbg !139
  %counter = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !140
  %0 = load i32* %counter, align 4, !dbg !140, !tbaa !142
  %inc = add nsw i32 %0, 1, !dbg !140
  store i32 %inc, i32* %counter, align 4, !dbg !140, !tbaa !142
  %count_max = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !145
  %1 = load i32* %count_max, align 4, !dbg !145, !tbaa !146
  %cmp = icmp slt i32 %inc, %1, !dbg !140
  br i1 %cmp, label %if.end, label %if.then, !dbg !147

if.then:                                          ; preds = %entry
  %state = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 0, !dbg !148
  %2 = load i8* %state, align 1, !dbg !148, !tbaa !150
  %lnot = icmp eq i8 %2, 0, !dbg !151
  %conv = zext i1 %lnot to i8, !dbg !151
  store i8 %conv, i8* %state, align 1, !dbg !152, !tbaa !150
  store i32 0, i32* %counter, align 4, !dbg !153, !tbaa !142
  br label %if.end, !dbg !154

if.end:                                           ; preds = %entry, %if.then
  ret %struct.NthToggle* %this, !dbg !155
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %this, i64 0, metadata !68, metadata !104), !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !69, metadata !104), !dbg !157
  %count_max = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !158
  store i32 %max_count, i32* %count_max, align 4, !dbg !158, !tbaa !146
  %counter = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !159
  store i32 0, i32* %counter, align 4, !dbg !159, !tbaa !142
  %activate = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 2, !dbg !160
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !160, !tbaa !161
  ret %struct.NthToggle* %this, !dbg !162
}

; Function Attrs: nounwind uwtable
define noalias %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !74, metadata !104), !dbg !163
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !75, metadata !104), !dbg !164
  %call = tail call noalias i8* @malloc(i64 32) #4, !dbg !165
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !166, metadata !104), !dbg !168
  store i8 %start_state, i8* %call, align 1, !dbg !169, !tbaa !107
  %value.i = getelementptr inbounds i8* %call, i64 8, !dbg !170
  %value1.i = bitcast i8* %value.i to i8 (%struct.Toggle*)**, !dbg !170
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i, align 8, !dbg !170, !tbaa !122
  %activate.i = getelementptr inbounds i8* %call, i64 16, !dbg !171
  %0 = bitcast i8* %activate.i to %struct.Toggle* (%struct.Toggle*)**, !dbg !171
  %1 = bitcast i8* %call to %struct.NthToggle*, !dbg !172
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %1, i64 0, metadata !76, metadata !104), !dbg !173
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %1, i64 0, metadata !174, metadata !104), !dbg !176
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !177, metadata !104), !dbg !178
  %count_max.i = getelementptr inbounds i8* %call, i64 24, !dbg !179
  %2 = bitcast i8* %count_max.i to i32*, !dbg !179
  store i32 %max_count, i32* %2, align 4, !dbg !179, !tbaa !146
  %counter.i = getelementptr inbounds i8* %call, i64 28, !dbg !180
  %3 = bitcast i8* %counter.i to i32*, !dbg !180
  store i32 0, i32* %3, align 4, !dbg !180, !tbaa !142
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %0, align 8, !dbg !181, !tbaa !161
  ret %struct.NthToggle* %1, !dbg !182
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !81, metadata !104), !dbg !183
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !82, metadata !104), !dbg !184
  %cmp = icmp eq i32 %argc, 2, !dbg !185
  br i1 %cmp, label %cond.true, label %nth_toggle_activate.exit91, !dbg !186

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !187
  %0 = load i8** %arrayidx, align 8, !dbg !187, !tbaa !189
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !190, metadata !104) #4, !dbg !192
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #4, !dbg !193
  br label %nth_toggle_activate.exit91, !dbg !186

nth_toggle_activate.exit91:                       ; preds = %cond.true, %entry
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !194, metadata !104) #4, !dbg !196
  %call.i54 = tail call noalias i8* @malloc(i64 24) #4, !dbg !197
  %1 = bitcast i8* %call.i54 to %struct.Toggle*, !dbg !198
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !199, metadata !104) #4, !dbg !200
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !201, metadata !104) #4, !dbg !203
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !204, metadata !104) #4, !dbg !205
  %value.i.i = getelementptr inbounds i8* %call.i54, i64 8, !dbg !206
  %value1.i.i = bitcast i8* %value.i.i to i8 (%struct.Toggle*)**, !dbg !206
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i.i, align 8, !dbg !206, !tbaa !122
  %activate.i.i = getelementptr inbounds i8* %call.i54, i64 16, !dbg !207
  %2 = bitcast i8* %activate.i.i to %struct.Toggle* (%struct.Toggle*)**, !dbg !207
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %2, align 8, !dbg !207, !tbaa !124
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !85, metadata !104), !dbg !208
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !210, metadata !104), !dbg !215
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !216, metadata !104), !dbg !217
  %call7 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !218
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !210, metadata !104), !dbg !215
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !216, metadata !104), !dbg !217
  %call7.1 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !218
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !210, metadata !104), !dbg !215
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !216, metadata !104), !dbg !217
  %call7.2 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !218
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !210, metadata !104), !dbg !215
  store i8 1, i8* %call.i54, align 1, !dbg !219, !tbaa !107
  %call5.3 = tail call signext i8 @toggle_value(%struct.Toggle* %1) #4, !dbg !211
  %tobool.3 = icmp ne i8 %call5.3, 0, !dbg !220
  %cond6.3 = select i1 %tobool.3, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), !dbg !220
  %call7.3 = tail call i32 @puts(i8* %cond6.3) #4, !dbg !218
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  %call3.4 = tail call %struct.Toggle* @toggle_activate(%struct.Toggle* %1) #4, !dbg !211
  %value.4 = getelementptr inbounds %struct.Toggle* %call3.4, i64 0, i32 1, !dbg !211
  %value4.4 = bitcast {}** %value.4 to i8 (%struct.Toggle*)**, !dbg !211
  %3 = load i8 (%struct.Toggle*)** %value4.4, align 8, !dbg !211, !tbaa !122
  %call5.4 = tail call signext i8 %3(%struct.Toggle* %1) #4, !dbg !211
  %tobool.4 = icmp ne i8 %call5.4, 0, !dbg !220
  %cond6.4 = select i1 %tobool.4, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), !dbg !220
  %call7.4 = tail call i32 @puts(i8* %cond6.4) #4, !dbg !218
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @free(i8* %call.i54) #4, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !209
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !223, metadata !104) #4, !dbg !225
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !226, metadata !104) #4, !dbg !227
  %call.i59 = tail call noalias i8* @malloc(i64 32) #4, !dbg !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !229, metadata !104) #4, !dbg !231
  %value.i.i60 = getelementptr inbounds i8* %call.i59, i64 8, !dbg !232
  %value1.i.i61 = bitcast i8* %value.i.i60 to i8 (%struct.Toggle*)**, !dbg !232
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i.i61, align 8, !dbg !232, !tbaa !122
  %activate.i.i62 = getelementptr inbounds i8* %call.i59, i64 16, !dbg !233
  %4 = bitcast i8* %activate.i.i62 to %struct.Toggle* (%struct.Toggle*)**, !dbg !233
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !234, metadata !104) #4, !dbg !236
  %count_max.i.i = getelementptr inbounds i8* %call.i59, i64 24, !dbg !237
  %5 = bitcast i8* %count_max.i.i to i32*, !dbg !237
  store i32 3, i32* %5, align 4, !dbg !237, !tbaa !146
  %counter.i.i = getelementptr inbounds i8* %call.i59, i64 28, !dbg !238
  %6 = bitcast i8* %counter.i.i to i32*, !dbg !238
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %4, align 8, !dbg !239, !tbaa !161
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !209
  %7 = bitcast i8* %call.i59 to %struct.Toggle*, !dbg !240
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %7, i64 0, metadata !242, metadata !104), !dbg !244
  %call28 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %7, i64 0, metadata !242, metadata !104), !dbg !244
  %call28.1 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  store i8 0, i8* %call.i59, align 1, !dbg !246, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %7, i64 0, metadata !242, metadata !104), !dbg !244
  %call28.2 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  store i32 1, i32* %6, align 4, !dbg !247, !tbaa !142
  %call26.3 = tail call signext i8 @toggle_value(%struct.Toggle* %7) #4, !dbg !243
  %tobool27.3 = icmp eq i8 %call26.3, 0, !dbg !248
  %..3 = select i1 %tobool27.3, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %call28.3 = tail call i32 @puts(i8* %..3) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  %8 = bitcast i8* %call.i59 to %struct.NthToggle*, !dbg !243
  %call23.4 = tail call %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %8) #4, !dbg !243
  %value24.4 = getelementptr inbounds %struct.NthToggle* %call23.4, i64 0, i32 0, i32 1, !dbg !243
  %value25.4 = bitcast {}** %value24.4 to i8 (%struct.Toggle*)**, !dbg !243
  %9 = load i8 (%struct.Toggle*)** %value25.4, align 8, !dbg !243, !tbaa !122
  %call26.4 = tail call signext i8 %9(%struct.Toggle* %7) #4, !dbg !243
  %tobool27.4 = icmp eq i8 %call26.4, 0, !dbg !248
  %..4 = select i1 %tobool27.4, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %call28.4 = tail call i32 @puts(i8* %..4) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  %10 = load %struct.Toggle* (%struct.Toggle*)** %4, align 8, !dbg !243, !tbaa !161
  %call23.5 = tail call %struct.Toggle* %10(%struct.Toggle* %7) #4, !dbg !243
  %value24.5 = getelementptr inbounds %struct.Toggle* %call23.5, i64 0, i32 1, !dbg !243
  %value25.5 = bitcast {}** %value24.5 to i8 (%struct.Toggle*)**, !dbg !243
  %11 = load i8 (%struct.Toggle*)** %value25.5, align 8, !dbg !243, !tbaa !122
  %call26.5 = tail call signext i8 %11(%struct.Toggle* %7) #4, !dbg !243
  %tobool27.5 = icmp eq i8 %call26.5, 0, !dbg !248
  %..5 = select i1 %tobool27.5, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %call28.5 = tail call i32 @puts(i8* %..5) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  %12 = load %struct.Toggle* (%struct.Toggle*)** %4, align 8, !dbg !243, !tbaa !161
  %call23.6 = tail call %struct.Toggle* %12(%struct.Toggle* %7) #4, !dbg !243
  %value24.6 = getelementptr inbounds %struct.Toggle* %call23.6, i64 0, i32 1, !dbg !243
  %value25.6 = bitcast {}** %value24.6 to i8 (%struct.Toggle*)**, !dbg !243
  %13 = load i8 (%struct.Toggle*)** %value25.6, align 8, !dbg !243, !tbaa !122
  %call26.6 = tail call signext i8 %13(%struct.Toggle* %7) #4, !dbg !243
  %tobool27.6 = icmp eq i8 %call26.6, 0, !dbg !248
  %..6 = select i1 %tobool27.6, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %call28.6 = tail call i32 @puts(i8* %..6) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  %14 = load %struct.Toggle* (%struct.Toggle*)** %4, align 8, !dbg !243, !tbaa !161
  %call23.7 = tail call %struct.Toggle* %14(%struct.Toggle* %7) #4, !dbg !243
  %value24.7 = getelementptr inbounds %struct.Toggle* %call23.7, i64 0, i32 1, !dbg !243
  %value25.7 = bitcast {}** %value24.7 to i8 (%struct.Toggle*)**, !dbg !243
  %15 = load i8 (%struct.Toggle*)** %value25.7, align 8, !dbg !243, !tbaa !122
  %call26.7 = tail call signext i8 %15(%struct.Toggle* %7) #4, !dbg !243
  %tobool27.7 = icmp eq i8 %call26.7, 0, !dbg !248
  %..7 = select i1 %tobool27.7, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %call28.7 = tail call i32 @puts(i8* %..7) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !83, metadata !104), !dbg !209
  tail call void @free(i8* %call.i59) #4, !dbg !249
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !209
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!101, !102}
!llvm.ident = !{!103}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !7, !37, !100, !100} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c] [DW_LANG_C99]
!1 = !{!"objinst.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\0010\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6}
!5 = !{!"0x28\00false\000"}                       ; [ DW_TAG_enumerator ] [false :: 0]
!6 = !{!"0x28\00true\001"}                        ; [ DW_TAG_enumerator ] [true :: 1]
!7 = !{!8, !23, !26, !32, !34, !36}
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Toggle]
!9 = !{!"0x16\00Toggle\0021\000\000\000\000", !1, null, !10} ; [ DW_TAG_typedef ] [Toggle] [line 21, size 0, align 0, offset 0] [from Toggle]
!10 = !{!"0x13\00Toggle\0019\00192\0064\000\000\000", !1, null, null, !11, null, null, null} ; [ DW_TAG_structure_type ] [Toggle] [line 19, size 192, align 64, offset 0] [def] [from ]
!11 = !{!12, !14, !19}
!12 = !{!"0xd\00state\0020\008\008\000\000", !1, !10, !13} ; [ DW_TAG_member ] [state] [line 20, size 8, align 8, offset 0] [from char]
!13 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!14 = !{!"0xd\00value\0020\0064\0064\0064\000", !1, !10, !15} ; [ DW_TAG_member ] [value] [line 20, size 64, align 64, offset 64] [from ]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!13, !18}
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Toggle]
!19 = !{!"0xd\00activate\0020\0064\0064\00128\000", !1, !10, !20} ; [ DW_TAG_member ] [activate] [line 20, size 64, align 64, offset 128] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!18, !18}
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!8, !8}
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from NthToggle]
!27 = !{!"0x16\00NthToggle\0046\000\000\000\000", !1, null, !28} ; [ DW_TAG_typedef ] [NthToggle] [line 46, size 0, align 0, offset 0] [from NthToggle]
!28 = !{!"0x13\00NthToggle\0042\00256\0064\000\000\000", !1, null, null, !29, null, null, null} ; [ DW_TAG_structure_type ] [NthToggle] [line 42, size 256, align 64, offset 0] [def] [from ]
!29 = !{!30, !31, !33}
!30 = !{!"0xd\00base\0043\00192\0064\000\000", !1, !28, !9} ; [ DW_TAG_member ] [base] [line 43, size 192, align 64, offset 0] [from Toggle]
!31 = !{!"0xd\00count_max\0044\0032\0032\00192\000", !1, !28, !32} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!32 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!33 = !{!"0xd\00counter\0045\0032\0032\00224\000", !1, !28, !32} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!34 = !{!"0xf\00\000\0064\0064\000\000", null, null, !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!35 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!36 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!37 = !{!38, !44, !47, !53, !59, !64, !70, !77, !93}
!38 = !{!"0x2e\00toggle_value\00toggle_value\00\0023\000\001\000\000\00256\001\0023", !1, !39, !40, null, i8 (%struct.Toggle*)* @toggle_value, null, null, !42} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
!39 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!40 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !41, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = !{!13, !8}
!42 = !{!43}
!43 = !{!"0x101\00this\0016777239\000", !38, !39, !8} ; [ DW_TAG_arg_variable ] [this] [line 23]
!44 = !{!"0x2e\00toggle_activate\00toggle_activate\00\0026\000\001\000\000\00256\001\0026", !1, !39, !24, null, %struct.Toggle* (%struct.Toggle*)* @toggle_activate, null, null, !45} ; [ DW_TAG_subprogram ] [line 26] [def] [toggle_activate]
!45 = !{!46}
!46 = !{!"0x101\00this\0016777242\000", !44, !39, !8} ; [ DW_TAG_arg_variable ] [this] [line 26]
!47 = !{!"0x2e\00init_Toggle\00init_Toggle\00\0030\000\001\000\000\00256\001\0030", !1, !39, !48, null, %struct.Toggle* (%struct.Toggle*, i8)* @init_Toggle, null, null, !50} ; [ DW_TAG_subprogram ] [line 30] [def] [init_Toggle]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{!8, !8, !13}
!50 = !{!51, !52}
!51 = !{!"0x101\00this\0016777246\000", !47, !39, !8} ; [ DW_TAG_arg_variable ] [this] [line 30]
!52 = !{!"0x101\00start_state\0033554462\000", !47, !39, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!53 = !{!"0x2e\00new_Toggle\00new_Toggle\00\0036\000\001\000\000\00256\001\0036", !1, !39, !54, null, %struct.Toggle* (i8)* @new_Toggle, null, null, !56} ; [ DW_TAG_subprogram ] [line 36] [def] [new_Toggle]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{!8, !13}
!56 = !{!57, !58}
!57 = !{!"0x101\00start_state\0016777252\000", !53, !39, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!58 = !{!"0x100\00this\0037\000", !53, !39, !8}   ; [ DW_TAG_auto_variable ] [this] [line 37]
!59 = !{!"0x2e\00nth_toggle_activate\00nth_toggle_activate\00\0048\000\001\000\000\00256\001\0048", !1, !39, !60, null, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, !62} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{!26, !26}
!62 = !{!63}
!63 = !{!"0x101\00this\0016777264\000", !59, !39, !26} ; [ DW_TAG_arg_variable ] [this] [line 48]
!64 = !{!"0x2e\00init_NthToggle\00init_NthToggle\00\0055\000\001\000\000\00256\001\0055", !1, !39, !65, null, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, !67} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{!26, !26, !32}
!67 = !{!68, !69}
!68 = !{!"0x101\00this\0016777271\000", !64, !39, !26} ; [ DW_TAG_arg_variable ] [this] [line 55]
!69 = !{!"0x101\00max_count\0033554487\000", !64, !39, !32} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!70 = !{!"0x2e\00new_NthToggle\00new_NthToggle\00\0061\000\001\000\000\00256\001\0061", !1, !39, !71, null, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, !73} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!71 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !72, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = !{!26, !13, !32}
!73 = !{!74, !75, !76}
!74 = !{!"0x101\00start_state\0016777277\000", !70, !39, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!75 = !{!"0x101\00max_count\0033554493\000", !70, !39, !32} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!76 = !{!"0x100\00this\0062\000", !70, !39, !26}  ; [ DW_TAG_auto_variable ] [this] [line 62]
!77 = !{!"0x2e\00main\00main\00\0068\000\001\000\000\00256\001\0068", !1, !39, !78, null, i32 (i32, i8**)* @main, null, null, !80} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!78 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !79, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = !{!32, !32, !34}
!80 = !{!81, !82, !83, !84, !85, !86, !87}
!81 = !{!"0x101\00argc\0016777284\000", !77, !39, !32} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!82 = !{!"0x101\00argv\0033554500\000", !77, !39, !34} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!83 = !{!"0x100\00i\0074\000", !77, !39, !32}     ; [ DW_TAG_auto_variable ] [i] [line 74]
!84 = !{!"0x100\00n\0074\000", !77, !39, !32}     ; [ DW_TAG_auto_variable ] [n] [line 74]
!85 = !{!"0x100\00tog\0075\000", !77, !39, !8}    ; [ DW_TAG_auto_variable ] [tog] [line 75]
!86 = !{!"0x100\00ntog\0076\000", !77, !39, !26}  ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!87 = !{!"0x100\00Msg\0092\000", !88, !39, !91}   ; [ DW_TAG_auto_variable ] [Msg] [line 92]
!88 = !{!"0xb\0091\0025\0010", !1, !89}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!89 = !{!"0xb\0091\005\009", !1, !90}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!90 = !{!"0xb\0091\005\008", !1, !77}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!91 = !{!"0xf\00\000\0064\0064\000\000", null, null, !92} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!92 = !{!"0x26\00\000\000\000\000\000", null, null, !13} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!93 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !94, !95, !96, null, null, null, null, !98} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!94 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!95 = !{!"0x29", !94}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!96 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !97, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = !{!32, !91}
!98 = !{!99}
!99 = !{!"0x101\00__nptr\0016777494\000", !93, !95, !91} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!100 = !{}
!101 = !{i32 2, !"Dwarf Version", i32 4}
!102 = !{i32 2, !"Debug Info Version", i32 2}
!103 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!104 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!105 = !MDLocation(line: 23, column: 27, scope: !38)
!106 = !MDLocation(line: 24, column: 12, scope: !38)
!107 = !{!108, !109, i64 0}
!108 = !{!"Toggle", !109, i64 0, !111, i64 8, !111, i64 16}
!109 = !{!"omnipotent char", !110, i64 0}
!110 = !{!"Simple C/C++ TBAA"}
!111 = !{!"any pointer", !109, i64 0}
!112 = !MDLocation(line: 24, column: 5, scope: !38)
!113 = !MDLocation(line: 26, column: 33, scope: !44)
!114 = !MDLocation(line: 27, column: 20, scope: !44)
!115 = !MDLocation(line: 27, column: 19, scope: !44)
!116 = !MDLocation(line: 27, column: 5, scope: !44)
!117 = !MDLocation(line: 28, column: 5, scope: !44)
!118 = !MDLocation(line: 30, column: 29, scope: !47)
!119 = !MDLocation(line: 30, column: 40, scope: !47)
!120 = !MDLocation(line: 31, column: 5, scope: !47)
!121 = !MDLocation(line: 32, column: 5, scope: !47)
!122 = !{!108, !111, i64 8}
!123 = !MDLocation(line: 33, column: 5, scope: !47)
!124 = !{!108, !111, i64 16}
!125 = !MDLocation(line: 34, column: 5, scope: !47)
!126 = !MDLocation(line: 36, column: 25, scope: !53)
!127 = !MDLocation(line: 37, column: 30, scope: !53)
!128 = !MDLocation(line: 37, column: 20, scope: !53)
!129 = !MDLocation(line: 37, column: 13, scope: !53)
!130 = !{!"0x101\00this\0016777246\000", !47, !39, !8, !131} ; [ DW_TAG_arg_variable ] [this] [line 30]
!131 = !MDLocation(line: 38, column: 12, scope: !53)
!132 = !MDLocation(line: 30, column: 29, scope: !47, inlinedAt: !131)
!133 = !{!"0x101\00start_state\0033554462\000", !47, !39, !13, !131} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!134 = !MDLocation(line: 30, column: 40, scope: !47, inlinedAt: !131)
!135 = !MDLocation(line: 31, column: 5, scope: !47, inlinedAt: !131)
!136 = !MDLocation(line: 32, column: 5, scope: !47, inlinedAt: !131)
!137 = !MDLocation(line: 33, column: 5, scope: !47, inlinedAt: !131)
!138 = !MDLocation(line: 38, column: 5, scope: !53)
!139 = !MDLocation(line: 48, column: 43, scope: !59)
!140 = !MDLocation(line: 49, column: 9, scope: !141)
!141 = !{!"0xb\0049\009\000", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!142 = !{!143, !144, i64 28}
!143 = !{!"NthToggle", !108, i64 0, !144, i64 24, !144, i64 28}
!144 = !{!"int", !109, i64 0}
!145 = !MDLocation(line: 49, column: 28, scope: !141)
!146 = !{!143, !144, i64 24}
!147 = !MDLocation(line: 49, column: 9, scope: !59)
!148 = !MDLocation(line: 50, column: 22, scope: !149)
!149 = !{!"0xb\0049\0045\001", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!150 = !{!143, !109, i64 0}
!151 = !MDLocation(line: 50, column: 21, scope: !149)
!152 = !MDLocation(line: 50, column: 2, scope: !149)
!153 = !MDLocation(line: 51, column: 2, scope: !149)
!154 = !MDLocation(line: 52, column: 5, scope: !149)
!155 = !MDLocation(line: 53, column: 5, scope: !59)
!156 = !MDLocation(line: 55, column: 38, scope: !64)
!157 = !MDLocation(line: 55, column: 48, scope: !64)
!158 = !MDLocation(line: 56, column: 5, scope: !64)
!159 = !MDLocation(line: 57, column: 5, scope: !64)
!160 = !MDLocation(line: 58, column: 5, scope: !64)
!161 = !{!143, !111, i64 16}
!162 = !MDLocation(line: 59, column: 5, scope: !64)
!163 = !MDLocation(line: 61, column: 31, scope: !70)
!164 = !MDLocation(line: 61, column: 48, scope: !70)
!165 = !MDLocation(line: 62, column: 36, scope: !70)
!166 = !{!"0x101\00start_state\0033554462\000", !47, !39, !13, !167} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!167 = !MDLocation(line: 63, column: 25, scope: !70)
!168 = !MDLocation(line: 30, column: 40, scope: !47, inlinedAt: !167)
!169 = !MDLocation(line: 31, column: 5, scope: !47, inlinedAt: !167)
!170 = !MDLocation(line: 32, column: 5, scope: !47, inlinedAt: !167)
!171 = !MDLocation(line: 33, column: 5, scope: !47, inlinedAt: !167)
!172 = !MDLocation(line: 63, column: 12, scope: !70)
!173 = !MDLocation(line: 62, column: 16, scope: !70)
!174 = !{!"0x101\00this\0016777271\000", !64, !39, !26, !175} ; [ DW_TAG_arg_variable ] [this] [line 55]
!175 = !MDLocation(line: 64, column: 12, scope: !70)
!176 = !MDLocation(line: 55, column: 38, scope: !64, inlinedAt: !175)
!177 = !{!"0x101\00max_count\0033554487\000", !64, !39, !32, !175} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!178 = !MDLocation(line: 55, column: 48, scope: !64, inlinedAt: !175)
!179 = !MDLocation(line: 56, column: 5, scope: !64, inlinedAt: !175)
!180 = !MDLocation(line: 57, column: 5, scope: !64, inlinedAt: !175)
!181 = !MDLocation(line: 58, column: 5, scope: !64, inlinedAt: !175)
!182 = !MDLocation(line: 64, column: 5, scope: !70)
!183 = !MDLocation(line: 68, column: 14, scope: !77)
!184 = !MDLocation(line: 68, column: 26, scope: !77)
!185 = !MDLocation(line: 74, column: 18, scope: !77)
!186 = !MDLocation(line: 74, column: 17, scope: !77)
!187 = !MDLocation(line: 74, column: 36, scope: !188)
!188 = !{!"0xb\001", !1, !77}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!189 = !{!111, !111, i64 0}
!190 = !{!"0x101\00__nptr\0016777494\000", !93, !95, !91, !191} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!191 = !MDLocation(line: 74, column: 31, scope: !77)
!192 = !MDLocation(line: 278, column: 1, scope: !93, inlinedAt: !191)
!193 = !MDLocation(line: 280, column: 16, scope: !93, inlinedAt: !191)
!194 = !{!"0x101\00start_state\0016777252\000", !53, !39, !13, !195} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!195 = !MDLocation(line: 78, column: 11, scope: !77)
!196 = !MDLocation(line: 36, column: 25, scope: !53, inlinedAt: !195)
!197 = !MDLocation(line: 37, column: 30, scope: !53, inlinedAt: !195)
!198 = !MDLocation(line: 37, column: 20, scope: !53, inlinedAt: !195)
!199 = !{!"0x100\00this\0037\000", !53, !39, !8, !195} ; [ DW_TAG_auto_variable ] [this] [line 37]
!200 = !MDLocation(line: 37, column: 13, scope: !53, inlinedAt: !195)
!201 = !{!"0x101\00this\0016777246\000", !47, !39, !8, !202} ; [ DW_TAG_arg_variable ] [this] [line 30]
!202 = !MDLocation(line: 38, column: 12, scope: !53, inlinedAt: !195)
!203 = !MDLocation(line: 30, column: 29, scope: !47, inlinedAt: !202)
!204 = !{!"0x101\00start_state\0033554462\000", !47, !39, !13, !202} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!205 = !MDLocation(line: 30, column: 40, scope: !47, inlinedAt: !202)
!206 = !MDLocation(line: 32, column: 5, scope: !47, inlinedAt: !202)
!207 = !MDLocation(line: 33, column: 5, scope: !47, inlinedAt: !202)
!208 = !MDLocation(line: 75, column: 13, scope: !77)
!209 = !MDLocation(line: 74, column: 9, scope: !77)
!210 = !{!"0x101\00this\0016777242\000", !44, !39, !8, !211} ; [ DW_TAG_arg_variable ] [this] [line 26]
!211 = !MDLocation(line: 80, column: 8, scope: !212)
!212 = !{!"0xb\0079\0025\004", !1, !213}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!213 = !{!"0xb\0079\005\003", !1, !214}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!214 = !{!"0xb\0079\005\002", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!215 = !MDLocation(line: 26, column: 33, scope: !44, inlinedAt: !211)
!216 = !{!"0x101\00this\0016777239\000", !38, !39, !8, !211} ; [ DW_TAG_arg_variable ] [this] [line 23]
!217 = !MDLocation(line: 23, column: 27, scope: !38, inlinedAt: !211)
!218 = !MDLocation(line: 80, column: 2, scope: !212)
!219 = !MDLocation(line: 27, column: 5, scope: !44, inlinedAt: !211)
!220 = !MDLocation(line: 80, column: 7, scope: !212)
!221 = !MDLocation(line: 82, column: 5, scope: !77)
!222 = !MDLocation(line: 88, column: 5, scope: !77)
!223 = !{!"0x101\00start_state\0016777277\000", !70, !39, !13, !224} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!224 = !MDLocation(line: 90, column: 12, scope: !77)
!225 = !MDLocation(line: 61, column: 31, scope: !70, inlinedAt: !224)
!226 = !{!"0x101\00max_count\0033554493\000", !70, !39, !32, !224} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!227 = !MDLocation(line: 61, column: 48, scope: !70, inlinedAt: !224)
!228 = !MDLocation(line: 62, column: 36, scope: !70, inlinedAt: !224)
!229 = !{!"0x101\00start_state\0033554462\000", !47, !39, !13, !230} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!230 = !MDLocation(line: 63, column: 25, scope: !70, inlinedAt: !224)
!231 = !MDLocation(line: 30, column: 40, scope: !47, inlinedAt: !230)
!232 = !MDLocation(line: 32, column: 5, scope: !47, inlinedAt: !230)
!233 = !MDLocation(line: 33, column: 5, scope: !47, inlinedAt: !230)
!234 = !{!"0x101\00max_count\0033554487\000", !64, !39, !32, !235} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!235 = !MDLocation(line: 64, column: 12, scope: !70, inlinedAt: !224)
!236 = !MDLocation(line: 55, column: 48, scope: !64, inlinedAt: !235)
!237 = !MDLocation(line: 56, column: 5, scope: !64, inlinedAt: !235)
!238 = !MDLocation(line: 57, column: 5, scope: !64, inlinedAt: !235)
!239 = !MDLocation(line: 58, column: 5, scope: !64, inlinedAt: !235)
!240 = !MDLocation(line: 93, column: 26, scope: !241)
!241 = !{!"0xb\0093\006\0011", !1, !88}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!242 = !{!"0x101\00this\0016777239\000", !38, !39, !8, !243} ; [ DW_TAG_arg_variable ] [this] [line 23]
!243 = !MDLocation(line: 93, column: 6, scope: !241)
!244 = !MDLocation(line: 23, column: 27, scope: !38, inlinedAt: !243)
!245 = !MDLocation(line: 97, column: 2, scope: !88)
!246 = !MDLocation(line: 50, column: 2, scope: !149, inlinedAt: !243)
!247 = !MDLocation(line: 49, column: 9, scope: !141, inlinedAt: !243)
!248 = !MDLocation(line: 93, column: 6, scope: !88)
!249 = !MDLocation(line: 99, column: 5, scope: !77)
!250 = !MDLocation(line: 104, column: 5, scope: !77)
