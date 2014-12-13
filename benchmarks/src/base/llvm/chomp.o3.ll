; ModuleID = 'chomp.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._play = type { i32, i32*, %struct._list*, %struct._play* }
%struct._list = type { i32*, %struct._list* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@ncol = common global i32 0, align 4
@nrow = common global i32 0, align 4
@game_tree = common global %struct._play* null, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"  value = %d\0A\00", align 1
@wanted = common global %struct._list* null, align 8
@.str8 = private unnamed_addr constant [14 x i8] c" Selection : \00", align 1
@.str13 = private unnamed_addr constant [27 x i8] c"Enter number of Columns : \00", align 1
@.str14 = private unnamed_addr constant [27 x i8] c"Enter number of Rows    : \00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"player %d plays at (%d,%d)\0A\00", align 1
@.str16 = private unnamed_addr constant [17 x i8] c"player %d loses\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@str = private unnamed_addr constant [2 x i8] c")\00"
@str18 = private unnamed_addr constant [12 x i8] c"For state :\00"
@str19 = private unnamed_addr constant [19 x i8] c"We get, in order :\00"
@str20 = private unnamed_addr constant [33 x i8] c"Mode : 1 -> multiple first moves\00"
@str21 = private unnamed_addr constant [24 x i8] c"       2 -> report game\00"
@str22 = private unnamed_addr constant [27 x i8] c"       3 -> good positions\00"

; Function Attrs: nounwind uwtable
define noalias i32* @copy_data(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !11), !dbg !175
  %1 = load i32* @ncol, align 4, !dbg !176, !tbaa !177
  %2 = sext i32 %1 to i64, !dbg !176
  %3 = shl nsw i64 %2, 2, !dbg !176
  %4 = tail call noalias i8* @malloc(i64 %3) #4, !dbg !176
  %5 = bitcast i8* %4 to i32*, !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !12), !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !13), !dbg !181
  %6 = icmp eq i32 %1, 0, !dbg !182
  br i1 %6, label %._crit_edge, label %.lr.ph.preheader, !dbg !182

.lr.ph.preheader:                                 ; preds = %0
  %7 = add i32 %1, -1, !dbg !182
  %8 = zext i32 %7 to i64
  %9 = add i64 %8, 1, !dbg !182
  %end.idx = add i64 %8, 1
  %n.vec = and i64 %9, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %rev.ind.end = sub i64 %2, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.preheader ]
  %reverse.idx = sub i64 %2, %index
  %.sum = add i64 %reverse.idx, -4, !dbg !183
  %10 = getelementptr i32* %data, i64 %.sum, !dbg !183
  %11 = bitcast i32* %10 to <4 x i32>*, !dbg !183
  %wide.load = load <4 x i32>* %11, align 4, !dbg !183
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !183
  %.sum7 = add i64 %reverse.idx, -8, !dbg !183
  %12 = getelementptr i32* %data, i64 %.sum7, !dbg !183
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !183
  %wide.load2 = load <4 x i32>* %13, align 4, !dbg !183
  %reverse3 = shufflevector <4 x i32> %wide.load2, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !183
  %reverse4 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !183
  %.sum8 = add i64 %reverse.idx, -4, !dbg !183
  %14 = getelementptr i32* %5, i64 %.sum8, !dbg !183
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !183
  store <4 x i32> %reverse4, <4 x i32>* %15, align 4, !dbg !183
  %reverse5 = shufflevector <4 x i32> %reverse3, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !183
  %.sum10 = add i64 %reverse.idx, -8, !dbg !183
  %16 = getelementptr i32* %5, i64 %.sum10, !dbg !183
  %17 = bitcast i32* %16 to <4 x i32>*, !dbg !183
  store <4 x i32> %reverse5, <4 x i32>* %17, align 4, !dbg !183
  %index.next = add i64 %index, 8
  %18 = icmp eq i64 %index.next, %n.vec
  br i1 %18, label %middle.block, label %vector.body, !llvm.loop !184

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ %2, %.lr.ph.preheader ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %new.indc.resume.val
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val, %middle.block ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !182
  %19 = getelementptr inbounds i32* %data, i64 %indvars.iv.next, !dbg !183
  %20 = load i32* %19, align 4, !dbg !183, !tbaa !177
  %21 = getelementptr inbounds i32* %5, i64 %indvars.iv.next, !dbg !183
  store i32 %20, i32* %21, align 4, !dbg !183, !tbaa !177
  %22 = trunc i64 %indvars.iv.next to i32, !dbg !182
  %23 = icmp eq i32 %22, 0, !dbg !182
  br i1 %23, label %._crit_edge, label %.lr.ph, !dbg !182, !llvm.loop !187

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i32* %5, !dbg !188
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @next_data(i32* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !18), !dbg !189
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !19), !dbg !191
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !20), !dbg !192
  %1 = load i32* @ncol, align 4, !dbg !193, !tbaa !177
  %2 = icmp eq i32 %1, 0, !dbg !193
  br i1 %2, label %.critedge, label %.preheader, !dbg !193

.preheader:                                       ; preds = %0, %.outer
  %indvars.iv = phi i64 [ %indvars.iv.next, %.outer ], [ 0, %0 ]
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !194
  %.pre = load i32* %3, align 4, !dbg !194, !tbaa !177
  %4 = load i32* @nrow, align 4, !dbg !194, !tbaa !177
  %5 = icmp eq i32 %.pre, %4, !dbg !194
  br i1 %5, label %.outer, label %..critedge_crit_edge, !dbg !194

.outer:                                           ; preds = %.preheader
  store i32 0, i32* %3, align 4, !dbg !197, !tbaa !177
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !193
  %6 = load i32* @ncol, align 4, !dbg !193, !tbaa !177
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !193
  %8 = icmp eq i32 %7, %6, !dbg !193
  br i1 %8, label %.critedge, label %.preheader, !dbg !193

..critedge_crit_edge:                             ; preds = %.preheader
  %9 = add nsw i32 %.pre, 1, !dbg !199
  store i32 %9, i32* %3, align 4, !dbg !199, !tbaa !177
  tail call void @llvm.dbg.value(metadata !201, i64 0, metadata !20), !dbg !202
  br label %.critedge, !dbg !193

.critedge:                                        ; preds = %.outer, %0, %..critedge_crit_edge
  %valid.0.lcssa = phi i32 [ 1, %..critedge_crit_edge ], [ 0, %0 ], [ 0, %.outer ]
  ret i32 %valid.0.lcssa, !dbg !203
}

; Function Attrs: nounwind uwtable
define void @melt_data(i32* nocapture %data1, i32* nocapture readonly %data2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !25), !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !26), !dbg !204
  %1 = load i32* @ncol, align 4, !dbg !205, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !27), !dbg !205
  %2 = icmp eq i32 %1, 0, !dbg !206
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !206

.lr.ph:                                           ; preds = %0
  %3 = sext i32 %1 to i64
  br label %4, !dbg !206

; <label>:4                                       ; preds = %.lr.ph, %.backedge
  %indvars.iv = phi i64 [ %3, %.lr.ph ], [ %indvars.iv.next, %.backedge ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !206
  %5 = getelementptr inbounds i32* %data1, i64 %indvars.iv.next, !dbg !207
  %6 = load i32* %5, align 4, !dbg !207, !tbaa !177
  %7 = getelementptr inbounds i32* %data2, i64 %indvars.iv.next, !dbg !207
  %8 = load i32* %7, align 4, !dbg !207, !tbaa !177
  %9 = icmp sgt i32 %6, %8, !dbg !207
  br i1 %9, label %10, label %.backedge, !dbg !207

; <label>:10                                      ; preds = %4
  store i32 %8, i32* %5, align 4, !dbg !210, !tbaa !177
  br label %.backedge, !dbg !210

.backedge:                                        ; preds = %10, %4
  %11 = trunc i64 %indvars.iv.next to i32, !dbg !206
  %12 = icmp eq i32 %11, 0, !dbg !206
  br i1 %12, label %._crit_edge, label %4, !dbg !206

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !211
}

; Function Attrs: nounwind readonly uwtable
define i32 @equal_data(i32* nocapture readonly %data1, i32* nocapture readonly %data2) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !32), !dbg !212
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !33), !dbg !212
  %1 = load i32* @ncol, align 4, !dbg !213, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !34), !dbg !213
  %2 = sext i32 %1 to i64
  br label %3, !dbg !214

; <label>:3                                       ; preds = %6, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %6 ], [ %2, %0 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %4 = trunc i64 %indvars.iv to i32, !dbg !214
  %5 = icmp eq i32 %4, 0, !dbg !214
  br i1 %5, label %.critedge, label %6, !dbg !214

; <label>:6                                       ; preds = %3
  %7 = getelementptr inbounds i32* %data1, i64 %indvars.iv.next, !dbg !214
  %8 = load i32* %7, align 4, !dbg !214, !tbaa !177
  %9 = getelementptr inbounds i32* %data2, i64 %indvars.iv.next, !dbg !214
  %10 = load i32* %9, align 4, !dbg !214, !tbaa !177
  %11 = icmp eq i32 %8, %10, !dbg !214
  br i1 %11, label %3, label %.critedge

.critedge:                                        ; preds = %3, %6
  %counter.0.lcssa = phi i32 [ 0, %3 ], [ %4, %6 ]
  %12 = icmp slt i32 %counter.0.lcssa, 1, !dbg !215
  %13 = zext i1 %12 to i32, !dbg !215
  ret i32 %13, !dbg !215
}

; Function Attrs: nounwind readonly uwtable
define i32 @valid_data(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !37), !dbg !216
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !39), !dbg !217
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !38), !dbg !218
  %1 = load i32* @ncol, align 4, !dbg !219, !tbaa !177
  %2 = icmp eq i32 %1, 0, !dbg !219
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !219

.lr.ph:                                           ; preds = %0
  %3 = load i32* @nrow, align 4, !dbg !218, !tbaa !177
  br label %7, !dbg !219

; <label>:4                                       ; preds = %7
  %5 = trunc i64 %indvars.iv.next to i32, !dbg !219
  %6 = icmp eq i32 %5, %1, !dbg !219
  br i1 %6, label %._crit_edge, label %7, !dbg !219

; <label>:7                                       ; preds = %.lr.ph, %4
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %4 ]
  %low.01 = phi i32 [ %3, %.lr.ph ], [ %9, %4 ]
  %8 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !220
  %9 = load i32* %8, align 4, !dbg !220, !tbaa !177
  %10 = icmp sgt i32 %9, %low.01, !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !38), !dbg !223
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !39), !dbg !224
  br i1 %10, label %._crit_edge3, label %4, !dbg !220

._crit_edge3:                                     ; preds = %7
  %11 = trunc i64 %indvars.iv to i32, !dbg !220
  br label %._crit_edge, !dbg !220

._crit_edge:                                      ; preds = %4, %._crit_edge3, %0
  %12 = phi i32 [ %1, %._crit_edge3 ], [ 0, %0 ], [ %1, %4 ]
  %counter.0.lcssa = phi i32 [ %11, %._crit_edge3 ], [ 0, %0 ], [ %1, %4 ]
  %13 = icmp eq i32 %counter.0.lcssa, %12, !dbg !225
  %14 = zext i1 %13 to i32, !dbg !225
  ret i32 %14, !dbg !225
}

; Function Attrs: nounwind uwtable
define void @dump_list(%struct._list* %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !49), !dbg !226
  %1 = icmp eq %struct._list* %list, null, !dbg !227
  br i1 %1, label %9, label %2, !dbg !227

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct._list* %list, i64 0, i32 1, !dbg !229
  %4 = load %struct._list** %3, align 8, !dbg !229, !tbaa !231
  tail call void @dump_list(%struct._list* %4), !dbg !229
  %5 = getelementptr inbounds %struct._list* %list, i64 0, i32 0, !dbg !234
  %6 = load i32** %5, align 8, !dbg !234, !tbaa !235
  %7 = bitcast i32* %6 to i8*, !dbg !234
  tail call void @free(i8* %7) #4, !dbg !234
  %8 = bitcast %struct._list* %list to i8*, !dbg !236
  tail call void @free(i8* %8) #4, !dbg !236
  ret void, !dbg !237

; <label>:9                                       ; preds = %0
  ret void, !dbg !237
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @dump_play(%struct._play* %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !61), !dbg !238
  %1 = icmp eq %struct._play* %play, null, !dbg !239
  br i1 %1, label %11, label %2, !dbg !239

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct._play* %play, i64 0, i32 3, !dbg !241
  %4 = load %struct._play** %3, align 8, !dbg !241, !tbaa !243
  tail call void @dump_play(%struct._play* %4), !dbg !241
  %5 = getelementptr inbounds %struct._play* %play, i64 0, i32 2, !dbg !245
  %6 = load %struct._list** %5, align 8, !dbg !245, !tbaa !246
  tail call void @dump_list(%struct._list* %6), !dbg !245
  %7 = getelementptr inbounds %struct._play* %play, i64 0, i32 1, !dbg !247
  %8 = load i32** %7, align 8, !dbg !247, !tbaa !248
  %9 = bitcast i32* %8 to i8*, !dbg !247
  tail call void @free(i8* %9) #4, !dbg !247
  %10 = bitcast %struct._play* %play to i8*, !dbg !249
  tail call void @free(i8* %10) #4, !dbg !249
  ret void, !dbg !250

; <label>:11                                      ; preds = %0
  ret void, !dbg !250
}

; Function Attrs: nounwind readonly uwtable
define i32 @get_value(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !64), !dbg !251
  %1 = load i32* @ncol, align 4, !dbg !252, !tbaa !177
  %2 = sext i32 %1 to i64
  br label %3, !dbg !253

; <label>:3                                       ; preds = %equal_data.exit, %0
  %search.0.in = phi %struct._play** [ @game_tree, %0 ], [ %16, %equal_data.exit ]
  %search.0 = load %struct._play** %search.0.in, align 8, !dbg !254
  %4 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 1, !dbg !253
  %5 = load i32** %4, align 8, !dbg !253, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !255), !dbg !256
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !257), !dbg !256
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !258), !dbg !252
  br label %6, !dbg !259

; <label>:6                                       ; preds = %9, %3
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %9 ], [ %2, %3 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %7 = trunc i64 %indvars.iv.i to i32, !dbg !259
  %8 = icmp eq i32 %7, 0, !dbg !259
  br i1 %8, label %equal_data.exit.thread, label %9, !dbg !259

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds i32* %5, i64 %indvars.iv.next.i, !dbg !259
  %11 = load i32* %10, align 4, !dbg !259, !tbaa !177
  %12 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !259
  %13 = load i32* %12, align 4, !dbg !259, !tbaa !177
  %14 = icmp eq i32 %11, %13, !dbg !259
  br i1 %14, label %6, label %equal_data.exit

equal_data.exit:                                  ; preds = %9
  %15 = icmp slt i32 %7, 1, !dbg !260
  %16 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 3, !dbg !261
  br i1 %15, label %equal_data.exit.thread, label %3, !dbg !253

equal_data.exit.thread:                           ; preds = %equal_data.exit, %6
  %17 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 0, !dbg !262
  %18 = load i32* %17, align 4, !dbg !262, !tbaa !263
  ret i32 %18, !dbg !262
}

; Function Attrs: nounwind uwtable
define void @show_data(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !70), !dbg !264
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !71), !dbg !265
  %1 = load i32* @ncol, align 4, !dbg !266, !tbaa !177
  %2 = icmp eq i32 %1, 0, !dbg !266
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !266

.lr.ph:                                           ; preds = %0, %.backedge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.backedge ], [ 0, %0 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !266
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !267
  %4 = load i32* %3, align 4, !dbg !267, !tbaa !177
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %4) #4, !dbg !267
  %6 = load i32* @ncol, align 4, !dbg !269, !tbaa !177
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !269
  %8 = icmp eq i32 %7, %6, !dbg !269
  br i1 %8, label %.backedge, label %9, !dbg !269

; <label>:9                                       ; preds = %.lr.ph
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !272) #4, !dbg !273
  %10 = load %struct._IO_FILE** @stdout, align 8, !dbg !274, !tbaa !276
  %11 = tail call i32 @_IO_putc(i32 44, %struct._IO_FILE* %10) #4, !dbg !274
  %.pre = load i32* @ncol, align 4, !dbg !266, !tbaa !177
  br label %.backedge, !dbg !269

.backedge:                                        ; preds = %9, %.lr.ph
  %12 = phi i32 [ %.pre, %9 ], [ %6, %.lr.ph ]
  %13 = icmp eq i32 %7, %12, !dbg !266
  br i1 %13, label %._crit_edge, label %.lr.ph, !dbg !266

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !277
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define void @show_move(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !74), !dbg !278
  tail call void @llvm.dbg.value(metadata !279, i64 0, metadata !280) #4, !dbg !282
  %1 = load %struct._IO_FILE** @stdout, align 8, !dbg !283, !tbaa !276
  %2 = tail call i32 @_IO_putc(i32 40, %struct._IO_FILE* %1) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !284) #4, !dbg !286
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !287) #4, !dbg !288
  %3 = load i32* @ncol, align 4, !dbg !289, !tbaa !177
  %4 = icmp eq i32 %3, 0, !dbg !289
  br i1 %4, label %show_data.exit, label %.lr.ph.i, !dbg !289

.lr.ph.i:                                         ; preds = %0, %.backedge.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.backedge.i ], [ 0, %0 ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !289
  %5 = getelementptr inbounds i32* %data, i64 %indvars.iv.i, !dbg !290
  %6 = load i32* %5, align 4, !dbg !290, !tbaa !177
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %6) #4, !dbg !290
  %8 = load i32* @ncol, align 4, !dbg !291, !tbaa !177
  %9 = trunc i64 %indvars.iv.next.i to i32, !dbg !291
  %10 = icmp eq i32 %9, %8, !dbg !291
  br i1 %10, label %.backedge.i, label %11, !dbg !291

; <label>:11                                      ; preds = %.lr.ph.i
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !292) #4, !dbg !293
  %12 = load %struct._IO_FILE** @stdout, align 8, !dbg !294, !tbaa !276
  %13 = tail call i32 @_IO_putc(i32 44, %struct._IO_FILE* %12) #4, !dbg !294
  %.pre.i = load i32* @ncol, align 4, !dbg !289, !tbaa !177
  br label %.backedge.i, !dbg !291

.backedge.i:                                      ; preds = %11, %.lr.ph.i
  %14 = phi i32 [ %.pre.i, %11 ], [ %8, %.lr.ph.i ]
  %15 = icmp eq i32 %9, %14, !dbg !289
  br i1 %15, label %show_data.exit, label %.lr.ph.i, !dbg !289

show_data.exit:                                   ; preds = %.backedge.i, %0
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)), !dbg !295
  ret void, !dbg !296
}

; Function Attrs: nounwind uwtable
define void @show_list(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !77), !dbg !297
  %1 = icmp eq %struct._list* %list, null, !dbg !298
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !298

.lr.ph:                                           ; preds = %0, %show_move.exit
  %.01 = phi %struct._list* [ %20, %show_move.exit ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.01, i64 0, i32 0, !dbg !299
  %3 = load i32** %2, align 8, !dbg !299, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !301) #4, !dbg !302
  tail call void @llvm.dbg.value(metadata !279, i64 0, metadata !303) #4, !dbg !305
  %4 = load %struct._IO_FILE** @stdout, align 8, !dbg !306, !tbaa !276
  %5 = tail call i32 @_IO_putc(i32 40, %struct._IO_FILE* %4) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !307) #4, !dbg !309
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !310) #4, !dbg !311
  %6 = load i32* @ncol, align 4, !dbg !312, !tbaa !177
  %7 = icmp eq i32 %6, 0, !dbg !312
  br i1 %7, label %show_move.exit, label %.lr.ph.i.i, !dbg !312

.lr.ph.i.i:                                       ; preds = %.lr.ph, %.backedge.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %.backedge.i.i ], [ 0, %.lr.ph ]
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1, !dbg !312
  %8 = getelementptr inbounds i32* %3, i64 %indvars.iv.i.i, !dbg !313
  %9 = load i32* %8, align 4, !dbg !313, !tbaa !177
  %10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %9) #4, !dbg !313
  %11 = load i32* @ncol, align 4, !dbg !314, !tbaa !177
  %12 = trunc i64 %indvars.iv.next.i.i to i32, !dbg !314
  %13 = icmp eq i32 %12, %11, !dbg !314
  br i1 %13, label %.backedge.i.i, label %14, !dbg !314

; <label>:14                                      ; preds = %.lr.ph.i.i
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !315) #4, !dbg !316
  %15 = load %struct._IO_FILE** @stdout, align 8, !dbg !317, !tbaa !276
  %16 = tail call i32 @_IO_putc(i32 44, %struct._IO_FILE* %15) #4, !dbg !317
  %.pre.i.i = load i32* @ncol, align 4, !dbg !312, !tbaa !177
  br label %.backedge.i.i, !dbg !314

.backedge.i.i:                                    ; preds = %14, %.lr.ph.i.i
  %17 = phi i32 [ %.pre.i.i, %14 ], [ %11, %.lr.ph.i.i ]
  %18 = icmp eq i32 %12, %17, !dbg !312
  br i1 %18, label %show_move.exit, label %.lr.ph.i.i, !dbg !312

show_move.exit:                                   ; preds = %.backedge.i.i, %.lr.ph
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) #4, !dbg !318
  %19 = getelementptr inbounds %struct._list* %.01, i64 0, i32 1, !dbg !319
  %20 = load %struct._list** %19, align 8, !dbg !319, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %20}, i64 0, metadata !77), !dbg !319
  %21 = icmp eq %struct._list* %20, null, !dbg !298
  br i1 %21, label %._crit_edge, label %.lr.ph, !dbg !298

._crit_edge:                                      ; preds = %show_move.exit, %0
  ret void, !dbg !320
}

; Function Attrs: nounwind uwtable
define void @show_play(%struct._play* readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !80), !dbg !321
  %1 = icmp eq %struct._play* %play, null, !dbg !322
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !322

.lr.ph:                                           ; preds = %0, %show_list.exit
  %.03 = phi %struct._play* [ %44, %show_list.exit ], [ %play, %0 ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str18, i64 0, i64 0)), !dbg !323
  %2 = getelementptr inbounds %struct._play* %.03, i64 0, i32 1, !dbg !325
  %3 = load i32** %2, align 8, !dbg !325, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !326) #4, !dbg !327
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !328) #4, !dbg !329
  %4 = load i32* @ncol, align 4, !dbg !330, !tbaa !177
  %5 = icmp eq i32 %4, 0, !dbg !330
  br i1 %5, label %show_data.exit, label %.lr.ph.i, !dbg !330

.lr.ph.i:                                         ; preds = %.lr.ph, %.backedge.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.backedge.i ], [ 0, %.lr.ph ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !330
  %6 = getelementptr inbounds i32* %3, i64 %indvars.iv.i, !dbg !331
  %7 = load i32* %6, align 4, !dbg !331, !tbaa !177
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %7) #4, !dbg !331
  %9 = load i32* @ncol, align 4, !dbg !332, !tbaa !177
  %10 = trunc i64 %indvars.iv.next.i to i32, !dbg !332
  %11 = icmp eq i32 %10, %9, !dbg !332
  br i1 %11, label %.backedge.i, label %12, !dbg !332

; <label>:12                                      ; preds = %.lr.ph.i
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !333) #4, !dbg !334
  %13 = load %struct._IO_FILE** @stdout, align 8, !dbg !335, !tbaa !276
  %14 = tail call i32 @_IO_putc(i32 44, %struct._IO_FILE* %13) #4, !dbg !335
  %.pre.i = load i32* @ncol, align 4, !dbg !330, !tbaa !177
  br label %.backedge.i, !dbg !332

.backedge.i:                                      ; preds = %12, %.lr.ph.i
  %15 = phi i32 [ %.pre.i, %12 ], [ %9, %.lr.ph.i ]
  %16 = icmp eq i32 %10, %15, !dbg !330
  br i1 %16, label %show_data.exit, label %.lr.ph.i, !dbg !330

show_data.exit:                                   ; preds = %.backedge.i, %.lr.ph
  %17 = getelementptr inbounds %struct._play* %.03, i64 0, i32 0, !dbg !336
  %18 = load i32* %17, align 4, !dbg !336, !tbaa !263
  %19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i64 0, i64 0), i32 %18) #4, !dbg !336
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str19, i64 0, i64 0)), !dbg !337
  %20 = getelementptr inbounds %struct._play* %.03, i64 0, i32 2, !dbg !338
  %21 = load %struct._list** %20, align 8, !dbg !338, !tbaa !246
  tail call void @llvm.dbg.value(metadata !{%struct._list* %21}, i64 0, metadata !339) #4, !dbg !340
  %22 = icmp eq %struct._list* %21, null, !dbg !341
  br i1 %22, label %show_list.exit, label %.lr.ph.i2, !dbg !341

.lr.ph.i2:                                        ; preds = %show_data.exit, %show_move.exit.i
  %.01.i = phi %struct._list* [ %41, %show_move.exit.i ], [ %21, %show_data.exit ]
  %23 = getelementptr inbounds %struct._list* %.01.i, i64 0, i32 0, !dbg !342
  %24 = load i32** %23, align 8, !dbg !342, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %24}, i64 0, metadata !343) #4, !dbg !344
  tail call void @llvm.dbg.value(metadata !279, i64 0, metadata !345) #4, !dbg !347
  %25 = load %struct._IO_FILE** @stdout, align 8, !dbg !348, !tbaa !276
  %26 = tail call i32 @_IO_putc(i32 40, %struct._IO_FILE* %25) #4, !dbg !348
  tail call void @llvm.dbg.value(metadata !{i32* %24}, i64 0, metadata !349) #4, !dbg !351
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !352) #4, !dbg !353
  %27 = load i32* @ncol, align 4, !dbg !354, !tbaa !177
  %28 = icmp eq i32 %27, 0, !dbg !354
  br i1 %28, label %show_move.exit.i, label %.lr.ph.i.i.i, !dbg !354

.lr.ph.i.i.i:                                     ; preds = %.lr.ph.i2, %.backedge.i.i.i
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i, %.backedge.i.i.i ], [ 0, %.lr.ph.i2 ]
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1, !dbg !354
  %29 = getelementptr inbounds i32* %24, i64 %indvars.iv.i.i.i, !dbg !355
  %30 = load i32* %29, align 4, !dbg !355, !tbaa !177
  %31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %30) #4, !dbg !355
  %32 = load i32* @ncol, align 4, !dbg !356, !tbaa !177
  %33 = trunc i64 %indvars.iv.next.i.i.i to i32, !dbg !356
  %34 = icmp eq i32 %33, %32, !dbg !356
  br i1 %34, label %.backedge.i.i.i, label %35, !dbg !356

; <label>:35                                      ; preds = %.lr.ph.i.i.i
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !357) #4, !dbg !358
  %36 = load %struct._IO_FILE** @stdout, align 8, !dbg !359, !tbaa !276
  %37 = tail call i32 @_IO_putc(i32 44, %struct._IO_FILE* %36) #4, !dbg !359
  %.pre.i.i.i = load i32* @ncol, align 4, !dbg !354, !tbaa !177
  br label %.backedge.i.i.i, !dbg !356

