; ModuleID = 'chomp.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._play = type { i32, i32*, %struct._list*, %struct._play* }
%struct._list = type { i32*, %struct._list* }

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
@str = private unnamed_addr constant [2 x i8] c")\00"
@str18 = private unnamed_addr constant [12 x i8] c"For state :\00"
@str19 = private unnamed_addr constant [19 x i8] c"We get, in order :\00"
@str20 = private unnamed_addr constant [33 x i8] c"Mode : 1 -> multiple first moves\00"
@str21 = private unnamed_addr constant [24 x i8] c"       2 -> report game\00"
@str22 = private unnamed_addr constant [27 x i8] c"       3 -> good positions\00"

; Function Attrs: nounwind optsize uwtable
define noalias i32* @copy_data(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !11), !dbg !168
  %1 = load i32* @ncol, align 4, !dbg !169, !tbaa !170
  %2 = sext i32 %1 to i64, !dbg !169
  %3 = shl nsw i64 %2, 2, !dbg !169
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !169
  %5 = bitcast i8* %4 to i32*, !dbg !169
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !12), !dbg !169
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !13), !dbg !174
  %6 = icmp eq i32 %1, 0, !dbg !175
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !175

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %2, %0 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !175
  %7 = getelementptr inbounds i32* %data, i64 %indvars.iv.next, !dbg !176
  %8 = load i32* %7, align 4, !dbg !176, !tbaa !170
  %9 = getelementptr inbounds i32* %5, i64 %indvars.iv.next, !dbg !176
  store i32 %8, i32* %9, align 4, !dbg !176, !tbaa !170
  %10 = trunc i64 %indvars.iv.next to i32, !dbg !175
  %11 = icmp eq i32 %10, 0, !dbg !175
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !175

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i32* %5, !dbg !177
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind optsize uwtable
define i32 @next_data(i32* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !18), !dbg !178
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !19), !dbg !180
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !20), !dbg !181
  %1 = load i32* @ncol, align 4, !dbg !182, !tbaa !170
  %2 = icmp eq i32 %1, 0, !dbg !182
  br i1 %2, label %.critedge, label %.preheader, !dbg !182

.preheader:                                       ; preds = %0, %.outer
  %indvars.iv = phi i64 [ %indvars.iv.next, %.outer ], [ 0, %0 ]
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !183
  %.pre = load i32* %3, align 4, !dbg !183, !tbaa !170
  %4 = load i32* @nrow, align 4, !dbg !183, !tbaa !170
  %5 = icmp eq i32 %.pre, %4, !dbg !183
  br i1 %5, label %.outer, label %..critedge_crit_edge, !dbg !183

.outer:                                           ; preds = %.preheader
  store i32 0, i32* %3, align 4, !dbg !186, !tbaa !170
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !182
  %6 = load i32* @ncol, align 4, !dbg !182, !tbaa !170
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !182
  %8 = icmp eq i32 %7, %6, !dbg !182
  br i1 %8, label %.critedge, label %.preheader, !dbg !182

..critedge_crit_edge:                             ; preds = %.preheader
  %9 = add nsw i32 %.pre, 1, !dbg !188
  store i32 %9, i32* %3, align 4, !dbg !188, !tbaa !170
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !20), !dbg !191
  br label %.critedge, !dbg !182

.critedge:                                        ; preds = %.outer, %0, %..critedge_crit_edge
  %valid.0.lcssa = phi i32 [ 1, %..critedge_crit_edge ], [ 0, %0 ], [ 0, %.outer ]
  ret i32 %valid.0.lcssa, !dbg !192
}

; Function Attrs: nounwind optsize uwtable
define void @melt_data(i32* nocapture %data1, i32* nocapture readonly %data2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !25), !dbg !193
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !26), !dbg !193
  %1 = load i32* @ncol, align 4, !dbg !194, !tbaa !170
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !27), !dbg !194
  %2 = icmp eq i32 %1, 0, !dbg !195
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !195

.lr.ph:                                           ; preds = %0
  %3 = sext i32 %1 to i64
  br label %4, !dbg !195

; <label>:4                                       ; preds = %.lr.ph, %.backedge
  %indvars.iv = phi i64 [ %3, %.lr.ph ], [ %indvars.iv.next, %.backedge ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !195
  %5 = getelementptr inbounds i32* %data1, i64 %indvars.iv.next, !dbg !196
  %6 = load i32* %5, align 4, !dbg !196, !tbaa !170
  %7 = getelementptr inbounds i32* %data2, i64 %indvars.iv.next, !dbg !196
  %8 = load i32* %7, align 4, !dbg !196, !tbaa !170
  %9 = icmp sgt i32 %6, %8, !dbg !196
  br i1 %9, label %10, label %.backedge, !dbg !196

; <label>:10                                      ; preds = %4
  store i32 %8, i32* %5, align 4, !dbg !199, !tbaa !170
  br label %.backedge, !dbg !199

.backedge:                                        ; preds = %10, %4
  %11 = trunc i64 %indvars.iv.next to i32, !dbg !195
  %12 = icmp eq i32 %11, 0, !dbg !195
  br i1 %12, label %._crit_edge, label %4, !dbg !195

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !200
}

; Function Attrs: nounwind optsize readonly uwtable
define i32 @equal_data(i32* nocapture readonly %data1, i32* nocapture readonly %data2) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !32), !dbg !201
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !33), !dbg !201
  %1 = load i32* @ncol, align 4, !dbg !202, !tbaa !170
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !34), !dbg !202
  %2 = sext i32 %1 to i64
  br label %3, !dbg !203

; <label>:3                                       ; preds = %6, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %6 ], [ %2, %0 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %4 = trunc i64 %indvars.iv to i32, !dbg !203
  %5 = icmp eq i32 %4, 0, !dbg !203
  br i1 %5, label %.critedge, label %6, !dbg !203

; <label>:6                                       ; preds = %3
  %7 = getelementptr inbounds i32* %data1, i64 %indvars.iv.next, !dbg !203
  %8 = load i32* %7, align 4, !dbg !203, !tbaa !170
  %9 = getelementptr inbounds i32* %data2, i64 %indvars.iv.next, !dbg !203
  %10 = load i32* %9, align 4, !dbg !203, !tbaa !170
  %11 = icmp eq i32 %8, %10, !dbg !203
  br i1 %11, label %3, label %.critedge

.critedge:                                        ; preds = %3, %6
  %counter.0.lcssa = phi i32 [ 0, %3 ], [ %4, %6 ]
  %12 = icmp slt i32 %counter.0.lcssa, 1, !dbg !204
  %13 = zext i1 %12 to i32, !dbg !204
  ret i32 %13, !dbg !204
}

; Function Attrs: nounwind optsize readonly uwtable
define i32 @valid_data(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !37), !dbg !205
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !39), !dbg !206
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !38), !dbg !207
  %1 = load i32* @ncol, align 4, !dbg !208, !tbaa !170
  %2 = icmp eq i32 %1, 0, !dbg !208
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !208

.lr.ph:                                           ; preds = %0
  %3 = load i32* @nrow, align 4, !dbg !207, !tbaa !170
  br label %7, !dbg !208

; <label>:4                                       ; preds = %7
  %5 = trunc i64 %indvars.iv.next to i32, !dbg !208
  %6 = icmp eq i32 %5, %1, !dbg !208
  br i1 %6, label %._crit_edge, label %7, !dbg !208

; <label>:7                                       ; preds = %.lr.ph, %4
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %4 ]
  %low.01 = phi i32 [ %3, %.lr.ph ], [ %9, %4 ]
  %8 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !209
  %9 = load i32* %8, align 4, !dbg !209, !tbaa !170
  %10 = icmp sgt i32 %9, %low.01, !dbg !209
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !38), !dbg !212
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !39), !dbg !213
  br i1 %10, label %._crit_edge3, label %4, !dbg !209

._crit_edge3:                                     ; preds = %7
  %11 = trunc i64 %indvars.iv to i32, !dbg !209
  br label %._crit_edge, !dbg !209

._crit_edge:                                      ; preds = %4, %._crit_edge3, %0
  %12 = phi i32 [ %1, %._crit_edge3 ], [ 0, %0 ], [ %1, %4 ]
  %counter.0.lcssa = phi i32 [ %11, %._crit_edge3 ], [ 0, %0 ], [ %1, %4 ]
  %13 = icmp eq i32 %counter.0.lcssa, %12, !dbg !214
  %14 = zext i1 %13 to i32, !dbg !214
  ret i32 %14, !dbg !214
}

; Function Attrs: nounwind optsize uwtable
define void @dump_list(%struct._list* %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !49), !dbg !215
  %1 = icmp eq %struct._list* %list, null, !dbg !216
  br i1 %1, label %9, label %2, !dbg !216

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct._list* %list, i64 0, i32 1, !dbg !218
  %4 = load %struct._list** %3, align 8, !dbg !218, !tbaa !220
  tail call void @dump_list(%struct._list* %4) #6, !dbg !218
  %5 = getelementptr inbounds %struct._list* %list, i64 0, i32 0, !dbg !223
  %6 = load i32** %5, align 8, !dbg !223, !tbaa !224
  %7 = bitcast i32* %6 to i8*, !dbg !223
  tail call void @free(i8* %7) #5, !dbg !223
  %8 = bitcast %struct._list* %list to i8*, !dbg !225
  tail call void @free(i8* %8) #5, !dbg !225
  ret void, !dbg !226

; <label>:9                                       ; preds = %0
  ret void, !dbg !226
}

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind optsize uwtable
define void @dump_play(%struct._play* %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !61), !dbg !227
  %1 = icmp eq %struct._play* %play, null, !dbg !228
  br i1 %1, label %11, label %2, !dbg !228

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct._play* %play, i64 0, i32 3, !dbg !230
  %4 = load %struct._play** %3, align 8, !dbg !230, !tbaa !232
  tail call void @dump_play(%struct._play* %4) #6, !dbg !230
  %5 = getelementptr inbounds %struct._play* %play, i64 0, i32 2, !dbg !234
  %6 = load %struct._list** %5, align 8, !dbg !234, !tbaa !235
  tail call void @dump_list(%struct._list* %6) #6, !dbg !234
  %7 = getelementptr inbounds %struct._play* %play, i64 0, i32 1, !dbg !236
  %8 = load i32** %7, align 8, !dbg !236, !tbaa !237
  %9 = bitcast i32* %8 to i8*, !dbg !236
  tail call void @free(i8* %9) #5, !dbg !236
  %10 = bitcast %struct._play* %play to i8*, !dbg !238
  tail call void @free(i8* %10) #5, !dbg !238
  ret void, !dbg !239

; <label>:11                                      ; preds = %0
  ret void, !dbg !239
}

; Function Attrs: nounwind optsize readonly uwtable
define i32 @get_value(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !64), !dbg !240
  %1 = load i32* @ncol, align 4, !dbg !241, !tbaa !170
  %2 = sext i32 %1 to i64
  br label %3, !dbg !242

