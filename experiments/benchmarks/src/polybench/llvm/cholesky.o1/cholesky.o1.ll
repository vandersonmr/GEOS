; ModuleID = 'cholesky.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !75), !dbg !76
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !75), !dbg !77
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !35, metadata !75), !dbg !78
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #5, !dbg !79
  %call1 = tail call i8* @polybench_alloc_data(i32 1024, i32 8) #5, !dbg !80
  %arraydecay = bitcast i8* %call1 to double*, !dbg !81
  %arraydecay2 = bitcast i8* %call to [1024 x double]*, !dbg !82
  tail call fastcc void @init_array(double* %arraydecay, [1024 x double]* %arraydecay2), !dbg !83
  tail call fastcc void @kernel_cholesky(double* %arraydecay, [1024 x double]* %arraydecay2), !dbg !84
  %cmp = icmp sgt i32 %argc, 42, !dbg !85
  br i1 %cmp, label %if.end41, label %if.end48, !dbg !86

if.end41:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !75), !dbg !87
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !42, metadata !75), !dbg !88
  %0 = load i8** %argv, align 8, !dbg !89, !tbaa !91
  %1 = load i8* %0, align 1, !dbg !89, !tbaa !95
  %phitmp = icmp eq i8 %1, 0, !dbg !87
  br i1 %phitmp, label %if.then46, label %if.end48, !dbg !86

if.then46:                                        ; preds = %if.end41
  tail call fastcc void @print_array([1024 x double]* %arraydecay2), !dbg !96
  unreachable

if.end48:                                         ; preds = %if.end41, %entry
  tail call void @free(i8* %call) #5, !dbg !98
  tail call void @free(i8* %call1) #5, !dbg !99
  ret i32 0, !dbg !100
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %p, [1024 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !67, metadata !75), !dbg !101
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !75), !dbg !102
  br label %for.body, !dbg !103

for.body:                                         ; preds = %for.inc11, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc11 ]
  %arrayidx = getelementptr inbounds double* %p, i64 %indvars.iv3, !dbg !105
  store double 9.765625e-04, double* %arrayidx, align 8, !dbg !105, !tbaa !108
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !75), !dbg !110
  br label %for.body4, !dbg !111

for.body4:                                        ; preds = %for.body4, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body4 ]
  %arrayidx10 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !113
  store double 9.765625e-04, double* %arrayidx10, align 8, !dbg !113, !tbaa !108
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !111
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !111
  br i1 %exitcond, label %for.inc11, label %for.body4, !dbg !111

for.inc11:                                        ; preds = %for.body4
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !103
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1024, !dbg !103
  br i1 %exitcond5, label %for.end13, label %for.body, !dbg !103

for.end13:                                        ; preds = %for.inc11
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_cholesky(double* nocapture %p, [1024 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !58, metadata !75), !dbg !116
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !61, metadata !75), !dbg !117
  br label %for.body, !dbg !118

for.cond.loopexit:                                ; preds = %for.end40, %for.end
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !118
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 1024, !dbg !118
  br i1 %exitcond21, label %for.end53, label %for.body, !dbg !118

for.body:                                         ; preds = %for.cond.loopexit, %entry
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.cond.loopexit ]
  %indvars.iv14 = phi i64 [ 1, %entry ], [ %indvars.iv.next15, %for.cond.loopexit ]
  %arrayidx2 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv18, !dbg !120
  %0 = load double* %arrayidx2, align 8, !dbg !120, !tbaa !108
  tail call void @llvm.dbg.value(metadata double %0, i64 0, metadata !64, metadata !75), !dbg !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !75), !dbg !124
  %1 = add nsw i64 %indvars.iv18, -1, !dbg !125
  %cmp41 = icmp slt i64 %indvars.iv18, 1, !dbg !128
  br i1 %cmp41, label %for.end, label %for.body5, !dbg !129

for.body5:                                        ; preds = %for.body, %for.body5
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body5 ], [ 0, %for.body ]
  %x.03 = phi double [ %sub14, %for.body5 ], [ %0, %for.body ]
  %arrayidx9 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv, !dbg !130
  %2 = load double* %arrayidx9, align 8, !dbg !130, !tbaa !108
  %mul = fmul double %2, %2, !dbg !130
  %sub14 = fsub double %x.03, %mul, !dbg !131
  tail call void @llvm.dbg.value(metadata double %sub14, i64 0, metadata !64, metadata !75), !dbg !123
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !129
  %cmp4 = icmp slt i64 %indvars.iv, %1, !dbg !128
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !129

