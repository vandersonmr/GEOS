; ModuleID = 'bicg.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !86), !dbg !87
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !86), !dbg !88
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !86), !dbg !89
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !36, metadata !86), !dbg !90
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !91
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !92
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !93
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !94
  %call4 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !95
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !96
  %arraydecay5 = bitcast i8* %call4 to double*, !dbg !97
  %arraydecay6 = bitcast i8* %call3 to double*, !dbg !98
  tail call fastcc void @init_array([4000 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6), !dbg !99
  %arraydecay8 = bitcast i8* %call1 to double*, !dbg !100
  %arraydecay9 = bitcast i8* %call2 to double*, !dbg !101
  tail call fastcc void @kernel_bicg([4000 x double]* %arraydecay, double* %arraydecay8, double* %arraydecay9, double* %arraydecay6, double* %arraydecay5), !dbg !102
  %cmp = icmp sgt i32 %argc, 42, !dbg !103
  br i1 %cmp, label %if.end48, label %if.end56, !dbg !104

if.end48:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !86), !dbg !105
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !46, metadata !86), !dbg !106
  %0 = load i8** %argv, align 8, !dbg !107, !tbaa !109
  %1 = load i8* %0, align 1, !dbg !107, !tbaa !113
  %phitmp = icmp eq i8 %1, 0, !dbg !105
  br i1 %phitmp, label %if.then53, label %if.end56, !dbg !104

if.then53:                                        ; preds = %if.end48
  tail call fastcc void @print_array(double* %arraydecay8, double* %arraydecay9), !dbg !114
  br label %if.end56, !dbg !114

if.end56:                                         ; preds = %if.end48, %if.then53, %entry
  tail call void @free(i8* %call) #4, !dbg !116
  tail call void @free(i8* %call1) #4, !dbg !117
  tail call void @free(i8* %call2) #4, !dbg !118
  tail call void @free(i8* %call3) #4, !dbg !119
  tail call void @free(i8* %call4) #4, !dbg !120
  ret i32 0, !dbg !121
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([4000 x double]* nocapture %A, double* nocapture %r, double* nocapture %p) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !76, metadata !86), !dbg !122
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !77, metadata !86), !dbg !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !81, metadata !86), !dbg !124
  br label %for.body, !dbg !125

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.body ]
  %0 = trunc i64 %indvars.iv7 to i32, !dbg !127
  %conv = sitofp i32 %0 to double, !dbg !127
  %mul = fmul double %conv, 0x400921FB54442D18, !dbg !127
  %arrayidx = getelementptr inbounds double* %p, i64 %indvars.iv7, !dbg !129
  store double %mul, double* %arrayidx, align 8, !dbg !129, !tbaa !130
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !125
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 4000, !dbg !125
  br i1 %exitcond9, label %for.body4, label %for.body, !dbg !125

for.body4:                                        ; preds = %for.body, %for.inc24
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc24 ], [ 0, %for.body ]
  %1 = trunc i64 %indvars.iv4 to i32, !dbg !132
  %conv5 = sitofp i32 %1 to double, !dbg !132
  %mul6 = fmul double %conv5, 0x400921FB54442D18, !dbg !132
  %arrayidx8 = getelementptr inbounds double* %r, i64 %indvars.iv4, !dbg !136
  store double %mul6, double* %arrayidx8, align 8, !dbg !136, !tbaa !130
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !82, metadata !86), !dbg !137
  br label %for.body12, !dbg !138

for.body12:                                       ; preds = %for.body12, %for.body4
  %indvars.iv = phi i64 [ 0, %for.body4 ], [ %indvars.iv.next, %for.body12 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !140
  %conv14 = sitofp i32 %2 to double, !dbg !140
  %mul15 = fmul double %conv5, %conv14, !dbg !142
  %div = fdiv double %mul15, 4.000000e+03, !dbg !143
  %arrayidx20 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv, !dbg !144
  store double %div, double* %arrayidx20, align 8, !dbg !144, !tbaa !130
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !138
  br i1 %exitcond, label %for.inc24, label %for.body12, !dbg !138

for.inc24:                                        ; preds = %for.body12
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !145
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 4000, !dbg !145
  br i1 %exitcond6, label %for.end26, label %for.body4, !dbg !145

for.end26:                                        ; preds = %for.inc24
  ret void, !dbg !146
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_bicg([4000 x double]* nocapture readonly %A, double* nocapture %s, double* nocapture %q, double* nocapture readonly %p, double* nocapture readonly %r) #0 {
for.cond1.preheader:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !63, metadata !86), !dbg !147
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !64, metadata !86), !dbg !148
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !86), !dbg !149
  %s11 = bitcast double* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %s11, i8 0, i64 32000, i32 8, i1 false), !dbg !150
  br label %for.body3, !dbg !153

