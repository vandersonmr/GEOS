; ModuleID = 'objinst.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Toggle = type { i8, {}*, %struct.Toggle* (%struct.Toggle*)* }
%struct.NthToggle = type { %struct.Toggle, i32, i32 }

@.str = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define signext i8 @toggle_value(%struct.Toggle* %this) #0 {
entry:
  %this.addr = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this.addr, metadata !64, metadata !65), !dbg !66
  %0 = load %struct.Toggle** %this.addr, align 8, !dbg !67
  %state = getelementptr inbounds %struct.Toggle* %0, i32 0, i32 0, !dbg !67
  %1 = load i8* %state, align 1, !dbg !67
  ret i8 %1, !dbg !68
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.Toggle* @toggle_activate(%struct.Toggle* %this) #0 {
entry:
  %this.addr = alloca %struct.Toggle*, align 8
  store %struct.Toggle* %this, %struct.Toggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this.addr, metadata !69, metadata !65), !dbg !70
  %0 = load %struct.Toggle** %this.addr, align 8, !dbg !71
  %state = getelementptr inbounds %struct.Toggle* %0, i32 0, i32 0, !dbg !71
  %1 = load i8* %state, align 1, !dbg !71
  %tobool = icmp ne i8 %1, 0, !dbg !72
  %lnot = xor i1 %tobool, true, !dbg !72
  %lnot.ext = zext i1 %lnot to i32, !dbg !72
  %conv = trunc i32 %lnot.ext to i8, !dbg !72
  %2 = load %struct.Toggle** %this.addr, align 8, !dbg !73
  %state1 = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 0, !dbg !73
  store i8 %conv, i8* %state1, align 1, !dbg !73
  %3 = load %struct.Toggle** %this.addr, align 8, !dbg !74
  ret %struct.Toggle* %3, !dbg !75
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @init_Toggle(%struct.Toggle* %this, i8 signext %start_state) #0 {
entry:
  %this.addr = alloca %struct.Toggle*, align 8
  %start_state.addr = alloca i8, align 1
  store %struct.Toggle* %this, %struct.Toggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this.addr, metadata !76, metadata !65), !dbg !77
  store i8 %start_state, i8* %start_state.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %start_state.addr, metadata !78, metadata !65), !dbg !79
  %0 = load i8* %start_state.addr, align 1, !dbg !80
  %1 = load %struct.Toggle** %this.addr, align 8, !dbg !81
  %state = getelementptr inbounds %struct.Toggle* %1, i32 0, i32 0, !dbg !81
  store i8 %0, i8* %state, align 1, !dbg !81
  %2 = load %struct.Toggle** %this.addr, align 8, !dbg !82
  %value = getelementptr inbounds %struct.Toggle* %2, i32 0, i32 1, !dbg !82
  %value1 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !82
  store i8 (%struct.Toggle*)* @toggle_value, i8 (%struct.Toggle*)** %value1, align 8, !dbg !82
  %3 = load %struct.Toggle** %this.addr, align 8, !dbg !83
  %activate = getelementptr inbounds %struct.Toggle* %3, i32 0, i32 2, !dbg !83
  store %struct.Toggle* (%struct.Toggle*)* @toggle_activate, %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !83
  %4 = load %struct.Toggle** %this.addr, align 8, !dbg !84
  ret %struct.Toggle* %4, !dbg !85
}

