; ModuleID = 'sgesl.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgesl(%struct.FULL* nocapture readonly %a, i32* nocapture readonly %ipvt, float* nocapture %b, i32 %job) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.FULL* %a, i64 0, metadata !23, metadata !40), !dbg !41
  tail call void @llvm.dbg.value(metadata i32* %ipvt, i64 0, metadata !24, metadata !40), !dbg !42
  tail call void @llvm.dbg.value(metadata float* %b, i64 0, metadata !25, metadata !40), !dbg !43
  tail call void @llvm.dbg.value(metadata i32 %job, i64 0, metadata !26, metadata !40), !dbg !44
  %cd = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !45
  %0 = load i32* %cd, align 4, !dbg !45, !tbaa !46
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !35, metadata !40), !dbg !51
  %sub = add nsw i32 %0, -1, !dbg !52
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !36, metadata !40), !dbg !53
  %cmp = icmp eq i32 %job, 0, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !40), !dbg !56
  br i1 %cmp, label %for.cond.preheader, label %for.cond52.preheader, !dbg !57

for.cond52.preheader:                             ; preds = %entry
  %cmp53250 = icmp sgt i32 %0, 0, !dbg !58
  br i1 %cmp53250, label %for.body54.lr.ph, label %for.end81, !dbg !61

for.body54.lr.ph:                                 ; preds = %for.cond52.preheader
  %1 = add i32 %0, -1, !dbg !61
  br label %for.body54, !dbg !61

for.cond.preheader:                               ; preds = %entry
  %cmp1232 = icmp sgt i32 %0, 1, !dbg !62
  br i1 %cmp1232, label %for.body.lr.ph, label %for.cond23.preheader, !dbg !66

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %2 = add i32 %0, -1, !dbg !66
  %3 = sext i32 %0 to i64, !dbg !66
  %4 = sext i32 %sub to i64, !dbg !66
  br label %for.body, !dbg !66

for.cond23.preheader:                             ; preds = %for.inc19, %for.cond.preheader
  %cmp24227 = icmp sgt i32 %0, 0, !dbg !67
  br i1 %cmp24227, label %for.body25.lr.ph, label %return, !dbg !72

for.body25.lr.ph:                                 ; preds = %for.cond23.preheader
  %5 = add i32 %0, -2, !dbg !72
  %6 = sext i32 %0 to i64
  br label %for.body25, !dbg !72

for.body:                                         ; preds = %for.body.lr.ph, %for.inc19
  %indvars.iv264 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next265, %for.inc19 ]
  %indvars.iv257 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next258, %for.inc19 ]
  %ipvt.addr.0234 = phi i32* [ %ipvt, %for.body.lr.ph ], [ %incdec.ptr21, %for.inc19 ]
  %arrayidx = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv264, !dbg !73
  %7 = load float** %arrayidx, align 8, !dbg !73, !tbaa !75
  %8 = load i32* %ipvt.addr.0234, align 4, !dbg !77, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !34, metadata !40), !dbg !79
  %idxprom2 = sext i32 %8 to i64, !dbg !80
  %arrayidx3 = getelementptr inbounds float* %b, i64 %idxprom2, !dbg !80
  %9 = load float* %arrayidx3, align 4, !dbg !80, !tbaa !81
  tail call void @llvm.dbg.value(metadata float %9, i64 0, metadata !27, metadata !40), !dbg !83
  %10 = trunc i64 %indvars.iv264 to i32, !dbg !84
  %cmp4 = icmp eq i32 %8, %10, !dbg !84
  br i1 %cmp4, label %if.end, label %if.then5, !dbg !86

if.then5:                                         ; preds = %for.body
  %arrayidx7 = getelementptr inbounds float* %b, i64 %indvars.iv264, !dbg !87
  %11 = load float* %arrayidx7, align 4, !dbg !87, !tbaa !81
  store float %11, float* %arrayidx3, align 4, !dbg !89, !tbaa !81
  store float %9, float* %arrayidx7, align 4, !dbg !90, !tbaa !81
  br label %if.end, !dbg !91

