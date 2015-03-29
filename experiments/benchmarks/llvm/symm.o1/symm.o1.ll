; ModuleID = 'symm.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !90), !dbg !91
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !90), !dbg !92
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !90), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !90), !dbg !94
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !95
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !96
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !97
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !98
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !99
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !100
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !34, metadata !90), !dbg !101
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !35, metadata !90), !dbg !102
  call fastcc void @init_array(double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !103
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !34, metadata !90), !dbg !101
  %0 = load double* %alpha, align 8, !dbg !104, !tbaa !105
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !35, metadata !90), !dbg !102
  %1 = load double* %beta, align 8, !dbg !109, !tbaa !105
  tail call fastcc void @kernel_symm(double %0, double %1, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !110
  %cmp = icmp sgt i32 %argc, 42, !dbg !111
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !112

if.end44:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !90), !dbg !113
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !43, metadata !90), !dbg !114
  %2 = load i8** %argv, align 8, !dbg !115, !tbaa !117
  %3 = load i8* %2, align 1, !dbg !115, !tbaa !119
  %phitmp = icmp eq i8 %3, 0, !dbg !113
  br i1 %phitmp, label %if.then49, label %if.end51, !dbg !112

if.then49:                                        ; preds = %if.end44
  tail call fastcc void @print_array([1024 x double]* %arraydecay), !dbg !120
  br label %if.end51, !dbg !120

if.end51:                                         ; preds = %if.end44, %if.then49, %entry
  tail call void @free(i8* %call) #4, !dbg !122
  tail call void @free(i8* %call1) #4, !dbg !123
  tail call void @free(i8* %call2) #4, !dbg !124
  ret i32 0, !dbg !125
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !78, metadata !90), !dbg !126
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !79, metadata !90), !dbg !127
  store double 3.241200e+04, double* %alpha, align 8, !dbg !128, !tbaa !105
  store double 2.123000e+03, double* %beta, align 8, !dbg !129, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !85, metadata !90), !dbg !130
  br label %for.cond1.preheader, !dbg !131

for.cond1.preheader:                              ; preds = %for.inc17, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc17 ]
  %0 = trunc i64 %indvars.iv11 to i32, !dbg !133
  %conv = sitofp i32 %0 to double, !dbg !133
  br label %for.body3, !dbg !138

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next9, %for.body3 ]
  %1 = trunc i64 %indvars.iv8 to i32, !dbg !139
  %conv4 = sitofp i32 %1 to double, !dbg !139
  %mul = fmul double %conv, %conv4, !dbg !133
  %div = fmul double %mul, 9.765625e-04, !dbg !140
  %arrayidx7 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !141
  store double %div, double* %arrayidx7, align 8, !dbg !141, !tbaa !105
  %arrayidx16 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !142
  store double %div, double* %arrayidx16, align 8, !dbg !142, !tbaa !105
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !138
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1024, !dbg !138
  br i1 %exitcond10, label %for.inc17, label %for.body3, !dbg !138

for.inc17:                                        ; preds = %for.body3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !131
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1024, !dbg !131
  br i1 %exitcond13, label %for.cond24.preheader, label %for.cond1.preheader, !dbg !131

for.cond24.preheader:                             ; preds = %for.inc17, %for.inc40
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc40 ], [ 0, %for.inc17 ]
  %2 = trunc i64 %indvars.iv5 to i32, !dbg !143
  %conv28 = sitofp i32 %2 to double, !dbg !143
  br label %for.body27, !dbg !148

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %3 = trunc i64 %indvars.iv to i32, !dbg !149
  %conv29 = sitofp i32 %3 to double, !dbg !149
  %mul30 = fmul double %conv28, %conv29, !dbg !143
  %div32 = fmul double %mul30, 9.765625e-04, !dbg !150
  %arrayidx36 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv, !dbg !151
  store double %div32, double* %arrayidx36, align 8, !dbg !151, !tbaa !105
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !148
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !148
  br i1 %exitcond, label %for.inc40, label %for.body27, !dbg !148

for.inc40:                                        ; preds = %for.body27
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !152
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1024, !dbg !152
  br i1 %exitcond7, label %for.end42, label %for.cond24.preheader, !dbg !152

