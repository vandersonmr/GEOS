; ModuleID = 'trisolv.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !75), !dbg !76
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !75), !dbg !77
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !75), !dbg !78
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !79
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !80
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !81
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !82
  %arraydecay3 = bitcast i8* %call1 to double*, !dbg !83
  %arraydecay4 = bitcast i8* %call2 to double*, !dbg !84
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !85, metadata !75), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !88, metadata !75), !dbg !89
  br label %for.body.i, !dbg !90

for.body.i:                                       ; preds = %for.inc16.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc16.i ], !dbg !86
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !92
  %conv.i = sitofp i32 %0 to double, !dbg !92
  %div.i = fdiv double %conv.i, 4.000000e+03, !dbg !95
  %arrayidx.i = getelementptr inbounds double* %arraydecay3, i64 %indvars.iv3.i, !dbg !96
  store double %div.i, double* %arrayidx.i, align 8, !dbg !96, !tbaa !97
  %arrayidx3.i = getelementptr inbounds double* %arraydecay4, i64 %indvars.iv3.i, !dbg !101
  store double %div.i, double* %arrayidx3.i, align 8, !dbg !101, !tbaa !97
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !102, metadata !75), !dbg !103
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.i
  %index = phi i64 [ 0, %for.body.i ], [ %index.next.1, %vector.body ], !dbg !86
  %induction8588 = or i64 %index, 1, !dbg !86
  %1 = trunc i64 %index to i32, !dbg !104
  %induction8789 = or i32 %1, 1, !dbg !104
  %2 = sitofp i32 %1 to double, !dbg !104
  %3 = sitofp i32 %induction8789 to double, !dbg !104
  %4 = fmul double %conv.i, %2, !dbg !107
  %5 = fmul double %conv.i, %3, !dbg !107
  %6 = fdiv double %4, 4.000000e+03, !dbg !108
  %7 = fdiv double %5, 4.000000e+03, !dbg !108
  %8 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !109
  %9 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction8588, !dbg !109
  store double %6, double* %8, align 8, !dbg !109, !tbaa !97
  store double %7, double* %9, align 8, !dbg !109, !tbaa !97
  %index.next = add nuw nsw i64 %index, 2, !dbg !86
  %induction8588.1 = or i64 %index.next, 1, !dbg !86
  %10 = trunc i64 %index.next to i32, !dbg !104
  %induction8789.1 = or i32 %10, 1, !dbg !104
  %11 = sitofp i32 %10 to double, !dbg !104
  %12 = sitofp i32 %induction8789.1 to double, !dbg !104
  %13 = fmul double %conv.i, %11, !dbg !107
  %14 = fmul double %conv.i, %12, !dbg !107
  %15 = fdiv double %13, 4.000000e+03, !dbg !108
  %16 = fdiv double %14, 4.000000e+03, !dbg !108
  %17 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index.next, !dbg !109
  %18 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction8588.1, !dbg !109
  store double %15, double* %17, align 8, !dbg !109, !tbaa !97
  store double %16, double* %18, align 8, !dbg !109, !tbaa !97
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !86
  %19 = icmp eq i64 %index.next.1, 4000, !dbg !86
  br i1 %19, label %for.inc16.i, label %vector.body, !dbg !86, !llvm.loop !110

for.inc16.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !90
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 4000, !dbg !90
  br i1 %exitcond5.i, label %for.body.i79.preheader, label %for.body.i, !dbg !90

for.body.i79.preheader:                           ; preds = %for.inc16.i
  br label %for.body.i79, !dbg !113