if.end:                                           ; preds = %for.body, %if.then5
  %indvars.iv.next265 = add nuw nsw i64 %indvars.iv264, 1, !dbg !66
  tail call void @llvm.dbg.value(metadata float* %add.ptr12, i64 0, metadata !29, metadata !40), !dbg !92
  %cmp14229 = icmp slt i64 %indvars.iv.next265, %3, !dbg !93
  br i1 %cmp14229, label %for.body15.lr.ph, label %for.inc19, !dbg !96

for.body15.lr.ph:                                 ; preds = %if.end
  %add.ptr.sum = add nuw nsw i64 %indvars.iv264, 1, !dbg !97
  %add.ptr12 = getelementptr inbounds float* %7, i64 %add.ptr.sum, !dbg !97
  br label %for.body15, !dbg !96

for.body15:                                       ; preds = %for.body15, %for.body15.lr.ph
  %indvars.iv259 = phi i64 [ %indvars.iv257, %for.body15.lr.ph ], [ %indvars.iv.next260, %for.body15 ]
  %mik.0230 = phi float* [ %add.ptr12, %for.body15.lr.ph ], [ %incdec.ptr, %for.body15 ]
  %12 = load float* %mik.0230, align 4, !dbg !98, !tbaa !81
  %mul = fmul float %9, %12, !dbg !99
  %arrayidx17 = getelementptr inbounds float* %b, i64 %indvars.iv259, !dbg !100
  %13 = load float* %arrayidx17, align 4, !dbg !100, !tbaa !81
  %add18 = fadd float %13, %mul, !dbg !100
  store float %add18, float* %arrayidx17, align 4, !dbg !100, !tbaa !81
  %incdec.ptr = getelementptr inbounds float* %mik.0230, i64 1, !dbg !101
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !29, metadata !40), !dbg !92
  %indvars.iv.next260 = add nuw nsw i64 %indvars.iv259, 1, !dbg !96
  %lftr.wideiv262 = trunc i64 %indvars.iv259 to i32, !dbg !96
  %exitcond263 = icmp eq i32 %lftr.wideiv262, %2, !dbg !96
  br i1 %exitcond263, label %for.inc19, label %for.body15, !dbg !96

for.inc19:                                        ; preds = %for.body15, %if.end
  %incdec.ptr21 = getelementptr inbounds i32* %ipvt.addr.0234, i64 1, !dbg !102
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr21, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp1 = icmp slt i64 %indvars.iv.next265, %4, !dbg !62
  %indvars.iv.next258 = add nuw nsw i64 %indvars.iv257, 1, !dbg !66
  br i1 %cmp1, label %for.body, label %for.cond23.preheader, !dbg !66

for.body25:                                       ; preds = %for.body25.lr.ph, %for.inc49
  %indvars.iv254.in = phi i64 [ %6, %for.body25.lr.ph ], [ %indvars.iv254, %for.inc49 ]
  %indvars.iv252 = phi i32 [ %5, %for.body25.lr.ph ], [ %indvars.iv.next253, %for.inc49 ]
  %indvars.iv254 = add nsw i64 %indvars.iv254.in, -1, !dbg !72
  %arrayidx28 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv254, !dbg !103
  %14 = load float** %arrayidx28, align 8, !dbg !103, !tbaa !75
  %add.ptr30 = getelementptr inbounds float* %14, i64 %indvars.iv254, !dbg !103
  tail call void @llvm.dbg.value(metadata float* %add.ptr30, i64 0, metadata !28, metadata !40), !dbg !105
  %15 = load float* %add.ptr30, align 4, !dbg !106, !tbaa !81
  %arrayidx32 = getelementptr inbounds float* %b, i64 %indvars.iv254, !dbg !107
  %16 = load float* %arrayidx32, align 4, !dbg !107, !tbaa !81
  %div = fdiv float %16, %15, !dbg !107
  store float %div, float* %arrayidx32, align 4, !dbg !107, !tbaa !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !40), !dbg !108
  tail call void @llvm.dbg.value(metadata float* %17, i64 0, metadata !30, metadata !40), !dbg !109
  %cmp37224 = icmp sgt i64 %indvars.iv254.in, 1, !dbg !110
  br i1 %cmp37224, label %for.body38.lr.ph, label %return, !dbg !113

