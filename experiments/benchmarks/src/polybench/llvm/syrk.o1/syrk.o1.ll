; ModuleID = 'syrk.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !85), !dbg !86
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !85), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !85), !dbg !88
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !85), !dbg !89
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !90
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !91
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !92
  %arraydecay2 = bitcast i8* %call1 to [1024 x double]*, !dbg !93
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !34, metadata !85), !dbg !94
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !35, metadata !85), !dbg !95
  call fastcc void @init_array(double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay2), !dbg !96
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !34, metadata !85), !dbg !94
  %0 = load double* %alpha, align 8, !dbg !97, !tbaa !98
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !35, metadata !85), !dbg !95
  %1 = load double* %beta, align 8, !dbg !102, !tbaa !98
  tail call fastcc void @kernel_syrk(double %0, double %1, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay2), !dbg !103
  %cmp = icmp sgt i32 %argc, 42, !dbg !104
  br i1 %cmp, label %if.end41, label %if.end48, !dbg !105

if.end41:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !85), !dbg !106
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !42, metadata !85), !dbg !107
  %2 = load i8** %argv, align 8, !dbg !108, !tbaa !110
  %3 = load i8* %2, align 1, !dbg !108, !tbaa !112
  %phitmp = icmp eq i8 %3, 0, !dbg !106
  br i1 %phitmp, label %if.then46, label %if.end48, !dbg !105

if.then46:                                        ; preds = %if.end41
  tail call fastcc void @print_array([1024 x double]* %arraydecay), !dbg !113
  br label %if.end48, !dbg !113

if.end48:                                         ; preds = %if.end41, %if.then46, %entry
  tail call void @free(i8* %call) #4, !dbg !115
  tail call void @free(i8* %call1) #4, !dbg !116
  ret i32 0, !dbg !117
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !74, metadata !85), !dbg !118
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !75, metadata !85), !dbg !119
  store double 3.241200e+04, double* %alpha, align 8, !dbg !120, !tbaa !98
  store double 2.123000e+03, double* %beta, align 8, !dbg !121, !tbaa !98
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !80, metadata !85), !dbg !122
  br label %for.cond1.preheader, !dbg !123

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc8 ]
  %0 = trunc i64 %indvars.iv11 to i32, !dbg !125
  %conv = sitofp i32 %0 to double, !dbg !125
  br label %for.body3, !dbg !129

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next9, %for.body3 ]
  %1 = trunc i64 %indvars.iv8 to i32, !dbg !130
  %conv4 = sitofp i32 %1 to double, !dbg !130
  %mul = fmul double %conv, %conv4, !dbg !125
  %div = fmul double %mul, 9.765625e-04, !dbg !131
  %arrayidx7 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !132
  store double %div, double* %arrayidx7, align 8, !dbg !132, !tbaa !98
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !129
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1024, !dbg !129
  br i1 %exitcond10, label %for.inc8, label %for.body3, !dbg !129

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !123
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1024, !dbg !123
  br i1 %exitcond13, label %for.cond15.preheader, label %for.cond1.preheader, !dbg !123

for.cond15.preheader:                             ; preds = %for.inc8, %for.inc31
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc31 ], [ 0, %for.inc8 ]
  %2 = trunc i64 %indvars.iv5 to i32, !dbg !133
  %conv19 = sitofp i32 %2 to double, !dbg !133
  br label %for.body18, !dbg !138

for.body18:                                       ; preds = %for.body18, %for.cond15.preheader
  %indvars.iv = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next, %for.body18 ]
  %3 = trunc i64 %indvars.iv to i32, !dbg !139
  %conv20 = sitofp i32 %3 to double, !dbg !139
  %mul21 = fmul double %conv19, %conv20, !dbg !133
  %div23 = fmul double %mul21, 9.765625e-04, !dbg !140
  %arrayidx27 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv, !dbg !141
  store double %div23, double* %arrayidx27, align 8, !dbg !141, !tbaa !98
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !138
  br i1 %exitcond, label %for.inc31, label %for.body18, !dbg !138

for.inc31:                                        ; preds = %for.body18
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !142
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1024, !dbg !142
  br i1 %exitcond7, label %for.end33, label %for.cond15.preheader, !dbg !142

for.end33:                                        ; preds = %for.inc31
  ret void, !dbg !143
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1024 x double]* nocapture %C, [1024 x double]* nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !60, metadata !85), !dbg !144
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !61, metadata !85), !dbg !145
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !66, metadata !85), !dbg !146
  br label %for.cond1.preheader, !dbg !147

