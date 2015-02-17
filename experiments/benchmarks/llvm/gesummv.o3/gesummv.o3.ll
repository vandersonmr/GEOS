; ModuleID = 'gesummv.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
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
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !99, metadata !87), !dbg !101
  tail call void @llvm.dbg.value(metadata double 4.353200e+04, i64 0, metadata !36, metadata !87), !dbg !102
  tail call void @llvm.dbg.value(metadata double 4.353200e+04, i64 0, metadata !36, metadata !87), !dbg !102
  tail call void @llvm.dbg.value(metadata double 1.231300e+04, i64 0, metadata !37, metadata !87), !dbg !103
  tail call void @llvm.dbg.value(metadata double 1.231300e+04, i64 0, metadata !37, metadata !87), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !104, metadata !87), !dbg !105
  br label %for.body.i, !dbg !106

for.body.i:                                       ; preds = %for.inc23.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc23.i ], !dbg !100
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !108
  %conv.i = sitofp i32 %0 to double, !dbg !108
  %div.i = fdiv double %conv.i, 4.000000e+03, !dbg !111
  %arrayidx.i = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv3.i, !dbg !112
  store double %div.i, double* %arrayidx.i, align 8, !dbg !112, !tbaa !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !117, metadata !87), !dbg !118
  br label %for.body5.i, !dbg !119

for.body5.i:                                      ; preds = %for.body5.i, %for.body.i
  %indvars.iv.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next.i.1, %for.body5.i ], !dbg !100
  %1 = trunc i64 %indvars.iv.i to i32, !dbg !121
  %conv7.i = sitofp i32 %1 to double, !dbg !121
  %mul.i = fmul double %conv.i, %conv7.i, !dbg !124
  %div9.i = fdiv double %mul.i, 4.000000e+03, !dbg !125
  %arrayidx13.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.i, !dbg !126
  store double %div9.i, double* %arrayidx13.i, align 8, !dbg !126, !tbaa !113
  %arrayidx22.i = getelementptr inbounds [4000 x double]* %arraydecay7, i64 %indvars.iv3.i, i64 %indvars.iv.i, !dbg !127
  store double %div9.i, double* %arrayidx22.i, align 8, !dbg !127, !tbaa !113
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !119
  %2 = trunc i64 %indvars.iv.next.i to i32, !dbg !121
  %conv7.i.1 = sitofp i32 %2 to double, !dbg !121
  %mul.i.1 = fmul double %conv.i, %conv7.i.1, !dbg !124
  %div9.i.1 = fdiv double %mul.i.1, 4.000000e+03, !dbg !125
  %arrayidx13.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.next.i, !dbg !126
  store double %div9.i.1, double* %arrayidx13.i.1, align 8, !dbg !126, !tbaa !113
  %arrayidx22.i.1 = getelementptr inbounds [4000 x double]* %arraydecay7, i64 %indvars.iv3.i, i64 %indvars.iv.next.i, !dbg !127
  store double %div9.i.1, double* %arrayidx22.i.1, align 8, !dbg !127, !tbaa !113
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !119
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4000, !dbg !119
  br i1 %exitcond.i.1, label %for.inc23.i, label %for.body5.i, !dbg !119

for.inc23.i:                                      ; preds = %for.body5.i
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !106
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 4000, !dbg !106
  br i1 %exitcond5.i, label %init_array.exit, label %for.body.i, !dbg !106

init_array.exit:                                  ; preds = %for.inc23.i
  %arraydecay11 = bitcast i8* %call2 to double*, !dbg !128
  %arraydecay13 = bitcast i8* %call6 to double*, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !130, metadata !87), !dbg !132
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !133, metadata !87), !dbg !134
  br label %for.body.i91, !dbg !135

for.body.i91:                                     ; preds = %for.end.i, %init_array.exit
  %indvars.iv3.i89 = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next4.i97, %for.end.i ], !dbg !131
  %arrayidx.i90 = getelementptr inbounds double* %arraydecay11, i64 %indvars.iv3.i89, !dbg !137
  store double 0.000000e+00, double* %arrayidx.i90, align 8, !dbg !137, !tbaa !113
  %arrayidx4.i = getelementptr inbounds double* %arraydecay13, i64 %indvars.iv3.i89, !dbg !140
  store double 0.000000e+00, double* %arrayidx4.i, align 8, !dbg !140, !tbaa !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !141, metadata !87), !dbg !142
  br label %for.body7.i, !dbg !143

