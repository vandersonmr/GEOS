; ModuleID = 'methcall.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)*, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

; Function Attrs: nounwind readonly uwtable
define signext i8 @toggle_value(%struct.Toggle* nocapture readonly %this) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %this, i64 0, metadata !45, metadata !103), !dbg !104
  %state = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !105
  %0 = load i8* %state, align 1, !dbg !105, !tbaa !106
  ret i8 %0, !dbg !111
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %this, i64 0, metadata !48, metadata !103), !dbg !112
  %state = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !113
  %0 = load i8* %state, align 1, !dbg !113, !tbaa !106
  %lnot = icmp eq i8 %0, 0, !dbg !114
  %conv = zext i1 %lnot to i8, !dbg !114
  store i8 %conv, i8* %state, align 1, !dbg !115, !tbaa !106
  ret %struct.Toggle* %this, !dbg !116
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %this, i64 0, metadata !53, metadata !103), !dbg !117
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !54, metadata !103), !dbg !118
  %state = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 0, !dbg !119
  store i8 %start_state, i8* %state, align 1, !dbg !119, !tbaa !106
  %value = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 1, !dbg !120
  %value1 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !120
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1, align 8, !dbg !120, !tbaa !121
  %activate = getelementptr inbounds %struct.Toggle* %this, i64 0, i32 2, !dbg !122
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !122, !tbaa !123
  ret %struct.Toggle* %this, !dbg !124
}

; Function Attrs: nounwind uwtable
define noalias %struct.Toggle* @new_Toggle(i8 signext %start_state) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !59, metadata !103), !dbg !125
  %call = tail call noalias i8* @malloc(i64 24) #4, !dbg !126
  %0 = bitcast i8* %call to %struct.Toggle*, !dbg !127
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %0, i64 0, metadata !60, metadata !103), !dbg !128
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %0, i64 0, metadata !129, metadata !103), !dbg !131
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !132, metadata !103), !dbg !133
  store i8 %start_state, i8* %call, align 1, !dbg !134, !tbaa !106
  %value.i = getelementptr inbounds i8* %call, i64 8, !dbg !135
  %value1.i = bitcast i8* %value.i to i8 (%struct.Toggle*)**, !dbg !135
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i, align 8, !dbg !135, !tbaa !121
  %activate.i = getelementptr inbounds i8* %call, i64 16, !dbg !136
  %1 = bitcast i8* %activate.i to %struct.Toggle* (%struct.Toggle*)**, !dbg !136
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %1, align 8, !dbg !136, !tbaa !123
  ret %struct.Toggle* %0, !dbg !137
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %this, i64 0, metadata !65, metadata !103), !dbg !138
  %counter = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 4, !dbg !139
  %0 = load i32* %counter, align 4, !dbg !139, !tbaa !141
  %inc = add nsw i32 %0, 1, !dbg !139
  store i32 %inc, i32* %counter, align 4, !dbg !139, !tbaa !141
  %count_max = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 3, !dbg !144
  %1 = load i32* %count_max, align 4, !dbg !144, !tbaa !145
  %cmp = icmp slt i32 %inc, %1, !dbg !139
  br i1 %cmp, label %if.end, label %if.then, !dbg !146

if.then:                                          ; preds = %entry
  %state = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, !dbg !147
  %2 = load i8* %state, align 1, !dbg !147, !tbaa !149
  %lnot = icmp eq i8 %2, 0, !dbg !150
  %conv = zext i1 %lnot to i8, !dbg !150
  store i8 %conv, i8* %state, align 1, !dbg !151, !tbaa !149
  store i32 0, i32* %counter, align 4, !dbg !152, !tbaa !141
  br label %if.end, !dbg !153

if.end:                                           ; preds = %entry, %if.then
  ret %struct.NthToggle* %this, !dbg !154
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %this, i64 0, metadata !70, metadata !103), !dbg !155
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !71, metadata !103), !dbg !156
  %count_max = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 3, !dbg !157
  store i32 %max_count, i32* %count_max, align 4, !dbg !157, !tbaa !145
  %counter = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 4, !dbg !158
  store i32 0, i32* %counter, align 4, !dbg !158, !tbaa !141
  %activate = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !159
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !159, !tbaa !160
  ret %struct.NthToggle* %this, !dbg !161
}

