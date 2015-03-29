; ModuleID = 'trmm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !79), !dbg !80
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !79), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !79), !dbg !82
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !83
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !84
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !85
  %arraydecay2 = bitcast i8* %call1 to [1024 x double]*, !dbg !86
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !87, metadata !79), !dbg !89
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !33, metadata !79), !dbg !90
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !33, metadata !79), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !91, metadata !79), !dbg !92
  br label %for.cond1.preheader.i, !dbg !93

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc17.i ], !dbg !88
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !95
  %conv.i = sitofp i32 %0 to double, !dbg !95
  br label %for.body3.i, !dbg !100

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i.1, %for.body3.i ], !dbg !88
  %1 = trunc i64 %indvars.iv.i to i32, !dbg !101
  %conv4.i = sitofp i32 %1 to double, !dbg !101
  %mul.i = fmul double %conv.i, %conv4.i, !dbg !95
  %div.i = fmul double %mul.i, 9.765625e-04, !dbg !102
  %arrayidx7.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.i, !dbg !103
  store double %div.i, double* %arrayidx7.i, align 8, !dbg !103, !tbaa !104
  %arrayidx16.i = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv3.i, i64 %indvars.iv.i, !dbg !108
  store double %div.i, double* %arrayidx16.i, align 8, !dbg !108, !tbaa !104
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !100
  %2 = trunc i64 %indvars.iv.next.i to i32, !dbg !101
  %conv4.i.1 = sitofp i32 %2 to double, !dbg !101
  %mul.i.1 = fmul double %conv.i, %conv4.i.1, !dbg !95
  %div.i.1 = fmul double %mul.i.1, 9.765625e-04, !dbg !102
  %arrayidx7.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.next.i, !dbg !103
  store double %div.i.1, double* %arrayidx7.i.1, align 8, !dbg !103, !tbaa !104
  %arrayidx16.i.1 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv3.i, i64 %indvars.iv.next.i, !dbg !108
  store double %div.i.1, double* %arrayidx16.i.1, align 8, !dbg !108, !tbaa !104
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !100
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 1024, !dbg !100
  br i1 %exitcond.i.1, label %for.inc17.i, label %for.body3.i, !dbg !100

for.inc17.i:                                      ; preds = %for.body3.i
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !93
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1024, !dbg !93
  br i1 %exitcond5.i, label %for.cond1.preheader.i73.preheader, label %for.cond1.preheader.i, !dbg !93

for.cond1.preheader.i73.preheader:                ; preds = %for.inc17.i
  br label %for.cond1.preheader.i73, !dbg !109

for.cond1.preheader.i73:                          ; preds = %for.cond1.preheader.i73.preheader, %for.inc21.i
  %indvar = phi i32 [ 0, %for.cond1.preheader.i73.preheader ], [ %indvar.next, %for.inc21.i ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc21.i ], [ 1, %for.cond1.preheader.i73.preheader ]
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %for.inc21.i ], [ 1, %for.cond1.preheader.i73.preheader ], !dbg !113
  %3 = add i32 %indvar, 1, !dbg !109
  br label %for.body6.lr.ph.i, !dbg !109

for.body6.lr.ph.i:                                ; preds = %for.inc18.i, %for.cond1.preheader.i73
  %indvars.iv7.i74 = phi i64 [ 0, %for.cond1.preheader.i73 ], [ %indvars.iv.next8.i79, %for.inc18.i ], !dbg !113
  %arrayidx17.i = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv10.i, i64 %indvars.iv7.i74, !dbg !114
  %.pre.i = load double* %arrayidx17.i, align 8, !dbg !114, !tbaa !104
  %xtraiter = and i32 %3, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %3, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body6.i.prol.preheader, label %for.body6.lr.ph.i.split

for.body6.i.prol.preheader:                       ; preds = %for.body6.lr.ph.i
  br label %for.body6.i.prol, !dbg !118

for.body6.i.prol:                                 ; preds = %for.body6.i.prol.preheader, %for.body6.i.prol
  %4 = phi double [ %add.i.prol, %for.body6.i.prol ], [ %.pre.i, %for.body6.i.prol.preheader ], !dbg !118
  %indvars.iv.i75.prol = phi i64 [ %indvars.iv.next.i77.prol, %for.body6.i.prol ], [ 0, %for.body6.i.prol.preheader ], !dbg !113
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body6.i.prol ], [ %xtraiter, %for.body6.i.prol.preheader ]
  %arrayidx8.i.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv10.i, i64 %indvars.iv.i75.prol, !dbg !118
  %5 = load double* %arrayidx8.i.prol, align 8, !dbg !118, !tbaa !104
  %mul.i76.prol = fmul double %5, 3.241200e+04, !dbg !119
  %arrayidx12.i.prol = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv7.i74, i64 %indvars.iv.i75.prol, !dbg !120
  %6 = load double* %arrayidx12.i.prol, align 8, !dbg !120, !tbaa !104
  %mul13.i.prol = fmul double %mul.i76.prol, %6, !dbg !119
  %add.i.prol = fadd double %4, %mul13.i.prol, !dbg !114
  store double %add.i.prol, double* %arrayidx17.i, align 8, !dbg !114, !tbaa !104
  %indvars.iv.next.i77.prol = add nuw nsw i64 %indvars.iv.i75.prol, 1, !dbg !121
  %lftr.wideiv.prol = trunc i64 %indvars.iv.next.i77.prol to i32, !dbg !121
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv, !dbg !121
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !121
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !121
  br i1 %prol.iter.cmp, label %for.body6.i.prol, label %for.body6.lr.ph.i.split.loopexit, !llvm.loop !122

