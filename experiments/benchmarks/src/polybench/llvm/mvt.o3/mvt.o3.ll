; ModuleID = 'mvt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !82), !dbg !83
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !82), !dbg !84
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !82), !dbg !85
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !86
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !87
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !88
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !89
  %call4 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !90
  %arraydecay = bitcast i8* %call1 to double*, !dbg !91
  %arraydecay5 = bitcast i8* %call2 to double*, !dbg !92
  %arraydecay6 = bitcast i8* %call3 to double*, !dbg !93
  %arraydecay7 = bitcast i8* %call4 to double*, !dbg !94
  %arraydecay8 = bitcast i8* %call to [4000 x double]*, !dbg !95
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !96, metadata !82), !dbg !98
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !82), !dbg !100
  br label %for.body.i, !dbg !101

for.body.i:                                       ; preds = %for.inc30.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc30.i ], !dbg !97
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !103
  %conv.i = sitofp i32 %0 to double, !dbg !103
  %div.i = fdiv double %conv.i, 4.000000e+03, !dbg !106
  %arrayidx.i = getelementptr inbounds double* %arraydecay, i64 %indvars.iv3.i, !dbg !107
  store double %div.i, double* %arrayidx.i, align 8, !dbg !107, !tbaa !108
  %add.i = fadd double %conv.i, 1.000000e+00, !dbg !112
  %div4.i = fdiv double %add.i, 4.000000e+03, !dbg !113
  %arrayidx6.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv3.i, !dbg !114
  store double %div4.i, double* %arrayidx6.i, align 8, !dbg !114, !tbaa !108
  %add8.i = fadd double %conv.i, 3.000000e+00, !dbg !115
  %div10.i = fdiv double %add8.i, 4.000000e+03, !dbg !116
  %arrayidx12.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv3.i, !dbg !117
  store double %div10.i, double* %arrayidx12.i, align 8, !dbg !117, !tbaa !108
  %add14.i = fadd double %conv.i, 4.000000e+00, !dbg !118
  %div16.i = fdiv double %add14.i, 4.000000e+03, !dbg !119
  %arrayidx18.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv3.i, !dbg !120
  store double %div16.i, double* %arrayidx18.i, align 8, !dbg !120, !tbaa !108
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !121, metadata !82), !dbg !122
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.i
  %index = phi i64 [ 0, %for.body.i ], [ %index.next.1, %vector.body ], !dbg !97
  %induction9699 = or i64 %index, 1, !dbg !97
  %1 = trunc i64 %index to i32, !dbg !123
  %induction98100 = or i32 %1, 1, !dbg !123
  %2 = sitofp i32 %1 to double, !dbg !123
  %3 = sitofp i32 %induction98100 to double, !dbg !123
  %4 = fmul double %conv.i, %2, !dbg !126
  %5 = fmul double %conv.i, %3, !dbg !126
  %6 = fdiv double %4, 4.000000e+03, !dbg !127
  %7 = fdiv double %5, 4.000000e+03, !dbg !127
  %8 = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv3.i, i64 %index, !dbg !128
  %9 = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv3.i, i64 %induction9699, !dbg !128
  store double %6, double* %8, align 8, !dbg !128, !tbaa !108
  store double %7, double* %9, align 8, !dbg !128, !tbaa !108
  %index.next = add nuw nsw i64 %index, 2, !dbg !97
  %induction9699.1 = or i64 %index.next, 1, !dbg !97
  %10 = trunc i64 %index.next to i32, !dbg !123
  %induction98100.1 = or i32 %10, 1, !dbg !123
  %11 = sitofp i32 %10 to double, !dbg !123
  %12 = sitofp i32 %induction98100.1 to double, !dbg !123
  %13 = fmul double %conv.i, %11, !dbg !126
  %14 = fmul double %conv.i, %12, !dbg !126
  %15 = fdiv double %13, 4.000000e+03, !dbg !127
  %16 = fdiv double %14, 4.000000e+03, !dbg !127
  %17 = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv3.i, i64 %index.next, !dbg !128
  %18 = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv3.i, i64 %induction9699.1, !dbg !128
  store double %15, double* %17, align 8, !dbg !128, !tbaa !108
  store double %16, double* %18, align 8, !dbg !128, !tbaa !108
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !97
  %19 = icmp eq i64 %index.next.1, 4000, !dbg !97
  br i1 %19, label %for.inc30.i, label %vector.body, !dbg !97, !llvm.loop !129

