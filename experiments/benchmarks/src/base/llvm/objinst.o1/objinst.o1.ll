; ModuleID = 'objinst.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { %struct.Toggle, i32, i32 }

@.str = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

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
define %struct.Toggle* @new_Toggle(i8 signext %start_state) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !57, metadata !104), !dbg !126
  %call = tail call noalias i8* @malloc(i64 24) #5, !dbg !127
  %0 = bitcast i8* %call to %struct.Toggle*, !dbg !128
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %0, i64 0, metadata !58, metadata !104), !dbg !129
  %call1 = tail call %struct.Toggle* @init_Toggle(%struct.Toggle* %0, i8 signext %start_state), !dbg !130
  ret %struct.Toggle* %call1, !dbg !131
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %this, i64 0, metadata !63, metadata !104), !dbg !132
  %counter = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !133
  %0 = load i32* %counter, align 4, !dbg !133, !tbaa !135
  %inc = add nsw i32 %0, 1, !dbg !133
  store i32 %inc, i32* %counter, align 4, !dbg !133, !tbaa !135
  %count_max = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !138
  %1 = load i32* %count_max, align 4, !dbg !138, !tbaa !139
  %cmp = icmp slt i32 %inc, %1, !dbg !133
  br i1 %cmp, label %if.end, label %if.then, !dbg !140

if.then:                                          ; preds = %entry
  %state = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 0, !dbg !141
  %2 = load i8* %state, align 1, !dbg !141, !tbaa !143
  %lnot = icmp eq i8 %2, 0, !dbg !144
  %conv = zext i1 %lnot to i8, !dbg !144
  store i8 %conv, i8* %state, align 1, !dbg !145, !tbaa !143
  store i32 0, i32* %counter, align 4, !dbg !146, !tbaa !135
  br label %if.end, !dbg !147

if.end:                                           ; preds = %entry, %if.then
  ret %struct.NthToggle* %this, !dbg !148
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %this, i64 0, metadata !68, metadata !104), !dbg !149
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !69, metadata !104), !dbg !150
  %count_max = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 1, !dbg !151
  store i32 %max_count, i32* %count_max, align 4, !dbg !151, !tbaa !139
  %counter = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 2, !dbg !152
  store i32 0, i32* %counter, align 4, !dbg !152, !tbaa !135
  %activate = getelementptr inbounds %struct.NthToggle* %this, i64 0, i32 0, i32 2, !dbg !153
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !153, !tbaa !154
  ret %struct.NthToggle* %this, !dbg !155
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %start_state, i64 0, metadata !74, metadata !104), !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %max_count, i64 0, metadata !75, metadata !104), !dbg !157
  %call = tail call noalias i8* @malloc(i64 32) #5, !dbg !158
  %0 = bitcast i8* %call to %struct.Toggle*, !dbg !159
  %call1 = tail call %struct.Toggle* @init_Toggle(%struct.Toggle* %0, i8 signext %start_state), !dbg !160
  %1 = bitcast %struct.Toggle* %call1 to %struct.NthToggle*, !dbg !161
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %1, i64 0, metadata !76, metadata !104), !dbg !162
  %call2 = tail call %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %1, i32 %max_count), !dbg !163
  ret %struct.NthToggle* %call2, !dbg !164
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !81, metadata !104), !dbg !165
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !82, metadata !104), !dbg !166
  %cmp = icmp eq i32 %argc, 2, !dbg !167
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !168

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !169
  %0 = load i8** %arrayidx, align 8, !dbg !169, !tbaa !171
  %call = tail call i32 @atoi(i8* %0) #6, !dbg !172
  br label %cond.end, !dbg !168

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 70000000, %entry ], !dbg !168
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !84, metadata !104), !dbg !173
  %call1 = tail call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !174
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %call1, i64 0, metadata !85, metadata !104), !dbg !175
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !176
  %activate = getelementptr inbounds %struct.Toggle* %call1, i64 0, i32 2, !dbg !177
  br label %for.body, !dbg !181

