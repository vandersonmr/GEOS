; ModuleID = 'bicg.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

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
  %arraydecay6 = bitcast i8* %call3 to double*, !dbg !97
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !98, metadata !86), !dbg !100
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !101, metadata !86), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !103, metadata !86), !dbg !104
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.1, %vector.body ], !dbg !99
  %induction95114 = or i64 %index, 1, !dbg !99
  %0 = trunc i64 %index to i32, !dbg !105
  %induction97115 = or i32 %0, 1, !dbg !105
  %1 = sitofp i32 %0 to double, !dbg !105
  %2 = sitofp i32 %induction97115 to double, !dbg !105
  %3 = fmul double %1, 0x400921FB54442D18, !dbg !105
  %4 = fmul double %2, 0x400921FB54442D18, !dbg !105
  %5 = getelementptr inbounds double* %arraydecay6, i64 %index, !dbg !108
  %6 = getelementptr inbounds double* %arraydecay6, i64 %induction95114, !dbg !108
  store double %3, double* %5, align 8, !dbg !108, !tbaa !109
  store double %4, double* %6, align 8, !dbg !108, !tbaa !109
  %index.next = add nuw nsw i64 %index, 2, !dbg !99
  %induction95114.1 = or i64 %index.next, 1, !dbg !99
  %7 = trunc i64 %index.next to i32, !dbg !105
  %induction97115.1 = or i32 %7, 1, !dbg !105
  %8 = sitofp i32 %7 to double, !dbg !105
  %9 = sitofp i32 %induction97115.1 to double, !dbg !105
  %10 = fmul double %8, 0x400921FB54442D18, !dbg !105
  %11 = fmul double %9, 0x400921FB54442D18, !dbg !105
  %12 = getelementptr inbounds double* %arraydecay6, i64 %index.next, !dbg !108
  %13 = getelementptr inbounds double* %arraydecay6, i64 %induction95114.1, !dbg !108
  store double %10, double* %12, align 8, !dbg !108, !tbaa !109
  store double %11, double* %13, align 8, !dbg !108, !tbaa !109
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !99
  %14 = icmp eq i64 %index.next.1, 4000, !dbg !99
  br i1 %14, label %for.body4.i.preheader, label %vector.body, !dbg !99, !llvm.loop !113

for.body4.i.preheader:                            ; preds = %vector.body
  %arraydecay5 = bitcast i8* %call4 to double*, !dbg !116
  br label %for.body4.i, !dbg !117

for.body4.i:                                      ; preds = %for.body4.i.preheader, %for.inc24.i
  %indvars.iv4.i = phi i64 [ %indvars.iv.next5.i, %for.inc24.i ], [ 0, %for.body4.i.preheader ], !dbg !99
  %15 = trunc i64 %indvars.iv4.i to i32, !dbg !117
  %conv5.i = sitofp i32 %15 to double, !dbg !117
  %mul6.i = fmul double %conv5.i, 0x400921FB54442D18, !dbg !117
  %arrayidx8.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv4.i, !dbg !121
  store double %mul6.i, double* %arrayidx8.i, align 8, !dbg !121, !tbaa !109
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !122, metadata !86), !dbg !123
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %for.body4.i
  %index104 = phi i64 [ 0, %for.body4.i ], [ %index.next111, %vector.body101 ], !dbg !99
  %induction113116 = or i64 %index104, 1, !dbg !99
  %16 = or i64 %index104, 1, !dbg !124
  %17 = add nuw nsw i64 %induction113116, 1, !dbg !124
  %18 = trunc i64 %16 to i32, !dbg !126
  %19 = trunc i64 %17 to i32, !dbg !126
  %20 = sitofp i32 %18 to double, !dbg !126
  %21 = sitofp i32 %19 to double, !dbg !126
  %22 = fmul double %conv5.i, %20, !dbg !128
  %23 = fmul double %conv5.i, %21, !dbg !128
  %24 = fdiv double %22, 4.000000e+03, !dbg !129
  %25 = fdiv double %23, 4.000000e+03, !dbg !129
  %26 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %index104, !dbg !130
  %27 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %induction113116, !dbg !130
  store double %24, double* %26, align 8, !dbg !130, !tbaa !109
  store double %25, double* %27, align 8, !dbg !130, !tbaa !109
  %index.next111 = add i64 %index104, 2, !dbg !99
  %28 = icmp eq i64 %index.next111, 4000, !dbg !99
  br i1 %28, label %for.inc24.i, label %vector.body101, !dbg !99, !llvm.loop !131