for.body6.lr.ph.i.split.loopexit:                 ; preds = %for.body6.i.prol
  %.unr.ph = phi double [ %add.i.prol, %for.body6.i.prol ]
  %indvars.iv.i75.unr.ph = phi i64 [ %indvars.iv.next.i77.prol, %for.body6.i.prol ]
  br label %for.body6.lr.ph.i.split

for.body6.lr.ph.i.split:                          ; preds = %for.body6.lr.ph.i.split.loopexit, %for.body6.lr.ph.i
  %.unr = phi double [ %.pre.i, %for.body6.lr.ph.i ], [ %.unr.ph, %for.body6.lr.ph.i.split.loopexit ]
  %indvars.iv.i75.unr = phi i64 [ 0, %for.body6.lr.ph.i ], [ %indvars.iv.i75.unr.ph, %for.body6.lr.ph.i.split.loopexit ]
  %7 = icmp ult i32 %3, 2
  br i1 %7, label %for.inc18.i, label %for.body6.lr.ph.i.split.split

for.body6.lr.ph.i.split.split:                    ; preds = %for.body6.lr.ph.i.split
  br label %for.body6.i, !dbg !121

for.body6.i:                                      ; preds = %for.body6.i, %for.body6.lr.ph.i.split.split
  %8 = phi double [ %.unr, %for.body6.lr.ph.i.split.split ], [ %add.i.1, %for.body6.i ], !dbg !118
  %indvars.iv.i75 = phi i64 [ %indvars.iv.i75.unr, %for.body6.lr.ph.i.split.split ], [ %indvars.iv.next.i77.1, %for.body6.i ], !dbg !113
  %arrayidx8.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv10.i, i64 %indvars.iv.i75, !dbg !118
  %9 = load double* %arrayidx8.i, align 8, !dbg !118, !tbaa !104
  %mul.i76 = fmul double %9, 3.241200e+04, !dbg !119
  %arrayidx12.i = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv7.i74, i64 %indvars.iv.i75, !dbg !120
  %10 = load double* %arrayidx12.i, align 8, !dbg !120, !tbaa !104
  %mul13.i = fmul double %mul.i76, %10, !dbg !119
  %add.i = fadd double %8, %mul13.i, !dbg !114
  store double %add.i, double* %arrayidx17.i, align 8, !dbg !114, !tbaa !104
  %indvars.iv.next.i77 = add nuw nsw i64 %indvars.iv.i75, 1, !dbg !121
  %lftr.wideiv = trunc i64 %indvars.iv.next.i77 to i32, !dbg !121
  %arrayidx8.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv10.i, i64 %indvars.iv.next.i77, !dbg !118
  %11 = load double* %arrayidx8.i.1, align 8, !dbg !118, !tbaa !104
  %mul.i76.1 = fmul double %11, 3.241200e+04, !dbg !119
  %arrayidx12.i.1 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv7.i74, i64 %indvars.iv.next.i77, !dbg !120
  %12 = load double* %arrayidx12.i.1, align 8, !dbg !120, !tbaa !104
  %mul13.i.1 = fmul double %mul.i76.1, %12, !dbg !119
  %add.i.1 = fadd double %add.i, %mul13.i.1, !dbg !114
  store double %add.i.1, double* %arrayidx17.i, align 8, !dbg !114, !tbaa !104
  %indvars.iv.next.i77.1 = add nuw nsw i64 %indvars.iv.next.i77, 1, !dbg !121
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.i77.1 to i32, !dbg !121
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %indvars.iv, !dbg !121
  br i1 %exitcond.1, label %for.inc18.i.unr-lcssa, label %for.body6.i, !dbg !121

for.inc18.i.unr-lcssa:                            ; preds = %for.body6.i
  br label %for.inc18.i

for.inc18.i:                                      ; preds = %for.body6.lr.ph.i.split, %for.inc18.i.unr-lcssa
  %indvars.iv.next8.i79 = add nuw nsw i64 %indvars.iv7.i74, 1, !dbg !109
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i79, 1024, !dbg !109
  br i1 %exitcond9.i, label %for.inc21.i, label %for.body6.lr.ph.i, !dbg !109

