; ModuleID = 'methcall.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { i8, i8 (%struct.Toggle*)*, %struct.Toggle* (%struct.Toggle*)*, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

; Function Attrs: nounwind uwtable
define signext i8 @toggle_value(%struct.Toggle* %this) #0 {
entry:
  %this.addr = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this.addr, metadata !66, metadata !67), !dbg !68
  %0 = load %struct.Toggle** %this.addr, align 8, !dbg !69
  %state = getelementptr inbounds %struct.Toggle* %0, i32 0, i32 0, !dbg !69
  %1 = load i8* %state, align 1, !dbg !69
  ret i8 %1, !dbg !70
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #0 {
entry:
  %this.addr = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this.addr, metadata !71, metadata !67), !dbg !72
  %0 = load %struct.Toggle** %this.addr, align 8, !dbg !73
  %state = getelementptr inbounds %struct.Toggle* %0, i32 0, i32 0, !dbg !73
  %1 = load i8* %state, align 1, !dbg !73
  %tobool = icmp ne i8 %1, 0, !dbg !74
  %lnot = xor i1 %tobool, true, !dbg !74
  %lnot.ext = zext i1 %lnot to i32, !dbg !74
  %conv = trunc i32 %lnot.ext to i8, !dbg !74
  %2 = load %struct.Toggle** %this.addr, align 8, !dbg !75
  %state1 = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 0, !dbg !75
  store i8 %conv, i8* %state1, align 1, !dbg !75
  %3 = load %struct.Toggle** %this.addr, align 8, !dbg !76
  ret %struct.Toggle* %3, !dbg !77
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #0 {
entry:
  %this.addr = alloca %struct.Toggle*, align 8
  %start_state.addr = alloca i8, align 1
  store %struct.Toggle* %this, %struct.Toggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this.addr, metadata !78, metadata !67), !dbg !79
  store i8 %start_state, i8* %start_state.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %start_state.addr, metadata !80, metadata !67), !dbg !81
  %0 = load i8* %start_state.addr, align 1, !dbg !82
  %1 = load %struct.Toggle** %this.addr, align 8, !dbg !83
  %state = getelementptr inbounds %struct.Toggle* %1, i32 0, i32 0, !dbg !83
  store i8 %0, i8* %state, align 1, !dbg !83
  %2 = load %struct.Toggle** %this.addr, align 8, !dbg !84
  %value = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 1, !dbg !84
  %value1 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !84
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1, align 8, !dbg !84
  %3 = load %struct.Toggle** %this.addr, align 8, !dbg !85
  %activate = getelementptr inbounds %struct.Toggle* %3, i32 0, i32 2, !dbg !85
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !85
  %4 = load %struct.Toggle** %this.addr, align 8, !dbg !86
  ret %struct.Toggle* %4, !dbg !87
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @new_Toggle(i8 signext %start_state) #0 {
entry:
  %start_state.addr = alloca i8, align 1
  %this = alloca %struct.Toggle*, align 8
  store i8 %start_state, i8* %start_state.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %start_state.addr, metadata !88, metadata !67), !dbg !89
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this, metadata !90, metadata !67), !dbg !91
  %call = call noalias i8* @malloc(i64 24) #5, !dbg !92
  %0 = bitcast i8* %call to %struct.Toggle*, !dbg !93
  store %struct.Toggle* %0, %struct.Toggle** %this, align 8, !dbg !91
  %1 = load %struct.Toggle** %this, align 8, !dbg !94
  %2 = load i8* %start_state.addr, align 1, !dbg !95
  %call1 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %1, i8 signext %2), !dbg !96
  ret %struct.Toggle* %call1, !dbg !97
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #0 {
entry:
  %this.addr = alloca %struct.NthToggle*, align 8
  store %struct.NthToggle* %this, %struct.NthToggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %this.addr, metadata !98, metadata !67), !dbg !99
  %0 = load %struct.NthToggle** %this.addr, align 8, !dbg !100
  %counter = getelementptr inbounds %struct.NthToggle* %0, i32 0, i32 4, !dbg !102
  %1 = load i32* %counter, align 4, !dbg !102
  %inc = add nsw i32 %1, 1, !dbg !102
  store i32 %inc, i32* %counter, align 4, !dbg !102
  %2 = load %struct.NthToggle** %this.addr, align 8, !dbg !103
  %count_max = getelementptr inbounds %struct.NthToggle* %2, i32 0, i32 3, !dbg !103
  %3 = load i32* %count_max, align 4, !dbg !103
  %cmp = icmp sge i32 %inc, %3, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  %4 = load %struct.NthToggle** %this.addr, align 8, !dbg !105
  %state = getelementptr inbounds %struct.NthToggle* %4, i32 0, i32 0, !dbg !105
  %5 = load i8* %state, align 1, !dbg !105
  %tobool = icmp ne i8 %5, 0, !dbg !107
  %lnot = xor i1 %tobool, true, !dbg !107
  %lnot.ext = zext i1 %lnot to i32, !dbg !107
  %conv = trunc i32 %lnot.ext to i8, !dbg !107
  %6 = load %struct.NthToggle** %this.addr, align 8, !dbg !108
  %state1 = getelementptr inbounds %struct.NthToggle* %6, i32 0, i32 0, !dbg !108
  store i8 %conv, i8* %state1, align 1, !dbg !108
  %7 = load %struct.NthToggle** %this.addr, align 8, !dbg !109
  %counter2 = getelementptr inbounds %struct.NthToggle* %7, i32 0, i32 4, !dbg !109
  store i32 0, i32* %counter2, align 4, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.NthToggle** %this.addr, align 8, !dbg !111
  ret %struct.NthToggle* %8, !dbg !112
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #0 {
entry:
  %this.addr = alloca %struct.NthToggle*, align 8
  %max_count.addr = alloca i32, align 4
  store %struct.NthToggle* %this, %struct.NthToggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %this.addr, metadata !113, metadata !67), !dbg !114
  store i32 %max_count, i32* %max_count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_count.addr, metadata !115, metadata !67), !dbg !116
  %0 = load i32* %max_count.addr, align 4, !dbg !117
  %1 = load %struct.NthToggle** %this.addr, align 8, !dbg !118
  %count_max = getelementptr inbounds %struct.NthToggle* %1, i32 0, i32 3, !dbg !118
  store i32 %0, i32* %count_max, align 4, !dbg !118
  %2 = load %struct.NthToggle** %this.addr, align 8, !dbg !119
  %counter = getelementptr inbounds %struct.NthToggle* %2, i32 0, i32 4, !dbg !119
  store i32 0, i32* %counter, align 4, !dbg !119
  %3 = load %struct.NthToggle** %this.addr, align 8, !dbg !120
  %activate = getelementptr inbounds %struct.NthToggle* %3, i32 0, i32 2, !dbg !120
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !120
  %4 = load %struct.NthToggle** %this.addr, align 8, !dbg !121
  ret %struct.NthToggle* %4, !dbg !122
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #0 {
entry:
  %start_state.addr = alloca i8, align 1
  %max_count.addr = alloca i32, align 4
  %this = alloca %struct.NthToggle*, align 8
  store i8 %start_state, i8* %start_state.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %start_state.addr, metadata !123, metadata !67), !dbg !124
  store i32 %max_count, i32* %max_count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_count.addr, metadata !125, metadata !67), !dbg !126
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %this, metadata !127, metadata !67), !dbg !128
  %call = call noalias i8* @malloc(i64 32) #5, !dbg !129
  %0 = bitcast i8* %call to %struct.NthToggle*, !dbg !130
  store %struct.NthToggle* %0, %struct.NthToggle** %this, align 8, !dbg !128
  %1 = load %struct.NthToggle** %this, align 8, !dbg !131
  %2 = bitcast %struct.NthToggle* %1 to %struct.Toggle*, !dbg !132
  %3 = load i8* %start_state.addr, align 1, !dbg !133
  %call1 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %2, i8 signext %3), !dbg !134
  %4 = bitcast %struct.Toggle* %call1 to %struct.NthToggle*, !dbg !135
  store %struct.NthToggle* %4, %struct.NthToggle** %this, align 8, !dbg !136
  %5 = load %struct.NthToggle** %this, align 8, !dbg !137
  %6 = load i32* %max_count.addr, align 4, !dbg !138
  %call2 = call %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %5, i32 %6), !dbg !139
  ret %struct.NthToggle* %call2, !dbg !140
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %tog = alloca %struct.Toggle*, align 8
  %ntog = alloca %struct.NthToggle*, align 8
  %val = alloca i8, align 1
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !141, metadata !67), !dbg !142
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !143, metadata !67), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %i, metadata !145, metadata !67), !dbg !146
  call void @llvm.dbg.declare(metadata i32* %n, metadata !147, metadata !67), !dbg !148
  %0 = load i32* %argc.addr, align 4, !dbg !149
  %cmp = icmp eq i32 %0, 2, !dbg !149
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !150

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !151
  %2 = load i8** %arrayidx, align 8, !dbg !151
  %call = call i32 @atoi(i8* %2) #6, !dbg !153
  br label %cond.end, !dbg !150

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !154

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 500000000, %cond.false ], !dbg !150
  store i32 %cond, i32* %n, align 4, !dbg !156
  call void @llvm.dbg.declare(metadata %struct.Toggle** %tog, metadata !159, metadata !67), !dbg !160
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %ntog, metadata !161, metadata !67), !dbg !162
  call void @llvm.dbg.declare(metadata i8* %val, metadata !163, metadata !67), !dbg !164
  store i8 1, i8* %val, align 1, !dbg !164
  %call1 = call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !165
  store %struct.Toggle* %call1, %struct.Toggle** %tog, align 8, !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %cond.end
  %3 = load i32* %i, align 4, !dbg !169
  %4 = load i32* %n, align 4, !dbg !173
  %cmp2 = icmp slt i32 %3, %4, !dbg !174
  br i1 %cmp2, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %5 = load %struct.Toggle** %tog, align 8, !dbg !176
  %activate = getelementptr inbounds %struct.Toggle* %5, i32 0, i32 2, !dbg !176
  %6 = load %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !176
  %7 = load %struct.Toggle** %tog, align 8, !dbg !178
  %call3 = call %struct.Toggle* %6(%struct.Toggle* %7), !dbg !176
  %value = getelementptr inbounds %struct.Toggle* %call3, i32 0, i32 1, !dbg !176
  %value4 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !176
  %8 = load i8 (%struct.Toggle*)** %value4, align 8, !dbg !176
  %9 = load %struct.Toggle** %tog, align 8, !dbg !179
  %call5 = call signext i8 %8(%struct.Toggle* %9), !dbg !176
  store i8 %call5, i8* %val, align 1, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %10 = load i32* %i, align 4, !dbg !182
  %inc = add nsw i32 %10, 1, !dbg !182
  store i32 %inc, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !183

