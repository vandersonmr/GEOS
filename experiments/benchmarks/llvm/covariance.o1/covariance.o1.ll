; ModuleID = 'covariance.c'
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
  %float_n = alloca double, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !84), !dbg !85
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !84), !dbg !86
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !35, metadata !84), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !36, metadata !84), !dbg !88
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !89
  %call1 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !90
  %call2 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !91
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !92
  tail call void @llvm.dbg.value(metadata double* %float_n, i64 0, metadata !37, metadata !84), !dbg !93
  call fastcc void @init_array(double* %float_n, [1000 x double]* %arraydecay), !dbg !94
  tail call void @llvm.dbg.value(metadata double* %float_n, i64 0, metadata !37, metadata !84), !dbg !93
  %0 = load double* %float_n, align 8, !dbg !95, !tbaa !96
  %arraydecay4 = bitcast i8* %call1 to [1000 x double]*, !dbg !100
  %arraydecay5 = bitcast i8* %call2 to double*, !dbg !101
  tail call fastcc void @kernel_covariance(double %0, [1000 x double]* %arraydecay, [1000 x double]* %arraydecay4, double* %arraydecay5), !dbg !102
  %cmp = icmp sgt i32 %argc, 42, !dbg !103
  br i1 %cmp, label %if.end42, label %if.end49, !dbg !104

if.end42:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !84), !dbg !105
  tail call void @llvm.dbg.value(metadata i8* %1, i64 0, metadata !45, metadata !84), !dbg !106
  %1 = load i8** %argv, align 8, !dbg !107, !tbaa !109
  %2 = load i8* %1, align 1, !dbg !107, !tbaa !111
  %phitmp = icmp eq i8 %2, 0, !dbg !105
  br i1 %phitmp, label %if.then47, label %if.end49, !dbg !104

if.then47:                                        ; preds = %if.end42
  tail call fastcc void @print_array([1000 x double]* %arraydecay4), !dbg !112
  br label %if.end49, !dbg !112

if.end49:                                         ; preds = %if.end42, %if.then47, %entry
  tail call void @free(i8* %call) #4, !dbg !114
  tail call void @free(i8* %call1) #4, !dbg !115
  tail call void @free(i8* %call2) #4, !dbg !116
  ret i32 0, !dbg !117
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %float_n, [1000 x double]* nocapture %data) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !75, metadata !84), !dbg !118
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !84), !dbg !119
  store double 1.200000e+00, double* %float_n, align 8, !dbg !120, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !79, metadata !84), !dbg !121
  br label %for.cond1.preheader, !dbg !122

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc7 ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !124
  %conv = sitofp i32 %0 to double, !dbg !124
  br label %for.body3, !dbg !128

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !129
  %conv4 = sitofp i32 %1 to double, !dbg !129
  %mul = fmul double %conv, %conv4, !dbg !124
  %div = fdiv double %mul, 1.000000e+03, !dbg !130
  %arrayidx6 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv3, i64 %indvars.iv, !dbg !131
  store double %div, double* %arrayidx6, align 8, !dbg !131, !tbaa !96
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !128
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !128
  br i1 %exitcond, label %for.inc7, label %for.body3, !dbg !128

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !122
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000, !dbg !122
  br i1 %exitcond5, label %for.end9, label %for.cond1.preheader, !dbg !122

for.end9:                                         ; preds = %for.inc7
  ret void, !dbg !132
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_covariance(double %float_n, [1000 x double]* nocapture %data, [1000 x double]* nocapture %symmat, double* nocapture %mean) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !61, metadata !84), !dbg !133
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !62, metadata !84), !dbg !134
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !68, metadata !84), !dbg !135
  br label %for.body, !dbg !136

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.end ]
  %arrayidx = getelementptr inbounds double* %mean, i64 %indvars.iv27, !dbg !138
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !138, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !84), !dbg !141
  br label %for.body3, !dbg !142

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv24 = phi i64 [ 0, %for.body ], [ %indvars.iv.next25, %for.body3 ]
  %arrayidx7 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv24, i64 %indvars.iv27, !dbg !144
  %0 = load double* %arrayidx7, align 8, !dbg !144, !tbaa !96
  %1 = load double* %arrayidx, align 8, !dbg !146, !tbaa !96
  %add = fadd double %0, %1, !dbg !146
  store double %add, double* %arrayidx, align 8, !dbg !146, !tbaa !96
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !142
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1000, !dbg !142
  br i1 %exitcond26, label %for.end, label %for.body3, !dbg !142

