; ModuleID = 'Random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

@dm1 = internal unnamed_addr global double 0.000000e+00, align 8

; Function Attrs: nounwind optsize uwtable
define noalias %struct.Random_struct* @new_Random_seed(i32 %seed) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !27), !dbg !92
  %1 = tail call noalias i8* @malloc(i64 112) #3, !dbg !93
  %2 = bitcast i8* %1 to %struct.Random_struct*, !dbg !93
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %2}, i64 0, metadata !28), !dbg !93
  tail call fastcc void @initialize(%struct.Random_struct* %2, i32 %seed) #4, !dbg !94
  %3 = getelementptr inbounds i8* %1, i64 88, !dbg !95
  %4 = bitcast i8* %3 to double*, !dbg !95
  store double 0.000000e+00, double* %4, align 8, !dbg !95, !tbaa !96
  %5 = getelementptr inbounds i8* %1, i64 96, !dbg !102
  %6 = bitcast i8* %5 to double*, !dbg !102
  store double 1.000000e+00, double* %6, align 8, !dbg !102, !tbaa !103
  %7 = getelementptr inbounds i8* %1, i64 104, !dbg !104
  %8 = bitcast i8* %7 to double*, !dbg !104
  store double 1.000000e+00, double* %8, align 8, !dbg !104, !tbaa !105
  %9 = getelementptr inbounds i8* %1, i64 80, !dbg !106
  %10 = bitcast i8* %9 to i32*, !dbg !106
  store i32 0, i32* %10, align 4, !dbg !106, !tbaa !107
  ret %struct.Random_struct* %2, !dbg !108
}

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind optsize uwtable
define internal fastcc void @initialize(%struct.Random_struct* nocapture %R, i32 %seed) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !76), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !77), !dbg !109
  store double 0x3E00000000200000, double* @dm1, align 8, !dbg !110, !tbaa !111
  %1 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 1, !dbg !112
  store i32 %seed, i32* %1, align 4, !dbg !112, !tbaa !113
  %2 = icmp slt i32 %seed, 0, !dbg !114
  %3 = sub nsw i32 0, %seed, !dbg !114
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !77), !dbg !114
  %.seed = select i1 %2, i32 %3, i32 %seed, !dbg !114
  tail call void @llvm.dbg.value(metadata !{i32 %.seed}, i64 0, metadata !78), !dbg !116
  %4 = and i32 %.seed, 1, !dbg !117
  %sext = add i32 %.seed, -1, !dbg !117
  %jseed.0 = add i32 %sext, %4, !dbg !117
  tail call void @llvm.dbg.value(metadata !119, i64 0, metadata !79), !dbg !120
  tail call void @llvm.dbg.value(metadata !121, i64 0, metadata !80), !dbg !122
  %5 = srem i32 %jseed.0, 65536, !dbg !123
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !81), !dbg !123
  %6 = sdiv i32 %jseed.0, 65536, !dbg !124
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !82), !dbg !124
  tail call void @llvm.dbg.value(metadata !121, i64 0, metadata !83), !dbg !125
  br label %7, !dbg !125

; <label>:7                                       ; preds = %7, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %7 ]
  %j1.02 = phi i32 [ %6, %0 ], [ %12, %7 ]
  %j0.01 = phi i32 [ %5, %0 ], [ %13, %7 ]
  %8 = mul nsw i32 %j0.01, 9069, !dbg !127
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !78), !dbg !127
  %9 = sdiv i32 %8, 65536, !dbg !129
  %10 = mul nsw i32 %j1.02, 9069, !dbg !129
  %11 = add nsw i32 %9, %10, !dbg !129
  %12 = srem i32 %11, 32768, !dbg !129
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !82), !dbg !129
  %13 = srem i32 %8, 65536, !dbg !130
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !81), !dbg !130
  %14 = shl i32 %12, 16, !dbg !131
  %15 = add nsw i32 %13, %14, !dbg !131
  %16 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %indvars.iv, !dbg !131
  store i32 %15, i32* %16, align 4, !dbg !131, !tbaa !132
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !125
  %exitcond = icmp eq i64 %indvars.iv.next, 17, !dbg !125
  br i1 %exitcond, label %17, label %7, !dbg !125

; <label>:17                                      ; preds = %7
  %18 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !133
  store i32 4, i32* %18, align 4, !dbg !133, !tbaa !134
  %19 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !135
  store i32 16, i32* %19, align 4, !dbg !135, !tbaa !136
  ret void, !dbg !137
}