for.body.i79:                                     ; preds = %for.body.i79.preheader, %for.end.i
  %indvars.iv4.i = phi i64 [ %indvars.iv.next5.i, %for.end.i ], [ 0, %for.body.i79.preheader ], !dbg !117
  %20 = add i64 %indvars.iv4.i, -1, !dbg !113
  %21 = icmp sgt i64 %20, 0
  %smax = select i1 %21, i64 %20, i64 0
  %22 = add i64 %smax, 1, !dbg !113
  %arrayidx.i78 = getelementptr inbounds double* %arraydecay4, i64 %indvars.iv4.i, !dbg !113
  %23 = load double* %arrayidx.i78, align 8, !dbg !113, !tbaa !97
  %arrayidx2.i = getelementptr inbounds double* %arraydecay3, i64 %indvars.iv4.i, !dbg !118
  store double %23, double* %arrayidx2.i, align 8, !dbg !118, !tbaa !97
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !119, metadata !75), !dbg !120
  %24 = add nsw i64 %indvars.iv4.i, -1, !dbg !121
  %cmp41.i = icmp slt i64 %indvars.iv4.i, 1, !dbg !124
  br i1 %cmp41.i, label %for.end.i, label %for.body5.i.preheader, !dbg !125

for.body5.i.preheader:                            ; preds = %for.body.i79
  %xtraiter = and i64 %22, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %22, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body5.i.prol.preheader, label %for.body5.i.preheader.split

for.body5.i.prol.preheader:                       ; preds = %for.body5.i.preheader
  br label %for.body5.i.prol, !dbg !126

for.body5.i.prol:                                 ; preds = %for.body5.i.prol.preheader, %for.body5.i.prol
  %indvars.iv.i80.prol = phi i64 [ %indvars.iv.next.i82.prol, %for.body5.i.prol ], [ 0, %for.body5.i.prol.preheader ], !dbg !117
  %25 = phi double [ %sub14.i.prol, %for.body5.i.prol ], [ %23, %for.body5.i.prol.preheader ], !dbg !117
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body5.i.prol ], [ %xtraiter, %for.body5.i.prol.preheader ]
  %arrayidx11.i.prol = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv.i80.prol, !dbg !126
  %26 = load double* %arrayidx11.i.prol, align 8, !dbg !126, !tbaa !97
  %arrayidx13.i.prol = getelementptr inbounds double* %arraydecay3, i64 %indvars.iv.i80.prol, !dbg !127
  %27 = load double* %arrayidx13.i.prol, align 8, !dbg !127, !tbaa !97
  %mul.i81.prol = fmul double %26, %27, !dbg !126
  %sub14.i.prol = fsub double %25, %mul.i81.prol, !dbg !128
  store double %sub14.i.prol, double* %arrayidx2.i, align 8, !dbg !129, !tbaa !97
  %indvars.iv.next.i82.prol = add nuw nsw i64 %indvars.iv.i80.prol, 1, !dbg !125
  %cmp4.i.prol = icmp slt i64 %indvars.iv.i80.prol, %24, !dbg !124
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !125
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !125
  br i1 %prol.iter.cmp, label %for.body5.i.prol, label %for.body5.i.preheader.split.loopexit, !llvm.loop !130

for.body5.i.preheader.split.loopexit:             ; preds = %for.body5.i.prol
  %indvars.iv.i80.unr.ph = phi i64 [ %indvars.iv.next.i82.prol, %for.body5.i.prol ]
  %.unr.ph = phi double [ %sub14.i.prol, %for.body5.i.prol ]
  %sub14.i.lcssa.unr.ph = phi double [ %sub14.i.prol, %for.body5.i.prol ]
  br label %for.body5.i.preheader.split

for.body5.i.preheader.split:                      ; preds = %for.body5.i.preheader.split.loopexit, %for.body5.i.preheader
  %indvars.iv.i80.unr = phi i64 [ 0, %for.body5.i.preheader ], [ %indvars.iv.i80.unr.ph, %for.body5.i.preheader.split.loopexit ]
  %.unr = phi double [ %23, %for.body5.i.preheader ], [ %.unr.ph, %for.body5.i.preheader.split.loopexit ]
  %sub14.i.lcssa.unr = phi double [ 0.000000e+00, %for.body5.i.preheader ], [ %sub14.i.lcssa.unr.ph, %for.body5.i.preheader.split.loopexit ]
  %28 = icmp ult i64 %22, 2
  br i1 %28, label %for.end.i.loopexit, label %for.body5.i.preheader.split.split

for.body5.i.preheader.split.split:                ; preds = %for.body5.i.preheader.split
  br label %for.body5.i, !dbg !126