for.end:                                          ; preds = %for.body3
  %2 = load double* %arrayidx, align 8, !dbg !147, !tbaa !96
  %div = fdiv double %2, %float_n, !dbg !147
  store double %div, double* %arrayidx, align 8, !dbg !147, !tbaa !96
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1, !dbg !136
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 1000, !dbg !136
  br i1 %exitcond29, label %for.cond18.preheader, label %for.body, !dbg !136

for.cond18.preheader:                             ; preds = %for.end, %for.inc30
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.inc30 ], [ 0, %for.end ]
  br label %for.body20, !dbg !148

for.body20:                                       ; preds = %for.body20, %for.cond18.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next19, %for.body20 ]
  %arrayidx22 = getelementptr inbounds double* %mean, i64 %indvars.iv18, !dbg !152
  %3 = load double* %arrayidx22, align 8, !dbg !152, !tbaa !96
  %arrayidx26 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv21, i64 %indvars.iv18, !dbg !154
  %4 = load double* %arrayidx26, align 8, !dbg !154, !tbaa !96
  %sub = fsub double %4, %3, !dbg !154
  store double %sub, double* %arrayidx26, align 8, !dbg !154, !tbaa !96
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !148
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1000, !dbg !148
  br i1 %exitcond20, label %for.inc30, label %for.body20, !dbg !148

for.inc30:                                        ; preds = %for.body20
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !155
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1000, !dbg !155
  br i1 %exitcond23, label %for.body38.lr.ph, label %for.cond18.preheader, !dbg !155

for.body38.lr.ph:                                 ; preds = %for.inc30, %for.inc73
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.inc73 ], [ 0, %for.inc30 ]
  br label %for.body38, !dbg !156

for.body38:                                       ; preds = %for.end61, %for.body38.lr.ph
  %indvars.iv11 = phi i64 [ %indvars.iv15, %for.body38.lr.ph ], [ %indvars.iv.next12, %for.end61 ]
  %arrayidx42 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv15, i64 %indvars.iv11, !dbg !160
  store double 0.000000e+00, double* %arrayidx42, align 8, !dbg !160, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !84), !dbg !141
  br label %for.body45, !dbg !163

for.body45:                                       ; preds = %for.body45, %for.body38
  %indvars.iv = phi i64 [ 0, %for.body38 ], [ %indvars.iv.next, %for.body45 ]
  %arrayidx49 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv, i64 %indvars.iv15, !dbg !165
  %5 = load double* %arrayidx49, align 8, !dbg !165, !tbaa !96
  %arrayidx53 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv, i64 %indvars.iv11, !dbg !167
  %6 = load double* %arrayidx53, align 8, !dbg !167, !tbaa !96
  %mul = fmul double %5, %6, !dbg !165
  %7 = load double* %arrayidx42, align 8, !dbg !168, !tbaa !96
  %add58 = fadd double %7, %mul, !dbg !168
  store double %add58, double* %arrayidx42, align 8, !dbg !168, !tbaa !96
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !163
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !163
  br i1 %exitcond, label %for.end61, label %for.body45, !dbg !163

for.end61:                                        ; preds = %for.body45
  %8 = load double* %arrayidx42, align 8, !dbg !169, !tbaa !96
  %arrayidx69 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv11, i64 %indvars.iv15, !dbg !170
  store double %8, double* %arrayidx69, align 8, !dbg !170, !tbaa !96
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !156
  %lftr.wideiv = trunc i64 %indvars.iv.next12 to i32, !dbg !156
  %exitcond13 = icmp eq i32 %lftr.wideiv, 1000, !dbg !156
  br i1 %exitcond13, label %for.inc73, label %for.body38, !dbg !156