; Function Attrs: nounwind optsize uwtable
define noalias %struct.Random_struct* @new_Random(i32 %seed, double %left, double %right) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !33), !dbg !138
  tail call void @llvm.dbg.value(metadata !{double %left}, i64 0, metadata !34), !dbg !138
  tail call void @llvm.dbg.value(metadata !{double %right}, i64 0, metadata !35), !dbg !138
  %1 = tail call noalias i8* @malloc(i64 112) #3, !dbg !139
  %2 = bitcast i8* %1 to %struct.Random_struct*, !dbg !139
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %2}, i64 0, metadata !36), !dbg !139
  tail call fastcc void @initialize(%struct.Random_struct* %2, i32 %seed) #4, !dbg !140
  %3 = getelementptr inbounds i8* %1, i64 88, !dbg !141
  %4 = bitcast i8* %3 to double*, !dbg !141
  store double %left, double* %4, align 8, !dbg !141, !tbaa !96
  %5 = getelementptr inbounds i8* %1, i64 96, !dbg !142
  %6 = bitcast i8* %5 to double*, !dbg !142
  store double %right, double* %6, align 8, !dbg !142, !tbaa !103
  %7 = fsub double %right, %left, !dbg !143
  %8 = getelementptr inbounds i8* %1, i64 104, !dbg !143
  %9 = bitcast i8* %8 to double*, !dbg !143
  store double %7, double* %9, align 8, !dbg !143, !tbaa !105
  %10 = getelementptr inbounds i8* %1, i64 80, !dbg !144
  %11 = bitcast i8* %10 to i32*, !dbg !144
  store i32 1, i32* %11, align 4, !dbg !144, !tbaa !107
  ret %struct.Random_struct* %2, !dbg !145
}

; Function Attrs: nounwind optsize uwtable
define void @Random_delete(%struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !41), !dbg !146
  %1 = bitcast %struct.Random_struct* %R to i8*, !dbg !147
  tail call void @free(i8* %1) #3, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind optsize uwtable
define double @Random_nextDouble(%struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !46), !dbg !149
  %1 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !150
  %2 = load i32* %1, align 4, !dbg !150, !tbaa !134
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !48), !dbg !150
  %3 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !151
  %4 = load i32* %3, align 4, !dbg !151, !tbaa !136
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !49), !dbg !151
  %5 = sext i32 %2 to i64, !dbg !152
  %6 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %5, !dbg !152
  %7 = load i32* %6, align 4, !dbg !152, !tbaa !132
  %8 = sext i32 %4 to i64, !dbg !152
  %9 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %8, !dbg !152
  %10 = load i32* %9, align 4, !dbg !152, !tbaa !132
  %11 = sub nsw i32 %7, %10, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !47), !dbg !152
  %12 = icmp slt i32 %11, 0, !dbg !153
  %13 = add nsw i32 %11, 2147483647, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !47), !dbg !153
  %. = select i1 %12, i32 %13, i32 %11, !dbg !153
  store i32 %., i32* %9, align 4, !dbg !155, !tbaa !132
  %14 = icmp eq i32 %2, 0, !dbg !156
  %15 = add nsw i32 %2, -1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !48), !dbg !158
  %I.0 = select i1 %14, i32 16, i32 %15, !dbg !156
  store i32 %I.0, i32* %1, align 4, !dbg !159, !tbaa !134
  %16 = icmp eq i32 %4, 0, !dbg !160
  %17 = add nsw i32 %4, -1, !dbg !162
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !49), !dbg !162
  %J.0 = select i1 %16, i32 16, i32 %17, !dbg !160
  store i32 %J.0, i32* %3, align 4, !dbg !163, !tbaa !136
  %18 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !164
  %19 = load i32* %18, align 4, !dbg !164, !tbaa !107
  %20 = icmp eq i32 %19, 0, !dbg !164
  br i1 %20, label %31, label %21, !dbg !164

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !166
  %23 = load double* %22, align 8, !dbg !166, !tbaa !96
  %24 = load double* @dm1, align 8, !dbg !166, !tbaa !111
  %25 = sitofp i32 %. to double, !dbg !166
  %26 = fmul double %25, %24, !dbg !166
  %27 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !166
  %28 = load double* %27, align 8, !dbg !166, !tbaa !105
  %29 = fmul double %26, %28, !dbg !166
  %30 = fadd double %23, %29, !dbg !166
  br label %35, !dbg !166