; Function Attrs: nounwind uwtable
define %struct.Toggle* @new_Toggle(i8 signext %start_state) #0 {
entry:
  %start_state.addr = alloca i8, align 1
  %this = alloca %struct.Toggle*, align 8
  store i8 %start_state, i8* %start_state.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %start_state.addr, metadata !86, metadata !65), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.Toggle** %this, metadata !88, metadata !65), !dbg !89
  %call = call noalias i8* @malloc(i64 24) #5, !dbg !90
  %0 = bitcast i8* %call to %struct.Toggle*, !dbg !91
  store %struct.Toggle* %0, %struct.Toggle** %this, align 8, !dbg !89
  %1 = load %struct.Toggle** %this, align 8, !dbg !92
  %2 = load i8* %start_state.addr, align 1, !dbg !93
  %call1 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %1, i8 signext %2), !dbg !94
  ret %struct.Toggle* %call1, !dbg !95
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @nth_toggle_activate(%struct.NthToggle* %this) #0 {
entry:
  %this.addr = alloca %struct.NthToggle*, align 8
  store %struct.NthToggle* %this, %struct.NthToggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %this.addr, metadata !96, metadata !65), !dbg !97
  %0 = load %struct.NthToggle** %this.addr, align 8, !dbg !98
  %counter = getelementptr inbounds %struct.NthToggle* %0, i32 0, i32 2, !dbg !100
  %1 = load i32* %counter, align 4, !dbg !100
  %inc = add nsw i32 %1, 1, !dbg !100
  store i32 %inc, i32* %counter, align 4, !dbg !100
  %2 = load %struct.NthToggle** %this.addr, align 8, !dbg !101
  %count_max = getelementptr inbounds %struct.NthToggle* %2, i32 0, i32 1, !dbg !101
  %3 = load i32* %count_max, align 4, !dbg !101
  %cmp = icmp sge i32 %inc, %3, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  %4 = load %struct.NthToggle** %this.addr, align 8, !dbg !103
  %base = getelementptr inbounds %struct.NthToggle* %4, i32 0, i32 0, !dbg !103
  %state = getelementptr inbounds %struct.Toggle* %base, i32 0, i32 0, !dbg !103
  %5 = load i8* %state, align 1, !dbg !103
  %tobool = icmp ne i8 %5, 0, !dbg !105
  %lnot = xor i1 %tobool, true, !dbg !105
  %lnot.ext = zext i1 %lnot to i32, !dbg !105
  %conv = trunc i32 %lnot.ext to i8, !dbg !105
  %6 = load %struct.NthToggle** %this.addr, align 8, !dbg !106
  %base1 = getelementptr inbounds %struct.NthToggle* %6, i32 0, i32 0, !dbg !106
  %state2 = getelementptr inbounds %struct.Toggle* %base1, i32 0, i32 0, !dbg !106
  store i8 %conv, i8* %state2, align 1, !dbg !106
  %7 = load %struct.NthToggle** %this.addr, align 8, !dbg !107
  %counter3 = getelementptr inbounds %struct.NthToggle* %7, i32 0, i32 2, !dbg !107
  store i32 0, i32* %counter3, align 4, !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.NthToggle** %this.addr, align 8, !dbg !109
  ret %struct.NthToggle* %8, !dbg !110
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %this, i32 %max_count) #0 {
entry:
  %this.addr = alloca %struct.NthToggle*, align 8
  %max_count.addr = alloca i32, align 4
  store %struct.NthToggle* %this, %struct.NthToggle** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %this.addr, metadata !111, metadata !65), !dbg !112
  store i32 %max_count, i32* %max_count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_count.addr, metadata !113, metadata !65), !dbg !114
  %0 = load i32* %max_count.addr, align 4, !dbg !115
  %1 = load %struct.NthToggle** %this.addr, align 8, !dbg !116
  %count_max = getelementptr inbounds %struct.NthToggle* %1, i32 0, i32 1, !dbg !116
  store i32 %0, i32* %count_max, align 4, !dbg !116
  %2 = load %struct.NthToggle** %this.addr, align 8, !dbg !117
  %counter = getelementptr inbounds %struct.NthToggle* %2, i32 0, i32 2, !dbg !117
  store i32 0, i32* %counter, align 4, !dbg !117
  %3 = load %struct.NthToggle** %this.addr, align 8, !dbg !118
  %base = getelementptr inbounds %struct.NthToggle* %3, i32 0, i32 0, !dbg !118
  %activate = getelementptr inbounds %struct.Toggle* %base, i32 0, i32 2, !dbg !118
  store %struct.Toggle* (%struct.Toggle*)* bitcast (%struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate to %struct.Toggle* (%struct.Toggle*)*), %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !118
  %4 = load %struct.NthToggle** %this.addr, align 8, !dbg !119
  ret %struct.NthToggle* %4, !dbg !120
}

