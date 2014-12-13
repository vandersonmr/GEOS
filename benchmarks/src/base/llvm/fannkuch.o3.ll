; ModuleID = 'fannkuch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !51
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !51
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !15), !dbg !53
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !54) #3, !dbg !56
  tail call void @llvm.dbg.value(metadata !57, i64 0, metadata !58) #3, !dbg !59
  %1 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !60
  %2 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !61
  %3 = bitcast i8* %2 to i32*, !dbg !61
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !62) #3, !dbg !61
  %4 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !63
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !65) #3, !dbg !66
  store i32 0, i32* %3, align 4, !dbg !66, !tbaa !68
  %5 = getelementptr inbounds i8* %2, i64 4, !dbg !66
  %6 = bitcast i8* %5 to i32*, !dbg !66
  store i32 1, i32* %6, align 4, !dbg !66, !tbaa !68
  %7 = getelementptr inbounds i8* %2, i64 8, !dbg !66
  %8 = bitcast i8* %7 to i32*, !dbg !66
  store i32 2, i32* %8, align 4, !dbg !66, !tbaa !68
  %9 = getelementptr inbounds i8* %2, i64 12, !dbg !66
  %10 = bitcast i8* %9 to i32*, !dbg !66
  store i32 3, i32* %10, align 4, !dbg !66, !tbaa !68
  %11 = getelementptr inbounds i8* %2, i64 16, !dbg !66
  %12 = bitcast i8* %11 to i32*, !dbg !66
  store i32 4, i32* %12, align 4, !dbg !66, !tbaa !68
  %13 = getelementptr inbounds i8* %2, i64 20, !dbg !66
  %14 = bitcast i8* %13 to i32*, !dbg !66
  store i32 5, i32* %14, align 4, !dbg !66, !tbaa !68
  %15 = getelementptr inbounds i8* %2, i64 24, !dbg !66
  %16 = bitcast i8* %15 to i32*, !dbg !66
  store i32 6, i32* %16, align 4, !dbg !66, !tbaa !68
  %17 = getelementptr inbounds i8* %2, i64 28, !dbg !66
  %18 = bitcast i8* %17 to i32*, !dbg !66
  store i32 7, i32* %18, align 4, !dbg !66, !tbaa !68
  %19 = getelementptr inbounds i8* %2, i64 32, !dbg !66
  %20 = bitcast i8* %19 to i32*, !dbg !66
  store i32 8, i32* %20, align 4, !dbg !66, !tbaa !68
  %21 = getelementptr inbounds i8* %2, i64 36, !dbg !66
  %22 = bitcast i8* %21 to i32*, !dbg !66
  store i32 9, i32* %22, align 4, !dbg !66, !tbaa !68
  %23 = getelementptr inbounds i8* %2, i64 40, !dbg !66
  %24 = bitcast i8* %23 to i32*, !dbg !66
  store i32 10, i32* %24, align 4, !dbg !66, !tbaa !68
  %25 = bitcast i8* %1 to i32*, !dbg !60
  %26 = bitcast i8* %4 to i32*, !dbg !63
  %scevgep.i = getelementptr i8* %1, i64 4
  br label %.loopexit.i, !dbg !72

.loopexit.i:                                      ; preds = %._crit_edge18.i, %0
  %r.0.i = phi i32 [ 11, %0 ], [ %107, %._crit_edge18.i ]
  %didpr.0.i = phi i32 [ 0, %0 ], [ %didpr.1.ph.i, %._crit_edge18.i ]
  %flipsMax.0.i = phi i64 [ 0, %0 ], [ %flipsMax.1.ph.i, %._crit_edge18.i ]
  %27 = icmp slt i32 %didpr.0.i, 30, !dbg !72
  br i1 %27, label %.preheader3.i, label %.preheader2.i, !dbg !72

