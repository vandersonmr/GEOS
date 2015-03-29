; ModuleID = 'gemm.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !92), !dbg !93
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !92), !dbg !94
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !92), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !92), !dbg !96
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !34, metadata !92), !dbg !97
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !98
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !99
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !100
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !101
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !102
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !103
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !35, metadata !92), !dbg !104
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !36, metadata !92), !dbg !105
  call fastcc void @init_array(double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !106
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !35, metadata !92), !dbg !104
  %0 = load double* %alpha, align 8, !dbg !107, !tbaa !108
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !36, metadata !92), !dbg !105
  %1 = load double* %beta, align 8, !dbg !112, !tbaa !108
  tail call fastcc void @kernel_gemm(double %0, double %1, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !113
  %cmp = icmp sgt i32 %argc, 42, !dbg !114
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !115

if.end44:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !92), !dbg !116
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !44, metadata !92), !dbg !117
  %2 = load i8** %argv, align 8, !dbg !118, !tbaa !120
  %3 = load i8* %2, align 1, !dbg !118, !tbaa !122
  %phitmp = icmp eq i8 %3, 0, !dbg !116
  br i1 %phitmp, label %if.then49, label %if.end51, !dbg !115

if.then49:                                        ; preds = %if.end44
  tail call fastcc void @print_array([1024 x double]* %arraydecay), !dbg !123
  br label %if.end51, !dbg !123

if.end51:                                         ; preds = %if.end44, %if.then49, %entry
  tail call void @free(i8* %call) #4, !dbg !125
  tail call void @free(i8* %call1) #4, !dbg !126
  tail call void @free(i8* %call2) #4, !dbg !127
  ret i32 0, !dbg !128
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !79, metadata !92), !dbg !129
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !80, metadata !92), !dbg !130
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !81, metadata !92), !dbg !131
  store double 3.241200e+04, double* %alpha, align 8, !dbg !132, !tbaa !108
  store double 2.123000e+03, double* %beta, align 8, !dbg !133, !tbaa !108
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !87, metadata !92), !dbg !134
  br label %for.cond1.preheader, !dbg !135

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv19 = phi i64 [ 0, %entry ], [ %indvars.iv.next20, %for.inc8 ]
  %0 = trunc i64 %indvars.iv19 to i32, !dbg !137
  %conv = sitofp i32 %0 to double, !dbg !137
  br label %for.body3, !dbg !141

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next17, %for.body3 ]
  %1 = trunc i64 %indvars.iv16 to i32, !dbg !142
  %conv4 = sitofp i32 %1 to double, !dbg !142
  %mul = fmul double %conv, %conv4, !dbg !137
  %div = fmul double %mul, 9.765625e-04, !dbg !143
  %arrayidx7 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv19, i64 %indvars.iv16, !dbg !144
  store double %div, double* %arrayidx7, align 8, !dbg !144, !tbaa !108
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !141
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1024, !dbg !141
  br i1 %exitcond18, label %for.inc8, label %for.body3, !dbg !141

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !135
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1024, !dbg !135
  br i1 %exitcond21, label %for.cond15.preheader, label %for.cond1.preheader, !dbg !135

for.cond15.preheader:                             ; preds = %for.inc8, %for.inc31
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.inc31 ], [ 0, %for.inc8 ]
  %2 = trunc i64 %indvars.iv13 to i32, !dbg !145
  %conv19 = sitofp i32 %2 to double, !dbg !145
  br label %for.body18, !dbg !150

for.body18:                                       ; preds = %for.body18, %for.cond15.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next11, %for.body18 ]
  %3 = trunc i64 %indvars.iv10 to i32, !dbg !151
  %conv20 = sitofp i32 %3 to double, !dbg !151
  %mul21 = fmul double %conv19, %conv20, !dbg !145
  %div23 = fmul double %mul21, 9.765625e-04, !dbg !152
  %arrayidx27 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv10, !dbg !153
  store double %div23, double* %arrayidx27, align 8, !dbg !153, !tbaa !108
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !150
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1024, !dbg !150
  br i1 %exitcond12, label %for.inc31, label %for.body18, !dbg !150

