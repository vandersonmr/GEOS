; ModuleID = 'gesummv.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !87), !dbg !88
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !87), !dbg !89
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !87), !dbg !90
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !91
  %call1 = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !92
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !93
  %call4 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !94
  %call6 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !95
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !96
  %arraydecay7 = bitcast i8* %call1 to [4000 x double]*, !dbg !97
  %arraydecay8 = bitcast i8* %call4 to double*, !dbg !98
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !36, metadata !87), !dbg !99
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !37, metadata !87), !dbg !100
  call fastcc void @init_array(double* %alpha, double* %beta, [4000 x double]* %arraydecay, [4000 x double]* %arraydecay7, double* %arraydecay8), !dbg !101
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !36, metadata !87), !dbg !99
  %0 = load double* %alpha, align 8, !dbg !102, !tbaa !103
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !37, metadata !87), !dbg !100
  %1 = load double* %beta, align 8, !dbg !107, !tbaa !103
  %arraydecay11 = bitcast i8* %call2 to double*, !dbg !108
  %arraydecay13 = bitcast i8* %call6 to double*, !dbg !109
  tail call fastcc void @kernel_gesummv(double %0, double %1, [4000 x double]* %arraydecay, [4000 x double]* %arraydecay7, double* %arraydecay11, double* %arraydecay8, double* %arraydecay13), !dbg !110
  %cmp = icmp sgt i32 %argc, 42, !dbg !111
  br i1 %cmp, label %if.end53, label %if.end60, !dbg !112

if.end53:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !87), !dbg !113
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !47, metadata !87), !dbg !114
  %2 = load i8** %argv, align 8, !dbg !115, !tbaa !117
  %3 = load i8* %2, align 1, !dbg !115, !tbaa !119
  %phitmp = icmp eq i8 %3, 0, !dbg !113
  br i1 %phitmp, label %if.then58, label %if.end60, !dbg !112

if.then58:                                        ; preds = %if.end53
  tail call fastcc void @print_array(double* %arraydecay13), !dbg !120
  br label %if.end60, !dbg !120

if.end60:                                         ; preds = %if.end53, %if.then58, %entry
  tail call void @free(i8* %call) #4, !dbg !122
  tail call void @free(i8* %call1) #4, !dbg !123
  tail call void @free(i8* %call2) #4, !dbg !124
  tail call void @free(i8* %call4) #4, !dbg !125
  tail call void @free(i8* %call6) #4, !dbg !126
  ret i32 0, !dbg !127
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [4000 x double]* nocapture %A, [4000 x double]* nocapture %B, double* nocapture %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !76, metadata !87), !dbg !128
  store double 4.353200e+04, double* %alpha, align 8, !dbg !129, !tbaa !103
  store double 1.231300e+04, double* %beta, align 8, !dbg !130, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !82, metadata !87), !dbg !131
  br label %for.body, !dbg !132

for.body:                                         ; preds = %for.inc23, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc23 ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !134
  %conv = sitofp i32 %0 to double, !dbg !134
  %div = fdiv double %conv, 4.000000e+03, !dbg !137
  %arrayidx = getelementptr inbounds double* %x, i64 %indvars.iv3, !dbg !138
  store double %div, double* %arrayidx, align 8, !dbg !138, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !83, metadata !87), !dbg !139
  br label %for.body5, !dbg !140

