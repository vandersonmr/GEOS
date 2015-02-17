; ModuleID = 'seidel-2d.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !72), !dbg !73
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !72), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !32, metadata !72), !dbg !75
  tail call void @llvm.dbg.value(metadata i32 20, i64 0, metadata !33, metadata !72), !dbg !76
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !77
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !78
  tail call fastcc void @init_array([1000 x double]* %arraydecay), !dbg !79
  tail call fastcc void @kernel_seidel_2d([1000 x double]* %arraydecay), !dbg !80
  %cmp = icmp sgt i32 %argc, 42, !dbg !81
  br i1 %cmp, label %if.end38, label %if.end45, !dbg !82

if.end38:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !72), !dbg !83
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !39, metadata !72), !dbg !84
  %0 = load i8** %argv, align 8, !dbg !85, !tbaa !87
  %1 = load i8* %0, align 1, !dbg !85, !tbaa !91
  %phitmp = icmp eq i8 %1, 0, !dbg !83
  br i1 %phitmp, label %if.then43, label %if.end45, !dbg !82

if.then43:                                        ; preds = %if.end38
  tail call fastcc void @print_array([1000 x double]* %arraydecay), !dbg !92
  br label %if.end45, !dbg !92

if.end45:                                         ; preds = %if.end38, %if.then43, %entry
  tail call void @free(i8* %call) #4, !dbg !94
  ret i32 0, !dbg !95
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !65, metadata !72), !dbg !96
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !72), !dbg !97
  br label %for.cond1.preheader, !dbg !98

for.cond1.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc9 ]
  %0 = trunc i64 %indvars.iv4 to i32, !dbg !100
  %conv = sitofp i32 %0 to double, !dbg !100
  br label %for.body3, !dbg !104

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = add nuw nsw i64 %indvars.iv, 2, !dbg !105
  %2 = trunc i64 %1 to i32, !dbg !106
  %conv4 = sitofp i32 %2 to double, !dbg !106
  %mul = fmul double %conv, %conv4, !dbg !100
  %add5 = fadd double %mul, 2.000000e+00, !dbg !100
  %div = fdiv double %add5, 1.000000e+03, !dbg !107
  %arrayidx8 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv, !dbg !108
  store double %div, double* %arrayidx8, align 8, !dbg !108, !tbaa !109
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !104
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !104
  br i1 %exitcond, label %for.inc9, label %for.body3, !dbg !104

for.inc9:                                         ; preds = %for.body3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !98
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000, !dbg !98
  br i1 %exitcond6, label %for.end11, label %for.cond1.preheader, !dbg !98

for.end11:                                        ; preds = %for.inc9
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_seidel_2d([1000 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 20, i64 0, metadata !57, metadata !72), !dbg !112
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !58, metadata !72), !dbg !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !60, metadata !72), !dbg !114
  br label %for.cond1.preheader, !dbg !115

for.cond1.preheader:                              ; preds = %for.inc69, %entry
  %t.03 = phi i32 [ 0, %entry ], [ %inc70, %for.inc69 ]
  br label %for.cond5.preheader, !dbg !117