for.inc31:                                        ; preds = %for.body18
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !154
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1024, !dbg !154
  br i1 %exitcond15, label %for.cond38.preheader, label %for.cond15.preheader, !dbg !154

for.cond38.preheader:                             ; preds = %for.inc31, %for.inc54
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc54 ], [ 0, %for.inc31 ]
  %4 = trunc i64 %indvars.iv7 to i32, !dbg !155
  %conv42 = sitofp i32 %4 to double, !dbg !155
  br label %for.body41, !dbg !160

for.body41:                                       ; preds = %for.body41, %for.cond38.preheader
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next, %for.body41 ]
  %5 = trunc i64 %indvars.iv to i32, !dbg !161
  %conv43 = sitofp i32 %5 to double, !dbg !161
  %mul44 = fmul double %conv42, %conv43, !dbg !155
  %div46 = fmul double %mul44, 9.765625e-04, !dbg !162
  %arrayidx50 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv, !dbg !163
  store double %div46, double* %arrayidx50, align 8, !dbg !163, !tbaa !108
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !160
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !160
  br i1 %exitcond, label %for.inc54, label %for.body41, !dbg !160

for.inc54:                                        ; preds = %for.body41
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !164
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !164
  br i1 %exitcond9, label %for.end56, label %for.cond38.preheader, !dbg !164

for.end56:                                        ; preds = %for.inc54
  ret void, !dbg !165
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture readonly %A, [1024 x double]* nocapture readonly %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !63, metadata !92), !dbg !166
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !64, metadata !92), !dbg !167
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !65, metadata !92), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !92), !dbg !169
  br label %for.cond1.preheader, !dbg !170

for.cond1.preheader:                              ; preds = %for.inc26, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc26 ]
  br label %for.body3, !dbg !172

for.body3:                                        ; preds = %for.inc23, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc23 ]
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !175
  %0 = load double* %arrayidx5, align 8, !dbg !175, !tbaa !108
  %mul = fmul double %0, %beta, !dbg !175
  store double %mul, double* %arrayidx5, align 8, !dbg !175, !tbaa !108
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !73, metadata !92), !dbg !178
  br label %for.body8, !dbg !179

for.body8:                                        ; preds = %for.body8, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv, !dbg !181
  %1 = load double* %arrayidx12, align 8, !dbg !181, !tbaa !108
  %mul13 = fmul double %1, %alpha, !dbg !183
  %arrayidx17 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv, i64 %indvars.iv4, !dbg !184
  %2 = load double* %arrayidx17, align 8, !dbg !184, !tbaa !108
  %mul18 = fmul double %mul13, %2, !dbg !183
  %3 = load double* %arrayidx5, align 8, !dbg !185, !tbaa !108
  %add = fadd double %3, %mul18, !dbg !185
  store double %add, double* %arrayidx5, align 8, !dbg !185, !tbaa !108
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !179
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !179
  br i1 %exitcond, label %for.inc23, label %for.body8, !dbg !179

for.inc23:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !172
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1024, !dbg !172
  br i1 %exitcond6, label %for.inc26, label %for.body3, !dbg !172

for.inc26:                                        ; preds = %for.inc23
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !170
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !170
  br i1 %exitcond9, label %for.end28, label %for.cond1.preheader, !dbg !170

