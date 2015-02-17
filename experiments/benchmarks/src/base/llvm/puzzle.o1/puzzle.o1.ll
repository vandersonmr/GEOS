; ModuleID = 'puzzle.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@next = internal unnamed_addr global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @rand() #0 {
entry:
  %0 = load i64* @next, align 8, !dbg !66, !tbaa !67
  %mul = mul i64 %0, 1103515245, !dbg !66
  %add = add i64 %mul, 12345, !dbg !66
  store i64 %add, i64* @next, align 8, !dbg !71, !tbaa !67
  %div = lshr i64 %add, 16, !dbg !72
  %conv = trunc i64 %div to i32, !dbg !73
  %rem = urem i32 %conv, 32767, !dbg !73
  %add1 = add nuw nsw i32 %rem, 1, !dbg !73
  ret i32 %add1, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @srand(i32 %seed) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %seed, i64 0, metadata !16, metadata !75), !dbg !76
  %conv = zext i32 %seed to i64, !dbg !77
  store i64 %conv, i64* @next, align 8, !dbg !78, !tbaa !67
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @randInt(i32 %min, i32 %max) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %min, i64 0, metadata !21, metadata !75), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 %max, i64 0, metadata !22, metadata !75), !dbg !81
  %sub = sub nsw i32 %max, %min, !dbg !82
  %add = add nsw i32 %sub, 1, !dbg !83
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !24, metadata !75), !dbg !84
  %conv = sitofp i32 %add to double, !dbg !85
  %call = tail call i32 @rand() #4, !dbg !86
  %conv1 = sitofp i32 %call to double, !dbg !86
  %div = fmul double %conv1, 0x3F00000000000000, !dbg !86
  %mul = fmul double %conv, %div, !dbg !85
  %conv2 = fptosi double %mul to i32, !dbg !87
  tail call void @llvm.dbg.value(metadata i32 %conv2, i64 0, metadata !23, metadata !75), !dbg !88
  %cmp = icmp eq i32 %conv2, %add, !dbg !89
  %add4 = add nsw i32 %conv2, %min, !dbg !90
  %sub5 = sext i1 %cmp to i32, !dbg !91
  %cond = add nsw i32 %add4, %sub5, !dbg !91
  ret i32 %cond, !dbg !92
}

; Function Attrs: nounwind uwtable
define void @shuffle(i32* nocapture %items, i32 %len) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %items, i64 0, metadata !29, metadata !75), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 %len, i64 0, metadata !30, metadata !75), !dbg !96
  %sub = add nsw i32 %len, -1, !dbg !97
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !36, metadata !75), !dbg !99
  %cmp23 = icmp eq i32 %sub, 0, !dbg !100
  br i1 %cmp23, label %for.end, label %for.body.lr.ph, !dbg !104

for.body.lr.ph:                                   ; preds = %entry
  %conv = sext i32 %sub to i64, !dbg !97
  br label %for.body, !dbg !104

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.024 = phi i64 [ %conv, %for.body.lr.ph ], [ %dec, %for.body ]
  %add = add i64 %i.024, 1, !dbg !105
  %conv2 = uitofp i64 %add to double, !dbg !107
  %call = tail call i32 @rand() #4, !dbg !108
  %conv3 = sitofp i32 %call to double, !dbg !108
  %div = fmul double %conv3, 0x3F00000000000000, !dbg !108
  %mul = fmul double %conv2, %div, !dbg !107
  %conv4 = fptosi double %mul to i32, !dbg !109
  %conv5 = sext i32 %conv4 to i64, !dbg !109
  tail call void @llvm.dbg.value(metadata i64 %conv5, i64 0, metadata !35, metadata !75), !dbg !110
  %cmp7 = icmp eq i64 %conv5, %add, !dbg !111
  %sub9 = sext i1 %cmp7 to i64, !dbg !112
  %cond = add nsw i64 %sub9, %conv5, !dbg !112
  tail call void @llvm.dbg.value(metadata i64 %cond, i64 0, metadata !31, metadata !75), !dbg !113
  %arrayidx = getelementptr inbounds i32* %items, i64 %i.024, !dbg !114
  %0 = load i32* %arrayidx, align 4, !dbg !114, !tbaa !115
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !37, metadata !75), !dbg !117
  %arrayidx10 = getelementptr inbounds i32* %items, i64 %cond, !dbg !118
  %1 = load i32* %arrayidx10, align 4, !dbg !118, !tbaa !115
  store i32 %1, i32* %arrayidx, align 4, !dbg !119, !tbaa !115
  store i32 %0, i32* %arrayidx10, align 4, !dbg !120, !tbaa !115
  %dec = add i64 %i.024, -1, !dbg !121
  tail call void @llvm.dbg.value(metadata i64 %dec, i64 0, metadata !36, metadata !75), !dbg !99
  %cmp = icmp eq i64 %dec, 0, !dbg !100
  br i1 %cmp, label %for.end, label %for.body, !dbg !104

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define noalias i32* @createRandomArray(i32 %size) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %size, i64 0, metadata !42, metadata !75), !dbg !123
  %add = add nsw i32 %size, 1, !dbg !124
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !44, metadata !75), !dbg !125
  %conv = sext i32 %add to i64, !dbg !126
  %mul = shl nsw i64 %conv, 2, !dbg !126
  %call = tail call noalias i8* @malloc(i64 %mul) #4, !dbg !127
  %0 = bitcast i8* %call to i32*, !dbg !128
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !45, metadata !75), !dbg !129
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !75), !dbg !130
  %cmp13 = icmp sgt i32 %size, -1, !dbg !131
  br i1 %cmp13, label %for.body.lr.ph, label %for.end, !dbg !134

