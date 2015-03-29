; ModuleID = 'reg_detect.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !93), !dbg !94
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !93), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !35, metadata !93), !dbg !96
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !36, metadata !93), !dbg !97
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !37, metadata !93), !dbg !98
  %call = tail call i8* @polybench_alloc_data(i32 36, i32 4) #4, !dbg !99
  %call1 = tail call i8* @polybench_alloc_data(i32 36, i32 4) #4, !dbg !100
  %call2 = tail call i8* @polybench_alloc_data(i32 36, i32 4) #4, !dbg !101
  %call3 = tail call i8* @polybench_alloc_data(i32 2304, i32 4) #4, !dbg !102
  %call4 = tail call i8* @polybench_alloc_data(i32 2304, i32 4) #4, !dbg !103
  %arraydecay = bitcast i8* %call to [6 x i32]*, !dbg !104
  %arraydecay5 = bitcast i8* %call1 to [6 x i32]*, !dbg !105
  %arraydecay6 = bitcast i8* %call2 to [6 x i32]*, !dbg !106
  tail call fastcc void @init_array([6 x i32]* %arraydecay, [6 x i32]* %arraydecay5, [6 x i32]* %arraydecay6), !dbg !107
  %arraydecay10 = bitcast i8* %call3 to [6 x [64 x i32]]*, !dbg !108
  %arraydecay11 = bitcast i8* %call4 to [6 x [64 x i32]]*, !dbg !109
  tail call fastcc void @kernel_reg_detect([6 x i32]* %arraydecay, [6 x i32]* %arraydecay5, [6 x i32]* %arraydecay6, [6 x [64 x i32]]* %arraydecay10, [6 x [64 x i32]]* %arraydecay11), !dbg !110
  %cmp = icmp sgt i32 %argc, 42, !dbg !111
  br i1 %cmp, label %if.end48, label %if.end55, !dbg !112

if.end48:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !93), !dbg !113
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !47, metadata !93), !dbg !114
  %0 = load i8** %argv, align 8, !dbg !115, !tbaa !117
  %1 = load i8* %0, align 1, !dbg !115, !tbaa !121
  %phitmp = icmp eq i8 %1, 0, !dbg !113
  br i1 %phitmp, label %if.then53, label %if.end55, !dbg !112

if.then53:                                        ; preds = %if.end48
  tail call fastcc void @print_array([6 x i32]* %arraydecay6), !dbg !122
  br label %if.end55, !dbg !122

if.end55:                                         ; preds = %if.end48, %if.then53, %entry
  tail call void @free(i8* %call) #4, !dbg !124
  tail call void @free(i8* %call1) #4, !dbg !125
  tail call void @free(i8* %call2) #4, !dbg !126
  tail call void @free(i8* %call3) #4, !dbg !127
  tail call void @free(i8* %call4) #4, !dbg !128
  ret i32 0, !dbg !129
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([6 x i32]* nocapture %sum_tang, [6 x i32]* nocapture %mean, [6 x i32]* nocapture %path) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !84, metadata !93), !dbg !130
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !88, metadata !93), !dbg !131
  br label %for.cond1.preheader, !dbg !132

for.cond.loopexit:                                ; preds = %for.body3
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 6, !dbg !132
  br i1 %exitcond9, label %for.end20, label %for.cond1.preheader, !dbg !132

