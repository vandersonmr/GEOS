; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !17, metadata !74), !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !18, metadata !74), !dbg !76
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !21, metadata !74), !dbg !77
  %conv = sext i32 %rows to i64, !dbg !78
  %mul = shl nsw i64 %conv, 3, !dbg !78
  %call = tail call noalias i8* @malloc(i64 %mul) #4, !dbg !79
  %0 = bitcast i8* %call to i32**, !dbg !80
  tail call void @llvm.dbg.value(metadata i32** %0, i64 0, metadata !22, metadata !74), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !74), !dbg !82
  %cmp29 = icmp sgt i32 %rows, 0, !dbg !83
  br i1 %cmp29, label %for.body.lr.ph, label %for.end16, !dbg !86

for.body.lr.ph:                                   ; preds = %entry
  %conv2 = sext i32 %cols to i64, !dbg !87
  %mul3 = shl nsw i64 %conv2, 2, !dbg !87
  %cmp626 = icmp sgt i32 %cols, 0, !dbg !89
  %1 = add i32 %cols, -1, !dbg !86
  %2 = add i32 %rows, -1, !dbg !86
  br label %for.body, !dbg !86

for.body:                                         ; preds = %for.inc14, %for.body.lr.ph
  %indvars.iv32 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next33, %for.inc14 ]
  %count.030 = phi i32 [ 1, %for.body.lr.ph ], [ %count.1.lcssa, %for.inc14 ]
  %call4 = tail call noalias i8* @malloc(i64 %mul3) #4, !dbg !92
  %arrayidx = getelementptr inbounds i32** %0, i64 %indvars.iv32, !dbg !93
  %3 = bitcast i32** %arrayidx to i8**, !dbg !93
  store i8* %call4, i8** %3, align 8, !dbg !93, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !74), !dbg !98
  br i1 %cmp626, label %for.body8.lr.ph, label %for.inc14, !dbg !99

for.body8.lr.ph:                                  ; preds = %for.body
  %4 = load i32** %arrayidx, align 8, !dbg !100, !tbaa !94
  br label %for.body8, !dbg !99

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next, %for.body8 ]
  %count.128 = phi i32 [ %count.030, %for.body8.lr.ph ], [ %inc, %for.body8 ]
  %inc = add nsw i32 %count.128, 1, !dbg !102
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12 = getelementptr inbounds i32* %4, i64 %indvars.iv, !dbg !100
  store i32 %count.128, i32* %arrayidx12, align 4, !dbg !100, !tbaa !103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !99
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !99
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !99
  br i1 %exitcond, label %for.cond5.for.inc14_crit_edge, label %for.body8, !dbg !99

for.cond5.for.inc14_crit_edge:                    ; preds = %for.body8
  %5 = add i32 %count.030, %cols, !dbg !99
  br label %for.inc14, !dbg !99

for.inc14:                                        ; preds = %for.cond5.for.inc14_crit_edge, %for.body
  %count.1.lcssa = phi i32 [ %5, %for.cond5.for.inc14_crit_edge ], [ %count.030, %for.body ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !86
  %lftr.wideiv34 = trunc i64 %indvars.iv32 to i32, !dbg !86
  %exitcond35 = icmp eq i32 %lftr.wideiv34, %2, !dbg !86
  br i1 %exitcond35, label %for.end16, label %for.body, !dbg !86

for.end16:                                        ; preds = %for.inc14, %entry
  ret i32** %0, !dbg !105
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** nocapture readonly %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !27, metadata !74), !dbg !106
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !28, metadata !74), !dbg !107
  tail call void @llvm.dbg.value(metadata i32** %m, i64 0, metadata !29, metadata !74), !dbg !108
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !74), !dbg !109
  %cmp15 = icmp sgt i32 %rows, 0, !dbg !110
  br i1 %cmp15, label %for.cond1.preheader.lr.ph, label %for.end8, !dbg !113

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp213 = icmp sgt i32 %cols, 0, !dbg !114
  %0 = add i32 %cols, -1, !dbg !113
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 2, !dbg !113
  %3 = add nuw nsw i64 %2, 4, !dbg !113
  %4 = add i32 %rows, -1, !dbg !113
  br label %for.cond1.preheader, !dbg !113

