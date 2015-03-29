; ModuleID = 'array.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define noalias double** @new_Array2D_double(i32 %M, i32 %N) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !15, metadata !47), !dbg !48
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !16, metadata !47), !dbg !49
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !17, metadata !47), !dbg !50
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !47), !dbg !51
  %conv = sext i32 %M to i64, !dbg !52
  %mul = shl nsw i64 %conv, 3, !dbg !53
  %call = tail call noalias i8* @malloc(i64 %mul) #3, !dbg !54
  %0 = bitcast i8* %call to double**, !dbg !55
  tail call void @llvm.dbg.value(metadata double** %0, i64 0, metadata !19, metadata !47), !dbg !56
  %cmp = icmp eq i8* %call, null, !dbg !57
  br i1 %cmp, label %return, label %for.cond.preheader, !dbg !59

for.cond.preheader:                               ; preds = %entry
  %cmp240 = icmp sgt i32 %M, 0, !dbg !60
  br i1 %cmp240, label %for.body.lr.ph, label %return, !dbg !63

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %conv4 = sext i32 %N to i64, !dbg !64
  %mul5 = shl nsw i64 %conv4, 3, !dbg !64
  br label %for.body, !dbg !63

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv43 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next44, %for.inc ]
  %call6 = tail call noalias i8* @malloc(i64 %mul5) #3, !dbg !66
  %arrayidx = getelementptr inbounds double** %0, i64 %indvars.iv43, !dbg !67
  %1 = bitcast double** %arrayidx to i8**, !dbg !67
  store i8* %call6, i8** %1, align 8, !dbg !67, !tbaa !68
  %cmp9 = icmp eq i8* %call6, null, !dbg !72
  br i1 %cmp9, label %for.cond14.preheader, label %for.inc, !dbg !74

for.cond14.preheader:                             ; preds = %for.body
  %indvars.iv43.lcssa = phi i64 [ %indvars.iv43, %for.body ]
  %2 = trunc i64 %indvars.iv43.lcssa to i32, !dbg !75
  %cmp1538 = icmp slt i32 %2, 2, !dbg !75
  br i1 %cmp1538, label %for.body17.lr.ph, label %for.end22, !dbg !82

for.body17.lr.ph:                                 ; preds = %for.cond14.preheader
  %sext = shl i64 %indvars.iv43.lcssa, 32
  %3 = ashr exact i64 %sext, 32
  br label %for.body17, !dbg !82

for.inc:                                          ; preds = %for.body
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1, !dbg !63
  %cmp2 = icmp slt i64 %indvars.iv.next44, %conv, !dbg !60
  br i1 %cmp2, label %for.body, label %return.loopexit, !dbg !63

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %indvars.iv = phi i64 [ %3, %for.body17.lr.ph ], [ %indvars.iv.next, %for.body17 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !82
  %arrayidx19 = getelementptr inbounds double** %0, i64 %indvars.iv.next, !dbg !83
  %4 = bitcast double** %arrayidx19 to i8**, !dbg !83
  %5 = load i8** %4, align 8, !dbg !83, !tbaa !68
  tail call void @free(i8* %5) #3, !dbg !84
  %cmp15 = icmp slt i64 %indvars.iv, 3, !dbg !75
  br i1 %cmp15, label %for.body17, label %for.end22.loopexit, !dbg !82

for.end22.loopexit:                               ; preds = %for.body17
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %for.cond14.preheader
  tail call void @free(i8* %call) #3, !dbg !85
  br label %return, !dbg !86

return.loopexit:                                  ; preds = %for.inc
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond.preheader, %entry, %for.end22
  %retval.0 = phi double** [ null, %for.end22 ], [ null, %entry ], [ %0, %for.cond.preheader ], [ %0, %return.loopexit ]
  ret double** %retval.0, !dbg !87
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @Array2D_double_delete(i32 %M, i32 %N, double** %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !24, metadata !47), !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !25, metadata !47), !dbg !89
  tail call void @llvm.dbg.value(metadata double** %A, i64 0, metadata !26, metadata !47), !dbg !90
  %cmp = icmp eq double** %A, null, !dbg !91
  br i1 %cmp, label %return, label %for.cond.preheader, !dbg !93

for.cond.preheader:                               ; preds = %entry
  %cmp16 = icmp sgt i32 %M, 0, !dbg !94
  br i1 %cmp16, label %for.body.lr.ph, label %for.end, !dbg !97

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %0 = add i32 %M, -1, !dbg !97
  br label %for.body, !dbg !97

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds double** %A, i64 %indvars.iv, !dbg !98
  %1 = bitcast double** %arrayidx to i8**, !dbg !98
  %2 = load i8** %1, align 8, !dbg !98, !tbaa !68
  tail call void @free(i8* %2) #3, !dbg !99
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !97
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !97
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !97
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !dbg !97

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader
  %3 = bitcast double** %A to i8*, !dbg !100
  tail call void @free(i8* %3) #3, !dbg !101
  br label %return, !dbg !102