; <label>:3                                       ; preds = %equal_data.exit, %0
  %search.0.in = phi %struct._play** [ @game_tree, %0 ], [ %16, %equal_data.exit ]
  %search.0 = load %struct._play** %search.0.in, align 8, !dbg !243
  %4 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 1, !dbg !242
  %5 = load i32** %4, align 8, !dbg !242, !tbaa !237
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !244), !dbg !245
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !246), !dbg !245
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !247), !dbg !241
  br label %6, !dbg !248

; <label>:6                                       ; preds = %9, %3
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %9 ], [ %2, %3 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %7 = trunc i64 %indvars.iv.i to i32, !dbg !248
  %8 = icmp eq i32 %7, 0, !dbg !248
  br i1 %8, label %equal_data.exit.thread, label %9, !dbg !248

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds i32* %5, i64 %indvars.iv.next.i, !dbg !248
  %11 = load i32* %10, align 4, !dbg !248, !tbaa !170
  %12 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !248
  %13 = load i32* %12, align 4, !dbg !248, !tbaa !170
  %14 = icmp eq i32 %11, %13, !dbg !248
  br i1 %14, label %6, label %equal_data.exit

equal_data.exit:                                  ; preds = %9
  %15 = icmp slt i32 %7, 1, !dbg !249
  %16 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 3, !dbg !250
  br i1 %15, label %equal_data.exit.thread, label %3, !dbg !242

equal_data.exit.thread:                           ; preds = %equal_data.exit, %6
  %17 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 0, !dbg !251
  %18 = load i32* %17, align 4, !dbg !251, !tbaa !252
  ret i32 %18, !dbg !251
}

; Function Attrs: nounwind optsize uwtable
define void @show_data(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !70), !dbg !253
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !71), !dbg !254
  %1 = load i32* @ncol, align 4, !dbg !255, !tbaa !170
  %2 = icmp eq i32 %1, 0, !dbg !255
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !255

.lr.ph:                                           ; preds = %0, %.backedge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.backedge ], [ 0, %0 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !255
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !256
  %4 = load i32* %3, align 4, !dbg !256, !tbaa !170
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %4) #5, !dbg !256
  %6 = load i32* @ncol, align 4, !dbg !258, !tbaa !170
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !258
  %8 = icmp eq i32 %7, %6, !dbg !258
  br i1 %8, label %.backedge, label %9, !dbg !258

; <label>:9                                       ; preds = %.lr.ph
  %10 = tail call i32 @putchar(i32 44) #5, !dbg !258
  %.pre = load i32* @ncol, align 4, !dbg !255, !tbaa !170
  br label %.backedge, !dbg !258

.backedge:                                        ; preds = %9, %.lr.ph
  %11 = phi i32 [ %.pre, %9 ], [ %6, %.lr.ph ]
  %12 = icmp eq i32 %7, %11, !dbg !255
  br i1 %12, label %._crit_edge, label %.lr.ph, !dbg !255

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !260
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind optsize
declare i32 @putchar(i32) #2

; Function Attrs: nounwind optsize uwtable
define void @show_move(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !74), !dbg !261
  %1 = tail call i32 @putchar(i32 40) #5, !dbg !262
  tail call void @show_data(i32* %data) #6, !dbg !263
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)), !dbg !264
  ret void, !dbg !265
}

; Function Attrs: nounwind optsize uwtable
define void @show_list(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !77), !dbg !266
  %1 = icmp eq %struct._list* %list, null, !dbg !267
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !267

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct._list* [ %6, %.lr.ph ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.01, i64 0, i32 0, !dbg !268
  %3 = load i32** %2, align 8, !dbg !268, !tbaa !224
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !270) #4, !dbg !271
  %4 = tail call i32 @putchar(i32 40) #5, !dbg !272
  tail call void @show_data(i32* %3) #5, !dbg !273
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) #4, !dbg !274
  %5 = getelementptr inbounds %struct._list* %.01, i64 0, i32 1, !dbg !275
  %6 = load %struct._list** %5, align 8, !dbg !275, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !77), !dbg !275
  %7 = icmp eq %struct._list* %6, null, !dbg !267
  br i1 %7, label %._crit_edge, label %.lr.ph, !dbg !267

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !276
}

; Function Attrs: nounwind optsize uwtable
define void @show_play(%struct._play* readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !80), !dbg !277
  %1 = icmp eq %struct._play* %play, null, !dbg !278
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !278

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.02 = phi %struct._play* [ %10, %.lr.ph ], [ %play, %0 ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str18, i64 0, i64 0)), !dbg !279
  %2 = getelementptr inbounds %struct._play* %.02, i64 0, i32 1, !dbg !281
  %3 = load i32** %2, align 8, !dbg !281, !tbaa !237
  tail call void @show_data(i32* %3) #6, !dbg !281
  %4 = getelementptr inbounds %struct._play* %.02, i64 0, i32 0, !dbg !282
  %5 = load i32* %4, align 4, !dbg !282, !tbaa !252
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i64 0, i64 0), i32 %5) #5, !dbg !282
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str19, i64 0, i64 0)), !dbg !283
  %7 = getelementptr inbounds %struct._play* %.02, i64 0, i32 2, !dbg !284
  %8 = load %struct._list** %7, align 8, !dbg !284, !tbaa !235
  tail call void @show_list(%struct._list* %8) #6, !dbg !284
  %9 = getelementptr inbounds %struct._play* %.02, i64 0, i32 3, !dbg !285
  %10 = load %struct._play** %9, align 8, !dbg !285, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %10}, i64 0, metadata !80), !dbg !285
  %11 = icmp eq %struct._play* %10, null, !dbg !278
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !278

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !286
}

; Function Attrs: nounwind optsize readonly uwtable
define i32 @in_wanted(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !83), !dbg !287
  %current.02 = load %struct._list** @wanted, align 8, !dbg !288
  %cond3 = icmp eq %struct._list* %current.02, null, !dbg !289
  br i1 %cond3, label %._crit_edge, label %.lr.ph, !dbg !289

.lr.ph:                                           ; preds = %0
  %1 = load i32* @ncol, align 4, !dbg !290, !tbaa !170
  %2 = sext i32 %1 to i64
  br label %5, !dbg !289

; <label>:3                                       ; preds = %equal_data.exit
  %4 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 1, !dbg !294
  %current.0 = load %struct._list** %4, align 8, !dbg !288
  %cond = icmp eq %struct._list* %current.0, null, !dbg !289
  br i1 %cond, label %._crit_edge, label %5, !dbg !289

; <label>:5                                       ; preds = %.lr.ph, %3
  %current.04 = phi %struct._list* [ %current.02, %.lr.ph ], [ %current.0, %3 ]
  %6 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 0, !dbg !291
  %7 = load i32** %6, align 8, !dbg !291, !tbaa !224
  tail call void @llvm.dbg.value(metadata !{i32* %7}, i64 0, metadata !295), !dbg !296
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !297), !dbg !296
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !298), !dbg !290
  br label %8, !dbg !299

; <label>:8                                       ; preds = %11, %5
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %11 ], [ %2, %5 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %9 = trunc i64 %indvars.iv.i to i32, !dbg !299
  %10 = icmp eq i32 %9, 0, !dbg !299
  br i1 %10, label %equal_data.exit.thread, label %11, !dbg !299

; <label>:11                                      ; preds = %8
  %12 = getelementptr inbounds i32* %7, i64 %indvars.iv.next.i, !dbg !299
  %13 = load i32* %12, align 4, !dbg !299, !tbaa !170
  %14 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !299
  %15 = load i32* %14, align 4, !dbg !299, !tbaa !170
  %16 = icmp eq i32 %13, %15, !dbg !299
  br i1 %16, label %8, label %equal_data.exit

equal_data.exit:                                  ; preds = %11
  %17 = icmp slt i32 %9, 1, !dbg !300
  br i1 %17, label %equal_data.exit.thread, label %3, !dbg !291

equal_data.exit.thread:                           ; preds = %equal_data.exit, %8
  %not. = icmp ne %struct._list* %current.04, null, !dbg !301
  %. = zext i1 %not. to i32, !dbg !301
  ret i32 %., !dbg !301

._crit_edge:                                      ; preds = %3, %0
  ret i32 0, !dbg !303
}

; Function Attrs: nounwind optsize uwtable
define noalias i32* @make_data(i32 %row, i32 %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %row}, i64 0, metadata !89), !dbg !304
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !90), !dbg !304
  %1 = load i32* @ncol, align 4, !dbg !305, !tbaa !170
  %2 = sext i32 %1 to i64, !dbg !305
  %3 = shl nsw i64 %2, 2, !dbg !305
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !305
  %5 = bitcast i8* %4 to i32*, !dbg !305
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !92), !dbg !305
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !91), !dbg !306
  %6 = icmp eq i32 %col, 0, !dbg !306
  br i1 %6, label %.preheader, label %.lr.ph4, !dbg !306

.lr.ph4:                                          ; preds = %0
  %7 = load i32* @nrow, align 4, !dbg !308, !tbaa !170
  br label %10, !dbg !306

.preheader:                                       ; preds = %10, %0
  %count.0.lcssa = phi i32 [ 0, %0 ], [ %col, %10 ]
  %8 = icmp eq i32 %count.0.lcssa, %1, !dbg !309
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !309

.lr.ph:                                           ; preds = %.preheader
  %9 = sext i32 %count.0.lcssa to i64
  br label %12, !dbg !309

; <label>:10                                      ; preds = %.lr.ph4, %10
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %10 ]
  %11 = getelementptr inbounds i32* %5, i64 %indvars.iv5, !dbg !308
  store i32 %7, i32* %11, align 4, !dbg !308, !tbaa !170
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !306
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !91), !dbg !306
  %lftr.wideiv7 = trunc i64 %indvars.iv.next6 to i32, !dbg !306
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %col, !dbg !306
  br i1 %exitcond8, label %.preheader, label %10, !dbg !306

; <label>:12                                      ; preds = %.lr.ph, %12
  %indvars.iv = phi i64 [ %9, %.lr.ph ], [ %indvars.iv.next, %12 ]
  %13 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !311
  store i32 %row, i32* %13, align 4, !dbg !311, !tbaa !170
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !309
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !309
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !309
  br i1 %exitcond, label %._crit_edge, label %12, !dbg !309

._crit_edge:                                      ; preds = %12, %.preheader
  ret i32* %5, !dbg !312
}

; Function Attrs: nounwind optsize uwtable
define %struct._list* @make_list(i32* nocapture readonly %data, i32* nocapture %value, i32* nocapture %all) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !97), !dbg !313
  tail call void @llvm.dbg.value(metadata !{i32* %value}, i64 0, metadata !98), !dbg !313
  tail call void @llvm.dbg.value(metadata !{i32* %all}, i64 0, metadata !99), !dbg !313
  store i32 1, i32* %value, align 4, !dbg !314, !tbaa !170
  %1 = tail call noalias i8* @malloc(i64 16) #5, !dbg !315
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !103), !dbg !315
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !316
  %3 = bitcast i8* %2 to %struct._list**, !dbg !316
  store %struct._list* null, %struct._list** %3, align 8, !dbg !316, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !104), !dbg !317
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !100), !dbg !318
  %4 = load i32* @nrow, align 4, !dbg !318, !tbaa !170
  %5 = icmp eq i32 %4, 0, !dbg !318
  br i1 %5, label %.thread, label %.preheader.lr.ph, !dbg !318

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{%struct._list* %78}, i64 0, metadata !104), !dbg !320
  tail call void @free(i8* %1) #5, !dbg !321
  br label %77, !dbg !322

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !315
  %.pre10 = load i32* @ncol, align 4, !dbg !324, !tbaa !170
  br label %.preheader, !dbg !318