for.cond1.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond.loopexit ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !132
  br label %for.body3, !dbg !134

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !134
  %0 = mul nsw i64 %indvars.iv.next, %indvars.iv.next8, !dbg !137
  %arrayidx6 = getelementptr inbounds [6 x i32]* %sum_tang, i64 %indvars.iv7, i64 %indvars.iv, !dbg !140
  %1 = trunc i64 %0 to i32, !dbg !140
  store i32 %1, i32* %arrayidx6, align 4, !dbg !140, !tbaa !141
  %2 = sub nsw i64 %indvars.iv7, %indvars.iv, !dbg !143
  %3 = trunc i64 %2 to i32, !dbg !144
  %div = sdiv i32 %3, 6, !dbg !144
  %arrayidx10 = getelementptr inbounds [6 x i32]* %mean, i64 %indvars.iv7, i64 %indvars.iv, !dbg !145
  store i32 %div, i32* %arrayidx10, align 4, !dbg !145, !tbaa !141
  %4 = add nsw i64 %indvars.iv, -1, !dbg !146
  %5 = mul nsw i64 %4, %indvars.iv7, !dbg !147
  %6 = trunc i64 %5 to i32, !dbg !148
  %div13 = sdiv i32 %6, 6, !dbg !148
  %arrayidx17 = getelementptr inbounds [6 x i32]* %path, i64 %indvars.iv7, i64 %indvars.iv, !dbg !149
  store i32 %div13, i32* %arrayidx17, align 4, !dbg !149, !tbaa !141
  %exitcond = icmp eq i64 %indvars.iv.next, 6, !dbg !134
  br i1 %exitcond, label %for.cond.loopexit, label %for.body3, !dbg !134

for.end20:                                        ; preds = %for.cond.loopexit
  ret void, !dbg !150
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_reg_detect([6 x i32]* nocapture readonly %sum_tang, [6 x i32]* nocapture %mean, [6 x i32]* nocapture %path, [6 x [64 x i32]]* nocapture %diff, [6 x [64 x i32]]* nocapture %sum_diff) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !68, metadata !93), !dbg !151
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !69, metadata !93), !dbg !152
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !70, metadata !93), !dbg !153
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !93), !dbg !154
  br label %for.cond1.preheader, !dbg !155

for.cond1.preheader:                              ; preds = %for.inc129, %entry
  %t.013 = phi i32 [ 0, %entry ], [ %inc130, %for.inc129 ]
  br label %for.cond8.preheader.lr.ph, !dbg !157

for.cond8.preheader.lr.ph:                        ; preds = %for.cond1.preheader, %for.inc23
  %indvars.iv19 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next20, %for.inc23 ]
  br label %for.cond8.preheader, !dbg !161

for.cond8.preheader:                              ; preds = %for.inc20, %for.cond8.preheader.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv19, %for.cond8.preheader.lr.ph ], [ %indvars.iv.next17, %for.inc20 ]
  %arrayidx13 = getelementptr inbounds [6 x i32]* %sum_tang, i64 %indvars.iv19, i64 %indvars.iv16, !dbg !164
  br label %for.body11, !dbg !168

for.body11:                                       ; preds = %for.body11, %for.cond8.preheader
  %indvars.iv = phi i64 [ 0, %for.cond8.preheader ], [ %indvars.iv.next, %for.body11 ]
  %0 = load i32* %arrayidx13, align 4, !dbg !164, !tbaa !141
  %arrayidx19 = getelementptr inbounds [6 x [64 x i32]]* %diff, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv, !dbg !169
  store i32 %0, i32* %arrayidx19, align 4, !dbg !169, !tbaa !141
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !168
  %exitcond = icmp eq i64 %indvars.iv.next, 64, !dbg !168
  br i1 %exitcond, label %for.inc20, label %for.body11, !dbg !168

for.inc20:                                        ; preds = %for.body11
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !161
  %lftr.wideiv = trunc i64 %indvars.iv.next17 to i32, !dbg !161
  %exitcond18 = icmp eq i32 %lftr.wideiv, 6, !dbg !161
  br i1 %exitcond18, label %for.inc23, label %for.cond8.preheader, !dbg !161

for.inc23:                                        ; preds = %for.inc20
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !157
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 6, !dbg !157
  br i1 %exitcond21, label %for.body33.lr.ph, label %for.cond8.preheader.lr.ph, !dbg !157

for.body33.lr.ph:                                 ; preds = %for.inc23, %for.inc84
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.inc84 ], [ 0, %for.inc23 ]
  br label %for.body33, !dbg !170