.backedge.i.i.i:                                  ; preds = %35, %.lr.ph.i.i.i
  %38 = phi i32 [ %.pre.i.i.i, %35 ], [ %32, %.lr.ph.i.i.i ]
  %39 = icmp eq i32 %33, %38, !dbg !354
  br i1 %39, label %show_move.exit.i, label %.lr.ph.i.i.i, !dbg !354

show_move.exit.i:                                 ; preds = %.backedge.i.i.i, %.lr.ph.i2
  %puts.i.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) #4, !dbg !360
  %40 = getelementptr inbounds %struct._list* %.01.i, i64 0, i32 1, !dbg !361
  %41 = load %struct._list** %40, align 8, !dbg !361, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %41}, i64 0, metadata !339) #4, !dbg !361
  %42 = icmp eq %struct._list* %41, null, !dbg !341
  br i1 %42, label %show_list.exit, label %.lr.ph.i2, !dbg !341

show_list.exit:                                   ; preds = %show_move.exit.i, %show_data.exit
  %43 = getelementptr inbounds %struct._play* %.03, i64 0, i32 3, !dbg !362
  %44 = load %struct._play** %43, align 8, !dbg !362, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{%struct._play* %44}, i64 0, metadata !80), !dbg !362
  %45 = icmp eq %struct._play* %44, null, !dbg !322
  br i1 %45, label %._crit_edge, label %.lr.ph, !dbg !322

._crit_edge:                                      ; preds = %show_list.exit, %0
  ret void, !dbg !363
}

; Function Attrs: nounwind readonly uwtable
define i32 @in_wanted(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !83), !dbg !364
  %current.02 = load %struct._list** @wanted, align 8, !dbg !365
  %cond3 = icmp eq %struct._list* %current.02, null, !dbg !366
  br i1 %cond3, label %._crit_edge, label %.lr.ph, !dbg !366

.lr.ph:                                           ; preds = %0
  %1 = load i32* @ncol, align 4, !dbg !367, !tbaa !177
  %2 = sext i32 %1 to i64
  br label %5, !dbg !366

; <label>:3                                       ; preds = %equal_data.exit
  %4 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 1, !dbg !371
  %current.0 = load %struct._list** %4, align 8, !dbg !365
  %cond = icmp eq %struct._list* %current.0, null, !dbg !366
  br i1 %cond, label %._crit_edge, label %5, !dbg !366

; <label>:5                                       ; preds = %.lr.ph, %3
  %current.04 = phi %struct._list* [ %current.02, %.lr.ph ], [ %current.0, %3 ]
  %6 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 0, !dbg !368
  %7 = load i32** %6, align 8, !dbg !368, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %7}, i64 0, metadata !372), !dbg !373
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !374), !dbg !373
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !375), !dbg !367
  br label %8, !dbg !376

; <label>:8                                       ; preds = %11, %5
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %11 ], [ %2, %5 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %9 = trunc i64 %indvars.iv.i to i32, !dbg !376
  %10 = icmp eq i32 %9, 0, !dbg !376
  br i1 %10, label %equal_data.exit.thread, label %11, !dbg !376

; <label>:11                                      ; preds = %8
  %12 = getelementptr inbounds i32* %7, i64 %indvars.iv.next.i, !dbg !376
  %13 = load i32* %12, align 4, !dbg !376, !tbaa !177
  %14 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !376
  %15 = load i32* %14, align 4, !dbg !376, !tbaa !177
  %16 = icmp eq i32 %13, %15, !dbg !376
  br i1 %16, label %8, label %equal_data.exit

equal_data.exit:                                  ; preds = %11
  %17 = icmp slt i32 %9, 1, !dbg !377
  br i1 %17, label %equal_data.exit.thread, label %3, !dbg !368

equal_data.exit.thread:                           ; preds = %equal_data.exit, %8
  %not. = icmp ne %struct._list* %current.04, null, !dbg !378
  %. = zext i1 %not. to i32, !dbg !378
  ret i32 %., !dbg !378

._crit_edge:                                      ; preds = %3, %0
  ret i32 0, !dbg !380
}

; Function Attrs: nounwind uwtable
define noalias i32* @make_data(i32 %row, i32 %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %row}, i64 0, metadata !89), !dbg !381
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !90), !dbg !381
  %1 = load i32* @ncol, align 4, !dbg !382, !tbaa !177
  %2 = sext i32 %1 to i64, !dbg !382
  %3 = shl nsw i64 %2, 2, !dbg !382
  %4 = tail call noalias i8* @malloc(i64 %3) #4, !dbg !382
  %5 = bitcast i8* %4 to i32*, !dbg !382
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !92), !dbg !382
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !91), !dbg !383
  %6 = icmp eq i32 %col, 0, !dbg !383
  br i1 %6, label %.preheader, label %.lr.ph4, !dbg !383

.lr.ph4:                                          ; preds = %0
  %7 = load i32* @nrow, align 4, !dbg !385, !tbaa !177
  %8 = add i32 %col, -1, !dbg !383
  %9 = zext i32 %8 to i64
  %10 = add i64 %9, 1, !dbg !383
  %end.idx = add i64 %9, 1, !dbg !383
  %n.vec = and i64 %10, 8589934584, !dbg !383
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !383
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph4
  %broadcast.splatinsert10 = insertelement <4 x i32> undef, i32 %7, i32 0
  %broadcast.splat11 = shufflevector <4 x i32> %broadcast.splatinsert10, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !383
  %11 = getelementptr inbounds i32* %5, i64 %index, !dbg !385
  %12 = bitcast i32* %11 to <4 x i32>*, !dbg !385
  store <4 x i32> %broadcast.splat11, <4 x i32>* %12, align 4, !dbg !385
  %.sum36 = or i64 %index, 4, !dbg !385
  %13 = getelementptr i32* %5, i64 %.sum36, !dbg !385
  %14 = bitcast i32* %13 to <4 x i32>*, !dbg !385
  store <4 x i32> %broadcast.splat11, <4 x i32>* %14, align 4, !dbg !385
  %index.next = add i64 %index, 8, !dbg !383
  %15 = icmp eq i64 %index.next, %n.vec, !dbg !383
  br i1 %15, label %middle.block, label %vector.body, !dbg !383, !llvm.loop !386

middle.block:                                     ; preds = %vector.body, %.lr.ph4
  %resume.val = phi i64 [ 0, %.lr.ph4 ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.preheader, label %scalar.ph

.preheader:                                       ; preds = %scalar.ph, %middle.block, %0
  %count.0.lcssa = phi i32 [ 0, %0 ], [ %col, %middle.block ], [ %col, %scalar.ph ]
  %16 = icmp eq i32 %count.0.lcssa, %1, !dbg !387
  br i1 %16, label %._crit_edge, label %.lr.ph, !dbg !387

.lr.ph:                                           ; preds = %.preheader
  %17 = sext i32 %count.0.lcssa to i64
  %18 = add i32 %1, -1, !dbg !387
  %19 = sub i32 %18, %count.0.lcssa, !dbg !387
  %20 = zext i32 %19 to i64
  %21 = add i64 %20, 1, !dbg !387
  %end.idx19 = add i64 %21, %17, !dbg !387
  %n.vec21 = and i64 %21, -8, !dbg !387
  %end.idx.rnd.down22 = add i64 %n.vec21, %17, !dbg !387
  %cmp.zero23 = icmp eq i64 %n.vec21, 0, !dbg !387
  br i1 %cmp.zero23, label %middle.block16, label %vector.ph14

vector.ph14:                                      ; preds = %.lr.ph
  %broadcast.splatinsert32 = insertelement <4 x i32> undef, i32 %row, i32 0
  %broadcast.splat33 = shufflevector <4 x i32> %broadcast.splatinsert32, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body15

vector.body15:                                    ; preds = %vector.body15, %vector.ph14
  %index18 = phi i64 [ %17, %vector.ph14 ], [ %index.next27, %vector.body15 ], !dbg !387
  %22 = getelementptr inbounds i32* %5, i64 %index18, !dbg !389
  %23 = bitcast i32* %22 to <4 x i32>*, !dbg !389
  store <4 x i32> %broadcast.splat33, <4 x i32>* %23, align 4, !dbg !389
  %.sum = add i64 %index18, 4, !dbg !389
  %24 = getelementptr i32* %5, i64 %.sum, !dbg !389
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !389
  store <4 x i32> %broadcast.splat33, <4 x i32>* %25, align 4, !dbg !389
  %index.next27 = add i64 %index18, 8, !dbg !387
  %26 = icmp eq i64 %index.next27, %end.idx.rnd.down22, !dbg !387
  br i1 %26, label %middle.block16, label %vector.body15, !dbg !387, !llvm.loop !390

middle.block16:                                   ; preds = %vector.body15, %.lr.ph
  %resume.val24 = phi i64 [ %17, %.lr.ph ], [ %end.idx.rnd.down22, %vector.body15 ]
  %cmp.n26 = icmp eq i64 %end.idx19, %resume.val24
  br i1 %cmp.n26, label %._crit_edge, label %scalar.ph17

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %scalar.ph ], [ %resume.val, %middle.block ]
  %27 = getelementptr inbounds i32* %5, i64 %indvars.iv5, !dbg !385
  store i32 %7, i32* %27, align 4, !dbg !385, !tbaa !177
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !383
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !91), !dbg !383
  %lftr.wideiv7 = trunc i64 %indvars.iv.next6 to i32, !dbg !383
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %col, !dbg !383
  br i1 %exitcond8, label %.preheader, label %scalar.ph, !dbg !383, !llvm.loop !391

scalar.ph17:                                      ; preds = %middle.block16, %scalar.ph17
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph17 ], [ %resume.val24, %middle.block16 ]
  %28 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !389
  store i32 %row, i32* %28, align 4, !dbg !389, !tbaa !177
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !387
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !387
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !387
  br i1 %exitcond, label %._crit_edge, label %scalar.ph17, !dbg !387, !llvm.loop !392

._crit_edge:                                      ; preds = %scalar.ph17, %middle.block16, %.preheader
  ret i32* %5, !dbg !393
}

; Function Attrs: nounwind uwtable
define %struct._list* @make_list(i32* nocapture readonly %data, i32* nocapture %value, i32* nocapture %all) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !97), !dbg !394
  tail call void @llvm.dbg.value(metadata !{i32* %value}, i64 0, metadata !98), !dbg !394
  tail call void @llvm.dbg.value(metadata !{i32* %all}, i64 0, metadata !99), !dbg !394
  store i32 1, i32* %value, align 4, !dbg !395, !tbaa !177
  %1 = tail call noalias i8* @malloc(i64 16) #4, !dbg !396
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !103), !dbg !396
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !397
  %3 = bitcast i8* %2 to %struct._list**, !dbg !397
  store %struct._list* null, %struct._list** %3, align 8, !dbg !397, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !104), !dbg !398
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !100), !dbg !399
  %4 = load i32* @nrow, align 4, !dbg !399, !tbaa !177
  %5 = icmp eq i32 %4, 0, !dbg !399
  br i1 %5, label %.thread, label %.preheader.lr.ph, !dbg !399

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{%struct._list* %171}, i64 0, metadata !104), !dbg !401
  tail call void @free(i8* %1) #4, !dbg !402
  br label %170, !dbg !403

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !396
  %.pre39 = load i32* @ncol, align 4, !dbg !405, !tbaa !177
  br label %.preheader, !dbg !399

.preheader:                                       ; preds = %.preheader.lr.ph, %158
  %7 = phi i32 [ %.pre39, %.preheader.lr.ph ], [ %159, %158 ]
  %8 = phi i32 [ %.pre39, %.preheader.lr.ph ], [ %160, %158 ]
  %9 = phi i32 [ %4, %.preheader.lr.ph ], [ %161, %158 ]
  %10 = phi i32 [ %.pre39, %.preheader.lr.ph ], [ %162, %158 ], !dbg !405
  %current.030 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %158 ]
  %row.029 = phi i32 [ 0, %.preheader.lr.ph ], [ %163, %158 ]
  %11 = icmp eq i32 %10, 0, !dbg !405
  br i1 %11, label %158, label %.lr.ph, !dbg !405

.lr.ph:                                           ; preds = %.preheader, %in_wanted.exit.thread
  %12 = phi i32 [ %156, %in_wanted.exit.thread ], [ %7, %.preheader ]
  %13 = phi i32 [ %156, %in_wanted.exit.thread ], [ %8, %.preheader ]
  %14 = phi i32 [ %156, %in_wanted.exit.thread ], [ %10, %.preheader ]
  %current.127 = phi %struct._list* [ %current.2, %in_wanted.exit.thread ], [ %current.030, %.preheader ]
  %row.126 = phi i32 [ %row.3, %in_wanted.exit.thread ], [ %row.029, %.preheader ]
  %col.024 = phi i32 [ %155, %in_wanted.exit.thread ], [ 0, %.preheader ]
  tail call void @llvm.dbg.value(metadata !{i32 %row.1.lcssa}, i64 0, metadata !408) #4, !dbg !411
  tail call void @llvm.dbg.value(metadata !{i32 %col.024}, i64 0, metadata !412) #4, !dbg !411
  %15 = sext i32 %14 to i64, !dbg !413
  %16 = shl nsw i64 %15, 2, !dbg !413
  %17 = tail call noalias i8* @malloc(i64 %16) #4, !dbg !413
  %18 = bitcast i8* %17 to i32*, !dbg !413
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !414) #4, !dbg !413
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !415) #4, !dbg !416
  %19 = icmp eq i32 %col.024, 0, !dbg !416
  br i1 %19, label %.preheader.i, label %.lr.ph4.i, !dbg !416

.lr.ph4.i:                                        ; preds = %.lr.ph
  %20 = load i32* @nrow, align 4, !dbg !417, !tbaa !177
  %21 = add i32 %col.024, -1, !dbg !416
  %22 = zext i32 %21 to i64
  %23 = add i64 %22, 1, !dbg !416
  %end.idx105 = add i64 %22, 1, !dbg !416
  %n.vec107 = and i64 %23, 8589934584, !dbg !416
  %cmp.zero109 = icmp eq i64 %n.vec107, 0, !dbg !416
  br i1 %cmp.zero109, label %middle.block102, label %vector.ph100

vector.ph100:                                     ; preds = %.lr.ph4.i
  %broadcast.splatinsert118 = insertelement <4 x i32> undef, i32 %20, i32 0
  %broadcast.splat119 = shufflevector <4 x i32> %broadcast.splatinsert118, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.ph100
  %index104 = phi i64 [ 0, %vector.ph100 ], [ %index.next113, %vector.body101 ], !dbg !416
  %24 = getelementptr inbounds i32* %18, i64 %index104, !dbg !417
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !417
  store <4 x i32> %broadcast.splat119, <4 x i32>* %25, align 4, !dbg !417
  %.sum122 = or i64 %index104, 4, !dbg !417
  %26 = getelementptr i32* %18, i64 %.sum122, !dbg !417
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !417
  store <4 x i32> %broadcast.splat119, <4 x i32>* %27, align 4, !dbg !417
  %index.next113 = add i64 %index104, 8, !dbg !416
  %28 = icmp eq i64 %index.next113, %n.vec107, !dbg !416
  br i1 %28, label %middle.block102, label %vector.body101, !dbg !416, !llvm.loop !418

middle.block102:                                  ; preds = %vector.body101, %.lr.ph4.i
  %resume.val110 = phi i64 [ 0, %.lr.ph4.i ], [ %n.vec107, %vector.body101 ]
  %cmp.n112 = icmp eq i64 %end.idx105, %resume.val110
  br i1 %cmp.n112, label %.preheader.i, label %scalar.ph103

.preheader.i:                                     ; preds = %scalar.ph103, %middle.block102, %.lr.ph
  %count.0.lcssa.i = phi i32 [ 0, %.lr.ph ], [ %col.024, %middle.block102 ], [ %col.024, %scalar.ph103 ]
  %29 = icmp eq i32 %count.0.lcssa.i, %14, !dbg !419
  br i1 %29, label %make_data.exit, label %.lr.ph.i, !dbg !419

.lr.ph.i:                                         ; preds = %.preheader.i
  %30 = sext i32 %count.0.lcssa.i to i64
  %31 = add i32 %14, -1, !dbg !419
  %32 = sub i32 %31, %count.0.lcssa.i, !dbg !419
  %33 = zext i32 %32 to i64
  %34 = add i64 %33, 1, !dbg !419
  %end.idx84 = add i64 %34, %30, !dbg !419
  %n.vec86 = and i64 %34, -8, !dbg !419
  %end.idx.rnd.down87 = add i64 %n.vec86, %30, !dbg !419
  %cmp.zero88 = icmp eq i64 %n.vec86, 0, !dbg !419
  br i1 %cmp.zero88, label %middle.block81, label %vector.ph79

vector.ph79:                                      ; preds = %.lr.ph.i
  %broadcast.splatinsert96 = insertelement <4 x i32> undef, i32 %row.126, i32 0
  %broadcast.splat97 = shufflevector <4 x i32> %broadcast.splatinsert96, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body80

vector.body80:                                    ; preds = %vector.body80, %vector.ph79
  %index83 = phi i64 [ %30, %vector.ph79 ], [ %index.next91, %vector.body80 ], !dbg !419
  %35 = getelementptr inbounds i32* %18, i64 %index83, !dbg !420
  %36 = bitcast i32* %35 to <4 x i32>*, !dbg !420
  store <4 x i32> %broadcast.splat97, <4 x i32>* %36, align 4, !dbg !420
  %.sum = add i64 %index83, 4, !dbg !420
  %37 = getelementptr i32* %18, i64 %.sum, !dbg !420
  %38 = bitcast i32* %37 to <4 x i32>*, !dbg !420
  store <4 x i32> %broadcast.splat97, <4 x i32>* %38, align 4, !dbg !420
  %index.next91 = add i64 %index83, 8, !dbg !419
  %39 = icmp eq i64 %index.next91, %end.idx.rnd.down87, !dbg !419
  br i1 %39, label %middle.block81, label %vector.body80, !dbg !419, !llvm.loop !421

middle.block81:                                   ; preds = %vector.body80, %.lr.ph.i
  %resume.val89 = phi i64 [ %30, %.lr.ph.i ], [ %end.idx.rnd.down87, %vector.body80 ]
  %cmp.n90 = icmp eq i64 %end.idx84, %resume.val89
  br i1 %cmp.n90, label %make_data.exit, label %scalar.ph82

scalar.ph103:                                     ; preds = %middle.block102, %scalar.ph103
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %scalar.ph103 ], [ %resume.val110, %middle.block102 ]
  %40 = getelementptr inbounds i32* %18, i64 %indvars.iv5.i, !dbg !417
  store i32 %20, i32* %40, align 4, !dbg !417, !tbaa !177
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !416
  tail call void @llvm.dbg.value(metadata !{i32 %col.024}, i64 0, metadata !415) #4, !dbg !416
  %lftr.wideiv = trunc i64 %indvars.iv.next6.i to i32, !dbg !416
  %exitcond = icmp eq i32 %lftr.wideiv, %col.024, !dbg !416
  br i1 %exitcond, label %.preheader.i, label %scalar.ph103, !dbg !416, !llvm.loop !422

scalar.ph82:                                      ; preds = %middle.block81, %scalar.ph82
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %scalar.ph82 ], [ %resume.val89, %middle.block81 ]
  %41 = getelementptr inbounds i32* %18, i64 %indvars.iv.i, !dbg !420
  store i32 %row.126, i32* %41, align 4, !dbg !420, !tbaa !177
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1, !dbg !419
  %lftr.wideiv.i = trunc i64 %indvars.iv.next.i to i32, !dbg !419
  %exitcond.i = icmp eq i32 %lftr.wideiv.i, %14, !dbg !419
  br i1 %exitcond.i, label %make_data.exit, label %scalar.ph82, !dbg !419, !llvm.loop !423

make_data.exit:                                   ; preds = %scalar.ph82, %middle.block81, %.preheader.i
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !102), !dbg !409
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !424), !dbg !426
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !427), !dbg !426
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !428), !dbg !429
  %42 = icmp eq i32 %13, 0, !dbg !430
  %.pre41 = sext i32 %13 to i64
  br i1 %42, label %melt_data.exit, label %.lr.ph.i1.preheader, !dbg !430

.lr.ph.i1.preheader:                              ; preds = %make_data.exit
  %43 = add i32 %13, -1, !dbg !430
  %44 = zext i32 %43 to i64
  %45 = add i64 %44, 1, !dbg !430
  %end.idx63 = add i64 %44, 1
  %n.vec65 = and i64 %45, 8589934590
  %cmp.zero67 = icmp eq i64 %n.vec65, 0
  %rev.ind.end69 = sub i64 %.pre41, %n.vec65
  br i1 %cmp.zero67, label %middle.block60, label %vector.body59

vector.body59:                                    ; preds = %.lr.ph.i1.preheader, %else78
  %index62 = phi i64 [ %index.next72, %else78 ], [ 0, %.lr.ph.i1.preheader ]
  %reverse.idx74 = sub i64 %.pre41, %index62
  %46 = add nsw i64 %reverse.idx74, -1, !dbg !430
  %47 = add i64 %reverse.idx74, -2, !dbg !430
  %48 = getelementptr inbounds i32* %18, i64 %46, !dbg !431
  %49 = getelementptr inbounds i32* %18, i64 %47, !dbg !431
  %50 = load i32* %48, align 4, !dbg !431, !tbaa !177
  %51 = load i32* %49, align 4, !dbg !431, !tbaa !177
  %52 = getelementptr inbounds i32* %data, i64 %46, !dbg !431
  %53 = getelementptr inbounds i32* %data, i64 %47, !dbg !431
  %54 = load i32* %52, align 4, !dbg !431, !tbaa !177
  %55 = load i32* %53, align 4, !dbg !431, !tbaa !177
  %56 = icmp sgt i32 %50, %54, !dbg !431
  %57 = icmp sgt i32 %51, %55, !dbg !431
  br i1 %56, label %cond.store, label %else

cond.store:                                       ; preds = %vector.body59
  store i32 %54, i32* %48, align 4, !dbg !432, !tbaa !177
  br label %else

else:                                             ; preds = %vector.body59, %cond.store
  br i1 %57, label %cond.store77, label %else78

cond.store77:                                     ; preds = %else
  store i32 %55, i32* %49, align 4, !dbg !432, !tbaa !177
  br label %else78

else78:                                           ; preds = %else, %cond.store77
  %index.next72 = add i64 %index62, 2
  %58 = icmp eq i64 %index.next72, %n.vec65
  br i1 %58, label %middle.block60, label %vector.body59, !llvm.loop !433

middle.block60:                                   ; preds = %else78, %.lr.ph.i1.preheader
  %resume.val68 = phi i64 [ %.pre41, %.lr.ph.i1.preheader ], [ %rev.ind.end69, %else78 ]
  %new.indc.resume.val70 = phi i64 [ 0, %.lr.ph.i1.preheader ], [ %n.vec65, %else78 ]
  %cmp.n71 = icmp eq i64 %end.idx63, %new.indc.resume.val70
  br i1 %cmp.n71, label %melt_data.exit, label %.lr.ph.i1

.lr.ph.i1:                                        ; preds = %middle.block60, %.backedge.i
  %indvars.iv.i2 = phi i64 [ %indvars.iv.next.i3, %.backedge.i ], [ %resume.val68, %middle.block60 ]
  %indvars.iv.next.i3 = add nsw i64 %indvars.iv.i2, -1, !dbg !430
  %59 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i3, !dbg !431
  %60 = load i32* %59, align 4, !dbg !431, !tbaa !177
  %61 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i3, !dbg !431
  %62 = load i32* %61, align 4, !dbg !431, !tbaa !177
  %63 = icmp sgt i32 %60, %62, !dbg !431
  br i1 %63, label %64, label %.backedge.i, !dbg !431

; <label>:64                                      ; preds = %.lr.ph.i1
  store i32 %62, i32* %59, align 4, !dbg !432, !tbaa !177
  br label %.backedge.i, !dbg !432

.backedge.i:                                      ; preds = %64, %.lr.ph.i1
  %65 = trunc i64 %indvars.iv.next.i3 to i32, !dbg !430
  %66 = icmp eq i32 %65, 0, !dbg !430
  br i1 %66, label %melt_data.exit, label %.lr.ph.i1, !dbg !430, !llvm.loop !434

melt_data.exit:                                   ; preds = %make_data.exit, %middle.block60, %.backedge.i, %69
  %indvars.iv.i13 = phi i64 [ %indvars.iv.next.i14, %69 ], [ %.pre41, %.backedge.i ], [ %.pre41, %middle.block60 ], [ %.pre41, %make_data.exit ]
  %indvars.iv.next.i14 = add nsw i64 %indvars.iv.i13, -1
  %67 = trunc i64 %indvars.iv.i13 to i32, !dbg !435
  %68 = icmp eq i32 %67, 0, !dbg !435
  br i1 %68, label %equal_data.exit.thread, label %69, !dbg !435

; <label>:69                                      ; preds = %melt_data.exit
  %70 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i14, !dbg !435
  %71 = load i32* %70, align 4, !dbg !435, !tbaa !177
  %72 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i14, !dbg !435
  %73 = load i32* %72, align 4, !dbg !435, !tbaa !177
  %74 = icmp eq i32 %71, %73, !dbg !435
  br i1 %74, label %melt_data.exit, label %equal_data.exit

equal_data.exit:                                  ; preds = %69
  %75 = icmp slt i32 %67, 1, !dbg !438
  br i1 %75, label %equal_data.exit.thread, label %76, !dbg !436

; <label>:76                                      ; preds = %equal_data.exit
  %77 = tail call noalias i8* @malloc(i64 16) #4, !dbg !439
  %78 = bitcast i8* %77 to %struct._list*, !dbg !439
  %79 = getelementptr inbounds %struct._list* %current.127, i64 0, i32 1, !dbg !439
  store %struct._list* %78, %struct._list** %79, align 8, !dbg !439, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !441) #4, !dbg !443
  %80 = sext i32 %12 to i64, !dbg !444
  %81 = shl nsw i64 %80, 2, !dbg !444
  %82 = tail call noalias i8* @malloc(i64 %81) #4, !dbg !444
  %83 = bitcast i8* %82 to i32*, !dbg !444
  tail call void @llvm.dbg.value(metadata !{i32* %83}, i64 0, metadata !445) #4, !dbg !444
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !446) #4, !dbg !447
  %84 = icmp eq i32 %12, 0, !dbg !448
  br i1 %84, label %copy_data.exit, label %.lr.ph.i11.preheader, !dbg !448