.preheader:                                       ; preds = %.preheader.lr.ph, %67
  %7 = phi i32 [ %4, %.preheader.lr.ph ], [ %68, %67 ]
  %8 = phi i32 [ %.pre10, %.preheader.lr.ph ], [ %69, %67 ], !dbg !324
  %current.08 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %67 ]
  %row.07 = phi i32 [ 0, %.preheader.lr.ph ], [ %70, %67 ]
  %9 = icmp eq i32 %8, 0, !dbg !324
  br i1 %9, label %67, label %.lr.ph, !dbg !324

.lr.ph:                                           ; preds = %.preheader, %62
  %current.15 = phi %struct._list* [ %current.2, %62 ], [ %current.08, %.preheader ]
  %row.14 = phi i32 [ %row.3, %62 ], [ %row.07, %.preheader ]
  %col.03 = phi i32 [ %64, %62 ], [ 0, %.preheader ]
  %10 = tail call i32* @make_data(i32 %row.14, i32 %col.03) #6, !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !102), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !329), !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !332), !dbg !331
  %11 = load i32* @ncol, align 4, !dbg !333, !tbaa !170
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !334), !dbg !333
  %12 = icmp eq i32 %11, 0, !dbg !335
  %.pre12 = sext i32 %11 to i64
  br i1 %12, label %melt_data.exit, label %.lr.ph.i, !dbg !335

.lr.ph.i:                                         ; preds = %.lr.ph, %.backedge.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.backedge.i ], [ %.pre12, %.lr.ph ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1, !dbg !335
  %13 = getelementptr inbounds i32* %10, i64 %indvars.iv.next.i, !dbg !336
  %14 = load i32* %13, align 4, !dbg !336, !tbaa !170
  %15 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !336
  %16 = load i32* %15, align 4, !dbg !336, !tbaa !170
  %17 = icmp sgt i32 %14, %16, !dbg !336
  br i1 %17, label %18, label %.backedge.i, !dbg !336

; <label>:18                                      ; preds = %.lr.ph.i
  store i32 %16, i32* %13, align 4, !dbg !337, !tbaa !170
  br label %.backedge.i, !dbg !337

.backedge.i:                                      ; preds = %18, %.lr.ph.i
  %19 = trunc i64 %indvars.iv.next.i to i32, !dbg !335
  %20 = icmp eq i32 %19, 0, !dbg !335
  br i1 %20, label %melt_data.exit, label %.lr.ph.i, !dbg !335

melt_data.exit:                                   ; preds = %.lr.ph, %.backedge.i, %23
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %23 ], [ %.pre12, %.backedge.i ], [ %.pre12, %.lr.ph ]
  %indvars.iv.next.i2 = add nsw i64 %indvars.iv.i1, -1
  %21 = trunc i64 %indvars.iv.i1 to i32, !dbg !338
  %22 = icmp eq i32 %21, 0, !dbg !338
  br i1 %22, label %equal_data.exit.thread, label %23, !dbg !338

; <label>:23                                      ; preds = %melt_data.exit
  %24 = getelementptr inbounds i32* %10, i64 %indvars.iv.next.i2, !dbg !338
  %25 = load i32* %24, align 4, !dbg !338, !tbaa !170
  %26 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i2, !dbg !338
  %27 = load i32* %26, align 4, !dbg !338, !tbaa !170
  %28 = icmp eq i32 %25, %27, !dbg !338
  br i1 %28, label %melt_data.exit, label %equal_data.exit

equal_data.exit:                                  ; preds = %23
  %29 = icmp slt i32 %21, 1, !dbg !341
  br i1 %29, label %equal_data.exit.thread, label %30, !dbg !339

; <label>:30                                      ; preds = %equal_data.exit
  %31 = tail call noalias i8* @malloc(i64 16) #5, !dbg !342
  %32 = bitcast i8* %31 to %struct._list*, !dbg !342
  %33 = getelementptr inbounds %struct._list* %current.15, i64 0, i32 1, !dbg !342
  store %struct._list* %32, %struct._list** %33, align 8, !dbg !342, !tbaa !220
  %34 = tail call i32* @copy_data(i32* %10) #6, !dbg !344
  %35 = load %struct._list** %33, align 8, !dbg !344, !tbaa !220
  %36 = getelementptr inbounds %struct._list* %35, i64 0, i32 0, !dbg !344
  store i32* %34, i32** %36, align 8, !dbg !344, !tbaa !224
  %37 = getelementptr inbounds %struct._list* %35, i64 0, i32 1, !dbg !345
  store %struct._list* null, %struct._list** %37, align 8, !dbg !345, !tbaa !220
  %38 = load %struct._list** %33, align 8, !dbg !346, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %38}, i64 0, metadata !104), !dbg !346
  %39 = load i32* %value, align 4, !dbg !347, !tbaa !170
  %40 = icmp eq i32 %39, 1, !dbg !347
  br i1 %40, label %41, label %43, !dbg !347

; <label>:41                                      ; preds = %30
  %42 = tail call i32 @get_value(i32* %10) #6, !dbg !349
  store i32 %42, i32* %value, align 4, !dbg !349, !tbaa !170
  br label %43, !dbg !349

; <label>:43                                      ; preds = %41, %30
  %44 = phi i32 [ %42, %41 ], [ %39, %30 ]
  %45 = load i32* %all, align 4, !dbg !350, !tbaa !170
  %46 = or i32 %45, %44, !dbg !350
  %47 = icmp eq i32 %46, 0, !dbg !350
  br i1 %47, label %48, label %62, !dbg !350

; <label>:48                                      ; preds = %43
  %49 = load i32* @ncol, align 4, !dbg !352, !tbaa !170
  %50 = add nsw i32 %49, -1, !dbg !352
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !101), !dbg !352
  %51 = load i32* @nrow, align 4, !dbg !354, !tbaa !170
  %52 = add nsw i32 %51, -1, !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !100), !dbg !354
  %53 = tail call i32 @in_wanted(i32* %10) #6, !dbg !355
  %54 = icmp eq i32 %53, 0, !dbg !355
  br i1 %54, label %62, label %55, !dbg !355

; <label>:55                                      ; preds = %48
  store i32 2, i32* %all, align 4, !dbg !357, !tbaa !170
  br label %62, !dbg !357

equal_data.exit.thread:                           ; preds = %melt_data.exit, %equal_data.exit
  %56 = icmp eq i32 %col.03, 0, !dbg !358
  br i1 %56, label %57, label %60, !dbg !358

; <label>:57                                      ; preds = %equal_data.exit.thread
  %58 = load i32* @nrow, align 4, !dbg !358, !tbaa !170
  %59 = add nsw i32 %58, -1, !dbg !358
  tail call void @llvm.dbg.value(metadata !{i32 %59}, i64 0, metadata !100), !dbg !358
  br label %60, !dbg !358

; <label>:60                                      ; preds = %57, %equal_data.exit.thread
  %row.2 = phi i32 [ %59, %57 ], [ %row.14, %equal_data.exit.thread ]
  %61 = add nsw i32 %11, -1, !dbg !361
  tail call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !101), !dbg !361
  br label %62

; <label>:62                                      ; preds = %48, %43, %55, %60
  %col.1 = phi i32 [ %61, %60 ], [ %col.03, %43 ], [ %50, %55 ], [ %50, %48 ]
  %row.3 = phi i32 [ %row.2, %60 ], [ %row.14, %43 ], [ %52, %55 ], [ %52, %48 ]
  %current.2 = phi %struct._list* [ %current.15, %60 ], [ %38, %43 ], [ %38, %55 ], [ %38, %48 ]
  %63 = bitcast i32* %10 to i8*, !dbg !362
  tail call void @free(i8* %63) #5, !dbg !362
  %64 = add nsw i32 %col.1, 1, !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !101), !dbg !324
  %65 = load i32* @ncol, align 4, !dbg !324, !tbaa !170
  %66 = icmp eq i32 %64, %65, !dbg !324
  br i1 %66, label %._crit_edge, label %.lr.ph, !dbg !324

._crit_edge:                                      ; preds = %62
  %.pre11 = load i32* @nrow, align 4, !dbg !318, !tbaa !170
  br label %67, !dbg !324

; <label>:67                                      ; preds = %._crit_edge, %.preheader
  %68 = phi i32 [ %.pre11, %._crit_edge ], [ %7, %.preheader ], !dbg !318
  %69 = phi i32 [ %64, %._crit_edge ], [ 0, %.preheader ]
  %current.1.lcssa = phi %struct._list* [ %current.2, %._crit_edge ], [ %current.08, %.preheader ]
  %row.1.lcssa = phi i32 [ %row.3, %._crit_edge ], [ %row.07, %.preheader ]
  %70 = add nsw i32 %row.1.lcssa, 1, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !100), !dbg !318
  %71 = icmp eq i32 %70, %68, !dbg !318
  br i1 %71, label %72, label %.preheader, !dbg !318

; <label>:72                                      ; preds = %67
  %.pre = load %struct._list** %3, align 8, !dbg !320, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %78}, i64 0, metadata !104), !dbg !320
  tail call void @free(i8* %1) #5, !dbg !321
  %73 = icmp eq %struct._list* %.pre, null, !dbg !322
  br i1 %73, label %77, label %74, !dbg !322

; <label>:74                                      ; preds = %72
  %75 = load i32* %value, align 4, !dbg !322, !tbaa !170
  %76 = sub nsw i32 1, %75, !dbg !322
  store i32 %76, i32* %value, align 4, !dbg !322, !tbaa !170
  br label %77, !dbg !322

; <label>:77                                      ; preds = %.thread, %72, %74
  %78 = phi %struct._list* [ null, %.thread ], [ null, %72 ], [ %.pre, %74 ]
  ret %struct._list* %78, !dbg !363
}

; Function Attrs: nounwind optsize uwtable
define %struct._play* @make_play(i32 %all) #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata !{i32 %all}, i64 0, metadata !109), !dbg !364
  store i32 %all, i32* %1, align 4, !tbaa !170
  tail call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !109), !dbg !364
  tail call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !110), !dbg !365
  %2 = tail call noalias i8* @malloc(i64 32) #5, !dbg !366
  %3 = bitcast i8* %2 to %struct._play*, !dbg !366
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !112), !dbg !366
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !113), !dbg !367
  store %struct._play* null, %struct._play** @game_tree, align 8, !dbg !368, !tbaa !369
  %4 = tail call i32* @make_data(i32 0, i32 0) #6, !dbg !370
  tail call void @llvm.dbg.value(metadata !{i32* %4}, i64 0, metadata !111), !dbg !370
  %5 = load i32* %4, align 4, !dbg !371, !tbaa !170
  %6 = add nsw i32 %5, -1, !dbg !371
  store i32 %6, i32* %4, align 4, !dbg !371, !tbaa !170
  br label %.outer, !dbg !372