for.body.lr.ph:                                   ; preds = %entry
  %1 = sext i32 %add to i64, !dbg !134
  br label %for.body, !dbg !134

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32* %0, i64 %indvars.iv, !dbg !135
  %2 = trunc i64 %indvars.iv to i32, !dbg !135
  store i32 %2, i32* %arrayidx, align 4, !dbg !135, !tbaa !115
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !134
  %cmp = icmp slt i64 %indvars.iv.next, %1, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.end:                                          ; preds = %for.body, %entry
  %call2 = tail call i32 @randInt(i32 1, i32 %size), !dbg !136
  store i32 %call2, i32* %0, align 4, !dbg !137, !tbaa !115
  tail call void @shuffle(i32* %0, i32 %add), !dbg !138
  ret i32* %0, !dbg !139
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readonly uwtable
define i32 @findDuplicate(i32* nocapture readonly %data, i32 %len) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %data, i64 0, metadata !50, metadata !75), !dbg !140
  tail call void @llvm.dbg.value(metadata i32 %len, i64 0, metadata !51, metadata !75), !dbg !141
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !53, metadata !75), !dbg !142
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !75), !dbg !143
  %cmp9 = icmp sgt i32 %len, 0, !dbg !144
  br i1 %cmp9, label %for.body.lr.ph, label %for.end, !dbg !147

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %len, -1, !dbg !147
  br label %for.body, !dbg !147

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %result.011 = phi i32 [ 0, %for.body.lr.ph ], [ %xor1, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !147
  %1 = trunc i64 %indvars.iv.next to i32, !dbg !148
  %xor = xor i32 %result.011, %1, !dbg !148
  %arrayidx = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !149
  %2 = load i32* %arrayidx, align 4, !dbg !149, !tbaa !115
  %xor1 = xor i32 %xor, %2, !dbg !148
  tail call void @llvm.dbg.value(metadata i32 %xor1, i64 0, metadata !53, metadata !75), !dbg !142
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !147
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !147
  br i1 %exitcond, label %for.end, label %for.body, !dbg !147

for.end:                                          ; preds = %for.body, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %xor1, %for.body ]
  %xor2 = xor i32 %result.0.lcssa, %len, !dbg !150
  tail call void @llvm.dbg.value(metadata i32 %xor2, i64 0, metadata !53, metadata !75), !dbg !142
  ret i32 %xor2, !dbg !151
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @srand(i32 1) #4, !dbg !152
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !75), !dbg !153
  br label %for.end, !dbg !154

for.end:                                          ; preds = %entry, %for.end
  %i.012 = phi i32 [ 0, %entry ], [ %inc7, %for.end ]
  %call = tail call i32* @createRandomArray(i32 500000), !dbg !156
  tail call void @llvm.dbg.value(metadata i32* %call, i64 0, metadata !59, metadata !75), !dbg !159
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !75), !dbg !160
  %call4.le = tail call i32 @findDuplicate(i32* %call, i32 500001), !dbg !161
  %0 = bitcast i32* %call to i8*, !dbg !164
  tail call void @free(i8* %0) #4, !dbg !165
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %call4.le) #4, !dbg !166
  %inc7 = add nuw nsw i32 %i.012, 1, !dbg !167
  tail call void @llvm.dbg.value(metadata i32 %inc7, i64 0, metadata !56, metadata !75), !dbg !153
  %exitcond = icmp eq i32 %inc7, 5, !dbg !154
  br i1 %exitcond, label %for.end8, label %for.end, !dbg !154