.lr.ph.i11.preheader:                             ; preds = %76
  %85 = add i32 %12, -1, !dbg !448
  %86 = zext i32 %85 to i64
  %87 = add i64 %86, 1, !dbg !448
  %end.idx = add i64 %86, 1
  %n.vec = and i64 %87, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %rev.ind.end = sub i64 %80, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.i11.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.i11.preheader ]
  %reverse.idx = sub i64 %80, %index
  %.sum123 = add i64 %reverse.idx, -4, !dbg !449
  %88 = getelementptr i32* %18, i64 %.sum123, !dbg !449
  %89 = bitcast i32* %88 to <4 x i32>*, !dbg !449
  %wide.load = load <4 x i32>* %89, align 4, !dbg !449
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !449
  %.sum125 = add i64 %reverse.idx, -8, !dbg !449
  %90 = getelementptr i32* %18, i64 %.sum125, !dbg !449
  %91 = bitcast i32* %90 to <4 x i32>*, !dbg !449
  %wide.load54 = load <4 x i32>* %91, align 4, !dbg !449
  %reverse55 = shufflevector <4 x i32> %wide.load54, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !449
  %reverse56 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !449
  %.sum126 = add i64 %reverse.idx, -4, !dbg !449
  %92 = getelementptr i32* %83, i64 %.sum126, !dbg !449
  %93 = bitcast i32* %92 to <4 x i32>*, !dbg !449
  store <4 x i32> %reverse56, <4 x i32>* %93, align 4, !dbg !449
  %reverse57 = shufflevector <4 x i32> %reverse55, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !449
  %.sum128 = add i64 %reverse.idx, -8, !dbg !449
  %94 = getelementptr i32* %83, i64 %.sum128, !dbg !449
  %95 = bitcast i32* %94 to <4 x i32>*, !dbg !449
  store <4 x i32> %reverse57, <4 x i32>* %95, align 4, !dbg !449
  %index.next = add i64 %index, 8
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !450

middle.block:                                     ; preds = %vector.body, %.lr.ph.i11.preheader
  %resume.val = phi i64 [ %80, %.lr.ph.i11.preheader ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i11.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %new.indc.resume.val
  br i1 %cmp.n, label %copy_data.exit, label %.lr.ph.i11

.lr.ph.i11:                                       ; preds = %middle.block, %.lr.ph.i11
  %indvars.iv.i9 = phi i64 [ %indvars.iv.next.i10, %.lr.ph.i11 ], [ %resume.val, %middle.block ]
  %indvars.iv.next.i10 = add nsw i64 %indvars.iv.i9, -1, !dbg !448
  %97 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i10, !dbg !449
  %98 = load i32* %97, align 4, !dbg !449, !tbaa !177
  %99 = getelementptr inbounds i32* %83, i64 %indvars.iv.next.i10, !dbg !449
  store i32 %98, i32* %99, align 4, !dbg !449, !tbaa !177
  %100 = trunc i64 %indvars.iv.next.i10 to i32, !dbg !448
  %101 = icmp eq i32 %100, 0, !dbg !448
  br i1 %101, label %copy_data.exit, label %.lr.ph.i11, !dbg !448, !llvm.loop !451

copy_data.exit:                                   ; preds = %.lr.ph.i11, %middle.block, %76
  %102 = load %struct._list** %79, align 8, !dbg !442, !tbaa !231
  %103 = getelementptr inbounds %struct._list* %102, i64 0, i32 0, !dbg !442
  store i32* %83, i32** %103, align 8, !dbg !442, !tbaa !235
  %104 = getelementptr inbounds %struct._list* %102, i64 0, i32 1, !dbg !452
  store %struct._list* null, %struct._list** %104, align 8, !dbg !452, !tbaa !231
  %105 = load %struct._list** %79, align 8, !dbg !453, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %105}, i64 0, metadata !104), !dbg !453
  %106 = load i32* %value, align 4, !dbg !454, !tbaa !177
  %107 = icmp eq i32 %106, 1, !dbg !454
  br i1 %107, label %.preheader43, label %123, !dbg !454

.preheader43:                                     ; preds = %copy_data.exit, %equal_data.exit.i7
  %search.0.in.i = phi %struct._play** [ %120, %equal_data.exit.i7 ], [ @game_tree, %copy_data.exit ]
  %search.0.i = load %struct._play** %search.0.in.i, align 8, !dbg !456
  %108 = getelementptr inbounds %struct._play* %search.0.i, i64 0, i32 1, !dbg !458
  %109 = load i32** %108, align 8, !dbg !458, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %109}, i64 0, metadata !459), !dbg !460
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !461), !dbg !460
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !462), !dbg !463
  br label %110, !dbg !464

; <label>:110                                     ; preds = %113, %.preheader43
  %indvars.iv.i.i5 = phi i64 [ %indvars.iv.next.i.i6, %113 ], [ %80, %.preheader43 ]
  %indvars.iv.next.i.i6 = add nsw i64 %indvars.iv.i.i5, -1
  %111 = trunc i64 %indvars.iv.i.i5 to i32, !dbg !464
  %112 = icmp eq i32 %111, 0, !dbg !464
  br i1 %112, label %get_value.exit, label %113, !dbg !464

; <label>:113                                     ; preds = %110
  %114 = getelementptr inbounds i32* %109, i64 %indvars.iv.next.i.i6, !dbg !464
  %115 = load i32* %114, align 4, !dbg !464, !tbaa !177
  %116 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i.i6, !dbg !464
  %117 = load i32* %116, align 4, !dbg !464, !tbaa !177
  %118 = icmp eq i32 %115, %117, !dbg !464
  br i1 %118, label %110, label %equal_data.exit.i7

equal_data.exit.i7:                               ; preds = %113
  %119 = icmp slt i32 %111, 1, !dbg !465
  %120 = getelementptr inbounds %struct._play* %search.0.i, i64 0, i32 3, !dbg !466
  br i1 %119, label %get_value.exit, label %.preheader43, !dbg !458

get_value.exit:                                   ; preds = %equal_data.exit.i7, %110
  %121 = getelementptr inbounds %struct._play* %search.0.i, i64 0, i32 0, !dbg !467
  %122 = load i32* %121, align 4, !dbg !467, !tbaa !263
  store i32 %122, i32* %value, align 4, !dbg !457, !tbaa !177
  br label %123, !dbg !457

; <label>:123                                     ; preds = %get_value.exit, %copy_data.exit
  %124 = phi i32 [ %122, %get_value.exit ], [ %106, %copy_data.exit ]
  %125 = load i32* %all, align 4, !dbg !468, !tbaa !177
  %126 = or i32 %125, %124, !dbg !468
  %127 = icmp eq i32 %126, 0, !dbg !468
  br i1 %127, label %128, label %in_wanted.exit.thread, !dbg !468

; <label>:128                                     ; preds = %123
  %129 = load i32* @ncol, align 4, !dbg !470, !tbaa !177
  %130 = add nsw i32 %129, -1, !dbg !470
  tail call void @llvm.dbg.value(metadata !{i32 %130}, i64 0, metadata !101), !dbg !470
  %131 = load i32* @nrow, align 4, !dbg !472, !tbaa !177
  %132 = add nsw i32 %131, -1, !dbg !472
  tail call void @llvm.dbg.value(metadata !{i32 %132}, i64 0, metadata !100), !dbg !472
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !473), !dbg !476
  %current.02.i = load %struct._list** @wanted, align 8, !dbg !477
  %cond3.i = icmp eq %struct._list* %current.02.i, null, !dbg !478
  br i1 %cond3.i, label %in_wanted.exit.thread, label %.lr.ph.i4, !dbg !478

.lr.ph.i4:                                        ; preds = %128
  %133 = sext i32 %129 to i64
  br label %136, !dbg !478

; <label>:134                                     ; preds = %equal_data.exit.i
  %135 = getelementptr inbounds %struct._list* %current.04.i, i64 0, i32 1, !dbg !479
  %current.0.i = load %struct._list** %135, align 8, !dbg !477
  %cond.i = icmp eq %struct._list* %current.0.i, null, !dbg !478
  br i1 %cond.i, label %in_wanted.exit.thread, label %136, !dbg !478

; <label>:136                                     ; preds = %134, %.lr.ph.i4
  %current.04.i = phi %struct._list* [ %current.02.i, %.lr.ph.i4 ], [ %current.0.i, %134 ]
  %137 = getelementptr inbounds %struct._list* %current.04.i, i64 0, i32 0, !dbg !480
  %138 = load i32** %137, align 8, !dbg !480, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %138}, i64 0, metadata !481), !dbg !482
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !483), !dbg !482
  tail call void @llvm.dbg.value(metadata !{i32 %129}, i64 0, metadata !484), !dbg !485
  br label %139, !dbg !486

; <label>:139                                     ; preds = %142, %136
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %142 ], [ %133, %136 ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1
  %140 = trunc i64 %indvars.iv.i.i to i32, !dbg !486
  %141 = icmp eq i32 %140, 0, !dbg !486
  br i1 %141, label %in_wanted.exit, label %142, !dbg !486

; <label>:142                                     ; preds = %139
  %143 = getelementptr inbounds i32* %138, i64 %indvars.iv.next.i.i, !dbg !486
  %144 = load i32* %143, align 4, !dbg !486, !tbaa !177
  %145 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i.i, !dbg !486
  %146 = load i32* %145, align 4, !dbg !486, !tbaa !177
  %147 = icmp eq i32 %144, %146, !dbg !486
  br i1 %147, label %139, label %equal_data.exit.i

equal_data.exit.i:                                ; preds = %142
  %148 = icmp slt i32 %140, 1, !dbg !487
  br i1 %148, label %in_wanted.exit, label %134, !dbg !480

in_wanted.exit:                                   ; preds = %equal_data.exit.i, %139
  %not..i = icmp eq %struct._list* %current.04.i, null, !dbg !488
  br i1 %not..i, label %in_wanted.exit.thread, label %149, !dbg !474

; <label>:149                                     ; preds = %in_wanted.exit
  store i32 2, i32* %all, align 4, !dbg !489, !tbaa !177
  br label %in_wanted.exit.thread, !dbg !489

equal_data.exit.thread:                           ; preds = %melt_data.exit, %equal_data.exit
  br i1 %19, label %150, label %153, !dbg !490

; <label>:150                                     ; preds = %equal_data.exit.thread
  %151 = load i32* @nrow, align 4, !dbg !490, !tbaa !177
  %152 = add nsw i32 %151, -1, !dbg !490
  tail call void @llvm.dbg.value(metadata !{i32 %152}, i64 0, metadata !100), !dbg !490
  br label %153, !dbg !490

; <label>:153                                     ; preds = %150, %equal_data.exit.thread
  %row.2 = phi i32 [ %152, %150 ], [ %row.126, %equal_data.exit.thread ]
  %154 = add nsw i32 %13, -1, !dbg !493
  tail call void @llvm.dbg.value(metadata !{i32 %154}, i64 0, metadata !101), !dbg !493
  br label %in_wanted.exit.thread

in_wanted.exit.thread:                            ; preds = %134, %in_wanted.exit, %128, %123, %149, %153
  %col.1 = phi i32 [ %154, %153 ], [ %col.024, %123 ], [ %130, %149 ], [ %130, %in_wanted.exit ], [ %130, %128 ], [ %130, %134 ]
  %row.3 = phi i32 [ %row.2, %153 ], [ %row.126, %123 ], [ %132, %149 ], [ %132, %in_wanted.exit ], [ %132, %128 ], [ %132, %134 ]
  %current.2 = phi %struct._list* [ %current.127, %153 ], [ %105, %123 ], [ %105, %149 ], [ %105, %in_wanted.exit ], [ %105, %128 ], [ %105, %134 ]
  tail call void @free(i8* %17) #4, !dbg !494
  %155 = add nsw i32 %col.1, 1, !dbg !405
  tail call void @llvm.dbg.value(metadata !{i32 %155}, i64 0, metadata !101), !dbg !405
  %156 = load i32* @ncol, align 4, !dbg !405, !tbaa !177
  %157 = icmp eq i32 %155, %156, !dbg !405
  br i1 %157, label %._crit_edge, label %.lr.ph, !dbg !405

._crit_edge:                                      ; preds = %in_wanted.exit.thread
  %.pre40 = load i32* @nrow, align 4, !dbg !399, !tbaa !177
  br label %158, !dbg !405

; <label>:158                                     ; preds = %._crit_edge, %.preheader
  %159 = phi i32 [ %155, %._crit_edge ], [ %7, %.preheader ]
  %160 = phi i32 [ %155, %._crit_edge ], [ %8, %.preheader ]
  %161 = phi i32 [ %.pre40, %._crit_edge ], [ %9, %.preheader ], !dbg !399
  %162 = phi i32 [ %155, %._crit_edge ], [ 0, %.preheader ]
  %current.1.lcssa = phi %struct._list* [ %current.2, %._crit_edge ], [ %current.030, %.preheader ]
  %row.1.lcssa = phi i32 [ %row.3, %._crit_edge ], [ %row.029, %.preheader ]
  %163 = add nsw i32 %row.1.lcssa, 1, !dbg !399
  tail call void @llvm.dbg.value(metadata !{i32 %163}, i64 0, metadata !100), !dbg !399
  %164 = icmp eq i32 %163, %161, !dbg !399
  br i1 %164, label %165, label %.preheader, !dbg !399

; <label>:165                                     ; preds = %158
  %.pre = load %struct._list** %3, align 8, !dbg !401, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %171}, i64 0, metadata !104), !dbg !401
  tail call void @free(i8* %1) #4, !dbg !402
  %166 = icmp eq %struct._list* %.pre, null, !dbg !403
  br i1 %166, label %170, label %167, !dbg !403

; <label>:167                                     ; preds = %165
  %168 = load i32* %value, align 4, !dbg !403, !tbaa !177
  %169 = sub nsw i32 1, %168, !dbg !403
  store i32 %169, i32* %value, align 4, !dbg !403, !tbaa !177
  br label %170, !dbg !403

; <label>:170                                     ; preds = %.thread, %165, %167
  %171 = phi %struct._list* [ null, %.thread ], [ null, %165 ], [ %.pre, %167 ]
  ret %struct._list* %171, !dbg !495
}

; Function Attrs: nounwind uwtable
define %struct._play* @make_play(i32 %all) #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata !{i32 %all}, i64 0, metadata !109), !dbg !496
  store i32 %all, i32* %1, align 4, !tbaa !177
  tail call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !109), !dbg !496
  tail call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !110), !dbg !497
  %2 = tail call noalias i8* @malloc(i64 32) #4, !dbg !498
  %3 = bitcast i8* %2 to %struct._play*, !dbg !498
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !112), !dbg !498
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !113), !dbg !499
  store %struct._play* null, %struct._play** @game_tree, align 8, !dbg !500, !tbaa !276
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !501) #4, !dbg !503
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !504) #4, !dbg !503
  %4 = load i32* @ncol, align 4, !dbg !505, !tbaa !177
  %5 = sext i32 %4 to i64, !dbg !505
  %6 = shl nsw i64 %5, 2, !dbg !505
  %7 = tail call noalias i8* @malloc(i64 %6) #4, !dbg !505
  %8 = bitcast i8* %7 to i32*, !dbg !505
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !506) #4, !dbg !505
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !507) #4, !dbg !508
  %9 = icmp eq i32 %4, 0, !dbg !509
  br i1 %9, label %make_data.exit, label %.lr.ph.i.preheader, !dbg !509

.lr.ph.i.preheader:                               ; preds = %0
  %10 = add i32 %4, -1, !dbg !510
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 2, !dbg !510
  %13 = add i64 %12, 4, !dbg !510
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %13, i32 4, i1 false), !dbg !510
  %.pre = load i32* %8, align 4, !dbg !511, !tbaa !177
  %phitmp = add i32 %.pre, -1
  br label %make_data.exit

make_data.exit:                                   ; preds = %.lr.ph.i.preheader, %0
  %14 = phi i32 [ %phitmp, %.lr.ph.i.preheader ], [ undef, %0 ]
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !111), !dbg !502
  store i32 %14, i32* %8, align 4, !dbg !511, !tbaa !177
  br label %make_data.exit8.outer, !dbg !512

make_data.exit8.outer:                            ; preds = %71, %middle.block, %scalar.ph, %make_data.exit
  %15 = phi i32 [ %4, %make_data.exit ], [ 0, %71 ], [ %73, %middle.block ], [ %73, %scalar.ph ]
  %temp.0.ph = phi i32* [ %8, %make_data.exit ], [ %77, %scalar.ph ], [ %77, %middle.block ], [ %77, %71 ]
  %current.0.ph = phi %struct._play* [ %3, %make_data.exit ], [ %68, %scalar.ph ], [ %68, %middle.block ], [ %68, %71 ]
  br label %make_data.exit8.outer16

make_data.exit8.outer16:                          ; preds = %copy_data.exit.make_data.exit8.outer16_crit_edge, %make_data.exit8.outer
  %16 = phi i32 [ %.pre31, %copy_data.exit.make_data.exit8.outer16_crit_edge ], [ %15, %make_data.exit8.outer ]
  %current.0.ph17 = phi %struct._play* [ %68, %copy_data.exit.make_data.exit8.outer16_crit_edge ], [ %current.0.ph, %make_data.exit8.outer ]
  %17 = icmp eq i32 %16, 0, !dbg !513
  %18 = load i32* @nrow, align 4, !dbg !514, !tbaa !177
  br i1 %17, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %valid_data.exit, %.outer.i, %make_data.exit8.outer16
  %indvars.iv.i1 = phi i64 [ 0, %make_data.exit8.outer16 ], [ %indvars.iv.next.i2, %.outer.i ], [ 0, %valid_data.exit ]
  %19 = getelementptr inbounds i32* %temp.0.ph, i64 %indvars.iv.i1, !dbg !514
  %.pre.i = load i32* %19, align 4, !dbg !514, !tbaa !177
  %20 = icmp eq i32 %.pre.i, %18, !dbg !514
  br i1 %20, label %.outer.i, label %.lr.ph.i9, !dbg !514

.outer.i:                                         ; preds = %.preheader
  store i32 0, i32* %19, align 4, !dbg !515, !tbaa !177
  %indvars.iv.next.i2 = add nuw nsw i64 %indvars.iv.i1, 1, !dbg !513
  %21 = trunc i64 %indvars.iv.next.i2 to i32, !dbg !513
  %22 = icmp eq i32 %21, %16, !dbg !513
  br i1 %22, label %.loopexit, label %.preheader, !dbg !513

.lr.ph.i9:                                        ; preds = %.preheader
  %23 = add nsw i32 %.pre.i, 1, !dbg !516
  store i32 %23, i32* %19, align 4, !dbg !516, !tbaa !177
  tail call void @llvm.dbg.value(metadata !201, i64 0, metadata !517), !dbg !518
  tail call void @llvm.dbg.value(metadata !{i32* %temp.0.ph}, i64 0, metadata !519), !dbg !523
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !524), !dbg !525
  br label %27, !dbg !526

; <label>:24                                      ; preds = %27
  %25 = trunc i64 %indvars.iv.next.i11 to i32, !dbg !526
  %26 = icmp eq i32 %25, %16, !dbg !526
  br i1 %26, label %.us-lcssa, label %27, !dbg !526

; <label>:27                                      ; preds = %24, %.lr.ph.i9
  %indvars.iv.i10 = phi i64 [ 0, %.lr.ph.i9 ], [ %indvars.iv.next.i11, %24 ]
  %low.01.i = phi i32 [ %18, %.lr.ph.i9 ], [ %29, %24 ]
  %28 = getelementptr inbounds i32* %temp.0.ph, i64 %indvars.iv.i10, !dbg !527
  %29 = load i32* %28, align 4, !dbg !527, !tbaa !177
  %30 = icmp sgt i32 %29, %low.01.i, !dbg !527
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !528), !dbg !529
  %indvars.iv.next.i11 = add nuw nsw i64 %indvars.iv.i10, 1, !dbg !526
  br i1 %30, label %valid_data.exit, label %24, !dbg !527

valid_data.exit:                                  ; preds = %27
  %31 = trunc i64 %indvars.iv.i10 to i32, !dbg !527
  %32 = icmp eq i32 %31, %16, !dbg !530
  br i1 %32, label %.us-lcssa, label %.preheader, !dbg !520

.us-lcssa:                                        ; preds = %valid_data.exit, %24
  %33 = tail call noalias i8* @malloc(i64 32) #4, !dbg !531
  %34 = bitcast i8* %33 to %struct._play*, !dbg !531
  %35 = getelementptr inbounds %struct._play* %current.0.ph17, i64 0, i32 3, !dbg !531
  store %struct._play* %34, %struct._play** %35, align 8, !dbg !531, !tbaa !243
  %36 = load %struct._play** @game_tree, align 8, !dbg !533, !tbaa !276
  %37 = icmp eq %struct._play* %36, null, !dbg !533
  br i1 %37, label %38, label %.lr.ph.i14.preheader, !dbg !533

; <label>:38                                      ; preds = %.us-lcssa
  store %struct._play* %34, %struct._play** @game_tree, align 8, !dbg !533, !tbaa !276
  br label %.lr.ph.i14.preheader, !dbg !533

.lr.ph.i14.preheader:                             ; preds = %.us-lcssa, %38
  tail call void @llvm.dbg.value(metadata !{i32* %temp.0.ph}, i64 0, metadata !535) #4, !dbg !537
  %39 = sext i32 %16 to i64, !dbg !538
  %40 = shl nsw i64 %39, 2, !dbg !538
  %41 = tail call noalias i8* @malloc(i64 %40) #4, !dbg !538
  %42 = bitcast i8* %41 to i32*, !dbg !538
  tail call void @llvm.dbg.value(metadata !{i32* %42}, i64 0, metadata !539) #4, !dbg !538
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !540) #4, !dbg !541
  %43 = add i32 %16, -1, !dbg !542
  %44 = zext i32 %43 to i64
  %45 = add i64 %44, 1, !dbg !542
  %end.idx45 = add i64 %44, 1
  %n.vec47 = and i64 %45, 8589934584
  %cmp.zero49 = icmp eq i64 %n.vec47, 0
  %rev.ind.end = sub i64 %39, %n.vec47
  br i1 %cmp.zero49, label %middle.block42, label %vector.body41

vector.body41:                                    ; preds = %.lr.ph.i14.preheader, %vector.body41
  %index44 = phi i64 [ %index.next52, %vector.body41 ], [ 0, %.lr.ph.i14.preheader ]
  %reverse.idx = sub i64 %39, %index44
  %.sum = add i64 %reverse.idx, -4, !dbg !543
  %46 = getelementptr i32* %temp.0.ph, i64 %.sum, !dbg !543
  %47 = bitcast i32* %46 to <4 x i32>*, !dbg !543
  %wide.load = load <4 x i32>* %47, align 4, !dbg !543
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !543
  %.sum62 = add i64 %reverse.idx, -8, !dbg !543
  %48 = getelementptr i32* %temp.0.ph, i64 %.sum62, !dbg !543
  %49 = bitcast i32* %48 to <4 x i32>*, !dbg !543
  %wide.load57 = load <4 x i32>* %49, align 4, !dbg !543
  %reverse58 = shufflevector <4 x i32> %wide.load57, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !543
  %reverse59 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !543
  %.sum63 = add i64 %reverse.idx, -4, !dbg !543
  %50 = getelementptr i32* %42, i64 %.sum63, !dbg !543
  %51 = bitcast i32* %50 to <4 x i32>*, !dbg !543
  store <4 x i32> %reverse59, <4 x i32>* %51, align 4, !dbg !543
  %reverse60 = shufflevector <4 x i32> %reverse58, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !543
  %.sum65 = add i64 %reverse.idx, -8, !dbg !543
  %52 = getelementptr i32* %42, i64 %.sum65, !dbg !543
  %53 = bitcast i32* %52 to <4 x i32>*, !dbg !543
  store <4 x i32> %reverse60, <4 x i32>* %53, align 4, !dbg !543
  %index.next52 = add i64 %index44, 8
  %54 = icmp eq i64 %index.next52, %n.vec47
  br i1 %54, label %middle.block42, label %vector.body41, !llvm.loop !544

middle.block42:                                   ; preds = %vector.body41, %.lr.ph.i14.preheader
  %resume.val50 = phi i64 [ %39, %.lr.ph.i14.preheader ], [ %rev.ind.end, %vector.body41 ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i14.preheader ], [ %n.vec47, %vector.body41 ]
  %cmp.n51 = icmp eq i64 %end.idx45, %new.indc.resume.val
  br i1 %cmp.n51, label %copy_data.exit, label %.lr.ph.i14

.lr.ph.i14:                                       ; preds = %middle.block42, %.lr.ph.i14
  %indvars.iv.i12 = phi i64 [ %indvars.iv.next.i13, %.lr.ph.i14 ], [ %resume.val50, %middle.block42 ]
  %indvars.iv.next.i13 = add nsw i64 %indvars.iv.i12, -1, !dbg !542
  %55 = getelementptr inbounds i32* %temp.0.ph, i64 %indvars.iv.next.i13, !dbg !543
  %56 = load i32* %55, align 4, !dbg !543, !tbaa !177
  %57 = getelementptr inbounds i32* %42, i64 %indvars.iv.next.i13, !dbg !543
  store i32 %56, i32* %57, align 4, !dbg !543, !tbaa !177
  %58 = trunc i64 %indvars.iv.next.i13 to i32, !dbg !542
  %59 = icmp eq i32 %58, 0, !dbg !542
  br i1 %59, label %copy_data.exit, label %.lr.ph.i14, !dbg !542, !llvm.loop !545

copy_data.exit:                                   ; preds = %middle.block42, %.lr.ph.i14
  %60 = load %struct._play** %35, align 8, !dbg !536, !tbaa !243
  %61 = getelementptr inbounds %struct._play* %60, i64 0, i32 1, !dbg !536
  store i32* %42, i32** %61, align 8, !dbg !536, !tbaa !248
  %62 = call %struct._list* @make_list(i32* %temp.0.ph, i32* %val, i32* %1), !dbg !546
  %63 = load %struct._play** %35, align 8, !dbg !546, !tbaa !243
  %64 = getelementptr inbounds %struct._play* %63, i64 0, i32 2, !dbg !546
  store %struct._list* %62, %struct._list** %64, align 8, !dbg !546, !tbaa !246
  tail call void @llvm.dbg.value(metadata !{i32* %val}, i64 0, metadata !110), !dbg !547
  %65 = load i32* %val, align 4, !dbg !547, !tbaa !177
  %66 = getelementptr inbounds %struct._play* %63, i64 0, i32 0, !dbg !547
  store i32 %65, i32* %66, align 4, !dbg !547, !tbaa !263
  %67 = getelementptr inbounds %struct._play* %63, i64 0, i32 3, !dbg !548
  store %struct._play* null, %struct._play** %67, align 8, !dbg !548, !tbaa !243
  %68 = load %struct._play** %35, align 8, !dbg !549, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{%struct._play* %68}, i64 0, metadata !113), !dbg !549
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !109), !dbg !550
  %69 = load i32* %1, align 4, !dbg !550, !tbaa !177
  %70 = icmp eq i32 %69, 2, !dbg !550
  br i1 %70, label %71, label %copy_data.exit.make_data.exit8.outer16_crit_edge, !dbg !550

copy_data.exit.make_data.exit8.outer16_crit_edge: ; preds = %copy_data.exit
  %.pre31 = load i32* @ncol, align 4, !dbg !513, !tbaa !177
  br label %make_data.exit8.outer16, !dbg !550

