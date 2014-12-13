; ModuleID = 'puzzle.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@next = internal unnamed_addr global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: nounwind optsize uwtable
define i32 @rand() #0 {
  %1 = load i64* @next, align 8, !dbg !65, !tbaa !66
  %2 = mul i64 %1, 1103515245, !dbg !65
  %3 = add i64 %2, 12345, !dbg !65
  store i64 %3, i64* @next, align 8, !dbg !65, !tbaa !66
  %4 = lshr i64 %3, 16, !dbg !70
  %5 = trunc i64 %4 to i32, !dbg !70
  %6 = urem i32 %5, 32767, !dbg !70
  %7 = add i32 %6, 1, !dbg !70
  ret i32 %7, !dbg !70
}

; Function Attrs: nounwind optsize uwtable
define void @srand(i32 %seed) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !14), !dbg !71
  %1 = zext i32 %seed to i64, !dbg !72
  store i64 %1, i64* @next, align 8, !dbg !72, !tbaa !66
  ret void, !dbg !73
}

; Function Attrs: nounwind optsize uwtable
define i32 @randInt(i32 %min, i32 %max) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %min}, i64 0, metadata !19), !dbg !74
  tail call void @llvm.dbg.value(metadata !{i32 %max}, i64 0, metadata !20), !dbg !74
  %1 = sub nsw i32 %max, %min, !dbg !75
  %2 = add nsw i32 %1, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !22), !dbg !75
  %3 = sitofp i32 %2 to double, !dbg !76
  %4 = load i64* @next, align 8, !dbg !77, !tbaa !66
  %5 = mul i64 %4, 1103515245, !dbg !77
  %6 = add i64 %5, 12345, !dbg !77
  store i64 %6, i64* @next, align 8, !dbg !77, !tbaa !66
  %7 = lshr i64 %6, 16, !dbg !78
  %8 = trunc i64 %7 to i32, !dbg !78
  %9 = urem i32 %8, 32767, !dbg !78
  %10 = add i32 %9, 1, !dbg !78
  %11 = sitofp i32 %10 to double, !dbg !76
  %12 = fmul double %11, 0x3F00000000000000, !dbg !76
  %13 = fmul double %3, %12, !dbg !76
  %14 = fptosi double %13 to i32, !dbg !76
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !21), !dbg !76
  %15 = icmp eq i32 %14, %2, !dbg !79
  %16 = add nsw i32 %14, %min, !dbg !79
  %17 = sext i1 %15 to i32, !dbg !79
  %18 = add nsw i32 %16, %17, !dbg !79
  ret i32 %18, !dbg !79
}

; Function Attrs: nounwind optsize uwtable
define void @shuffle(i32* nocapture %items, i32 %len) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %items}, i64 0, metadata !28), !dbg !80
  tail call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !29), !dbg !80
  %1 = add nsw i32 %len, -1, !dbg !81
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !35), !dbg !81
  %2 = icmp eq i32 %1, 0, !dbg !81
  br i1 %2, label %28, label %.lr.ph, !dbg !81

.lr.ph:                                           ; preds = %0
  %3 = sext i32 %1 to i64, !dbg !81
  %next.promoted = load i64* @next, align 8, !dbg !83, !tbaa !66
  br label %4, !dbg !81