for.end:                                          ; preds = %for.body5, %for.body
  %x.0.lcssa = phi double [ %0, %for.body ], [ %sub14, %for.body5 ]
  %call = tail call double @sqrt(double %x.0.lcssa) #5, !dbg !132
  %div = fdiv double 1.000000e+00, %call, !dbg !133
  %arrayidx16 = getelementptr inbounds double* %p, i64 %indvars.iv18, !dbg !134
  store double %div, double* %arrayidx16, align 8, !dbg !134, !tbaa !108
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !118
  %cmp189 = icmp slt i64 %indvars.iv.next19, 1024, !dbg !135
  br i1 %cmp189, label %for.body19.lr.ph, label %for.cond.loopexit, !dbg !138

for.body19.lr.ph:                                 ; preds = %for.end
  %cmp265 = icmp slt i64 %indvars.iv18, 1, !dbg !139
  br label %for.body19, !dbg !138

for.body19:                                       ; preds = %for.end40, %for.body19.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv14, %for.body19.lr.ph ], [ %indvars.iv.next17, %for.end40 ]
  %arrayidx23 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv16, !dbg !143
  %3 = load double* %arrayidx23, align 8, !dbg !143, !tbaa !108
  tail call void @llvm.dbg.value(metadata double %3, i64 0, metadata !64, metadata !75), !dbg !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !75), !dbg !144
  br i1 %cmp265, label %for.end40, label %for.body27, !dbg !145

for.body27:                                       ; preds = %for.body19, %for.body27
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body27 ], [ 0, %for.body19 ]
  %x.17 = phi double [ %sub37, %for.body27 ], [ %3, %for.body19 ]
  %arrayidx31 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv12, !dbg !146
  %4 = load double* %arrayidx31, align 8, !dbg !146, !tbaa !108
  %arrayidx35 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12, !dbg !147
  %5 = load double* %arrayidx35, align 8, !dbg !147, !tbaa !108
  %mul36 = fmul double %4, %5, !dbg !146
  %sub37 = fsub double %x.17, %mul36, !dbg !148
  tail call void @llvm.dbg.value(metadata double %sub37, i64 0, metadata !64, metadata !75), !dbg !123
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !145
  %cmp26 = icmp slt i64 %indvars.iv12, %1, !dbg !139
  br i1 %cmp26, label %for.body27, label %for.end40, !dbg !145

for.end40:                                        ; preds = %for.body27, %for.body19
  %x.1.lcssa = phi double [ %3, %for.body19 ], [ %sub37, %for.body27 ]
  %6 = load double* %arrayidx16, align 8, !dbg !149, !tbaa !108
  %mul43 = fmul double %x.1.lcssa, %6, !dbg !150
  %arrayidx47 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv18, !dbg !151
  store double %mul43, double* %arrayidx47, align 8, !dbg !151, !tbaa !108
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !138
  %lftr.wideiv = trunc i64 %indvars.iv16 to i32, !dbg !138
  %exitcond = icmp eq i32 %lftr.wideiv, 1023, !dbg !138
  br i1 %exitcond, label %for.cond.loopexit, label %for.body19, !dbg !138

for.end53:                                        ; preds = %for.cond.loopexit
  ret void, !dbg !152
}

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %A) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !49, metadata !75), !dbg !153
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !51, metadata !75), !dbg !154
  br label %for.cond1.outer, !dbg !155

for.cond1.outer:                                  ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %cmp2 = icmp slt i64 %indvars.iv, 1024, !dbg !157
  br i1 %cmp2, label %for.body3.split, label %for.cond1

for.cond1:                                        ; preds = %for.cond1.outer, %for.cond1
  br label %for.cond1, !dbg !161

for.body3.split:                                  ; preds = %for.cond1.outer
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !162, !tbaa !91
  %arrayidx5 = getelementptr inbounds [1024 x double]* %A, i64 0, i64 %indvars.iv, !dbg !164
  %1 = load double* %arrayidx5, align 8, !dbg !164, !tbaa !108
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %1) #6, !dbg !165
  %2 = trunc i64 %indvars.iv to i32, !dbg !166
  %rem = srem i32 %2, 20, !dbg !166
  %cmp6 = icmp eq i32 %rem, 0, !dbg !166
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !168

