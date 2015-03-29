; ModuleID = 'durbin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !85), !dbg !86
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !85), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !85), !dbg !88
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !89
  %call1 = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !90
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !91
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !92
  %call4 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !93
  %call5 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !94
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !95
  %arraydecay6 = bitcast i8* %call1 to [4000 x double]*, !dbg !96
  %arraydecay7 = bitcast i8* %call2 to double*, !dbg !97
  %arraydecay8 = bitcast i8* %call3 to double*, !dbg !98
  %arraydecay9 = bitcast i8* %call4 to double*, !dbg !99
  tail call fastcc void @init_array([4000 x double]* %arraydecay, [4000 x double]* %arraydecay6, double* %arraydecay7, double* %arraydecay8, double* %arraydecay9), !dbg !100
  %arraydecay15 = bitcast i8* %call5 to double*, !dbg !101
  tail call fastcc void @kernel_durbin([4000 x double]* %arraydecay, [4000 x double]* %arraydecay6, double* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay15), !dbg !102
  %cmp = icmp sgt i32 %argc, 42, !dbg !103
  br i1 %cmp, label %if.end52, label %if.end59, !dbg !104

if.end52:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !85), !dbg !105
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !46, metadata !85), !dbg !106
  %0 = load i8** %argv, align 8, !dbg !107, !tbaa !109
  %1 = load i8* %0, align 1, !dbg !107, !tbaa !113
  %phitmp = icmp eq i8 %1, 0, !dbg !105
  br i1 %phitmp, label %if.then57, label %if.end59, !dbg !104

if.then57:                                        ; preds = %if.end52
  tail call fastcc void @print_array(double* %arraydecay15), !dbg !114
  br label %if.end59, !dbg !114

if.end59:                                         ; preds = %if.end52, %if.then57, %entry
  tail call void @free(i8* %call) #4, !dbg !116
  tail call void @free(i8* %call1) #4, !dbg !117
  tail call void @free(i8* %call2) #4, !dbg !118
  tail call void @free(i8* %call3) #4, !dbg !119
  tail call void @free(i8* %call4) #4, !dbg !120
  tail call void @free(i8* %call5) #4, !dbg !121
  ret i32 0, !dbg !122
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([4000 x double]* nocapture %y, [4000 x double]* nocapture %sum, double* nocapture %alpha, double* nocapture %beta, double* nocapture %r) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !74, metadata !85), !dbg !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !80, metadata !85), !dbg !124
  br label %for.body, !dbg !125

for.cond.loopexit:                                ; preds = %for.body14
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 4000, !dbg !125
  br i1 %exitcond5, label %for.end34, label %for.body, !dbg !125

for.body:                                         ; preds = %for.cond.loopexit, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.cond.loopexit ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !127
  %conv = sitofp i32 %0 to double, !dbg !127
  %arrayidx = getelementptr inbounds double* %alpha, i64 %indvars.iv3, !dbg !130
  store double %conv, double* %arrayidx, align 8, !dbg !130, !tbaa !131
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !125
  %1 = trunc i64 %indvars.iv.next4 to i32, !dbg !133
  %div = sdiv i32 %1, 4000, !dbg !133
  %conv1 = sitofp i32 %div to double, !dbg !133
  %div2 = fmul double %conv1, 5.000000e-01, !dbg !133
  %arrayidx4 = getelementptr inbounds double* %beta, i64 %indvars.iv3, !dbg !134
  store double %div2, double* %arrayidx4, align 8, !dbg !134, !tbaa !131
  %div8 = fmul double %conv1, 2.500000e-01, !dbg !135
  %arrayidx10 = getelementptr inbounds double* %r, i64 %indvars.iv3, !dbg !136
  store double %div8, double* %arrayidx10, align 8, !dbg !136, !tbaa !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !81, metadata !85), !dbg !137
  br label %for.body14, !dbg !138

for.body14:                                       ; preds = %for.body14, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body14 ]
  %2 = trunc i64 %indvars.iv to i32, !dbg !140
  %conv16 = sitofp i32 %2 to double, !dbg !140
  %mul = fmul double %conv, %conv16, !dbg !143
  %div18 = fdiv double %mul, 4.000000e+03, !dbg !144
  %arrayidx22 = getelementptr inbounds [4000 x double]* %y, i64 %indvars.iv3, i64 %indvars.iv, !dbg !145
  store double %div18, double* %arrayidx22, align 8, !dbg !145, !tbaa !131
  %arrayidx31 = getelementptr inbounds [4000 x double]* %sum, i64 %indvars.iv3, i64 %indvars.iv, !dbg !146
  store double %div18, double* %arrayidx31, align 8, !dbg !146, !tbaa !131
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !138
  br i1 %exitcond, label %for.cond.loopexit, label %for.body14, !dbg !138

