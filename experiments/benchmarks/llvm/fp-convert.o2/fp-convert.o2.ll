; ModuleID = 'fp-convert.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Total is %g\0A\00", align 1

; Function Attrs: nounwind readonly uwtable
define double @loop(float* nocapture readonly %x, float* nocapture readonly %y, i64 %length) #0 {
entry:
  tail call void @llvm.dbg.value(metadata float* %x, i64 0, metadata !14, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata float* %y, i64 0, metadata !15, metadata !42), !dbg !44
  tail call void @llvm.dbg.value(metadata i64 %length, i64 0, metadata !16, metadata !42), !dbg !45
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !18, metadata !42), !dbg !46
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !42), !dbg !47
  %cmp7 = icmp sgt i64 %length, 0, !dbg !48
  br i1 %cmp7, label %for.body.lr.ph, label %for.end, !dbg !51

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %length, -1, !dbg !51
  %xtraiter = and i64 %length, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %length, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %accumulator.09.prol = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add.prol, %for.body.prol ]
  %i.08.prol = phi i64 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body.lr.ph ], [ %prol.iter.sub, %for.body.prol ]
  %arrayidx.prol = getelementptr inbounds float* %x, i64 %i.08.prol, !dbg !52
  %1 = load float* %arrayidx.prol, align 4, !dbg !52, !tbaa !54
  %conv.prol = fpext float %1 to double, !dbg !58
  %arrayidx1.prol = getelementptr inbounds float* %y, i64 %i.08.prol, !dbg !59
  %2 = load float* %arrayidx1.prol, align 4, !dbg !59, !tbaa !54
  %conv2.prol = fpext float %2 to double, !dbg !60
  %mul.prol = fmul double %conv.prol, %conv2.prol, !dbg !58
  %add.prol = fadd double %accumulator.09.prol, %mul.prol, !dbg !61
  tail call void @llvm.dbg.value(metadata double %add.prol, i64 0, metadata !18, metadata !42), !dbg !46
  %inc.prol = add nuw nsw i64 %i.08.prol, 1, !dbg !62
  tail call void @llvm.dbg.value(metadata i64 %inc.prol, i64 0, metadata !17, metadata !42), !dbg !47
  %exitcond.prol = icmp eq i64 %i.08.prol, %0, !dbg !51
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !51
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !51
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !63

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %add.lcssa.unr = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add.prol, %for.body.prol ]
  %accumulator.09.unr = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add.prol, %for.body.prol ]
  %i.08.unr = phi i64 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %3 = icmp ult i64 %length, 2
  br i1 %3, label %for.end.loopexit, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !51

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %accumulator.09 = phi double [ %accumulator.09.unr, %for.body.lr.ph.split.split ], [ %add.1, %for.body ]
  %i.08 = phi i64 [ %i.08.unr, %for.body.lr.ph.split.split ], [ %inc.1, %for.body ]
  %arrayidx = getelementptr inbounds float* %x, i64 %i.08, !dbg !52
  %4 = load float* %arrayidx, align 4, !dbg !52, !tbaa !54
  %conv = fpext float %4 to double, !dbg !58
  %arrayidx1 = getelementptr inbounds float* %y, i64 %i.08, !dbg !59
  %5 = load float* %arrayidx1, align 4, !dbg !59, !tbaa !54
  %conv2 = fpext float %5 to double, !dbg !60
  %mul = fmul double %conv, %conv2, !dbg !58
  %add = fadd double %accumulator.09, %mul, !dbg !61
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !18, metadata !42), !dbg !46
  %inc = add nuw nsw i64 %i.08, 1, !dbg !62
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !17, metadata !42), !dbg !47
  %arrayidx.1 = getelementptr inbounds float* %x, i64 %inc, !dbg !52
  %6 = load float* %arrayidx.1, align 4, !dbg !52, !tbaa !54
  %conv.1 = fpext float %6 to double, !dbg !58
  %arrayidx1.1 = getelementptr inbounds float* %y, i64 %inc, !dbg !59
  %7 = load float* %arrayidx1.1, align 4, !dbg !59, !tbaa !54
  %conv2.1 = fpext float %7 to double, !dbg !60
  %mul.1 = fmul double %conv.1, %conv2.1, !dbg !58
  %add.1 = fadd double %add, %mul.1, !dbg !61
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !18, metadata !42), !dbg !46
  %inc.1 = add nuw nsw i64 %inc, 1, !dbg !62
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !17, metadata !42), !dbg !47
  %exitcond.1 = icmp eq i64 %inc, %0, !dbg !51
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !51

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %add.lcssa.ph = phi double [ %add.1, %for.body ]
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.lr.ph.split, %for.end.loopexit.unr-lcssa
  %add.lcssa = phi double [ %add.lcssa.unr, %for.body.lr.ph.split ], [ %add.lcssa.ph, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %accumulator.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add.lcssa, %for.end.loopexit ]
  ret double %accumulator.0.lcssa, !dbg !65
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #2 {
entry:
  %x = alloca [2048 x float], align 16
  %y = alloca [2048 x float], align 16
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !27, metadata !42), !dbg !66
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !28, metadata !42), !dbg !67
  %0 = bitcast [2048 x float]* %x to i8*, !dbg !68
  call void @llvm.lifetime.start(i64 8192, i8* %0) #3, !dbg !68
  tail call void @llvm.dbg.declare(metadata [2048 x float]* %x, metadata !31, metadata !42), !dbg !69
  %1 = bitcast [2048 x float]* %y to i8*, !dbg !70
  call void @llvm.lifetime.start(i64 8192, i8* %1) #3, !dbg !70
  tail call void @llvm.dbg.declare(metadata [2048 x float]* %y, metadata !35, metadata !42), !dbg !71
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !36, metadata !42), !dbg !72
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !37, metadata !42), !dbg !73
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !38, metadata !42), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !42), !dbg !75
  br label %for.body, !dbg !76

