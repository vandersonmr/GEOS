; ModuleID = 'doitgen.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !91), !dbg !92
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !91), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !35, metadata !91), !dbg !94
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !36, metadata !91), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !37, metadata !91), !dbg !96
  %call = tail call i8* @polybench_alloc_data(i32 2097152, i32 8) #4, !dbg !97
  %call1 = tail call i8* @polybench_alloc_data(i32 2097152, i32 8) #4, !dbg !98
  %call2 = tail call i8* @polybench_alloc_data(i32 16384, i32 8) #4, !dbg !99
  %arraydecay = bitcast i8* %call to [128 x [128 x double]]*, !dbg !100
  %arraydecay3 = bitcast i8* %call2 to [128 x double]*, !dbg !101
  tail call fastcc void @init_array([128 x [128 x double]]* %arraydecay, [128 x double]* %arraydecay3), !dbg !102
  %arraydecay6 = bitcast i8* %call1 to [128 x [128 x double]]*, !dbg !103
  tail call fastcc void @kernel_doitgen([128 x [128 x double]]* %arraydecay, [128 x double]* %arraydecay3, [128 x [128 x double]]* %arraydecay6), !dbg !104
  %cmp = icmp sgt i32 %argc, 42, !dbg !105
  br i1 %cmp, label %if.end43, label %if.end50, !dbg !106

if.end43:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !91), !dbg !107
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !45, metadata !91), !dbg !108
  %0 = load i8** %argv, align 8, !dbg !109, !tbaa !111
  %1 = load i8* %0, align 1, !dbg !109, !tbaa !115
  %phitmp = icmp eq i8 %1, 0, !dbg !107
  br i1 %phitmp, label %if.then48, label %if.end50, !dbg !106

if.then48:                                        ; preds = %if.end43
  tail call fastcc void @print_array([128 x [128 x double]]* %arraydecay), !dbg !116
  br label %if.end50, !dbg !116

if.end50:                                         ; preds = %if.end43, %if.then48, %entry
  tail call void @free(i8* %call) #4, !dbg !118
  tail call void @free(i8* %call1) #4, !dbg !119
  tail call void @free(i8* %call2) #4, !dbg !120
  ret i32 0, !dbg !121
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([128 x [128 x double]]* nocapture %A, [128 x double]* nocapture %C4) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !80, metadata !91), !dbg !122
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !81, metadata !91), !dbg !123
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !82, metadata !91), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !85, metadata !91), !dbg !125
  br label %for.cond1.preheader, !dbg !126

for.cond1.preheader:                              ; preds = %for.inc17, %entry
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.inc17 ]
  %0 = trunc i64 %indvars.iv15 to i32, !dbg !128
  %conv = sitofp i32 %0 to double, !dbg !128
  br label %for.cond4.preheader, !dbg !134