return:                                           ; preds = %entry, %for.end
  ret void, !dbg !103
}

; Function Attrs: nounwind uwtable
define void @Array2D_double_copy(i32 %M, i32 %N, double** nocapture readonly %B, double** nocapture readonly %A) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !32, metadata !47), !dbg !105
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !33, metadata !47), !dbg !106
  tail call void @llvm.dbg.value(metadata double** %B, i64 0, metadata !34, metadata !47), !dbg !107
  tail call void @llvm.dbg.value(metadata double** %A, i64 0, metadata !35, metadata !47), !dbg !108
  %and = and i32 %N, 3, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %and, i64 0, metadata !36, metadata !47), !dbg !110
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !37, metadata !47), !dbg !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !38, metadata !47), !dbg !112
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !37, metadata !47), !dbg !111
  %cmp70 = icmp sgt i32 %M, 0, !dbg !113
  br i1 %cmp70, label %for.body.lr.ph, label %for.end39, !dbg !114

for.body.lr.ph:                                   ; preds = %entry
  %cmp466 = icmp eq i32 %and, 0, !dbg !115
  %cmp1168 = icmp slt i32 %and, %N, !dbg !118
  br i1 %cmp466, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge, label %for.body.lr.ph.split.us

for.body.lr.ph.for.body.lr.ph.split_crit_edge:    ; preds = %for.body.lr.ph
  br i1 %cmp1168, label %for.body.lr.ph.split.split.us, label %for.end39

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  %0 = zext i32 %N to i64
  %1 = and i32 %N, 3
  %2 = add nsw i32 %1, -1, !dbg !114
  %3 = and i64 %0, 3
  %4 = add i32 %M, -1, !dbg !114
  %5 = and i32 %N, 3
  %6 = add nsw i32 %5, -1, !dbg !114
  %7 = zext i32 %6 to i64
  %8 = add nuw nsw i64 %7, 1, !dbg !114
  %9 = and i32 %N, 3
  %10 = add nsw i32 %9, -1, !dbg !114
  %11 = zext i32 %10 to i64
  %12 = trunc i32 %N to i2
  %13 = zext i2 %12 to i32
  %14 = add i32 %13, -1, !dbg !114
  %15 = zext i32 %14 to i64
  %16 = add i64 %15, 1, !dbg !114
  %17 = lshr i64 %16, 2, !dbg !114
  %18 = mul i64 %17, 4, !dbg !114
  %19 = add i64 %18, -4, !dbg !114
  %20 = lshr i64 %19, 2, !dbg !114
  %21 = add i64 %20, 1, !dbg !114
  %22 = trunc i32 %N to i2
  %23 = zext i2 %22 to i32
  br label %for.body5.lr.ph.us, !dbg !114

for.inc37.us.loopexit:                            ; preds = %for.body12.us
  br label %for.inc37.us

for.inc37.us:                                     ; preds = %for.inc37.us.loopexit, %for.cond10.preheader.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1, !dbg !114
  %lftr.wideiv119 = trunc i64 %indvars.iv117 to i32, !dbg !114
  %exitcond120 = icmp eq i32 %lftr.wideiv119, %4, !dbg !114
  br i1 %exitcond120, label %for.end39.loopexit148, label %for.body5.lr.ph.us, !dbg !114

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.body12.us ], [ %3, %for.body12.us.preheader ]
  %j.169.us = phi i32 [ %add35.us, %for.body12.us ], [ %and, %for.body12.us.preheader ]
  %arrayidx14.us = getelementptr inbounds double* %33, i64 %indvars.iv111, !dbg !121
  %24 = load double* %arrayidx14.us, align 8, !dbg !121, !tbaa !123
  %arrayidx16.us = getelementptr inbounds double* %32, i64 %indvars.iv111, !dbg !125
  store double %24, double* %arrayidx16.us, align 8, !dbg !125, !tbaa !123
  %add.us = add nuw nsw i32 %j.169.us, 1, !dbg !126
  %idxprom17.us = sext i32 %add.us to i64, !dbg !127
  %arrayidx18.us = getelementptr inbounds double* %33, i64 %idxprom17.us, !dbg !127
  %25 = load double* %arrayidx18.us, align 8, !dbg !127, !tbaa !123
  %arrayidx21.us = getelementptr inbounds double* %32, i64 %idxprom17.us, !dbg !128
  store double %25, double* %arrayidx21.us, align 8, !dbg !128, !tbaa !123
  %add22.us = add nuw nsw i32 %j.169.us, 2, !dbg !129
  %idxprom23.us = sext i32 %add22.us to i64, !dbg !130
  %arrayidx24.us = getelementptr inbounds double* %33, i64 %idxprom23.us, !dbg !130
  %26 = load double* %arrayidx24.us, align 8, !dbg !130, !tbaa !123
  %arrayidx27.us = getelementptr inbounds double* %32, i64 %idxprom23.us, !dbg !131
  store double %26, double* %arrayidx27.us, align 8, !dbg !131, !tbaa !123
  %add28.us = add nuw nsw i32 %j.169.us, 3, !dbg !132
  %idxprom29.us = sext i32 %add28.us to i64, !dbg !133
  %arrayidx30.us = getelementptr inbounds double* %33, i64 %idxprom29.us, !dbg !133
  %27 = load double* %arrayidx30.us, align 8, !dbg !133, !tbaa !123
  %arrayidx33.us = getelementptr inbounds double* %32, i64 %idxprom29.us, !dbg !134
  store double %27, double* %arrayidx33.us, align 8, !dbg !134, !tbaa !123
  %add35.us = add nuw nsw i32 %j.169.us, 4, !dbg !135
  tail call void @llvm.dbg.value(metadata i32 %add35.us, i64 0, metadata !38, metadata !47), !dbg !112
  %cmp11.us = icmp slt i32 %add35.us, %N, !dbg !118
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 4, !dbg !136
  br i1 %cmp11.us, label %for.body12.us, label %for.inc37.us.loopexit, !dbg !136