for.end28:                                        ; preds = %for.inc26
  ret void, !dbg !186
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %C) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !54, metadata !92), !dbg !187
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !55, metadata !92), !dbg !188
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !92), !dbg !189
  br label %for.cond1.preheader, !dbg !190

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !192
  br label %for.body3, !dbg !198

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !199, !tbaa !120
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv, !dbg !200
  %2 = load double* %arrayidx5, align 8, !dbg !200, !tbaa !108
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !201
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !192
  %4 = trunc i64 %3 to i32, !dbg !202
  %rem = srem i32 %4, 20, !dbg !202
  %cmp6 = icmp eq i32 %rem, 0, !dbg !202
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !203

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !204, !tbaa !120
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !206
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !198
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !198
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !198

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !190
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !190
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !190

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !207, !tbaa !120
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !208
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
!llvm.module.flags = !{!89, !90}
!llvm.ident = !{!91}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c] [DW_LANG_C99]
!1 = !{!"gemm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm"}
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
!21 = !{!22, !47, !59, !74}
!22 = !{!"0x2e\00main\00main\00\0089\000\001\000\000\00256\001\0090", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 89] [def] [scope 90] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !43, !44, !46}
!30 = !{!"0x101\00argc\0016777305\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 89]
!31 = !{!"0x101\00argv\0033554521\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 89]
!32 = !{!"0x100\00ni\0092\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 92]
!33 = !{!"0x100\00nj\0093\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 93]
!34 = !{!"0x100\00nk\0094\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nk] [line 94]
!35 = !{!"0x100\00alpha\0097\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 97]
!36 = !{!"0x100\00beta\0098\000", !22, !23, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 98]
!37 = !{!"0x100\00C\0099\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [C] [line 99]
!38 = !{!"0x100\00A\00100\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 100]
!39 = !{!"0x100\00B\00101\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 101]
!40 = !{!"0x100\00__s1_len\00125\000", !41, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 125]
!41 = !{!"0xb\00125\003\001", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!42 = !{!"0xb\00125\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!43 = !{!"0x100\00__s2_len\00125\000", !41, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 125]
!44 = !{!"0x100\00__s2\00125\000", !45, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 125]
!45 = !{!"0xb\00125\003\002", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!46 = !{!"0x100\00__result\00125\000", !45, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 125]
!47 = !{!"0x2e\00print_array\00print_array\00\0049\001\001\000\000\00256\001\0051", !1, !23, !48, null, void ([1024 x double]*)* @print_array, null, null, !53} ; [ DW_TAG_subprogram ] [line 49] [local] [def] [scope 51] [print_array]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{null, !26, !26, !50}
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !52, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!52 = !{!8}
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00ni\0016777265\000", !47, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 49]
!55 = !{!"0x101\00nj\0033554481\000", !47, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 49]
!56 = !{!"0x101\00C\0050331698\000", !47, !23, !50} ; [ DW_TAG_arg_variable ] [C] [line 50]
!57 = !{!"0x100\00i\0052\000", !47, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!58 = !{!"0x100\00j\0052\000", !47, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 52]
!59 = !{!"0x2e\00kernel_gemm\00kernel_gemm\00\0066\001\001\000\000\00256\001\0072", !1, !23, !60, null, void (double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_gemm, null, null, !62} ; [ DW_TAG_subprogram ] [line 66] [local] [def] [scope 72] [kernel_gemm]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{null, !26, !26, !26, !6, !6, !50, !50, !50}
!62 = !{!63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!63 = !{!"0x101\00ni\0016777282\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 66]
!64 = !{!"0x101\00nj\0033554498\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 66]
!65 = !{!"0x101\00nk\0050331714\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [nk] [line 66]
!66 = !{!"0x101\00alpha\0067108931\000", !59, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 67]
!67 = !{!"0x101\00beta\0083886148\000", !59, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 68]
!68 = !{!"0x101\00C\00100663365\000", !59, !23, !50} ; [ DW_TAG_arg_variable ] [C] [line 69]
!69 = !{!"0x101\00A\00117440582\000", !59, !23, !50} ; [ DW_TAG_arg_variable ] [A] [line 70]
!70 = !{!"0x101\00B\00134217799\000", !59, !23, !50} ; [ DW_TAG_arg_variable ] [B] [line 71]
!71 = !{!"0x100\00i\0073\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 73]
!72 = !{!"0x100\00j\0073\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 73]
!73 = !{!"0x100\00k\0073\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 73]
!74 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !23, !75, null, void (double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !78} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{null, !26, !26, !26, !77, !77, !50, !50, !50}
!77 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!78 = !{!79, !80, !81, !82, !83, !84, !85, !86, !87, !88}
!79 = !{!"0x101\00ni\0016777239\000", !74, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!80 = !{!"0x101\00nj\0033554455\000", !74, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!81 = !{!"0x101\00nk\0050331671\000", !74, !23, !26} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!82 = !{!"0x101\00alpha\0067108888\000", !74, !23, !77} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!83 = !{!"0x101\00beta\0083886105\000", !74, !23, !77} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!84 = !{!"0x101\00C\00100663322\000", !74, !23, !50} ; [ DW_TAG_arg_variable ] [C] [line 26]
!85 = !{!"0x101\00A\00117440539\000", !74, !23, !50} ; [ DW_TAG_arg_variable ] [A] [line 27]
!86 = !{!"0x101\00B\00134217756\000", !74, !23, !50} ; [ DW_TAG_arg_variable ] [B] [line 28]
!87 = !{!"0x100\00i\0030\000", !74, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!88 = !{!"0x100\00j\0030\000", !74, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!89 = !{i32 2, !"Dwarf Version", i32 4}
!90 = !{i32 2, !"Debug Info Version", i32 2}
!91 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!92 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!93 = !MDLocation(line: 89, column: 14, scope: !22)
!94 = !MDLocation(line: 89, column: 27, scope: !22)
!95 = !MDLocation(line: 92, column: 7, scope: !22)
!96 = !MDLocation(line: 93, column: 7, scope: !22)
!97 = !MDLocation(line: 94, column: 7, scope: !22)
!98 = !MDLocation(line: 99, column: 3, scope: !22)
!99 = !MDLocation(line: 100, column: 3, scope: !22)
!100 = !MDLocation(line: 101, column: 3, scope: !22)
!101 = !MDLocation(line: 105, column: 8, scope: !22)
!102 = !MDLocation(line: 106, column: 8, scope: !22)
!103 = !MDLocation(line: 107, column: 8, scope: !22)
!104 = !MDLocation(line: 97, column: 13, scope: !22)
!105 = !MDLocation(line: 98, column: 13, scope: !22)
!106 = !MDLocation(line: 104, column: 3, scope: !22)
!107 = !MDLocation(line: 114, column: 9, scope: !22)
!108 = !{!109, !109, i64 0}
!109 = !{!"double", !110, i64 0}
!110 = !{!"omnipotent char", !111, i64 0}
!111 = !{!"Simple C/C++ TBAA"}
!112 = !MDLocation(line: 114, column: 16, scope: !22)
!113 = !MDLocation(line: 113, column: 3, scope: !22)
!114 = !MDLocation(line: 125, column: 3, scope: !42)
!115 = !MDLocation(line: 125, column: 3, scope: !22)
!116 = !MDLocation(line: 125, column: 3, scope: !41)
!117 = !MDLocation(line: 125, column: 3, scope: !45)
!118 = !MDLocation(line: 125, column: 3, scope: !119)
!119 = !{!"0xb\004", !1, !45}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!120 = !{!121, !121, i64 0}
!121 = !{!"any pointer", !110, i64 0}
!122 = !{!110, !110, i64 0}
!123 = !MDLocation(line: 125, column: 3, scope: !124)
!124 = !{!"0xb\0023", !1, !42}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!125 = !MDLocation(line: 128, column: 3, scope: !22)
!126 = !MDLocation(line: 129, column: 3, scope: !22)
!127 = !MDLocation(line: 130, column: 3, scope: !22)
!128 = !MDLocation(line: 132, column: 3, scope: !22)
!129 = !MDLocation(line: 23, column: 21, scope: !74)
!130 = !MDLocation(line: 23, column: 29, scope: !74)
!131 = !MDLocation(line: 23, column: 37, scope: !74)
!132 = !MDLocation(line: 32, column: 3, scope: !74)
!133 = !MDLocation(line: 33, column: 3, scope: !74)
!134 = !MDLocation(line: 30, column: 7, scope: !74)
!135 = !MDLocation(line: 34, column: 3, scope: !136)
!136 = !{!"0xb\0034\003\0021", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!137 = !MDLocation(line: 36, column: 18, scope: !138)
!138 = !{!"0xb\0035\005\0024", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!139 = !{!"0xb\0035\005\0023", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!140 = !{!"0xb\0034\003\0022", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!141 = !MDLocation(line: 35, column: 5, scope: !139)
!142 = !MDLocation(line: 36, column: 32, scope: !138)
!143 = !MDLocation(line: 36, column: 17, scope: !138)
!144 = !MDLocation(line: 36, column: 7, scope: !138)
!145 = !MDLocation(line: 39, column: 18, scope: !146)
!146 = !{!"0xb\0038\005\0028", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!147 = !{!"0xb\0038\005\0027", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!148 = !{!"0xb\0037\003\0026", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!149 = !{!"0xb\0037\003\0025", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!150 = !MDLocation(line: 38, column: 5, scope: !147)
!151 = !MDLocation(line: 39, column: 32, scope: !146)
!152 = !MDLocation(line: 39, column: 17, scope: !146)
!153 = !MDLocation(line: 39, column: 7, scope: !146)
!154 = !MDLocation(line: 37, column: 3, scope: !149)
!155 = !MDLocation(line: 42, column: 18, scope: !156)
!156 = !{!"0xb\0041\005\0032", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!157 = !{!"0xb\0041\005\0031", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!158 = !{!"0xb\0040\003\0030", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!159 = !{!"0xb\0040\003\0029", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!160 = !MDLocation(line: 41, column: 5, scope: !157)
!161 = !MDLocation(line: 42, column: 32, scope: !156)
!162 = !MDLocation(line: 42, column: 17, scope: !156)
!163 = !MDLocation(line: 42, column: 7, scope: !156)
!164 = !MDLocation(line: 40, column: 3, scope: !159)
!165 = !MDLocation(line: 43, column: 1, scope: !74)
!166 = !MDLocation(line: 66, column: 22, scope: !59)
!167 = !MDLocation(line: 66, column: 30, scope: !59)
!168 = !MDLocation(line: 66, column: 38, scope: !59)
!169 = !MDLocation(line: 73, column: 7, scope: !59)
!170 = !MDLocation(line: 77, column: 3, scope: !171)
!171 = !{!"0xb\0077\003\0014", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!172 = !MDLocation(line: 78, column: 5, scope: !173)
!173 = !{!"0xb\0078\005\0016", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!174 = !{!"0xb\0077\003\0015", !1, !171}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!175 = !MDLocation(line: 80, column: 2, scope: !176)
!176 = !{!"0xb\0079\007\0018", !1, !177}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!177 = !{!"0xb\0078\005\0017", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!178 = !MDLocation(line: 73, column: 13, scope: !59)
!179 = !MDLocation(line: 81, column: 2, scope: !180)
!180 = !{!"0xb\0081\002\0019", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!181 = !MDLocation(line: 82, column: 23, scope: !182)
!182 = !{!"0xb\0081\002\0020", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!183 = !MDLocation(line: 82, column: 15, scope: !182)
!184 = !MDLocation(line: 82, column: 33, scope: !182)
!185 = !MDLocation(line: 82, column: 4, scope: !182)
!186 = !MDLocation(line: 86, column: 1, scope: !59)
!187 = !MDLocation(line: 49, column: 22, scope: !47)
!188 = !MDLocation(line: 49, column: 30, scope: !47)
!189 = !MDLocation(line: 52, column: 7, scope: !47)
!190 = !MDLocation(line: 54, column: 3, scope: !191)
!191 = !{!"0xb\0054\003\008", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!192 = !MDLocation(line: 57, column: 7, scope: !193)
!193 = !{!"0xb\0057\006\0013", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!194 = !{!"0xb\0055\0030\0012", !1, !195}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!195 = !{!"0xb\0055\005\0011", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!196 = !{!"0xb\0055\005\0010", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!197 = !{!"0xb\0054\003\009", !1, !191}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!198 = !MDLocation(line: 55, column: 5, scope: !196)
!199 = !MDLocation(line: 56, column: 11, scope: !194)
!200 = !MDLocation(line: 56, column: 41, scope: !194)
!201 = !MDLocation(line: 56, column: 2, scope: !194)
!202 = !MDLocation(line: 57, column: 6, scope: !193)
!203 = !MDLocation(line: 57, column: 6, scope: !194)
!204 = !MDLocation(line: 57, column: 39, scope: !205)
!205 = !{!"0xb\001", !1, !193}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!206 = !MDLocation(line: 57, column: 30, scope: !193)
!207 = !MDLocation(line: 59, column: 12, scope: !47)
!208 = !MDLocation(line: 59, column: 3, scope: !47)
!209 = !MDLocation(line: 60, column: 1, scope: !47)
