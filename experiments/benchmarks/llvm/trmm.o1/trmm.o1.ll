; ModuleID = 'trmm.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !79), !dbg !80
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !79), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !79), !dbg !82
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !83
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !84
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !85
  %arraydecay2 = bitcast i8* %call1 to [1024 x double]*, !dbg !86
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !33, metadata !79), !dbg !87
  call fastcc void @init_array(double* %alpha, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay2), !dbg !88
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !33, metadata !79), !dbg !87
  %0 = load double* %alpha, align 8, !dbg !89, !tbaa !90
  tail call fastcc void @kernel_trmm(double %0, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay2), !dbg !94
  %cmp = icmp sgt i32 %argc, 42, !dbg !95
  br i1 %cmp, label %if.end41, label %if.end48, !dbg !96

if.end41:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !79), !dbg !97
  tail call void @llvm.dbg.value(metadata i8* %1, i64 0, metadata !40, metadata !79), !dbg !98
  %1 = load i8** %argv, align 8, !dbg !99, !tbaa !101
  %2 = load i8* %1, align 1, !dbg !99, !tbaa !103
  %phitmp = icmp eq i8 %2, 0, !dbg !97
  br i1 %phitmp, label %if.then46, label %if.end48, !dbg !96

if.then46:                                        ; preds = %if.end41
  tail call fastcc void @print_array([1024 x double]* %arraydecay2), !dbg !104
  br label %if.end48, !dbg !104

if.end48:                                         ; preds = %if.end41, %if.then46, %entry
  tail call void @free(i8* %call) #4, !dbg !106
  tail call void @free(i8* %call1) #4, !dbg !107
  ret i32 0, !dbg !108
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, [1024 x double]* nocapture %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !70, metadata !79), !dbg !109
  store double 3.241200e+04, double* %alpha, align 8, !dbg !110, !tbaa !90
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !74, metadata !79), !dbg !111
  br label %for.cond1.preheader, !dbg !112

for.cond1.preheader:                              ; preds = %for.inc17, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc17 ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !114
  %conv = sitofp i32 %0 to double, !dbg !114
  br label %for.body3, !dbg !119

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !120
  %conv4 = sitofp i32 %1 to double, !dbg !120
  %mul = fmul double %conv, %conv4, !dbg !114
  %div = fmul double %mul, 9.765625e-04, !dbg !121
  %arrayidx7 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !122
  store double %div, double* %arrayidx7, align 8, !dbg !122, !tbaa !90
  %arrayidx16 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv, !dbg !123
  store double %div, double* %arrayidx16, align 8, !dbg !123, !tbaa !90
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !119
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !119
  br i1 %exitcond, label %for.inc17, label %for.body3, !dbg !119

for.inc17:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !112
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1024, !dbg !112
  br i1 %exitcond5, label %for.end19, label %for.cond1.preheader, !dbg !112

for.end19:                                        ; preds = %for.inc17
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_trmm(double %alpha, [1024 x double]* nocapture readonly %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !58, metadata !79), !dbg !125
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !62, metadata !79), !dbg !126
  br label %for.cond1.preheader, !dbg !127

for.cond1.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv10 = phi i64 [ 1, %entry ], [ %indvars.iv.next11, %for.inc21 ]
  %indvars.iv5 = phi i32 [ 1, %entry ], [ %indvars.iv.next6, %for.inc21 ]
  br label %for.body6.lr.ph, !dbg !129

for.body6.lr.ph:                                  ; preds = %for.cond1.preheader, %for.inc18
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.inc18 ]
  %arrayidx17 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv7, !dbg !132
  br label %for.body6, !dbg !136

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv, !dbg !137
  %0 = load double* %arrayidx8, align 8, !dbg !137, !tbaa !90
  %mul = fmul double %0, %alpha, !dbg !138
  %arrayidx12 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv, !dbg !139
  %1 = load double* %arrayidx12, align 8, !dbg !139, !tbaa !90
  %mul13 = fmul double %mul, %1, !dbg !138
  %2 = load double* %arrayidx17, align 8, !dbg !132, !tbaa !90
  %add = fadd double %2, %mul13, !dbg !132
  store double %add, double* %arrayidx17, align 8, !dbg !132, !tbaa !90
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !136
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !136
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv5, !dbg !136
  br i1 %exitcond, label %for.inc18, label %for.body6, !dbg !136

for.inc18:                                        ; preds = %for.body6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !129
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !129
  br i1 %exitcond9, label %for.inc21, label %for.body6.lr.ph, !dbg !129

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !127
  %indvars.iv.next6 = add nuw nsw i32 %indvars.iv5, 1, !dbg !127
  tail call void @llvm.dbg.value(metadata i32 %indvars.iv.next6, i64 0, metadata !62, metadata !79), !dbg !126
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1024, !dbg !127
  br i1 %exitcond12, label %for.end23, label %for.cond1.preheader, !dbg !127