; <label>:4                                       ; preds = %.lr.ph, %4
  %5 = phi i64 [ %next.promoted, %.lr.ph ], [ %9, %4 ], !dbg !84
  %i.01 = phi i64 [ %3, %.lr.ph ], [ %26, %4 ]
  %6 = add i64 %i.01, 1, !dbg !84
  %7 = uitofp i64 %6 to double, !dbg !84
  %8 = mul i64 %5, 1103515245, !dbg !83
  %9 = add i64 %8, 12345, !dbg !83
  %10 = lshr i64 %9, 16, !dbg !86
  %11 = trunc i64 %10 to i32, !dbg !86
  %12 = urem i32 %11, 32767, !dbg !86
  %13 = add i32 %12, 1, !dbg !86
  %14 = sitofp i32 %13 to double, !dbg !84
  %15 = fmul double %14, 0x3F00000000000000, !dbg !84
  %16 = fmul double %7, %15, !dbg !84
  %17 = fptosi double %16 to i32, !dbg !84
  %18 = sext i32 %17 to i64, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i64 %18}, i64 0, metadata !34), !dbg !84
  %19 = icmp eq i64 %18, %6, !dbg !87
  %20 = sext i1 %19 to i64, !dbg !87
  %21 = add i64 %20, %18, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i64 %21}, i64 0, metadata !30), !dbg !87
  %22 = getelementptr inbounds i32* %items, i64 %i.01, !dbg !88
  %23 = load i32* %22, align 4, !dbg !88, !tbaa !89
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !36), !dbg !88
  %24 = getelementptr inbounds i32* %items, i64 %21, !dbg !91
  %25 = load i32* %24, align 4, !dbg !91, !tbaa !89
  store i32 %25, i32* %22, align 4, !dbg !91, !tbaa !89
  store i32 %23, i32* %24, align 4, !dbg !92, !tbaa !89
  %26 = add i64 %i.01, -1, !dbg !81
  tail call void @llvm.dbg.value(metadata !{i64 %26}, i64 0, metadata !35), !dbg !81
  %27 = icmp eq i64 %26, 0, !dbg !81
  br i1 %27, label %._crit_edge, label %4, !dbg !81

._crit_edge:                                      ; preds = %4
  store i64 %9, i64* @next, align 8, !dbg !83, !tbaa !66
  br label %28, !dbg !81

; <label>:28                                      ; preds = %._crit_edge, %0
  ret void, !dbg !93
}

; Function Attrs: nounwind optsize uwtable
define noalias i32* @createRandomArray(i32 %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !41), !dbg !94
  %1 = add nsw i32 %size, 1, !dbg !95
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !43), !dbg !95
  %2 = sext i32 %1 to i64, !dbg !96
  %3 = shl nsw i64 %2, 2, !dbg !96
  %4 = tail call noalias i8* @malloc(i64 %3) #4, !dbg !96
  %5 = bitcast i8* %4 to i32*, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !44), !dbg !96
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !42), !dbg !98
  %6 = icmp sgt i32 %size, -1, !dbg !98
  br i1 %6, label %.lr.ph, label %._crit_edge, !dbg !98

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %7 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !100
  %8 = trunc i64 %indvars.iv to i32, !dbg !100
  store i32 %8, i32* %7, align 4, !dbg !100, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !98
  %9 = trunc i64 %indvars.iv.next to i32, !dbg !98
  %10 = icmp slt i32 %9, %1, !dbg !98
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !98

._crit_edge:                                      ; preds = %.lr.ph, %0
  tail call void @llvm.dbg.value(metadata !101, i64 0, metadata !102), !dbg !104
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !105), !dbg !104
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !106), !dbg !107
  %11 = sitofp i32 %size to double, !dbg !108
  %12 = load i64* @next, align 8, !dbg !109, !tbaa !66
  %13 = mul i64 %12, 1103515245, !dbg !109
  %14 = add i64 %13, 12345, !dbg !109
  store i64 %14, i64* @next, align 8, !dbg !109, !tbaa !66
  %15 = lshr i64 %14, 16, !dbg !110
  %16 = trunc i64 %15 to i32, !dbg !110
  %17 = urem i32 %16, 32767, !dbg !110
  %18 = add i32 %17, 1, !dbg !110
  %19 = sitofp i32 %18 to double, !dbg !108
  %20 = fmul double %19, 0x3F00000000000000, !dbg !108
  %21 = fmul double %11, %20, !dbg !108
  %22 = fptosi double %21 to i32, !dbg !108
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !111), !dbg !108
  %23 = icmp eq i32 %22, %size, !dbg !112
  %24 = add nsw i32 %22, 1, !dbg !112
  %25 = sext i1 %23 to i32, !dbg !112
  %26 = add nsw i32 %24, %25, !dbg !112
  store i32 %26, i32* %5, align 4, !dbg !103, !tbaa !89
  tail call void @shuffle(i32* %5, i32 %1) #5, !dbg !113
  ret i32* %5, !dbg !114
}

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind optsize readonly uwtable
define i32 @findDuplicate(i32* nocapture readonly %data, i32 %len) #2 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !49), !dbg !115
  tail call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !50), !dbg !115
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !52), !dbg !116
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !51), !dbg !117
  %1 = icmp sgt i32 %len, 0, !dbg !117
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !117

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %result.02 = phi i32 [ %6, %.lr.ph ], [ 0, %0 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !117
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !119
  %3 = xor i32 %result.02, %2, !dbg !119
  %4 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !119
  %5 = load i32* %4, align 4, !dbg !119, !tbaa !89
  %6 = xor i32 %3, %5, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !52), !dbg !119
  %exitcond = icmp eq i32 %2, %len, !dbg !117
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !117

