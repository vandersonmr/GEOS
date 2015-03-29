; ModuleID = 'floyd-warshall.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !68), !dbg !69
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !68), !dbg !70
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !68), !dbg !71
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !72
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !74, metadata !68), !dbg !76
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !77, metadata !68), !dbg !78
  br label %for.cond1.preheader.i, !dbg !79

for.cond1.preheader.i:                            ; preds = %middle.block, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %middle.block ], !dbg !75
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !79
  %0 = trunc i64 %indvars.iv.next4.i to i32, !dbg !81
  %conv.i = sitofp i32 %0 to double, !dbg !81
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next, %vector.body ], !dbg !75
  %induction7576 = or i64 %index, 1, !dbg !75
  %1 = or i64 %index, 1, !dbg !85
  %2 = add nuw nsw i64 %induction7576, 1, !dbg !85
  %3 = trunc i64 %1 to i32, !dbg !86
  %4 = trunc i64 %2 to i32, !dbg !86
  %5 = sitofp i32 %3 to double, !dbg !86
  %6 = sitofp i32 %4 to double, !dbg !86
  %7 = fmul double %conv.i, %5, !dbg !81
  %8 = fmul double %conv.i, %6, !dbg !81
  %9 = fmul double %7, 9.765625e-04, !dbg !87
  %10 = fmul double %8, 9.765625e-04, !dbg !87
  %11 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !88
  %12 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction7576, !dbg !88
  store double %9, double* %11, align 8, !dbg !88, !tbaa !89
  store double %10, double* %12, align 8, !dbg !88, !tbaa !89
  %index.next = add i64 %index, 2, !dbg !75
  %13 = icmp eq i64 %index.next, 1024, !dbg !75
  br i1 %13, label %middle.block, label %vector.body, !dbg !75, !llvm.loop !93

middle.block:                                     ; preds = %vector.body
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1024, !dbg !79
  br i1 %exitcond5.i, label %for.cond1.preheader.i69.preheader, label %for.cond1.preheader.i, !dbg !79

for.cond1.preheader.i69.preheader:                ; preds = %middle.block
  br label %for.cond1.preheader.i69, !dbg !96

for.cond1.preheader.i69:                          ; preds = %for.cond1.preheader.i69.preheader, %for.inc38.i
  %indvars.iv7.i68 = phi i64 [ %indvars.iv.next8.i74, %for.inc38.i ], [ 0, %for.cond1.preheader.i69.preheader ], !dbg !101
  br label %for.cond4.preheader.i, !dbg !96

for.cond4.preheader.i:                            ; preds = %for.inc35.i, %for.cond1.preheader.i69
  %indvars.iv4.i = phi i64 [ 0, %for.cond1.preheader.i69 ], [ %indvars.iv.next5.i, %for.inc35.i ], !dbg !101
  %arrayidx12.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv7.i68, !dbg !102
  br label %for.body6.i, !dbg !106

for.body6.i:                                      ; preds = %for.body6.i, %for.cond4.preheader.i
  %indvars.iv.i70 = phi i64 [ 0, %for.cond4.preheader.i ], [ %indvars.iv.next.i72.1, %for.body6.i ], !dbg !101
  %arrayidx8.i71 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv.i70, !dbg !107
  %14 = load double* %arrayidx8.i71, align 8, !dbg !107, !tbaa !89
  %15 = load double* %arrayidx12.i, align 8, !dbg !102, !tbaa !89
  %arrayidx16.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i68, i64 %indvars.iv.i70, !dbg !108
  %16 = load double* %arrayidx16.i, align 8, !dbg !108, !tbaa !89
  %add.i = fadd double %15, %16, !dbg !102
  %cmp17.i = fcmp olt double %14, %add.i, !dbg !107
  %.add.i = select i1 %cmp17.i, double %14, double %add.i, !dbg !107
  store double %.add.i, double* %arrayidx8.i71, align 8, !dbg !109, !tbaa !89
  %indvars.iv.next.i72 = add nuw nsw i64 %indvars.iv.i70, 1, !dbg !106
  %arrayidx8.i71.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv.next.i72, !dbg !107
  %17 = load double* %arrayidx8.i71.1, align 8, !dbg !107, !tbaa !89
  %18 = load double* %arrayidx12.i, align 8, !dbg !102, !tbaa !89
  %arrayidx16.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i68, i64 %indvars.iv.next.i72, !dbg !108
  %19 = load double* %arrayidx16.i.1, align 8, !dbg !108, !tbaa !89
  %add.i.1 = fadd double %18, %19, !dbg !102
  %cmp17.i.1 = fcmp olt double %17, %add.i.1, !dbg !107
  %.add.i.1 = select i1 %cmp17.i.1, double %17, double %add.i.1, !dbg !107
  store double %.add.i.1, double* %arrayidx8.i71.1, align 8, !dbg !109, !tbaa !89
  %indvars.iv.next.i72.1 = add nuw nsw i64 %indvars.iv.next.i72, 1, !dbg !106
  %exitcond.i73.1 = icmp eq i64 %indvars.iv.next.i72.1, 1024, !dbg !106
  br i1 %exitcond.i73.1, label %for.inc35.i, label %for.body6.i, !dbg !106