; <label>:31                                      ; preds = %0
  %32 = load double* @dm1, align 8, !dbg !167, !tbaa !111
  %33 = sitofp i32 %. to double, !dbg !167
  %34 = fmul double %33, %32, !dbg !167
  br label %35, !dbg !167

; <label>:35                                      ; preds = %31, %21
  %.0 = phi double [ %30, %21 ], [ %34, %31 ]
  ret double %.0, !dbg !168
}

; Function Attrs: nounwind optsize uwtable
define noalias double* @RandomVector(i32 %N, %struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !57), !dbg !169
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !58), !dbg !169
  %1 = sext i32 %N to i64, !dbg !170
  %2 = shl nsw i64 %1, 3, !dbg !170
  %3 = tail call noalias i8* @malloc(i64 %2) #3, !dbg !170
  %4 = bitcast i8* %3 to double*, !dbg !170
  tail call void @llvm.dbg.value(metadata !{double* %4}, i64 0, metadata !60), !dbg !170
  tail call void @llvm.dbg.value(metadata !121, i64 0, metadata !59), !dbg !171
  %5 = icmp sgt i32 %N, 0, !dbg !171
  br i1 %5, label %.lr.ph, label %._crit_edge, !dbg !171

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %6 = tail call double @Random_nextDouble(%struct.Random_struct* %R) #4, !dbg !173
  %7 = getelementptr inbounds double* %4, i64 %indvars.iv, !dbg !173
  store double %6, double* %7, align 8, !dbg !173, !tbaa !111
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !171
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !171
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !171
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !171

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret double* %4, !dbg !174
}

; Function Attrs: nounwind optsize uwtable
define noalias double** @RandomMatrix(i32 %M, i32 %N, %struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !66), !dbg !175
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !67), !dbg !175
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !68), !dbg !175
  %1 = sext i32 %M to i64, !dbg !176
  %2 = shl nsw i64 %1, 3, !dbg !176
  %3 = tail call noalias i8* @malloc(i64 %2) #3, !dbg !176
  %4 = bitcast i8* %3 to double**, !dbg !176
  tail call void @llvm.dbg.value(metadata !{double** %4}, i64 0, metadata !71), !dbg !176
  %5 = icmp eq i8* %3, null, !dbg !177
  br i1 %5, label %.loopexit, label %.preheader1, !dbg !177

.preheader1:                                      ; preds = %0
  %6 = icmp sgt i32 %M, 0, !dbg !179
  br i1 %6, label %.lr.ph4, label %.loopexit, !dbg !179

.lr.ph4:                                          ; preds = %.preheader1
  %7 = sext i32 %N to i64, !dbg !181
  %8 = shl nsw i64 %7, 3, !dbg !181
  %9 = icmp sgt i32 %N, 0, !dbg !183
  br label %10, !dbg !179

; <label>:10                                      ; preds = %.lr.ph4, %._crit_edge
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %._crit_edge ]
  %11 = tail call noalias i8* @malloc(i64 %8) #3, !dbg !181
  %12 = bitcast i8* %11 to double*, !dbg !181
  %13 = getelementptr inbounds double** %4, i64 %indvars.iv5, !dbg !181
  store double* %12, double** %13, align 8, !dbg !181, !tbaa !185
  %14 = icmp eq i8* %11, null, !dbg !187
  br i1 %14, label %15, label %.preheader, !dbg !187

.preheader:                                       ; preds = %10
  br i1 %9, label %.lr.ph, label %._crit_edge, !dbg !183

; <label>:15                                      ; preds = %10
  tail call void @free(i8* %3) #3, !dbg !189
  br label %.loopexit, !dbg !191

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %16 = tail call double @Random_nextDouble(%struct.Random_struct* %R) #4, !dbg !192
  %17 = getelementptr inbounds double* %12, i64 %indvars.iv, !dbg !192
  store double %16, double* %17, align 8, !dbg !192, !tbaa !111
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !183
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !183
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !183
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !183

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !179
  %18 = trunc i64 %indvars.iv.next6 to i32, !dbg !179
  %19 = icmp slt i32 %18, %M, !dbg !179
  br i1 %19, label %10, label %.loopexit, !dbg !179

