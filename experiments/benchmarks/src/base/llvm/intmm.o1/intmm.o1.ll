; ModuleID = 'intmm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !128, !tbaa !129
  ret void, !dbg !133
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !134, !tbaa !129
  %mul = mul nsw i64 %0, 1309, !dbg !134
  %add = add nsw i64 %mul, 13849, !dbg !134
  %and = and i64 %add, 65535, !dbg !135
  store i64 %and, i64* @seed, align 8, !dbg !136, !tbaa !129
  %conv = trunc i64 %and to i32, !dbg !137
  ret i32 %conv, !dbg !138
}

; Function Attrs: nounwind uwtable
define void @Initmatrix([41 x i32]* nocapture %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata [41 x i32]* %m, i64 0, metadata !20, metadata !139), !dbg !140
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !22, metadata !139), !dbg !141
  br label %for.cond1.preheader, !dbg !142

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv17 = phi i64 [ 1, %entry ], [ %indvars.iv.next18, %for.inc7 ]
  br label %for.body3, !dbg !144

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %call = tail call i32 @Rand(), !dbg !147
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !21, metadata !139), !dbg !150
  %div = srem i32 %call, 120, !dbg !151
  %sub4 = add nsw i32 %div, -60, !dbg !152
  %arrayidx6 = getelementptr inbounds [41 x i32]* %m, i64 %indvars.iv17, i64 %indvars.iv, !dbg !153
  store i32 %sub4, i32* %arrayidx6, align 4, !dbg !153, !tbaa !154
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !144
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !144
  br i1 %exitcond, label %for.inc7, label %for.body3, !dbg !144

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !142
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 41, !dbg !142
  br i1 %exitcond19, label %for.end9, label %for.cond1.preheader, !dbg !142

for.end9:                                         ; preds = %for.inc7
  ret void, !dbg !156
}

; Function Attrs: nounwind uwtable
define void @Innerproduct(i32* nocapture %result, [41 x i32]* nocapture readonly %a, [41 x i32]* nocapture readonly %b, i32 %row, i32 %column) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %result, i64 0, metadata !29, metadata !139), !dbg !157
  tail call void @llvm.dbg.value(metadata [41 x i32]* %a, i64 0, metadata !30, metadata !139), !dbg !158
  tail call void @llvm.dbg.value(metadata [41 x i32]* %b, i64 0, metadata !31, metadata !139), !dbg !159
  tail call void @llvm.dbg.value(metadata i32 %row, i64 0, metadata !32, metadata !139), !dbg !160
  tail call void @llvm.dbg.value(metadata i32 %column, i64 0, metadata !33, metadata !139), !dbg !161
  store i32 0, i32* %result, align 4, !dbg !162, !tbaa !154
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !34, metadata !139), !dbg !163
  %idxprom1 = sext i32 %row to i64, !dbg !164
  %idxprom3 = sext i32 %column to i64, !dbg !167
  br label %for.body, !dbg !168

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = load i32* %result, align 4, !dbg !169, !tbaa !154
  %arrayidx2 = getelementptr inbounds [41 x i32]* %a, i64 %idxprom1, i64 %indvars.iv, !dbg !164
  %1 = load i32* %arrayidx2, align 4, !dbg !164, !tbaa !154
  %arrayidx6 = getelementptr inbounds [41 x i32]* %b, i64 %indvars.iv, i64 %idxprom3, !dbg !167
  %2 = load i32* %arrayidx6, align 4, !dbg !167, !tbaa !154
  %mul = mul nsw i32 %2, %1, !dbg !164
  %add = add nsw i32 %mul, %0, !dbg !169
  store i32 %add, i32* %result, align 4, !dbg !170, !tbaa !154
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !168
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !168
  br i1 %exitcond, label %for.end, label %for.body, !dbg !168

for.end:                                          ; preds = %for.body
  ret void, !dbg !171
}

