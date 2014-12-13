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
@.str1 = private unnamed_addr constant [3 x i8] c")\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"For state :\0A\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"  value = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"We get, in order :\0A\00", align 1
@wanted = common global %struct._list* null, align 8
@.str5 = private unnamed_addr constant [34 x i8] c"Mode : 1 -> multiple first moves\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"       2 -> report game\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"       3 -> good positions\0A\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c" Selection : \00", align 1
@.str9 = private unnamed_addr constant [33 x i8] c"Enter number of Columns       : \00", align 1
@.str10 = private unnamed_addr constant [32 x i8] c"Enter Initial number of Rows : \00", align 1
@.str11 = private unnamed_addr constant [32 x i8] c"Enter Maximum number of Rows : \00", align 1
@.str12 = private unnamed_addr constant [55 x i8] c"The winning initial move for %d x %d CHOMP is (%d,%d)\0A\00", align 1
@.str13 = private unnamed_addr constant [27 x i8] c"Enter number of Columns : \00", align 1
@.str14 = private unnamed_addr constant [27 x i8] c"Enter number of Rows    : \00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"player %d plays at (%d,%d)\0A\00", align 1
@.str16 = private unnamed_addr constant [17 x i8] c"player %d loses\0A\00", align 1
@.str17 = private unnamed_addr constant [55 x i8] c"ATTENTION : representation is as in a _data structure\0A\00", align 1
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
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !176
  %5 = bitcast i8* %4 to i32*, !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !12), !dbg !176
  %6 = load i32* @ncol, align 4, !dbg !181, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !13), !dbg !181
  %7 = icmp eq i32 %6, 0, !dbg !182
  br i1 %7, label %._crit_edge, label %.lr.ph, !dbg !182

.lr.ph:                                           ; preds = %0
  %8 = sext i32 %6 to i64
  br label %9, !dbg !182

; <label>:9                                       ; preds = %.lr.ph, %9
  %indvars.iv = phi i64 [ %8, %.lr.ph ], [ %indvars.iv.next, %9 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !182
  %10 = getelementptr inbounds i32* %data, i64 %indvars.iv.next, !dbg !183
  %11 = load i32* %10, align 4, !dbg !183, !tbaa !177
  %12 = getelementptr inbounds i32* %5, i64 %indvars.iv.next, !dbg !183
  store i32 %11, i32* %12, align 4, !dbg !183, !tbaa !177
  %13 = trunc i64 %indvars.iv.next to i32, !dbg !182
  %14 = icmp eq i32 %13, 0, !dbg !182
  br i1 %14, label %._crit_edge, label %9, !dbg !182

._crit_edge:                                      ; preds = %9, %0
  ret i32* %5, !dbg !184
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @next_data(i32* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !18), !dbg !185
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !19), !dbg !187
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !20), !dbg !188
  %1 = load i32* @ncol, align 4, !dbg !189, !tbaa !177
  %2 = icmp eq i32 %1, 0, !dbg !189
  br i1 %2, label %.critedge, label %.preheader, !dbg !189

.preheader:                                       ; preds = %0, %.outer
  %indvars.iv = phi i64 [ %indvars.iv.next, %.outer ], [ 0, %0 ]
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !190
  %4 = load i32* %3, align 4, !dbg !190, !tbaa !177
  %5 = load i32* @nrow, align 4, !dbg !190, !tbaa !177
  %6 = icmp eq i32 %4, %5, !dbg !190
  br i1 %6, label %.outer, label %..critedge_crit_edge, !dbg !190

.outer:                                           ; preds = %.preheader
  store i32 0, i32* %3, align 4, !dbg !193, !tbaa !177
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !189
  %7 = load i32* @ncol, align 4, !dbg !189, !tbaa !177
  %8 = trunc i64 %indvars.iv.next to i32, !dbg !189
  %9 = icmp eq i32 %8, %7, !dbg !189
  br i1 %9, label %.critedge, label %.preheader, !dbg !189

..critedge_crit_edge:                             ; preds = %.preheader
  %10 = add nsw i32 %4, 1, !dbg !195
  store i32 %10, i32* %3, align 4, !dbg !195, !tbaa !177
  tail call void @llvm.dbg.value(metadata !197, i64 0, metadata !20), !dbg !198
  br label %.critedge, !dbg !189

.critedge:                                        ; preds = %.outer, %0, %..critedge_crit_edge
  %valid.0.lcssa = phi i32 [ 1, %..critedge_crit_edge ], [ 0, %0 ], [ 0, %.outer ]
  ret i32 %valid.0.lcssa, !dbg !199
}

; Function Attrs: nounwind uwtable
define void @melt_data(i32* nocapture %data1, i32* nocapture readonly %data2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !25), !dbg !200
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !26), !dbg !200
  %1 = load i32* @ncol, align 4, !dbg !201, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !27), !dbg !201
  %2 = icmp eq i32 %1, 0, !dbg !202
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !202

.lr.ph:                                           ; preds = %0
  %3 = sext i32 %1 to i64
  br label %4, !dbg !202

; <label>:4                                       ; preds = %.lr.ph, %.backedge
  %indvars.iv = phi i64 [ %3, %.lr.ph ], [ %indvars.iv.next, %.backedge ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !202
  %5 = getelementptr inbounds i32* %data1, i64 %indvars.iv.next, !dbg !203
  %6 = load i32* %5, align 4, !dbg !203, !tbaa !177
  %7 = getelementptr inbounds i32* %data2, i64 %indvars.iv.next, !dbg !203
  %8 = load i32* %7, align 4, !dbg !203, !tbaa !177
  %9 = icmp sgt i32 %6, %8, !dbg !203
  br i1 %9, label %10, label %.backedge, !dbg !203

; <label>:10                                      ; preds = %4
  store i32 %8, i32* %5, align 4, !dbg !206, !tbaa !177
  br label %.backedge, !dbg !206

.backedge:                                        ; preds = %10, %4
  %11 = trunc i64 %indvars.iv.next to i32, !dbg !202
  %12 = icmp eq i32 %11, 0, !dbg !202
  br i1 %12, label %._crit_edge, label %4, !dbg !202

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !207
}

; Function Attrs: nounwind readonly uwtable
define i32 @equal_data(i32* nocapture readonly %data1, i32* nocapture readonly %data2) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !32), !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !33), !dbg !208
  %1 = load i32* @ncol, align 4, !dbg !209, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !34), !dbg !209
  %2 = sext i32 %1 to i64
  br label %3, !dbg !210

; <label>:3                                       ; preds = %7, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %7 ], [ %2, %0 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %4 = trunc i64 %indvars.iv to i32, !dbg !210
  %5 = icmp eq i32 %4, 0, !dbg !210
  %6 = trunc i64 %indvars.iv to i32, !dbg !210
  br i1 %5, label %.critedge, label %7, !dbg !210

; <label>:7                                       ; preds = %3
  %8 = getelementptr inbounds i32* %data1, i64 %indvars.iv.next, !dbg !210
  %9 = load i32* %8, align 4, !dbg !210, !tbaa !177
  %10 = getelementptr inbounds i32* %data2, i64 %indvars.iv.next, !dbg !210
  %11 = load i32* %10, align 4, !dbg !210, !tbaa !177
  %12 = icmp eq i32 %9, %11, !dbg !210
  br i1 %12, label %3, label %.critedge

.critedge:                                        ; preds = %3, %7
  %13 = icmp slt i32 %6, 1, !dbg !211
  %14 = zext i1 %13 to i32, !dbg !211
  ret i32 %14, !dbg !211
}

; Function Attrs: nounwind readonly uwtable
define i32 @valid_data(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !37), !dbg !212
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !39), !dbg !213
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !38), !dbg !214
  %1 = load i32* @ncol, align 4, !dbg !215, !tbaa !177
  %2 = icmp eq i32 %1, 0, !dbg !215
  br i1 %2, label %14, label %.lr.ph, !dbg !215

.lr.ph:                                           ; preds = %0
  %3 = load i32* @nrow, align 4, !dbg !214, !tbaa !177
  %4 = load i32* @ncol, align 4, !dbg !215, !tbaa !177
  br label %8, !dbg !215

; <label>:5                                       ; preds = %8
  %6 = trunc i64 %indvars.iv.next to i32, !dbg !215
  %7 = icmp eq i32 %6, %4, !dbg !215
  br i1 %7, label %._crit_edge, label %8, !dbg !215

