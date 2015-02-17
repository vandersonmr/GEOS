; ModuleID = 'bubblesort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@top = common global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piecemax = common global [13 x i32] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@n = common global i32 0, align 4
@kount = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !110, !tbaa !111
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !116, !tbaa !111
  %mul = mul nsw i64 %0, 1309, !dbg !116
  %add = add nsw i64 %mul, 13849, !dbg !116
  %and = and i64 %add, 65535, !dbg !117
  store i64 %and, i64* @seed, align 8, !dbg !118, !tbaa !111
  %conv = trunc i64 %and to i32, !dbg !119
  ret i32 %conv, !dbg !120
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
entry:
  tail call void @Initrand(), !dbg !121
  store i32 0, i32* @biggest, align 4, !dbg !122, !tbaa !123
  store i32 0, i32* @littlest, align 4, !dbg !125, !tbaa !123
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !126), !dbg !127
  br label %for.body, !dbg !128

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.inc ]
  %call = tail call i32 @Rand(), !dbg !130
  %conv = sext i32 %call to i64, !dbg !130
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !15, metadata !126), !dbg !133
  %div = srem i64 %conv, 100000, !dbg !134
  %sub1 = add i64 %div, 4294917296, !dbg !135
  %conv2 = trunc i64 %sub1 to i32, !dbg !136
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !137
  store i32 %conv2, i32* %arrayidx, align 4, !dbg !137, !tbaa !123
  %0 = load i32* @biggest, align 4, !dbg !138, !tbaa !123
  %cmp5 = icmp sgt i32 %conv2, %0, !dbg !140
  br i1 %cmp5, label %if.then, label %if.else, !dbg !141

if.then:                                          ; preds = %for.body
  store i32 %conv2, i32* @biggest, align 4, !dbg !142, !tbaa !123
  br label %for.inc, !dbg !142

if.else:                                          ; preds = %for.body
  %1 = load i32* @littlest, align 4, !dbg !143, !tbaa !123
  %cmp11 = icmp slt i32 %conv2, %1, !dbg !145
  br i1 %cmp11, label %if.then13, label %for.inc, !dbg !146

if.then13:                                        ; preds = %if.else
  store i32 %conv2, i32* @littlest, align 4, !dbg !147, !tbaa !123
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %if.then, %if.then13, %if.else
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !128
  %exitcond = icmp eq i64 %indvars.iv.next, 501, !dbg !128
  br i1 %exitcond, label %for.end, label %for.body, !dbg !128

for.end:                                          ; preds = %for.inc
  ret void, !dbg !148
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %run, i64 0, metadata !21, metadata !126), !dbg !149
  tail call void @bInitarr(), !dbg !150
  store i32 500, i32* @top, align 4, !dbg !151, !tbaa !123
  br label %while.body3.lr.ph, !dbg !153

while.body3.lr.ph:                                ; preds = %while.end, %entry
  %indvars.iv36 = phi i32 [ 500, %entry ], [ %indvars.iv.next37, %while.end ]
  br label %while.body3, !dbg !154

while.body3:                                      ; preds = %while.cond1.backedge, %while.body3.lr.ph
  %indvars.iv = phi i64 [ 1, %while.body3.lr.ph ], [ %indvars.iv.next, %while.cond1.backedge ]
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !155
  %0 = load i32* %arrayidx, align 4, !dbg !155, !tbaa !123
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !154
  %arrayidx5 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next, !dbg !158
  %1 = load i32* %arrayidx5, align 4, !dbg !158, !tbaa !123
  %cmp6 = icmp sgt i32 %0, %1, !dbg !155
  br i1 %cmp6, label %if.then, label %while.cond1.backedge, !dbg !159

if.then:                                          ; preds = %while.body3
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !23, metadata !126), !dbg !160
  store i32 %1, i32* %arrayidx, align 4, !dbg !161, !tbaa !123
  store i32 %0, i32* %arrayidx5, align 4, !dbg !163, !tbaa !123
  br label %while.cond1.backedge, !dbg !164