.preheader3.i:                                    ; preds = %.loopexit.i
  %28 = load i32* %3, align 4, !dbg !74, !tbaa !68
  %29 = add nsw i32 %28, 1, !dbg !74
  %30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %29) #3, !dbg !74
  %31 = load i32* %6, align 4, !dbg !74, !tbaa !68
  %32 = add nsw i32 %31, 1, !dbg !74
  %33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %32) #3, !dbg !74
  %34 = load i32* %8, align 4, !dbg !74, !tbaa !68
  %35 = add nsw i32 %34, 1, !dbg !74
  %36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %35) #3, !dbg !74
  %37 = load i32* %10, align 4, !dbg !74, !tbaa !68
  %38 = add nsw i32 %37, 1, !dbg !74
  %39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %38) #3, !dbg !74
  %40 = load i32* %12, align 4, !dbg !74, !tbaa !68
  %41 = add nsw i32 %40, 1, !dbg !74
  %42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %41) #3, !dbg !74
  %43 = load i32* %14, align 4, !dbg !74, !tbaa !68
  %44 = add nsw i32 %43, 1, !dbg !74
  %45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %44) #3, !dbg !74
  %46 = load i32* %16, align 4, !dbg !74, !tbaa !68
  %47 = add nsw i32 %46, 1, !dbg !74
  %48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %47) #3, !dbg !74
  %49 = load i32* %18, align 4, !dbg !74, !tbaa !68
  %50 = add nsw i32 %49, 1, !dbg !74
  %51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %50) #3, !dbg !74
  %52 = load i32* %20, align 4, !dbg !74, !tbaa !68
  %53 = add nsw i32 %52, 1, !dbg !74
  %54 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %53) #3, !dbg !74
  %55 = load i32* %22, align 4, !dbg !74, !tbaa !68
  %56 = add nsw i32 %55, 1, !dbg !74
  %57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %56) #3, !dbg !74
  %58 = load i32* %24, align 4, !dbg !74, !tbaa !68
  %59 = add nsw i32 %58, 1, !dbg !74
  %60 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %59) #3, !dbg !74
  %putchar.i = tail call i32 @putchar(i32 10) #3, !dbg !77
  %61 = add nsw i32 %didpr.0.i, 1, !dbg !78
  tail call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !79) #3, !dbg !78
  br label %.preheader2.i, !dbg !80

.preheader2.i:                                    ; preds = %.preheader3.i, %.loopexit.i
  %didpr.1.ph.i = phi i32 [ %didpr.0.i, %.loopexit.i ], [ %61, %.preheader3.i ]
  %62 = icmp eq i32 %r.0.i, 1, !dbg !81
  br i1 %62, label %._crit_edge.i, label %.lr.ph.i, !dbg !81

.lr.ph.i:                                         ; preds = %.preheader2.i
  %63 = sext i32 %r.0.i to i64
  %64 = add i32 %r.0.i, -2, !dbg !81
  %65 = zext i32 %64 to i64
  %66 = add i64 %65, 1, !dbg !81
  %end.idx16 = add i64 %65, 1
  %n.vec18 = and i64 %66, 8589934584
  %cmp.zero20 = icmp eq i64 %n.vec18, 0
  %rev.ind.end = sub i64 %63, %n.vec18
  br i1 %cmp.zero20, label %middle.block13, label %vector.body12

vector.body12:                                    ; preds = %.lr.ph.i, %vector.body12
  %index15 = phi i64 [ %index.next23, %vector.body12 ], [ 0, %.lr.ph.i ]
  %reverse.idx = sub i64 %63, %index15
  %broadcast.splatinsert24 = insertelement <4 x i64> undef, i64 %reverse.idx, i32 0
  %broadcast.splat25 = shufflevector <4 x i64> %broadcast.splatinsert24, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction26 = add <4 x i64> %broadcast.splat25, <i64 0, i64 -1, i64 -2, i64 -3>
  %induction27 = add <4 x i64> %broadcast.splat25, <i64 -4, i64 -5, i64 -6, i64 -7>
  %67 = trunc <4 x i64> %induction26 to <4 x i32>, !dbg !83
  %68 = trunc <4 x i64> %induction27 to <4 x i32>, !dbg !83
  %reverse = shufflevector <4 x i32> %67, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !83
  %.sum = add i64 %reverse.idx, -4, !dbg !83
  %69 = getelementptr i32* %26, i64 %.sum, !dbg !83
  %70 = bitcast i32* %69 to <4 x i32>*, !dbg !83
  store <4 x i32> %reverse, <4 x i32>* %70, align 4, !dbg !83
  %reverse28 = shufflevector <4 x i32> %68, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !83
  %.sum30 = add i64 %reverse.idx, -8, !dbg !83
  %71 = getelementptr i32* %26, i64 %.sum30, !dbg !83
  %72 = bitcast i32* %71 to <4 x i32>*, !dbg !83
  store <4 x i32> %reverse28, <4 x i32>* %72, align 4, !dbg !83
  %index.next23 = add i64 %index15, 8
  %73 = icmp eq i64 %index.next23, %n.vec18
  br i1 %73, label %middle.block13, label %vector.body12, !llvm.loop !85