for.body3:                                        ; preds = %for.inc34, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc34 ]
  %arrayidx5 = getelementptr inbounds double* %q, i64 %indvars.iv4, !dbg !155
  store double 0.000000e+00, double* %arrayidx5, align 8, !dbg !155, !tbaa !130
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !86), !dbg !158
  %arrayidx12 = getelementptr inbounds double* %r, i64 %indvars.iv4, !dbg !159
  br label %for.body8, !dbg !163

for.body8:                                        ; preds = %for.body8, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx10 = getelementptr inbounds double* %s, i64 %indvars.iv, !dbg !164
  %0 = load double* %arrayidx10, align 8, !dbg !164, !tbaa !130
  %1 = load double* %arrayidx12, align 8, !dbg !159, !tbaa !130
  %arrayidx16 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv, !dbg !165
  %2 = load double* %arrayidx16, align 8, !dbg !165, !tbaa !130
  %mul = fmul double %1, %2, !dbg !159
  %add = fadd double %0, %mul, !dbg !164
  store double %add, double* %arrayidx10, align 8, !dbg !166, !tbaa !130
  %3 = load double* %arrayidx5, align 8, !dbg !167, !tbaa !130
  %4 = load double* %arrayidx16, align 8, !dbg !168, !tbaa !130
  %arrayidx26 = getelementptr inbounds double* %p, i64 %indvars.iv, !dbg !169
  %5 = load double* %arrayidx26, align 8, !dbg !169, !tbaa !130
  %mul27 = fmul double %4, %5, !dbg !168
  %add28 = fadd double %3, %mul27, !dbg !167
  store double %add28, double* %arrayidx5, align 8, !dbg !170, !tbaa !130
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !163
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !163
  br i1 %exitcond, label %for.inc34, label %for.body8, !dbg !163

for.inc34:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !153
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 4000, !dbg !153
  br i1 %exitcond6, label %for.end36, label %for.body3, !dbg !153

for.end36:                                        ; preds = %for.inc34
  ret void, !dbg !171
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %s, double* nocapture readonly %q) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !54, metadata !86), !dbg !172
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !55, metadata !86), !dbg !173
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !58, metadata !86), !dbg !174
  br label %for.body, !dbg !175

for.cond3.preheader:                              ; preds = %for.inc
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !177, !tbaa !109
  br label %for.body5, !dbg !181

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv9 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !182, !tbaa !109
  %arrayidx = getelementptr inbounds double* %s, i64 %indvars.iv9, !dbg !185
  %2 = load double* %arrayidx, align 8, !dbg !185, !tbaa !130
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !186
  %3 = trunc i64 %indvars.iv9 to i32, !dbg !187
  %rem = srem i32 %3, 20, !dbg !187
  %cmp1 = icmp eq i32 %rem, 0, !dbg !187
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !189

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !190, !tbaa !109
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6, !dbg !192
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !175
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 4000, !dbg !175
  br i1 %exitcond11, label %for.cond3.preheader, label %for.body, !dbg !175

for.body5:                                        ; preds = %for.inc14, %for.cond3.preheader
  %indvars.iv = phi i64 [ 0, %for.cond3.preheader ], [ %indvars.iv.next, %for.inc14 ]
  %5 = phi %struct._IO_FILE* [ %0, %for.cond3.preheader ], [ %9, %for.inc14 ]
  %arrayidx7 = getelementptr inbounds double* %q, i64 %indvars.iv, !dbg !193
  %6 = load double* %arrayidx7, align 8, !dbg !193, !tbaa !130
  %call8 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %6) #5, !dbg !194
  %7 = trunc i64 %indvars.iv to i32, !dbg !195
  %rem9 = srem i32 %7, 20, !dbg !195
  %cmp10 = icmp eq i32 %rem9, 0, !dbg !195
  br i1 %cmp10, label %if.then11, label %for.inc14, !dbg !197