for.cond4.preheader:                              ; preds = %for.inc14, %for.cond1.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next13, %for.inc14 ]
  %1 = trunc i64 %indvars.iv12 to i32, !dbg !135
  %conv7 = sitofp i32 %1 to double, !dbg !135
  %mul = fmul double %conv, %conv7, !dbg !128
  br label %for.body6, !dbg !136

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next10, %for.body6 ]
  %2 = trunc i64 %indvars.iv9 to i32, !dbg !137
  %conv8 = sitofp i32 %2 to double, !dbg !137
  %add = fadd double %mul, %conv8, !dbg !128
  %div = fmul double %add, 7.812500e-03, !dbg !138
  %arrayidx13 = getelementptr inbounds [128 x [128 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv12, i64 %indvars.iv9, !dbg !139
  store double %div, double* %arrayidx13, align 8, !dbg !139, !tbaa !140
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !136
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 128, !dbg !136
  br i1 %exitcond11, label %for.inc14, label %for.body6, !dbg !136

for.inc14:                                        ; preds = %for.body6
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !134
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 128, !dbg !134
  br i1 %exitcond14, label %for.inc17, label %for.cond4.preheader, !dbg !134

for.inc17:                                        ; preds = %for.inc14
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !126
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 128, !dbg !126
  br i1 %exitcond17, label %for.cond24.preheader, label %for.cond1.preheader, !dbg !126

for.cond24.preheader:                             ; preds = %for.inc17, %for.inc40
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.inc40 ], [ 0, %for.inc17 ]
  %3 = trunc i64 %indvars.iv6 to i32, !dbg !142
  %conv28 = sitofp i32 %3 to double, !dbg !142
  br label %for.body27, !dbg !147

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %4 = trunc i64 %indvars.iv to i32, !dbg !148
  %conv29 = sitofp i32 %4 to double, !dbg !148
  %mul30 = fmul double %conv28, %conv29, !dbg !142
  %div32 = fmul double %mul30, 7.812500e-03, !dbg !149
  %arrayidx36 = getelementptr inbounds [128 x double]* %C4, i64 %indvars.iv6, i64 %indvars.iv, !dbg !150
  store double %div32, double* %arrayidx36, align 8, !dbg !150, !tbaa !140
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !147
  %exitcond = icmp eq i64 %indvars.iv.next, 128, !dbg !147
  br i1 %exitcond, label %for.inc40, label %for.body27, !dbg !147

for.inc40:                                        ; preds = %for.body27
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !151
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 128, !dbg !151
  br i1 %exitcond8, label %for.end42, label %for.cond24.preheader, !dbg !151

for.end42:                                        ; preds = %for.inc40
  ret void, !dbg !152
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_doitgen([128 x [128 x double]]* nocapture %A, [128 x double]* nocapture readonly %C4, [128 x [128 x double]]* nocapture %sum) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !66, metadata !91), !dbg !153
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !67, metadata !91), !dbg !154
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !68, metadata !91), !dbg !155
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !91), !dbg !156
  br label %for.cond1.preheader, !dbg !157

for.cond1.preheader:                              ; preds = %for.inc60, %entry
  %indvars.iv19 = phi i64 [ 0, %entry ], [ %indvars.iv.next20, %for.inc60 ]
  br label %for.cond4.preheader, !dbg !159

for.cond4.preheader:                              ; preds = %for.inc57, %for.cond1.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next17, %for.inc57 ]
  br label %for.body6, !dbg !162

for.body6:                                        ; preds = %for.inc36, %for.cond4.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next7, %for.inc36 ]
  %arrayidx10 = getelementptr inbounds [128 x [128 x double]]* %sum, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv6, !dbg !166
  store double 0.000000e+00, double* %arrayidx10, align 8, !dbg !166, !tbaa !140
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !75, metadata !91), !dbg !169
  br label %for.body13, !dbg !170

for.body13:                                       ; preds = %for.body13, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body6 ], [ %indvars.iv.next, %for.body13 ]
  %0 = load double* %arrayidx10, align 8, !dbg !172, !tbaa !140
  %arrayidx25 = getelementptr inbounds [128 x [128 x double]]* %A, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv, !dbg !174
  %1 = load double* %arrayidx25, align 8, !dbg !174, !tbaa !140
  %arrayidx29 = getelementptr inbounds [128 x double]* %C4, i64 %indvars.iv, i64 %indvars.iv6, !dbg !175
  %2 = load double* %arrayidx29, align 8, !dbg !175, !tbaa !140
  %mul = fmul double %1, %2, !dbg !174
  %add = fadd double %0, %mul, !dbg !172
  store double %add, double* %arrayidx10, align 8, !dbg !176, !tbaa !140
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !170
  %exitcond = icmp eq i64 %indvars.iv.next, 128, !dbg !170
  br i1 %exitcond, label %for.inc36, label %for.body13, !dbg !170

for.inc36:                                        ; preds = %for.body13
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !162
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 128, !dbg !162
  br i1 %exitcond8, label %for.body41, label %for.body6, !dbg !162