for.inc21.i:                                      ; preds = %for.inc18.i
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !124
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !124
  tail call void @llvm.dbg.value(metadata i32 %indvars.iv.next, i64 0, metadata !125, metadata !79), !dbg !126
  %exitcond12.i = icmp eq i64 %indvars.iv.next11.i, 1024, !dbg !124
  %indvar.next = add i32 %indvar, 1, !dbg !124
  br i1 %exitcond12.i, label %kernel_trmm.exit, label %for.cond1.preheader.i73, !dbg !124

kernel_trmm.exit:                                 ; preds = %for.inc21.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !127
  br i1 %cmp, label %if.end41, label %if.end48, !dbg !128

if.end41:                                         ; preds = %kernel_trmm.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !79), !dbg !129
  tail call void @llvm.dbg.value(metadata i8* %13, i64 0, metadata !40, metadata !79), !dbg !130
  %13 = load i8** %argv, align 8, !dbg !131, !tbaa !133
  %14 = load i8* %13, align 1, !dbg !131, !tbaa !135
  %phitmp = icmp eq i8 %14, 0, !dbg !129
  br i1 %phitmp, label %for.cond1.preheader.i68.preheader, label %if.end48, !dbg !128

for.cond1.preheader.i68.preheader:                ; preds = %if.end41
  br label %for.cond1.preheader.i68, !dbg !136

for.cond1.preheader.i68:                          ; preds = %for.cond1.preheader.i68.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i68.preheader ], !dbg !143
  %15 = shl i64 %indvars.iv7.i, 10, !dbg !136
  br label %for.body3.i70, !dbg !145

for.body3.i70:                                    ; preds = %for.inc.i, %for.cond1.preheader.i68
  %indvars.iv.i69 = phi i64 [ 0, %for.cond1.preheader.i68 ], [ %indvars.iv.next.i71, %for.inc.i ], !dbg !143
  %16 = load %struct._IO_FILE** @stderr, align 8, !dbg !146, !tbaa !133
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv7.i, i64 %indvars.iv.i69, !dbg !147
  %17 = load double* %arrayidx5.i, align 8, !dbg !147, !tbaa !104
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %17) #5, !dbg !148
  %18 = add nuw nsw i64 %indvars.iv.i69, %15, !dbg !136
  %19 = trunc i64 %18 to i32, !dbg !149
  %rem.i = srem i32 %19, 20, !dbg !149
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !149
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !150

if.then.i:                                        ; preds = %for.body3.i70
  %20 = load %struct._IO_FILE** @stderr, align 8, !dbg !151, !tbaa !133
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5, !dbg !153
  br label %for.inc.i, !dbg !153

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i70
  %indvars.iv.next.i71 = add nuw nsw i64 %indvars.iv.i69, 1, !dbg !145
  %exitcond.i72 = icmp eq i64 %indvars.iv.next.i71, 1024, !dbg !145
  br i1 %exitcond.i72, label %for.inc8.i, label %for.body3.i70, !dbg !145

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !154
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !154
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i68, !dbg !154

print_array.exit:                                 ; preds = %for.inc8.i
  %21 = load %struct._IO_FILE** @stderr, align 8, !dbg !155, !tbaa !133
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5, !dbg !156
  br label %if.end48, !dbg !143