while.cond1.backedge:                             ; preds = %if.then, %while.body3
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !154
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv36, !dbg !154
  br i1 %exitcond, label %while.end, label %while.body3, !dbg !154

while.end:                                        ; preds = %while.cond1.backedge
  %indvars.iv.next37 = add nsw i32 %indvars.iv36, -1, !dbg !153
  %cmp = icmp sgt i32 %indvars.iv.next37, 1, !dbg !165
  br i1 %cmp, label %while.body3.lr.ph, label %while.end18, !dbg !153

while.end18:                                      ; preds = %while.end
  store i32 1, i32* @top, align 4, !dbg !168, !tbaa !123
  %2 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !169, !tbaa !123
  %3 = load i32* @littlest, align 4, !dbg !171, !tbaa !123
  %cmp19 = icmp eq i32 %2, %3, !dbg !169
  br i1 %cmp19, label %lor.lhs.false, label %if.then21, !dbg !172

lor.lhs.false:                                    ; preds = %while.end18
  %4 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 500), align 16, !dbg !173, !tbaa !123
  %5 = load i32* @biggest, align 4, !dbg !175, !tbaa !123
  %cmp20 = icmp eq i32 %4, %5, !dbg !176
  br i1 %cmp20, label %if.end22, label %if.then21, !dbg !172

if.then21:                                        ; preds = %lor.lhs.false, %while.end18
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !177
  br label %if.end22, !dbg !177

