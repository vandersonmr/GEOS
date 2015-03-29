; ModuleID = 'lu.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !68), !dbg !69
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !68), !dbg !70
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !68), !dbg !71
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !72
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !73
  tail call fastcc void @init_array([1024 x double]* %arraydecay), !dbg !74
  tail call fastcc void @kernel_lu([1024 x double]* %arraydecay), !dbg !75
  %cmp = icmp sgt i32 %argc, 42, !dbg !76
  br i1 %cmp, label %if.end38, label %if.end45, !dbg !77

if.end38:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !68), !dbg !78
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !38, metadata !68), !dbg !79
  %0 = load i8** %argv, align 8, !dbg !80, !tbaa !82
  %1 = load i8* %0, align 1, !dbg !80, !tbaa !86
  %phitmp = icmp eq i8 %1, 0, !dbg !78
  br i1 %phitmp, label %if.then43, label %if.end45, !dbg !77

if.then43:                                        ; preds = %if.end38
  tail call fastcc void @print_array([1024 x double]* %arraydecay), !dbg !87
  br label %if.end45, !dbg !87

if.end45:                                         ; preds = %if.end38, %if.then43, %entry
  tail call void @free(i8* %call) #4, !dbg !89
  ret i32 0, !dbg !90
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([1024 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !61, metadata !68), !dbg !91
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !68), !dbg !92
  br label %for.cond1.preheader, !dbg !93

for.cond.loopexit:                                ; preds = %for.body3
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1024, !dbg !93
  br i1 %exitcond5, label %for.end11, label %for.cond1.preheader, !dbg !93

for.cond1.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.cond.loopexit ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !93
  %0 = trunc i64 %indvars.iv.next4 to i32, !dbg !95
  %conv = sitofp i32 %0 to double, !dbg !95
  br label %for.body3, !dbg !99

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !99
  %1 = trunc i64 %indvars.iv.next to i32, !dbg !100
  %conv5 = sitofp i32 %1 to double, !dbg !100
  %mul = fmul double %conv, %conv5, !dbg !95
  %div = fmul double %mul, 9.765625e-04, !dbg !101
  %arrayidx8 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !102
  store double %div, double* %arrayidx8, align 8, !dbg !102, !tbaa !103
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !99
  br i1 %exitcond, label %for.cond.loopexit, label %for.body3, !dbg !99

for.end11:                                        ; preds = %for.cond.loopexit
  ret void, !dbg !105
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_lu([1024 x double]* nocapture %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !54, metadata !68), !dbg !106
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !58, metadata !68), !dbg !107
  br label %for.body, !dbg !108

for.cond.loopexit:                                ; preds = %for.inc41, %for.body, %for.cond15.preheader
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !108
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1024, !dbg !108
  br i1 %exitcond24, label %for.end46, label %for.body, !dbg !108

for.body:                                         ; preds = %for.cond.loopexit, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.cond.loopexit ]
  %indvars.iv16 = phi i64 [ 1, %entry ], [ %indvars.iv.next17, %for.cond.loopexit ]
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !108
  %cmp21 = icmp slt i64 %indvars.iv.next23, 1024, !dbg !110
  br i1 %cmp21, label %for.body3.lr.ph, label %for.cond.loopexit, !dbg !115

for.body3.lr.ph:                                  ; preds = %for.body
  %arrayidx9 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv22, !dbg !116
  br label %for.body3, !dbg !115