; <label>:71                                      ; preds = %copy_data.exit
  %72 = bitcast i32* %temp.0.ph to i8*, !dbg !552
  tail call void @free(i8* %72) #4, !dbg !552
  %73 = load i32* @ncol, align 4, !dbg !554, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %73}, i64 0, metadata !555) #4, !dbg !556
  %74 = sext i32 %73 to i64, !dbg !557
  %75 = shl nsw i64 %74, 2, !dbg !557
  %76 = tail call noalias i8* @malloc(i64 %75) #4, !dbg !557
  %77 = bitcast i8* %76 to i32*, !dbg !557
  tail call void @llvm.dbg.value(metadata !{i32* %77}, i64 0, metadata !558) #4, !dbg !557
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !559) #4, !dbg !560
  %78 = icmp eq i32 %73, 0, !dbg !560
  br i1 %78, label %make_data.exit8.outer, label %.lr.ph4.i, !dbg !560

.lr.ph4.i:                                        ; preds = %71
  %79 = load i32* @nrow, align 4, !dbg !561, !tbaa !177
  %80 = add i32 %73, -1, !dbg !560
  %81 = zext i32 %80 to i64
  %82 = add i64 %81, 1, !dbg !560
  %end.idx = add i64 %81, 1, !dbg !560
  %n.vec = and i64 %82, 8589934584, !dbg !560
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !560
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph4.i
  %broadcast.splatinsert36 = insertelement <4 x i32> undef, i32 %79, i32 0
  %broadcast.splat37 = shufflevector <4 x i32> %broadcast.splatinsert36, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !560
  %83 = getelementptr inbounds i32* %77, i64 %index, !dbg !561
  %84 = bitcast i32* %83 to <4 x i32>*, !dbg !561
  store <4 x i32> %broadcast.splat37, <4 x i32>* %84, align 4, !dbg !561
  %.sum6667 = or i64 %index, 4, !dbg !561
  %85 = getelementptr i32* %77, i64 %.sum6667, !dbg !561
  %86 = bitcast i32* %85 to <4 x i32>*, !dbg !561
  store <4 x i32> %broadcast.splat37, <4 x i32>* %86, align 4, !dbg !561
  %index.next = add i64 %index, 8, !dbg !560
  %87 = icmp eq i64 %index.next, %n.vec, !dbg !560
  br i1 %87, label %middle.block, label %vector.body, !dbg !560, !llvm.loop !562

middle.block:                                     ; preds = %vector.body, %.lr.ph4.i
  %resume.val = phi i64 [ 0, %.lr.ph4.i ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %make_data.exit8.outer, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %scalar.ph ], [ %resume.val, %middle.block ]
  %88 = getelementptr inbounds i32* %77, i64 %indvars.iv5.i, !dbg !561
  store i32 %79, i32* %88, align 4, !dbg !561, !tbaa !177
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !560
  tail call void @llvm.dbg.value(metadata !{i32 %73}, i64 0, metadata !559) #4, !dbg !560
  %lftr.wideiv = trunc i64 %indvars.iv.next6.i to i32, !dbg !560
  %exitcond = icmp eq i32 %lftr.wideiv, %73, !dbg !560
  br i1 %exitcond, label %make_data.exit8.outer, label %scalar.ph, !dbg !560, !llvm.loop !563

.loopexit:                                        ; preds = %make_data.exit8.outer16, %.outer.i
  %89 = getelementptr inbounds i8* %2, i64 24, !dbg !564
  %90 = bitcast i8* %89 to %struct._play**, !dbg !564
  %91 = load %struct._play** %90, align 8, !dbg !564, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{%struct._play* %91}, i64 0, metadata !113), !dbg !564
  tail call void @free(i8* %2) #4, !dbg !565
  ret %struct._play* %91, !dbg !566
}

; Function Attrs: nounwind uwtable
define void @make_wanted(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !116), !dbg !567
  %1 = tail call noalias i8* @malloc(i64 16) #4, !dbg !568
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !120), !dbg !568
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !569
  %3 = bitcast i8* %2 to %struct._list**, !dbg !569
  store %struct._list* null, %struct._list** %3, align 8, !dbg !569, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !121), !dbg !570
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !117), !dbg !571
  %4 = load i32* @nrow, align 4, !dbg !571, !tbaa !177
  %5 = icmp eq i32 %4, 0, !dbg !571
  br i1 %5, label %122, label %.preheader.lr.ph, !dbg !571

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !568
  %.pre18 = load i32* @ncol, align 4, !dbg !573, !tbaa !177
  br label %.preheader, !dbg !571

.preheader:                                       ; preds = %.preheader.lr.ph, %115
  %7 = phi i32 [ %.pre18, %.preheader.lr.ph ], [ %116, %115 ]
  %8 = phi i32 [ %.pre18, %.preheader.lr.ph ], [ %117, %115 ]
  %9 = phi i32 [ %4, %.preheader.lr.ph ], [ %118, %115 ]
  %10 = phi i32 [ %.pre18, %.preheader.lr.ph ], [ %119, %115 ], !dbg !573
  %current.016 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %115 ]
  %row.015 = phi i32 [ 0, %.preheader.lr.ph ], [ %120, %115 ]
  %11 = icmp eq i32 %10, 0, !dbg !573
  br i1 %11, label %115, label %.lr.ph, !dbg !573

.lr.ph:                                           ; preds = %.preheader, %111
  %12 = phi i32 [ %113, %111 ], [ %7, %.preheader ]
  %13 = phi i32 [ %113, %111 ], [ %8, %.preheader ]
  %14 = phi i32 [ %113, %111 ], [ %10, %.preheader ]
  %current.113 = phi %struct._list* [ %current.2, %111 ], [ %current.016, %.preheader ]
  %row.111 = phi i32 [ %row.3, %111 ], [ %row.015, %.preheader ]
  %col.09 = phi i32 [ %112, %111 ], [ 0, %.preheader ]
  tail call void @llvm.dbg.value(metadata !{i32 %row.1.lcssa}, i64 0, metadata !576) #4, !dbg !579
  tail call void @llvm.dbg.value(metadata !{i32 %col.09}, i64 0, metadata !580) #4, !dbg !579
  %15 = sext i32 %14 to i64, !dbg !581
  %16 = shl nsw i64 %15, 2, !dbg !581
  %17 = tail call noalias i8* @malloc(i64 %16) #4, !dbg !581
  %18 = bitcast i8* %17 to i32*, !dbg !581
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !582) #4, !dbg !581
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !583) #4, !dbg !584
  %19 = icmp eq i32 %col.09, 0, !dbg !584
  br i1 %19, label %.preheader.i, label %.lr.ph4.i, !dbg !584

.lr.ph4.i:                                        ; preds = %.lr.ph
  %20 = load i32* @nrow, align 4, !dbg !585, !tbaa !177
  %21 = add i32 %col.09, -1, !dbg !584
  %22 = zext i32 %21 to i64
  %23 = add i64 %22, 1, !dbg !584
  %end.idx74 = add i64 %22, 1, !dbg !584
  %n.vec76 = and i64 %23, 8589934584, !dbg !584
  %cmp.zero78 = icmp eq i64 %n.vec76, 0, !dbg !584
  br i1 %cmp.zero78, label %middle.block71, label %vector.ph69

vector.ph69:                                      ; preds = %.lr.ph4.i
  %broadcast.splatinsert87 = insertelement <4 x i32> undef, i32 %20, i32 0
  %broadcast.splat88 = shufflevector <4 x i32> %broadcast.splatinsert87, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body70

vector.body70:                                    ; preds = %vector.body70, %vector.ph69
  %index73 = phi i64 [ 0, %vector.ph69 ], [ %index.next82, %vector.body70 ], !dbg !584
  %24 = getelementptr inbounds i32* %18, i64 %index73, !dbg !585
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !585
  store <4 x i32> %broadcast.splat88, <4 x i32>* %25, align 4, !dbg !585
  %.sum91 = or i64 %index73, 4, !dbg !585
  %26 = getelementptr i32* %18, i64 %.sum91, !dbg !585
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !585
  store <4 x i32> %broadcast.splat88, <4 x i32>* %27, align 4, !dbg !585
  %index.next82 = add i64 %index73, 8, !dbg !584
  %28 = icmp eq i64 %index.next82, %n.vec76, !dbg !584
  br i1 %28, label %middle.block71, label %vector.body70, !dbg !584, !llvm.loop !586

middle.block71:                                   ; preds = %vector.body70, %.lr.ph4.i
  %resume.val79 = phi i64 [ 0, %.lr.ph4.i ], [ %n.vec76, %vector.body70 ]
  %cmp.n81 = icmp eq i64 %end.idx74, %resume.val79
  br i1 %cmp.n81, label %.preheader.i, label %scalar.ph72

.preheader.i:                                     ; preds = %scalar.ph72, %middle.block71, %.lr.ph
  %count.0.lcssa.i = phi i32 [ 0, %.lr.ph ], [ %col.09, %middle.block71 ], [ %col.09, %scalar.ph72 ]
  %29 = icmp eq i32 %count.0.lcssa.i, %14, !dbg !587
  br i1 %29, label %make_data.exit, label %.lr.ph.i, !dbg !587

.lr.ph.i:                                         ; preds = %.preheader.i
  %30 = sext i32 %count.0.lcssa.i to i64
  %31 = add i32 %14, -1, !dbg !587
  %32 = sub i32 %31, %count.0.lcssa.i, !dbg !587
  %33 = zext i32 %32 to i64
  %34 = add i64 %33, 1, !dbg !587
  %end.idx53 = add i64 %34, %30, !dbg !587
  %n.vec55 = and i64 %34, -8, !dbg !587
  %end.idx.rnd.down56 = add i64 %n.vec55, %30, !dbg !587
  %cmp.zero57 = icmp eq i64 %n.vec55, 0, !dbg !587
  br i1 %cmp.zero57, label %middle.block50, label %vector.ph48

vector.ph48:                                      ; preds = %.lr.ph.i
  %broadcast.splatinsert65 = insertelement <4 x i32> undef, i32 %row.111, i32 0
  %broadcast.splat66 = shufflevector <4 x i32> %broadcast.splatinsert65, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body49

vector.body49:                                    ; preds = %vector.body49, %vector.ph48
  %index52 = phi i64 [ %30, %vector.ph48 ], [ %index.next60, %vector.body49 ], !dbg !587
  %35 = getelementptr inbounds i32* %18, i64 %index52, !dbg !588
  %36 = bitcast i32* %35 to <4 x i32>*, !dbg !588
  store <4 x i32> %broadcast.splat66, <4 x i32>* %36, align 4, !dbg !588
  %.sum = add i64 %index52, 4, !dbg !588
  %37 = getelementptr i32* %18, i64 %.sum, !dbg !588
  %38 = bitcast i32* %37 to <4 x i32>*, !dbg !588
  store <4 x i32> %broadcast.splat66, <4 x i32>* %38, align 4, !dbg !588
  %index.next60 = add i64 %index52, 8, !dbg !587
  %39 = icmp eq i64 %index.next60, %end.idx.rnd.down56, !dbg !587
  br i1 %39, label %middle.block50, label %vector.body49, !dbg !587, !llvm.loop !589

middle.block50:                                   ; preds = %vector.body49, %.lr.ph.i
  %resume.val58 = phi i64 [ %30, %.lr.ph.i ], [ %end.idx.rnd.down56, %vector.body49 ]
  %cmp.n59 = icmp eq i64 %end.idx53, %resume.val58
  br i1 %cmp.n59, label %make_data.exit, label %scalar.ph51

scalar.ph72:                                      ; preds = %middle.block71, %scalar.ph72
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %scalar.ph72 ], [ %resume.val79, %middle.block71 ]
  %40 = getelementptr inbounds i32* %18, i64 %indvars.iv5.i, !dbg !585
  store i32 %20, i32* %40, align 4, !dbg !585, !tbaa !177
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !584
  tail call void @llvm.dbg.value(metadata !{i32 %col.09}, i64 0, metadata !583) #4, !dbg !584
  %lftr.wideiv = trunc i64 %indvars.iv.next6.i to i32, !dbg !584
  %exitcond = icmp eq i32 %lftr.wideiv, %col.09, !dbg !584
  br i1 %exitcond, label %.preheader.i, label %scalar.ph72, !dbg !584, !llvm.loop !590

scalar.ph51:                                      ; preds = %middle.block50, %scalar.ph51
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %scalar.ph51 ], [ %resume.val58, %middle.block50 ]
  %41 = getelementptr inbounds i32* %18, i64 %indvars.iv.i, !dbg !588
  store i32 %row.111, i32* %41, align 4, !dbg !588, !tbaa !177
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1, !dbg !587
  %lftr.wideiv.i = trunc i64 %indvars.iv.next.i to i32, !dbg !587
  %exitcond.i = icmp eq i32 %lftr.wideiv.i, %14, !dbg !587
  br i1 %exitcond.i, label %make_data.exit, label %scalar.ph51, !dbg !587, !llvm.loop !591

make_data.exit:                                   ; preds = %scalar.ph51, %middle.block50, %.preheader.i
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !119), !dbg !577
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !592), !dbg !594
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !595), !dbg !594
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !596), !dbg !597
  %42 = icmp eq i32 %13, 0, !dbg !598
  %.pre20 = sext i32 %13 to i64
  br i1 %42, label %melt_data.exit, label %.lr.ph.i1.preheader, !dbg !598

.lr.ph.i1.preheader:                              ; preds = %make_data.exit
  %43 = add i32 %13, -1, !dbg !598
  %44 = zext i32 %43 to i64
  %45 = add i64 %44, 1, !dbg !598
  %end.idx32 = add i64 %44, 1
  %n.vec34 = and i64 %45, 8589934590
  %cmp.zero36 = icmp eq i64 %n.vec34, 0
  %rev.ind.end38 = sub i64 %.pre20, %n.vec34
  br i1 %cmp.zero36, label %middle.block29, label %vector.body28

vector.body28:                                    ; preds = %.lr.ph.i1.preheader, %else47
  %index31 = phi i64 [ %index.next41, %else47 ], [ 0, %.lr.ph.i1.preheader ]
  %reverse.idx43 = sub i64 %.pre20, %index31
  %46 = add nsw i64 %reverse.idx43, -1, !dbg !598
  %47 = add i64 %reverse.idx43, -2, !dbg !598
  %48 = getelementptr inbounds i32* %18, i64 %46, !dbg !599
  %49 = getelementptr inbounds i32* %18, i64 %47, !dbg !599
  %50 = load i32* %48, align 4, !dbg !599, !tbaa !177
  %51 = load i32* %49, align 4, !dbg !599, !tbaa !177
  %52 = getelementptr inbounds i32* %data, i64 %46, !dbg !599
  %53 = getelementptr inbounds i32* %data, i64 %47, !dbg !599
  %54 = load i32* %52, align 4, !dbg !599, !tbaa !177
  %55 = load i32* %53, align 4, !dbg !599, !tbaa !177
  %56 = icmp sgt i32 %50, %54, !dbg !599
  %57 = icmp sgt i32 %51, %55, !dbg !599
  br i1 %56, label %cond.store, label %else

cond.store:                                       ; preds = %vector.body28
  store i32 %54, i32* %48, align 4, !dbg !600, !tbaa !177
  br label %else

else:                                             ; preds = %vector.body28, %cond.store
  br i1 %57, label %cond.store46, label %else47

cond.store46:                                     ; preds = %else
  store i32 %55, i32* %49, align 4, !dbg !600, !tbaa !177
  br label %else47

else47:                                           ; preds = %else, %cond.store46
  %index.next41 = add i64 %index31, 2
  %58 = icmp eq i64 %index.next41, %n.vec34
  br i1 %58, label %middle.block29, label %vector.body28, !llvm.loop !601

middle.block29:                                   ; preds = %else47, %.lr.ph.i1.preheader
  %resume.val37 = phi i64 [ %.pre20, %.lr.ph.i1.preheader ], [ %rev.ind.end38, %else47 ]
  %new.indc.resume.val39 = phi i64 [ 0, %.lr.ph.i1.preheader ], [ %n.vec34, %else47 ]
  %cmp.n40 = icmp eq i64 %end.idx32, %new.indc.resume.val39
  br i1 %cmp.n40, label %melt_data.exit, label %.lr.ph.i1

.lr.ph.i1:                                        ; preds = %middle.block29, %.backedge.i
  %indvars.iv.i2 = phi i64 [ %indvars.iv.next.i3, %.backedge.i ], [ %resume.val37, %middle.block29 ]
  %indvars.iv.next.i3 = add nsw i64 %indvars.iv.i2, -1, !dbg !598
  %59 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i3, !dbg !599
  %60 = load i32* %59, align 4, !dbg !599, !tbaa !177
  %61 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i3, !dbg !599
  %62 = load i32* %61, align 4, !dbg !599, !tbaa !177
  %63 = icmp sgt i32 %60, %62, !dbg !599
  br i1 %63, label %64, label %.backedge.i, !dbg !599

; <label>:64                                      ; preds = %.lr.ph.i1
  store i32 %62, i32* %59, align 4, !dbg !600, !tbaa !177
  br label %.backedge.i, !dbg !600

.backedge.i:                                      ; preds = %64, %.lr.ph.i1
  %65 = trunc i64 %indvars.iv.next.i3 to i32, !dbg !598
  %66 = icmp eq i32 %65, 0, !dbg !598
  br i1 %66, label %melt_data.exit, label %.lr.ph.i1, !dbg !598, !llvm.loop !602

melt_data.exit:                                   ; preds = %make_data.exit, %middle.block29, %.backedge.i, %69
  %indvars.iv.i7 = phi i64 [ %indvars.iv.next.i8, %69 ], [ %.pre20, %.backedge.i ], [ %.pre20, %middle.block29 ], [ %.pre20, %make_data.exit ]
  %indvars.iv.next.i8 = add nsw i64 %indvars.iv.i7, -1
  %67 = trunc i64 %indvars.iv.i7 to i32, !dbg !603
  %68 = icmp eq i32 %67, 0, !dbg !603
  br i1 %68, label %equal_data.exit.thread, label %69, !dbg !603

; <label>:69                                      ; preds = %melt_data.exit
  %70 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i8, !dbg !603
  %71 = load i32* %70, align 4, !dbg !603, !tbaa !177
  %72 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i8, !dbg !603
  %73 = load i32* %72, align 4, !dbg !603, !tbaa !177
  %74 = icmp eq i32 %71, %73, !dbg !603
  br i1 %74, label %melt_data.exit, label %equal_data.exit

equal_data.exit:                                  ; preds = %69
  %75 = icmp slt i32 %67, 1, !dbg !606
  br i1 %75, label %equal_data.exit.thread, label %76, !dbg !604

; <label>:76                                      ; preds = %equal_data.exit
  %77 = tail call noalias i8* @malloc(i64 16) #4, !dbg !607
  %78 = bitcast i8* %77 to %struct._list*, !dbg !607
  %79 = getelementptr inbounds %struct._list* %current.113, i64 0, i32 1, !dbg !607
  store %struct._list* %78, %struct._list** %79, align 8, !dbg !607, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{i32* %18}, i64 0, metadata !609) #4, !dbg !611
  %80 = sext i32 %12 to i64, !dbg !612
  %81 = shl nsw i64 %80, 2, !dbg !612
  %82 = tail call noalias i8* @malloc(i64 %81) #4, !dbg !612
  %83 = bitcast i8* %82 to i32*, !dbg !612
  tail call void @llvm.dbg.value(metadata !{i32* %83}, i64 0, metadata !613) #4, !dbg !612
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !614) #4, !dbg !615
  %84 = icmp eq i32 %12, 0, !dbg !616
  br i1 %84, label %copy_data.exit, label %.lr.ph.i6.preheader, !dbg !616

.lr.ph.i6.preheader:                              ; preds = %76
  %85 = add i32 %12, -1, !dbg !616
  %86 = zext i32 %85 to i64
  %87 = add i64 %86, 1, !dbg !616
  %end.idx = add i64 %86, 1
  %n.vec = and i64 %87, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %rev.ind.end = sub i64 %80, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.i6.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.i6.preheader ]
  %reverse.idx = sub i64 %80, %index
  %.sum92 = add i64 %reverse.idx, -4, !dbg !617
  %88 = getelementptr i32* %18, i64 %.sum92, !dbg !617
  %89 = bitcast i32* %88 to <4 x i32>*, !dbg !617
  %wide.load = load <4 x i32>* %89, align 4, !dbg !617
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !617
  %.sum94 = add i64 %reverse.idx, -8, !dbg !617
  %90 = getelementptr i32* %18, i64 %.sum94, !dbg !617
  %91 = bitcast i32* %90 to <4 x i32>*, !dbg !617
  %wide.load23 = load <4 x i32>* %91, align 4, !dbg !617
  %reverse24 = shufflevector <4 x i32> %wide.load23, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !617
  %reverse25 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !617
  %.sum95 = add i64 %reverse.idx, -4, !dbg !617
  %92 = getelementptr i32* %83, i64 %.sum95, !dbg !617
  %93 = bitcast i32* %92 to <4 x i32>*, !dbg !617
  store <4 x i32> %reverse25, <4 x i32>* %93, align 4, !dbg !617
  %reverse26 = shufflevector <4 x i32> %reverse24, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !617
  %.sum97 = add i64 %reverse.idx, -8, !dbg !617
  %94 = getelementptr i32* %83, i64 %.sum97, !dbg !617
  %95 = bitcast i32* %94 to <4 x i32>*, !dbg !617
  store <4 x i32> %reverse26, <4 x i32>* %95, align 4, !dbg !617
  %index.next = add i64 %index, 8
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !618

middle.block:                                     ; preds = %vector.body, %.lr.ph.i6.preheader
  %resume.val = phi i64 [ %80, %.lr.ph.i6.preheader ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i6.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %new.indc.resume.val
  br i1 %cmp.n, label %copy_data.exit, label %.lr.ph.i6

.lr.ph.i6:                                        ; preds = %middle.block, %.lr.ph.i6
  %indvars.iv.i4 = phi i64 [ %indvars.iv.next.i5, %.lr.ph.i6 ], [ %resume.val, %middle.block ]
  %indvars.iv.next.i5 = add nsw i64 %indvars.iv.i4, -1, !dbg !616
  %97 = getelementptr inbounds i32* %18, i64 %indvars.iv.next.i5, !dbg !617
  %98 = load i32* %97, align 4, !dbg !617, !tbaa !177
  %99 = getelementptr inbounds i32* %83, i64 %indvars.iv.next.i5, !dbg !617
  store i32 %98, i32* %99, align 4, !dbg !617, !tbaa !177
  %100 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !616
  %101 = icmp eq i32 %100, 0, !dbg !616
  br i1 %101, label %copy_data.exit, label %.lr.ph.i6, !dbg !616, !llvm.loop !619

copy_data.exit:                                   ; preds = %.lr.ph.i6, %middle.block, %76
  %102 = load %struct._list** %79, align 8, !dbg !610, !tbaa !231
  %103 = getelementptr inbounds %struct._list* %102, i64 0, i32 0, !dbg !610
  store i32* %83, i32** %103, align 8, !dbg !610, !tbaa !235
  %104 = getelementptr inbounds %struct._list* %102, i64 0, i32 1, !dbg !620
  store %struct._list* null, %struct._list** %104, align 8, !dbg !620, !tbaa !231
  %105 = load %struct._list** %79, align 8, !dbg !621, !tbaa !231
  tail call void @llvm.dbg.value(metadata !{%struct._list* %105}, i64 0, metadata !121), !dbg !621
  br label %111, !dbg !622

equal_data.exit.thread:                           ; preds = %melt_data.exit, %equal_data.exit
  br i1 %19, label %106, label %109, !dbg !623

; <label>:106                                     ; preds = %equal_data.exit.thread
  %107 = load i32* @nrow, align 4, !dbg !623, !tbaa !177
  %108 = add nsw i32 %107, -1, !dbg !623
  tail call void @llvm.dbg.value(metadata !{i32 %108}, i64 0, metadata !117), !dbg !623
  br label %109, !dbg !623

; <label>:109                                     ; preds = %106, %equal_data.exit.thread
  %row.2 = phi i32 [ %108, %106 ], [ %row.111, %equal_data.exit.thread ]
  %110 = add nsw i32 %13, -1, !dbg !626
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !118), !dbg !626
  br label %111

; <label>:111                                     ; preds = %109, %copy_data.exit
  %col.1 = phi i32 [ %110, %109 ], [ %col.09, %copy_data.exit ]
  %row.3 = phi i32 [ %row.2, %109 ], [ %row.111, %copy_data.exit ]
  %current.2 = phi %struct._list* [ %current.113, %109 ], [ %105, %copy_data.exit ]
  tail call void @free(i8* %17) #4, !dbg !627
  %112 = add nsw i32 %col.1, 1, !dbg !573
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !118), !dbg !573
  %113 = load i32* @ncol, align 4, !dbg !573, !tbaa !177
  %114 = icmp eq i32 %112, %113, !dbg !573
  br i1 %114, label %._crit_edge, label %.lr.ph, !dbg !573

._crit_edge:                                      ; preds = %111
  %.pre19 = load i32* @nrow, align 4, !dbg !571, !tbaa !177
  br label %115, !dbg !573

; <label>:115                                     ; preds = %._crit_edge, %.preheader
  %116 = phi i32 [ %112, %._crit_edge ], [ %7, %.preheader ]
  %117 = phi i32 [ %112, %._crit_edge ], [ %8, %.preheader ]
  %118 = phi i32 [ %.pre19, %._crit_edge ], [ %9, %.preheader ], !dbg !571
  %119 = phi i32 [ %112, %._crit_edge ], [ 0, %.preheader ]
  %current.1.lcssa = phi %struct._list* [ %current.2, %._crit_edge ], [ %current.016, %.preheader ]
  %row.1.lcssa = phi i32 [ %row.3, %._crit_edge ], [ %row.015, %.preheader ]
  %120 = add nsw i32 %row.1.lcssa, 1, !dbg !571
  tail call void @llvm.dbg.value(metadata !{i32 %120}, i64 0, metadata !117), !dbg !571
  %121 = icmp eq i32 %120, %118, !dbg !571
  br i1 %121, label %._crit_edge17, label %.preheader, !dbg !571

._crit_edge17:                                    ; preds = %115
  %.pre = load %struct._list** %3, align 8, !dbg !628, !tbaa !231
  br label %122, !dbg !571

; <label>:122                                     ; preds = %._crit_edge17, %0
  %123 = phi %struct._list* [ %.pre, %._crit_edge17 ], [ null, %0 ]
  tail call void @llvm.dbg.value(metadata !{%struct._list* %123}, i64 0, metadata !121), !dbg !628
  tail call void @free(i8* %1) #4, !dbg !629
  store %struct._list* %123, %struct._list** @wanted, align 8, !dbg !630, !tbaa !276
  ret void, !dbg !631
}

; Function Attrs: nounwind uwtable
define noalias i32* @get_good_move(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !126), !dbg !632
  %1 = icmp eq %struct._list* %list, null, !dbg !633
  br i1 %1, label %copy_data.exit, label %.preheader, !dbg !633

.preheader:                                       ; preds = %0
  %2 = getelementptr inbounds %struct._list* %list, i64 0, i32 1, !dbg !635
  %3 = load %struct._list** %2, align 8, !dbg !635, !tbaa !231
  %4 = icmp eq %struct._list* %3, null, !dbg !635
  %.pre = load i32* @ncol, align 4, !dbg !636, !tbaa !177
  br i1 %4, label %.critedge, label %.lr.ph, !dbg !635