for.body:                                         ; preds = %for.body, %cond.end
  %i.059 = phi i32 [ 0, %cond.end ], [ %inc, %for.body ]
  %1 = load %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !177, !tbaa !124
  %call3 = tail call %struct.Toggle* %1(%struct.Toggle* %call1) #5, !dbg !177
  %value = getelementptr inbounds %struct.Toggle* %call3, i64 0, i32 1, !dbg !177
  %value4 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !177
  %2 = load i8 (%struct.Toggle*)** %value4, align 8, !dbg !177, !tbaa !122
  %call5 = tail call signext i8 %2(%struct.Toggle* %call1) #5, !dbg !177
  %tobool = icmp ne i8 %call5, 0, !dbg !182
  %cond6 = select i1 %tobool, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), !dbg !182
  %call7 = tail call i32 @puts(i8* %cond6) #5, !dbg !183
  %inc = add nuw nsw i32 %i.059, 1, !dbg !184
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !83, metadata !104), !dbg !176
  %exitcond62 = icmp eq i32 %inc, 5, !dbg !181
  br i1 %exitcond62, label %for.end, label %for.body, !dbg !181

for.end:                                          ; preds = %for.body
  %3 = getelementptr inbounds %struct.Toggle* %call1, i64 0, i32 0, !dbg !185
  tail call void @free(i8* %3) #5, !dbg !186
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !176
  %cmp957 = icmp sgt i32 %cond, 0, !dbg !187
  br i1 %cmp957, label %for.body11.lr.ph, label %for.end15, !dbg !190

for.body11.lr.ph:                                 ; preds = %for.end
  %4 = add i32 %cond, -1, !dbg !190
  br label %for.body11, !dbg !190

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %i.158 = phi i32 [ 0, %for.body11.lr.ph ], [ %inc14, %for.body11 ]
  %call12 = tail call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !191
  tail call void @llvm.dbg.value(metadata %struct.Toggle* %call12, i64 0, metadata !85, metadata !104), !dbg !175
  %5 = getelementptr inbounds %struct.Toggle* %call12, i64 0, i32 0, !dbg !193
  tail call void @free(i8* %5) #5, !dbg !194
  %inc14 = add nuw nsw i32 %i.158, 1, !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !83, metadata !104), !dbg !176
  %exitcond61 = icmp eq i32 %i.158, %4, !dbg !190
  br i1 %exitcond61, label %for.end15, label %for.body11, !dbg !190

for.end15:                                        ; preds = %for.body11, %for.end
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !196
  %call17 = tail call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3), !dbg !197
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %call17, i64 0, metadata !86, metadata !104), !dbg !198
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !176
  %activate22 = getelementptr inbounds %struct.NthToggle* %call17, i64 0, i32 0, i32 2, !dbg !199
  %6 = getelementptr inbounds %struct.NthToggle* %call17, i64 0, i32 0, !dbg !201
  br label %for.body21, !dbg !202

for.body21:                                       ; preds = %for.body21, %for.end15
  %i.256 = phi i32 [ 0, %for.end15 ], [ %inc30, %for.body21 ]
  %7 = load %struct.Toggle* (%struct.Toggle*)** %activate22, align 8, !dbg !199, !tbaa !154
  %call23 = tail call %struct.Toggle* %7(%struct.Toggle* %6) #5, !dbg !199
  %value24 = getelementptr inbounds %struct.Toggle* %call23, i64 0, i32 1, !dbg !199
  %value25 = bitcast {}** %value24 to i8 (%struct.Toggle*)**, !dbg !199
  %8 = load i8 (%struct.Toggle*)** %value25, align 8, !dbg !199, !tbaa !122
  %call26 = tail call signext i8 %8(%struct.Toggle* %6) #5, !dbg !199
  %tobool27 = icmp eq i8 %call26, 0, !dbg !203
  %. = select i1 %tobool27, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)
  %call28 = tail call i32 @puts(i8* %.) #5, !dbg !204
  %inc30 = add nuw nsw i32 %i.256, 1, !dbg !205
  tail call void @llvm.dbg.value(metadata i32 %inc30, i64 0, metadata !83, metadata !104), !dbg !176
  %exitcond60 = icmp eq i32 %inc30, 8, !dbg !202
  br i1 %exitcond60, label %for.end31, label %for.body21, !dbg !202