for.end34:                                        ; preds = %for.cond.loopexit
  ret void, !dbg !147
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_durbin([4000 x double]* nocapture %y, [4000 x double]* nocapture %sum, double* nocapture %alpha, double* nocapture %beta, double* nocapture readonly %r, double* nocapture %out) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !61, metadata !85), !dbg !148
  %0 = load double* %r, align 8, !dbg !149, !tbaa !131
  %arrayidx2 = getelementptr inbounds [4000 x double]* %y, i64 0, i64 0, !dbg !150
  store double %0, double* %arrayidx2, align 8, !dbg !150, !tbaa !131
  store double 1.000000e+00, double* %beta, align 8, !dbg !151, !tbaa !131
  %1 = load double* %r, align 8, !dbg !152, !tbaa !131
  store double %1, double* %alpha, align 8, !dbg !153, !tbaa !131
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !69, metadata !85), !dbg !154
  br label %for.body28.lr.ph, !dbg !155

for.body28.lr.ph:                                 ; preds = %entry, %for.end84
  %indvars.iv20 = phi i64 [ 1, %entry ], [ %indvars.iv.next21, %for.end84 ]
  %indvars.iv16 = phi i32 [ 1, %entry ], [ %indvars.iv.next17, %for.end84 ]
  %2 = add nsw i64 %indvars.iv20, -1, !dbg !157
  %arrayidx6 = getelementptr inbounds double* %beta, i64 %2, !dbg !160
  %3 = load double* %arrayidx6, align 8, !dbg !160, !tbaa !131
  %arrayidx9 = getelementptr inbounds double* %alpha, i64 %2, !dbg !161
  %4 = load double* %arrayidx9, align 8, !dbg !161, !tbaa !131
  %mul = fmul double %4, %4, !dbg !161
  %mul16 = fmul double %3, %mul, !dbg !161
  %sub17 = fsub double %3, %mul16, !dbg !160
  %arrayidx19 = getelementptr inbounds double* %beta, i64 %indvars.iv20, !dbg !162
  store double %sub17, double* %arrayidx19, align 8, !dbg !162, !tbaa !131
  %arrayidx21 = getelementptr inbounds double* %r, i64 %indvars.iv20, !dbg !163
  %5 = load double* %arrayidx21, align 8, !dbg !163, !tbaa !131
  %arrayidx24 = getelementptr inbounds [4000 x double]* %sum, i64 0, i64 %indvars.iv20, !dbg !164
  store double %5, double* %arrayidx24, align 8, !dbg !164, !tbaa !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !68, metadata !85), !dbg !165
  %6 = add nsw i64 %indvars.iv20, -1, !dbg !166
  br label %for.body28, !dbg !169

for.body28:                                       ; preds = %for.body28, %for.body28.lr.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.body28 ], [ 0, %for.body28.lr.ph ]
  %arrayidx32 = getelementptr inbounds [4000 x double]* %sum, i64 %indvars.iv7, i64 %indvars.iv20, !dbg !170
  %7 = load double* %arrayidx32, align 8, !dbg !170, !tbaa !131
  %8 = sub i64 %6, %indvars.iv7, !dbg !166
  %arrayidx36 = getelementptr inbounds double* %r, i64 %8, !dbg !171
  %9 = load double* %arrayidx36, align 8, !dbg !171, !tbaa !131
  %arrayidx41 = getelementptr inbounds [4000 x double]* %y, i64 %indvars.iv7, i64 %2, !dbg !172
  %10 = load double* %arrayidx41, align 8, !dbg !172, !tbaa !131
  %mul42 = fmul double %9, %10, !dbg !171
  %add = fadd double %7, %mul42, !dbg !170
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !169
  %arrayidx47 = getelementptr inbounds [4000 x double]* %sum, i64 %indvars.iv.next8, i64 %indvars.iv20, !dbg !173
  store double %add, double* %arrayidx47, align 8, !dbg !173, !tbaa !131
  %lftr.wideiv = trunc i64 %indvars.iv.next8 to i32, !dbg !169
  %exitcond12 = icmp eq i32 %lftr.wideiv, %indvars.iv16, !dbg !169
  br i1 %exitcond12, label %for.body61.lr.ph, label %for.body28, !dbg !169