for.end42:                                        ; preds = %for.inc40
  ret void, !dbg !153
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture readonly %A, [1024 x double]* nocapture readonly %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !62, metadata !90), !dbg !154
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !63, metadata !90), !dbg !155
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !90), !dbg !156
  br label %for.cond1.preheader, !dbg !157

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv9 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc53 ]
  %arrayidx36 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv9, !dbg !159
  br label %for.cond4.preheader, !dbg !164

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next7, %for.end ]
  %0 = add nsw i64 %indvars.iv6, -1, !dbg !165
  %cmp51 = icmp sgt i64 %indvars.iv6, 1, !dbg !168
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end, !dbg !169

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx12 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !170
  br label %for.body6, !dbg !169

for.body6:                                        ; preds = %for.body6.lr.ph, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %acc.03 = phi double [ 0.000000e+00, %for.body6.lr.ph ], [ %add27, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv, i64 %indvars.iv9, !dbg !172
  %1 = load double* %arrayidx8, align 8, !dbg !172, !tbaa !105
  %mul = fmul double %1, %alpha, !dbg !173
  %2 = load double* %arrayidx12, align 8, !dbg !170, !tbaa !105
  %mul13 = fmul double %mul, %2, !dbg !173
  %arrayidx17 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv, i64 %indvars.iv6, !dbg !174
  %3 = load double* %arrayidx17, align 8, !dbg !174, !tbaa !105
  %add = fadd double %3, %mul13, !dbg !174
  store double %add, double* %arrayidx17, align 8, !dbg !174, !tbaa !105
  %arrayidx21 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv, i64 %indvars.iv6, !dbg !175
  %4 = load double* %arrayidx21, align 8, !dbg !175, !tbaa !105
  %5 = load double* %arrayidx8, align 8, !dbg !176, !tbaa !105
  %mul26 = fmul double %4, %5, !dbg !175
  %add27 = fadd double %acc.03, %mul26, !dbg !177
  tail call void @llvm.dbg.value(metadata double %add27, i64 0, metadata !72, metadata !90), !dbg !178
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !169
  %cmp5 = icmp slt i64 %indvars.iv.next, %0, !dbg !168
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !169

for.end:                                          ; preds = %for.body6, %for.cond4.preheader
  %acc.0.lcssa = phi double [ 0.000000e+00, %for.cond4.preheader ], [ %add27, %for.body6 ]
  %arrayidx31 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !179
  %6 = load double* %arrayidx31, align 8, !dbg !179, !tbaa !105
  %mul32 = fmul double %6, %beta, !dbg !180
  %7 = load double* %arrayidx36, align 8, !dbg !159, !tbaa !105
  %mul37 = fmul double %7, %alpha, !dbg !181
  %arrayidx41 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !182
  %8 = load double* %arrayidx41, align 8, !dbg !182, !tbaa !105
  %mul42 = fmul double %mul37, %8, !dbg !181
  %add43 = fadd double %mul32, %mul42, !dbg !180
  %mul44 = fmul double %acc.0.lcssa, %alpha, !dbg !183
  %add45 = fadd double %mul44, %add43, !dbg !180
  store double %add45, double* %arrayidx31, align 8, !dbg !184, !tbaa !105
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !164
  %exitcond = icmp eq i64 %indvars.iv.next7, 1024, !dbg !164
  br i1 %exitcond, label %for.inc53, label %for.cond4.preheader, !dbg !164

for.inc53:                                        ; preds = %for.end
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !157
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1024, !dbg !157
  br i1 %exitcond11, label %for.end55, label %for.cond1.preheader, !dbg !157

for.end55:                                        ; preds = %for.inc53
  ret void, !dbg !185
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %C) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !53, metadata !90), !dbg !186
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !54, metadata !90), !dbg !187
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !90), !dbg !188
  br label %for.cond1.preheader, !dbg !189

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !191
  br label %for.body3, !dbg !197

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !198, !tbaa !117
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv, !dbg !199
  %2 = load double* %arrayidx5, align 8, !dbg !199, !tbaa !105
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !200
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !191
  %4 = trunc i64 %3 to i32, !dbg !201
  %rem = srem i32 %4, 20, !dbg !201
  %cmp6 = icmp eq i32 %rem, 0, !dbg !201
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !202

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !203, !tbaa !117
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !205
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !197
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !197
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !197

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !189
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !189
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !189

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !206, !tbaa !117
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !207
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
!llvm.module.flags = !{!87, !88}
!llvm.ident = !{!89}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c] [DW_LANG_C99]
!1 = !{!"symm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm"}
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
!21 = !{!22, !46, !58, !73}
!22 = !{!"0x2e\00main\00main\00\0093\000\001\000\000\00256\001\0094", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 93] [def] [scope 94] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !42, !43, !45}
!30 = !{!"0x101\00argc\0016777309\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 93]
!31 = !{!"0x101\00argv\0033554525\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 93]
!32 = !{!"0x100\00ni\0096\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 96]
!33 = !{!"0x100\00nj\0097\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 97]
!34 = !{!"0x100\00alpha\00100\000", !22, !23, !6} ; [ DW_TAG_auto_variable ] [alpha] [line 100]
!35 = !{!"0x100\00beta\00101\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [beta] [line 101]
!36 = !{!"0x100\00C\00102\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [C] [line 102]
!37 = !{!"0x100\00A\00103\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 103]
!38 = !{!"0x100\00B\00104\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 104]
!39 = !{!"0x100\00__s1_len\00128\000", !40, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 128]
!40 = !{!"0xb\00128\003\001", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!41 = !{!"0xb\00128\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!42 = !{!"0x100\00__s2_len\00128\000", !40, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 128]
!43 = !{!"0x100\00__s2\00128\000", !44, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 128]
!44 = !{!"0xb\00128\003\002", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!45 = !{!"0x100\00__result\00128\000", !44, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 128]
!46 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0050", !1, !23, !47, null, void ([1024 x double]*)* @print_array, null, null, !52} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 50] [print_array]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !26, !26, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!50 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !51, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!51 = !{!8}
!52 = !{!53, !54, !55, !56, !57}
!53 = !{!"0x101\00ni\0016777264\000", !46, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 48]
!54 = !{!"0x101\00nj\0033554480\000", !46, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 48]
!55 = !{!"0x101\00C\0050331697\000", !46, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 49]
!56 = !{!"0x100\00i\0051\000", !46, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 51]
!57 = !{!"0x100\00j\0051\000", !46, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 51]
!58 = !{!"0x2e\00kernel_symm\00kernel_symm\00\0065\001\001\000\000\00256\001\0071", !1, !23, !59, null, void (double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_symm, null, null, !61} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_symm]
!59 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !60, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = !{null, !26, !26, !6, !6, !49, !49, !49}
!61 = !{!62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72}
!62 = !{!"0x101\00ni\0016777281\000", !58, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 65]
!63 = !{!"0x101\00nj\0033554497\000", !58, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 65]
!64 = !{!"0x101\00alpha\0050331714\000", !58, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 66]
!65 = !{!"0x101\00beta\0067108931\000", !58, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 67]
!66 = !{!"0x101\00C\0083886148\000", !58, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 68]
!67 = !{!"0x101\00A\00100663365\000", !58, !23, !49} ; [ DW_TAG_arg_variable ] [A] [line 69]
!68 = !{!"0x101\00B\00117440582\000", !58, !23, !49} ; [ DW_TAG_arg_variable ] [B] [line 70]
!69 = !{!"0x100\00i\0072\000", !58, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!70 = !{!"0x100\00j\0072\000", !58, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 72]
!71 = !{!"0x100\00k\0072\000", !58, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 72]
!72 = !{!"0x100\00acc\0073\000", !58, !23, !6}    ; [ DW_TAG_auto_variable ] [acc] [line 73]
!73 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !23, !74, null, void (double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !77} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!74 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !75, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = !{null, !26, !26, !76, !76, !49, !49, !49}
!76 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!77 = !{!78, !79, !80, !81, !82, !83, !84, !85, !86}
!78 = !{!"0x101\00ni\0016777239\000", !73, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!79 = !{!"0x101\00nj\0033554455\000", !73, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!80 = !{!"0x101\00alpha\0050331672\000", !73, !23, !76} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!81 = !{!"0x101\00beta\0067108889\000", !73, !23, !76} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!82 = !{!"0x101\00C\0083886106\000", !73, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 26]
!83 = !{!"0x101\00A\00100663323\000", !73, !23, !49} ; [ DW_TAG_arg_variable ] [A] [line 27]
!84 = !{!"0x101\00B\00117440540\000", !73, !23, !49} ; [ DW_TAG_arg_variable ] [B] [line 28]
!85 = !{!"0x100\00i\0030\000", !73, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!86 = !{!"0x100\00j\0030\000", !73, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!87 = !{i32 2, !"Dwarf Version", i32 4}
!88 = !{i32 2, !"Debug Info Version", i32 2}
!89 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!90 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!91 = !MDLocation(line: 93, column: 14, scope: !22)
!92 = !MDLocation(line: 93, column: 27, scope: !22)
!93 = !MDLocation(line: 96, column: 7, scope: !22)
!94 = !MDLocation(line: 97, column: 7, scope: !22)
!95 = !MDLocation(line: 102, column: 3, scope: !22)
!96 = !MDLocation(line: 103, column: 3, scope: !22)
!97 = !MDLocation(line: 104, column: 3, scope: !22)
!98 = !MDLocation(line: 108, column: 8, scope: !22)
!99 = !MDLocation(line: 109, column: 8, scope: !22)
!100 = !MDLocation(line: 110, column: 8, scope: !22)
!101 = !MDLocation(line: 100, column: 13, scope: !22)
!102 = !MDLocation(line: 101, column: 13, scope: !22)
!103 = !MDLocation(line: 107, column: 3, scope: !22)
!104 = !MDLocation(line: 117, column: 9, scope: !22)
!105 = !{!106, !106, i64 0}
!106 = !{!"double", !107, i64 0}
!107 = !{!"omnipotent char", !108, i64 0}
!108 = !{!"Simple C/C++ TBAA"}
!109 = !MDLocation(line: 117, column: 16, scope: !22)
!110 = !MDLocation(line: 116, column: 3, scope: !22)
!111 = !MDLocation(line: 128, column: 3, scope: !41)
!112 = !MDLocation(line: 128, column: 3, scope: !22)
!113 = !MDLocation(line: 128, column: 3, scope: !40)
!114 = !MDLocation(line: 128, column: 3, scope: !44)
!115 = !MDLocation(line: 128, column: 3, scope: !116)
!116 = !{!"0xb\004", !1, !44}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!117 = !{!118, !118, i64 0}
!118 = !{!"any pointer", !107, i64 0}
!119 = !{!107, !107, i64 0}
!120 = !MDLocation(line: 128, column: 3, scope: !121)
!121 = !{!"0xb\0023", !1, !41}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!122 = !MDLocation(line: 131, column: 3, scope: !22)
!123 = !MDLocation(line: 132, column: 3, scope: !22)
!124 = !MDLocation(line: 133, column: 3, scope: !22)
!125 = !MDLocation(line: 135, column: 3, scope: !22)
!126 = !MDLocation(line: 23, column: 21, scope: !73)
!127 = !MDLocation(line: 23, column: 29, scope: !73)
!128 = !MDLocation(line: 32, column: 3, scope: !73)
!129 = !MDLocation(line: 33, column: 3, scope: !73)
!130 = !MDLocation(line: 30, column: 7, scope: !73)
!131 = !MDLocation(line: 34, column: 3, scope: !132)
!132 = !{!"0xb\0034\003\0022", !1, !73}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!133 = !MDLocation(line: 36, column: 18, scope: !134)
!134 = !{!"0xb\0035\0030\0026", !1, !135}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!135 = !{!"0xb\0035\005\0025", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!136 = !{!"0xb\0035\005\0024", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!137 = !{!"0xb\0034\003\0023", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!138 = !MDLocation(line: 35, column: 5, scope: !136)
!139 = !MDLocation(line: 36, column: 32, scope: !134)
!140 = !MDLocation(line: 36, column: 17, scope: !134)
!141 = !MDLocation(line: 36, column: 7, scope: !134)
!142 = !MDLocation(line: 37, column: 7, scope: !134)
!143 = !MDLocation(line: 41, column: 18, scope: !144)
!144 = !{!"0xb\0040\005\0030", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!145 = !{!"0xb\0040\005\0029", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!146 = !{!"0xb\0039\003\0028", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!147 = !{!"0xb\0039\003\0027", !1, !73}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!148 = !MDLocation(line: 40, column: 5, scope: !145)
!149 = !MDLocation(line: 41, column: 32, scope: !144)
!150 = !MDLocation(line: 41, column: 17, scope: !144)
!151 = !MDLocation(line: 41, column: 7, scope: !144)
!152 = !MDLocation(line: 39, column: 3, scope: !147)
!153 = !MDLocation(line: 42, column: 1, scope: !73)
!154 = !MDLocation(line: 65, column: 22, scope: !58)
!155 = !MDLocation(line: 65, column: 30, scope: !58)
!156 = !MDLocation(line: 72, column: 7, scope: !58)
!157 = !MDLocation(line: 77, column: 3, scope: !158)
!158 = !{!"0xb\0077\003\0014", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!159 = !MDLocation(line: 86, column: 37, scope: !160)
!160 = !{!"0xb\0079\007\0018", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!161 = !{!"0xb\0078\005\0017", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!162 = !{!"0xb\0078\005\0016", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!163 = !{!"0xb\0077\003\0015", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!164 = !MDLocation(line: 78, column: 5, scope: !162)
!165 = !MDLocation(line: 81, column: 18, scope: !166)
!166 = !{!"0xb\0081\002\0020", !1, !167}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!167 = !{!"0xb\0081\002\0019", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!168 = !MDLocation(line: 81, column: 14, scope: !166)
!169 = !MDLocation(line: 81, column: 2, scope: !167)
!170 = !MDLocation(line: 83, column: 35, scope: !171)
!171 = !{!"0xb\0082\004\0021", !1, !166}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!172 = !MDLocation(line: 83, column: 25, scope: !171)
!173 = !MDLocation(line: 83, column: 17, scope: !171)
!174 = !MDLocation(line: 83, column: 6, scope: !171)
!175 = !MDLocation(line: 84, column: 13, scope: !171)
!176 = !MDLocation(line: 84, column: 23, scope: !171)
!177 = !MDLocation(line: 84, column: 6, scope: !171)
!178 = !MDLocation(line: 73, column: 13, scope: !58)
!179 = !MDLocation(line: 86, column: 19, scope: !160)
!180 = !MDLocation(line: 86, column: 12, scope: !160)
!181 = !MDLocation(line: 86, column: 29, scope: !160)
!182 = !MDLocation(line: 86, column: 47, scope: !160)
!183 = !MDLocation(line: 86, column: 57, scope: !160)
!184 = !MDLocation(line: 86, column: 2, scope: !160)
!185 = !MDLocation(line: 90, column: 1, scope: !58)
!186 = !MDLocation(line: 48, column: 22, scope: !46)
!187 = !MDLocation(line: 48, column: 30, scope: !46)
!188 = !MDLocation(line: 51, column: 7, scope: !46)
!189 = !MDLocation(line: 53, column: 3, scope: !190)
!190 = !{!"0xb\0053\003\008", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!191 = !MDLocation(line: 56, column: 7, scope: !192)
!192 = !{!"0xb\0056\006\0013", !1, !193}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!193 = !{!"0xb\0054\0030\0012", !1, !194}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!194 = !{!"0xb\0054\005\0011", !1, !195}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!195 = !{!"0xb\0054\005\0010", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!196 = !{!"0xb\0053\003\009", !1, !190}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!197 = !MDLocation(line: 54, column: 5, scope: !195)
!198 = !MDLocation(line: 55, column: 11, scope: !193)
!199 = !MDLocation(line: 55, column: 41, scope: !193)
!200 = !MDLocation(line: 55, column: 2, scope: !193)
!201 = !MDLocation(line: 56, column: 6, scope: !192)
!202 = !MDLocation(line: 56, column: 6, scope: !193)
!203 = !MDLocation(line: 56, column: 39, scope: !204)
!204 = !{!"0xb\001", !1, !192}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!205 = !MDLocation(line: 56, column: 30, scope: !192)
!206 = !MDLocation(line: 58, column: 12, scope: !46)
!207 = !MDLocation(line: 58, column: 3, scope: !46)
!208 = !MDLocation(line: 59, column: 1, scope: !46)