for.body5.i:                                      ; preds = %for.body5.i, %for.body5.i.preheader.split.split
  %indvars.iv.i80 = phi i64 [ %indvars.iv.i80.unr, %for.body5.i.preheader.split.split ], [ %indvars.iv.next.i82.1, %for.body5.i ], !dbg !117
  %29 = phi double [ %.unr, %for.body5.i.preheader.split.split ], [ %sub14.i.1, %for.body5.i ], !dbg !117
  %arrayidx11.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv.i80, !dbg !126
  %30 = load double* %arrayidx11.i, align 8, !dbg !126, !tbaa !97
  %arrayidx13.i = getelementptr inbounds double* %arraydecay3, i64 %indvars.iv.i80, !dbg !127
  %31 = load double* %arrayidx13.i, align 8, !dbg !127, !tbaa !97
  %mul.i81 = fmul double %30, %31, !dbg !126
  %sub14.i = fsub double %29, %mul.i81, !dbg !128
  store double %sub14.i, double* %arrayidx2.i, align 8, !dbg !129, !tbaa !97
  %indvars.iv.next.i82 = add nuw nsw i64 %indvars.iv.i80, 1, !dbg !125
  %arrayidx11.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv.next.i82, !dbg !126
  %32 = load double* %arrayidx11.i.1, align 8, !dbg !126, !tbaa !97
  %arrayidx13.i.1 = getelementptr inbounds double* %arraydecay3, i64 %indvars.iv.next.i82, !dbg !127
  %33 = load double* %arrayidx13.i.1, align 8, !dbg !127, !tbaa !97
  %mul.i81.1 = fmul double %32, %33, !dbg !126
  %sub14.i.1 = fsub double %sub14.i, %mul.i81.1, !dbg !128
  store double %sub14.i.1, double* %arrayidx2.i, align 8, !dbg !129, !tbaa !97
  %indvars.iv.next.i82.1 = add nuw nsw i64 %indvars.iv.next.i82, 1, !dbg !125
  %cmp4.i.1 = icmp slt i64 %indvars.iv.next.i82, %24, !dbg !124
  br i1 %cmp4.i.1, label %for.body5.i, label %for.end.i.loopexit.unr-lcssa, !dbg !125

for.end.i.loopexit.unr-lcssa:                     ; preds = %for.body5.i
  %sub14.i.lcssa.ph = phi double [ %sub14.i.1, %for.body5.i ]
  br label %for.end.i.loopexit

for.end.i.loopexit:                               ; preds = %for.body5.i.preheader.split, %for.end.i.loopexit.unr-lcssa
  %sub14.i.lcssa = phi double [ %sub14.i.lcssa.unr, %for.body5.i.preheader.split ], [ %sub14.i.lcssa.ph, %for.end.i.loopexit.unr-lcssa ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %for.body.i79
  %.lcssa.i = phi double [ %23, %for.body.i79 ], [ %sub14.i.lcssa, %for.end.i.loopexit ], !dbg !117
  %arrayidx22.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %indvars.iv4.i, !dbg !132
  %34 = load double* %arrayidx22.i, align 8, !dbg !132, !tbaa !97
  %div.i83 = fdiv double %.lcssa.i, %34, !dbg !133
  store double %div.i83, double* %arrayidx2.i, align 8, !dbg !134, !tbaa !97
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !135
  %exitcond.i84 = icmp eq i64 %indvars.iv.next5.i, 4000, !dbg !135
  br i1 %exitcond.i84, label %kernel_trisolv.exit, label %for.body.i79, !dbg !135

kernel_trisolv.exit:                              ; preds = %for.end.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !136
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !137

if.end44:                                         ; preds = %kernel_trisolv.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !75), !dbg !138
  tail call void @llvm.dbg.value(metadata i8* %35, i64 0, metadata !43, metadata !75), !dbg !139
  %35 = load i8** %argv, align 8, !dbg !140, !tbaa !142
  %36 = load i8* %35, align 1, !dbg !140, !tbaa !144
  %phitmp = icmp eq i8 %36, 0, !dbg !138
  br i1 %phitmp, label %for.body.i75.preheader, label %if.end51, !dbg !137