for.inc35.i:                                      ; preds = %for.body6.i
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !96
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 1024, !dbg !96
  br i1 %exitcond6.i, label %for.inc38.i, label %for.cond4.preheader.i, !dbg !96

for.inc38.i:                                      ; preds = %for.inc35.i
  %indvars.iv.next8.i74 = add nuw nsw i64 %indvars.iv7.i68, 1, !dbg !110
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i74, 1024, !dbg !110
  br i1 %exitcond9.i, label %kernel_floyd_warshall.exit, label %for.cond1.preheader.i69, !dbg !110

kernel_floyd_warshall.exit:                       ; preds = %for.inc38.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !111
  br i1 %cmp, label %if.end38, label %if.end45, !dbg !112

if.end38:                                         ; preds = %kernel_floyd_warshall.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !68), !dbg !113
  tail call void @llvm.dbg.value(metadata i8* %20, i64 0, metadata !38, metadata !68), !dbg !114
  %20 = load i8** %argv, align 8, !dbg !115, !tbaa !117
  %21 = load i8* %20, align 1, !dbg !115, !tbaa !119
  %phitmp = icmp eq i8 %21, 0, !dbg !113
  br i1 %phitmp, label %for.cond1.preheader.i63.preheader, label %if.end45, !dbg !112

for.cond1.preheader.i63.preheader:                ; preds = %if.end38
  br label %for.cond1.preheader.i63, !dbg !120

for.cond1.preheader.i63:                          ; preds = %for.cond1.preheader.i63.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i63.preheader ], !dbg !127
  %22 = shl i64 %indvars.iv7.i, 10, !dbg !120
  br label %for.body3.i65, !dbg !129

for.body3.i65:                                    ; preds = %for.inc.i, %for.cond1.preheader.i63
  %indvars.iv.i64 = phi i64 [ 0, %for.cond1.preheader.i63 ], [ %indvars.iv.next.i66, %for.inc.i ], !dbg !127
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !130, !tbaa !117
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i64, !dbg !131
  %24 = load double* %arrayidx5.i, align 8, !dbg !131, !tbaa !89
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %24) #5, !dbg !132
  %25 = add nuw nsw i64 %indvars.iv.i64, %22, !dbg !120
  %26 = trunc i64 %25 to i32, !dbg !133
  %rem.i = srem i32 %26, 20, !dbg !133
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !133
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !134

if.then.i:                                        ; preds = %for.body3.i65
  %27 = load %struct._IO_FILE** @stderr, align 8, !dbg !135, !tbaa !117
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5, !dbg !137
  br label %for.inc.i, !dbg !137

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i65
  %indvars.iv.next.i66 = add nuw nsw i64 %indvars.iv.i64, 1, !dbg !129
  %exitcond.i67 = icmp eq i64 %indvars.iv.next.i66, 1024, !dbg !129
  br i1 %exitcond.i67, label %for.inc8.i, label %for.body3.i65, !dbg !129

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !138
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !138
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i63, !dbg !138

print_array.exit:                                 ; preds = %for.inc8.i
  %28 = load %struct._IO_FILE** @stderr, align 8, !dbg !139, !tbaa !117
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #5, !dbg !140
  br label %if.end45, !dbg !127