for.cond5.preheader:                              ; preds = %for.inc66, %for.cond1.preheader
  %indvars.iv5 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next6, %for.inc66 ]
  %0 = add nsw i64 %indvars.iv5, -1, !dbg !120
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !117
  br label %for.body8, !dbg !124

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %1 = add nsw i64 %indvars.iv, -1, !dbg !125
  %arrayidx12 = getelementptr inbounds [1000 x double]* %A, i64 %0, i64 %1, !dbg !126
  %2 = load double* %arrayidx12, align 8, !dbg !126, !tbaa !109
  %arrayidx17 = getelementptr inbounds [1000 x double]* %A, i64 %0, i64 %indvars.iv, !dbg !127
  %3 = load double* %arrayidx17, align 8, !dbg !127, !tbaa !109
  %add = fadd double %2, %3, !dbg !126
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !124
  %arrayidx23 = getelementptr inbounds [1000 x double]* %A, i64 %0, i64 %indvars.iv.next, !dbg !128
  %4 = load double* %arrayidx23, align 8, !dbg !128, !tbaa !109
  %add24 = fadd double %add, %4, !dbg !126
  %arrayidx29 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv5, i64 %1, !dbg !129
  %5 = load double* %arrayidx29, align 8, !dbg !129, !tbaa !109
  %add30 = fadd double %add24, %5, !dbg !126
  %arrayidx34 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv, !dbg !130
  %6 = load double* %arrayidx34, align 8, !dbg !130, !tbaa !109
  %add35 = fadd double %add30, %6, !dbg !126
  %arrayidx40 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv.next, !dbg !131
  %7 = load double* %arrayidx40, align 8, !dbg !131, !tbaa !109
  %add41 = fadd double %add35, %7, !dbg !126
  %arrayidx47 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv.next6, i64 %1, !dbg !132
  %8 = load double* %arrayidx47, align 8, !dbg !132, !tbaa !109
  %add48 = fadd double %add41, %8, !dbg !126
  %arrayidx53 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv.next6, i64 %indvars.iv, !dbg !133
  %9 = load double* %arrayidx53, align 8, !dbg !133, !tbaa !109
  %add54 = fadd double %add48, %9, !dbg !126
  %arrayidx60 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv.next6, i64 %indvars.iv.next, !dbg !134
  %10 = load double* %arrayidx60, align 8, !dbg !134, !tbaa !109
  %add61 = fadd double %add54, %10, !dbg !126
  %div = fdiv double %add61, 9.000000e+00, !dbg !135
  store double %div, double* %arrayidx34, align 8, !dbg !136, !tbaa !109
  %exitcond = icmp eq i64 %indvars.iv.next, 999, !dbg !124
  br i1 %exitcond, label %for.inc66, label %for.body8, !dbg !124

for.inc66:                                        ; preds = %for.body8
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 999, !dbg !117
  br i1 %exitcond8, label %for.inc69, label %for.cond5.preheader, !dbg !117

for.inc69:                                        ; preds = %for.inc66
  %inc70 = add nuw nsw i32 %t.03, 1, !dbg !137
  tail call void @llvm.dbg.value(metadata i32 %inc70, i64 0, metadata !60, metadata !72), !dbg !114
  %exitcond9 = icmp eq i32 %inc70, 20, !dbg !115
  br i1 %exitcond9, label %for.end71, label %for.cond1.preheader, !dbg !115

