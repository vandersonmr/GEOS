; ModuleID = 'spectral-norm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !16, metadata !70), !dbg !71
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !17, metadata !70), !dbg !72
  %add = add nsw i32 %j, %i, !dbg !73
  %add2 = add nsw i32 %add, 1, !dbg !74
  %mul = mul nsw i32 %add2, %add, !dbg !75
  %div = sdiv i32 %mul, 2, !dbg !75
  %add3 = add i32 %i, 1, !dbg !75
  %add4 = add i32 %add3, %div, !dbg !75
  %conv = sitofp i32 %add4 to double, !dbg !76
  %div5 = fdiv double 1.000000e+00, %conv, !dbg !77
  ret double %div5, !dbg !78
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !25, metadata !70), !dbg !79
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !26, metadata !70), !dbg !80
  tail call void @llvm.dbg.value(metadata double* %Au, i64 0, metadata !27, metadata !70), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !70), !dbg !82
  %cmp21 = icmp sgt i32 %N, 0, !dbg !83
  br i1 %cmp21, label %for.body.lr.ph, label %for.end10, !dbg !86

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %N, -1, !dbg !86
  br label %for.body, !dbg !86

for.body:                                         ; preds = %for.inc8, %for.body.lr.ph
  %indvars.iv23 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next24, %for.inc8 ]
  %arrayidx = getelementptr inbounds double* %Au, i64 %indvars.iv23, !dbg !87
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !87, !tbaa !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !70), !dbg !93
  br label %for.body3, !dbg !94

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.body ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !96
  %2 = trunc i64 %indvars.iv23 to i32, !dbg !96
  %call = tail call double @eval_A(i32 %2, i32 %1), !dbg !96
  %arrayidx5 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !98
  %3 = load double* %arrayidx5, align 8, !dbg !98, !tbaa !89
  %mul = fmul double %call, %3, !dbg !96
  %4 = load double* %arrayidx, align 8, !dbg !99, !tbaa !89
  %add = fadd double %4, %mul, !dbg !99
  store double %add, double* %arrayidx, align 8, !dbg !99, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !94
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !94
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !94
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !94

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !86
  %lftr.wideiv25 = trunc i64 %indvars.iv23 to i32, !dbg !86
  %exitcond26 = icmp eq i32 %lftr.wideiv25, %0, !dbg !86
  br i1 %exitcond26, label %for.end10, label %for.body, !dbg !86

for.end10:                                        ; preds = %for.inc8, %entry
  ret void, !dbg !100
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !32, metadata !70), !dbg !101
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !33, metadata !70), !dbg !102
  tail call void @llvm.dbg.value(metadata double* %Au, i64 0, metadata !34, metadata !70), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !35, metadata !70), !dbg !104
  %cmp22 = icmp sgt i32 %N, 0, !dbg !105
  br i1 %cmp22, label %for.body.lr.ph, label %for.end10, !dbg !108

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %N, -1, !dbg !108
  br label %for.body, !dbg !108

for.body:                                         ; preds = %for.inc8, %for.body.lr.ph
  %indvars.iv24 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next25, %for.inc8 ]
  %arrayidx = getelementptr inbounds double* %Au, i64 %indvars.iv24, !dbg !109
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !109, !tbaa !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !36, metadata !70), !dbg !111
  br label %for.body3, !dbg !112

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.body ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !114
  %2 = trunc i64 %indvars.iv24 to i32, !dbg !114
  %call = tail call double @eval_A(i32 %1, i32 %2), !dbg !114
  %arrayidx5 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !116
  %3 = load double* %arrayidx5, align 8, !dbg !116, !tbaa !89
  %mul = fmul double %call, %3, !dbg !114
  %4 = load double* %arrayidx, align 8, !dbg !117, !tbaa !89
  %add = fadd double %4, %mul, !dbg !117
  store double %add, double* %arrayidx, align 8, !dbg !117, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !112
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !112
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !112
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !112

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !108
  %lftr.wideiv26 = trunc i64 %indvars.iv24 to i32, !dbg !108
  %exitcond27 = icmp eq i32 %lftr.wideiv26, %0, !dbg !108
  br i1 %exitcond27, label %for.end10, label %for.body, !dbg !108