middle.block13:                                   ; preds = %vector.body12, %.lr.ph.i
  %resume.val21 = phi i64 [ %63, %.lr.ph.i ], [ %rev.ind.end, %vector.body12 ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i ], [ %n.vec18, %vector.body12 ]
  %cmp.n22 = icmp eq i64 %end.idx16, %new.indc.resume.val
  br i1 %cmp.n22, label %._crit_edge.i, label %scalar.ph14

scalar.ph14:                                      ; preds = %middle.block13, %scalar.ph14
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %scalar.ph14 ], [ %resume.val21, %middle.block13 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1, !dbg !81
  %74 = getelementptr inbounds i32* %26, i64 %indvars.iv.next.i, !dbg !83
  %75 = trunc i64 %indvars.iv.i to i32, !dbg !83
  store i32 %75, i32* %74, align 4, !dbg !83, !tbaa !68
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !89) #3, !dbg !81
  %76 = trunc i64 %indvars.iv.next.i to i32, !dbg !81
  %77 = icmp eq i32 %76, 1, !dbg !81
  br i1 %77, label %._crit_edge.i, label %scalar.ph14, !dbg !81, !llvm.loop !90

._crit_edge.i:                                    ; preds = %scalar.ph14, %middle.block13, %.preheader2.i
  %78 = load i32* %3, align 4, !dbg !91, !tbaa !68
  %79 = icmp eq i32 %78, 0, !dbg !91
  br i1 %79, label %.lr.ph20.i, label %80, !dbg !91

; <label>:80                                      ; preds = %._crit_edge.i
  %81 = load i32* %24, align 4, !dbg !91, !tbaa !68
  %82 = icmp eq i32 %81, 10, !dbg !91
  br i1 %82, label %.lr.ph20.i, label %.preheader1.i, !dbg !91

.preheader1.i:                                    ; preds = %80
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep.i, i8* %5, i64 40, i32 4, i1 false) #3, !dbg !92
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !95) #3, !dbg !96
  br label %83, !dbg !97

; <label>:83                                      ; preds = %._crit_edge14.i, %.preheader1.i
  %k.0.i = phi i32 [ %78, %.preheader1.i ], [ %96, %._crit_edge14.i ]
  %flips.0.i = phi i64 [ 0, %.preheader1.i ], [ %93, %._crit_edge14.i ]
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !65) #3, !dbg !98
  %j.09.i = add i32 %k.0.i, -1, !dbg !98
  %84 = icmp sgt i32 %j.09.i, 1, !dbg !98
  br i1 %84, label %.lr.ph13.i, label %._crit_edge14.i, !dbg !98

.lr.ph13.i:                                       ; preds = %83
  %85 = sext i32 %j.09.i to i64
  br label %86, !dbg !98

