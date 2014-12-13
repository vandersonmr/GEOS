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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize readonly uwtable
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

; Function Attrs: minsize nounwind optsize readonly uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize readonly uwtable
define i32 @get_value(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !64), !dbg !240
  br label %1, !dbg !241

; <label>:1                                       ; preds = %1, %0
  %search.0.in = phi %struct._play** [ @game_tree, %0 ], [ %6, %1 ]
  %search.0 = load %struct._play** %search.0.in, align 8, !dbg !242
  %2 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 1, !dbg !241
  %3 = load i32** %2, align 8, !dbg !241, !tbaa !237
  %4 = tail call i32 @equal_data(i32* %3, i32* %data) #6, !dbg !241
  %5 = icmp eq i32 %4, 0, !dbg !241
  %6 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 3, !dbg !243
  br i1 %5, label %1, label %7, !dbg !241

; <label>:7                                       ; preds = %1
  %8 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 0, !dbg !244
  %9 = load i32* %8, align 4, !dbg !244, !tbaa !245
  ret i32 %9, !dbg !244
}

; Function Attrs: minsize nounwind optsize uwtable
define void @show_data(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !70), !dbg !246
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !71), !dbg !247
  %1 = load i32* @ncol, align 4, !dbg !248, !tbaa !170
  %2 = icmp eq i32 %1, 0, !dbg !248
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !248

.lr.ph:                                           ; preds = %0, %.backedge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.backedge ], [ 0, %0 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !248
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !249
  %4 = load i32* %3, align 4, !dbg !249, !tbaa !170
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %4) #5, !dbg !249
  %6 = load i32* @ncol, align 4, !dbg !251, !tbaa !170
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !251
  %8 = icmp eq i32 %7, %6, !dbg !251
  br i1 %8, label %.backedge, label %9, !dbg !251

; <label>:9                                       ; preds = %.lr.ph
  %10 = tail call i32 @putchar(i32 44) #5, !dbg !251
  %.pre = load i32* @ncol, align 4, !dbg !248, !tbaa !170
  br label %.backedge, !dbg !251

.backedge:                                        ; preds = %9, %.lr.ph
  %11 = phi i32 [ %.pre, %9 ], [ %6, %.lr.ph ]
  %12 = icmp eq i32 %7, %11, !dbg !248
  br i1 %12, label %._crit_edge, label %.lr.ph, !dbg !248

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !253
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize
declare i32 @putchar(i32) #2

; Function Attrs: minsize nounwind optsize uwtable
define void @show_move(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !74), !dbg !254
  %1 = tail call i32 @putchar(i32 40) #5, !dbg !255
  tail call void @show_data(i32* %data) #6, !dbg !256
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)), !dbg !257
  ret void, !dbg !258
}

; Function Attrs: minsize nounwind optsize uwtable
define void @show_list(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !77), !dbg !259
  %1 = icmp eq %struct._list* %list, null, !dbg !260
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !260

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct._list* [ %5, %.lr.ph ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.01, i64 0, i32 0, !dbg !261
  %3 = load i32** %2, align 8, !dbg !261, !tbaa !224
  tail call void @show_move(i32* %3) #6, !dbg !261
  %4 = getelementptr inbounds %struct._list* %.01, i64 0, i32 1, !dbg !263
  %5 = load %struct._list** %4, align 8, !dbg !263, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %5}, i64 0, metadata !77), !dbg !263
  %6 = icmp eq %struct._list* %5, null, !dbg !260
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !260

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !264
}

; Function Attrs: minsize nounwind optsize uwtable
define void @show_play(%struct._play* readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !80), !dbg !265
  %1 = icmp eq %struct._play* %play, null, !dbg !266
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !266

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.02 = phi %struct._play* [ %10, %.lr.ph ], [ %play, %0 ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str18, i64 0, i64 0)), !dbg !267
  %2 = getelementptr inbounds %struct._play* %.02, i64 0, i32 1, !dbg !269
  %3 = load i32** %2, align 8, !dbg !269, !tbaa !237
  tail call void @show_data(i32* %3) #6, !dbg !269
  %4 = getelementptr inbounds %struct._play* %.02, i64 0, i32 0, !dbg !270
  %5 = load i32* %4, align 4, !dbg !270, !tbaa !245
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i64 0, i64 0), i32 %5) #5, !dbg !270
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str19, i64 0, i64 0)), !dbg !271
  %7 = getelementptr inbounds %struct._play* %.02, i64 0, i32 2, !dbg !272
  %8 = load %struct._list** %7, align 8, !dbg !272, !tbaa !235
  tail call void @show_list(%struct._list* %8) #6, !dbg !272
  %9 = getelementptr inbounds %struct._play* %.02, i64 0, i32 3, !dbg !273
  %10 = load %struct._play** %9, align 8, !dbg !273, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %10}, i64 0, metadata !80), !dbg !273
  %11 = icmp eq %struct._play* %10, null, !dbg !266
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !266

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !274
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define i32 @in_wanted(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !83), !dbg !275
  %current.02 = load %struct._list** @wanted, align 8, !dbg !276
  %cond3 = icmp eq %struct._list* %current.02, null, !dbg !277
  br i1 %cond3, label %._crit_edge, label %.lr.ph, !dbg !277

; <label>:1                                       ; preds = %.lr.ph
  %2 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 1, !dbg !278
  %current.0 = load %struct._list** %2, align 8, !dbg !276
  %cond = icmp eq %struct._list* %current.0, null, !dbg !277
  br i1 %cond, label %._crit_edge, label %.lr.ph, !dbg !277

.lr.ph:                                           ; preds = %0, %1
  %current.04 = phi %struct._list* [ %current.0, %1 ], [ %current.02, %0 ]
  %3 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 0, !dbg !280
  %4 = load i32** %3, align 8, !dbg !280, !tbaa !224
  %5 = tail call i32 @equal_data(i32* %4, i32* %data) #6, !dbg !280
  %6 = icmp eq i32 %5, 0, !dbg !280
  br i1 %6, label %1, label %._crit_edge, !dbg !280