for.end10:                                        ; preds = %for.inc8, %entry
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %AtAu) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !39, metadata !70), !dbg !119
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !40, metadata !70), !dbg !120
  tail call void @llvm.dbg.value(metadata double* %AtAu, i64 0, metadata !41, metadata !70), !dbg !121
  %0 = zext i32 %N to i64, !dbg !122
  %vla = alloca double, i64 %0, align 16, !dbg !122
  tail call void @llvm.dbg.declare(metadata double* %vla, metadata !42, metadata !70), !dbg !123
  call void @eval_A_times_u(i32 %N, double* %u, double* %vla), !dbg !124
  call void @eval_At_times_u(i32 %N, double* %vla, double* %AtAu), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !50, metadata !70), !dbg !127
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !51, metadata !70), !dbg !128
  %cmp = icmp eq i32 %argc, 2, !dbg !129
  br i1 %cmp, label %cond.end, label %cond.end.thread, !dbg !130

cond.end.thread:                                  ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !53, metadata !70), !dbg !131
  %vla5867 = alloca [2000 x double], align 16, !dbg !132
  tail call void @llvm.dbg.declare(metadata double* %vla, metadata !54, metadata !70), !dbg !133
  %vla15968 = alloca [2000 x double], align 16, !dbg !132
  tail call void @llvm.dbg.declare(metadata double* %vla1, metadata !55, metadata !70), !dbg !134
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !70), !dbg !135
  %vla15968.sub = getelementptr inbounds [2000 x double]* %vla15968, i64 0, i64 0
  %vla5867.sub = getelementptr inbounds [2000 x double]* %vla5867, i64 0, i64 0
  br label %for.body.lr.ph, !dbg !136

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !138
  %0 = load i8** %arrayidx, align 8, !dbg !138, !tbaa !140
  %call = tail call i32 @atoi(i8* %0) #5, !dbg !142
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !53, metadata !70), !dbg !131
  %1 = zext i32 %call to i64, !dbg !132
  %vla = alloca double, i64 %1, align 16, !dbg !132
  tail call void @llvm.dbg.declare(metadata double* %vla, metadata !54, metadata !70), !dbg !133
  %vla1 = alloca double, i64 %1, align 16, !dbg !132
  tail call void @llvm.dbg.declare(metadata double* %vla1, metadata !55, metadata !70), !dbg !134
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !70), !dbg !135
  %cmp251 = icmp sgt i32 %call, 0, !dbg !143
  br i1 %cmp251, label %for.body.lr.ph, label %for.cond4.preheader, !dbg !136

for.body.lr.ph:                                   ; preds = %cond.end.thread, %cond.end
  %vla166 = phi double* [ %vla15968.sub, %cond.end.thread ], [ %vla1, %cond.end ]
  %vla63 = phi double* [ %vla5867.sub, %cond.end.thread ], [ %vla, %cond.end ]
  %cond62 = phi i32 [ 2000, %cond.end.thread ], [ %call, %cond.end ]
  %2 = add i32 %cond62, -1, !dbg !136
  br label %for.body, !dbg !136

