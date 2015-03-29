; ModuleID = 'seidel-2d.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !72), !dbg !73
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !72), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !32, metadata !72), !dbg !75
  tail call void @llvm.dbg.value(metadata i32 20, i64 0, metadata !33, metadata !72), !dbg !76
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !77
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !78
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !79, metadata !72), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !82, metadata !72), !dbg !83
  br label %for.cond1.preheader.i, !dbg !84

for.cond1.preheader.i:                            ; preds = %for.inc9.i, %entry
  %indvars.iv4.i = phi i64 [ 0, %entry ], [ %indvars.iv.next5.i, %for.inc9.i ], !dbg !80
  %0 = trunc i64 %indvars.iv4.i to i32, !dbg !86
  %conv.i = sitofp i32 %0 to double, !dbg !86
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next, %vector.body ], !dbg !80
  %induction7374 = or i64 %index, 1, !dbg !80
  %1 = add nuw nsw i64 %index, 2, !dbg !90
  %2 = add nuw nsw i64 %induction7374, 2, !dbg !90
  %3 = trunc i64 %1 to i32, !dbg !91
  %4 = trunc i64 %2 to i32, !dbg !91
  %5 = sitofp i32 %3 to double, !dbg !91
  %6 = sitofp i32 %4 to double, !dbg !91
  %7 = fmul double %conv.i, %5, !dbg !86
  %8 = fmul double %conv.i, %6, !dbg !86
  %9 = fadd double %7, 2.000000e+00, !dbg !86
  %10 = fadd double %8, 2.000000e+00, !dbg !86
  %11 = fdiv double %9, 1.000000e+03, !dbg !92
  %12 = fdiv double %10, 1.000000e+03, !dbg !92
  %13 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %index, !dbg !93
  %14 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %induction7374, !dbg !93
  store double %11, double* %13, align 8, !dbg !93, !tbaa !94
  store double %12, double* %14, align 8, !dbg !93, !tbaa !94
  %index.next = add i64 %index, 2, !dbg !80
  %15 = icmp eq i64 %index.next, 1000, !dbg !80
  br i1 %15, label %for.inc9.i, label %vector.body, !dbg !80, !llvm.loop !98

for.inc9.i:                                       ; preds = %vector.body
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !84
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 1000, !dbg !84
  br i1 %exitcond6.i, label %for.cond1.preheader.i68.preheader, label %for.cond1.preheader.i, !dbg !84

for.cond1.preheader.i68.preheader:                ; preds = %for.inc9.i
  br label %for.cond1.preheader.i68, !dbg !101

for.cond1.preheader.i68:                          ; preds = %for.cond1.preheader.i68.preheader, %for.inc69.i
  %t.03.i = phi i32 [ %inc70.i, %for.inc69.i ], [ 0, %for.cond1.preheader.i68.preheader ], !dbg !105
  br label %for.cond5.preheader.i, !dbg !101

for.cond5.preheader.i:                            ; preds = %for.inc66.i, %for.cond1.preheader.i68
  %indvars.iv5.i = phi i64 [ 1, %for.cond1.preheader.i68 ], [ %indvars.iv.next6.i, %for.inc66.i ], !dbg !105
  %16 = add nsw i64 %indvars.iv5.i, -1, !dbg !106
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !101
  %arrayidx12.phi.trans.insert.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %16, i64 0, !dbg !105
  %.pre.i = load double* %arrayidx12.phi.trans.insert.i, align 8, !dbg !110, !tbaa !94
  %arrayidx17.phi.trans.insert.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %16, i64 1, !dbg !105
  %.pre10.i = load double* %arrayidx17.phi.trans.insert.i, align 8, !dbg !111, !tbaa !94
  %arrayidx29.phi.trans.insert.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv5.i, i64 0, !dbg !105
  %.pre11.i = load double* %arrayidx29.phi.trans.insert.i, align 8, !dbg !112, !tbaa !94
  %arrayidx34.phi.trans.insert.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv5.i, i64 1, !dbg !105
  %.pre12.i = load double* %arrayidx34.phi.trans.insert.i, align 8, !dbg !113, !tbaa !94
  %arrayidx47.phi.trans.insert.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next6.i, i64 0, !dbg !105
  %.pre13.i = load double* %arrayidx47.phi.trans.insert.i, align 8, !dbg !114, !tbaa !94
  %arrayidx53.phi.trans.insert.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next6.i, i64 1, !dbg !105
  %.pre14.i = load double* %arrayidx53.phi.trans.insert.i, align 8, !dbg !115, !tbaa !94
  br label %for.body8.i, !dbg !116