; Function Attrs: nounwind uwtable
define noalias %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !76, metadata !103), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !77, metadata !103), !dbg !163
  %call = tail call noalias i8* @malloc(i64 32) #4, !dbg !164
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !165, metadata !103), !dbg !167
  store i8 %start_state, i8* %call, align 1, !dbg !168, !tbaa !106
  %value.i = getelementptr inbounds i8* %call, i64 8, !dbg !169
  %value1.i = bitcast i8* %value.i to i8 (%struct.Toggle*)**, !dbg !169
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i, align 8, !dbg !169, !tbaa !121
  %activate.i = getelementptr inbounds i8* %call, i64 16, !dbg !170
  %0 = bitcast i8* %activate.i to %struct.Toggle* (%struct.Toggle*)**, !dbg !170
  %1 = bitcast i8* %call to %struct.NthToggle*, !dbg !171
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %1, i64 0, metadata !78, metadata !103), !dbg !172
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %1, i64 0, metadata !173, metadata !103), !dbg !175
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !176, metadata !103), !dbg !177
  %count_max.i = getelementptr inbounds i8* %call, i64 24, !dbg !178
  %2 = bitcast i8* %count_max.i to i32*, !dbg !178
  store i32 %max_count, i32* %2, align 4, !dbg !178, !tbaa !145
  %counter.i = getelementptr inbounds i8* %call, i64 28, !dbg !179
  %3 = bitcast i8* %counter.i to i32*, !dbg !179
  store i32 0, i32* %3, align 4, !dbg !179, !tbaa !141
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %0, align 8, !dbg !180, !tbaa !160
  ret %struct.NthToggle* %1, !dbg !181
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !83, metadata !103), !dbg !182
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !84, metadata !103), !dbg !183
  %cmp = icmp eq i32 %argc, 2, !dbg !184
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !185

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !186
  %0 = load i8** %arrayidx, align 8, !dbg !186, !tbaa !188
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !189, metadata !103) #4, !dbg !191
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #4, !dbg !192
  %conv.i = trunc i64 %call.i to i32, !dbg !193
  br label %cond.end, !dbg !185

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %conv.i, %cond.true ], [ 500000000, %entry ], !dbg !185
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !86, metadata !103), !dbg !194
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !89, metadata !103), !dbg !195
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !196, metadata !103) #4, !dbg !198
  %call.i38 = tail call noalias i8* @malloc(i64 24) #4, !dbg !199
  %1 = bitcast i8* %call.i38 to %struct.Toggle*, !dbg !200
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !201, metadata !103) #4, !dbg !202
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !203, metadata !103) #4, !dbg !205
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !206, metadata !103) #4, !dbg !207
  store i8 1, i8* %call.i38, align 1, !dbg !208, !tbaa !106
  %value.i.i = getelementptr inbounds i8* %call.i38, i64 8, !dbg !209
  %value1.i.i = bitcast i8* %value.i.i to i8 (%struct.Toggle*)**, !dbg !209
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i.i, align 8, !dbg !209, !tbaa !121
  %activate.i.i = getelementptr inbounds i8* %call.i38, i64 16, !dbg !210
  %2 = bitcast i8* %activate.i.i to %struct.Toggle* (%struct.Toggle*)**, !dbg !210
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %2, align 8, !dbg !210, !tbaa !123
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %1, i64 0, metadata !87, metadata !103), !dbg !211
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !85, metadata !103), !dbg !212
  %cmp245 = icmp sgt i32 %cond, 0, !dbg !213
  br i1 %cmp245, label %for.body.lr.ph, label %for.end, !dbg !216

