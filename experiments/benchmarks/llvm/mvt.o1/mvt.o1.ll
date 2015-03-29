; ModuleID = 'mvt.c'
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
  tail call fastcc void @init_array(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [4000 x double]* %arraydecay8), !dbg !96
  tail call fastcc void @kernel_mvt(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [4000 x double]* %arraydecay8), !dbg !97
  %cmp = icmp sgt i32 %argc, 42, !dbg !98
  br i1 %cmp, label %if.end50, label %if.end58, !dbg !99

if.end50:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !82), !dbg !100
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !45, metadata !82), !dbg !101
  %0 = load i8** %argv, align 8, !dbg !102, !tbaa !104
  %1 = load i8* %0, align 1, !dbg !102, !tbaa !108
  %phitmp = icmp eq i8 %1, 0, !dbg !100
  br i1 %phitmp, label %if.then55, label %if.end58, !dbg !99

if.then55:                                        ; preds = %if.end50
  tail call fastcc void @print_array(double* %arraydecay, double* %arraydecay5), !dbg !109
  br label %if.end58, !dbg !109

if.end58:                                         ; preds = %if.end50, %if.then55, %entry
  tail call void @free(i8* %call) #4, !dbg !111
  tail call void @free(i8* %call1) #4, !dbg !112
  tail call void @free(i8* %call2) #4, !dbg !113
  tail call void @free(i8* %call3) #4, !dbg !114
  tail call void @free(i8* %call4) #4, !dbg !115
  ret i32 0, !dbg !116
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %x1, double* nocapture %x2, double* nocapture %y_1, double* nocapture %y_2, [4000 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !71, metadata !82), !dbg !117
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !77, metadata !82), !dbg !118
  br label %for.body, !dbg !119

for.body:                                         ; preds = %for.inc30, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc30 ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !121
  %conv = sitofp i32 %0 to double, !dbg !121
  %div = fdiv double %conv, 4.000000e+03, !dbg !124
  %arrayidx = getelementptr inbounds double* %x1, i64 %indvars.iv3, !dbg !125
  store double %div, double* %arrayidx, align 8, !dbg !125, !tbaa !126
  %add = fadd double %conv, 1.000000e+00, !dbg !128
  %div4 = fdiv double %add, 4.000000e+03, !dbg !129
  %arrayidx6 = getelementptr inbounds double* %x2, i64 %indvars.iv3, !dbg !130
  store double %div4, double* %arrayidx6, align 8, !dbg !130, !tbaa !126
  %add8 = fadd double %conv, 3.000000e+00, !dbg !131
  %div10 = fdiv double %add8, 4.000000e+03, !dbg !132
  %arrayidx12 = getelementptr inbounds double* %y_1, i64 %indvars.iv3, !dbg !133
  store double %div10, double* %arrayidx12, align 8, !dbg !133, !tbaa !126
  %add14 = fadd double %conv, 4.000000e+00, !dbg !134
  %div16 = fdiv double %add14, 4.000000e+03, !dbg !135
  %arrayidx18 = getelementptr inbounds double* %y_2, i64 %indvars.iv3, !dbg !136
  store double %div16, double* %arrayidx18, align 8, !dbg !136, !tbaa !126
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !78, metadata !82), !dbg !137
  br label %for.body22, !dbg !138

for.body22:                                       ; preds = %for.body22, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body22 ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !140
  %conv24 = sitofp i32 %1 to double, !dbg !140
  %mul = fmul double %conv, %conv24, !dbg !142
  %div25 = fdiv double %mul, 4.000000e+03, !dbg !143
  %arrayidx29 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !144
  store double %div25, double* %arrayidx29, align 8, !dbg !144, !tbaa !126
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !138
  br i1 %exitcond, label %for.inc30, label %for.body22, !dbg !138

for.inc30:                                        ; preds = %for.body22
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !119
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 4000, !dbg !119
  br i1 %exitcond5, label %for.end32, label %for.body, !dbg !119

for.end32:                                        ; preds = %for.inc30
  ret void, !dbg !145
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [4000 x double]* nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !61, metadata !82), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !82), !dbg !147
  br label %for.cond1.preheader, !dbg !148

for.cond1.preheader:                              ; preds = %for.inc12, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc12 ]
  %arrayidx = getelementptr inbounds double* %x1, i64 %indvars.iv11, !dbg !150
  br label %for.body3, !dbg !154

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next9, %for.body3 ]
  %0 = load double* %arrayidx, align 8, !dbg !150, !tbaa !126
  %arrayidx7 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !155
  %1 = load double* %arrayidx7, align 8, !dbg !155, !tbaa !126
  %arrayidx9 = getelementptr inbounds double* %y_1, i64 %indvars.iv8, !dbg !156
  %2 = load double* %arrayidx9, align 8, !dbg !156, !tbaa !126
  %mul = fmul double %1, %2, !dbg !155
  %add = fadd double %0, %mul, !dbg !150
  store double %add, double* %arrayidx, align 8, !dbg !157, !tbaa !126
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !154
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 4000, !dbg !154
  br i1 %exitcond10, label %for.inc12, label %for.body3, !dbg !154