for.inc30.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !101
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 4000, !dbg !101
  br i1 %exitcond5.i, label %for.cond1.preheader.i.preheader, label %for.body.i, !dbg !101

for.cond1.preheader.i.preheader:                  ; preds = %for.inc30.i
  br label %for.cond1.preheader.i, !dbg !132

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc12.i
  %indvars.iv11.i = phi i64 [ %indvars.iv.next12.i, %for.inc12.i ], [ 0, %for.cond1.preheader.i.preheader ], !dbg !137
  %arrayidx.i90 = getelementptr inbounds double* %arraydecay, i64 %indvars.iv11.i, !dbg !132
  %.pre.i = load double* %arrayidx.i90, align 8, !dbg !132, !tbaa !108
  br label %for.body3.i, !dbg !138

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %20 = phi double [ %.pre.i, %for.cond1.preheader.i ], [ %add.i92.1, %for.body3.i ], !dbg !132
  %indvars.iv8.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next9.i.1, %for.body3.i ], !dbg !137
  %arrayidx7.i = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv11.i, i64 %indvars.iv8.i, !dbg !139
  %21 = load double* %arrayidx7.i, align 8, !dbg !139, !tbaa !108
  %arrayidx9.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv8.i, !dbg !140
  %22 = load double* %arrayidx9.i, align 8, !dbg !140, !tbaa !108
  %mul.i91 = fmul double %21, %22, !dbg !139
  %add.i92 = fadd double %20, %mul.i91, !dbg !132
  store double %add.i92, double* %arrayidx.i90, align 8, !dbg !141, !tbaa !108
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1, !dbg !138
  %arrayidx7.i.1 = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv11.i, i64 %indvars.iv.next9.i, !dbg !139
  %23 = load double* %arrayidx7.i.1, align 8, !dbg !139, !tbaa !108
  %arrayidx9.i.1 = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv.next9.i, !dbg !140
  %24 = load double* %arrayidx9.i.1, align 8, !dbg !140, !tbaa !108
  %mul.i91.1 = fmul double %23, %24, !dbg !139
  %add.i92.1 = fadd double %add.i92, %mul.i91.1, !dbg !132
  store double %add.i92.1, double* %arrayidx.i90, align 8, !dbg !141, !tbaa !108
  %indvars.iv.next9.i.1 = add nuw nsw i64 %indvars.iv.next9.i, 1, !dbg !138
  %exitcond10.i.1 = icmp eq i64 %indvars.iv.next9.i.1, 4000, !dbg !138
  br i1 %exitcond10.i.1, label %for.inc12.i, label %for.body3.i, !dbg !138

for.inc12.i:                                      ; preds = %for.body3.i
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !142
  %exitcond13.i = icmp eq i64 %indvars.iv.next12.i, 4000, !dbg !142
  br i1 %exitcond13.i, label %for.cond18.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !142

for.cond18.preheader.i.preheader:                 ; preds = %for.inc12.i
  br label %for.cond18.preheader.i, !dbg !143

for.cond18.preheader.i:                           ; preds = %for.cond18.preheader.i.preheader, %for.inc36.i
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %for.inc36.i ], [ 0, %for.cond18.preheader.i.preheader ], !dbg !137
  %arrayidx22.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv5.i, !dbg !143
  %.pre14.i = load double* %arrayidx22.i, align 8, !dbg !143, !tbaa !108
  br label %for.body20.i, !dbg !148