for.body5:                                        ; preds = %for.body5, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body5 ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !142
  %conv7 = sitofp i32 %1 to double, !dbg !142
  %mul = fmul double %conv, %conv7, !dbg !145
  %div9 = fdiv double %mul, 4.000000e+03, !dbg !146
  %arrayidx13 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !147
  store double %div9, double* %arrayidx13, align 8, !dbg !147, !tbaa !103
  %arrayidx22 = getelementptr inbounds [4000 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv, !dbg !148
  store double %div9, double* %arrayidx22, align 8, !dbg !148, !tbaa !103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !140
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !140
  br i1 %exitcond, label %for.inc23, label %for.body5, !dbg !140

for.inc23:                                        ; preds = %for.body5
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !132
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 4000, !dbg !132
  br i1 %exitcond5, label %for.end25, label %for.body, !dbg !132

for.end25:                                        ; preds = %for.inc23
  ret void, !dbg !149
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_gesummv(double %alpha, double %beta, [4000 x double]* nocapture readonly %A, [4000 x double]* nocapture readonly %B, double* nocapture %tmp, double* nocapture readonly %x, double* nocapture %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !62, metadata !87), !dbg !150
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !87), !dbg !151
  br label %for.body, !dbg !152

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.end ]
  %arrayidx = getelementptr inbounds double* %tmp, i64 %indvars.iv3, !dbg !154
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !154, !tbaa !103
  %arrayidx4 = getelementptr inbounds double* %y, i64 %indvars.iv3, !dbg !157
  store double 0.000000e+00, double* %arrayidx4, align 8, !dbg !157, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !87), !dbg !158
  br label %for.body7, !dbg !159

for.body7:                                        ; preds = %for.body7, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body7 ]
  %arrayidx11 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !161
  %0 = load double* %arrayidx11, align 8, !dbg !161, !tbaa !103
  %arrayidx13 = getelementptr inbounds double* %x, i64 %indvars.iv, !dbg !164
  %1 = load double* %arrayidx13, align 8, !dbg !164, !tbaa !103
  %mul = fmul double %0, %1, !dbg !161
  %2 = load double* %arrayidx, align 8, !dbg !165, !tbaa !103
  %add = fadd double %mul, %2, !dbg !161
  store double %add, double* %arrayidx, align 8, !dbg !166, !tbaa !103
  %arrayidx21 = getelementptr inbounds [4000 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv, !dbg !167
  %3 = load double* %arrayidx21, align 8, !dbg !167, !tbaa !103
  %4 = load double* %arrayidx13, align 8, !dbg !168, !tbaa !103
  %mul24 = fmul double %3, %4, !dbg !167
  %5 = load double* %arrayidx4, align 8, !dbg !169, !tbaa !103
  %add27 = fadd double %mul24, %5, !dbg !167
  store double %add27, double* %arrayidx4, align 8, !dbg !170, !tbaa !103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !159
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !159
  br i1 %exitcond, label %for.end, label %for.body7, !dbg !159

for.end:                                          ; preds = %for.body7
  %6 = load double* %arrayidx, align 8, !dbg !171, !tbaa !103
  %mul32 = fmul double %6, %alpha, !dbg !172
  %7 = load double* %arrayidx4, align 8, !dbg !173, !tbaa !103
  %mul35 = fmul double %7, %beta, !dbg !174
  %add36 = fadd double %mul32, %mul35, !dbg !172
  store double %add36, double* %arrayidx4, align 8, !dbg !175, !tbaa !103
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !152
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 4000, !dbg !152
  br i1 %exitcond5, label %for.end41, label %for.body, !dbg !152

for.end41:                                        ; preds = %for.end
  ret void, !dbg !176
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !55, metadata !87), !dbg !177
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !87), !dbg !178
  br label %for.body, !dbg !179

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !181, !tbaa !117
  %arrayidx = getelementptr inbounds double* %y, i64 %indvars.iv, !dbg !184
  %1 = load double* %arrayidx, align 8, !dbg !184, !tbaa !103
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %1) #5, !dbg !185
  %2 = trunc i64 %indvars.iv to i32, !dbg !186
  %rem = srem i32 %2, 20, !dbg !186
  %cmp1 = icmp eq i32 %rem, 0, !dbg !186
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !188

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !189, !tbaa !117
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6, !dbg !191
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !179
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !179
  br i1 %exitcond, label %for.end, label %for.body, !dbg !179