for.body7.i:                                      ; preds = %for.body7.i, %for.body.i91
  %indvars.iv.i92 = phi i64 [ 0, %for.body.i91 ], [ %indvars.iv.next.i95, %for.body7.i ], !dbg !131
  %arrayidx11.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i89, i64 %indvars.iv.i92, !dbg !145
  %3 = load double* %arrayidx11.i, align 8, !dbg !145, !tbaa !113
  %arrayidx13.i93 = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv.i92, !dbg !148
  %4 = load double* %arrayidx13.i93, align 8, !dbg !148, !tbaa !113
  %mul.i94 = fmul double %3, %4, !dbg !145
  %5 = load double* %arrayidx.i90, align 8, !dbg !149, !tbaa !113
  %add.i = fadd double %mul.i94, %5, !dbg !145
  store double %add.i, double* %arrayidx.i90, align 8, !dbg !150, !tbaa !113
  %arrayidx21.i = getelementptr inbounds [4000 x double]* %arraydecay7, i64 %indvars.iv3.i89, i64 %indvars.iv.i92, !dbg !151
  %6 = load double* %arrayidx21.i, align 8, !dbg !151, !tbaa !113
  %7 = load double* %arrayidx13.i93, align 8, !dbg !152, !tbaa !113
  %mul24.i = fmul double %6, %7, !dbg !151
  %8 = load double* %arrayidx4.i, align 8, !dbg !153, !tbaa !113
  %add27.i = fadd double %mul24.i, %8, !dbg !151
  store double %add27.i, double* %arrayidx4.i, align 8, !dbg !154, !tbaa !113
  %indvars.iv.next.i95 = add nuw nsw i64 %indvars.iv.i92, 1, !dbg !143
  %exitcond.i96 = icmp eq i64 %indvars.iv.next.i95, 4000, !dbg !143
  br i1 %exitcond.i96, label %for.end.i, label %for.body7.i, !dbg !143

for.end.i:                                        ; preds = %for.body7.i
  %add27.i.lcssa = phi double [ %add27.i, %for.body7.i ]
  %9 = load double* %arrayidx.i90, align 8, !dbg !155, !tbaa !113
  %mul32.i = fmul double %9, 4.353200e+04, !dbg !156
  %mul35.i = fmul double %add27.i.lcssa, 1.231300e+04, !dbg !157
  %add36.i = fadd double %mul35.i, %mul32.i, !dbg !156
  store double %add36.i, double* %arrayidx4.i, align 8, !dbg !158, !tbaa !113
  %indvars.iv.next4.i97 = add nuw nsw i64 %indvars.iv3.i89, 1, !dbg !135
  %exitcond5.i98 = icmp eq i64 %indvars.iv.next4.i97, 4000, !dbg !135
  br i1 %exitcond5.i98, label %kernel_gesummv.exit, label %for.body.i91, !dbg !135

kernel_gesummv.exit:                              ; preds = %for.end.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !159
  br i1 %cmp, label %if.end53, label %if.end60, !dbg !160

if.end53:                                         ; preds = %kernel_gesummv.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !87), !dbg !161
  tail call void @llvm.dbg.value(metadata i8* %10, i64 0, metadata !47, metadata !87), !dbg !162
  %10 = load i8** %argv, align 8, !dbg !163, !tbaa !165
  %11 = load i8* %10, align 1, !dbg !163, !tbaa !167
  %phitmp = icmp eq i8 %11, 0, !dbg !161
  br i1 %phitmp, label %for.body.i86.preheader, label %if.end60, !dbg !160

for.body.i86.preheader:                           ; preds = %if.end53
  br label %for.body.i86, !dbg !168

for.body.i86:                                     ; preds = %for.body.i86.preheader, %for.inc.i
  %indvars.iv.i84 = phi i64 [ %indvars.iv.next.i87, %for.inc.i ], [ 0, %for.body.i86.preheader ], !dbg !172
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !168, !tbaa !165
  %arrayidx.i85 = getelementptr inbounds double* %arraydecay13, i64 %indvars.iv.i84, !dbg !174
  %13 = load double* %arrayidx.i85, align 8, !dbg !174, !tbaa !113
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %13) #5, !dbg !175
  %14 = trunc i64 %indvars.iv.i84 to i32, !dbg !176
  %rem.i = srem i32 %14, 20, !dbg !176
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !176
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !178

if.then.i:                                        ; preds = %for.body.i86
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !179, !tbaa !165
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5, !dbg !181
  br label %for.inc.i, !dbg !181