; <label>:8                                       ; preds = %.lr.ph, %5
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %5 ]
  %low.01 = phi i32 [ %3, %.lr.ph ], [ %10, %5 ]
  %9 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !216
  %10 = load i32* %9, align 4, !dbg !216, !tbaa !177
  %11 = icmp sgt i32 %10, %low.01, !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !38), !dbg !219
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !215
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !39), !dbg !220
  br i1 %11, label %._crit_edge3, label %5, !dbg !216

._crit_edge:                                      ; preds = %5
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !215
  br label %14, !dbg !215

._crit_edge3:                                     ; preds = %8
  %13 = trunc i64 %indvars.iv to i32, !dbg !216
  br label %14, !dbg !216

; <label>:14                                      ; preds = %._crit_edge3, %._crit_edge, %0
  %counter.0.lcssa = phi i32 [ %12, %._crit_edge ], [ %13, %._crit_edge3 ], [ 0, %0 ]
  %15 = load i32* @ncol, align 4, !dbg !221, !tbaa !177
  %16 = icmp eq i32 %counter.0.lcssa, %15, !dbg !221
  %17 = zext i1 %16 to i32, !dbg !221
  ret i32 %17, !dbg !221
}

; Function Attrs: nounwind uwtable
define void @dump_list(%struct._list* %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !49), !dbg !222
  %1 = icmp eq %struct._list* %list, null, !dbg !223
  br i1 %1, label %9, label %2, !dbg !223

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct._list* %list, i64 0, i32 1, !dbg !225
  %4 = load %struct._list** %3, align 8, !dbg !225, !tbaa !227
  tail call void @dump_list(%struct._list* %4), !dbg !225
  %5 = getelementptr inbounds %struct._list* %list, i64 0, i32 0, !dbg !230
  %6 = load i32** %5, align 8, !dbg !230, !tbaa !231
  %7 = bitcast i32* %6 to i8*, !dbg !230
  tail call void @free(i8* %7) #5, !dbg !230
  %8 = bitcast %struct._list* %list to i8*, !dbg !232
  tail call void @free(i8* %8) #5, !dbg !232
  ret void, !dbg !233

; <label>:9                                       ; preds = %0
  ret void, !dbg !233
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @dump_play(%struct._play* %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !61), !dbg !234
  %1 = icmp eq %struct._play* %play, null, !dbg !235
  br i1 %1, label %11, label %2, !dbg !235

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct._play* %play, i64 0, i32 3, !dbg !237
  %4 = load %struct._play** %3, align 8, !dbg !237, !tbaa !239
  tail call void @dump_play(%struct._play* %4), !dbg !237
  %5 = getelementptr inbounds %struct._play* %play, i64 0, i32 2, !dbg !241
  %6 = load %struct._list** %5, align 8, !dbg !241, !tbaa !242
  tail call void @dump_list(%struct._list* %6), !dbg !241
  %7 = getelementptr inbounds %struct._play* %play, i64 0, i32 1, !dbg !243
  %8 = load i32** %7, align 8, !dbg !243, !tbaa !244
  %9 = bitcast i32* %8 to i8*, !dbg !243
  tail call void @free(i8* %9) #5, !dbg !243
  %10 = bitcast %struct._play* %play to i8*, !dbg !245
  tail call void @free(i8* %10) #5, !dbg !245
  ret void, !dbg !246

; <label>:11                                      ; preds = %0
  ret void, !dbg !246
}

; Function Attrs: nounwind readonly uwtable
define i32 @get_value(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !64), !dbg !247
  br label %1, !dbg !248

; <label>:1                                       ; preds = %1, %0
  %search.0.in = phi %struct._play** [ @game_tree, %0 ], [ %6, %1 ]
  %search.0 = load %struct._play** %search.0.in, align 8, !dbg !249
  %2 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 1, !dbg !248
  %3 = load i32** %2, align 8, !dbg !248, !tbaa !244
  %4 = tail call i32 @equal_data(i32* %3, i32* %data), !dbg !248
  %5 = icmp eq i32 %4, 0, !dbg !248
  %6 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 3, !dbg !250
  br i1 %5, label %1, label %7, !dbg !248

; <label>:7                                       ; preds = %1
  %8 = getelementptr inbounds %struct._play* %search.0, i64 0, i32 0, !dbg !251
  %9 = load i32* %8, align 4, !dbg !251, !tbaa !252
  ret i32 %9, !dbg !251
}

; Function Attrs: nounwind uwtable
define void @show_data(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !70), !dbg !253
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !71), !dbg !254
  %1 = load i32* @ncol, align 4, !dbg !255, !tbaa !177
  %2 = icmp eq i32 %1, 0, !dbg !255
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !255

.lr.ph:                                           ; preds = %0, %.backedge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.backedge ], [ 0, %0 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !255
  %3 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !256
  %4 = load i32* %3, align 4, !dbg !256, !tbaa !177
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %4) #5, !dbg !256
  %6 = load i32* @ncol, align 4, !dbg !258, !tbaa !177
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !258
  %8 = icmp eq i32 %7, %6, !dbg !258
  br i1 %8, label %.backedge, label %9, !dbg !258

; <label>:9                                       ; preds = %.lr.ph
  %10 = tail call i32 @putchar(i32 44), !dbg !258
  br label %.backedge, !dbg !258

.backedge:                                        ; preds = %9, %.lr.ph
  %11 = load i32* @ncol, align 4, !dbg !255, !tbaa !177
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !255
  %13 = icmp eq i32 %12, %11, !dbg !255
  br i1 %13, label %._crit_edge, label %.lr.ph, !dbg !255

._crit_edge:                                      ; preds = %.backedge, %0
  ret void, !dbg !260
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @putchar(i32 %__c) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %__c}, i64 0, metadata !166), !dbg !261
  %1 = load %struct._IO_FILE** @stdout, align 8, !dbg !262, !tbaa !264
  %2 = tail call i32 @_IO_putc(i32 %__c, %struct._IO_FILE* %1) #5, !dbg !262
  ret i32 %2, !dbg !262
}

; Function Attrs: nounwind uwtable
define void @show_move(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !74), !dbg !265
  %1 = tail call i32 @putchar(i32 40), !dbg !266
  tail call void @show_data(i32* %data), !dbg !267
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)), !dbg !268
  ret void, !dbg !269
}

; Function Attrs: nounwind uwtable
define void @show_list(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !77), !dbg !270
  %1 = icmp eq %struct._list* %list, null, !dbg !271
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !271

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct._list* [ %5, %.lr.ph ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.01, i64 0, i32 0, !dbg !272
  %3 = load i32** %2, align 8, !dbg !272, !tbaa !231
  tail call void @show_move(i32* %3), !dbg !272
  %4 = getelementptr inbounds %struct._list* %.01, i64 0, i32 1, !dbg !274
  %5 = load %struct._list** %4, align 8, !dbg !274, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %5}, i64 0, metadata !77), !dbg !274
  %6 = icmp eq %struct._list* %5, null, !dbg !271
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !271

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !275
}

; Function Attrs: nounwind uwtable
define void @show_play(%struct._play* readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !80), !dbg !276
  %1 = icmp eq %struct._play* %play, null, !dbg !277
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !277

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.02 = phi %struct._play* [ %10, %.lr.ph ], [ %play, %0 ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str18, i64 0, i64 0)), !dbg !278
  %2 = getelementptr inbounds %struct._play* %.02, i64 0, i32 1, !dbg !280
  %3 = load i32** %2, align 8, !dbg !280, !tbaa !244
  tail call void @show_data(i32* %3), !dbg !280
  %4 = getelementptr inbounds %struct._play* %.02, i64 0, i32 0, !dbg !281
  %5 = load i32* %4, align 4, !dbg !281, !tbaa !252
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i64 0, i64 0), i32 %5) #5, !dbg !281
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str19, i64 0, i64 0)), !dbg !282
  %7 = getelementptr inbounds %struct._play* %.02, i64 0, i32 2, !dbg !283
  %8 = load %struct._list** %7, align 8, !dbg !283, !tbaa !242
  tail call void @show_list(%struct._list* %8), !dbg !283
  %9 = getelementptr inbounds %struct._play* %.02, i64 0, i32 3, !dbg !284
  %10 = load %struct._play** %9, align 8, !dbg !284, !tbaa !239
  tail call void @llvm.dbg.value(metadata !{%struct._play* %10}, i64 0, metadata !80), !dbg !284
  %11 = icmp eq %struct._play* %10, null, !dbg !277
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !277

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !285
}