for.cond1.preheader:                              ; preds = %for.inc6, %entry
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.inc6 ]
  br label %for.body3, !dbg !149

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next13, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv15, i64 %indvars.iv12, !dbg !152
  %0 = load double* %arrayidx5, align 8, !dbg !152, !tbaa !98
  %mul = fmul double %0, %beta, !dbg !152
  store double %mul, double* %arrayidx5, align 8, !dbg !152, !tbaa !98
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !149
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1024, !dbg !149
  br i1 %exitcond14, label %for.inc6, label %for.body3, !dbg !149

for.inc6:                                         ; preds = %for.body3
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !147
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1024, !dbg !147
  br i1 %exitcond17, label %for.cond12.preheader, label %for.cond1.preheader, !dbg !147

for.cond12.preheader:                             ; preds = %for.inc6, %for.inc38
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc38 ], [ 0, %for.inc6 ]
  br label %for.cond15.preheader, !dbg !154

for.cond15.preheader:                             ; preds = %for.inc35, %for.cond12.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next7, %for.inc35 ]
  %arrayidx31 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !158
  br label %for.body17, !dbg !162

for.body17:                                       ; preds = %for.body17, %for.cond15.preheader
  %indvars.iv = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next, %for.body17 ]
  %arrayidx21 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv, !dbg !163
  %1 = load double* %arrayidx21, align 8, !dbg !163, !tbaa !98
  %mul22 = fmul double %1, %alpha, !dbg !164
  %arrayidx26 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv, !dbg !165
  %2 = load double* %arrayidx26, align 8, !dbg !165, !tbaa !98
  %mul27 = fmul double %mul22, %2, !dbg !164
  %3 = load double* %arrayidx31, align 8, !dbg !158, !tbaa !98
  %add = fadd double %3, %mul27, !dbg !158
  store double %add, double* %arrayidx31, align 8, !dbg !158, !tbaa !98
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !162
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !162
  br i1 %exitcond, label %for.inc35, label %for.body17, !dbg !162

for.inc35:                                        ; preds = %for.body17
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !154
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !154
  br i1 %exitcond8, label %for.inc38, label %for.cond15.preheader, !dbg !154

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !166
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1024, !dbg !166
  br i1 %exitcond11, label %for.end40, label %for.cond12.preheader, !dbg !166