for.body61.lr.ph:                                 ; preds = %for.body28
  %arrayidx51 = getelementptr inbounds [4000 x double]* %sum, i64 %indvars.iv20, i64 %indvars.iv20, !dbg !174
  %11 = load double* %arrayidx51, align 8, !dbg !174, !tbaa !131
  %12 = load double* %arrayidx19, align 8, !dbg !175, !tbaa !131
  %13 = fmul double %11, %12, !dbg !176
  %mul55 = fsub double -0.000000e+00, %13, !dbg !176
  %arrayidx57 = getelementptr inbounds double* %alpha, i64 %indvars.iv20, !dbg !177
  store double %mul55, double* %arrayidx57, align 8, !dbg !177, !tbaa !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !68, metadata !85), !dbg !165
  %14 = add nsw i64 %indvars.iv20, -1, !dbg !178
  br label %for.body61, !dbg !181

for.body61:                                       ; preds = %for.body61, %for.body61.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.body61 ], [ 0, %for.body61.lr.ph ]
  %arrayidx66 = getelementptr inbounds [4000 x double]* %y, i64 %indvars.iv13, i64 %2, !dbg !182
  %15 = load double* %arrayidx66, align 8, !dbg !182, !tbaa !131
  %16 = load double* %arrayidx57, align 8, !dbg !183, !tbaa !131
  %17 = sub i64 %14, %indvars.iv13, !dbg !178
  %arrayidx75 = getelementptr inbounds [4000 x double]* %y, i64 %17, i64 %2, !dbg !184
  %18 = load double* %arrayidx75, align 8, !dbg !184, !tbaa !131
  %mul76 = fmul double %16, %18, !dbg !183
  %add77 = fadd double %15, %mul76, !dbg !182
  %arrayidx81 = getelementptr inbounds [4000 x double]* %y, i64 %indvars.iv13, i64 %indvars.iv20, !dbg !185
  store double %add77, double* %arrayidx81, align 8, !dbg !185, !tbaa !131
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !181
  %lftr.wideiv18 = trunc i64 %indvars.iv.next14 to i32, !dbg !181
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %indvars.iv16, !dbg !181
  br i1 %exitcond19, label %for.end84, label %for.body61, !dbg !181

for.end84:                                        ; preds = %for.body61
  %19 = load double* %arrayidx57, align 8, !dbg !186, !tbaa !131
  %arrayidx90 = getelementptr inbounds [4000 x double]* %y, i64 %indvars.iv20, i64 %indvars.iv20, !dbg !187
  store double %19, double* %arrayidx90, align 8, !dbg !187, !tbaa !131
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1, !dbg !155
  %indvars.iv.next17 = add nuw nsw i32 %indvars.iv16, 1, !dbg !155
  tail call void @llvm.dbg.value(metadata i32 %indvars.iv.next17, i64 0, metadata !69, metadata !85), !dbg !154
  %exitcond25 = icmp eq i64 %indvars.iv.next21, 4000, !dbg !155
  br i1 %exitcond25, label %for.body96, label %for.body28.lr.ph, !dbg !155

for.body96:                                       ; preds = %for.end84, %for.body96
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body96 ], [ 0, %for.end84 ]
  %arrayidx99 = getelementptr inbounds [4000 x double]* %y, i64 %indvars.iv, i64 3999, !dbg !188
  %20 = load double* %arrayidx99, align 8, !dbg !188, !tbaa !131
  %arrayidx101 = getelementptr inbounds double* %out, i64 %indvars.iv, !dbg !191
  store double %20, double* %arrayidx101, align 8, !dbg !191, !tbaa !131
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !192
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !192
  br i1 %exitcond, label %for.end104, label %for.body96, !dbg !192

for.end104:                                       ; preds = %for.body96
  ret void, !dbg !193
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %out) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !54, metadata !85), !dbg !194
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !85), !dbg !195
  br label %for.body, !dbg !196

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !198, !tbaa !109
  %arrayidx = getelementptr inbounds double* %out, i64 %indvars.iv, !dbg !201
  %1 = load double* %arrayidx, align 8, !dbg !201, !tbaa !131
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %1) #5, !dbg !202
  %2 = trunc i64 %indvars.iv to i32, !dbg !203
  %rem = srem i32 %2, 20, !dbg !203
  %cmp1 = icmp eq i32 %rem, 0, !dbg !203
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !205

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !206, !tbaa !109
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6, !dbg !208
  br label %for.inc, !dbg !208

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !196
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !196
  br i1 %exitcond, label %for.end, label %for.body, !dbg !196