; <label>:86                                      ; preds = %86, %.lr.ph13.i
  %indvars.iv35.i = phi i64 [ 1, %.lr.ph13.i ], [ %indvars.iv.next36.i, %86 ]
  %indvars.iv32.i = phi i64 [ %85, %.lr.ph13.i ], [ %indvars.iv.next33.i, %86 ]
  %j.011.i = phi i32 [ %j.09.i, %.lr.ph13.i ], [ %j.0.i, %86 ]
  %87 = getelementptr inbounds i32* %25, i64 %indvars.iv35.i, !dbg !99
  %88 = load i32* %87, align 4, !dbg !99, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !100) #3, !dbg !99
  %89 = getelementptr inbounds i32* %25, i64 %indvars.iv32.i, !dbg !99
  %90 = load i32* %89, align 4, !dbg !99, !tbaa !68
  store i32 %90, i32* %87, align 4, !dbg !99, !tbaa !68
  store i32 %88, i32* %89, align 4, !dbg !99, !tbaa !68
  %indvars.iv.next36.i = add nuw nsw i64 %indvars.iv35.i, 1, !dbg !98
  %j.0.i = add nsw i32 %j.011.i, -1, !dbg !98
  %91 = trunc i64 %indvars.iv.next36.i to i32, !dbg !98
  %92 = icmp slt i32 %91, %j.0.i, !dbg !98
  %indvars.iv.next33.i = add nsw i64 %indvars.iv32.i, -1, !dbg !98
  br i1 %92, label %86, label %._crit_edge14.i, !dbg !98

._crit_edge14.i:                                  ; preds = %86, %83
  %93 = add nsw i64 %flips.0.i, 1, !dbg !101
  tail call void @llvm.dbg.value(metadata !{i64 %93}, i64 0, metadata !102) #3, !dbg !101
  %94 = sext i32 %k.0.i to i64, !dbg !103
  %95 = getelementptr inbounds i32* %25, i64 %94, !dbg !103
  %96 = load i32* %95, align 4, !dbg !103, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %96}, i64 0, metadata !104) #3, !dbg !103
  store i32 %k.0.i, i32* %95, align 4, !dbg !103, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %96}, i64 0, metadata !95) #3, !dbg !103
  %97 = icmp eq i32 %96, 0, !dbg !105
  br i1 %97, label %98, label %83, !dbg !105

; <label>:98                                      ; preds = %._crit_edge14.i
  %99 = icmp slt i64 %flipsMax.0.i, %93, !dbg !106
  tail call void @llvm.dbg.value(metadata !{i64 %93}, i64 0, metadata !108) #3, !dbg !109
  %.flipsMax.0.i = select i1 %99, i64 %93, i64 %flipsMax.0.i, !dbg !106
  br label %.lr.ph20.i, !dbg !106

.lr.ph20.i:                                       ; preds = %98, %80, %._crit_edge.i
  %100 = phi i32 [ %78, %98 ], [ 0, %._crit_edge.i ], [ %78, %80 ]
  %flipsMax.1.ph.i = phi i64 [ %.flipsMax.0.i, %98 ], [ %flipsMax.0.i, %._crit_edge.i ], [ %flipsMax.0.i, %80 ]
  br label %104, !dbg !111

; <label>:101                                     ; preds = %._crit_edge18.i
  %102 = trunc i64 %indvars.iv.next42.i to i32, !dbg !111
  %103 = icmp eq i32 %102, 11, !dbg !111
  br i1 %103, label %fannkuch.exit, label %._crit_edge47.i, !dbg !111

._crit_edge47.i:                                  ; preds = %101
  %.pre.i = load i32* %3, align 4, !dbg !113, !tbaa !68
  %indvar.next = add i32 %indvar, 1, !dbg !111
  br label %104, !dbg !111

; <label>:104                                     ; preds = %._crit_edge47.i, %.lr.ph20.i
  %indvar = phi i32 [ %indvar.next, %._crit_edge47.i ], [ 0, %.lr.ph20.i ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge47.i ], [ 1, %.lr.ph20.i ]
  %105 = phi i32 [ %.pre.i, %._crit_edge47.i ], [ %100, %.lr.ph20.i ]
  %indvars.iv41.i = phi i64 [ %indvars.iv.next42.i, %._crit_edge47.i ], [ 1, %.lr.ph20.i ]
  tail call void @llvm.dbg.value(metadata !{i32 %105}, i64 0, metadata !114) #3, !dbg !113
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !65) #3, !dbg !115
  %106 = zext i32 %indvar to i64
  %107 = trunc i64 %indvars.iv41.i to i32, !dbg !116
  %108 = icmp sgt i32 %107, 0, !dbg !116
  br i1 %108, label %.lr.ph17.i.preheader, label %._crit_edge18.i, !dbg !116