for.inc73:                                        ; preds = %for.end61
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !171
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000, !dbg !171
  br i1 %exitcond17, label %for.end75, label %for.body38.lr.ph, !dbg !171

for.end75:                                        ; preds = %for.inc73
  ret void, !dbg !172
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly %symmat) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !52, metadata !84), !dbg !173
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !84), !dbg !174
  br label %for.cond1.preheader, !dbg !175

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = mul nsw i64 %indvars.iv7, 1000, !dbg !177
  br label %for.body3, !dbg !183

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !184, !tbaa !109
  %arrayidx5 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv7, i64 %indvars.iv, !dbg !185
  %2 = load double* %arrayidx5, align 8, !dbg !185, !tbaa !96
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !186
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !177
  %4 = trunc i64 %3 to i32, !dbg !187
  %rem = srem i32 %4, 20, !dbg !187
  %cmp6 = icmp eq i32 %rem, 0, !dbg !187
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !188

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !189, !tbaa !109
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !191
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !183
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !183
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !183

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !175
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000, !dbg !175
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !175

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !192, !tbaa !109
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !193
  ret void, !dbg !194
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
!llvm.module.flags = !{!81, !82}
!llvm.ident = !{!83}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c] [DW_LANG_C99]
!1 = !{!"covariance.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0064000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001000"}                        ; [ DW_TAG_subrange_type ] [0, 999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance"}
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
!24 = !{!25, !48, !56, !71}
!25 = !{!"0x2e\00main\00main\00\0095\000\001\000\000\00256\001\0096", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 95] [def] [scope 96] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777311\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 95]
!34 = !{!"0x101\00argv\0033554527\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 95]
!35 = !{!"0x100\00n\0098\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 98]
!36 = !{!"0x100\00m\0099\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [m] [line 99]
!37 = !{!"0x100\00float_n\00102\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [float_n] [line 102]
!38 = !{!"0x100\00data\00103\000", !25, !26, !4}  ; [ DW_TAG_auto_variable ] [data] [line 103]
!39 = !{!"0x100\00symmat\00104\000", !25, !26, !4} ; [ DW_TAG_auto_variable ] [symmat] [line 104]
!40 = !{!"0x100\00mean\00105\000", !25, !26, !9}  ; [ DW_TAG_auto_variable ] [mean] [line 105]
!41 = !{!"0x100\00__s1_len\00126\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 126]
!42 = !{!"0xb\00126\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!43 = !{!"0xb\00126\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!44 = !{!"0x100\00__s2_len\00126\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 126]
!45 = !{!"0x100\00__s2\00126\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 126]
!46 = !{!"0xb\00126\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!47 = !{!"0x100\00__result\00126\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 126]
!48 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\001\0043", !1, !26, !49, null, void ([1000 x double]*)* @print_array, null, null, !51} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !9}
!51 = !{!52, !53, !54, !55}
!52 = !{!"0x101\00m\0016777256\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 40]
!53 = !{!"0x101\00symmat\0033554473\000", !48, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 41]
!54 = !{!"0x100\00i\0044\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 44]
!55 = !{!"0x100\00j\0044\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 44]
!56 = !{!"0x2e\00kernel_covariance\00kernel_covariance\00\0058\001\001\000\000\00256\001\0063", !1, !26, !57, null, void (double, [1000 x double]*, [1000 x double]*, double*)* @kernel_covariance, null, null, !60} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 63] [kernel_covariance]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !29, !29, !6, !9, !9, !59}
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!61 = !{!"0x101\00m\0016777274\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 58]
!62 = !{!"0x101\00n\0033554490\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 58]
!63 = !{!"0x101\00float_n\0050331707\000", !56, !26, !6} ; [ DW_TAG_arg_variable ] [float_n] [line 59]
!64 = !{!"0x101\00data\0067108924\000", !56, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 60]
!65 = !{!"0x101\00symmat\0083886141\000", !56, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 61]
!66 = !{!"0x101\00mean\00100663358\000", !56, !26, !59} ; [ DW_TAG_arg_variable ] [mean] [line 62]
!67 = !{!"0x100\00i\0064\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 64]
!68 = !{!"0x100\00j\0064\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 64]
!69 = !{!"0x100\00j1\0064\000", !56, !26, !29}    ; [ DW_TAG_auto_variable ] [j1] [line 64]
!70 = !{!"0x100\00j2\0064\000", !56, !26, !29}    ; [ DW_TAG_auto_variable ] [j2] [line 64]
!71 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !72, null, void (double*, [1000 x double]*)* @init_array, null, null, !74} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{null, !29, !29, !59, !9}
!74 = !{!75, !76, !77, !78, !79, !80}
!75 = !{!"0x101\00m\0016777239\000", !71, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 23]
!76 = !{!"0x101\00n\0033554455\000", !71, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!77 = !{!"0x101\00float_n\0050331672\000", !71, !26, !59} ; [ DW_TAG_arg_variable ] [float_n] [line 24]
!78 = !{!"0x101\00data\0067108889\000", !71, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 25]
!79 = !{!"0x100\00i\0027\000", !71, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!80 = !{!"0x100\00j\0027\000", !71, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!81 = !{i32 2, !"Dwarf Version", i32 4}
!82 = !{i32 2, !"Debug Info Version", i32 2}
!83 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!84 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!85 = !MDLocation(line: 95, column: 14, scope: !25)
!86 = !MDLocation(line: 95, column: 27, scope: !25)
!87 = !MDLocation(line: 98, column: 7, scope: !25)
!88 = !MDLocation(line: 99, column: 7, scope: !25)
!89 = !MDLocation(line: 103, column: 3, scope: !25)
!90 = !MDLocation(line: 104, column: 3, scope: !25)
!91 = !MDLocation(line: 105, column: 3, scope: !25)
!92 = !MDLocation(line: 109, column: 31, scope: !25)
!93 = !MDLocation(line: 102, column: 13, scope: !25)
!94 = !MDLocation(line: 109, column: 3, scope: !25)
!95 = !MDLocation(line: 115, column: 28, scope: !25)
!96 = !{!97, !97, i64 0}
!97 = !{!"double", !98, i64 0}
!98 = !{!"omnipotent char", !99, i64 0}
!99 = !{!"Simple C/C++ TBAA"}
!100 = !MDLocation(line: 117, column: 8, scope: !25)
!101 = !MDLocation(line: 118, column: 8, scope: !25)
!102 = !MDLocation(line: 115, column: 3, scope: !25)
!103 = !MDLocation(line: 126, column: 3, scope: !43)
!104 = !MDLocation(line: 126, column: 3, scope: !25)
!105 = !MDLocation(line: 126, column: 3, scope: !42)
!106 = !MDLocation(line: 126, column: 3, scope: !46)
!107 = !MDLocation(line: 126, column: 3, scope: !108)
!108 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!109 = !{!110, !110, i64 0}
!110 = !{!"any pointer", !98, i64 0}
!111 = !{!98, !98, i64 0}
!112 = !MDLocation(line: 126, column: 3, scope: !113)
!113 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!114 = !MDLocation(line: 129, column: 3, scope: !25)
!115 = !MDLocation(line: 130, column: 3, scope: !25)
!116 = !MDLocation(line: 131, column: 3, scope: !25)
!117 = !MDLocation(line: 133, column: 3, scope: !25)
!118 = !MDLocation(line: 23, column: 22, scope: !71)
!119 = !MDLocation(line: 23, column: 29, scope: !71)
!120 = !MDLocation(line: 29, column: 3, scope: !71)
!121 = !MDLocation(line: 27, column: 7, scope: !71)
!122 = !MDLocation(line: 31, column: 3, scope: !123)
!123 = !{!"0xb\0031\003\0030", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!124 = !MDLocation(line: 33, column: 21, scope: !125)
!125 = !{!"0xb\0032\005\0033", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!126 = !{!"0xb\0032\005\0032", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!127 = !{!"0xb\0031\003\0031", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!128 = !MDLocation(line: 32, column: 5, scope: !126)
!129 = !MDLocation(line: 33, column: 35, scope: !125)
!130 = !MDLocation(line: 33, column: 20, scope: !125)
!131 = !MDLocation(line: 33, column: 7, scope: !125)
!132 = !MDLocation(line: 34, column: 1, scope: !71)
!133 = !MDLocation(line: 58, column: 28, scope: !56)
!134 = !MDLocation(line: 58, column: 35, scope: !56)
!135 = !MDLocation(line: 64, column: 10, scope: !56)
!136 = !MDLocation(line: 68, column: 3, scope: !137)
!137 = !{!"0xb\0068\003\0014", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!138 = !MDLocation(line: 70, column: 7, scope: !139)
!139 = !{!"0xb\0069\005\0016", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!140 = !{!"0xb\0068\003\0015", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!141 = !MDLocation(line: 64, column: 7, scope: !56)
!142 = !MDLocation(line: 71, column: 7, scope: !143)
!143 = !{!"0xb\0071\007\0017", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!144 = !MDLocation(line: 72, column: 20, scope: !145)
!145 = !{!"0xb\0071\007\0018", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!146 = !MDLocation(line: 72, column: 9, scope: !145)
!147 = !MDLocation(line: 73, column: 7, scope: !139)
!148 = !MDLocation(line: 78, column: 5, scope: !149)
!149 = !{!"0xb\0078\005\0021", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!150 = !{!"0xb\0077\003\0020", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!151 = !{!"0xb\0077\003\0019", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!152 = !MDLocation(line: 79, column: 21, scope: !153)
!153 = !{!"0xb\0078\005\0022", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!154 = !MDLocation(line: 79, column: 7, scope: !153)
!155 = !MDLocation(line: 77, column: 3, scope: !151)
!156 = !MDLocation(line: 83, column: 5, scope: !157)
!157 = !{!"0xb\0083\005\0025", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!158 = !{!"0xb\0082\003\0024", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!159 = !{!"0xb\0082\003\0023", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!160 = !MDLocation(line: 85, column: 9, scope: !161)
!161 = !{!"0xb\0084\007\0027", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!162 = !{!"0xb\0083\005\0026", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!163 = !MDLocation(line: 86, column: 9, scope: !164)
!164 = !{!"0xb\0086\009\0028", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!165 = !MDLocation(line: 87, column: 22, scope: !166)
!166 = !{!"0xb\0086\009\0029", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!167 = !MDLocation(line: 87, column: 36, scope: !166)
!168 = !MDLocation(line: 87, column: 4, scope: !166)
!169 = !MDLocation(line: 88, column: 26, scope: !161)
!170 = !MDLocation(line: 88, column: 9, scope: !161)
!171 = !MDLocation(line: 82, column: 3, scope: !159)
!172 = !MDLocation(line: 92, column: 1, scope: !56)
!173 = !MDLocation(line: 40, column: 22, scope: !48)
!174 = !MDLocation(line: 44, column: 7, scope: !48)
!175 = !MDLocation(line: 46, column: 3, scope: !176)
!176 = !{!"0xb\0046\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!177 = !MDLocation(line: 49, column: 12, scope: !178)
!178 = !{!"0xb\0049\0011\0013", !1, !179}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!179 = !{!"0xb\0047\0029\0012", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!180 = !{!"0xb\0047\005\0011", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!181 = !{!"0xb\0047\005\0010", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!182 = !{!"0xb\0046\003\009", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!183 = !MDLocation(line: 47, column: 5, scope: !181)
!184 = !MDLocation(line: 48, column: 16, scope: !179)
!185 = !MDLocation(line: 48, column: 46, scope: !179)
!186 = !MDLocation(line: 48, column: 7, scope: !179)
!187 = !MDLocation(line: 49, column: 11, scope: !178)
!188 = !MDLocation(line: 49, column: 11, scope: !179)
!189 = !MDLocation(line: 49, column: 43, scope: !190)
!190 = !{!"0xb\001", !1, !178}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!191 = !MDLocation(line: 49, column: 34, scope: !178)
!192 = !MDLocation(line: 51, column: 12, scope: !48)
!193 = !MDLocation(line: 51, column: 3, scope: !48)
!194 = !MDLocation(line: 52, column: 1, scope: !48)