for.body.lr.ph:                                   ; preds = %cond.end
  %3 = add i32 %cond, -1, !dbg !216
  br label %for.body, !dbg !216

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %4 = phi %struct.Toggle* (%struct.Toggle*)* [ @toggle_activate, %for.body.lr.ph ], [ %.pre, %for.body.for.body_crit_edge ]
  %i.046 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body.for.body_crit_edge ]
  %call3 = tail call %struct.Toggle* %4(%struct.Toggle* %1) #4, !dbg !217
  %value = getelementptr inbounds %struct.Toggle* %call3, i64 0, i32 1, !dbg !217
  %value4 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !217
  %5 = load i8 (%struct.Toggle*)** %value4, align 8, !dbg !217, !tbaa !121
  %call5 = tail call signext i8 %5(%struct.Toggle* %1) #4, !dbg !217
  tail call void @llvm.dbg.value(metadata i8 %call5, i64 0, metadata !89, metadata !103), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !85, metadata !103), !dbg !212
  %exitcond50 = icmp eq i32 %i.046, %3, !dbg !216
  br i1 %exitcond50, label %for.cond.for.end_crit_edge, label %for.body.for.body_crit_edge, !dbg !216

for.body.for.body_crit_edge:                      ; preds = %for.body
  %inc = add nuw nsw i32 %i.046, 1, !dbg !219
  %.pre = load %struct.Toggle* (%struct.Toggle*)** %2, align 8, !dbg !217, !tbaa !123
  br label %for.body, !dbg !216

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %call5.lcssa = phi i8 [ %call5, %for.body ]
  %phitmp = icmp ne i8 %call5.lcssa, 0, !dbg !216
  %phitmp47 = select i1 %phitmp, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), !dbg !216
  br label %for.end, !dbg !216

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %cond.end
  %val.0.lcssa = phi i8* [ %phitmp47, %for.cond.for.end_crit_edge ], [ getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), %cond.end ]
  %call7 = tail call i32 @puts(i8* %val.0.lcssa) #4, !dbg !220
  tail call void @free(i8* %call.i38) #4, !dbg !221
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !89, metadata !103), !dbg !195
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !222, metadata !103) #4, !dbg !224
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !225, metadata !103) #4, !dbg !226
  %call.i39 = tail call noalias i8* @malloc(i64 32) #4, !dbg !227
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !228, metadata !103) #4, !dbg !230
  store i8 1, i8* %call.i39, align 1, !dbg !231, !tbaa !106
  %value.i.i40 = getelementptr inbounds i8* %call.i39, i64 8, !dbg !232
  %value1.i.i41 = bitcast i8* %value.i.i40 to i8 (%struct.Toggle*)**, !dbg !232
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1.i.i41, align 8, !dbg !232, !tbaa !121
  %activate.i.i42 = getelementptr inbounds i8* %call.i39, i64 16, !dbg !233
  %6 = bitcast i8* %activate.i.i42 to %struct.Toggle* (%struct.Toggle*)**, !dbg !233
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !234, metadata !103) #4, !dbg !236
  %count_max.i.i = getelementptr inbounds i8* %call.i39, i64 24, !dbg !237
  %7 = bitcast i8* %count_max.i.i to i32*, !dbg !237
  store i32 3, i32* %7, align 4, !dbg !237, !tbaa !145
  %counter.i.i = getelementptr inbounds i8* %call.i39, i64 28, !dbg !238
  %8 = bitcast i8* %counter.i.i to i32*, !dbg !238
  store i32 0, i32* %8, align 4, !dbg !238, !tbaa !141
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %6, align 8, !dbg !239, !tbaa !160
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !85, metadata !103), !dbg !212
  br i1 %cmp245, label %for.body12.lr.ph, label %for.end20, !dbg !240

for.body12.lr.ph:                                 ; preds = %for.end
  %9 = bitcast i8* %call.i39 to %struct.Toggle*, !dbg !242
  %10 = add i32 %cond, -1, !dbg !240
  br label %for.body12, !dbg !240

