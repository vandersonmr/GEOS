; ModuleID = 'atax.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !81), !dbg !82
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !81), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !81), !dbg !84
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !36, metadata !81), !dbg !85
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !86
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !87
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !88
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !89
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !90
  %arraydecay4 = bitcast i8* %call1 to double*, !dbg !91
  tail call fastcc void @init_array([4000 x double]* %arraydecay, double* %arraydecay4), !dbg !92
  %arraydecay7 = bitcast i8* %call2 to double*, !dbg !93
  %arraydecay8 = bitcast i8* %call3 to double*, !dbg !94
  tail call fastcc void @kernel_atax([4000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8), !dbg !95
  %cmp = icmp sgt i32 %argc, 42, !dbg !96
  br i1 %cmp, label %if.end48, label %if.end55, !dbg !97

if.end48:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !81), !dbg !98
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !45, metadata !81), !dbg !99
  %0 = load i8** %argv, align 8, !dbg !100, !tbaa !102
  %1 = load i8* %0, align 1, !dbg !100, !tbaa !106
  %phitmp = icmp eq i8 %1, 0, !dbg !98
  br i1 %phitmp, label %if.then53, label %if.end55, !dbg !97

if.then53:                                        ; preds = %if.end48
  tail call fastcc void @print_array(double* %arraydecay7), !dbg !107
  br label %if.end55, !dbg !107

if.end55:                                         ; preds = %if.end48, %if.then53, %entry
  tail call void @free(i8* %call) #4, !dbg !109
  tail call void @free(i8* %call1) #4, !dbg !110
  tail call void @free(i8* %call2) #4, !dbg !111
  tail call void @free(i8* %call3) #4, !dbg !112
  ret i32 0, !dbg !113
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([4000 x double]* nocapture %A, double* nocapture %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !72, metadata !81), !dbg !114
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !73, metadata !81), !dbg !115
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !81), !dbg !116
  br label %for.body, !dbg !117

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.body ]
  %0 = trunc i64 %indvars.iv7 to i32, !dbg !119
  %conv = sitofp i32 %0 to double, !dbg !119
  %mul = fmul double %conv, 0x400921FB54442D18, !dbg !119
  %arrayidx = getelementptr inbounds double* %x, i64 %indvars.iv7, !dbg !121
  store double %mul, double* %arrayidx, align 8, !dbg !121, !tbaa !122
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !117
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 4000, !dbg !117
  br i1 %exitcond9, label %for.cond5.preheader, label %for.body, !dbg !117

for.cond5.preheader:                              ; preds = %for.body, %for.inc20
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc20 ], [ 0, %for.body ]
  %1 = trunc i64 %indvars.iv4 to i32, !dbg !124
  %conv9 = sitofp i32 %1 to double, !dbg !124
  br label %for.body8, !dbg !129

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !129
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !130
  %conv10 = sitofp i32 %2 to double, !dbg !130
  %mul11 = fmul double %conv9, %conv10, !dbg !124
  %div = fdiv double %mul11, 4.000000e+03, !dbg !131
  %arrayidx16 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv, !dbg !132
  store double %div, double* %arrayidx16, align 8, !dbg !132, !tbaa !122
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !129
  br i1 %exitcond, label %for.inc20, label %for.body8, !dbg !129

for.inc20:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !133
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 4000, !dbg !133
  br i1 %exitcond6, label %for.end22, label %for.cond5.preheader, !dbg !133

for.end22:                                        ; preds = %for.inc20
  ret void, !dbg !134
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_atax([4000 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) #0 {
for.cond3.preheader:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !60, metadata !81), !dbg !135
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !61, metadata !81), !dbg !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !66, metadata !81), !dbg !137
  %y15 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %y15, i8 0, i64 32000, i32 8, i1 false), !dbg !138
  br label %for.body5, !dbg !141

for.body5:                                        ; preds = %for.inc42, %for.cond3.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond3.preheader ], [ %indvars.iv.next9, %for.inc42 ]
  %arrayidx7 = getelementptr inbounds double* %tmp, i64 %indvars.iv8, !dbg !143
  store double 0.000000e+00, double* %arrayidx7, align 8, !dbg !143, !tbaa !122
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !81), !dbg !146
  br label %for.body10, !dbg !147

