; ModuleID = 'perm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@.str = private unnamed_addr constant [17 x i8] c" Error in Perm.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
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
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@top = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@str = private unnamed_addr constant [16 x i8] c" Error in Perm.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !119, !tbaa !120
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !125, !tbaa !120
  %mul = mul nsw i64 %0, 1309, !dbg !125
  %add = add nsw i64 %mul, 13849, !dbg !125
  %and = and i64 %add, 65535, !dbg !126
  store i64 %and, i64* @seed, align 8, !dbg !127, !tbaa !120
  %conv = trunc i64 %and to i32, !dbg !128
  ret i32 %conv, !dbg !129
}

; Function Attrs: nounwind uwtable
define void @Swap(i32* nocapture %a, i32* nocapture %b) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %a, i64 0, metadata !17, metadata !130), !dbg !131
  tail call void @llvm.dbg.value(metadata i32* %b, i64 0, metadata !18, metadata !130), !dbg !132
  %0 = load i32* %a, align 4, !dbg !133, !tbaa !134
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !19, metadata !130), !dbg !136
  %1 = load i32* %b, align 4, !dbg !137, !tbaa !134
  store i32 %1, i32* %a, align 4, !dbg !138, !tbaa !134
  store i32 %0, i32* %b, align 4, !dbg !139, !tbaa !134
  ret void, !dbg !140
}

; Function Attrs: nounwind uwtable
define void @Initialize() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !22, metadata !130), !dbg !141
  br label %for.body, !dbg !142

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = add i64 %indvars.iv, 4294967295, !dbg !144
  %arrayidx = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %indvars.iv, !dbg !147
  %1 = trunc i64 %0 to i32, !dbg !147
  store i32 %1, i32* %arrayidx, align 4, !dbg !147, !tbaa !134
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !142
  %exitcond = icmp eq i64 %indvars.iv.next, 8, !dbg !142
  br i1 %exitcond, label %for.end, label %for.body, !dbg !142

for.end:                                          ; preds = %for.body
  ret void, !dbg !148
}

; Function Attrs: nounwind uwtable
define void @Permute(i32 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !27, metadata !130), !dbg !149
  %0 = load i32* @pctr, align 4, !dbg !150, !tbaa !134
  %add = add i32 %0, 1, !dbg !150
  store i32 %add, i32* @pctr, align 4, !dbg !151, !tbaa !134
  %cmp = icmp eq i32 %n, 1, !dbg !152
  br i1 %cmp, label %if.end, label %if.then, !dbg !154

if.then:                                          ; preds = %entry
  %sub = add nsw i32 %n, -1, !dbg !155
  tail call void @Permute(i32 %sub), !dbg !157
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !28, metadata !130), !dbg !158
  %cmp218 = icmp sgt i32 %n, 1, !dbg !159
  br i1 %cmp218, label %for.body.lr.ph, label %if.end, !dbg !164

for.body.lr.ph:                                   ; preds = %if.then
  %idxprom = sext i32 %n to i64, !dbg !165
  %arrayidx = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %idxprom, !dbg !165
  %1 = sext i32 %n to i64
  br label %for.body, !dbg !164

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv.in = phi i64 [ %1, %for.body.lr.ph ], [ %indvars.iv, %for.body ]
  %indvars.iv = add nsw i64 %indvars.iv.in, -1, !dbg !164
  %arrayidx4 = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %indvars.iv, !dbg !167
  tail call void @Swap(i32* %arrayidx, i32* %arrayidx4), !dbg !168
  tail call void @Permute(i32 %sub), !dbg !169
  tail call void @Swap(i32* %arrayidx, i32* %arrayidx4), !dbg !170
  %cmp2 = icmp sgt i64 %indvars.iv, 1, !dbg !159
  br i1 %cmp2, label %for.body, label %if.end, !dbg !164

if.end:                                           ; preds = %for.body, %if.then, %entry
  ret void, !dbg !171
}

; Function Attrs: nounwind uwtable
define void @Perm() #0 {
entry:
  store i32 0, i32* @pctr, align 4, !dbg !172, !tbaa !134
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !31, metadata !130), !dbg !173
  br label %for.body, !dbg !174

for.body:                                         ; preds = %for.body, %entry
  %i.04 = phi i32 [ 1, %entry ], [ %inc, %for.body ]
  tail call void @Initialize(), !dbg !176
  tail call void @Permute(i32 7), !dbg !179
  %inc = add nuw nsw i32 %i.04, 1, !dbg !180
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !31, metadata !130), !dbg !173
  %exitcond = icmp eq i32 %inc, 6, !dbg !174
  br i1 %exitcond, label %for.end, label %for.body, !dbg !174

for.end:                                          ; preds = %for.body
  %0 = load i32* @pctr, align 4, !dbg !181, !tbaa !134
  %cmp1 = icmp eq i32 %0, 43300, !dbg !181
  br i1 %cmp1, label %if.end, label %if.then, !dbg !183

if.then:                                          ; preds = %for.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str, i64 0, i64 0)), !dbg !184
  br label %if.end, !dbg !184

