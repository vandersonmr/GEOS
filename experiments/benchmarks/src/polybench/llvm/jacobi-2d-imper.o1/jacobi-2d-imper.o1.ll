; ModuleID = 'jacobi-2d-imper.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !77), !dbg !78
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !77), !dbg !79
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !32, metadata !77), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 20, i64 0, metadata !33, metadata !77), !dbg !81
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !82
  %call1 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !83
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !84
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*, !dbg !85
  tail call fastcc void @init_array([1000 x double]* %arraydecay, [1000 x double]* %arraydecay2), !dbg !86
  tail call fastcc void @kernel_jacobi_2d_imper([1000 x double]* %arraydecay, [1000 x double]* %arraydecay2), !dbg !87
  %cmp = icmp sgt i32 %argc, 42, !dbg !88
  br i1 %cmp, label %if.end41, label %if.end48, !dbg !89

if.end41:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !77), !dbg !90
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !40, metadata !77), !dbg !91
  %0 = load i8** %argv, align 8, !dbg !92, !tbaa !94
  %1 = load i8* %0, align 1, !dbg !92, !tbaa !98
  %phitmp = icmp eq i8 %1, 0, !dbg !90
  br i1 %phitmp, label %if.then46, label %if.end48, !dbg !89

if.then46:                                        ; preds = %if.end41
  tail call fastcc void @print_array([1000 x double]* %arraydecay), !dbg !99
  br label %if.end48, !dbg !99

if.end48:                                         ; preds = %if.end41, %if.then46, %entry
  tail call void @free(i8* %call) #4, !dbg !101
  tail call void @free(i8* %call1) #4, !dbg !102
  ret i32 0, !dbg !103
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture %A, [1000 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !69, metadata !77), !dbg !104
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !77), !dbg !105
  br label %for.cond1.preheader, !dbg !106

for.cond1.preheader:                              ; preds = %for.inc20, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc20 ]
  %0 = trunc i64 %indvars.iv5 to i32, !dbg !108
  %conv = sitofp i32 %0 to double, !dbg !108
  br label %for.body3, !dbg !113

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = add nuw nsw i64 %indvars.iv, 2, !dbg !114
  %2 = trunc i64 %1 to i32, !dbg !115
  %conv4 = sitofp i32 %2 to double, !dbg !115
  %mul = fmul double %conv, %conv4, !dbg !108
  %add5 = fadd double %mul, 2.000000e+00, !dbg !108
  %div = fdiv double %add5, 1.000000e+03, !dbg !116
  %arrayidx8 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv, !dbg !117
  store double %div, double* %arrayidx8, align 8, !dbg !117, !tbaa !118
  %3 = add nuw nsw i64 %indvars.iv, 3, !dbg !120
  %4 = trunc i64 %3 to i32, !dbg !121
  %conv11 = sitofp i32 %4 to double, !dbg !121
  %mul12 = fmul double %conv, %conv11, !dbg !122
  %add13 = fadd double %mul12, 3.000000e+00, !dbg !122
  %div15 = fdiv double %add13, 1.000000e+03, !dbg !123
  %arrayidx19 = getelementptr inbounds [1000 x double]* %B, i64 %indvars.iv5, i64 %indvars.iv, !dbg !124
  store double %div15, double* %arrayidx19, align 8, !dbg !124, !tbaa !118
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !113
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !113
  br i1 %exitcond, label %for.inc20, label %for.body3, !dbg !113

for.inc20:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !106
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000, !dbg !106
  br i1 %exitcond7, label %for.end22, label %for.cond1.preheader, !dbg !106

for.end22:                                        ; preds = %for.inc20
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_jacobi_2d_imper([1000 x double]* nocapture %A, [1000 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 20, i64 0, metadata !58, metadata !77), !dbg !126
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !59, metadata !77), !dbg !127
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !77), !dbg !128
  br label %for.cond1.preheader, !dbg !129