.lr.ph17.i.preheader:                             ; preds = %104
  %109 = add i64 %106, 1, !dbg !116
  %end.idx = add i64 %106, 1, !dbg !116
  %n.vec = and i64 %109, 8589934584, !dbg !116
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !116
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph17.i.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph17.i.preheader ], !dbg !116
  %110 = or i64 %index, 1, !dbg !117
  %111 = getelementptr inbounds i32* %3, i64 %110, !dbg !117
  %112 = bitcast i32* %111 to <4 x i32>*, !dbg !117
  %wide.load = load <4 x i32>* %112, align 4, !dbg !117
  %.sum3134 = or i64 %index, 5, !dbg !117
  %113 = getelementptr i32* %3, i64 %.sum3134, !dbg !117
  %114 = bitcast i32* %113 to <4 x i32>*, !dbg !117
  %wide.load8 = load <4 x i32>* %114, align 4, !dbg !117
  %115 = getelementptr inbounds i32* %3, i64 %index, !dbg !117
  %116 = bitcast i32* %115 to <4 x i32>*, !dbg !117
  store <4 x i32> %wide.load, <4 x i32>* %116, align 4, !dbg !117
  %.sum3233 = or i64 %index, 4, !dbg !117
  %117 = getelementptr i32* %3, i64 %.sum3233, !dbg !117
  %118 = bitcast i32* %117 to <4 x i32>*, !dbg !117
  store <4 x i32> %wide.load8, <4 x i32>* %118, align 4, !dbg !117
  %index.next = add i64 %index, 8, !dbg !116
  %119 = icmp eq i64 %index.next, %n.vec, !dbg !116
  br i1 %119, label %middle.block, label %vector.body, !dbg !116, !llvm.loop !119

middle.block:                                     ; preds = %vector.body, %.lr.ph17.i.preheader
  %resume.val = phi i64 [ 0, %.lr.ph17.i.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge18.i, label %.lr.ph17.i

.lr.ph17.i:                                       ; preds = %middle.block, %.lr.ph17.i
  %indvars.iv37.i = phi i64 [ %indvars.iv.next38.i, %.lr.ph17.i ], [ %resume.val, %middle.block ]
  %indvars.iv.next38.i = add nuw nsw i64 %indvars.iv37.i, 1, !dbg !116
  %120 = getelementptr inbounds i32* %3, i64 %indvars.iv.next38.i, !dbg !117
  %121 = load i32* %120, align 4, !dbg !117, !tbaa !68
  %122 = getelementptr inbounds i32* %3, i64 %indvars.iv37.i, !dbg !117
  store i32 %121, i32* %122, align 4, !dbg !117, !tbaa !68
  %lftr.wideiv = trunc i64 %indvars.iv.next38.i to i32, !dbg !116
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !116
  br i1 %exitcond, label %._crit_edge18.i, label %.lr.ph17.i, !dbg !116, !llvm.loop !120

._crit_edge18.i:                                  ; preds = %.lr.ph17.i, %middle.block, %104
  %123 = getelementptr inbounds i32* %3, i64 %indvars.iv41.i, !dbg !121
  store i32 %105, i32* %123, align 4, !dbg !121, !tbaa !68
  %124 = getelementptr inbounds i32* %26, i64 %indvars.iv41.i, !dbg !122
  %125 = load i32* %124, align 4, !dbg !122, !tbaa !68
  %126 = add nsw i32 %125, -1, !dbg !122
  store i32 %126, i32* %124, align 4, !dbg !122, !tbaa !68
  %127 = icmp sgt i32 %126, 0, !dbg !122
  %indvars.iv.next42.i = add nsw i64 %indvars.iv41.i, 1, !dbg !111
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !111
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next}, i64 0, metadata !89) #3, !dbg !124
  br i1 %127, label %.loopexit.i, label %101, !dbg !122