for.inc12:                                        ; preds = %for.body3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !148
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 4000, !dbg !148
  br i1 %exitcond13, label %for.cond18.preheader, label %for.cond1.preheader, !dbg !148

for.cond18.preheader:                             ; preds = %for.inc12, %for.inc36
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc36 ], [ 0, %for.inc12 ]
  %arrayidx22 = getelementptr inbounds double* %x2, i64 %indvars.iv5, !dbg !158
  br label %for.body20, !dbg !163

for.body20:                                       ; preds = %for.body20, %for.cond18.preheader
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next, %for.body20 ]
  %3 = load double* %arrayidx22, align 8, !dbg !158, !tbaa !126
  %arrayidx26 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv5, !dbg !164
  %4 = load double* %arrayidx26, align 8, !dbg !164, !tbaa !126
  %arrayidx28 = getelementptr inbounds double* %y_2, i64 %indvars.iv, !dbg !165
  %5 = load double* %arrayidx28, align 8, !dbg !165, !tbaa !126
  %mul29 = fmul double %4, %5, !dbg !164
  %add30 = fadd double %3, %mul29, !dbg !158
  store double %add30, double* %arrayidx22, align 8, !dbg !166, !tbaa !126
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !163
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !163
  br i1 %exitcond, label %for.inc36, label %for.body20, !dbg !163

for.inc36:                                        ; preds = %for.body20
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !167
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 4000, !dbg !167
  br i1 %exitcond7, label %for.end38, label %for.cond18.preheader, !dbg !167

for.end38:                                        ; preds = %for.inc36
  ret void, !dbg !168
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x1, double* nocapture readonly %x2) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !53, metadata !82), !dbg !169
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !82), !dbg !170
  br label %for.body, !dbg !171

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !173, !tbaa !104
  %arrayidx = getelementptr inbounds double* %x1, i64 %indvars.iv, !dbg !176
  %1 = load double* %arrayidx, align 8, !dbg !176, !tbaa !126
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %1) #5, !dbg !177
  %2 = load %struct._IO_FILE** @stderr, align 8, !dbg !178, !tbaa !104
  %arrayidx2 = getelementptr inbounds double* %x2, i64 %indvars.iv, !dbg !179
  %3 = load double* %arrayidx2, align 8, !dbg !179, !tbaa !126
  %call3 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %3) #5, !dbg !180
  %4 = trunc i64 %indvars.iv to i32, !dbg !181
  %rem = srem i32 %4, 20, !dbg !181
  %cmp4 = icmp eq i32 %rem, 0, !dbg !181
  br i1 %cmp4, label %if.then, label %for.inc, !dbg !183

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !184, !tbaa !104
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !186
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !171
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !171
  br i1 %exitcond, label %for.end, label %for.body, !dbg !171