for.body5.us:                                     ; preds = %for.body5.us, %for.body5.us.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body5.us.preheader.split.split ], [ %indvars.iv.next.3, %for.body5.us ]
  %arrayidx7.us = getelementptr inbounds double* %33, i64 %indvars.iv, !dbg !137
  %28 = load double* %arrayidx7.us, align 8, !dbg !137, !tbaa !123
  %arrayidx9.us = getelementptr inbounds double* %32, i64 %indvars.iv, !dbg !138
  store double %28, double* %arrayidx9.us, align 8, !dbg !138, !tbaa !123
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !139
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !139
  %arrayidx7.us.1 = getelementptr inbounds double* %33, i64 %indvars.iv.next, !dbg !137
  %29 = load double* %arrayidx7.us.1, align 8, !dbg !137, !tbaa !123
  %arrayidx9.us.1 = getelementptr inbounds double* %32, i64 %indvars.iv.next, !dbg !138
  store double %29, double* %arrayidx9.us.1, align 8, !dbg !138, !tbaa !123
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !139
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !139
  %arrayidx7.us.2 = getelementptr inbounds double* %33, i64 %indvars.iv.next.1, !dbg !137
  %30 = load double* %arrayidx7.us.2, align 8, !dbg !137, !tbaa !123
  %arrayidx9.us.2 = getelementptr inbounds double* %32, i64 %indvars.iv.next.1, !dbg !138
  store double %30, double* %arrayidx9.us.2, align 8, !dbg !138, !tbaa !123
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !139
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !139
  %arrayidx7.us.3 = getelementptr inbounds double* %33, i64 %indvars.iv.next.2, !dbg !137
  %31 = load double* %arrayidx7.us.3, align 8, !dbg !137, !tbaa !123
  %arrayidx9.us.3 = getelementptr inbounds double* %32, i64 %indvars.iv.next.2, !dbg !138
  store double %31, double* %arrayidx9.us.3, align 8, !dbg !138, !tbaa !123
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !139
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !139
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %2, !dbg !139
  br i1 %exitcond.3, label %for.cond10.preheader.us.loopexit.unr-lcssa, label %for.body5.us, !dbg !139, !llvm.loop !140

for.cond10.preheader.us.loopexit.unr-lcssa:       ; preds = %for.body5.us
  br label %for.cond10.preheader.us.loopexit

for.cond10.preheader.us.loopexit:                 ; preds = %for.body5.us.preheader.split, %for.cond10.preheader.us.loopexit.unr-lcssa
  br label %for.cond10.preheader.us

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.loopexit, %middle.block
  br i1 %cmp1168, label %for.body12.us.preheader, label %for.inc37.us, !dbg !136

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us, !dbg !121