for.body20.i:                                     ; preds = %for.body20.i, %for.cond18.preheader.i
  %25 = phi double [ %.pre14.i, %for.cond18.preheader.i ], [ %add30.i.1, %for.body20.i ], !dbg !143
  %indvars.iv.i93 = phi i64 [ 0, %for.cond18.preheader.i ], [ %indvars.iv.next.i94.1, %for.body20.i ], !dbg !137
  %arrayidx26.i = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv.i93, i64 %indvars.iv5.i, !dbg !149
  %26 = load double* %arrayidx26.i, align 8, !dbg !149, !tbaa !108
  %arrayidx28.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.i93, !dbg !150
  %27 = load double* %arrayidx28.i, align 8, !dbg !150, !tbaa !108
  %mul29.i = fmul double %26, %27, !dbg !149
  %add30.i = fadd double %25, %mul29.i, !dbg !143
  store double %add30.i, double* %arrayidx22.i, align 8, !dbg !151, !tbaa !108
  %indvars.iv.next.i94 = add nuw nsw i64 %indvars.iv.i93, 1, !dbg !148
  %arrayidx26.i.1 = getelementptr inbounds [4000 x double]* %arraydecay8, i64 %indvars.iv.next.i94, i64 %indvars.iv5.i, !dbg !149
  %28 = load double* %arrayidx26.i.1, align 8, !dbg !149, !tbaa !108
  %arrayidx28.i.1 = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.next.i94, !dbg !150
  %29 = load double* %arrayidx28.i.1, align 8, !dbg !150, !tbaa !108
  %mul29.i.1 = fmul double %28, %29, !dbg !149
  %add30.i.1 = fadd double %add30.i, %mul29.i.1, !dbg !143
  store double %add30.i.1, double* %arrayidx22.i, align 8, !dbg !151, !tbaa !108
  %indvars.iv.next.i94.1 = add nuw nsw i64 %indvars.iv.next.i94, 1, !dbg !148
  %exitcond.i95.1 = icmp eq i64 %indvars.iv.next.i94.1, 4000, !dbg !148
  br i1 %exitcond.i95.1, label %for.inc36.i, label %for.body20.i, !dbg !148

for.inc36.i:                                      ; preds = %for.body20.i
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !152
  %exitcond7.i = icmp eq i64 %indvars.iv.next6.i, 4000, !dbg !152
  br i1 %exitcond7.i, label %kernel_mvt.exit, label %for.cond18.preheader.i, !dbg !152

kernel_mvt.exit:                                  ; preds = %for.inc36.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !153
  br i1 %cmp, label %if.end50, label %if.end58, !dbg !154

if.end50:                                         ; preds = %kernel_mvt.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !82), !dbg !155
  tail call void @llvm.dbg.value(metadata i8* %30, i64 0, metadata !45, metadata !82), !dbg !156
  %30 = load i8** %argv, align 8, !dbg !157, !tbaa !159
  %31 = load i8* %30, align 1, !dbg !157, !tbaa !161
  %phitmp = icmp eq i8 %31, 0, !dbg !155
  br i1 %phitmp, label %for.body.i87.preheader, label %if.end58, !dbg !154

for.body.i87.preheader:                           ; preds = %if.end50
  br label %for.body.i87, !dbg !162

for.body.i87:                                     ; preds = %for.body.i87.preheader, %for.inc.i
  %indvars.iv.i85 = phi i64 [ %indvars.iv.next.i88, %for.inc.i ], [ 0, %for.body.i87.preheader ], !dbg !166
  %32 = load %struct._IO_FILE** @stderr, align 8, !dbg !162, !tbaa !159
  %arrayidx.i86 = getelementptr inbounds double* %arraydecay, i64 %indvars.iv.i85, !dbg !168
  %33 = load double* %arrayidx.i86, align 8, !dbg !168, !tbaa !108
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %33) #5, !dbg !169
  %34 = load %struct._IO_FILE** @stderr, align 8, !dbg !170, !tbaa !159
  %arrayidx2.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv.i85, !dbg !171
  %35 = load double* %arrayidx2.i, align 8, !dbg !171, !tbaa !108
  %call3.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %35) #5, !dbg !172
  %36 = trunc i64 %indvars.iv.i85 to i32, !dbg !173
  %rem.i = srem i32 %36, 20, !dbg !173
  %cmp4.i = icmp eq i32 %rem.i, 0, !dbg !173
  br i1 %cmp4.i, label %if.then.i, label %for.inc.i, !dbg !175

if.then.i:                                        ; preds = %for.body.i87
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !176, !tbaa !159
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %37) #5, !dbg !178
  br label %for.inc.i, !dbg !178

for.inc.i:                                        ; preds = %if.then.i, %for.body.i87
  %indvars.iv.next.i88 = add nuw nsw i64 %indvars.iv.i85, 1, !dbg !179
  %exitcond.i89 = icmp eq i64 %indvars.iv.next.i88, 4000, !dbg !179
  br i1 %exitcond.i89, label %if.end58.loopexit, label %for.body.i87, !dbg !179