for.cond4.preheader:                              ; preds = %for.body, %cond.end
  %vla165 = phi double* [ %vla1, %cond.end ], [ %vla166, %for.body ]
  %vla64 = phi double* [ %vla, %cond.end ], [ %vla63, %for.body ]
  %cond61 = phi i32 [ %call, %cond.end ], [ %cond62, %for.body ]
  br label %for.body6, !dbg !145

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv54 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next55, %for.body ]
  %arrayidx3 = getelementptr inbounds double* %vla63, i64 %indvars.iv54, !dbg !147
  store double 1.000000e+00, double* %arrayidx3, align 8, !dbg !147, !tbaa !89
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1, !dbg !136
  %lftr.wideiv56 = trunc i64 %indvars.iv54 to i32, !dbg !136
  %exitcond57 = icmp eq i32 %lftr.wideiv56, %2, !dbg !136
  br i1 %exitcond57, label %for.cond4.preheader, label %for.body, !dbg !136

for.cond10.preheader:                             ; preds = %for.body6
  %cmp1145 = icmp sgt i32 %cond61, 0, !dbg !148
  br i1 %cmp1145, label %for.body12.lr.ph, label %for.end25, !dbg !151

for.body12.lr.ph:                                 ; preds = %for.cond10.preheader
  %3 = add i32 %cond61, -1, !dbg !151
  br label %for.body12, !dbg !151

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %i.150 = phi i32 [ 0, %for.cond4.preheader ], [ %inc8, %for.body6 ]
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !152
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !155
  %inc8 = add nuw nsw i32 %i.150, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %inc8, i64 0, metadata !52, metadata !70), !dbg !135
  %exitcond53 = icmp eq i32 %inc8, 10, !dbg !145
  br i1 %exitcond53, label %for.cond10.preheader, label %for.body6, !dbg !145

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body12.lr.ph ], [ %indvars.iv.next, %for.body12 ]
  %vv.048 = phi double [ 0.000000e+00, %for.body12.lr.ph ], [ %add22, %for.body12 ]
  %vBv.047 = phi double [ 0.000000e+00, %for.body12.lr.ph ], [ %add, %for.body12 ]
  %arrayidx14 = getelementptr inbounds double* %vla64, i64 %indvars.iv, !dbg !157
  %4 = load double* %arrayidx14, align 8, !dbg !157, !tbaa !89
  %arrayidx16 = getelementptr inbounds double* %vla165, i64 %indvars.iv, !dbg !159
  %5 = load double* %arrayidx16, align 8, !dbg !159, !tbaa !89
  %mul = fmul double %4, %5, !dbg !157
  %add = fadd double %vBv.047, %mul, !dbg !160
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !56, metadata !70), !dbg !161
  %mul21 = fmul double %5, %5, !dbg !162
  %add22 = fadd double %vv.048, %mul21, !dbg !163
  tail call void @llvm.dbg.value(metadata double %add22, i64 0, metadata !57, metadata !70), !dbg !164
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !151
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !151
  %exitcond = icmp eq i32 %lftr.wideiv, %3, !dbg !151
  br i1 %exitcond, label %for.end25, label %for.body12, !dbg !151