.lr.ph:                                           ; preds = %.preheader
  %5 = sext i32 %.pre to i64
  br label %6, !dbg !635

; <label>:6                                       ; preds = %.lr.ph, %27
  %7 = phi %struct._list* [ %3, %.lr.ph ], [ %29, %27 ]
  %.06 = phi %struct._list* [ %list, %.lr.ph ], [ %7, %27 ]
  %8 = getelementptr inbounds %struct._list* %.06, i64 0, i32 0, !dbg !635
  %9 = load i32** %8, align 8, !dbg !635, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %9}, i64 0, metadata !638), !dbg !639
  br label %10, !dbg !640

; <label>:10                                      ; preds = %equal_data.exit.i, %6
  %search.0.in.i = phi %struct._play** [ @game_tree, %6 ], [ %23, %equal_data.exit.i ]
  %search.0.i = load %struct._play** %search.0.in.i, align 8, !dbg !641
  %11 = getelementptr inbounds %struct._play* %search.0.i, i64 0, i32 1, !dbg !640
  %12 = load i32** %11, align 8, !dbg !640, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %12}, i64 0, metadata !642), !dbg !643
  tail call void @llvm.dbg.value(metadata !{i32* %9}, i64 0, metadata !644), !dbg !643
  tail call void @llvm.dbg.value(metadata !{i32 %.pre}, i64 0, metadata !645), !dbg !646
  br label %13, !dbg !647

; <label>:13                                      ; preds = %16, %10
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %16 ], [ %5, %10 ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1
  %14 = trunc i64 %indvars.iv.i.i to i32, !dbg !647
  %15 = icmp eq i32 %14, 0, !dbg !647
  br i1 %15, label %get_value.exit, label %16, !dbg !647

; <label>:16                                      ; preds = %13
  %17 = getelementptr inbounds i32* %12, i64 %indvars.iv.next.i.i, !dbg !647
  %18 = load i32* %17, align 4, !dbg !647, !tbaa !177
  %19 = getelementptr inbounds i32* %9, i64 %indvars.iv.next.i.i, !dbg !647
  %20 = load i32* %19, align 4, !dbg !647, !tbaa !177
  %21 = icmp eq i32 %18, %20, !dbg !647
  br i1 %21, label %13, label %equal_data.exit.i

equal_data.exit.i:                                ; preds = %16
  %22 = icmp slt i32 %14, 1, !dbg !648
  %23 = getelementptr inbounds %struct._play* %search.0.i, i64 0, i32 3, !dbg !649
  br i1 %22, label %get_value.exit, label %10, !dbg !640

get_value.exit:                                   ; preds = %equal_data.exit.i, %13
  %24 = getelementptr inbounds %struct._play* %search.0.i, i64 0, i32 0, !dbg !650
  %25 = load i32* %24, align 4, !dbg !650, !tbaa !263
  %26 = icmp eq i32 %25, 0, !dbg !635
  br i1 %26, label %.critedge, label %27

; <label>:27                                      ; preds = %get_value.exit
  tail call void @llvm.dbg.value(metadata !{%struct._list* %7}, i64 0, metadata !126), !dbg !651
  %28 = getelementptr inbounds %struct._list* %7, i64 0, i32 1, !dbg !635
  %29 = load %struct._list** %28, align 8, !dbg !635, !tbaa !231
  %30 = icmp eq %struct._list* %29, null, !dbg !635
  br i1 %30, label %.critedge, label %6, !dbg !635

.critedge:                                        ; preds = %27, %get_value.exit, %.preheader
  %.0.lcssa = phi %struct._list* [ %list, %.preheader ], [ %7, %27 ], [ %.06, %get_value.exit ]
  %31 = getelementptr inbounds %struct._list* %.0.lcssa, i64 0, i32 0, !dbg !637
  %32 = load i32** %31, align 8, !dbg !637, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %32}, i64 0, metadata !652) #4, !dbg !653
  %33 = sext i32 %.pre to i64, !dbg !636
  %34 = shl nsw i64 %33, 2, !dbg !636
  %35 = tail call noalias i8* @malloc(i64 %34) #4, !dbg !636
  %36 = bitcast i8* %35 to i32*, !dbg !636
  tail call void @llvm.dbg.value(metadata !{i32* %36}, i64 0, metadata !654) #4, !dbg !636
  tail call void @llvm.dbg.value(metadata !{i32 %.pre}, i64 0, metadata !655) #4, !dbg !656
  %37 = icmp eq i32 %.pre, 0, !dbg !657
  br i1 %37, label %copy_data.exit, label %.lr.ph.i.preheader, !dbg !657

.lr.ph.i.preheader:                               ; preds = %.critedge
  %38 = add i32 %.pre, -1, !dbg !657
  %39 = zext i32 %38 to i64
  %40 = add i64 %39, 1, !dbg !657
  %end.idx = add i64 %39, 1
  %n.vec = and i64 %40, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %41 = sext i32 %.pre to i64
  %42 = shl nsw i64 %41, 2
  %43 = add i64 %42, -4
  %44 = add i32 %.pre, -1
  %45 = zext i32 %44 to i64
  %46 = add i64 %41, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.i.preheader
  %47 = sub i64 %46, %45
  %48 = shl nuw nsw i64 %45, 2
  %scevgep19 = getelementptr i32* %32, i64 %47
  %scevgep17 = getelementptr i32* %32, i64 %46
  %49 = sub i64 %43, %48
  %scevgep1920 = bitcast i32* %scevgep19 to i8*
  %scevgep1718 = bitcast i32* %scevgep17 to i8*
  %scevgep16 = getelementptr i8* %35, i64 %49
  %scevgep = getelementptr i8* %35, i64 %43
  %bound1 = icmp ule i8* %scevgep1718, %scevgep16
  %bound0 = icmp ule i8* %scevgep, %scevgep1920
  %memcheck.conflict = and i1 %bound0, %bound1
  %rev.ind.end = sub i64 %33, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %reverse.idx = sub i64 %33, %index
  %.sum = add i64 %reverse.idx, -4, !dbg !658
  %50 = getelementptr i32* %32, i64 %.sum, !dbg !658
  %51 = bitcast i32* %50 to <4 x i32>*, !dbg !658
  %wide.load = load <4 x i32>* %51, align 4, !dbg !658
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !658
  %.sum27 = add i64 %reverse.idx, -8, !dbg !658
  %52 = getelementptr i32* %32, i64 %.sum27, !dbg !658
  %53 = bitcast i32* %52 to <4 x i32>*, !dbg !658
  %wide.load22 = load <4 x i32>* %53, align 4, !dbg !658
  %reverse23 = shufflevector <4 x i32> %wide.load22, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !658
  %reverse24 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !658
  %.sum28 = add i64 %reverse.idx, -4, !dbg !658
  %54 = getelementptr i32* %36, i64 %.sum28, !dbg !658
  %55 = bitcast i32* %54 to <4 x i32>*, !dbg !658
  store <4 x i32> %reverse24, <4 x i32>* %55, align 4, !dbg !658
  %reverse25 = shufflevector <4 x i32> %reverse23, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !658
  %.sum30 = add i64 %reverse.idx, -8, !dbg !658
  %56 = getelementptr i32* %36, i64 %.sum30, !dbg !658
  %57 = bitcast i32* %56 to <4 x i32>*, !dbg !658
  store <4 x i32> %reverse25, <4 x i32>* %57, align 4, !dbg !658
  %index.next = add i64 %index, 8
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !659

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.i.preheader
  %resume.val = phi i64 [ %33, %.lr.ph.i.preheader ], [ %33, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %new.indc.resume.val
  br i1 %cmp.n, label %copy_data.exit, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %middle.block, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ %resume.val, %middle.block ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1, !dbg !657
  %59 = getelementptr inbounds i32* %32, i64 %indvars.iv.next.i, !dbg !658
  %60 = load i32* %59, align 4, !dbg !658, !tbaa !177
  %61 = getelementptr inbounds i32* %36, i64 %indvars.iv.next.i, !dbg !658
  store i32 %60, i32* %61, align 4, !dbg !658, !tbaa !177
  %62 = trunc i64 %indvars.iv.next.i to i32, !dbg !657
  %63 = icmp eq i32 %62, 0, !dbg !657
  br i1 %63, label %copy_data.exit, label %.lr.ph.i, !dbg !657, !llvm.loop !660

copy_data.exit:                                   ; preds = %.lr.ph.i, %middle.block, %.critedge, %0
  %.01 = phi i32* [ null, %0 ], [ %36, %.critedge ], [ %36, %middle.block ], [ %36, %.lr.ph.i ]
  ret i32* %.01, !dbg !661
}

; Function Attrs: nounwind uwtable
define noalias i32* @get_winning_move(%struct._play* nocapture readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !131), !dbg !662
  br label %1, !dbg !663

; <label>:1                                       ; preds = %1, %0
  %.0 = phi %struct._play* [ %play, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct._play* %.0, i64 0, i32 3, !dbg !663
  %3 = load %struct._play** %2, align 8, !dbg !663, !tbaa !243
  %4 = icmp eq %struct._play* %3, null, !dbg !663
  br i1 %4, label %5, label %1, !dbg !663

; <label>:5                                       ; preds = %1
  %6 = getelementptr inbounds %struct._play* %.0, i64 0, i32 2, !dbg !664
  %7 = load %struct._list** %6, align 8, !dbg !664, !tbaa !246
  tail call void @llvm.dbg.value(metadata !{%struct._list* %7}, i64 0, metadata !665) #4, !dbg !666
  %8 = icmp eq %struct._list* %7, null, !dbg !667
  br i1 %8, label %get_good_move.exit, label %.preheader.i, !dbg !667

.preheader.i:                                     ; preds = %5
  %9 = getelementptr inbounds %struct._list* %7, i64 0, i32 1, !dbg !668
  %10 = load %struct._list** %9, align 8, !dbg !668, !tbaa !231
  %11 = icmp eq %struct._list* %10, null, !dbg !668
  %.pre.i = load i32* @ncol, align 4, !dbg !669, !tbaa !177
  %.pre = sext i32 %.pre.i to i64, !dbg !669
  br i1 %11, label %.critedge.i, label %.lr.ph.i, !dbg !668

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %12 = phi %struct._list* [ %34, %32 ], [ %10, %.preheader.i ]
  %.06.i = phi %struct._list* [ %12, %32 ], [ %7, %.preheader.i ]
  %13 = getelementptr inbounds %struct._list* %.06.i, i64 0, i32 0, !dbg !668
  %14 = load i32** %13, align 8, !dbg !668, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %14}, i64 0, metadata !671) #4, !dbg !672
  br label %15, !dbg !673

; <label>:15                                      ; preds = %equal_data.exit.i.i, %.lr.ph.i
  %search.0.in.i.i = phi %struct._play** [ @game_tree, %.lr.ph.i ], [ %28, %equal_data.exit.i.i ]
  %search.0.i.i = load %struct._play** %search.0.in.i.i, align 8, !dbg !674
  %16 = getelementptr inbounds %struct._play* %search.0.i.i, i64 0, i32 1, !dbg !673
  %17 = load i32** %16, align 8, !dbg !673, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %17}, i64 0, metadata !675) #4, !dbg !676
  tail call void @llvm.dbg.value(metadata !{i32* %14}, i64 0, metadata !677) #4, !dbg !676
  tail call void @llvm.dbg.value(metadata !{i32 %.pre.i}, i64 0, metadata !678) #4, !dbg !679
  br label %18, !dbg !680

; <label>:18                                      ; preds = %21, %15
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i, %21 ], [ %.pre, %15 ]
  %indvars.iv.next.i.i.i = add nsw i64 %indvars.iv.i.i.i, -1
  %19 = trunc i64 %indvars.iv.i.i.i to i32, !dbg !680
  %20 = icmp eq i32 %19, 0, !dbg !680
  br i1 %20, label %get_value.exit.i, label %21, !dbg !680

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds i32* %17, i64 %indvars.iv.next.i.i.i, !dbg !680
  %23 = load i32* %22, align 4, !dbg !680, !tbaa !177
  %24 = getelementptr inbounds i32* %14, i64 %indvars.iv.next.i.i.i, !dbg !680
  %25 = load i32* %24, align 4, !dbg !680, !tbaa !177
  %26 = icmp eq i32 %23, %25, !dbg !680
  br i1 %26, label %18, label %equal_data.exit.i.i

equal_data.exit.i.i:                              ; preds = %21
  %27 = icmp slt i32 %19, 1, !dbg !681
  %28 = getelementptr inbounds %struct._play* %search.0.i.i, i64 0, i32 3, !dbg !682
  br i1 %27, label %get_value.exit.i, label %15, !dbg !673

get_value.exit.i:                                 ; preds = %equal_data.exit.i.i, %18
  %29 = getelementptr inbounds %struct._play* %search.0.i.i, i64 0, i32 0, !dbg !683
  %30 = load i32* %29, align 4, !dbg !683, !tbaa !263
  %31 = icmp eq i32 %30, 0, !dbg !668
  br i1 %31, label %.critedge.i, label %32

; <label>:32                                      ; preds = %get_value.exit.i
  tail call void @llvm.dbg.value(metadata !{%struct._list* %12}, i64 0, metadata !665) #4, !dbg !684
  %33 = getelementptr inbounds %struct._list* %12, i64 0, i32 1, !dbg !668
  %34 = load %struct._list** %33, align 8, !dbg !668, !tbaa !231
  %35 = icmp eq %struct._list* %34, null, !dbg !668
  br i1 %35, label %.critedge.i, label %.lr.ph.i, !dbg !668

.critedge.i:                                      ; preds = %32, %get_value.exit.i, %.preheader.i
  %.0.lcssa.i = phi %struct._list* [ %7, %.preheader.i ], [ %12, %32 ], [ %.06.i, %get_value.exit.i ]
  %36 = getelementptr inbounds %struct._list* %.0.lcssa.i, i64 0, i32 0, !dbg !670
  %37 = load i32** %36, align 8, !dbg !670, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %37}, i64 0, metadata !685) #4, !dbg !686
  %38 = shl nsw i64 %.pre, 2, !dbg !669
  %39 = tail call noalias i8* @malloc(i64 %38) #4, !dbg !669
  %40 = bitcast i8* %39 to i32*, !dbg !669
  tail call void @llvm.dbg.value(metadata !{i32* %40}, i64 0, metadata !687) #4, !dbg !669
  tail call void @llvm.dbg.value(metadata !{i32 %.pre.i}, i64 0, metadata !688) #4, !dbg !689
  %41 = icmp eq i32 %.pre.i, 0, !dbg !690
  br i1 %41, label %get_good_move.exit, label %.lr.ph.i.i.preheader, !dbg !690

.lr.ph.i.i.preheader:                             ; preds = %.critedge.i
  %42 = add i32 %.pre.i, -1, !dbg !690
  %43 = zext i32 %42 to i64
  %44 = add i64 %43, 1, !dbg !690
  %end.idx = add i64 %43, 1
  %n.vec = and i64 %44, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %45 = sext i32 %.pre.i to i64
  %46 = shl nsw i64 %45, 2
  %47 = add i64 %46, -4
  %48 = add i32 %.pre.i, -1
  %49 = zext i32 %48 to i64
  %50 = add i64 %45, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.i.i.preheader
  %51 = sub i64 %50, %49
  %52 = shl nuw nsw i64 %49, 2
  %scevgep15 = getelementptr i32* %37, i64 %51
  %scevgep13 = getelementptr i32* %37, i64 %50
  %53 = sub i64 %47, %52
  %scevgep1516 = bitcast i32* %scevgep15 to i8*
  %scevgep1314 = bitcast i32* %scevgep13 to i8*
  %scevgep12 = getelementptr i8* %39, i64 %53
  %scevgep = getelementptr i8* %39, i64 %47
  %bound1 = icmp ule i8* %scevgep1314, %scevgep12
  %bound0 = icmp ule i8* %scevgep, %scevgep1516
  %memcheck.conflict = and i1 %bound0, %bound1
  %rev.ind.end = sub i64 %.pre, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %reverse.idx = sub i64 %.pre, %index
  %.sum = add i64 %reverse.idx, -4, !dbg !691
  %54 = getelementptr i32* %37, i64 %.sum, !dbg !691
  %55 = bitcast i32* %54 to <4 x i32>*, !dbg !691
  %wide.load = load <4 x i32>* %55, align 4, !dbg !691
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !691
  %.sum23 = add i64 %reverse.idx, -8, !dbg !691
  %56 = getelementptr i32* %37, i64 %.sum23, !dbg !691
  %57 = bitcast i32* %56 to <4 x i32>*, !dbg !691
  %wide.load18 = load <4 x i32>* %57, align 4, !dbg !691
  %reverse19 = shufflevector <4 x i32> %wide.load18, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !691
  %reverse20 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !691
  %.sum24 = add i64 %reverse.idx, -4, !dbg !691
  %58 = getelementptr i32* %40, i64 %.sum24, !dbg !691
  %59 = bitcast i32* %58 to <4 x i32>*, !dbg !691
  store <4 x i32> %reverse20, <4 x i32>* %59, align 4, !dbg !691
  %reverse21 = shufflevector <4 x i32> %reverse19, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !691
  %.sum26 = add i64 %reverse.idx, -8, !dbg !691
  %60 = getelementptr i32* %40, i64 %.sum26, !dbg !691
  %61 = bitcast i32* %60 to <4 x i32>*, !dbg !691
  store <4 x i32> %reverse21, <4 x i32>* %61, align 4, !dbg !691
  %index.next = add i64 %index, 8
  %62 = icmp eq i64 %index.next, %n.vec
  br i1 %62, label %middle.block, label %vector.body, !llvm.loop !692

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.i.i.preheader
  %resume.val = phi i64 [ %.pre, %.lr.ph.i.i.preheader ], [ %.pre, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i.i.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %new.indc.resume.val
  br i1 %cmp.n, label %get_good_move.exit, label %.lr.ph.i.i

.lr.ph.i.i:                                       ; preds = %middle.block, %.lr.ph.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %.lr.ph.i.i ], [ %resume.val, %middle.block ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1, !dbg !690
  %63 = getelementptr inbounds i32* %37, i64 %indvars.iv.next.i.i, !dbg !691
  %64 = load i32* %63, align 4, !dbg !691, !tbaa !177
  %65 = getelementptr inbounds i32* %40, i64 %indvars.iv.next.i.i, !dbg !691
  store i32 %64, i32* %65, align 4, !dbg !691, !tbaa !177
  %66 = trunc i64 %indvars.iv.next.i.i to i32, !dbg !690
  %67 = icmp eq i32 %66, 0, !dbg !690
  br i1 %67, label %get_good_move.exit, label %.lr.ph.i.i, !dbg !690, !llvm.loop !693

get_good_move.exit:                               ; preds = %.lr.ph.i.i, %middle.block, %5, %.critedge.i
  %.01.i = phi i32* [ null, %5 ], [ %40, %.critedge.i ], [ %40, %middle.block ], [ %40, %.lr.ph.i.i ]
  tail call void @llvm.dbg.value(metadata !{i32* %.01.i}, i64 0, metadata !132), !dbg !664
  ret i32* %.01.i, !dbg !694
}

; Function Attrs: nounwind readonly uwtable
define %struct._list* @where(i32* nocapture readonly %data, %struct._play* nocapture readonly %play) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !137), !dbg !695
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !138), !dbg !695
  %1 = load i32* @ncol, align 4, !dbg !696, !tbaa !177
  %2 = sext i32 %1 to i64
  br label %3, !dbg !697

; <label>:3                                       ; preds = %16, %0
  %.0 = phi %struct._play* [ %play, %0 ], [ %18, %16 ]
  %4 = getelementptr inbounds %struct._play* %.0, i64 0, i32 1, !dbg !697
  %5 = load i32** %4, align 8, !dbg !697, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !698), !dbg !699
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !700), !dbg !699
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !701), !dbg !696
  br label %6, !dbg !702

; <label>:6                                       ; preds = %9, %3
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %9 ], [ %2, %3 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %7 = trunc i64 %indvars.iv.i to i32, !dbg !702
  %8 = icmp eq i32 %7, 0, !dbg !702
  br i1 %8, label %equal_data.exit.thread, label %9, !dbg !702

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds i32* %5, i64 %indvars.iv.next.i, !dbg !702
  %11 = load i32* %10, align 4, !dbg !702, !tbaa !177
  %12 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !702
  %13 = load i32* %12, align 4, !dbg !702, !tbaa !177
  %14 = icmp eq i32 %11, %13, !dbg !702
  br i1 %14, label %6, label %equal_data.exit

equal_data.exit:                                  ; preds = %9
  %15 = icmp slt i32 %7, 1, !dbg !703
  br i1 %15, label %equal_data.exit.thread, label %16, !dbg !697

; <label>:16                                      ; preds = %equal_data.exit
  %17 = getelementptr inbounds %struct._play* %.0, i64 0, i32 3, !dbg !704
  %18 = load %struct._play** %17, align 8, !dbg !704, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{%struct._play* %18}, i64 0, metadata !138), !dbg !704
  br label %3, !dbg !704

equal_data.exit.thread:                           ; preds = %equal_data.exit, %6
  %19 = getelementptr inbounds %struct._play* %.0, i64 0, i32 2, !dbg !705
  %20 = load %struct._list** %19, align 8, !dbg !705, !tbaa !246
  ret %struct._list* %20, !dbg !705
}

; Function Attrs: nounwind uwtable
define void @get_real_move(i32* nocapture readonly %data1, i32* nocapture readonly %data2, i32* nocapture %row, i32* nocapture %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !143), !dbg !706
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !144), !dbg !706
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !145), !dbg !706
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !146), !dbg !706
  br label %1, !dbg !707

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %1 ], [ 0, %0 ]
  %2 = trunc i64 %indvars.iv to i32, !dbg !708
  store i32 %2, i32* %col, align 4, !dbg !708, !tbaa !177
  %3 = getelementptr inbounds i32* %data1, i64 %indvars.iv, !dbg !707
  %4 = load i32* %3, align 4, !dbg !707, !tbaa !177
  %5 = getelementptr inbounds i32* %data2, i64 %indvars.iv, !dbg !707
  %6 = load i32* %5, align 4, !dbg !707, !tbaa !177
  %7 = icmp eq i32 %4, %6, !dbg !707
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !707
  br i1 %7, label %1, label %8, !dbg !707

; <label>:8                                       ; preds = %1
  store i32 %4, i32* %row, align 4, !dbg !709, !tbaa !177
  ret void, !dbg !710
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str20, i64 0, i64 0)), !dbg !711
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str21, i64 0, i64 0)), !dbg !712
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str22, i64 0, i64 0)), !dbg !713
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0)) #4, !dbg !714
  tail call void @llvm.dbg.value(metadata !715, i64 0, metadata !151), !dbg !716
  tail call void @llvm.dbg.value(metadata !715, i64 0, metadata !717), !dbg !723
  tail call void @llvm.dbg.value(metadata !715, i64 0, metadata !151), !dbg !724
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i64 0, i64 0)) #4, !dbg !725
  store i32 7, i32* @ncol, align 4, !dbg !726, !tbaa !177
  %3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i64 0, i64 0)) #4, !dbg !727
  store i32 8, i32* @nrow, align 4, !dbg !728, !tbaa !177
  %4 = tail call %struct._play* @make_play(i32 1), !dbg !729
  tail call void @llvm.dbg.value(metadata !{%struct._play* %4}, i64 0, metadata !158), !dbg !729
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !154), !dbg !730
  %5 = load i32* @ncol, align 4, !dbg !731, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !732) #4, !dbg !733
  %6 = sext i32 %5 to i64, !dbg !734
  %7 = shl nsw i64 %6, 2, !dbg !734
  %8 = tail call noalias i8* @malloc(i64 %7) #4, !dbg !734
  %9 = bitcast i8* %8 to i32*, !dbg !734
  tail call void @llvm.dbg.value(metadata !{i32* %9}, i64 0, metadata !735) #4, !dbg !734
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !736) #4, !dbg !737
  %10 = icmp eq i32 %5, 0, !dbg !737
  br i1 %10, label %make_data.exit.preheader, label %.lr.ph4.i, !dbg !737

.lr.ph4.i:                                        ; preds = %0
  %11 = load i32* @nrow, align 4, !dbg !738, !tbaa !177
  %12 = add i32 %5, -1, !dbg !737
  %13 = zext i32 %12 to i64
  %14 = add i64 %13, 1, !dbg !737
  %end.idx = add i64 %13, 1, !dbg !737
  %n.vec = and i64 %14, 8589934584, !dbg !737
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !737
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph4.i
  %broadcast.splatinsert63 = insertelement <4 x i32> undef, i32 %11, i32 0
  %broadcast.splat64 = shufflevector <4 x i32> %broadcast.splatinsert63, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !737
  %15 = getelementptr inbounds i32* %9, i64 %index, !dbg !738
  %16 = bitcast i32* %15 to <4 x i32>*, !dbg !738
  store <4 x i32> %broadcast.splat64, <4 x i32>* %16, align 4, !dbg !738
  %.sum97 = or i64 %index, 4, !dbg !738
  %17 = getelementptr i32* %9, i64 %.sum97, !dbg !738
  %18 = bitcast i32* %17 to <4 x i32>*, !dbg !738
  store <4 x i32> %broadcast.splat64, <4 x i32>* %18, align 4, !dbg !738
  %index.next = add i64 %index, 8, !dbg !737
  %19 = icmp eq i64 %index.next, %n.vec, !dbg !737
  br i1 %19, label %middle.block, label %vector.body, !dbg !737, !llvm.loop !739

middle.block:                                     ; preds = %vector.body, %.lr.ph4.i
  %resume.val = phi i64 [ 0, %.lr.ph4.i ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.lr.ph, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %scalar.ph ], [ %resume.val, %middle.block ]
  %20 = getelementptr inbounds i32* %9, i64 %indvars.iv5.i, !dbg !738
  store i32 %11, i32* %20, align 4, !dbg !738, !tbaa !177
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !737
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !736) #4, !dbg !737
  %lftr.wideiv = trunc i64 %indvars.iv.next6.i to i32, !dbg !737
  %exitcond = icmp eq i32 %lftr.wideiv, %5, !dbg !737
  br i1 %exitcond, label %.lr.ph, label %scalar.ph, !dbg !737, !llvm.loop !740

make_data.exit.preheader:                         ; preds = %0
  %21 = icmp eq i8* %8, null, !dbg !741
  br i1 %21, label %make_data.exit.outer._crit_edge, label %.lr.ph, !dbg !741

.lr.ph:                                           ; preds = %make_data.exit.preheader, %middle.block, %scalar.ph, %get_real_move.exit..lr.ph_crit_edge
  %.pre = phi i32 [ %.pre.pre, %get_real_move.exit..lr.ph_crit_edge ], [ 0, %make_data.exit.preheader ], [ %5, %middle.block ], [ %5, %scalar.ph ]
  %player.0.ph34 = phi i32 [ %109, %get_real_move.exit..lr.ph_crit_edge ], [ 0, %scalar.ph ], [ 0, %middle.block ], [ 0, %make_data.exit.preheader ]
  %current.0.ph33 = phi i32* [ %101, %get_real_move.exit..lr.ph_crit_edge ], [ %9, %scalar.ph ], [ %9, %middle.block ], [ %9, %make_data.exit.preheader ]
  tail call void @llvm.dbg.value(metadata !{i32* %current.0.ph33}, i64 0, metadata !742), !dbg !744
  tail call void @llvm.dbg.value(metadata !{%struct._play* %4}, i64 0, metadata !745), !dbg !744
  %22 = sext i32 %.pre to i64
  br label %23, !dbg !746