if.end:                                           ; preds = %for.end, %if.then
  %1 = load i32* @pctr, align 4, !dbg !185, !tbaa !134
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %1) #3, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !34, metadata !130), !dbg !188
  br label %for.body, !dbg !189

for.body:                                         ; preds = %for.body, %entry
  %i.02 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Perm(), !dbg !191
  %inc = add nuw nsw i32 %i.02, 1, !dbg !194
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !34, metadata !130), !dbg !188
  %exitcond = icmp eq i32 %inc, 100, !dbg !189
  br i1 %exitcond, label %for.end, label %for.body, !dbg !189

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !196
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
!llvm.module.flags = !{!116, !117}
!llvm.ident = !{!118}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !35, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c] [DW_LANG_C99]
!1 = !{!"perm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !20, !23, !29, !32}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\001\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\001\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Swap\00Swap\00\00126\000\001\000\000\00256\001\00126", !1, !7, !13, null, void (i32*, i32*)* @Swap, null, null, !16} ; [ DW_TAG_subprogram ] [line 126] [def] [Swap]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !15, !15}
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = !{!17, !18, !19}
!17 = !{!"0x101\00a\0016777342\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [a] [line 126]
!18 = !{!"0x101\00b\0033554558\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [b] [line 126]
!19 = !{!"0x100\00t\00127\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [t] [line 127]
!20 = !{!"0x2e\00Initialize\00Initialize\00\00131\000\001\000\000\000\001\00131", !1, !7, !8, null, void ()* @Initialize, null, null, !21} ; [ DW_TAG_subprogram ] [line 131] [def] [Initialize]
!21 = !{!22}
!22 = !{!"0x100\00i\00132\000", !20, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 132]
!23 = !{!"0x2e\00Permute\00Permute\00\00138\000\001\000\000\00256\001\00138", !1, !7, !24, null, void (i32)* @Permute, null, null, !26} ; [ DW_TAG_subprogram ] [line 138] [def] [Permute]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !4}
!26 = !{!27, !28}
!27 = !{!"0x101\00n\0016777354\000", !23, !7, !4} ; [ DW_TAG_arg_variable ] [n] [line 138]
!28 = !{!"0x100\00k\00139\000", !23, !7, !4}      ; [ DW_TAG_auto_variable ] [k] [line 139]
!29 = !{!"0x2e\00Perm\00Perm\00\00151\000\001\000\000\000\001\00151", !1, !7, !8, null, void ()* @Perm, null, null, !30} ; [ DW_TAG_subprogram ] [line 151] [def] [Perm]
!30 = !{!31}
!31 = !{!"0x100\00i\00152\000", !29, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 152]
!32 = !{!"0x2e\00main\00main\00\00163\000\001\000\000\000\001\00164", !1, !7, !11, null, i32 ()* @main, null, null, !33} ; [ DW_TAG_subprogram ] [line 163] [def] [scope 164] [main]
!33 = !{!34}
!34 = !{!"0x100\00i\00165\000", !32, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 165]
!35 = !{!36, !38, !39, !40, !42, !46, !48, !55, !59, !67, !68, !69, !73, !74, !75, !77, !78, !79, !80, !84, !85, !89, !92, !93, !94, !98, !99, !100, !101, !109, !110, !114, !115}
!36 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !37, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!37 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!38 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !37, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!39 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !37, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!40 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !41, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!41 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!42 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !43, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!43 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!44 = !{!45}
!45 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!46 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !47, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!47 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!48 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !49, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!50 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !51, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!51 = !{!52, !53, !54}
!52 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !50, !49} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!53 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !50, !49} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!54 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !50, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!55 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !56, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!56 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !57, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!57 = !{!58}
!58 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!59 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !60, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!60 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !61, !65, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!61 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !62, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!62 = !{!63, !64}
!63 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !61, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!64 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !61, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!65 = !{!66}
!66 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!67 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!68 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!69 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !70, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!70 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !71, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!71 = !{!72, !72}
!72 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!73 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !70, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!74 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !70, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!75 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !76, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!76 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !37, !71, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!77 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !76, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!78 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !76, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!79 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !56, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!80 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !81, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!81 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !82, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!82 = !{!83}
!83 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!84 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !81, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!85 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !86, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!86 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !87, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!87 = !{!88}
!88 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!89 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !90, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!90 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !91, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!91 = !{!83, !88}
!92 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!93 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!94 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !95, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!95 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !96, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!96 = !{!97}
!97 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!98 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!99 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!100 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!101 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !102, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!102 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !103, !107, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!103 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !104, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!104 = !{!105, !106}
!105 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !103, !37} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!106 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !103, !37} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!107 = !{!108}
!108 = !{!"0x21\000\00257"}                       ; [ DW_TAG_subrange_type ] [0, 256]
!109 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !102, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!110 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !111, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!111 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !103, !112, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!112 = !{!113}
!113 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!114 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !37, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!115 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !37, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!116 = !{i32 2, !"Dwarf Version", i32 4}
!117 = !{i32 2, !"Debug Info Version", i32 2}
!118 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!119 = !MDLocation(line: 116, column: 5, scope: !6)
!120 = !{!121, !121, i64 0}
!121 = !{!"long", !122, i64 0}
!122 = !{!"omnipotent char", !123, i64 0}
!123 = !{!"Simple C/C++ TBAA"}
!124 = !MDLocation(line: 117, column: 1, scope: !6)
!125 = !MDLocation(line: 120, column: 13, scope: !10)
!126 = !MDLocation(line: 120, column: 12, scope: !10)
!127 = !MDLocation(line: 120, column: 5, scope: !10)
!128 = !MDLocation(line: 121, column: 13, scope: !10)
!129 = !MDLocation(line: 121, column: 5, scope: !10)
!130 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!131 = !MDLocation(line: 126, column: 18, scope: !12)
!132 = !MDLocation(line: 126, column: 26, scope: !12)
!133 = !MDLocation(line: 128, column: 6, scope: !12)
!134 = !{!135, !135, i64 0}
!135 = !{!"int", !122, i64 0}
!136 = !MDLocation(line: 127, column: 6, scope: !12)
!137 = !MDLocation(line: 128, column: 16, scope: !12)
!138 = !MDLocation(line: 128, column: 11, scope: !12)
!139 = !MDLocation(line: 128, column: 21, scope: !12)
!140 = !MDLocation(line: 129, column: 1, scope: !12)
!141 = !MDLocation(line: 132, column: 6, scope: !20)
!142 = !MDLocation(line: 133, column: 2, scope: !143)
!143 = !{!"0xb\00133\002\000", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!144 = !MDLocation(line: 134, column: 19, scope: !145)
!145 = !{!"0xb\00133\0029\002", !1, !146}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!146 = !{!"0xb\00133\002\001", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!147 = !MDLocation(line: 134, column: 6, scope: !145)
!148 = !MDLocation(line: 136, column: 1, scope: !20)
!149 = !MDLocation(line: 138, column: 19, scope: !23)
!150 = !MDLocation(line: 140, column: 9, scope: !23)
!151 = !MDLocation(line: 140, column: 2, scope: !23)
!152 = !MDLocation(line: 141, column: 7, scope: !153)
!153 = !{!"0xb\00141\007\003", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!154 = !MDLocation(line: 141, column: 7, scope: !23)
!155 = !MDLocation(line: 142, column: 14, scope: !156)
!156 = !{!"0xb\00141\0015\004", !1, !153}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!157 = !MDLocation(line: 142, column: 6, scope: !156)
!158 = !MDLocation(line: 139, column: 6, scope: !23)
!159 = !MDLocation(line: 143, column: 21, scope: !160)
!160 = !{!"0xb\002", !1, !161}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!161 = !{!"0xb\001", !1, !162}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!162 = !{!"0xb\00143\006\006", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!163 = !{!"0xb\00143\006\005", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!164 = !MDLocation(line: 143, column: 6, scope: !163)
!165 = !MDLocation(line: 144, column: 9, scope: !166)
!166 = !{!"0xb\00143\0035\007", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!167 = !MDLocation(line: 144, column: 23, scope: !166)
!168 = !MDLocation(line: 144, column: 4, scope: !166)
!169 = !MDLocation(line: 145, column: 4, scope: !166)
!170 = !MDLocation(line: 146, column: 4, scope: !166)
!171 = !MDLocation(line: 149, column: 1, scope: !23)
!172 = !MDLocation(line: 153, column: 5, scope: !29)
!173 = !MDLocation(line: 152, column: 9, scope: !29)
!174 = !MDLocation(line: 154, column: 5, scope: !175)
!175 = !{!"0xb\00154\005\008", !1, !29}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!176 = !MDLocation(line: 155, column: 3, scope: !177)
!177 = !{!"0xb\00154\0032\0010", !1, !178}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!178 = !{!"0xb\00154\005\009", !1, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!179 = !MDLocation(line: 156, column: 3, scope: !177)
!180 = !MDLocation(line: 154, column: 26, scope: !178)
!181 = !MDLocation(line: 158, column: 10, scope: !182)
!182 = !{!"0xb\00158\0010\0011", !1, !29}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!183 = !MDLocation(line: 158, column: 10, scope: !29)
!184 = !MDLocation(line: 159, column: 2, scope: !182)
!185 = !MDLocation(line: 160, column: 17, scope: !29)
!186 = !MDLocation(line: 160, column: 2, scope: !29)
!187 = !MDLocation(line: 161, column: 1, scope: !29)
!188 = !MDLocation(line: 165, column: 6, scope: !32)
!189 = !MDLocation(line: 166, column: 2, scope: !190)
!190 = !{!"0xb\00166\002\0012", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!191 = !MDLocation(line: 166, column: 28, scope: !192)
!192 = !{!"0xb\002", !1, !193}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!193 = !{!"0xb\00166\002\0013", !1, !190}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!194 = !MDLocation(line: 166, column: 23, scope: !195)
!195 = !{!"0xb\003", !1, !193}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!196 = !MDLocation(line: 167, column: 2, scope: !32)