for.body10:                                       ; preds = %for.body10, %for.body5
  %indvars.iv = phi i64 [ 0, %for.body5 ], [ %indvars.iv.next, %for.body10 ]
  %0 = load double* %arrayidx7, align 8, !dbg !149, !tbaa !122
  %arrayidx16 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv, !dbg !151
  %1 = load double* %arrayidx16, align 8, !dbg !151, !tbaa !122
  %arrayidx18 = getelementptr inbounds double* %x, i64 %indvars.iv, !dbg !152
  %2 = load double* %arrayidx18, align 8, !dbg !152, !tbaa !122
  %mul = fmul double %1, %2, !dbg !151
  %add = fadd double %0, %mul, !dbg !149
  store double %add, double* %arrayidx7, align 8, !dbg !153, !tbaa !122
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !147
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !147
  br i1 %exitcond, label %for.body26, label %for.body10, !dbg !147

for.body26:                                       ; preds = %for.body10, %for.body26
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.body26 ], [ 0, %for.body10 ]
  %arrayidx28 = getelementptr inbounds double* %y, i64 %indvars.iv5, !dbg !154
  %3 = load double* %arrayidx28, align 8, !dbg !154, !tbaa !122
  %arrayidx32 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv5, !dbg !157
  %4 = load double* %arrayidx32, align 8, !dbg !157, !tbaa !122
  %5 = load double* %arrayidx7, align 8, !dbg !158, !tbaa !122
  %mul35 = fmul double %4, %5, !dbg !157
  %add36 = fadd double %3, %mul35, !dbg !154
  store double %add36, double* %arrayidx28, align 8, !dbg !159, !tbaa !122
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !160
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 4000, !dbg !160
  br i1 %exitcond7, label %for.inc42, label %for.body26, !dbg !160

for.inc42:                                        ; preds = %for.body26
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !141
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 4000, !dbg !141
  br i1 %exitcond10, label %for.end44, label %for.body5, !dbg !141

for.end44:                                        ; preds = %for.inc42
  ret void, !dbg !161
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !53, metadata !81), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !55, metadata !81), !dbg !163
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !164, !tbaa !102
  br label %for.body, !dbg !168

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %entry ], [ %5, %for.inc ]
  %arrayidx = getelementptr inbounds double* %y, i64 %indvars.iv, !dbg !169
  %2 = load double* %arrayidx, align 8, !dbg !169, !tbaa !122
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !170
  %3 = trunc i64 %indvars.iv to i32, !dbg !171
  %rem = srem i32 %3, 20, !dbg !171
  %cmp1 = icmp eq i32 %rem, 0, !dbg !171
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !173

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !174, !tbaa !102
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6, !dbg !176
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !168
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !164, !tbaa !102
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !168
  br i1 %exitcond, label %for.end, label %for.body, !dbg !168