if.end48:                                         ; preds = %if.end41, %print_array.exit, %kernel_trmm.exit
  tail call void @free(i8* %call) #4, !dbg !157
  tail call void @free(i8* %call1) #4, !dbg !158
  ret i32 0, !dbg !159
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
!43 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0044", !1, !23, !44, null, null, null, null, !49} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
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
!54 = !{!"0x2e\00kernel_trmm\00kernel_trmm\00\0059\001\001\000\000\00256\001\0063", !1, !23, !55, null, null, null, null, !57} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 63] [kernel_trmm]
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
!65 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !23, !66, null, null, null, null, !69} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
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
!87 = !{!"0x101\00ni\0016777239\000", !65, !23, !26, !88} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!88 = !MDLocation(line: 88, column: 3, scope: !22)
!89 = !MDLocation(line: 23, column: 21, scope: !65, inlinedAt: !88)
!90 = !MDLocation(line: 83, column: 13, scope: !22)
!91 = !{!"0x100\00i\0028\000", !65, !23, !26, !88} ; [ DW_TAG_auto_variable ] [i] [line 28]
!92 = !MDLocation(line: 28, column: 7, scope: !65, inlinedAt: !88)
!93 = !MDLocation(line: 31, column: 3, scope: !94, inlinedAt: !88)
!94 = !{!"0xb\0031\003\0020", !1, !65}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!95 = !MDLocation(line: 33, column: 18, scope: !96, inlinedAt: !88)
!96 = !{!"0xb\0032\0030\0024", !1, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!97 = !{!"0xb\0032\005\0023", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!98 = !{!"0xb\0032\005\0022", !1, !99}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!99 = !{!"0xb\0031\003\0021", !1, !94}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!100 = !MDLocation(line: 32, column: 5, scope: !98, inlinedAt: !88)
!101 = !MDLocation(line: 33, column: 32, scope: !96, inlinedAt: !88)
!102 = !MDLocation(line: 33, column: 17, scope: !96, inlinedAt: !88)
!103 = !MDLocation(line: 33, column: 7, scope: !96, inlinedAt: !88)
!104 = !{!105, !105, i64 0}
!105 = !{!"double", !106, i64 0}
!106 = !{!"omnipotent char", !107, i64 0}
!107 = !{!"Simple C/C++ TBAA"}
!108 = !MDLocation(line: 34, column: 7, scope: !96, inlinedAt: !88)
!109 = !MDLocation(line: 69, column: 5, scope: !110, inlinedAt: !113)
!110 = !{!"0xb\0069\005\0016", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!111 = !{!"0xb\0068\003\0015", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!112 = !{!"0xb\0068\003\0014", !1, !54}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!113 = !MDLocation(line: 94, column: 3, scope: !22)
!114 = !MDLocation(line: 71, column: 9, scope: !115, inlinedAt: !113)
!115 = !{!"0xb\0070\007\0019", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!116 = !{!"0xb\0070\007\0018", !1, !117}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!117 = !{!"0xb\0069\005\0017", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!118 = !MDLocation(line: 71, column: 28, scope: !115, inlinedAt: !113)
!119 = !MDLocation(line: 71, column: 20, scope: !115, inlinedAt: !113)
!120 = !MDLocation(line: 71, column: 38, scope: !115, inlinedAt: !113)
!121 = !MDLocation(line: 70, column: 7, scope: !116, inlinedAt: !113)
!122 = distinct !{!122, !123}
!123 = !{!"llvm.loop.unroll.disable"}
!124 = !MDLocation(line: 68, column: 3, scope: !112, inlinedAt: !113)
!125 = !{!"0x100\00i\0064\000", !54, !23, !26, !113} ; [ DW_TAG_auto_variable ] [i] [line 64]
!126 = !MDLocation(line: 64, column: 7, scope: !54, inlinedAt: !113)
!127 = !MDLocation(line: 102, column: 3, scope: !38)
!128 = !MDLocation(line: 102, column: 3, scope: !22)
!129 = !MDLocation(line: 102, column: 3, scope: !37)
!130 = !MDLocation(line: 102, column: 3, scope: !41)
!131 = !MDLocation(line: 102, column: 3, scope: !132)
!132 = !{!"0xb\004", !1, !41}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!133 = !{!134, !134, i64 0}
!134 = !{!"any pointer", !106, i64 0}
!135 = !{!106, !106, i64 0}
!136 = !MDLocation(line: 50, column: 7, scope: !137, inlinedAt: !143)
!137 = !{!"0xb\0050\006\0013", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!138 = !{!"0xb\0048\0030\0012", !1, !139}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!139 = !{!"0xb\0048\005\0011", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!140 = !{!"0xb\0048\005\0010", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!141 = !{!"0xb\0047\003\009", !1, !142}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!142 = !{!"0xb\0047\003\008", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!143 = !MDLocation(line: 102, column: 3, scope: !144)
!144 = !{!"0xb\0023", !1, !38}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!145 = !MDLocation(line: 48, column: 5, scope: !140, inlinedAt: !143)
!146 = !MDLocation(line: 49, column: 11, scope: !138, inlinedAt: !143)
!147 = !MDLocation(line: 49, column: 41, scope: !138, inlinedAt: !143)
!148 = !MDLocation(line: 49, column: 2, scope: !138, inlinedAt: !143)
!149 = !MDLocation(line: 50, column: 6, scope: !137, inlinedAt: !143)
!150 = !MDLocation(line: 50, column: 6, scope: !138, inlinedAt: !143)
!151 = !MDLocation(line: 50, column: 39, scope: !152, inlinedAt: !143)
!152 = !{!"0xb\001", !1, !137}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!153 = !MDLocation(line: 50, column: 30, scope: !137, inlinedAt: !143)
!154 = !MDLocation(line: 47, column: 3, scope: !142, inlinedAt: !143)
!155 = !MDLocation(line: 52, column: 12, scope: !43, inlinedAt: !143)
!156 = !MDLocation(line: 52, column: 3, scope: !43, inlinedAt: !143)
!157 = !MDLocation(line: 105, column: 3, scope: !22)
!158 = !MDLocation(line: 106, column: 3, scope: !22)
!159 = !MDLocation(line: 108, column: 3, scope: !22)