._crit_edge:                                      ; preds = %0, %1, %.lr.ph
  %merge = phi i32 [ 1, %.lr.ph ], [ 0, %1 ], [ 0, %0 ]
  ret i32 %merge, !dbg !282
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias i32* @make_data(i32 %row, i32 %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %row}, i64 0, metadata !89), !dbg !284
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !90), !dbg !284
  %1 = load i32* @ncol, align 4, !dbg !285, !tbaa !170
  %2 = sext i32 %1 to i64, !dbg !285
  %3 = shl nsw i64 %2, 2, !dbg !285
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !285
  %5 = bitcast i8* %4 to i32*, !dbg !285
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !92), !dbg !285
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !91), !dbg !286
  %6 = icmp eq i32 %col, 0, !dbg !286
  br i1 %6, label %.preheader, label %.lr.ph4, !dbg !286

.lr.ph4:                                          ; preds = %0
  %7 = load i32* @nrow, align 4, !dbg !288, !tbaa !170
  br label %10, !dbg !286

.preheader:                                       ; preds = %10, %0
  %count.0.lcssa = phi i32 [ 0, %0 ], [ %col, %10 ]
  %8 = icmp eq i32 %count.0.lcssa, %1, !dbg !289
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !289

.lr.ph:                                           ; preds = %.preheader
  %9 = sext i32 %count.0.lcssa to i64
  br label %12, !dbg !289

; <label>:10                                      ; preds = %.lr.ph4, %10
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %10 ]
  %11 = getelementptr inbounds i32* %5, i64 %indvars.iv5, !dbg !288
  store i32 %7, i32* %11, align 4, !dbg !288, !tbaa !170
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !286
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !91), !dbg !286
  %lftr.wideiv7 = trunc i64 %indvars.iv.next6 to i32, !dbg !286
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %col, !dbg !286
  br i1 %exitcond8, label %.preheader, label %10, !dbg !286

; <label>:12                                      ; preds = %.lr.ph, %12
  %indvars.iv = phi i64 [ %9, %.lr.ph ], [ %indvars.iv.next, %12 ]
  %13 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !291
  store i32 %row, i32* %13, align 4, !dbg !291, !tbaa !170
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !289
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !289
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !289
  br i1 %exitcond, label %._crit_edge, label %12, !dbg !289

._crit_edge:                                      ; preds = %12, %.preheader
  ret i32* %5, !dbg !292
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct._list* @make_list(i32* nocapture readonly %data, i32* nocapture %value, i32* nocapture %all) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !97), !dbg !293
  tail call void @llvm.dbg.value(metadata !{i32* %value}, i64 0, metadata !98), !dbg !293
  tail call void @llvm.dbg.value(metadata !{i32* %all}, i64 0, metadata !99), !dbg !293
  store i32 1, i32* %value, align 4, !dbg !294, !tbaa !170
  %1 = tail call noalias i8* @malloc(i64 16) #5, !dbg !295
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !103), !dbg !295
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !296
  %3 = bitcast i8* %2 to %struct._list**, !dbg !296
  store %struct._list* null, %struct._list** %3, align 8, !dbg !296, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !104), !dbg !297
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !100), !dbg !298
  %4 = load i32* @nrow, align 4, !dbg !298, !tbaa !170
  %5 = icmp eq i32 %4, 0, !dbg !298
  br i1 %5, label %.thread, label %.preheader.lr.ph, !dbg !298

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{%struct._list* %63}, i64 0, metadata !104), !dbg !300
  tail call void @free(i8* %1) #5, !dbg !301
  br label %62, !dbg !302

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !295
  %.pre8 = load i32* @ncol, align 4, !dbg !304, !tbaa !170
  br label %.preheader, !dbg !298

.preheader:                                       ; preds = %.preheader.lr.ph, %52
  %7 = phi i32 [ %4, %.preheader.lr.ph ], [ %53, %52 ]
  %8 = phi i32 [ %.pre8, %.preheader.lr.ph ], [ %54, %52 ], !dbg !304
  %current.06 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %52 ]
  %row.05 = phi i32 [ 0, %.preheader.lr.ph ], [ %55, %52 ]
  %9 = icmp eq i32 %8, 0, !dbg !304
  br i1 %9, label %52, label %.lr.ph, !dbg !304

.lr.ph:                                           ; preds = %.preheader, %47
  %current.13 = phi %struct._list* [ %current.2, %47 ], [ %current.06, %.preheader ]
  %row.12 = phi i32 [ %row.3, %47 ], [ %row.05, %.preheader ]
  %col.01 = phi i32 [ %49, %47 ], [ 0, %.preheader ]
  %10 = tail call i32* @make_data(i32 %row.12, i32 %col.01) #6, !dbg !307
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !102), !dbg !307
  tail call void @melt_data(i32* %10, i32* %data) #6, !dbg !309
  %11 = tail call i32 @equal_data(i32* %10, i32* %data) #6, !dbg !310
  %12 = icmp eq i32 %11, 0, !dbg !310
  br i1 %12, label %13, label %39, !dbg !310

; <label>:13                                      ; preds = %.lr.ph
  %14 = tail call noalias i8* @malloc(i64 16) #5, !dbg !312
  %15 = bitcast i8* %14 to %struct._list*, !dbg !312
  %16 = getelementptr inbounds %struct._list* %current.13, i64 0, i32 1, !dbg !312
  store %struct._list* %15, %struct._list** %16, align 8, !dbg !312, !tbaa !220
  %17 = tail call i32* @copy_data(i32* %10) #6, !dbg !314
  %18 = load %struct._list** %16, align 8, !dbg !314, !tbaa !220
  %19 = getelementptr inbounds %struct._list* %18, i64 0, i32 0, !dbg !314
  store i32* %17, i32** %19, align 8, !dbg !314, !tbaa !224
  %20 = getelementptr inbounds %struct._list* %18, i64 0, i32 1, !dbg !315
  store %struct._list* null, %struct._list** %20, align 8, !dbg !315, !tbaa !220
  %21 = load %struct._list** %16, align 8, !dbg !316, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %21}, i64 0, metadata !104), !dbg !316
  %22 = load i32* %value, align 4, !dbg !317, !tbaa !170
  %23 = icmp eq i32 %22, 1, !dbg !317
  br i1 %23, label %24, label %26, !dbg !317

; <label>:24                                      ; preds = %13
  %25 = tail call i32 @get_value(i32* %10) #6, !dbg !319
  store i32 %25, i32* %value, align 4, !dbg !319, !tbaa !170
  br label %26, !dbg !319