for.end:                                          ; preds = %for.cond
  %11 = load i8* %val, align 1, !dbg !184
  %conv = sext i8 %11 to i32, !dbg !184
  %tobool = icmp ne i32 %conv, 0, !dbg !184
  %cond6 = select i1 %tobool, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), !dbg !184
  %call7 = call i32 @puts(i8* %cond6), !dbg !185
  %12 = load %struct.Toggle** %tog, align 8, !dbg !186
  %13 = bitcast %struct.Toggle* %12 to i8*, !dbg !186
  call void @free(i8* %13) #5, !dbg !187
  store i8 1, i8* %val, align 1, !dbg !188
  %14 = load i8* %val, align 1, !dbg !189
  %call8 = call %struct.NthToggle* @new_NthToggle(i8 signext %14, i32 3), !dbg !190
  store %struct.NthToggle* %call8, %struct.NthToggle** %ntog, align 8, !dbg !191
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond9, !dbg !192

for.cond9:                                        ; preds = %for.inc18, %for.end
  %15 = load i32* %i, align 4, !dbg !194
  %16 = load i32* %n, align 4, !dbg !198
  %cmp10 = icmp slt i32 %15, %16, !dbg !199
  br i1 %cmp10, label %for.body12, label %for.end20, !dbg !200