for.cond1.preheader:                              ; preds = %for.inc6, %for.cond1.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next, %for.inc6 ]
  br i1 %cmp213, label %for.cond1.for.inc6_crit_edge, label %for.inc6, !dbg !117

for.cond1.for.inc6_crit_edge:                     ; preds = %for.cond1.preheader
  %arrayidx = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !118
  %5 = bitcast i32** %arrayidx to i8**, !dbg !118
  %6 = load i8** %5, align 8, !dbg !118, !tbaa !94
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %3, i32 4, i1 false), !dbg !118
  br label %for.inc6, !dbg !117

for.inc6:                                         ; preds = %for.cond1.for.inc6_crit_edge, %for.cond1.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !113
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !113
  %exitcond = icmp eq i32 %lftr.wideiv, %4, !dbg !113
  br i1 %exitcond, label %for.end8, label %for.cond1.preheader, !dbg !113

for.end8:                                         ; preds = %for.inc6, %entry
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !36, metadata !74), !dbg !120
  tail call void @llvm.dbg.value(metadata i32** %m, i64 0, metadata !37, metadata !74), !dbg !121
  %cmp4 = icmp sgt i32 %rows, 0, !dbg !122
  br i1 %cmp4, label %while.body.lr.ph, label %while.end, !dbg !125

while.body.lr.ph:                                 ; preds = %entry
  %0 = sext i32 %rows to i64
  br label %while.body, !dbg !125

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvars.iv = phi i64 [ %0, %while.body.lr.ph ], [ %indvars.iv.next, %while.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !125
  %arrayidx = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !126
  %1 = bitcast i32** %arrayidx to i8**, !dbg !126
  %2 = load i8** %1, align 8, !dbg !126, !tbaa !94
  tail call void @free(i8* %2) #4, !dbg !128
  %cmp = icmp sgt i64 %indvars.iv, 1, !dbg !122
  br i1 %cmp, label %while.body, label %while.end, !dbg !125

while.end:                                        ; preds = %while.body, %entry
  %3 = bitcast i32** %m to i8*, !dbg !129
  tail call void @free(i8* %3) #4, !dbg !130
  ret void, !dbg !131
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !42, metadata !74), !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !43, metadata !74), !dbg !133
  tail call void @llvm.dbg.value(metadata i32** %m1, i64 0, metadata !44, metadata !74), !dbg !134
  tail call void @llvm.dbg.value(metadata i32** %m2, i64 0, metadata !45, metadata !74), !dbg !135
  tail call void @llvm.dbg.value(metadata i32** %m3, i64 0, metadata !46, metadata !74), !dbg !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !74), !dbg !137
  %cmp40 = icmp sgt i32 %rows, 0, !dbg !138
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end22, !dbg !141

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp238 = icmp sgt i32 %cols, 0, !dbg !142
  %cmp535 = icmp sgt i32 %cols, 0, !dbg !146
  %0 = add i32 %cols, -1, !dbg !141
  %1 = add i32 %rows, -1, !dbg !141
  br label %for.cond1.preheader, !dbg !141