; Function Attrs: nounwind readonly uwtable
define i32 @in_wanted(i32* nocapture readonly %data) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !83), !dbg !286
  %current.02 = load %struct._list** @wanted, align 8, !dbg !287
  %cond3 = icmp eq %struct._list* %current.02, null, !dbg !288
  br i1 %cond3, label %._crit_edge, label %.lr.ph, !dbg !288

; <label>:1                                       ; preds = %.lr.ph
  %2 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 1, !dbg !289
  %current.0 = load %struct._list** %2, align 8, !dbg !287
  %cond = icmp eq %struct._list* %current.0, null, !dbg !288
  br i1 %cond, label %._crit_edge, label %.lr.ph, !dbg !288

.lr.ph:                                           ; preds = %0, %1
  %current.04 = phi %struct._list* [ %current.0, %1 ], [ %current.02, %0 ]
  %3 = getelementptr inbounds %struct._list* %current.04, i64 0, i32 0, !dbg !291
  %4 = load i32** %3, align 8, !dbg !291, !tbaa !231
  %5 = tail call i32 @equal_data(i32* %4, i32* %data), !dbg !291
  %6 = icmp eq i32 %5, 0, !dbg !291
  br i1 %6, label %1, label %._crit_edge, !dbg !291

._crit_edge:                                      ; preds = %0, %1, %.lr.ph
  %merge = phi i32 [ 1, %.lr.ph ], [ 0, %1 ], [ 0, %0 ]
  ret i32 %merge, !dbg !293
}

; Function Attrs: nounwind uwtable
define noalias i32* @make_data(i32 %row, i32 %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %row}, i64 0, metadata !89), !dbg !295
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !90), !dbg !295
  %1 = load i32* @ncol, align 4, !dbg !296, !tbaa !177
  %2 = sext i32 %1 to i64, !dbg !296
  %3 = shl nsw i64 %2, 2, !dbg !296
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !296
  %5 = bitcast i8* %4 to i32*, !dbg !296
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !92), !dbg !296
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !91), !dbg !297
  %6 = icmp eq i32 %col, 0, !dbg !297
  br i1 %6, label %.preheader, label %.lr.ph4, !dbg !297

.lr.ph4:                                          ; preds = %0
  %7 = load i32* @nrow, align 4, !dbg !299, !tbaa !177
  br label %12, !dbg !297

.preheader:                                       ; preds = %12, %0
  %count.0.lcssa = phi i32 [ 0, %0 ], [ %col, %12 ]
  %8 = load i32* @ncol, align 4, !dbg !300, !tbaa !177
  %9 = icmp eq i32 %count.0.lcssa, %8, !dbg !300
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !300

.lr.ph:                                           ; preds = %.preheader
  %10 = load i32* @ncol, align 4, !dbg !300, !tbaa !177
  %11 = sext i32 %count.0.lcssa to i64
  br label %14, !dbg !300

; <label>:12                                      ; preds = %.lr.ph4, %12
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %12 ]
  %13 = getelementptr inbounds i32* %5, i64 %indvars.iv5, !dbg !299
  store i32 %7, i32* %13, align 4, !dbg !299, !tbaa !177
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !297
  tail call void @llvm.dbg.value(metadata !{i32 %col}, i64 0, metadata !91), !dbg !297
  %lftr.wideiv7 = trunc i64 %indvars.iv.next6 to i32, !dbg !297
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %col, !dbg !297
  br i1 %exitcond8, label %.preheader, label %12, !dbg !297

; <label>:14                                      ; preds = %.lr.ph, %14
  %indvars.iv = phi i64 [ %11, %.lr.ph ], [ %indvars.iv.next, %14 ]
  %15 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !302
  store i32 %row, i32* %15, align 4, !dbg !302, !tbaa !177
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !300
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !300
  %exitcond = icmp eq i32 %lftr.wideiv, %10, !dbg !300
  br i1 %exitcond, label %._crit_edge, label %14, !dbg !300

._crit_edge:                                      ; preds = %14, %.preheader
  ret i32* %5, !dbg !303
}

; Function Attrs: nounwind uwtable
define %struct._list* @make_list(i32* nocapture readonly %data, i32* nocapture %value, i32* nocapture %all) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !97), !dbg !304
  tail call void @llvm.dbg.value(metadata !{i32* %value}, i64 0, metadata !98), !dbg !304
  tail call void @llvm.dbg.value(metadata !{i32* %all}, i64 0, metadata !99), !dbg !304
  store i32 1, i32* %value, align 4, !dbg !305, !tbaa !177
  %1 = tail call noalias i8* @malloc(i64 16) #5, !dbg !306
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !103), !dbg !306
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !307
  %3 = bitcast i8* %2 to %struct._list**, !dbg !307
  store %struct._list* null, %struct._list** %3, align 8, !dbg !307, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !104), !dbg !308
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !100), !dbg !309
  %4 = load i32* @nrow, align 4, !dbg !309, !tbaa !177
  %5 = icmp eq i32 %4, 0, !dbg !309
  br i1 %5, label %._crit_edge7.thread, label %.preheader.lr.ph, !dbg !309

._crit_edge7.thread:                              ; preds = %0
  tail call void @llvm.dbg.value(metadata !{%struct._list* %61}, i64 0, metadata !104), !dbg !311
  tail call void @free(i8* %1) #5, !dbg !312
  br label %60, !dbg !313

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !306
  br label %.preheader, !dbg !309

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %current.06 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %._crit_edge ]
  %row.05 = phi i32 [ 0, %.preheader.lr.ph ], [ %53, %._crit_edge ]
  %7 = load i32* @ncol, align 4, !dbg !315, !tbaa !177
  %8 = icmp eq i32 %7, 0, !dbg !315
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !315

.lr.ph:                                           ; preds = %.preheader, %48
  %current.13 = phi %struct._list* [ %current.2, %48 ], [ %current.06, %.preheader ]
  %row.12 = phi i32 [ %row.3, %48 ], [ %row.05, %.preheader ]
  %col.01 = phi i32 [ %50, %48 ], [ 0, %.preheader ]
  %9 = tail call i32* @make_data(i32 %row.12, i32 %col.01), !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32* %9}, i64 0, metadata !102), !dbg !318
  tail call void @melt_data(i32* %9, i32* %data), !dbg !320
  %10 = tail call i32 @equal_data(i32* %9, i32* %data), !dbg !321
  %11 = icmp eq i32 %10, 0, !dbg !321
  br i1 %11, label %12, label %40, !dbg !321

; <label>:12                                      ; preds = %.lr.ph
  %13 = tail call noalias i8* @malloc(i64 16) #5, !dbg !323
  %14 = bitcast i8* %13 to %struct._list*, !dbg !323
  %15 = getelementptr inbounds %struct._list* %current.13, i64 0, i32 1, !dbg !323
  store %struct._list* %14, %struct._list** %15, align 8, !dbg !323, !tbaa !227
  %16 = tail call i32* @copy_data(i32* %9), !dbg !325
  %17 = load %struct._list** %15, align 8, !dbg !325, !tbaa !227
  %18 = getelementptr inbounds %struct._list* %17, i64 0, i32 0, !dbg !325
  store i32* %16, i32** %18, align 8, !dbg !325, !tbaa !231
  %19 = load %struct._list** %15, align 8, !dbg !326, !tbaa !227
  %20 = getelementptr inbounds %struct._list* %19, i64 0, i32 1, !dbg !326
  store %struct._list* null, %struct._list** %20, align 8, !dbg !326, !tbaa !227
  %21 = load %struct._list** %15, align 8, !dbg !327, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %21}, i64 0, metadata !104), !dbg !327
  %22 = load i32* %value, align 4, !dbg !328, !tbaa !177
  %23 = icmp eq i32 %22, 1, !dbg !328
  br i1 %23, label %24, label %26, !dbg !328

; <label>:24                                      ; preds = %12
  %25 = tail call i32 @get_value(i32* %9), !dbg !330
  store i32 %25, i32* %value, align 4, !dbg !330, !tbaa !177
  br label %26, !dbg !330

; <label>:26                                      ; preds = %24, %12
  %27 = load i32* %all, align 4, !dbg !331, !tbaa !177
  %28 = icmp eq i32 %27, 0, !dbg !331
  br i1 %28, label %29, label %48, !dbg !331