for.body12:                                       ; preds = %for.cond9
  %17 = load %struct.NthToggle** %ntog, align 8, !dbg !201
  %activate13 = getelementptr inbounds %struct.NthToggle* %17, i32 0, i32 2, !dbg !201
  %18 = load %struct.Toggle* (%struct.Toggle*)** %activate13, align 8, !dbg !201
  %19 = load %struct.NthToggle** %ntog, align 8, !dbg !203
  %20 = bitcast %struct.NthToggle* %19 to %struct.Toggle*, !dbg !203
  %call14 = call %struct.Toggle* %18(%struct.Toggle* %20), !dbg !201
  %value15 = getelementptr inbounds %struct.Toggle* %call14, i32 0, i32 1, !dbg !201
  %value16 = bitcast {}** %value15 to i8 (%struct.Toggle*)**, !dbg !201
  %21 = load i8 (%struct.Toggle*)** %value16, align 8, !dbg !201
  %22 = load %struct.NthToggle** %ntog, align 8, !dbg !204
  %23 = bitcast %struct.NthToggle* %22 to %struct.Toggle*, !dbg !204
  %call17 = call signext i8 %21(%struct.Toggle* %23), !dbg !201
  store i8 %call17, i8* %val, align 1, !dbg !205
  br label %for.inc18, !dbg !206