if.end58.loopexit:                                ; preds = %for.inc.i
  br label %if.end58

if.end58:                                         ; preds = %if.end58.loopexit, %if.end50, %kernel_mvt.exit
  tail call void @free(i8* %call) #4, !dbg !180
  tail call void @free(i8* %call1) #4, !dbg !181
  tail call void @free(i8* %call2) #4, !dbg !182
  tail call void @free(i8* %call3) #4, !dbg !183
  tail call void @free(i8* %call4) #4, !dbg !184
  ret i32 0, !dbg !185
}

declare i8* @polybench_alloc_data(i32, i32) #1

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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!79, !80}
!llvm.ident = !{!81}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c] [DW_LANG_C99]
!1 = !{!"mvt.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt"}
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
!24 = !{!25, !48, !57, !69}
!25 = !{!"0x2e\00main\00main\00\0086\000\001\000\000\00256\001\0087", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 86] [def] [scope 87] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777302\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 86]
!34 = !{!"0x101\00argv\0033554518\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 86]
!35 = !{!"0x100\00n\0089\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 89]
!36 = !{!"0x100\00A\0092\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 92]
!37 = !{!"0x100\00x1\0093\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [x1] [line 93]
!38 = !{!"0x100\00x2\0094\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [x2] [line 94]
!39 = !{!"0x100\00y_1\0095\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [y_1] [line 95]
!40 = !{!"0x100\00y_2\0096\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [y_2] [line 96]
!41 = !{!"0x100\00__s1_len\00124\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 124]
!42 = !{!"0xb\00124\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!43 = !{!"0xb\00124\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!44 = !{!"0x100\00__s2_len\00124\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 124]
!45 = !{!"0x100\00__s2\00124\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 124]
!46 = !{!"0xb\00124\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!47 = !{!"0x100\00__result\00124\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 124]
!48 = !{!"0x2e\00print_array\00print_array\00\0047\001\001\000\000\00256\001\0051", !1, !26, !49, null, null, null, null, !52} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 51] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !51, !51}
!51 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!52 = !{!53, !54, !55, !56}
!53 = !{!"0x101\00n\0016777263\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 47]
!54 = !{!"0x101\00x1\0033554480\000", !48, !26, !51} ; [ DW_TAG_arg_variable ] [x1] [line 48]
!55 = !{!"0x101\00x2\0050331697\000", !48, !26, !51} ; [ DW_TAG_arg_variable ] [x2] [line 49]
!56 = !{!"0x100\00i\0052\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!57 = !{!"0x2e\00kernel_mvt\00kernel_mvt\00\0065\001\001\000\000\00256\001\0071", !1, !26, !58, null, null, null, null, !60} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_mvt]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !29, !51, !51, !51, !51, !9}
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68}
!61 = !{!"0x101\00n\0016777281\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 65]
!62 = !{!"0x101\00x1\0033554498\000", !57, !26, !51} ; [ DW_TAG_arg_variable ] [x1] [line 66]
!63 = !{!"0x101\00x2\0050331715\000", !57, !26, !51} ; [ DW_TAG_arg_variable ] [x2] [line 67]
!64 = !{!"0x101\00y_1\0067108932\000", !57, !26, !51} ; [ DW_TAG_arg_variable ] [y_1] [line 68]
!65 = !{!"0x101\00y_2\0083886149\000", !57, !26, !51} ; [ DW_TAG_arg_variable ] [y_2] [line 69]
!66 = !{!"0x101\00A\00100663366\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 70]
!67 = !{!"0x100\00i\0072\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!68 = !{!"0x100\00j\0072\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 72]
!69 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !58, null, null, null, null, !70} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!70 = !{!71, !72, !73, !74, !75, !76, !77, !78}
!71 = !{!"0x101\00n\0016777239\000", !69, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!72 = !{!"0x101\00x1\0033554456\000", !69, !26, !51} ; [ DW_TAG_arg_variable ] [x1] [line 24]
!73 = !{!"0x101\00x2\0050331673\000", !69, !26, !51} ; [ DW_TAG_arg_variable ] [x2] [line 25]
!74 = !{!"0x101\00y_1\0067108890\000", !69, !26, !51} ; [ DW_TAG_arg_variable ] [y_1] [line 26]
!75 = !{!"0x101\00y_2\0083886107\000", !69, !26, !51} ; [ DW_TAG_arg_variable ] [y_2] [line 27]
!76 = !{!"0x101\00A\00100663324\000", !69, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 28]
!77 = !{!"0x100\00i\0030\000", !69, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!78 = !{!"0x100\00j\0030\000", !69, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!79 = !{i32 2, !"Dwarf Version", i32 4}
!80 = !{i32 2, !"Debug Info Version", i32 2}
!81 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!82 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!83 = !MDLocation(line: 86, column: 14, scope: !25)
!84 = !MDLocation(line: 86, column: 27, scope: !25)
!85 = !MDLocation(line: 89, column: 7, scope: !25)
!86 = !MDLocation(line: 92, column: 3, scope: !25)
!87 = !MDLocation(line: 93, column: 3, scope: !25)
!88 = !MDLocation(line: 94, column: 3, scope: !25)
!89 = !MDLocation(line: 95, column: 3, scope: !25)
!90 = !MDLocation(line: 96, column: 3, scope: !25)
!91 = !MDLocation(line: 101, column: 8, scope: !25)
!92 = !MDLocation(line: 102, column: 8, scope: !25)
!93 = !MDLocation(line: 103, column: 8, scope: !25)
!94 = !MDLocation(line: 104, column: 8, scope: !25)
!95 = !MDLocation(line: 105, column: 8, scope: !25)
!96 = !{!"0x101\00n\0016777239\000", !69, !26, !29, !97} ; [ DW_TAG_arg_variable ] [n] [line 23]
!97 = !MDLocation(line: 100, column: 3, scope: !25)
!98 = !MDLocation(line: 23, column: 21, scope: !69, inlinedAt: !97)
!99 = !{!"0x100\00i\0030\000", !69, !26, !29, !97} ; [ DW_TAG_auto_variable ] [i] [line 30]
!100 = !MDLocation(line: 30, column: 7, scope: !69, inlinedAt: !97)
!101 = !MDLocation(line: 32, column: 3, scope: !102, inlinedAt: !97)
!102 = !{!"0xb\0032\003\0020", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!103 = !MDLocation(line: 34, column: 16, scope: !104, inlinedAt: !97)
!104 = !{!"0xb\0033\005\0022", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!105 = !{!"0xb\0032\003\0021", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!106 = !MDLocation(line: 34, column: 15, scope: !104, inlinedAt: !97)
!107 = !MDLocation(line: 34, column: 7, scope: !104, inlinedAt: !97)
!108 = !{!109, !109, i64 0}
!109 = !{!"double", !110, i64 0}
!110 = !{!"omnipotent char", !111, i64 0}
!111 = !{!"Simple C/C++ TBAA"}
!112 = !MDLocation(line: 35, column: 16, scope: !104, inlinedAt: !97)
!113 = !MDLocation(line: 35, column: 15, scope: !104, inlinedAt: !97)
!114 = !MDLocation(line: 35, column: 7, scope: !104, inlinedAt: !97)
!115 = !MDLocation(line: 36, column: 17, scope: !104, inlinedAt: !97)
!116 = !MDLocation(line: 36, column: 16, scope: !104, inlinedAt: !97)
!117 = !MDLocation(line: 36, column: 7, scope: !104, inlinedAt: !97)
!118 = !MDLocation(line: 37, column: 17, scope: !104, inlinedAt: !97)
!119 = !MDLocation(line: 37, column: 16, scope: !104, inlinedAt: !97)
!120 = !MDLocation(line: 37, column: 7, scope: !104, inlinedAt: !97)
!121 = !{!"0x100\00j\0030\000", !69, !26, !29, !97} ; [ DW_TAG_auto_variable ] [j] [line 30]
!122 = !MDLocation(line: 30, column: 10, scope: !69, inlinedAt: !97)
!123 = !MDLocation(line: 39, column: 27, scope: !124, inlinedAt: !97)
!124 = !{!"0xb\0038\007\0024", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!125 = !{!"0xb\0038\007\0023", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!126 = !MDLocation(line: 39, column: 13, scope: !124, inlinedAt: !97)
!127 = !MDLocation(line: 39, column: 12, scope: !124, inlinedAt: !97)
!128 = !MDLocation(line: 39, column: 2, scope: !124, inlinedAt: !97)
!129 = distinct !{!129, !130, !131}
!130 = !{!"llvm.loop.vectorize.width", i32 1}
!131 = !{!"llvm.loop.interleave.count", i32 1}
!132 = !MDLocation(line: 77, column: 15, scope: !133, inlinedAt: !137)
!133 = !{!"0xb\0076\005\0015", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!134 = !{!"0xb\0076\005\0014", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!135 = !{!"0xb\0075\003\0013", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!136 = !{!"0xb\0075\003\0012", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!137 = !MDLocation(line: 111, column: 3, scope: !25)
!138 = !MDLocation(line: 76, column: 5, scope: !134, inlinedAt: !137)
!139 = !MDLocation(line: 77, column: 23, scope: !133, inlinedAt: !137)
!140 = !MDLocation(line: 77, column: 33, scope: !133, inlinedAt: !137)
!141 = !MDLocation(line: 77, column: 7, scope: !133, inlinedAt: !137)
!142 = !MDLocation(line: 75, column: 3, scope: !136, inlinedAt: !137)
!143 = !MDLocation(line: 80, column: 15, scope: !144, inlinedAt: !137)
!144 = !{!"0xb\0079\005\0019", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!145 = !{!"0xb\0079\005\0018", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!146 = !{!"0xb\0078\003\0017", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!147 = !{!"0xb\0078\003\0016", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!148 = !MDLocation(line: 79, column: 5, scope: !145, inlinedAt: !137)
!149 = !MDLocation(line: 80, column: 23, scope: !144, inlinedAt: !137)
!150 = !MDLocation(line: 80, column: 33, scope: !144, inlinedAt: !137)
!151 = !MDLocation(line: 80, column: 7, scope: !144, inlinedAt: !137)
!152 = !MDLocation(line: 78, column: 3, scope: !147, inlinedAt: !137)
!153 = !MDLocation(line: 124, column: 3, scope: !43)
!154 = !MDLocation(line: 124, column: 3, scope: !25)
!155 = !MDLocation(line: 124, column: 3, scope: !42)
!156 = !MDLocation(line: 124, column: 3, scope: !46)
!157 = !MDLocation(line: 124, column: 3, scope: !158)
!158 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!159 = !{!160, !160, i64 0}
!160 = !{!"any pointer", !110, i64 0}
!161 = !{!110, !110, i64 0}
!162 = !MDLocation(line: 55, column: 14, scope: !163, inlinedAt: !166)
!163 = !{!"0xb\0054\0027\0010", !1, !164}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!164 = !{!"0xb\0054\003\009", !1, !165}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!165 = !{!"0xb\0054\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!166 = !MDLocation(line: 124, column: 3, scope: !167)
!167 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!168 = !MDLocation(line: 55, column: 44, scope: !163, inlinedAt: !166)
!169 = !MDLocation(line: 55, column: 5, scope: !163, inlinedAt: !166)
!170 = !MDLocation(line: 56, column: 14, scope: !163, inlinedAt: !166)
!171 = !MDLocation(line: 56, column: 44, scope: !163, inlinedAt: !166)
!172 = !MDLocation(line: 56, column: 5, scope: !163, inlinedAt: !166)
!173 = !MDLocation(line: 57, column: 9, scope: !174, inlinedAt: !166)
!174 = !{!"0xb\0057\009\0011", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!175 = !MDLocation(line: 57, column: 9, scope: !163, inlinedAt: !166)
!176 = !MDLocation(line: 57, column: 31, scope: !177, inlinedAt: !166)
!177 = !{!"0xb\001", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!178 = !MDLocation(line: 57, column: 22, scope: !174, inlinedAt: !166)
!179 = !MDLocation(line: 54, column: 3, scope: !165, inlinedAt: !166)
!180 = !MDLocation(line: 127, column: 3, scope: !25)
!181 = !MDLocation(line: 128, column: 3, scope: !25)
!182 = !MDLocation(line: 129, column: 3, scope: !25)
!183 = !MDLocation(line: 130, column: 3, scope: !25)
!184 = !MDLocation(line: 131, column: 3, scope: !25)
!185 = !MDLocation(line: 133, column: 3, scope: !25)