for.body8.i:                                      ; preds = %for.body8.i, %for.cond5.preheader.i
  %17 = phi double [ %.pre14.i, %for.cond5.preheader.i ], [ %25, %for.body8.i ], !dbg !117
  %18 = phi double [ %.pre13.i, %for.cond5.preheader.i ], [ %17, %for.body8.i ], !dbg !117
  %19 = phi double [ %.pre12.i, %for.cond5.preheader.i ], [ %24, %for.body8.i ], !dbg !117
  %20 = phi double [ %.pre11.i, %for.cond5.preheader.i ], [ %div.i71, %for.body8.i ], !dbg !117
  %21 = phi double [ %.pre10.i, %for.cond5.preheader.i ], [ %23, %for.body8.i ], !dbg !117
  %22 = phi double [ %.pre.i, %for.cond5.preheader.i ], [ %21, %for.body8.i ], !dbg !117
  %indvars.iv.i69 = phi i64 [ 1, %for.cond5.preheader.i ], [ %indvars.iv.next.i70, %for.body8.i ], !dbg !105
  %add.i = fadd double %21, %22, !dbg !110
  %indvars.iv.next.i70 = add nuw nsw i64 %indvars.iv.i69, 1, !dbg !116
  %arrayidx23.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %16, i64 %indvars.iv.next.i70, !dbg !118
  %23 = load double* %arrayidx23.i, align 8, !dbg !118, !tbaa !94
  %add24.i = fadd double %add.i, %23, !dbg !110
  %add30.i = fadd double %20, %add24.i, !dbg !110
  %arrayidx34.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %indvars.iv.i69, !dbg !113
  %add35.i = fadd double %19, %add30.i, !dbg !110
  %arrayidx40.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %indvars.iv.next.i70, !dbg !119
  %24 = load double* %arrayidx40.i, align 8, !dbg !119, !tbaa !94
  %add41.i = fadd double %24, %add35.i, !dbg !110
  %add48.i = fadd double %18, %add41.i, !dbg !110
  %add54.i = fadd double %17, %add48.i, !dbg !110
  %arrayidx60.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next6.i, i64 %indvars.iv.next.i70, !dbg !120
  %25 = load double* %arrayidx60.i, align 8, !dbg !120, !tbaa !94
  %add61.i = fadd double %25, %add54.i, !dbg !110
  %div.i71 = fdiv double %add61.i, 9.000000e+00, !dbg !121
  store double %div.i71, double* %arrayidx34.i, align 8, !dbg !122, !tbaa !94
  %exitcond.i72 = icmp eq i64 %indvars.iv.next.i70, 999, !dbg !116
  br i1 %exitcond.i72, label %for.inc66.i, label %for.body8.i, !dbg !116

for.inc66.i:                                      ; preds = %for.body8.i
  %exitcond8.i = icmp eq i64 %indvars.iv.next6.i, 999, !dbg !101
  br i1 %exitcond8.i, label %for.inc69.i, label %for.cond5.preheader.i, !dbg !101

for.inc69.i:                                      ; preds = %for.inc66.i
  %inc70.i = add nuw nsw i32 %t.03.i, 1, !dbg !123
  tail call void @llvm.dbg.value(metadata i32 %inc70.i, i64 0, metadata !124, metadata !72), !dbg !125
  %exitcond9.i = icmp eq i32 %inc70.i, 20, !dbg !126
  br i1 %exitcond9.i, label %kernel_seidel_2d.exit, label %for.cond1.preheader.i68, !dbg !126

kernel_seidel_2d.exit:                            ; preds = %for.inc69.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !127
  br i1 %cmp, label %if.end38, label %if.end45, !dbg !128

if.end38:                                         ; preds = %kernel_seidel_2d.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !72), !dbg !129
  tail call void @llvm.dbg.value(metadata i8* %26, i64 0, metadata !39, metadata !72), !dbg !130
  %26 = load i8** %argv, align 8, !dbg !131, !tbaa !133
  %27 = load i8* %26, align 1, !dbg !131, !tbaa !135
  %phitmp = icmp eq i8 %27, 0, !dbg !129
  br i1 %phitmp, label %for.cond1.preheader.i63.preheader, label %if.end45, !dbg !128

for.cond1.preheader.i63.preheader:                ; preds = %if.end38
  br label %for.cond1.preheader.i63, !dbg !136

for.cond1.preheader.i63:                          ; preds = %for.cond1.preheader.i63.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i63.preheader ], !dbg !143
  %28 = mul nsw i64 %indvars.iv7.i, 1000, !dbg !136
  br label %for.body3.i65, !dbg !145

