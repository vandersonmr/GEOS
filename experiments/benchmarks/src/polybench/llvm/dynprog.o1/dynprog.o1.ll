; ModuleID = 'dynprog.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %out = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !32, metadata !83), !dbg !84
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !33, metadata !83), !dbg !85
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !34, metadata !83), !dbg !86
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !35, metadata !83), !dbg !87
  %call = tail call i8* @polybench_alloc_data(i32 125000, i32 4) #4, !dbg !88
  %call1 = tail call i8* @polybench_alloc_data(i32 2500, i32 4) #4, !dbg !89
  %call2 = tail call i8* @polybench_alloc_data(i32 2500, i32 4) #4, !dbg !90
  %arraydecay = bitcast i8* %call1 to [50 x i32]*, !dbg !91
  %arraydecay3 = bitcast i8* %call2 to [50 x i32]*, !dbg !92
  tail call fastcc void @init_array([50 x i32]* %arraydecay, [50 x i32]* %arraydecay3), !dbg !93
  %arraydecay6 = bitcast i8* %call to [50 x [50 x i32]]*, !dbg !94
  tail call void @llvm.dbg.value(metadata i32* %out, i64 0, metadata !36, metadata !83), !dbg !95
  call fastcc void @kernel_dynprog([50 x i32]* %arraydecay, [50 x i32]* %arraydecay3, [50 x [50 x i32]]* %arraydecay6, i32* %out), !dbg !96
  %cmp = icmp sgt i32 %argc, 42, !dbg !97
  br i1 %cmp, label %if.end43, label %if.end49, !dbg !98

if.end43:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !83), !dbg !99
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !44, metadata !83), !dbg !100
  %0 = load i8** %argv, align 8, !dbg !101, !tbaa !103
  %1 = load i8* %0, align 1, !dbg !101, !tbaa !107
  %phitmp = icmp eq i8 %1, 0, !dbg !99
  br i1 %phitmp, label %if.then48, label %if.end49, !dbg !98

if.then48:                                        ; preds = %if.end43
  tail call void @llvm.dbg.value(metadata i32* %out, i64 0, metadata !36, metadata !83), !dbg !95
  %2 = load i32* %out, align 4, !dbg !108, !tbaa !110
  tail call fastcc void @print_array(i32 %2), !dbg !108
  br label %if.end49, !dbg !108

if.end49:                                         ; preds = %if.end43, %if.then48, %entry
  tail call void @free(i8* %call) #4, !dbg !112
  tail call void @free(i8* %call1) #4, !dbg !113
  tail call void @free(i8* %call2) #4, !dbg !114
  ret i32 0, !dbg !115
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([50 x i32]* nocapture %c, [50 x i32]* nocapture %W) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !75, metadata !83), !dbg !116
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !78, metadata !83), !dbg !117
  br label %for.cond1.preheader, !dbg !118

for.cond1.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc10 ]
  br label %for.body3, !dbg !120

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %0 = mul nsw i64 %indvars.iv, %indvars.iv5, !dbg !123
  %1 = trunc i64 %0 to i32, !dbg !123
  %rem = srem i32 %1, 2, !dbg !123
  %arrayidx5 = getelementptr inbounds [50 x i32]* %c, i64 %indvars.iv5, i64 %indvars.iv, !dbg !126
  store i32 %rem, i32* %arrayidx5, align 4, !dbg !126, !tbaa !110
  %2 = sub nsw i64 %indvars.iv5, %indvars.iv, !dbg !127
  %3 = trunc i64 %2 to i32, !dbg !128
  %div = sdiv i32 %3, 50, !dbg !128
  %arrayidx9 = getelementptr inbounds [50 x i32]* %W, i64 %indvars.iv5, i64 %indvars.iv, !dbg !129
  store i32 %div, i32* %arrayidx9, align 4, !dbg !129, !tbaa !110
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !120
  %exitcond = icmp eq i64 %indvars.iv.next, 50, !dbg !120
  br i1 %exitcond, label %for.inc10, label %for.body3, !dbg !120

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !118
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 50, !dbg !118
  br i1 %exitcond7, label %for.end12, label %for.cond1.preheader, !dbg !118

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !130
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_dynprog([50 x i32]* nocapture %c, [50 x i32]* nocapture readonly %W, [50 x [50 x i32]]* nocapture %sum_c, i32* nocapture %out) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !60, metadata !83), !dbg !131
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !61, metadata !83), !dbg !132
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !83), !dbg !133
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !66, metadata !83), !dbg !134
  %c11 = bitcast [50 x i32]* %c to i8*
  %arrayidx83 = getelementptr inbounds [50 x i32]* %c, i64 0, i64 49, !dbg !135
  br label %for.cond13.preheader, !dbg !139