for.body.i75.preheader:                           ; preds = %if.end44
  br label %for.body.i75, !dbg !145

for.body.i75:                                     ; preds = %for.body.i75.preheader, %for.inc.i
  %indvars.iv.i73 = phi i64 [ %indvars.iv.next.i76, %for.inc.i ], [ 0, %for.body.i75.preheader ], !dbg !149
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !145, !tbaa !142
  %arrayidx.i74 = getelementptr inbounds double* %arraydecay3, i64 %indvars.iv.i73, !dbg !151
  %38 = load double* %arrayidx.i74, align 8, !dbg !151, !tbaa !97
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %38) #5, !dbg !152
  %39 = trunc i64 %indvars.iv.i73 to i32, !dbg !153
  %rem.i = srem i32 %39, 20, !dbg !153
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !153
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !155

if.then.i:                                        ; preds = %for.body.i75
  %40 = load %struct._IO_FILE** @stderr, align 8, !dbg !156, !tbaa !142
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %40) #5, !dbg !158
  br label %for.inc.i, !dbg !158

for.inc.i:                                        ; preds = %if.then.i, %for.body.i75
  %indvars.iv.next.i76 = add nuw nsw i64 %indvars.iv.i73, 1, !dbg !159
  %exitcond.i77 = icmp eq i64 %indvars.iv.next.i76, 4000, !dbg !159
  br i1 %exitcond.i77, label %if.end51.loopexit, label %for.body.i75, !dbg !159

if.end51.loopexit:                                ; preds = %for.inc.i
  br label %if.end51