for.end31:                                        ; preds = %for.body21
  %9 = getelementptr inbounds %struct.NthToggle* %call17, i64 0, i32 0, i32 0, !dbg !206
  tail call void @free(i8* %9) #5, !dbg !207
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !104), !dbg !176
  %cmp3354 = icmp sgt i32 %cond, 0, !dbg !208
  br i1 %cmp3354, label %for.body35.lr.ph, label %for.end39, !dbg !211

for.body35.lr.ph:                                 ; preds = %for.end31
  %10 = add i32 %cond, -1, !dbg !211
  br label %for.body35, !dbg !211

for.body35:                                       ; preds = %for.body35, %for.body35.lr.ph
  %i.355 = phi i32 [ 0, %for.body35.lr.ph ], [ %inc38, %for.body35 ]
  %call36 = tail call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3), !dbg !212
  tail call void @llvm.dbg.value(metadata %struct.NthToggle* %call36, i64 0, metadata !86, metadata !104), !dbg !198
  %11 = getelementptr inbounds %struct.NthToggle* %call36, i64 0, i32 0, i32 0, !dbg !214
  tail call void @free(i8* %11) #5, !dbg !215
  %inc38 = add nuw nsw i32 %i.355, 1, !dbg !216
  tail call void @llvm.dbg.value(metadata i32 %inc38, i64 0, metadata !83, metadata !104), !dbg !176
  %exitcond = icmp eq i32 %i.355, %10, !dbg !211
  br i1 %exitcond, label %for.end39, label %for.body35, !dbg !211