; <label>:26                                      ; preds = %24, %13
  %27 = phi i32 [ %25, %24 ], [ %22, %13 ]
  %28 = load i32* %all, align 4, !dbg !320, !tbaa !170
  %29 = or i32 %28, %27, !dbg !320
  %30 = icmp eq i32 %29, 0, !dbg !320
  br i1 %30, label %31, label %47, !dbg !320

; <label>:31                                      ; preds = %26
  %32 = load i32* @ncol, align 4, !dbg !322, !tbaa !170
  %33 = add nsw i32 %32, -1, !dbg !322
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !101), !dbg !322
  %34 = load i32* @nrow, align 4, !dbg !324, !tbaa !170
  %35 = add nsw i32 %34, -1, !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !100), !dbg !324
  %36 = tail call i32 @in_wanted(i32* %10) #6, !dbg !325
  %37 = icmp eq i32 %36, 0, !dbg !325
  br i1 %37, label %47, label %38, !dbg !325

; <label>:38                                      ; preds = %31
  store i32 2, i32* %all, align 4, !dbg !327, !tbaa !170
  br label %47, !dbg !327

; <label>:39                                      ; preds = %.lr.ph
  %40 = icmp eq i32 %col.01, 0, !dbg !328
  br i1 %40, label %41, label %44, !dbg !328

; <label>:41                                      ; preds = %39
  %42 = load i32* @nrow, align 4, !dbg !328, !tbaa !170
  %43 = add nsw i32 %42, -1, !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !100), !dbg !328
  br label %44, !dbg !328

; <label>:44                                      ; preds = %41, %39
  %row.2 = phi i32 [ %43, %41 ], [ %row.12, %39 ]
  %45 = load i32* @ncol, align 4, !dbg !331, !tbaa !170
  %46 = add nsw i32 %45, -1, !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !101), !dbg !331
  br label %47

; <label>:47                                      ; preds = %31, %26, %38, %44
  %col.1 = phi i32 [ %46, %44 ], [ %col.01, %26 ], [ %33, %38 ], [ %33, %31 ]
  %row.3 = phi i32 [ %row.2, %44 ], [ %row.12, %26 ], [ %35, %38 ], [ %35, %31 ]
  %current.2 = phi %struct._list* [ %current.13, %44 ], [ %21, %26 ], [ %21, %38 ], [ %21, %31 ]
  %48 = bitcast i32* %10 to i8*, !dbg !332
  tail call void @free(i8* %48) #5, !dbg !332
  %49 = add nsw i32 %col.1, 1, !dbg !304
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !101), !dbg !304
  %50 = load i32* @ncol, align 4, !dbg !304, !tbaa !170
  %51 = icmp eq i32 %49, %50, !dbg !304
  br i1 %51, label %._crit_edge, label %.lr.ph, !dbg !304

._crit_edge:                                      ; preds = %47
  %.pre9 = load i32* @nrow, align 4, !dbg !298, !tbaa !170
  br label %52, !dbg !304

; <label>:52                                      ; preds = %._crit_edge, %.preheader
  %53 = phi i32 [ %.pre9, %._crit_edge ], [ %7, %.preheader ], !dbg !298
  %54 = phi i32 [ %49, %._crit_edge ], [ 0, %.preheader ]
  %current.1.lcssa = phi %struct._list* [ %current.2, %._crit_edge ], [ %current.06, %.preheader ]
  %row.1.lcssa = phi i32 [ %row.3, %._crit_edge ], [ %row.05, %.preheader ]
  %55 = add nsw i32 %row.1.lcssa, 1, !dbg !298
  tail call void @llvm.dbg.value(metadata !{i32 %55}, i64 0, metadata !100), !dbg !298
  %56 = icmp eq i32 %55, %53, !dbg !298
  br i1 %56, label %57, label %.preheader, !dbg !298

; <label>:57                                      ; preds = %52
  %.pre = load %struct._list** %3, align 8, !dbg !300, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %63}, i64 0, metadata !104), !dbg !300
  tail call void @free(i8* %1) #5, !dbg !301
  %58 = icmp eq %struct._list* %.pre, null, !dbg !302
  br i1 %58, label %62, label %59, !dbg !302

; <label>:59                                      ; preds = %57
  %60 = load i32* %value, align 4, !dbg !302, !tbaa !170
  %61 = sub nsw i32 1, %60, !dbg !302
  store i32 %61, i32* %value, align 4, !dbg !302, !tbaa !170
  br label %62, !dbg !302

; <label>:62                                      ; preds = %.thread, %57, %59
  %63 = phi %struct._list* [ null, %.thread ], [ null, %57 ], [ %.pre, %59 ]
  ret %struct._list* %63, !dbg !333
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct._play* @make_play(i32 %all) #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata !{i32 %all}, i64 0, metadata !109), !dbg !334
  store i32 %all, i32* %1, align 4, !tbaa !170
  tail call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !109), !dbg !334
  tail call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !110), !dbg !335
  %2 = tail call noalias i8* @malloc(i64 32) #5, !dbg !336
  %3 = bitcast i8* %2 to %struct._play*, !dbg !336
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !112), !dbg !336
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !113), !dbg !337
  store %struct._play* null, %struct._play** @game_tree, align 8, !dbg !338, !tbaa !339
  %4 = tail call i32* @make_data(i32 0, i32 0) #6, !dbg !340
  tail call void @llvm.dbg.value(metadata !{i32* %4}, i64 0, metadata !111), !dbg !340
  %5 = load i32* %4, align 4, !dbg !341, !tbaa !170
  %6 = add nsw i32 %5, -1, !dbg !341
  store i32 %6, i32* %4, align 4, !dbg !341, !tbaa !170
  br label %.outer, !dbg !342

.outer:                                           ; preds = %33, %0
  %temp.0.ph = phi i32* [ %4, %0 ], [ %37, %33 ]
  %current.0.ph = phi %struct._play* [ %3, %0 ], [ %30, %33 ]
  br label %.outer1

.outer1:                                          ; preds = %.outer, %20
  %current.0.ph2 = phi %struct._play* [ %30, %20 ], [ %current.0.ph, %.outer ]
  br label %7

; <label>:7                                       ; preds = %.outer1, %10
  %8 = tail call i32 @next_data(i32* %temp.0.ph) #6, !dbg !342
  %9 = icmp eq i32 %8, 0, !dbg !342
  br i1 %9, label %38, label %10, !dbg !342