for.end:                                          ; preds = %for.inc
  ret void, !dbg !209
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!82, !83}
!llvm.ident = !{!84}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c] [DW_LANG_C99]
!1 = !{!"durbin.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001024000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\004000"}                        ; [ DW_TAG_subrange_type ] [0, 3999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\00256000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin"}
!14 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!19 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!"0x26\00\000\000\000\000\000", null, null, !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!22 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!25, !49, !57, !70}
!25 = !{!"0x2e\00main\00main\00\0096\000\001\000\000\00256\001\0097", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 97] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !46, !48}
!33 = !{!"0x101\00argc\0016777312\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 96]
!34 = !{!"0x101\00argv\0033554528\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 96]
!35 = !{!"0x100\00n\0099\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 99]
!36 = !{!"0x100\00y\00102\000", !25, !26, !4}     ; [ DW_TAG_auto_variable ] [y] [line 102]
!37 = !{!"0x100\00sum\00103\000", !25, !26, !4}   ; [ DW_TAG_auto_variable ] [sum] [line 103]
!38 = !{!"0x100\00alpha\00104\000", !25, !26, !9} ; [ DW_TAG_auto_variable ] [alpha] [line 104]
!39 = !{!"0x100\00beta\00105\000", !25, !26, !9}  ; [ DW_TAG_auto_variable ] [beta] [line 105]
!40 = !{!"0x100\00r\00106\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [r] [line 106]
!41 = !{!"0x100\00out\00107\000", !25, !26, !9}   ; [ DW_TAG_auto_variable ] [out] [line 107]
!42 = !{!"0x100\00__s1_len\00136\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 136]
!43 = !{!"0xb\00136\003\001", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!44 = !{!"0xb\00136\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!45 = !{!"0x100\00__s2_len\00136\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 136]
!46 = !{!"0x100\00__s2\00136\000", !47, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 136]
!47 = !{!"0xb\00136\003\002", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!48 = !{!"0x100\00__result\00136\000", !47, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 136]
!49 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0051", !1, !26, !50, null, void (double*)* @print_array, null, null, !53} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 51] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !52}
!52 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!53 = !{!54, !55, !56}
!54 = !{!"0x101\00n\0016777264\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 48]
!55 = !{!"0x101\00out\0033554481\000", !49, !26, !52} ; [ DW_TAG_arg_variable ] [out] [line 49]
!56 = !{!"0x100\00i\0052\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!57 = !{!"0x2e\00kernel_durbin\00kernel_durbin\00\0064\001\001\000\000\00256\001\0071", !1, !26, !58, null, void ([4000 x double]*, [4000 x double]*, double*, double*, double*, double*)* @kernel_durbin, null, null, !60} ; [ DW_TAG_subprogram ] [line 64] [local] [def] [scope 71] [kernel_durbin]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !29, !9, !9, !52, !52, !52, !52}
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69}
!61 = !{!"0x101\00n\0016777280\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 64]
!62 = !{!"0x101\00y\0033554497\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [y] [line 65]
!63 = !{!"0x101\00sum\0050331714\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [sum] [line 66]
!64 = !{!"0x101\00alpha\0067108931\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [alpha] [line 67]
!65 = !{!"0x101\00beta\0083886148\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [beta] [line 68]
!66 = !{!"0x101\00r\00100663365\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [r] [line 69]
!67 = !{!"0x101\00out\00117440582\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [out] [line 70]
!68 = !{!"0x100\00i\0072\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!69 = !{!"0x100\00k\0072\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 72]
!70 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !71, null, void ([4000 x double]*, [4000 x double]*, double*, double*, double*)* @init_array, null, null, !73} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!71 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !72, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = !{null, !29, !9, !9, !52, !52, !52}
!73 = !{!74, !75, !76, !77, !78, !79, !80, !81}
!74 = !{!"0x101\00n\0016777239\000", !70, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!75 = !{!"0x101\00y\0033554456\000", !70, !26, !9} ; [ DW_TAG_arg_variable ] [y] [line 24]
!76 = !{!"0x101\00sum\0050331673\000", !70, !26, !9} ; [ DW_TAG_arg_variable ] [sum] [line 25]
!77 = !{!"0x101\00alpha\0067108890\000", !70, !26, !52} ; [ DW_TAG_arg_variable ] [alpha] [line 26]
!78 = !{!"0x101\00beta\0083886107\000", !70, !26, !52} ; [ DW_TAG_arg_variable ] [beta] [line 27]
!79 = !{!"0x101\00r\00100663324\000", !70, !26, !52} ; [ DW_TAG_arg_variable ] [r] [line 28]
!80 = !{!"0x100\00i\0030\000", !70, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!81 = !{!"0x100\00j\0030\000", !70, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!82 = !{i32 2, !"Dwarf Version", i32 4}
!83 = !{i32 2, !"Debug Info Version", i32 2}
!84 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!85 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!86 = !MDLocation(line: 96, column: 14, scope: !25)
!87 = !MDLocation(line: 96, column: 27, scope: !25)
!88 = !MDLocation(line: 99, column: 7, scope: !25)
!89 = !MDLocation(line: 102, column: 3, scope: !25)
!90 = !MDLocation(line: 103, column: 3, scope: !25)
!91 = !MDLocation(line: 104, column: 3, scope: !25)
!92 = !MDLocation(line: 105, column: 3, scope: !25)
!93 = !MDLocation(line: 106, column: 3, scope: !25)
!94 = !MDLocation(line: 107, column: 3, scope: !25)
!95 = !MDLocation(line: 112, column: 8, scope: !25)
!96 = !MDLocation(line: 113, column: 8, scope: !25)
!97 = !MDLocation(line: 114, column: 8, scope: !25)
!98 = !MDLocation(line: 115, column: 8, scope: !25)
!99 = !MDLocation(line: 116, column: 8, scope: !25)
!100 = !MDLocation(line: 111, column: 3, scope: !25)
!101 = !MDLocation(line: 128, column: 4, scope: !25)
!102 = !MDLocation(line: 122, column: 3, scope: !25)
!103 = !MDLocation(line: 136, column: 3, scope: !44)
!104 = !MDLocation(line: 136, column: 3, scope: !25)
!105 = !MDLocation(line: 136, column: 3, scope: !43)
!106 = !MDLocation(line: 136, column: 3, scope: !47)
!107 = !MDLocation(line: 136, column: 3, scope: !108)
!108 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!109 = !{!110, !110, i64 0}
!110 = !{!"any pointer", !111, i64 0}
!111 = !{!"omnipotent char", !112, i64 0}
!112 = !{!"Simple C/C++ TBAA"}
!113 = !{!111, !111, i64 0}
!114 = !MDLocation(line: 136, column: 3, scope: !115)
!115 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!116 = !MDLocation(line: 139, column: 3, scope: !25)
!117 = !MDLocation(line: 140, column: 3, scope: !25)
!118 = !MDLocation(line: 141, column: 3, scope: !25)
!119 = !MDLocation(line: 142, column: 3, scope: !25)
!120 = !MDLocation(line: 143, column: 3, scope: !25)
!121 = !MDLocation(line: 144, column: 3, scope: !25)
!122 = !MDLocation(line: 146, column: 3, scope: !25)
!123 = !MDLocation(line: 23, column: 22, scope: !70)
!124 = !MDLocation(line: 30, column: 7, scope: !70)
!125 = !MDLocation(line: 32, column: 3, scope: !126)
!126 = !{!"0xb\0032\003\0021", !1, !70}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!127 = !MDLocation(line: 34, column: 18, scope: !128)
!128 = !{!"0xb\0033\005\0023", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!129 = !{!"0xb\0032\003\0022", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!130 = !MDLocation(line: 34, column: 7, scope: !128)
!131 = !{!132, !132, i64 0}
!132 = !{!"double", !111, i64 0}
!133 = !MDLocation(line: 35, column: 17, scope: !128)
!134 = !MDLocation(line: 35, column: 7, scope: !128)
!135 = !MDLocation(line: 36, column: 14, scope: !128)
!136 = !MDLocation(line: 36, column: 7, scope: !128)
!137 = !MDLocation(line: 30, column: 10, scope: !70)
!138 = !MDLocation(line: 37, column: 7, scope: !139)
!139 = !{!"0xb\0037\007\0024", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!140 = !MDLocation(line: 38, column: 27, scope: !141)
!141 = !{!"0xb\0037\0031\0026", !1, !142}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!142 = !{!"0xb\0037\007\0025", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!143 = !MDLocation(line: 38, column: 13, scope: !141)
!144 = !MDLocation(line: 38, column: 12, scope: !141)
!145 = !MDLocation(line: 38, column: 2, scope: !141)
!146 = !MDLocation(line: 39, column: 2, scope: !141)
!147 = !MDLocation(line: 42, column: 1, scope: !70)
!148 = !MDLocation(line: 64, column: 24, scope: !57)
!149 = !MDLocation(line: 75, column: 13, scope: !57)
!150 = !MDLocation(line: 75, column: 3, scope: !57)
!151 = !MDLocation(line: 76, column: 3, scope: !57)
!152 = !MDLocation(line: 77, column: 14, scope: !57)
!153 = !MDLocation(line: 77, column: 3, scope: !57)
!154 = !MDLocation(line: 72, column: 10, scope: !57)
!155 = !MDLocation(line: 78, column: 3, scope: !156)
!156 = !{!"0xb\0078\003\0012", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!157 = !MDLocation(line: 80, column: 22, scope: !158)
!158 = !{!"0xb\0079\005\0014", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!159 = !{!"0xb\0078\003\0013", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!160 = !MDLocation(line: 80, column: 17, scope: !158)
!161 = !MDLocation(line: 80, column: 29, scope: !158)
!162 = !MDLocation(line: 80, column: 7, scope: !158)
!163 = !MDLocation(line: 81, column: 19, scope: !158)
!164 = !MDLocation(line: 81, column: 7, scope: !158)
!165 = !MDLocation(line: 72, column: 7, scope: !57)
!166 = !MDLocation(line: 83, column: 30, scope: !167)
!167 = !{!"0xb\0082\007\0016", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!168 = !{!"0xb\0082\007\0015", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!169 = !MDLocation(line: 82, column: 7, scope: !168)
!170 = !MDLocation(line: 83, column: 16, scope: !167)
!171 = !MDLocation(line: 83, column: 28, scope: !167)
!172 = !MDLocation(line: 83, column: 39, scope: !167)
!173 = !MDLocation(line: 83, column: 2, scope: !167)
!174 = !MDLocation(line: 84, column: 19, scope: !158)
!175 = !MDLocation(line: 84, column: 31, scope: !158)
!176 = !MDLocation(line: 84, column: 18, scope: !158)
!177 = !MDLocation(line: 84, column: 7, scope: !158)
!178 = !MDLocation(line: 86, column: 37, scope: !179)
!179 = !{!"0xb\0085\007\0018", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!180 = !{!"0xb\0085\007\0017", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!181 = !MDLocation(line: 85, column: 7, scope: !180)
!182 = !MDLocation(line: 86, column: 12, scope: !179)
!183 = !MDLocation(line: 86, column: 24, scope: !179)
!184 = !MDLocation(line: 86, column: 35, scope: !179)
!185 = !MDLocation(line: 86, column: 2, scope: !179)
!186 = !MDLocation(line: 87, column: 17, scope: !158)
!187 = !MDLocation(line: 87, column: 7, scope: !158)
!188 = !MDLocation(line: 90, column: 14, scope: !189)
!189 = !{!"0xb\0089\003\0020", !1, !190}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!190 = !{!"0xb\0089\003\0019", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!191 = !MDLocation(line: 90, column: 5, scope: !189)
!192 = !MDLocation(line: 89, column: 3, scope: !190)
!193 = !MDLocation(line: 93, column: 1, scope: !57)
!194 = !MDLocation(line: 48, column: 22, scope: !49)
!195 = !MDLocation(line: 52, column: 7, scope: !49)
!196 = !MDLocation(line: 54, column: 3, scope: !197)
!197 = !{!"0xb\0054\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!198 = !MDLocation(line: 55, column: 14, scope: !199)
!199 = !{!"0xb\0054\0027\0010", !1, !200}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!200 = !{!"0xb\0054\003\009", !1, !197}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!201 = !MDLocation(line: 55, column: 44, scope: !199)
!202 = !MDLocation(line: 55, column: 5, scope: !199)
!203 = !MDLocation(line: 56, column: 9, scope: !204)
!204 = !{!"0xb\0056\009\0011", !1, !199}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!205 = !MDLocation(line: 56, column: 9, scope: !199)
!206 = !MDLocation(line: 56, column: 31, scope: !207)
!207 = !{!"0xb\001", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!208 = !MDLocation(line: 56, column: 22, scope: !204)
!209 = !MDLocation(line: 58, column: 1, scope: !49)