for.end71:                                        ; preds = %for.inc69
  ret void, !dbg !138
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !49, metadata !72), !dbg !139
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !51, metadata !72), !dbg !140
  br label %for.cond1.preheader, !dbg !141

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = mul nsw i64 %indvars.iv7, 1000, !dbg !143
  br label %for.body3, !dbg !149

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !150, !tbaa !87
  %arrayidx5 = getelementptr inbounds [1000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv, !dbg !151
  %2 = load double* %arrayidx5, align 8, !dbg !151, !tbaa !109
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !152
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !143
  %4 = trunc i64 %3 to i32, !dbg !153
  %rem = srem i32 %4, 20, !dbg !153
  %cmp6 = icmp eq i32 %rem, 0, !dbg !153
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !154

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !155, !tbaa !87
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !157
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !149
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !149
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !149

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !141
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000, !dbg !141
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !141

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !158, !tbaa !87
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !159
  ret void, !dbg !160
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
!llvm.module.flags = !{!69, !70}
!llvm.ident = !{!71}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c] [DW_LANG_C99]
!1 = !{!"seidel-2d.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0064000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001000"}                        ; [ DW_TAG_subrange_type ] [0, 999]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d"}
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
!21 = !{!22, !42, !53, !63}
!22 = !{!"0x2e\00main\00main\00\0073\000\001\000\000\00256\001\0074", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !38, !39, !41}
!30 = !{!"0x101\00argc\0016777289\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 73]
!31 = !{!"0x101\00argv\0033554505\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 73]
!32 = !{!"0x100\00n\0076\000", !22, !23, !26}     ; [ DW_TAG_auto_variable ] [n] [line 76]
!33 = !{!"0x100\00tsteps\0077\000", !22, !23, !26} ; [ DW_TAG_auto_variable ] [tsteps] [line 77]
!34 = !{!"0x100\00A\0080\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 80]
!35 = !{!"0x100\00__s1_len\0098\000", !36, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 98]
!36 = !{!"0xb\0098\003\001", !1, !37}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!37 = !{!"0xb\0098\003\000", !1, !22}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!38 = !{!"0x100\00__s2_len\0098\000", !36, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 98]
!39 = !{!"0x100\00__s2\0098\000", !40, !23, !14}  ; [ DW_TAG_auto_variable ] [__s2] [line 98]
!40 = !{!"0xb\0098\003\002", !1, !36}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!41 = !{!"0x100\00__result\0098\000", !40, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 98]
!42 = !{!"0x2e\00print_array\00print_array\00\0037\001\001\000\000\00256\001\0040", !1, !23, !43, null, void ([1000 x double]*)* @print_array, null, null, !48} ; [ DW_TAG_subprogram ] [line 37] [local] [def] [scope 40] [print_array]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{null, !26, !45}
!45 = !{!"0xf\00\000\0064\0064\000\000", null, null, !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!46 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !6, !47, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from double]
!47 = !{!8}
!48 = !{!49, !50, !51, !52}
!49 = !{!"0x101\00n\0016777253\000", !42, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 37]
!50 = !{!"0x101\00A\0033554470\000", !42, !23, !45} ; [ DW_TAG_arg_variable ] [A] [line 38]
!51 = !{!"0x100\00i\0041\000", !42, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 41]
!52 = !{!"0x100\00j\0041\000", !42, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 41]
!53 = !{!"0x2e\00kernel_seidel_2d\00kernel_seidel_2d\00\0055\001\001\000\000\00256\001\0058", !1, !23, !54, null, void ([1000 x double]*)* @kernel_seidel_2d, null, null, !56} ; [ DW_TAG_subprogram ] [line 55] [local] [def] [scope 58] [kernel_seidel_2d]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{null, !26, !26, !45}
!56 = !{!57, !58, !59, !60, !61, !62}
!57 = !{!"0x101\00tsteps\0016777271\000", !53, !23, !26} ; [ DW_TAG_arg_variable ] [tsteps] [line 55]
!58 = !{!"0x101\00n\0033554488\000", !53, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 56]
!59 = !{!"0x101\00A\0050331705\000", !53, !23, !45} ; [ DW_TAG_arg_variable ] [A] [line 57]
!60 = !{!"0x100\00t\0059\000", !53, !23, !26}     ; [ DW_TAG_auto_variable ] [t] [line 59]
!61 = !{!"0x100\00i\0059\000", !53, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 59]
!62 = !{!"0x100\00j\0059\000", !53, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 59]
!63 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0025", !1, !23, !43, null, void ([1000 x double]*)* @init_array, null, null, !64} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 25] [init_array]
!64 = !{!65, !66, !67, !68}
!65 = !{!"0x101\00n\0016777239\000", !63, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!66 = !{!"0x101\00A\0033554456\000", !63, !23, !45} ; [ DW_TAG_arg_variable ] [A] [line 24]
!67 = !{!"0x100\00i\0026\000", !63, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 26]
!68 = !{!"0x100\00j\0026\000", !63, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 26]
!69 = !{i32 2, !"Dwarf Version", i32 4}
!70 = !{i32 2, !"Debug Info Version", i32 2}
!71 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!72 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!73 = !MDLocation(line: 73, column: 14, scope: !22)
!74 = !MDLocation(line: 73, column: 27, scope: !22)
!75 = !MDLocation(line: 76, column: 7, scope: !22)
!76 = !MDLocation(line: 77, column: 7, scope: !22)
!77 = !MDLocation(line: 80, column: 3, scope: !22)
!78 = !MDLocation(line: 84, column: 18, scope: !22)
!79 = !MDLocation(line: 84, column: 3, scope: !22)
!80 = !MDLocation(line: 90, column: 3, scope: !22)
!81 = !MDLocation(line: 98, column: 3, scope: !37)
!82 = !MDLocation(line: 98, column: 3, scope: !22)
!83 = !MDLocation(line: 98, column: 3, scope: !36)
!84 = !MDLocation(line: 98, column: 3, scope: !40)
!85 = !MDLocation(line: 98, column: 3, scope: !86)
!86 = !{!"0xb\004", !1, !40}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!87 = !{!88, !88, i64 0}
!88 = !{!"any pointer", !89, i64 0}
!89 = !{!"omnipotent char", !90, i64 0}
!90 = !{!"Simple C/C++ TBAA"}
!91 = !{!89, !89, i64 0}
!92 = !MDLocation(line: 98, column: 3, scope: !93)
!93 = !{!"0xb\0023", !1, !37}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!94 = !MDLocation(line: 101, column: 3, scope: !22)
!95 = !MDLocation(line: 103, column: 3, scope: !22)
!96 = !MDLocation(line: 23, column: 22, scope: !63)
!97 = !MDLocation(line: 26, column: 7, scope: !63)
!98 = !MDLocation(line: 28, column: 3, scope: !99)
!99 = !{!"0xb\0028\003\0020", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!100 = !MDLocation(line: 30, column: 18, scope: !101)
!101 = !{!"0xb\0029\005\0023", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!102 = !{!"0xb\0029\005\0022", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!103 = !{!"0xb\0028\003\0021", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!104 = !MDLocation(line: 29, column: 5, scope: !102)
!105 = !MDLocation(line: 30, column: 33, scope: !101)
!106 = !MDLocation(line: 30, column: 32, scope: !101)
!107 = !MDLocation(line: 30, column: 17, scope: !101)
!108 = !MDLocation(line: 30, column: 7, scope: !101)
!109 = !{!110, !110, i64 0}
!110 = !{!"double", !89, i64 0}
!111 = !MDLocation(line: 31, column: 1, scope: !63)
!112 = !MDLocation(line: 55, column: 27, scope: !53)
!113 = !MDLocation(line: 56, column: 13, scope: !53)
!114 = !MDLocation(line: 59, column: 7, scope: !53)
!115 = !MDLocation(line: 62, column: 3, scope: !116)
!116 = !{!"0xb\0062\003\0014", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!117 = !MDLocation(line: 63, column: 5, scope: !118)
!118 = !{!"0xb\0063\005\0016", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!119 = !{!"0xb\0062\003\0015", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!120 = !MDLocation(line: 65, column: 15, scope: !121)
!121 = !{!"0xb\0064\007\0019", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!122 = !{!"0xb\0064\007\0018", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!123 = !{!"0xb\0063\005\0017", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!124 = !MDLocation(line: 64, column: 7, scope: !122)
!125 = !MDLocation(line: 65, column: 20, scope: !121)
!126 = !MDLocation(line: 65, column: 13, scope: !121)
!127 = !MDLocation(line: 65, column: 27, scope: !121)
!128 = !MDLocation(line: 65, column: 39, scope: !121)
!129 = !MDLocation(line: 66, column: 8, scope: !121)
!130 = !MDLocation(line: 66, column: 20, scope: !121)
!131 = !MDLocation(line: 66, column: 30, scope: !121)
!132 = !MDLocation(line: 67, column: 8, scope: !121)
!133 = !MDLocation(line: 67, column: 22, scope: !121)
!134 = !MDLocation(line: 67, column: 34, scope: !121)
!135 = !MDLocation(line: 65, column: 12, scope: !121)
!136 = !MDLocation(line: 65, column: 2, scope: !121)
!137 = !MDLocation(line: 62, column: 32, scope: !119)
!138 = !MDLocation(line: 70, column: 1, scope: !53)
!139 = !MDLocation(line: 37, column: 22, scope: !42)
!140 = !MDLocation(line: 41, column: 7, scope: !42)
!141 = !MDLocation(line: 43, column: 3, scope: !142)
!142 = !{!"0xb\0043\003\008", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!143 = !MDLocation(line: 46, column: 12, scope: !144)
!144 = !{!"0xb\0046\0011\0013", !1, !145}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!145 = !{!"0xb\0044\0029\0012", !1, !146}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!146 = !{!"0xb\0044\005\0011", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!147 = !{!"0xb\0044\005\0010", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!148 = !{!"0xb\0043\003\009", !1, !142}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!149 = !MDLocation(line: 44, column: 5, scope: !147)
!150 = !MDLocation(line: 45, column: 15, scope: !145)
!151 = !MDLocation(line: 45, column: 45, scope: !145)
!152 = !MDLocation(line: 45, column: 7, scope: !145)
!153 = !MDLocation(line: 46, column: 11, scope: !144)
!154 = !MDLocation(line: 46, column: 11, scope: !145)
!155 = !MDLocation(line: 46, column: 42, scope: !156)
!156 = !{!"0xb\001", !1, !144}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!157 = !MDLocation(line: 46, column: 34, scope: !144)
!158 = !MDLocation(line: 48, column: 11, scope: !42)
!159 = !MDLocation(line: 48, column: 3, scope: !42)
!160 = !MDLocation(line: 49, column: 1, scope: !42)
