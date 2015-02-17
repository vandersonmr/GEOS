; ModuleID = 'realmm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { double, double }

@seed = common global i64 0, align 8
@rma = common global [41 x [41 x double]] zeroinitializer, align 16
@rmb = common global [41 x [41 x double]] zeroinitializer, align 16
@rmr = common global [41 x [41 x double]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@value = common global double 0.000000e+00, align 8
@fixed = common global double 0.000000e+00, align 8
@floated = common global double 0.000000e+00, align 8
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
@zr = common global double 0.000000e+00, align 8
@zi = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !129, !tbaa !130
  ret void, !dbg !134
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !135, !tbaa !130
  %mul = mul nsw i64 %0, 1309, !dbg !135
  %add = add nsw i64 %mul, 13849, !dbg !135
  %and = and i64 %add, 65535, !dbg !136
  store i64 %and, i64* @seed, align 8, !dbg !137, !tbaa !130
  %conv = trunc i64 %and to i32, !dbg !138
  ret i32 %conv, !dbg !139
}

; Function Attrs: nounwind uwtable
define void @rInitmatrix([41 x double]* nocapture %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata [41 x double]* %m, i64 0, metadata !22, metadata !140), !dbg !141
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !24, metadata !140), !dbg !142
  br label %for.cond1.preheader, !dbg !143

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv18 = phi i64 [ 1, %entry ], [ %indvars.iv.next19, %for.inc8 ]
  br label %for.body3, !dbg !145

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %call = tail call i32 @Rand(), !dbg !148
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !23, metadata !140), !dbg !151
  %div = srem i32 %call, 120, !dbg !152
  %sub4 = add nsw i32 %div, -60, !dbg !153
  %conv = sitofp i32 %sub4 to double, !dbg !154
  %div5 = fdiv double %conv, 3.000000e+00, !dbg !154
  %arrayidx7 = getelementptr inbounds [41 x double]* %m, i64 %indvars.iv18, i64 %indvars.iv, !dbg !155
  store double %div5, double* %arrayidx7, align 8, !dbg !155, !tbaa !156
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !145
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !145
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !145

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !143
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 41, !dbg !143
  br i1 %exitcond20, label %for.end10, label %for.cond1.preheader, !dbg !143

for.end10:                                        ; preds = %for.inc8
  ret void, !dbg !158
}

; Function Attrs: nounwind uwtable
define void @rInnerproduct(double* nocapture %result, [41 x double]* nocapture readonly %a, [41 x double]* nocapture readonly %b, i32 %row, i32 %column) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double* %result, i64 0, metadata !31, metadata !140), !dbg !159
  tail call void @llvm.dbg.value(metadata [41 x double]* %a, i64 0, metadata !32, metadata !140), !dbg !160
  tail call void @llvm.dbg.value(metadata [41 x double]* %b, i64 0, metadata !33, metadata !140), !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %row, i64 0, metadata !34, metadata !140), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %column, i64 0, metadata !35, metadata !140), !dbg !163
  store double 0.000000e+00, double* %result, align 8, !dbg !164, !tbaa !156
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !36, metadata !140), !dbg !165
  %idxprom1 = sext i32 %row to i64, !dbg !166
  %idxprom3 = sext i32 %column to i64, !dbg !169
  br label %for.body, !dbg !170

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = load double* %result, align 8, !dbg !171, !tbaa !156
  %arrayidx2 = getelementptr inbounds [41 x double]* %a, i64 %idxprom1, i64 %indvars.iv, !dbg !166
  %1 = load double* %arrayidx2, align 8, !dbg !166, !tbaa !156
  %arrayidx6 = getelementptr inbounds [41 x double]* %b, i64 %indvars.iv, i64 %idxprom3, !dbg !169
  %2 = load double* %arrayidx6, align 8, !dbg !169, !tbaa !156
  %mul = fmul double %1, %2, !dbg !166
  %add = fadd double %0, %mul, !dbg !171
  store double %add, double* %result, align 8, !dbg !172, !tbaa !156
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !170
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !170
  br i1 %exitcond, label %for.end, label %for.body, !dbg !170

for.end:                                          ; preds = %for.body
  ret void, !dbg !173
}

; Function Attrs: nounwind uwtable
define void @Mm(i32 %run) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %run, i64 0, metadata !41, metadata !140), !dbg !174
  tail call void @Initrand(), !dbg !175
  tail call void @rInitmatrix([41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rma, i64 0, i64 0)), !dbg !176
  tail call void @rInitmatrix([41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rmb, i64 0, i64 0)), !dbg !177
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !42, metadata !140), !dbg !178
  br label %for.cond1.preheader, !dbg !179