for.inc.i:                                        ; preds = %if.then.i, %for.body.i86
  %indvars.iv.next.i87 = add nuw nsw i64 %indvars.iv.i84, 1, !dbg !182
  %exitcond.i88 = icmp eq i64 %indvars.iv.next.i87, 4000, !dbg !182
  br i1 %exitcond.i88, label %if.end60.loopexit, label %for.body.i86, !dbg !182

if.end60.loopexit:                                ; preds = %for.inc.i
  br label %if.end60

if.end60:                                         ; preds = %if.end60.loopexit, %if.end53, %kernel_gesummv.exit
  tail call void @free(i8* %call) #4, !dbg !183
  tail call void @free(i8* %call1) #4, !dbg !184
  tail call void @free(i8* %call2) #4, !dbg !185
  tail call void @free(i8* %call4) #4, !dbg !186
  tail call void @free(i8* %call6) #4, !dbg !187
  ret i32 0, !dbg !188
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
!50 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0051", !1, !26, !51, null, null, null, null, !54} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 51] [print_array]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{null, !29, !53}
!53 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!54 = !{!55, !56, !57}
!55 = !{!"0x101\00n\0016777264\000", !50, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 48]
!56 = !{!"0x101\00y\0033554481\000", !50, !26, !53} ; [ DW_TAG_arg_variable ] [y] [line 49]
!57 = !{!"0x100\00i\0052\000", !50, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!58 = !{!"0x2e\00kernel_gesummv\00kernel_gesummv\00\0064\001\001\000\000\00256\001\0072", !1, !26, !59, null, null, null, null, !61} ; [ DW_TAG_subprogram ] [line 64] [local] [def] [scope 72] [kernel_gesummv]
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
!72 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !73, null, null, null, null, !75} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
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
!99 = !{!"0x101\00n\0016777239\000", !72, !26, !29, !100} ; [ DW_TAG_arg_variable ] [n] [line 23]
!100 = !MDLocation(line: 108, column: 3, scope: !25)
!101 = !MDLocation(line: 23, column: 21, scope: !72, inlinedAt: !100)
!102 = !MDLocation(line: 98, column: 13, scope: !25)
!103 = !MDLocation(line: 99, column: 13, scope: !25)
!104 = !{!"0x100\00i\0030\000", !72, !26, !29, !100} ; [ DW_TAG_auto_variable ] [i] [line 30]
!105 = !MDLocation(line: 30, column: 7, scope: !72, inlinedAt: !100)
!106 = !MDLocation(line: 34, column: 3, scope: !107, inlinedAt: !100)
!107 = !{!"0xb\0034\003\0018", !1, !72}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!108 = !MDLocation(line: 36, column: 15, scope: !109, inlinedAt: !100)
!109 = !{!"0xb\0035\005\0020", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!110 = !{!"0xb\0034\003\0019", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!111 = !MDLocation(line: 36, column: 14, scope: !109, inlinedAt: !100)
!112 = !MDLocation(line: 36, column: 7, scope: !109, inlinedAt: !100)
!113 = !{!114, !114, i64 0}
!114 = !{!"double", !115, i64 0}
!115 = !{!"omnipotent char", !116, i64 0}
!116 = !{!"Simple C/C++ TBAA"}
!117 = !{!"0x100\00j\0030\000", !72, !26, !29, !100} ; [ DW_TAG_auto_variable ] [j] [line 30]
!118 = !MDLocation(line: 30, column: 10, scope: !72, inlinedAt: !100)
!119 = !MDLocation(line: 37, column: 7, scope: !120, inlinedAt: !100)
!120 = !{!"0xb\0037\007\0021", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!121 = !MDLocation(line: 38, column: 27, scope: !122, inlinedAt: !100)
!122 = !{!"0xb\0037\0031\0023", !1, !123}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!123 = !{!"0xb\0037\007\0022", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!124 = !MDLocation(line: 38, column: 13, scope: !122, inlinedAt: !100)
!125 = !MDLocation(line: 38, column: 12, scope: !122, inlinedAt: !100)
!126 = !MDLocation(line: 38, column: 2, scope: !122, inlinedAt: !100)
!127 = !MDLocation(line: 39, column: 2, scope: !122, inlinedAt: !100)
!128 = !MDLocation(line: 120, column: 5, scope: !25)
!129 = !MDLocation(line: 122, column: 5, scope: !25)
!130 = !{!"0x101\00n\0016777280\000", !58, !26, !29, !131} ; [ DW_TAG_arg_variable ] [n] [line 64]
!131 = !MDLocation(line: 117, column: 3, scope: !25)
!132 = !MDLocation(line: 64, column: 25, scope: !58, inlinedAt: !131)
!133 = !{!"0x100\00i\0073\000", !58, !26, !29, !131} ; [ DW_TAG_auto_variable ] [i] [line 73]
!134 = !MDLocation(line: 73, column: 7, scope: !58, inlinedAt: !131)
!135 = !MDLocation(line: 76, column: 3, scope: !136, inlinedAt: !131)
!136 = !{!"0xb\0076\003\0012", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!137 = !MDLocation(line: 78, column: 7, scope: !138, inlinedAt: !131)
!138 = !{!"0xb\0077\005\0014", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!139 = !{!"0xb\0076\003\0013", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!140 = !MDLocation(line: 79, column: 7, scope: !138, inlinedAt: !131)
!141 = !{!"0x100\00j\0073\000", !58, !26, !29, !131} ; [ DW_TAG_auto_variable ] [j] [line 73]
!142 = !MDLocation(line: 73, column: 10, scope: !58, inlinedAt: !131)
!143 = !MDLocation(line: 80, column: 7, scope: !144, inlinedAt: !131)
!144 = !{!"0xb\0080\007\0015", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!145 = !MDLocation(line: 82, column: 13, scope: !146, inlinedAt: !131)
!146 = !{!"0xb\0081\002\0017", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!147 = !{!"0xb\0080\007\0016", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!148 = !MDLocation(line: 82, column: 23, scope: !146, inlinedAt: !131)
!149 = !MDLocation(line: 82, column: 30, scope: !146, inlinedAt: !131)
!150 = !MDLocation(line: 82, column: 4, scope: !146, inlinedAt: !131)
!151 = !MDLocation(line: 83, column: 11, scope: !146, inlinedAt: !131)
!152 = !MDLocation(line: 83, column: 21, scope: !146, inlinedAt: !131)
!153 = !MDLocation(line: 83, column: 28, scope: !146, inlinedAt: !131)
!154 = !MDLocation(line: 83, column: 4, scope: !146, inlinedAt: !131)
!155 = !MDLocation(line: 85, column: 22, scope: !138, inlinedAt: !131)
!156 = !MDLocation(line: 85, column: 14, scope: !138, inlinedAt: !131)
!157 = !MDLocation(line: 85, column: 31, scope: !138, inlinedAt: !131)
!158 = !MDLocation(line: 85, column: 7, scope: !138, inlinedAt: !131)
!159 = !MDLocation(line: 130, column: 3, scope: !45)
!160 = !MDLocation(line: 130, column: 3, scope: !25)
!161 = !MDLocation(line: 130, column: 3, scope: !44)
!162 = !MDLocation(line: 130, column: 3, scope: !48)
!163 = !MDLocation(line: 130, column: 3, scope: !164)
!164 = !{!"0xb\004", !1, !48}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!165 = !{!166, !166, i64 0}
!166 = !{!"any pointer", !115, i64 0}
!167 = !{!115, !115, i64 0}
!168 = !MDLocation(line: 55, column: 14, scope: !169, inlinedAt: !172)
!169 = !{!"0xb\0054\0027\0010", !1, !170}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!170 = !{!"0xb\0054\003\009", !1, !171}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!171 = !{!"0xb\0054\003\008", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!172 = !MDLocation(line: 130, column: 3, scope: !173)
!173 = !{!"0xb\0023", !1, !45}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!174 = !MDLocation(line: 55, column: 44, scope: !169, inlinedAt: !172)
!175 = !MDLocation(line: 55, column: 5, scope: !169, inlinedAt: !172)
!176 = !MDLocation(line: 56, column: 9, scope: !177, inlinedAt: !172)
!177 = !{!"0xb\0056\009\0011", !1, !169}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!178 = !MDLocation(line: 56, column: 9, scope: !169, inlinedAt: !172)
!179 = !MDLocation(line: 56, column: 31, scope: !180, inlinedAt: !172)
!180 = !{!"0xb\001", !1, !177}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gesummv/gesummv.c]
!181 = !MDLocation(line: 56, column: 22, scope: !177, inlinedAt: !172)
!182 = !MDLocation(line: 54, column: 3, scope: !171, inlinedAt: !172)
!183 = !MDLocation(line: 133, column: 3, scope: !25)
!184 = !MDLocation(line: 134, column: 3, scope: !25)
!185 = !MDLocation(line: 135, column: 3, scope: !25)
!186 = !MDLocation(line: 136, column: 3, scope: !25)
!187 = !MDLocation(line: 137, column: 3, scope: !25)
!188 = !MDLocation(line: 139, column: 3, scope: !25)