; Function Attrs: nounwind uwtable
define void @Intmm(i32 %run) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %run, i64 0, metadata !39, metadata !139), !dbg !172
  tail call void @Initrand(), !dbg !173
  tail call void @Initmatrix([41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @ima, i64 0, i64 0)), !dbg !174
  tail call void @Initmatrix([41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @imb, i64 0, i64 0)), !dbg !175
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !40, metadata !139), !dbg !176
  br label %for.cond1.preheader, !dbg !177

for.cond1.preheader:                              ; preds = %for.inc6, %entry
  %indvars.iv23 = phi i64 [ 1, %entry ], [ %indvars.iv.next24, %for.inc6 ]
  br label %for.body3, !dbg !179

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [41 x [41 x i32]]* @imr, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !182
  %0 = trunc i64 %indvars.iv to i32, !dbg !184
  %1 = trunc i64 %indvars.iv23 to i32, !dbg !184
  tail call void @Innerproduct(i32* %arrayidx5, [41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @ima, i64 0, i64 0), [41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @imb, i64 0, i64 0), i32 %1, i32 %0), !dbg !184
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !179
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !179
  br i1 %exitcond, label %for.inc6, label %for.body3, !dbg !179

for.inc6:                                         ; preds = %for.body3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !177
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 41, !dbg !177
  br i1 %exitcond25, label %for.end8, label %for.cond1.preheader, !dbg !177