for.body38.lr.ph:                                 ; preds = %for.body25
  %17 = load float** %arrayidx28, align 8, !dbg !114, !tbaa !75
  br label %for.body38, !dbg !113

for.body38:                                       ; preds = %for.body38, %for.body38.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body38.lr.ph ], [ %indvars.iv.next, %for.body38 ]
  %uik.0225 = phi float* [ %17, %for.body38.lr.ph ], [ %incdec.ptr47, %for.body38 ]
  %18 = load float* %uik.0225, align 4, !dbg !115, !tbaa !81
  %19 = load float* %arrayidx32, align 4, !dbg !116, !tbaa !81
  %mul41 = fmul float %18, %19, !dbg !117
  %arrayidx43 = getelementptr inbounds float* %b, i64 %indvars.iv, !dbg !118
  %20 = load float* %arrayidx43, align 4, !dbg !118, !tbaa !81
  %sub44 = fsub float %20, %mul41, !dbg !118
  store float %sub44, float* %arrayidx43, align 4, !dbg !118, !tbaa !81
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !113
  %incdec.ptr47 = getelementptr inbounds float* %uik.0225, i64 1, !dbg !119
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr47, i64 0, metadata !30, metadata !40), !dbg !109
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !113
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv252, !dbg !113
  br i1 %exitcond, label %for.inc49, label %for.body38, !dbg !113

for.inc49:                                        ; preds = %for.body38
  %cmp24 = icmp sgt i64 %indvars.iv254.in, 1, !dbg !67
  %indvars.iv.next253 = add nsw i32 %indvars.iv252, -1, !dbg !72
  br i1 %cmp24, label %for.body25, label %return, !dbg !72

for.body54:                                       ; preds = %for.end72, %for.body54.lr.ph
  %indvars.iv274 = phi i64 [ 0, %for.body54.lr.ph ], [ %indvars.iv.next275, %for.end72 ]
  %indvars.iv271 = phi i32 [ -1, %for.body54.lr.ph ], [ %indvars.iv.next272, %for.end72 ]
  %arrayidx57 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv274, !dbg !120
  %21 = load float** %arrayidx57, align 8, !dbg !120, !tbaa !75
  %add.ptr59 = getelementptr inbounds float* %21, i64 %indvars.iv274, !dbg !120
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !28, metadata !40), !dbg !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !40), !dbg !108
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !27, metadata !40), !dbg !83
  tail call void @llvm.dbg.value(metadata float* %21, i64 0, metadata !30, metadata !40), !dbg !109
  tail call void @llvm.dbg.value(metadata float* %b, i64 0, metadata !31, metadata !40), !dbg !122
  %cmp64244 = icmp sgt i64 %indvars.iv274, 0, !dbg !123
  br i1 %cmp64244, label %for.body65, label %for.end72, !dbg !126