if.then11:                                        ; preds = %for.body5
  %8 = load %struct._IO_FILE** @stderr, align 8, !dbg !198, !tbaa !109
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6, !dbg !200
  br label %for.inc14, !dbg !200

for.inc14:                                        ; preds = %for.body5, %if.then11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !181
  %9 = load %struct._IO_FILE** @stderr, align 8, !dbg !177, !tbaa !109
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !181
  br i1 %exitcond, label %for.end16, label %for.body5, !dbg !181

for.end16:                                        ; preds = %for.inc14
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6, !dbg !201
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

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!83, !84}
!llvm.ident = !{!85}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c] [DW_LANG_C99]
!1 = !{!"bicg.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg"}
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
!24 = !{!25, !49, !59, !72}
!25 = !{!"0x2e\00main\00main\00\0091\000\001\000\000\00256\001\0092", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 91] [def] [scope 92] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !46, !48}
!33 = !{!"0x101\00argc\0016777307\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 91]
!34 = !{!"0x101\00argv\0033554523\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 91]
!35 = !{!"0x100\00nx\0094\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nx] [line 94]
!36 = !{!"0x100\00ny\0095\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [ny] [line 95]
!37 = !{!"0x100\00A\0098\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 98]
!38 = !{!"0x100\00s\0099\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [s] [line 99]
!39 = !{!"0x100\00q\00100\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [q] [line 100]
!40 = !{!"0x100\00p\00101\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [p] [line 101]
!41 = !{!"0x100\00r\00102\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [r] [line 102]
!42 = !{!"0x100\00__s1_len\00127\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 127]
!43 = !{!"0xb\00127\003\001", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!44 = !{!"0xb\00127\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!45 = !{!"0x100\00__s2_len\00127\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 127]
!46 = !{!"0x100\00__s2\00127\000", !47, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 127]
!47 = !{!"0xb\00127\003\002", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!48 = !{!"0x100\00__result\00127\000", !47, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 127]
!49 = !{!"0x2e\00print_array\00print_array\00\0043\001\001\000\000\00256\001\0047", !1, !26, !50, null, void (double*, double*)* @print_array, null, null, !53} ; [ DW_TAG_subprogram ] [line 43] [local] [def] [scope 47] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !29, !52, !52}
!52 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00nx\0016777259\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 43]
!55 = !{!"0x101\00ny\0033554475\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 43]
!56 = !{!"0x101\00s\0050331692\000", !49, !26, !52} ; [ DW_TAG_arg_variable ] [s] [line 44]
!57 = !{!"0x101\00q\0067108909\000", !49, !26, !52} ; [ DW_TAG_arg_variable ] [q] [line 45]
!58 = !{!"0x100\00i\0048\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 48]
!59 = !{!"0x2e\00kernel_bicg\00kernel_bicg\00\0065\001\001\000\000\00256\001\0071", !1, !26, !60, null, void ([4000 x double]*, double*, double*, double*, double*)* @kernel_bicg, null, null, !62} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_bicg]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{null, !29, !29, !9, !52, !52, !52, !52}
!62 = !{!63, !64, !65, !66, !67, !68, !69, !70, !71}
!63 = !{!"0x101\00nx\0016777281\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 65]
!64 = !{!"0x101\00ny\0033554497\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 65]
!65 = !{!"0x101\00A\0050331714\000", !59, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 66]
!66 = !{!"0x101\00s\0067108931\000", !59, !26, !52} ; [ DW_TAG_arg_variable ] [s] [line 67]
!67 = !{!"0x101\00q\0083886148\000", !59, !26, !52} ; [ DW_TAG_arg_variable ] [q] [line 68]
!68 = !{!"0x101\00p\00100663365\000", !59, !26, !52} ; [ DW_TAG_arg_variable ] [p] [line 69]
!69 = !{!"0x101\00r\00117440582\000", !59, !26, !52} ; [ DW_TAG_arg_variable ] [r] [line 70]
!70 = !{!"0x100\00i\0072\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!71 = !{!"0x100\00j\0072\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 72]
!72 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !26, !73, null, void ([4000 x double]*, double*, double*)* @init_array, null, null, !75} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!73 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !74, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = !{null, !29, !29, !9, !52, !52}
!75 = !{!76, !77, !78, !79, !80, !81, !82}
!76 = !{!"0x101\00nx\0016777239\000", !72, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!77 = !{!"0x101\00ny\0033554455\000", !72, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!78 = !{!"0x101\00A\0050331672\000", !72, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!79 = !{!"0x101\00r\0067108889\000", !72, !26, !52} ; [ DW_TAG_arg_variable ] [r] [line 25]
!80 = !{!"0x101\00p\0083886106\000", !72, !26, !52} ; [ DW_TAG_arg_variable ] [p] [line 26]
!81 = !{!"0x100\00i\0028\000", !72, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!82 = !{!"0x100\00j\0028\000", !72, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!83 = !{i32 2, !"Dwarf Version", i32 4}
!84 = !{i32 2, !"Debug Info Version", i32 2}
!85 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!86 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!87 = !MDLocation(line: 91, column: 14, scope: !25)
!88 = !MDLocation(line: 91, column: 27, scope: !25)
!89 = !MDLocation(line: 94, column: 7, scope: !25)
!90 = !MDLocation(line: 95, column: 7, scope: !25)
!91 = !MDLocation(line: 98, column: 3, scope: !25)
!92 = !MDLocation(line: 99, column: 3, scope: !25)
!93 = !MDLocation(line: 100, column: 3, scope: !25)
!94 = !MDLocation(line: 101, column: 3, scope: !25)
!95 = !MDLocation(line: 102, column: 3, scope: !25)
!96 = !MDLocation(line: 106, column: 8, scope: !25)
!97 = !MDLocation(line: 107, column: 8, scope: !25)
!98 = !MDLocation(line: 108, column: 8, scope: !25)
!99 = !MDLocation(line: 105, column: 3, scope: !25)
!100 = !MDLocation(line: 116, column: 9, scope: !25)
!101 = !MDLocation(line: 117, column: 9, scope: !25)
!102 = !MDLocation(line: 114, column: 3, scope: !25)
!103 = !MDLocation(line: 127, column: 3, scope: !44)
!104 = !MDLocation(line: 127, column: 3, scope: !25)
!105 = !MDLocation(line: 127, column: 3, scope: !43)
!106 = !MDLocation(line: 127, column: 3, scope: !47)
!107 = !MDLocation(line: 127, column: 3, scope: !108)
!108 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!109 = !{!110, !110, i64 0}
!110 = !{!"any pointer", !111, i64 0}
!111 = !{!"omnipotent char", !112, i64 0}
!112 = !{!"Simple C/C++ TBAA"}
!113 = !{!111, !111, i64 0}
!114 = !MDLocation(line: 127, column: 3, scope: !115)
!115 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!116 = !MDLocation(line: 130, column: 3, scope: !25)
!117 = !MDLocation(line: 131, column: 3, scope: !25)
!118 = !MDLocation(line: 132, column: 3, scope: !25)
!119 = !MDLocation(line: 133, column: 3, scope: !25)
!120 = !MDLocation(line: 134, column: 3, scope: !25)
!121 = !MDLocation(line: 136, column: 3, scope: !25)
!122 = !MDLocation(line: 23, column: 22, scope: !72)
!123 = !MDLocation(line: 23, column: 30, scope: !72)
!124 = !MDLocation(line: 28, column: 7, scope: !72)
!125 = !MDLocation(line: 30, column: 3, scope: !126)
!126 = !{!"0xb\0030\003\0024", !1, !72}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!127 = !MDLocation(line: 31, column: 12, scope: !128)
!128 = !{!"0xb\0030\003\0025", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!129 = !MDLocation(line: 31, column: 5, scope: !128)
!130 = !{!131, !131, i64 0}
!131 = !{!"double", !111, i64 0}
!132 = !MDLocation(line: 33, column: 12, scope: !133)
!133 = !{!"0xb\0032\0028\0028", !1, !134}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!134 = !{!"0xb\0032\003\0027", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!135 = !{!"0xb\0032\003\0026", !1, !72}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!136 = !MDLocation(line: 33, column: 5, scope: !133)
!137 = !MDLocation(line: 28, column: 10, scope: !72)
!138 = !MDLocation(line: 34, column: 5, scope: !139)
!139 = !{!"0xb\0034\005\0029", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!140 = !MDLocation(line: 35, column: 32, scope: !141)
!141 = !{!"0xb\0034\005\0030", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!142 = !MDLocation(line: 35, column: 18, scope: !141)
!143 = !MDLocation(line: 35, column: 17, scope: !141)
!144 = !MDLocation(line: 35, column: 7, scope: !141)
!145 = !MDLocation(line: 32, column: 3, scope: !135)
!146 = !MDLocation(line: 37, column: 1, scope: !72)
!147 = !MDLocation(line: 65, column: 22, scope: !59)
!148 = !MDLocation(line: 65, column: 30, scope: !59)
!149 = !MDLocation(line: 72, column: 7, scope: !59)
!150 = !MDLocation(line: 76, column: 5, scope: !151)
!151 = !{!"0xb\0075\003\0017", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!152 = !{!"0xb\0075\003\0016", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!153 = !MDLocation(line: 77, column: 3, scope: !154)
!154 = !{!"0xb\0077\003\0018", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!155 = !MDLocation(line: 79, column: 7, scope: !156)
!156 = !{!"0xb\0078\005\0020", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!157 = !{!"0xb\0077\003\0019", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!158 = !MDLocation(line: 72, column: 10, scope: !59)
!159 = !MDLocation(line: 82, column: 18, scope: !160)
!160 = !{!"0xb\0081\002\0023", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!161 = !{!"0xb\0080\007\0022", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!162 = !{!"0xb\0080\007\0021", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!163 = !MDLocation(line: 80, column: 7, scope: !162)
!164 = !MDLocation(line: 82, column: 11, scope: !160)
!165 = !MDLocation(line: 82, column: 25, scope: !160)
!166 = !MDLocation(line: 82, column: 4, scope: !160)
!167 = !MDLocation(line: 83, column: 11, scope: !160)
!168 = !MDLocation(line: 83, column: 18, scope: !160)
!169 = !MDLocation(line: 83, column: 28, scope: !160)
!170 = !MDLocation(line: 83, column: 4, scope: !160)
!171 = !MDLocation(line: 88, column: 1, scope: !59)
!172 = !MDLocation(line: 43, column: 22, scope: !49)
!173 = !MDLocation(line: 43, column: 30, scope: !49)
!174 = !MDLocation(line: 48, column: 7, scope: !49)
!175 = !MDLocation(line: 50, column: 3, scope: !176)
!176 = !{!"0xb\0050\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!177 = !MDLocation(line: 55, column: 14, scope: !178)
!178 = !{!"0xb\0054\0028\0014", !1, !179}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!179 = !{!"0xb\0054\003\0013", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!180 = !{!"0xb\0054\003\0012", !1, !49}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!181 = !MDLocation(line: 54, column: 3, scope: !180)
!182 = !MDLocation(line: 51, column: 14, scope: !183)
!183 = !{!"0xb\0050\0028\0010", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!184 = !{!"0xb\0050\003\009", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!185 = !MDLocation(line: 51, column: 44, scope: !183)
!186 = !MDLocation(line: 51, column: 5, scope: !183)
!187 = !MDLocation(line: 52, column: 9, scope: !188)
!188 = !{!"0xb\0052\009\0011", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!189 = !MDLocation(line: 52, column: 9, scope: !183)
!190 = !MDLocation(line: 52, column: 31, scope: !191)
!191 = !{!"0xb\001", !1, !188}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!192 = !MDLocation(line: 52, column: 22, scope: !188)
!193 = !MDLocation(line: 55, column: 44, scope: !178)
!194 = !MDLocation(line: 55, column: 5, scope: !178)
!195 = !MDLocation(line: 56, column: 9, scope: !196)
!196 = !{!"0xb\0056\009\0015", !1, !178}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!197 = !MDLocation(line: 56, column: 9, scope: !178)
!198 = !MDLocation(line: 56, column: 31, scope: !199)
!199 = !{!"0xb\001", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!200 = !MDLocation(line: 56, column: 22, scope: !196)
!201 = !MDLocation(line: 58, column: 3, scope: !49)
!202 = !MDLocation(line: 59, column: 1, scope: !49)