for.body5.lr.ph.us:                               ; preds = %for.body.lr.ph.split.us, %for.inc37.us
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.inc37.us ], [ 0, %for.body.lr.ph.split.us ]
  %arrayidx.us = getelementptr inbounds double** %B, i64 %indvars.iv117, !dbg !143
  %32 = load double** %arrayidx.us, align 8, !dbg !143, !tbaa !68
  tail call void @llvm.dbg.value(metadata double* %32, i64 0, metadata !39, metadata !47), !dbg !144
  %arrayidx2.us = getelementptr inbounds double** %A, i64 %indvars.iv117, !dbg !145
  %33 = load double** %arrayidx2.us, align 8, !dbg !145, !tbaa !68
  tail call void @llvm.dbg.value(metadata double* %33, i64 0, metadata !43, metadata !47), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !38, metadata !47), !dbg !112
  %end.idx = add nuw nsw i64 %7, 1, !dbg !139
  %n.vec = and i64 %8, 8589934588, !dbg !139
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !139
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body5.lr.ph.us
  %scevgep136 = getelementptr double* %33, i64 %11
  %bound0 = icmp ule double* %32, %scevgep136
  %scevgep = getelementptr double* %32, i64 %11
  %bound1 = icmp ule double* %33, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %xtraiter = and i64 %21, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %21, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol, !dbg !137

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !139
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %34 = getelementptr inbounds double* %33, i64 %index.prol, !dbg !137
  %35 = bitcast double* %34 to <2 x double>*, !dbg !137
  %wide.load.prol = load <2 x double>* %35, align 8, !dbg !137, !tbaa !123
  %.sum146.prol = or i64 %index.prol, 2, !dbg !137
  %36 = getelementptr double* %33, i64 %.sum146.prol, !dbg !137
  %37 = bitcast double* %36 to <2 x double>*, !dbg !137
  %wide.load139.prol = load <2 x double>* %37, align 8, !dbg !137, !tbaa !123
  %38 = getelementptr inbounds double* %32, i64 %index.prol, !dbg !138
  %39 = bitcast double* %38 to <2 x double>*, !dbg !138
  store <2 x double> %wide.load.prol, <2 x double>* %39, align 8, !dbg !138, !tbaa !123
  %.sum147.prol = or i64 %index.prol, 2, !dbg !138
  %40 = getelementptr double* %32, i64 %.sum147.prol, !dbg !138
  %41 = bitcast double* %40 to <2 x double>*, !dbg !138
  store <2 x double> %wide.load139.prol, <2 x double>* %41, align 8, !dbg !138, !tbaa !123
  %index.next.prol = add i64 %index.prol, 4, !dbg !139
  %42 = icmp eq i64 %index.next.prol, %n.vec, !dbg !139
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !139
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !139
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !147

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %43 = icmp ult i64 %21, 2
  br i1 %43, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !137

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !139
  %44 = getelementptr inbounds double* %33, i64 %index, !dbg !137
  %45 = bitcast double* %44 to <2 x double>*, !dbg !137
  %wide.load = load <2 x double>* %45, align 8, !dbg !137, !tbaa !123
  %.sum146 = or i64 %index, 2, !dbg !137
  %46 = getelementptr double* %33, i64 %.sum146, !dbg !137
  %47 = bitcast double* %46 to <2 x double>*, !dbg !137
  %wide.load139 = load <2 x double>* %47, align 8, !dbg !137, !tbaa !123
  %48 = getelementptr inbounds double* %32, i64 %index, !dbg !138
  %49 = bitcast double* %48 to <2 x double>*, !dbg !138
  store <2 x double> %wide.load, <2 x double>* %49, align 8, !dbg !138, !tbaa !123
  %.sum147 = or i64 %index, 2, !dbg !138
  %50 = getelementptr double* %32, i64 %.sum147, !dbg !138
  %51 = bitcast double* %50 to <2 x double>*, !dbg !138
  store <2 x double> %wide.load139, <2 x double>* %51, align 8, !dbg !138, !tbaa !123
  %index.next = add i64 %index, 4, !dbg !139
  %52 = getelementptr inbounds double* %33, i64 %index.next, !dbg !137
  %53 = bitcast double* %52 to <2 x double>*, !dbg !137
  %wide.load.1 = load <2 x double>* %53, align 8, !dbg !137, !tbaa !123
  %.sum146.1 = or i64 %index.next, 2, !dbg !137
  %54 = getelementptr double* %33, i64 %.sum146.1, !dbg !137
  %55 = bitcast double* %54 to <2 x double>*, !dbg !137
  %wide.load139.1 = load <2 x double>* %55, align 8, !dbg !137, !tbaa !123
  %56 = getelementptr inbounds double* %32, i64 %index.next, !dbg !138
  %57 = bitcast double* %56 to <2 x double>*, !dbg !138
  store <2 x double> %wide.load.1, <2 x double>* %57, align 8, !dbg !138, !tbaa !123
  %.sum147.1 = or i64 %index.next, 2, !dbg !138
  %58 = getelementptr double* %32, i64 %.sum147.1, !dbg !138
  %59 = bitcast double* %58 to <2 x double>*, !dbg !138
  store <2 x double> %wide.load139.1, <2 x double>* %59, align 8, !dbg !138, !tbaa !123
  %index.next.1 = add i64 %index.next, 4, !dbg !139
  %60 = icmp eq i64 %index.next.1, %n.vec, !dbg !139
  br i1 %60, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !139, !llvm.loop !149

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body5.lr.ph.us
  %resume.val = phi i64 [ 0, %for.body5.lr.ph.us ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond10.preheader.us, label %for.body5.us.preheader

for.body5.us.preheader:                           ; preds = %middle.block
  %61 = trunc i64 %resume.val to i32
  %62 = sub i32 %23, %61
  %xtraiter149 = and i32 %62, 3
  %lcmp.mod150 = icmp ne i32 %xtraiter149, 0
  %lcmp.overflow151 = icmp eq i32 %62, 0
  %lcmp.or152 = or i1 %lcmp.overflow151, %lcmp.mod150
  br i1 %lcmp.or152, label %for.body5.us.prol.preheader, label %for.body5.us.preheader.split

for.body5.us.prol.preheader:                      ; preds = %for.body5.us.preheader
  br label %for.body5.us.prol, !dbg !137

for.body5.us.prol:                                ; preds = %for.body5.us.prol.preheader, %for.body5.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body5.us.prol ], [ %resume.val, %for.body5.us.prol.preheader ]
  %prol.iter153 = phi i32 [ %prol.iter153.sub, %for.body5.us.prol ], [ %xtraiter149, %for.body5.us.prol.preheader ]
  %arrayidx7.us.prol = getelementptr inbounds double* %33, i64 %indvars.iv.prol, !dbg !137
  %63 = load double* %arrayidx7.us.prol, align 8, !dbg !137, !tbaa !123
  %arrayidx9.us.prol = getelementptr inbounds double* %32, i64 %indvars.iv.prol, !dbg !138
  store double %63, double* %arrayidx9.us.prol, align 8, !dbg !138, !tbaa !123
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !139
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !139
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %2, !dbg !139
  %prol.iter153.sub = sub i32 %prol.iter153, 1, !dbg !139
  %prol.iter153.cmp = icmp ne i32 %prol.iter153.sub, 0, !dbg !139
  br i1 %prol.iter153.cmp, label %for.body5.us.prol, label %for.body5.us.preheader.split.loopexit, !llvm.loop !150