for.body:                                         ; preds = %loop.exit, %entry
  %total.028 = phi double [ 0.000000e+00, %entry ], [ %add11, %loop.exit ]
  %i.027 = phi i32 [ 0, %entry ], [ %inc13, %loop.exit ]
  %2 = phi <2 x float> [ <float 0.000000e+00, float 1.000000e+00>, %entry ], [ %4, %loop.exit ]
  %rem = srem i32 %i.027, 10, !dbg !78
  %tobool = icmp eq i32 %rem, 0, !dbg !82
  br i1 %tobool, label %if.else, label %vector.ph, !dbg !82

if.else:                                          ; preds = %for.body
  tail call void @llvm.dbg.value(metadata float undef, i64 0, metadata !37, metadata !42), !dbg !73
  %3 = fadd <2 x float> %2, <float 0x3FB99999A0000000, float 0x3FC99999A0000000>, !dbg !83
  tail call void @llvm.dbg.value(metadata float undef, i64 0, metadata !38, metadata !42), !dbg !74
  br label %vector.ph

vector.ph:                                        ; preds = %for.body, %if.else
  %4 = phi <2 x float> [ %3, %if.else ], [ <float 0.000000e+00, float 1.000000e+00>, %for.body ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !42), !dbg !85
  %broadcast.splat36 = shufflevector <2 x float> %4, <2 x float> undef, <4 x i32> zeroinitializer
  %broadcast.splat38 = shufflevector <2 x float> %4, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !86
  %5 = trunc i64 %index to i32, !dbg !88
  %broadcast.splatinsert32 = insertelement <4 x i32> undef, i32 %5, i32 0, !dbg !88
  %broadcast.splat33 = shufflevector <4 x i32> %broadcast.splatinsert32, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !88
  %induction34 = add <4 x i32> %broadcast.splat33, <i32 0, i32 1, i32 2, i32 3>, !dbg !88
  %6 = sitofp <4 x i32> %induction34 to <4 x float>, !dbg !88
  %7 = fadd <4 x float> %broadcast.splat36, %6, !dbg !91
  %8 = getelementptr inbounds [2048 x float]* %x, i64 0, i64 %index, !dbg !92
  %9 = bitcast float* %8 to <4 x float>*, !dbg !92
  store <4 x float> %7, <4 x float>* %9, align 16, !dbg !92, !tbaa !54
  %10 = fadd <4 x float> %broadcast.splat38, %6, !dbg !93
  %11 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 %index, !dbg !94
  %12 = bitcast float* %11 to <4 x float>*, !dbg !94
  store <4 x float> %10, <4 x float>* %12, align 16, !dbg !94, !tbaa !54
  %index.next = add nuw nsw i64 %index, 4, !dbg !86
  %13 = trunc i64 %index.next to i32, !dbg !88
  %broadcast.splatinsert32.1 = insertelement <4 x i32> undef, i32 %13, i32 0, !dbg !88
  %broadcast.splat33.1 = shufflevector <4 x i32> %broadcast.splatinsert32.1, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !88
  %induction34.1 = add <4 x i32> %broadcast.splat33.1, <i32 0, i32 1, i32 2, i32 3>, !dbg !88
  %14 = sitofp <4 x i32> %induction34.1 to <4 x float>, !dbg !88
  %15 = fadd <4 x float> %broadcast.splat36, %14, !dbg !91
  %16 = getelementptr inbounds [2048 x float]* %x, i64 0, i64 %index.next, !dbg !92
  %17 = bitcast float* %16 to <4 x float>*, !dbg !92
  store <4 x float> %15, <4 x float>* %17, align 16, !dbg !92, !tbaa !54
  %18 = fadd <4 x float> %broadcast.splat38, %14, !dbg !93
  %19 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 %index.next, !dbg !94
  %20 = bitcast float* %19 to <4 x float>*, !dbg !94
  store <4 x float> %18, <4 x float>* %20, align 16, !dbg !94, !tbaa !54
  %index.next.1 = add nuw nsw i64 %index.next, 4, !dbg !86
  %21 = icmp eq i64 %index.next.1, 2048, !dbg !86
  br i1 %21, label %for.body.i.preheader, label %vector.body, !dbg !86, !llvm.loop !95