for.body33:                                       ; preds = %for.end69, %for.body33.lr.ph
  %indvars.iv28 = phi i64 [ %indvars.iv32, %for.body33.lr.ph ], [ %indvars.iv.next29, %for.end69 ]
  %arrayidx38 = getelementptr inbounds [6 x [64 x i32]]* %diff, i64 %indvars.iv32, i64 %indvars.iv28, i64 0, !dbg !175
  %1 = load i32* %arrayidx38, align 4, !dbg !175, !tbaa !141
  %arrayidx43 = getelementptr inbounds [6 x [64 x i32]]* %sum_diff, i64 %indvars.iv32, i64 %indvars.iv28, i64 0, !dbg !178
  store i32 %1, i32* %arrayidx43, align 4, !dbg !178, !tbaa !141
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !79, metadata !93), !dbg !179
  br label %for.body47, !dbg !180

for.body47:                                       ; preds = %for.body47, %for.body33
  %indvars.iv22 = phi i64 [ 1, %for.body33 ], [ %indvars.iv.next23, %for.body47 ]
  %2 = add nsw i64 %indvars.iv22, -1, !dbg !182
  %arrayidx54 = getelementptr inbounds [6 x [64 x i32]]* %sum_diff, i64 %indvars.iv32, i64 %indvars.iv28, i64 %2, !dbg !184
  %3 = load i32* %arrayidx54, align 4, !dbg !184, !tbaa !141
  %arrayidx60 = getelementptr inbounds [6 x [64 x i32]]* %diff, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv22, !dbg !185
  %4 = load i32* %arrayidx60, align 4, !dbg !185, !tbaa !141
  %add = add nsw i32 %4, %3, !dbg !184
  %arrayidx66 = getelementptr inbounds [6 x [64 x i32]]* %sum_diff, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv22, !dbg !186
  store i32 %add, i32* %arrayidx66, align 4, !dbg !186, !tbaa !141
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !180
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 64, !dbg !180
  br i1 %exitcond25, label %for.end69, label %for.body47, !dbg !180

for.end69:                                        ; preds = %for.body47
  %arrayidx76 = getelementptr inbounds [6 x [64 x i32]]* %sum_diff, i64 %indvars.iv32, i64 %indvars.iv28, i64 63, !dbg !187
  %5 = load i32* %arrayidx76, align 4, !dbg !187, !tbaa !141
  %arrayidx80 = getelementptr inbounds [6 x i32]* %mean, i64 %indvars.iv32, i64 %indvars.iv28, !dbg !188
  store i32 %5, i32* %arrayidx80, align 4, !dbg !188, !tbaa !141
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !170
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !170
  %exitcond31 = icmp eq i32 %lftr.wideiv30, 6, !dbg !170
  br i1 %exitcond31, label %for.inc84, label %for.body33, !dbg !170

for.inc84:                                        ; preds = %for.end69
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !189
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 6, !dbg !189
  br i1 %exitcond34, label %for.body90, label %for.body33.lr.ph, !dbg !189

for.body90:                                       ; preds = %for.inc84, %for.body90
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.body90 ], [ 0, %for.inc84 ]
  %arrayidx93 = getelementptr inbounds [6 x i32]* %mean, i64 0, i64 %indvars.iv35, !dbg !190
  %6 = load i32* %arrayidx93, align 4, !dbg !190, !tbaa !141
  %arrayidx96 = getelementptr inbounds [6 x i32]* %path, i64 0, i64 %indvars.iv35, !dbg !193
  store i32 %6, i32* %arrayidx96, align 4, !dbg !193, !tbaa !141
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1, !dbg !194
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 6, !dbg !194
  br i1 %exitcond37, label %for.body107.lr.ph, label %for.body90, !dbg !194

for.body107.lr.ph:                                ; preds = %for.body90, %for.inc126
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc126 ], [ 1, %for.body90 ]
  %7 = add nsw i64 %indvars.iv46, -1, !dbg !195
  br label %for.body107, !dbg !200