for.body65:                                       ; preds = %for.body54, %for.body65
  %i.2248 = phi i32 [ %inc69, %for.body65 ], [ 0, %for.body54 ]
  %bi.0247 = phi float* [ %incdec.ptr71, %for.body65 ], [ %b, %for.body54 ]
  %uik.1246 = phi float* [ %incdec.ptr70, %for.body65 ], [ %21, %for.body54 ]
  %t.0245 = phi float [ %add67, %for.body65 ], [ 0.000000e+00, %for.body54 ]
  %22 = load float* %uik.1246, align 4, !dbg !127, !tbaa !81
  %23 = load float* %bi.0247, align 4, !dbg !128, !tbaa !81
  %mul66 = fmul float %22, %23, !dbg !129
  %add67 = fadd float %t.0245, %mul66, !dbg !130
  tail call void @llvm.dbg.value(metadata float %add67, i64 0, metadata !27, metadata !40), !dbg !83
  %inc69 = add nuw nsw i32 %i.2248, 1, !dbg !131
  tail call void @llvm.dbg.value(metadata i32 %inc69, i64 0, metadata !32, metadata !40), !dbg !108
  %incdec.ptr70 = getelementptr inbounds float* %uik.1246, i64 1, !dbg !132
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr70, i64 0, metadata !30, metadata !40), !dbg !109
  %incdec.ptr71 = getelementptr inbounds float* %bi.0247, i64 1, !dbg !133
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr71, i64 0, metadata !31, metadata !40), !dbg !122
  %exitcond273 = icmp eq i32 %i.2248, %indvars.iv271, !dbg !126
  br i1 %exitcond273, label %for.end72, label %for.body65, !dbg !126

for.end72:                                        ; preds = %for.body65, %for.body54
  %t.0.lcssa = phi float [ 0.000000e+00, %for.body54 ], [ %add67, %for.body65 ]
  %arrayidx74 = getelementptr inbounds float* %b, i64 %indvars.iv274, !dbg !134
  %24 = load float* %arrayidx74, align 4, !dbg !134, !tbaa !81
  %sub75 = fsub float %24, %t.0.lcssa, !dbg !134
  %25 = load float* %add.ptr59, align 4, !dbg !135, !tbaa !81
  %div76 = fdiv float %sub75, %25, !dbg !136
  store float %div76, float* %arrayidx74, align 4, !dbg !137, !tbaa !81
  %indvars.iv.next275 = add nuw nsw i64 %indvars.iv274, 1, !dbg !61
  %indvars.iv.next272 = add nsw i32 %indvars.iv271, 1, !dbg !61
  %lftr.wideiv276 = trunc i64 %indvars.iv274 to i32, !dbg !61
  %exitcond277 = icmp eq i32 %lftr.wideiv276, %1, !dbg !61
  br i1 %exitcond277, label %for.end81, label %for.body54, !dbg !61

for.end81:                                        ; preds = %for.end72, %for.cond52.preheader
  %sub82 = add nsw i32 %0, -2, !dbg !138
  tail call void @llvm.dbg.value(metadata i32* %add.ptr84, i64 0, metadata !24, metadata !40), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 %sub82, i64 0, metadata !33, metadata !40), !dbg !56
  %cmp87241 = icmp sgt i32 %sub82, -1, !dbg !139
  br i1 %cmp87241, label %for.body88.lr.ph, label %return, !dbg !144

for.body88.lr.ph:                                 ; preds = %for.end81
  %idx.ext83 = sext i32 %sub82 to i64, !dbg !145
  %add.ptr84 = getelementptr inbounds i32* %ipvt, i64 %idx.ext83, !dbg !145
  %26 = add i32 %0, -1, !dbg !144
  %27 = add i32 %0, -2, !dbg !144
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64, !dbg !144
  br label %for.body88, !dbg !144

for.body88:                                       ; preds = %for.body88.lr.ph, %for.inc123
  %indvars.iv267 = phi i64 [ %28, %for.body88.lr.ph ], [ %indvars.iv.next268, %for.inc123 ]
  %ipvt.addr.1243 = phi i32* [ %add.ptr84, %for.body88.lr.ph ], [ %incdec.ptr125, %for.inc123 ]
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !27, metadata !40), !dbg !83
  %add.ptr94.sum = add nsw i64 %indvars.iv267, 1, !dbg !146
  tail call void @llvm.dbg.value(metadata float* %add.ptr95, i64 0, metadata !29, metadata !40), !dbg !92
  %add.ptr97 = getelementptr inbounds float* %b, i64 %indvars.iv267, !dbg !149
  tail call void @llvm.dbg.value(metadata float* %add.ptr98, i64 0, metadata !31, metadata !40), !dbg !122
  %30 = add nsw i64 %indvars.iv267, 1, !dbg !150
  %cmp100236 = icmp slt i64 %30, %29, !dbg !151
  br i1 %cmp100236, label %for.body101.lr.ph, label %for.end108, !dbg !153