if.end51:                                         ; preds = %if.end51.loopexit, %if.end44, %kernel_trisolv.exit
  tail call void @free(i8* %call) #4, !dbg !160
  tail call void @free(i8* %call1) #4, !dbg !161
  tail call void @free(i8* %call2) #4, !dbg !162
  ret i32 0, !dbg !163
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
!llvm.module.flags = !{!72, !73}
!llvm.ident = !{!74}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c] [DW_LANG_C99]
!1 = !{!"trisolv.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv"}
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
!24 = !{!25, !46, !54, !64}
!25 = !{!"0x2e\00main\00main\00\0078\000\001\000\000\00256\001\0079", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 78] [def] [scope 79] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !42, !43, !45}
!33 = !{!"0x101\00argc\0016777294\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 78]
!34 = !{!"0x101\00argv\0033554510\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 78]
!35 = !{!"0x100\00n\0081\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 81]
!36 = !{!"0x100\00A\0084\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 84]
!37 = !{!"0x100\00x\0085\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [x] [line 85]
!38 = !{!"0x100\00c\0086\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [c] [line 86]
!39 = !{!"0x100\00__s1_len\00104\000", !40, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 104]
!40 = !{!"0xb\00104\003\001", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!41 = !{!"0xb\00104\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!42 = !{!"0x100\00__s2_len\00104\000", !40, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 104]
!43 = !{!"0x100\00__s2\00104\000", !44, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 104]
!44 = !{!"0xb\00104\003\002", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!45 = !{!"0x100\00__result\00104\000", !44, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 104]
!46 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0045", !1, !26, !47, null, null, null, null, !50} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 45] [print_array]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !29, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!50 = !{!51, !52, !53}
!51 = !{!"0x101\00n\0016777258\000", !46, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 42]
!52 = !{!"0x101\00x\0033554475\000", !46, !26, !49} ; [ DW_TAG_arg_variable ] [x] [line 43]
!53 = !{!"0x100\00i\0046\000", !46, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 46]
!54 = !{!"0x2e\00kernel_trisolv\00kernel_trisolv\00\0058\001\001\000\000\00256\001\0062", !1, !26, !55, null, null, null, null, !57} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 62] [kernel_trisolv]
!55 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !56, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = !{null, !29, !9, !49, !49}
!57 = !{!58, !59, !60, !61, !62, !63}
!58 = !{!"0x101\00n\0016777274\000", !54, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 58]
!59 = !{!"0x101\00A\0033554491\000", !54, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 59]
!60 = !{!"0x101\00x\0050331708\000", !54, !26, !49} ; [ DW_TAG_arg_variable ] [x] [line 60]
!61 = !{!"0x101\00c\0067108925\000", !54, !26, !49} ; [ DW_TAG_arg_variable ] [c] [line 61]
!62 = !{!"0x100\00i\0063\000", !54, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 63]
!63 = !{!"0x100\00j\0063\000", !54, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 63]
!64 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !26, !55, null, null, null, null, !65} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!65 = !{!66, !67, !68, !69, !70, !71}
!66 = !{!"0x101\00n\0016777239\000", !64, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!67 = !{!"0x101\00A\0033554456\000", !64, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!68 = !{!"0x101\00x\0050331673\000", !64, !26, !49} ; [ DW_TAG_arg_variable ] [x] [line 25]
!69 = !{!"0x101\00c\0067108890\000", !64, !26, !49} ; [ DW_TAG_arg_variable ] [c] [line 26]
!70 = !{!"0x100\00i\0028\000", !64, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!71 = !{!"0x100\00j\0028\000", !64, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!72 = !{i32 2, !"Dwarf Version", i32 4}
!73 = !{i32 2, !"Debug Info Version", i32 2}
!74 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!75 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!76 = !MDLocation(line: 78, column: 14, scope: !25)
!77 = !MDLocation(line: 78, column: 27, scope: !25)
!78 = !MDLocation(line: 81, column: 7, scope: !25)
!79 = !MDLocation(line: 84, column: 3, scope: !25)
!80 = !MDLocation(line: 85, column: 3, scope: !25)
!81 = !MDLocation(line: 86, column: 3, scope: !25)
!82 = !MDLocation(line: 90, column: 18, scope: !25)
!83 = !MDLocation(line: 90, column: 38, scope: !25)
!84 = !MDLocation(line: 90, column: 58, scope: !25)
!85 = !{!"0x101\00n\0016777239\000", !64, !26, !29, !86} ; [ DW_TAG_arg_variable ] [n] [line 23]
!86 = !MDLocation(line: 90, column: 3, scope: !25)
!87 = !MDLocation(line: 23, column: 21, scope: !64, inlinedAt: !86)
!88 = !{!"0x100\00i\0028\000", !64, !26, !29, !86} ; [ DW_TAG_auto_variable ] [i] [line 28]
!89 = !MDLocation(line: 28, column: 7, scope: !64, inlinedAt: !86)
!90 = !MDLocation(line: 30, column: 3, scope: !91, inlinedAt: !86)
!91 = !{!"0xb\0030\003\0017", !1, !64}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!92 = !MDLocation(line: 32, column: 22, scope: !93, inlinedAt: !86)
!93 = !{!"0xb\0031\005\0019", !1, !94}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!94 = !{!"0xb\0030\003\0018", !1, !91}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!95 = !MDLocation(line: 32, column: 21, scope: !93, inlinedAt: !86)
!96 = !MDLocation(line: 32, column: 14, scope: !93, inlinedAt: !86)
!97 = !{!98, !98, i64 0}
!98 = !{!"double", !99, i64 0}
!99 = !{!"omnipotent char", !100, i64 0}
!100 = !{!"Simple C/C++ TBAA"}
!101 = !MDLocation(line: 32, column: 7, scope: !93, inlinedAt: !86)
!102 = !{!"0x100\00j\0028\000", !64, !26, !29, !86} ; [ DW_TAG_auto_variable ] [j] [line 28]
!103 = !MDLocation(line: 28, column: 10, scope: !64, inlinedAt: !86)
!104 = !MDLocation(line: 34, column: 27, scope: !105, inlinedAt: !86)
!105 = !{!"0xb\0033\007\0021", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!106 = !{!"0xb\0033\007\0020", !1, !93}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!107 = !MDLocation(line: 34, column: 13, scope: !105, inlinedAt: !86)
!108 = !MDLocation(line: 34, column: 12, scope: !105, inlinedAt: !86)
!109 = !MDLocation(line: 34, column: 2, scope: !105, inlinedAt: !86)
!110 = distinct !{!110, !111, !112}
!111 = !{!"llvm.loop.vectorize.width", i32 1}
!112 = !{!"llvm.loop.interleave.count", i32 1}
!113 = !MDLocation(line: 68, column: 14, scope: !114, inlinedAt: !117)
!114 = !{!"0xb\0067\005\0014", !1, !115}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!115 = !{!"0xb\0066\003\0013", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!116 = !{!"0xb\0066\003\0012", !1, !54}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!117 = !MDLocation(line: 96, column: 3, scope: !25)
!118 = !MDLocation(line: 68, column: 7, scope: !114, inlinedAt: !117)
!119 = !{!"0x100\00j\0063\000", !54, !26, !29, !117} ; [ DW_TAG_auto_variable ] [j] [line 63]
!120 = !MDLocation(line: 63, column: 10, scope: !54, inlinedAt: !117)
!121 = !MDLocation(line: 69, column: 24, scope: !122, inlinedAt: !117)
!122 = !{!"0xb\0069\007\0016", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!123 = !{!"0xb\0069\007\0015", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!124 = !MDLocation(line: 69, column: 19, scope: !122, inlinedAt: !117)
!125 = !MDLocation(line: 69, column: 7, scope: !123, inlinedAt: !117)
!126 = !MDLocation(line: 70, column: 23, scope: !122, inlinedAt: !117)
!127 = !MDLocation(line: 70, column: 33, scope: !122, inlinedAt: !117)
!128 = !MDLocation(line: 70, column: 16, scope: !122, inlinedAt: !117)
!129 = !MDLocation(line: 70, column: 9, scope: !122, inlinedAt: !117)
!130 = distinct !{!130, !131}
!131 = !{!"llvm.loop.unroll.disable"}
!132 = !MDLocation(line: 71, column: 21, scope: !114, inlinedAt: !117)
!133 = !MDLocation(line: 71, column: 14, scope: !114, inlinedAt: !117)
!134 = !MDLocation(line: 71, column: 7, scope: !114, inlinedAt: !117)
!135 = !MDLocation(line: 66, column: 3, scope: !116, inlinedAt: !117)
!136 = !MDLocation(line: 104, column: 3, scope: !41)
!137 = !MDLocation(line: 104, column: 3, scope: !25)
!138 = !MDLocation(line: 104, column: 3, scope: !40)
!139 = !MDLocation(line: 104, column: 3, scope: !44)
!140 = !MDLocation(line: 104, column: 3, scope: !141)
!141 = !{!"0xb\004", !1, !44}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!142 = !{!143, !143, i64 0}
!143 = !{!"any pointer", !99, i64 0}
!144 = !{!99, !99, i64 0}
!145 = !MDLocation(line: 49, column: 14, scope: !146, inlinedAt: !149)
!146 = !{!"0xb\0048\0027\0010", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!147 = !{!"0xb\0048\003\009", !1, !148}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!148 = !{!"0xb\0048\003\008", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!149 = !MDLocation(line: 104, column: 3, scope: !150)
!150 = !{!"0xb\0023", !1, !41}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!151 = !MDLocation(line: 49, column: 44, scope: !146, inlinedAt: !149)
!152 = !MDLocation(line: 49, column: 5, scope: !146, inlinedAt: !149)
!153 = !MDLocation(line: 50, column: 9, scope: !154, inlinedAt: !149)
!154 = !{!"0xb\0050\009\0011", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!155 = !MDLocation(line: 50, column: 9, scope: !146, inlinedAt: !149)
!156 = !MDLocation(line: 50, column: 31, scope: !157, inlinedAt: !149)
!157 = !{!"0xb\001", !1, !154}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!158 = !MDLocation(line: 50, column: 22, scope: !154, inlinedAt: !149)
!159 = !MDLocation(line: 48, column: 3, scope: !148, inlinedAt: !149)
!160 = !MDLocation(line: 107, column: 3, scope: !25)
!161 = !MDLocation(line: 108, column: 3, scope: !25)
!162 = !MDLocation(line: 109, column: 3, scope: !25)
!163 = !MDLocation(line: 111, column: 3, scope: !25)