; <label>:10                                      ; preds = %7
  %11 = tail call i32 @valid_data(i32* %temp.0.ph) #6, !dbg !343
  %12 = icmp eq i32 %11, 0, !dbg !343
  br i1 %12, label %7, label %13, !dbg !343

; <label>:13                                      ; preds = %10
  %14 = tail call noalias i8* @malloc(i64 32) #5, !dbg !346
  %15 = bitcast i8* %14 to %struct._play*, !dbg !346
  %16 = getelementptr inbounds %struct._play* %current.0.ph2, i64 0, i32 3, !dbg !346
  store %struct._play* %15, %struct._play** %16, align 8, !dbg !346, !tbaa !232
  %17 = load %struct._play** @game_tree, align 8, !dbg !348, !tbaa !339
  %18 = icmp eq %struct._play* %17, null, !dbg !348
  br i1 %18, label %19, label %20, !dbg !348

; <label>:19                                      ; preds = %13
  store %struct._play* %15, %struct._play** @game_tree, align 8, !dbg !348, !tbaa !339
  br label %20, !dbg !348

; <label>:20                                      ; preds = %19, %13
  %21 = tail call i32* @copy_data(i32* %temp.0.ph) #6, !dbg !350
  %22 = load %struct._play** %16, align 8, !dbg !350, !tbaa !232
  %23 = getelementptr inbounds %struct._play* %22, i64 0, i32 1, !dbg !350
  store i32* %21, i32** %23, align 8, !dbg !350, !tbaa !237
  %24 = call %struct._list* @make_list(i32* %temp.0.ph, i32* %val, i32* %1) #6, !dbg !351
  %25 = load %struct._play** %16, align 8, !dbg !351, !tbaa !232
  %26 = getelementptr inbounds %struct._play* %25, i64 0, i32 2, !dbg !351
  store %struct._list* %24, %struct._list** %26, align 8, !dbg !351, !tbaa !235
  tail call void @llvm.dbg.value(metadata !{i32* %val}, i64 0, metadata !110), !dbg !352
  %27 = load i32* %val, align 4, !dbg !352, !tbaa !170
  %28 = getelementptr inbounds %struct._play* %25, i64 0, i32 0, !dbg !352
  store i32 %27, i32* %28, align 4, !dbg !352, !tbaa !245
  %29 = getelementptr inbounds %struct._play* %25, i64 0, i32 3, !dbg !353
  store %struct._play* null, %struct._play** %29, align 8, !dbg !353, !tbaa !232
  %30 = load %struct._play** %16, align 8, !dbg !354, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %30}, i64 0, metadata !113), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !109), !dbg !355
  %31 = load i32* %1, align 4, !dbg !355, !tbaa !170
  %32 = icmp eq i32 %31, 2, !dbg !355
  br i1 %32, label %33, label %.outer1, !dbg !355

; <label>:33                                      ; preds = %20
  %34 = bitcast i32* %temp.0.ph to i8*, !dbg !357
  tail call void @free(i8* %34) #5, !dbg !357
  %35 = load i32* @nrow, align 4, !dbg !359, !tbaa !170
  %36 = load i32* @ncol, align 4, !dbg !359, !tbaa !170
  %37 = tail call i32* @make_data(i32 %35, i32 %36) #6, !dbg !359
  tail call void @llvm.dbg.value(metadata !{i32* %37}, i64 0, metadata !111), !dbg !359
  br label %.outer, !dbg !360

; <label>:38                                      ; preds = %7
  %39 = getelementptr inbounds i8* %2, i64 24, !dbg !361
  %40 = bitcast i8* %39 to %struct._play**, !dbg !361
  %41 = load %struct._play** %40, align 8, !dbg !361, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %41}, i64 0, metadata !113), !dbg !361
  tail call void @free(i8* %2) #5, !dbg !362
  ret %struct._play* %41, !dbg !363
}

; Function Attrs: minsize nounwind optsize uwtable
define void @make_wanted(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !116), !dbg !364
  %1 = tail call noalias i8* @malloc(i64 16) #5, !dbg !365
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !120), !dbg !365
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !366
  %3 = bitcast i8* %2 to %struct._list**, !dbg !366
  store %struct._list* null, %struct._list** %3, align 8, !dbg !366, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !121), !dbg !367
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !117), !dbg !368
  %4 = load i32* @nrow, align 4, !dbg !368, !tbaa !170
  %5 = icmp eq i32 %4, 0, !dbg !368
  br i1 %5, label %40, label %.preheader.lr.ph, !dbg !368

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !365
  %.pre8 = load i32* @ncol, align 4, !dbg !370, !tbaa !170
  br label %.preheader, !dbg !368

.preheader:                                       ; preds = %.preheader.lr.ph, %35
  %7 = phi i32 [ %4, %.preheader.lr.ph ], [ %36, %35 ]
  %8 = phi i32 [ %.pre8, %.preheader.lr.ph ], [ %37, %35 ], !dbg !370
  %current.06 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %35 ]
  %row.05 = phi i32 [ 0, %.preheader.lr.ph ], [ %38, %35 ]
  %9 = icmp eq i32 %8, 0, !dbg !370
  br i1 %9, label %35, label %.lr.ph, !dbg !370

.lr.ph:                                           ; preds = %.preheader, %30
  %current.13 = phi %struct._list* [ %current.2, %30 ], [ %current.06, %.preheader ]
  %row.12 = phi i32 [ %row.3, %30 ], [ %row.05, %.preheader ]
  %col.01 = phi i32 [ %32, %30 ], [ 0, %.preheader ]
  %10 = tail call i32* @make_data(i32 %row.12, i32 %col.01) #6, !dbg !373
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !119), !dbg !373
  tail call void @melt_data(i32* %10, i32* %data) #6, !dbg !375
  %11 = tail call i32 @equal_data(i32* %10, i32* %data) #6, !dbg !376
  %12 = icmp eq i32 %11, 0, !dbg !376
  br i1 %12, label %13, label %22, !dbg !376