for.body5.us.preheader.split.loopexit:            ; preds = %for.body5.us.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body5.us.prol ]
  br label %for.body5.us.preheader.split

for.body5.us.preheader.split:                     ; preds = %for.body5.us.preheader.split.loopexit, %for.body5.us.preheader
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body5.us.preheader ], [ %indvars.iv.unr.ph, %for.body5.us.preheader.split.loopexit ]
  %64 = icmp ult i32 %62, 4
  br i1 %64, label %for.cond10.preheader.us.loopexit, label %for.body5.us.preheader.split.split

for.body5.us.preheader.split.split:               ; preds = %for.body5.us.preheader.split
  br label %for.body5.us, !dbg !137

for.body.lr.ph.split.split.us:                    ; preds = %for.body.lr.ph.for.body.lr.ph.split_crit_edge
  %65 = zext i32 %N to i64
  %66 = and i64 %65, 3
  %67 = add i32 %M, -1, !dbg !114
  br label %for.body12.lr.ph.us109, !dbg !114

for.inc37.us77:                                   ; preds = %for.body12.us80
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1, !dbg !114
  %lftr.wideiv129 = trunc i64 %indvars.iv127 to i32, !dbg !114
  %exitcond130 = icmp eq i32 %lftr.wideiv129, %67, !dbg !114
  br i1 %exitcond130, label %for.end39.loopexit, label %for.body12.lr.ph.us109, !dbg !114