if.then:                                          ; preds = %for.body3.split
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !169, !tbaa !91
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #7, !dbg !171
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body3.split, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !172
  br label %for.cond1.outer, !dbg !172
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }
attributes #7 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!72, !73}
!llvm.ident = !{!74}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c] [DW_LANG_C99]
!1 = !{!"cholesky.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky"}
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
!24 = !{!25, !45, !53, !65}
!25 = !{!"0x2e\00main\00main\00\0086\000\001\000\000\00256\001\0087", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 86] [def] [scope 87] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !41, !42, !44}
!33 = !{!"0x101\00argc\0016777302\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 86]
!34 = !{!"0x101\00argv\0033554518\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 86]
!35 = !{!"0x100\00n\0089\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 89]
!36 = !{!"0x100\00A\0092\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 92]
!37 = !{!"0x100\00p\0093\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [p] [line 93]
!38 = !{!"0x100\00__s1_len\00111\000", !39, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 111]
!39 = !{!"0xb\00111\003\001", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!40 = !{!"0xb\00111\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!41 = !{!"0x100\00__s2_len\00111\000", !39, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 111]
!42 = !{!"0x100\00__s2\00111\000", !43, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 111]
!43 = !{!"0xb\00111\003\002", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!44 = !{!"0x100\00__result\00111\000", !43, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 111]
!45 = !{!"0x2e\00print_array\00print_array\00\0041\001\001\000\000\00256\001\0044", !1, !26, !46, null, void ([1024 x double]*)* @print_array, null, null, !48} ; [ DW_TAG_subprogram ] [line 41] [local] [def] [scope 44] [print_array]
!46 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !47, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = !{null, !29, !9}
!48 = !{!49, !50, !51, !52}
!49 = !{!"0x101\00n\0016777257\000", !45, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 41]
!50 = !{!"0x101\00A\0033554474\000", !45, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 42]
!51 = !{!"0x100\00i\0045\000", !45, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!52 = !{!"0x100\00j\0045\000", !45, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!53 = !{!"0x2e\00kernel_cholesky\00kernel_cholesky\00\0058\001\001\000\000\00256\001\0061", !1, !26, !54, null, void (double*, [1024 x double]*)* @kernel_cholesky, null, null, !57} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 61] [kernel_cholesky]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{null, !29, !56, !9}
!56 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!57 = !{!58, !59, !60, !61, !62, !63, !64}
!58 = !{!"0x101\00n\0016777274\000", !53, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 58]
!59 = !{!"0x101\00p\0033554491\000", !53, !26, !56} ; [ DW_TAG_arg_variable ] [p] [line 59]
!60 = !{!"0x101\00A\0050331708\000", !53, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 60]
!61 = !{!"0x100\00i\0062\000", !53, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 62]
!62 = !{!"0x100\00j\0062\000", !53, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 62]
!63 = !{!"0x100\00k\0062\000", !53, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 62]
!64 = !{!"0x100\00x\0064\000", !53, !26, !6}      ; [ DW_TAG_auto_variable ] [x] [line 64]
!65 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !54, null, void (double*, [1024 x double]*)* @init_array, null, null, !66} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!66 = !{!67, !68, !69, !70, !71}
!67 = !{!"0x101\00n\0016777239\000", !65, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!68 = !{!"0x101\00p\0033554456\000", !65, !26, !56} ; [ DW_TAG_arg_variable ] [p] [line 24]
!69 = !{!"0x101\00A\0050331673\000", !65, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 25]
!70 = !{!"0x100\00i\0027\000", !65, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!71 = !{!"0x100\00j\0027\000", !65, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!72 = !{i32 2, !"Dwarf Version", i32 4}
!73 = !{i32 2, !"Debug Info Version", i32 2}
!74 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!75 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!76 = !MDLocation(line: 86, column: 14, scope: !25)
!77 = !MDLocation(line: 86, column: 27, scope: !25)
!78 = !MDLocation(line: 89, column: 7, scope: !25)
!79 = !MDLocation(line: 92, column: 3, scope: !25)
!80 = !MDLocation(line: 93, column: 3, scope: !25)
!81 = !MDLocation(line: 97, column: 18, scope: !25)
!82 = !MDLocation(line: 97, column: 38, scope: !25)
!83 = !MDLocation(line: 97, column: 3, scope: !25)
!84 = !MDLocation(line: 103, column: 3, scope: !25)
!85 = !MDLocation(line: 111, column: 3, scope: !40)
!86 = !MDLocation(line: 111, column: 3, scope: !25)
!87 = !MDLocation(line: 111, column: 3, scope: !39)
!88 = !MDLocation(line: 111, column: 3, scope: !43)
!89 = !MDLocation(line: 111, column: 3, scope: !90)
!90 = !{!"0xb\004", !1, !43}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!91 = !{!92, !92, i64 0}
!92 = !{!"any pointer", !93, i64 0}
!93 = !{!"omnipotent char", !94, i64 0}
!94 = !{!"Simple C/C++ TBAA"}
!95 = !{!93, !93, i64 0}
!96 = !MDLocation(line: 111, column: 3, scope: !97)
!97 = !{!"0xb\0023", !1, !40}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!98 = !MDLocation(line: 114, column: 3, scope: !25)
!99 = !MDLocation(line: 115, column: 3, scope: !25)
!100 = !MDLocation(line: 117, column: 3, scope: !25)
!101 = !MDLocation(line: 23, column: 21, scope: !65)
!102 = !MDLocation(line: 27, column: 7, scope: !65)
!103 = !MDLocation(line: 29, column: 3, scope: !104)
!104 = !{!"0xb\0029\003\0024", !1, !65}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!105 = !MDLocation(line: 31, column: 7, scope: !106)
!106 = !{!"0xb\0030\005\0026", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!107 = !{!"0xb\0029\003\0025", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!108 = !{!109, !109, i64 0}
!109 = !{!"double", !93, i64 0}
!110 = !MDLocation(line: 27, column: 10, scope: !65)
!111 = !MDLocation(line: 32, column: 7, scope: !112)
!112 = !{!"0xb\0032\007\0027", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!113 = !MDLocation(line: 33, column: 2, scope: !114)
!114 = !{!"0xb\0032\007\0028", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!115 = !MDLocation(line: 35, column: 1, scope: !65)
!116 = !MDLocation(line: 58, column: 26, scope: !53)
!117 = !MDLocation(line: 62, column: 7, scope: !53)
!118 = !MDLocation(line: 67, column: 1, scope: !119)
!119 = !{!"0xb\0067\001\0014", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!120 = !MDLocation(line: 69, column: 9, scope: !121)
!121 = !{!"0xb\0068\003\0016", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!122 = !{!"0xb\0067\001\0015", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!123 = !MDLocation(line: 64, column: 13, scope: !53)
!124 = !MDLocation(line: 62, column: 10, scope: !53)
!125 = !MDLocation(line: 70, column: 22, scope: !126)
!126 = !{!"0xb\0070\005\0018", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!127 = !{!"0xb\0070\005\0017", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!128 = !MDLocation(line: 70, column: 17, scope: !126)
!129 = !MDLocation(line: 70, column: 5, scope: !127)
!130 = !MDLocation(line: 71, column: 15, scope: !126)
!131 = !MDLocation(line: 71, column: 11, scope: !126)
!132 = !MDLocation(line: 72, column: 18, scope: !121)
!133 = !MDLocation(line: 72, column: 12, scope: !121)
!134 = !MDLocation(line: 72, column: 5, scope: !121)
!135 = !MDLocation(line: 73, column: 21, scope: !136)
!136 = !{!"0xb\0073\005\0020", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!137 = !{!"0xb\0073\005\0019", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!138 = !MDLocation(line: 73, column: 5, scope: !137)
!139 = !MDLocation(line: 76, column: 14, scope: !140)
!140 = !{!"0xb\0076\002\0023", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!141 = !{!"0xb\0076\002\0022", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!142 = !{!"0xb\0074\007\0021", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!143 = !MDLocation(line: 75, column: 6, scope: !142)
!144 = !MDLocation(line: 62, column: 13, scope: !53)
!145 = !MDLocation(line: 76, column: 2, scope: !141)
!146 = !MDLocation(line: 77, column: 12, scope: !140)
!147 = !MDLocation(line: 77, column: 22, scope: !140)
!148 = !MDLocation(line: 77, column: 8, scope: !140)
!149 = !MDLocation(line: 78, column: 16, scope: !142)
!150 = !MDLocation(line: 78, column: 12, scope: !142)
!151 = !MDLocation(line: 78, column: 2, scope: !142)
!152 = !MDLocation(line: 83, column: 1, scope: !53)
!153 = !MDLocation(line: 41, column: 22, scope: !45)
!154 = !MDLocation(line: 45, column: 7, scope: !45)
!155 = !MDLocation(line: 47, column: 8, scope: !156)
!156 = !{!"0xb\0047\003\008", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!157 = !MDLocation(line: 48, column: 17, scope: !158)
!158 = !{!"0xb\0048\005\0011", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!159 = !{!"0xb\0048\005\0010", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!160 = !{!"0xb\0047\003\009", !1, !156}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!161 = !MDLocation(line: 48, column: 5, scope: !159)
!162 = !MDLocation(line: 49, column: 14, scope: !163)
!163 = !{!"0xb\0048\0029\0012", !1, !158}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!164 = !MDLocation(line: 49, column: 44, scope: !163)
!165 = !MDLocation(line: 49, column: 5, scope: !163)
!166 = !MDLocation(line: 50, column: 9, scope: !167)
!167 = !{!"0xb\0050\009\0013", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!168 = !MDLocation(line: 50, column: 9, scope: !163)
!169 = !MDLocation(line: 50, column: 41, scope: !170)
!170 = !{!"0xb\001", !1, !167}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/cholesky/cholesky.c]
!171 = !MDLocation(line: 50, column: 32, scope: !167)
!172 = !MDLocation(line: 48, column: 5, scope: !158)