; <label>:13                                      ; preds = %.lr.ph
  %14 = tail call noalias i8* @malloc(i64 16) #5, !dbg !378
  %15 = bitcast i8* %14 to %struct._list*, !dbg !378
  %16 = getelementptr inbounds %struct._list* %current.13, i64 0, i32 1, !dbg !378
  store %struct._list* %15, %struct._list** %16, align 8, !dbg !378, !tbaa !220
  %17 = tail call i32* @copy_data(i32* %10) #6, !dbg !380
  %18 = load %struct._list** %16, align 8, !dbg !380, !tbaa !220
  %19 = getelementptr inbounds %struct._list* %18, i64 0, i32 0, !dbg !380
  store i32* %17, i32** %19, align 8, !dbg !380, !tbaa !224
  %20 = getelementptr inbounds %struct._list* %18, i64 0, i32 1, !dbg !381
  store %struct._list* null, %struct._list** %20, align 8, !dbg !381, !tbaa !220
  %21 = load %struct._list** %16, align 8, !dbg !382, !tbaa !220
  tail call void @llvm.dbg.value(metadata !{%struct._list* %21}, i64 0, metadata !121), !dbg !382
  br label %30, !dbg !383

; <label>:22                                      ; preds = %.lr.ph
  %23 = icmp eq i32 %col.01, 0, !dbg !384
  br i1 %23, label %24, label %27, !dbg !384

; <label>:24                                      ; preds = %22
  %25 = load i32* @nrow, align 4, !dbg !384, !tbaa !170
  %26 = add nsw i32 %25, -1, !dbg !384
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !117), !dbg !384
  br label %27, !dbg !384

; <label>:27                                      ; preds = %24, %22
  %row.2 = phi i32 [ %26, %24 ], [ %row.12, %22 ]
  %28 = load i32* @ncol, align 4, !dbg !387, !tbaa !170
  %29 = add nsw i32 %28, -1, !dbg !387
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !118), !dbg !387
  br label %30

; <label>:30                                      ; preds = %27, %13
  %col.1 = phi i32 [ %29, %27 ], [ %col.01, %13 ]
  %row.3 = phi i32 [ %row.2, %27 ], [ %row.12, %13 ]
  %current.2 = phi %struct._list* [ %current.13, %27 ], [ %21, %13 ]
  %31 = bitcast i32* %10 to i8*, !dbg !388
  tail call void @free(i8* %31) #5, !dbg !388
  %32 = add nsw i32 %col.1, 1, !dbg !370
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !118), !dbg !370
  %33 = load i32* @ncol, align 4, !dbg !370, !tbaa !170
  %34 = icmp eq i32 %32, %33, !dbg !370
  br i1 %34, label %._crit_edge, label %.lr.ph, !dbg !370

._crit_edge:                                      ; preds = %30
  %.pre9 = load i32* @nrow, align 4, !dbg !368, !tbaa !170
  br label %35, !dbg !370

; <label>:35                                      ; preds = %._crit_edge, %.preheader
  %36 = phi i32 [ %.pre9, %._crit_edge ], [ %7, %.preheader ], !dbg !368
  %37 = phi i32 [ %32, %._crit_edge ], [ 0, %.preheader ]
  %current.1.lcssa = phi %struct._list* [ %current.2, %._crit_edge ], [ %current.06, %.preheader ]
  %row.1.lcssa = phi i32 [ %row.3, %._crit_edge ], [ %row.05, %.preheader ]
  %38 = add nsw i32 %row.1.lcssa, 1, !dbg !368
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !117), !dbg !368
  %39 = icmp eq i32 %38, %36, !dbg !368
  br i1 %39, label %._crit_edge7, label %.preheader, !dbg !368

._crit_edge7:                                     ; preds = %35
  %.pre = load %struct._list** %3, align 8, !dbg !389, !tbaa !220
  br label %40, !dbg !368

; <label>:40                                      ; preds = %._crit_edge7, %0
  %41 = phi %struct._list* [ %.pre, %._crit_edge7 ], [ null, %0 ]
  tail call void @llvm.dbg.value(metadata !{%struct._list* %41}, i64 0, metadata !121), !dbg !389
  tail call void @free(i8* %1) #5, !dbg !390
  store %struct._list* %41, %struct._list** @wanted, align 8, !dbg !391, !tbaa !339
  ret void, !dbg !392
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias i32* @get_good_move(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !126), !dbg !393
  %1 = icmp eq %struct._list* %list, null, !dbg !394
  br i1 %1, label %9, label %.preheader, !dbg !394

.preheader:                                       ; preds = %0, %5
  %.0 = phi %struct._list* [ %3, %5 ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.0, i64 0, i32 1, !dbg !396
  %3 = load %struct._list** %2, align 8, !dbg !396, !tbaa !220
  %4 = icmp eq %struct._list* %3, null, !dbg !396
  %.phi.trans.insert = getelementptr inbounds %struct._list* %.0, i64 0, i32 0
  %.pre = load i32** %.phi.trans.insert, align 8, !dbg !397, !tbaa !224
  br i1 %4, label %.critedge, label %5, !dbg !396

; <label>:5                                       ; preds = %.preheader
  %6 = tail call i32 @get_value(i32* %.pre) #6, !dbg !396
  %7 = icmp eq i32 %6, 0, !dbg !396
  br i1 %7, label %.critedge, label %.preheader

.critedge:                                        ; preds = %.preheader, %5
  %8 = tail call i32* @copy_data(i32* %.pre) #6, !dbg !397
  br label %9, !dbg !397

; <label>:9                                       ; preds = %0, %.critedge
  %.01 = phi i32* [ %8, %.critedge ], [ null, %0 ]
  ret i32* %.01, !dbg !398
}

; Function Attrs: minsize nounwind optsize uwtable
define noalias i32* @get_winning_move(%struct._play* nocapture readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !131), !dbg !399
  br label %1, !dbg !400