if.end22:                                         ; preds = %lor.lhs.false, %if.then21
  %add23 = add nsw i32 %run, 1, !dbg !178
  %idxprom24 = sext i32 %add23 to i64, !dbg !179
  %arrayidx25 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %idxprom24, !dbg !179
  %6 = load i32* %arrayidx25, align 4, !dbg !179, !tbaa !123
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %6) #3, !dbg !180
  ret void, !dbg !181
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !26, metadata !126), !dbg !182
  br label %for.body, !dbg !183

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Bubble(i32 %i.03), !dbg !185
  %inc = add nuw nsw i32 %i.03, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !26, metadata !126), !dbg !182
  %exitcond = icmp eq i32 %inc, 100, !dbg !183
  br i1 %exitcond, label %for.end, label %for.body, !dbg !183

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !189
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!107, !108}
!llvm.ident = !{!109}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !27, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c] [DW_LANG_C99]
!1 = !{!"bubblesort.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !17, !24}
!6 = !{!"0x2e\00Initrand\00Initrand\00\0097\000\001\000\000\000\001\0097", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 97] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00100\000\001\000\000\000\001\00100", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 100] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00bInitarr\00bInitarr\00\00105\000\001\000\000\000\001\00105", !1, !7, !8, null, void ()* @bInitarr, null, null, !13} ; [ DW_TAG_subprogram ] [line 105] [def] [bInitarr]
!13 = !{!14, !15}
!14 = !{!"0x100\00i\00106\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 106]
!15 = !{!"0x100\00temp\00107\000", !12, !7, !16}  ; [ DW_TAG_auto_variable ] [temp] [line 107]
!16 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = !{!"0x2e\00Bubble\00Bubble\00\00118\000\001\000\000\00256\001\00118", !1, !7, !18, null, void (i32)* @Bubble, null, null, !20} ; [ DW_TAG_subprogram ] [line 118] [def] [Bubble]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{null, !4}
!20 = !{!21, !22, !23}
!21 = !{!"0x101\00run\0016777334\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 118]
!22 = !{!"0x100\00i\00119\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 119]
!23 = !{!"0x100\00j\00119\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 119]
!24 = !{!"0x2e\00main\00main\00\00138\000\001\000\000\000\001\00139", !1, !7, !11, null, i32 ()* @main, null, null, !25} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [main]
!25 = !{!26}
!26 = !{!"0x100\00i\00140\000", !24, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 140]
!27 = !{!28, !30, !31, !32, !33, !37, !39, !46, !50, !58, !59, !60, !64, !65, !66, !68, !69, !70, !71, !75, !76, !80, !83, !84, !85, !89, !90, !91, !92, !100, !101, !105, !106}
!28 = !{!"0x34\00value\00value\00\0073\000\001", null, !7, !29, float* @value, null} ; [ DW_TAG_variable ] [value] [line 73] [def]
!29 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!30 = !{!"0x34\00fixed\00fixed\00\0073\000\001", null, !7, !29, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 73] [def]
!31 = !{!"0x34\00floated\00floated\00\0073\000\001", null, !7, !29, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 73] [def]
!32 = !{!"0x34\00seed\00seed\00\0075\000\001", null, !7, !16, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 75] [def]
!33 = !{!"0x34\00permarray\00permarray\00\0077\000\001", null, !7, !34, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 77] [def]
!34 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !35, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!35 = !{!36}
!36 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!37 = !{!"0x34\00pctr\00pctr\00\0079\000\001", null, !7, !38, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 79] [def]
!38 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!39 = !{!"0x34\00tree\00tree\00\0081\000\001", null, !7, !40, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 81] [def]
!40 = !{!"0xf\00\000\0064\0064\000\000", null, null, !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!41 = !{!"0x13\00node\0039\00192\0064\000\000\000", !1, null, null, !42, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 39, size 192, align 64, offset 0] [def] [from ]
!42 = !{!43, !44, !45}
!43 = !{!"0xd\00left\0040\0064\0064\000\000", !1, !41, !40} ; [ DW_TAG_member ] [left] [line 40, size 64, align 64, offset 0] [from ]
!44 = !{!"0xd\00right\0040\0064\0064\0064\000", !1, !41, !40} ; [ DW_TAG_member ] [right] [line 40, size 64, align 64, offset 64] [from ]
!45 = !{!"0xd\00val\0041\0032\0032\00128\000", !1, !41, !4} ; [ DW_TAG_member ] [val] [line 41, size 32, align 32, offset 128] [from int]
!46 = !{!"0x34\00stack\00stack\00\0083\000\001", null, !7, !47, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 83] [def]
!47 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!48 = !{!49}
!49 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!50 = !{!"0x34\00cellspace\00cellspace\00\0084\000\001", null, !7, !51, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 84] [def]
!51 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !52, !56, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!52 = !{!"0x13\00element\0047\0064\0032\000\000\000", !1, null, null, !53, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 47, size 64, align 32, offset 0] [def] [from ]
!53 = !{!54, !55}
!54 = !{!"0xd\00discsize\0048\0032\0032\000\000", !1, !52, !4} ; [ DW_TAG_member ] [discsize] [line 48, size 32, align 32, offset 0] [from int]
!55 = !{!"0xd\00next\0049\0032\0032\0032\000", !1, !52, !4} ; [ DW_TAG_member ] [next] [line 49, size 32, align 32, offset 32] [from int]
!56 = !{!57}
!57 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!58 = !{!"0x34\00freelist\00freelist\00\0085\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 85] [def]
!59 = !{!"0x34\00movesdone\00movesdone\00\0085\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 85] [def]
!60 = !{!"0x34\00ima\00ima\00\0087\000\001", null, !7, !61, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 87] [def]
!61 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !62, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!62 = !{!63, !63}
!63 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!64 = !{!"0x34\00imb\00imb\00\0087\000\001", null, !7, !61, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 87] [def]
!65 = !{!"0x34\00imr\00imr\00\0087\000\001", null, !7, !61, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 87] [def]
!66 = !{!"0x34\00rma\00rma\00\0088\000\001", null, !7, !67, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 88] [def]
!67 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !29, !62, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!68 = !{!"0x34\00rmb\00rmb\00\0088\000\001", null, !7, !67, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 88] [def]
!69 = !{!"0x34\00rmr\00rmr\00\0088\000\001", null, !7, !67, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 88] [def]
!70 = !{!"0x34\00piececount\00piececount\00\0090\000\001", null, !7, !47, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 90] [def]
!71 = !{!"0x34\00class\00class\00\0090\000\001", null, !7, !72, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 90] [def]
!72 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !73, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!73 = !{!74}
!74 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!75 = !{!"0x34\00piecemax\00piecemax\00\0090\000\001", null, !7, !72, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 90] [def]
!76 = !{!"0x34\00puzzl\00puzzl\00\0091\000\001", null, !7, !77, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 91] [def]
!77 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !78, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!78 = !{!79}
!79 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!80 = !{!"0x34\00p\00p\00\0091\000\001", null, !7, !81, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 91] [def]
!81 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !82, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!82 = !{!74, !79}
!83 = !{!"0x34\00n\00n\00\0091\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 91] [def]
!84 = !{!"0x34\00kount\00kount\00\0091\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 91] [def]
!85 = !{!"0x34\00sortlist\00sortlist\00\0093\000\001", null, !7, !86, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 93] [def]
!86 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !87, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!87 = !{!88}
!88 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!89 = !{!"0x34\00biggest\00biggest\00\0093\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 93] [def]
!90 = !{!"0x34\00littlest\00littlest\00\0093\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 93] [def]
!91 = !{!"0x34\00top\00top\00\0093\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 93] [def]
!92 = !{!"0x34\00z\00z\00\0095\000\001", null, !7, !93, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 95] [def]
!93 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !94, !98, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!94 = !{!"0x13\00complex\0068\0064\0032\000\000\000", !1, null, null, !95, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 68, size 64, align 32, offset 0] [def] [from ]
!95 = !{!96, !97}
!96 = !{!"0xd\00rp\0068\0032\0032\000\000", !1, !94, !29} ; [ DW_TAG_member ] [rp] [line 68, size 32, align 32, offset 0] [from float]
!97 = !{!"0xd\00ip\0068\0032\0032\0032\000", !1, !94, !29} ; [ DW_TAG_member ] [ip] [line 68, size 32, align 32, offset 32] [from float]
!98 = !{!99}
!99 = !{!"0x21\000\00257"}                        ; [ DW_TAG_subrange_type ] [0, 256]
!100 = !{!"0x34\00w\00w\00\0095\000\001", null, !7, !93, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 95] [def]
!101 = !{!"0x34\00e\00e\00\0095\000\001", null, !7, !102, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 95] [def]
!102 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !94, !103, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!103 = !{!104}
!104 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!105 = !{!"0x34\00zr\00zr\00\0096\000\001", null, !7, !29, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 96] [def]
!106 = !{!"0x34\00zi\00zi\00\0096\000\001", null, !7, !29, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 96] [def]
!107 = !{i32 2, !"Dwarf Version", i32 4}
!108 = !{i32 2, !"Debug Info Version", i32 2}
!109 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!110 = !MDLocation(line: 98, column: 3, scope: !6)
!111 = !{!112, !112, i64 0}
!112 = !{!"long", !113, i64 0}
!113 = !{!"omnipotent char", !114, i64 0}
!114 = !{!"Simple C/C++ TBAA"}
!115 = !MDLocation(line: 99, column: 1, scope: !6)
!116 = !MDLocation(line: 101, column: 11, scope: !10)
!117 = !MDLocation(line: 101, column: 10, scope: !10)
!118 = !MDLocation(line: 101, column: 3, scope: !10)
!119 = !MDLocation(line: 102, column: 11, scope: !10)
!120 = !MDLocation(line: 102, column: 3, scope: !10)
!121 = !MDLocation(line: 108, column: 3, scope: !12)
!122 = !MDLocation(line: 109, column: 3, scope: !12)
!123 = !{!124, !124, i64 0}
!124 = !{!"int", !113, i64 0}
!125 = !MDLocation(line: 109, column: 16, scope: !12)
!126 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!127 = !MDLocation(line: 106, column: 7, scope: !12)
!128 = !MDLocation(line: 110, column: 3, scope: !129)
!129 = !{!"0xb\00110\003\000", !1, !12}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!130 = !MDLocation(line: 111, column: 12, scope: !131)
!131 = !{!"0xb\00110\0040\002", !1, !132}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!132 = !{!"0xb\00110\003\001", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!133 = !MDLocation(line: 107, column: 8, scope: !12)
!134 = !MDLocation(line: 113, column: 32, scope: !131)
!135 = !MDLocation(line: 113, column: 25, scope: !131)
!136 = !MDLocation(line: 113, column: 19, scope: !131)
!137 = !MDLocation(line: 113, column: 5, scope: !131)
!138 = !MDLocation(line: 114, column: 24, scope: !139)
!139 = !{!"0xb\00114\0010\003", !1, !131}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!140 = !MDLocation(line: 114, column: 10, scope: !139)
!141 = !MDLocation(line: 114, column: 10, scope: !131)
!142 = !MDLocation(line: 114, column: 34, scope: !139)
!143 = !MDLocation(line: 115, column: 29, scope: !144)
!144 = !{!"0xb\00115\0015\004", !1, !139}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!145 = !MDLocation(line: 115, column: 15, scope: !144)
!146 = !MDLocation(line: 115, column: 15, scope: !139)
!147 = !MDLocation(line: 115, column: 40, scope: !144)
!148 = !MDLocation(line: 117, column: 1, scope: !12)
!149 = !MDLocation(line: 118, column: 17, scope: !17)
!150 = !MDLocation(line: 120, column: 3, scope: !17)
!151 = !MDLocation(line: 132, column: 5, scope: !152)
!152 = !{!"0xb\00122\0019\005", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!153 = !MDLocation(line: 122, column: 3, scope: !17)
!154 = !MDLocation(line: 124, column: 5, scope: !152)
!155 = !MDLocation(line: 125, column: 12, scope: !156)
!156 = !{!"0xb\00125\0012\007", !1, !157}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!157 = !{!"0xb\00124\0021\006", !1, !152}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!158 = !MDLocation(line: 125, column: 26, scope: !156)
!159 = !MDLocation(line: 125, column: 12, scope: !157)
!160 = !MDLocation(line: 119, column: 10, scope: !17)
!161 = !MDLocation(line: 127, column: 9, scope: !162)
!162 = !{!"0xb\00125\0042\008", !1, !156}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!163 = !MDLocation(line: 128, column: 9, scope: !162)
!164 = !MDLocation(line: 129, column: 7, scope: !162)
!165 = !MDLocation(line: 122, column: 11, scope: !166)
!166 = !{!"0xb\002", !1, !167}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!167 = !{!"0xb\001", !1, !17}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!168 = !MDLocation(line: 124, column: 15, scope: !152)
!169 = !MDLocation(line: 134, column: 9, scope: !170)
!170 = !{!"0xb\00134\008\009", !1, !17}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!171 = !MDLocation(line: 134, column: 24, scope: !170)
!172 = !MDLocation(line: 134, column: 8, scope: !17)
!173 = !MDLocation(line: 134, column: 38, scope: !174)
!174 = !{!"0xb\001", !1, !170}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!175 = !MDLocation(line: 134, column: 63, scope: !170)
!176 = !MDLocation(line: 134, column: 38, scope: !170)
!177 = !MDLocation(line: 135, column: 5, scope: !170)
!178 = !MDLocation(line: 136, column: 27, scope: !17)
!179 = !MDLocation(line: 136, column: 18, scope: !17)
!180 = !MDLocation(line: 136, column: 3, scope: !17)
!181 = !MDLocation(line: 137, column: 1, scope: !17)
!182 = !MDLocation(line: 140, column: 7, scope: !24)
!183 = !MDLocation(line: 141, column: 3, scope: !184)
!184 = !{!"0xb\00141\003\0010", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!185 = !MDLocation(line: 141, column: 29, scope: !186)
!186 = !{!"0xb\00141\003\0011", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!187 = !MDLocation(line: 141, column: 24, scope: !188)
!188 = !{!"0xb\003", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!189 = !MDLocation(line: 142, column: 3, scope: !24)