; Function Attrs: nounwind uwtable
define %struct.NthToggle* @new_NthToggle(i8 signext %start_state, i32 %max_count) #0 {
entry:
  %start_state.addr = alloca i8, align 1
  %max_count.addr = alloca i32, align 4
  %this = alloca %struct.NthToggle*, align 8
  store i8 %start_state, i8* %start_state.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %start_state.addr, metadata !121, metadata !65), !dbg !122
  store i32 %max_count, i32* %max_count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_count.addr, metadata !123, metadata !65), !dbg !124
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %this, metadata !125, metadata !65), !dbg !126
  %call = call noalias i8* @malloc(i64 32) #5, !dbg !127
  %0 = bitcast i8* %call to %struct.NthToggle*, !dbg !128
  store %struct.NthToggle* %0, %struct.NthToggle** %this, align 8, !dbg !126
  %1 = load %struct.NthToggle** %this, align 8, !dbg !129
  %2 = bitcast %struct.NthToggle* %1 to %struct.Toggle*, !dbg !130
  %3 = load i8* %start_state.addr, align 1, !dbg !131
  %call1 = call %struct.Toggle* @init_Toggle(%struct.Toggle* %2, i8 signext %3), !dbg !132
  %4 = bitcast %struct.Toggle* %call1 to %struct.NthToggle*, !dbg !133
  store %struct.NthToggle* %4, %struct.NthToggle** %this, align 8, !dbg !134
  %5 = load %struct.NthToggle** %this, align 8, !dbg !135
  %6 = load i32* %max_count.addr, align 4, !dbg !136
  %call2 = call %struct.NthToggle* @init_NthToggle(%struct.NthToggle* %5, i32 %6), !dbg !137
  ret %struct.NthToggle* %call2, !dbg !138
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
  %Msg = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !139, metadata !65), !dbg !140
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !141, metadata !65), !dbg !142
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !65), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %n, metadata !145, metadata !65), !dbg !146
  %0 = load i32* %argc.addr, align 4, !dbg !147
  %cmp = icmp eq i32 %0, 2, !dbg !147
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !148

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !149
  %2 = load i8** %arrayidx, align 8, !dbg !149
  %call = call i32 @atoi(i8* %2) #6, !dbg !151
  br label %cond.end, !dbg !148

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !152

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 70000000, %cond.false ], !dbg !148
  store i32 %cond, i32* %n, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata %struct.Toggle** %tog, metadata !157, metadata !65), !dbg !158
  call void @llvm.dbg.declare(metadata %struct.NthToggle** %ntog, metadata !159, metadata !65), !dbg !160
  %call1 = call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !161
  store %struct.Toggle* %call1, %struct.Toggle** %tog, align 8, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %cond.end
  %3 = load i32* %i, align 4, !dbg !165
  %cmp2 = icmp slt i32 %3, 5, !dbg !165
  br i1 %cmp2, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %4 = load %struct.Toggle** %tog, align 8, !dbg !170
  %activate = getelementptr inbounds %struct.Toggle* %4, i32 0, i32 2, !dbg !170
  %5 = load %struct.Toggle* (%struct.Toggle*)** %activate, align 8, !dbg !170
  %6 = load %struct.Toggle** %tog, align 8, !dbg !172
  %call3 = call %struct.Toggle* %5(%struct.Toggle* %6), !dbg !170
  %value = getelementptr inbounds %struct.Toggle* %call3, i32 0, i32 1, !dbg !170
  %value4 = bitcast {}** %value to i8 (%struct.Toggle*)**, !dbg !170
  %7 = load i8 (%struct.Toggle*)** %value4, align 8, !dbg !170
  %8 = load %struct.Toggle** %tog, align 8, !dbg !173
  %call5 = call signext i8 %7(%struct.Toggle* %8), !dbg !170
  %conv = sext i8 %call5 to i32, !dbg !174
  %tobool = icmp ne i32 %conv, 0, !dbg !174
  %cond6 = select i1 %tobool, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), !dbg !174
  %call7 = call i32 @puts(i8* %cond6), !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %9, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178

for.end:                                          ; preds = %for.cond
  %10 = load %struct.Toggle** %tog, align 8, !dbg !179
  %11 = bitcast %struct.Toggle* %10 to i8*, !dbg !179
  call void @free(i8* %11) #5, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond8, !dbg !181

for.cond8:                                        ; preds = %for.inc13, %for.end
  %12 = load i32* %i, align 4, !dbg !183
  %13 = load i32* %n, align 4, !dbg !187
  %cmp9 = icmp slt i32 %12, %13, !dbg !188
  br i1 %cmp9, label %for.body11, label %for.end15, !dbg !189

for.body11:                                       ; preds = %for.cond8
  %call12 = call %struct.Toggle* @new_Toggle(i8 signext 1), !dbg !190
  store %struct.Toggle* %call12, %struct.Toggle** %tog, align 8, !dbg !192
  %14 = load %struct.Toggle** %tog, align 8, !dbg !193
  %15 = bitcast %struct.Toggle* %14 to i8*, !dbg !193
  call void @free(i8* %15) #5, !dbg !194
  br label %for.inc13, !dbg !195

