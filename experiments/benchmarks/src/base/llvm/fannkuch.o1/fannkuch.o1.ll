; ModuleID = 'fannkuch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !14, metadata !55), !dbg !56
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !15, metadata !55), !dbg !57
  tail call void @llvm.dbg.value(metadata i32 11, i64 0, metadata !16, metadata !55), !dbg !58
  %call = tail call fastcc i64 @fannkuch(), !dbg !59
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 11, i64 %call) #3, !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define internal fastcc i64 @fannkuch() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 11, i64 0, metadata !22, metadata !55), !dbg !62
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !33, metadata !55), !dbg !63
  %call = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !64
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !23, metadata !55), !dbg !65
  %call2 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !66
  %0 = bitcast i8* %call2 to i32*, !dbg !66
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !25, metadata !55), !dbg !67
  %call4 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !68
  tail call void @llvm.dbg.value(metadata i32* %2, i64 0, metadata !26, metadata !55), !dbg !69
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !55), !dbg !70
  br label %for.body, !dbg !71

for.cond7.preheader:                              ; preds = %for.body
  %1 = bitcast i8* %call to i32*, !dbg !64
  %2 = bitcast i8* %call4 to i32*, !dbg !68
  %arrayidx37 = getelementptr inbounds i8* %call2, i64 40, !dbg !73
  %3 = bitcast i8* %arrayidx37 to i32*, !dbg !73
  %scevgep = getelementptr i8* %call, i64 4
  %scevgep25 = getelementptr i8* %call2, i64 4
  br label %for.cond7, !dbg !74

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv38 = phi i64 [ 0, %entry ], [ %indvars.iv.next39, %for.body ]
  %arrayidx = getelementptr inbounds i32* %0, i64 %indvars.iv38, !dbg !76
  %4 = trunc i64 %indvars.iv38 to i32, !dbg !76
  store i32 %4, i32* %arrayidx, align 4, !dbg !76, !tbaa !78
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !71
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 11, !dbg !71
  br i1 %exitcond40, label %for.cond7.preheader, label %for.body, !dbg !71

for.cond7.loopexit:                               ; preds = %while.end
  %5 = trunc i64 %indvars.iv36 to i32
  br label %for.cond7

for.cond7:                                        ; preds = %for.cond7.preheader, %for.cond7.loopexit
  %r.0 = phi i32 [ %5, %for.cond7.loopexit ], [ 11, %for.cond7.preheader ]
  %didpr.0 = phi i32 [ %didpr.1.ph, %for.cond7.loopexit ], [ 0, %for.cond7.preheader ]
  %flipsMax.0 = phi i64 [ %flipsMax.1.ph43, %for.cond7.loopexit ], [ 0, %for.cond7.preheader ]
  %cmp8 = icmp slt i32 %didpr.0, 30, !dbg !74
  br i1 %cmp8, label %for.body14, label %for.cond24.preheader, !dbg !82

for.body14:                                       ; preds = %for.cond7, %for.body14
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body14 ], [ 0, %for.cond7 ]
  %arrayidx16 = getelementptr inbounds i32* %0, i64 %indvars.iv, !dbg !83
  %6 = load i32* %arrayidx16, align 4, !dbg !83, !tbaa !78
  %add = add nsw i32 %6, 1, !dbg !87
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add) #3, !dbg !88
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !89
  %exitcond = icmp eq i64 %indvars.iv.next, 11, !dbg !89
  br i1 %exitcond, label %for.end20, label %for.body14, !dbg !89

for.end20:                                        ; preds = %for.body14
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !90
  %inc22 = add nsw i32 %didpr.0, 1, !dbg !91
  tail call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !32, metadata !55), !dbg !92
  br label %for.cond24.preheader, !dbg !93

for.cond24.preheader:                             ; preds = %for.end20, %for.cond7
  %didpr.1.ph = phi i32 [ %didpr.0, %for.cond7 ], [ %inc22, %for.end20 ]
  %cmp253 = icmp eq i32 %r.0, 1, !dbg !94
  br i1 %cmp253, label %for.end32, label %for.body27.lr.ph, !dbg !99

for.body27.lr.ph:                                 ; preds = %for.cond24.preheader
  %7 = sext i32 %r.0 to i64
  br label %for.body27, !dbg !99