for.body12.us80:                                  ; preds = %for.body12.lr.ph.us109, %for.body12.us80
  %indvars.iv121 = phi i64 [ %66, %for.body12.lr.ph.us109 ], [ %indvars.iv.next122, %for.body12.us80 ]
  %j.169.us81 = phi i32 [ 0, %for.body12.lr.ph.us109 ], [ %add35.us97, %for.body12.us80 ]
  %arrayidx14.us83 = getelementptr inbounds double* %73, i64 %indvars.iv121, !dbg !121
  %68 = load double* %arrayidx14.us83, align 8, !dbg !121, !tbaa !123
  %arrayidx16.us84 = getelementptr inbounds double* %72, i64 %indvars.iv121, !dbg !125
  store double %68, double* %arrayidx16.us84, align 8, !dbg !125, !tbaa !123
  %add.us85131 = or i32 %j.169.us81, 1, !dbg !126
  %idxprom17.us86 = sext i32 %add.us85131 to i64, !dbg !127
  %arrayidx18.us87 = getelementptr inbounds double* %73, i64 %idxprom17.us86, !dbg !127
  %69 = load double* %arrayidx18.us87, align 8, !dbg !127, !tbaa !123
  %arrayidx21.us88 = getelementptr inbounds double* %72, i64 %idxprom17.us86, !dbg !128
  store double %69, double* %arrayidx21.us88, align 8, !dbg !128, !tbaa !123
  %add22.us89132 = or i32 %j.169.us81, 2, !dbg !129
  %idxprom23.us90 = sext i32 %add22.us89132 to i64, !dbg !130
  %arrayidx24.us91 = getelementptr inbounds double* %73, i64 %idxprom23.us90, !dbg !130
  %70 = load double* %arrayidx24.us91, align 8, !dbg !130, !tbaa !123
  %arrayidx27.us92 = getelementptr inbounds double* %72, i64 %idxprom23.us90, !dbg !131
  store double %70, double* %arrayidx27.us92, align 8, !dbg !131, !tbaa !123
  %add28.us93133 = or i32 %j.169.us81, 3, !dbg !132
  %idxprom29.us94 = sext i32 %add28.us93133 to i64, !dbg !133
  %arrayidx30.us95 = getelementptr inbounds double* %73, i64 %idxprom29.us94, !dbg !133
  %71 = load double* %arrayidx30.us95, align 8, !dbg !133, !tbaa !123
  %arrayidx33.us96 = getelementptr inbounds double* %72, i64 %idxprom29.us94, !dbg !134
  store double %71, double* %arrayidx33.us96, align 8, !dbg !134, !tbaa !123
  %add35.us97 = add nuw nsw i32 %j.169.us81, 4, !dbg !135
  tail call void @llvm.dbg.value(metadata i32 %add35.us97, i64 0, metadata !38, metadata !47), !dbg !112
  %cmp11.us98 = icmp slt i32 %add35.us97, %N, !dbg !118
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 4, !dbg !136
  br i1 %cmp11.us98, label %for.body12.us80, label %for.inc37.us77, !dbg !136

for.body12.lr.ph.us109:                           ; preds = %for.inc37.us77, %for.body.lr.ph.split.split.us
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.inc37.us77 ], [ 0, %for.body.lr.ph.split.split.us ]
  %arrayidx.us75 = getelementptr inbounds double** %B, i64 %indvars.iv127, !dbg !143
  %72 = load double** %arrayidx.us75, align 8, !dbg !143, !tbaa !68
  tail call void @llvm.dbg.value(metadata double* %72, i64 0, metadata !39, metadata !47), !dbg !144
  %arrayidx2.us76 = getelementptr inbounds double** %A, i64 %indvars.iv127, !dbg !145
  %73 = load double** %arrayidx2.us76, align 8, !dbg !145, !tbaa !68
  tail call void @llvm.dbg.value(metadata double* %73, i64 0, metadata !43, metadata !47), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !38, metadata !47), !dbg !112
  br label %for.body12.us80, !dbg !136

for.end39.loopexit:                               ; preds = %for.inc37.us77
  br label %for.end39

