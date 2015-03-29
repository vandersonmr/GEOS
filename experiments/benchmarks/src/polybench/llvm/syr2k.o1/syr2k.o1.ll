; ModuleID = 'syr2k.c'
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !88), !dbg !89
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !88), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !88), !dbg !91
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !88), !dbg !92
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !93
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !94
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !95
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !96
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !97
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !98
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !34, metadata !88), !dbg !99
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !35, metadata !88), !dbg !100
  call fastcc void @init_array(double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !101
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !34, metadata !88), !dbg !99
  %0 = load double* %alpha, align 8, !dbg !102, !tbaa !103
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !35, metadata !88), !dbg !100
  %1 = load double* %beta, align 8, !dbg !107, !tbaa !103
  tail call fastcc void @kernel_syr2k(double %0, double %1, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !108
  %cmp = icmp sgt i32 %argc, 42, !dbg !109
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !110

if.end44:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !88), !dbg !111
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !43, metadata !88), !dbg !112
  %2 = load i8** %argv, align 8, !dbg !113, !tbaa !115
  %3 = load i8* %2, align 1, !dbg !113, !tbaa !117
  %phitmp = icmp eq i8 %3, 0, !dbg !111
  br i1 %phitmp, label %if.then49, label %if.end51, !dbg !110

if.then49:                                        ; preds = %if.end44
  tail call fastcc void @print_array([1024 x double]* %arraydecay), !dbg !118
  br label %if.end51, !dbg !118

if.end51:                                         ; preds = %if.end44, %if.then49, %entry
  tail call void @free(i8* %call) #4, !dbg !120
  tail call void @free(i8* %call1) #4, !dbg !121
  tail call void @free(i8* %call2) #4, !dbg !122
  ret i32 0, !dbg !123
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !76, metadata !88), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !77, metadata !88), !dbg !125
  store double 3.241200e+04, double* %alpha, align 8, !dbg !126, !tbaa !103
  store double 2.123000e+03, double* %beta, align 8, !dbg !127, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !88), !dbg !128
  br label %for.cond1.preheader, !dbg !129

for.cond1.preheader:                              ; preds = %for.inc17, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc17 ]
  %0 = trunc i64 %indvars.iv11 to i32, !dbg !131
  %conv = sitofp i32 %0 to double, !dbg !131
  br label %for.body3, !dbg !136

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next9, %for.body3 ]
  %1 = trunc i64 %indvars.iv8 to i32, !dbg !137
  %conv4 = sitofp i32 %1 to double, !dbg !137
  %mul = fmul double %conv, %conv4, !dbg !131
  %div = fmul double %mul, 9.765625e-04, !dbg !138
  %arrayidx7 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !139
  store double %div, double* %arrayidx7, align 8, !dbg !139, !tbaa !103
  %arrayidx16 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !140
  store double %div, double* %arrayidx16, align 8, !dbg !140, !tbaa !103
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !136
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1024, !dbg !136
  br i1 %exitcond10, label %for.inc17, label %for.body3, !dbg !136

for.inc17:                                        ; preds = %for.body3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !129
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1024, !dbg !129
  br i1 %exitcond13, label %for.cond24.preheader, label %for.cond1.preheader, !dbg !129

for.cond24.preheader:                             ; preds = %for.inc17, %for.inc40
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc40 ], [ 0, %for.inc17 ]
  %2 = trunc i64 %indvars.iv5 to i32, !dbg !141
  %conv28 = sitofp i32 %2 to double, !dbg !141
  br label %for.body27, !dbg !146

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %3 = trunc i64 %indvars.iv to i32, !dbg !147
  %conv29 = sitofp i32 %3 to double, !dbg !147
  %mul30 = fmul double %conv28, %conv29, !dbg !141
  %div32 = fmul double %mul30, 9.765625e-04, !dbg !148
  %arrayidx36 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv, !dbg !149
  store double %div32, double* %arrayidx36, align 8, !dbg !149, !tbaa !103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !146
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !146
  br i1 %exitcond, label %for.inc40, label %for.body27, !dbg !146