; <label>:1                                       ; preds = %1, %0
  %.0 = phi %struct._play* [ %play, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct._play* %.0, i64 0, i32 3, !dbg !400
  %3 = load %struct._play** %2, align 8, !dbg !400, !tbaa !232
  %4 = icmp eq %struct._play* %3, null, !dbg !400
  br i1 %4, label %5, label %1, !dbg !400

; <label>:5                                       ; preds = %1
  %6 = getelementptr inbounds %struct._play* %.0, i64 0, i32 2, !dbg !401
  %7 = load %struct._list** %6, align 8, !dbg !401, !tbaa !235
  %8 = tail call i32* @get_good_move(%struct._list* %7) #6, !dbg !401
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !132), !dbg !401
  ret i32* %8, !dbg !402
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define %struct._list* @where(i32* nocapture readonly %data, %struct._play* nocapture readonly %play) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !137), !dbg !403
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !138), !dbg !403
  %1 = getelementptr inbounds %struct._play* %play, i64 0, i32 1, !dbg !404
  %2 = load i32** %1, align 8, !dbg !404, !tbaa !237
  %3 = tail call i32 @equal_data(i32* %2, i32* %data) #6, !dbg !404
  %4 = icmp eq i32 %3, 0, !dbg !404
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !404

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct._play* [ %6, %.lr.ph ], [ %play, %0 ]
  %5 = getelementptr inbounds %struct._play* %.01, i64 0, i32 3, !dbg !405
  %6 = load %struct._play** %5, align 8, !dbg !405, !tbaa !232
  tail call void @llvm.dbg.value(metadata !{%struct._play* %6}, i64 0, metadata !138), !dbg !405
  %7 = getelementptr inbounds %struct._play* %6, i64 0, i32 1, !dbg !404
  %8 = load i32** %7, align 8, !dbg !404, !tbaa !237
  %9 = tail call i32 @equal_data(i32* %8, i32* %data) #6, !dbg !404
  %10 = icmp eq i32 %9, 0, !dbg !404
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !404

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.0.lcssa = phi %struct._play* [ %play, %0 ], [ %6, %.lr.ph ]
  %11 = getelementptr inbounds %struct._play* %.0.lcssa, i64 0, i32 2, !dbg !406
  %12 = load %struct._list** %11, align 8, !dbg !406, !tbaa !235
  ret %struct._list* %12, !dbg !406
}

; Function Attrs: minsize nounwind optsize uwtable
define void @get_real_move(i32* nocapture readonly %data1, i32* nocapture readonly %data2, i32* nocapture %row, i32* nocapture %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !143), !dbg !407
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !144), !dbg !407
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !145), !dbg !407
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !146), !dbg !407
  br label %1, !dbg !408

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %1 ], [ 0, %0 ]
  %2 = trunc i64 %indvars.iv to i32, !dbg !409
  store i32 %2, i32* %col, align 4, !dbg !409, !tbaa !170
  %3 = getelementptr inbounds i32* %data1, i64 %indvars.iv, !dbg !408
  %4 = load i32* %3, align 4, !dbg !408, !tbaa !170
  %5 = getelementptr inbounds i32* %data2, i64 %indvars.iv, !dbg !408
  %6 = load i32* %5, align 4, !dbg !408, !tbaa !170
  %7 = icmp eq i32 %4, %6, !dbg !408
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !408
  br i1 %7, label %1, label %8, !dbg !408

; <label>:8                                       ; preds = %1
  store i32 %4, i32* %row, align 4, !dbg !410, !tbaa !170
  ret void, !dbg !411
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  tail call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !151), !dbg !412
  tail call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !152), !dbg !412
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str20, i64 0, i64 0)), !dbg !413
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str21, i64 0, i64 0)), !dbg !414
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str22, i64 0, i64 0)), !dbg !415
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0)) #5, !dbg !416
  tail call void @llvm.dbg.value(metadata !417, i64 0, metadata !151), !dbg !418
  store i32 2, i32* %row, align 4, !dbg !418, !tbaa !170
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i64 0, i64 0)) #5, !dbg !419
  store i32 7, i32* @ncol, align 4, !dbg !421, !tbaa !170
  %3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i64 0, i64 0)) #5, !dbg !422
  store i32 8, i32* @nrow, align 4, !dbg !423, !tbaa !170
  %4 = tail call %struct._play* @make_play(i32 1) #6, !dbg !424
  tail call void @llvm.dbg.value(metadata !{%struct._play* %4}, i64 0, metadata !158), !dbg !424
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !154), !dbg !425
  %5 = load i32* @nrow, align 4, !dbg !426, !tbaa !170
  %6 = load i32* @ncol, align 4, !dbg !426, !tbaa !170
  %7 = tail call i32* @make_data(i32 %5, i32 %6) #6, !dbg !426
  tail call void @llvm.dbg.value(metadata !{i32* %7}, i64 0, metadata !156), !dbg !426
  br label %.outer, !dbg !427

.outer:                                           ; preds = %14, %0
  %current.0.ph = phi i32* [ %7, %0 ], [ %12, %14 ]
  %player.0.ph = phi i32 [ 0, %0 ], [ %18, %14 ]
  br label %8

; <label>:8                                       ; preds = %.outer, %10
  %current.0 = phi i32* [ null, %10 ], [ %current.0.ph, %.outer ]
  %9 = icmp eq i32* %current.0, null, !dbg !427
  br i1 %9, label %20, label %10, !dbg !427

; <label>:10                                      ; preds = %8
  %11 = tail call %struct._list* @where(i32* %current.0, %struct._play* %4) #6, !dbg !428
  %12 = tail call i32* @get_good_move(%struct._list* %11) #6, !dbg !428
  tail call void @llvm.dbg.value(metadata !{i32* %12}, i64 0, metadata !157), !dbg !428
  %13 = icmp eq i32* %12, null, !dbg !430
  br i1 %13, label %8, label %14, !dbg !430

; <label>:14                                      ; preds = %10
  call void @get_real_move(i32* %12, i32* %current.0, i32* %row, i32* %col) #6, !dbg !432
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !151), !dbg !434
  %15 = load i32* %row, align 4, !dbg !434, !tbaa !170
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !152), !dbg !434
  %16 = load i32* %col, align 4, !dbg !434, !tbaa !170
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i64 0, i64 0), i32 %player.0.ph, i32 %15, i32 %16) #5, !dbg !434
  %18 = sub nsw i32 1, %player.0.ph, !dbg !435
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !154), !dbg !435
  %19 = bitcast i32* %current.0 to i8*, !dbg !436
  tail call void @free(i8* %19) #5, !dbg !436
  br label %.outer, !dbg !437