for.body12:                                       ; preds = %for.body12.for.body12_crit_edge, %for.body12.lr.ph
  %11 = phi %struct.Toggle* (%struct.Toggle*)* [ bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %for.body12.lr.ph ], [ %.pre51, %for.body12.for.body12_crit_edge ]
  %i.144 = phi i32 [ 0, %for.body12.lr.ph ], [ %inc19, %for.body12.for.body12_crit_edge ]
  %call14 = tail call %struct.Toggle* %11(%struct.Toggle* %9) #4, !dbg !245
  %value15 = getelementptr inbounds %struct.Toggle* %call14, i64 0, i32 1, !dbg !245
  %value16 = bitcast {}** %value15 to i8 (%struct.Toggle*)**, !dbg !245
  %12 = load i8 (%struct.Toggle*)** %value16, align 8, !dbg !245, !tbaa !121
  %call17 = tail call signext i8 %12(%struct.Toggle* %9) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata i8 %call17, i64 0, metadata !89, metadata !103), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !85, metadata !103), !dbg !212
  %exitcond = icmp eq i32 %i.144, %10, !dbg !240
  br i1 %exitcond, label %for.cond9.for.end20_crit_edge, label %for.body12.for.body12_crit_edge, !dbg !240

for.body12.for.body12_crit_edge:                  ; preds = %for.body12
  %inc19 = add nuw nsw i32 %i.144, 1, !dbg !246
  %.pre51 = load %struct.Toggle* (%struct.Toggle*)** %6, align 8, !dbg !245, !tbaa !160
  br label %for.body12, !dbg !240

for.cond9.for.end20_crit_edge:                    ; preds = %for.body12
  %call17.lcssa = phi i8 [ %call17, %for.body12 ]
  %phitmp48 = icmp ne i8 %call17.lcssa, 0, !dbg !240
  %phitmp49 = select i1 %phitmp48, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), !dbg !240
  br label %for.end20, !dbg !240