for.inc40:                                        ; preds = %for.body27
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !150
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1024, !dbg !150
  br i1 %exitcond7, label %for.end42, label %for.cond24.preheader, !dbg !150

for.end42:                                        ; preds = %for.inc40
  ret void, !dbg !151
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture readonly %A, [1024 x double]* nocapture readonly %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !61, metadata !88), !dbg !152
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !62, metadata !88), !dbg !153
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !68, metadata !88), !dbg !154
  br label %for.cond1.preheader, !dbg !155

for.cond1.preheader:                              ; preds = %for.inc6, %entry
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.inc6 ]
  br label %for.body3, !dbg !157

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next13, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv15, i64 %indvars.iv12, !dbg !160
  %0 = load double* %arrayidx5, align 8, !dbg !160, !tbaa !103
  %mul = fmul double %0, %beta, !dbg !160
  store double %mul, double* %arrayidx5, align 8, !dbg !160, !tbaa !103
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !157
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1024, !dbg !157
  br i1 %exitcond14, label %for.inc6, label %for.body3, !dbg !157

for.inc6:                                         ; preds = %for.body3
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !155
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1024, !dbg !155
  br i1 %exitcond17, label %for.cond12.preheader, label %for.cond1.preheader, !dbg !155

for.cond12.preheader:                             ; preds = %for.inc6, %for.inc53
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc53 ], [ 0, %for.inc6 ]
  br label %for.cond15.preheader, !dbg !162

for.cond15.preheader:                             ; preds = %for.inc50, %for.cond12.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next7, %for.inc50 ]
  %arrayidx31 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !166
  br label %for.body17, !dbg !171

for.body17:                                       ; preds = %for.body17, %for.cond15.preheader
  %indvars.iv = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next, %for.body17 ]
  %arrayidx21 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv, !dbg !172
  %1 = load double* %arrayidx21, align 8, !dbg !172, !tbaa !103
  %mul22 = fmul double %1, %alpha, !dbg !173
  %arrayidx26 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv, !dbg !174
  %2 = load double* %arrayidx26, align 8, !dbg !174, !tbaa !103
  %mul27 = fmul double %mul22, %2, !dbg !173
  %3 = load double* %arrayidx31, align 8, !dbg !166, !tbaa !103
  %add = fadd double %3, %mul27, !dbg !166
  store double %add, double* %arrayidx31, align 8, !dbg !166, !tbaa !103
  %arrayidx35 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv, !dbg !175
  %4 = load double* %arrayidx35, align 8, !dbg !175, !tbaa !103
  %mul36 = fmul double %4, %alpha, !dbg !176
  %arrayidx40 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv, !dbg !177
  %5 = load double* %arrayidx40, align 8, !dbg !177, !tbaa !103
  %mul41 = fmul double %mul36, %5, !dbg !176
  %add46 = fadd double %add, %mul41, !dbg !178
  store double %add46, double* %arrayidx31, align 8, !dbg !178, !tbaa !103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !171
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !171
  br i1 %exitcond, label %for.inc50, label %for.body17, !dbg !171

for.inc50:                                        ; preds = %for.body17
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !162
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !162
  br i1 %exitcond8, label %for.inc53, label %for.cond15.preheader, !dbg !162

for.inc53:                                        ; preds = %for.inc50
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !179
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1024, !dbg !179
  br i1 %exitcond11, label %for.end55, label %for.cond12.preheader, !dbg !179