for.body41:                                       ; preds = %for.inc36, %for.body41
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body41 ], [ 0, %for.inc36 ]
  %arrayidx47 = getelementptr inbounds [128 x [128 x double]]* %sum, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv12, !dbg !177
  %3 = load double* %arrayidx47, align 8, !dbg !177, !tbaa !140
  %arrayidx53 = getelementptr inbounds [128 x [128 x double]]* %A, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv12, !dbg !180
  store double %3, double* %arrayidx53, align 8, !dbg !180, !tbaa !140
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !181
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 128, !dbg !181
  br i1 %exitcond14, label %for.inc57, label %for.body41, !dbg !181

for.inc57:                                        ; preds = %for.body41
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !159
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 128, !dbg !159
  br i1 %exitcond18, label %for.inc60, label %for.cond4.preheader, !dbg !159

for.inc60:                                        ; preds = %for.inc57
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !157
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 128, !dbg !157
  br i1 %exitcond21, label %for.end62, label %for.cond1.preheader, !dbg !157

for.end62:                                        ; preds = %for.inc60
  ret void, !dbg !182
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([128 x [128 x double]]* nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !52, metadata !91), !dbg !183
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !53, metadata !91), !dbg !184
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !54, metadata !91), !dbg !185
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !91), !dbg !186
  br label %for.cond1.preheader, !dbg !187

for.cond1.preheader:                              ; preds = %for.inc16, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc16 ]
  %0 = trunc i64 %indvars.iv10 to i32, !dbg !189
  %rem = srem i32 %0, 20, !dbg !189
  %cmp11 = icmp eq i32 %rem, 0, !dbg !189
  br label %for.cond4.preheader, !dbg !197

for.cond4.preheader:                              ; preds = %for.inc13, %for.cond1.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.inc13 ]
  br label %for.body6, !dbg !198

for.body6:                                        ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !199, !tbaa !111
  %arrayidx10 = getelementptr inbounds [128 x [128 x double]]* %A, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv, !dbg !200
  %2 = load double* %arrayidx10, align 8, !dbg !200, !tbaa !140
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !201
  br i1 %cmp11, label %if.then, label %for.inc, !dbg !202

if.then:                                          ; preds = %for.body6
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !203, !tbaa !111
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6, !dbg !205
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body6, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !198
  %exitcond = icmp eq i64 %indvars.iv.next, 128, !dbg !198
  br i1 %exitcond, label %for.inc13, label %for.body6, !dbg !198

for.inc13:                                        ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !197
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 128, !dbg !197
  br i1 %exitcond9, label %for.inc16, label %for.cond4.preheader, !dbg !197

for.inc16:                                        ; preds = %for.inc13
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !187
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 128, !dbg !187
  br i1 %exitcond12, label %for.end18, label %for.cond1.preheader, !dbg !187