for.body27:                                       ; preds = %for.body27.lr.ph, %for.body27
  %indvars.iv20 = phi i64 [ %7, %for.body27.lr.ph ], [ %indvars.iv.next21, %for.body27 ]
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, -1, !dbg !99
  %arrayidx30 = getelementptr inbounds i32* %2, i64 %indvars.iv.next21, !dbg !100
  %8 = trunc i64 %indvars.iv20 to i32, !dbg !100
  store i32 %8, i32* %arrayidx30, align 4, !dbg !100, !tbaa !78
  %9 = trunc i64 %indvars.iv.next21 to i32, !dbg !94
  %cmp25 = icmp eq i32 %9, 1, !dbg !94
  br i1 %cmp25, label %for.end32, label %for.body27, !dbg !99

for.end32:                                        ; preds = %for.body27, %for.cond24.preheader
  %10 = load i32* %0, align 4, !dbg !102, !tbaa !78
  %cmp34 = icmp eq i32 %10, 0, !dbg !102
  br i1 %cmp34, label %if.end84.lr.ph, label %lor.lhs.false, !dbg !103

lor.lhs.false:                                    ; preds = %for.end32
  %11 = load i32* %3, align 4, !dbg !73, !tbaa !78
  %cmp38 = icmp eq i32 %11, 10, !dbg !73
  br i1 %cmp38, label %if.end84.lr.ph, label %for.end51, !dbg !103

for.end51:                                        ; preds = %lor.lhs.false
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep, i8* %scevgep25, i64 40, i32 4, i1 false), !dbg !104
  %12 = load i32* %0, align 4, !dbg !108, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %12, i64 0, metadata !31, metadata !55), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %for.end69, %for.end51
  %k.0 = phi i32 [ %12, %for.end51 ], [ %18, %for.end69 ]
  %flips.0 = phi i64 [ 0, %for.end51 ], [ %inc70, %for.end69 ]
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !30, metadata !55), !dbg !70
  %j.06 = add nsw i32 %k.0, -1, !dbg !111
  %cmp557 = icmp sgt i32 %j.06, 1, !dbg !112
  br i1 %cmp557, label %for.body57.lr.ph, label %for.end69, !dbg !113

for.body57.lr.ph:                                 ; preds = %do.body
  %13 = add i32 %k.0, -1, !dbg !113
  %14 = sext i32 %13 to i64
  br label %for.body57, !dbg !113

for.body57:                                       ; preds = %for.body57.lr.ph, %for.body57
  %indvars.iv29 = phi i64 [ 1, %for.body57.lr.ph ], [ %indvars.iv.next30, %for.body57 ]
  %indvars.iv26 = phi i64 [ %14, %for.body57.lr.ph ], [ %indvars.iv.next27, %for.body57 ]
  %j.09 = phi i32 [ %j.06, %for.body57.lr.ph ], [ %j.0, %for.body57 ]
  %arrayidx59 = getelementptr inbounds i32* %1, i64 %indvars.iv29, !dbg !114
  %15 = load i32* %arrayidx59, align 4, !dbg !114, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %15, i64 0, metadata !42, metadata !55), !dbg !114
  %arrayidx61 = getelementptr inbounds i32* %1, i64 %indvars.iv26, !dbg !114
  %16 = load i32* %arrayidx61, align 4, !dbg !114, !tbaa !78
  store i32 %16, i32* %arrayidx59, align 4, !dbg !114, !tbaa !78
  store i32 %15, i32* %arrayidx61, align 4, !dbg !114, !tbaa !78
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !113
  %j.0 = add nsw i32 %j.09, -1, !dbg !111
  %17 = sext i32 %j.0 to i64, !dbg !112
  %cmp55 = icmp slt i64 %indvars.iv.next30, %17, !dbg !112
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1, !dbg !113
  br i1 %cmp55, label %for.body57, label %for.end69, !dbg !113

for.end69:                                        ; preds = %for.body57, %do.body
  %inc70 = add nuw nsw i64 %flips.0, 1, !dbg !115
  tail call void @llvm.dbg.value(metadata i64 %inc70, i64 0, metadata !27, metadata !55), !dbg !116
  %idxprom71 = sext i32 %k.0 to i64, !dbg !117
  %arrayidx72 = getelementptr inbounds i32* %1, i64 %idxprom71, !dbg !117
  %18 = load i32* %arrayidx72, align 4, !dbg !117, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !35, metadata !55), !dbg !118
  store i32 %k.0, i32* %arrayidx72, align 4, !dbg !119, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !31, metadata !55), !dbg !109
  %tobool = icmp eq i32 %18, 0, !dbg !120
  br i1 %tobool, label %for.cond80.preheader, label %do.body, !dbg !120