for.body.i.preheader:                             ; preds = %vector.body
  br label %for.body.i, !dbg !98

for.body.i:                                       ; preds = %for.body.i, %for.body.i.preheader
  %accumulator.09.i = phi double [ 0.000000e+00, %for.body.i.preheader ], [ %add.i.1, %for.body.i ], !dbg !99
  %i.08.i = phi i64 [ 0, %for.body.i.preheader ], [ %inc.i.1, %for.body.i ], !dbg !99
  %arrayidx.i = getelementptr inbounds [2048 x float]* %x, i64 0, i64 %i.08.i, !dbg !98
  %22 = load float* %arrayidx.i, align 4, !dbg !98, !tbaa !54
  %conv.i = fpext float %22 to double, !dbg !100
  %arrayidx1.i = getelementptr inbounds [2048 x float]* %y, i64 0, i64 %i.08.i, !dbg !101
  %23 = load float* %arrayidx1.i, align 4, !dbg !101, !tbaa !54
  %conv2.i = fpext float %23 to double, !dbg !102
  %mul.i = fmul double %conv.i, %conv2.i, !dbg !100
  %add.i = fadd double %accumulator.09.i, %mul.i, !dbg !103
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !104, metadata !42), !dbg !105
  %inc.i = add nuw nsw i64 %i.08.i, 1, !dbg !106
  tail call void @llvm.dbg.value(metadata i64 %inc.i, i64 0, metadata !107, metadata !42), !dbg !108
  %arrayidx.i.1 = getelementptr inbounds [2048 x float]* %x, i64 0, i64 %inc.i, !dbg !98
  %24 = load float* %arrayidx.i.1, align 4, !dbg !98, !tbaa !54
  %conv.i.1 = fpext float %24 to double, !dbg !100
  %arrayidx1.i.1 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 %inc.i, !dbg !101
  %25 = load float* %arrayidx1.i.1, align 4, !dbg !101, !tbaa !54
  %conv2.i.1 = fpext float %25 to double, !dbg !102
  %mul.i.1 = fmul double %conv.i.1, %conv2.i.1, !dbg !100
  %add.i.1 = fadd double %add.i, %mul.i.1, !dbg !103
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !104, metadata !42), !dbg !105
  %inc.i.1 = add nuw nsw i64 %inc.i, 1, !dbg !106
  tail call void @llvm.dbg.value(metadata i64 %inc.i, i64 0, metadata !107, metadata !42), !dbg !108
  %exitcond.i.1 = icmp eq i64 %inc.i, 2047, !dbg !109
  br i1 %exitcond.i.1, label %loop.exit, label %for.body.i, !dbg !109

loop.exit:                                        ; preds = %for.body.i
  %add.i.lcssa = phi double [ %add.i.1, %for.body.i ]
  %add11 = fadd double %total.028, %add.i.lcssa, !dbg !110
  tail call void @llvm.dbg.value(metadata double %add11, i64 0, metadata !36, metadata !42), !dbg !72
  %inc13 = add nuw nsw i32 %i.027, 1, !dbg !111
  tail call void @llvm.dbg.value(metadata i32 %inc13, i64 0, metadata !29, metadata !42), !dbg !75
  %exitcond31 = icmp eq i32 %inc13, 500000, !dbg !76
  br i1 %exitcond31, label %for.end14, label %for.body, !dbg !76