for.inc13:                                        ; preds = %for.body11
  %16 = load i32* %i, align 4, !dbg !196
  %inc14 = add nsw i32 %16, 1, !dbg !196
  store i32 %inc14, i32* %i, align 4, !dbg !196
  br label %for.cond8, !dbg !197

for.end15:                                        ; preds = %for.cond8
  %call16 = call i32 @puts(i8* getelementptr inbounds ([1 x i8]* @.str2, i32 0, i32 0)), !dbg !198
  %call17 = call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3), !dbg !199
  store %struct.NthToggle* %call17, %struct.NthToggle** %ntog, align 8, !dbg !200
  store i32 0, i32* %i, align 4, !dbg !201
  br label %for.cond18, !dbg !201

for.cond18:                                       ; preds = %for.inc29, %for.end15
  %17 = load i32* %i, align 4, !dbg !203
  %cmp19 = icmp slt i32 %17, 8, !dbg !203
  br i1 %cmp19, label %for.body21, label %for.end31, !dbg !207

for.body21:                                       ; preds = %for.cond18
  call void @llvm.dbg.declare(metadata i8** %Msg, metadata !208, metadata !65), !dbg !212
  %18 = load %struct.NthToggle** %ntog, align 8, !dbg !213
  %base = getelementptr inbounds %struct.NthToggle* %18, i32 0, i32 0, !dbg !213
  %activate22 = getelementptr inbounds %struct.Toggle* %base, i32 0, i32 2, !dbg !213
  %19 = load %struct.Toggle* (%struct.Toggle*)** %activate22, align 8, !dbg !213
  %20 = load %struct.NthToggle** %ntog, align 8, !dbg !215
  %21 = bitcast %struct.NthToggle* %20 to %struct.Toggle*, !dbg !216
  %call23 = call %struct.Toggle* %19(%struct.Toggle* %21), !dbg !213
  %value24 = getelementptr inbounds %struct.Toggle* %call23, i32 0, i32 1, !dbg !213
  %value25 = bitcast {}** %value24 to i8 (%struct.Toggle*)**, !dbg !213
  %22 = load i8 (%struct.Toggle*)** %value25, align 8, !dbg !213
  %23 = load %struct.NthToggle** %ntog, align 8, !dbg !217
  %24 = bitcast %struct.NthToggle* %23 to %struct.Toggle*, !dbg !218
  %call26 = call signext i8 %22(%struct.Toggle* %24), !dbg !213
  %tobool27 = icmp ne i8 %call26, 0, !dbg !219
  br i1 %tobool27, label %if.then, label %if.else, !dbg !219

if.then:                                          ; preds = %for.body21
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** %Msg, align 8, !dbg !220
  br label %if.end, !dbg !220

if.else:                                          ; preds = %for.body21
  store i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8** %Msg, align 8, !dbg !221
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %25 = load i8** %Msg, align 8, !dbg !222
  %call28 = call i32 @puts(i8* %25), !dbg !223
  br label %for.inc29, !dbg !224

for.inc29:                                        ; preds = %if.end
  %26 = load i32* %i, align 4, !dbg !225
  %inc30 = add nsw i32 %26, 1, !dbg !225
  store i32 %inc30, i32* %i, align 4, !dbg !225
  br label %for.cond18, !dbg !226

for.end31:                                        ; preds = %for.cond18
  %27 = load %struct.NthToggle** %ntog, align 8, !dbg !227
  %28 = bitcast %struct.NthToggle* %27 to i8*, !dbg !227
  call void @free(i8* %28) #5, !dbg !228
  store i32 0, i32* %i, align 4, !dbg !229
  br label %for.cond32, !dbg !229

for.cond32:                                       ; preds = %for.inc37, %for.end31
  %29 = load i32* %i, align 4, !dbg !231
  %30 = load i32* %n, align 4, !dbg !235
  %cmp33 = icmp slt i32 %29, %30, !dbg !236
  br i1 %cmp33, label %for.body35, label %for.end39, !dbg !237

for.body35:                                       ; preds = %for.cond32
  %call36 = call %struct.NthToggle* @new_NthToggle(i8 signext 1, i32 3), !dbg !238
  store %struct.NthToggle* %call36, %struct.NthToggle** %ntog, align 8, !dbg !240
  %31 = load %struct.NthToggle** %ntog, align 8, !dbg !241
  %32 = bitcast %struct.NthToggle* %31 to i8*, !dbg !241
  call void @free(i8* %32) #5, !dbg !242
  br label %for.inc37, !dbg !243