.outer:                                           ; preds = %43, %0
  %temp.0.ph = phi i32* [ %4, %0 ], [ %47, %43 ]
  %current.0.ph = phi %struct._play* [ %3, %0 ], [ %40, %43 ]
  br label %.outer4

.outer4:                                          ; preds = %.outer, %30
  %current.0.ph5 = phi %struct._play* [ %40, %30 ], [ %current.0.ph, %.outer ]
  %7 = load i32* @ncol, align 4, !dbg !373, !tbaa !170
  %8 = icmp eq i32 %7, 0, !dbg !373
  %9 = load i32* @nrow, align 4, !dbg !374, !tbaa !170
  br i1 %8, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %valid_data.exit, %.outer.i, %.outer4
  %indvars.iv.i = phi i64 [ 0, %.outer4 ], [ %indvars.iv.next.i, %.outer.i ], [ 0, %valid_data.exit ]
  %10 = getelementptr inbounds i32* %temp.0.ph, i64 %indvars.iv.i, !dbg !374
  %.pre.i = load i32* %10, align 4, !dbg !374, !tbaa !170
  %11 = icmp eq i32 %.pre.i, %9, !dbg !374
  br i1 %11, label %.outer.i, label %.lr.ph.i, !dbg !374

.outer.i:                                         ; preds = %.preheader
  store i32 0, i32* %10, align 4, !dbg !375, !tbaa !170
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !373
  %12 = trunc i64 %indvars.iv.next.i to i32, !dbg !373
  %13 = icmp eq i32 %12, %7, !dbg !373
  br i1 %13, label %.loopexit, label %.preheader, !dbg !373

.lr.ph.i:                                         ; preds = %.preheader
  %14 = add nsw i32 %.pre.i, 1, !dbg !376
  store i32 %14, i32* %10, align 4, !dbg !376, !tbaa !170
  tail call void @llvm.dbg.value(metadata !190, i64 0, metadata !377), !dbg !378
  tail call void @llvm.dbg.value(metadata !{i32* %temp.0.ph}, i64 0, metadata !379), !dbg !383
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !384), !dbg !385
  br label %18, !dbg !386

; <label>:15                                      ; preds = %18
  %16 = trunc i64 %indvars.iv.next.i2 to i32, !dbg !386
  %17 = icmp eq i32 %16, %7, !dbg !386
  br i1 %17, label %valid_data.exit.thread, label %18, !dbg !386

; <label>:18                                      ; preds = %15, %.lr.ph.i
  %indvars.iv.i1 = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i2, %15 ]
  %low.01.i = phi i32 [ %9, %.lr.ph.i ], [ %20, %15 ]
  %19 = getelementptr inbounds i32* %temp.0.ph, i64 %indvars.iv.i1, !dbg !387
  %20 = load i32* %19, align 4, !dbg !387, !tbaa !170
  %21 = icmp sgt i32 %20, %low.01.i, !dbg !387
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !388), !dbg !389
  %indvars.iv.next.i2 = add nuw nsw i64 %indvars.iv.i1, 1, !dbg !386
  br i1 %21, label %valid_data.exit, label %15, !dbg !387

valid_data.exit:                                  ; preds = %18
  %22 = trunc i64 %indvars.iv.i1 to i32, !dbg !387
  %23 = icmp eq i32 %22, %7, !dbg !390
  br i1 %23, label %valid_data.exit.thread, label %.preheader, !dbg !380

valid_data.exit.thread:                           ; preds = %valid_data.exit, %15
  %24 = tail call noalias i8* @malloc(i64 32) #5, !dbg !391
  %25 = bitcast i8* %24 to %struct._play*, !dbg !391
  %26 = getelementptr inbounds %struct._play* %current.0.ph5, i64 0, i32 3, !dbg !391
  store %struct._play* %25, %struct._play** %26, align 8, !dbg !391, !tbaa !232
  %27 = load %struct._play** @game_tree, align 8, !dbg !393, !tbaa !369
  %28 = icmp eq %struct._play* %27, null, !dbg !393
  br i1 %28, label %29, label %30, !dbg !393

; <label>:29                                      ; preds = %valid_data.exit.thread
  store %struct._play* %25, %struct._play** @game_tree, align 8, !dbg !393, !tbaa !369
  br label %30, !dbg !393

; <label>:30                                      ; preds = %29, %valid_data.exit.thread
  %31 = tail call i32* @copy_data(i32* %temp.0.ph) #6, !dbg !395
  %32 = load %struct._play** %26, align 8, !dbg !395, !tbaa !232
  %33 = getelementptr inbounds %struct._play* %32, i64 0, i32 1, !dbg !395
  store i32* %31, i32** %33, align 8, !dbg !395, !tbaa !237
  %34 = call %struct._list* @make_list(i32* %temp.0.ph, i32* %val, i32* %1) #6, !dbg !396
  %35 = load %struct._play** %26, align 8, !dbg !396, !tbaa !232
  %36 = getelementptr inbounds %struct._play* %35, i64 0, i32 2, !dbg !396
  store %struct._list* %34, %struct._list** %36, align 8, !dbg !396, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %val}, i64 0, metadata !110), !dbg !397
  %37 = load i32* %val, align 4, !dbg !397, !tbaa !170
  %38 = getelementptr inbounds %struct._play* %35, i64 0, i32 0, !dbg !397
  store i32 %37, i32* %38, align 4, !dbg !397, !tbaa !252
  %39 = getelementptr inbounds %struct._play* %35, i64 0, i32 3, !dbg !398
  store %struct._play* null, %struct._play** %39, align 8, !dbg !398, !tbaa !232
  %40 = load %struct._play** %26, align 8, !dbg !399, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %40}, i64 0, metadata !113), !dbg !399
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !109), !dbg !400
  %41 = load i32* %1, align 4, !dbg !400, !tbaa !170
  %42 = icmp eq i32 %41, 2, !dbg !400
  br i1 %42, label %43, label %.outer4, !dbg !400

; <label>:43                                      ; preds = %30
  %44 = bitcast i32* %temp.0.ph to i8*, !dbg !402
  tail call void @free(i8* %44) #5, !dbg !402
  %45 = load i32* @nrow, align 4, !dbg !404, !tbaa !170
  %46 = load i32* @ncol, align 4, !dbg !404, !tbaa !170
  %47 = tail call i32* @make_data(i32 %45, i32 %46) #6, !dbg !404
  tail call void @llvm.dbg.value(metadata !{i32* %47}, i64 0, metadata !111), !dbg !404
  br label %.outer, !dbg !405

.loopexit:                                        ; preds = %.outer4, %.outer.i
  %48 = getelementptr inbounds i8* %2, i64 24, !dbg !406
  %49 = bitcast i8* %48 to %struct._play**, !dbg !406
  %50 = load %struct._play** %49, align 8, !dbg !406, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %50}, i64 0, metadata !113), !dbg !406
  tail call void @free(i8* %2) #5, !dbg !407
  ret %struct._play* %50, !dbg !408
}

; Function Attrs: nounwind optsize uwtable
define void @make_wanted(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !116), !dbg !409
  %1 = tail call noalias i8* @malloc(i64 16) #5, !dbg !410
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !120), !dbg !410
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !411
  %3 = bitcast i8* %2 to %struct._list**, !dbg !411
  store %struct._list* null, %struct._list** %3, align 8, !dbg !411, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !121), !dbg !412
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !117), !dbg !413
  %4 = load i32* @nrow, align 4, !dbg !413, !tbaa !170
  %5 = icmp eq i32 %4, 0, !dbg !413
  br i1 %5, label %55, label %.preheader.lr.ph, !dbg !413

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !410
  %.pre10 = load i32* @ncol, align 4, !dbg !415, !tbaa !170
  br label %.preheader, !dbg !413

.preheader:                                       ; preds = %.preheader.lr.ph, %50
  %7 = phi i32 [ %4, %.preheader.lr.ph ], [ %51, %50 ]
  %8 = phi i32 [ %.pre10, %.preheader.lr.ph ], [ %52, %50 ], !dbg !415
  %current.08 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %50 ]
  %row.07 = phi i32 [ 0, %.preheader.lr.ph ], [ %53, %50 ]
  %9 = icmp eq i32 %8, 0, !dbg !415
  br i1 %9, label %50, label %.lr.ph, !dbg !415

.lr.ph:                                           ; preds = %.preheader, %45
  %current.15 = phi %struct._list* [ %current.2, %45 ], [ %current.08, %.preheader ]
  %row.14 = phi i32 [ %row.3, %45 ], [ %row.07, %.preheader ]
  %col.03 = phi i32 [ %47, %45 ], [ 0, %.preheader ]
  %10 = tail call i32* @make_data(i32 %row.14, i32 %col.03) #6, !dbg !418
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !119), !dbg !418
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !420), !dbg !422
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !423), !dbg !422
  %11 = load i32* @ncol, align 4, !dbg !424, !tbaa !170
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !425), !dbg !424
  %12 = icmp eq i32 %11, 0, !dbg !426
  %.pre12 = sext i32 %11 to i64
  br i1 %12, label %melt_data.exit, label %.lr.ph.i, !dbg !426

.lr.ph.i:                                         ; preds = %.lr.ph, %.backedge.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.backedge.i ], [ %.pre12, %.lr.ph ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1, !dbg !426
  %13 = getelementptr inbounds i32* %10, i64 %indvars.iv.next.i, !dbg !427
  %14 = load i32* %13, align 4, !dbg !427, !tbaa !170
  %15 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !427
  %16 = load i32* %15, align 4, !dbg !427, !tbaa !170
  %17 = icmp sgt i32 %14, %16, !dbg !427
  br i1 %17, label %18, label %.backedge.i, !dbg !427

; <label>:18                                      ; preds = %.lr.ph.i
  store i32 %16, i32* %13, align 4, !dbg !428, !tbaa !170
  br label %.backedge.i, !dbg !428

.backedge.i:                                      ; preds = %18, %.lr.ph.i
  %19 = trunc i64 %indvars.iv.next.i to i32, !dbg !426
  %20 = icmp eq i32 %19, 0, !dbg !426
  br i1 %20, label %melt_data.exit, label %.lr.ph.i, !dbg !426

melt_data.exit:                                   ; preds = %.lr.ph, %.backedge.i, %23
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %23 ], [ %.pre12, %.backedge.i ], [ %.pre12, %.lr.ph ]
  %indvars.iv.next.i2 = add nsw i64 %indvars.iv.i1, -1
  %21 = trunc i64 %indvars.iv.i1 to i32, !dbg !429
  %22 = icmp eq i32 %21, 0, !dbg !429
  br i1 %22, label %equal_data.exit.thread, label %23, !dbg !429