for.end20:                                        ; preds = %for.cond9.for.end20_crit_edge, %for.end
  %val.1.lcssa = phi i8* [ %phitmp49, %for.cond9.for.end20_crit_edge ], [ getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), %for.end ]
  %call24 = tail call i32 @puts(i8* %val.1.lcssa) #4, !dbg !247
  tail call void @free(i8* %call.i39) #4, !dbg !248
  ret i32 0, !dbg !249
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!100, !101}
!llvm.ident = !{!102}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !7, !39, !99, !99} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c] [DW_LANG_C99]
!1 = !{!"methcall.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\0010\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6}
!5 = !{!"0x28\00false\000"}                       ; [ DW_TAG_enumerator ] [false :: 0]
!6 = !{!"0x28\00true\001"}                        ; [ DW_TAG_enumerator ] [true :: 1]
!7 = !{!8, !23, !26, !34, !36, !38}
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
!29 = !{!30, !31, !32, !33, !35}
!30 = !{!"0xd\00state\0043\008\008\000\000", !1, !28, !13} ; [ DW_TAG_member ] [state] [line 43, size 8, align 8, offset 0] [from char]
!31 = !{!"0xd\00value\0043\0064\0064\0064\000", !1, !28, !15} ; [ DW_TAG_member ] [value] [line 43, size 64, align 64, offset 64] [from ]
!32 = !{!"0xd\00activate\0043\0064\0064\00128\000", !1, !28, !20} ; [ DW_TAG_member ] [activate] [line 43, size 64, align 64, offset 128] [from ]
!33 = !{!"0xd\00count_max\0044\0032\0032\00192\000", !1, !28, !34} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!34 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!35 = !{!"0xd\00counter\0045\0032\0032\00224\000", !1, !28, !34} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!36 = !{!"0xf\00\000\0064\0064\000\000", null, null, !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!37 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!38 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!39 = !{!40, !46, !49, !55, !61, !66, !72, !79, !90}
!40 = !{!"0x2e\00toggle_value\00toggle_value\00\0023\000\001\000\000\00256\001\0023", !1, !41, !42, null, i8 (%struct.Toggle*)* @toggle_value, null, null, !44} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
!41 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{!13, !8}
!44 = !{!45}
!45 = !{!"0x101\00this\0016777239\000", !40, !41, !8} ; [ DW_TAG_arg_variable ] [this] [line 23]
!46 = !{!"0x2e\00toggle_activate\00toggle_activate\00\0026\000\001\000\000\00256\001\0026", !1, !41, !24, null, %struct.Toggle* (%struct.Toggle*)* @toggle_activate, null, null, !47} ; [ DW_TAG_subprogram ] [line 26] [def] [toggle_activate]
!47 = !{!48}
!48 = !{!"0x101\00this\0016777242\000", !46, !41, !8} ; [ DW_TAG_arg_variable ] [this] [line 26]
!49 = !{!"0x2e\00init_Toggle\00init_Toggle\00\0030\000\001\000\000\00256\001\0030", !1, !41, !50, null, %struct.Toggle* (%struct.Toggle*, i8)* @init_Toggle, null, null, !52} ; [ DW_TAG_subprogram ] [line 30] [def] [init_Toggle]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{!8, !8, !13}
!52 = !{!53, !54}
!53 = !{!"0x101\00this\0016777246\000", !49, !41, !8} ; [ DW_TAG_arg_variable ] [this] [line 30]
!54 = !{!"0x101\00start_state\0033554462\000", !49, !41, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!55 = !{!"0x2e\00new_Toggle\00new_Toggle\00\0036\000\001\000\000\00256\001\0036", !1, !41, !56, null, %struct.Toggle* (i8)* @new_Toggle, null, null, !58} ; [ DW_TAG_subprogram ] [line 36] [def] [new_Toggle]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{!8, !13}
!58 = !{!59, !60}
!59 = !{!"0x101\00start_state\0016777252\000", !55, !41, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!60 = !{!"0x100\00this\0037\000", !55, !41, !8}   ; [ DW_TAG_auto_variable ] [this] [line 37]
!61 = !{!"0x2e\00nth_toggle_activate\00nth_toggle_activate\00\0048\000\001\000\000\00256\001\0048", !1, !41, !62, null, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, !64} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!62 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !63, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = !{!26, !26}
!64 = !{!65}
!65 = !{!"0x101\00this\0016777264\000", !61, !41, !26} ; [ DW_TAG_arg_variable ] [this] [line 48]
!66 = !{!"0x2e\00init_NthToggle\00init_NthToggle\00\0055\000\001\000\000\00256\001\0055", !1, !41, !67, null, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, !69} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!67 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !68, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = !{!26, !26, !34}
!69 = !{!70, !71}
!70 = !{!"0x101\00this\0016777271\000", !66, !41, !26} ; [ DW_TAG_arg_variable ] [this] [line 55]
!71 = !{!"0x101\00max_count\0033554487\000", !66, !41, !34} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!72 = !{!"0x2e\00new_NthToggle\00new_NthToggle\00\0061\000\001\000\000\00256\001\0061", !1, !41, !73, null, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, !75} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!73 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !74, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = !{!26, !13, !34}
!75 = !{!76, !77, !78}
!76 = !{!"0x101\00start_state\0016777277\000", !72, !41, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!77 = !{!"0x101\00max_count\0033554493\000", !72, !41, !34} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!78 = !{!"0x100\00this\0062\000", !72, !41, !26}  ; [ DW_TAG_auto_variable ] [this] [line 62]
!79 = !{!"0x2e\00main\00main\00\0068\000\001\000\000\00256\001\0068", !1, !41, !80, null, i32 (i32, i8**)* @main, null, null, !82} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!80 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !81, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = !{!34, !34, !36}
!82 = !{!83, !84, !85, !86, !87, !88, !89}
!83 = !{!"0x101\00argc\0016777284\000", !79, !41, !34} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!84 = !{!"0x101\00argv\0033554500\000", !79, !41, !36} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!85 = !{!"0x100\00i\0074\000", !79, !41, !34}     ; [ DW_TAG_auto_variable ] [i] [line 74]
!86 = !{!"0x100\00n\0074\000", !79, !41, !34}     ; [ DW_TAG_auto_variable ] [n] [line 74]
!87 = !{!"0x100\00tog\0075\000", !79, !41, !8}    ; [ DW_TAG_auto_variable ] [tog] [line 75]
!88 = !{!"0x100\00ntog\0076\000", !79, !41, !26}  ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!89 = !{!"0x100\00val\0077\000", !79, !41, !13}   ; [ DW_TAG_auto_variable ] [val] [line 77]
!90 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !91, !92, !93, null, null, null, null, !97} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!91 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!92 = !{!"0x29", !91}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!93 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !94, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = !{!34, !95}
!95 = !{!"0xf\00\000\0064\0064\000\000", null, null, !96} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!96 = !{!"0x26\00\000\000\000\000\000", null, null, !13} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!97 = !{!98}
!98 = !{!"0x101\00__nptr\0016777494\000", !90, !92, !95} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!99 = !{}
!100 = !{i32 2, !"Dwarf Version", i32 4}
!101 = !{i32 2, !"Debug Info Version", i32 2}
!102 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!103 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!104 = !MDLocation(line: 23, column: 27, scope: !40)
!105 = !MDLocation(line: 24, column: 12, scope: !40)
!106 = !{!107, !108, i64 0}
!107 = !{!"Toggle", !108, i64 0, !110, i64 8, !110, i64 16}
!108 = !{!"omnipotent char", !109, i64 0}
!109 = !{!"Simple C/C++ TBAA"}
!110 = !{!"any pointer", !108, i64 0}
!111 = !MDLocation(line: 24, column: 5, scope: !40)
!112 = !MDLocation(line: 26, column: 33, scope: !46)
!113 = !MDLocation(line: 27, column: 20, scope: !46)
!114 = !MDLocation(line: 27, column: 19, scope: !46)
!115 = !MDLocation(line: 27, column: 5, scope: !46)
!116 = !MDLocation(line: 28, column: 5, scope: !46)
!117 = !MDLocation(line: 30, column: 29, scope: !49)
!118 = !MDLocation(line: 30, column: 40, scope: !49)
!119 = !MDLocation(line: 31, column: 5, scope: !49)
!120 = !MDLocation(line: 32, column: 5, scope: !49)
!121 = !{!107, !110, i64 8}
!122 = !MDLocation(line: 33, column: 5, scope: !49)
!123 = !{!107, !110, i64 16}
!124 = !MDLocation(line: 34, column: 5, scope: !49)
!125 = !MDLocation(line: 36, column: 25, scope: !55)
!126 = !MDLocation(line: 37, column: 30, scope: !55)
!127 = !MDLocation(line: 37, column: 20, scope: !55)
!128 = !MDLocation(line: 37, column: 13, scope: !55)
!129 = !{!"0x101\00this\0016777246\000", !49, !41, !8, !130} ; [ DW_TAG_arg_variable ] [this] [line 30]
!130 = !MDLocation(line: 38, column: 12, scope: !55)
!131 = !MDLocation(line: 30, column: 29, scope: !49, inlinedAt: !130)
!132 = !{!"0x101\00start_state\0033554462\000", !49, !41, !13, !130} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!133 = !MDLocation(line: 30, column: 40, scope: !49, inlinedAt: !130)
!134 = !MDLocation(line: 31, column: 5, scope: !49, inlinedAt: !130)
!135 = !MDLocation(line: 32, column: 5, scope: !49, inlinedAt: !130)
!136 = !MDLocation(line: 33, column: 5, scope: !49, inlinedAt: !130)
!137 = !MDLocation(line: 38, column: 5, scope: !55)
!138 = !MDLocation(line: 48, column: 43, scope: !61)
!139 = !MDLocation(line: 49, column: 9, scope: !140)
!140 = !{!"0xb\0049\009\000", !1, !61}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!141 = !{!142, !143, i64 28}
!142 = !{!"NthToggle", !108, i64 0, !110, i64 8, !110, i64 16, !143, i64 24, !143, i64 28}
!143 = !{!"int", !108, i64 0}
!144 = !MDLocation(line: 49, column: 28, scope: !140)
!145 = !{!142, !143, i64 24}
!146 = !MDLocation(line: 49, column: 9, scope: !61)
!147 = !MDLocation(line: 50, column: 17, scope: !148)
!148 = !{!"0xb\0049\0045\001", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!149 = !{!142, !108, i64 0}
!150 = !MDLocation(line: 50, column: 16, scope: !148)
!151 = !MDLocation(line: 50, column: 2, scope: !148)
!152 = !MDLocation(line: 51, column: 2, scope: !148)
!153 = !MDLocation(line: 52, column: 5, scope: !148)
!154 = !MDLocation(line: 53, column: 5, scope: !61)
!155 = !MDLocation(line: 55, column: 38, scope: !66)
!156 = !MDLocation(line: 55, column: 48, scope: !66)
!157 = !MDLocation(line: 56, column: 5, scope: !66)
!158 = !MDLocation(line: 57, column: 5, scope: !66)
!159 = !MDLocation(line: 58, column: 5, scope: !66)
!160 = !{!142, !110, i64 16}
!161 = !MDLocation(line: 59, column: 5, scope: !66)
!162 = !MDLocation(line: 61, column: 31, scope: !72)
!163 = !MDLocation(line: 61, column: 48, scope: !72)
!164 = !MDLocation(line: 62, column: 36, scope: !72)
!165 = !{!"0x101\00start_state\0033554462\000", !49, !41, !13, !166} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!166 = !MDLocation(line: 63, column: 25, scope: !72)
!167 = !MDLocation(line: 30, column: 40, scope: !49, inlinedAt: !166)
!168 = !MDLocation(line: 31, column: 5, scope: !49, inlinedAt: !166)
!169 = !MDLocation(line: 32, column: 5, scope: !49, inlinedAt: !166)
!170 = !MDLocation(line: 33, column: 5, scope: !49, inlinedAt: !166)
!171 = !MDLocation(line: 63, column: 12, scope: !72)
!172 = !MDLocation(line: 62, column: 16, scope: !72)
!173 = !{!"0x101\00this\0016777271\000", !66, !41, !26, !174} ; [ DW_TAG_arg_variable ] [this] [line 55]
!174 = !MDLocation(line: 64, column: 12, scope: !72)
!175 = !MDLocation(line: 55, column: 38, scope: !66, inlinedAt: !174)
!176 = !{!"0x101\00max_count\0033554487\000", !66, !41, !34, !174} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!177 = !MDLocation(line: 55, column: 48, scope: !66, inlinedAt: !174)
!178 = !MDLocation(line: 56, column: 5, scope: !66, inlinedAt: !174)
!179 = !MDLocation(line: 57, column: 5, scope: !66, inlinedAt: !174)
!180 = !MDLocation(line: 58, column: 5, scope: !66, inlinedAt: !174)
!181 = !MDLocation(line: 64, column: 5, scope: !72)
!182 = !MDLocation(line: 68, column: 14, scope: !79)
!183 = !MDLocation(line: 68, column: 26, scope: !79)
!184 = !MDLocation(line: 74, column: 18, scope: !79)
!185 = !MDLocation(line: 74, column: 17, scope: !79)
!186 = !MDLocation(line: 74, column: 36, scope: !187)
!187 = !{!"0xb\001", !1, !79}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!188 = !{!110, !110, i64 0}
!189 = !{!"0x101\00__nptr\0016777494\000", !90, !92, !95, !190} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!190 = !MDLocation(line: 74, column: 31, scope: !79)
!191 = !MDLocation(line: 278, column: 1, scope: !90, inlinedAt: !190)
!192 = !MDLocation(line: 280, column: 16, scope: !90, inlinedAt: !190)
!193 = !MDLocation(line: 280, column: 10, scope: !90, inlinedAt: !190)
!194 = !MDLocation(line: 74, column: 12, scope: !79)
!195 = !MDLocation(line: 77, column: 10, scope: !79)
!196 = !{!"0x101\00start_state\0016777252\000", !55, !41, !13, !197} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!197 = !MDLocation(line: 79, column: 11, scope: !79)
!198 = !MDLocation(line: 36, column: 25, scope: !55, inlinedAt: !197)
!199 = !MDLocation(line: 37, column: 30, scope: !55, inlinedAt: !197)
!200 = !MDLocation(line: 37, column: 20, scope: !55, inlinedAt: !197)
!201 = !{!"0x100\00this\0037\000", !55, !41, !8, !197} ; [ DW_TAG_auto_variable ] [this] [line 37]
!202 = !MDLocation(line: 37, column: 13, scope: !55, inlinedAt: !197)
!203 = !{!"0x101\00this\0016777246\000", !49, !41, !8, !204} ; [ DW_TAG_arg_variable ] [this] [line 30]
!204 = !MDLocation(line: 38, column: 12, scope: !55, inlinedAt: !197)
!205 = !MDLocation(line: 30, column: 29, scope: !49, inlinedAt: !204)
!206 = !{!"0x101\00start_state\0033554462\000", !49, !41, !13, !204} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!207 = !MDLocation(line: 30, column: 40, scope: !49, inlinedAt: !204)
!208 = !MDLocation(line: 31, column: 5, scope: !49, inlinedAt: !204)
!209 = !MDLocation(line: 32, column: 5, scope: !49, inlinedAt: !204)
!210 = !MDLocation(line: 33, column: 5, scope: !49, inlinedAt: !204)
!211 = !MDLocation(line: 75, column: 13, scope: !79)
!212 = !MDLocation(line: 74, column: 9, scope: !79)
!213 = !MDLocation(line: 80, column: 15, scope: !214)
!214 = !{!"0xb\0080\005\003", !1, !215}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!215 = !{!"0xb\0080\005\002", !1, !79}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!216 = !MDLocation(line: 80, column: 5, scope: !215)
!217 = !MDLocation(line: 81, column: 8, scope: !218)
!218 = !{!"0xb\0080\0025\004", !1, !214}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!219 = !MDLocation(line: 80, column: 20, scope: !214)
!220 = !MDLocation(line: 83, column: 5, scope: !79)
!221 = !MDLocation(line: 84, column: 5, scope: !79)
!222 = !{!"0x101\00start_state\0016777277\000", !72, !41, !13, !223} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!223 = !MDLocation(line: 87, column: 12, scope: !79)
!224 = !MDLocation(line: 61, column: 31, scope: !72, inlinedAt: !223)
!225 = !{!"0x101\00max_count\0033554493\000", !72, !41, !34, !223} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!226 = !MDLocation(line: 61, column: 48, scope: !72, inlinedAt: !223)
!227 = !MDLocation(line: 62, column: 36, scope: !72, inlinedAt: !223)
!228 = !{!"0x101\00start_state\0033554462\000", !49, !41, !13, !229} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!229 = !MDLocation(line: 63, column: 25, scope: !72, inlinedAt: !223)
!230 = !MDLocation(line: 30, column: 40, scope: !49, inlinedAt: !229)
!231 = !MDLocation(line: 31, column: 5, scope: !49, inlinedAt: !229)
!232 = !MDLocation(line: 32, column: 5, scope: !49, inlinedAt: !229)
!233 = !MDLocation(line: 33, column: 5, scope: !49, inlinedAt: !229)
!234 = !{!"0x101\00max_count\0033554487\000", !66, !41, !34, !235} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!235 = !MDLocation(line: 64, column: 12, scope: !72, inlinedAt: !223)
!236 = !MDLocation(line: 55, column: 48, scope: !66, inlinedAt: !235)
!237 = !MDLocation(line: 56, column: 5, scope: !66, inlinedAt: !235)
!238 = !MDLocation(line: 57, column: 5, scope: !66, inlinedAt: !235)
!239 = !MDLocation(line: 58, column: 5, scope: !66, inlinedAt: !235)
!240 = !MDLocation(line: 88, column: 5, scope: !241)
!241 = !{!"0xb\0088\005\005", !1, !79}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!242 = !MDLocation(line: 89, column: 23, scope: !243)
!243 = !{!"0xb\0088\0025\007", !1, !244}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!244 = !{!"0xb\0088\005\006", !1, !241}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!245 = !MDLocation(line: 89, column: 8, scope: !243)
!246 = !MDLocation(line: 88, column: 20, scope: !244)
!247 = !MDLocation(line: 91, column: 5, scope: !79)
!248 = !MDLocation(line: 92, column: 5, scope: !79)
!249 = !MDLocation(line: 93, column: 5, scope: !79)