for.end18:                                        ; preds = %for.inc16
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !206, !tbaa !111
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6, !dbg !207
  ret void, !dbg !208
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
!llvm.module.flags = !{!88, !89}
!llvm.ident = !{!90}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c] [DW_LANG_C99]
!1 = !{!"doitgen.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\00134217728\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 134217728, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8, !8}
!8 = !{!"0x21\000\00128"}                         ; [ DW_TAG_subrange_type ] [0, 127]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\001048576\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1048576, align 64, offset 0] [from double]
!11 = !{!8, !8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen"}
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
!24 = !{!25, !48, !59, !76}
!25 = !{!"0x2e\00main\00main\00\0083\000\001\000\000\00256\001\0084", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 83] [def] [scope 84] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777299\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 83]
!34 = !{!"0x101\00argv\0033554515\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 83]
!35 = !{!"0x100\00nr\0086\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nr] [line 86]
!36 = !{!"0x100\00nq\0087\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nq] [line 87]
!37 = !{!"0x100\00np\0088\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [np] [line 88]
!38 = !{!"0x100\00A\0091\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 91]
!39 = !{!"0x100\00sum\0092\000", !25, !26, !4}    ; [ DW_TAG_auto_variable ] [sum] [line 92]
!40 = !{!"0x100\00C4\0093\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [C4] [line 93]
!41 = !{!"0x100\00__s1_len\00115\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 115]
!42 = !{!"0xb\00115\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!43 = !{!"0xb\00115\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!44 = !{!"0x100\00__s2_len\00115\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 115]
!45 = !{!"0x100\00__s2\00115\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 115]
!46 = !{!"0xb\00115\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!47 = !{!"0x100\00__result\00115\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 115]
!48 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0044", !1, !26, !49, null, void ([128 x [128 x double]]*)* @print_array, null, null, !51} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !29, !29, !9}
!51 = !{!52, !53, !54, !55, !56, !57, !58}
!52 = !{!"0x101\00nr\0016777258\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [nr] [line 42]
!53 = !{!"0x101\00nq\0033554474\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [nq] [line 42]
!54 = !{!"0x101\00np\0050331690\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [np] [line 42]
!55 = !{!"0x101\00A\0067108907\000", !48, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 43]
!56 = !{!"0x100\00i\0045\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!57 = !{!"0x100\00j\0045\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!58 = !{!"0x100\00k\0045\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 45]
!59 = !{!"0x2e\00kernel_doitgen\00kernel_doitgen\00\0060\001\001\000\000\00256\001\0064", !1, !26, !60, null, void ([128 x [128 x double]]*, [128 x double]*, [128 x [128 x double]]*)* @kernel_doitgen, null, null, !65} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 64] [kernel_doitgen]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{null, !29, !29, !29, !9, !62, !9}
!62 = !{!"0xf\00\000\0064\0064\000\000", null, null, !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!63 = !{!"0x1\00\000\008192\0064\000\000\000", null, null, !6, !64, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 64, offset 0] [from double]
!64 = !{!8}
!65 = !{!66, !67, !68, !69, !70, !71, !72, !73, !74, !75}
!66 = !{!"0x101\00nr\0016777276\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [nr] [line 60]
!67 = !{!"0x101\00nq\0033554492\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [nq] [line 60]
!68 = !{!"0x101\00np\0050331708\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [np] [line 60]
!69 = !{!"0x101\00A\0067108925\000", !59, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 61]
!70 = !{!"0x101\00C4\0083886142\000", !59, !26, !62} ; [ DW_TAG_arg_variable ] [C4] [line 62]
!71 = !{!"0x101\00sum\00100663359\000", !59, !26, !9} ; [ DW_TAG_arg_variable ] [sum] [line 63]
!72 = !{!"0x100\00r\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [r] [line 65]
!73 = !{!"0x100\00q\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [q] [line 65]
!74 = !{!"0x100\00p\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [p] [line 65]
!75 = !{!"0x100\00s\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [s] [line 65]
!76 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !77, null, void ([128 x [128 x double]]*, [128 x double]*)* @init_array, null, null, !79} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!77 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !78, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = !{null, !29, !29, !29, !9, !62}
!79 = !{!80, !81, !82, !83, !84, !85, !86, !87}
!80 = !{!"0x101\00nr\0016777239\000", !76, !26, !29} ; [ DW_TAG_arg_variable ] [nr] [line 23]
!81 = !{!"0x101\00nq\0033554455\000", !76, !26, !29} ; [ DW_TAG_arg_variable ] [nq] [line 23]
!82 = !{!"0x101\00np\0050331671\000", !76, !26, !29} ; [ DW_TAG_arg_variable ] [np] [line 23]
!83 = !{!"0x101\00A\0067108888\000", !76, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!84 = !{!"0x101\00C4\0083886105\000", !76, !26, !62} ; [ DW_TAG_arg_variable ] [C4] [line 25]
!85 = !{!"0x100\00i\0027\000", !76, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!86 = !{!"0x100\00j\0027\000", !76, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!87 = !{!"0x100\00k\0027\000", !76, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 27]
!88 = !{i32 2, !"Dwarf Version", i32 4}
!89 = !{i32 2, !"Debug Info Version", i32 2}
!90 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!91 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!92 = !MDLocation(line: 83, column: 14, scope: !25)
!93 = !MDLocation(line: 83, column: 27, scope: !25)
!94 = !MDLocation(line: 86, column: 7, scope: !25)
!95 = !MDLocation(line: 87, column: 7, scope: !25)
!96 = !MDLocation(line: 88, column: 7, scope: !25)
!97 = !MDLocation(line: 91, column: 3, scope: !25)
!98 = !MDLocation(line: 92, column: 3, scope: !25)
!99 = !MDLocation(line: 93, column: 3, scope: !25)
!100 = !MDLocation(line: 97, column: 8, scope: !25)
!101 = !MDLocation(line: 98, column: 8, scope: !25)
!102 = !MDLocation(line: 96, column: 3, scope: !25)
!103 = !MDLocation(line: 107, column: 5, scope: !25)
!104 = !MDLocation(line: 104, column: 3, scope: !25)
!105 = !MDLocation(line: 115, column: 3, scope: !43)
!106 = !MDLocation(line: 115, column: 3, scope: !25)
!107 = !MDLocation(line: 115, column: 3, scope: !42)
!108 = !MDLocation(line: 115, column: 3, scope: !46)
!109 = !MDLocation(line: 115, column: 3, scope: !110)
!110 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!111 = !{!112, !112, i64 0}
!112 = !{!"any pointer", !113, i64 0}
!113 = !{!"omnipotent char", !114, i64 0}
!114 = !{!"Simple C/C++ TBAA"}
!115 = !{!113, !113, i64 0}
!116 = !MDLocation(line: 115, column: 3, scope: !117)
!117 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!118 = !MDLocation(line: 118, column: 3, scope: !25)
!119 = !MDLocation(line: 119, column: 3, scope: !25)
!120 = !MDLocation(line: 120, column: 3, scope: !25)
!121 = !MDLocation(line: 122, column: 3, scope: !25)
!122 = !MDLocation(line: 23, column: 21, scope: !76)
!123 = !MDLocation(line: 23, column: 29, scope: !76)
!124 = !MDLocation(line: 23, column: 37, scope: !76)
!125 = !MDLocation(line: 27, column: 7, scope: !76)
!126 = !MDLocation(line: 29, column: 3, scope: !127)
!127 = !{!"0xb\0029\003\0028", !1, !76}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!128 = !MDLocation(line: 32, column: 16, scope: !129)
!129 = !{!"0xb\0031\007\0033", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!130 = !{!"0xb\0031\007\0032", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!131 = !{!"0xb\0030\005\0031", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!132 = !{!"0xb\0030\005\0030", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!133 = !{!"0xb\0029\003\0029", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!134 = !MDLocation(line: 30, column: 5, scope: !132)
!135 = !MDLocation(line: 32, column: 30, scope: !129)
!136 = !MDLocation(line: 31, column: 7, scope: !130)
!137 = !MDLocation(line: 32, column: 34, scope: !129)
!138 = !MDLocation(line: 32, column: 15, scope: !129)
!139 = !MDLocation(line: 32, column: 2, scope: !129)
!140 = !{!141, !141, i64 0}
!141 = !{!"double", !113, i64 0}
!142 = !MDLocation(line: 35, column: 19, scope: !143)
!143 = !{!"0xb\0034\005\0037", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!144 = !{!"0xb\0034\005\0036", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!145 = !{!"0xb\0033\003\0035", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!146 = !{!"0xb\0033\003\0034", !1, !76}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!147 = !MDLocation(line: 34, column: 5, scope: !144)
!148 = !MDLocation(line: 35, column: 33, scope: !143)
!149 = !MDLocation(line: 35, column: 18, scope: !143)
!150 = !MDLocation(line: 35, column: 7, scope: !143)
!151 = !MDLocation(line: 33, column: 3, scope: !146)
!152 = !MDLocation(line: 36, column: 1, scope: !76)
!153 = !MDLocation(line: 60, column: 25, scope: !59)
!154 = !MDLocation(line: 60, column: 33, scope: !59)
!155 = !MDLocation(line: 60, column: 41, scope: !59)
!156 = !MDLocation(line: 65, column: 7, scope: !59)
!157 = !MDLocation(line: 68, column: 3, scope: !158)
!158 = !{!"0xb\0068\003\0016", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!159 = !MDLocation(line: 69, column: 5, scope: !160)
!160 = !{!"0xb\0069\005\0018", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!161 = !{!"0xb\0068\003\0017", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!162 = !MDLocation(line: 70, column: 7, scope: !163)
!163 = !{!"0xb\0070\007\0021", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!164 = !{!"0xb\0069\0031\0020", !1, !165}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!165 = !{!"0xb\0069\005\0019", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!166 = !MDLocation(line: 71, column: 2, scope: !167)
!167 = !{!"0xb\0070\0033\0023", !1, !168}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!168 = !{!"0xb\0070\007\0022", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!169 = !MDLocation(line: 65, column: 16, scope: !59)
!170 = !MDLocation(line: 72, column: 2, scope: !171)
!171 = !{!"0xb\0072\002\0024", !1, !167}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!172 = !MDLocation(line: 73, column: 19, scope: !173)
!173 = !{!"0xb\0072\002\0025", !1, !171}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!174 = !MDLocation(line: 73, column: 34, scope: !173)
!175 = !MDLocation(line: 73, column: 47, scope: !173)
!176 = !MDLocation(line: 73, column: 4, scope: !173)
!177 = !MDLocation(line: 76, column: 15, scope: !178)
!178 = !{!"0xb\0075\007\0027", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!179 = !{!"0xb\0075\007\0026", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!180 = !MDLocation(line: 76, column: 2, scope: !178)
!181 = !MDLocation(line: 75, column: 7, scope: !179)
!182 = !MDLocation(line: 80, column: 1, scope: !59)
!183 = !MDLocation(line: 42, column: 22, scope: !48)
!184 = !MDLocation(line: 42, column: 30, scope: !48)
!185 = !MDLocation(line: 42, column: 38, scope: !48)
!186 = !MDLocation(line: 45, column: 7, scope: !48)
!187 = !MDLocation(line: 47, column: 3, scope: !188)
!188 = !{!"0xb\0047\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!189 = !MDLocation(line: 51, column: 6, scope: !190)
!190 = !{!"0xb\0051\006\0015", !1, !191}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!191 = !{!"0xb\0049\0032\0014", !1, !192}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!192 = !{!"0xb\0049\007\0013", !1, !193}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!193 = !{!"0xb\0049\007\0012", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!194 = !{!"0xb\0048\005\0011", !1, !195}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!195 = !{!"0xb\0048\005\0010", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!196 = !{!"0xb\0047\003\009", !1, !188}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!197 = !MDLocation(line: 48, column: 5, scope: !195)
!198 = !MDLocation(line: 49, column: 7, scope: !193)
!199 = !MDLocation(line: 50, column: 11, scope: !191)
!200 = !MDLocation(line: 50, column: 41, scope: !191)
!201 = !MDLocation(line: 50, column: 2, scope: !191)
!202 = !MDLocation(line: 51, column: 6, scope: !191)
!203 = !MDLocation(line: 51, column: 28, scope: !204)
!204 = !{!"0xb\001", !1, !190}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!205 = !MDLocation(line: 51, column: 19, scope: !190)
!206 = !MDLocation(line: 53, column: 12, scope: !48)
!207 = !MDLocation(line: 53, column: 3, scope: !48)
!208 = !MDLocation(line: 54, column: 1, scope: !48)