; <label>:23                                      ; preds = %melt_data.exit
  %24 = getelementptr inbounds i32* %10, i64 %indvars.iv.next.i2, !dbg !429
  %25 = load i32* %24, align 4, !dbg !429, !tbaa !170
  %26 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i2, !dbg !429
  %27 = load i32* %26, align 4, !dbg !429, !tbaa !170
  %28 = icmp eq i32 %25, %27, !dbg !429
  br i1 %28, label %melt_data.exit, label %equal_data.exit

equal_data.exit:                                  ; preds = %23
  %29 = icmp slt i32 %21, 1, !dbg !432
  br i1 %29, label %equal_data.exit.thread, label %30, !dbg !430

; <label>:30                                      ; preds = %equal_data.exit
  %31 = tail call noalias i8* @malloc(i64 16) #5, !dbg !433
  %32 = bitcast i8* %31 to %struct._list*, !dbg !433
  %33 = getelementptr inbounds %struct._list* %current.15, i64 0, i32 1, !dbg !433
  store %struct._list* %32, %struct._list** %33, align 8, !dbg !433, !tbaa !220
  %34 = tail call i32* @copy_data(i32* %10) #6, !dbg !435
  %35 = load %struct._list** %33, align 8, !dbg !435, !tbaa !220
  %36 = getelementptr inbounds %struct._list* %35, i64 0, i32 0, !dbg !435
  store i32* %34, i32** %36, align 8, !dbg !435, !tbaa !224
  %37 = getelementptr inbounds %struct._list* %35, i64 0, i32 1, !dbg !436
  store %struct._list* null, %struct._list** %37, align 8, !dbg !436, !tbaa !220
  %38 = load %struct._list** %33, align 8, !dbg !437, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %38}, i64 0, metadata !121), !dbg !437
  br label %45, !dbg !438

equal_data.exit.thread:                           ; preds = %melt_data.exit, %equal_data.exit
  %39 = icmp eq i32 %col.03, 0, !dbg !439
  br i1 %39, label %40, label %43, !dbg !439

; <label>:40                                      ; preds = %equal_data.exit.thread
  %41 = load i32* @nrow, align 4, !dbg !439, !tbaa !170
  %42 = add nsw i32 %41, -1, !dbg !439
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !117), !dbg !439
  br label %43, !dbg !439

; <label>:43                                      ; preds = %40, %equal_data.exit.thread
  %row.2 = phi i32 [ %42, %40 ], [ %row.14, %equal_data.exit.thread ]
  %44 = add nsw i32 %11, -1, !dbg !442
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !118), !dbg !442
  br label %45

; <label>:45                                      ; preds = %43, %30
  %col.1 = phi i32 [ %44, %43 ], [ %col.03, %30 ]
  %row.3 = phi i32 [ %row.2, %43 ], [ %row.14, %30 ]
  %current.2 = phi %struct._list* [ %current.15, %43 ], [ %38, %30 ]
  %46 = bitcast i32* %10 to i8*, !dbg !443
  tail call void @free(i8* %46) #5, !dbg !443
  %47 = add nsw i32 %col.1, 1, !dbg !415
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !118), !dbg !415
  %48 = load i32* @ncol, align 4, !dbg !415, !tbaa !170
  %49 = icmp eq i32 %47, %48, !dbg !415
  br i1 %49, label %._crit_edge, label %.lr.ph, !dbg !415

._crit_edge:                                      ; preds = %45
  %.pre11 = load i32* @nrow, align 4, !dbg !413, !tbaa !170
  br label %50, !dbg !415

; <label>:50                                      ; preds = %._crit_edge, %.preheader
  %51 = phi i32 [ %.pre11, %._crit_edge ], [ %7, %.preheader ], !dbg !413
  %52 = phi i32 [ %47, %._crit_edge ], [ 0, %.preheader ]
  %current.1.lcssa = phi %struct._list* [ %current.2, %._crit_edge ], [ %current.08, %.preheader ]
  %row.1.lcssa = phi i32 [ %row.3, %._crit_edge ], [ %row.07, %.preheader ]
  %53 = add nsw i32 %row.1.lcssa, 1, !dbg !413
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !117), !dbg !413
  %54 = icmp eq i32 %53, %51, !dbg !413
  br i1 %54, label %._crit_edge9, label %.preheader, !dbg !413

._crit_edge9:                                     ; preds = %50
  %.pre = load %struct._list** %3, align 8, !dbg !444, !tbaa !220
  br label %55, !dbg !413

; <label>:55                                      ; preds = %._crit_edge9, %0
  %56 = phi %struct._list* [ %.pre, %._crit_edge9 ], [ null, %0 ]
  tail call void @llvm.dbg.value(metadata !{%struct._list* %56}, i64 0, metadata !121), !dbg !444
  tail call void @free(i8* %1) #5, !dbg !445
  store %struct._list* %56, %struct._list** @wanted, align 8, !dbg !446, !tbaa !369
  ret void, !dbg !447
}

; Function Attrs: nounwind optsize uwtable
define noalias i32* @get_good_move(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !126), !dbg !448
  %1 = icmp eq %struct._list* %list, null, !dbg !449
  br i1 %1, label %9, label %.preheader, !dbg !449

.preheader:                                       ; preds = %0, %5
  %.0 = phi %struct._list* [ %3, %5 ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.0, i64 0, i32 1, !dbg !451
  %3 = load %struct._list** %2, align 8, !dbg !451, !tbaa !220
  %4 = icmp eq %struct._list* %3, null, !dbg !451
  %.phi.trans.insert = getelementptr inbounds %struct._list* %.0, i64 0, i32 0
  %.pre = load i32** %.phi.trans.insert, align 8, !dbg !452, !tbaa !224
  br i1 %4, label %.critedge, label %5, !dbg !451

; <label>:5                                       ; preds = %.preheader
  %6 = tail call i32 @get_value(i32* %.pre) #6, !dbg !451
  %7 = icmp eq i32 %6, 0, !dbg !451
  br i1 %7, label %.critedge, label %.preheader

.critedge:                                        ; preds = %.preheader, %5
  %8 = tail call i32* @copy_data(i32* %.pre) #6, !dbg !452
  br label %9, !dbg !452

; <label>:9                                       ; preds = %0, %.critedge
  %.01 = phi i32* [ %8, %.critedge ], [ null, %0 ]
  ret i32* %.01, !dbg !453
}

; Function Attrs: nounwind optsize uwtable
define noalias i32* @get_winning_move(%struct._play* nocapture readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !131), !dbg !454
  br label %1, !dbg !455

; <label>:1                                       ; preds = %1, %0
  %.0 = phi %struct._play* [ %play, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct._play* %.0, i64 0, i32 3, !dbg !455
  %3 = load %struct._play** %2, align 8, !dbg !455, !tbaa !232
  %4 = icmp eq %struct._play* %3, null, !dbg !455
  br i1 %4, label %5, label %1, !dbg !455

; <label>:5                                       ; preds = %1
  %6 = getelementptr inbounds %struct._play* %.0, i64 0, i32 2, !dbg !456
  %7 = load %struct._list** %6, align 8, !dbg !456, !tbaa !235
  %8 = tail call i32* @get_good_move(%struct._list* %7) #6, !dbg !456
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !132), !dbg !456
  ret i32* %8, !dbg !457
}

; Function Attrs: nounwind optsize readonly uwtable
define %struct._list* @where(i32* nocapture readonly %data, %struct._play* nocapture readonly %play) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !137), !dbg !458
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !138), !dbg !458
  %1 = load i32* @ncol, align 4, !dbg !459, !tbaa !170
  %2 = sext i32 %1 to i64
  br label %3, !dbg !460

; <label>:3                                       ; preds = %16, %0
  %.0 = phi %struct._play* [ %play, %0 ], [ %18, %16 ]
  %4 = getelementptr inbounds %struct._play* %.0, i64 0, i32 1, !dbg !460
  %5 = load i32** %4, align 8, !dbg !460, !tbaa !237
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !461), !dbg !462
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !463), !dbg !462
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !464), !dbg !459
  br label %6, !dbg !465

; <label>:6                                       ; preds = %9, %3
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %9 ], [ %2, %3 ]
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %7 = trunc i64 %indvars.iv.i to i32, !dbg !465
  %8 = icmp eq i32 %7, 0, !dbg !465
  br i1 %8, label %equal_data.exit.thread, label %9, !dbg !465

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds i32* %5, i64 %indvars.iv.next.i, !dbg !465
  %11 = load i32* %10, align 4, !dbg !465, !tbaa !170
  %12 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.i, !dbg !465
  %13 = load i32* %12, align 4, !dbg !465, !tbaa !170
  %14 = icmp eq i32 %11, %13, !dbg !465
  br i1 %14, label %6, label %equal_data.exit

equal_data.exit:                                  ; preds = %9
  %15 = icmp slt i32 %7, 1, !dbg !466
  br i1 %15, label %equal_data.exit.thread, label %16, !dbg !460

; <label>:16                                      ; preds = %equal_data.exit
  %17 = getelementptr inbounds %struct._play* %.0, i64 0, i32 3, !dbg !467
  %18 = load %struct._play** %17, align 8, !dbg !467, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %18}, i64 0, metadata !138), !dbg !467
  br label %3, !dbg !467

equal_data.exit.thread:                           ; preds = %equal_data.exit, %6
  %19 = getelementptr inbounds %struct._play* %.0, i64 0, i32 2, !dbg !468
  %20 = load %struct._list** %19, align 8, !dbg !468, !tbaa !235
  ret %struct._list* %20, !dbg !468
}

; Function Attrs: nounwind optsize uwtable
define void @get_real_move(i32* nocapture readonly %data1, i32* nocapture readonly %data2, i32* nocapture %row, i32* nocapture %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !143), !dbg !469
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !144), !dbg !469
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !145), !dbg !469
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !146), !dbg !469
  br label %1, !dbg !470

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %1 ], [ 0, %0 ]
  %2 = trunc i64 %indvars.iv to i32, !dbg !471
  store i32 %2, i32* %col, align 4, !dbg !471, !tbaa !170
  %3 = getelementptr inbounds i32* %data1, i64 %indvars.iv, !dbg !470
  %4 = load i32* %3, align 4, !dbg !470, !tbaa !170
  %5 = getelementptr inbounds i32* %data2, i64 %indvars.iv, !dbg !470
  %6 = load i32* %5, align 4, !dbg !470, !tbaa !170
  %7 = icmp eq i32 %4, %6, !dbg !470
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !470
  br i1 %7, label %1, label %8, !dbg !470