for.cond13.preheader:                             ; preds = %entry, %for.end79
  %out_l.09 = phi i32 [ 0, %entry ], [ %add84, %for.end79 ]
  %iter.08 = phi i32 [ 0, %entry ], [ %inc86, %for.end79 ]
  call void @llvm.memset.p0i8.i64(i8* %c11, i8 0, i64 10000, i32 4, i1 false), !dbg !140
  br label %for.body20.lr.ph, !dbg !145

for.cond13.loopexit:                              ; preds = %for.end57
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !145
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 49, !dbg !145
  br i1 %exitcond28, label %for.end79, label %for.body20.lr.ph, !dbg !145

for.body20.lr.ph:                                 ; preds = %for.cond13.preheader, %for.cond13.loopexit
  %indvars.iv26 = phi i64 [ 0, %for.cond13.preheader ], [ %indvars.iv.next27, %for.cond13.loopexit ]
  %indvars.iv19 = phi i64 [ 1, %for.cond13.preheader ], [ %indvars.iv.next20, %for.cond13.loopexit ]
  %indvars.iv15 = phi i32 [ 0, %for.cond13.preheader ], [ %indvars.iv.next16, %for.cond13.loopexit ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1, !dbg !145
  %indvars.iv.next16 = add nuw nsw i32 %indvars.iv15, 1, !dbg !145
  tail call void @llvm.dbg.value(metadata i32 %indvars.iv.next16, i64 0, metadata !68, metadata !83), !dbg !147
  br label %for.body20, !dbg !148

for.body20:                                       ; preds = %for.end57, %for.body20.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv19, %for.body20.lr.ph ], [ %indvars.iv.next22, %for.end57 ]
  %indvars.iv17 = phi i32 [ %indvars.iv15, %for.body20.lr.ph ], [ %indvars.iv.next18, %for.end57 ]
  %arrayidx26 = getelementptr inbounds [50 x [50 x i32]]* %sum_c, i64 %indvars.iv26, i64 %indvars.iv21, i64 %indvars.iv26, !dbg !152
  store i32 0, i32* %arrayidx26, align 4, !dbg !152, !tbaa !110
  tail call void @llvm.dbg.value(metadata i32 %indvars.iv.next16, i64 0, metadata !69, metadata !83), !dbg !155
  %0 = add nsw i64 %indvars.iv21, -1, !dbg !156
  %cmp303 = icmp slt i64 %indvars.iv26, %0, !dbg !159
  br i1 %cmp303, label %for.body31, label %for.end57, !dbg !160