for.inc24.i:                                      ; preds = %vector.body101
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !132
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 4000, !dbg !132
  br i1 %exitcond6.i, label %init_array.exit, label %for.body4.i, !dbg !132

init_array.exit:                                  ; preds = %for.inc24.i
  %arraydecay8 = bitcast i8* %call1 to double*, !dbg !133
  %arraydecay9 = bitcast i8* %call2 to double*, !dbg !134
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !135, metadata !86) #4, !dbg !137
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !138, metadata !86) #4, !dbg !139
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !140, metadata !86) #4, !dbg !141
  tail call void @llvm.memset.p0i8.i64(i8* %call1, i8 0, i64 32000, i32 8, i1 false) #4, !dbg !142
  br label %for.body3.i, !dbg !145

for.body3.i:                                      ; preds = %for.inc34.i, %init_array.exit
  %indvars.iv4.i88 = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next5.i93, %for.inc34.i ], !dbg !136
  %arrayidx5.i = getelementptr inbounds double* %arraydecay9, i64 %indvars.iv4.i88, !dbg !147
  store double 0.000000e+00, double* %arrayidx5.i, align 8, !dbg !147, !tbaa !109
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !150, metadata !86) #4, !dbg !151
  %arrayidx12.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv4.i88, !dbg !152
  br label %for.body8.i, !dbg !156

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i
  %indvars.iv.i89 = phi i64 [ 0, %for.body3.i ], [ %indvars.iv.next.i91, %for.body8.i ], !dbg !136
  %arrayidx10.i = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv.i89, !dbg !157
  %29 = load double* %arrayidx10.i, align 8, !dbg !157, !tbaa !109
  %30 = load double* %arrayidx12.i, align 8, !dbg !152, !tbaa !109
  %arrayidx16.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i88, i64 %indvars.iv.i89, !dbg !158
  %31 = load double* %arrayidx16.i, align 8, !dbg !158, !tbaa !109
  %mul.i90 = fmul double %30, %31, !dbg !152
  %add.i = fadd double %29, %mul.i90, !dbg !157
  store double %add.i, double* %arrayidx10.i, align 8, !dbg !159, !tbaa !109
  %32 = load double* %arrayidx5.i, align 8, !dbg !160, !tbaa !109
  %33 = load double* %arrayidx16.i, align 8, !dbg !161, !tbaa !109
  %arrayidx26.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv.i89, !dbg !162
  %34 = load double* %arrayidx26.i, align 8, !dbg !162, !tbaa !109
  %mul27.i = fmul double %33, %34, !dbg !161
  %add28.i = fadd double %32, %mul27.i, !dbg !160
  store double %add28.i, double* %arrayidx5.i, align 8, !dbg !163, !tbaa !109
  %indvars.iv.next.i91 = add nuw nsw i64 %indvars.iv.i89, 1, !dbg !156
  %exitcond.i92 = icmp eq i64 %indvars.iv.next.i91, 4000, !dbg !156
  br i1 %exitcond.i92, label %for.inc34.i, label %for.body8.i, !dbg !156

for.inc34.i:                                      ; preds = %for.body8.i
  %indvars.iv.next5.i93 = add nuw nsw i64 %indvars.iv4.i88, 1, !dbg !145
  %exitcond6.i94 = icmp eq i64 %indvars.iv.next5.i93, 4000, !dbg !145
  br i1 %exitcond6.i94, label %kernel_bicg.exit, label %for.body3.i, !dbg !145

kernel_bicg.exit:                                 ; preds = %for.inc34.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !164
  br i1 %cmp, label %if.end48, label %if.end56, !dbg !165

if.end48:                                         ; preds = %kernel_bicg.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !86), !dbg !166
  tail call void @llvm.dbg.value(metadata i8* %35, i64 0, metadata !46, metadata !86), !dbg !167
  %35 = load i8** %argv, align 8, !dbg !168, !tbaa !170
  %36 = load i8* %35, align 1, !dbg !168, !tbaa !172
  %phitmp = icmp eq i8 %36, 0, !dbg !166
  br i1 %phitmp, label %for.body.i84.preheader, label %if.end56, !dbg !165

for.body.i84.preheader:                           ; preds = %if.end48
  br label %for.body.i84, !dbg !173

for.cond3.preheader.i:                            ; preds = %for.inc.i
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !179, !tbaa !170
  br label %for.body5.i, !dbg !183