for.end8:                                         ; preds = %for.end
  ret i32 0, !dbg !168
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !60, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c] [DW_LANG_C99]
!1 = !{!"puzzle.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!7 = !{!8, !12, !17, !25, !38, !46, !54}
!8 = !{!"0x2e\00rand\00rand\00\0015\000\001\000\000\00256\001\0015", !1, !9, !10, null, i32 ()* @rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 15] [def] [rand]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!5}
!12 = !{!"0x2e\00srand\00srand\00\0020\000\001\000\000\00256\001\0020", !1, !9, !13, null, void (i32)* @srand, null, null, !15} ; [ DW_TAG_subprogram ] [line 20] [def] [srand]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !4}
!15 = !{!16}
!16 = !{!"0x101\00seed\0016777236\000", !12, !9, !4} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!17 = !{!"0x2e\00randInt\00randInt\00\0025\000\001\000\000\00256\001\0025", !1, !9, !18, null, i32 (i32, i32)* @randInt, null, null, !20} ; [ DW_TAG_subprogram ] [line 25] [def] [randInt]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!5, !5, !5}
!20 = !{!21, !22, !23, !24}
!21 = !{!"0x101\00min\0016777241\000", !17, !9, !5} ; [ DW_TAG_arg_variable ] [min] [line 25]
!22 = !{!"0x101\00max\0033554457\000", !17, !9, !5} ; [ DW_TAG_arg_variable ] [max] [line 25]
!23 = !{!"0x100\00k\0026\000", !17, !9, !5}       ; [ DW_TAG_auto_variable ] [k] [line 26]
!24 = !{!"0x100\00n\0026\000", !17, !9, !5}       ; [ DW_TAG_auto_variable ] [n] [line 26]
!25 = !{!"0x2e\00shuffle\00shuffle\00\0032\000\001\000\000\00256\001\0032", !1, !9, !26, null, void (i32*, i32)* @shuffle, null, null, !28} ; [ DW_TAG_subprogram ] [line 32] [def] [shuffle]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !6, !5}
!28 = !{!29, !30, !31, !35, !36, !37}
!29 = !{!"0x101\00items\0016777248\000", !25, !9, !6} ; [ DW_TAG_arg_variable ] [items] [line 32]
!30 = !{!"0x101\00len\0033554464\000", !25, !9, !5} ; [ DW_TAG_arg_variable ] [len] [line 32]
!31 = !{!"0x100\00j\0033\000", !25, !9, !32}      ; [ DW_TAG_auto_variable ] [j] [line 33]
!32 = !{!"0x16\00size_t\0062\000\000\000\000", !33, null, !34} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!33 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!34 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!35 = !{!"0x100\00k\0033\000", !25, !9, !32}      ; [ DW_TAG_auto_variable ] [k] [line 33]
!36 = !{!"0x100\00i\0033\000", !25, !9, !32}      ; [ DW_TAG_auto_variable ] [i] [line 33]
!37 = !{!"0x100\00aux\0034\000", !25, !9, !5}     ; [ DW_TAG_auto_variable ] [aux] [line 34]
!38 = !{!"0x2e\00createRandomArray\00createRandomArray\00\0046\000\001\000\000\00256\001\0046", !1, !9, !39, null, i32* (i32)* @createRandomArray, null, null, !41} ; [ DW_TAG_subprogram ] [line 46] [def] [createRandomArray]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!6, !5}
!41 = !{!42, !43, !44, !45}
!42 = !{!"0x101\00size\0016777262\000", !38, !9, !5} ; [ DW_TAG_arg_variable ] [size] [line 46]
!43 = !{!"0x100\00i\0047\000", !38, !9, !5}       ; [ DW_TAG_auto_variable ] [i] [line 47]
!44 = !{!"0x100\00len\0047\000", !38, !9, !5}     ; [ DW_TAG_auto_variable ] [len] [line 47]
!45 = !{!"0x100\00result\0048\000", !38, !9, !6}  ; [ DW_TAG_auto_variable ] [result] [line 48]
!46 = !{!"0x2e\00findDuplicate\00findDuplicate\00\0059\000\001\000\000\00256\001\0059", !1, !9, !47, null, i32 (i32*, i32)* @findDuplicate, null, null, !49} ; [ DW_TAG_subprogram ] [line 59] [def] [findDuplicate]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!5, !6, !5}
!49 = !{!50, !51, !52, !53}
!50 = !{!"0x101\00data\0016777275\000", !46, !9, !6} ; [ DW_TAG_arg_variable ] [data] [line 59]
!51 = !{!"0x101\00len\0033554491\000", !46, !9, !5} ; [ DW_TAG_arg_variable ] [len] [line 59]
!52 = !{!"0x100\00i\0060\000", !46, !9, !5}       ; [ DW_TAG_auto_variable ] [i] [line 60]
!53 = !{!"0x100\00result\0061\000", !46, !9, !5}  ; [ DW_TAG_auto_variable ] [result] [line 61]
!54 = !{!"0x2e\00main\00main\00\0069\000\001\000\000\000\001\0069", !1, !9, !10, null, i32 ()* @main, null, null, !55} ; [ DW_TAG_subprogram ] [line 69] [def] [main]
!55 = !{!56, !57, !58, !59}
!56 = !{!"0x100\00i\0070\000", !54, !9, !5}       ; [ DW_TAG_auto_variable ] [i] [line 70]
!57 = !{!"0x100\00j\0070\000", !54, !9, !5}       ; [ DW_TAG_auto_variable ] [j] [line 70]
!58 = !{!"0x100\00duplicate\0070\000", !54, !9, !5} ; [ DW_TAG_auto_variable ] [duplicate] [line 70]
!59 = !{!"0x100\00rndArr\0071\000", !54, !9, !6}  ; [ DW_TAG_auto_variable ] [rndArr] [line 71]
!60 = !{!61}
!61 = !{!"0x34\00next\00next\00\0013\001\001", null, !9, !62, i64* @next, null} ; [ DW_TAG_variable ] [next] [line 13] [local] [def]
!62 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!63 = !{i32 2, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 2}
!65 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!66 = !MDLocation(line: 16, column: 12, scope: !8)
!67 = !{!68, !68, i64 0}
!68 = !{!"long long", !69, i64 0}
!69 = !{!"omnipotent char", !70, i64 0}
!70 = !{!"Simple C/C++ TBAA"}
!71 = !MDLocation(line: 16, column: 5, scope: !8)
!72 = !MDLocation(line: 17, column: 27, scope: !8)
!73 = !MDLocation(line: 17, column: 12, scope: !8)
!74 = !MDLocation(line: 17, column: 5, scope: !8)
!75 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!76 = !MDLocation(line: 20, column: 26, scope: !12)
!77 = !MDLocation(line: 21, column: 12, scope: !12)
!78 = !MDLocation(line: 21, column: 5, scope: !12)
!79 = !MDLocation(line: 22, column: 1, scope: !12)
!80 = !MDLocation(line: 25, column: 17, scope: !17)
!81 = !MDLocation(line: 25, column: 26, scope: !17)
!82 = !MDLocation(line: 27, column: 10, scope: !17)
!83 = !MDLocation(line: 27, column: 9, scope: !17)
!84 = !MDLocation(line: 26, column: 12, scope: !17)
!85 = !MDLocation(line: 28, column: 15, scope: !17)
!86 = !MDLocation(line: 28, column: 20, scope: !17)
!87 = !MDLocation(line: 28, column: 9, scope: !17)
!88 = !MDLocation(line: 26, column: 9, scope: !17)
!89 = !MDLocation(line: 29, column: 13, scope: !17)
!90 = !MDLocation(line: 29, column: 23, scope: !17)
!91 = !MDLocation(line: 29, column: 12, scope: !17)
!92 = !MDLocation(line: 29, column: 5, scope: !93)
!93 = !{!"0xb\004", !1, !94}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!94 = !{!"0xb\003", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!95 = !MDLocation(line: 32, column: 19, scope: !25)
!96 = !MDLocation(line: 32, column: 30, scope: !25)
!97 = !MDLocation(line: 36, column: 13, scope: !98)
!98 = !{!"0xb\0036\005\000", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!99 = !MDLocation(line: 33, column: 18, scope: !25)
!100 = !MDLocation(line: 36, column: 20, scope: !101)
!101 = !{!"0xb\002", !1, !102}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!102 = !{!"0xb\001", !1, !103}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!103 = !{!"0xb\0036\005\001", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!104 = !MDLocation(line: 36, column: 5, scope: !98)
!105 = !MDLocation(line: 37, column: 20, scope: !106)
!106 = !{!"0xb\0036\0032\002", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!107 = !MDLocation(line: 37, column: 19, scope: !106)
!108 = !MDLocation(line: 37, column: 30, scope: !106)
!109 = !MDLocation(line: 37, column: 13, scope: !106)
!110 = !MDLocation(line: 33, column: 15, scope: !25)
!111 = !MDLocation(line: 38, column: 14, scope: !106)
!112 = !MDLocation(line: 38, column: 13, scope: !106)
!113 = !MDLocation(line: 33, column: 12, scope: !25)
!114 = !MDLocation(line: 40, column: 15, scope: !106)
!115 = !{!116, !116, i64 0}
!116 = !{!"int", !69, i64 0}
!117 = !MDLocation(line: 34, column: 9, scope: !25)
!118 = !MDLocation(line: 41, column: 20, scope: !106)
!119 = !MDLocation(line: 41, column: 9, scope: !106)
!120 = !MDLocation(line: 42, column: 9, scope: !106)
!121 = !MDLocation(line: 36, column: 27, scope: !103)
!122 = !MDLocation(line: 44, column: 1, scope: !25)
!123 = !MDLocation(line: 46, column: 28, scope: !38)
!124 = !MDLocation(line: 50, column: 11, scope: !38)
!125 = !MDLocation(line: 47, column: 12, scope: !38)
!126 = !MDLocation(line: 51, column: 27, scope: !38)
!127 = !MDLocation(line: 51, column: 20, scope: !38)
!128 = !MDLocation(line: 51, column: 14, scope: !38)
!129 = !MDLocation(line: 48, column: 10, scope: !38)
!130 = !MDLocation(line: 47, column: 9, scope: !38)
!131 = !MDLocation(line: 52, column: 17, scope: !132)
!132 = !{!"0xb\0052\005\004", !1, !133}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!133 = !{!"0xb\0052\005\003", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!134 = !MDLocation(line: 52, column: 5, scope: !133)
!135 = !MDLocation(line: 53, column: 9, scope: !132)
!136 = !MDLocation(line: 54, column: 17, scope: !38)
!137 = !MDLocation(line: 54, column: 5, scope: !38)
!138 = !MDLocation(line: 55, column: 5, scope: !38)
!139 = !MDLocation(line: 56, column: 5, scope: !38)
!140 = !MDLocation(line: 59, column: 24, scope: !46)
!141 = !MDLocation(line: 59, column: 34, scope: !46)
!142 = !MDLocation(line: 61, column: 9, scope: !46)
!143 = !MDLocation(line: 60, column: 9, scope: !46)
!144 = !MDLocation(line: 63, column: 17, scope: !145)
!145 = !{!"0xb\0063\005\006", !1, !146}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!146 = !{!"0xb\0063\005\005", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!147 = !MDLocation(line: 63, column: 5, scope: !146)
!148 = !MDLocation(line: 64, column: 18, scope: !145)
!149 = !MDLocation(line: 64, column: 37, scope: !145)
!150 = !MDLocation(line: 65, column: 5, scope: !46)
!151 = !MDLocation(line: 66, column: 5, scope: !46)
!152 = !MDLocation(line: 73, column: 5, scope: !54)
!153 = !MDLocation(line: 70, column: 9, scope: !54)
!154 = !MDLocation(line: 75, column: 2, scope: !155)
!155 = !{!"0xb\0075\002\007", !1, !54}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!156 = !MDLocation(line: 76, column: 12, scope: !157)
!157 = !{!"0xb\0075\0032\009", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!158 = !{!"0xb\0075\002\008", !1, !155}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!159 = !MDLocation(line: 71, column: 10, scope: !54)
!160 = !MDLocation(line: 70, column: 12, scope: !54)
!161 = !MDLocation(line: 78, column: 16, scope: !162)
!162 = !{!"0xb\0077\003\0011", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!163 = !{!"0xb\0077\003\0010", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!164 = !MDLocation(line: 79, column: 8, scope: !157)
!165 = !MDLocation(line: 79, column: 3, scope: !157)
!166 = !MDLocation(line: 80, column: 3, scope: !157)
!167 = !MDLocation(line: 75, column: 27, scope: !158)
!168 = !MDLocation(line: 83, column: 5, scope: !54)