for.body31:                                       ; preds = %for.body20, %for.body31
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body31 ], [ %indvars.iv19, %for.body20 ]
  %1 = add nsw i64 %indvars.iv12, -1, !dbg !161
  %arrayidx38 = getelementptr inbounds [50 x [50 x i32]]* %sum_c, i64 %indvars.iv26, i64 %indvars.iv21, i64 %1, !dbg !162
  %2 = load i32* %arrayidx38, align 4, !dbg !162, !tbaa !110
  %arrayidx42 = getelementptr inbounds [50 x i32]* %c, i64 %indvars.iv26, i64 %indvars.iv12, !dbg !163
  %3 = load i32* %arrayidx42, align 4, !dbg !163, !tbaa !110
  %add43 = add nsw i32 %3, %2, !dbg !162
  %arrayidx47 = getelementptr inbounds [50 x i32]* %c, i64 %indvars.iv12, i64 %indvars.iv21, !dbg !164
  %4 = load i32* %arrayidx47, align 4, !dbg !164, !tbaa !110
  %add48 = add nsw i32 %add43, %4, !dbg !162
  %arrayidx54 = getelementptr inbounds [50 x [50 x i32]]* %sum_c, i64 %indvars.iv26, i64 %indvars.iv21, i64 %indvars.iv12, !dbg !165
  store i32 %add48, i32* %arrayidx54, align 4, !dbg !165, !tbaa !110
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !160
  %lftr.wideiv = trunc i64 %indvars.iv12 to i32, !dbg !160
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv17, !dbg !160
  br i1 %exitcond, label %for.end57, label %for.body31, !dbg !160

for.end57:                                        ; preds = %for.body31, %for.body20
  %arrayidx64 = getelementptr inbounds [50 x [50 x i32]]* %sum_c, i64 %indvars.iv26, i64 %indvars.iv21, i64 %0, !dbg !166
  %5 = load i32* %arrayidx64, align 4, !dbg !166, !tbaa !110
  %arrayidx68 = getelementptr inbounds [50 x i32]* %W, i64 %indvars.iv26, i64 %indvars.iv21, !dbg !167
  %6 = load i32* %arrayidx68, align 4, !dbg !167, !tbaa !110
  %add69 = add nsw i32 %6, %5, !dbg !166
  %arrayidx73 = getelementptr inbounds [50 x i32]* %c, i64 %indvars.iv26, i64 %indvars.iv21, !dbg !168
  store i32 %add69, i32* %arrayidx73, align 4, !dbg !168, !tbaa !110
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !148
  %indvars.iv.next18 = add nuw nsw i32 %indvars.iv17, 1, !dbg !148
  %lftr.wideiv24 = trunc i64 %indvars.iv.next22 to i32, !dbg !148
  %exitcond25 = icmp eq i32 %lftr.wideiv24, 50, !dbg !148
  br i1 %exitcond25, label %for.cond13.loopexit, label %for.body20, !dbg !148

for.end79:                                        ; preds = %for.cond13.loopexit
  %7 = load i32* %arrayidx83, align 4, !dbg !135, !tbaa !110
  %add84 = add nsw i32 %7, %out_l.09, !dbg !169
  tail call void @llvm.dbg.value(metadata i32 %add84, i64 0, metadata !70, metadata !83), !dbg !133
  %inc86 = add nuw nsw i32 %iter.08, 1, !dbg !170
  tail call void @llvm.dbg.value(metadata i32 %inc86, i64 0, metadata !66, metadata !83), !dbg !134
  %exitcond29 = icmp eq i32 %inc86, 10000, !dbg !139
  br i1 %exitcond29, label %for.end87, label %for.cond13.preheader, !dbg !139