for.end39.loopexit148:                            ; preds = %for.inc37.us
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit148, %for.end39.loopexit, %for.body.lr.ph.for.body.lr.ph.split_crit_edge, %entry
  ret void, !dbg !151
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!44, !45}
!llvm.ident = !{!46}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !8, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c] [DW_LANG_C99]
!1 = !{!"array.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4, !7, !5}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!9, !20, !28}
!9 = !{!"0x2e\00new_Array2D_double\00new_Array2D_double\00\0010\000\001\000\000\00256\001\0011", !1, !10, !11, null, double** (i32, i32)* @new_Array2D_double, null, null, !14} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [new_Array2D_double]
!10 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !12, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!4, !13, !13}
!13 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = !{!15, !16, !17, !18, !19}
!15 = !{!"0x101\00M\0016777226\000", !9, !10, !13} ; [ DW_TAG_arg_variable ] [M] [line 10]
!16 = !{!"0x101\00N\0033554442\000", !9, !10, !13} ; [ DW_TAG_arg_variable ] [N] [line 10]
!17 = !{!"0x100\00i\0012\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [i] [line 12]
!18 = !{!"0x100\00failed\0013\000", !9, !10, !13} ; [ DW_TAG_auto_variable ] [failed] [line 13]
!19 = !{!"0x100\00A\0015\000", !9, !10, !4}       ; [ DW_TAG_auto_variable ] [A] [line 15]
!20 = !{!"0x2e\00Array2D_double_delete\00Array2D_double_delete\00\0044\000\001\000\000\00256\001\0045", !1, !10, !21, null, void (i32, i32, double**)* @Array2D_double_delete, null, null, !23} ; [ DW_TAG_subprogram ] [line 44] [def] [scope 45] [Array2D_double_delete]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{null, !13, !13, !4}
!23 = !{!24, !25, !26, !27}
!24 = !{!"0x101\00M\0016777260\000", !20, !10, !13} ; [ DW_TAG_arg_variable ] [M] [line 44]
!25 = !{!"0x101\00N\0033554476\000", !20, !10, !13} ; [ DW_TAG_arg_variable ] [N] [line 44]
!26 = !{!"0x101\00A\0050331692\000", !20, !10, !4} ; [ DW_TAG_arg_variable ] [A] [line 44]
!27 = !{!"0x100\00i\0046\000", !20, !10, !13}     ; [ DW_TAG_auto_variable ] [i] [line 46]
!28 = !{!"0x2e\00Array2D_double_copy\00Array2D_double_copy\00\0056\000\001\000\000\00256\001\0057", !1, !10, !29, null, void (i32, i32, double**, double**)* @Array2D_double_copy, null, null, !31} ; [ DW_TAG_subprogram ] [line 56] [def] [scope 57] [Array2D_double_copy]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !13, !13, !4, !4}
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !43}
!32 = !{!"0x101\00M\0016777272\000", !28, !10, !13} ; [ DW_TAG_arg_variable ] [M] [line 56]
!33 = !{!"0x101\00N\0033554488\000", !28, !10, !13} ; [ DW_TAG_arg_variable ] [N] [line 56]
!34 = !{!"0x101\00B\0050331704\000", !28, !10, !4} ; [ DW_TAG_arg_variable ] [B] [line 56]
!35 = !{!"0x101\00A\0067108920\000", !28, !10, !4} ; [ DW_TAG_arg_variable ] [A] [line 56]
!36 = !{!"0x100\00remainder\0059\000", !28, !10, !13} ; [ DW_TAG_auto_variable ] [remainder] [line 59]
!37 = !{!"0x100\00i\0060\000", !28, !10, !13}     ; [ DW_TAG_auto_variable ] [i] [line 60]
!38 = !{!"0x100\00j\0061\000", !28, !10, !13}     ; [ DW_TAG_auto_variable ] [j] [line 61]
!39 = !{!"0x100\00Bi\0065\000", !40, !10, !5}     ; [ DW_TAG_auto_variable ] [Bi] [line 65]
!40 = !{!"0xb\0064\009\0015", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!41 = !{!"0xb\0063\009\0014", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!42 = !{!"0xb\0063\009\0013", !1, !28}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!43 = !{!"0x100\00Ai\0066\000", !40, !10, !5}     ; [ DW_TAG_auto_variable ] [Ai] [line 66]
!44 = !{i32 2, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 2}
!46 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!47 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!48 = !MDLocation(line: 10, column: 33, scope: !9)
!49 = !MDLocation(line: 10, column: 40, scope: !9)
!50 = !MDLocation(line: 12, column: 9, scope: !9)
!51 = !MDLocation(line: 13, column: 9, scope: !9)
!52 = !MDLocation(line: 15, column: 52, scope: !9)
!53 = !MDLocation(line: 15, column: 36, scope: !9)
!54 = !MDLocation(line: 15, column: 29, scope: !9)
!55 = !MDLocation(line: 15, column: 18, scope: !9)
!56 = !MDLocation(line: 15, column: 14, scope: !9)
!57 = !MDLocation(line: 16, column: 9, scope: !58)
!58 = !{!"0xb\0016\009\000", !1, !9}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!59 = !MDLocation(line: 16, column: 9, scope: !9)
!60 = !MDLocation(line: 19, column: 15, scope: !61)
!61 = !{!"0xb\0019\005\002", !1, !62}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!62 = !{!"0xb\0019\005\001", !1, !9}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!63 = !MDLocation(line: 19, column: 5, scope: !62)
!64 = !MDLocation(line: 21, column: 33, scope: !65)
!65 = !{!"0xb\0020\005\003", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!66 = !MDLocation(line: 21, column: 26, scope: !65)
!67 = !MDLocation(line: 21, column: 9, scope: !65)
!68 = !{!69, !69, i64 0}
!69 = !{!"any pointer", !70, i64 0}
!70 = !{!"omnipotent char", !71, i64 0}
!71 = !{!"Simple C/C++ TBAA"}
!72 = !MDLocation(line: 22, column: 13, scope: !73)
!73 = !{!"0xb\0022\0013\004", !1, !65}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!74 = !MDLocation(line: 22, column: 13, scope: !65)
!75 = !MDLocation(line: 36, column: 16, scope: !76)
!76 = !{!"0xb\002", !1, !77}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!77 = !{!"0xb\001", !1, !78}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!78 = !{!"0xb\0036\009\009", !1, !79}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!79 = !{!"0xb\0036\009\008", !1, !80}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!80 = !{!"0xb\0034\005\007", !1, !81}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!81 = !{!"0xb\0033\009\006", !1, !9}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!82 = !MDLocation(line: 36, column: 9, scope: !79)
!83 = !MDLocation(line: 37, column: 18, scope: !78)
!84 = !MDLocation(line: 37, column: 13, scope: !78)
!85 = !MDLocation(line: 38, column: 9, scope: !80)
!86 = !MDLocation(line: 39, column: 9, scope: !80)
!87 = !MDLocation(line: 43, column: 1, scope: !9)
!88 = !MDLocation(line: 44, column: 32, scope: !20)
!89 = !MDLocation(line: 44, column: 39, scope: !20)
!90 = !MDLocation(line: 44, column: 51, scope: !20)
!91 = !MDLocation(line: 47, column: 9, scope: !92)
!92 = !{!"0xb\0047\009\0010", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!93 = !MDLocation(line: 47, column: 9, scope: !20)
!94 = !MDLocation(line: 49, column: 15, scope: !95)
!95 = !{!"0xb\0049\005\0012", !1, !96}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!96 = !{!"0xb\0049\005\0011", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!97 = !MDLocation(line: 49, column: 5, scope: !96)
!98 = !MDLocation(line: 50, column: 14, scope: !95)
!99 = !MDLocation(line: 50, column: 9, scope: !95)
!100 = !MDLocation(line: 52, column: 10, scope: !20)
!101 = !MDLocation(line: 52, column: 5, scope: !20)
!102 = !MDLocation(line: 53, column: 1, scope: !20)
!103 = !MDLocation(line: 53, column: 1, scope: !104)
!104 = !{!"0xb\001", !1, !20}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!105 = !MDLocation(line: 56, column: 32, scope: !28)
!106 = !MDLocation(line: 56, column: 39, scope: !28)
!107 = !MDLocation(line: 56, column: 51, scope: !28)
!108 = !MDLocation(line: 56, column: 63, scope: !28)
!109 = !MDLocation(line: 59, column: 25, scope: !28)
!110 = !MDLocation(line: 59, column: 13, scope: !28)
!111 = !MDLocation(line: 60, column: 13, scope: !28)
!112 = !MDLocation(line: 61, column: 13, scope: !28)
!113 = !MDLocation(line: 63, column: 19, scope: !41)
!114 = !MDLocation(line: 63, column: 9, scope: !42)
!115 = !MDLocation(line: 67, column: 23, scope: !116)
!116 = !{!"0xb\0067\0013\0017", !1, !117}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!117 = !{!"0xb\0067\0013\0016", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!118 = !MDLocation(line: 69, column: 31, scope: !119)
!119 = !{!"0xb\0069\0013\0019", !1, !120}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!120 = !{!"0xb\0069\0013\0018", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!121 = !MDLocation(line: 71, column: 25, scope: !122)
!122 = !{!"0xb\0070\0013\0020", !1, !119}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/array.c]
!123 = !{!124, !124, i64 0}
!124 = !{!"double", !70, i64 0}
!125 = !MDLocation(line: 71, column: 17, scope: !122)
!126 = !MDLocation(line: 72, column: 30, scope: !122)
!127 = !MDLocation(line: 72, column: 27, scope: !122)
!128 = !MDLocation(line: 72, column: 17, scope: !122)
!129 = !MDLocation(line: 73, column: 30, scope: !122)
!130 = !MDLocation(line: 73, column: 27, scope: !122)
!131 = !MDLocation(line: 73, column: 17, scope: !122)
!132 = !MDLocation(line: 74, column: 30, scope: !122)
!133 = !MDLocation(line: 74, column: 27, scope: !122)
!134 = !MDLocation(line: 74, column: 17, scope: !122)
!135 = !MDLocation(line: 69, column: 36, scope: !119)
!136 = !MDLocation(line: 69, column: 13, scope: !120)
!137 = !MDLocation(line: 68, column: 25, scope: !116)
!138 = !MDLocation(line: 68, column: 17, scope: !116)
!139 = !MDLocation(line: 67, column: 13, scope: !117)
!140 = distinct !{!140, !141, !142}
!141 = !{!"llvm.loop.vectorize.width", i32 1}
!142 = !{!"llvm.loop.interleave.count", i32 1}
!143 = !MDLocation(line: 65, column: 26, scope: !40)
!144 = !MDLocation(line: 65, column: 21, scope: !40)
!145 = !MDLocation(line: 66, column: 26, scope: !40)
!146 = !MDLocation(line: 66, column: 21, scope: !40)
!147 = distinct !{!147, !148}
!148 = !{!"llvm.loop.unroll.disable"}
!149 = distinct !{!149, !141, !142}
!150 = distinct !{!150, !148}
!151 = !MDLocation(line: 77, column: 3, scope: !28)