for.cond1.preheader:                              ; preds = %for.inc62, %entry
  %t.05 = phi i32 [ 0, %entry ], [ %inc63, %for.inc62 ]
  br label %for.cond4.preheader, !dbg !131

for.cond4.preheader:                              ; preds = %for.inc37, %for.cond1.preheader
  %indvars.iv7 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next8, %for.inc37 ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !131
  %0 = add nsw i64 %indvars.iv7, -1, !dbg !135
  br label %for.body7, !dbg !139

for.body7:                                        ; preds = %for.body7, %for.cond4.preheader
  %indvars.iv = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next, %for.body7 ]
  %arrayidx9 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv, !dbg !140
  %1 = load double* %arrayidx9, align 8, !dbg !140, !tbaa !118
  %2 = add nsw i64 %indvars.iv, -1, !dbg !141
  %arrayidx14 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv7, i64 %2, !dbg !142
  %3 = load double* %arrayidx14, align 8, !dbg !142, !tbaa !118
  %add = fadd double %1, %3, !dbg !140
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !139
  %arrayidx19 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv.next, !dbg !143
  %4 = load double* %arrayidx19, align 8, !dbg !143, !tbaa !118
  %add20 = fadd double %add, %4, !dbg !140
  %arrayidx25 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv.next8, i64 %indvars.iv, !dbg !144
  %5 = load double* %arrayidx25, align 8, !dbg !144, !tbaa !118
  %add26 = fadd double %add20, %5, !dbg !140
  %arrayidx31 = getelementptr inbounds [1000 x double]* %A, i64 %0, i64 %indvars.iv, !dbg !145
  %6 = load double* %arrayidx31, align 8, !dbg !145, !tbaa !118
  %add32 = fadd double %add26, %6, !dbg !140
  %mul = fmul double %add32, 2.000000e-01, !dbg !146
  %arrayidx36 = getelementptr inbounds [1000 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv, !dbg !147
  store double %mul, double* %arrayidx36, align 8, !dbg !147, !tbaa !118
  %exitcond = icmp eq i64 %indvars.iv.next, 999, !dbg !139
  br i1 %exitcond, label %for.inc37, label %for.body7, !dbg !139

for.inc37:                                        ; preds = %for.body7
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 999, !dbg !131
  br i1 %exitcond10, label %for.cond44.preheader, label %for.cond4.preheader, !dbg !131

for.cond44.preheader:                             ; preds = %for.inc37, %for.inc59
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.inc59 ], [ 1, %for.inc37 ]
  br label %for.body47, !dbg !148

for.body47:                                       ; preds = %for.body47, %for.cond44.preheader
  %indvars.iv11 = phi i64 [ 1, %for.cond44.preheader ], [ %indvars.iv.next12, %for.body47 ]
  %arrayidx51 = getelementptr inbounds [1000 x double]* %B, i64 %indvars.iv15, i64 %indvars.iv11, !dbg !152
  %7 = load double* %arrayidx51, align 8, !dbg !152, !tbaa !118
  %arrayidx55 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv11, !dbg !154
  store double %7, double* %arrayidx55, align 8, !dbg !154, !tbaa !118
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !148
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 999, !dbg !148
  br i1 %exitcond13, label %for.inc59, label %for.body47, !dbg !148

for.inc59:                                        ; preds = %for.body47
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !155
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 999, !dbg !155
  br i1 %exitcond17, label %for.inc62, label %for.cond44.preheader, !dbg !155

for.inc62:                                        ; preds = %for.inc59
  %inc63 = add nuw nsw i32 %t.05, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %inc63, i64 0, metadata !62, metadata !77), !dbg !128
  %exitcond18 = icmp eq i32 %inc63, 20, !dbg !129
  br i1 %exitcond18, label %for.end64, label %for.cond1.preheader, !dbg !129