for.end40:                                        ; preds = %for.inc38
  ret void, !dbg !167
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %C) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !52, metadata !85), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !85), !dbg !169
  br label %for.cond1.preheader, !dbg !170

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !172
  br label %for.body3, !dbg !178

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !179, !tbaa !110
  %arrayidx5 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv, !dbg !180
  %2 = load double* %arrayidx5, align 8, !dbg !180, !tbaa !98
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !181
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !172
  %4 = trunc i64 %3 to i32, !dbg !182
  %rem = srem i32 %4, 20, !dbg !182
  %cmp6 = icmp eq i32 %rem, 0, !dbg !182
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !183

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !184, !tbaa !110
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !186
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !178
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !178
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !178

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !170
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !170
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !170

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !187, !tbaa !110
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !188
  ret void, !dbg !189
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c] [DW_LANG_C99]
!1 = !{!"syrk.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk"}
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
!21 = !{!22, !45, !56, !69}
!22 = !{!"0x2e\00main\00main\00\0084\000\001\000\000\00256\001\0085", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 84] [def] [scope 85] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !41, !42, !44}
!30 = !{!"0x101\00argc\0016777300\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 84]
!31 = !{!"0x101\00argv\0033554516\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 84]
!32 = !{!"0x100\00ni\0087\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 87]
!33 = !{!"0x100\00nj\0088\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 88]
!34 = !{!"0x100\00alpha\0091\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 91]
!35 = !{!"0x100\00beta\0092\000", !22, !23, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 92]
!36 = !{!"0x100\00C\0093\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [C] [line 93]
!37 = !{!"0x100\00A\0094\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 94]
!38 = !{!"0x100\00__s1_len\00111\000", !39, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 111]
!39 = !{!"0xb\00111\003\001", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!40 = !{!"0xb\00111\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!41 = !{!"0x100\00__s2_len\00111\000", !39, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 111]
!42 = !{!"0x100\00__s2\00111\000", !43, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 111]
!43 = !{!"0xb\00111\003\002", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!44 = !{!"0x100\00__result\00111\000", !43, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 111]
!45 = !{!"0x2e\00print_array\00print_array\00\0045\001\001\000\000\00256\001\0047", !1, !23, !46, null, void ([1024 x double]*)* @print_array, null, null, !51} ; [ DW_TAG_subprogram ] [line 45] [local] [def] [scope 47] [print_array]
!46 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !47, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = !{null, !26, !48}
!48 = !{!"0xf\00\000\0064\0064\000\000", null, null, !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!49 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !50, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!50 = !{!8}
!51 = !{!52, !53, !54, !55}
!52 = !{!"0x101\00ni\0016777261\000", !45, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 45]
!53 = !{!"0x101\00C\0033554478\000", !45, !23, !48} ; [ DW_TAG_arg_variable ] [C] [line 46]
!54 = !{!"0x100\00i\0048\000", !45, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 48]
!55 = !{!"0x100\00j\0048\000", !45, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 48]
!56 = !{!"0x2e\00kernel_syrk\00kernel_syrk\00\0062\001\001\000\000\00256\001\0067", !1, !23, !57, null, void (double, double, [1024 x double]*, [1024 x double]*)* @kernel_syrk, null, null, !59} ; [ DW_TAG_subprogram ] [line 62] [local] [def] [scope 67] [kernel_syrk]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !26, !26, !6, !6, !48, !48}
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67, !68}
!60 = !{!"0x101\00ni\0016777278\000", !56, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 62]
!61 = !{!"0x101\00nj\0033554494\000", !56, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 62]
!62 = !{!"0x101\00alpha\0050331711\000", !56, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 63]
!63 = !{!"0x101\00beta\0067108928\000", !56, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 64]
!64 = !{!"0x101\00C\0083886145\000", !56, !23, !48} ; [ DW_TAG_arg_variable ] [C] [line 65]
!65 = !{!"0x101\00A\00100663362\000", !56, !23, !48} ; [ DW_TAG_arg_variable ] [A] [line 66]
!66 = !{!"0x100\00i\0068\000", !56, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 68]
!67 = !{!"0x100\00j\0068\000", !56, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 68]
!68 = !{!"0x100\00k\0068\000", !56, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 68]
!69 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0028", !1, !23, !70, null, void (double*, double*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !73} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 28] [init_array]
!70 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !71, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = !{null, !26, !26, !72, !72, !48, !48}
!72 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!73 = !{!74, !75, !76, !77, !78, !79, !80, !81}
!74 = !{!"0x101\00ni\0016777239\000", !69, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!75 = !{!"0x101\00nj\0033554455\000", !69, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!76 = !{!"0x101\00alpha\0050331672\000", !69, !23, !72} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!77 = !{!"0x101\00beta\0067108889\000", !69, !23, !72} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!78 = !{!"0x101\00C\0083886106\000", !69, !23, !48} ; [ DW_TAG_arg_variable ] [C] [line 26]
!79 = !{!"0x101\00A\00100663323\000", !69, !23, !48} ; [ DW_TAG_arg_variable ] [A] [line 27]
!80 = !{!"0x100\00i\0029\000", !69, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 29]
!81 = !{!"0x100\00j\0029\000", !69, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 29]
!82 = !{i32 2, !"Dwarf Version", i32 4}
!83 = !{i32 2, !"Debug Info Version", i32 2}
!84 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!85 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!86 = !MDLocation(line: 84, column: 14, scope: !22)
!87 = !MDLocation(line: 84, column: 27, scope: !22)
!88 = !MDLocation(line: 87, column: 7, scope: !22)
!89 = !MDLocation(line: 88, column: 7, scope: !22)
!90 = !MDLocation(line: 93, column: 3, scope: !22)
!91 = !MDLocation(line: 94, column: 3, scope: !22)
!92 = !MDLocation(line: 97, column: 38, scope: !22)
!93 = !MDLocation(line: 97, column: 58, scope: !22)
!94 = !MDLocation(line: 91, column: 13, scope: !22)
!95 = !MDLocation(line: 92, column: 13, scope: !22)
!96 = !MDLocation(line: 97, column: 3, scope: !22)
!97 = !MDLocation(line: 103, column: 24, scope: !22)
!98 = !{!99, !99, i64 0}
!99 = !{!"double", !100, i64 0}
!100 = !{!"omnipotent char", !101, i64 0}
!101 = !{!"Simple C/C++ TBAA"}
!102 = !MDLocation(line: 103, column: 31, scope: !22)
!103 = !MDLocation(line: 103, column: 3, scope: !22)
!104 = !MDLocation(line: 111, column: 3, scope: !40)
!105 = !MDLocation(line: 111, column: 3, scope: !22)
!106 = !MDLocation(line: 111, column: 3, scope: !39)
!107 = !MDLocation(line: 111, column: 3, scope: !43)
!108 = !MDLocation(line: 111, column: 3, scope: !109)
!109 = !{!"0xb\004", !1, !43}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!110 = !{!111, !111, i64 0}
!111 = !{!"any pointer", !100, i64 0}
!112 = !{!100, !100, i64 0}
!113 = !MDLocation(line: 111, column: 3, scope: !114)
!114 = !{!"0xb\0023", !1, !40}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!115 = !MDLocation(line: 114, column: 3, scope: !22)
!116 = !MDLocation(line: 115, column: 3, scope: !22)
!117 = !MDLocation(line: 117, column: 3, scope: !22)
!118 = !MDLocation(line: 23, column: 21, scope: !69)
!119 = !MDLocation(line: 23, column: 29, scope: !69)
!120 = !MDLocation(line: 31, column: 3, scope: !69)
!121 = !MDLocation(line: 32, column: 3, scope: !69)
!122 = !MDLocation(line: 29, column: 7, scope: !69)
!123 = !MDLocation(line: 33, column: 3, scope: !124)
!124 = !{!"0xb\0033\003\0024", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!125 = !MDLocation(line: 35, column: 18, scope: !126)
!126 = !{!"0xb\0034\005\0027", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!127 = !{!"0xb\0034\005\0026", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!128 = !{!"0xb\0033\003\0025", !1, !124}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!129 = !MDLocation(line: 34, column: 5, scope: !127)
!130 = !MDLocation(line: 35, column: 32, scope: !126)
!131 = !MDLocation(line: 35, column: 17, scope: !126)
!132 = !MDLocation(line: 35, column: 7, scope: !126)
!133 = !MDLocation(line: 38, column: 18, scope: !134)
!134 = !{!"0xb\0037\005\0031", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!135 = !{!"0xb\0037\005\0030", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!136 = !{!"0xb\0036\003\0029", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!137 = !{!"0xb\0036\003\0028", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!138 = !MDLocation(line: 37, column: 5, scope: !135)
!139 = !MDLocation(line: 38, column: 32, scope: !134)
!140 = !MDLocation(line: 38, column: 17, scope: !134)
!141 = !MDLocation(line: 38, column: 7, scope: !134)
!142 = !MDLocation(line: 36, column: 3, scope: !137)
!143 = !MDLocation(line: 39, column: 1, scope: !69)
!144 = !MDLocation(line: 62, column: 22, scope: !56)
!145 = !MDLocation(line: 62, column: 30, scope: !56)
!146 = !MDLocation(line: 68, column: 7, scope: !56)
!147 = !MDLocation(line: 72, column: 3, scope: !148)
!148 = !{!"0xb\0072\003\0014", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!149 = !MDLocation(line: 73, column: 5, scope: !150)
!150 = !{!"0xb\0073\005\0016", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!151 = !{!"0xb\0072\003\0015", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!152 = !MDLocation(line: 74, column: 7, scope: !153)
!153 = !{!"0xb\0073\005\0017", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!154 = !MDLocation(line: 76, column: 5, scope: !155)
!155 = !{!"0xb\0076\005\0020", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!156 = !{!"0xb\0075\003\0019", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!157 = !{!"0xb\0075\003\0018", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!158 = !MDLocation(line: 78, column: 4, scope: !159)
!159 = !{!"0xb\0077\007\0023", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!160 = !{!"0xb\0077\007\0022", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!161 = !{!"0xb\0076\005\0021", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!162 = !MDLocation(line: 77, column: 7, scope: !160)
!163 = !MDLocation(line: 78, column: 23, scope: !159)
!164 = !MDLocation(line: 78, column: 15, scope: !159)
!165 = !MDLocation(line: 78, column: 33, scope: !159)
!166 = !MDLocation(line: 75, column: 3, scope: !157)
!167 = !MDLocation(line: 81, column: 1, scope: !56)
!168 = !MDLocation(line: 45, column: 22, scope: !45)
!169 = !MDLocation(line: 48, column: 7, scope: !45)
!170 = !MDLocation(line: 50, column: 3, scope: !171)
!171 = !{!"0xb\0050\003\008", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!172 = !MDLocation(line: 53, column: 7, scope: !173)
!173 = !{!"0xb\0053\006\0013", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!174 = !{!"0xb\0051\0030\0012", !1, !175}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!175 = !{!"0xb\0051\005\0011", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!176 = !{!"0xb\0051\005\0010", !1, !177}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!177 = !{!"0xb\0050\003\009", !1, !171}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!178 = !MDLocation(line: 51, column: 5, scope: !176)
!179 = !MDLocation(line: 52, column: 11, scope: !174)
!180 = !MDLocation(line: 52, column: 41, scope: !174)
!181 = !MDLocation(line: 52, column: 2, scope: !174)
!182 = !MDLocation(line: 53, column: 6, scope: !173)
!183 = !MDLocation(line: 53, column: 6, scope: !174)
!184 = !MDLocation(line: 53, column: 39, scope: !185)
!185 = !{!"0xb\001", !1, !173}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!186 = !MDLocation(line: 53, column: 30, scope: !173)
!187 = !MDLocation(line: 55, column: 12, scope: !45)
!188 = !MDLocation(line: 55, column: 3, scope: !45)
!189 = !MDLocation(line: 56, column: 1, scope: !45)