for.cond15.preheader:                             ; preds = %for.body3
  %cmp165 = icmp slt i64 %indvars.iv.next23, 1024, !dbg !117
  br i1 %cmp165, label %for.body21.lr.ph, label %for.cond.loopexit, !dbg !120

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv8 = phi i64 [ %indvars.iv16, %for.body3.lr.ph ], [ %indvars.iv.next9, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv8, !dbg !121
  %0 = load double* %arrayidx5, align 8, !dbg !121, !tbaa !103
  %1 = load double* %arrayidx9, align 8, !dbg !116, !tbaa !103
  %div = fdiv double %0, %1, !dbg !121
  store double %div, double* %arrayidx5, align 8, !dbg !122, !tbaa !103
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !115
  %lftr.wideiv = trunc i64 %indvars.iv8 to i32, !dbg !115
  %exitcond = icmp eq i32 %lftr.wideiv, 1023, !dbg !115
  br i1 %exitcond, label %for.cond15.preheader, label %for.body3, !dbg !115

for.body21.lr.ph:                                 ; preds = %for.cond15.preheader, %for.inc41
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.inc41 ], [ %indvars.iv16, %for.cond15.preheader ]
  %arrayidx29 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv22, !dbg !123
  br label %for.body21, !dbg !126

for.body21:                                       ; preds = %for.body21, %for.body21.lr.ph
  %indvars.iv12 = phi i64 [ %indvars.iv16, %for.body21.lr.ph ], [ %indvars.iv.next13, %for.body21 ]
  %arrayidx25 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12, !dbg !127
  %2 = load double* %arrayidx25, align 8, !dbg !127, !tbaa !103
  %3 = load double* %arrayidx29, align 8, !dbg !123, !tbaa !103
  %arrayidx33 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv12, !dbg !128
  %4 = load double* %arrayidx33, align 8, !dbg !128, !tbaa !103
  %mul = fmul double %3, %4, !dbg !123
  %sub = fsub double %2, %mul, !dbg !127
  store double %sub, double* %arrayidx25, align 8, !dbg !129, !tbaa !103
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !126
  %lftr.wideiv14 = trunc i64 %indvars.iv12 to i32, !dbg !126
  %exitcond15 = icmp eq i32 %lftr.wideiv14, 1023, !dbg !126
  br i1 %exitcond15, label %for.inc41, label %for.body21, !dbg !126

for.inc41:                                        ; preds = %for.body21
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !120
  %lftr.wideiv20 = trunc i64 %indvars.iv18 to i32, !dbg !120
  %exitcond21 = icmp eq i32 %lftr.wideiv20, 1023, !dbg !120
  br i1 %exitcond21, label %for.cond.loopexit, label %for.body21.lr.ph, !dbg !120