for.inc18:                                        ; preds = %for.body12
  %24 = load i32* %i, align 4, !dbg !207
  %inc19 = add nsw i32 %24, 1, !dbg !207
  store i32 %inc19, i32* %i, align 4, !dbg !207
  br label %for.cond9, !dbg !208

for.end20:                                        ; preds = %for.cond9
  %25 = load i8* %val, align 1, !dbg !209
  %conv21 = sext i8 %25 to i32, !dbg !209
  %tobool22 = icmp ne i32 %conv21, 0, !dbg !209
  %cond23 = select i1 %tobool22, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), !dbg !209
  %call24 = call i32 @puts(i8* %cond23), !dbg !210
  %26 = load %struct.NthToggle** %ntog, align 8, !dbg !211
  %27 = bitcast %struct.NthToggle* %26 to i8*, !dbg !211
  call void @free(i8* %27) #5, !dbg !212
  ret i32 0, !dbg !213
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
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !7, !36, !41, !41} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c] [DW_LANG_C99]
!1 = !{!"methcall.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\0010\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 10, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6}
!5 = !{!"0x28\00false\000"}                       ; [ DW_TAG_enumerator ] [false :: 0]
!6 = !{!"0x28\00true\001"}                        ; [ DW_TAG_enumerator ] [true :: 1]
!7 = !{!8, !23, !26}
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
!36 = !{!37, !42, !43, !46, !49, !52, !55, !58}
!37 = !{!"0x2e\00toggle_value\00toggle_value\00\0023\000\001\000\000\00256\000\0023", !1, !38, !39, null, i8 (%struct.Toggle*)* @toggle_value, null, null, !41} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
!38 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!13, !8}
!41 = !{}
!42 = !{!"0x2e\00toggle_activate\00toggle_activate\00\0026\000\001\000\000\00256\000\0026", !1, !38, !24, null, %struct.Toggle* (%struct.Toggle*)* @toggle_activate, null, null, !41} ; [ DW_TAG_subprogram ] [line 26] [def] [toggle_activate]
!43 = !{!"0x2e\00init_Toggle\00init_Toggle\00\0030\000\001\000\000\00256\000\0030", !1, !38, !44, null, %struct.Toggle* (%struct.Toggle*, i8)* @init_Toggle, null, null, !41} ; [ DW_TAG_subprogram ] [line 30] [def] [init_Toggle]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{!8, !8, !13}
!46 = !{!"0x2e\00new_Toggle\00new_Toggle\00\0036\000\001\000\000\00256\000\0036", !1, !38, !47, null, %struct.Toggle* (i8)* @new_Toggle, null, null, !41} ; [ DW_TAG_subprogram ] [line 36] [def] [new_Toggle]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!8, !13}
!49 = !{!"0x2e\00nth_toggle_activate\00nth_toggle_activate\00\0048\000\001\000\000\00256\000\0048", !1, !38, !50, null, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, !41} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{!26, !26}
!52 = !{!"0x2e\00init_NthToggle\00init_NthToggle\00\0055\000\001\000\000\00256\000\0055", !1, !38, !53, null, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, !41} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!53 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !54, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = !{!26, !26, !34}
!55 = !{!"0x2e\00new_NthToggle\00new_NthToggle\00\0061\000\001\000\000\00256\000\0061", !1, !38, !56, null, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, !41} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{!26, !13, !34}
!58 = !{!"0x2e\00main\00main\00\0068\000\001\000\000\00256\000\0068", !1, !38, !59, null, i32 (i32, i8**)* @main, null, null, !41} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!59 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !60, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = !{!34, !34, !61}
!61 = !{!"0xf\00\000\0064\0064\000\000", null, null, !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!63 = !{i32 2, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 2}
!65 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!66 = !{!"0x101\00this\0016777239\000", !37, !38, !8} ; [ DW_TAG_arg_variable ] [this] [line 23]
!67 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!68 = !MDLocation(line: 23, column: 27, scope: !37)
!69 = !MDLocation(line: 24, column: 12, scope: !37)
!70 = !MDLocation(line: 24, column: 5, scope: !37)
!71 = !{!"0x101\00this\0016777242\000", !42, !38, !8} ; [ DW_TAG_arg_variable ] [this] [line 26]
!72 = !MDLocation(line: 26, column: 33, scope: !42)
!73 = !MDLocation(line: 27, column: 20, scope: !42)
!74 = !MDLocation(line: 27, column: 19, scope: !42)
!75 = !MDLocation(line: 27, column: 5, scope: !42)
!76 = !MDLocation(line: 28, column: 12, scope: !42)
!77 = !MDLocation(line: 28, column: 5, scope: !42)
!78 = !{!"0x101\00this\0016777246\000", !43, !38, !8} ; [ DW_TAG_arg_variable ] [this] [line 30]
!79 = !MDLocation(line: 30, column: 29, scope: !43)
!80 = !{!"0x101\00start_state\0033554462\000", !43, !38, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!81 = !MDLocation(line: 30, column: 40, scope: !43)
!82 = !MDLocation(line: 31, column: 19, scope: !43)
!83 = !MDLocation(line: 31, column: 5, scope: !43)
!84 = !MDLocation(line: 32, column: 5, scope: !43)
!85 = !MDLocation(line: 33, column: 5, scope: !43)
!86 = !MDLocation(line: 34, column: 12, scope: !43)
!87 = !MDLocation(line: 34, column: 5, scope: !43)
!88 = !{!"0x101\00start_state\0016777252\000", !46, !38, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!89 = !MDLocation(line: 36, column: 25, scope: !46)
!90 = !{!"0x100\00this\0037\000", !46, !38, !8}   ; [ DW_TAG_auto_variable ] [this] [line 37]
!91 = !MDLocation(line: 37, column: 13, scope: !46)
!92 = !MDLocation(line: 37, column: 30, scope: !46)
!93 = !MDLocation(line: 37, column: 20, scope: !46)
!94 = !MDLocation(line: 38, column: 24, scope: !46)
!95 = !MDLocation(line: 38, column: 30, scope: !46)
!96 = !MDLocation(line: 38, column: 12, scope: !46)
!97 = !MDLocation(line: 38, column: 5, scope: !46)
!98 = !{!"0x101\00this\0016777264\000", !49, !38, !26} ; [ DW_TAG_arg_variable ] [this] [line 48]
!99 = !MDLocation(line: 48, column: 43, scope: !49)
!100 = !MDLocation(line: 49, column: 11, scope: !101)
!101 = !{!"0xb\0049\009\000", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!102 = !MDLocation(line: 49, column: 9, scope: !101)
!103 = !MDLocation(line: 49, column: 28, scope: !101)
!104 = !MDLocation(line: 49, column: 9, scope: !49)
!105 = !MDLocation(line: 50, column: 17, scope: !106)
!106 = !{!"0xb\0049\0045\001", !1, !101}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!107 = !MDLocation(line: 50, column: 16, scope: !106)
!108 = !MDLocation(line: 50, column: 2, scope: !106)
!109 = !MDLocation(line: 51, column: 2, scope: !106)
!110 = !MDLocation(line: 52, column: 5, scope: !106)
!111 = !MDLocation(line: 53, column: 12, scope: !49)
!112 = !MDLocation(line: 53, column: 5, scope: !49)
!113 = !{!"0x101\00this\0016777271\000", !52, !38, !26} ; [ DW_TAG_arg_variable ] [this] [line 55]
!114 = !MDLocation(line: 55, column: 38, scope: !52)
!115 = !{!"0x101\00max_count\0033554487\000", !52, !38, !34} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!116 = !MDLocation(line: 55, column: 48, scope: !52)
!117 = !MDLocation(line: 56, column: 23, scope: !52)
!118 = !MDLocation(line: 56, column: 5, scope: !52)
!119 = !MDLocation(line: 57, column: 5, scope: !52)
!120 = !MDLocation(line: 58, column: 5, scope: !52)
!121 = !MDLocation(line: 59, column: 12, scope: !52)
!122 = !MDLocation(line: 59, column: 5, scope: !52)
!123 = !{!"0x101\00start_state\0016777277\000", !55, !38, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!124 = !MDLocation(line: 61, column: 31, scope: !55)
!125 = !{!"0x101\00max_count\0033554493\000", !55, !38, !34} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!126 = !MDLocation(line: 61, column: 48, scope: !55)
!127 = !{!"0x100\00this\0062\000", !55, !38, !26} ; [ DW_TAG_auto_variable ] [this] [line 62]
!128 = !MDLocation(line: 62, column: 16, scope: !55)
!129 = !MDLocation(line: 62, column: 36, scope: !55)
!130 = !MDLocation(line: 62, column: 23, scope: !55)
!131 = !MDLocation(line: 63, column: 47, scope: !55)
!132 = !MDLocation(line: 63, column: 37, scope: !55)
!133 = !MDLocation(line: 63, column: 53, scope: !55)
!134 = !MDLocation(line: 63, column: 25, scope: !55)
!135 = !MDLocation(line: 63, column: 12, scope: !55)
!136 = !MDLocation(line: 63, column: 5, scope: !55)
!137 = !MDLocation(line: 64, column: 27, scope: !55)
!138 = !MDLocation(line: 64, column: 33, scope: !55)
!139 = !MDLocation(line: 64, column: 12, scope: !55)
!140 = !MDLocation(line: 64, column: 5, scope: !55)
!141 = !{!"0x101\00argc\0016777284\000", !58, !38, !34} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!142 = !MDLocation(line: 68, column: 14, scope: !58)
!143 = !{!"0x101\00argv\0033554500\000", !58, !38, !61} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!144 = !MDLocation(line: 68, column: 26, scope: !58)
!145 = !{!"0x100\00i\0074\000", !58, !38, !34}    ; [ DW_TAG_auto_variable ] [i] [line 74]
!146 = !MDLocation(line: 74, column: 9, scope: !58)
!147 = !{!"0x100\00n\0074\000", !58, !38, !34}    ; [ DW_TAG_auto_variable ] [n] [line 74]
!148 = !MDLocation(line: 74, column: 12, scope: !58)
!149 = !MDLocation(line: 74, column: 18, scope: !58)
!150 = !MDLocation(line: 74, column: 17, scope: !58)
!151 = !MDLocation(line: 74, column: 36, scope: !152)
!152 = !{!"0xb\001", !1, !58}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!153 = !MDLocation(line: 74, column: 31, scope: !58)
!154 = !MDLocation(line: 74, column: 17, scope: !155)
!155 = !{!"0xb\002", !1, !58}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!156 = !MDLocation(line: 74, column: 12, scope: !157)
!157 = !{!"0xb\004", !1, !158}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!158 = !{!"0xb\003", !1, !58}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!159 = !{!"0x100\00tog\0075\000", !58, !38, !8}   ; [ DW_TAG_auto_variable ] [tog] [line 75]
!160 = !MDLocation(line: 75, column: 13, scope: !58)
!161 = !{!"0x100\00ntog\0076\000", !58, !38, !26} ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!162 = !MDLocation(line: 76, column: 16, scope: !58)
!163 = !{!"0x100\00val\0077\000", !58, !38, !13}  ; [ DW_TAG_auto_variable ] [val] [line 77]
!164 = !MDLocation(line: 77, column: 10, scope: !58)
!165 = !MDLocation(line: 79, column: 11, scope: !58)
!166 = !MDLocation(line: 79, column: 5, scope: !58)
!167 = !MDLocation(line: 80, column: 10, scope: !168)
!168 = !{!"0xb\0080\005\002", !1, !58}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!169 = !MDLocation(line: 80, column: 15, scope: !170)
!170 = !{!"0xb\002", !1, !171}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!171 = !{!"0xb\001", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!172 = !{!"0xb\0080\005\003", !1, !168}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!173 = !MDLocation(line: 80, column: 17, scope: !172)
!174 = !MDLocation(line: 80, column: 15, scope: !172)
!175 = !MDLocation(line: 80, column: 5, scope: !168)
!176 = !MDLocation(line: 81, column: 8, scope: !177)
!177 = !{!"0xb\0080\0025\004", !1, !172}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!178 = !MDLocation(line: 81, column: 22, scope: !177)
!179 = !MDLocation(line: 81, column: 34, scope: !177)
!180 = !MDLocation(line: 81, column: 2, scope: !177)
!181 = !MDLocation(line: 82, column: 5, scope: !177)
!182 = !MDLocation(line: 80, column: 20, scope: !172)
!183 = !MDLocation(line: 80, column: 5, scope: !172)
!184 = !MDLocation(line: 83, column: 10, scope: !58)
!185 = !MDLocation(line: 83, column: 5, scope: !58)
!186 = !MDLocation(line: 84, column: 13, scope: !58)
!187 = !MDLocation(line: 84, column: 5, scope: !58)
!188 = !MDLocation(line: 86, column: 5, scope: !58)
!189 = !MDLocation(line: 87, column: 26, scope: !58)
!190 = !MDLocation(line: 87, column: 12, scope: !58)
!191 = !MDLocation(line: 87, column: 5, scope: !58)
!192 = !MDLocation(line: 88, column: 10, scope: !193)
!193 = !{!"0xb\0088\005\005", !1, !58}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!194 = !MDLocation(line: 88, column: 15, scope: !195)
!195 = !{!"0xb\002", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!196 = !{!"0xb\001", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!197 = !{!"0xb\0088\005\006", !1, !193}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!198 = !MDLocation(line: 88, column: 17, scope: !197)
!199 = !MDLocation(line: 88, column: 15, scope: !197)
!200 = !MDLocation(line: 88, column: 5, scope: !193)
!201 = !MDLocation(line: 89, column: 8, scope: !202)
!202 = !{!"0xb\0088\0025\007", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/methcall.c]
!203 = !MDLocation(line: 89, column: 23, scope: !202)
!204 = !MDLocation(line: 89, column: 36, scope: !202)
!205 = !MDLocation(line: 89, column: 2, scope: !202)
!206 = !MDLocation(line: 90, column: 5, scope: !202)
!207 = !MDLocation(line: 88, column: 20, scope: !197)
!208 = !MDLocation(line: 88, column: 5, scope: !197)
!209 = !MDLocation(line: 91, column: 10, scope: !58)
!210 = !MDLocation(line: 91, column: 5, scope: !58)
!211 = !MDLocation(line: 92, column: 13, scope: !58)
!212 = !MDLocation(line: 92, column: 5, scope: !58)
!213 = !MDLocation(line: 93, column: 5, scope: !58)