for.cond1.preheader:                              ; preds = %for.inc20, %for.cond1.preheader.lr.ph
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next47, %for.inc20 ]
  br i1 %cmp238, label %for.cond4.preheader.lr.ph, label %for.inc20, !dbg !150

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %arrayidx15 = getelementptr inbounds i32** %m3, i64 %indvars.iv46, !dbg !151
  %2 = load i32** %arrayidx15, align 8, !dbg !151, !tbaa !94
  %arrayidx = getelementptr inbounds i32** %m1, i64 %indvars.iv46, !dbg !152
  br label %for.cond4.preheader, !dbg !150

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.lr.ph
  %indvars.iv42 = phi i64 [ 0, %for.cond4.preheader.lr.ph ], [ %indvars.iv.next43, %for.end ]
  br i1 %cmp535, label %for.body6.lr.ph, label %for.end, !dbg !154

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %3 = load i32** %arrayidx, align 8, !dbg !152, !tbaa !94
  br label %for.body6, !dbg !154

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %val.037 = phi i32 [ 0, %for.body6.lr.ph ], [ %add, %for.body6 ]
  %arrayidx8 = getelementptr inbounds i32* %3, i64 %indvars.iv, !dbg !152
  %4 = load i32* %arrayidx8, align 4, !dbg !152, !tbaa !103
  %arrayidx11 = getelementptr inbounds i32** %m2, i64 %indvars.iv, !dbg !155
  %5 = load i32** %arrayidx11, align 8, !dbg !155, !tbaa !94
  %arrayidx12 = getelementptr inbounds i32* %5, i64 %indvars.iv42, !dbg !155
  %6 = load i32* %arrayidx12, align 4, !dbg !155, !tbaa !103
  %mul = mul nsw i32 %6, %4, !dbg !152
  %add = add nsw i32 %mul, %val.037, !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !50, metadata !74), !dbg !157
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !154
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !154
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !154
  br i1 %exitcond, label %for.end, label %for.body6, !dbg !154

for.end:                                          ; preds = %for.body6, %for.cond4.preheader
  %val.0.lcssa = phi i32 [ 0, %for.cond4.preheader ], [ %add, %for.body6 ]
  %arrayidx16 = getelementptr inbounds i32* %2, i64 %indvars.iv42, !dbg !151
  store i32 %val.0.lcssa, i32* %arrayidx16, align 4, !dbg !151, !tbaa !103
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !150
  %lftr.wideiv44 = trunc i64 %indvars.iv42 to i32, !dbg !150
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %0, !dbg !150
  br i1 %exitcond45, label %for.inc20, label %for.cond4.preheader, !dbg !150

for.inc20:                                        ; preds = %for.end, %for.cond1.preheader
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1, !dbg !141
  %lftr.wideiv48 = trunc i64 %indvars.iv46 to i32, !dbg !141
  %exitcond49 = icmp eq i32 %lftr.wideiv48, %1, !dbg !141
  br i1 %exitcond49, label %for.end22, label %for.cond1.preheader, !dbg !141

for.end22:                                        ; preds = %for.inc20, %entry
  ret i32** %m3, !dbg !158
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !55, metadata !74), !dbg !159
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !56, metadata !74), !dbg !160
  %cmp = icmp eq i32 %argc, 2, !dbg !161
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !162

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !163
  %0 = load i8** %arrayidx, align 8, !dbg !163, !tbaa !94
  %call = tail call i32 @atoi(i8* %0) #5, !dbg !165
  br label %cond.end, !dbg !162

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 3000000, %entry ], !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !58, metadata !74), !dbg !166
  %call1 = tail call i32** @mkmatrix(i32 10, i32 10), !dbg !167
  tail call void @llvm.dbg.value(metadata i32** %call1, i64 0, metadata !59, metadata !74), !dbg !168
  %call2 = tail call i32** @mkmatrix(i32 10, i32 10), !dbg !169
  tail call void @llvm.dbg.value(metadata i32** %call2, i64 0, metadata !60, metadata !74), !dbg !170
  %call3 = tail call i32** @mkmatrix(i32 10, i32 10), !dbg !171
  tail call void @llvm.dbg.value(metadata i32** %call3, i64 0, metadata !61, metadata !74), !dbg !172
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !74), !dbg !173
  %cmp423 = icmp sgt i32 %cond, 0, !dbg !174
  br i1 %cmp423, label %for.body.lr.ph, label %for.end, !dbg !177

for.body.lr.ph:                                   ; preds = %cond.end
  %1 = add i32 %cond, -1, !dbg !177
  br label %for.body, !dbg !177

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %mm.025 = phi i32** [ %call3, %for.body.lr.ph ], [ %call5, %for.body ]
  %i.024 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %call5 = tail call i32** @mmult(i32 10, i32 10, i32** %call1, i32** %call2, i32** %mm.025), !dbg !178
  tail call void @llvm.dbg.value(metadata i32** %call5, i64 0, metadata !61, metadata !74), !dbg !172
  %inc = add nuw nsw i32 %i.024, 1, !dbg !180
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !74), !dbg !173
  %exitcond = icmp eq i32 %i.024, %1, !dbg !177
  br i1 %exitcond, label %for.end, label %for.body, !dbg !177