; <label>:29                                      ; preds = %26
  %30 = load i32* %value, align 4, !dbg !331, !tbaa !177
  %31 = icmp eq i32 %30, 0, !dbg !331
  br i1 %31, label %32, label %48, !dbg !331

; <label>:32                                      ; preds = %29
  %33 = load i32* @ncol, align 4, !dbg !333, !tbaa !177
  %34 = add nsw i32 %33, -1, !dbg !333
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !101), !dbg !333
  %35 = load i32* @nrow, align 4, !dbg !335, !tbaa !177
  %36 = add nsw i32 %35, -1, !dbg !335
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !100), !dbg !335
  %37 = tail call i32 @in_wanted(i32* %9), !dbg !336
  %38 = icmp eq i32 %37, 0, !dbg !336
  br i1 %38, label %48, label %39, !dbg !336

; <label>:39                                      ; preds = %32
  store i32 2, i32* %all, align 4, !dbg !338, !tbaa !177
  br label %48, !dbg !338

; <label>:40                                      ; preds = %.lr.ph
  %41 = icmp eq i32 %col.01, 0, !dbg !339
  br i1 %41, label %42, label %45, !dbg !339

; <label>:42                                      ; preds = %40
  %43 = load i32* @nrow, align 4, !dbg !339, !tbaa !177
  %44 = add nsw i32 %43, -1, !dbg !339
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !100), !dbg !339
  br label %45, !dbg !339

; <label>:45                                      ; preds = %42, %40
  %row.2 = phi i32 [ %44, %42 ], [ %row.12, %40 ]
  %46 = load i32* @ncol, align 4, !dbg !342, !tbaa !177
  %47 = add nsw i32 %46, -1, !dbg !342
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !101), !dbg !342
  br label %48

; <label>:48                                      ; preds = %32, %26, %29, %39, %45
  %col.1 = phi i32 [ %47, %45 ], [ %col.01, %26 ], [ %34, %39 ], [ %34, %32 ], [ %col.01, %29 ]
  %row.3 = phi i32 [ %row.2, %45 ], [ %row.12, %26 ], [ %36, %39 ], [ %36, %32 ], [ %row.12, %29 ]
  %current.2 = phi %struct._list* [ %current.13, %45 ], [ %21, %26 ], [ %21, %39 ], [ %21, %32 ], [ %21, %29 ]
  %49 = bitcast i32* %9 to i8*, !dbg !343
  tail call void @free(i8* %49) #5, !dbg !343
  %50 = add nsw i32 %col.1, 1, !dbg !315
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !101), !dbg !315
  %51 = load i32* @ncol, align 4, !dbg !315, !tbaa !177
  %52 = icmp eq i32 %50, %51, !dbg !315
  br i1 %52, label %._crit_edge, label %.lr.ph, !dbg !315

._crit_edge:                                      ; preds = %48, %.preheader
  %current.1.lcssa = phi %struct._list* [ %current.06, %.preheader ], [ %current.2, %48 ]
  %row.1.lcssa = phi i32 [ %row.05, %.preheader ], [ %row.3, %48 ]
  %53 = add nsw i32 %row.1.lcssa, 1, !dbg !309
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !100), !dbg !309
  %54 = load i32* @nrow, align 4, !dbg !309, !tbaa !177
  %55 = icmp eq i32 %53, %54, !dbg !309
  br i1 %55, label %._crit_edge7, label %.preheader, !dbg !309

._crit_edge7:                                     ; preds = %._crit_edge
  %.pr = load %struct._list** %3, align 8, !dbg !311, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %61}, i64 0, metadata !104), !dbg !311
  tail call void @free(i8* %1) #5, !dbg !312
  %56 = icmp eq %struct._list* %.pr, null, !dbg !313
  br i1 %56, label %60, label %57, !dbg !313

; <label>:57                                      ; preds = %._crit_edge7
  %58 = load i32* %value, align 4, !dbg !313, !tbaa !177
  %59 = sub nsw i32 1, %58, !dbg !313
  store i32 %59, i32* %value, align 4, !dbg !313, !tbaa !177
  br label %60, !dbg !313

; <label>:60                                      ; preds = %._crit_edge7.thread, %._crit_edge7, %57
  %61 = phi %struct._list* [ null, %._crit_edge7.thread ], [ null, %._crit_edge7 ], [ %.pr, %57 ]
  ret %struct._list* %61, !dbg !344
}

; Function Attrs: nounwind uwtable
define %struct._play* @make_play(i32 %all) #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata !{i32 %all}, i64 0, metadata !109), !dbg !345
  store i32 %all, i32* %1, align 4, !tbaa !177
  tail call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !109), !dbg !345
  tail call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !110), !dbg !346
  %2 = tail call noalias i8* @malloc(i64 32) #5, !dbg !347
  %3 = bitcast i8* %2 to %struct._play*, !dbg !347
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !112), !dbg !347
  tail call void @llvm.dbg.value(metadata !{%struct._play* %3}, i64 0, metadata !113), !dbg !348
  store %struct._play* null, %struct._play** @game_tree, align 8, !dbg !349, !tbaa !264
  %4 = tail call i32* @make_data(i32 0, i32 0), !dbg !350
  tail call void @llvm.dbg.value(metadata !{i32* %4}, i64 0, metadata !111), !dbg !350
  %5 = load i32* %4, align 4, !dbg !351, !tbaa !177
  %6 = add nsw i32 %5, -1, !dbg !351
  store i32 %6, i32* %4, align 4, !dbg !351, !tbaa !177
  br label %.outer, !dbg !352

.outer:                                           ; preds = %35, %0
  %temp.0.ph = phi i32* [ %4, %0 ], [ %39, %35 ]
  %current.0.ph = phi %struct._play* [ %3, %0 ], [ %32, %35 ]
  br label %.outer1

.outer1:                                          ; preds = %.outer, %20
  %current.0.ph2 = phi %struct._play* [ %32, %20 ], [ %current.0.ph, %.outer ]
  br label %7

; <label>:7                                       ; preds = %.outer1, %10
  %8 = tail call i32 @next_data(i32* %temp.0.ph), !dbg !352
  %9 = icmp eq i32 %8, 0, !dbg !352
  br i1 %9, label %40, label %10, !dbg !352

; <label>:10                                      ; preds = %7
  %11 = tail call i32 @valid_data(i32* %temp.0.ph), !dbg !353
  %12 = icmp eq i32 %11, 0, !dbg !353
  br i1 %12, label %7, label %13, !dbg !353

; <label>:13                                      ; preds = %10
  %14 = tail call noalias i8* @malloc(i64 32) #5, !dbg !356
  %15 = bitcast i8* %14 to %struct._play*, !dbg !356
  %16 = getelementptr inbounds %struct._play* %current.0.ph2, i64 0, i32 3, !dbg !356
  store %struct._play* %15, %struct._play** %16, align 8, !dbg !356, !tbaa !239
  %17 = load %struct._play** @game_tree, align 8, !dbg !358, !tbaa !264
  %18 = icmp eq %struct._play* %17, null, !dbg !358
  br i1 %18, label %19, label %20, !dbg !358

; <label>:19                                      ; preds = %13
  store %struct._play* %15, %struct._play** @game_tree, align 8, !dbg !358, !tbaa !264
  br label %20, !dbg !358

; <label>:20                                      ; preds = %19, %13
  %21 = tail call i32* @copy_data(i32* %temp.0.ph), !dbg !360
  %22 = load %struct._play** %16, align 8, !dbg !360, !tbaa !239
  %23 = getelementptr inbounds %struct._play* %22, i64 0, i32 1, !dbg !360
  store i32* %21, i32** %23, align 8, !dbg !360, !tbaa !244
  %24 = call %struct._list* @make_list(i32* %temp.0.ph, i32* %val, i32* %1), !dbg !361
  %25 = load %struct._play** %16, align 8, !dbg !361, !tbaa !239
  %26 = getelementptr inbounds %struct._play* %25, i64 0, i32 2, !dbg !361
  store %struct._list* %24, %struct._list** %26, align 8, !dbg !361, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{i32* %val}, i64 0, metadata !110), !dbg !362
  %27 = load i32* %val, align 4, !dbg !362, !tbaa !177
  %28 = load %struct._play** %16, align 8, !dbg !362, !tbaa !239
  %29 = getelementptr inbounds %struct._play* %28, i64 0, i32 0, !dbg !362
  store i32 %27, i32* %29, align 4, !dbg !362, !tbaa !252
  %30 = load %struct._play** %16, align 8, !dbg !363, !tbaa !239
  %31 = getelementptr inbounds %struct._play* %30, i64 0, i32 3, !dbg !363
  store %struct._play* null, %struct._play** %31, align 8, !dbg !363, !tbaa !239
  %32 = load %struct._play** %16, align 8, !dbg !364, !tbaa !239
  tail call void @llvm.dbg.value(metadata !{%struct._play* %32}, i64 0, metadata !113), !dbg !364
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !109), !dbg !365
  %33 = load i32* %1, align 4, !dbg !365, !tbaa !177
  %34 = icmp eq i32 %33, 2, !dbg !365
  br i1 %34, label %35, label %.outer1, !dbg !365