for.end25:                                        ; preds = %for.body12, %for.cond10.preheader
  %vv.0.lcssa = phi double [ 0.000000e+00, %for.cond10.preheader ], [ %add22, %for.body12 ]
  %vBv.0.lcssa = phi double [ 0.000000e+00, %for.cond10.preheader ], [ %add, %for.body12 ]
  %div = fdiv double %vBv.0.lcssa, %vv.0.lcssa, !dbg !165
  %call26 = tail call double @sqrt(double %div) #6, !dbg !166
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), double %call26) #6, !dbg !167
  ret i32 0, !dbg !168
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !66, metadata !70), !dbg !169
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !170
  %conv = trunc i64 %call to i32, !dbg !171
  ret i32 %conv, !dbg !172
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68}
!llvm.ident = !{!69}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c] [DW_LANG_C99]
!1 = !{!"spectral-norm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !18, !30, !37, !46, !58}
!10 = !{!"0x2e\00eval_A\00eval_A\00\0013\000\001\000\000\00256\001\0013", !1, !11, !12, null, double (i32, i32)* @eval_A, null, null, !15} ; [ DW_TAG_subprogram ] [line 13] [def] [eval_A]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!14, !4, !4}
!14 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!15 = !{!16, !17}
!16 = !{!"0x101\00i\0016777229\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [i] [line 13]
!17 = !{!"0x101\00j\0033554445\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [j] [line 13]
!18 = !{!"0x2e\00eval_A_times_u\00eval_A_times_u\00\0015\000\001\000\000\00256\001\0016", !1, !11, !19, null, void (i32, double*, double*)* @eval_A_times_u, null, null, !24} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [eval_A_times_u]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{null, !4, !21, !23}
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = !{!"0x26\00\000\000\000\000\000", null, null, !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!24 = !{!25, !26, !27, !28, !29}
!25 = !{!"0x101\00N\0016777231\000", !18, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 15]
!26 = !{!"0x101\00u\0033554447\000", !18, !11, !21} ; [ DW_TAG_arg_variable ] [u] [line 15]
!27 = !{!"0x101\00Au\0050331663\000", !18, !11, !23} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!28 = !{!"0x100\00i\0017\000", !18, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 17]
!29 = !{!"0x100\00j\0017\000", !18, !11, !4}      ; [ DW_TAG_auto_variable ] [j] [line 17]
!30 = !{!"0x2e\00eval_At_times_u\00eval_At_times_u\00\0025\000\001\000\000\00256\001\0026", !1, !11, !19, null, void (i32, double*, double*)* @eval_At_times_u, null, null, !31} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [eval_At_times_u]
!31 = !{!32, !33, !34, !35, !36}
!32 = !{!"0x101\00N\0016777241\000", !30, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 25]
!33 = !{!"0x101\00u\0033554457\000", !30, !11, !21} ; [ DW_TAG_arg_variable ] [u] [line 25]
!34 = !{!"0x101\00Au\0050331673\000", !30, !11, !23} ; [ DW_TAG_arg_variable ] [Au] [line 25]
!35 = !{!"0x100\00i\0027\000", !30, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 27]
!36 = !{!"0x100\00j\0027\000", !30, !11, !4}      ; [ DW_TAG_auto_variable ] [j] [line 27]
!37 = !{!"0x2e\00eval_AtA_times_u\00eval_AtA_times_u\00\0035\000\001\000\000\00256\001\0036", !1, !11, !19, null, void (i32, double*, double*)* @eval_AtA_times_u, null, null, !38} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [eval_AtA_times_u]
!38 = !{!39, !40, !41, !42}
!39 = !{!"0x101\00N\0016777251\000", !37, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 35]
!40 = !{!"0x101\00u\0033554467\000", !37, !11, !21} ; [ DW_TAG_arg_variable ] [u] [line 35]
!41 = !{!"0x101\00AtAu\0050331683\000", !37, !11, !23} ; [ DW_TAG_arg_variable ] [AtAu] [line 35]
!42 = !{!"0x100\00v\0036\008192", !37, !11, !43}  ; [ DW_TAG_auto_variable ] [v] [line 36]
!43 = !{!"0x1\00\000\000\0064\000\000\000", null, null, !14, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!44 = !{!45}
!45 = !{!"0x21\000\00-1"}                         ; [ DW_TAG_subrange_type ] [unbounded]
!46 = !{!"0x2e\00main\00main\00\0038\000\001\000\000\00256\001\0039", !1, !11, !47, null, i32 (i32, i8**)* @main, null, null, !49} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!4, !4, !5}
!49 = !{!50, !51, !52, !53, !54, !55, !56, !57}
!50 = !{!"0x101\00argc\0016777254\000", !46, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 38]
!51 = !{!"0x101\00argv\0033554470\000", !46, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 38]
!52 = !{!"0x100\00i\0040\000", !46, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 40]
!53 = !{!"0x100\00N\0041\000", !46, !11, !4}      ; [ DW_TAG_auto_variable ] [N] [line 41]
!54 = !{!"0x100\00u\0042\008192", !46, !11, !43}  ; [ DW_TAG_auto_variable ] [u] [line 42]
!55 = !{!"0x100\00v\0042\008192", !46, !11, !43}  ; [ DW_TAG_auto_variable ] [v] [line 42]
!56 = !{!"0x100\00vBv\0042\000", !46, !11, !14}   ; [ DW_TAG_auto_variable ] [vBv] [line 42]
!57 = !{!"0x100\00vv\0042\000", !46, !11, !14}    ; [ DW_TAG_auto_variable ] [vv] [line 42]
!58 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !59, !60, !61, null, i32 (i8*)* @atoi, null, null, !65} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!59 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!60 = !{!"0x29", !59}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{!4, !63}
!63 = !{!"0xf\00\000\0064\0064\000\000", null, null, !64} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!64 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!65 = !{!66}
!66 = !{!"0x101\00__nptr\0016777494\000", !58, !60, !63} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!67 = !{i32 2, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 2}
!69 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!70 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!71 = !MDLocation(line: 13, column: 19, scope: !10)
!72 = !MDLocation(line: 13, column: 26, scope: !10)
!73 = !MDLocation(line: 13, column: 44, scope: !10)
!74 = !MDLocation(line: 13, column: 50, scope: !10)
!75 = !MDLocation(line: 13, column: 43, scope: !10)
!76 = !MDLocation(line: 13, column: 42, scope: !10)
!77 = !MDLocation(line: 13, column: 38, scope: !10)
!78 = !MDLocation(line: 13, column: 31, scope: !10)
!79 = !MDLocation(line: 15, column: 25, scope: !18)
!80 = !MDLocation(line: 15, column: 41, scope: !18)
!81 = !MDLocation(line: 15, column: 53, scope: !18)
!82 = !MDLocation(line: 17, column: 7, scope: !18)
!83 = !MDLocation(line: 18, column: 11, scope: !84)
!84 = !{!"0xb\0018\003\001", !1, !85}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!85 = !{!"0xb\0018\003\000", !1, !18}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!86 = !MDLocation(line: 18, column: 3, scope: !85)
!87 = !MDLocation(line: 20, column: 7, scope: !88)
!88 = !{!"0xb\0019\005\002", !1, !84}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!89 = !{!90, !90, i64 0}
!90 = !{!"double", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = !MDLocation(line: 17, column: 9, scope: !18)
!94 = !MDLocation(line: 21, column: 7, scope: !95)
!95 = !{!"0xb\0021\007\003", !1, !88}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!96 = !MDLocation(line: 21, column: 31, scope: !97)
!97 = !{!"0xb\0021\007\004", !1, !95}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!98 = !MDLocation(line: 21, column: 43, scope: !97)
!99 = !MDLocation(line: 21, column: 24, scope: !97)
!100 = !MDLocation(line: 23, column: 1, scope: !18)
!101 = !MDLocation(line: 25, column: 26, scope: !30)
!102 = !MDLocation(line: 25, column: 42, scope: !30)
!103 = !MDLocation(line: 25, column: 54, scope: !30)
!104 = !MDLocation(line: 27, column: 7, scope: !30)
!105 = !MDLocation(line: 28, column: 11, scope: !106)
!106 = !{!"0xb\0028\003\006", !1, !107}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!107 = !{!"0xb\0028\003\005", !1, !30}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!108 = !MDLocation(line: 28, column: 3, scope: !107)
!109 = !MDLocation(line: 30, column: 7, scope: !110)
!110 = !{!"0xb\0029\005\007", !1, !106}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!111 = !MDLocation(line: 27, column: 9, scope: !30)
!112 = !MDLocation(line: 31, column: 7, scope: !113)
!113 = !{!"0xb\0031\007\008", !1, !110}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!114 = !MDLocation(line: 31, column: 31, scope: !115)
!115 = !{!"0xb\0031\007\009", !1, !113}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!116 = !MDLocation(line: 31, column: 43, scope: !115)
!117 = !MDLocation(line: 31, column: 24, scope: !115)
!118 = !MDLocation(line: 33, column: 1, scope: !30)
!119 = !MDLocation(line: 35, column: 27, scope: !37)
!120 = !MDLocation(line: 35, column: 43, scope: !37)
!121 = !MDLocation(line: 35, column: 55, scope: !37)
!122 = !MDLocation(line: 36, column: 3, scope: !37)
!123 = !MDLocation(line: 36, column: 10, scope: !37)
!124 = !MDLocation(line: 36, column: 16, scope: !37)
!125 = !MDLocation(line: 36, column: 39, scope: !37)
!126 = !MDLocation(line: 36, column: 66, scope: !37)
!127 = !MDLocation(line: 38, column: 14, scope: !46)
!128 = !MDLocation(line: 38, column: 26, scope: !46)
!129 = !MDLocation(line: 41, column: 13, scope: !46)
!130 = !MDLocation(line: 41, column: 12, scope: !46)
!131 = !MDLocation(line: 41, column: 7, scope: !46)
!132 = !MDLocation(line: 42, column: 3, scope: !46)
!133 = !MDLocation(line: 42, column: 10, scope: !46)
!134 = !MDLocation(line: 42, column: 15, scope: !46)
!135 = !MDLocation(line: 40, column: 7, scope: !46)
!136 = !MDLocation(line: 43, column: 3, scope: !137)
!137 = !{!"0xb\0043\003\0010", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!138 = !MDLocation(line: 41, column: 31, scope: !139)
!139 = !{!"0xb\001", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!140 = !{!141, !141, i64 0}
!141 = !{!"any pointer", !91, i64 0}
!142 = !MDLocation(line: 41, column: 26, scope: !46)
!143 = !MDLocation(line: 43, column: 11, scope: !144)
!144 = !{!"0xb\0043\003\0011", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!145 = !MDLocation(line: 44, column: 3, scope: !146)
!146 = !{!"0xb\0044\003\0012", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!147 = !MDLocation(line: 43, column: 20, scope: !144)
!148 = !MDLocation(line: 50, column: 11, scope: !149)
!149 = !{!"0xb\0050\003\0016", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!150 = !{!"0xb\0050\003\0015", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!151 = !MDLocation(line: 50, column: 3, scope: !150)
!152 = !MDLocation(line: 46, column: 7, scope: !153)
!153 = !{!"0xb\0045\005\0014", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!154 = !{!"0xb\0044\003\0013", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!155 = !MDLocation(line: 47, column: 7, scope: !153)
!156 = !MDLocation(line: 44, column: 16, scope: !154)
!157 = !MDLocation(line: 50, column: 27, scope: !158)
!158 = !{!"0xb\0050\0020\0017", !1, !149}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!159 = !MDLocation(line: 50, column: 32, scope: !158)
!160 = !MDLocation(line: 50, column: 22, scope: !158)
!161 = !MDLocation(line: 42, column: 20, scope: !46)
!162 = !MDLocation(line: 50, column: 42, scope: !158)
!163 = !MDLocation(line: 50, column: 38, scope: !158)
!164 = !MDLocation(line: 42, column: 24, scope: !46)
!165 = !MDLocation(line: 51, column: 25, scope: !46)
!166 = !MDLocation(line: 51, column: 20, scope: !46)
!167 = !MDLocation(line: 51, column: 3, scope: !46)
!168 = !MDLocation(line: 53, column: 1, scope: !46)
!169 = !MDLocation(line: 278, column: 1, scope: !58)
!170 = !MDLocation(line: 280, column: 16, scope: !58)
!171 = !MDLocation(line: 280, column: 10, scope: !58)
!172 = !MDLocation(line: 280, column: 3, scope: !58)