for.end:                                          ; preds = %for.body, %cond.end
  %mm.0.lcssa = phi i32** [ %call3, %cond.end ], [ %call5, %for.body ]
  %2 = load i32** %mm.0.lcssa, align 8, !dbg !181, !tbaa !94
  %3 = load i32* %2, align 4, !dbg !181, !tbaa !103
  %arrayidx8 = getelementptr inbounds i32** %mm.0.lcssa, i64 2, !dbg !182
  %4 = load i32** %arrayidx8, align 8, !dbg !182, !tbaa !94
  %arrayidx9 = getelementptr inbounds i32* %4, i64 3, !dbg !182
  %5 = load i32* %arrayidx9, align 4, !dbg !182, !tbaa !103
  %arrayidx10 = getelementptr inbounds i32** %mm.0.lcssa, i64 3, !dbg !183
  %6 = load i32** %arrayidx10, align 8, !dbg !183, !tbaa !94
  %arrayidx11 = getelementptr inbounds i32* %6, i64 2, !dbg !183
  %7 = load i32* %arrayidx11, align 4, !dbg !183, !tbaa !103
  %arrayidx12 = getelementptr inbounds i32** %mm.0.lcssa, i64 4, !dbg !184
  %8 = load i32** %arrayidx12, align 8, !dbg !184, !tbaa !94
  %arrayidx13 = getelementptr inbounds i32* %8, i64 4, !dbg !184
  %9 = load i32* %arrayidx13, align 4, !dbg !184, !tbaa !103
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %3, i32 %5, i32 %7, i32 %9) #4, !dbg !185
  tail call void @freematrix(i32 10, i32** %call1), !dbg !186
  tail call void @freematrix(i32 10, i32** %call2), !dbg !187
  tail call void @freematrix(i32 10, i32** %mm.0.lcssa), !dbg !188
  ret i32 0, !dbg !189
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !70, metadata !74), !dbg !190
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #4, !dbg !191
  %conv = trunc i64 %call to i32, !dbg !192
  ret i32 %conv, !dbg !193
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!71, !72}
!llvm.ident = !{!73}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !11, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = !{!"matrix.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6, !7, !10}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = !{!12, !23, !32, !38, !51, !62}
!12 = !{!"0x2e\00mkmatrix\00mkmatrix\00\0012\000\001\000\000\00256\001\0012", !1, !13, !14, null, i32** (i32, i32)* @mkmatrix, null, null, !16} ; [ DW_TAG_subprogram ] [line 12] [def] [mkmatrix]
!13 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!4, !6, !6}
!16 = !{!17, !18, !19, !20, !21, !22}
!17 = !{!"0x101\00rows\0016777228\000", !12, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!18 = !{!"0x101\00cols\0033554444\000", !12, !13, !6} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!19 = !{!"0x100\00i\0013\000", !12, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 13]
!20 = !{!"0x100\00j\0013\000", !12, !13, !6}      ; [ DW_TAG_auto_variable ] [j] [line 13]
!21 = !{!"0x100\00count\0013\000", !12, !13, !6}  ; [ DW_TAG_auto_variable ] [count] [line 13]
!22 = !{!"0x100\00m\0014\000", !12, !13, !4}      ; [ DW_TAG_auto_variable ] [m] [line 14]
!23 = !{!"0x2e\00zeromatrix\00zeromatrix\00\0024\000\001\000\000\00256\001\0024", !1, !13, !24, null, void (i32, i32, i32**)* @zeromatrix, null, null, !26} ; [ DW_TAG_subprogram ] [line 24] [def] [zeromatrix]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !6, !6, !4}
!26 = !{!27, !28, !29, !30, !31}
!27 = !{!"0x101\00rows\0016777240\000", !23, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 24]
!28 = !{!"0x101\00cols\0033554456\000", !23, !13, !6} ; [ DW_TAG_arg_variable ] [cols] [line 24]
!29 = !{!"0x101\00m\0050331672\000", !23, !13, !4} ; [ DW_TAG_arg_variable ] [m] [line 24]
!30 = !{!"0x100\00i\0025\000", !23, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 25]
!31 = !{!"0x100\00j\0025\000", !23, !13, !6}      ; [ DW_TAG_auto_variable ] [j] [line 25]
!32 = !{!"0x2e\00freematrix\00freematrix\00\0031\000\001\000\000\00256\001\0031", !1, !13, !33, null, void (i32, i32**)* @freematrix, null, null, !35} ; [ DW_TAG_subprogram ] [line 31] [def] [freematrix]
!33 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !34, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = !{null, !6, !4}
!35 = !{!36, !37}
!36 = !{!"0x101\00rows\0016777247\000", !32, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!37 = !{!"0x101\00m\0033554463\000", !32, !13, !4} ; [ DW_TAG_arg_variable ] [m] [line 31]
!38 = !{!"0x2e\00mmult\00mmult\00\0036\000\001\000\000\00256\001\0036", !1, !13, !39, null, i32** (i32, i32, i32**, i32**, i32**)* @mmult, null, null, !41} ; [ DW_TAG_subprogram ] [line 36] [def] [mmult]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!4, !6, !6, !4, !4, !4}
!41 = !{!42, !43, !44, !45, !46, !47, !48, !49, !50}
!42 = !{!"0x101\00rows\0016777252\000", !38, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 36]
!43 = !{!"0x101\00cols\0033554468\000", !38, !13, !6} ; [ DW_TAG_arg_variable ] [cols] [line 36]
!44 = !{!"0x101\00m1\0050331684\000", !38, !13, !4} ; [ DW_TAG_arg_variable ] [m1] [line 36]
!45 = !{!"0x101\00m2\0067108900\000", !38, !13, !4} ; [ DW_TAG_arg_variable ] [m2] [line 36]
!46 = !{!"0x101\00m3\0083886116\000", !38, !13, !4} ; [ DW_TAG_arg_variable ] [m3] [line 36]
!47 = !{!"0x100\00i\0037\000", !38, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 37]
!48 = !{!"0x100\00j\0037\000", !38, !13, !6}      ; [ DW_TAG_auto_variable ] [j] [line 37]
!49 = !{!"0x100\00k\0037\000", !38, !13, !6}      ; [ DW_TAG_auto_variable ] [k] [line 37]
!50 = !{!"0x100\00val\0037\000", !38, !13, !6}    ; [ DW_TAG_auto_variable ] [val] [line 37]
!51 = !{!"0x2e\00main\00main\00\0050\000\001\000\000\00256\001\0050", !1, !13, !52, null, i32 (i32, i8**)* @main, null, null, !54} ; [ DW_TAG_subprogram ] [line 50] [def] [main]
!52 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !53, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = !{!6, !6, !7}
!54 = !{!55, !56, !57, !58, !59, !60, !61}
!55 = !{!"0x101\00argc\0016777266\000", !51, !13, !6} ; [ DW_TAG_arg_variable ] [argc] [line 50]
!56 = !{!"0x101\00argv\0033554482\000", !51, !13, !7} ; [ DW_TAG_arg_variable ] [argv] [line 50]
!57 = !{!"0x100\00i\0056\000", !51, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 56]
!58 = !{!"0x100\00n\0056\000", !51, !13, !6}      ; [ DW_TAG_auto_variable ] [n] [line 56]
!59 = !{!"0x100\00m1\0058\000", !51, !13, !4}     ; [ DW_TAG_auto_variable ] [m1] [line 58]
!60 = !{!"0x100\00m2\0059\000", !51, !13, !4}     ; [ DW_TAG_auto_variable ] [m2] [line 59]
!61 = !{!"0x100\00mm\0060\000", !51, !13, !4}     ; [ DW_TAG_auto_variable ] [mm] [line 60]
!62 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !63, !64, !65, null, i32 (i8*)* @atoi, null, null, !69} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!63 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!64 = !{!"0x29", !63}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{!6, !67}
!67 = !{!"0xf\00\000\0064\0064\000\000", null, null, !68} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = !{!"0x26\00\000\000\000\000\000", null, null, !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!69 = !{!70}
!70 = !{!"0x101\00__nptr\0016777494\000", !62, !64, !67} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!71 = !{i32 2, !"Dwarf Version", i32 4}
!72 = !{i32 2, !"Debug Info Version", i32 2}
!73 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!74 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!75 = !MDLocation(line: 12, column: 20, scope: !12)
!76 = !MDLocation(line: 12, column: 30, scope: !12)
!77 = !MDLocation(line: 13, column: 15, scope: !12)
!78 = !MDLocation(line: 14, column: 31, scope: !12)
!79 = !MDLocation(line: 14, column: 24, scope: !12)
!80 = !MDLocation(line: 14, column: 15, scope: !12)
!81 = !MDLocation(line: 14, column: 11, scope: !12)
!82 = !MDLocation(line: 13, column: 9, scope: !12)
!83 = !MDLocation(line: 15, column: 15, scope: !84)
!84 = !{!"0xb\0015\005\001", !1, !85}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!85 = !{!"0xb\0015\005\000", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!86 = !MDLocation(line: 15, column: 5, scope: !85)
!87 = !MDLocation(line: 16, column: 24, scope: !88)
!88 = !{!"0xb\0015\0028\002", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!89 = !MDLocation(line: 17, column: 12, scope: !90)
!90 = !{!"0xb\0017\002\004", !1, !91}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!91 = !{!"0xb\0017\002\003", !1, !88}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!92 = !MDLocation(line: 16, column: 17, scope: !88)
!93 = !MDLocation(line: 16, column: 2, scope: !88)
!94 = !{!95, !95, i64 0}
!95 = !{!"any pointer", !96, i64 0}
!96 = !{!"omnipotent char", !97, i64 0}
!97 = !{!"Simple C/C++ TBAA"}
!98 = !MDLocation(line: 13, column: 12, scope: !12)
!99 = !MDLocation(line: 17, column: 2, scope: !91)
!100 = !MDLocation(line: 18, column: 6, scope: !101)
!101 = !{!"0xb\0017\0025\005", !1, !90}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!102 = !MDLocation(line: 18, column: 16, scope: !101)
!103 = !{!104, !104, i64 0}
!104 = !{!"int", !96, i64 0}
!105 = !MDLocation(line: 21, column: 5, scope: !12)
!106 = !MDLocation(line: 24, column: 21, scope: !23)
!107 = !MDLocation(line: 24, column: 31, scope: !23)
!108 = !MDLocation(line: 24, column: 43, scope: !23)
!109 = !MDLocation(line: 25, column: 9, scope: !23)
!110 = !MDLocation(line: 26, column: 15, scope: !111)
!111 = !{!"0xb\0026\005\007", !1, !112}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!112 = !{!"0xb\0026\005\006", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!113 = !MDLocation(line: 26, column: 5, scope: !112)
!114 = !MDLocation(line: 27, column: 12, scope: !115)
!115 = !{!"0xb\0027\002\009", !1, !116}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!116 = !{!"0xb\0027\002\008", !1, !111}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!117 = !MDLocation(line: 27, column: 2, scope: !116)
!118 = !MDLocation(line: 28, column: 6, scope: !115)
!119 = !MDLocation(line: 29, column: 1, scope: !23)
!120 = !MDLocation(line: 31, column: 21, scope: !32)
!121 = !MDLocation(line: 31, column: 33, scope: !32)
!122 = !MDLocation(line: 32, column: 12, scope: !123)
!123 = !{!"0xb\003", !1, !124}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!124 = !{!"0xb\001", !1, !32}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!125 = !MDLocation(line: 32, column: 5, scope: !32)
!126 = !MDLocation(line: 32, column: 32, scope: !127)
!127 = !{!"0xb\0032\0025\0010", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!128 = !MDLocation(line: 32, column: 27, scope: !127)
!129 = !MDLocation(line: 33, column: 10, scope: !32)
!130 = !MDLocation(line: 33, column: 5, scope: !32)
!131 = !MDLocation(line: 34, column: 1, scope: !32)
!132 = !MDLocation(line: 36, column: 17, scope: !38)
!133 = !MDLocation(line: 36, column: 27, scope: !38)
!134 = !MDLocation(line: 36, column: 39, scope: !38)
!135 = !MDLocation(line: 36, column: 49, scope: !38)
!136 = !MDLocation(line: 36, column: 59, scope: !38)
!137 = !MDLocation(line: 37, column: 9, scope: !38)
!138 = !MDLocation(line: 38, column: 15, scope: !139)
!139 = !{!"0xb\0038\005\0012", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!140 = !{!"0xb\0038\005\0011", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!141 = !MDLocation(line: 38, column: 5, scope: !140)
!142 = !MDLocation(line: 39, column: 12, scope: !143)
!143 = !{!"0xb\0039\002\0015", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!144 = !{!"0xb\0039\002\0014", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!145 = !{!"0xb\0038\0028\0013", !1, !139}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!146 = !MDLocation(line: 41, column: 16, scope: !147)
!147 = !{!"0xb\0041\006\0018", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!148 = !{!"0xb\0041\006\0017", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!149 = !{!"0xb\0039\0025\0016", !1, !143}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!150 = !MDLocation(line: 39, column: 2, scope: !144)
!151 = !MDLocation(line: 44, column: 6, scope: !149)
!152 = !MDLocation(line: 42, column: 10, scope: !153)
!153 = !{!"0xb\0041\0029\0019", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!154 = !MDLocation(line: 41, column: 6, scope: !148)
!155 = !MDLocation(line: 42, column: 21, scope: !153)
!156 = !MDLocation(line: 42, column: 3, scope: !153)
!157 = !MDLocation(line: 37, column: 18, scope: !38)
!158 = !MDLocation(line: 47, column: 5, scope: !38)
!159 = !MDLocation(line: 50, column: 14, scope: !51)
!160 = !MDLocation(line: 50, column: 26, scope: !51)
!161 = !MDLocation(line: 56, column: 18, scope: !51)
!162 = !MDLocation(line: 56, column: 17, scope: !51)
!163 = !MDLocation(line: 56, column: 36, scope: !164)
!164 = !{!"0xb\001", !1, !51}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!165 = !MDLocation(line: 56, column: 31, scope: !51)
!166 = !MDLocation(line: 56, column: 12, scope: !51)
!167 = !MDLocation(line: 58, column: 16, scope: !51)
!168 = !MDLocation(line: 58, column: 11, scope: !51)
!169 = !MDLocation(line: 59, column: 16, scope: !51)
!170 = !MDLocation(line: 59, column: 11, scope: !51)
!171 = !MDLocation(line: 60, column: 16, scope: !51)
!172 = !MDLocation(line: 60, column: 11, scope: !51)
!173 = !MDLocation(line: 56, column: 9, scope: !51)
!174 = !MDLocation(line: 62, column: 15, scope: !175)
!175 = !{!"0xb\0062\005\0021", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!176 = !{!"0xb\0062\005\0020", !1, !51}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!177 = !MDLocation(line: 62, column: 5, scope: !176)
!178 = !MDLocation(line: 63, column: 7, scope: !179)
!179 = !{!"0xb\0062\0025\0022", !1, !175}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!180 = !MDLocation(line: 62, column: 20, scope: !175)
!181 = !MDLocation(line: 65, column: 29, scope: !51)
!182 = !MDLocation(line: 65, column: 39, scope: !51)
!183 = !MDLocation(line: 65, column: 49, scope: !51)
!184 = !MDLocation(line: 65, column: 59, scope: !51)
!185 = !MDLocation(line: 65, column: 5, scope: !51)
!186 = !MDLocation(line: 67, column: 5, scope: !51)
!187 = !MDLocation(line: 68, column: 5, scope: !51)
!188 = !MDLocation(line: 69, column: 5, scope: !51)
!189 = !MDLocation(line: 70, column: 5, scope: !51)
!190 = !MDLocation(line: 278, column: 1, scope: !62)
!191 = !MDLocation(line: 280, column: 16, scope: !62)
!192 = !MDLocation(line: 280, column: 10, scope: !62)
!193 = !MDLocation(line: 280, column: 3, scope: !62)