for.body107:                                      ; preds = %for.body107, %for.body107.lr.ph
  %indvars.iv41 = phi i64 [ %indvars.iv46, %for.body107.lr.ph ], [ %indvars.iv.next42, %for.body107 ]
  %8 = add nsw i64 %indvars.iv41, -1, !dbg !201
  %arrayidx113 = getelementptr inbounds [6 x i32]* %path, i64 %7, i64 %8, !dbg !202
  %9 = load i32* %arrayidx113, align 4, !dbg !202, !tbaa !141
  %arrayidx117 = getelementptr inbounds [6 x i32]* %mean, i64 %indvars.iv46, i64 %indvars.iv41, !dbg !203
  %10 = load i32* %arrayidx117, align 4, !dbg !203, !tbaa !141
  %add118 = add nsw i32 %10, %9, !dbg !202
  %arrayidx122 = getelementptr inbounds [6 x i32]* %path, i64 %indvars.iv46, i64 %indvars.iv41, !dbg !204
  store i32 %add118, i32* %arrayidx122, align 4, !dbg !204, !tbaa !141
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !200
  %lftr.wideiv44 = trunc i64 %indvars.iv.next42 to i32, !dbg !200
  %exitcond45 = icmp eq i32 %lftr.wideiv44, 6, !dbg !200
  br i1 %exitcond45, label %for.inc126, label %for.body107, !dbg !200

for.inc126:                                       ; preds = %for.body107
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1, !dbg !205
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 6, !dbg !205
  br i1 %exitcond49, label %for.inc129, label %for.body107.lr.ph, !dbg !205

for.inc129:                                       ; preds = %for.inc126
  %inc130 = add nuw nsw i32 %t.013, 1, !dbg !206
  tail call void @llvm.dbg.value(metadata i32 %inc130, i64 0, metadata !76, metadata !93), !dbg !154
  %exitcond50 = icmp eq i32 %inc130, 10000, !dbg !155
  br i1 %exitcond50, label %for.end131, label %for.cond1.preheader, !dbg !155