for.end14:                                        ; preds = %loop.exit
  %add11.lcssa = phi double [ %add11, %loop.exit ]
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), double %add11.lcssa) #3, !dbg !112
  call void @llvm.lifetime.end(i64 8192, i8* %1) #3, !dbg !113
  call void @llvm.lifetime.end(i64 8192, i8* %0) #3, !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c] [DW_LANG_C99]
!1 = !{!"fp-convert.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!6 = !{!7, !19}
!7 = !{!"0x2e\00loop\00loop\00\004\000\001\000\000\00256\001\004", !1, !8, !9, null, double (float*, float*, i64)* @loop, null, null, !13} ; [ DW_TAG_subprogram ] [line 4] [def] [loop]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!4, !11, !11, !12}
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!12 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!13 = !{!14, !15, !16, !17, !18}
!14 = !{!"0x101\00x\0016777220\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [x] [line 4]
!15 = !{!"0x101\00y\0033554436\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [y] [line 4]
!16 = !{!"0x101\00length\0050331652\000", !7, !8, !12} ; [ DW_TAG_arg_variable ] [length] [line 4]
!17 = !{!"0x100\00i\005\000", !7, !8, !12}        ; [ DW_TAG_auto_variable ] [i] [line 5]
!18 = !{!"0x100\00accumulator\006\000", !7, !8, !4} ; [ DW_TAG_auto_variable ] [accumulator] [line 6]
!19 = !{!"0x2e\00main\00main\00\0019\000\001\000\000\00256\001\0019", !1, !8, !20, null, i32 (i32, i8**)* @main, null, null, !26} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{!22, !22, !23}
!22 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!25 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!26 = !{!27, !28, !29, !30, !31, !35, !36, !37, !38}
!27 = !{!"0x101\00argc\0016777235\000", !19, !8, !22} ; [ DW_TAG_arg_variable ] [argc] [line 19]
!28 = !{!"0x101\00argv\0033554451\000", !19, !8, !23} ; [ DW_TAG_arg_variable ] [argv] [line 19]
!29 = !{!"0x100\00i\0020\000", !19, !8, !22}      ; [ DW_TAG_auto_variable ] [i] [line 20]
!30 = !{!"0x100\00j\0020\000", !19, !8, !22}      ; [ DW_TAG_auto_variable ] [j] [line 20]
!31 = !{!"0x100\00x\0021\000", !19, !8, !32}      ; [ DW_TAG_auto_variable ] [x] [line 21]
!32 = !{!"0x1\00\000\0065536\0032\000\000\000", null, null, !5, !33, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 32, offset 0] [from float]
!33 = !{!34}
!34 = !{!"0x21\000\002048"}                       ; [ DW_TAG_subrange_type ] [0, 2047]
!35 = !{!"0x100\00y\0022\000", !19, !8, !32}      ; [ DW_TAG_auto_variable ] [y] [line 22]
!36 = !{!"0x100\00total\0023\000", !19, !8, !4}   ; [ DW_TAG_auto_variable ] [total] [line 23]
!37 = !{!"0x100\00a\0024\000", !19, !8, !5}       ; [ DW_TAG_auto_variable ] [a] [line 24]
!38 = !{!"0x100\00b\0025\000", !19, !8, !5}       ; [ DW_TAG_auto_variable ] [b] [line 25]
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 4, column: 20, scope: !7)
!44 = !MDLocation(line: 4, column: 30, scope: !7)
!45 = !MDLocation(line: 4, column: 38, scope: !7)
!46 = !MDLocation(line: 6, column: 10, scope: !7)
!47 = !MDLocation(line: 5, column: 8, scope: !7)
!48 = !MDLocation(line: 7, column: 13, scope: !49)
!49 = !{!"0xb\007\003\001", !1, !50}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!50 = !{!"0xb\007\003\000", !1, !7}               ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!51 = !MDLocation(line: 7, column: 3, scope: !50)
!52 = !MDLocation(line: 8, column: 28, scope: !53)
!53 = !{!"0xb\007\0028\002", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!54 = !{!55, !55, i64 0}
!55 = !{!"float", !56, i64 0}
!56 = !{!"omnipotent char", !57, i64 0}
!57 = !{!"Simple C/C++ TBAA"}
!58 = !MDLocation(line: 8, column: 20, scope: !53)
!59 = !MDLocation(line: 8, column: 43, scope: !53)
!60 = !MDLocation(line: 8, column: 35, scope: !53)
!61 = !MDLocation(line: 8, column: 5, scope: !53)
!62 = !MDLocation(line: 7, column: 23, scope: !49)
!63 = distinct !{!63, !64}
!64 = !{!"llvm.loop.unroll.disable"}
!65 = !MDLocation(line: 10, column: 3, scope: !7)
!66 = !MDLocation(line: 19, column: 14, scope: !19)
!67 = !MDLocation(line: 19, column: 26, scope: !19)
!68 = !MDLocation(line: 21, column: 3, scope: !19)
!69 = !MDLocation(line: 21, column: 9, scope: !19)
!70 = !MDLocation(line: 22, column: 3, scope: !19)
!71 = !MDLocation(line: 22, column: 9, scope: !19)
!72 = !MDLocation(line: 23, column: 10, scope: !19)
!73 = !MDLocation(line: 24, column: 9, scope: !19)
!74 = !MDLocation(line: 25, column: 9, scope: !19)
!75 = !MDLocation(line: 20, column: 7, scope: !19)
!76 = !MDLocation(line: 27, column: 3, scope: !77)
!77 = !{!"0xb\0027\003\003", !1, !19}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!78 = !MDLocation(line: 28, column: 9, scope: !79)
!79 = !{!"0xb\0028\009\006", !1, !80}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!80 = !{!"0xb\0027\0027\005", !1, !81}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!81 = !{!"0xb\0027\003\004", !1, !77}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!82 = !MDLocation(line: 28, column: 9, scope: !80)
!83 = !MDLocation(line: 32, column: 7, scope: !84)
!84 = !{!"0xb\0031\0012\008", !1, !79}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!85 = !MDLocation(line: 20, column: 10, scope: !19)
!86 = !MDLocation(line: 35, column: 5, scope: !87)
!87 = !{!"0xb\0035\005\009", !1, !80}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!88 = !MDLocation(line: 36, column: 18, scope: !89)
!89 = !{!"0xb\0035\0028\0011", !1, !90}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!90 = !{!"0xb\0035\005\0010", !1, !87}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!91 = !MDLocation(line: 36, column: 14, scope: !89)
!92 = !MDLocation(line: 36, column: 7, scope: !89)
!93 = !MDLocation(line: 37, column: 14, scope: !89)
!94 = !MDLocation(line: 37, column: 7, scope: !89)
!95 = distinct !{!95, !96, !97}
!96 = !{!"llvm.loop.vectorize.width", i32 1}
!97 = !{!"llvm.loop.interleave.count", i32 1}
!98 = !MDLocation(line: 8, column: 28, scope: !53, inlinedAt: !99)
!99 = !MDLocation(line: 39, column: 14, scope: !80)
!100 = !MDLocation(line: 8, column: 20, scope: !53, inlinedAt: !99)
!101 = !MDLocation(line: 8, column: 43, scope: !53, inlinedAt: !99)
!102 = !MDLocation(line: 8, column: 35, scope: !53, inlinedAt: !99)
!103 = !MDLocation(line: 8, column: 5, scope: !53, inlinedAt: !99)
!104 = !{!"0x100\00accumulator\006\000", !7, !8, !4, !99} ; [ DW_TAG_auto_variable ] [accumulator] [line 6]
!105 = !MDLocation(line: 6, column: 10, scope: !7, inlinedAt: !99)
!106 = !MDLocation(line: 7, column: 23, scope: !49, inlinedAt: !99)
!107 = !{!"0x100\00i\005\000", !7, !8, !12, !99}  ; [ DW_TAG_auto_variable ] [i] [line 5]
!108 = !MDLocation(line: 5, column: 8, scope: !7, inlinedAt: !99)
!109 = !MDLocation(line: 7, column: 3, scope: !50, inlinedAt: !99)
!110 = !MDLocation(line: 39, column: 5, scope: !80)
!111 = !MDLocation(line: 27, column: 22, scope: !81)
!112 = !MDLocation(line: 42, column: 3, scope: !19)
!113 = !MDLocation(line: 44, column: 3, scope: !19)
!114 = !MDLocation(line: 45, column: 1, scope: !19)