for.body3.i65:                                    ; preds = %for.inc.i, %for.cond1.preheader.i63
  %indvars.iv.i64 = phi i64 [ 0, %for.cond1.preheader.i63 ], [ %indvars.iv.next.i66, %for.inc.i ], !dbg !143
  %29 = load %struct._IO_FILE** @stderr, align 8, !dbg !146, !tbaa !133
  %arrayidx5.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i64, !dbg !147
  %30 = load double* %arrayidx5.i, align 8, !dbg !147, !tbaa !94
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %30) #5, !dbg !148
  %31 = add nuw nsw i64 %indvars.iv.i64, %28, !dbg !136
  %32 = trunc i64 %31 to i32, !dbg !149
  %rem.i = srem i32 %32, 20, !dbg !149
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !149
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !150

if.then.i:                                        ; preds = %for.body3.i65
  %33 = load %struct._IO_FILE** @stderr, align 8, !dbg !151, !tbaa !133
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5, !dbg !153
  br label %for.inc.i, !dbg !153

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i65
  %indvars.iv.next.i66 = add nuw nsw i64 %indvars.iv.i64, 1, !dbg !145
  %exitcond.i67 = icmp eq i64 %indvars.iv.next.i66, 1000, !dbg !145
  br i1 %exitcond.i67, label %for.inc8.i, label %for.body3.i65, !dbg !145

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !154
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1000, !dbg !154
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i63, !dbg !154

print_array.exit:                                 ; preds = %for.inc8.i
  %34 = load %struct._IO_FILE** @stderr, align 8, !dbg !155, !tbaa !133
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #5, !dbg !156
  br label %if.end45, !dbg !143