._crit_edge:                                      ; preds = %.lr.ph, %0
  %result.0.lcssa = phi i32 [ 0, %0 ], [ %6, %.lr.ph ]
  %7 = xor i32 %result.0.lcssa, %len, !dbg !120
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !52), !dbg !120
  ret i32 %7, !dbg !121
}

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !101, i64 0, metadata !122), !dbg !124
  store i64 1, i64* @next, align 8, !dbg !125, !tbaa !66
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !55), !dbg !126
  br label %1, !dbg !126

; <label>:1                                       ; preds = %9, %0
  %i.02 = phi i32 [ 0, %0 ], [ %13, %9 ]
  %2 = tail call i32* @createRandomArray(i32 500000) #5, !dbg !128
  tail call void @llvm.dbg.value(metadata !{i32* %2}, i64 0, metadata !58), !dbg !128
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !56), !dbg !130
  br label %.lr.ph.i.preheader, !dbg !130

.lr.ph.i.preheader:                               ; preds = %findDuplicate.exit, %1
  %j.01 = phi i32 [ 0, %1 ], [ %8, %findDuplicate.exit ]
  br label %.lr.ph.i, !dbg !132

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
  %result.02.i = phi i32 [ %7, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !132
  %3 = trunc i64 %indvars.iv.next.i to i32, !dbg !134
  %4 = xor i32 %3, %result.02.i, !dbg !134
  %5 = getelementptr inbounds i32* %2, i64 %indvars.iv.i, !dbg !134
  %6 = load i32* %5, align 4, !dbg !134, !tbaa !89
  %7 = xor i32 %4, %6, !dbg !134
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !135), !dbg !134
  %exitcond = icmp eq i64 %indvars.iv.next.i, 500001, !dbg !132
  br i1 %exitcond, label %findDuplicate.exit, label %.lr.ph.i, !dbg !132

findDuplicate.exit:                               ; preds = %.lr.ph.i
  %8 = add nsw i32 %j.01, 1, !dbg !130
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !56), !dbg !130
  %exitcond3 = icmp eq i32 %8, 200, !dbg !130
  br i1 %exitcond3, label %9, label %.lr.ph.i.preheader, !dbg !130

; <label>:9                                       ; preds = %findDuplicate.exit
  %10 = xor i32 %7, 500001, !dbg !136
  %11 = bitcast i32* %2 to i8*, !dbg !137
  tail call void @free(i8* %11) #4, !dbg !137
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %10) #4, !dbg !138
  %13 = add nsw i32 %i.02, 1, !dbg !126
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !55), !dbg !126
  %exitcond4 = icmp eq i32 %13, 5, !dbg !126
  br i1 %exitcond4, label %14, label %1, !dbg !126