for.body.i84:                                     ; preds = %for.body.i84.preheader, %for.inc.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %for.inc.i ], [ 0, %for.body.i84.preheader ], !dbg !177
  %38 = load %struct._IO_FILE** @stderr, align 8, !dbg !173, !tbaa !170
  %arrayidx.i83 = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv9.i, !dbg !184
  %39 = load double* %arrayidx.i83, align 8, !dbg !184, !tbaa !109
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %39) #5, !dbg !185
  %40 = trunc i64 %indvars.iv9.i to i32, !dbg !186
  %rem.i = srem i32 %40, 20, !dbg !186
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !186
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !188

if.then.i:                                        ; preds = %for.body.i84
  %41 = load %struct._IO_FILE** @stderr, align 8, !dbg !189, !tbaa !170
  %fputc6.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %41) #5, !dbg !191
  br label %for.inc.i, !dbg !191

for.inc.i:                                        ; preds = %if.then.i, %for.body.i84
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1, !dbg !192
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 4000, !dbg !192
  br i1 %exitcond11.i, label %for.cond3.preheader.i, label %for.body.i84, !dbg !192

for.body5.i:                                      ; preds = %for.inc14.i, %for.cond3.preheader.i
  %indvars.iv.i85 = phi i64 [ 0, %for.cond3.preheader.i ], [ %indvars.iv.next.i86, %for.inc14.i ], !dbg !177
  %42 = phi %struct._IO_FILE* [ %37, %for.cond3.preheader.i ], [ %46, %for.inc14.i ], !dbg !177
  %arrayidx7.i = getelementptr inbounds double* %arraydecay9, i64 %indvars.iv.i85, !dbg !193
  %43 = load double* %arrayidx7.i, align 8, !dbg !193, !tbaa !109
  %call8.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %43) #5, !dbg !194
  %44 = trunc i64 %indvars.iv.i85 to i32, !dbg !195
  %rem9.i = srem i32 %44, 20, !dbg !195
  %cmp10.i = icmp eq i32 %rem9.i, 0, !dbg !195
  br i1 %cmp10.i, label %if.then11.i, label %for.inc14.i, !dbg !197

if.then11.i:                                      ; preds = %for.body5.i
  %45 = load %struct._IO_FILE** @stderr, align 8, !dbg !198, !tbaa !170
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5, !dbg !200
  br label %for.inc14.i, !dbg !200

for.inc14.i:                                      ; preds = %if.then11.i, %for.body5.i
  %indvars.iv.next.i86 = add nuw nsw i64 %indvars.iv.i85, 1, !dbg !183
  %46 = load %struct._IO_FILE** @stderr, align 8, !dbg !179, !tbaa !170
  %exitcond.i87 = icmp eq i64 %indvars.iv.next.i86, 4000, !dbg !183
  br i1 %exitcond.i87, label %print_array.exit, label %for.body5.i, !dbg !183

print_array.exit:                                 ; preds = %for.inc14.i
  %.lcssa = phi %struct._IO_FILE* [ %46, %for.inc14.i ]
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa) #5, !dbg !201
  br label %if.end56, !dbg !177