; <label>:8                                       ; preds = %1
  store i32 %4, i32* %row, align 4, !dbg !472, !tbaa !170
  ret void, !dbg !473
}

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str20, i64 0, i64 0)), !dbg !474
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str21, i64 0, i64 0)), !dbg !475
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str22, i64 0, i64 0)), !dbg !476
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0)) #5, !dbg !477
  tail call void @llvm.dbg.value(metadata !478, i64 0, metadata !151), !dbg !479
  tail call void @llvm.dbg.value(metadata !478, i64 0, metadata !480), !dbg !486
  tail call void @llvm.dbg.value(metadata !478, i64 0, metadata !151), !dbg !487
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i64 0, i64 0)) #5, !dbg !488
  store i32 7, i32* @ncol, align 4, !dbg !489, !tbaa !170
  %3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i64 0, i64 0)) #5, !dbg !490
  store i32 8, i32* @nrow, align 4, !dbg !491, !tbaa !170
  %4 = tail call %struct._play* @make_play(i32 1) #6, !dbg !492
  tail call void @llvm.dbg.value(metadata !{%struct._play* %4}, i64 0, metadata !158), !dbg !492
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !154), !dbg !493
  %5 = load i32* @nrow, align 4, !dbg !494, !tbaa !170
  %6 = load i32* @ncol, align 4, !dbg !494, !tbaa !170
  %7 = tail call i32* @make_data(i32 %5, i32 %6) #6, !dbg !494
  tail call void @llvm.dbg.value(metadata !{i32* %7}, i64 0, metadata !156), !dbg !494
  br label %.outer, !dbg !495

.outer:                                           ; preds = %get_real_move.exit, %0
  %current.0.ph = phi i32* [ %7, %0 ], [ %31, %get_real_move.exit ]
  %player.0.ph = phi i32 [ 0, %0 ], [ %40, %get_real_move.exit ]
  br label %8

; <label>:8                                       ; preds = %.outer, %where.exit
  %current.0 = phi i32* [ null, %where.exit ], [ %current.0.ph, %.outer ]
  %9 = icmp eq i32* %current.0, null, !dbg !495
  br i1 %9, label %42, label %10, !dbg !495

; <label>:10                                      ; preds = %8
  tail call void @llvm.dbg.value(metadata !{i32* %current.0}, i64 0, metadata !496), !dbg !498
  tail call void @llvm.dbg.value(metadata !{%struct._play* %4}, i64 0, metadata !499), !dbg !498
  %11 = load i32* @ncol, align 4, !dbg !500, !tbaa !170
  %12 = sext i32 %11 to i64
  br label %13, !dbg !501

; <label>:13                                      ; preds = %26, %10
  %.0.i = phi %struct._play* [ %4, %10 ], [ %28, %26 ]
  %14 = getelementptr inbounds %struct._play* %.0.i, i64 0, i32 1, !dbg !501
  %15 = load i32** %14, align 8, !dbg !501, !tbaa !237
  tail call void @llvm.dbg.value(metadata !{i32* %15}, i64 0, metadata !502), !dbg !503
  tail call void @llvm.dbg.value(metadata !{i32* %current.0}, i64 0, metadata !504), !dbg !503
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !505), !dbg !500
  br label %16, !dbg !506

; <label>:16                                      ; preds = %19, %13
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %19 ], [ %12, %13 ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1
  %17 = trunc i64 %indvars.iv.i.i to i32, !dbg !506
  %18 = icmp eq i32 %17, 0, !dbg !506
  br i1 %18, label %where.exit, label %19, !dbg !506

; <label>:19                                      ; preds = %16
  %20 = getelementptr inbounds i32* %15, i64 %indvars.iv.next.i.i, !dbg !506
  %21 = load i32* %20, align 4, !dbg !506, !tbaa !170
  %22 = getelementptr inbounds i32* %current.0, i64 %indvars.iv.next.i.i, !dbg !506
  %23 = load i32* %22, align 4, !dbg !506, !tbaa !170
  %24 = icmp eq i32 %21, %23, !dbg !506
  br i1 %24, label %16, label %equal_data.exit.i

equal_data.exit.i:                                ; preds = %19
  %25 = icmp slt i32 %17, 1, !dbg !507
  br i1 %25, label %where.exit, label %26, !dbg !501

; <label>:26                                      ; preds = %equal_data.exit.i
  %27 = getelementptr inbounds %struct._play* %.0.i, i64 0, i32 3, !dbg !508
  %28 = load %struct._play** %27, align 8, !dbg !508, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %28}, i64 0, metadata !499), !dbg !508
  br label %13, !dbg !508

where.exit:                                       ; preds = %equal_data.exit.i, %16
  %29 = getelementptr inbounds %struct._play* %.0.i, i64 0, i32 2, !dbg !509
  %30 = load %struct._list** %29, align 8, !dbg !509, !tbaa !235
  %31 = tail call i32* @get_good_move(%struct._list* %30) #6, !dbg !497
  tail call void @llvm.dbg.value(metadata !{i32* %31}, i64 0, metadata !157), !dbg !497
  %32 = icmp eq i32* %31, null, !dbg !510
  br i1 %32, label %8, label %.preheader, !dbg !510

.preheader:                                       ; preds = %where.exit, %.preheader
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.preheader ], [ 0, %where.exit ]
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !152), !dbg !511
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !512), !dbg !486
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !152), !dbg !487
  %33 = getelementptr inbounds i32* %31, i64 %indvars.iv.i, !dbg !513
  %34 = load i32* %33, align 4, !dbg !513, !tbaa !170
  %35 = getelementptr inbounds i32* %current.0, i64 %indvars.iv.i, !dbg !513
  %36 = load i32* %35, align 4, !dbg !513, !tbaa !170
  %37 = icmp eq i32 %34, %36, !dbg !513
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !513
  br i1 %37, label %.preheader, label %get_real_move.exit, !dbg !513

get_real_move.exit:                               ; preds = %.preheader
  %38 = trunc i64 %indvars.iv.i to i32, !dbg !511
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !151), !dbg !514
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !480), !dbg !486
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !151), !dbg !487
  %39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i64 0, i64 0), i32 %player.0.ph, i32 %34, i32 %38) #5, !dbg !487
  %40 = sub nsw i32 1, %player.0.ph, !dbg !515
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !154), !dbg !515
  %41 = bitcast i32* %current.0 to i8*, !dbg !516
  tail call void @free(i8* %41) #5, !dbg !516
  br label %.outer, !dbg !517