for.end8:                                         ; preds = %for.inc6
  %add = add nsw i32 %run, 1, !dbg !185
  %idxprom9 = sext i32 %add to i64, !dbg !186
  %arrayidx13 = getelementptr inbounds [41 x [41 x i32]]* @imr, i64 0, i64 %idxprom9, i64 %idxprom9, !dbg !186
  %2 = load i32* %arrayidx13, align 4, !dbg !186, !tbaa !154
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %2) #3, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !44, metadata !139), !dbg !189
  br label %for.body, !dbg !190

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Intmm(i32 %i.03), !dbg !192
  %inc = add nuw nsw i32 %i.03, 1, !dbg !194
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !44, metadata !139), !dbg !189
  %exitcond = icmp eq i32 %inc, 10, !dbg !190
  br i1 %exitcond, label %for.end, label %for.body, !dbg !190

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !196
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!125, !126}
!llvm.ident = !{!127}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !45, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c] [DW_LANG_C99]
!1 = !{!"intmm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !24, !35, !42}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\001\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\001\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Initmatrix\00Initmatrix\00\00127\000\001\000\000\00256\001\00127", !1, !7, !13, null, void ([41 x i32]*)* @Initmatrix, null, null, !19} ; [ DW_TAG_subprogram ] [line 127] [def] [Initmatrix]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !15}
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x1\00\000\001312\0032\000\000\000", null, null, !4, !17, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1312, align 32, offset 0] [from int]
!17 = !{!18}
!18 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!19 = !{!20, !21, !22, !23}
!20 = !{!"0x101\00m\0016777343\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [m] [line 127]
!21 = !{!"0x100\00temp\00128\000", !12, !7, !4}   ; [ DW_TAG_auto_variable ] [temp] [line 128]
!22 = !{!"0x100\00i\00128\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 128]
!23 = !{!"0x100\00j\00128\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 128]
!24 = !{!"0x2e\00Innerproduct\00Innerproduct\00\00136\000\001\000\000\00256\001\00136", !1, !7, !25, null, void (i32*, [41 x i32]*, [41 x i32]*, i32, i32)* @Innerproduct, null, null, !28} ; [ DW_TAG_subprogram ] [line 136] [def] [Innerproduct]
!25 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !26, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = !{null, !27, !15, !15, !4, !4}
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!28 = !{!29, !30, !31, !32, !33, !34}
!29 = !{!"0x101\00result\0016777352\000", !24, !7, !27} ; [ DW_TAG_arg_variable ] [result] [line 136]
!30 = !{!"0x101\00a\0033554568\000", !24, !7, !15} ; [ DW_TAG_arg_variable ] [a] [line 136]
!31 = !{!"0x101\00b\0050331784\000", !24, !7, !15} ; [ DW_TAG_arg_variable ] [b] [line 136]
!32 = !{!"0x101\00row\0067109000\000", !24, !7, !4} ; [ DW_TAG_arg_variable ] [row] [line 136]
!33 = !{!"0x101\00column\0083886216\000", !24, !7, !4} ; [ DW_TAG_arg_variable ] [column] [line 136]
!34 = !{!"0x100\00i\00138\000", !24, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 138]
!35 = !{!"0x2e\00Intmm\00Intmm\00\00143\000\001\000\000\00256\001\00143", !1, !7, !36, null, void (i32)* @Intmm, null, null, !38} ; [ DW_TAG_subprogram ] [line 143] [def] [Intmm]
!36 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !37, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = !{null, !4}
!38 = !{!39, !40, !41}
!39 = !{!"0x101\00run\0016777359\000", !35, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 143]
!40 = !{!"0x100\00i\00144\000", !35, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 144]
!41 = !{!"0x100\00j\00144\000", !35, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 144]
!42 = !{!"0x2e\00main\00main\00\00154\000\001\000\000\000\001\00155", !1, !7, !11, null, i32 ()* @main, null, null, !43} ; [ DW_TAG_subprogram ] [line 154] [def] [scope 155] [main]
!43 = !{!44}
!44 = !{!"0x100\00i\00156\000", !42, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 156]
!45 = !{!46, !48, !49, !50, !52, !56, !58, !65, !69, !77, !78, !79, !82, !83, !84, !86, !87, !88, !89, !93, !94, !98, !101, !102, !103, !107, !108, !109, !110, !118, !119, !123, !124}
!46 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !47, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!47 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!48 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !47, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!49 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !47, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!50 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !51, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!51 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!52 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !53, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!53 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !54, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!54 = !{!55}
!55 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!56 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !57, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!57 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!58 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !59, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!60 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !61, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!61 = !{!62, !63, !64}
!62 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !60, !59} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!63 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !60, !59} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!64 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !60, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!65 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !66, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!66 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !67, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!67 = !{!68}
!68 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!69 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !70, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!70 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !71, !75, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!71 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !72, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!72 = !{!73, !74}
!73 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !71, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!74 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !71, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!75 = !{!76}
!76 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!77 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!78 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!79 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !80, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!80 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !81, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!81 = !{!18, !18}
!82 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !80, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!83 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !80, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!84 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !85, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!85 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !47, !81, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!86 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !85, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!87 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !85, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!88 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !66, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!89 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !90, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!90 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !91, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!91 = !{!92}
!92 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!93 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !90, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!94 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !95, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!95 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !96, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!96 = !{!97}
!97 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!98 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !99, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!99 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !100, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!100 = !{!92, !97}
!101 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!102 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!103 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !104, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!104 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !105, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!105 = !{!106}
!106 = !{!"0x21\000\005001"}                      ; [ DW_TAG_subrange_type ] [0, 5000]
!107 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!108 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!109 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!110 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !111, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!111 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !112, !116, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!112 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !113, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!113 = !{!114, !115}
!114 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !112, !47} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!115 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !112, !47} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!116 = !{!117}
!117 = !{!"0x21\000\00257"}                       ; [ DW_TAG_subrange_type ] [0, 256]
!118 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !111, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!119 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !120, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!120 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !112, !121, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!121 = !{!122}
!122 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!123 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !47, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!124 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !47, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!125 = !{i32 2, !"Dwarf Version", i32 4}
!126 = !{i32 2, !"Debug Info Version", i32 2}
!127 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!128 = !MDLocation(line: 116, column: 5, scope: !6)
!129 = !{!130, !130, i64 0}
!130 = !{!"long", !131, i64 0}
!131 = !{!"omnipotent char", !132, i64 0}
!132 = !{!"Simple C/C++ TBAA"}
!133 = !MDLocation(line: 117, column: 1, scope: !6)
!134 = !MDLocation(line: 120, column: 13, scope: !10)
!135 = !MDLocation(line: 120, column: 12, scope: !10)
!136 = !MDLocation(line: 120, column: 5, scope: !10)
!137 = !MDLocation(line: 121, column: 13, scope: !10)
!138 = !MDLocation(line: 121, column: 5, scope: !10)
!139 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!140 = !MDLocation(line: 127, column: 22, scope: !12)
!141 = !MDLocation(line: 128, column: 12, scope: !12)
!142 = !MDLocation(line: 129, column: 2, scope: !143)
!143 = !{!"0xb\00129\002\000", !1, !12}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!144 = !MDLocation(line: 130, column: 6, scope: !145)
!145 = !{!"0xb\00130\006\002", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!146 = !{!"0xb\00129\002\001", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!147 = !MDLocation(line: 131, column: 13, scope: !148)
!148 = !{!"0xb\00130\0039\004", !1, !149}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!149 = !{!"0xb\00130\006\003", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!150 = !MDLocation(line: 128, column: 6, scope: !12)
!151 = !MDLocation(line: 132, column: 20, scope: !148)
!152 = !MDLocation(line: 132, column: 13, scope: !148)
!153 = !MDLocation(line: 132, column: 3, scope: !148)
!154 = !{!155, !155, i64 0}
!155 = !{!"int", !131, i64 0}
!156 = !MDLocation(line: 134, column: 1, scope: !12)
!157 = !MDLocation(line: 136, column: 25, scope: !24)
!158 = !MDLocation(line: 136, column: 37, scope: !24)
!159 = !MDLocation(line: 136, column: 66, scope: !24)
!160 = !MDLocation(line: 136, column: 95, scope: !24)
!161 = !MDLocation(line: 136, column: 104, scope: !24)
!162 = !MDLocation(line: 139, column: 2, scope: !24)
!163 = !MDLocation(line: 138, column: 6, scope: !24)
!164 = !MDLocation(line: 140, column: 50, scope: !165)
!165 = !{!"0xb\00140\002\006", !1, !166}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!166 = !{!"0xb\00140\002\005", !1, !24}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!167 = !MDLocation(line: 140, column: 60, scope: !165)
!168 = !MDLocation(line: 140, column: 2, scope: !166)
!169 = !MDLocation(line: 140, column: 42, scope: !165)
!170 = !MDLocation(line: 140, column: 32, scope: !165)
!171 = !MDLocation(line: 141, column: 1, scope: !24)
!172 = !MDLocation(line: 143, column: 17, scope: !35)
!173 = !MDLocation(line: 145, column: 5, scope: !35)
!174 = !MDLocation(line: 146, column: 5, scope: !35)
!175 = !MDLocation(line: 147, column: 5, scope: !35)
!176 = !MDLocation(line: 144, column: 9, scope: !35)
!177 = !MDLocation(line: 148, column: 5, scope: !178)
!178 = !{!"0xb\00148\005\007", !1, !35}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!179 = !MDLocation(line: 149, column: 3, scope: !180)
!180 = !{!"0xb\00149\003\009", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!181 = !{!"0xb\00148\005\008", !1, !178}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!182 = !MDLocation(line: 150, column: 17, scope: !183)
!183 = !{!"0xb\00149\003\0010", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!184 = !MDLocation(line: 150, column: 4, scope: !183)
!185 = !MDLocation(line: 151, column: 30, scope: !35)
!186 = !MDLocation(line: 151, column: 17, scope: !35)
!187 = !MDLocation(line: 151, column: 2, scope: !35)
!188 = !MDLocation(line: 152, column: 1, scope: !35)
!189 = !MDLocation(line: 156, column: 6, scope: !42)
!190 = !MDLocation(line: 157, column: 2, scope: !191)
!191 = !{!"0xb\00157\002\0011", !1, !42}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!192 = !MDLocation(line: 157, column: 27, scope: !193)
!193 = !{!"0xb\00157\002\0012", !1, !191}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!194 = !MDLocation(line: 157, column: 22, scope: !195)
!195 = !{!"0xb\003", !1, !193}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/intmm.c]
!196 = !MDLocation(line: 158, column: 2, scope: !42)