; <label>:35                                      ; preds = %20
  %36 = bitcast i32* %temp.0.ph to i8*, !dbg !367
  tail call void @free(i8* %36) #5, !dbg !367
  %37 = load i32* @nrow, align 4, !dbg !369, !tbaa !177
  %38 = load i32* @ncol, align 4, !dbg !369, !tbaa !177
  %39 = tail call i32* @make_data(i32 %37, i32 %38), !dbg !369
  tail call void @llvm.dbg.value(metadata !{i32* %39}, i64 0, metadata !111), !dbg !369
  br label %.outer, !dbg !370

; <label>:40                                      ; preds = %7
  %41 = getelementptr inbounds i8* %2, i64 24, !dbg !371
  %42 = bitcast i8* %41 to %struct._play**, !dbg !371
  %43 = load %struct._play** %42, align 8, !dbg !371, !tbaa !239
  tail call void @llvm.dbg.value(metadata !{%struct._play* %43}, i64 0, metadata !113), !dbg !371
  tail call void @free(i8* %2) #5, !dbg !372
  ret %struct._play* %43, !dbg !373
}

; Function Attrs: nounwind uwtable
define void @make_wanted(i32* nocapture readonly %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !116), !dbg !374
  %1 = tail call noalias i8* @malloc(i64 16) #5, !dbg !375
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !120), !dbg !375
  %2 = getelementptr inbounds i8* %1, i64 8, !dbg !376
  %3 = bitcast i8* %2 to %struct._list**, !dbg !376
  store %struct._list* null, %struct._list** %3, align 8, !dbg !376, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %6}, i64 0, metadata !121), !dbg !377
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !117), !dbg !378
  %4 = load i32* @nrow, align 4, !dbg !378, !tbaa !177
  %5 = icmp eq i32 %4, 0, !dbg !378
  br i1 %5, label %._crit_edge7, label %.preheader.lr.ph, !dbg !378

.preheader.lr.ph:                                 ; preds = %0
  %6 = bitcast i8* %1 to %struct._list*, !dbg !375
  br label %.preheader, !dbg !378

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %current.06 = phi %struct._list* [ %6, %.preheader.lr.ph ], [ %current.1.lcssa, %._crit_edge ]
  %row.05 = phi i32 [ 0, %.preheader.lr.ph ], [ %35, %._crit_edge ]
  %7 = load i32* @ncol, align 4, !dbg !380, !tbaa !177
  %8 = icmp eq i32 %7, 0, !dbg !380
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !380

.lr.ph:                                           ; preds = %.preheader, %30
  %current.13 = phi %struct._list* [ %current.2, %30 ], [ %current.06, %.preheader ]
  %row.12 = phi i32 [ %row.3, %30 ], [ %row.05, %.preheader ]
  %col.01 = phi i32 [ %32, %30 ], [ 0, %.preheader ]
  %9 = tail call i32* @make_data(i32 %row.12, i32 %col.01), !dbg !383
  tail call void @llvm.dbg.value(metadata !{i32* %9}, i64 0, metadata !119), !dbg !383
  tail call void @melt_data(i32* %9, i32* %data), !dbg !385
  %10 = tail call i32 @equal_data(i32* %9, i32* %data), !dbg !386
  %11 = icmp eq i32 %10, 0, !dbg !386
  br i1 %11, label %12, label %22, !dbg !386

; <label>:12                                      ; preds = %.lr.ph
  %13 = tail call noalias i8* @malloc(i64 16) #5, !dbg !388
  %14 = bitcast i8* %13 to %struct._list*, !dbg !388
  %15 = getelementptr inbounds %struct._list* %current.13, i64 0, i32 1, !dbg !388
  store %struct._list* %14, %struct._list** %15, align 8, !dbg !388, !tbaa !227
  %16 = tail call i32* @copy_data(i32* %9), !dbg !390
  %17 = load %struct._list** %15, align 8, !dbg !390, !tbaa !227
  %18 = getelementptr inbounds %struct._list* %17, i64 0, i32 0, !dbg !390
  store i32* %16, i32** %18, align 8, !dbg !390, !tbaa !231
  %19 = load %struct._list** %15, align 8, !dbg !391, !tbaa !227
  %20 = getelementptr inbounds %struct._list* %19, i64 0, i32 1, !dbg !391
  store %struct._list* null, %struct._list** %20, align 8, !dbg !391, !tbaa !227
  %21 = load %struct._list** %15, align 8, !dbg !392, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %21}, i64 0, metadata !121), !dbg !392
  br label %30, !dbg !393

; <label>:22                                      ; preds = %.lr.ph
  %23 = icmp eq i32 %col.01, 0, !dbg !394
  br i1 %23, label %24, label %27, !dbg !394

; <label>:24                                      ; preds = %22
  %25 = load i32* @nrow, align 4, !dbg !394, !tbaa !177
  %26 = add nsw i32 %25, -1, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !117), !dbg !394
  br label %27, !dbg !394

; <label>:27                                      ; preds = %24, %22
  %row.2 = phi i32 [ %26, %24 ], [ %row.12, %22 ]
  %28 = load i32* @ncol, align 4, !dbg !397, !tbaa !177
  %29 = add nsw i32 %28, -1, !dbg !397
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !118), !dbg !397
  br label %30

; <label>:30                                      ; preds = %27, %12
  %col.1 = phi i32 [ %29, %27 ], [ %col.01, %12 ]
  %row.3 = phi i32 [ %row.2, %27 ], [ %row.12, %12 ]
  %current.2 = phi %struct._list* [ %current.13, %27 ], [ %21, %12 ]
  %31 = bitcast i32* %9 to i8*, !dbg !398
  tail call void @free(i8* %31) #5, !dbg !398
  %32 = add nsw i32 %col.1, 1, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !118), !dbg !380
  %33 = load i32* @ncol, align 4, !dbg !380, !tbaa !177
  %34 = icmp eq i32 %32, %33, !dbg !380
  br i1 %34, label %._crit_edge, label %.lr.ph, !dbg !380

._crit_edge:                                      ; preds = %30, %.preheader
  %current.1.lcssa = phi %struct._list* [ %current.06, %.preheader ], [ %current.2, %30 ]
  %row.1.lcssa = phi i32 [ %row.05, %.preheader ], [ %row.3, %30 ]
  %35 = add nsw i32 %row.1.lcssa, 1, !dbg !378
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !117), !dbg !378
  %36 = load i32* @nrow, align 4, !dbg !378, !tbaa !177
  %37 = icmp eq i32 %35, %36, !dbg !378
  br i1 %37, label %._crit_edge7, label %.preheader, !dbg !378

._crit_edge7:                                     ; preds = %._crit_edge, %0
  %38 = load %struct._list** %3, align 8, !dbg !399, !tbaa !227
  tail call void @llvm.dbg.value(metadata !{%struct._list* %38}, i64 0, metadata !121), !dbg !399
  tail call void @free(i8* %1) #5, !dbg !400
  store %struct._list* %38, %struct._list** @wanted, align 8, !dbg !401, !tbaa !264
  ret void, !dbg !402
}

; Function Attrs: nounwind uwtable
define noalias i32* @get_good_move(%struct._list* readonly %list) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._list* %list}, i64 0, metadata !126), !dbg !403
  %1 = icmp eq %struct._list* %list, null, !dbg !404
  br i1 %1, label %13, label %.preheader, !dbg !404