.loopexit:                                        ; preds = %._crit_edge, %.preheader1, %0, %15
  %.0 = phi double** [ null, %15 ], [ null, %0 ], [ %4, %.preheader1 ], [ %4, %._crit_edge ]
  ret double** %.0, !dbg !193
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind optsize }
attributes #4 = { optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!89, !90}
!llvm.ident = !{!91}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !84, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c] [DW_LANG_C99]
!1 = metadata !{metadata !"Random.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !29, metadata !37, metadata !42, metadata !52, metadata !61, metadata !72}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Random_seed", metadata !"new_Random_seed", metadata !"", i32 35, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Random_struct* (i32)* @new_Random_seed, null, null, metadata !26, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [new_Random_seed]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !15}
!8 = metadata !{i32 786454, metadata !9, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!9 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786451, metadata !9, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!12 = metadata !{metadata !13, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !24, metadata !25}
!13 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!14 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !15, metadata !16, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!18 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !15} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!19 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !15} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!20 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !15} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!21 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !15} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!22 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !23} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!23 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!24 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !23} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!25 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !23} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!26 = metadata !{metadata !27, metadata !28}
!27 = metadata !{i32 786689, metadata !4, metadata !"seed", metadata !5, i32 16777251, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 35]
!28 = metadata !{i32 786688, metadata !4, metadata !"R", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 37]
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Random", metadata !"new_Random", metadata !"", i32 48, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Random_struct* (i32, double, double)* @new_Random, null, null, metadata !32, i32 49} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [new_Random]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{metadata !8, metadata !15, metadata !23, metadata !23}
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !36}
!33 = metadata !{i32 786689, metadata !29, metadata !"seed", metadata !5, i32 16777264, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 48]
!34 = metadata !{i32 786689, metadata !29, metadata !"left", metadata !5, i32 33554480, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [left] [line 48]
!35 = metadata !{i32 786689, metadata !29, metadata !"right", metadata !5, i32 50331696, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [right] [line 48]
!36 = metadata !{i32 786688, metadata !29, metadata !"R", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 50]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Random_delete", metadata !"Random_delete", metadata !"", i32 61, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Random_struct*)* @Random_delete, null, null, metadata !40, i32 62} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [Random_delete]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !8}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 786689, metadata !37, metadata !"R", metadata !5, i32 16777277, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 61]
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Random_nextDouble", metadata !"Random_nextDouble", metadata !"", i32 70, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (%struct.Random_struct*)* @Random_nextDouble, null, null, metadata !45, i32 71} ; [ DW_TAG_subprogram ] [line 70] [def] [scope 71] [Random_nextDouble]
!43 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{metadata !23, metadata !8}
!45 = metadata !{metadata !46, metadata !47, metadata !48, metadata !49, metadata !50}
!46 = metadata !{i32 786689, metadata !42, metadata !"R", metadata !5, i32 16777286, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 70]
!47 = metadata !{i32 786688, metadata !42, metadata !"k", metadata !5, i32 72, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 72]
!48 = metadata !{i32 786688, metadata !42, metadata !"I", metadata !5, i32 74, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [I] [line 74]
!49 = metadata !{i32 786688, metadata !42, metadata !"J", metadata !5, i32 75, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [J] [line 75]
!50 = metadata !{i32 786688, metadata !42, metadata !"m", metadata !5, i32 76, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 76]
!51 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!52 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RandomVector", metadata !"RandomVector", metadata !"", i32 134, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double* (i32, %struct.Random_struct*)* @RandomVector, null, null, metadata !56, i32 135} ; [ DW_TAG_subprogram ] [line 134] [def] [scope 135] [RandomVector]
!53 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{metadata !55, metadata !15, metadata !8}
!55 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!56 = metadata !{metadata !57, metadata !58, metadata !59, metadata !60}
!57 = metadata !{i32 786689, metadata !52, metadata !"N", metadata !5, i32 16777350, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 134]
!58 = metadata !{i32 786689, metadata !52, metadata !"R", metadata !5, i32 33554566, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 134]
!59 = metadata !{i32 786688, metadata !52, metadata !"i", metadata !5, i32 136, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 136]
!60 = metadata !{i32 786688, metadata !52, metadata !"x", metadata !5, i32 137, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 137]
!61 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RandomMatrix", metadata !"RandomMatrix", metadata !"", i32 146, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double** (i32, i32, %struct.Random_struct*)* @RandomMatrix, null, null, metadata !65, i32 147} ; [ DW_TAG_subprogram ] [line 146] [def] [scope 147] [RandomMatrix]
!62 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !64, metadata !15, metadata !15, metadata !8}
!64 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71}
!66 = metadata !{i32 786689, metadata !61, metadata !"M", metadata !5, i32 16777362, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 146]
!67 = metadata !{i32 786689, metadata !61, metadata !"N", metadata !5, i32 33554578, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 146]
!68 = metadata !{i32 786689, metadata !61, metadata !"R", metadata !5, i32 50331794, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 146]
!69 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !5, i32 148, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 148]
!70 = metadata !{i32 786688, metadata !61, metadata !"j", metadata !5, i32 149, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 149]
!71 = metadata !{i32 786688, metadata !61, metadata !"A", metadata !5, i32 153, metadata !64, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 153]
!72 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"initialize", metadata !"initialize", metadata !"", i32 106, metadata !73, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Random_struct*, i32)* @initialize, null, null, metadata !75, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [initialize]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{null, metadata !8, metadata !15}
!75 = metadata !{metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81, metadata !82, metadata !83}
!76 = metadata !{i32 786689, metadata !72, metadata !"R", metadata !5, i32 16777322, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 106]
!77 = metadata !{i32 786689, metadata !72, metadata !"seed", metadata !5, i32 33554538, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!78 = metadata !{i32 786688, metadata !72, metadata !"jseed", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!79 = metadata !{i32 786688, metadata !72, metadata !"k0", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!80 = metadata !{i32 786688, metadata !72, metadata !"k1", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!81 = metadata !{i32 786688, metadata !72, metadata !"j0", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!82 = metadata !{i32 786688, metadata !72, metadata !"j1", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!83 = metadata !{i32 786688, metadata !72, metadata !"iloop", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!84 = metadata !{metadata !85, metadata !87, metadata !85, metadata !85, metadata !85, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88}
!85 = metadata !{i32 786484, i32 0, metadata !5, metadata !"m1", metadata !"m1", metadata !"m1", metadata !5, i32 17, metadata !86, i32 1, i32 1, i32 2147483647, null} ; [ DW_TAG_variable ] [m1] [line 17] [local] [def]
!86 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!87 = metadata !{i32 786484, i32 0, null, metadata !"dm1", metadata !"dm1", metadata !"", metadata !5, i32 28, metadata !23, i32 1, i32 1, double* @dm1, null} ; [ DW_TAG_variable ] [dm1] [line 28] [local] [def]
!88 = metadata !{i32 786484, i32 0, metadata !5, metadata !"m2", metadata !"m2", metadata !"m2", metadata !5, i32 18, metadata !86, i32 1, i32 1, i32 65536, null} ; [ DW_TAG_variable ] [m2] [line 18] [local] [def]
!89 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!90 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!91 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!92 = metadata !{i32 35, i32 0, metadata !4, null}
!93 = metadata !{i32 37, i32 0, metadata !4, null}
!94 = metadata !{i32 39, i32 0, metadata !4, null}
!95 = metadata !{i32 40, i32 0, metadata !4, null}
!96 = metadata !{metadata !97, metadata !101, i64 88}
!97 = metadata !{metadata !"", metadata !98, i64 0, metadata !100, i64 68, metadata !100, i64 72, metadata !100, i64 76, metadata !100, i64 80, metadata !101, i64 88, metadata !101, i64 96, metadata !101, i64 104}
!98 = metadata !{metadata !"omnipotent char", metadata !99, i64 0}
!99 = metadata !{metadata !"Simple C/C++ TBAA"}
!100 = metadata !{metadata !"int", metadata !98, i64 0}
!101 = metadata !{metadata !"double", metadata !98, i64 0}
!102 = metadata !{i32 41, i32 0, metadata !4, null}
!103 = metadata !{metadata !97, metadata !101, i64 96}
!104 = metadata !{i32 42, i32 0, metadata !4, null}
!105 = metadata !{metadata !97, metadata !101, i64 104}
!106 = metadata !{i32 43, i32 0, metadata !4, null}
!107 = metadata !{metadata !97, metadata !100, i64 80}
!108 = metadata !{i32 45, i32 0, metadata !4, null}
!109 = metadata !{i32 106, i32 0, metadata !72, null}
!110 = metadata !{i32 111, i32 0, metadata !72, null}
!111 = metadata !{metadata !101, metadata !101, i64 0}
!112 = metadata !{i32 113, i32 0, metadata !72, null}
!113 = metadata !{metadata !97, metadata !100, i64 68}
!114 = metadata !{i32 115, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !72, i32 115, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!116 = metadata !{i32 116, i32 0, metadata !72, null}
!117 = metadata !{i32 117, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !72, i32 117, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!119 = metadata !{i32 9069}
!120 = metadata !{i32 118, i32 0, metadata !72, null}
!121 = metadata !{i32 0}
!122 = metadata !{i32 119, i32 0, metadata !72, null}
!123 = metadata !{i32 120, i32 0, metadata !72, null}
!124 = metadata !{i32 121, i32 0, metadata !72, null}
!125 = metadata !{i32 122, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !72, i32 122, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!127 = metadata !{i32 124, i32 0, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !126, i32 123, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!129 = metadata !{i32 125, i32 0, metadata !128, null}
!130 = metadata !{i32 126, i32 0, metadata !128, null}
!131 = metadata !{i32 127, i32 0, metadata !128, null}
!132 = metadata !{metadata !100, metadata !100, i64 0}
!133 = metadata !{i32 129, i32 0, metadata !72, null}
!134 = metadata !{metadata !97, metadata !100, i64 72}
!135 = metadata !{i32 130, i32 0, metadata !72, null}
!136 = metadata !{metadata !97, metadata !100, i64 76}
!137 = metadata !{i32 132, i32 0, metadata !72, null}
!138 = metadata !{i32 48, i32 0, metadata !29, null}
!139 = metadata !{i32 50, i32 0, metadata !29, null}
!140 = metadata !{i32 52, i32 0, metadata !29, null}
!141 = metadata !{i32 53, i32 0, metadata !29, null}
!142 = metadata !{i32 54, i32 0, metadata !29, null}
!143 = metadata !{i32 55, i32 0, metadata !29, null}
!144 = metadata !{i32 56, i32 0, metadata !29, null}
!145 = metadata !{i32 58, i32 0, metadata !29, null} ; [ DW_TAG_imported_module ]
!146 = metadata !{i32 61, i32 0, metadata !37, null}
!147 = metadata !{i32 63, i32 0, metadata !37, null}
!148 = metadata !{i32 64, i32 0, metadata !37, null}
!149 = metadata !{i32 70, i32 0, metadata !42, null}
!150 = metadata !{i32 74, i32 0, metadata !42, null}
!151 = metadata !{i32 75, i32 0, metadata !42, null}
!152 = metadata !{i32 78, i32 0, metadata !42, null}
!153 = metadata !{i32 79, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !42, i32 79, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!155 = metadata !{i32 80, i32 0, metadata !42, null}
!156 = metadata !{i32 82, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !42, i32 82, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!158 = metadata !{i32 84, i32 0, metadata !157, null}
!159 = metadata !{i32 85, i32 0, metadata !42, null}
!160 = metadata !{i32 87, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !42, i32 87, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!162 = metadata !{i32 89, i32 0, metadata !161, null}
!163 = metadata !{i32 90, i32 0, metadata !42, null}
!164 = metadata !{i32 92, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !42, i32 92, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!166 = metadata !{i32 93, i32 0, metadata !165, null}
!167 = metadata !{i32 95, i32 0, metadata !165, null}
!168 = metadata !{i32 97, i32 0, metadata !42, null}
!169 = metadata !{i32 134, i32 0, metadata !52, null}
!170 = metadata !{i32 137, i32 0, metadata !52, null}
!171 = metadata !{i32 139, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !52, i32 139, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!173 = metadata !{i32 140, i32 0, metadata !172, null}
!174 = metadata !{i32 142, i32 0, metadata !52, null}
!175 = metadata !{i32 146, i32 0, metadata !61, null}
!176 = metadata !{i32 153, i32 0, metadata !61, null}
!177 = metadata !{i32 155, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !61, i32 155, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!179 = metadata !{i32 157, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !61, i32 157, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!181 = metadata !{i32 159, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !180, i32 158, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!183 = metadata !{i32 165, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !182, i32 165, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!185 = metadata !{metadata !186, metadata !186, i64 0}
!186 = metadata !{metadata !"any pointer", metadata !98, i64 0}
!187 = metadata !{i32 160, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !182, i32 160, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!189 = metadata !{i32 162, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !188, i32 161, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!191 = metadata !{i32 163, i32 0, metadata !190, null}
!192 = metadata !{i32 166, i32 0, metadata !184, null}
!193 = metadata !{i32 169, i32 0, metadata !61, null}