if.end45:                                         ; preds = %if.end38, %print_array.exit, %kernel_floyd_warshall.exit
  tail call void @free(i8* %call) #4, !dbg !141
  ret i32 0, !dbg !142
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
!llvm.module.flags = !{!65, !66}
!llvm.ident = !{!67}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c] [DW_LANG_C99]
!1 = !{!"floyd-warshall.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall"}
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
!22 = !{!"0x2e\00main\00main\00\0073\000\001\000\000\00256\001\0074", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !37, !38, !40}
!30 = !{!"0x101\00argc\0016777289\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 73]
!31 = !{!"0x101\00argv\0033554505\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 73]
!32 = !{!"0x100\00n\0076\000", !22, !23, !26}     ; [ DW_TAG_auto_variable ] [n] [line 76]
!33 = !{!"0x100\00path\0079\000", !22, !23, !4}   ; [ DW_TAG_auto_variable ] [path] [line 79]
!34 = !{!"0x100\00__s1_len\0097\000", !35, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 97]
!35 = !{!"0xb\0097\003\001", !1, !36}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!36 = !{!"0xb\0097\003\000", !1, !22}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!37 = !{!"0x100\00__s2_len\0097\000", !35, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 97]
!38 = !{!"0x100\00__s2\0097\000", !39, !23, !14}  ; [ DW_TAG_auto_variable ] [__s2] [line 97]
!39 = !{!"0xb\0097\003\002", !1, !35}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!40 = !{!"0x100\00__result\0097\000", !39, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 97]
!41 = !{!"0x2e\00print_array\00print_array\00\0037\001\001\000\000\00256\001\0040", !1, !23, !42, null, null, null, null, !47} ; [ DW_TAG_subprogram ] [line 37] [local] [def] [scope 40] [print_array]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{null, !26, !44}
!44 = !{!"0xf\00\000\0064\0064\000\000", null, null, !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !46, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!46 = !{!8}
!47 = !{!48, !49, !50, !51}
!48 = !{!"0x101\00n\0016777253\000", !41, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 37]
!49 = !{!"0x101\00path\0033554470\000", !41, !23, !44} ; [ DW_TAG_arg_variable ] [path] [line 38]
!50 = !{!"0x100\00i\0041\000", !41, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 41]
!51 = !{!"0x100\00j\0041\000", !41, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 41]
!52 = !{!"0x2e\00kernel_floyd_warshall\00kernel_floyd_warshall\00\0055\001\001\000\000\00256\001\0057", !1, !23, !42, null, null, null, null, !53} ; [ DW_TAG_subprogram ] [line 55] [local] [def] [scope 57] [kernel_floyd_warshall]
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00n\0016777271\000", !52, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 55]
!55 = !{!"0x101\00path\0033554488\000", !52, !23, !44} ; [ DW_TAG_arg_variable ] [path] [line 56]
!56 = !{!"0x100\00i\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 58]
!57 = !{!"0x100\00j\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 58]
!58 = !{!"0x100\00k\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 58]
!59 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0025", !1, !23, !42, null, null, null, null, !60} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 25] [init_array]
!60 = !{!61, !62, !63, !64}
!61 = !{!"0x101\00n\0016777239\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!62 = !{!"0x101\00path\0033554456\000", !59, !23, !44} ; [ DW_TAG_arg_variable ] [path] [line 24]
!63 = !{!"0x100\00i\0026\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 26]
!64 = !{!"0x100\00j\0026\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 26]
!65 = !{i32 2, !"Dwarf Version", i32 4}
!66 = !{i32 2, !"Debug Info Version", i32 2}
!67 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!68 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!69 = !MDLocation(line: 73, column: 14, scope: !22)
!70 = !MDLocation(line: 73, column: 27, scope: !22)
!71 = !MDLocation(line: 76, column: 7, scope: !22)
!72 = !MDLocation(line: 79, column: 3, scope: !22)
!73 = !MDLocation(line: 83, column: 18, scope: !22)
!74 = !{!"0x101\00n\0016777239\000", !59, !23, !26, !75} ; [ DW_TAG_arg_variable ] [n] [line 23]
!75 = !MDLocation(line: 83, column: 3, scope: !22)
!76 = !MDLocation(line: 23, column: 22, scope: !59, inlinedAt: !75)
!77 = !{!"0x100\00i\0026\000", !59, !23, !26, !75} ; [ DW_TAG_auto_variable ] [i] [line 26]
!78 = !MDLocation(line: 26, column: 7, scope: !59, inlinedAt: !75)
!79 = !MDLocation(line: 28, column: 3, scope: !80, inlinedAt: !75)
!80 = !{!"0xb\0028\003\0021", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!81 = !MDLocation(line: 30, column: 21, scope: !82, inlinedAt: !75)
!82 = !{!"0xb\0029\005\0024", !1, !83}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!83 = !{!"0xb\0029\005\0023", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!84 = !{!"0xb\0028\003\0022", !1, !80}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!85 = !MDLocation(line: 29, column: 5, scope: !83, inlinedAt: !75)
!86 = !MDLocation(line: 30, column: 39, scope: !82, inlinedAt: !75)
!87 = !MDLocation(line: 30, column: 20, scope: !82, inlinedAt: !75)
!88 = !MDLocation(line: 30, column: 7, scope: !82, inlinedAt: !75)
!89 = !{!90, !90, i64 0}
!90 = !{!"double", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = distinct !{!93, !94, !95}
!94 = !{!"llvm.loop.vectorize.width", i32 1}
!95 = !{!"llvm.loop.interleave.count", i32 1}
!96 = !MDLocation(line: 63, column: 7, scope: !97, inlinedAt: !101)
!97 = !{!"0xb\0063\007\0017", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!98 = !{!"0xb\0062\005\0016", !1, !99}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!99 = !{!"0xb\0061\003\0015", !1, !100}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!100 = !{!"0xb\0061\003\0014", !1, !52}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!101 = !MDLocation(line: 89, column: 3, scope: !22)
!102 = !MDLocation(line: 65, column: 30, scope: !103, inlinedAt: !101)
!103 = !{!"0xb\0064\002\0020", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!104 = !{!"0xb\0064\002\0019", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!105 = !{!"0xb\0063\007\0018", !1, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!106 = !MDLocation(line: 64, column: 2, scope: !104, inlinedAt: !101)
!107 = !MDLocation(line: 65, column: 17, scope: !103, inlinedAt: !101)
!108 = !MDLocation(line: 65, column: 43, scope: !103, inlinedAt: !101)
!109 = !MDLocation(line: 65, column: 4, scope: !103, inlinedAt: !101)
!110 = !MDLocation(line: 61, column: 3, scope: !100, inlinedAt: !101)
!111 = !MDLocation(line: 97, column: 3, scope: !36)
!112 = !MDLocation(line: 97, column: 3, scope: !22)
!113 = !MDLocation(line: 97, column: 3, scope: !35)
!114 = !MDLocation(line: 97, column: 3, scope: !39)
!115 = !MDLocation(line: 97, column: 3, scope: !116)
!116 = !{!"0xb\004", !1, !39}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!117 = !{!118, !118, i64 0}
!118 = !{!"any pointer", !91, i64 0}
!119 = !{!91, !91, i64 0}
!120 = !MDLocation(line: 46, column: 12, scope: !121, inlinedAt: !127)
!121 = !{!"0xb\0046\0011\0013", !1, !122}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!122 = !{!"0xb\0044\0029\0012", !1, !123}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!123 = !{!"0xb\0044\005\0011", !1, !124}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!124 = !{!"0xb\0044\005\0010", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!125 = !{!"0xb\0043\003\009", !1, !126}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!126 = !{!"0xb\0043\003\008", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!127 = !MDLocation(line: 97, column: 3, scope: !128)
!128 = !{!"0xb\0023", !1, !36}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!129 = !MDLocation(line: 44, column: 5, scope: !124, inlinedAt: !127)
!130 = !MDLocation(line: 45, column: 16, scope: !122, inlinedAt: !127)
!131 = !MDLocation(line: 45, column: 46, scope: !122, inlinedAt: !127)
!132 = !MDLocation(line: 45, column: 7, scope: !122, inlinedAt: !127)
!133 = !MDLocation(line: 46, column: 11, scope: !121, inlinedAt: !127)
!134 = !MDLocation(line: 46, column: 11, scope: !122, inlinedAt: !127)
!135 = !MDLocation(line: 46, column: 43, scope: !136, inlinedAt: !127)
!136 = !{!"0xb\001", !1, !121}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!137 = !MDLocation(line: 46, column: 34, scope: !121, inlinedAt: !127)
!138 = !MDLocation(line: 43, column: 3, scope: !126, inlinedAt: !127)
!139 = !MDLocation(line: 48, column: 12, scope: !41, inlinedAt: !127)
!140 = !MDLocation(line: 48, column: 3, scope: !41, inlinedAt: !127)
!141 = !MDLocation(line: 100, column: 3, scope: !22)
!142 = !MDLocation(line: 102, column: 3, scope: !22)