for.end:                                          ; preds = %for.inc
  ret void, !dbg !192
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
!llvm.module.flags = !{!84, !85}
!llvm.ident = !{!86}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c] [DW_LANG_C99]
!1 = !{!"gesummv.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv"}
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
!24 = !{!25, !50, !58, !72}
!25 = !{!"0x2e\00main\00main\00\0092\000\001\000\000\00256\001\0093", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 92] [def] [scope 93] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !46, !47, !49}
!33 = !{!"0x101\00argc\0016777308\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 92]
!34 = !{!"0x101\00argv\0033554524\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 92]
!35 = !{!"0x100\00n\0095\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 95]
!36 = !{!"0x100\00alpha\0098\000", !25, !26, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 98]
!37 = !{!"0x100\00beta\0099\000", !25, !26, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 99]
!38 = !{!"0x100\00A\00100\000", !25, !26, !4}     ; [ DW_TAG_auto_variable ] [A] [line 100]
!39 = !{!"0x100\00B\00101\000", !25, !26, !4}     ; [ DW_TAG_auto_variable ] [B] [line 101]
!40 = !{!"0x100\00tmp\00102\000", !25, !26, !9}   ; [ DW_TAG_auto_variable ] [tmp] [line 102]
!41 = !{!"0x100\00x\00103\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [x] [line 103]
!42 = !{!"0x100\00y\00104\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [y] [line 104]
!43 = !{!"0x100\00__s1_len\00130\000", !44, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 130]
!44 = !{!"0xb\00130\003\001", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!45 = !{!"0xb\00130\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!46 = !{!"0x100\00__s2_len\00130\000", !44, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 130]
!47 = !{!"0x100\00__s2\00130\000", !48, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 130]
!48 = !{!"0xb\00130\003\002", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!49 = !{!"0x100\00__result\00130\000", !48, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 130]
!50 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0051", !1, !26, !51, null, void (double*)* @print_array, null, null, !54} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 51] [print_array]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{null, !29, !53}
!53 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!54 = !{!55, !56, !57}
!55 = !{!"0x101\00n\0016777264\000", !50, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 48]
!56 = !{!"0x101\00y\0033554481\000", !50, !26, !53} ; [ DW_TAG_arg_variable ] [y] [line 49]
!57 = !{!"0x100\00i\0052\000", !50, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!58 = !{!"0x2e\00kernel_gesummv\00kernel_gesummv\00\0064\001\001\000\000\00256\001\0072", !1, !26, !59, null, void (double, double, [4000 x double]*, [4000 x double]*, double*, double*, double*)* @kernel_gesummv, null, null, !61} ; [ DW_TAG_subprogram ] [line 64] [local] [def] [scope 72] [kernel_gesummv]
!59 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !60, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = !{null, !29, !6, !6, !9, !9, !53, !53, !53}
!61 = !{!62, !63, !64, !65, !66, !67, !68, !69, !70, !71}
!62 = !{!"0x101\00n\0016777280\000", !58, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 64]
!63 = !{!"0x101\00alpha\0033554497\000", !58, !26, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 65]
!64 = !{!"0x101\00beta\0050331714\000", !58, !26, !6} ; [ DW_TAG_arg_variable ] [beta] [line 66]
!65 = !{!"0x101\00A\0067108931\000", !58, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 67]
!66 = !{!"0x101\00B\0083886148\000", !58, !26, !9} ; [ DW_TAG_arg_variable ] [B] [line 68]
!67 = !{!"0x101\00tmp\00100663365\000", !58, !26, !53} ; [ DW_TAG_arg_variable ] [tmp] [line 69]
!68 = !{!"0x101\00x\00117440582\000", !58, !26, !53} ; [ DW_TAG_arg_variable ] [x] [line 70]
!69 = !{!"0x101\00y\00134217799\000", !58, !26, !53} ; [ DW_TAG_arg_variable ] [y] [line 71]
!70 = !{!"0x100\00i\0073\000", !58, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 73]
!71 = !{!"0x100\00j\0073\000", !58, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 73]
!72 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !73, null, void (double*, double*, [4000 x double]*, [4000 x double]*, double*)* @init_array, null, null, !75} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!73 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !74, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = !{null, !29, !53, !53, !9, !9, !53}
!75 = !{!76, !77, !78, !79, !80, !81, !82, !83}
!76 = !{!"0x101\00n\0016777239\000", !72, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!77 = !{!"0x101\00alpha\0033554456\000", !72, !26, !53} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!78 = !{!"0x101\00beta\0050331673\000", !72, !26, !53} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!79 = !{!"0x101\00A\0067108890\000", !72, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 26]
!80 = !{!"0x101\00B\0083886107\000", !72, !26, !9} ; [ DW_TAG_arg_variable ] [B] [line 27]
!81 = !{!"0x101\00x\00100663324\000", !72, !26, !53} ; [ DW_TAG_arg_variable ] [x] [line 28]
!82 = !{!"0x100\00i\0030\000", !72, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!83 = !{!"0x100\00j\0030\000", !72, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!84 = !{i32 2, !"Dwarf Version", i32 4}
!85 = !{i32 2, !"Debug Info Version", i32 2}
!86 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!87 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!88 = !MDLocation(line: 92, column: 14, scope: !25)
!89 = !MDLocation(line: 92, column: 27, scope: !25)
!90 = !MDLocation(line: 95, column: 7, scope: !25)
!91 = !MDLocation(line: 100, column: 3, scope: !25)
!92 = !MDLocation(line: 101, column: 3, scope: !25)
!93 = !MDLocation(line: 102, column: 3, scope: !25)
!94 = !MDLocation(line: 103, column: 3, scope: !25)
!95 = !MDLocation(line: 104, column: 3, scope: !25)
!96 = !MDLocation(line: 109, column: 8, scope: !25)
!97 = !MDLocation(line: 110, column: 8, scope: !25)
!98 = !MDLocation(line: 111, column: 8, scope: !25)
!99 = !MDLocation(line: 98, column: 13, scope: !25)
!100 = !MDLocation(line: 99, column: 13, scope: !25)
!101 = !MDLocation(line: 108, column: 3, scope: !25)
!102 = !MDLocation(line: 117, column: 22, scope: !25)
!103 = !{!104, !104, i64 0}
!104 = !{!"double", !105, i64 0}
!105 = !{!"omnipotent char", !106, i64 0}
!106 = !{!"Simple C/C++ TBAA"}
!107 = !MDLocation(line: 117, column: 29, scope: !25)
!108 = !MDLocation(line: 120, column: 5, scope: !25)
!109 = !MDLocation(line: 122, column: 5, scope: !25)
!110 = !MDLocation(line: 117, column: 3, scope: !25)
!111 = !MDLocation(line: 130, column: 3, scope: !45)
!112 = !MDLocation(line: 130, column: 3, scope: !25)
!113 = !MDLocation(line: 130, column: 3, scope: !44)
!114 = !MDLocation(line: 130, column: 3, scope: !48)
!115 = !MDLocation(line: 130, column: 3, scope: !116)
!116 = !{!"0xb\004", !1, !48}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!117 = !{!118, !118, i64 0}
!118 = !{!"any pointer", !105, i64 0}
!119 = !{!105, !105, i64 0}
!120 = !MDLocation(line: 130, column: 3, scope: !121)
!121 = !{!"0xb\0023", !1, !45}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!122 = !MDLocation(line: 133, column: 3, scope: !25)
!123 = !MDLocation(line: 134, column: 3, scope: !25)
!124 = !MDLocation(line: 135, column: 3, scope: !25)
!125 = !MDLocation(line: 136, column: 3, scope: !25)
!126 = !MDLocation(line: 137, column: 3, scope: !25)
!127 = !MDLocation(line: 139, column: 3, scope: !25)
!128 = !MDLocation(line: 23, column: 21, scope: !72)
!129 = !MDLocation(line: 32, column: 3, scope: !72)
!130 = !MDLocation(line: 33, column: 3, scope: !72)
!131 = !MDLocation(line: 30, column: 7, scope: !72)
!132 = !MDLocation(line: 34, column: 3, scope: !133)
!133 = !{!"0xb\0034\003\0018", !1, !72}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!134 = !MDLocation(line: 36, column: 15, scope: !135)
!135 = !{!"0xb\0035\005\0020", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!136 = !{!"0xb\0034\003\0019", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!137 = !MDLocation(line: 36, column: 14, scope: !135)
!138 = !MDLocation(line: 36, column: 7, scope: !135)
!139 = !MDLocation(line: 30, column: 10, scope: !72)
!140 = !MDLocation(line: 37, column: 7, scope: !141)
!141 = !{!"0xb\0037\007\0021", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!142 = !MDLocation(line: 38, column: 27, scope: !143)
!143 = !{!"0xb\0037\0031\0023", !1, !144}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!144 = !{!"0xb\0037\007\0022", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!145 = !MDLocation(line: 38, column: 13, scope: !143)
!146 = !MDLocation(line: 38, column: 12, scope: !143)
!147 = !MDLocation(line: 38, column: 2, scope: !143)
!148 = !MDLocation(line: 39, column: 2, scope: !143)
!149 = !MDLocation(line: 42, column: 1, scope: !72)
!150 = !MDLocation(line: 64, column: 25, scope: !58)
!151 = !MDLocation(line: 73, column: 7, scope: !58)
!152 = !MDLocation(line: 76, column: 3, scope: !153)
!153 = !{!"0xb\0076\003\0012", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!154 = !MDLocation(line: 78, column: 7, scope: !155)
!155 = !{!"0xb\0077\005\0014", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!156 = !{!"0xb\0076\003\0013", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!157 = !MDLocation(line: 79, column: 7, scope: !155)
!158 = !MDLocation(line: 73, column: 10, scope: !58)
!159 = !MDLocation(line: 80, column: 7, scope: !160)
!160 = !{!"0xb\0080\007\0015", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!161 = !MDLocation(line: 82, column: 13, scope: !162)
!162 = !{!"0xb\0081\002\0017", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!163 = !{!"0xb\0080\007\0016", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!164 = !MDLocation(line: 82, column: 23, scope: !162)
!165 = !MDLocation(line: 82, column: 30, scope: !162)
!166 = !MDLocation(line: 82, column: 4, scope: !162)
!167 = !MDLocation(line: 83, column: 11, scope: !162)
!168 = !MDLocation(line: 83, column: 21, scope: !162)
!169 = !MDLocation(line: 83, column: 28, scope: !162)
!170 = !MDLocation(line: 83, column: 4, scope: !162)
!171 = !MDLocation(line: 85, column: 22, scope: !155)
!172 = !MDLocation(line: 85, column: 14, scope: !155)
!173 = !MDLocation(line: 85, column: 38, scope: !155)
!174 = !MDLocation(line: 85, column: 31, scope: !155)
!175 = !MDLocation(line: 85, column: 7, scope: !155)
!176 = !MDLocation(line: 89, column: 1, scope: !58)
!177 = !MDLocation(line: 48, column: 22, scope: !50)
!178 = !MDLocation(line: 52, column: 7, scope: !50)
!179 = !MDLocation(line: 54, column: 3, scope: !180)
!180 = !{!"0xb\0054\003\008", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!181 = !MDLocation(line: 55, column: 14, scope: !182)
!182 = !{!"0xb\0054\0027\0010", !1, !183}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!183 = !{!"0xb\0054\003\009", !1, !180}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!184 = !MDLocation(line: 55, column: 44, scope: !182)
!185 = !MDLocation(line: 55, column: 5, scope: !182)
!186 = !MDLocation(line: 56, column: 9, scope: !187)
!187 = !{!"0xb\0056\009\0011", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!188 = !MDLocation(line: 56, column: 9, scope: !182)
!189 = !MDLocation(line: 56, column: 31, scope: !190)
!190 = !{!"0xb\001", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!191 = !MDLocation(line: 56, column: 22, scope: !187)
!192 = !MDLocation(line: 58, column: 1, scope: !50)