for.end39:                                        ; preds = %for.body35, %for.end31
  ret i32 0, !dbg !217
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !99, metadata !104), !dbg !218
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !219
  %conv = trunc i64 %call to i32, !dbg !220
  ret i32 %conv, !dbg !221
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

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
!93 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !94, !95, !96, null, i32 (i8*)* @atoi, null, null, !98} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!130 = !MDLocation(line: 38, column: 12, scope: !53)
!131 = !MDLocation(line: 38, column: 5, scope: !53)
!132 = !MDLocation(line: 48, column: 43, scope: !59)
!133 = !MDLocation(line: 49, column: 9, scope: !134)
!134 = !{!"0xb\0049\009\000", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!135 = !{!136, !137, i64 28}
!136 = !{!"NthToggle", !108, i64 0, !137, i64 24, !137, i64 28}
!137 = !{!"int", !109, i64 0}
!138 = !MDLocation(line: 49, column: 28, scope: !134)
!139 = !{!136, !137, i64 24}
!140 = !MDLocation(line: 49, column: 9, scope: !59)
!141 = !MDLocation(line: 50, column: 22, scope: !142)
!142 = !{!"0xb\0049\0045\001", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!143 = !{!136, !109, i64 0}
!144 = !MDLocation(line: 50, column: 21, scope: !142)
!145 = !MDLocation(line: 50, column: 2, scope: !142)
!146 = !MDLocation(line: 51, column: 2, scope: !142)
!147 = !MDLocation(line: 52, column: 5, scope: !142)
!148 = !MDLocation(line: 53, column: 5, scope: !59)
!149 = !MDLocation(line: 55, column: 38, scope: !64)
!150 = !MDLocation(line: 55, column: 48, scope: !64)
!151 = !MDLocation(line: 56, column: 5, scope: !64)
!152 = !MDLocation(line: 57, column: 5, scope: !64)
!153 = !MDLocation(line: 58, column: 5, scope: !64)
!154 = !{!136, !111, i64 16}
!155 = !MDLocation(line: 59, column: 5, scope: !64)
!156 = !MDLocation(line: 61, column: 31, scope: !70)
!157 = !MDLocation(line: 61, column: 48, scope: !70)
!158 = !MDLocation(line: 62, column: 36, scope: !70)
!159 = !MDLocation(line: 63, column: 37, scope: !70)
!160 = !MDLocation(line: 63, column: 25, scope: !70)
!161 = !MDLocation(line: 63, column: 12, scope: !70)
!162 = !MDLocation(line: 62, column: 16, scope: !70)
!163 = !MDLocation(line: 64, column: 12, scope: !70)
!164 = !MDLocation(line: 64, column: 5, scope: !70)
!165 = !MDLocation(line: 68, column: 14, scope: !77)
!166 = !MDLocation(line: 68, column: 26, scope: !77)
!167 = !MDLocation(line: 74, column: 18, scope: !77)
!168 = !MDLocation(line: 74, column: 17, scope: !77)
!169 = !MDLocation(line: 74, column: 36, scope: !170)
!170 = !{!"0xb\001", !1, !77}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!171 = !{!111, !111, i64 0}
!172 = !MDLocation(line: 74, column: 31, scope: !77)
!173 = !MDLocation(line: 74, column: 12, scope: !77)
!174 = !MDLocation(line: 78, column: 11, scope: !77)
!175 = !MDLocation(line: 75, column: 13, scope: !77)
!176 = !MDLocation(line: 74, column: 9, scope: !77)
!177 = !MDLocation(line: 80, column: 8, scope: !178)
!178 = !{!"0xb\0079\0025\004", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!179 = !{!"0xb\0079\005\003", !1, !180}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!180 = !{!"0xb\0079\005\002", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!181 = !MDLocation(line: 79, column: 5, scope: !180)
!182 = !MDLocation(line: 80, column: 7, scope: !178)
!183 = !MDLocation(line: 80, column: 2, scope: !178)
!184 = !MDLocation(line: 79, column: 20, scope: !179)
!185 = !MDLocation(line: 82, column: 13, scope: !77)
!186 = !MDLocation(line: 82, column: 5, scope: !77)
!187 = !MDLocation(line: 83, column: 15, scope: !188)
!188 = !{!"0xb\0083\005\006", !1, !189}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!189 = !{!"0xb\0083\005\005", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!190 = !MDLocation(line: 83, column: 5, scope: !189)
!191 = !MDLocation(line: 84, column: 8, scope: !192)
!192 = !{!"0xb\0083\0025\007", !1, !188}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!193 = !MDLocation(line: 85, column: 10, scope: !192)
!194 = !MDLocation(line: 85, column: 2, scope: !192)
!195 = !MDLocation(line: 83, column: 20, scope: !188)
!196 = !MDLocation(line: 88, column: 5, scope: !77)
!197 = !MDLocation(line: 90, column: 12, scope: !77)
!198 = !MDLocation(line: 76, column: 16, scope: !77)
!199 = !MDLocation(line: 93, column: 6, scope: !200)
!200 = !{!"0xb\0093\006\0011", !1, !88}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!201 = !MDLocation(line: 93, column: 26, scope: !200)
!202 = !MDLocation(line: 91, column: 5, scope: !90)
!203 = !MDLocation(line: 93, column: 6, scope: !88)
!204 = !MDLocation(line: 97, column: 2, scope: !88)
!205 = !MDLocation(line: 91, column: 20, scope: !89)
!206 = !MDLocation(line: 99, column: 13, scope: !77)
!207 = !MDLocation(line: 99, column: 5, scope: !77)
!208 = !MDLocation(line: 100, column: 15, scope: !209)
!209 = !{!"0xb\00100\005\0013", !1, !210}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!210 = !{!"0xb\00100\005\0012", !1, !77}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!211 = !MDLocation(line: 100, column: 5, scope: !210)
!212 = !MDLocation(line: 101, column: 9, scope: !213)
!213 = !{!"0xb\00100\0025\0014", !1, !209}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!214 = !MDLocation(line: 102, column: 10, scope: !213)
!215 = !MDLocation(line: 102, column: 2, scope: !213)
!216 = !MDLocation(line: 100, column: 20, scope: !209)
!217 = !MDLocation(line: 104, column: 5, scope: !77)
!218 = !MDLocation(line: 278, column: 1, scope: !93)
!219 = !MDLocation(line: 280, column: 16, scope: !93)
!220 = !MDLocation(line: 280, column: 10, scope: !93)
!221 = !MDLocation(line: 280, column: 3, scope: !93)