if.end56:                                         ; preds = %if.end48, %print_array.exit, %kernel_bicg.exit
  tail call void @free(i8* %call) #4, !dbg !202
  tail call void @free(i8* %call1) #4, !dbg !203
  tail call void @free(i8* %call2) #4, !dbg !204
  tail call void @free(i8* %call3) #4, !dbg !205
  tail call void @free(i8* %call4) #4, !dbg !206
  ret i32 0, !dbg !207
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

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

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
!49 = !{!"0x2e\00print_array\00print_array\00\0043\001\001\000\000\00256\001\0047", !1, !26, !50, null, null, null, null, !53} ; [ DW_TAG_subprogram ] [line 43] [local] [def] [scope 47] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !29, !52, !52}
!52 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00nx\0016777259\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 43]
!55 = !{!"0x101\00ny\0033554475\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 43]
!56 = !{!"0x101\00s\0050331692\000", !49, !26, !52} ; [ DW_TAG_arg_variable ] [s] [line 44]
!57 = !{!"0x101\00q\0067108909\000", !49, !26, !52} ; [ DW_TAG_arg_variable ] [q] [line 45]
!58 = !{!"0x100\00i\0048\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 48]
!59 = !{!"0x2e\00kernel_bicg\00kernel_bicg\00\0065\001\001\000\000\00256\001\0071", !1, !26, !60, null, null, null, null, !62} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_bicg]
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
!72 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !26, !73, null, null, null, null, !75} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
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
!97 = !MDLocation(line: 108, column: 8, scope: !25)
!98 = !{!"0x101\00nx\0016777239\000", !72, !26, !29, !99} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!99 = !MDLocation(line: 105, column: 3, scope: !25)
!100 = !MDLocation(line: 23, column: 22, scope: !72, inlinedAt: !99)
!101 = !{!"0x101\00ny\0033554455\000", !72, !26, !29, !99} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!102 = !MDLocation(line: 23, column: 30, scope: !72, inlinedAt: !99)
!103 = !{!"0x100\00i\0028\000", !72, !26, !29, !99} ; [ DW_TAG_auto_variable ] [i] [line 28]
!104 = !MDLocation(line: 28, column: 7, scope: !72, inlinedAt: !99)
!105 = !MDLocation(line: 31, column: 12, scope: !106, inlinedAt: !99)
!106 = !{!"0xb\0030\003\0025", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!107 = !{!"0xb\0030\003\0024", !1, !72}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!108 = !MDLocation(line: 31, column: 5, scope: !106, inlinedAt: !99)
!109 = !{!110, !110, i64 0}
!110 = !{!"double", !111, i64 0}
!111 = !{!"omnipotent char", !112, i64 0}
!112 = !{!"Simple C/C++ TBAA"}
!113 = distinct !{!113, !114, !115}
!114 = !{!"llvm.loop.vectorize.width", i32 1}
!115 = !{!"llvm.loop.interleave.count", i32 1}
!116 = !MDLocation(line: 107, column: 8, scope: !25)
!117 = !MDLocation(line: 33, column: 12, scope: !118, inlinedAt: !99)
!118 = !{!"0xb\0032\0028\0028", !1, !119}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!119 = !{!"0xb\0032\003\0027", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!120 = !{!"0xb\0032\003\0026", !1, !72}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!121 = !MDLocation(line: 33, column: 5, scope: !118, inlinedAt: !99)
!122 = !{!"0x100\00j\0028\000", !72, !26, !29, !99} ; [ DW_TAG_auto_variable ] [j] [line 28]
!123 = !MDLocation(line: 28, column: 10, scope: !72, inlinedAt: !99)
!124 = !MDLocation(line: 34, column: 5, scope: !125, inlinedAt: !99)
!125 = !{!"0xb\0034\005\0029", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!126 = !MDLocation(line: 35, column: 32, scope: !127, inlinedAt: !99)
!127 = !{!"0xb\0034\005\0030", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!128 = !MDLocation(line: 35, column: 18, scope: !127, inlinedAt: !99)
!129 = !MDLocation(line: 35, column: 17, scope: !127, inlinedAt: !99)
!130 = !MDLocation(line: 35, column: 7, scope: !127, inlinedAt: !99)
!131 = distinct !{!131, !114, !115}
!132 = !MDLocation(line: 32, column: 3, scope: !120, inlinedAt: !99)
!133 = !MDLocation(line: 116, column: 9, scope: !25)
!134 = !MDLocation(line: 117, column: 9, scope: !25)
!135 = !{!"0x101\00nx\0016777281\000", !59, !26, !29, !136} ; [ DW_TAG_arg_variable ] [nx] [line 65]
!136 = !MDLocation(line: 114, column: 3, scope: !25)
!137 = !MDLocation(line: 65, column: 22, scope: !59, inlinedAt: !136)
!138 = !{!"0x101\00ny\0033554497\000", !59, !26, !29, !136} ; [ DW_TAG_arg_variable ] [ny] [line 65]
!139 = !MDLocation(line: 65, column: 30, scope: !59, inlinedAt: !136)
!140 = !{!"0x100\00i\0072\000", !59, !26, !29, !136} ; [ DW_TAG_auto_variable ] [i] [line 72]
!141 = !MDLocation(line: 72, column: 7, scope: !59, inlinedAt: !136)
!142 = !MDLocation(line: 76, column: 5, scope: !143, inlinedAt: !136)
!143 = !{!"0xb\0075\003\0017", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!144 = !{!"0xb\0075\003\0016", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!145 = !MDLocation(line: 77, column: 3, scope: !146, inlinedAt: !136)
!146 = !{!"0xb\0077\003\0018", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!147 = !MDLocation(line: 79, column: 7, scope: !148, inlinedAt: !136)
!148 = !{!"0xb\0078\005\0020", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!149 = !{!"0xb\0077\003\0019", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!150 = !{!"0x100\00j\0072\000", !59, !26, !29, !136} ; [ DW_TAG_auto_variable ] [j] [line 72]
!151 = !MDLocation(line: 72, column: 10, scope: !59, inlinedAt: !136)
!152 = !MDLocation(line: 82, column: 18, scope: !153, inlinedAt: !136)
!153 = !{!"0xb\0081\002\0023", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!154 = !{!"0xb\0080\007\0022", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!155 = !{!"0xb\0080\007\0021", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!156 = !MDLocation(line: 80, column: 7, scope: !155, inlinedAt: !136)
!157 = !MDLocation(line: 82, column: 11, scope: !153, inlinedAt: !136)
!158 = !MDLocation(line: 82, column: 25, scope: !153, inlinedAt: !136)
!159 = !MDLocation(line: 82, column: 4, scope: !153, inlinedAt: !136)
!160 = !MDLocation(line: 83, column: 11, scope: !153, inlinedAt: !136)
!161 = !MDLocation(line: 83, column: 18, scope: !153, inlinedAt: !136)
!162 = !MDLocation(line: 83, column: 28, scope: !153, inlinedAt: !136)
!163 = !MDLocation(line: 83, column: 4, scope: !153, inlinedAt: !136)
!164 = !MDLocation(line: 127, column: 3, scope: !44)
!165 = !MDLocation(line: 127, column: 3, scope: !25)
!166 = !MDLocation(line: 127, column: 3, scope: !43)
!167 = !MDLocation(line: 127, column: 3, scope: !47)
!168 = !MDLocation(line: 127, column: 3, scope: !169)
!169 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!170 = !{!171, !171, i64 0}
!171 = !{!"any pointer", !111, i64 0}
!172 = !{!111, !111, i64 0}
!173 = !MDLocation(line: 51, column: 14, scope: !174, inlinedAt: !177)
!174 = !{!"0xb\0050\0028\0010", !1, !175}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!175 = !{!"0xb\0050\003\009", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!176 = !{!"0xb\0050\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!177 = !MDLocation(line: 127, column: 3, scope: !178)
!178 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!179 = !MDLocation(line: 55, column: 14, scope: !180, inlinedAt: !177)
!180 = !{!"0xb\0054\0028\0014", !1, !181}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!181 = !{!"0xb\0054\003\0013", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!182 = !{!"0xb\0054\003\0012", !1, !49}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!183 = !MDLocation(line: 54, column: 3, scope: !182, inlinedAt: !177)
!184 = !MDLocation(line: 51, column: 44, scope: !174, inlinedAt: !177)
!185 = !MDLocation(line: 51, column: 5, scope: !174, inlinedAt: !177)
!186 = !MDLocation(line: 52, column: 9, scope: !187, inlinedAt: !177)
!187 = !{!"0xb\0052\009\0011", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!188 = !MDLocation(line: 52, column: 9, scope: !174, inlinedAt: !177)
!189 = !MDLocation(line: 52, column: 31, scope: !190, inlinedAt: !177)
!190 = !{!"0xb\001", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!191 = !MDLocation(line: 52, column: 22, scope: !187, inlinedAt: !177)
!192 = !MDLocation(line: 50, column: 3, scope: !176, inlinedAt: !177)
!193 = !MDLocation(line: 55, column: 44, scope: !180, inlinedAt: !177)
!194 = !MDLocation(line: 55, column: 5, scope: !180, inlinedAt: !177)
!195 = !MDLocation(line: 56, column: 9, scope: !196, inlinedAt: !177)
!196 = !{!"0xb\0056\009\0015", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!197 = !MDLocation(line: 56, column: 9, scope: !180, inlinedAt: !177)
!198 = !MDLocation(line: 56, column: 31, scope: !199, inlinedAt: !177)
!199 = !{!"0xb\001", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!200 = !MDLocation(line: 56, column: 22, scope: !196, inlinedAt: !177)
!201 = !MDLocation(line: 58, column: 3, scope: !49, inlinedAt: !177)
!202 = !MDLocation(line: 130, column: 3, scope: !25)
!203 = !MDLocation(line: 131, column: 3, scope: !25)
!204 = !MDLocation(line: 132, column: 3, scope: !25)
!205 = !MDLocation(line: 133, column: 3, scope: !25)
!206 = !MDLocation(line: 134, column: 3, scope: !25)
!207 = !MDLocation(line: 136, column: 3, scope: !25)