; <label>:20                                      ; preds = %8
  tail call void @dump_play(%struct._play* %4) #6, !dbg !438
  %21 = sub nsw i32 1, %player.0.ph, !dbg !439
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str16, i64 0, i64 0), i32 %21) #5, !dbg !439
  ret i32 0, !dbg !440
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { minsize nounwind optsize }
attributes #6 = { minsize optsize }

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
!241 = metadata !{i32 112, i32 0, metadata !62, null}
!242 = metadata !{i32 111, i32 0, metadata !62, null}
!243 = metadata !{i32 113, i32 0, metadata !62, null}
!244 = metadata !{i32 114, i32 0, metadata !62, null}
!245 = metadata !{metadata !233, metadata !171, i64 0}
!246 = metadata !{i32 117, i32 0, metadata !66, null}
!247 = metadata !{i32 119, i32 0, metadata !66, null}
!248 = metadata !{i32 120, i32 0, metadata !66, null}
!249 = metadata !{i32 122, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !66, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!251 = metadata !{i32 123, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !250, i32 123, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!253 = metadata !{i32 125, i32 0, metadata !66, null}
!254 = metadata !{i32 127, i32 0, metadata !72, null}
!255 = metadata !{i32 129, i32 0, metadata !72, null}
!256 = metadata !{i32 130, i32 0, metadata !72, null}
!257 = metadata !{i32 131, i32 0, metadata !72, null}
!258 = metadata !{i32 132, i32 0, metadata !72, null}
!259 = metadata !{i32 134, i32 0, metadata !75, null}
!260 = metadata !{i32 136, i32 0, metadata !75, null}
!261 = metadata !{i32 138, i32 0, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !75, i32 137, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!263 = metadata !{i32 139, i32 0, metadata !262, null}
!264 = metadata !{i32 141, i32 0, metadata !75, null}
!265 = metadata !{i32 143, i32 0, metadata !78, null}
!266 = metadata !{i32 145, i32 0, metadata !78, null}
!267 = metadata !{i32 147, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !78, i32 146, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!269 = metadata !{i32 148, i32 0, metadata !268, null}
!270 = metadata !{i32 149, i32 0, metadata !268, null}
!271 = metadata !{i32 150, i32 0, metadata !268, null}
!272 = metadata !{i32 151, i32 0, metadata !268, null}
!273 = metadata !{i32 152, i32 0, metadata !268, null}
!274 = metadata !{i32 154, i32 0, metadata !78, null}
!275 = metadata !{i32 156, i32 0, metadata !81, null}
!276 = metadata !{i32 159, i32 0, metadata !81, null}
!277 = metadata !{i32 160, i32 0, metadata !81, null}
!278 = metadata !{i32 163, i32 0, metadata !279, null}
!279 = metadata !{i32 786443, metadata !1, metadata !81, i32 161, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!280 = metadata !{i32 162, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !1, metadata !279, i32 162, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!282 = metadata !{i32 165, i32 0, metadata !283, null}
!283 = metadata !{i32 786443, metadata !1, metadata !81, i32 165, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!284 = metadata !{i32 169, i32 0, metadata !85, null}
!285 = metadata !{i32 173, i32 0, metadata !85, null}
!286 = metadata !{i32 174, i32 0, metadata !287, null}
!287 = metadata !{i32 786443, metadata !1, metadata !85, i32 174, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!288 = metadata !{i32 175, i32 0, metadata !287, null}
!289 = metadata !{i32 176, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !85, i32 176, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!291 = metadata !{i32 177, i32 0, metadata !290, null}
!292 = metadata !{i32 178, i32 0, metadata !85, null}
!293 = metadata !{i32 181, i32 0, metadata !93, null}
!294 = metadata !{i32 187, i32 0, metadata !93, null}
!295 = metadata !{i32 188, i32 0, metadata !93, null}
!296 = metadata !{i32 189, i32 0, metadata !93, null}
!297 = metadata !{i32 190, i32 0, metadata !93, null}
!298 = metadata !{i32 191, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !93, i32 191, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!300 = metadata !{i32 221, i32 0, metadata !93, null}
!301 = metadata !{i32 222, i32 0, metadata !93, null}
!302 = metadata !{i32 223, i32 0, metadata !303, null}
!303 = metadata !{i32 786443, metadata !1, metadata !93, i32 223, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!304 = metadata !{i32 193, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !306, i32 193, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!306 = metadata !{i32 786443, metadata !1, metadata !299, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!307 = metadata !{i32 195, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !305, i32 194, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!309 = metadata !{i32 196, i32 0, metadata !308, null}
!310 = metadata !{i32 197, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !1, metadata !308, i32 197, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!312 = metadata !{i32 199, i32 0, metadata !313, null}
!313 = metadata !{i32 786443, metadata !1, metadata !311, i32 198, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!314 = metadata !{i32 200, i32 0, metadata !313, null}
!315 = metadata !{i32 201, i32 0, metadata !313, null}
!316 = metadata !{i32 202, i32 0, metadata !313, null}
!317 = metadata !{i32 203, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !313, i32 203, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!319 = metadata !{i32 204, i32 0, metadata !318, null}
!320 = metadata !{i32 205, i32 0, metadata !321, null}
!321 = metadata !{i32 786443, metadata !1, metadata !313, i32 205, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!322 = metadata !{i32 207, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !1, metadata !321, i32 206, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!324 = metadata !{i32 208, i32 0, metadata !323, null}
!325 = metadata !{i32 209, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !323, i32 209, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!327 = metadata !{i32 210, i32 0, metadata !326, null}
!328 = metadata !{i32 215, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !330, i32 215, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!330 = metadata !{i32 786443, metadata !1, metadata !311, i32 214, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!331 = metadata !{i32 216, i32 0, metadata !330, null}
!332 = metadata !{i32 218, i32 0, metadata !308, null}
!333 = metadata !{i32 224, i32 0, metadata !93, null}
!334 = metadata !{i32 227, i32 0, metadata !105, null}
!335 = metadata !{i32 229, i32 0, metadata !105, null}
!336 = metadata !{i32 232, i32 0, metadata !105, null}
!337 = metadata !{i32 233, i32 0, metadata !105, null}
!338 = metadata !{i32 234, i32 0, metadata !105, null}
!339 = metadata !{metadata !222, metadata !222, i64 0}
!340 = metadata !{i32 235, i32 0, metadata !105, null}
!341 = metadata !{i32 236, i32 0, metadata !105, null}
!342 = metadata !{i32 237, i32 0, metadata !105, null}
!343 = metadata !{i32 239, i32 0, metadata !344, null}
!344 = metadata !{i32 786443, metadata !1, metadata !345, i32 239, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!345 = metadata !{i32 786443, metadata !1, metadata !105, i32 238, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!346 = metadata !{i32 241, i32 0, metadata !347, null}
!347 = metadata !{i32 786443, metadata !1, metadata !344, i32 240, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!348 = metadata !{i32 242, i32 0, metadata !349, null}
!349 = metadata !{i32 786443, metadata !1, metadata !347, i32 242, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!350 = metadata !{i32 244, i32 0, metadata !347, null}
!351 = metadata !{i32 245, i32 0, metadata !347, null}
!352 = metadata !{i32 247, i32 0, metadata !347, null}
!353 = metadata !{i32 248, i32 0, metadata !347, null}
!354 = metadata !{i32 249, i32 0, metadata !347, null}
!355 = metadata !{i32 250, i32 0, metadata !356, null}
!356 = metadata !{i32 786443, metadata !1, metadata !347, i32 250, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!357 = metadata !{i32 252, i32 0, metadata !358, null}
!358 = metadata !{i32 786443, metadata !1, metadata !356, i32 251, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!359 = metadata !{i32 253, i32 0, metadata !358, null}
!360 = metadata !{i32 254, i32 0, metadata !358, null}
!361 = metadata !{i32 257, i32 0, metadata !105, null}
!362 = metadata !{i32 258, i32 0, metadata !105, null}
!363 = metadata !{i32 259, i32 0, metadata !105, null}
!364 = metadata !{i32 262, i32 0, metadata !114, null}
!365 = metadata !{i32 272, i32 0, metadata !114, null}
!366 = metadata !{i32 273, i32 0, metadata !114, null}
!367 = metadata !{i32 274, i32 0, metadata !114, null}
!368 = metadata !{i32 275, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !114, i32 275, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!370 = metadata !{i32 277, i32 0, metadata !371, null}
!371 = metadata !{i32 786443, metadata !1, metadata !372, i32 277, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!372 = metadata !{i32 786443, metadata !1, metadata !369, i32 276, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!373 = metadata !{i32 279, i32 0, metadata !374, null}
!374 = metadata !{i32 786443, metadata !1, metadata !371, i32 278, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!375 = metadata !{i32 280, i32 0, metadata !374, null}
!376 = metadata !{i32 281, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !374, i32 281, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!378 = metadata !{i32 283, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !377, i32 282, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!380 = metadata !{i32 284, i32 0, metadata !379, null}
!381 = metadata !{i32 285, i32 0, metadata !379, null}
!382 = metadata !{i32 286, i32 0, metadata !379, null}
!383 = metadata !{i32 287, i32 0, metadata !379, null}
!384 = metadata !{i32 290, i32 0, metadata !385, null}
!385 = metadata !{i32 786443, metadata !1, metadata !386, i32 290, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!386 = metadata !{i32 786443, metadata !1, metadata !377, i32 289, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!387 = metadata !{i32 291, i32 0, metadata !386, null}
!388 = metadata !{i32 293, i32 0, metadata !374, null}
!389 = metadata !{i32 296, i32 0, metadata !114, null}
!390 = metadata !{i32 297, i32 0, metadata !114, null}
!391 = metadata !{i32 298, i32 0, metadata !114, null}
!392 = metadata !{i32 299, i32 0, metadata !114, null}
!393 = metadata !{i32 301, i32 0, metadata !122, null}
!394 = metadata !{i32 303, i32 0, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !122, i32 303, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!396 = metadata !{i32 306, i32 0, metadata !122, null}
!397 = metadata !{i32 308, i32 0, metadata !122, null}
!398 = metadata !{i32 309, i32 0, metadata !122, null}
!399 = metadata !{i32 311, i32 0, metadata !127, null}
!400 = metadata !{i32 315, i32 0, metadata !127, null}
!401 = metadata !{i32 316, i32 0, metadata !127, null}
!402 = metadata !{i32 317, i32 0, metadata !127, null}
!403 = metadata !{i32 320, i32 0, metadata !133, null}
!404 = metadata !{i32 322, i32 0, metadata !133, null}
!405 = metadata !{i32 323, i32 0, metadata !133, null}
!406 = metadata !{i32 324, i32 0, metadata !133, null}
!407 = metadata !{i32 327, i32 0, metadata !139, null}
!408 = metadata !{i32 331, i32 0, metadata !139, null}
!409 = metadata !{i32 332, i32 0, metadata !139, null}
!410 = metadata !{i32 333, i32 0, metadata !139, null}
!411 = metadata !{i32 334, i32 0, metadata !139, null}
!412 = metadata !{i32 338, i32 0, metadata !147, null}
!413 = metadata !{i32 342, i32 0, metadata !147, null}
!414 = metadata !{i32 343, i32 0, metadata !147, null}
!415 = metadata !{i32 344, i32 0, metadata !147, null}
!416 = metadata !{i32 345, i32 0, metadata !147, null}
!417 = metadata !{i32 2}
!418 = metadata !{i32 349, i32 0, metadata !147, null}
!419 = metadata !{i32 374, i32 0, metadata !420, null}
!420 = metadata !{i32 786443, metadata !1, metadata !147, i32 352, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!421 = metadata !{i32 378, i32 0, metadata !420, null}
!422 = metadata !{i32 380, i32 0, metadata !420, null}
!423 = metadata !{i32 387, i32 0, metadata !420, null}
!424 = metadata !{i32 390, i32 0, metadata !420, null}
!425 = metadata !{i32 391, i32 0, metadata !420, null}
!426 = metadata !{i32 392, i32 0, metadata !420, null}
!427 = metadata !{i32 393, i32 0, metadata !420, null}
!428 = metadata !{i32 395, i32 0, metadata !429, null}
!429 = metadata !{i32 786443, metadata !1, metadata !420, i32 394, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!430 = metadata !{i32 396, i32 0, metadata !431, null}
!431 = metadata !{i32 786443, metadata !1, metadata !429, i32 396, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!432 = metadata !{i32 398, i32 0, metadata !433, null}
!433 = metadata !{i32 786443, metadata !1, metadata !431, i32 397, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!434 = metadata !{i32 400, i32 0, metadata !433, null}
!435 = metadata !{i32 401, i32 0, metadata !433, null}
!436 = metadata !{i32 402, i32 0, metadata !433, null}
!437 = metadata !{i32 403, i32 0, metadata !433, null}
!438 = metadata !{i32 406, i32 0, metadata !420, null}
!439 = metadata !{i32 407, i32 0, metadata !420, null}
!440 = metadata !{i32 426, i32 0, metadata !147, null}