for.cond80.preheader:                             ; preds = %for.end69
  %cmp75 = icmp slt i64 %flipsMax.0, %inc70, !dbg !121
  tail call void @llvm.dbg.value(metadata i64 %inc70, i64 0, metadata !28, metadata !55), !dbg !123
  %inc70.flipsMax.0 = select i1 %cmp75, i64 %inc70, i64 %flipsMax.0, !dbg !124
  br label %if.end84.lr.ph, !dbg !125

if.end84.lr.ph:                                   ; preds = %for.cond80.preheader, %for.end32, %lor.lhs.false
  %flipsMax.1.ph43 = phi i64 [ %inc70.flipsMax.0, %for.cond80.preheader ], [ %flipsMax.0, %lor.lhs.false ], [ %flipsMax.0, %for.end32 ]
  br label %if.end84, !dbg !125

if.end84:                                         ; preds = %if.end84.lr.ph, %if.end101
  %indvars.iv36 = phi i64 [ 1, %if.end84.lr.ph ], [ %indvars.iv.next37, %if.end101 ]
  %indvars.iv33 = phi i32 [ 0, %if.end84.lr.ph ], [ %indvars.iv.next34, %if.end101 ]
  %19 = load i32* %0, align 4, !dbg !126, !tbaa !78
  tail call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !47, metadata !55), !dbg !127
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !55), !dbg !70
  %cmp8610 = icmp sgt i64 %indvars.iv36, 0, !dbg !128
  br i1 %cmp8610, label %while.body, label %while.end, !dbg !129

while.body:                                       ; preds = %if.end84, %while.body
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %while.body ], [ 0, %if.end84 ]
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !129
  %arrayidx90 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32, !dbg !130
  %20 = load i32* %arrayidx90, align 4, !dbg !130, !tbaa !78
  %arrayidx92 = getelementptr inbounds i32* %0, i64 %indvars.iv31, !dbg !132
  store i32 %20, i32* %arrayidx92, align 4, !dbg !132, !tbaa !78
  %lftr.wideiv = trunc i64 %indvars.iv31 to i32, !dbg !129
  %exitcond35 = icmp eq i32 %lftr.wideiv, %indvars.iv33, !dbg !129
  br i1 %exitcond35, label %while.end, label %while.body, !dbg !129

while.end:                                        ; preds = %while.body, %if.end84
  %arrayidx94 = getelementptr inbounds i32* %0, i64 %indvars.iv36, !dbg !133
  store i32 %19, i32* %arrayidx94, align 4, !dbg !133, !tbaa !78
  %arrayidx96 = getelementptr inbounds i32* %2, i64 %indvars.iv36, !dbg !134
  %21 = load i32* %arrayidx96, align 4, !dbg !134, !tbaa !78
  %sub97 = add nsw i32 %21, -1, !dbg !134
  store i32 %sub97, i32* %arrayidx96, align 4, !dbg !134, !tbaa !78
  %cmp98 = icmp sgt i32 %21, 1, !dbg !136
  br i1 %cmp98, label %for.cond7.loopexit, label %if.end101, !dbg !137

if.end101:                                        ; preds = %while.end
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1, !dbg !125
  %22 = trunc i64 %indvars.iv.next37 to i32, !dbg !138
  %cmp81 = icmp eq i32 %22, 11, !dbg !138
  %indvars.iv.next34 = add i32 %indvars.iv33, 1, !dbg !125
  br i1 %cmp81, label %return, label %if.end84, !dbg !125