.preheader:                                       ; preds = %0, %5
  %.0 = phi %struct._list* [ %3, %5 ], [ %list, %0 ]
  %2 = getelementptr inbounds %struct._list* %.0, i64 0, i32 1, !dbg !406
  %3 = load %struct._list** %2, align 8, !dbg !406, !tbaa !227
  %4 = icmp eq %struct._list* %3, null, !dbg !406
  br i1 %4, label %.critedge, label %5, !dbg !406

; <label>:5                                       ; preds = %.preheader
  %6 = getelementptr inbounds %struct._list* %.0, i64 0, i32 0, !dbg !406
  %7 = load i32** %6, align 8, !dbg !406, !tbaa !231
  %8 = tail call i32 @get_value(i32* %7), !dbg !406
  %9 = icmp eq i32 %8, 0, !dbg !406
  br i1 %9, label %.critedge, label %.preheader

.critedge:                                        ; preds = %5, %.preheader
  %10 = getelementptr inbounds %struct._list* %.0, i64 0, i32 0, !dbg !407
  %11 = load i32** %10, align 8, !dbg !407, !tbaa !231
  %12 = tail call i32* @copy_data(i32* %11), !dbg !407
  br label %13, !dbg !407

; <label>:13                                      ; preds = %0, %.critedge
  %.01 = phi i32* [ %12, %.critedge ], [ null, %0 ]
  ret i32* %.01, !dbg !408
}

; Function Attrs: nounwind uwtable
define noalias i32* @get_winning_move(%struct._play* nocapture readonly %play) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !131), !dbg !409
  br label %1, !dbg !410

; <label>:1                                       ; preds = %1, %0
  %.0 = phi %struct._play* [ %play, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct._play* %.0, i64 0, i32 3, !dbg !410
  %3 = load %struct._play** %2, align 8, !dbg !410, !tbaa !239
  %4 = icmp eq %struct._play* %3, null, !dbg !410
  br i1 %4, label %5, label %1, !dbg !410

; <label>:5                                       ; preds = %1
  %6 = getelementptr inbounds %struct._play* %.0, i64 0, i32 2, !dbg !411
  %7 = load %struct._list** %6, align 8, !dbg !411, !tbaa !242
  %8 = tail call i32* @get_good_move(%struct._list* %7), !dbg !411
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !132), !dbg !411
  ret i32* %8, !dbg !412
}

; Function Attrs: nounwind readonly uwtable
define %struct._list* @where(i32* nocapture readonly %data, %struct._play* nocapture readonly %play) #3 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !137), !dbg !413
  tail call void @llvm.dbg.value(metadata !{%struct._play* %play}, i64 0, metadata !138), !dbg !413
  %1 = getelementptr inbounds %struct._play* %play, i64 0, i32 1, !dbg !414
  %2 = load i32** %1, align 8, !dbg !414, !tbaa !244
  %3 = tail call i32 @equal_data(i32* %2, i32* %data), !dbg !414
  %4 = icmp eq i32 %3, 0, !dbg !414
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !414

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct._play* [ %6, %.lr.ph ], [ %play, %0 ]
  %5 = getelementptr inbounds %struct._play* %.01, i64 0, i32 3, !dbg !415
  %6 = load %struct._play** %5, align 8, !dbg !415, !tbaa !239
  tail call void @llvm.dbg.value(metadata !{%struct._play* %6}, i64 0, metadata !138), !dbg !415
  %7 = getelementptr inbounds %struct._play* %6, i64 0, i32 1, !dbg !414
  %8 = load i32** %7, align 8, !dbg !414, !tbaa !244
  %9 = tail call i32 @equal_data(i32* %8, i32* %data), !dbg !414
  %10 = icmp eq i32 %9, 0, !dbg !414
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !414

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.0.lcssa = phi %struct._play* [ %play, %0 ], [ %6, %.lr.ph ]
  %11 = getelementptr inbounds %struct._play* %.0.lcssa, i64 0, i32 2, !dbg !416
  %12 = load %struct._list** %11, align 8, !dbg !416, !tbaa !242
  ret %struct._list* %12, !dbg !416
}

; Function Attrs: nounwind uwtable
define void @get_real_move(i32* nocapture readonly %data1, i32* nocapture readonly %data2, i32* nocapture %row, i32* nocapture %col) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %data1}, i64 0, metadata !143), !dbg !417
  tail call void @llvm.dbg.value(metadata !{i32* %data2}, i64 0, metadata !144), !dbg !417
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !145), !dbg !417
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !146), !dbg !417
  br label %1, !dbg !418

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %1 ], [ 0, %0 ]
  %2 = trunc i64 %indvars.iv to i32, !dbg !419
  store i32 %2, i32* %col, align 4, !dbg !419, !tbaa !177
  %3 = getelementptr inbounds i32* %data1, i64 %indvars.iv, !dbg !418
  %4 = load i32* %3, align 4, !dbg !418, !tbaa !177
  %5 = getelementptr inbounds i32* %data2, i64 %indvars.iv, !dbg !418
  %6 = load i32* %5, align 4, !dbg !418, !tbaa !177
  %7 = icmp eq i32 %4, %6, !dbg !418
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !418
  br i1 %7, label %1, label %8, !dbg !418

; <label>:8                                       ; preds = %1
  store i32 %4, i32* %row, align 4, !dbg !420, !tbaa !177
  ret void, !dbg !421
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  tail call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !151), !dbg !422
  tail call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !152), !dbg !422
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str20, i64 0, i64 0)), !dbg !423
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str21, i64 0, i64 0)), !dbg !424
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str22, i64 0, i64 0)), !dbg !425
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0)) #5, !dbg !426
  tail call void @llvm.dbg.value(metadata !427, i64 0, metadata !151), !dbg !428
  store i32 2, i32* %row, align 4, !dbg !428, !tbaa !177
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i64 0, i64 0)) #5, !dbg !429
  store i32 7, i32* @ncol, align 4, !dbg !431, !tbaa !177
  %3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i64 0, i64 0)) #5, !dbg !432
  store i32 8, i32* @nrow, align 4, !dbg !433, !tbaa !177
  %4 = tail call %struct._play* @make_play(i32 1), !dbg !434
  tail call void @llvm.dbg.value(metadata !{%struct._play* %4}, i64 0, metadata !158), !dbg !434
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !154), !dbg !435
  %5 = load i32* @nrow, align 4, !dbg !436, !tbaa !177
  %6 = load i32* @ncol, align 4, !dbg !436, !tbaa !177
  %7 = tail call i32* @make_data(i32 %5, i32 %6), !dbg !436
  tail call void @llvm.dbg.value(metadata !{i32* %7}, i64 0, metadata !156), !dbg !436
  br label %.outer, !dbg !437

.outer:                                           ; preds = %14, %0
  %current.0.ph = phi i32* [ %7, %0 ], [ %12, %14 ]
  %player.0.ph = phi i32 [ 0, %0 ], [ %18, %14 ]
  br label %8

; <label>:8                                       ; preds = %.outer, %10
  %current.0 = phi i32* [ null, %10 ], [ %current.0.ph, %.outer ]
  %9 = icmp eq i32* %current.0, null, !dbg !437
  br i1 %9, label %20, label %10, !dbg !437

; <label>:10                                      ; preds = %8
  %11 = tail call %struct._list* @where(i32* %current.0, %struct._play* %4), !dbg !438
  %12 = tail call i32* @get_good_move(%struct._list* %11), !dbg !438
  tail call void @llvm.dbg.value(metadata !{i32* %12}, i64 0, metadata !157), !dbg !438
  %13 = icmp eq i32* %12, null, !dbg !440
  br i1 %13, label %8, label %14, !dbg !440

; <label>:14                                      ; preds = %10
  call void @get_real_move(i32* %12, i32* %current.0, i32* %row, i32* %col), !dbg !442
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !151), !dbg !444
  %15 = load i32* %row, align 4, !dbg !444, !tbaa !177
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !152), !dbg !444
  %16 = load i32* %col, align 4, !dbg !444, !tbaa !177
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i64 0, i64 0), i32 %player.0.ph, i32 %15, i32 %16) #5, !dbg !444
  %18 = sub nsw i32 1, %player.0.ph, !dbg !445
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !154), !dbg !445
  %19 = bitcast i32* %current.0 to i8*, !dbg !446
  tail call void @free(i8* %19) #5, !dbg !446
  br label %.outer, !dbg !447