for.body101.lr.ph:                                ; preds = %for.body88
  %add.ptr98 = getelementptr inbounds float* %b, i64 %add.ptr94.sum, !dbg !149
  %arrayidx92 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv267, !dbg !146
  %31 = load float** %arrayidx92, align 8, !dbg !146, !tbaa !75
  %add.ptr95 = getelementptr inbounds float* %31, i64 %add.ptr94.sum, !dbg !146
  %32 = trunc i64 %30 to i32, !dbg !153
  br label %for.body101, !dbg !153

for.body101:                                      ; preds = %for.body101, %for.body101.lr.ph
  %i.3240 = phi i32 [ %32, %for.body101.lr.ph ], [ %i.3, %for.body101 ]
  %bi.1239 = phi float* [ %add.ptr98, %for.body101.lr.ph ], [ %incdec.ptr107, %for.body101 ]
  %mik.1238 = phi float* [ %add.ptr95, %for.body101.lr.ph ], [ %incdec.ptr106, %for.body101 ]
  %t.1237 = phi float [ 0.000000e+00, %for.body101.lr.ph ], [ %add103, %for.body101 ]
  %33 = load float* %mik.1238, align 4, !dbg !154, !tbaa !81
  %34 = load float* %bi.1239, align 4, !dbg !155, !tbaa !81
  %mul102 = fmul float %33, %34, !dbg !156
  %add103 = fadd float %t.1237, %mul102, !dbg !157
  tail call void @llvm.dbg.value(metadata float %add103, i64 0, metadata !27, metadata !40), !dbg !83
  %incdec.ptr106 = getelementptr inbounds float* %mik.1238, i64 1, !dbg !158
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr106, i64 0, metadata !29, metadata !40), !dbg !92
  %incdec.ptr107 = getelementptr inbounds float* %bi.1239, i64 1, !dbg !159
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr107, i64 0, metadata !31, metadata !40), !dbg !122
  %i.3 = add nsw i32 %i.3240, 1, !dbg !150
  %exitcond266 = icmp eq i32 %i.3240, %26, !dbg !153
  br i1 %exitcond266, label %for.end108, label %for.body101, !dbg !153

for.end108:                                       ; preds = %for.body101, %for.body88
  %t.1.lcssa = phi float [ 0.000000e+00, %for.body88 ], [ %add103, %for.body101 ]
  %35 = load float* %add.ptr97, align 4, !dbg !160, !tbaa !81
  %add111 = fadd float %t.1.lcssa, %35, !dbg !160
  store float %add111, float* %add.ptr97, align 4, !dbg !160, !tbaa !81
  %36 = load i32* %ipvt.addr.1243, align 4, !dbg !161, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %36, i64 0, metadata !34, metadata !40), !dbg !79
  %37 = trunc i64 %indvars.iv267 to i32, !dbg !162
  %cmp112 = icmp eq i32 %36, %37, !dbg !162
  br i1 %cmp112, label %for.inc123, label %if.end114, !dbg !164

if.end114:                                        ; preds = %for.end108
  %idxprom115 = sext i32 %36 to i64, !dbg !165
  %arrayidx116 = getelementptr inbounds float* %b, i64 %idxprom115, !dbg !165
  %38 = load float* %arrayidx116, align 4, !dbg !165, !tbaa !81
  tail call void @llvm.dbg.value(metadata float %38, i64 0, metadata !27, metadata !40), !dbg !83
  store float %add111, float* %arrayidx116, align 4, !dbg !166, !tbaa !81
  store float %38, float* %add.ptr97, align 4, !dbg !167, !tbaa !81
  br label %for.inc123, !dbg !168