for.end23:                                        ; preds = %for.inc21
  ret void, !dbg !140
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !50, metadata !79), !dbg !141
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !79), !dbg !142
  br label %for.cond1.preheader, !dbg !143

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !145
  br label %for.body3, !dbg !151

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !152, !tbaa !101
  %arrayidx5 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv, !dbg !153
  %2 = load double* %arrayidx5, align 8, !dbg !153, !tbaa !90
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !154
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !145
  %4 = trunc i64 %3 to i32, !dbg !155
  %rem = srem i32 %4, 20, !dbg !155
  %cmp6 = icmp eq i32 %rem, 0, !dbg !155
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !156

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !157, !tbaa !101
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !159
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !151
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !151
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !151

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !143
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !143
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !143

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !160, !tbaa !101
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !161
  ret void, !dbg !162
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
!llvm.module.flags = !{!76, !77}
!llvm.ident = !{!78}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c] [DW_LANG_C99]
!1 = !{!"trmm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm"}
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
!22 = !{!"0x2e\00main\00main\00\0077\000\001\000\000\00256\001\0078", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 77] [def] [scope 78] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !39, !40, !42}
!30 = !{!"0x101\00argc\0016777293\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 77]
!31 = !{!"0x101\00argv\0033554509\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 77]
!32 = !{!"0x100\00ni\0080\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 80]
!33 = !{!"0x100\00alpha\0083\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 83]
!34 = !{!"0x100\00A\0084\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 84]
!35 = !{!"0x100\00B\0085\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [B] [line 85]
!36 = !{!"0x100\00__s1_len\00102\000", !37, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 102]
!37 = !{!"0xb\00102\003\001", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!38 = !{!"0xb\00102\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!39 = !{!"0x100\00__s2_len\00102\000", !37, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 102]
!40 = !{!"0x100\00__s2\00102\000", !41, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 102]
!41 = !{!"0xb\00102\003\002", !1, !37}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!42 = !{!"0x100\00__result\00102\000", !41, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 102]
!43 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0044", !1, !23, !44, null, void ([1024 x double]*)* @print_array, null, null, !49} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{null, !26, !46}
!46 = !{!"0xf\00\000\0064\0064\000\000", null, null, !47} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!47 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!48 = !{!8}
!49 = !{!50, !51, !52, !53}
!50 = !{!"0x101\00ni\0016777258\000", !43, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 42]
!51 = !{!"0x101\00B\0033554475\000", !43, !23, !46} ; [ DW_TAG_arg_variable ] [B] [line 43]
!52 = !{!"0x100\00i\0045\000", !43, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!53 = !{!"0x100\00j\0045\000", !43, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!54 = !{!"0x2e\00kernel_trmm\00kernel_trmm\00\0059\001\001\000\000\00256\001\0063", !1, !23, !55, null, void (double, [1024 x double]*, [1024 x double]*)* @kernel_trmm, null, null, !57} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 63] [kernel_trmm]
!55 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !56, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = !{null, !26, !6, !46, !46}
!57 = !{!58, !59, !60, !61, !62, !63, !64}
!58 = !{!"0x101\00ni\0016777275\000", !54, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 59]
!59 = !{!"0x101\00alpha\0033554492\000", !54, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 60]
!60 = !{!"0x101\00A\0050331709\000", !54, !23, !46} ; [ DW_TAG_arg_variable ] [A] [line 61]
!61 = !{!"0x101\00B\0067108926\000", !54, !23, !46} ; [ DW_TAG_arg_variable ] [B] [line 62]
!62 = !{!"0x100\00i\0064\000", !54, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 64]
!63 = !{!"0x100\00j\0064\000", !54, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 64]
!64 = !{!"0x100\00k\0064\000", !54, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 64]
!65 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !23, !66, null, void (double*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !69} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!66 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !67, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = !{null, !26, !68, !46, !46}
!68 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!69 = !{!70, !71, !72, !73, !74, !75}
!70 = !{!"0x101\00ni\0016777239\000", !65, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!71 = !{!"0x101\00alpha\0033554456\000", !65, !23, !68} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!72 = !{!"0x101\00A\0050331673\000", !65, !23, !46} ; [ DW_TAG_arg_variable ] [A] [line 25]
!73 = !{!"0x101\00B\0067108890\000", !65, !23, !46} ; [ DW_TAG_arg_variable ] [B] [line 26]
!74 = !{!"0x100\00i\0028\000", !65, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!75 = !{!"0x100\00j\0028\000", !65, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 2}
!78 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!79 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!80 = !MDLocation(line: 77, column: 14, scope: !22)
!81 = !MDLocation(line: 77, column: 27, scope: !22)
!82 = !MDLocation(line: 80, column: 7, scope: !22)
!83 = !MDLocation(line: 84, column: 3, scope: !22)
!84 = !MDLocation(line: 85, column: 3, scope: !22)
!85 = !MDLocation(line: 88, column: 27, scope: !22)
!86 = !MDLocation(line: 88, column: 47, scope: !22)
!87 = !MDLocation(line: 83, column: 13, scope: !22)
!88 = !MDLocation(line: 88, column: 3, scope: !22)
!89 = !MDLocation(line: 94, column: 20, scope: !22)
!90 = !{!91, !91, i64 0}
!91 = !{!"double", !92, i64 0}
!92 = !{!"omnipotent char", !93, i64 0}
!93 = !{!"Simple C/C++ TBAA"}
!94 = !MDLocation(line: 94, column: 3, scope: !22)
!95 = !MDLocation(line: 102, column: 3, scope: !38)
!96 = !MDLocation(line: 102, column: 3, scope: !22)
!97 = !MDLocation(line: 102, column: 3, scope: !37)
!98 = !MDLocation(line: 102, column: 3, scope: !41)
!99 = !MDLocation(line: 102, column: 3, scope: !100)
!100 = !{!"0xb\004", !1, !41}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!101 = !{!102, !102, i64 0}
!102 = !{!"any pointer", !92, i64 0}
!103 = !{!92, !92, i64 0}
!104 = !MDLocation(line: 102, column: 3, scope: !105)
!105 = !{!"0xb\0023", !1, !38}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!106 = !MDLocation(line: 105, column: 3, scope: !22)
!107 = !MDLocation(line: 106, column: 3, scope: !22)
!108 = !MDLocation(line: 108, column: 3, scope: !22)
!109 = !MDLocation(line: 23, column: 21, scope: !65)
!110 = !MDLocation(line: 30, column: 3, scope: !65)
!111 = !MDLocation(line: 28, column: 7, scope: !65)
!112 = !MDLocation(line: 31, column: 3, scope: !113)
!113 = !{!"0xb\0031\003\0020", !1, !65}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!114 = !MDLocation(line: 33, column: 18, scope: !115)
!115 = !{!"0xb\0032\0030\0024", !1, !116}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!116 = !{!"0xb\0032\005\0023", !1, !117}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!117 = !{!"0xb\0032\005\0022", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!118 = !{!"0xb\0031\003\0021", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!119 = !MDLocation(line: 32, column: 5, scope: !117)
!120 = !MDLocation(line: 33, column: 32, scope: !115)
!121 = !MDLocation(line: 33, column: 17, scope: !115)
!122 = !MDLocation(line: 33, column: 7, scope: !115)
!123 = !MDLocation(line: 34, column: 7, scope: !115)
!124 = !MDLocation(line: 36, column: 1, scope: !65)
!125 = !MDLocation(line: 59, column: 22, scope: !54)
!126 = !MDLocation(line: 64, column: 7, scope: !54)
!127 = !MDLocation(line: 68, column: 3, scope: !128)
!128 = !{!"0xb\0068\003\0014", !1, !54}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!129 = !MDLocation(line: 69, column: 5, scope: !130)
!130 = !{!"0xb\0069\005\0016", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!131 = !{!"0xb\0068\003\0015", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!132 = !MDLocation(line: 71, column: 9, scope: !133)
!133 = !{!"0xb\0070\007\0019", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!134 = !{!"0xb\0070\007\0018", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!135 = !{!"0xb\0069\005\0017", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!136 = !MDLocation(line: 70, column: 7, scope: !134)
!137 = !MDLocation(line: 71, column: 28, scope: !133)
!138 = !MDLocation(line: 71, column: 20, scope: !133)
!139 = !MDLocation(line: 71, column: 38, scope: !133)
!140 = !MDLocation(line: 74, column: 1, scope: !54)
!141 = !MDLocation(line: 42, column: 22, scope: !43)
!142 = !MDLocation(line: 45, column: 7, scope: !43)
!143 = !MDLocation(line: 47, column: 3, scope: !144)
!144 = !{!"0xb\0047\003\008", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!145 = !MDLocation(line: 50, column: 7, scope: !146)
!146 = !{!"0xb\0050\006\0013", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!147 = !{!"0xb\0048\0030\0012", !1, !148}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!148 = !{!"0xb\0048\005\0011", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!149 = !{!"0xb\0048\005\0010", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!150 = !{!"0xb\0047\003\009", !1, !144}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!151 = !MDLocation(line: 48, column: 5, scope: !149)
!152 = !MDLocation(line: 49, column: 11, scope: !147)
!153 = !MDLocation(line: 49, column: 41, scope: !147)
!154 = !MDLocation(line: 49, column: 2, scope: !147)
!155 = !MDLocation(line: 50, column: 6, scope: !146)
!156 = !MDLocation(line: 50, column: 6, scope: !147)
!157 = !MDLocation(line: 50, column: 39, scope: !158)
!158 = !{!"0xb\001", !1, !146}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!159 = !MDLocation(line: 50, column: 30, scope: !146)
!160 = !MDLocation(line: 52, column: 12, scope: !43)
!161 = !MDLocation(line: 52, column: 3, scope: !43)
!162 = !MDLocation(line: 53, column: 1, scope: !43)