if.end45:                                         ; preds = %if.end38, %print_array.exit, %kernel_seidel_2d.exit
  tail call void @free(i8* %call) #4, !dbg !157
  ret i32 0, !dbg !158
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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

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
!42 = !{!"0x2e\00print_array\00print_array\00\0037\001\001\000\000\00256\001\0040", !1, !23, !43, null, null, null, null, !48} ; [ DW_TAG_subprogram ] [line 37] [local] [def] [scope 40] [print_array]
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
!53 = !{!"0x2e\00kernel_seidel_2d\00kernel_seidel_2d\00\0055\001\001\000\000\00256\001\0058", !1, !23, !54, null, null, null, null, !56} ; [ DW_TAG_subprogram ] [line 55] [local] [def] [scope 58] [kernel_seidel_2d]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{null, !26, !26, !45}
!56 = !{!57, !58, !59, !60, !61, !62}
!57 = !{!"0x101\00tsteps\0016777271\000", !53, !23, !26} ; [ DW_TAG_arg_variable ] [tsteps] [line 55]
!58 = !{!"0x101\00n\0033554488\000", !53, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 56]
!59 = !{!"0x101\00A\0050331705\000", !53, !23, !45} ; [ DW_TAG_arg_variable ] [A] [line 57]
!60 = !{!"0x100\00t\0059\000", !53, !23, !26}     ; [ DW_TAG_auto_variable ] [t] [line 59]
!61 = !{!"0x100\00i\0059\000", !53, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 59]
!62 = !{!"0x100\00j\0059\000", !53, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 59]
!63 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0025", !1, !23, !43, null, null, null, null, !64} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 25] [init_array]
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
!79 = !{!"0x101\00n\0016777239\000", !63, !23, !26, !80} ; [ DW_TAG_arg_variable ] [n] [line 23]
!80 = !MDLocation(line: 84, column: 3, scope: !22)
!81 = !MDLocation(line: 23, column: 22, scope: !63, inlinedAt: !80)
!82 = !{!"0x100\00i\0026\000", !63, !23, !26, !80} ; [ DW_TAG_auto_variable ] [i] [line 26]
!83 = !MDLocation(line: 26, column: 7, scope: !63, inlinedAt: !80)
!84 = !MDLocation(line: 28, column: 3, scope: !85, inlinedAt: !80)
!85 = !{!"0xb\0028\003\0020", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!86 = !MDLocation(line: 30, column: 18, scope: !87, inlinedAt: !80)
!87 = !{!"0xb\0029\005\0023", !1, !88}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!88 = !{!"0xb\0029\005\0022", !1, !89}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!89 = !{!"0xb\0028\003\0021", !1, !85}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!90 = !MDLocation(line: 30, column: 33, scope: !87, inlinedAt: !80)
!91 = !MDLocation(line: 30, column: 32, scope: !87, inlinedAt: !80)
!92 = !MDLocation(line: 30, column: 17, scope: !87, inlinedAt: !80)
!93 = !MDLocation(line: 30, column: 7, scope: !87, inlinedAt: !80)
!94 = !{!95, !95, i64 0}
!95 = !{!"double", !96, i64 0}
!96 = !{!"omnipotent char", !97, i64 0}
!97 = !{!"Simple C/C++ TBAA"}
!98 = distinct !{!98, !99, !100}
!99 = !{!"llvm.loop.vectorize.width", i32 1}
!100 = !{!"llvm.loop.interleave.count", i32 1}
!101 = !MDLocation(line: 63, column: 5, scope: !102, inlinedAt: !105)
!102 = !{!"0xb\0063\005\0016", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!103 = !{!"0xb\0062\003\0015", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!104 = !{!"0xb\0062\003\0014", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!105 = !MDLocation(line: 90, column: 3, scope: !22)
!106 = !MDLocation(line: 65, column: 15, scope: !107, inlinedAt: !105)
!107 = !{!"0xb\0064\007\0019", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!108 = !{!"0xb\0064\007\0018", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!109 = !{!"0xb\0063\005\0017", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!110 = !MDLocation(line: 65, column: 13, scope: !107, inlinedAt: !105)
!111 = !MDLocation(line: 65, column: 27, scope: !107, inlinedAt: !105)
!112 = !MDLocation(line: 66, column: 8, scope: !107, inlinedAt: !105)
!113 = !MDLocation(line: 66, column: 20, scope: !107, inlinedAt: !105)
!114 = !MDLocation(line: 67, column: 8, scope: !107, inlinedAt: !105)
!115 = !MDLocation(line: 67, column: 22, scope: !107, inlinedAt: !105)
!116 = !MDLocation(line: 64, column: 7, scope: !108, inlinedAt: !105)
!117 = !MDLocation(line: 65, column: 20, scope: !107, inlinedAt: !105)
!118 = !MDLocation(line: 65, column: 39, scope: !107, inlinedAt: !105)
!119 = !MDLocation(line: 66, column: 30, scope: !107, inlinedAt: !105)
!120 = !MDLocation(line: 67, column: 34, scope: !107, inlinedAt: !105)
!121 = !MDLocation(line: 65, column: 12, scope: !107, inlinedAt: !105)
!122 = !MDLocation(line: 65, column: 2, scope: !107, inlinedAt: !105)
!123 = !MDLocation(line: 62, column: 32, scope: !103, inlinedAt: !105)
!124 = !{!"0x100\00t\0059\000", !53, !23, !26, !105} ; [ DW_TAG_auto_variable ] [t] [line 59]
!125 = !MDLocation(line: 59, column: 7, scope: !53, inlinedAt: !105)
!126 = !MDLocation(line: 62, column: 3, scope: !104, inlinedAt: !105)
!127 = !MDLocation(line: 98, column: 3, scope: !37)
!128 = !MDLocation(line: 98, column: 3, scope: !22)
!129 = !MDLocation(line: 98, column: 3, scope: !36)
!130 = !MDLocation(line: 98, column: 3, scope: !40)
!131 = !MDLocation(line: 98, column: 3, scope: !132)
!132 = !{!"0xb\004", !1, !40}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!133 = !{!134, !134, i64 0}
!134 = !{!"any pointer", !96, i64 0}
!135 = !{!96, !96, i64 0}
!136 = !MDLocation(line: 46, column: 12, scope: !137, inlinedAt: !143)
!137 = !{!"0xb\0046\0011\0013", !1, !138}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!138 = !{!"0xb\0044\0029\0012", !1, !139}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!139 = !{!"0xb\0044\005\0011", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!140 = !{!"0xb\0044\005\0010", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!141 = !{!"0xb\0043\003\009", !1, !142}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!142 = !{!"0xb\0043\003\008", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!143 = !MDLocation(line: 98, column: 3, scope: !144)
!144 = !{!"0xb\0023", !1, !37}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!145 = !MDLocation(line: 44, column: 5, scope: !140, inlinedAt: !143)
!146 = !MDLocation(line: 45, column: 15, scope: !138, inlinedAt: !143)
!147 = !MDLocation(line: 45, column: 45, scope: !138, inlinedAt: !143)
!148 = !MDLocation(line: 45, column: 7, scope: !138, inlinedAt: !143)
!149 = !MDLocation(line: 46, column: 11, scope: !137, inlinedAt: !143)
!150 = !MDLocation(line: 46, column: 11, scope: !138, inlinedAt: !143)
!151 = !MDLocation(line: 46, column: 42, scope: !152, inlinedAt: !143)
!152 = !{!"0xb\001", !1, !137}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/seidel-2d/seidel-2d.c]
!153 = !MDLocation(line: 46, column: 34, scope: !137, inlinedAt: !143)
!154 = !MDLocation(line: 43, column: 3, scope: !142, inlinedAt: !143)
!155 = !MDLocation(line: 48, column: 11, scope: !42, inlinedAt: !143)
!156 = !MDLocation(line: 48, column: 3, scope: !42, inlinedAt: !143)
!157 = !MDLocation(line: 101, column: 3, scope: !22)
!158 = !MDLocation(line: 103, column: 3, scope: !22)