for.end55:                                        ; preds = %for.inc53
  ret void, !dbg !180
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %C) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !53, metadata !88), !dbg !181
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !55, metadata !88), !dbg !182
  br label %for.cond1.preheader, !dbg !183

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !185
  br label %for.body3, !dbg !191

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !192, !tbaa !115
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv, !dbg !193
  %2 = load double* %arrayidx5, align 8, !dbg !193, !tbaa !103
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !194
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !185
  %4 = trunc i64 %3 to i32, !dbg !195
  %rem = srem i32 %4, 20, !dbg !195
  %cmp6 = icmp eq i32 %rem, 0, !dbg !195
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !196

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !197, !tbaa !115
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !199
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !191
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !191
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !191

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !183
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !183
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !183

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !200, !tbaa !115
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !201
  ret void, !dbg !202
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
!llvm.module.flags = !{!85, !86}
!llvm.ident = !{!87}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c] [DW_LANG_C99]
!1 = !{!"syr2k.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k"}
!11 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!"0x26\00\000\000\000\000\000", null, null, !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!16 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!19 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!22, !46, !57, !71}
!22 = !{!"0x2e\00main\00main\00\0091\000\001\000\000\00256\001\0092", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 91] [def] [scope 92] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !42, !43, !45}
!30 = !{!"0x101\00argc\0016777307\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 91]
!31 = !{!"0x101\00argv\0033554523\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 91]
!32 = !{!"0x100\00ni\0094\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 94]
!33 = !{!"0x100\00nj\0095\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 95]
!34 = !{!"0x100\00alpha\0098\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 98]
!35 = !{!"0x100\00beta\0099\000", !22, !23, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 99]
!36 = !{!"0x100\00C\00100\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [C] [line 100]
!37 = !{!"0x100\00A\00101\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 101]
!38 = !{!"0x100\00B\00102\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 102]
!39 = !{!"0x100\00__s1_len\00126\000", !40, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 126]
!40 = !{!"0xb\00126\003\001", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!41 = !{!"0xb\00126\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!42 = !{!"0x100\00__s2_len\00126\000", !40, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 126]
!43 = !{!"0x100\00__s2\00126\000", !44, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 126]
!44 = !{!"0xb\00126\003\002", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!45 = !{!"0x100\00__result\00126\000", !44, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 126]
!46 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0050", !1, !23, !47, null, void ([1024 x double]*)* @print_array, null, null, !52} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 50] [print_array]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !26, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!50 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !51, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!51 = !{!8}
!52 = !{!53, !54, !55, !56}
!53 = !{!"0x101\00ni\0016777264\000", !46, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 48]
!54 = !{!"0x101\00C\0033554481\000", !46, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 49]
!55 = !{!"0x100\00i\0051\000", !46, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 51]
!56 = !{!"0x100\00j\0051\000", !46, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 51]
!57 = !{!"0x2e\00kernel_syr2k\00kernel_syr2k\00\0065\001\001\000\000\00256\001\0071", !1, !23, !58, null, void (double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_syr2k, null, null, !60} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_syr2k]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !26, !26, !6, !6, !49, !49, !49}
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!61 = !{!"0x101\00ni\0016777281\000", !57, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 65]
!62 = !{!"0x101\00nj\0033554497\000", !57, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 65]
!63 = !{!"0x101\00alpha\0050331714\000", !57, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 66]
!64 = !{!"0x101\00beta\0067108931\000", !57, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 67]
!65 = !{!"0x101\00C\0083886148\000", !57, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 68]
!66 = !{!"0x101\00A\00100663365\000", !57, !23, !49} ; [ DW_TAG_arg_variable ] [A] [line 69]
!67 = !{!"0x101\00B\00117440582\000", !57, !23, !49} ; [ DW_TAG_arg_variable ] [B] [line 70]
!68 = !{!"0x100\00i\0072\000", !57, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!69 = !{!"0x100\00j\0072\000", !57, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 72]
!70 = !{!"0x100\00k\0072\000", !57, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 72]
!71 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !23, !72, null, void (double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !75} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{null, !26, !26, !74, !74, !49, !49, !49}
!74 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!75 = !{!76, !77, !78, !79, !80, !81, !82, !83, !84}
!76 = !{!"0x101\00ni\0016777239\000", !71, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!77 = !{!"0x101\00nj\0033554455\000", !71, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!78 = !{!"0x101\00alpha\0050331672\000", !71, !23, !74} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!79 = !{!"0x101\00beta\0067108889\000", !71, !23, !74} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!80 = !{!"0x101\00C\0083886106\000", !71, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 26]
!81 = !{!"0x101\00A\00100663323\000", !71, !23, !49} ; [ DW_TAG_arg_variable ] [A] [line 27]
!82 = !{!"0x101\00B\00117440540\000", !71, !23, !49} ; [ DW_TAG_arg_variable ] [B] [line 28]
!83 = !{!"0x100\00i\0030\000", !71, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!84 = !{!"0x100\00j\0030\000", !71, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!85 = !{i32 2, !"Dwarf Version", i32 4}
!86 = !{i32 2, !"Debug Info Version", i32 2}
!87 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!88 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!89 = !MDLocation(line: 91, column: 14, scope: !22)
!90 = !MDLocation(line: 91, column: 27, scope: !22)
!91 = !MDLocation(line: 94, column: 7, scope: !22)
!92 = !MDLocation(line: 95, column: 7, scope: !22)
!93 = !MDLocation(line: 100, column: 3, scope: !22)
!94 = !MDLocation(line: 101, column: 3, scope: !22)
!95 = !MDLocation(line: 102, column: 3, scope: !22)
!96 = !MDLocation(line: 106, column: 8, scope: !22)
!97 = !MDLocation(line: 107, column: 8, scope: !22)
!98 = !MDLocation(line: 108, column: 8, scope: !22)
!99 = !MDLocation(line: 98, column: 13, scope: !22)
!100 = !MDLocation(line: 99, column: 13, scope: !22)
!101 = !MDLocation(line: 105, column: 3, scope: !22)
!102 = !MDLocation(line: 115, column: 3, scope: !22)
!103 = !{!104, !104, i64 0}
!104 = !{!"double", !105, i64 0}
!105 = !{!"omnipotent char", !106, i64 0}
!106 = !{!"Simple C/C++ TBAA"}
!107 = !MDLocation(line: 115, column: 10, scope: !22)
!108 = !MDLocation(line: 114, column: 3, scope: !22)
!109 = !MDLocation(line: 126, column: 3, scope: !41)
!110 = !MDLocation(line: 126, column: 3, scope: !22)
!111 = !MDLocation(line: 126, column: 3, scope: !40)
!112 = !MDLocation(line: 126, column: 3, scope: !44)
!113 = !MDLocation(line: 126, column: 3, scope: !114)
!114 = !{!"0xb\004", !1, !44}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!115 = !{!116, !116, i64 0}
!116 = !{!"any pointer", !105, i64 0}
!117 = !{!105, !105, i64 0}
!118 = !MDLocation(line: 126, column: 3, scope: !119)
!119 = !{!"0xb\0023", !1, !41}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!120 = !MDLocation(line: 129, column: 3, scope: !22)
!121 = !MDLocation(line: 130, column: 3, scope: !22)
!122 = !MDLocation(line: 131, column: 3, scope: !22)
!123 = !MDLocation(line: 133, column: 3, scope: !22)
!124 = !MDLocation(line: 23, column: 21, scope: !71)
!125 = !MDLocation(line: 23, column: 29, scope: !71)
!126 = !MDLocation(line: 32, column: 3, scope: !71)
!127 = !MDLocation(line: 33, column: 3, scope: !71)
!128 = !MDLocation(line: 30, column: 7, scope: !71)
!129 = !MDLocation(line: 34, column: 3, scope: !130)
!130 = !{!"0xb\0034\003\0025", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!131 = !MDLocation(line: 36, column: 18, scope: !132)
!132 = !{!"0xb\0035\0030\0029", !1, !133}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!133 = !{!"0xb\0035\005\0028", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!134 = !{!"0xb\0035\005\0027", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!135 = !{!"0xb\0034\003\0026", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!136 = !MDLocation(line: 35, column: 5, scope: !134)
!137 = !MDLocation(line: 36, column: 32, scope: !132)
!138 = !MDLocation(line: 36, column: 17, scope: !132)
!139 = !MDLocation(line: 36, column: 7, scope: !132)
!140 = !MDLocation(line: 37, column: 7, scope: !132)
!141 = !MDLocation(line: 41, column: 18, scope: !142)
!142 = !{!"0xb\0040\005\0033", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!143 = !{!"0xb\0040\005\0032", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!144 = !{!"0xb\0039\003\0031", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!145 = !{!"0xb\0039\003\0030", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!146 = !MDLocation(line: 40, column: 5, scope: !143)
!147 = !MDLocation(line: 41, column: 32, scope: !142)
!148 = !MDLocation(line: 41, column: 17, scope: !142)
!149 = !MDLocation(line: 41, column: 7, scope: !142)
!150 = !MDLocation(line: 39, column: 3, scope: !145)
!151 = !MDLocation(line: 42, column: 1, scope: !71)
!152 = !MDLocation(line: 65, column: 23, scope: !57)
!153 = !MDLocation(line: 65, column: 31, scope: !57)
!154 = !MDLocation(line: 72, column: 7, scope: !57)
!155 = !MDLocation(line: 76, column: 3, scope: !156)
!156 = !{!"0xb\0076\003\0014", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!157 = !MDLocation(line: 77, column: 5, scope: !158)
!158 = !{!"0xb\0077\005\0016", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!159 = !{!"0xb\0076\003\0015", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!160 = !MDLocation(line: 78, column: 7, scope: !161)
!161 = !{!"0xb\0077\005\0017", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!162 = !MDLocation(line: 80, column: 5, scope: !163)
!163 = !{!"0xb\0080\005\0020", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!164 = !{!"0xb\0079\003\0019", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!165 = !{!"0xb\0079\003\0018", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!166 = !MDLocation(line: 83, column: 4, scope: !167)
!167 = !{!"0xb\0082\002\0024", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!168 = !{!"0xb\0081\007\0023", !1, !169}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!169 = !{!"0xb\0081\007\0022", !1, !170}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!170 = !{!"0xb\0080\005\0021", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!171 = !MDLocation(line: 81, column: 7, scope: !169)
!172 = !MDLocation(line: 83, column: 23, scope: !167)
!173 = !MDLocation(line: 83, column: 15, scope: !167)
!174 = !MDLocation(line: 83, column: 33, scope: !167)
!175 = !MDLocation(line: 84, column: 23, scope: !167)
!176 = !MDLocation(line: 84, column: 15, scope: !167)
!177 = !MDLocation(line: 84, column: 33, scope: !167)
!178 = !MDLocation(line: 84, column: 4, scope: !167)
!179 = !MDLocation(line: 79, column: 3, scope: !165)
!180 = !MDLocation(line: 88, column: 1, scope: !57)
!181 = !MDLocation(line: 48, column: 22, scope: !46)
!182 = !MDLocation(line: 51, column: 7, scope: !46)
!183 = !MDLocation(line: 53, column: 3, scope: !184)
!184 = !{!"0xb\0053\003\008", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!185 = !MDLocation(line: 56, column: 7, scope: !186)
!186 = !{!"0xb\0056\006\0013", !1, !187}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!187 = !{!"0xb\0054\0030\0012", !1, !188}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!188 = !{!"0xb\0054\005\0011", !1, !189}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!189 = !{!"0xb\0054\005\0010", !1, !190}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!190 = !{!"0xb\0053\003\009", !1, !184}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!191 = !MDLocation(line: 54, column: 5, scope: !189)
!192 = !MDLocation(line: 55, column: 11, scope: !187)
!193 = !MDLocation(line: 55, column: 41, scope: !187)
!194 = !MDLocation(line: 55, column: 2, scope: !187)
!195 = !MDLocation(line: 56, column: 6, scope: !186)
!196 = !MDLocation(line: 56, column: 6, scope: !187)
!197 = !MDLocation(line: 56, column: 39, scope: !198)
!198 = !{!"0xb\001", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!199 = !MDLocation(line: 56, column: 30, scope: !186)
!200 = !MDLocation(line: 58, column: 12, scope: !46)
!201 = !MDLocation(line: 58, column: 3, scope: !46)
!202 = !MDLocation(line: 59, column: 1, scope: !46)