for.end87:                                        ; preds = %for.end79
  store i32 %add84, i32* %out, align 4, !dbg !171, !tbaa !110
  ret void, !dbg !172
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(i32 %out) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %out, i64 0, metadata !51, metadata !83), !dbg !173
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !174, !tbaa !103
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %out) #5, !dbg !175
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !176, !tbaa !103
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1) #6, !dbg !177
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
!llvm.module.flags = !{!80, !81}
!llvm.ident = !{!82}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c] [DW_LANG_C99]
!1 = !{!"dynprog.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\004000000\0032\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4000000, align 32, offset 0] [from int]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!8, !8, !8}
!8 = !{!"0x21\000\0050"}                          ; [ DW_TAG_subrange_type ] [0, 49]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0080000\0032\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 80000, align 32, offset 0] [from int]
!11 = !{!8, !8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog"}
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
!24 = !{!25, !47, !52, !71}
!25 = !{!"0x2e\00main\00main\00\0084\000\001\000\000\00256\001\0085", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !31} ; [ DW_TAG_subprogram ] [line 84] [def] [scope 85] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!6, !6, !29}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !40, !43, !44, !46}
!32 = !{!"0x101\00argc\0016777300\000", !25, !26, !6} ; [ DW_TAG_arg_variable ] [argc] [line 84]
!33 = !{!"0x101\00argv\0033554516\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argv] [line 84]
!34 = !{!"0x100\00length\0087\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [length] [line 87]
!35 = !{!"0x100\00tsteps\0088\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [tsteps] [line 88]
!36 = !{!"0x100\00out\0091\000", !25, !26, !6}    ; [ DW_TAG_auto_variable ] [out] [line 91]
!37 = !{!"0x100\00sum_c\0092\000", !25, !26, !4}  ; [ DW_TAG_auto_variable ] [sum_c] [line 92]
!38 = !{!"0x100\00c\0093\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [c] [line 93]
!39 = !{!"0x100\00W\0094\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [W] [line 94]
!40 = !{!"0x100\00__s1_len\00115\000", !41, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 115]
!41 = !{!"0xb\00115\003\001", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!42 = !{!"0xb\00115\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!43 = !{!"0x100\00__s2_len\00115\000", !41, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 115]
!44 = !{!"0x100\00__s2\00115\000", !45, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 115]
!45 = !{!"0xb\00115\003\002", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!46 = !{!"0x100\00__result\00115\000", !45, !26, !6} ; [ DW_TAG_auto_variable ] [__result] [line 115]
!47 = !{!"0x2e\00print_array\00print_array\00\0039\001\001\000\000\00256\001\0040", !1, !26, !48, null, void (i32)* @print_array, null, null, !50} ; [ DW_TAG_subprogram ] [line 39] [local] [def] [scope 40] [print_array]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{null, !6}
!50 = !{!51}
!51 = !{!"0x101\00out\0016777255\000", !47, !26, !6} ; [ DW_TAG_arg_variable ] [out] [line 39]
!52 = !{!"0x2e\00kernel_dynprog\00kernel_dynprog\00\0049\001\001\000\000\00256\001\0054", !1, !26, !53, null, void ([50 x i32]*, [50 x i32]*, [50 x [50 x i32]]*, i32*)* @kernel_dynprog, null, null, !59} ; [ DW_TAG_subprogram ] [line 49] [local] [def] [scope 54] [kernel_dynprog]
!53 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !54, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = !{null, !6, !6, !55, !55, !9, !58}
!55 = !{!"0xf\00\000\0064\0064\000\000", null, null, !56} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!56 = !{!"0x1\00\000\001600\0032\000\000\000", null, null, !6, !57, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1600, align 32, offset 0] [from int]
!57 = !{!8}
!58 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!60 = !{!"0x101\00tsteps\0016777265\000", !52, !26, !6} ; [ DW_TAG_arg_variable ] [tsteps] [line 49]
!61 = !{!"0x101\00length\0033554481\000", !52, !26, !6} ; [ DW_TAG_arg_variable ] [length] [line 49]
!62 = !{!"0x101\00c\0050331698\000", !52, !26, !55} ; [ DW_TAG_arg_variable ] [c] [line 50]
!63 = !{!"0x101\00W\0067108915\000", !52, !26, !55} ; [ DW_TAG_arg_variable ] [W] [line 51]
!64 = !{!"0x101\00sum_c\0083886132\000", !52, !26, !9} ; [ DW_TAG_arg_variable ] [sum_c] [line 52]
!65 = !{!"0x101\00out\00100663349\000", !52, !26, !58} ; [ DW_TAG_arg_variable ] [out] [line 53]
!66 = !{!"0x100\00iter\0055\000", !52, !26, !6}   ; [ DW_TAG_auto_variable ] [iter] [line 55]
!67 = !{!"0x100\00i\0055\000", !52, !26, !6}      ; [ DW_TAG_auto_variable ] [i] [line 55]
!68 = !{!"0x100\00j\0055\000", !52, !26, !6}      ; [ DW_TAG_auto_variable ] [j] [line 55]
!69 = !{!"0x100\00k\0055\000", !52, !26, !6}      ; [ DW_TAG_auto_variable ] [k] [line 55]
!70 = !{!"0x100\00out_l\0057\000", !52, !26, !6}  ; [ DW_TAG_auto_variable ] [out_l] [line 57]
!71 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !72, null, void ([50 x i32]*, [50 x i32]*)* @init_array, null, null, !74} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{null, !6, !55, !55}
!74 = !{!75, !76, !77, !78, !79}
!75 = !{!"0x101\00length\0016777239\000", !71, !26, !6} ; [ DW_TAG_arg_variable ] [length] [line 23]
!76 = !{!"0x101\00c\0033554456\000", !71, !26, !55} ; [ DW_TAG_arg_variable ] [c] [line 24]
!77 = !{!"0x101\00W\0050331673\000", !71, !26, !55} ; [ DW_TAG_arg_variable ] [W] [line 25]
!78 = !{!"0x100\00i\0027\000", !71, !26, !6}      ; [ DW_TAG_auto_variable ] [i] [line 27]
!79 = !{!"0x100\00j\0027\000", !71, !26, !6}      ; [ DW_TAG_auto_variable ] [j] [line 27]
!80 = !{i32 2, !"Dwarf Version", i32 4}
!81 = !{i32 2, !"Debug Info Version", i32 2}
!82 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!83 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!84 = !MDLocation(line: 84, column: 14, scope: !25)
!85 = !MDLocation(line: 84, column: 27, scope: !25)
!86 = !MDLocation(line: 87, column: 7, scope: !25)
!87 = !MDLocation(line: 88, column: 7, scope: !25)
!88 = !MDLocation(line: 92, column: 3, scope: !25)
!89 = !MDLocation(line: 93, column: 3, scope: !25)
!90 = !MDLocation(line: 94, column: 3, scope: !25)
!91 = !MDLocation(line: 97, column: 23, scope: !25)
!92 = !MDLocation(line: 97, column: 43, scope: !25)
!93 = !MDLocation(line: 97, column: 3, scope: !25)
!94 = !MDLocation(line: 106, column: 5, scope: !25)
!95 = !MDLocation(line: 91, column: 13, scope: !25)
!96 = !MDLocation(line: 103, column: 3, scope: !25)
!97 = !MDLocation(line: 115, column: 3, scope: !42)
!98 = !MDLocation(line: 115, column: 3, scope: !25)
!99 = !MDLocation(line: 115, column: 3, scope: !41)
!100 = !MDLocation(line: 115, column: 3, scope: !45)
!101 = !MDLocation(line: 115, column: 3, scope: !102)
!102 = !{!"0xb\004", !1, !45}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!103 = !{!104, !104, i64 0}
!104 = !{!"any pointer", !105, i64 0}
!105 = !{!"omnipotent char", !106, i64 0}
!106 = !{!"Simple C/C++ TBAA"}
!107 = !{!105, !105, i64 0}
!108 = !MDLocation(line: 115, column: 3, scope: !109)
!109 = !{!"0xb\0023", !1, !42}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!110 = !{!111, !111, i64 0}
!111 = !{!"int", !105, i64 0}
!112 = !MDLocation(line: 118, column: 3, scope: !25)
!113 = !MDLocation(line: 119, column: 3, scope: !25)
!114 = !MDLocation(line: 120, column: 3, scope: !25)
!115 = !MDLocation(line: 122, column: 3, scope: !25)
!116 = !MDLocation(line: 23, column: 21, scope: !71)
!117 = !MDLocation(line: 27, column: 7, scope: !71)
!118 = !MDLocation(line: 28, column: 3, scope: !119)
!119 = !{!"0xb\0028\003\0023", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!120 = !MDLocation(line: 29, column: 5, scope: !121)
!121 = !{!"0xb\0029\005\0025", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!122 = !{!"0xb\0028\003\0024", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!123 = !MDLocation(line: 30, column: 17, scope: !124)
!124 = !{!"0xb\0029\0034\0027", !1, !125}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!125 = !{!"0xb\0029\005\0026", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!126 = !MDLocation(line: 30, column: 7, scope: !124)
!127 = !MDLocation(line: 31, column: 18, scope: !124)
!128 = !MDLocation(line: 31, column: 17, scope: !124)
!129 = !MDLocation(line: 31, column: 7, scope: !124)
!130 = !MDLocation(line: 33, column: 1, scope: !71)
!131 = !MDLocation(line: 49, column: 25, scope: !52)
!132 = !MDLocation(line: 49, column: 37, scope: !52)
!133 = !MDLocation(line: 57, column: 13, scope: !52)
!134 = !MDLocation(line: 55, column: 7, scope: !52)
!135 = !MDLocation(line: 76, column: 16, scope: !136)
!136 = !{!"0xb\0061\005\0010", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!137 = !{!"0xb\0060\003\009", !1, !138}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!138 = !{!"0xb\0060\003\008", !1, !52}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!139 = !MDLocation(line: 60, column: 3, scope: !138)
!140 = !MDLocation(line: 64, column: 4, scope: !141)
!141 = !{!"0xb\0063\002\0014", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!142 = !{!"0xb\0063\002\0013", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!143 = !{!"0xb\0062\007\0012", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!144 = !{!"0xb\0062\007\0011", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!145 = !MDLocation(line: 66, column: 7, scope: !146)
!146 = !{!"0xb\0066\007\0015", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!147 = !MDLocation(line: 55, column: 16, scope: !52)
!148 = !MDLocation(line: 68, column: 4, scope: !149)
!149 = !{!"0xb\0068\004\0018", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!150 = !{!"0xb\0067\002\0017", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!151 = !{!"0xb\0066\007\0016", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!152 = !MDLocation(line: 70, column: 8, scope: !153)
!153 = !{!"0xb\0069\006\0020", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!154 = !{!"0xb\0068\004\0019", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!155 = !MDLocation(line: 55, column: 19, scope: !52)
!156 = !MDLocation(line: 71, column: 29, scope: !157)
!157 = !{!"0xb\0071\008\0022", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!158 = !{!"0xb\0071\008\0021", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/dynprog/dynprog.c]
!159 = !MDLocation(line: 71, column: 24, scope: !157)
!160 = !MDLocation(line: 71, column: 8, scope: !158)
!161 = !MDLocation(line: 72, column: 32, scope: !157)
!162 = !MDLocation(line: 72, column: 20, scope: !157)
!163 = !MDLocation(line: 72, column: 41, scope: !157)
!164 = !MDLocation(line: 72, column: 51, scope: !157)
!165 = !MDLocation(line: 72, column: 3, scope: !157)
!166 = !MDLocation(line: 73, column: 18, scope: !153)
!167 = !MDLocation(line: 73, column: 37, scope: !153)
!168 = !MDLocation(line: 73, column: 8, scope: !153)
!169 = !MDLocation(line: 76, column: 7, scope: !136)
!170 = !MDLocation(line: 60, column: 33, scope: !137)
!171 = !MDLocation(line: 80, column: 3, scope: !52)
!172 = !MDLocation(line: 81, column: 1, scope: !52)
!173 = !MDLocation(line: 39, column: 28, scope: !47)
!174 = !MDLocation(line: 41, column: 12, scope: !47)
!175 = !MDLocation(line: 41, column: 3, scope: !47)
!176 = !MDLocation(line: 42, column: 12, scope: !47)
!177 = !MDLocation(line: 42, column: 3, scope: !47)
!178 = !MDLocation(line: 43, column: 1, scope: !47)