; <label>:23                                      ; preds = %36, %.lr.ph
  %.0.i = phi %struct._play* [ %4, %.lr.ph ], [ %38, %36 ]
  %24 = getelementptr inbounds %struct._play* %.0.i, i64 0, i32 1, !dbg !746
  %25 = load i32** %24, align 8, !dbg !746, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %25}, i64 0, metadata !747), !dbg !748
  tail call void @llvm.dbg.value(metadata !{i32* %current.0.ph33}, i64 0, metadata !749), !dbg !748
  tail call void @llvm.dbg.value(metadata !{i32 %.pre}, i64 0, metadata !750), !dbg !751
  br label %26, !dbg !752

; <label>:26                                      ; preds = %29, %23
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %29 ], [ %22, %23 ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1
  %27 = trunc i64 %indvars.iv.i.i to i32, !dbg !752
  %28 = icmp eq i32 %27, 0, !dbg !752
  br i1 %28, label %where.exit, label %29, !dbg !752

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds i32* %25, i64 %indvars.iv.next.i.i, !dbg !752
  %31 = load i32* %30, align 4, !dbg !752, !tbaa !177
  %32 = getelementptr inbounds i32* %current.0.ph33, i64 %indvars.iv.next.i.i, !dbg !752
  %33 = load i32* %32, align 4, !dbg !752, !tbaa !177
  %34 = icmp eq i32 %31, %33, !dbg !752
  br i1 %34, label %26, label %equal_data.exit.i

equal_data.exit.i:                                ; preds = %29
  %35 = icmp slt i32 %27, 1, !dbg !753
  br i1 %35, label %where.exit, label %36, !dbg !746

; <label>:36                                      ; preds = %equal_data.exit.i
  %37 = getelementptr inbounds %struct._play* %.0.i, i64 0, i32 3, !dbg !754
  %38 = load %struct._play** %37, align 8, !dbg !754, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{%struct._play* %38}, i64 0, metadata !745), !dbg !754
  br label %23, !dbg !754

where.exit:                                       ; preds = %equal_data.exit.i, %26
  %39 = getelementptr inbounds %struct._play* %.0.i, i64 0, i32 2, !dbg !755
  %40 = load %struct._list** %39, align 8, !dbg !755, !tbaa !246
  tail call void @llvm.dbg.value(metadata !{%struct._list* %40}, i64 0, metadata !756) #4, !dbg !757
  %41 = icmp eq %struct._list* %40, null, !dbg !758
  br i1 %41, label %make_data.exit.outer._crit_edge, label %.preheader.i3, !dbg !758

.preheader.i3:                                    ; preds = %where.exit
  %42 = getelementptr inbounds %struct._list* %40, i64 0, i32 1, !dbg !759
  %43 = load %struct._list** %42, align 8, !dbg !759, !tbaa !231
  %44 = icmp eq %struct._list* %43, null, !dbg !759
  br i1 %44, label %.critedge.i, label %.lr.ph.i4, !dbg !759

.lr.ph.i4:                                        ; preds = %.preheader.i3, %65
  %45 = phi %struct._list* [ %67, %65 ], [ %43, %.preheader.i3 ]
  %.06.i = phi %struct._list* [ %45, %65 ], [ %40, %.preheader.i3 ]
  %46 = getelementptr inbounds %struct._list* %.06.i, i64 0, i32 0, !dbg !759
  %47 = load i32** %46, align 8, !dbg !759, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %47}, i64 0, metadata !760) #4, !dbg !761
  br label %48, !dbg !762

; <label>:48                                      ; preds = %equal_data.exit.i.i, %.lr.ph.i4
  %search.0.in.i.i = phi %struct._play** [ @game_tree, %.lr.ph.i4 ], [ %61, %equal_data.exit.i.i ]
  %search.0.i.i = load %struct._play** %search.0.in.i.i, align 8, !dbg !763
  %49 = getelementptr inbounds %struct._play* %search.0.i.i, i64 0, i32 1, !dbg !762
  %50 = load i32** %49, align 8, !dbg !762, !tbaa !248
  tail call void @llvm.dbg.value(metadata !{i32* %50}, i64 0, metadata !764) #4, !dbg !765
  tail call void @llvm.dbg.value(metadata !{i32* %47}, i64 0, metadata !766) #4, !dbg !765
  tail call void @llvm.dbg.value(metadata !{i32 %.pre}, i64 0, metadata !767) #4, !dbg !768
  br label %51, !dbg !769

; <label>:51                                      ; preds = %54, %48
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i, %54 ], [ %22, %48 ]
  %indvars.iv.next.i.i.i = add nsw i64 %indvars.iv.i.i.i, -1
  %52 = trunc i64 %indvars.iv.i.i.i to i32, !dbg !769
  %53 = icmp eq i32 %52, 0, !dbg !769
  br i1 %53, label %get_value.exit.i, label %54, !dbg !769

; <label>:54                                      ; preds = %51
  %55 = getelementptr inbounds i32* %50, i64 %indvars.iv.next.i.i.i, !dbg !769
  %56 = load i32* %55, align 4, !dbg !769, !tbaa !177
  %57 = getelementptr inbounds i32* %47, i64 %indvars.iv.next.i.i.i, !dbg !769
  %58 = load i32* %57, align 4, !dbg !769, !tbaa !177
  %59 = icmp eq i32 %56, %58, !dbg !769
  br i1 %59, label %51, label %equal_data.exit.i.i

equal_data.exit.i.i:                              ; preds = %54
  %60 = icmp slt i32 %52, 1, !dbg !770
  %61 = getelementptr inbounds %struct._play* %search.0.i.i, i64 0, i32 3, !dbg !771
  br i1 %60, label %get_value.exit.i, label %48, !dbg !762

get_value.exit.i:                                 ; preds = %equal_data.exit.i.i, %51
  %62 = getelementptr inbounds %struct._play* %search.0.i.i, i64 0, i32 0, !dbg !772
  %63 = load i32* %62, align 4, !dbg !772, !tbaa !263
  %64 = icmp eq i32 %63, 0, !dbg !759
  br i1 %64, label %.critedge.i, label %65

; <label>:65                                      ; preds = %get_value.exit.i
  tail call void @llvm.dbg.value(metadata !{%struct._list* %45}, i64 0, metadata !756) #4, !dbg !773
  %66 = getelementptr inbounds %struct._list* %45, i64 0, i32 1, !dbg !759
  %67 = load %struct._list** %66, align 8, !dbg !759, !tbaa !231
  %68 = icmp eq %struct._list* %67, null, !dbg !759
  br i1 %68, label %.critedge.i, label %.lr.ph.i4, !dbg !759

.critedge.i:                                      ; preds = %65, %get_value.exit.i, %.preheader.i3
  %.0.lcssa.i = phi %struct._list* [ %40, %.preheader.i3 ], [ %45, %65 ], [ %.06.i, %get_value.exit.i ]
  %69 = getelementptr inbounds %struct._list* %.0.lcssa.i, i64 0, i32 0, !dbg !774
  %70 = load i32** %69, align 8, !dbg !774, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %70}, i64 0, metadata !775) #4, !dbg !776
  %71 = shl nsw i64 %22, 2, !dbg !777
  %72 = tail call noalias i8* @malloc(i64 %71) #4, !dbg !777
  tail call void @llvm.dbg.value(metadata !{i32* %101}, i64 0, metadata !778) #4, !dbg !777
  tail call void @llvm.dbg.value(metadata !{i32 %.pre}, i64 0, metadata !779) #4, !dbg !780
  %73 = icmp eq i32 %.pre, 0, !dbg !781
  br i1 %73, label %get_good_move.exit, label %.lr.ph.i.i.preheader, !dbg !781

.lr.ph.i.i.preheader:                             ; preds = %.critedge.i
  %74 = bitcast i8* %72 to i32*, !dbg !777
  %75 = add i32 %.pre, -1, !dbg !781
  %76 = zext i32 %75 to i64
  %77 = add i64 %76, 1, !dbg !781
  %end.idx72 = add i64 %76, 1
  %n.vec74 = and i64 %77, 8589934584
  %cmp.zero76 = icmp eq i64 %n.vec74, 0
  %78 = sext i32 %.pre to i64
  %79 = shl nsw i64 %78, 2
  %80 = add i32 %.pre, -1
  %81 = zext i32 %80 to i64
  br i1 %cmp.zero76, label %middle.block69, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.i.i.preheader
  %82 = sub i64 %78, %81
  %83 = shl nuw nsw i64 %81, 2
  %scevgep83.sum = add i64 %82, -1
  %scevgep80.sum = add i64 %78, -1
  %84 = sub i64 %79, %83
  %scevgep84 = getelementptr i32* %70, i64 %scevgep83.sum
  %scevgep81 = getelementptr i32* %70, i64 %scevgep80.sum
  %scevgep78.sum = add i64 %84, -4
  %scevgep.sum = add i64 %79, -4
  %scevgep8485 = bitcast i32* %scevgep84 to i8*
  %scevgep8182 = bitcast i32* %scevgep81 to i8*
  %scevgep79 = getelementptr i8* %72, i64 %scevgep78.sum
  %scevgep77 = getelementptr i8* %72, i64 %scevgep.sum
  %bound1 = icmp ule i8* %scevgep8182, %scevgep79
  %bound0 = icmp ule i8* %scevgep77, %scevgep8485
  %memcheck.conflict = and i1 %bound0, %bound1
  %rev.ind.end = sub i64 %22, %n.vec74
  br i1 %memcheck.conflict, label %middle.block69, label %vector.body68

vector.body68:                                    ; preds = %vector.memcheck, %vector.body68
  %index71 = phi i64 [ %index.next88, %vector.body68 ], [ 0, %vector.memcheck ]
  %reverse.idx = sub i64 %22, %index71
  %.sum = add i64 %reverse.idx, -4, !dbg !782
  %85 = getelementptr i32* %70, i64 %.sum, !dbg !782
  %86 = bitcast i32* %85 to <4 x i32>*, !dbg !782
  %wide.load = load <4 x i32>* %86, align 4, !dbg !782
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !782
  %.sum99 = add i64 %reverse.idx, -8, !dbg !782
  %87 = getelementptr i32* %70, i64 %.sum99, !dbg !782
  %88 = bitcast i32* %87 to <4 x i32>*, !dbg !782
  %wide.load93 = load <4 x i32>* %88, align 4, !dbg !782
  %reverse94 = shufflevector <4 x i32> %wide.load93, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !782
  %reverse95 = shufflevector <4 x i32> %reverse, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !782
  %.sum100 = add i64 %reverse.idx, -4, !dbg !782
  %89 = getelementptr i32* %74, i64 %.sum100, !dbg !782
  %90 = bitcast i32* %89 to <4 x i32>*, !dbg !782
  store <4 x i32> %reverse95, <4 x i32>* %90, align 4, !dbg !782
  %reverse96 = shufflevector <4 x i32> %reverse94, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !782
  %.sum102 = add i64 %reverse.idx, -8, !dbg !782
  %91 = getelementptr i32* %74, i64 %.sum102, !dbg !782
  %92 = bitcast i32* %91 to <4 x i32>*, !dbg !782
  store <4 x i32> %reverse96, <4 x i32>* %92, align 4, !dbg !782
  %index.next88 = add i64 %index71, 8
  %93 = icmp eq i64 %index.next88, %n.vec74
  br i1 %93, label %middle.block69, label %vector.body68, !llvm.loop !783

middle.block69:                                   ; preds = %vector.body68, %vector.memcheck, %.lr.ph.i.i.preheader
  %resume.val86 = phi i64 [ %22, %.lr.ph.i.i.preheader ], [ %22, %vector.memcheck ], [ %rev.ind.end, %vector.body68 ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.i.i.preheader ], [ 0, %vector.memcheck ], [ %n.vec74, %vector.body68 ]
  %cmp.n87 = icmp eq i64 %end.idx72, %new.indc.resume.val
  br i1 %cmp.n87, label %get_good_move.exit.thread9.preheader, label %.lr.ph.i.i

.lr.ph.i.i:                                       ; preds = %middle.block69, %.lr.ph.i.i
  %indvars.iv.i.i5 = phi i64 [ %indvars.iv.next.i.i6, %.lr.ph.i.i ], [ %resume.val86, %middle.block69 ]
  %indvars.iv.next.i.i6 = add nsw i64 %indvars.iv.i.i5, -1, !dbg !781
  %94 = getelementptr inbounds i32* %70, i64 %indvars.iv.next.i.i6, !dbg !782
  %95 = load i32* %94, align 4, !dbg !782, !tbaa !177
  %96 = getelementptr inbounds i32* %74, i64 %indvars.iv.next.i.i6, !dbg !782
  store i32 %95, i32* %96, align 4, !dbg !782, !tbaa !177
  %97 = trunc i64 %indvars.iv.next.i.i6 to i32, !dbg !781
  %98 = icmp eq i32 %97, 0, !dbg !781
  br i1 %98, label %get_good_move.exit.thread9.preheader, label %.lr.ph.i.i, !dbg !781, !llvm.loop !784

get_good_move.exit:                               ; preds = %.critedge.i
  tail call void @llvm.dbg.value(metadata !{i32* %101}, i64 0, metadata !157), !dbg !743
  %99 = icmp eq i8* %72, null, !dbg !785
  br i1 %99, label %make_data.exit.outer._crit_edge, label %get_good_move.exit.thread9.preheader.loopexit13, !dbg !785

get_good_move.exit.thread9.preheader.loopexit13:  ; preds = %get_good_move.exit
  %100 = bitcast i8* %72 to i32*, !dbg !777
  br label %get_good_move.exit.thread9.preheader

get_good_move.exit.thread9.preheader:             ; preds = %.lr.ph.i.i, %middle.block69, %get_good_move.exit.thread9.preheader.loopexit13
  %101 = phi i32* [ %100, %get_good_move.exit.thread9.preheader.loopexit13 ], [ %74, %middle.block69 ], [ %74, %.lr.ph.i.i ]
  br label %get_good_move.exit.thread9, !dbg !786

get_good_move.exit.thread9:                       ; preds = %get_good_move.exit.thread9.preheader, %get_good_move.exit.thread9
  %indvars.iv.i7 = phi i64 [ %indvars.iv.next.i8, %get_good_move.exit.thread9 ], [ 0, %get_good_move.exit.thread9.preheader ]
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !152), !dbg !786
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !787), !dbg !723
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !152), !dbg !724
  %102 = getelementptr inbounds i32* %101, i64 %indvars.iv.i7, !dbg !788
  %103 = load i32* %102, align 4, !dbg !788, !tbaa !177
  %104 = getelementptr inbounds i32* %current.0.ph33, i64 %indvars.iv.i7, !dbg !788
  %105 = load i32* %104, align 4, !dbg !788, !tbaa !177
  %106 = icmp eq i32 %103, %105, !dbg !788
  %indvars.iv.next.i8 = add nuw nsw i64 %indvars.iv.i7, 1, !dbg !788
  br i1 %106, label %get_good_move.exit.thread9, label %get_real_move.exit, !dbg !788

get_real_move.exit:                               ; preds = %get_good_move.exit.thread9
  %107 = trunc i64 %indvars.iv.i7 to i32, !dbg !786
  tail call void @llvm.dbg.value(metadata !{i32 %103}, i64 0, metadata !151), !dbg !789
  tail call void @llvm.dbg.value(metadata !{i32 %103}, i64 0, metadata !717), !dbg !723
  tail call void @llvm.dbg.value(metadata !{i32 %103}, i64 0, metadata !151), !dbg !724
  %108 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i64 0, i64 0), i32 %player.0.ph34, i32 %103, i32 %107) #4, !dbg !724
  %109 = sub nsw i32 1, %player.0.ph34, !dbg !790
  tail call void @llvm.dbg.value(metadata !{i32 %109}, i64 0, metadata !154), !dbg !790
  %110 = bitcast i32* %current.0.ph33 to i8*, !dbg !791
  tail call void @free(i8* %110) #4, !dbg !791
  %111 = icmp eq i32* %101, null, !dbg !741
  br i1 %111, label %make_data.exit.outer._crit_edge, label %get_real_move.exit..lr.ph_crit_edge, !dbg !741

get_real_move.exit..lr.ph_crit_edge:              ; preds = %get_real_move.exit
  %.pre.pre = load i32* @ncol, align 4, !dbg !751, !tbaa !177
  br label %.lr.ph, !dbg !741