for.end131:                                       ; preds = %for.inc129
  ret void, !dbg !207
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([6 x i32]* nocapture readonly %path) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !57, metadata !93), !dbg !208
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !59, metadata !93), !dbg !209
  br label %for.cond1.preheader, !dbg !210

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = mul nsw i64 %indvars.iv7, 6, !dbg !212
  br label %for.body3, !dbg !218

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !219, !tbaa !117
  %arrayidx5 = getelementptr inbounds [6 x i32]* %path, i64 %indvars.iv7, i64 %indvars.iv, !dbg !220
  %2 = load i32* %arrayidx5, align 4, !dbg !220, !tbaa !141
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %2) #5, !dbg !221
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !212
  %4 = trunc i64 %3 to i32, !dbg !222
  %rem = srem i32 %4, 20, !dbg !222
  %cmp6 = icmp eq i32 %rem, 0, !dbg !222
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !223

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !224, !tbaa !117
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !226
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !218
  %exitcond = icmp eq i64 %indvars.iv.next, 6, !dbg !218
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !218

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !210
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 6, !dbg !210
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !210

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !227, !tbaa !117
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !228
  ret void, !dbg !229
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!90, !91}
!llvm.ident = !{!92}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !25, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c] [DW_LANG_C99]
!1 = !{!"reg_detect.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect"}
!2 = !{}
!3 = !{!4, !9, !13, !16, !18, !21, !24, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001152\0032\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1152, align 32, offset 0] [from int]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!8, !8}
!8 = !{!"0x21\000\006"}                           ; [ DW_TAG_subrange_type ] [0, 5]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0073728\0032\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 73728, align 32, offset 0] [from int]
!11 = !{!8, !8, !12}
!12 = !{!"0x21\000\0064"}                         ; [ DW_TAG_subrange_type ] [0, 63]
!13 = !{!"0x16\00size_t\0062\000\000\000\000", !14, null, !15} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!14 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect"}
!15 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = !{!"0x26\00\000\000\000\000\000", null, null, !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!20 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = !{!"0x26\00\000\000\000\000\000", null, null, !23} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!23 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!26, !50, !61, !80}
!26 = !{!"0x2e\00main\00main\00\00100\000\001\000\000\00256\001\00101", !1, !27, !28, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 100] [def] [scope 101] [main]
!27 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!28 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !29, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = !{!6, !6, !30}
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !46, !47, !49}
!33 = !{!"0x101\00argc\0016777316\000", !26, !27, !6} ; [ DW_TAG_arg_variable ] [argc] [line 100]
!34 = !{!"0x101\00argv\0033554532\000", !26, !27, !30} ; [ DW_TAG_arg_variable ] [argv] [line 100]
!35 = !{!"0x100\00niter\00103\000", !26, !27, !6} ; [ DW_TAG_auto_variable ] [niter] [line 103]
!36 = !{!"0x100\00maxgrid\00104\000", !26, !27, !6} ; [ DW_TAG_auto_variable ] [maxgrid] [line 104]
!37 = !{!"0x100\00length\00105\000", !26, !27, !6} ; [ DW_TAG_auto_variable ] [length] [line 105]
!38 = !{!"0x100\00sum_tang\00108\000", !26, !27, !4} ; [ DW_TAG_auto_variable ] [sum_tang] [line 108]
!39 = !{!"0x100\00mean\00109\000", !26, !27, !4}  ; [ DW_TAG_auto_variable ] [mean] [line 109]
!40 = !{!"0x100\00path\00110\000", !26, !27, !4}  ; [ DW_TAG_auto_variable ] [path] [line 110]
!41 = !{!"0x100\00diff\00111\000", !26, !27, !9}  ; [ DW_TAG_auto_variable ] [diff] [line 111]
!42 = !{!"0x100\00sum_diff\00112\000", !26, !27, !9} ; [ DW_TAG_auto_variable ] [sum_diff] [line 112]
!43 = !{!"0x100\00__s1_len\00137\000", !44, !27, !13} ; [ DW_TAG_auto_variable ] [__s1_len] [line 137]
!44 = !{!"0xb\00137\003\001", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!45 = !{!"0xb\00137\003\000", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!46 = !{!"0x100\00__s2_len\00137\000", !44, !27, !13} ; [ DW_TAG_auto_variable ] [__s2_len] [line 137]
!47 = !{!"0x100\00__s2\00137\000", !48, !27, !18} ; [ DW_TAG_auto_variable ] [__s2] [line 137]
!48 = !{!"0xb\00137\003\002", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!49 = !{!"0x100\00__result\00137\000", !48, !27, !6} ; [ DW_TAG_auto_variable ] [__result] [line 137]
!50 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0044", !1, !27, !51, null, void ([6 x i32]*)* @print_array, null, null, !56} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{null, !6, !53}
!53 = !{!"0xf\00\000\0064\0064\000\000", null, null, !54} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!54 = !{!"0x1\00\000\00192\0032\000\000\000", null, null, !6, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 32, offset 0] [from int]
!55 = !{!8}
!56 = !{!57, !58, !59, !60}
!57 = !{!"0x101\00maxgrid\0016777258\000", !50, !27, !6} ; [ DW_TAG_arg_variable ] [maxgrid] [line 42]
!58 = !{!"0x101\00path\0033554475\000", !50, !27, !53} ; [ DW_TAG_arg_variable ] [path] [line 43]
!59 = !{!"0x100\00i\0045\000", !50, !27, !6}      ; [ DW_TAG_auto_variable ] [i] [line 45]
!60 = !{!"0x100\00j\0045\000", !50, !27, !6}      ; [ DW_TAG_auto_variable ] [j] [line 45]
!61 = !{!"0x2e\00kernel_reg_detect\00kernel_reg_detect\00\0060\001\001\000\000\00256\001\0066", !1, !27, !62, null, void ([6 x i32]*, [6 x i32]*, [6 x i32]*, [6 x [64 x i32]]*, [6 x [64 x i32]]*)* @kernel_reg_detect, null, null, !67} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 66] [kernel_reg_detect]
!62 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !63, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = !{null, !6, !6, !6, !53, !53, !53, !64, !64}
!64 = !{!"0xf\00\000\0064\0064\000\000", null, null, !65} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!65 = !{!"0x1\00\000\0012288\0032\000\000\000", null, null, !6, !66, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 12288, align 32, offset 0] [from int]
!66 = !{!8, !12}
!67 = !{!68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79}
!68 = !{!"0x101\00niter\0016777276\000", !61, !27, !6} ; [ DW_TAG_arg_variable ] [niter] [line 60]
!69 = !{!"0x101\00maxgrid\0033554492\000", !61, !27, !6} ; [ DW_TAG_arg_variable ] [maxgrid] [line 60]
!70 = !{!"0x101\00length\0050331708\000", !61, !27, !6} ; [ DW_TAG_arg_variable ] [length] [line 60]
!71 = !{!"0x101\00sum_tang\0067108925\000", !61, !27, !53} ; [ DW_TAG_arg_variable ] [sum_tang] [line 61]
!72 = !{!"0x101\00mean\0083886142\000", !61, !27, !53} ; [ DW_TAG_arg_variable ] [mean] [line 62]
!73 = !{!"0x101\00path\00100663359\000", !61, !27, !53} ; [ DW_TAG_arg_variable ] [path] [line 63]
!74 = !{!"0x101\00diff\00117440576\000", !61, !27, !64} ; [ DW_TAG_arg_variable ] [diff] [line 64]
!75 = !{!"0x101\00sum_diff\00134217793\000", !61, !27, !64} ; [ DW_TAG_arg_variable ] [sum_diff] [line 65]
!76 = !{!"0x100\00t\0067\000", !61, !27, !6}      ; [ DW_TAG_auto_variable ] [t] [line 67]
!77 = !{!"0x100\00i\0067\000", !61, !27, !6}      ; [ DW_TAG_auto_variable ] [i] [line 67]
!78 = !{!"0x100\00j\0067\000", !61, !27, !6}      ; [ DW_TAG_auto_variable ] [j] [line 67]
!79 = !{!"0x100\00cnt\0067\000", !61, !27, !6}    ; [ DW_TAG_auto_variable ] [cnt] [line 67]
!80 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !27, !81, null, void ([6 x i32]*, [6 x i32]*, [6 x i32]*)* @init_array, null, null, !83} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{null, !6, !53, !53, !53}
!83 = !{!84, !85, !86, !87, !88, !89}
!84 = !{!"0x101\00maxgrid\0016777239\000", !80, !27, !6} ; [ DW_TAG_arg_variable ] [maxgrid] [line 23]
!85 = !{!"0x101\00sum_tang\0033554456\000", !80, !27, !53} ; [ DW_TAG_arg_variable ] [sum_tang] [line 24]
!86 = !{!"0x101\00mean\0050331673\000", !80, !27, !53} ; [ DW_TAG_arg_variable ] [mean] [line 25]
!87 = !{!"0x101\00path\0067108890\000", !80, !27, !53} ; [ DW_TAG_arg_variable ] [path] [line 26]
!88 = !{!"0x100\00i\0028\000", !80, !27, !6}      ; [ DW_TAG_auto_variable ] [i] [line 28]
!89 = !{!"0x100\00j\0028\000", !80, !27, !6}      ; [ DW_TAG_auto_variable ] [j] [line 28]
!90 = !{i32 2, !"Dwarf Version", i32 4}
!91 = !{i32 2, !"Debug Info Version", i32 2}
!92 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!93 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!94 = !MDLocation(line: 100, column: 14, scope: !26)
!95 = !MDLocation(line: 100, column: 27, scope: !26)
!96 = !MDLocation(line: 103, column: 7, scope: !26)
!97 = !MDLocation(line: 104, column: 7, scope: !26)
!98 = !MDLocation(line: 105, column: 7, scope: !26)
!99 = !MDLocation(line: 108, column: 3, scope: !26)
!100 = !MDLocation(line: 109, column: 3, scope: !26)
!101 = !MDLocation(line: 110, column: 3, scope: !26)
!102 = !MDLocation(line: 111, column: 3, scope: !26)
!103 = !MDLocation(line: 112, column: 3, scope: !26)
!104 = !MDLocation(line: 116, column: 8, scope: !26)
!105 = !MDLocation(line: 117, column: 8, scope: !26)
!106 = !MDLocation(line: 118, column: 8, scope: !26)
!107 = !MDLocation(line: 115, column: 3, scope: !26)
!108 = !MDLocation(line: 128, column: 8, scope: !26)
!109 = !MDLocation(line: 129, column: 8, scope: !26)
!110 = !MDLocation(line: 124, column: 3, scope: !26)
!111 = !MDLocation(line: 137, column: 3, scope: !45)
!112 = !MDLocation(line: 137, column: 3, scope: !26)
!113 = !MDLocation(line: 137, column: 3, scope: !44)
!114 = !MDLocation(line: 137, column: 3, scope: !48)
!115 = !MDLocation(line: 137, column: 3, scope: !116)
!116 = !{!"0xb\004", !1, !48}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!117 = !{!118, !118, i64 0}
!118 = !{!"any pointer", !119, i64 0}
!119 = !{!"omnipotent char", !120, i64 0}
!120 = !{!"Simple C/C++ TBAA"}
!121 = !{!119, !119, i64 0}
!122 = !MDLocation(line: 137, column: 3, scope: !123)
!123 = !{!"0xb\0023", !1, !45}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!124 = !MDLocation(line: 140, column: 3, scope: !26)
!125 = !MDLocation(line: 141, column: 3, scope: !26)
!126 = !MDLocation(line: 142, column: 3, scope: !26)
!127 = !MDLocation(line: 143, column: 3, scope: !26)
!128 = !MDLocation(line: 144, column: 3, scope: !26)
!129 = !MDLocation(line: 146, column: 3, scope: !26)
!130 = !MDLocation(line: 23, column: 21, scope: !80)
!131 = !MDLocation(line: 28, column: 7, scope: !80)
!132 = !MDLocation(line: 30, column: 3, scope: !133)
!133 = !{!"0xb\0030\003\0037", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!134 = !MDLocation(line: 31, column: 5, scope: !135)
!135 = !{!"0xb\0031\005\0039", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!136 = !{!"0xb\0030\003\0038", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!137 = !MDLocation(line: 32, column: 36, scope: !138)
!138 = !{!"0xb\0031\0035\0041", !1, !139}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!139 = !{!"0xb\0031\005\0040", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!140 = !MDLocation(line: 32, column: 7, scope: !138)
!141 = !{!142, !142, i64 0}
!142 = !{!"int", !119, i64 0}
!143 = !MDLocation(line: 33, column: 21, scope: !138)
!144 = !MDLocation(line: 33, column: 20, scope: !138)
!145 = !MDLocation(line: 33, column: 7, scope: !138)
!146 = !MDLocation(line: 34, column: 36, scope: !138)
!147 = !MDLocation(line: 34, column: 21, scope: !138)
!148 = !MDLocation(line: 34, column: 20, scope: !138)
!149 = !MDLocation(line: 34, column: 7, scope: !138)
!150 = !MDLocation(line: 36, column: 1, scope: !80)
!151 = !MDLocation(line: 60, column: 28, scope: !61)
!152 = !MDLocation(line: 60, column: 39, scope: !61)
!153 = !MDLocation(line: 60, column: 52, scope: !61)
!154 = !MDLocation(line: 67, column: 7, scope: !61)
!155 = !MDLocation(line: 70, column: 3, scope: !156)
!156 = !{!"0xb\0070\003\0014", !1, !61}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!157 = !MDLocation(line: 72, column: 7, scope: !158)
!158 = !{!"0xb\0072\007\0017", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!159 = !{!"0xb\0071\005\0016", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!160 = !{!"0xb\0070\003\0015", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!161 = !MDLocation(line: 73, column: 2, scope: !162)
!162 = !{!"0xb\0073\002\0019", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!163 = !{!"0xb\0072\007\0018", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!164 = !MDLocation(line: 75, column: 24, scope: !165)
!165 = !{!"0xb\0074\004\0022", !1, !166}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!166 = !{!"0xb\0074\004\0021", !1, !167}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!167 = !{!"0xb\0073\002\0020", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!168 = !MDLocation(line: 74, column: 4, scope: !166)
!169 = !MDLocation(line: 75, column: 6, scope: !165)
!170 = !MDLocation(line: 79, column: 4, scope: !171)
!171 = !{!"0xb\0079\004\0026", !1, !172}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!172 = !{!"0xb\0078\009\0025", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!173 = !{!"0xb\0077\007\0024", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!174 = !{!"0xb\0077\007\0023", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!175 = !MDLocation(line: 81, column: 28, scope: !176)
!176 = !{!"0xb\0080\0013\0028", !1, !177}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!177 = !{!"0xb\0079\004\0027", !1, !171}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!178 = !MDLocation(line: 81, column: 8, scope: !176)
!179 = !MDLocation(line: 67, column: 16, scope: !61)
!180 = !MDLocation(line: 82, column: 8, scope: !181)
!181 = !{!"0xb\0082\008\0029", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!182 = !MDLocation(line: 83, column: 40, scope: !183)
!183 = !{!"0xb\0082\008\0030", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!184 = !MDLocation(line: 83, column: 25, scope: !183)
!185 = !MDLocation(line: 83, column: 51, scope: !183)
!186 = !MDLocation(line: 83, column: 3, scope: !183)
!187 = !MDLocation(line: 84, column: 21, scope: !176)
!188 = !MDLocation(line: 84, column: 8, scope: !176)
!189 = !MDLocation(line: 77, column: 7, scope: !174)
!190 = !MDLocation(line: 89, column: 15, scope: !191)
!191 = !{!"0xb\0088\007\0032", !1, !192}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!192 = !{!"0xb\0088\007\0031", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!193 = !MDLocation(line: 89, column: 2, scope: !191)
!194 = !MDLocation(line: 88, column: 7, scope: !192)
!195 = !MDLocation(line: 93, column: 22, scope: !196)
!196 = !{!"0xb\0092\002\0036", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!197 = !{!"0xb\0092\002\0035", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!198 = !{!"0xb\0091\007\0034", !1, !199}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!199 = !{!"0xb\0091\007\0033", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!200 = !MDLocation(line: 92, column: 2, scope: !197)
!201 = !MDLocation(line: 93, column: 29, scope: !196)
!202 = !MDLocation(line: 93, column: 17, scope: !196)
!203 = !MDLocation(line: 93, column: 38, scope: !196)
!204 = !MDLocation(line: 93, column: 4, scope: !196)
!205 = !MDLocation(line: 91, column: 7, scope: !199)
!206 = !MDLocation(line: 70, column: 26, scope: !160)
!207 = !MDLocation(line: 97, column: 1, scope: !61)
!208 = !MDLocation(line: 42, column: 22, scope: !50)
!209 = !MDLocation(line: 45, column: 7, scope: !50)
!210 = !MDLocation(line: 47, column: 3, scope: !211)
!211 = !{!"0xb\0047\003\008", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!212 = !MDLocation(line: 50, column: 12, scope: !213)
!213 = !{!"0xb\0050\0011\0013", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!214 = !{!"0xb\0048\0035\0012", !1, !215}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!215 = !{!"0xb\0048\005\0011", !1, !216}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!216 = !{!"0xb\0048\005\0010", !1, !217}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!217 = !{!"0xb\0047\003\009", !1, !211}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!218 = !MDLocation(line: 48, column: 5, scope: !216)
!219 = !MDLocation(line: 49, column: 16, scope: !214)
!220 = !MDLocation(line: 49, column: 46, scope: !214)
!221 = !MDLocation(line: 49, column: 7, scope: !214)
!222 = !MDLocation(line: 50, column: 11, scope: !213)
!223 = !MDLocation(line: 50, column: 11, scope: !214)
!224 = !MDLocation(line: 50, column: 49, scope: !225)
!225 = !{!"0xb\001", !1, !213}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!226 = !MDLocation(line: 50, column: 40, scope: !213)
!227 = !MDLocation(line: 52, column: 12, scope: !50)
!228 = !MDLocation(line: 52, column: 3, scope: !50)
!229 = !MDLocation(line: 53, column: 1, scope: !50)