for.end:                                          ; preds = %for.inc
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !177
  ret void, !dbg !178
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
!llvm.module.flags = !{!78, !79}
!llvm.ident = !{!80}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c] [DW_LANG_C99]
!1 = !{!"atax.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax"}
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
!24 = !{!25, !48, !56, !68}
!25 = !{!"0x2e\00main\00main\00\0081\000\001\000\000\00256\001\0082", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 81] [def] [scope 82] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777297\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 81]
!34 = !{!"0x101\00argv\0033554513\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 81]
!35 = !{!"0x100\00nx\0084\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nx] [line 84]
!36 = !{!"0x100\00ny\0085\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [ny] [line 85]
!37 = !{!"0x100\00A\0088\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 88]
!38 = !{!"0x100\00x\0089\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [x] [line 89]
!39 = !{!"0x100\00y\0090\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [y] [line 90]
!40 = !{!"0x100\00tmp\0091\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [tmp] [line 91]
!41 = !{!"0x100\00__s1_len\00112\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 112]
!42 = !{!"0xb\00112\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!43 = !{!"0xb\00112\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!44 = !{!"0x100\00__s2_len\00112\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 112]
!45 = !{!"0x100\00__s2\00112\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 112]
!46 = !{!"0xb\00112\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!47 = !{!"0x100\00__result\00112\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 112]
!48 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\001\0043", !1, !26, !49, null, void (double*)* @print_array, null, null, !52} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !51}
!51 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!52 = !{!53, !54, !55}
!53 = !{!"0x101\00nx\0016777256\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 40]
!54 = !{!"0x101\00y\0033554473\000", !48, !26, !51} ; [ DW_TAG_arg_variable ] [y] [line 41]
!55 = !{!"0x100\00i\0044\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 44]
!56 = !{!"0x2e\00kernel_atax\00kernel_atax\00\0057\001\001\000\000\00256\001\0062", !1, !26, !57, null, void ([4000 x double]*, double*, double*, double*)* @kernel_atax, null, null, !59} ; [ DW_TAG_subprogram ] [line 57] [local] [def] [scope 62] [kernel_atax]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !29, !29, !9, !51, !51, !51}
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67}
!60 = !{!"0x101\00nx\0016777273\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 57]
!61 = !{!"0x101\00ny\0033554489\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 57]
!62 = !{!"0x101\00A\0050331706\000", !56, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 58]
!63 = !{!"0x101\00x\0067108923\000", !56, !26, !51} ; [ DW_TAG_arg_variable ] [x] [line 59]
!64 = !{!"0x101\00y\0083886140\000", !56, !26, !51} ; [ DW_TAG_arg_variable ] [y] [line 60]
!65 = !{!"0x101\00tmp\00100663357\000", !56, !26, !51} ; [ DW_TAG_arg_variable ] [tmp] [line 61]
!66 = !{!"0x100\00i\0063\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 63]
!67 = !{!"0x100\00j\0063\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 63]
!68 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !69, null, void ([4000 x double]*, double*)* @init_array, null, null, !71} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!69 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !70, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = !{null, !29, !29, !9, !51}
!71 = !{!72, !73, !74, !75, !76, !77}
!72 = !{!"0x101\00nx\0016777239\000", !68, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!73 = !{!"0x101\00ny\0033554455\000", !68, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!74 = !{!"0x101\00A\0050331672\000", !68, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!75 = !{!"0x101\00x\0067108889\000", !68, !26, !51} ; [ DW_TAG_arg_variable ] [x] [line 25]
!76 = !{!"0x100\00i\0027\000", !68, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!77 = !{!"0x100\00j\0027\000", !68, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!78 = !{i32 2, !"Dwarf Version", i32 4}
!79 = !{i32 2, !"Debug Info Version", i32 2}
!80 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!81 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!82 = !MDLocation(line: 81, column: 14, scope: !25)
!83 = !MDLocation(line: 81, column: 27, scope: !25)
!84 = !MDLocation(line: 84, column: 7, scope: !25)
!85 = !MDLocation(line: 85, column: 7, scope: !25)
!86 = !MDLocation(line: 88, column: 3, scope: !25)
!87 = !MDLocation(line: 89, column: 3, scope: !25)
!88 = !MDLocation(line: 90, column: 3, scope: !25)
!89 = !MDLocation(line: 91, column: 3, scope: !25)
!90 = !MDLocation(line: 94, column: 23, scope: !25)
!91 = !MDLocation(line: 94, column: 43, scope: !25)
!92 = !MDLocation(line: 94, column: 3, scope: !25)
!93 = !MDLocation(line: 103, column: 9, scope: !25)
!94 = !MDLocation(line: 104, column: 9, scope: !25)
!95 = !MDLocation(line: 100, column: 3, scope: !25)
!96 = !MDLocation(line: 112, column: 3, scope: !43)
!97 = !MDLocation(line: 112, column: 3, scope: !25)
!98 = !MDLocation(line: 112, column: 3, scope: !42)
!99 = !MDLocation(line: 112, column: 3, scope: !46)
!100 = !MDLocation(line: 112, column: 3, scope: !101)
!101 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!102 = !{!103, !103, i64 0}
!103 = !{!"any pointer", !104, i64 0}
!104 = !{!"omnipotent char", !105, i64 0}
!105 = !{!"Simple C/C++ TBAA"}
!106 = !{!104, !104, i64 0}
!107 = !MDLocation(line: 112, column: 3, scope: !108)
!108 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!109 = !MDLocation(line: 115, column: 3, scope: !25)
!110 = !MDLocation(line: 116, column: 3, scope: !25)
!111 = !MDLocation(line: 117, column: 3, scope: !25)
!112 = !MDLocation(line: 118, column: 3, scope: !25)
!113 = !MDLocation(line: 120, column: 3, scope: !25)
!114 = !MDLocation(line: 23, column: 22, scope: !68)
!115 = !MDLocation(line: 23, column: 30, scope: !68)
!116 = !MDLocation(line: 27, column: 7, scope: !68)
!117 = !MDLocation(line: 29, column: 3, scope: !118)
!118 = !{!"0xb\0029\003\0021", !1, !68}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!119 = !MDLocation(line: 30, column: 14, scope: !120)
!120 = !{!"0xb\0029\003\0022", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!121 = !MDLocation(line: 30, column: 7, scope: !120)
!122 = !{!123, !123, i64 0}
!123 = !{!"double", !104, i64 0}
!124 = !MDLocation(line: 33, column: 18, scope: !125)
!125 = !{!"0xb\0032\005\0026", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!126 = !{!"0xb\0032\005\0025", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!127 = !{!"0xb\0031\003\0024", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!128 = !{!"0xb\0031\003\0023", !1, !68}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!129 = !MDLocation(line: 32, column: 5, scope: !126)
!130 = !MDLocation(line: 33, column: 32, scope: !125)
!131 = !MDLocation(line: 33, column: 17, scope: !125)
!132 = !MDLocation(line: 33, column: 7, scope: !125)
!133 = !MDLocation(line: 31, column: 3, scope: !128)
!134 = !MDLocation(line: 34, column: 1, scope: !68)
!135 = !MDLocation(line: 57, column: 22, scope: !56)
!136 = !MDLocation(line: 57, column: 30, scope: !56)
!137 = !MDLocation(line: 63, column: 7, scope: !56)
!138 = !MDLocation(line: 67, column: 5, scope: !139)
!139 = !{!"0xb\0066\003\0013", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!140 = !{!"0xb\0066\003\0012", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!141 = !MDLocation(line: 68, column: 3, scope: !142)
!142 = !{!"0xb\0068\003\0014", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!143 = !MDLocation(line: 70, column: 7, scope: !144)
!144 = !{!"0xb\0069\005\0016", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!145 = !{!"0xb\0068\003\0015", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!146 = !MDLocation(line: 63, column: 10, scope: !56)
!147 = !MDLocation(line: 71, column: 7, scope: !148)
!148 = !{!"0xb\0071\007\0017", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!149 = !MDLocation(line: 72, column: 11, scope: !150)
!150 = !{!"0xb\0071\007\0018", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!151 = !MDLocation(line: 72, column: 20, scope: !150)
!152 = !MDLocation(line: 72, column: 30, scope: !150)
!153 = !MDLocation(line: 72, column: 2, scope: !150)
!154 = !MDLocation(line: 74, column: 9, scope: !155)
!155 = !{!"0xb\0073\007\0020", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!156 = !{!"0xb\0073\007\0019", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!157 = !MDLocation(line: 74, column: 16, scope: !155)
!158 = !MDLocation(line: 74, column: 26, scope: !155)
!159 = !MDLocation(line: 74, column: 2, scope: !155)
!160 = !MDLocation(line: 73, column: 7, scope: !156)
!161 = !MDLocation(line: 78, column: 1, scope: !56)
!162 = !MDLocation(line: 40, column: 22, scope: !48)
!163 = !MDLocation(line: 44, column: 7, scope: !48)
!164 = !MDLocation(line: 47, column: 14, scope: !165)
!165 = !{!"0xb\0046\0028\0010", !1, !166}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!166 = !{!"0xb\0046\003\009", !1, !167}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!167 = !{!"0xb\0046\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!168 = !MDLocation(line: 46, column: 3, scope: !167)
!169 = !MDLocation(line: 47, column: 44, scope: !165)
!170 = !MDLocation(line: 47, column: 5, scope: !165)
!171 = !MDLocation(line: 48, column: 9, scope: !172)
!172 = !{!"0xb\0048\009\0011", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!173 = !MDLocation(line: 48, column: 9, scope: !165)
!174 = !MDLocation(line: 48, column: 31, scope: !175)
!175 = !{!"0xb\001", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!176 = !MDLocation(line: 48, column: 22, scope: !172)
!177 = !MDLocation(line: 50, column: 3, scope: !48)
!178 = !MDLocation(line: 51, column: 1, scope: !48)