for.end64:                                        ; preds = %for.inc62
  ret void, !dbg !157
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !50, metadata !77), !dbg !158
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !77), !dbg !159
  br label %for.cond1.preheader, !dbg !160

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = mul nsw i64 %indvars.iv7, 1000, !dbg !162
  br label %for.body3, !dbg !168

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !169, !tbaa !94
  %arrayidx5 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv, !dbg !170
  %2 = load double* %arrayidx5, align 8, !dbg !170, !tbaa !118
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !171
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !162
  %4 = trunc i64 %3 to i32, !dbg !172
  %rem = srem i32 %4, 20, !dbg !172
  %cmp6 = icmp eq i32 %rem, 0, !dbg !172
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !173

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !174, !tbaa !94
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !176
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !168
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !168
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !168

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !160
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000, !dbg !160
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !160

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !177, !tbaa !94
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !178
  ret void, !dbg !179
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
!llvm.module.flags = !{!74, !75}
!llvm.ident = !{!76}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c] [DW_LANG_C99]
!1 = !{!"jacobi-2d-imper.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0064000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001000"}                        ; [ DW_TAG_subrange_type ] [0, 999]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper"}
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
!21 = !{!22, !43, !54, !65}
!22 = !{!"0x2e\00main\00main\00\0081\000\001\000\000\00256\001\0082", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 81] [def] [scope 82] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !39, !40, !42}
!30 = !{!"0x101\00argc\0016777297\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 81]
!31 = !{!"0x101\00argv\0033554513\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 81]
!32 = !{!"0x100\00n\0084\000", !22, !23, !26}     ; [ DW_TAG_auto_variable ] [n] [line 84]
!33 = !{!"0x100\00tsteps\0085\000", !22, !23, !26} ; [ DW_TAG_auto_variable ] [tsteps] [line 85]
!34 = !{!"0x100\00A\0088\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 88]
!35 = !{!"0x100\00B\0089\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [B] [line 89]
!36 = !{!"0x100\00__s1_len\00107\000", !37, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 107]
!37 = !{!"0xb\00107\003\001", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!38 = !{!"0xb\00107\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!39 = !{!"0x100\00__s2_len\00107\000", !37, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 107]
!40 = !{!"0x100\00__s2\00107\000", !41, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 107]
!41 = !{!"0xb\00107\003\002", !1, !37}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!42 = !{!"0x100\00__result\00107\000", !41, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 107]
!43 = !{!"0x2e\00print_array\00print_array\00\0041\001\001\000\000\00256\001\0044", !1, !23, !44, null, void ([1000 x double]*)* @print_array, null, null, !49} ; [ DW_TAG_subprogram ] [line 41] [local] [def] [scope 44] [print_array]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{null, !26, !46}
!46 = !{!"0xf\00\000\0064\0064\000\000", null, null, !47} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!47 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !6, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from double]
!48 = !{!8}
!49 = !{!50, !51, !52, !53}
!50 = !{!"0x101\00n\0016777257\000", !43, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 41]
!51 = !{!"0x101\00A\0033554474\000", !43, !23, !46} ; [ DW_TAG_arg_variable ] [A] [line 42]
!52 = !{!"0x100\00i\0045\000", !43, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!53 = !{!"0x100\00j\0045\000", !43, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!54 = !{!"0x2e\00kernel_jacobi_2d_imper\00kernel_jacobi_2d_imper\00\0059\001\001\000\000\00256\001\0063", !1, !23, !55, null, void ([1000 x double]*, [1000 x double]*)* @kernel_jacobi_2d_imper, null, null, !57} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 63] [kernel_jacobi_2d_imper]
!55 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !56, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = !{null, !26, !26, !46, !46}
!57 = !{!58, !59, !60, !61, !62, !63, !64}
!58 = !{!"0x101\00tsteps\0016777275\000", !54, !23, !26} ; [ DW_TAG_arg_variable ] [tsteps] [line 59]
!59 = !{!"0x101\00n\0033554492\000", !54, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 60]
!60 = !{!"0x101\00A\0050331709\000", !54, !23, !46} ; [ DW_TAG_arg_variable ] [A] [line 61]
!61 = !{!"0x101\00B\0067108926\000", !54, !23, !46} ; [ DW_TAG_arg_variable ] [B] [line 62]
!62 = !{!"0x100\00t\0064\000", !54, !23, !26}     ; [ DW_TAG_auto_variable ] [t] [line 64]
!63 = !{!"0x100\00i\0064\000", !54, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 64]
!64 = !{!"0x100\00j\0064\000", !54, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 64]
!65 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !23, !66, null, void ([1000 x double]*, [1000 x double]*)* @init_array, null, null, !68} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!66 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !67, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = !{null, !26, !46, !46}
!68 = !{!69, !70, !71, !72, !73}
!69 = !{!"0x101\00n\0016777239\000", !65, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!70 = !{!"0x101\00A\0033554456\000", !65, !23, !46} ; [ DW_TAG_arg_variable ] [A] [line 24]
!71 = !{!"0x101\00B\0050331673\000", !65, !23, !46} ; [ DW_TAG_arg_variable ] [B] [line 25]
!72 = !{!"0x100\00i\0027\000", !65, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!73 = !{!"0x100\00j\0027\000", !65, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!74 = !{i32 2, !"Dwarf Version", i32 4}
!75 = !{i32 2, !"Debug Info Version", i32 2}
!76 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!77 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!78 = !MDLocation(line: 81, column: 14, scope: !22)
!79 = !MDLocation(line: 81, column: 27, scope: !22)
!80 = !MDLocation(line: 84, column: 7, scope: !22)
!81 = !MDLocation(line: 85, column: 7, scope: !22)
!82 = !MDLocation(line: 88, column: 3, scope: !22)
!83 = !MDLocation(line: 89, column: 3, scope: !22)
!84 = !MDLocation(line: 93, column: 18, scope: !22)
!85 = !MDLocation(line: 93, column: 38, scope: !22)
!86 = !MDLocation(line: 93, column: 3, scope: !22)
!87 = !MDLocation(line: 99, column: 3, scope: !22)
!88 = !MDLocation(line: 107, column: 3, scope: !38)
!89 = !MDLocation(line: 107, column: 3, scope: !22)
!90 = !MDLocation(line: 107, column: 3, scope: !37)
!91 = !MDLocation(line: 107, column: 3, scope: !41)
!92 = !MDLocation(line: 107, column: 3, scope: !93)
!93 = !{!"0xb\004", !1, !41}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!94 = !{!95, !95, i64 0}
!95 = !{!"any pointer", !96, i64 0}
!96 = !{!"omnipotent char", !97, i64 0}
!97 = !{!"Simple C/C++ TBAA"}
!98 = !{!96, !96, i64 0}
!99 = !MDLocation(line: 107, column: 3, scope: !100)
!100 = !{!"0xb\0023", !1, !38}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!101 = !MDLocation(line: 110, column: 3, scope: !22)
!102 = !MDLocation(line: 111, column: 3, scope: !22)
!103 = !MDLocation(line: 113, column: 3, scope: !22)
!104 = !MDLocation(line: 23, column: 22, scope: !65)
!105 = !MDLocation(line: 27, column: 7, scope: !65)
!106 = !MDLocation(line: 29, column: 3, scope: !107)
!107 = !{!"0xb\0029\003\0025", !1, !65}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!108 = !MDLocation(line: 32, column: 13, scope: !109)
!109 = !{!"0xb\0031\007\0029", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!110 = !{!"0xb\0030\005\0028", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!111 = !{!"0xb\0030\005\0027", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!112 = !{!"0xb\0029\003\0026", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!113 = !MDLocation(line: 30, column: 5, scope: !111)
!114 = !MDLocation(line: 32, column: 28, scope: !109)
!115 = !MDLocation(line: 32, column: 27, scope: !109)
!116 = !MDLocation(line: 32, column: 12, scope: !109)
!117 = !MDLocation(line: 32, column: 2, scope: !109)
!118 = !{!119, !119, i64 0}
!119 = !{!"double", !96, i64 0}
!120 = !MDLocation(line: 33, column: 28, scope: !109)
!121 = !MDLocation(line: 33, column: 27, scope: !109)
!122 = !MDLocation(line: 33, column: 13, scope: !109)
!123 = !MDLocation(line: 33, column: 12, scope: !109)
!124 = !MDLocation(line: 33, column: 2, scope: !109)
!125 = !MDLocation(line: 35, column: 1, scope: !65)
!126 = !MDLocation(line: 59, column: 33, scope: !54)
!127 = !MDLocation(line: 60, column: 12, scope: !54)
!128 = !MDLocation(line: 64, column: 7, scope: !54)
!129 = !MDLocation(line: 67, column: 3, scope: !130)
!130 = !{!"0xb\0067\003\0014", !1, !54}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!131 = !MDLocation(line: 69, column: 7, scope: !132)
!132 = !{!"0xb\0069\007\0017", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!133 = !{!"0xb\0068\005\0016", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!134 = !{!"0xb\0067\003\0015", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!135 = !MDLocation(line: 71, column: 69, scope: !136)
!136 = !{!"0xb\0070\002\0020", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!137 = !{!"0xb\0070\002\0019", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!138 = !{!"0xb\0069\007\0018", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!139 = !MDLocation(line: 70, column: 2, scope: !137)
!140 = !MDLocation(line: 71, column: 21, scope: !136)
!141 = !MDLocation(line: 71, column: 36, scope: !136)
!142 = !MDLocation(line: 71, column: 31, scope: !136)
!143 = !MDLocation(line: 71, column: 43, scope: !136)
!144 = !MDLocation(line: 71, column: 55, scope: !136)
!145 = !MDLocation(line: 71, column: 67, scope: !136)
!146 = !MDLocation(line: 71, column: 14, scope: !136)
!147 = !MDLocation(line: 71, column: 4, scope: !136)
!148 = !MDLocation(line: 73, column: 2, scope: !149)
!149 = !{!"0xb\0073\002\0023", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!150 = !{!"0xb\0072\007\0022", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!151 = !{!"0xb\0072\007\0021", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!152 = !MDLocation(line: 74, column: 14, scope: !153)
!153 = !{!"0xb\0073\002\0024", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!154 = !MDLocation(line: 74, column: 4, scope: !153)
!155 = !MDLocation(line: 72, column: 7, scope: !151)
!156 = !MDLocation(line: 67, column: 27, scope: !134)
!157 = !MDLocation(line: 78, column: 1, scope: !54)
!158 = !MDLocation(line: 41, column: 22, scope: !43)
!159 = !MDLocation(line: 45, column: 7, scope: !43)
!160 = !MDLocation(line: 47, column: 3, scope: !161)
!161 = !{!"0xb\0047\003\008", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!162 = !MDLocation(line: 50, column: 12, scope: !163)
!163 = !{!"0xb\0050\0011\0013", !1, !164}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!164 = !{!"0xb\0048\0029\0012", !1, !165}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!165 = !{!"0xb\0048\005\0011", !1, !166}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!166 = !{!"0xb\0048\005\0010", !1, !167}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!167 = !{!"0xb\0047\003\009", !1, !161}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!168 = !MDLocation(line: 48, column: 5, scope: !166)
!169 = !MDLocation(line: 49, column: 15, scope: !164)
!170 = !MDLocation(line: 49, column: 45, scope: !164)
!171 = !MDLocation(line: 49, column: 7, scope: !164)
!172 = !MDLocation(line: 50, column: 11, scope: !163)
!173 = !MDLocation(line: 50, column: 11, scope: !164)
!174 = !MDLocation(line: 50, column: 42, scope: !175)
!175 = !{!"0xb\001", !1, !163}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-2d-imper/jacobi-2d-imper.c]
!176 = !MDLocation(line: 50, column: 34, scope: !163)
!177 = !MDLocation(line: 52, column: 11, scope: !43)
!178 = !MDLocation(line: 52, column: 3, scope: !43)
!179 = !MDLocation(line: 53, column: 1, scope: !43)