for.cond1.preheader:                              ; preds = %for.inc6, %entry
  %indvars.iv23 = phi i64 [ 1, %entry ], [ %indvars.iv.next24, %for.inc6 ]
  br label %for.body3, !dbg !181

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [41 x [41 x double]]* @rmr, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !184
  %0 = trunc i64 %indvars.iv to i32, !dbg !186
  %1 = trunc i64 %indvars.iv23 to i32, !dbg !186
  tail call void @rInnerproduct(double* %arrayidx5, [41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rma, i64 0, i64 0), [41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rmb, i64 0, i64 0), i32 %1, i32 %0), !dbg !186
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !181
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !181
  br i1 %exitcond, label %for.inc6, label %for.body3, !dbg !181

for.inc6:                                         ; preds = %for.body3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !179
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 41, !dbg !179
  br i1 %exitcond25, label %for.end8, label %for.cond1.preheader, !dbg !179

for.end8:                                         ; preds = %for.inc6
  %add = add nsw i32 %run, 1, !dbg !187
  %idxprom9 = sext i32 %add to i64, !dbg !188
  %arrayidx13 = getelementptr inbounds [41 x [41 x double]]* @rmr, i64 0, i64 %idxprom9, i64 %idxprom9, !dbg !188
  %2 = load double* %arrayidx13, align 8, !dbg !188, !tbaa !156
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %2) #3, !dbg !189
  ret void, !dbg !190
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !140), !dbg !191
  br label %for.body, !dbg !192

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Mm(i32 %i.03), !dbg !194
  %inc = add nuw nsw i32 %i.03, 1, !dbg !196
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !46, metadata !140), !dbg !191
  %exitcond = icmp eq i32 %inc, 10, !dbg !192
  br i1 %exitcond, label %for.end, label %for.body, !dbg !192

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !198
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!126, !127}
!llvm.ident = !{!128}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !47, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c] [DW_LANG_C99]
!1 = !{!"realmm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!6 = !{!7, !11, !14, !26, !37, !44}
!7 = !{!"0x2e\00Initrand\00Initrand\00\00117\000\001\000\000\000\001\00117", !1, !8, !9, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 117] [def] [Initrand]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{null}
!11 = !{!"0x2e\00Rand\00Rand\00\00121\000\001\000\000\000\001\00121", !1, !8, !12, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 121] [def] [Rand]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4}
!14 = !{!"0x2e\00rInitmatrix\00rInitmatrix\00\00129\000\001\000\000\00256\001\00129", !1, !8, !15, null, void ([41 x double]*)* @rInitmatrix, null, null, !21} ; [ DW_TAG_subprogram ] [line 129] [def] [rInitmatrix]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{null, !17}
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x1\00\000\002624\0064\000\000\000", null, null, !5, !19, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2624, align 64, offset 0] [from double]
!19 = !{!20}
!20 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!21 = !{!22, !23, !24, !25}
!22 = !{!"0x101\00m\0016777345\000", !14, !8, !17} ; [ DW_TAG_arg_variable ] [m] [line 129]
!23 = !{!"0x100\00temp\00130\000", !14, !8, !4}   ; [ DW_TAG_auto_variable ] [temp] [line 130]
!24 = !{!"0x100\00i\00130\000", !14, !8, !4}      ; [ DW_TAG_auto_variable ] [i] [line 130]
!25 = !{!"0x100\00j\00130\000", !14, !8, !4}      ; [ DW_TAG_auto_variable ] [j] [line 130]
!26 = !{!"0x2e\00rInnerproduct\00rInnerproduct\00\00138\000\001\000\000\00256\001\00138", !1, !8, !27, null, void (double*, [41 x double]*, [41 x double]*, i32, i32)* @rInnerproduct, null, null, !30} ; [ DW_TAG_subprogram ] [line 138] [def] [rInnerproduct]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !29, !17, !17, !4, !4}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!30 = !{!31, !32, !33, !34, !35, !36}
!31 = !{!"0x101\00result\0016777354\000", !26, !8, !29} ; [ DW_TAG_arg_variable ] [result] [line 138]
!32 = !{!"0x101\00a\0033554570\000", !26, !8, !17} ; [ DW_TAG_arg_variable ] [a] [line 138]
!33 = !{!"0x101\00b\0050331786\000", !26, !8, !17} ; [ DW_TAG_arg_variable ] [b] [line 138]
!34 = !{!"0x101\00row\0067109002\000", !26, !8, !4} ; [ DW_TAG_arg_variable ] [row] [line 138]
!35 = !{!"0x101\00column\0083886218\000", !26, !8, !4} ; [ DW_TAG_arg_variable ] [column] [line 138]
!36 = !{!"0x100\00i\00140\000", !26, !8, !4}      ; [ DW_TAG_auto_variable ] [i] [line 140]
!37 = !{!"0x2e\00Mm\00Mm\00\00145\000\001\000\000\00256\001\00145", !1, !8, !38, null, void (i32)* @Mm, null, null, !40} ; [ DW_TAG_subprogram ] [line 145] [def] [Mm]
!38 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !39, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = !{null, !4}
!40 = !{!41, !42, !43}
!41 = !{!"0x101\00run\0016777361\000", !37, !8, !4} ; [ DW_TAG_arg_variable ] [run] [line 145]
!42 = !{!"0x100\00i\00146\000", !37, !8, !4}      ; [ DW_TAG_auto_variable ] [i] [line 146]
!43 = !{!"0x100\00j\00146\000", !37, !8, !4}      ; [ DW_TAG_auto_variable ] [j] [line 146]
!44 = !{!"0x2e\00main\00main\00\00156\000\001\000\000\000\001\00157", !1, !8, !12, null, i32 ()* @main, null, null, !45} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [main]
!45 = !{!46}
!46 = !{!"0x100\00i\00158\000", !44, !8, !4}      ; [ DW_TAG_auto_variable ] [i] [line 158]
!47 = !{!48, !49, !50, !51, !53, !57, !59, !66, !70, !78, !79, !80, !83, !84, !85, !87, !88, !89, !90, !94, !95, !99, !102, !103, !104, !108, !109, !110, !111, !119, !120, !124, !125}
!48 = !{!"0x34\00value\00value\00\0083\000\001", null, !8, !5, double* @value, null} ; [ DW_TAG_variable ] [value] [line 83] [def]
!49 = !{!"0x34\00fixed\00fixed\00\0083\000\001", null, !8, !5, double* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 83] [def]
!50 = !{!"0x34\00floated\00floated\00\0083\000\001", null, !8, !5, double* @floated, null} ; [ DW_TAG_variable ] [floated] [line 83] [def]
!51 = !{!"0x34\00seed\00seed\00\0086\000\001", null, !8, !52, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 86] [def]
!52 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!53 = !{!"0x34\00permarray\00permarray\00\0089\000\001", null, !8, !54, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 89] [def]
!54 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!55 = !{!56}
!56 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!57 = !{!"0x34\00pctr\00pctr\00\0091\000\001", null, !8, !58, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 91] [def]
!58 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!59 = !{!"0x34\00tree\00tree\00\0094\000\001", null, !8, !60, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 94] [def]
!60 = !{!"0xf\00\000\0064\0064\000\000", null, null, !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!61 = !{!"0x13\00node\0047\00192\0064\000\000\000", !1, null, null, !62, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 47, size 192, align 64, offset 0] [def] [from ]
!62 = !{!63, !64, !65}
!63 = !{!"0xd\00left\0048\0064\0064\000\000", !1, !61, !60} ; [ DW_TAG_member ] [left] [line 48, size 64, align 64, offset 0] [from ]
!64 = !{!"0xd\00right\0048\0064\0064\0064\000", !1, !61, !60} ; [ DW_TAG_member ] [right] [line 48, size 64, align 64, offset 64] [from ]
!65 = !{!"0xd\00val\0049\0032\0032\00128\000", !1, !61, !4} ; [ DW_TAG_member ] [val] [line 49, size 32, align 32, offset 128] [from int]
!66 = !{!"0x34\00stack\00stack\00\0097\000\001", null, !8, !67, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 97] [def]
!67 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !68, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!68 = !{!69}
!69 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!70 = !{!"0x34\00cellspace\00cellspace\00\0098\000\001", null, !8, !71, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 98] [def]
!71 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !72, !76, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!72 = !{!"0x13\00element\0056\0064\0032\000\000\000", !1, null, null, !73, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 56, size 64, align 32, offset 0] [def] [from ]
!73 = !{!74, !75}
!74 = !{!"0xd\00discsize\0057\0032\0032\000\000", !1, !72, !4} ; [ DW_TAG_member ] [discsize] [line 57, size 32, align 32, offset 0] [from int]
!75 = !{!"0xd\00next\0058\0032\0032\0032\000", !1, !72, !4} ; [ DW_TAG_member ] [next] [line 58, size 32, align 32, offset 32] [from int]
!76 = !{!77}
!77 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!78 = !{!"0x34\00freelist\00freelist\00\0099\000\001", null, !8, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 99] [def]
!79 = !{!"0x34\00movesdone\00movesdone\00\0099\000\001", null, !8, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 99] [def]
!80 = !{!"0x34\00ima\00ima\00\00103\000\001", null, !8, !81, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 103] [def]
!81 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !82, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!82 = !{!20, !20}
!83 = !{!"0x34\00imb\00imb\00\00103\000\001", null, !8, !81, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 103] [def]
!84 = !{!"0x34\00imr\00imr\00\00103\000\001", null, !8, !81, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 103] [def]
!85 = !{!"0x34\00rma\00rma\00\00104\000\001", null, !8, !86, [41 x [41 x double]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 104] [def]
!86 = !{!"0x1\00\000\00107584\0064\000\000\000", null, null, !5, !82, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 107584, align 64, offset 0] [from double]
!87 = !{!"0x34\00rmb\00rmb\00\00104\000\001", null, !8, !86, [41 x [41 x double]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 104] [def]
!88 = !{!"0x34\00rmr\00rmr\00\00104\000\001", null, !8, !86, [41 x [41 x double]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 104] [def]
!89 = !{!"0x34\00piececount\00piececount\00\00107\000\001", null, !8, !67, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 107] [def]
!90 = !{!"0x34\00class\00class\00\00107\000\001", null, !8, !91, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 107] [def]
!91 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !92, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!92 = !{!93}
!93 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!94 = !{!"0x34\00piecemax\00piecemax\00\00107\000\001", null, !8, !91, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 107] [def]
!95 = !{!"0x34\00puzzl\00puzzl\00\00108\000\001", null, !8, !96, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 108] [def]
!96 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !97, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!97 = !{!98}
!98 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!99 = !{!"0x34\00p\00p\00\00108\000\001", null, !8, !100, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 108] [def]
!100 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !101, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!101 = !{!93, !98}
!102 = !{!"0x34\00n\00n\00\00108\000\001", null, !8, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 108] [def]
!103 = !{!"0x34\00kount\00kount\00\00108\000\001", null, !8, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 108] [def]
!104 = !{!"0x34\00sortlist\00sortlist\00\00111\000\001", null, !8, !105, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 111] [def]
!105 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !106, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!106 = !{!107}
!107 = !{!"0x21\000\005001"}                      ; [ DW_TAG_subrange_type ] [0, 5000]
!108 = !{!"0x34\00biggest\00biggest\00\00111\000\001", null, !8, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 111] [def]
!109 = !{!"0x34\00littlest\00littlest\00\00111\000\001", null, !8, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 111] [def]
!110 = !{!"0x34\00top\00top\00\00111\000\001", null, !8, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 111] [def]
!111 = !{!"0x34\00z\00z\00\00114\000\001", null, !8, !112, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 114] [def]
!112 = !{!"0x1\00\000\0032896\0064\000\000\000", null, null, !113, !117, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32896, align 64, offset 0] [from complex]
!113 = !{!"0x13\00complex\0077\00128\0064\000\000\000", !1, null, null, !114, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 77, size 128, align 64, offset 0] [def] [from ]
!114 = !{!115, !116}
!115 = !{!"0xd\00rp\0077\0064\0064\000\000", !1, !113, !5} ; [ DW_TAG_member ] [rp] [line 77, size 64, align 64, offset 0] [from double]
!116 = !{!"0xd\00ip\0077\0064\0064\0064\000", !1, !113, !5} ; [ DW_TAG_member ] [ip] [line 77, size 64, align 64, offset 64] [from double]
!117 = !{!118}
!118 = !{!"0x21\000\00257"}                       ; [ DW_TAG_subrange_type ] [0, 256]
!119 = !{!"0x34\00w\00w\00\00114\000\001", null, !8, !112, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 114] [def]
!120 = !{!"0x34\00e\00e\00\00114\000\001", null, !8, !121, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 114] [def]
!121 = !{!"0x1\00\000\0016640\0064\000\000\000", null, null, !113, !122, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16640, align 64, offset 0] [from complex]
!122 = !{!123}
!123 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!124 = !{!"0x34\00zr\00zr\00\00115\000\001", null, !8, !5, double* @zr, null} ; [ DW_TAG_variable ] [zr] [line 115] [def]
!125 = !{!"0x34\00zi\00zi\00\00115\000\001", null, !8, !5, double* @zi, null} ; [ DW_TAG_variable ] [zi] [line 115] [def]
!126 = !{i32 2, !"Dwarf Version", i32 4}
!127 = !{i32 2, !"Debug Info Version", i32 2}
!128 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!129 = !MDLocation(line: 118, column: 5, scope: !7)
!130 = !{!131, !131, i64 0}
!131 = !{!"long", !132, i64 0}
!132 = !{!"omnipotent char", !133, i64 0}
!133 = !{!"Simple C/C++ TBAA"}
!134 = !MDLocation(line: 119, column: 1, scope: !7)
!135 = !MDLocation(line: 122, column: 13, scope: !11)
!136 = !MDLocation(line: 122, column: 12, scope: !11)
!137 = !MDLocation(line: 122, column: 5, scope: !11)
!138 = !MDLocation(line: 123, column: 13, scope: !11)
!139 = !MDLocation(line: 123, column: 5, scope: !11)
!140 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!141 = !MDLocation(line: 129, column: 26, scope: !14)
!142 = !MDLocation(line: 130, column: 12, scope: !14)
!143 = !MDLocation(line: 131, column: 2, scope: !144)
!144 = !{!"0xb\00131\002\000", !1, !14}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!145 = !MDLocation(line: 132, column: 6, scope: !146)
!146 = !{!"0xb\00132\006\002", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!147 = !{!"0xb\00131\002\001", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!148 = !MDLocation(line: 133, column: 14, scope: !149)
!149 = !{!"0xb\00132\0039\004", !1, !150}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!150 = !{!"0xb\00132\006\003", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!151 = !MDLocation(line: 130, column: 6, scope: !14)
!152 = !MDLocation(line: 134, column: 29, scope: !149)
!153 = !MDLocation(line: 134, column: 22, scope: !149)
!154 = !MDLocation(line: 134, column: 14, scope: !149)
!155 = !MDLocation(line: 134, column: 4, scope: !149)
!156 = !{!157, !157, i64 0}
!157 = !{!"double", !132, i64 0}
!158 = !MDLocation(line: 136, column: 1, scope: !14)
!159 = !MDLocation(line: 138, column: 27, scope: !26)
!160 = !MDLocation(line: 138, column: 41, scope: !26)
!161 = !MDLocation(line: 138, column: 72, scope: !26)
!162 = !MDLocation(line: 138, column: 101, scope: !26)
!163 = !MDLocation(line: 138, column: 110, scope: !26)
!164 = !MDLocation(line: 141, column: 2, scope: !26)
!165 = !MDLocation(line: 140, column: 6, scope: !26)
!166 = !MDLocation(line: 142, column: 49, scope: !167)
!167 = !{!"0xb\00142\002\006", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!168 = !{!"0xb\00142\002\005", !1, !26}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!169 = !MDLocation(line: 142, column: 59, scope: !167)
!170 = !MDLocation(line: 142, column: 2, scope: !168)
!171 = !MDLocation(line: 142, column: 41, scope: !167)
!172 = !MDLocation(line: 142, column: 31, scope: !167)
!173 = !MDLocation(line: 143, column: 1, scope: !26)
!174 = !MDLocation(line: 145, column: 14, scope: !37)
!175 = !MDLocation(line: 147, column: 5, scope: !37)
!176 = !MDLocation(line: 148, column: 5, scope: !37)
!177 = !MDLocation(line: 149, column: 5, scope: !37)
!178 = !MDLocation(line: 146, column: 9, scope: !37)
!179 = !MDLocation(line: 150, column: 5, scope: !180)
!180 = !{!"0xb\00150\005\007", !1, !37}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!181 = !MDLocation(line: 151, column: 3, scope: !182)
!182 = !{!"0xb\00151\003\009", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!183 = !{!"0xb\00150\005\008", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!184 = !MDLocation(line: 152, column: 18, scope: !185)
!185 = !{!"0xb\00151\003\0010", !1, !182}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!186 = !MDLocation(line: 152, column: 4, scope: !185)
!187 = !MDLocation(line: 153, column: 30, scope: !37)
!188 = !MDLocation(line: 153, column: 17, scope: !37)
!189 = !MDLocation(line: 153, column: 2, scope: !37)
!190 = !MDLocation(line: 154, column: 1, scope: !37)
!191 = !MDLocation(line: 158, column: 6, scope: !44)
!192 = !MDLocation(line: 159, column: 2, scope: !193)
!193 = !{!"0xb\00159\002\0011", !1, !44}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!194 = !MDLocation(line: 159, column: 27, scope: !195)
!195 = !{!"0xb\00159\002\0012", !1, !193}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!196 = !MDLocation(line: 159, column: 22, scope: !197)
!197 = !{!"0xb\003", !1, !195}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/realmm.c]
!198 = !MDLocation(line: 160, column: 2, scope: !44)