for.inc37:                                        ; preds = %for.body35
  %33 = load i32* %i, align 4, !dbg !244
  %inc38 = add nsw i32 %33, 1, !dbg !244
  store i32 %inc38, i32* %i, align 4, !dbg !244
  br label %for.cond32, !dbg !245

for.end39:                                        ; preds = %for.cond32
  ret i32 0, !dbg !246
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !7, !34, !39, !39} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c] [DW_LANG_C99]
!1 = !{!"objinst.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
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
!29 = !{!30, !31, !33}
!30 = !{!"0xd\00base\0043\00192\0064\000\000", !1, !28, !9} ; [ DW_TAG_member ] [base] [line 43, size 192, align 64, offset 0] [from Toggle]
!31 = !{!"0xd\00count_max\0044\0032\0032\00192\000", !1, !28, !32} ; [ DW_TAG_member ] [count_max] [line 44, size 32, align 32, offset 192] [from int]
!32 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!33 = !{!"0xd\00counter\0045\0032\0032\00224\000", !1, !28, !32} ; [ DW_TAG_member ] [counter] [line 45, size 32, align 32, offset 224] [from int]
!34 = !{!35, !40, !41, !44, !47, !50, !53, !56}
!35 = !{!"0x2e\00toggle_value\00toggle_value\00\0023\000\001\000\000\00256\000\0023", !1, !36, !37, null, i8 (%struct.Toggle*)* @toggle_value, null, null, !39} ; [ DW_TAG_subprogram ] [line 23] [def] [toggle_value]
!36 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!37 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !38, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = !{!13, !8}
!39 = !{}
!40 = !{!"0x2e\00toggle_activate\00toggle_activate\00\0026\000\001\000\000\00256\000\0026", !1, !36, !24, null, %struct.Toggle* (%struct.Toggle*)* @toggle_activate, null, null, !39} ; [ DW_TAG_subprogram ] [line 26] [def] [toggle_activate]
!41 = !{!"0x2e\00init_Toggle\00init_Toggle\00\0030\000\001\000\000\00256\000\0030", !1, !36, !42, null, %struct.Toggle* (%struct.Toggle*, i8)* @init_Toggle, null, null, !39} ; [ DW_TAG_subprogram ] [line 30] [def] [init_Toggle]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{!8, !8, !13}
!44 = !{!"0x2e\00new_Toggle\00new_Toggle\00\0036\000\001\000\000\00256\000\0036", !1, !36, !45, null, %struct.Toggle* (i8)* @new_Toggle, null, null, !39} ; [ DW_TAG_subprogram ] [line 36] [def] [new_Toggle]
!45 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !46, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = !{!8, !13}
!47 = !{!"0x2e\00nth_toggle_activate\00nth_toggle_activate\00\0048\000\001\000\000\00256\000\0048", !1, !36, !48, null, %struct.NthToggle* (%struct.NthToggle*)* @nth_toggle_activate, null, null, !39} ; [ DW_TAG_subprogram ] [line 48] [def] [nth_toggle_activate]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{!26, !26}
!50 = !{!"0x2e\00init_NthToggle\00init_NthToggle\00\0055\000\001\000\000\00256\000\0055", !1, !36, !51, null, %struct.NthToggle* (%struct.NthToggle*, i32)* @init_NthToggle, null, null, !39} ; [ DW_TAG_subprogram ] [line 55] [def] [init_NthToggle]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!26, !26, !32}
!53 = !{!"0x2e\00new_NthToggle\00new_NthToggle\00\0061\000\001\000\000\00256\000\0061", !1, !36, !54, null, %struct.NthToggle* (i8, i32)* @new_NthToggle, null, null, !39} ; [ DW_TAG_subprogram ] [line 61] [def] [new_NthToggle]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{!26, !13, !32}
!56 = !{!"0x2e\00main\00main\00\0068\000\001\000\000\00256\000\0068", !1, !36, !57, null, i32 (i32, i8**)* @main, null, null, !39} ; [ DW_TAG_subprogram ] [line 68] [def] [main]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{!32, !32, !59}
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!60 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!61 = !{i32 2, !"Dwarf Version", i32 4}
!62 = !{i32 2, !"Debug Info Version", i32 2}
!63 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!64 = !{!"0x101\00this\0016777239\000", !35, !36, !8} ; [ DW_TAG_arg_variable ] [this] [line 23]
!65 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!66 = !MDLocation(line: 23, column: 27, scope: !35)
!67 = !MDLocation(line: 24, column: 12, scope: !35)
!68 = !MDLocation(line: 24, column: 5, scope: !35)
!69 = !{!"0x101\00this\0016777242\000", !40, !36, !8} ; [ DW_TAG_arg_variable ] [this] [line 26]
!70 = !MDLocation(line: 26, column: 33, scope: !40)
!71 = !MDLocation(line: 27, column: 20, scope: !40)
!72 = !MDLocation(line: 27, column: 19, scope: !40)
!73 = !MDLocation(line: 27, column: 5, scope: !40)
!74 = !MDLocation(line: 28, column: 12, scope: !40)
!75 = !MDLocation(line: 28, column: 5, scope: !40)
!76 = !{!"0x101\00this\0016777246\000", !41, !36, !8} ; [ DW_TAG_arg_variable ] [this] [line 30]
!77 = !MDLocation(line: 30, column: 29, scope: !41)
!78 = !{!"0x101\00start_state\0033554462\000", !41, !36, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 30]
!79 = !MDLocation(line: 30, column: 40, scope: !41)
!80 = !MDLocation(line: 31, column: 19, scope: !41)
!81 = !MDLocation(line: 31, column: 5, scope: !41)
!82 = !MDLocation(line: 32, column: 5, scope: !41)
!83 = !MDLocation(line: 33, column: 5, scope: !41)
!84 = !MDLocation(line: 34, column: 12, scope: !41)
!85 = !MDLocation(line: 34, column: 5, scope: !41)
!86 = !{!"0x101\00start_state\0016777252\000", !44, !36, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 36]
!87 = !MDLocation(line: 36, column: 25, scope: !44)
!88 = !{!"0x100\00this\0037\000", !44, !36, !8}   ; [ DW_TAG_auto_variable ] [this] [line 37]
!89 = !MDLocation(line: 37, column: 13, scope: !44)
!90 = !MDLocation(line: 37, column: 30, scope: !44)
!91 = !MDLocation(line: 37, column: 20, scope: !44)
!92 = !MDLocation(line: 38, column: 24, scope: !44)
!93 = !MDLocation(line: 38, column: 30, scope: !44)
!94 = !MDLocation(line: 38, column: 12, scope: !44)
!95 = !MDLocation(line: 38, column: 5, scope: !44)
!96 = !{!"0x101\00this\0016777264\000", !47, !36, !26} ; [ DW_TAG_arg_variable ] [this] [line 48]
!97 = !MDLocation(line: 48, column: 43, scope: !47)
!98 = !MDLocation(line: 49, column: 11, scope: !99)
!99 = !{!"0xb\0049\009\000", !1, !47}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!100 = !MDLocation(line: 49, column: 9, scope: !99)
!101 = !MDLocation(line: 49, column: 28, scope: !99)
!102 = !MDLocation(line: 49, column: 9, scope: !47)
!103 = !MDLocation(line: 50, column: 22, scope: !104)
!104 = !{!"0xb\0049\0045\001", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!105 = !MDLocation(line: 50, column: 21, scope: !104)
!106 = !MDLocation(line: 50, column: 2, scope: !104)
!107 = !MDLocation(line: 51, column: 2, scope: !104)
!108 = !MDLocation(line: 52, column: 5, scope: !104)
!109 = !MDLocation(line: 53, column: 12, scope: !47)
!110 = !MDLocation(line: 53, column: 5, scope: !47)
!111 = !{!"0x101\00this\0016777271\000", !50, !36, !26} ; [ DW_TAG_arg_variable ] [this] [line 55]
!112 = !MDLocation(line: 55, column: 38, scope: !50)
!113 = !{!"0x101\00max_count\0033554487\000", !50, !36, !32} ; [ DW_TAG_arg_variable ] [max_count] [line 55]
!114 = !MDLocation(line: 55, column: 48, scope: !50)
!115 = !MDLocation(line: 56, column: 23, scope: !50)
!116 = !MDLocation(line: 56, column: 5, scope: !50)
!117 = !MDLocation(line: 57, column: 5, scope: !50)
!118 = !MDLocation(line: 58, column: 5, scope: !50)
!119 = !MDLocation(line: 59, column: 12, scope: !50)
!120 = !MDLocation(line: 59, column: 5, scope: !50)
!121 = !{!"0x101\00start_state\0016777277\000", !53, !36, !13} ; [ DW_TAG_arg_variable ] [start_state] [line 61]
!122 = !MDLocation(line: 61, column: 31, scope: !53)
!123 = !{!"0x101\00max_count\0033554493\000", !53, !36, !32} ; [ DW_TAG_arg_variable ] [max_count] [line 61]
!124 = !MDLocation(line: 61, column: 48, scope: !53)
!125 = !{!"0x100\00this\0062\000", !53, !36, !26} ; [ DW_TAG_auto_variable ] [this] [line 62]
!126 = !MDLocation(line: 62, column: 16, scope: !53)
!127 = !MDLocation(line: 62, column: 36, scope: !53)
!128 = !MDLocation(line: 62, column: 23, scope: !53)
!129 = !MDLocation(line: 63, column: 47, scope: !53)
!130 = !MDLocation(line: 63, column: 37, scope: !53)
!131 = !MDLocation(line: 63, column: 53, scope: !53)
!132 = !MDLocation(line: 63, column: 25, scope: !53)
!133 = !MDLocation(line: 63, column: 12, scope: !53)
!134 = !MDLocation(line: 63, column: 5, scope: !53)
!135 = !MDLocation(line: 64, column: 27, scope: !53)
!136 = !MDLocation(line: 64, column: 33, scope: !53)
!137 = !MDLocation(line: 64, column: 12, scope: !53)
!138 = !MDLocation(line: 64, column: 5, scope: !53)
!139 = !{!"0x101\00argc\0016777284\000", !56, !36, !32} ; [ DW_TAG_arg_variable ] [argc] [line 68]
!140 = !MDLocation(line: 68, column: 14, scope: !56)
!141 = !{!"0x101\00argv\0033554500\000", !56, !36, !59} ; [ DW_TAG_arg_variable ] [argv] [line 68]
!142 = !MDLocation(line: 68, column: 26, scope: !56)
!143 = !{!"0x100\00i\0074\000", !56, !36, !32}    ; [ DW_TAG_auto_variable ] [i] [line 74]
!144 = !MDLocation(line: 74, column: 9, scope: !56)
!145 = !{!"0x100\00n\0074\000", !56, !36, !32}    ; [ DW_TAG_auto_variable ] [n] [line 74]
!146 = !MDLocation(line: 74, column: 12, scope: !56)
!147 = !MDLocation(line: 74, column: 18, scope: !56)
!148 = !MDLocation(line: 74, column: 17, scope: !56)
!149 = !MDLocation(line: 74, column: 36, scope: !150)
!150 = !{!"0xb\001", !1, !56}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!151 = !MDLocation(line: 74, column: 31, scope: !56)
!152 = !MDLocation(line: 74, column: 17, scope: !153)
!153 = !{!"0xb\002", !1, !56}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!154 = !MDLocation(line: 74, column: 12, scope: !155)
!155 = !{!"0xb\004", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!156 = !{!"0xb\003", !1, !56}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!157 = !{!"0x100\00tog\0075\000", !56, !36, !8}   ; [ DW_TAG_auto_variable ] [tog] [line 75]
!158 = !MDLocation(line: 75, column: 13, scope: !56)
!159 = !{!"0x100\00ntog\0076\000", !56, !36, !26} ; [ DW_TAG_auto_variable ] [ntog] [line 76]
!160 = !MDLocation(line: 76, column: 16, scope: !56)
!161 = !MDLocation(line: 78, column: 11, scope: !56)
!162 = !MDLocation(line: 78, column: 5, scope: !56)
!163 = !MDLocation(line: 79, column: 10, scope: !164)
!164 = !{!"0xb\0079\005\002", !1, !56}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!165 = !MDLocation(line: 79, column: 15, scope: !166)
!166 = !{!"0xb\002", !1, !167}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!167 = !{!"0xb\001", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!168 = !{!"0xb\0079\005\003", !1, !164}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!169 = !MDLocation(line: 79, column: 5, scope: !164)
!170 = !MDLocation(line: 80, column: 8, scope: !171)
!171 = !{!"0xb\0079\0025\004", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!172 = !MDLocation(line: 80, column: 22, scope: !171)
!173 = !MDLocation(line: 80, column: 34, scope: !171)
!174 = !MDLocation(line: 80, column: 7, scope: !171)
!175 = !MDLocation(line: 80, column: 2, scope: !171)
!176 = !MDLocation(line: 81, column: 5, scope: !171)
!177 = !MDLocation(line: 79, column: 20, scope: !168)
!178 = !MDLocation(line: 79, column: 5, scope: !168)
!179 = !MDLocation(line: 82, column: 13, scope: !56)
!180 = !MDLocation(line: 82, column: 5, scope: !56)
!181 = !MDLocation(line: 83, column: 10, scope: !182)
!182 = !{!"0xb\0083\005\005", !1, !56}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!183 = !MDLocation(line: 83, column: 15, scope: !184)
!184 = !{!"0xb\002", !1, !185}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!185 = !{!"0xb\001", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!186 = !{!"0xb\0083\005\006", !1, !182}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!187 = !MDLocation(line: 83, column: 17, scope: !186)
!188 = !MDLocation(line: 83, column: 15, scope: !186)
!189 = !MDLocation(line: 83, column: 5, scope: !182)
!190 = !MDLocation(line: 84, column: 8, scope: !191)
!191 = !{!"0xb\0083\0025\007", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!192 = !MDLocation(line: 84, column: 2, scope: !191)
!193 = !MDLocation(line: 85, column: 10, scope: !191)
!194 = !MDLocation(line: 85, column: 2, scope: !191)
!195 = !MDLocation(line: 86, column: 5, scope: !191)
!196 = !MDLocation(line: 83, column: 20, scope: !186)
!197 = !MDLocation(line: 83, column: 5, scope: !186)
!198 = !MDLocation(line: 88, column: 5, scope: !56)
!199 = !MDLocation(line: 90, column: 12, scope: !56)
!200 = !MDLocation(line: 90, column: 5, scope: !56)
!201 = !MDLocation(line: 91, column: 10, scope: !202)
!202 = !{!"0xb\0091\005\008", !1, !56}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!203 = !MDLocation(line: 91, column: 15, scope: !204)
!204 = !{!"0xb\002", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!205 = !{!"0xb\001", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!206 = !{!"0xb\0091\005\009", !1, !202}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!207 = !MDLocation(line: 91, column: 5, scope: !202)
!208 = !{!"0x100\00Msg\0092\000", !209, !36, !210} ; [ DW_TAG_auto_variable ] [Msg] [line 92]
!209 = !{!"0xb\0091\0025\0010", !1, !206}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!210 = !{!"0xf\00\000\0064\0064\000\000", null, null, !211} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!211 = !{!"0x26\00\000\000\000\000\000", null, null, !13} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!212 = !MDLocation(line: 92, column: 18, scope: !209)
!213 = !MDLocation(line: 93, column: 6, scope: !214)
!214 = !{!"0xb\0093\006\0011", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!215 = !MDLocation(line: 93, column: 35, scope: !214)
!216 = !MDLocation(line: 93, column: 26, scope: !214)
!217 = !MDLocation(line: 93, column: 57, scope: !214)
!218 = !MDLocation(line: 93, column: 48, scope: !214)
!219 = !MDLocation(line: 93, column: 6, scope: !209)
!220 = !MDLocation(line: 94, column: 4, scope: !214)
!221 = !MDLocation(line: 96, column: 4, scope: !214)
!222 = !MDLocation(line: 97, column: 7, scope: !209)
!223 = !MDLocation(line: 97, column: 2, scope: !209)
!224 = !MDLocation(line: 98, column: 5, scope: !209)
!225 = !MDLocation(line: 91, column: 20, scope: !206)
!226 = !MDLocation(line: 91, column: 5, scope: !206)
!227 = !MDLocation(line: 99, column: 13, scope: !56)
!228 = !MDLocation(line: 99, column: 5, scope: !56)
!229 = !MDLocation(line: 100, column: 10, scope: !230)
!230 = !{!"0xb\00100\005\0012", !1, !56}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!231 = !MDLocation(line: 100, column: 15, scope: !232)
!232 = !{!"0xb\002", !1, !233}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!233 = !{!"0xb\001", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!234 = !{!"0xb\00100\005\0013", !1, !230}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!235 = !MDLocation(line: 100, column: 17, scope: !234)
!236 = !MDLocation(line: 100, column: 15, scope: !234)
!237 = !MDLocation(line: 100, column: 5, scope: !230)
!238 = !MDLocation(line: 101, column: 9, scope: !239)
!239 = !{!"0xb\00100\0025\0014", !1, !234}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/objinst.c]
!240 = !MDLocation(line: 101, column: 2, scope: !239)
!241 = !MDLocation(line: 102, column: 10, scope: !239)
!242 = !MDLocation(line: 102, column: 2, scope: !239)
!243 = !MDLocation(line: 103, column: 5, scope: !239)
!244 = !MDLocation(line: 100, column: 20, scope: !234)
!245 = !MDLocation(line: 100, column: 5, scope: !234)
!246 = !MDLocation(line: 104, column: 5, scope: !56)