for.end:                                          ; preds = %for.inc
  ret void, !dbg !187
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
!48 = !{!"0x2e\00print_array\00print_array\00\0047\001\001\000\000\00256\001\0051", !1, !26, !49, null, void (double*, double*)* @print_array, null, null, !52} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 51] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !51, !51}
!51 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!52 = !{!53, !54, !55, !56}
!53 = !{!"0x101\00n\0016777263\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 47]
!54 = !{!"0x101\00x1\0033554480\000", !48, !26, !51} ; [ DW_TAG_arg_variable ] [x1] [line 48]
!55 = !{!"0x101\00x2\0050331697\000", !48, !26, !51} ; [ DW_TAG_arg_variable ] [x2] [line 49]
!56 = !{!"0x100\00i\0052\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!57 = !{!"0x2e\00kernel_mvt\00kernel_mvt\00\0065\001\001\000\000\00256\001\0071", !1, !26, !58, null, void (double*, double*, double*, double*, [4000 x double]*)* @kernel_mvt, null, null, !60} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_mvt]
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
!69 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !58, null, void (double*, double*, double*, double*, [4000 x double]*)* @init_array, null, null, !70} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
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
!96 = !MDLocation(line: 100, column: 3, scope: !25)
!97 = !MDLocation(line: 111, column: 3, scope: !25)
!98 = !MDLocation(line: 124, column: 3, scope: !43)
!99 = !MDLocation(line: 124, column: 3, scope: !25)
!100 = !MDLocation(line: 124, column: 3, scope: !42)
!101 = !MDLocation(line: 124, column: 3, scope: !46)
!102 = !MDLocation(line: 124, column: 3, scope: !103)
!103 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!104 = !{!105, !105, i64 0}
!105 = !{!"any pointer", !106, i64 0}
!106 = !{!"omnipotent char", !107, i64 0}
!107 = !{!"Simple C/C++ TBAA"}
!108 = !{!106, !106, i64 0}
!109 = !MDLocation(line: 124, column: 3, scope: !110)
!110 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!111 = !MDLocation(line: 127, column: 3, scope: !25)
!112 = !MDLocation(line: 128, column: 3, scope: !25)
!113 = !MDLocation(line: 129, column: 3, scope: !25)
!114 = !MDLocation(line: 130, column: 3, scope: !25)
!115 = !MDLocation(line: 131, column: 3, scope: !25)
!116 = !MDLocation(line: 133, column: 3, scope: !25)
!117 = !MDLocation(line: 23, column: 21, scope: !69)
!118 = !MDLocation(line: 30, column: 7, scope: !69)
!119 = !MDLocation(line: 32, column: 3, scope: !120)
!120 = !{!"0xb\0032\003\0020", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!121 = !MDLocation(line: 34, column: 16, scope: !122)
!122 = !{!"0xb\0033\005\0022", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!123 = !{!"0xb\0032\003\0021", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!124 = !MDLocation(line: 34, column: 15, scope: !122)
!125 = !MDLocation(line: 34, column: 7, scope: !122)
!126 = !{!127, !127, i64 0}
!127 = !{!"double", !106, i64 0}
!128 = !MDLocation(line: 35, column: 16, scope: !122)
!129 = !MDLocation(line: 35, column: 15, scope: !122)
!130 = !MDLocation(line: 35, column: 7, scope: !122)
!131 = !MDLocation(line: 36, column: 17, scope: !122)
!132 = !MDLocation(line: 36, column: 16, scope: !122)
!133 = !MDLocation(line: 36, column: 7, scope: !122)
!134 = !MDLocation(line: 37, column: 17, scope: !122)
!135 = !MDLocation(line: 37, column: 16, scope: !122)
!136 = !MDLocation(line: 37, column: 7, scope: !122)
!137 = !MDLocation(line: 30, column: 10, scope: !69)
!138 = !MDLocation(line: 38, column: 7, scope: !139)
!139 = !{!"0xb\0038\007\0023", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!140 = !MDLocation(line: 39, column: 27, scope: !141)
!141 = !{!"0xb\0038\007\0024", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!142 = !MDLocation(line: 39, column: 13, scope: !141)
!143 = !MDLocation(line: 39, column: 12, scope: !141)
!144 = !MDLocation(line: 39, column: 2, scope: !141)
!145 = !MDLocation(line: 41, column: 1, scope: !69)
!146 = !MDLocation(line: 65, column: 21, scope: !57)
!147 = !MDLocation(line: 72, column: 7, scope: !57)
!148 = !MDLocation(line: 75, column: 3, scope: !149)
!149 = !{!"0xb\0075\003\0012", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!150 = !MDLocation(line: 77, column: 15, scope: !151)
!151 = !{!"0xb\0076\005\0015", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!152 = !{!"0xb\0076\005\0014", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!153 = !{!"0xb\0075\003\0013", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!154 = !MDLocation(line: 76, column: 5, scope: !152)
!155 = !MDLocation(line: 77, column: 23, scope: !151)
!156 = !MDLocation(line: 77, column: 33, scope: !151)
!157 = !MDLocation(line: 77, column: 7, scope: !151)
!158 = !MDLocation(line: 80, column: 15, scope: !159)
!159 = !{!"0xb\0079\005\0019", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!160 = !{!"0xb\0079\005\0018", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!161 = !{!"0xb\0078\003\0017", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!162 = !{!"0xb\0078\003\0016", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!163 = !MDLocation(line: 79, column: 5, scope: !160)
!164 = !MDLocation(line: 80, column: 23, scope: !159)
!165 = !MDLocation(line: 80, column: 33, scope: !159)
!166 = !MDLocation(line: 80, column: 7, scope: !159)
!167 = !MDLocation(line: 78, column: 3, scope: !162)
!168 = !MDLocation(line: 83, column: 1, scope: !57)
!169 = !MDLocation(line: 47, column: 22, scope: !48)
!170 = !MDLocation(line: 52, column: 7, scope: !48)
!171 = !MDLocation(line: 54, column: 3, scope: !172)
!172 = !{!"0xb\0054\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!173 = !MDLocation(line: 55, column: 14, scope: !174)
!174 = !{!"0xb\0054\0027\0010", !1, !175}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!175 = !{!"0xb\0054\003\009", !1, !172}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!176 = !MDLocation(line: 55, column: 44, scope: !174)
!177 = !MDLocation(line: 55, column: 5, scope: !174)
!178 = !MDLocation(line: 56, column: 14, scope: !174)
!179 = !MDLocation(line: 56, column: 44, scope: !174)
!180 = !MDLocation(line: 56, column: 5, scope: !174)
!181 = !MDLocation(line: 57, column: 9, scope: !182)
!182 = !{!"0xb\0057\009\0011", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!183 = !MDLocation(line: 57, column: 9, scope: !174)
!184 = !MDLocation(line: 57, column: 31, scope: !185)
!185 = !{!"0xb\001", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/mvt/mvt.c]
!186 = !MDLocation(line: 57, column: 22, scope: !182)
!187 = !MDLocation(line: 59, column: 1, scope: !48)