return:                                           ; preds = %if.end101
  ret i64 %flipsMax.1.ph43, !dbg !140
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!52, !53}
!llvm.ident = !{!54}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c] [DW_LANG_C99]
!1 = !{!"fannkuch.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !17}
!6 = !{!"0x2e\00main\00main\00\0099\000\001\000\000\00256\001\00100", !1, !7, !8, null, i32 (i32, i8**)* @main, null, null, !13} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 100] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !4, !10}
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = !{!14, !15, !16}
!14 = !{!"0x101\00argc\0016777315\000", !6, !7, !4} ; [ DW_TAG_arg_variable ] [argc] [line 99]
!15 = !{!"0x101\00argv\0033554531\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [argv] [line 99]
!16 = !{!"0x100\00n\00101\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [n] [line 101]
!17 = !{!"0x2e\00fannkuch\00fannkuch\00\0018\001\001\000\000\00256\001\0019", !1, !7, !18, null, i64 ()* @fannkuch, null, null, !21} ; [ DW_TAG_subprogram ] [line 18] [local] [def] [scope 19] [fannkuch]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!20, !4}
!20 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!21 = !{!22, !23, !25, !26, !27, !28, !29, !30, !31, !32, !33, !35, !42, !47}
!22 = !{!"0x101\00n\0016777234\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [n] [line 18]
!23 = !{!"0x100\00perm\0020\000", !17, !7, !24}   ; [ DW_TAG_auto_variable ] [perm] [line 20]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!25 = !{!"0x100\00perm1\0021\000", !17, !7, !24}  ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!26 = !{!"0x100\00count\0022\000", !17, !7, !24}  ; [ DW_TAG_auto_variable ] [count] [line 22]
!27 = !{!"0x100\00flips\0023\000", !17, !7, !20}  ; [ DW_TAG_auto_variable ] [flips] [line 23]
!28 = !{!"0x100\00flipsMax\0024\000", !17, !7, !20} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!29 = !{!"0x100\00r\0025\000", !17, !7, !4}       ; [ DW_TAG_auto_variable ] [r] [line 25]
!30 = !{!"0x100\00i\0026\000", !17, !7, !4}       ; [ DW_TAG_auto_variable ] [i] [line 26]
!31 = !{!"0x100\00k\0027\000", !17, !7, !4}       ; [ DW_TAG_auto_variable ] [k] [line 27]
!32 = !{!"0x100\00didpr\0028\000", !17, !7, !4}   ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!33 = !{!"0x100\00n1\0029\000", !17, !7, !34}     ; [ DW_TAG_auto_variable ] [n1] [line 29]
!34 = !{!"0x26\00\000\000\000\000\000", null, null, !4} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!35 = !{!"0x100\00j\0059\000", !36, !7, !4}       ; [ DW_TAG_auto_variable ] [j] [line 59]
!36 = !{!"0xb\0058\009\0018", !1, !37}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!37 = !{!"0xb\0052\0041\0014", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!38 = !{!"0xb\0052\006\0013", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!39 = !{!"0xb\0040\0013\005", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!40 = !{!"0xb\0040\005\004", !1, !41}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!41 = !{!"0xb\0040\005\003", !1, !17}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!42 = !{!"0x100\00t_mp\0061\000", !43, !7, !4}    ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!43 = !{!"0xb\0061\007\0022", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!44 = !{!"0xb\0060\0038\0021", !1, !45}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!45 = !{!"0xb\0060\003\0020", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!46 = !{!"0xb\0060\003\0019", !1, !36}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!47 = !{!"0x100\00perm0\0081\000", !48, !7, !4}   ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!48 = !{!"0xb\0080\006\0030", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!49 = !{!"0xb\0075\0010\0027", !1, !50}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!50 = !{!"0xb\0075\002\0026", !1, !51}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!51 = !{!"0xb\0075\002\0025", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!52 = !{i32 2, !"Dwarf Version", i32 4}
!53 = !{i32 2, !"Debug Info Version", i32 2}
!54 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!55 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!56 = !MDLocation(line: 99, column: 11, scope: !6)
!57 = !MDLocation(line: 99, column: 23, scope: !6)
!58 = !MDLocation(line: 101, column: 10, scope: !6)
!59 = !MDLocation(line: 103, column: 42, scope: !6)
!60 = !MDLocation(line: 103, column: 5, scope: !6)
!61 = !MDLocation(line: 104, column: 5, scope: !6)
!62 = !MDLocation(line: 18, column: 15, scope: !17)
!63 = !MDLocation(line: 29, column: 15, scope: !17)
!64 = !MDLocation(line: 33, column: 13, scope: !17)
!65 = !MDLocation(line: 20, column: 11, scope: !17)
!66 = !MDLocation(line: 34, column: 13, scope: !17)
!67 = !MDLocation(line: 21, column: 11, scope: !17)
!68 = !MDLocation(line: 35, column: 13, scope: !17)
!69 = !MDLocation(line: 22, column: 11, scope: !17)
!70 = !MDLocation(line: 26, column: 10, scope: !17)
!71 = !MDLocation(line: 37, column: 5, scope: !72)
!72 = !{!"0xb\0037\005\001", !1, !17}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!73 = !MDLocation(line: 52, column: 24, scope: !38)
!74 = !MDLocation(line: 41, column: 6, scope: !75)
!75 = !{!"0xb\0041\006\006", !1, !39}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!76 = !MDLocation(line: 37, column: 28, scope: !77)
!77 = !{!"0xb\0037\005\002", !1, !72}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!78 = !{!79, !79, i64 0}
!79 = !{!"int", !80, i64 0}
!80 = !{!"omnipotent char", !81, i64 0}
!81 = !{!"Simple C/C++ TBAA"}
!82 = !MDLocation(line: 41, column: 6, scope: !39)
!83 = !MDLocation(line: 42, column: 50, scope: !84)
!84 = !{!"0xb\0042\006\009", !1, !85}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!85 = !{!"0xb\0042\006\008", !1, !86}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!86 = !{!"0xb\0041\0019\007", !1, !75}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!87 = !MDLocation(line: 42, column: 48, scope: !84)
!88 = !MDLocation(line: 42, column: 29, scope: !84)
!89 = !MDLocation(line: 42, column: 6, scope: !85)
!90 = !MDLocation(line: 43, column: 6, scope: !86)
!91 = !MDLocation(line: 44, column: 6, scope: !86)
!92 = !MDLocation(line: 28, column: 10, scope: !17)
!93 = !MDLocation(line: 45, column: 2, scope: !86)
!94 = !MDLocation(line: 46, column: 9, scope: !95)
!95 = !{!"0xb\002", !1, !96}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!96 = !{!"0xb\001", !1, !97}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!97 = !{!"0xb\0046\002\0011", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!98 = !{!"0xb\0046\002\0010", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!99 = !MDLocation(line: 46, column: 2, scope: !98)
!100 = !MDLocation(line: 47, column: 6, scope: !101)
!101 = !{!"0xb\0046\0022\0012", !1, !97}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!102 = !MDLocation(line: 52, column: 9, scope: !38)
!103 = !MDLocation(line: 52, column: 6, scope: !39)
!104 = !MDLocation(line: 55, column: 3, scope: !105)
!105 = !{!"0xb\0054\0029\0017", !1, !106}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!106 = !{!"0xb\0054\006\0016", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!107 = !{!"0xb\0054\006\0015", !1, !37}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!108 = !MDLocation(line: 57, column: 10, scope: !37)
!109 = !MDLocation(line: 27, column: 10, scope: !17)
!110 = !MDLocation(line: 58, column: 6, scope: !37)
!111 = !MDLocation(line: 60, column: 15, scope: !46)
!112 = !MDLocation(line: 60, column: 21, scope: !45)
!113 = !MDLocation(line: 60, column: 3, scope: !46)
!114 = !MDLocation(line: 61, column: 7, scope: !43)
!115 = !MDLocation(line: 63, column: 3, scope: !36)
!116 = !MDLocation(line: 23, column: 10, scope: !17)
!117 = !MDLocation(line: 68, column: 5, scope: !36)
!118 = !MDLocation(line: 59, column: 7, scope: !36)
!119 = !MDLocation(line: 68, column: 14, scope: !36)
!120 = !MDLocation(line: 69, column: 6, scope: !36)
!121 = !MDLocation(line: 70, column: 10, scope: !122)
!122 = !{!"0xb\0070\0010\0023", !1, !37}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!123 = !MDLocation(line: 24, column: 10, scope: !17)
!124 = !MDLocation(line: 70, column: 10, scope: !37)
!125 = !MDLocation(line: 76, column: 10, scope: !49)
!126 = !MDLocation(line: 81, column: 15, scope: !48)
!127 = !MDLocation(line: 81, column: 7, scope: !48)
!128 = !MDLocation(line: 83, column: 10, scope: !48)
!129 = !MDLocation(line: 83, column: 3, scope: !48)
!130 = !MDLocation(line: 85, column: 18, scope: !131)
!131 = !{!"0xb\0083\0018\0031", !1, !48}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!132 = !MDLocation(line: 85, column: 7, scope: !131)
!133 = !MDLocation(line: 88, column: 3, scope: !48)
!134 = !MDLocation(line: 90, column: 11, scope: !135)
!135 = !{!"0xb\0090\0010\0032", !1, !49}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!136 = !MDLocation(line: 90, column: 10, scope: !135)
!137 = !MDLocation(line: 90, column: 10, scope: !49)
!138 = !MDLocation(line: 76, column: 10, scope: !139)
!139 = !{!"0xb\0076\0010\0028", !1, !49}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!140 = !MDLocation(line: 96, column: 1, scope: !17)