make_data.exit.outer._crit_edge:                  ; preds = %get_good_move.exit, %where.exit, %get_real_move.exit, %make_data.exit.preheader
  %player.0.ph.lcssa = phi i32 [ 0, %make_data.exit.preheader ], [ %player.0.ph34, %get_good_move.exit ], [ %player.0.ph34, %where.exit ], [ %109, %get_real_move.exit ]
  tail call void @dump_play(%struct._play* %4), !dbg !792
  %112 = sub nsw i32 1, %player.0.ph.lcssa, !dbg !793
  %113 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str16, i64 0, i64 0), i32 %112) #4, !dbg !793
  ret i32 0, !dbg !794
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!172, !173}
!llvm.ident = !{!174}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !167, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c] [DW_LANG_C99]
!1 = metadata !{metadata !"chomp.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !14, metadata !21, metadata !28, metadata !35, metadata !40, metadata !50, metadata !62, metadata !66, metadata !72, metadata !75, metadata !78, metadata !81, metadata !85, metadata !93, metadata !105, metadata !114, metadata !122, metadata !127, metadata !133, metadata !139, metadata !147, metadata !160}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"copy_data", metadata !"copy_data", metadata !"", i32 24, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32* (i32*)* @copy_data, null, null, metadata !10, i32 26} ; [ DW_TAG_subprogram ] [line 24] [def] [scope 26] [copy_data]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12, metadata !13}
!11 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 25]
!12 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new] [line 27]
!13 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"next_data", metadata !"next_data", metadata !"", i32 34, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @next_data, null, null, metadata !17, i32 36} ; [ DW_TAG_subprogram ] [line 34] [def] [scope 36] [next_data]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !8}
!17 = metadata !{metadata !18, metadata !19, metadata !20}
!18 = metadata !{i32 786689, metadata !14, metadata !"data", metadata !5, i32 16777250, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 34]
!19 = metadata !{i32 786688, metadata !14, metadata !"counter", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 37]
!20 = metadata !{i32 786688, metadata !14, metadata !"valid", metadata !5, i32 38, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [valid] [line 38]
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"melt_data", metadata !"melt_data", metadata !"", i32 55, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32*)* @melt_data, null, null, metadata !24, i32 56} ; [ DW_TAG_subprogram ] [line 55] [def] [scope 56] [melt_data]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{null, metadata !8, metadata !8}
!24 = metadata !{metadata !25, metadata !26, metadata !27}
!25 = metadata !{i32 786689, metadata !21, metadata !"data1", metadata !5, i32 16777271, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data1] [line 55]
!26 = metadata !{i32 786689, metadata !21, metadata !"data2", metadata !5, i32 33554487, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data2] [line 55]
!27 = metadata !{i32 786688, metadata !21, metadata !"counter", metadata !5, i32 57, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 57]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"equal_data", metadata !"equal_data", metadata !"", i32 65, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32*)* @equal_data, null, null, metadata !31, i32 66} ; [ DW_TAG_subprogram ] [line 65] [def] [scope 66] [equal_data]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !9, metadata !8, metadata !8}
!31 = metadata !{metadata !32, metadata !33, metadata !34}
!32 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!33 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!34 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!35 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"valid_data", metadata !"valid_data", metadata !"", i32 72, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @valid_data, null, null, metadata !36, i32 73} ; [ DW_TAG_subprogram ] [line 72] [def] [scope 73] [valid_data]
!36 = metadata !{metadata !37, metadata !38, metadata !39}
!37 = metadata !{i32 786689, metadata !35, metadata !"data", metadata !5, i32 16777288, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 72]
!38 = metadata !{i32 786688, metadata !35, metadata !"low", metadata !5, i32 74, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [low] [line 74]
!39 = metadata !{i32 786688, metadata !35, metadata !"counter", metadata !5, i32 75, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 75]
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dump_list", metadata !"dump_list", metadata !"", i32 86, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._list*)* @dump_list, null, null, metadata !48, i32 87} ; [ DW_TAG_subprogram ] [line 86] [def] [scope 87] [dump_list]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{null, metadata !43}
!43 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _list]
!44 = metadata !{i32 786451, metadata !1, null, metadata !"_list", i32 8, i64 128, i64 64, i32 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_list] [line 8, size 128, align 64, offset 0] [def] [from ]
!45 = metadata !{metadata !46, metadata !47}
!46 = metadata !{i32 786445, metadata !1, metadata !44, metadata !"data", i32 10, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [data] [line 10, size 64, align 64, offset 0] [from ]
!47 = metadata !{i32 786445, metadata !1, metadata !44, metadata !"next", i32 11, i64 64, i64 64, i64 64, i32 0, metadata !43} ; [ DW_TAG_member ] [next] [line 11, size 64, align 64, offset 64] [from ]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786689, metadata !40, metadata !"list", metadata !5, i32 16777302, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 86]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dump_play", metadata !"dump_play", metadata !"", i32 96, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (%struct._play*)* @dump_play, null, null, metadata !60, i32 98} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 98] [dump_play]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !53}
!53 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _play]
!54 = metadata !{i32 786451, metadata !1, null, metadata !"_play", i32 14, i64 256, i64 64, i32 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_play] [line 14, size 256, align 64, offset 0] [def] [from ]
!55 = metadata !{metadata !56, metadata !57, metadata !58, metadata !59}
!56 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"value", i32 16, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [value] [line 16, size 32, align 32, offset 0] [from int]
!57 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"state", i32 17, i64 64, i64 64, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [state] [line 17, size 64, align 64, offset 64] [from ]
!58 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"first", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !43} ; [ DW_TAG_member ] [first] [line 18, size 64, align 64, offset 128] [from ]
!59 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"next", i32 19, i64 64, i64 64, i64 192, i32 0, metadata !53} ; [ DW_TAG_member ] [next] [line 19, size 64, align 64, offset 192] [from ]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786689, metadata !50, metadata !"play", metadata !5, i32 16777313, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 97]
!62 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_value", metadata !"get_value", metadata !"", i32 108, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @get_value, null, null, metadata !63, i32 109} ; [ DW_TAG_subprogram ] [line 108] [def] [scope 109] [get_value]
!63 = metadata !{metadata !64, metadata !65}
!64 = metadata !{i32 786689, metadata !62, metadata !"data", metadata !5, i32 16777324, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 108]
!65 = metadata !{i32 786688, metadata !62, metadata !"search", metadata !5, i32 110, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [search] [line 110]
!66 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_data", metadata !"show_data", metadata !"", i32 117, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*)* @show_data, null, null, metadata !69, i32 118} ; [ DW_TAG_subprogram ] [line 117] [def] [scope 118] [show_data]
!67 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{null, metadata !8}
!69 = metadata !{metadata !70, metadata !71}
!70 = metadata !{i32 786689, metadata !66, metadata !"data", metadata !5, i32 16777333, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 117]
!71 = metadata !{i32 786688, metadata !66, metadata !"counter", metadata !5, i32 119, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 119]
!72 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_move", metadata !"show_move", metadata !"", i32 127, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*)* @show_move, null, null, metadata !73, i32 128} ; [ DW_TAG_subprogram ] [line 127] [def] [scope 128] [show_move]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786689, metadata !72, metadata !"data", metadata !5, i32 16777343, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 127]
!75 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_list", metadata !"show_list", metadata !"", i32 134, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._list*)* @show_list, null, null, metadata !76, i32 135} ; [ DW_TAG_subprogram ] [line 134] [def] [scope 135] [show_list]
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786689, metadata !75, metadata !"list", metadata !5, i32 16777350, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 134]
!78 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_play", metadata !"show_play", metadata !"", i32 143, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._play*)* @show_play, null, null, metadata !79, i32 144} ; [ DW_TAG_subprogram ] [line 143] [def] [scope 144] [show_play]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786689, metadata !78, metadata !"play", metadata !5, i32 16777359, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 143]
!81 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"in_wanted", metadata !"in_wanted", metadata !"", i32 156, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @in_wanted, null, null, metadata !82, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [in_wanted]
!82 = metadata !{metadata !83, metadata !84}
!83 = metadata !{i32 786689, metadata !81, metadata !"data", metadata !5, i32 16777372, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 156]
!84 = metadata !{i32 786688, metadata !81, metadata !"current", metadata !5, i32 158, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 158]
!85 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_data", metadata !"make_data", metadata !"", i32 169, metadata !86, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32* (i32, i32)* @make_data, null, null, metadata !88, i32 171} ; [ DW_TAG_subprogram ] [line 169] [def] [scope 171] [make_data]
!86 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{metadata !8, metadata !9, metadata !9}
!88 = metadata !{metadata !89, metadata !90, metadata !91, metadata !92}
!89 = metadata !{i32 786689, metadata !85, metadata !"row", metadata !5, i32 16777385, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 169]
!90 = metadata !{i32 786689, metadata !85, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [col] [line 169]
!91 = metadata !{i32 786688, metadata !85, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 172]
!92 = metadata !{i32 786688, metadata !85, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new] [line 173]
!93 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_list", metadata !"make_list", metadata !"", i32 181, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct._list* (i32*, i32*, i32*)* @make_list, null, null, metadata !96, i32 183} ; [ DW_TAG_subprogram ] [line 181] [def] [scope 183] [make_list]
!94 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !43, metadata !8, metadata !8, metadata !8}
!96 = metadata !{metadata !97, metadata !98, metadata !99, metadata !100, metadata !101, metadata !102, metadata !103, metadata !104}
!97 = metadata !{i32 786689, metadata !93, metadata !"data", metadata !5, i32 16777397, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 181]
!98 = metadata !{i32 786689, metadata !93, metadata !"value", metadata !5, i32 33554613, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 181]
!99 = metadata !{i32 786689, metadata !93, metadata !"all", metadata !5, i32 50331829, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [all] [line 181]
!100 = metadata !{i32 786688, metadata !93, metadata !"row", metadata !5, i32 184, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 184]
!101 = metadata !{i32 786688, metadata !93, metadata !"col", metadata !5, i32 184, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 184]
!102 = metadata !{i32 786688, metadata !93, metadata !"temp", metadata !5, i32 185, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 185]
!103 = metadata !{i32 786688, metadata !93, metadata !"head", metadata !5, i32 186, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 186]
!104 = metadata !{i32 786688, metadata !93, metadata !"current", metadata !5, i32 186, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 186]
!105 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_play", metadata !"make_play", metadata !"", i32 227, metadata !106, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct._play* (i32)* @make_play, null, null, metadata !108, i32 228} ; [ DW_TAG_subprogram ] [line 227] [def] [scope 228] [make_play]
!106 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !107, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!107 = metadata !{metadata !53, metadata !9}
!108 = metadata !{metadata !109, metadata !110, metadata !111, metadata !112, metadata !113}
!109 = metadata !{i32 786689, metadata !105, metadata !"all", metadata !5, i32 16777443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [all] [line 227]
!110 = metadata !{i32 786688, metadata !105, metadata !"val", metadata !5, i32 229, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 229]
!111 = metadata !{i32 786688, metadata !105, metadata !"temp", metadata !5, i32 230, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 230]
!112 = metadata !{i32 786688, metadata !105, metadata !"head", metadata !5, i32 231, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 231]
!113 = metadata !{i32 786688, metadata !105, metadata !"current", metadata !5, i32 231, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 231]
!114 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_wanted", metadata !"make_wanted", metadata !"", i32 262, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*)* @make_wanted, null, null, metadata !115, i32 263} ; [ DW_TAG_subprogram ] [line 262] [def] [scope 263] [make_wanted]
!115 = metadata !{metadata !116, metadata !117, metadata !118, metadata !119, metadata !120, metadata !121}
!116 = metadata !{i32 786689, metadata !114, metadata !"data", metadata !5, i32 16777478, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 262]
!117 = metadata !{i32 786688, metadata !114, metadata !"row", metadata !5, i32 269, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 269]
!118 = metadata !{i32 786688, metadata !114, metadata !"col", metadata !5, i32 269, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 269]
!119 = metadata !{i32 786688, metadata !114, metadata !"temp", metadata !5, i32 270, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 270]
!120 = metadata !{i32 786688, metadata !114, metadata !"head", metadata !5, i32 271, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 271]
!121 = metadata !{i32 786688, metadata !114, metadata !"current", metadata !5, i32 271, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 271]
!122 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_good_move", metadata !"get_good_move", metadata !"", i32 301, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32* (%struct._list*)* @get_good_move, null, null, metadata !125, i32 302} ; [ DW_TAG_subprogram ] [line 301] [def] [scope 302] [get_good_move]
!123 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!124 = metadata !{metadata !8, metadata !43}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 786689, metadata !122, metadata !"list", metadata !5, i32 16777517, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 301]
!127 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_winning_move", metadata !"get_winning_move", metadata !"", i32 311, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32* (%struct._play*)* @get_winning_move, null, null, metadata !130, i32 313} ; [ DW_TAG_subprogram ] [line 311] [def] [scope 313] [get_winning_move]
!128 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !129, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!129 = metadata !{metadata !8, metadata !53}
!130 = metadata !{metadata !131, metadata !132}
!131 = metadata !{i32 786689, metadata !127, metadata !"play", metadata !5, i32 16777527, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 311]
!132 = metadata !{i32 786688, metadata !127, metadata !"temp", metadata !5, i32 314, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 314]
!133 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"where", metadata !"where", metadata !"", i32 320, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct._list* (i32*, %struct._play*)* @where, null, null, metadata !136, i32 321} ; [ DW_TAG_subprogram ] [line 320] [def] [scope 321] [where]
!134 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{metadata !43, metadata !8, metadata !53}
!136 = metadata !{metadata !137, metadata !138}
!137 = metadata !{i32 786689, metadata !133, metadata !"data", metadata !5, i32 16777536, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 320]
!138 = metadata !{i32 786689, metadata !133, metadata !"play", metadata !5, i32 33554752, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 320]
!139 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_real_move", metadata !"get_real_move", metadata !"", i32 327, metadata !140, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32*, i32*, i32*)* @get_real_move, null, null, metadata !142, i32 329} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 329] [get_real_move]
!140 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !141, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!141 = metadata !{null, metadata !8, metadata !8, metadata !8, metadata !8}
!142 = metadata !{metadata !143, metadata !144, metadata !145, metadata !146}
!143 = metadata !{i32 786689, metadata !139, metadata !"data1", metadata !5, i32 16777543, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data1] [line 327]
!144 = metadata !{i32 786689, metadata !139, metadata !"data2", metadata !5, i32 33554759, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data2] [line 327]
!145 = metadata !{i32 786689, metadata !139, metadata !"row", metadata !5, i32 50331975, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 327]
!146 = metadata !{i32 786689, metadata !139, metadata !"col", metadata !5, i32 67109191, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [col] [line 327]
!147 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 336, metadata !148, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @main, null, null, metadata !150, i32 337} ; [ DW_TAG_subprogram ] [line 336] [def] [scope 337] [main]
!148 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !149, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!149 = metadata !{metadata !9}
!150 = metadata !{metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !158, metadata !159}
!151 = metadata !{i32 786688, metadata !147, metadata !"row", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 338]
!152 = metadata !{i32 786688, metadata !147, metadata !"col", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 338]
!153 = metadata !{i32 786688, metadata !147, metadata !"maxrow", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [maxrow] [line 338]
!154 = metadata !{i32 786688, metadata !147, metadata !"player", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [player] [line 338]
!155 = metadata !{i32 786688, metadata !147, metadata !"win", metadata !5, i32 339, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [win] [line 339]
!156 = metadata !{i32 786688, metadata !147, metadata !"current", metadata !5, i32 339, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 339]
!157 = metadata !{i32 786688, metadata !147, metadata !"temp", metadata !5, i32 339, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 339]
!158 = metadata !{i32 786688, metadata !147, metadata !"tree", metadata !5, i32 340, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tree] [line 340]
!159 = metadata !{i32 786688, metadata !147, metadata !"look", metadata !5, i32 340, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [look] [line 340]
!160 = metadata !{i32 786478, metadata !161, metadata !162, metadata !"putchar", metadata !"putchar", metadata !"", i32 79, metadata !163, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !165, i32 80} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [putchar]
!161 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stdio.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!162 = metadata !{i32 786473, metadata !161}      ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!163 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !164, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!164 = metadata !{metadata !9, metadata !9}
!165 = metadata !{metadata !166}
!166 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!167 = metadata !{metadata !168, metadata !169, metadata !170, metadata !171}
!168 = metadata !{i32 786484, i32 0, null, metadata !"wanted", metadata !"wanted", metadata !"", metadata !5, i32 12, metadata !43, i32 0, i32 1, %struct._list** @wanted, null} ; [ DW_TAG_variable ] [wanted] [line 12] [def]
!169 = metadata !{i32 786484, i32 0, null, metadata !"game_tree", metadata !"game_tree", metadata !"", metadata !5, i32 20, metadata !53, i32 0, i32 1, %struct._play** @game_tree, null} ; [ DW_TAG_variable ] [game_tree] [line 20] [def]
!170 = metadata !{i32 786484, i32 0, null, metadata !"nrow", metadata !"nrow", metadata !"", metadata !5, i32 22, metadata !9, i32 0, i32 1, i32* @nrow, null} ; [ DW_TAG_variable ] [nrow] [line 22] [def]
!171 = metadata !{i32 786484, i32 0, null, metadata !"ncol", metadata !"ncol", metadata !"", metadata !5, i32 22, metadata !9, i32 0, i32 1, i32* @ncol, null} ; [ DW_TAG_variable ] [ncol] [line 22] [def]
!172 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!173 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!174 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!175 = metadata !{i32 25, i32 0, metadata !4, null}
!176 = metadata !{i32 27, i32 0, metadata !4, null}
!177 = metadata !{metadata !178, metadata !178, i64 0}
!178 = metadata !{metadata !"int", metadata !179, i64 0}
!179 = metadata !{metadata !"omnipotent char", metadata !180, i64 0}
!180 = metadata !{metadata !"Simple C/C++ TBAA"}
!181 = metadata !{i32 28, i32 0, metadata !4, null}
!182 = metadata !{i32 29, i32 0, metadata !4, null}
!183 = metadata !{i32 30, i32 0, metadata !4, null}
!184 = metadata !{metadata !184, metadata !185, metadata !186}
!185 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!186 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!187 = metadata !{metadata !187, metadata !185, metadata !186}
!188 = metadata !{i32 31, i32 0, metadata !4, null}
!189 = metadata !{i32 34, i32 0, metadata !14, null}
!190 = metadata !{i32 0}
!191 = metadata !{i32 37, i32 0, metadata !14, null}
!192 = metadata !{i32 38, i32 0, metadata !14, null}
!193 = metadata !{i32 39, i32 0, metadata !14, null}
!194 = metadata !{i32 41, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !196, i32 41, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!196 = metadata !{i32 786443, metadata !1, metadata !14, i32 40, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!197 = metadata !{i32 43, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !195, i32 42, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!199 = metadata !{i32 48, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !195, i32 47, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!201 = metadata !{i32 1}
!202 = metadata !{i32 49, i32 0, metadata !200, null}
!203 = metadata !{i32 52, i32 0, metadata !14, null}
!204 = metadata !{i32 55, i32 0, metadata !21, null}
!205 = metadata !{i32 57, i32 0, metadata !21, null}
!206 = metadata !{i32 58, i32 0, metadata !21, null} ; [ DW_TAG_imported_module ]
!207 = metadata !{i32 60, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !209, i32 60, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!209 = metadata !{i32 786443, metadata !1, metadata !21, i32 59, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!210 = metadata !{i32 61, i32 0, metadata !208, null}
!211 = metadata !{i32 63, i32 0, metadata !21, null}
!212 = metadata !{i32 65, i32 0, metadata !28, null}
!213 = metadata !{i32 67, i32 0, metadata !28, null}
!214 = metadata !{i32 68, i32 0, metadata !28, null}
!215 = metadata !{i32 69, i32 0, metadata !28, null}
!216 = metadata !{i32 72, i32 0, metadata !35, null}
!217 = metadata !{i32 75, i32 0, metadata !35, null}
!218 = metadata !{i32 76, i32 0, metadata !35, null}
!219 = metadata !{i32 77, i32 0, metadata !35, null}
!220 = metadata !{i32 79, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !222, i32 79, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!222 = metadata !{i32 786443, metadata !1, metadata !35, i32 78, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!223 = metadata !{i32 80, i32 0, metadata !222, null}
!224 = metadata !{i32 81, i32 0, metadata !222, null}
!225 = metadata !{i32 83, i32 0, metadata !35, null}
!226 = metadata !{i32 86, i32 0, metadata !40, null}
!227 = metadata !{i32 88, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !40, i32 88, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!229 = metadata !{i32 90, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !228, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!231 = metadata !{metadata !232, metadata !233, i64 8}
!232 = metadata !{metadata !"_list", metadata !233, i64 0, metadata !233, i64 8}
!233 = metadata !{metadata !"any pointer", metadata !179, i64 0}
!234 = metadata !{i32 91, i32 0, metadata !230, null}
!235 = metadata !{metadata !232, metadata !233, i64 0}
!236 = metadata !{i32 92, i32 0, metadata !230, null}
!237 = metadata !{i32 94, i32 0, metadata !40, null}
!238 = metadata !{i32 97, i32 0, metadata !50, null}
!239 = metadata !{i32 99, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !50, i32 99, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!241 = metadata !{i32 101, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !1, metadata !240, i32 100, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!243 = metadata !{metadata !244, metadata !233, i64 24}
!244 = metadata !{metadata !"_play", metadata !178, i64 0, metadata !233, i64 8, metadata !233, i64 16, metadata !233, i64 24}
!245 = metadata !{i32 102, i32 0, metadata !242, null}
!246 = metadata !{metadata !244, metadata !233, i64 16}
!247 = metadata !{i32 103, i32 0, metadata !242, null}
!248 = metadata !{metadata !244, metadata !233, i64 8}
!249 = metadata !{i32 104, i32 0, metadata !242, null}
!250 = metadata !{i32 106, i32 0, metadata !50, null}
!251 = metadata !{i32 108, i32 0, metadata !62, null}
!252 = metadata !{i32 67, i32 0, metadata !28, metadata !253}
!253 = metadata !{i32 112, i32 0, metadata !62, null}
!254 = metadata !{i32 111, i32 0, metadata !62, null}
!255 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !253} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!256 = metadata !{i32 65, i32 0, metadata !28, metadata !253}
!257 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !253} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!258 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !253} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!259 = metadata !{i32 68, i32 0, metadata !28, metadata !253}
!260 = metadata !{i32 69, i32 0, metadata !28, metadata !253}
!261 = metadata !{i32 113, i32 0, metadata !62, null}
!262 = metadata !{i32 114, i32 0, metadata !62, null}
!263 = metadata !{metadata !244, metadata !178, i64 0}
!264 = metadata !{i32 117, i32 0, metadata !66, null}
!265 = metadata !{i32 119, i32 0, metadata !66, null}
!266 = metadata !{i32 120, i32 0, metadata !66, null}
!267 = metadata !{i32 122, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !66, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!269 = metadata !{i32 123, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !268, i32 123, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!271 = metadata !{i32 44}
!272 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!273 = metadata !{i32 79, i32 0, metadata !160, metadata !269}
!274 = metadata !{i32 81, i32 0, metadata !275, metadata !269}
!275 = metadata !{i32 786443, metadata !161, metadata !160} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!276 = metadata !{metadata !233, metadata !233, i64 0}
!277 = metadata !{i32 125, i32 0, metadata !66, null}
!278 = metadata !{i32 127, i32 0, metadata !72, null}
!279 = metadata !{i32 40}
!280 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !281} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!281 = metadata !{i32 129, i32 0, metadata !72, null}
!282 = metadata !{i32 79, i32 0, metadata !160, metadata !281}
!283 = metadata !{i32 81, i32 0, metadata !275, metadata !281}
!284 = metadata !{i32 786689, metadata !66, metadata !"data", metadata !5, i32 16777333, metadata !8, i32 0, metadata !285} ; [ DW_TAG_arg_variable ] [data] [line 117]
!285 = metadata !{i32 130, i32 0, metadata !72, null}
!286 = metadata !{i32 117, i32 0, metadata !66, metadata !285}
!287 = metadata !{i32 786688, metadata !66, metadata !"counter", metadata !5, i32 119, metadata !9, i32 0, metadata !285} ; [ DW_TAG_auto_variable ] [counter] [line 119]
!288 = metadata !{i32 119, i32 0, metadata !66, metadata !285}
!289 = metadata !{i32 120, i32 0, metadata !66, metadata !285}
!290 = metadata !{i32 122, i32 0, metadata !268, metadata !285}
!291 = metadata !{i32 123, i32 0, metadata !270, metadata !285}
!292 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!293 = metadata !{i32 79, i32 0, metadata !160, metadata !291}
!294 = metadata !{i32 81, i32 0, metadata !275, metadata !291}
!295 = metadata !{i32 131, i32 0, metadata !72, null}
!296 = metadata !{i32 132, i32 0, metadata !72, null}
!297 = metadata !{i32 134, i32 0, metadata !75, null}
!298 = metadata !{i32 136, i32 0, metadata !75, null}
!299 = metadata !{i32 138, i32 0, metadata !300, null}
!300 = metadata !{i32 786443, metadata !1, metadata !75, i32 137, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!301 = metadata !{i32 786689, metadata !72, metadata !"data", metadata !5, i32 16777343, metadata !8, i32 0, metadata !299} ; [ DW_TAG_arg_variable ] [data] [line 127]
!302 = metadata !{i32 127, i32 0, metadata !72, metadata !299}
!303 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !304} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!304 = metadata !{i32 129, i32 0, metadata !72, metadata !299}
!305 = metadata !{i32 79, i32 0, metadata !160, metadata !304}
!306 = metadata !{i32 81, i32 0, metadata !275, metadata !304}
!307 = metadata !{i32 786689, metadata !66, metadata !"data", metadata !5, i32 16777333, metadata !8, i32 0, metadata !308} ; [ DW_TAG_arg_variable ] [data] [line 117]
!308 = metadata !{i32 130, i32 0, metadata !72, metadata !299}
!309 = metadata !{i32 117, i32 0, metadata !66, metadata !308}
!310 = metadata !{i32 786688, metadata !66, metadata !"counter", metadata !5, i32 119, metadata !9, i32 0, metadata !308} ; [ DW_TAG_auto_variable ] [counter] [line 119]
!311 = metadata !{i32 119, i32 0, metadata !66, metadata !308}
!312 = metadata !{i32 120, i32 0, metadata !66, metadata !308}
!313 = metadata !{i32 122, i32 0, metadata !268, metadata !308}
!314 = metadata !{i32 123, i32 0, metadata !270, metadata !308}
!315 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!316 = metadata !{i32 79, i32 0, metadata !160, metadata !314}
!317 = metadata !{i32 81, i32 0, metadata !275, metadata !314}
!318 = metadata !{i32 131, i32 0, metadata !72, metadata !299}
!319 = metadata !{i32 139, i32 0, metadata !300, null}
!320 = metadata !{i32 141, i32 0, metadata !75, null}
!321 = metadata !{i32 143, i32 0, metadata !78, null}
!322 = metadata !{i32 145, i32 0, metadata !78, null}
!323 = metadata !{i32 147, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !78, i32 146, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!325 = metadata !{i32 148, i32 0, metadata !324, null}
!326 = metadata !{i32 786689, metadata !66, metadata !"data", metadata !5, i32 16777333, metadata !8, i32 0, metadata !325} ; [ DW_TAG_arg_variable ] [data] [line 117]
!327 = metadata !{i32 117, i32 0, metadata !66, metadata !325}
!328 = metadata !{i32 786688, metadata !66, metadata !"counter", metadata !5, i32 119, metadata !9, i32 0, metadata !325} ; [ DW_TAG_auto_variable ] [counter] [line 119]
!329 = metadata !{i32 119, i32 0, metadata !66, metadata !325}
!330 = metadata !{i32 120, i32 0, metadata !66, metadata !325}
!331 = metadata !{i32 122, i32 0, metadata !268, metadata !325}
!332 = metadata !{i32 123, i32 0, metadata !270, metadata !325}
!333 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!334 = metadata !{i32 79, i32 0, metadata !160, metadata !332}
!335 = metadata !{i32 81, i32 0, metadata !275, metadata !332}
!336 = metadata !{i32 149, i32 0, metadata !324, null}
!337 = metadata !{i32 150, i32 0, metadata !324, null}
!338 = metadata !{i32 151, i32 0, metadata !324, null}
!339 = metadata !{i32 786689, metadata !75, metadata !"list", metadata !5, i32 16777350, metadata !43, i32 0, metadata !338} ; [ DW_TAG_arg_variable ] [list] [line 134]
!340 = metadata !{i32 134, i32 0, metadata !75, metadata !338}
!341 = metadata !{i32 136, i32 0, metadata !75, metadata !338}
!342 = metadata !{i32 138, i32 0, metadata !300, metadata !338}
!343 = metadata !{i32 786689, metadata !72, metadata !"data", metadata !5, i32 16777343, metadata !8, i32 0, metadata !342} ; [ DW_TAG_arg_variable ] [data] [line 127]
!344 = metadata !{i32 127, i32 0, metadata !72, metadata !342}
!345 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !346} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!346 = metadata !{i32 129, i32 0, metadata !72, metadata !342}
!347 = metadata !{i32 79, i32 0, metadata !160, metadata !346}
!348 = metadata !{i32 81, i32 0, metadata !275, metadata !346}
!349 = metadata !{i32 786689, metadata !66, metadata !"data", metadata !5, i32 16777333, metadata !8, i32 0, metadata !350} ; [ DW_TAG_arg_variable ] [data] [line 117]
!350 = metadata !{i32 130, i32 0, metadata !72, metadata !342}
!351 = metadata !{i32 117, i32 0, metadata !66, metadata !350}
!352 = metadata !{i32 786688, metadata !66, metadata !"counter", metadata !5, i32 119, metadata !9, i32 0, metadata !350} ; [ DW_TAG_auto_variable ] [counter] [line 119]
!353 = metadata !{i32 119, i32 0, metadata !66, metadata !350}
!354 = metadata !{i32 120, i32 0, metadata !66, metadata !350}
!355 = metadata !{i32 122, i32 0, metadata !268, metadata !350}
!356 = metadata !{i32 123, i32 0, metadata !270, metadata !350}
!357 = metadata !{i32 786689, metadata !160, metadata !"__c", metadata !162, i32 16777295, metadata !9, i32 0, metadata !356} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!358 = metadata !{i32 79, i32 0, metadata !160, metadata !356}
!359 = metadata !{i32 81, i32 0, metadata !275, metadata !356}
!360 = metadata !{i32 131, i32 0, metadata !72, metadata !342}
!361 = metadata !{i32 139, i32 0, metadata !300, metadata !338}
!362 = metadata !{i32 152, i32 0, metadata !324, null}
!363 = metadata !{i32 154, i32 0, metadata !78, null}
!364 = metadata !{i32 156, i32 0, metadata !81, null}
!365 = metadata !{i32 159, i32 0, metadata !81, null}
!366 = metadata !{i32 160, i32 0, metadata !81, null}
!367 = metadata !{i32 67, i32 0, metadata !28, metadata !368}
!368 = metadata !{i32 162, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !370, i32 162, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!370 = metadata !{i32 786443, metadata !1, metadata !81, i32 161, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!371 = metadata !{i32 163, i32 0, metadata !370, null}
!372 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!373 = metadata !{i32 65, i32 0, metadata !28, metadata !368}
!374 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!375 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !368} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!376 = metadata !{i32 68, i32 0, metadata !28, metadata !368}
!377 = metadata !{i32 69, i32 0, metadata !28, metadata !368}
!378 = metadata !{i32 165, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !81, i32 165, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!380 = metadata !{i32 167, i32 0, metadata !81, null}
!381 = metadata !{i32 169, i32 0, metadata !85, null}
!382 = metadata !{i32 173, i32 0, metadata !85, null}
!383 = metadata !{i32 174, i32 0, metadata !384, null}
!384 = metadata !{i32 786443, metadata !1, metadata !85, i32 174, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!385 = metadata !{i32 175, i32 0, metadata !384, null}
!386 = metadata !{metadata !386, metadata !185, metadata !186}
!387 = metadata !{i32 176, i32 0, metadata !388, null}
!388 = metadata !{i32 786443, metadata !1, metadata !85, i32 176, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!389 = metadata !{i32 177, i32 0, metadata !388, null}
!390 = metadata !{metadata !390, metadata !185, metadata !186}
!391 = metadata !{metadata !391, metadata !185, metadata !186}
!392 = metadata !{metadata !392, metadata !185, metadata !186}
!393 = metadata !{i32 178, i32 0, metadata !85, null}
!394 = metadata !{i32 181, i32 0, metadata !93, null}
!395 = metadata !{i32 187, i32 0, metadata !93, null}
!396 = metadata !{i32 188, i32 0, metadata !93, null}
!397 = metadata !{i32 189, i32 0, metadata !93, null}
!398 = metadata !{i32 190, i32 0, metadata !93, null}
!399 = metadata !{i32 191, i32 0, metadata !400, null}
!400 = metadata !{i32 786443, metadata !1, metadata !93, i32 191, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!401 = metadata !{i32 221, i32 0, metadata !93, null}
!402 = metadata !{i32 222, i32 0, metadata !93, null}
!403 = metadata !{i32 223, i32 0, metadata !404, null}
!404 = metadata !{i32 786443, metadata !1, metadata !93, i32 223, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!405 = metadata !{i32 193, i32 0, metadata !406, null}
!406 = metadata !{i32 786443, metadata !1, metadata !407, i32 193, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!407 = metadata !{i32 786443, metadata !1, metadata !400, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!408 = metadata !{i32 786689, metadata !85, metadata !"row", metadata !5, i32 16777385, metadata !9, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [row] [line 169]
!409 = metadata !{i32 195, i32 0, metadata !410, null}
!410 = metadata !{i32 786443, metadata !1, metadata !406, i32 194, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!411 = metadata !{i32 169, i32 0, metadata !85, metadata !409}
!412 = metadata !{i32 786689, metadata !85, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [col] [line 169]
!413 = metadata !{i32 173, i32 0, metadata !85, metadata !409}
!414 = metadata !{i32 786688, metadata !85, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, metadata !409} ; [ DW_TAG_auto_variable ] [new] [line 173]
!415 = metadata !{i32 786688, metadata !85, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, metadata !409} ; [ DW_TAG_auto_variable ] [count] [line 172]
!416 = metadata !{i32 174, i32 0, metadata !384, metadata !409}
!417 = metadata !{i32 175, i32 0, metadata !384, metadata !409}
!418 = metadata !{metadata !418, metadata !185, metadata !186}
!419 = metadata !{i32 176, i32 0, metadata !388, metadata !409}
!420 = metadata !{i32 177, i32 0, metadata !388, metadata !409}
!421 = metadata !{metadata !421, metadata !185, metadata !186}
!422 = metadata !{metadata !422, metadata !185, metadata !186}
!423 = metadata !{metadata !423, metadata !185, metadata !186}
!424 = metadata !{i32 786689, metadata !21, metadata !"data1", metadata !5, i32 16777271, metadata !8, i32 0, metadata !425} ; [ DW_TAG_arg_variable ] [data1] [line 55]
!425 = metadata !{i32 196, i32 0, metadata !410, null}
!426 = metadata !{i32 55, i32 0, metadata !21, metadata !425}
!427 = metadata !{i32 786689, metadata !21, metadata !"data2", metadata !5, i32 33554487, metadata !8, i32 0, metadata !425} ; [ DW_TAG_arg_variable ] [data2] [line 55]
!428 = metadata !{i32 786688, metadata !21, metadata !"counter", metadata !5, i32 57, metadata !9, i32 0, metadata !425} ; [ DW_TAG_auto_variable ] [counter] [line 57]
!429 = metadata !{i32 57, i32 0, metadata !21, metadata !425}
!430 = metadata !{i32 58, i32 0, metadata !21, metadata !425} ; [ DW_TAG_imported_module ]
!431 = metadata !{i32 60, i32 0, metadata !208, metadata !425}
!432 = metadata !{i32 61, i32 0, metadata !208, metadata !425}
!433 = metadata !{metadata !433, metadata !185, metadata !186}
!434 = metadata !{metadata !434, metadata !185, metadata !186}
!435 = metadata !{i32 68, i32 0, metadata !28, metadata !436}
!436 = metadata !{i32 197, i32 0, metadata !437, null}
!437 = metadata !{i32 786443, metadata !1, metadata !410, i32 197, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!438 = metadata !{i32 69, i32 0, metadata !28, metadata !436}
!439 = metadata !{i32 199, i32 0, metadata !440, null}
!440 = metadata !{i32 786443, metadata !1, metadata !437, i32 198, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!441 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, metadata !442} ; [ DW_TAG_arg_variable ] [data] [line 25]
!442 = metadata !{i32 200, i32 0, metadata !440, null}
!443 = metadata !{i32 25, i32 0, metadata !4, metadata !442}
!444 = metadata !{i32 27, i32 0, metadata !4, metadata !442}
!445 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, metadata !442} ; [ DW_TAG_auto_variable ] [new] [line 27]
!446 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, metadata !442} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!447 = metadata !{i32 28, i32 0, metadata !4, metadata !442}
!448 = metadata !{i32 29, i32 0, metadata !4, metadata !442}
!449 = metadata !{i32 30, i32 0, metadata !4, metadata !442}
!450 = metadata !{metadata !450, metadata !185, metadata !186}
!451 = metadata !{metadata !451, metadata !185, metadata !186}
!452 = metadata !{i32 201, i32 0, metadata !440, null}
!453 = metadata !{i32 202, i32 0, metadata !440, null}
!454 = metadata !{i32 203, i32 0, metadata !455, null}
!455 = metadata !{i32 786443, metadata !1, metadata !440, i32 203, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!456 = metadata !{i32 111, i32 0, metadata !62, metadata !457}
!457 = metadata !{i32 204, i32 0, metadata !455, null}
!458 = metadata !{i32 112, i32 0, metadata !62, metadata !457}
!459 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !458} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!460 = metadata !{i32 65, i32 0, metadata !28, metadata !458}
!461 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !458} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!462 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !458} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!463 = metadata !{i32 67, i32 0, metadata !28, metadata !458}
!464 = metadata !{i32 68, i32 0, metadata !28, metadata !458}
!465 = metadata !{i32 69, i32 0, metadata !28, metadata !458}
!466 = metadata !{i32 113, i32 0, metadata !62, metadata !457}
!467 = metadata !{i32 114, i32 0, metadata !62, metadata !457}
!468 = metadata !{i32 205, i32 0, metadata !469, null}
!469 = metadata !{i32 786443, metadata !1, metadata !440, i32 205, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!470 = metadata !{i32 207, i32 0, metadata !471, null}
!471 = metadata !{i32 786443, metadata !1, metadata !469, i32 206, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!472 = metadata !{i32 208, i32 0, metadata !471, null}
!473 = metadata !{i32 786689, metadata !81, metadata !"data", metadata !5, i32 16777372, metadata !8, i32 0, metadata !474} ; [ DW_TAG_arg_variable ] [data] [line 156]
!474 = metadata !{i32 209, i32 0, metadata !475, null}
!475 = metadata !{i32 786443, metadata !1, metadata !471, i32 209, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!476 = metadata !{i32 156, i32 0, metadata !81, metadata !474}
!477 = metadata !{i32 159, i32 0, metadata !81, metadata !474}
!478 = metadata !{i32 160, i32 0, metadata !81, metadata !474}
!479 = metadata !{i32 163, i32 0, metadata !370, metadata !474}
!480 = metadata !{i32 162, i32 0, metadata !369, metadata !474}
!481 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!482 = metadata !{i32 65, i32 0, metadata !28, metadata !480}
!483 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!484 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !480} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!485 = metadata !{i32 67, i32 0, metadata !28, metadata !480}
!486 = metadata !{i32 68, i32 0, metadata !28, metadata !480}
!487 = metadata !{i32 69, i32 0, metadata !28, metadata !480}
!488 = metadata !{i32 165, i32 0, metadata !379, metadata !474}
!489 = metadata !{i32 210, i32 0, metadata !475, null}
!490 = metadata !{i32 215, i32 0, metadata !491, null}
!491 = metadata !{i32 786443, metadata !1, metadata !492, i32 215, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!492 = metadata !{i32 786443, metadata !1, metadata !437, i32 214, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!493 = metadata !{i32 216, i32 0, metadata !492, null}
!494 = metadata !{i32 218, i32 0, metadata !410, null}
!495 = metadata !{i32 224, i32 0, metadata !93, null}
!496 = metadata !{i32 227, i32 0, metadata !105, null}
!497 = metadata !{i32 229, i32 0, metadata !105, null}
!498 = metadata !{i32 232, i32 0, metadata !105, null}
!499 = metadata !{i32 233, i32 0, metadata !105, null}
!500 = metadata !{i32 234, i32 0, metadata !105, null}
!501 = metadata !{i32 786689, metadata !85, metadata !"row", metadata !5, i32 16777385, metadata !9, i32 0, metadata !502} ; [ DW_TAG_arg_variable ] [row] [line 169]
!502 = metadata !{i32 235, i32 0, metadata !105, null}
!503 = metadata !{i32 169, i32 0, metadata !85, metadata !502}
!504 = metadata !{i32 786689, metadata !85, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, metadata !502} ; [ DW_TAG_arg_variable ] [col] [line 169]
!505 = metadata !{i32 173, i32 0, metadata !85, metadata !502}
!506 = metadata !{i32 786688, metadata !85, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, metadata !502} ; [ DW_TAG_auto_variable ] [new] [line 173]
!507 = metadata !{i32 786688, metadata !85, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, metadata !502} ; [ DW_TAG_auto_variable ] [count] [line 172]
!508 = metadata !{i32 174, i32 0, metadata !384, metadata !502}
!509 = metadata !{i32 176, i32 0, metadata !388, metadata !502}
!510 = metadata !{i32 177, i32 0, metadata !388, metadata !502}
!511 = metadata !{i32 236, i32 0, metadata !105, null}
!512 = metadata !{i32 237, i32 0, metadata !105, null}
!513 = metadata !{i32 39, i32 0, metadata !14, metadata !512}
!514 = metadata !{i32 41, i32 0, metadata !195, metadata !512}
!515 = metadata !{i32 43, i32 0, metadata !198, metadata !512}
!516 = metadata !{i32 48, i32 0, metadata !200, metadata !512}
!517 = metadata !{i32 786688, metadata !14, metadata !"valid", metadata !5, i32 38, metadata !9, i32 0, metadata !512} ; [ DW_TAG_auto_variable ] [valid] [line 38]
!518 = metadata !{i32 49, i32 0, metadata !200, metadata !512}
!519 = metadata !{i32 786689, metadata !35, metadata !"data", metadata !5, i32 16777288, metadata !8, i32 0, metadata !520} ; [ DW_TAG_arg_variable ] [data] [line 72]
!520 = metadata !{i32 239, i32 0, metadata !521, null}
!521 = metadata !{i32 786443, metadata !1, metadata !522, i32 239, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!522 = metadata !{i32 786443, metadata !1, metadata !105, i32 238, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!523 = metadata !{i32 72, i32 0, metadata !35, metadata !520}
!524 = metadata !{i32 786688, metadata !35, metadata !"counter", metadata !5, i32 75, metadata !9, i32 0, metadata !520} ; [ DW_TAG_auto_variable ] [counter] [line 75]
!525 = metadata !{i32 75, i32 0, metadata !35, metadata !520}
!526 = metadata !{i32 77, i32 0, metadata !35, metadata !520}
!527 = metadata !{i32 79, i32 0, metadata !221, metadata !520}
!528 = metadata !{i32 786688, metadata !35, metadata !"low", metadata !5, i32 74, metadata !9, i32 0, metadata !520} ; [ DW_TAG_auto_variable ] [low] [line 74]
!529 = metadata !{i32 80, i32 0, metadata !222, metadata !520}
!530 = metadata !{i32 83, i32 0, metadata !35, metadata !520}
!531 = metadata !{i32 241, i32 0, metadata !532, null}
!532 = metadata !{i32 786443, metadata !1, metadata !521, i32 240, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!533 = metadata !{i32 242, i32 0, metadata !534, null}
!534 = metadata !{i32 786443, metadata !1, metadata !532, i32 242, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!535 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, metadata !536} ; [ DW_TAG_arg_variable ] [data] [line 25]
!536 = metadata !{i32 244, i32 0, metadata !532, null}
!537 = metadata !{i32 25, i32 0, metadata !4, metadata !536}
!538 = metadata !{i32 27, i32 0, metadata !4, metadata !536}
!539 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, metadata !536} ; [ DW_TAG_auto_variable ] [new] [line 27]
!540 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, metadata !536} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!541 = metadata !{i32 28, i32 0, metadata !4, metadata !536}
!542 = metadata !{i32 29, i32 0, metadata !4, metadata !536}
!543 = metadata !{i32 30, i32 0, metadata !4, metadata !536}
!544 = metadata !{metadata !544, metadata !185, metadata !186}
!545 = metadata !{metadata !545, metadata !185, metadata !186}
!546 = metadata !{i32 245, i32 0, metadata !532, null}
!547 = metadata !{i32 247, i32 0, metadata !532, null}
!548 = metadata !{i32 248, i32 0, metadata !532, null}
!549 = metadata !{i32 249, i32 0, metadata !532, null}
!550 = metadata !{i32 250, i32 0, metadata !551, null}
!551 = metadata !{i32 786443, metadata !1, metadata !532, i32 250, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!552 = metadata !{i32 252, i32 0, metadata !553, null}
!553 = metadata !{i32 786443, metadata !1, metadata !551, i32 251, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!554 = metadata !{i32 253, i32 0, metadata !553, null}
!555 = metadata !{i32 786689, metadata !85, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, metadata !554} ; [ DW_TAG_arg_variable ] [col] [line 169]
!556 = metadata !{i32 169, i32 0, metadata !85, metadata !554}
!557 = metadata !{i32 173, i32 0, metadata !85, metadata !554}
!558 = metadata !{i32 786688, metadata !85, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, metadata !554} ; [ DW_TAG_auto_variable ] [new] [line 173]
!559 = metadata !{i32 786688, metadata !85, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, metadata !554} ; [ DW_TAG_auto_variable ] [count] [line 172]
!560 = metadata !{i32 174, i32 0, metadata !384, metadata !554}
!561 = metadata !{i32 175, i32 0, metadata !384, metadata !554}
!562 = metadata !{metadata !562, metadata !185, metadata !186}
!563 = metadata !{metadata !563, metadata !185, metadata !186}
!564 = metadata !{i32 257, i32 0, metadata !105, null}
!565 = metadata !{i32 258, i32 0, metadata !105, null}
!566 = metadata !{i32 259, i32 0, metadata !105, null}
!567 = metadata !{i32 262, i32 0, metadata !114, null}
!568 = metadata !{i32 272, i32 0, metadata !114, null}
!569 = metadata !{i32 273, i32 0, metadata !114, null}
!570 = metadata !{i32 274, i32 0, metadata !114, null}
!571 = metadata !{i32 275, i32 0, metadata !572, null}
!572 = metadata !{i32 786443, metadata !1, metadata !114, i32 275, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!573 = metadata !{i32 277, i32 0, metadata !574, null}
!574 = metadata !{i32 786443, metadata !1, metadata !575, i32 277, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!575 = metadata !{i32 786443, metadata !1, metadata !572, i32 276, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!576 = metadata !{i32 786689, metadata !85, metadata !"row", metadata !5, i32 16777385, metadata !9, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [row] [line 169]
!577 = metadata !{i32 279, i32 0, metadata !578, null}
!578 = metadata !{i32 786443, metadata !1, metadata !574, i32 278, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!579 = metadata !{i32 169, i32 0, metadata !85, metadata !577}
!580 = metadata !{i32 786689, metadata !85, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [col] [line 169]
!581 = metadata !{i32 173, i32 0, metadata !85, metadata !577}
!582 = metadata !{i32 786688, metadata !85, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, metadata !577} ; [ DW_TAG_auto_variable ] [new] [line 173]
!583 = metadata !{i32 786688, metadata !85, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, metadata !577} ; [ DW_TAG_auto_variable ] [count] [line 172]
!584 = metadata !{i32 174, i32 0, metadata !384, metadata !577}
!585 = metadata !{i32 175, i32 0, metadata !384, metadata !577}
!586 = metadata !{metadata !586, metadata !185, metadata !186}
!587 = metadata !{i32 176, i32 0, metadata !388, metadata !577}
!588 = metadata !{i32 177, i32 0, metadata !388, metadata !577}
!589 = metadata !{metadata !589, metadata !185, metadata !186}
!590 = metadata !{metadata !590, metadata !185, metadata !186}
!591 = metadata !{metadata !591, metadata !185, metadata !186}
!592 = metadata !{i32 786689, metadata !21, metadata !"data1", metadata !5, i32 16777271, metadata !8, i32 0, metadata !593} ; [ DW_TAG_arg_variable ] [data1] [line 55]
!593 = metadata !{i32 280, i32 0, metadata !578, null}
!594 = metadata !{i32 55, i32 0, metadata !21, metadata !593}
!595 = metadata !{i32 786689, metadata !21, metadata !"data2", metadata !5, i32 33554487, metadata !8, i32 0, metadata !593} ; [ DW_TAG_arg_variable ] [data2] [line 55]
!596 = metadata !{i32 786688, metadata !21, metadata !"counter", metadata !5, i32 57, metadata !9, i32 0, metadata !593} ; [ DW_TAG_auto_variable ] [counter] [line 57]
!597 = metadata !{i32 57, i32 0, metadata !21, metadata !593}
!598 = metadata !{i32 58, i32 0, metadata !21, metadata !593} ; [ DW_TAG_imported_module ]
!599 = metadata !{i32 60, i32 0, metadata !208, metadata !593}
!600 = metadata !{i32 61, i32 0, metadata !208, metadata !593}
!601 = metadata !{metadata !601, metadata !185, metadata !186}
!602 = metadata !{metadata !602, metadata !185, metadata !186}
!603 = metadata !{i32 68, i32 0, metadata !28, metadata !604}
!604 = metadata !{i32 281, i32 0, metadata !605, null}
!605 = metadata !{i32 786443, metadata !1, metadata !578, i32 281, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!606 = metadata !{i32 69, i32 0, metadata !28, metadata !604}
!607 = metadata !{i32 283, i32 0, metadata !608, null}
!608 = metadata !{i32 786443, metadata !1, metadata !605, i32 282, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!609 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, metadata !610} ; [ DW_TAG_arg_variable ] [data] [line 25]
!610 = metadata !{i32 284, i32 0, metadata !608, null}
!611 = metadata !{i32 25, i32 0, metadata !4, metadata !610}
!612 = metadata !{i32 27, i32 0, metadata !4, metadata !610}
!613 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, metadata !610} ; [ DW_TAG_auto_variable ] [new] [line 27]
!614 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, metadata !610} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!615 = metadata !{i32 28, i32 0, metadata !4, metadata !610}
!616 = metadata !{i32 29, i32 0, metadata !4, metadata !610}
!617 = metadata !{i32 30, i32 0, metadata !4, metadata !610}
!618 = metadata !{metadata !618, metadata !185, metadata !186}
!619 = metadata !{metadata !619, metadata !185, metadata !186}
!620 = metadata !{i32 285, i32 0, metadata !608, null}
!621 = metadata !{i32 286, i32 0, metadata !608, null}
!622 = metadata !{i32 287, i32 0, metadata !608, null}
!623 = metadata !{i32 290, i32 0, metadata !624, null}
!624 = metadata !{i32 786443, metadata !1, metadata !625, i32 290, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!625 = metadata !{i32 786443, metadata !1, metadata !605, i32 289, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!626 = metadata !{i32 291, i32 0, metadata !625, null}
!627 = metadata !{i32 293, i32 0, metadata !578, null}
!628 = metadata !{i32 296, i32 0, metadata !114, null}
!629 = metadata !{i32 297, i32 0, metadata !114, null}
!630 = metadata !{i32 298, i32 0, metadata !114, null}
!631 = metadata !{i32 299, i32 0, metadata !114, null}
!632 = metadata !{i32 301, i32 0, metadata !122, null}
!633 = metadata !{i32 303, i32 0, metadata !634, null}
!634 = metadata !{i32 786443, metadata !1, metadata !122, i32 303, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!635 = metadata !{i32 306, i32 0, metadata !122, null}
!636 = metadata !{i32 27, i32 0, metadata !4, metadata !637}
!637 = metadata !{i32 308, i32 0, metadata !122, null}
!638 = metadata !{i32 786689, metadata !62, metadata !"data", metadata !5, i32 16777324, metadata !8, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [data] [line 108]
!639 = metadata !{i32 108, i32 0, metadata !62, metadata !635}
!640 = metadata !{i32 112, i32 0, metadata !62, metadata !635}
!641 = metadata !{i32 111, i32 0, metadata !62, metadata !635}
!642 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !640} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!643 = metadata !{i32 65, i32 0, metadata !28, metadata !640}
!644 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !640} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!645 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !640} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!646 = metadata !{i32 67, i32 0, metadata !28, metadata !640}
!647 = metadata !{i32 68, i32 0, metadata !28, metadata !640}
!648 = metadata !{i32 69, i32 0, metadata !28, metadata !640}
!649 = metadata !{i32 113, i32 0, metadata !62, metadata !635}
!650 = metadata !{i32 114, i32 0, metadata !62, metadata !635}
!651 = metadata !{i32 307, i32 0, metadata !122, null}
!652 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, metadata !637} ; [ DW_TAG_arg_variable ] [data] [line 25]
!653 = metadata !{i32 25, i32 0, metadata !4, metadata !637}
!654 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, metadata !637} ; [ DW_TAG_auto_variable ] [new] [line 27]
!655 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, metadata !637} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!656 = metadata !{i32 28, i32 0, metadata !4, metadata !637}
!657 = metadata !{i32 29, i32 0, metadata !4, metadata !637}
!658 = metadata !{i32 30, i32 0, metadata !4, metadata !637}
!659 = metadata !{metadata !659, metadata !185, metadata !186}
!660 = metadata !{metadata !660, metadata !185, metadata !186}
!661 = metadata !{i32 309, i32 0, metadata !122, null}
!662 = metadata !{i32 311, i32 0, metadata !127, null}
!663 = metadata !{i32 315, i32 0, metadata !127, null}
!664 = metadata !{i32 316, i32 0, metadata !127, null}
!665 = metadata !{i32 786689, metadata !122, metadata !"list", metadata !5, i32 16777517, metadata !43, i32 0, metadata !664} ; [ DW_TAG_arg_variable ] [list] [line 301]
!666 = metadata !{i32 301, i32 0, metadata !122, metadata !664}
!667 = metadata !{i32 303, i32 0, metadata !634, metadata !664}
!668 = metadata !{i32 306, i32 0, metadata !122, metadata !664}
!669 = metadata !{i32 27, i32 0, metadata !4, metadata !670}
!670 = metadata !{i32 308, i32 0, metadata !122, metadata !664}
!671 = metadata !{i32 786689, metadata !62, metadata !"data", metadata !5, i32 16777324, metadata !8, i32 0, metadata !668} ; [ DW_TAG_arg_variable ] [data] [line 108]
!672 = metadata !{i32 108, i32 0, metadata !62, metadata !668}
!673 = metadata !{i32 112, i32 0, metadata !62, metadata !668}
!674 = metadata !{i32 111, i32 0, metadata !62, metadata !668}
!675 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !673} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!676 = metadata !{i32 65, i32 0, metadata !28, metadata !673}
!677 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !673} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!678 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !673} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!679 = metadata !{i32 67, i32 0, metadata !28, metadata !673}
!680 = metadata !{i32 68, i32 0, metadata !28, metadata !673}
!681 = metadata !{i32 69, i32 0, metadata !28, metadata !673}
!682 = metadata !{i32 113, i32 0, metadata !62, metadata !668}
!683 = metadata !{i32 114, i32 0, metadata !62, metadata !668}
!684 = metadata !{i32 307, i32 0, metadata !122, metadata !664}
!685 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, metadata !670} ; [ DW_TAG_arg_variable ] [data] [line 25]
!686 = metadata !{i32 25, i32 0, metadata !4, metadata !670}
!687 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, metadata !670} ; [ DW_TAG_auto_variable ] [new] [line 27]
!688 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, metadata !670} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!689 = metadata !{i32 28, i32 0, metadata !4, metadata !670}
!690 = metadata !{i32 29, i32 0, metadata !4, metadata !670}
!691 = metadata !{i32 30, i32 0, metadata !4, metadata !670}
!692 = metadata !{metadata !692, metadata !185, metadata !186}
!693 = metadata !{metadata !693, metadata !185, metadata !186}
!694 = metadata !{i32 317, i32 0, metadata !127, null}
!695 = metadata !{i32 320, i32 0, metadata !133, null}
!696 = metadata !{i32 67, i32 0, metadata !28, metadata !697}
!697 = metadata !{i32 322, i32 0, metadata !133, null}
!698 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !697} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!699 = metadata !{i32 65, i32 0, metadata !28, metadata !697}
!700 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !697} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!701 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !697} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!702 = metadata !{i32 68, i32 0, metadata !28, metadata !697}
!703 = metadata !{i32 69, i32 0, metadata !28, metadata !697}
!704 = metadata !{i32 323, i32 0, metadata !133, null}
!705 = metadata !{i32 324, i32 0, metadata !133, null}
!706 = metadata !{i32 327, i32 0, metadata !139, null}
!707 = metadata !{i32 331, i32 0, metadata !139, null}
!708 = metadata !{i32 332, i32 0, metadata !139, null}
!709 = metadata !{i32 333, i32 0, metadata !139, null}
!710 = metadata !{i32 334, i32 0, metadata !139, null}
!711 = metadata !{i32 342, i32 0, metadata !147, null}
!712 = metadata !{i32 343, i32 0, metadata !147, null}
!713 = metadata !{i32 344, i32 0, metadata !147, null}
!714 = metadata !{i32 345, i32 0, metadata !147, null}
!715 = metadata !{i32 2}
!716 = metadata !{i32 349, i32 0, metadata !147, null}
!717 = metadata !{i32 786689, metadata !139, metadata !"row", metadata !5, i32 50331975, metadata !8, i32 0, metadata !718} ; [ DW_TAG_arg_variable ] [row] [line 327]
!718 = metadata !{i32 398, i32 0, metadata !719, null}
!719 = metadata !{i32 786443, metadata !1, metadata !720, i32 397, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!720 = metadata !{i32 786443, metadata !1, metadata !721, i32 396, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!721 = metadata !{i32 786443, metadata !1, metadata !722, i32 394, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!722 = metadata !{i32 786443, metadata !1, metadata !147, i32 352, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!723 = metadata !{i32 327, i32 0, metadata !139, metadata !718}
!724 = metadata !{i32 400, i32 0, metadata !719, null}
!725 = metadata !{i32 374, i32 0, metadata !722, null}
!726 = metadata !{i32 378, i32 0, metadata !722, null}
!727 = metadata !{i32 380, i32 0, metadata !722, null}
!728 = metadata !{i32 387, i32 0, metadata !722, null}
!729 = metadata !{i32 390, i32 0, metadata !722, null}
!730 = metadata !{i32 391, i32 0, metadata !722, null}
!731 = metadata !{i32 392, i32 0, metadata !722, null}
!732 = metadata !{i32 786689, metadata !85, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [col] [line 169]
!733 = metadata !{i32 169, i32 0, metadata !85, metadata !731}
!734 = metadata !{i32 173, i32 0, metadata !85, metadata !731}
!735 = metadata !{i32 786688, metadata !85, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, metadata !731} ; [ DW_TAG_auto_variable ] [new] [line 173]
!736 = metadata !{i32 786688, metadata !85, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, metadata !731} ; [ DW_TAG_auto_variable ] [count] [line 172]
!737 = metadata !{i32 174, i32 0, metadata !384, metadata !731}
!738 = metadata !{i32 175, i32 0, metadata !384, metadata !731}
!739 = metadata !{metadata !739, metadata !185, metadata !186}
!740 = metadata !{metadata !740, metadata !185, metadata !186}
!741 = metadata !{i32 393, i32 0, metadata !722, null}
!742 = metadata !{i32 786689, metadata !133, metadata !"data", metadata !5, i32 16777536, metadata !8, i32 0, metadata !743} ; [ DW_TAG_arg_variable ] [data] [line 320]
!743 = metadata !{i32 395, i32 0, metadata !721, null}
!744 = metadata !{i32 320, i32 0, metadata !133, metadata !743}
!745 = metadata !{i32 786689, metadata !133, metadata !"play", metadata !5, i32 33554752, metadata !53, i32 0, metadata !743} ; [ DW_TAG_arg_variable ] [play] [line 320]
!746 = metadata !{i32 322, i32 0, metadata !133, metadata !743}
!747 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !746} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!748 = metadata !{i32 65, i32 0, metadata !28, metadata !746}
!749 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !746} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!750 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !746} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!751 = metadata !{i32 67, i32 0, metadata !28, metadata !746}
!752 = metadata !{i32 68, i32 0, metadata !28, metadata !746}
!753 = metadata !{i32 69, i32 0, metadata !28, metadata !746}
!754 = metadata !{i32 323, i32 0, metadata !133, metadata !743}
!755 = metadata !{i32 324, i32 0, metadata !133, metadata !743}
!756 = metadata !{i32 786689, metadata !122, metadata !"list", metadata !5, i32 16777517, metadata !43, i32 0, metadata !743} ; [ DW_TAG_arg_variable ] [list] [line 301]
!757 = metadata !{i32 301, i32 0, metadata !122, metadata !743}
!758 = metadata !{i32 303, i32 0, metadata !634, metadata !743}
!759 = metadata !{i32 306, i32 0, metadata !122, metadata !743}
!760 = metadata !{i32 786689, metadata !62, metadata !"data", metadata !5, i32 16777324, metadata !8, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [data] [line 108]
!761 = metadata !{i32 108, i32 0, metadata !62, metadata !759}
!762 = metadata !{i32 112, i32 0, metadata !62, metadata !759}
!763 = metadata !{i32 111, i32 0, metadata !62, metadata !759}
!764 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !762} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!765 = metadata !{i32 65, i32 0, metadata !28, metadata !762}
!766 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !762} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!767 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !762} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!768 = metadata !{i32 67, i32 0, metadata !28, metadata !762}
!769 = metadata !{i32 68, i32 0, metadata !28, metadata !762}
!770 = metadata !{i32 69, i32 0, metadata !28, metadata !762}
!771 = metadata !{i32 113, i32 0, metadata !62, metadata !759}
!772 = metadata !{i32 114, i32 0, metadata !62, metadata !759}
!773 = metadata !{i32 307, i32 0, metadata !122, metadata !743}
!774 = metadata !{i32 308, i32 0, metadata !122, metadata !743}
!775 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, metadata !774} ; [ DW_TAG_arg_variable ] [data] [line 25]
!776 = metadata !{i32 25, i32 0, metadata !4, metadata !774}
!777 = metadata !{i32 27, i32 0, metadata !4, metadata !774}
!778 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, metadata !774} ; [ DW_TAG_auto_variable ] [new] [line 27]
!779 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, metadata !774} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!780 = metadata !{i32 28, i32 0, metadata !4, metadata !774}
!781 = metadata !{i32 29, i32 0, metadata !4, metadata !774}
!782 = metadata !{i32 30, i32 0, metadata !4, metadata !774}
!783 = metadata !{metadata !783, metadata !185, metadata !186}
!784 = metadata !{metadata !784, metadata !185, metadata !186}
!785 = metadata !{i32 396, i32 0, metadata !720, null}
!786 = metadata !{i32 332, i32 0, metadata !139, metadata !718}
!787 = metadata !{i32 786689, metadata !139, metadata !"col", metadata !5, i32 67109191, metadata !8, i32 0, metadata !718} ; [ DW_TAG_arg_variable ] [col] [line 327]
!788 = metadata !{i32 331, i32 0, metadata !139, metadata !718}
!789 = metadata !{i32 333, i32 0, metadata !139, metadata !718}
!790 = metadata !{i32 401, i32 0, metadata !719, null}
!791 = metadata !{i32 402, i32 0, metadata !719, null}
!792 = metadata !{i32 406, i32 0, metadata !722, null}
!793 = metadata !{i32 407, i32 0, metadata !722, null}
!794 = metadata !{i32 426, i32 0, metadata !147, null}