; <label>:42                                      ; preds = %8
  tail call void @dump_play(%struct._play* %4) #6, !dbg !518
  %43 = sub nsw i32 1, %player.0.ph, !dbg !519
  %44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str16, i64 0, i64 0), i32 %43) #5, !dbg !519
  ret i32 0, !dbg !520
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind optsize }
attributes #6 = { optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!165, !166}
!llvm.ident = !{!167}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !160, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c] [DW_LANG_C99]
!1 = metadata !{metadata !"chomp.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !14, metadata !21, metadata !28, metadata !35, metadata !40, metadata !50, metadata !62, metadata !66, metadata !72, metadata !75, metadata !78, metadata !81, metadata !85, metadata !93, metadata !105, metadata !114, metadata !122, metadata !127, metadata !133, metadata !139, metadata !147}
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
!160 = metadata !{metadata !161, metadata !162, metadata !163, metadata !164}
!161 = metadata !{i32 786484, i32 0, null, metadata !"wanted", metadata !"wanted", metadata !"", metadata !5, i32 12, metadata !43, i32 0, i32 1, %struct._list** @wanted, null} ; [ DW_TAG_variable ] [wanted] [line 12] [def]
!162 = metadata !{i32 786484, i32 0, null, metadata !"game_tree", metadata !"game_tree", metadata !"", metadata !5, i32 20, metadata !53, i32 0, i32 1, %struct._play** @game_tree, null} ; [ DW_TAG_variable ] [game_tree] [line 20] [def]
!163 = metadata !{i32 786484, i32 0, null, metadata !"nrow", metadata !"nrow", metadata !"", metadata !5, i32 22, metadata !9, i32 0, i32 1, i32* @nrow, null} ; [ DW_TAG_variable ] [nrow] [line 22] [def]
!164 = metadata !{i32 786484, i32 0, null, metadata !"ncol", metadata !"ncol", metadata !"", metadata !5, i32 22, metadata !9, i32 0, i32 1, i32* @ncol, null} ; [ DW_TAG_variable ] [ncol] [line 22] [def]
!165 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!166 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!167 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!168 = metadata !{i32 25, i32 0, metadata !4, null}
!169 = metadata !{i32 27, i32 0, metadata !4, null}
!170 = metadata !{metadata !171, metadata !171, i64 0}
!171 = metadata !{metadata !"int", metadata !172, i64 0}
!172 = metadata !{metadata !"omnipotent char", metadata !173, i64 0}
!173 = metadata !{metadata !"Simple C/C++ TBAA"}
!174 = metadata !{i32 28, i32 0, metadata !4, null}
!175 = metadata !{i32 29, i32 0, metadata !4, null}
!176 = metadata !{i32 30, i32 0, metadata !4, null}
!177 = metadata !{i32 31, i32 0, metadata !4, null}
!178 = metadata !{i32 34, i32 0, metadata !14, null}
!179 = metadata !{i32 0}
!180 = metadata !{i32 37, i32 0, metadata !14, null}
!181 = metadata !{i32 38, i32 0, metadata !14, null}
!182 = metadata !{i32 39, i32 0, metadata !14, null}
!183 = metadata !{i32 41, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !185, i32 41, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!185 = metadata !{i32 786443, metadata !1, metadata !14, i32 40, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!186 = metadata !{i32 43, i32 0, metadata !187, null}
!187 = metadata !{i32 786443, metadata !1, metadata !184, i32 42, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!188 = metadata !{i32 48, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !184, i32 47, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!190 = metadata !{i32 1}
!191 = metadata !{i32 49, i32 0, metadata !189, null}
!192 = metadata !{i32 52, i32 0, metadata !14, null}
!193 = metadata !{i32 55, i32 0, metadata !21, null}
!194 = metadata !{i32 57, i32 0, metadata !21, null}
!195 = metadata !{i32 58, i32 0, metadata !21, null} ; [ DW_TAG_imported_module ]
!196 = metadata !{i32 60, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !198, i32 60, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!198 = metadata !{i32 786443, metadata !1, metadata !21, i32 59, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!199 = metadata !{i32 61, i32 0, metadata !197, null}
!200 = metadata !{i32 63, i32 0, metadata !21, null}
!201 = metadata !{i32 65, i32 0, metadata !28, null}
!202 = metadata !{i32 67, i32 0, metadata !28, null}
!203 = metadata !{i32 68, i32 0, metadata !28, null}
!204 = metadata !{i32 69, i32 0, metadata !28, null}
!205 = metadata !{i32 72, i32 0, metadata !35, null}
!206 = metadata !{i32 75, i32 0, metadata !35, null}
!207 = metadata !{i32 76, i32 0, metadata !35, null}
!208 = metadata !{i32 77, i32 0, metadata !35, null}
!209 = metadata !{i32 79, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !1, metadata !211, i32 79, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!211 = metadata !{i32 786443, metadata !1, metadata !35, i32 78, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!212 = metadata !{i32 80, i32 0, metadata !211, null}
!213 = metadata !{i32 81, i32 0, metadata !211, null}
!214 = metadata !{i32 83, i32 0, metadata !35, null}
!215 = metadata !{i32 86, i32 0, metadata !40, null}
!216 = metadata !{i32 88, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !40, i32 88, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!218 = metadata !{i32 90, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !217, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!220 = metadata !{metadata !221, metadata !222, i64 8}
!221 = metadata !{metadata !"_list", metadata !222, i64 0, metadata !222, i64 8}
!222 = metadata !{metadata !"any pointer", metadata !172, i64 0}
!223 = metadata !{i32 91, i32 0, metadata !219, null}
!224 = metadata !{metadata !221, metadata !222, i64 0}
!225 = metadata !{i32 92, i32 0, metadata !219, null}
!226 = metadata !{i32 94, i32 0, metadata !40, null}
!227 = metadata !{i32 97, i32 0, metadata !50, null}
!228 = metadata !{i32 99, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !50, i32 99, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!230 = metadata !{i32 101, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !229, i32 100, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!232 = metadata !{metadata !233, metadata !222, i64 24}
!233 = metadata !{metadata !"_play", metadata !171, i64 0, metadata !222, i64 8, metadata !222, i64 16, metadata !222, i64 24}
!234 = metadata !{i32 102, i32 0, metadata !231, null}
!235 = metadata !{metadata !233, metadata !222, i64 16}
!236 = metadata !{i32 103, i32 0, metadata !231, null}
!237 = metadata !{metadata !233, metadata !222, i64 8}
!238 = metadata !{i32 104, i32 0, metadata !231, null}
!239 = metadata !{i32 106, i32 0, metadata !50, null}
!240 = metadata !{i32 108, i32 0, metadata !62, null}
!241 = metadata !{i32 67, i32 0, metadata !28, metadata !242}
!242 = metadata !{i32 112, i32 0, metadata !62, null}
!243 = metadata !{i32 111, i32 0, metadata !62, null}
!244 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !242} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!245 = metadata !{i32 65, i32 0, metadata !28, metadata !242}
!246 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !242} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!247 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !242} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!248 = metadata !{i32 68, i32 0, metadata !28, metadata !242}
!249 = metadata !{i32 69, i32 0, metadata !28, metadata !242}
!250 = metadata !{i32 113, i32 0, metadata !62, null}
!251 = metadata !{i32 114, i32 0, metadata !62, null}
!252 = metadata !{metadata !233, metadata !171, i64 0}
!253 = metadata !{i32 117, i32 0, metadata !66, null}
!254 = metadata !{i32 119, i32 0, metadata !66, null}
!255 = metadata !{i32 120, i32 0, metadata !66, null}
!256 = metadata !{i32 122, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !66, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!258 = metadata !{i32 123, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !257, i32 123, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!260 = metadata !{i32 125, i32 0, metadata !66, null}
!261 = metadata !{i32 127, i32 0, metadata !72, null}
!262 = metadata !{i32 129, i32 0, metadata !72, null}
!263 = metadata !{i32 130, i32 0, metadata !72, null}
!264 = metadata !{i32 131, i32 0, metadata !72, null}
!265 = metadata !{i32 132, i32 0, metadata !72, null}
!266 = metadata !{i32 134, i32 0, metadata !75, null}
!267 = metadata !{i32 136, i32 0, metadata !75, null}
!268 = metadata !{i32 138, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !75, i32 137, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!270 = metadata !{i32 786689, metadata !72, metadata !"data", metadata !5, i32 16777343, metadata !8, i32 0, metadata !268} ; [ DW_TAG_arg_variable ] [data] [line 127]
!271 = metadata !{i32 127, i32 0, metadata !72, metadata !268}
!272 = metadata !{i32 129, i32 0, metadata !72, metadata !268}
!273 = metadata !{i32 130, i32 0, metadata !72, metadata !268}
!274 = metadata !{i32 131, i32 0, metadata !72, metadata !268}
!275 = metadata !{i32 139, i32 0, metadata !269, null}
!276 = metadata !{i32 141, i32 0, metadata !75, null}
!277 = metadata !{i32 143, i32 0, metadata !78, null}
!278 = metadata !{i32 145, i32 0, metadata !78, null}
!279 = metadata !{i32 147, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !78, i32 146, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!281 = metadata !{i32 148, i32 0, metadata !280, null}
!282 = metadata !{i32 149, i32 0, metadata !280, null}
!283 = metadata !{i32 150, i32 0, metadata !280, null}
!284 = metadata !{i32 151, i32 0, metadata !280, null}
!285 = metadata !{i32 152, i32 0, metadata !280, null}
!286 = metadata !{i32 154, i32 0, metadata !78, null}
!287 = metadata !{i32 156, i32 0, metadata !81, null}
!288 = metadata !{i32 159, i32 0, metadata !81, null}
!289 = metadata !{i32 160, i32 0, metadata !81, null}
!290 = metadata !{i32 67, i32 0, metadata !28, metadata !291}
!291 = metadata !{i32 162, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !293, i32 162, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!293 = metadata !{i32 786443, metadata !1, metadata !81, i32 161, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!294 = metadata !{i32 163, i32 0, metadata !293, null}
!295 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!296 = metadata !{i32 65, i32 0, metadata !28, metadata !291}
!297 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!298 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !291} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!299 = metadata !{i32 68, i32 0, metadata !28, metadata !291}
!300 = metadata !{i32 69, i32 0, metadata !28, metadata !291}
!301 = metadata !{i32 165, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !81, i32 165, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!303 = metadata !{i32 167, i32 0, metadata !81, null}
!304 = metadata !{i32 169, i32 0, metadata !85, null}
!305 = metadata !{i32 173, i32 0, metadata !85, null}
!306 = metadata !{i32 174, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !1, metadata !85, i32 174, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!308 = metadata !{i32 175, i32 0, metadata !307, null}
!309 = metadata !{i32 176, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !85, i32 176, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!311 = metadata !{i32 177, i32 0, metadata !310, null}
!312 = metadata !{i32 178, i32 0, metadata !85, null}
!313 = metadata !{i32 181, i32 0, metadata !93, null}
!314 = metadata !{i32 187, i32 0, metadata !93, null}
!315 = metadata !{i32 188, i32 0, metadata !93, null}
!316 = metadata !{i32 189, i32 0, metadata !93, null}
!317 = metadata !{i32 190, i32 0, metadata !93, null}
!318 = metadata !{i32 191, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !93, i32 191, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!320 = metadata !{i32 221, i32 0, metadata !93, null}
!321 = metadata !{i32 222, i32 0, metadata !93, null}
!322 = metadata !{i32 223, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !1, metadata !93, i32 223, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!324 = metadata !{i32 193, i32 0, metadata !325, null}
!325 = metadata !{i32 786443, metadata !1, metadata !326, i32 193, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!326 = metadata !{i32 786443, metadata !1, metadata !319, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!327 = metadata !{i32 195, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !325, i32 194, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!329 = metadata !{i32 786689, metadata !21, metadata !"data1", metadata !5, i32 16777271, metadata !8, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [data1] [line 55]
!330 = metadata !{i32 196, i32 0, metadata !328, null}
!331 = metadata !{i32 55, i32 0, metadata !21, metadata !330}
!332 = metadata !{i32 786689, metadata !21, metadata !"data2", metadata !5, i32 33554487, metadata !8, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [data2] [line 55]
!333 = metadata !{i32 57, i32 0, metadata !21, metadata !330}
!334 = metadata !{i32 786688, metadata !21, metadata !"counter", metadata !5, i32 57, metadata !9, i32 0, metadata !330} ; [ DW_TAG_auto_variable ] [counter] [line 57]
!335 = metadata !{i32 58, i32 0, metadata !21, metadata !330} ; [ DW_TAG_imported_module ]
!336 = metadata !{i32 60, i32 0, metadata !197, metadata !330}
!337 = metadata !{i32 61, i32 0, metadata !197, metadata !330}
!338 = metadata !{i32 68, i32 0, metadata !28, metadata !339}
!339 = metadata !{i32 197, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !328, i32 197, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!341 = metadata !{i32 69, i32 0, metadata !28, metadata !339}
!342 = metadata !{i32 199, i32 0, metadata !343, null}
!343 = metadata !{i32 786443, metadata !1, metadata !340, i32 198, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!344 = metadata !{i32 200, i32 0, metadata !343, null}
!345 = metadata !{i32 201, i32 0, metadata !343, null}
!346 = metadata !{i32 202, i32 0, metadata !343, null}
!347 = metadata !{i32 203, i32 0, metadata !348, null}
!348 = metadata !{i32 786443, metadata !1, metadata !343, i32 203, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!349 = metadata !{i32 204, i32 0, metadata !348, null}
!350 = metadata !{i32 205, i32 0, metadata !351, null}
!351 = metadata !{i32 786443, metadata !1, metadata !343, i32 205, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!352 = metadata !{i32 207, i32 0, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !351, i32 206, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!354 = metadata !{i32 208, i32 0, metadata !353, null}
!355 = metadata !{i32 209, i32 0, metadata !356, null}
!356 = metadata !{i32 786443, metadata !1, metadata !353, i32 209, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!357 = metadata !{i32 210, i32 0, metadata !356, null}
!358 = metadata !{i32 215, i32 0, metadata !359, null}
!359 = metadata !{i32 786443, metadata !1, metadata !360, i32 215, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!360 = metadata !{i32 786443, metadata !1, metadata !340, i32 214, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!361 = metadata !{i32 216, i32 0, metadata !360, null}
!362 = metadata !{i32 218, i32 0, metadata !328, null}
!363 = metadata !{i32 224, i32 0, metadata !93, null}
!364 = metadata !{i32 227, i32 0, metadata !105, null}
!365 = metadata !{i32 229, i32 0, metadata !105, null}
!366 = metadata !{i32 232, i32 0, metadata !105, null}
!367 = metadata !{i32 233, i32 0, metadata !105, null}
!368 = metadata !{i32 234, i32 0, metadata !105, null}
!369 = metadata !{metadata !222, metadata !222, i64 0}
!370 = metadata !{i32 235, i32 0, metadata !105, null}
!371 = metadata !{i32 236, i32 0, metadata !105, null}
!372 = metadata !{i32 237, i32 0, metadata !105, null}
!373 = metadata !{i32 39, i32 0, metadata !14, metadata !372}
!374 = metadata !{i32 41, i32 0, metadata !184, metadata !372}
!375 = metadata !{i32 43, i32 0, metadata !187, metadata !372}
!376 = metadata !{i32 48, i32 0, metadata !189, metadata !372}
!377 = metadata !{i32 786688, metadata !14, metadata !"valid", metadata !5, i32 38, metadata !9, i32 0, metadata !372} ; [ DW_TAG_auto_variable ] [valid] [line 38]
!378 = metadata !{i32 49, i32 0, metadata !189, metadata !372}
!379 = metadata !{i32 786689, metadata !35, metadata !"data", metadata !5, i32 16777288, metadata !8, i32 0, metadata !380} ; [ DW_TAG_arg_variable ] [data] [line 72]
!380 = metadata !{i32 239, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !1, metadata !382, i32 239, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!382 = metadata !{i32 786443, metadata !1, metadata !105, i32 238, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!383 = metadata !{i32 72, i32 0, metadata !35, metadata !380}
!384 = metadata !{i32 786688, metadata !35, metadata !"counter", metadata !5, i32 75, metadata !9, i32 0, metadata !380} ; [ DW_TAG_auto_variable ] [counter] [line 75]
!385 = metadata !{i32 75, i32 0, metadata !35, metadata !380}
!386 = metadata !{i32 77, i32 0, metadata !35, metadata !380}
!387 = metadata !{i32 79, i32 0, metadata !210, metadata !380}
!388 = metadata !{i32 786688, metadata !35, metadata !"low", metadata !5, i32 74, metadata !9, i32 0, metadata !380} ; [ DW_TAG_auto_variable ] [low] [line 74]
!389 = metadata !{i32 80, i32 0, metadata !211, metadata !380}
!390 = metadata !{i32 83, i32 0, metadata !35, metadata !380}
!391 = metadata !{i32 241, i32 0, metadata !392, null}
!392 = metadata !{i32 786443, metadata !1, metadata !381, i32 240, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!393 = metadata !{i32 242, i32 0, metadata !394, null}
!394 = metadata !{i32 786443, metadata !1, metadata !392, i32 242, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!395 = metadata !{i32 244, i32 0, metadata !392, null}
!396 = metadata !{i32 245, i32 0, metadata !392, null}
!397 = metadata !{i32 247, i32 0, metadata !392, null}
!398 = metadata !{i32 248, i32 0, metadata !392, null}
!399 = metadata !{i32 249, i32 0, metadata !392, null}
!400 = metadata !{i32 250, i32 0, metadata !401, null}
!401 = metadata !{i32 786443, metadata !1, metadata !392, i32 250, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!402 = metadata !{i32 252, i32 0, metadata !403, null}
!403 = metadata !{i32 786443, metadata !1, metadata !401, i32 251, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!404 = metadata !{i32 253, i32 0, metadata !403, null}
!405 = metadata !{i32 254, i32 0, metadata !403, null}
!406 = metadata !{i32 257, i32 0, metadata !105, null}
!407 = metadata !{i32 258, i32 0, metadata !105, null}
!408 = metadata !{i32 259, i32 0, metadata !105, null}
!409 = metadata !{i32 262, i32 0, metadata !114, null}
!410 = metadata !{i32 272, i32 0, metadata !114, null}
!411 = metadata !{i32 273, i32 0, metadata !114, null}
!412 = metadata !{i32 274, i32 0, metadata !114, null}
!413 = metadata !{i32 275, i32 0, metadata !414, null}
!414 = metadata !{i32 786443, metadata !1, metadata !114, i32 275, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!415 = metadata !{i32 277, i32 0, metadata !416, null}
!416 = metadata !{i32 786443, metadata !1, metadata !417, i32 277, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!417 = metadata !{i32 786443, metadata !1, metadata !414, i32 276, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!418 = metadata !{i32 279, i32 0, metadata !419, null}
!419 = metadata !{i32 786443, metadata !1, metadata !416, i32 278, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!420 = metadata !{i32 786689, metadata !21, metadata !"data1", metadata !5, i32 16777271, metadata !8, i32 0, metadata !421} ; [ DW_TAG_arg_variable ] [data1] [line 55]
!421 = metadata !{i32 280, i32 0, metadata !419, null}
!422 = metadata !{i32 55, i32 0, metadata !21, metadata !421}
!423 = metadata !{i32 786689, metadata !21, metadata !"data2", metadata !5, i32 33554487, metadata !8, i32 0, metadata !421} ; [ DW_TAG_arg_variable ] [data2] [line 55]
!424 = metadata !{i32 57, i32 0, metadata !21, metadata !421}
!425 = metadata !{i32 786688, metadata !21, metadata !"counter", metadata !5, i32 57, metadata !9, i32 0, metadata !421} ; [ DW_TAG_auto_variable ] [counter] [line 57]
!426 = metadata !{i32 58, i32 0, metadata !21, metadata !421} ; [ DW_TAG_imported_module ]
!427 = metadata !{i32 60, i32 0, metadata !197, metadata !421}
!428 = metadata !{i32 61, i32 0, metadata !197, metadata !421}
!429 = metadata !{i32 68, i32 0, metadata !28, metadata !430}
!430 = metadata !{i32 281, i32 0, metadata !431, null}
!431 = metadata !{i32 786443, metadata !1, metadata !419, i32 281, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!432 = metadata !{i32 69, i32 0, metadata !28, metadata !430}
!433 = metadata !{i32 283, i32 0, metadata !434, null}
!434 = metadata !{i32 786443, metadata !1, metadata !431, i32 282, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!435 = metadata !{i32 284, i32 0, metadata !434, null}
!436 = metadata !{i32 285, i32 0, metadata !434, null}
!437 = metadata !{i32 286, i32 0, metadata !434, null}
!438 = metadata !{i32 287, i32 0, metadata !434, null}
!439 = metadata !{i32 290, i32 0, metadata !440, null}
!440 = metadata !{i32 786443, metadata !1, metadata !441, i32 290, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!441 = metadata !{i32 786443, metadata !1, metadata !431, i32 289, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!442 = metadata !{i32 291, i32 0, metadata !441, null}
!443 = metadata !{i32 293, i32 0, metadata !419, null}
!444 = metadata !{i32 296, i32 0, metadata !114, null}
!445 = metadata !{i32 297, i32 0, metadata !114, null}
!446 = metadata !{i32 298, i32 0, metadata !114, null}
!447 = metadata !{i32 299, i32 0, metadata !114, null}
!448 = metadata !{i32 301, i32 0, metadata !122, null}
!449 = metadata !{i32 303, i32 0, metadata !450, null}
!450 = metadata !{i32 786443, metadata !1, metadata !122, i32 303, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!451 = metadata !{i32 306, i32 0, metadata !122, null}
!452 = metadata !{i32 308, i32 0, metadata !122, null}
!453 = metadata !{i32 309, i32 0, metadata !122, null}
!454 = metadata !{i32 311, i32 0, metadata !127, null}
!455 = metadata !{i32 315, i32 0, metadata !127, null}
!456 = metadata !{i32 316, i32 0, metadata !127, null}
!457 = metadata !{i32 317, i32 0, metadata !127, null}
!458 = metadata !{i32 320, i32 0, metadata !133, null}
!459 = metadata !{i32 67, i32 0, metadata !28, metadata !460}
!460 = metadata !{i32 322, i32 0, metadata !133, null}
!461 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !460} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!462 = metadata !{i32 65, i32 0, metadata !28, metadata !460}
!463 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !460} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!464 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !460} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!465 = metadata !{i32 68, i32 0, metadata !28, metadata !460}
!466 = metadata !{i32 69, i32 0, metadata !28, metadata !460}
!467 = metadata !{i32 323, i32 0, metadata !133, null}
!468 = metadata !{i32 324, i32 0, metadata !133, null}
!469 = metadata !{i32 327, i32 0, metadata !139, null}
!470 = metadata !{i32 331, i32 0, metadata !139, null}
!471 = metadata !{i32 332, i32 0, metadata !139, null}
!472 = metadata !{i32 333, i32 0, metadata !139, null}
!473 = metadata !{i32 334, i32 0, metadata !139, null}
!474 = metadata !{i32 342, i32 0, metadata !147, null}
!475 = metadata !{i32 343, i32 0, metadata !147, null}
!476 = metadata !{i32 344, i32 0, metadata !147, null}
!477 = metadata !{i32 345, i32 0, metadata !147, null}
!478 = metadata !{i32 2}
!479 = metadata !{i32 349, i32 0, metadata !147, null}
!480 = metadata !{i32 786689, metadata !139, metadata !"row", metadata !5, i32 50331975, metadata !8, i32 0, metadata !481} ; [ DW_TAG_arg_variable ] [row] [line 327]
!481 = metadata !{i32 398, i32 0, metadata !482, null}
!482 = metadata !{i32 786443, metadata !1, metadata !483, i32 397, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!483 = metadata !{i32 786443, metadata !1, metadata !484, i32 396, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!484 = metadata !{i32 786443, metadata !1, metadata !485, i32 394, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!485 = metadata !{i32 786443, metadata !1, metadata !147, i32 352, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!486 = metadata !{i32 327, i32 0, metadata !139, metadata !481}
!487 = metadata !{i32 400, i32 0, metadata !482, null}
!488 = metadata !{i32 374, i32 0, metadata !485, null}
!489 = metadata !{i32 378, i32 0, metadata !485, null}
!490 = metadata !{i32 380, i32 0, metadata !485, null}
!491 = metadata !{i32 387, i32 0, metadata !485, null}
!492 = metadata !{i32 390, i32 0, metadata !485, null}
!493 = metadata !{i32 391, i32 0, metadata !485, null}
!494 = metadata !{i32 392, i32 0, metadata !485, null}
!495 = metadata !{i32 393, i32 0, metadata !485, null}
!496 = metadata !{i32 786689, metadata !133, metadata !"data", metadata !5, i32 16777536, metadata !8, i32 0, metadata !497} ; [ DW_TAG_arg_variable ] [data] [line 320]
!497 = metadata !{i32 395, i32 0, metadata !484, null}
!498 = metadata !{i32 320, i32 0, metadata !133, metadata !497}
!499 = metadata !{i32 786689, metadata !133, metadata !"play", metadata !5, i32 33554752, metadata !53, i32 0, metadata !497} ; [ DW_TAG_arg_variable ] [play] [line 320]
!500 = metadata !{i32 67, i32 0, metadata !28, metadata !501}
!501 = metadata !{i32 322, i32 0, metadata !133, metadata !497}
!502 = metadata !{i32 786689, metadata !28, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, metadata !501} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!503 = metadata !{i32 65, i32 0, metadata !28, metadata !501}
!504 = metadata !{i32 786689, metadata !28, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, metadata !501} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!505 = metadata !{i32 786688, metadata !28, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, metadata !501} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!506 = metadata !{i32 68, i32 0, metadata !28, metadata !501}
!507 = metadata !{i32 69, i32 0, metadata !28, metadata !501}
!508 = metadata !{i32 323, i32 0, metadata !133, metadata !497}
!509 = metadata !{i32 324, i32 0, metadata !133, metadata !497}
!510 = metadata !{i32 396, i32 0, metadata !483, null}
!511 = metadata !{i32 332, i32 0, metadata !139, metadata !481}
!512 = metadata !{i32 786689, metadata !139, metadata !"col", metadata !5, i32 67109191, metadata !8, i32 0, metadata !481} ; [ DW_TAG_arg_variable ] [col] [line 327]
!513 = metadata !{i32 331, i32 0, metadata !139, metadata !481}
!514 = metadata !{i32 333, i32 0, metadata !139, metadata !481}
!515 = metadata !{i32 401, i32 0, metadata !482, null}
!516 = metadata !{i32 402, i32 0, metadata !482, null}
!517 = metadata !{i32 403, i32 0, metadata !482, null}
!518 = metadata !{i32 406, i32 0, metadata !485, null}
!519 = metadata !{i32 407, i32 0, metadata !485, null}
!520 = metadata !{i32 426, i32 0, metadata !147, null}