fannkuch.exit:                                    ; preds = %101
  %128 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 11, i64 %flipsMax.1.ph.i) #3, !dbg !55
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!48, !49}
!llvm.ident = !{!50}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fannkuch.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 99, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 100} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 100] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777315, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 99]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554531, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 99]
!15 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 101, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 101]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fannkuch", metadata !"fannkuch", metadata !"", i32 18, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !20, i32 19} ; [ DW_TAG_subprogram ] [line 18] [local] [def] [scope 19] [fannkuch]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !8}
!19 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!20 = metadata !{metadata !21, metadata !22, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !34, metadata !40, metadata !44}
!21 = metadata !{i32 786689, metadata !16, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 18]
!22 = metadata !{i32 786688, metadata !16, metadata !"perm", metadata !5, i32 20, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm] [line 20]
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!24 = metadata !{i32 786688, metadata !16, metadata !"perm1", metadata !5, i32 21, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!25 = metadata !{i32 786688, metadata !16, metadata !"count", metadata !5, i32 22, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 22]
!26 = metadata !{i32 786688, metadata !16, metadata !"flips", metadata !5, i32 23, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flips] [line 23]
!27 = metadata !{i32 786688, metadata !16, metadata !"flipsMax", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!28 = metadata !{i32 786688, metadata !16, metadata !"r", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 25]
!29 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 26]
!30 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 27]
!31 = metadata !{i32 786688, metadata !16, metadata !"didpr", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!32 = metadata !{i32 786688, metadata !16, metadata !"n1", metadata !5, i32 29, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 29]
!33 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!34 = metadata !{i32 786688, metadata !35, metadata !"j", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 59]
!35 = metadata !{i32 786443, metadata !1, metadata !36, i32 58, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 52, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!37 = metadata !{i32 786443, metadata !1, metadata !38, i32 52, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!38 = metadata !{i32 786443, metadata !1, metadata !39, i32 40, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!39 = metadata !{i32 786443, metadata !1, metadata !16, i32 40, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!40 = metadata !{i32 786688, metadata !41, metadata !"t_mp", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!41 = metadata !{i32 786443, metadata !1, metadata !42, i32 61, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 60, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!43 = metadata !{i32 786443, metadata !1, metadata !35, i32 60, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!44 = metadata !{i32 786688, metadata !45, metadata !"perm0", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 80, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!46 = metadata !{i32 786443, metadata !1, metadata !47, i32 75, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!47 = metadata !{i32 786443, metadata !1, metadata !38, i32 75, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!48 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!49 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!50 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!51 = metadata !{i32 99, i32 0, metadata !4, null}
!52 = metadata !{i32 11}
!53 = metadata !{i32 101, i32 0, metadata !4, null}
!54 = metadata !{i32 786689, metadata !16, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [n] [line 18]
!55 = metadata !{i32 103, i32 0, metadata !4, null}
!56 = metadata !{i32 18, i32 0, metadata !16, metadata !55}
!57 = metadata !{i32 10}
!58 = metadata !{i32 786688, metadata !16, metadata !"n1", metadata !5, i32 29, metadata !33, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [n1] [line 29]
!59 = metadata !{i32 29, i32 0, metadata !16, metadata !55}
!60 = metadata !{i32 33, i32 0, metadata !16, metadata !55}
!61 = metadata !{i32 34, i32 0, metadata !16, metadata !55}
!62 = metadata !{i32 786688, metadata !16, metadata !"perm1", metadata !5, i32 21, metadata !23, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!63 = metadata !{i32 35, i32 0, metadata !16, metadata !55}
!64 = metadata !{i32 0}
!65 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 26, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [i] [line 26]
!66 = metadata !{i32 37, i32 0, metadata !67, metadata !55}
!67 = metadata !{i32 786443, metadata !1, metadata !16, i32 37, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!68 = metadata !{metadata !69, metadata !69, i64 0}
!69 = metadata !{metadata !"int", metadata !70, i64 0}
!70 = metadata !{metadata !"omnipotent char", metadata !71, i64 0}
!71 = metadata !{metadata !"Simple C/C++ TBAA"}
!72 = metadata !{i32 41, i32 0, metadata !73, metadata !55}
!73 = metadata !{i32 786443, metadata !1, metadata !38, i32 41, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!74 = metadata !{i32 42, i32 0, metadata !75, metadata !55}
!75 = metadata !{i32 786443, metadata !1, metadata !76, i32 42, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!76 = metadata !{i32 786443, metadata !1, metadata !73, i32 41, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!77 = metadata !{i32 43, i32 0, metadata !76, metadata !55}
!78 = metadata !{i32 44, i32 0, metadata !76, metadata !55}
!79 = metadata !{i32 786688, metadata !16, metadata !"didpr", metadata !5, i32 28, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!80 = metadata !{i32 45, i32 0, metadata !76, metadata !55}
!81 = metadata !{i32 46, i32 0, metadata !82, metadata !55}
!82 = metadata !{i32 786443, metadata !1, metadata !38, i32 46, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!83 = metadata !{i32 47, i32 0, metadata !84, metadata !55}
!84 = metadata !{i32 786443, metadata !1, metadata !82, i32 46, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!85 = metadata !{metadata !85, metadata !86, metadata !87}
!86 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!87 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!88 = metadata !{i32 1}
!89 = metadata !{i32 786688, metadata !16, metadata !"r", metadata !5, i32 25, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [r] [line 25]
!90 = metadata !{metadata !90, metadata !86, metadata !87}
!91 = metadata !{i32 52, i32 0, metadata !37, metadata !55}
!92 = metadata !{i32 55, i32 0, metadata !93, metadata !55}
!93 = metadata !{i32 786443, metadata !1, metadata !94, i32 54, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!94 = metadata !{i32 786443, metadata !1, metadata !36, i32 54, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!95 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 27, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [k] [line 27]
!96 = metadata !{i32 57, i32 0, metadata !36, metadata !55}
!97 = metadata !{i32 58, i32 0, metadata !36, metadata !55} ; [ DW_TAG_imported_module ]
!98 = metadata !{i32 60, i32 0, metadata !43, metadata !55}
!99 = metadata !{i32 61, i32 0, metadata !41, metadata !55}
!100 = metadata !{i32 786688, metadata !41, metadata !"t_mp", metadata !5, i32 61, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!101 = metadata !{i32 63, i32 0, metadata !35, metadata !55}
!102 = metadata !{i32 786688, metadata !16, metadata !"flips", metadata !5, i32 23, metadata !19, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [flips] [line 23]
!103 = metadata !{i32 68, i32 0, metadata !35, metadata !55}
!104 = metadata !{i32 786688, metadata !35, metadata !"j", metadata !5, i32 59, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [j] [line 59]
!105 = metadata !{i32 69, i32 0, metadata !35, metadata !55}
!106 = metadata !{i32 70, i32 0, metadata !107, metadata !55}
!107 = metadata !{i32 786443, metadata !1, metadata !36, i32 70, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!108 = metadata !{i32 786688, metadata !16, metadata !"flipsMax", metadata !5, i32 24, metadata !19, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!109 = metadata !{i32 71, i32 0, metadata !110, metadata !55}
!110 = metadata !{i32 786443, metadata !1, metadata !107, i32 70, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!111 = metadata !{i32 76, i32 0, metadata !112, metadata !55}
!112 = metadata !{i32 786443, metadata !1, metadata !46, i32 76, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!113 = metadata !{i32 81, i32 0, metadata !45, metadata !55}
!114 = metadata !{i32 786688, metadata !45, metadata !"perm0", metadata !5, i32 81, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!115 = metadata !{i32 82, i32 0, metadata !45, metadata !55}
!116 = metadata !{i32 83, i32 0, metadata !45, metadata !55}
!117 = metadata !{i32 85, i32 0, metadata !118, metadata !55}
!118 = metadata !{i32 786443, metadata !1, metadata !45, i32 83, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!119 = metadata !{metadata !119, metadata !86, metadata !87}
!120 = metadata !{metadata !120, metadata !86, metadata !87}
!121 = metadata !{i32 88, i32 0, metadata !45, metadata !55}
!122 = metadata !{i32 90, i32 0, metadata !123, metadata !55}
!123 = metadata !{i32 786443, metadata !1, metadata !46, i32 90, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!124 = metadata !{i32 93, i32 0, metadata !46, metadata !55}
!125 = metadata !{i32 104, i32 0, metadata !4, null}