; <label>:20                                      ; preds = %8
  tail call void @dump_play(%struct._play* %4), !dbg !448
  %21 = sub nsw i32 1, %player.0.ph, !dbg !449
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str16, i64 0, i64 0), i32 %21) #5, !dbg !449
  ret i32 0, !dbg !450
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

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
!160 = metadata !{i32 786478, metadata !161, metadata !162, metadata !"putchar", metadata !"putchar", metadata !"", i32 79, metadata !163, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @putchar, null, null, metadata !165, i32 80} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [putchar]
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
!184 = metadata !{i32 31, i32 0, metadata !4, null}
!185 = metadata !{i32 34, i32 0, metadata !14, null}
!186 = metadata !{i32 0}
!187 = metadata !{i32 37, i32 0, metadata !14, null}
!188 = metadata !{i32 38, i32 0, metadata !14, null}
!189 = metadata !{i32 39, i32 0, metadata !14, null}
!190 = metadata !{i32 41, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !192, i32 41, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!192 = metadata !{i32 786443, metadata !1, metadata !14, i32 40, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!193 = metadata !{i32 43, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !191, i32 42, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!195 = metadata !{i32 48, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !191, i32 47, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!197 = metadata !{i32 1}
!198 = metadata !{i32 49, i32 0, metadata !196, null}
!199 = metadata !{i32 52, i32 0, metadata !14, null}
!200 = metadata !{i32 55, i32 0, metadata !21, null}
!201 = metadata !{i32 57, i32 0, metadata !21, null}
!202 = metadata !{i32 58, i32 0, metadata !21, null} ; [ DW_TAG_imported_module ]
!203 = metadata !{i32 60, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !205, i32 60, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!205 = metadata !{i32 786443, metadata !1, metadata !21, i32 59, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!206 = metadata !{i32 61, i32 0, metadata !204, null}
!207 = metadata !{i32 63, i32 0, metadata !21, null}
!208 = metadata !{i32 65, i32 0, metadata !28, null}
!209 = metadata !{i32 67, i32 0, metadata !28, null}
!210 = metadata !{i32 68, i32 0, metadata !28, null}
!211 = metadata !{i32 69, i32 0, metadata !28, null}
!212 = metadata !{i32 72, i32 0, metadata !35, null}
!213 = metadata !{i32 75, i32 0, metadata !35, null}
!214 = metadata !{i32 76, i32 0, metadata !35, null}
!215 = metadata !{i32 77, i32 0, metadata !35, null}
!216 = metadata !{i32 79, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !218, i32 79, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!218 = metadata !{i32 786443, metadata !1, metadata !35, i32 78, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!219 = metadata !{i32 80, i32 0, metadata !218, null}
!220 = metadata !{i32 81, i32 0, metadata !218, null}
!221 = metadata !{i32 83, i32 0, metadata !35, null}
!222 = metadata !{i32 86, i32 0, metadata !40, null}
!223 = metadata !{i32 88, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !40, i32 88, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!225 = metadata !{i32 90, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !224, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!227 = metadata !{metadata !228, metadata !229, i64 8}
!228 = metadata !{metadata !"_list", metadata !229, i64 0, metadata !229, i64 8}
!229 = metadata !{metadata !"any pointer", metadata !179, i64 0}
!230 = metadata !{i32 91, i32 0, metadata !226, null}
!231 = metadata !{metadata !228, metadata !229, i64 0}
!232 = metadata !{i32 92, i32 0, metadata !226, null}
!233 = metadata !{i32 94, i32 0, metadata !40, null}
!234 = metadata !{i32 97, i32 0, metadata !50, null}
!235 = metadata !{i32 99, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !50, i32 99, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!237 = metadata !{i32 101, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !236, i32 100, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!239 = metadata !{metadata !240, metadata !229, i64 24}
!240 = metadata !{metadata !"_play", metadata !178, i64 0, metadata !229, i64 8, metadata !229, i64 16, metadata !229, i64 24}
!241 = metadata !{i32 102, i32 0, metadata !238, null}
!242 = metadata !{metadata !240, metadata !229, i64 16}
!243 = metadata !{i32 103, i32 0, metadata !238, null}
!244 = metadata !{metadata !240, metadata !229, i64 8}
!245 = metadata !{i32 104, i32 0, metadata !238, null}
!246 = metadata !{i32 106, i32 0, metadata !50, null}
!247 = metadata !{i32 108, i32 0, metadata !62, null}
!248 = metadata !{i32 112, i32 0, metadata !62, null}
!249 = metadata !{i32 111, i32 0, metadata !62, null}
!250 = metadata !{i32 113, i32 0, metadata !62, null}
!251 = metadata !{i32 114, i32 0, metadata !62, null}
!252 = metadata !{metadata !240, metadata !178, i64 0}
!253 = metadata !{i32 117, i32 0, metadata !66, null}
!254 = metadata !{i32 119, i32 0, metadata !66, null}
!255 = metadata !{i32 120, i32 0, metadata !66, null}
!256 = metadata !{i32 122, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !66, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!258 = metadata !{i32 123, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !257, i32 123, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!260 = metadata !{i32 125, i32 0, metadata !66, null}
!261 = metadata !{i32 79, i32 0, metadata !160, null}
!262 = metadata !{i32 81, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !161, metadata !160} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!264 = metadata !{metadata !229, metadata !229, i64 0}
!265 = metadata !{i32 127, i32 0, metadata !72, null}
!266 = metadata !{i32 129, i32 0, metadata !72, null}
!267 = metadata !{i32 130, i32 0, metadata !72, null}
!268 = metadata !{i32 131, i32 0, metadata !72, null}
!269 = metadata !{i32 132, i32 0, metadata !72, null}
!270 = metadata !{i32 134, i32 0, metadata !75, null}
!271 = metadata !{i32 136, i32 0, metadata !75, null}
!272 = metadata !{i32 138, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !75, i32 137, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!274 = metadata !{i32 139, i32 0, metadata !273, null}
!275 = metadata !{i32 141, i32 0, metadata !75, null}
!276 = metadata !{i32 143, i32 0, metadata !78, null}
!277 = metadata !{i32 145, i32 0, metadata !78, null}
!278 = metadata !{i32 147, i32 0, metadata !279, null}
!279 = metadata !{i32 786443, metadata !1, metadata !78, i32 146, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!280 = metadata !{i32 148, i32 0, metadata !279, null}
!281 = metadata !{i32 149, i32 0, metadata !279, null}
!282 = metadata !{i32 150, i32 0, metadata !279, null}
!283 = metadata !{i32 151, i32 0, metadata !279, null}
!284 = metadata !{i32 152, i32 0, metadata !279, null}
!285 = metadata !{i32 154, i32 0, metadata !78, null}
!286 = metadata !{i32 156, i32 0, metadata !81, null}
!287 = metadata !{i32 159, i32 0, metadata !81, null}
!288 = metadata !{i32 160, i32 0, metadata !81, null}
!289 = metadata !{i32 163, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !81, i32 161, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!291 = metadata !{i32 162, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !290, i32 162, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!293 = metadata !{i32 165, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !81, i32 165, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!295 = metadata !{i32 169, i32 0, metadata !85, null}
!296 = metadata !{i32 173, i32 0, metadata !85, null}
!297 = metadata !{i32 174, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !85, i32 174, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!299 = metadata !{i32 175, i32 0, metadata !298, null}
!300 = metadata !{i32 176, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !85, i32 176, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!302 = metadata !{i32 177, i32 0, metadata !301, null}
!303 = metadata !{i32 178, i32 0, metadata !85, null}
!304 = metadata !{i32 181, i32 0, metadata !93, null}
!305 = metadata !{i32 187, i32 0, metadata !93, null}
!306 = metadata !{i32 188, i32 0, metadata !93, null}
!307 = metadata !{i32 189, i32 0, metadata !93, null}
!308 = metadata !{i32 190, i32 0, metadata !93, null}
!309 = metadata !{i32 191, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !93, i32 191, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!311 = metadata !{i32 221, i32 0, metadata !93, null}
!312 = metadata !{i32 222, i32 0, metadata !93, null}
!313 = metadata !{i32 223, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !93, i32 223, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!315 = metadata !{i32 193, i32 0, metadata !316, null}
!316 = metadata !{i32 786443, metadata !1, metadata !317, i32 193, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!317 = metadata !{i32 786443, metadata !1, metadata !310, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!318 = metadata !{i32 195, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !316, i32 194, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!320 = metadata !{i32 196, i32 0, metadata !319, null}
!321 = metadata !{i32 197, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !319, i32 197, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!323 = metadata !{i32 199, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !322, i32 198, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!325 = metadata !{i32 200, i32 0, metadata !324, null}
!326 = metadata !{i32 201, i32 0, metadata !324, null}
!327 = metadata !{i32 202, i32 0, metadata !324, null}
!328 = metadata !{i32 203, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !324, i32 203, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!330 = metadata !{i32 204, i32 0, metadata !329, null}
!331 = metadata !{i32 205, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !324, i32 205, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!333 = metadata !{i32 207, i32 0, metadata !334, null}
!334 = metadata !{i32 786443, metadata !1, metadata !332, i32 206, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!335 = metadata !{i32 208, i32 0, metadata !334, null}
!336 = metadata !{i32 209, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !1, metadata !334, i32 209, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!338 = metadata !{i32 210, i32 0, metadata !337, null}
!339 = metadata !{i32 215, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !341, i32 215, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!341 = metadata !{i32 786443, metadata !1, metadata !322, i32 214, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!342 = metadata !{i32 216, i32 0, metadata !341, null}
!343 = metadata !{i32 218, i32 0, metadata !319, null}
!344 = metadata !{i32 224, i32 0, metadata !93, null}
!345 = metadata !{i32 227, i32 0, metadata !105, null}
!346 = metadata !{i32 229, i32 0, metadata !105, null}
!347 = metadata !{i32 232, i32 0, metadata !105, null}
!348 = metadata !{i32 233, i32 0, metadata !105, null}
!349 = metadata !{i32 234, i32 0, metadata !105, null}
!350 = metadata !{i32 235, i32 0, metadata !105, null}
!351 = metadata !{i32 236, i32 0, metadata !105, null}
!352 = metadata !{i32 237, i32 0, metadata !105, null}
!353 = metadata !{i32 239, i32 0, metadata !354, null}
!354 = metadata !{i32 786443, metadata !1, metadata !355, i32 239, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!355 = metadata !{i32 786443, metadata !1, metadata !105, i32 238, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!356 = metadata !{i32 241, i32 0, metadata !357, null}
!357 = metadata !{i32 786443, metadata !1, metadata !354, i32 240, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!358 = metadata !{i32 242, i32 0, metadata !359, null}
!359 = metadata !{i32 786443, metadata !1, metadata !357, i32 242, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!360 = metadata !{i32 244, i32 0, metadata !357, null}
!361 = metadata !{i32 245, i32 0, metadata !357, null}
!362 = metadata !{i32 247, i32 0, metadata !357, null}
!363 = metadata !{i32 248, i32 0, metadata !357, null}
!364 = metadata !{i32 249, i32 0, metadata !357, null}
!365 = metadata !{i32 250, i32 0, metadata !366, null}
!366 = metadata !{i32 786443, metadata !1, metadata !357, i32 250, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!367 = metadata !{i32 252, i32 0, metadata !368, null}
!368 = metadata !{i32 786443, metadata !1, metadata !366, i32 251, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!369 = metadata !{i32 253, i32 0, metadata !368, null}
!370 = metadata !{i32 254, i32 0, metadata !368, null}
!371 = metadata !{i32 257, i32 0, metadata !105, null}
!372 = metadata !{i32 258, i32 0, metadata !105, null}
!373 = metadata !{i32 259, i32 0, metadata !105, null}
!374 = metadata !{i32 262, i32 0, metadata !114, null}
!375 = metadata !{i32 272, i32 0, metadata !114, null}
!376 = metadata !{i32 273, i32 0, metadata !114, null}
!377 = metadata !{i32 274, i32 0, metadata !114, null}
!378 = metadata !{i32 275, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !114, i32 275, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!380 = metadata !{i32 277, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !1, metadata !382, i32 277, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!382 = metadata !{i32 786443, metadata !1, metadata !379, i32 276, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!383 = metadata !{i32 279, i32 0, metadata !384, null}
!384 = metadata !{i32 786443, metadata !1, metadata !381, i32 278, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!385 = metadata !{i32 280, i32 0, metadata !384, null}
!386 = metadata !{i32 281, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !384, i32 281, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!388 = metadata !{i32 283, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !387, i32 282, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!390 = metadata !{i32 284, i32 0, metadata !389, null}
!391 = metadata !{i32 285, i32 0, metadata !389, null}
!392 = metadata !{i32 286, i32 0, metadata !389, null}
!393 = metadata !{i32 287, i32 0, metadata !389, null}
!394 = metadata !{i32 290, i32 0, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !396, i32 290, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!396 = metadata !{i32 786443, metadata !1, metadata !387, i32 289, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!397 = metadata !{i32 291, i32 0, metadata !396, null}
!398 = metadata !{i32 293, i32 0, metadata !384, null}
!399 = metadata !{i32 296, i32 0, metadata !114, null}
!400 = metadata !{i32 297, i32 0, metadata !114, null}
!401 = metadata !{i32 298, i32 0, metadata !114, null}
!402 = metadata !{i32 299, i32 0, metadata !114, null}
!403 = metadata !{i32 301, i32 0, metadata !122, null}
!404 = metadata !{i32 303, i32 0, metadata !405, null}
!405 = metadata !{i32 786443, metadata !1, metadata !122, i32 303, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!406 = metadata !{i32 306, i32 0, metadata !122, null}
!407 = metadata !{i32 308, i32 0, metadata !122, null}
!408 = metadata !{i32 309, i32 0, metadata !122, null}
!409 = metadata !{i32 311, i32 0, metadata !127, null}
!410 = metadata !{i32 315, i32 0, metadata !127, null}
!411 = metadata !{i32 316, i32 0, metadata !127, null}
!412 = metadata !{i32 317, i32 0, metadata !127, null}
!413 = metadata !{i32 320, i32 0, metadata !133, null}
!414 = metadata !{i32 322, i32 0, metadata !133, null}
!415 = metadata !{i32 323, i32 0, metadata !133, null}
!416 = metadata !{i32 324, i32 0, metadata !133, null}
!417 = metadata !{i32 327, i32 0, metadata !139, null}
!418 = metadata !{i32 331, i32 0, metadata !139, null}
!419 = metadata !{i32 332, i32 0, metadata !139, null}
!420 = metadata !{i32 333, i32 0, metadata !139, null}
!421 = metadata !{i32 334, i32 0, metadata !139, null}
!422 = metadata !{i32 338, i32 0, metadata !147, null}
!423 = metadata !{i32 342, i32 0, metadata !147, null}
!424 = metadata !{i32 343, i32 0, metadata !147, null}
!425 = metadata !{i32 344, i32 0, metadata !147, null}
!426 = metadata !{i32 345, i32 0, metadata !147, null}
!427 = metadata !{i32 2}
!428 = metadata !{i32 349, i32 0, metadata !147, null}
!429 = metadata !{i32 374, i32 0, metadata !430, null}
!430 = metadata !{i32 786443, metadata !1, metadata !147, i32 352, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!431 = metadata !{i32 378, i32 0, metadata !430, null}
!432 = metadata !{i32 380, i32 0, metadata !430, null}
!433 = metadata !{i32 387, i32 0, metadata !430, null}
!434 = metadata !{i32 390, i32 0, metadata !430, null}
!435 = metadata !{i32 391, i32 0, metadata !430, null}
!436 = metadata !{i32 392, i32 0, metadata !430, null}
!437 = metadata !{i32 393, i32 0, metadata !430, null}
!438 = metadata !{i32 395, i32 0, metadata !439, null}
!439 = metadata !{i32 786443, metadata !1, metadata !430, i32 394, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!440 = metadata !{i32 396, i32 0, metadata !441, null}
!441 = metadata !{i32 786443, metadata !1, metadata !439, i32 396, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!442 = metadata !{i32 398, i32 0, metadata !443, null}
!443 = metadata !{i32 786443, metadata !1, metadata !441, i32 397, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!444 = metadata !{i32 400, i32 0, metadata !443, null}
!445 = metadata !{i32 401, i32 0, metadata !443, null}
!446 = metadata !{i32 402, i32 0, metadata !443, null}
!447 = metadata !{i32 403, i32 0, metadata !443, null}
!448 = metadata !{i32 406, i32 0, metadata !430, null}
!449 = metadata !{i32 407, i32 0, metadata !430, null}
!450 = metadata !{i32 426, i32 0, metadata !147, null}