for.inc123:                                       ; preds = %for.end108, %if.end114
  %incdec.ptr125 = getelementptr inbounds i32* %ipvt.addr.1243, i64 -1, !dbg !169
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr125, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp87 = icmp sgt i64 %indvars.iv267, 0, !dbg !139
  %indvars.iv.next268 = add nsw i64 %indvars.iv267, -1, !dbg !144
  br i1 %cmp87, label %for.body88, label %return, !dbg !144

return:                                           ; preds = %for.inc123, %for.body25, %for.inc49, %for.end81, %for.cond23.preheader
  ret i32 0, !dbg !170
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c] [DW_LANG_C99]
!1 = !{!"sgesl.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00sgesl\00sgesl\00\0011\000\001\000\000\000\001\0042", !1, !5, !6, null, i32 (%struct.FULL*, i32*, float*, i32)* @sgesl, null, null, !22} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 42] [sgesl]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !21, !17, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = !{!"0x13\00FULL\0031\0064064\0064\000\000\000", !11, null, null, !12, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = !{!"./ge.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!12 = !{!13, !14, !15}
!13 = !{!"0xd\00cd\0032\0032\0032\000\000", !11, !10, !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = !{!"0xd\00rd\0033\0032\0032\0032\000", !11, !10, !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = !{!"0xd\00pd\0034\0064000\0064\0064\000", !11, !10, !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !17, !19, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = !{!20}
!20 = !{!"0x21\000\001000"}                       ; [ DW_TAG_subrange_type ] [0, 999]
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!23 = !{!"0x101\00a\0016777228\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!24 = !{!"0x101\00ipvt\0033554445\000", !4, !5, !21} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!25 = !{!"0x101\00b\0050331662\000", !4, !5, !17} ; [ DW_TAG_arg_variable ] [b] [line 14]
!26 = !{!"0x101\00job\0067108877\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [job] [line 13]
!27 = !{!"0x100\00t\0043\000", !4, !5, !18}       ; [ DW_TAG_auto_variable ] [t] [line 43]
!28 = !{!"0x100\00akk\0044\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [akk] [line 44]
!29 = !{!"0x100\00mik\0044\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [mik] [line 44]
!30 = !{!"0x100\00uik\0044\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [uik] [line 44]
!31 = !{!"0x100\00bi\0044\000", !4, !5, !17}      ; [ DW_TAG_auto_variable ] [bi] [line 44]
!32 = !{!"0x100\00i\0045\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 45]
!33 = !{!"0x100\00k\0045\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [k] [line 45]
!34 = !{!"0x100\00l\0046\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [l] [line 46]
!35 = !{!"0x100\00n\0046\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 46]
!36 = !{!"0x100\00nm1\0046\000", !4, !5, !8}      ; [ DW_TAG_auto_variable ] [nm1] [line 46]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!41 = !MDLocation(line: 12, column: 14, scope: !4)
!42 = !MDLocation(line: 13, column: 11, scope: !4)
!43 = !MDLocation(line: 14, column: 11, scope: !4)
!44 = !MDLocation(line: 13, column: 17, scope: !4)
!45 = !MDLocation(line: 48, column: 9, scope: !4)
!46 = !{!47, !48, i64 0}
!47 = !{!"FULL", !48, i64 0, !48, i64 4, !49, i64 8}
!48 = !{!"int", !49, i64 0}
!49 = !{!"omnipotent char", !50, i64 0}
!50 = !{!"Simple C/C++ TBAA"}
!51 = !MDLocation(line: 46, column: 10, scope: !4)
!52 = !MDLocation(line: 49, column: 9, scope: !4)
!53 = !MDLocation(line: 46, column: 13, scope: !4)
!54 = !MDLocation(line: 52, column: 7, scope: !55)
!55 = !{!"0xb\0052\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!56 = !MDLocation(line: 45, column: 19, scope: !4)
!57 = !MDLocation(line: 52, column: 7, scope: !4)
!58 = !MDLocation(line: 80, column: 13, scope: !59)
!59 = !{!"0xb\0080\003\0015", !1, !60}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!60 = !{!"0xb\0080\003\0014", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!61 = !MDLocation(line: 80, column: 3, scope: !60)
!62 = !MDLocation(line: 54, column: 15, scope: !63)
!63 = !{!"0xb\0054\005\003", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!64 = !{!"0xb\0054\005\002", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!65 = !{!"0xb\0052\0018\001", !1, !55}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!66 = !MDLocation(line: 54, column: 5, scope: !64)
!67 = !MDLocation(line: 69, column: 17, scope: !68)
!68 = !{!"0xb\002", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!69 = !{!"0xb\001", !1, !70}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!70 = !{!"0xb\0069\005\0010", !1, !71}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!71 = !{!"0xb\0069\005\009", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!72 = !MDLocation(line: 69, column: 5, scope: !71)
!73 = !MDLocation(line: 55, column: 13, scope: !74)
!74 = !{!"0xb\0054\0036\004", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!75 = !{!76, !76, i64 0}
!76 = !{!"any pointer", !49, i64 0}
!77 = !MDLocation(line: 58, column: 11, scope: !74)
!78 = !{!48, !48, i64 0}
!79 = !MDLocation(line: 46, column: 7, scope: !4)
!80 = !MDLocation(line: 59, column: 11, scope: !74)
!81 = !{!82, !82, i64 0}
!82 = !{!"float", !49, i64 0}
!83 = !MDLocation(line: 43, column: 9, scope: !4)
!84 = !MDLocation(line: 60, column: 11, scope: !85)
!85 = !{!"0xb\0060\0011\005", !1, !74}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!86 = !MDLocation(line: 60, column: 11, scope: !74)
!87 = !MDLocation(line: 61, column: 9, scope: !88)
!88 = !{!"0xb\0060\0020\006", !1, !85}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!89 = !MDLocation(line: 61, column: 2, scope: !88)
!90 = !MDLocation(line: 62, column: 2, scope: !88)
!91 = !MDLocation(line: 63, column: 7, scope: !88)
!92 = !MDLocation(line: 44, column: 16, scope: !4)
!93 = !MDLocation(line: 64, column: 30, scope: !94)
!94 = !{!"0xb\0064\007\008", !1, !95}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!95 = !{!"0xb\0064\007\007", !1, !74}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!96 = !MDLocation(line: 64, column: 7, scope: !95)
!97 = !MDLocation(line: 64, column: 23, scope: !95)
!98 = !MDLocation(line: 65, column: 11, scope: !94)
!99 = !MDLocation(line: 65, column: 10, scope: !94)
!100 = !MDLocation(line: 65, column: 2, scope: !94)
!101 = !MDLocation(line: 64, column: 40, scope: !94)
!102 = !MDLocation(line: 54, column: 27, scope: !63)
!103 = !MDLocation(line: 70, column: 13, scope: !104)
!104 = !{!"0xb\0069\0029\0011", !1, !70}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!105 = !MDLocation(line: 44, column: 10, scope: !4)
!106 = !MDLocation(line: 71, column: 16, scope: !104)
!107 = !MDLocation(line: 71, column: 7, scope: !104)
!108 = !MDLocation(line: 45, column: 16, scope: !4)
!109 = !MDLocation(line: 44, column: 22, scope: !4)
!110 = !MDLocation(line: 72, column: 31, scope: !111)
!111 = !{!"0xb\0072\007\0013", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!112 = !{!"0xb\0072\007\0012", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!113 = !MDLocation(line: 72, column: 7, scope: !112)
!114 = !MDLocation(line: 72, column: 21, scope: !112)
!115 = !MDLocation(line: 73, column: 11, scope: !111)
!116 = !MDLocation(line: 73, column: 17, scope: !111)
!117 = !MDLocation(line: 73, column: 10, scope: !111)
!118 = !MDLocation(line: 73, column: 2, scope: !111)
!119 = !MDLocation(line: 72, column: 41, scope: !111)
!120 = !MDLocation(line: 81, column: 11, scope: !121)
!121 = !{!"0xb\0080\0024\0016", !1, !59}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!122 = !MDLocation(line: 44, column: 28, scope: !4)
!123 = !MDLocation(line: 82, column: 42, scope: !124)
!124 = !{!"0xb\0082\005\0018", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!125 = !{!"0xb\0082\005\0017", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!126 = !MDLocation(line: 82, column: 5, scope: !125)
!127 = !MDLocation(line: 83, column: 13, scope: !124)
!128 = !MDLocation(line: 83, column: 20, scope: !124)
!129 = !MDLocation(line: 83, column: 12, scope: !124)
!130 = !MDLocation(line: 83, column: 7, scope: !124)
!131 = !MDLocation(line: 82, column: 47, scope: !124)
!132 = !MDLocation(line: 82, column: 52, scope: !124)
!133 = !MDLocation(line: 82, column: 59, scope: !124)
!134 = !MDLocation(line: 84, column: 13, scope: !121)
!135 = !MDLocation(line: 84, column: 26, scope: !121)
!136 = !MDLocation(line: 84, column: 12, scope: !121)
!137 = !MDLocation(line: 84, column: 5, scope: !121)
!138 = !MDLocation(line: 89, column: 11, scope: !4)
!139 = !MDLocation(line: 90, column: 15, scope: !140)
!140 = !{!"0xb\002", !1, !141}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!141 = !{!"0xb\001", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!142 = !{!"0xb\0090\003\0020", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!143 = !{!"0xb\0090\003\0019", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!144 = !MDLocation(line: 90, column: 3, scope: !143)
!145 = !MDLocation(line: 89, column: 3, scope: !4)
!146 = !MDLocation(line: 91, column: 28, scope: !147)
!147 = !{!"0xb\0091\005\0022", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!148 = !{!"0xb\0090\0035\0021", !1, !142}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!149 = !MDLocation(line: 91, column: 45, scope: !147)
!150 = !MDLocation(line: 91, column: 12, scope: !147)
!151 = !MDLocation(line: 91, column: 52, scope: !152)
!152 = !{!"0xb\0091\005\0023", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!153 = !MDLocation(line: 91, column: 5, scope: !147)
!154 = !MDLocation(line: 92, column: 13, scope: !152)
!155 = !MDLocation(line: 92, column: 20, scope: !152)
!156 = !MDLocation(line: 92, column: 12, scope: !152)
!157 = !MDLocation(line: 92, column: 7, scope: !152)
!158 = !MDLocation(line: 91, column: 62, scope: !152)
!159 = !MDLocation(line: 91, column: 69, scope: !152)
!160 = !MDLocation(line: 93, column: 5, scope: !148)
!161 = !MDLocation(line: 96, column: 12, scope: !148)
!162 = !MDLocation(line: 97, column: 9, scope: !163)
!163 = !{!"0xb\0097\009\0024", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!164 = !MDLocation(line: 97, column: 9, scope: !148)
!165 = !MDLocation(line: 98, column: 12, scope: !148)
!166 = !MDLocation(line: 99, column: 5, scope: !148)
!167 = !MDLocation(line: 100, column: 5, scope: !148)
!168 = !MDLocation(line: 101, column: 3, scope: !148)
!169 = !MDLocation(line: 90, column: 26, scope: !142)
!170 = !MDLocation(line: 103, column: 1, scope: !4)