; <label>:14                                      ; preds = %9
  ret i32 0, !dbg !139
}

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind optsize }
attributes #5 = { optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!62, !63}
!llvm.ident = !{!64}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !59, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c] [DW_LANG_C99]
!1 = metadata !{metadata !"puzzle.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !15, metadata !23, metadata !37, metadata !45, metadata !53}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rand", metadata !"rand", metadata !"", i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @rand, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [rand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"srand", metadata !"srand", metadata !"", i32 20, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @srand, null, null, metadata !13, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [srand]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786689, metadata !9, metadata !"seed", metadata !5, i32 16777236, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"randInt", metadata !"randInt", metadata !"", i32 25, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @randInt, null, null, metadata !18, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [randInt]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !8, metadata !8, metadata !8}
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !22}
!19 = metadata !{i32 786689, metadata !15, metadata !"min", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min] [line 25]
!20 = metadata !{i32 786689, metadata !15, metadata !"max", metadata !5, i32 33554457, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 25]
!21 = metadata !{i32 786688, metadata !15, metadata !"k", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 26]
!22 = metadata !{i32 786688, metadata !15, metadata !"n", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 26]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"shuffle", metadata !"shuffle", metadata !"", i32 32, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32)* @shuffle, null, null, metadata !27, i32 32} ; [ DW_TAG_subprogram ] [line 32] [def] [shuffle]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !26, metadata !8}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!27 = metadata !{metadata !28, metadata !29, metadata !30, metadata !34, metadata !35, metadata !36}
!28 = metadata !{i32 786689, metadata !23, metadata !"items", metadata !5, i32 16777248, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [items] [line 32]
!29 = metadata !{i32 786689, metadata !23, metadata !"len", metadata !5, i32 33554464, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!30 = metadata !{i32 786688, metadata !23, metadata !"j", metadata !5, i32 33, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 33]
!31 = metadata !{i32 786454, metadata !32, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!32 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!33 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!34 = metadata !{i32 786688, metadata !23, metadata !"k", metadata !5, i32 33, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 33]
!35 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 33, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 33]
!36 = metadata !{i32 786688, metadata !23, metadata !"aux", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [aux] [line 34]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"createRandomArray", metadata !"createRandomArray", metadata !"", i32 46, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32* (i32)* @createRandomArray, null, null, metadata !40, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [createRandomArray]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !26, metadata !8}
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44}
!41 = metadata !{i32 786689, metadata !37, metadata !"size", metadata !5, i32 16777262, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 46]
!42 = metadata !{i32 786688, metadata !37, metadata !"i", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 47]
!43 = metadata !{i32 786688, metadata !37, metadata !"len", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 47]
!44 = metadata !{i32 786688, metadata !37, metadata !"result", metadata !5, i32 48, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 48]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"findDuplicate", metadata !"findDuplicate", metadata !"", i32 59, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @findDuplicate, null, null, metadata !48, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [findDuplicate]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !8, metadata !26, metadata !8}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52}
!49 = metadata !{i32 786689, metadata !45, metadata !"data", metadata !5, i32 16777275, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 59]
!50 = metadata !{i32 786689, metadata !45, metadata !"len", metadata !5, i32 33554491, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 59]
!51 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 60]
!52 = metadata !{i32 786688, metadata !45, metadata !"result", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 61]
!53 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 69, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !54, i32 69} ; [ DW_TAG_subprogram ] [line 69] [def] [main]
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58}
!55 = metadata !{i32 786688, metadata !53, metadata !"i", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 70]
!56 = metadata !{i32 786688, metadata !53, metadata !"j", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 70]
!57 = metadata !{i32 786688, metadata !53, metadata !"duplicate", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [duplicate] [line 70]
!58 = metadata !{i32 786688, metadata !53, metadata !"rndArr", metadata !5, i32 71, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rndArr] [line 71]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786484, i32 0, null, metadata !"next", metadata !"next", metadata !"", metadata !5, i32 13, metadata !61, i32 1, i32 1, i64* @next, null} ; [ DW_TAG_variable ] [next] [line 13] [local] [def]
!61 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!62 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!63 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!64 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!65 = metadata !{i32 16, i32 0, metadata !4, null}
!66 = metadata !{metadata !67, metadata !67, i64 0}
!67 = metadata !{metadata !"long long", metadata !68, i64 0}
!68 = metadata !{metadata !"omnipotent char", metadata !69, i64 0}
!69 = metadata !{metadata !"Simple C/C++ TBAA"}
!70 = metadata !{i32 17, i32 0, metadata !4, null}
!71 = metadata !{i32 20, i32 0, metadata !9, null}
!72 = metadata !{i32 21, i32 0, metadata !9, null}
!73 = metadata !{i32 22, i32 0, metadata !9, null}
!74 = metadata !{i32 25, i32 0, metadata !15, null}
!75 = metadata !{i32 27, i32 0, metadata !15, null}
!76 = metadata !{i32 28, i32 0, metadata !15, null}
!77 = metadata !{i32 16, i32 0, metadata !4, metadata !76}
!78 = metadata !{i32 17, i32 0, metadata !4, metadata !76}
!79 = metadata !{i32 29, i32 0, metadata !15, null}
!80 = metadata !{i32 32, i32 0, metadata !23, null}
!81 = metadata !{i32 36, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !23, i32 36, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!83 = metadata !{i32 16, i32 0, metadata !4, metadata !84}
!84 = metadata !{i32 37, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 36, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!86 = metadata !{i32 17, i32 0, metadata !4, metadata !84}
!87 = metadata !{i32 38, i32 0, metadata !85, null}
!88 = metadata !{i32 40, i32 0, metadata !85, null}
!89 = metadata !{metadata !90, metadata !90, i64 0}
!90 = metadata !{metadata !"int", metadata !68, i64 0}
!91 = metadata !{i32 41, i32 0, metadata !85, null}
!92 = metadata !{i32 42, i32 0, metadata !85, null}
!93 = metadata !{i32 44, i32 0, metadata !23, null}
!94 = metadata !{i32 46, i32 0, metadata !37, null}
!95 = metadata !{i32 50, i32 0, metadata !37, null}
!96 = metadata !{i32 51, i32 0, metadata !37, null}
!97 = metadata !{i32 0}
!98 = metadata !{i32 52, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !37, i32 52, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!100 = metadata !{i32 53, i32 0, metadata !99, null}
!101 = metadata !{i32 1}
!102 = metadata !{i32 786689, metadata !15, metadata !"min", metadata !5, i32 16777241, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [min] [line 25]
!103 = metadata !{i32 54, i32 0, metadata !37, null}
!104 = metadata !{i32 25, i32 0, metadata !15, metadata !103}
!105 = metadata !{i32 786689, metadata !15, metadata !"max", metadata !5, i32 33554457, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [max] [line 25]
!106 = metadata !{i32 786688, metadata !15, metadata !"n", metadata !5, i32 26, metadata !8, i32 0, metadata !103} ; [ DW_TAG_auto_variable ] [n] [line 26]
!107 = metadata !{i32 27, i32 0, metadata !15, metadata !103}
!108 = metadata !{i32 28, i32 0, metadata !15, metadata !103}
!109 = metadata !{i32 16, i32 0, metadata !4, metadata !108}
!110 = metadata !{i32 17, i32 0, metadata !4, metadata !108}
!111 = metadata !{i32 786688, metadata !15, metadata !"k", metadata !5, i32 26, metadata !8, i32 0, metadata !103} ; [ DW_TAG_auto_variable ] [k] [line 26]
!112 = metadata !{i32 29, i32 0, metadata !15, metadata !103}
!113 = metadata !{i32 55, i32 0, metadata !37, null}
!114 = metadata !{i32 56, i32 0, metadata !37, null}
!115 = metadata !{i32 59, i32 0, metadata !45, null}
!116 = metadata !{i32 61, i32 0, metadata !45, null}
!117 = metadata !{i32 63, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !45, i32 63, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!119 = metadata !{i32 64, i32 0, metadata !118, null}
!120 = metadata !{i32 65, i32 0, metadata !45, null}
!121 = metadata !{i32 66, i32 0, metadata !45, null}
!122 = metadata !{i32 786689, metadata !9, metadata !"seed", metadata !5, i32 16777236, metadata !12, i32 0, metadata !123} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!123 = metadata !{i32 73, i32 0, metadata !53, null}
!124 = metadata !{i32 20, i32 0, metadata !9, metadata !123}
!125 = metadata !{i32 21, i32 0, metadata !9, metadata !123}
!126 = metadata !{i32 75, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !53, i32 75, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!128 = metadata !{i32 76, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !127, i32 75, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!130 = metadata !{i32 77, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !129, i32 77, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!132 = metadata !{i32 63, i32 0, metadata !118, metadata !133}
!133 = metadata !{i32 78, i32 0, metadata !131, null}
!134 = metadata !{i32 64, i32 0, metadata !118, metadata !133}
!135 = metadata !{i32 786688, metadata !45, metadata !"result", metadata !5, i32 61, metadata !8, i32 0, metadata !133} ; [ DW_TAG_auto_variable ] [result] [line 61]
!136 = metadata !{i32 65, i32 0, metadata !45, metadata !133}
!137 = metadata !{i32 79, i32 0, metadata !129, null}
!138 = metadata !{i32 80, i32 0, metadata !129, null}
!139 = metadata !{i32 83, i32 0, metadata !53, null}