for.end46:                                        ; preds = %for.cond.loopexit
  ret void, !dbg !130
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !48, metadata !68), !dbg !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !50, metadata !68), !dbg !132
  br label %for.cond1.preheader, !dbg !133

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !135
  br label %for.body3, !dbg !141

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !142, !tbaa !82
  %arrayidx5 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv, !dbg !143
  %2 = load double* %arrayidx5, align 8, !dbg !143, !tbaa !103
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !144
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !135
  %4 = trunc i64 %3 to i32, !dbg !145
  %rem = srem i32 %4, 20, !dbg !145
  %cmp6 = icmp eq i32 %rem, 0, !dbg !145
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !146

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !147, !tbaa !82
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !149
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !141
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !141
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !141

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !133
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !133
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !133

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !150, !tbaa !82
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !151
  ret void, !dbg !152
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
!llvm.module.flags = !{!65, !66}
!llvm.ident = !{!67}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c] [DW_LANG_C99]
!1 = !{!"lu.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu"}
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
!21 = !{!22, !41, !52, !59}
!22 = !{!"0x2e\00main\00main\00\0074\000\001\000\000\00256\001\0075", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 74] [def] [scope 75] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !37, !38, !40}
!30 = !{!"0x101\00argc\0016777290\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 74]
!31 = !{!"0x101\00argv\0033554506\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 74]
!32 = !{!"0x100\00n\0077\000", !22, !23, !26}     ; [ DW_TAG_auto_variable ] [n] [line 77]
!33 = !{!"0x100\00A\0080\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 80]
!34 = !{!"0x100\00__s1_len\0098\000", !35, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 98]
!35 = !{!"0xb\0098\003\001", !1, !36}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!36 = !{!"0xb\0098\003\000", !1, !22}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!37 = !{!"0x100\00__s2_len\0098\000", !35, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 98]
!38 = !{!"0x100\00__s2\0098\000", !39, !23, !14}  ; [ DW_TAG_auto_variable ] [__s2] [line 98]
!39 = !{!"0xb\0098\003\002", !1, !35}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!40 = !{!"0x100\00__result\0098\000", !39, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 98]
!41 = !{!"0x2e\00print_array\00print_array\00\0037\001\001\000\000\00256\001\0040", !1, !23, !42, null, void ([1024 x double]*)* @print_array, null, null, !47} ; [ DW_TAG_subprogram ] [line 37] [local] [def] [scope 40] [print_array]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{null, !26, !44}
!44 = !{!"0xf\00\000\0064\0064\000\000", null, null, !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !46, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!46 = !{!8}
!47 = !{!48, !49, !50, !51}
!48 = !{!"0x101\00n\0016777253\000", !41, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 37]
!49 = !{!"0x101\00A\0033554470\000", !41, !23, !44} ; [ DW_TAG_arg_variable ] [A] [line 38]
!50 = !{!"0x100\00i\0041\000", !41, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 41]
!51 = !{!"0x100\00j\0041\000", !41, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 41]
!52 = !{!"0x2e\00kernel_lu\00kernel_lu\00\0055\001\001\000\000\00256\001\0057", !1, !23, !42, null, void ([1024 x double]*)* @kernel_lu, null, null, !53} ; [ DW_TAG_subprogram ] [line 55] [local] [def] [scope 57] [kernel_lu]
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00n\0016777271\000", !52, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 55]
!55 = !{!"0x101\00A\0033554488\000", !52, !23, !44} ; [ DW_TAG_arg_variable ] [A] [line 56]
!56 = !{!"0x100\00i\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 58]
!57 = !{!"0x100\00j\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 58]
!58 = !{!"0x100\00k\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 58]
!59 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0025", !1, !23, !42, null, void ([1024 x double]*)* @init_array, null, null, !60} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 25] [init_array]
!60 = !{!61, !62, !63, !64}
!61 = !{!"0x101\00n\0016777239\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!62 = !{!"0x101\00A\0033554456\000", !59, !23, !44} ; [ DW_TAG_arg_variable ] [A] [line 24]
!63 = !{!"0x100\00i\0026\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 26]
!64 = !{!"0x100\00j\0026\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 26]
!65 = !{i32 2, !"Dwarf Version", i32 4}
!66 = !{i32 2, !"Debug Info Version", i32 2}
!67 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!68 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!69 = !MDLocation(line: 74, column: 14, scope: !22)
!70 = !MDLocation(line: 74, column: 27, scope: !22)
!71 = !MDLocation(line: 77, column: 7, scope: !22)
!72 = !MDLocation(line: 80, column: 3, scope: !22)
!73 = !MDLocation(line: 84, column: 18, scope: !22)
!74 = !MDLocation(line: 84, column: 3, scope: !22)
!75 = !MDLocation(line: 90, column: 3, scope: !22)
!76 = !MDLocation(line: 98, column: 3, scope: !36)
!77 = !MDLocation(line: 98, column: 3, scope: !22)
!78 = !MDLocation(line: 98, column: 3, scope: !35)
!79 = !MDLocation(line: 98, column: 3, scope: !39)
!80 = !MDLocation(line: 98, column: 3, scope: !81)
!81 = !{!"0xb\004", !1, !39}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!82 = !{!83, !83, i64 0}
!83 = !{!"any pointer", !84, i64 0}
!84 = !{!"omnipotent char", !85, i64 0}
!85 = !{!"Simple C/C++ TBAA"}
!86 = !{!84, !84, i64 0}
!87 = !MDLocation(line: 98, column: 3, scope: !88)
!88 = !{!"0xb\0023", !1, !36}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!89 = !MDLocation(line: 101, column: 3, scope: !22)
!90 = !MDLocation(line: 103, column: 3, scope: !22)
!91 = !MDLocation(line: 23, column: 22, scope: !59)
!92 = !MDLocation(line: 26, column: 7, scope: !59)
!93 = !MDLocation(line: 28, column: 3, scope: !94)
!94 = !{!"0xb\0028\003\0023", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!95 = !MDLocation(line: 30, column: 18, scope: !96)
!96 = !{!"0xb\0029\005\0026", !1, !97}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!97 = !{!"0xb\0029\005\0025", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!98 = !{!"0xb\0028\003\0024", !1, !94}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!99 = !MDLocation(line: 29, column: 5, scope: !97)
!100 = !MDLocation(line: 30, column: 36, scope: !96)
!101 = !MDLocation(line: 30, column: 17, scope: !96)
!102 = !MDLocation(line: 30, column: 7, scope: !96)
!103 = !{!104, !104, i64 0}
!104 = !{!"double", !84, i64 0}
!105 = !MDLocation(line: 31, column: 1, scope: !59)
!106 = !MDLocation(line: 55, column: 20, scope: !52)
!107 = !MDLocation(line: 58, column: 13, scope: !52)
!108 = !MDLocation(line: 61, column: 3, scope: !109)
!109 = !{!"0xb\0061\003\0014", !1, !52}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!110 = !MDLocation(line: 63, column: 23, scope: !111)
!111 = !{!"0xb\0063\007\0018", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!112 = !{!"0xb\0063\007\0017", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!113 = !{!"0xb\0062\005\0016", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!114 = !{!"0xb\0061\003\0015", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!115 = !MDLocation(line: 63, column: 7, scope: !112)
!116 = !MDLocation(line: 64, column: 22, scope: !111)
!117 = !MDLocation(line: 65, column: 22, scope: !118)
!118 = !{!"0xb\0065\007\0020", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!119 = !{!"0xb\0065\007\0019", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!120 = !MDLocation(line: 65, column: 7, scope: !119)
!121 = !MDLocation(line: 64, column: 12, scope: !111)
!122 = !MDLocation(line: 64, column: 2, scope: !111)
!123 = !MDLocation(line: 67, column: 24, scope: !124)
!124 = !{!"0xb\0066\002\0022", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!125 = !{!"0xb\0066\002\0021", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!126 = !MDLocation(line: 66, column: 2, scope: !125)
!127 = !MDLocation(line: 67, column: 14, scope: !124)
!128 = !MDLocation(line: 67, column: 34, scope: !124)
!129 = !MDLocation(line: 67, column: 4, scope: !124)
!130 = !MDLocation(line: 71, column: 1, scope: !52)
!131 = !MDLocation(line: 37, column: 22, scope: !41)
!132 = !MDLocation(line: 41, column: 7, scope: !41)
!133 = !MDLocation(line: 43, column: 3, scope: !134)
!134 = !{!"0xb\0043\003\008", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!135 = !MDLocation(line: 46, column: 12, scope: !136)
!136 = !{!"0xb\0046\0011\0013", !1, !137}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!137 = !{!"0xb\0044\0029\0012", !1, !138}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!138 = !{!"0xb\0044\005\0011", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!139 = !{!"0xb\0044\005\0010", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!140 = !{!"0xb\0043\003\009", !1, !134}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!141 = !MDLocation(line: 44, column: 5, scope: !139)
!142 = !MDLocation(line: 45, column: 16, scope: !137)
!143 = !MDLocation(line: 45, column: 46, scope: !137)
!144 = !MDLocation(line: 45, column: 7, scope: !137)
!145 = !MDLocation(line: 46, column: 11, scope: !136)
!146 = !MDLocation(line: 46, column: 11, scope: !137)
!147 = !MDLocation(line: 46, column: 43, scope: !148)
!148 = !{!"0xb\001", !1, !136}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!149 = !MDLocation(line: 46, column: 34, scope: !136)
!150 = !MDLocation(line: 48, column: 12, scope: !41)
!151 = !MDLocation(line: 48, column: 3, scope: !41)
!152 = !MDLocation(line: 49, column: 1, scope: !41)
