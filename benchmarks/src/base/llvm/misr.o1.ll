; ModuleID = 'misr.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cells = type { i32, i32, %struct.cells* }

@reg_len = common global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%hu\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"Register too long; Max. = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"Prob. out of range 0=<Prob>=1\0A\00", align 1
@.str3 = private unnamed_addr constant [43 x i8] c"Structure does not match Register length:\0A\00", align 1
@.str4 = private unnamed_addr constant [75 x i8] c"reg_len\09#_vect\09prob      #_tms\09struct\09seed1\09seed2\09seed3\09Prob same output\0A \00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"%d\09%d\09%.3e %d\09%s\09%d\09%d\09%d\09%.8e\0A\00", align 1
@str = private unnamed_addr constant [42 x i8] c"Structure does not match Register length:\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  %cell_array = alloca %struct.cells, align 8
  %structure = alloca [100 x i8], align 16
  %seed = alloca [3 x i16], align 2
  call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !79
  call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !79
  call void @llvm.dbg.declare(metadata !{%struct.cells* %cell_array}, metadata !15), !dbg !80
  %1 = getelementptr inbounds [100 x i8]* %structure, i64 0, i64 0, !dbg !81
  call void @llvm.lifetime.start(i64 100, i8* %1) #2, !dbg !81
  call void @llvm.dbg.declare(metadata !{[100 x i8]* %structure}, metadata !29), !dbg !81
  call void @llvm.dbg.declare(metadata !{[3 x i16]* %seed}, metadata !33), !dbg !82
  call void @llvm.dbg.value(metadata !83, i64 0, metadata !23), !dbg !84
  store i32 10, i32* @reg_len, align 4, !dbg !84, !tbaa !85
  call void @llvm.dbg.value(metadata !89, i64 0, metadata !27), !dbg !90
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !24), !dbg !92
  %2 = icmp sgt i32 %argc, 6, !dbg !93
  br i1 %2, label %5, label %.preheader, !dbg !93

.preheader:                                       ; preds = %0
  %3 = load i32* @reg_len, align 4, !dbg !95, !tbaa !85
  %4 = icmp sgt i32 %3, 1, !dbg !95
  br i1 %4, label %._crit_edge, label %13, !dbg !95

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds i8** %argv, i64 6, !dbg !93
  %7 = load i8** %6, align 8, !dbg !93, !tbaa !98
  %8 = call i8* @strcpy(i8* %1, i8* %7) #2, !dbg !93
  br label %17, !dbg !93

._crit_edge:                                      ; preds = %.preheader
  %9 = load i32* @reg_len, align 4, !dbg !95, !tbaa !85
  %scevgep = getelementptr [100 x i8]* %structure, i64 0, i64 1
  %10 = icmp sgt i32 %9, 2
  %.op = add i32 %9, -2, !dbg !95
  %11 = zext i32 %.op to i64
  %.op5 = add i64 %11, 1, !dbg !95
  %12 = select i1 %10, i64 %.op5, i64 1, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 48, i64 %12, i32 1, i1 false), !dbg !100
  br label %13, !dbg !95

; <label>:13                                      ; preds = %._crit_edge, %.preheader
  store i8 49, i8* %1, align 16, !dbg !101, !tbaa !102
  %14 = load i32* @reg_len, align 4, !dbg !103, !tbaa !85
  %15 = sext i32 %14 to i64, !dbg !103
  %16 = getelementptr inbounds [100 x i8]* %structure, i64 0, i64 %15, !dbg !103
  store i8 0, i8* %16, align 1, !dbg !103, !tbaa !102
  br label %17

; <label>:17                                      ; preds = %13, %5
  %18 = icmp sgt i32 %argc, 7, !dbg !104
  br i1 %18, label %19, label %24, !dbg !104

; <label>:19                                      ; preds = %17
  %20 = getelementptr inbounds i8** %argv, i64 7, !dbg !104
  %21 = load i8** %20, align 8, !dbg !104, !tbaa !98
  %22 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 0, !dbg !104
  %23 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %21, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i16* %22) #2, !dbg !104
  br label %26, !dbg !104

; <label>:24                                      ; preds = %17
  %25 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 0, !dbg !104
  store i16 1, i16* %25, align 2, !dbg !104, !tbaa !106
  br label %26

; <label>:26                                      ; preds = %24, %19
  %27 = icmp sgt i32 %argc, 8, !dbg !108
  br i1 %27, label %28, label %33, !dbg !108

; <label>:28                                      ; preds = %26
  %29 = getelementptr inbounds i8** %argv, i64 8, !dbg !108
  %30 = load i8** %29, align 8, !dbg !108, !tbaa !98
  %31 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 1, !dbg !108
  %32 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %30, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i16* %31) #2, !dbg !108
  br label %35, !dbg !108

; <label>:33                                      ; preds = %26
  %34 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 1, !dbg !108
  store i16 0, i16* %34, align 2, !dbg !108, !tbaa !106
  br label %35

; <label>:35                                      ; preds = %33, %28
  %36 = icmp sgt i32 %argc, 9, !dbg !110
  br i1 %36, label %37, label %42, !dbg !110

; <label>:37                                      ; preds = %35
  %38 = getelementptr inbounds i8** %argv, i64 9, !dbg !110
  %39 = load i8** %38, align 8, !dbg !110, !tbaa !98
  %40 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 2, !dbg !110
  %41 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %39, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i16* %40) #2, !dbg !110
  br label %44, !dbg !110

; <label>:42                                      ; preds = %35
  %43 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 2, !dbg !110
  store i16 0, i16* %43, align 2, !dbg !110, !tbaa !106
  br label %44

; <label>:44                                      ; preds = %42, %37
  %45 = load i32* @reg_len, align 4, !dbg !112, !tbaa !85
  %46 = icmp sgt i32 %45, 100, !dbg !112
  br i1 %46, label %47, label %49, !dbg !112

; <label>:47                                      ; preds = %44
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 100) #2, !dbg !114
  br label %76, !dbg !116

; <label>:49                                      ; preds = %44
  %50 = call i64 @strlen(i8* %1) #5, !dbg !117
  %51 = sext i32 %45 to i64, !dbg !117
  %52 = icmp eq i64 %50, %51, !dbg !117
  br i1 %52, label %54, label %53, !dbg !117

; <label>:53                                      ; preds = %49
  %puts = call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @str, i64 0, i64 0)), !dbg !119
  br label %76, !dbg !121

; <label>:54                                      ; preds = %49
  %55 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 0, !dbg !122
  %56 = call i16* @seed48(i16* %55) #2, !dbg !122
  call void @create_link_list(%struct.cells* %cell_array), !dbg !123
  call void @llvm.dbg.value(metadata !124, i64 0, metadata !25), !dbg !125
  call void @llvm.dbg.value(metadata !124, i64 0, metadata !26), !dbg !126
  br label %57, !dbg !126

; <label>:57                                      ; preds = %57, %54
  %i.13 = phi i32 [ 0, %54 ], [ %60, %57 ]
  %num_true.02 = phi i32 [ 0, %54 ], [ %59, %57 ]
  call void @init(%struct.cells* %cell_array), !dbg !130
  %58 = call i32 @simulate(i32 10, %struct.cells* %cell_array, double 2.500000e-01, i8* %1), !dbg !132
  %59 = add nsw i32 %58, %num_true.02, !dbg !132
  call void @llvm.dbg.value(metadata !{i32 %59}, i64 0, metadata !25), !dbg !132
  %60 = add nsw i32 %i.13, 1, !dbg !126
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !26), !dbg !126
  %exitcond = icmp eq i32 %60, 100000, !dbg !126
  br i1 %exitcond, label %61, label %57, !dbg !126

; <label>:61                                      ; preds = %57
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([75 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !133
  %63 = load i32* @reg_len, align 4, !dbg !134, !tbaa !85
  %64 = load i16* %55, align 2, !dbg !134, !tbaa !106
  %65 = zext i16 %64 to i32, !dbg !134
  %66 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 1, !dbg !134
  %67 = load i16* %66, align 2, !dbg !134, !tbaa !106
  %68 = zext i16 %67 to i32, !dbg !134
  %69 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 2, !dbg !134
  %70 = load i16* %69, align 2, !dbg !134, !tbaa !106
  %71 = zext i16 %70 to i32, !dbg !134
  %72 = sub nsw i32 100000, %59, !dbg !134
  %73 = sitofp i32 %72 to double, !dbg !134
  %74 = fdiv double %73, 1.000000e+05, !dbg !134
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i64 0, i64 0), i32 %63, i32 10, double 2.500000e-01, i32 100000, i8* %1, i32 %65, i32 %68, i32 %71, double %74) #2, !dbg !134
  br label %76, !dbg !135

; <label>:76                                      ; preds = %61, %53, %47
  %.0 = phi i32 [ 2, %47 ], [ 4, %53 ], [ 0, %61 ]
  call void @llvm.lifetime.end(i64 100, i8* %1) #2, !dbg !135
  ret i32 %.0, !dbg !136
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8* nocapture readonly) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #4

; Function Attrs: nounwind
declare i16* @seed48(i16*) #3

; Function Attrs: nounwind uwtable
define void @create_link_list(%struct.cells* nocapture %cell_array) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %cell_array}, i64 0, metadata !43), !dbg !137
  %1 = bitcast %struct.cells* %cell_array to i8*, !dbg !138
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false), !dbg !138
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %cell_array}, i64 0, metadata !46), !dbg !139
  tail call void @llvm.dbg.value(metadata !124, i64 0, metadata !44), !dbg !140
  %2 = load i32* @reg_len, align 4, !dbg !140, !tbaa !85
  %3 = icmp sgt i32 %2, -1, !dbg !140
  br i1 %3, label %.lr.ph, label %._crit_edge, !dbg !140

.lr.ph:                                           ; preds = %0, %.lr.ph
  %present.02 = phi %struct.cells* [ %5, %.lr.ph ], [ %cell_array, %0 ]
  %i.01 = phi i32 [ %12, %.lr.ph ], [ 0, %0 ]
  %4 = tail call noalias i8* @malloc(i64 16) #2, !dbg !142
  %5 = bitcast i8* %4 to %struct.cells*, !dbg !142
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %5}, i64 0, metadata !45), !dbg !142
  %6 = bitcast i8* %4 to i32*, !dbg !144
  store i32 1, i32* %6, align 4, !dbg !144, !tbaa !145
  %7 = getelementptr inbounds i8* %4, i64 4, !dbg !147
  %8 = bitcast i8* %7 to i32*, !dbg !147
  store i32 1, i32* %8, align 4, !dbg !147, !tbaa !148
  %9 = getelementptr inbounds i8* %4, i64 8, !dbg !149
  %10 = bitcast i8* %9 to %struct.cells**, !dbg !149
  store %struct.cells* null, %struct.cells** %10, align 8, !dbg !149, !tbaa !150
  %11 = getelementptr inbounds %struct.cells* %present.02, i64 0, i32 2, !dbg !151
  store %struct.cells* %5, %struct.cells** %11, align 8, !dbg !151, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %5}, i64 0, metadata !46), !dbg !152
  %12 = add nsw i32 %i.01, 1, !dbg !140
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !44), !dbg !140
  %13 = load i32* @reg_len, align 4, !dbg !140, !tbaa !85
  %14 = icmp slt i32 %i.01, %13, !dbg !140
  br i1 %14, label %.lr.ph, label %._crit_edge, !dbg !140

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !153
}

; Function Attrs: nounwind uwtable
define void @init(%struct.cells* nocapture %present) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !53), !dbg !154
  %1 = getelementptr inbounds %struct.cells* %present, i64 0, i32 2, !dbg !155
  %2 = load %struct.cells** %1, align 8, !dbg !155, !tbaa !150
  %3 = icmp eq %struct.cells* %2, null, !dbg !155
  br i1 %3, label %._crit_edge, label %.lr.ph, !dbg !155

.lr.ph:                                           ; preds = %0, %.lr.ph
  %4 = phi %struct.cells** [ %9, %.lr.ph ], [ %1, %0 ]
  %.01 = phi %struct.cells* [ %8, %.lr.ph ], [ %present, %0 ]
  %5 = getelementptr inbounds %struct.cells* %.01, i64 0, i32 0, !dbg !156
  %6 = load i32* %5, align 4, !dbg !156, !tbaa !145
  %7 = getelementptr inbounds %struct.cells* %.01, i64 0, i32 1, !dbg !156
  store i32 %6, i32* %7, align 4, !dbg !156, !tbaa !148
  %8 = load %struct.cells** %4, align 8, !dbg !158, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %8}, i64 0, metadata !53), !dbg !158
  %9 = getelementptr inbounds %struct.cells* %8, i64 0, i32 2, !dbg !155
  %10 = load %struct.cells** %9, align 8, !dbg !155, !tbaa !150
  %11 = icmp eq %struct.cells* %10, null, !dbg !155
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !155

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !159
}

; Function Attrs: nounwind uwtable
define i32 @simulate(i32 %iterations, %struct.cells* nocapture %present, double %prob, i8* nocapture readonly %structure) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %iterations}, i64 0, metadata !58), !dbg !160
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !59), !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %prob}, i64 0, metadata !60), !dbg !160
  tail call void @llvm.dbg.value(metadata !{i8* %structure}, i64 0, metadata !61), !dbg !160
  tail call void @llvm.dbg.value(metadata !124, i64 0, metadata !63), !dbg !161
  %1 = load i32* @reg_len, align 4, !dbg !162, !tbaa !85
  %2 = add nsw i32 %1, -1, !dbg !162
  %3 = sdiv i32 %2, 31, !dbg !162
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !67), !dbg !162
  %4 = srem i32 %2, 31, !dbg !163
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !66), !dbg !163
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !62), !dbg !164
  tail call void @llvm.dbg.value(metadata !124, i64 0, metadata !68), !dbg !165
  %5 = icmp sgt i32 %iterations, 0, !dbg !165
  br i1 %5, label %.preheader8.lr.ph, label %.preheader, !dbg !165

.preheader8.lr.ph:                                ; preds = %0
  %6 = icmp sgt i32 %2, 30, !dbg !167
  %7 = icmp sgt i32 %4, 0, !dbg !170
  %8 = mul nsw i32 %3, 31, !dbg !172
  %9 = sext i32 %8 to i64, !dbg !165
  br label %.preheader8, !dbg !165

.preheader8:                                      ; preds = %103, %.preheader8.lr.ph
  %h.035 = phi i32 [ 0, %.preheader8.lr.ph ], [ %121, %103 ]
  %10 = tail call i64 @lrand48() #2, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa}, i64 0, metadata !71), !dbg !175
  tail call void @llvm.dbg.value(metadata !124, i64 0, metadata !70), !dbg !177
  br i1 %6, label %.preheader6, label %.preheader7, !dbg !167

.preheaderthread-pre-split:                       ; preds = %103
  %.pr = load i32* @reg_len, align 4, !dbg !179, !tbaa !85
  br label %.preheader

.preheader:                                       ; preds = %.preheaderthread-pre-split, %0
  %11 = phi i32 [ %.pr, %.preheaderthread-pre-split ], [ %1, %0 ], !dbg !179
  %12 = icmp sgt i32 %11, 0, !dbg !179
  br i1 %12, label %.lr.ph, label %._crit_edge, !dbg !179

.lr.ph:                                           ; preds = %.preheader
  %13 = load i32* @reg_len, align 4, !dbg !179, !tbaa !85
  br label %122, !dbg !179

.preheader7:                                      ; preds = %53, %.preheader8
  %.lcssa = phi i64 [ %10, %.preheader8 ], [ %56, %53 ]
  %temp.1.lcssa = phi %struct.cells* [ %present, %.preheader8 ], [ %51, %53 ]
  %14 = phi <2 x i32> [ zeroinitializer, %.preheader8 ], [ %29, %53 ]
  br i1 %7, label %.lr.ph30, label %._crit_edge31, !dbg !170

.preheader6:                                      ; preds = %.preheader8, %53
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %53 ], [ 0, %.preheader8 ]
  %15 = phi i64 [ %56, %53 ], [ %10, %.preheader8 ]
  %temp.119 = phi %struct.cells* [ %51, %53 ], [ %present, %.preheader8 ]
  %16 = phi <2 x i32> [ %29, %53 ], [ zeroinitializer, %.preheader8 ]
  %sext = mul i64 %indvars.iv39, 133143986176, !dbg !177
  %17 = ashr exact i64 %sext, 32, !dbg !177
  br label %18, !dbg !177

; <label>:18                                      ; preds = %28, %.preheader6
  %indvars.iv = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next, %28 ]
  %randv.016 = phi i64 [ %15, %.preheader6 ], [ %52, %28 ]
  %temp.214 = phi %struct.cells* [ %temp.119, %.preheader6 ], [ %51, %28 ]
  %19 = phi <2 x i32> [ %16, %.preheader6 ], [ %29, %28 ]
  %20 = add nsw i64 %indvars.iv, %17, !dbg !181
  %21 = getelementptr inbounds i8* %structure, i64 %20, !dbg !181
  %22 = load i8* %21, align 1, !dbg !181, !tbaa !102
  %23 = icmp eq i8 %22, 49, !dbg !181
  br i1 %23, label %24, label %28, !dbg !181

; <label>:24                                      ; preds = %18
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !64), !dbg !185
  %25 = bitcast %struct.cells* %temp.214 to <2 x i32>*, !dbg !185
  %26 = load <2 x i32>* %25, align 4, !dbg !185, !tbaa !85
  %27 = add <2 x i32> %26, %19, !dbg !185
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !65), !dbg !187
  br label %28, !dbg !188

; <label>:28                                      ; preds = %24, %18
  %29 = phi <2 x i32> [ %27, %24 ], [ %19, %18 ]
  %30 = getelementptr inbounds %struct.cells* %temp.214, i64 0, i32 2, !dbg !189
  %31 = load %struct.cells** %30, align 8, !dbg !189, !tbaa !150
  %32 = getelementptr inbounds %struct.cells* %31, i64 0, i32 0, !dbg !189
  %33 = load i32* %32, align 4, !dbg !189, !tbaa !145
  %34 = zext i32 %33 to i64, !dbg !189
  %35 = add nsw i64 %34, %randv.016, !dbg !189
  %.tr4 = trunc i64 %35 to i32, !dbg !189
  %36 = and i32 %.tr4, 1, !dbg !189
  %37 = getelementptr inbounds %struct.cells* %temp.214, i64 0, i32 0, !dbg !189
  store i32 %36, i32* %37, align 4, !dbg !189, !tbaa !145
  %38 = tail call i64 @lrand48() #2, !dbg !190
  %39 = srem i64 %38, 1000, !dbg !190
  %40 = sitofp i64 %39 to double, !dbg !190
  %41 = fdiv double %40, 1.000000e+03, !dbg !190
  tail call void @llvm.dbg.value(metadata !{double %41}, i64 0, metadata !73), !dbg !190
  %42 = fcmp olt double %41, %prob, !dbg !191
  %43 = zext i1 %42 to i64, !dbg !191
  %randv.1 = xor i64 %43, %randv.016, !dbg !191
  %44 = load %struct.cells** %30, align 8, !dbg !193, !tbaa !150
  %45 = getelementptr inbounds %struct.cells* %44, i64 0, i32 1, !dbg !193
  %46 = load i32* %45, align 4, !dbg !193, !tbaa !148
  %47 = zext i32 %46 to i64, !dbg !193
  %48 = add nsw i64 %47, %randv.1, !dbg !193
  %.tr5 = trunc i64 %48 to i32, !dbg !193
  %49 = and i32 %.tr5, 1, !dbg !193
  %50 = getelementptr inbounds %struct.cells* %temp.214, i64 0, i32 1, !dbg !193
  store i32 %49, i32* %50, align 4, !dbg !193, !tbaa !148
  %51 = load %struct.cells** %30, align 8, !dbg !194, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %51}, i64 0, metadata !62), !dbg !194
  %52 = ashr i64 %randv.016, 1, !dbg !195
  tail call void @llvm.dbg.value(metadata !{i64 %52}, i64 0, metadata !71), !dbg !195
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !177
  %exitcond = icmp eq i64 %indvars.iv.next, 31, !dbg !177
  br i1 %exitcond, label %53, label %18, !dbg !177

; <label>:53                                      ; preds = %28
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1, !dbg !167
  %54 = trunc i64 %indvars.iv.next40 to i32, !dbg !167
  %55 = icmp slt i32 %54, %3, !dbg !167
  %56 = tail call i64 @lrand48() #2, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa}, i64 0, metadata !71), !dbg !175
  tail call void @llvm.dbg.value(metadata !124, i64 0, metadata !70), !dbg !177
  br i1 %55, label %.preheader6, label %.preheader7, !dbg !167

.lr.ph30:                                         ; preds = %.preheader7, %66
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %66 ], [ 0, %.preheader7 ]
  %randv.229 = phi i64 [ %90, %66 ], [ %.lcssa, %.preheader7 ]
  %temp.327 = phi %struct.cells* [ %89, %66 ], [ %temp.1.lcssa, %.preheader7 ]
  %57 = phi <2 x i32> [ %67, %66 ], [ %14, %.preheader7 ]
  %58 = add nsw i64 %indvars.iv41, %9, !dbg !172
  %59 = getelementptr inbounds i8* %structure, i64 %58, !dbg !172
  %60 = load i8* %59, align 1, !dbg !172, !tbaa !102
  %61 = icmp eq i8 %60, 49, !dbg !172
  br i1 %61, label %62, label %66, !dbg !172

; <label>:62                                      ; preds = %.lr.ph30
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !64), !dbg !196
  %63 = bitcast %struct.cells* %temp.327 to <2 x i32>*, !dbg !196
  %64 = load <2 x i32>* %63, align 4, !dbg !196, !tbaa !85
  %65 = add <2 x i32> %64, %57, !dbg !196
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !65), !dbg !198
  br label %66, !dbg !199

; <label>:66                                      ; preds = %62, %.lr.ph30
  %67 = phi <2 x i32> [ %65, %62 ], [ %57, %.lr.ph30 ]
  %68 = getelementptr inbounds %struct.cells* %temp.327, i64 0, i32 2, !dbg !200
  %69 = load %struct.cells** %68, align 8, !dbg !200, !tbaa !150
  %70 = getelementptr inbounds %struct.cells* %69, i64 0, i32 0, !dbg !200
  %71 = load i32* %70, align 4, !dbg !200, !tbaa !145
  %72 = zext i32 %71 to i64, !dbg !200
  %73 = add nsw i64 %72, %randv.229, !dbg !200
  %.tr2 = trunc i64 %73 to i32, !dbg !200
  %74 = and i32 %.tr2, 1, !dbg !200
  %75 = getelementptr inbounds %struct.cells* %temp.327, i64 0, i32 0, !dbg !200
  store i32 %74, i32* %75, align 4, !dbg !200, !tbaa !145
  %76 = tail call i64 @lrand48() #2, !dbg !201
  %77 = srem i64 %76, 1000, !dbg !201
  %78 = sitofp i64 %77 to double, !dbg !201
  %79 = fdiv double %78, 1.000000e+03, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !73), !dbg !201
  %80 = fcmp olt double %79, %prob, !dbg !202
  %81 = zext i1 %80 to i64, !dbg !202
  %randv.3 = xor i64 %81, %randv.229, !dbg !202
  %82 = load %struct.cells** %68, align 8, !dbg !204, !tbaa !150
  %83 = getelementptr inbounds %struct.cells* %82, i64 0, i32 1, !dbg !204
  %84 = load i32* %83, align 4, !dbg !204, !tbaa !148
  %85 = zext i32 %84 to i64, !dbg !204
  %86 = add nsw i64 %85, %randv.3, !dbg !204
  %.tr3 = trunc i64 %86 to i32, !dbg !204
  %87 = and i32 %.tr3, 1, !dbg !204
  %88 = getelementptr inbounds %struct.cells* %temp.327, i64 0, i32 1, !dbg !204
  store i32 %87, i32* %88, align 4, !dbg !204, !tbaa !148
  %89 = load %struct.cells** %68, align 8, !dbg !205, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %89}, i64 0, metadata !62), !dbg !205
  %90 = ashr i64 %randv.229, 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i64 %90}, i64 0, metadata !71), !dbg !206
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !170
  %lftr.wideiv = trunc i64 %indvars.iv.next42 to i32, !dbg !170
  %exitcond43 = icmp eq i32 %lftr.wideiv, %4, !dbg !170
  br i1 %exitcond43, label %._crit_edge31, label %.lr.ph30, !dbg !170

._crit_edge31:                                    ; preds = %66, %.preheader7
  %temp.3.lcssa = phi %struct.cells* [ %temp.1.lcssa, %.preheader7 ], [ %89, %66 ]
  %91 = phi <2 x i32> [ %14, %.preheader7 ], [ %67, %66 ]
  %92 = tail call i64 @lrand48() #2, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i64 %92}, i64 0, metadata !71), !dbg !207
  %93 = load i32* @reg_len, align 4, !dbg !208, !tbaa !85
  %94 = add nsw i32 %93, -1, !dbg !208
  %95 = sext i32 %94 to i64, !dbg !208
  %96 = getelementptr inbounds i8* %structure, i64 %95, !dbg !208
  %97 = load i8* %96, align 1, !dbg !208, !tbaa !102
  %98 = icmp eq i8 %97, 49, !dbg !208
  br i1 %98, label %99, label %103, !dbg !208

; <label>:99                                      ; preds = %._crit_edge31
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !64), !dbg !210
  %100 = bitcast %struct.cells* %temp.3.lcssa to <2 x i32>*, !dbg !210
  %101 = load <2 x i32>* %100, align 4, !dbg !210, !tbaa !85
  %102 = add <2 x i32> %101, %91, !dbg !210
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !65), !dbg !212
  br label %103, !dbg !213

; <label>:103                                     ; preds = %99, %._crit_edge31
  %104 = phi <2 x i32> [ %102, %99 ], [ %91, %._crit_edge31 ]
  %105 = extractelement <2 x i32> %104, i32 1, !dbg !214
  %106 = extractelement <2 x i32> %104, i32 0, !dbg !214
  %107 = zext i32 %106 to i64, !dbg !214
  %108 = add nsw i64 %107, %92, !dbg !214
  %.tr = trunc i64 %108 to i32, !dbg !214
  %109 = and i32 %.tr, 1, !dbg !214
  %110 = getelementptr inbounds %struct.cells* %temp.3.lcssa, i64 0, i32 0, !dbg !214
  store i32 %109, i32* %110, align 4, !dbg !214, !tbaa !145
  %111 = tail call i64 @lrand48() #2, !dbg !215
  %112 = srem i64 %111, 10000, !dbg !215
  %113 = sitofp i64 %112 to double, !dbg !215
  %114 = fdiv double %113, 1.000000e+04, !dbg !215
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !73), !dbg !215
  %115 = fcmp olt double %114, %prob, !dbg !216
  %116 = zext i1 %115 to i64, !dbg !216
  %randv.4 = xor i64 %116, %92, !dbg !216
  %117 = zext i32 %105 to i64, !dbg !218
  %118 = add nsw i64 %randv.4, %117, !dbg !218
  %.tr1 = trunc i64 %118 to i32, !dbg !218
  %119 = and i32 %.tr1, 1, !dbg !218
  %120 = getelementptr inbounds %struct.cells* %temp.3.lcssa, i64 0, i32 1, !dbg !218
  store i32 %119, i32* %120, align 4, !dbg !218, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !62), !dbg !219
  %121 = add nsw i32 %h.035, 1, !dbg !165
  tail call void @llvm.dbg.value(metadata !{i32 %121}, i64 0, metadata !68), !dbg !165
  %exitcond44 = icmp eq i32 %121, %iterations, !dbg !165
  br i1 %exitcond44, label %.preheaderthread-pre-split, label %.preheader8, !dbg !165

; <label>:122                                     ; preds = %.lr.ph, %122
  %i.111 = phi i32 [ 0, %.lr.ph ], [ %130, %122 ]
  %temp.410 = phi %struct.cells* [ %present, %.lr.ph ], [ %129, %122 ]
  %different.09 = phi i32 [ 0, %.lr.ph ], [ %different.0., %122 ]
  %123 = getelementptr inbounds %struct.cells* %temp.410, i64 0, i32 0, !dbg !220
  %124 = load i32* %123, align 4, !dbg !220, !tbaa !145
  %125 = getelementptr inbounds %struct.cells* %temp.410, i64 0, i32 1, !dbg !220
  %126 = load i32* %125, align 4, !dbg !220, !tbaa !148
  %127 = icmp eq i32 %124, %126, !dbg !220
  tail call void @llvm.dbg.value(metadata !223, i64 0, metadata !63), !dbg !220
  %different.0. = select i1 %127, i32 %different.09, i32 1, !dbg !220
  %128 = getelementptr inbounds %struct.cells* %temp.410, i64 0, i32 2, !dbg !224
  %129 = load %struct.cells** %128, align 8, !dbg !224, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %129}, i64 0, metadata !62), !dbg !224
  %130 = add nsw i32 %i.111, 1, !dbg !179
  tail call void @llvm.dbg.value(metadata !{i32 %130}, i64 0, metadata !69), !dbg !179
  %131 = icmp slt i32 %130, %13, !dbg !179
  br i1 %131, label %122, label %._crit_edge, !dbg !179

._crit_edge:                                      ; preds = %122, %.preheader
  %different.0.lcssa = phi i32 [ 0, %.preheader ], [ %different.0., %122 ]
  ret i32 %different.0.lcssa, !dbg !225
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define void @kill_list(%struct.cells* %present) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !49), !dbg !226
  %1 = icmp eq %struct.cells* %present, null, !dbg !227
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !227

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct.cells* [ %3, %.lr.ph ], [ %present, %0 ]
  %2 = getelementptr inbounds %struct.cells* %.01, i64 0, i32 2, !dbg !228
  %3 = load %struct.cells** %2, align 8, !dbg !228, !tbaa !150
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %3}, i64 0, metadata !50), !dbg !228
  %4 = bitcast %struct.cells* %.01 to i8*, !dbg !230
  tail call void @free(i8* %4) #2, !dbg !230
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %3}, i64 0, metadata !49), !dbg !231
  %5 = icmp eq %struct.cells* %3, null, !dbg !227
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !227

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !232
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i64 @lrand48() #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!76, !77}
!llvm.ident = !{!78}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !74, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c] [DW_LANG_C99]
!1 = metadata !{metadata !"misr.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !38, metadata !47, metadata !51, metadata !54}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 65, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 66} ; [ DW_TAG_subprogram ] [line 65] [def] [scope 66] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !29, metadata !33}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777281, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 65]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554497, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 65]
!15 = metadata !{i32 786688, metadata !4, metadata !"cell_array", metadata !5, i32 67, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cell_array] [line 67]
!16 = metadata !{i32 786454, metadata !1, null, metadata !"misr_type", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [misr_type] [line 54, size 0, align 0, offset 0] [from cells]
!17 = metadata !{i32 786451, metadata !1, null, metadata !"cells", i32 50, i64 128, i64 64, i32 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cells] [line 50, size 128, align 64, offset 0] [def] [from ]
!18 = metadata !{metadata !19, metadata !20, metadata !21}
!19 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"f_free", i32 51, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [f_free] [line 51, size 32, align 32, offset 0] [from int]
!20 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"faulty", i32 52, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [faulty] [line 52, size 32, align 32, offset 32] [from int]
!21 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"next", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !22} ; [ DW_TAG_member ] [next] [line 53, size 64, align 64, offset 64] [from ]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cells]
!23 = metadata !{i32 786688, metadata !4, metadata !"num_vect", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_vect] [line 68]
!24 = metadata !{i32 786688, metadata !4, metadata !"num_times", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_times] [line 68]
!25 = metadata !{i32 786688, metadata !4, metadata !"num_true", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_true] [line 68]
!26 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 68]
!27 = metadata !{i32 786688, metadata !4, metadata !"prob", metadata !5, i32 69, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prob] [line 69]
!28 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!29 = metadata !{i32 786688, metadata !4, metadata !"structure", metadata !5, i32 70, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [structure] [line 70]
!30 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 800, i64 8, i32 0, i32 0, metadata !11, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 800, align 8, offset 0] [from char]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 100}      ; [ DW_TAG_subrange_type ] [0, 99]
!33 = metadata !{i32 786688, metadata !4, metadata !"seed", metadata !5, i32 71, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [seed] [line 71]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 48, i64 16, i32 0, i32 0, metadata !35, metadata !36, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 48, align 16, offset 0] [from unsigned short]
!35 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"create_link_list", metadata !"create_link_list", metadata !"", i32 165, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.cells*)* @create_link_list, null, null, metadata !42, i32 166} ; [ DW_TAG_subprogram ] [line 165] [def] [scope 166] [create_link_list]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{null, metadata !41}
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from misr_type]
!42 = metadata !{metadata !43, metadata !44, metadata !45, metadata !46}
!43 = metadata !{i32 786689, metadata !38, metadata !"cell_array", metadata !5, i32 16777381, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cell_array] [line 165]
!44 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !5, i32 167, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 167]
!45 = metadata !{i32 786688, metadata !38, metadata !"temp", metadata !5, i32 168, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 168]
!46 = metadata !{i32 786688, metadata !38, metadata !"present", metadata !5, i32 168, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [present] [line 168]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kill_list", metadata !"kill_list", metadata !"", i32 187, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.cells*)* @kill_list, null, null, metadata !48, i32 188} ; [ DW_TAG_subprogram ] [line 187] [def] [scope 188] [kill_list]
!48 = metadata !{metadata !49, metadata !50}
!49 = metadata !{i32 786689, metadata !47, metadata !"present", metadata !5, i32 16777403, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [present] [line 187]
!50 = metadata !{i32 786688, metadata !47, metadata !"temp", metadata !5, i32 189, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 189]
!51 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"init", metadata !"init", metadata !"", i32 204, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.cells*)* @init, null, null, metadata !52, i32 205} ; [ DW_TAG_subprogram ] [line 204] [def] [scope 205] [init]
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786689, metadata !51, metadata !"present", metadata !5, i32 16777420, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [present] [line 204]
!54 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"simulate", metadata !"simulate", metadata !"", i32 220, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.cells*, double, i8*)* @simulate, null, null, metadata !57, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [simulate]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{metadata !8, metadata !8, metadata !41, metadata !28, metadata !10}
!57 = metadata !{metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71, metadata !73}
!58 = metadata !{i32 786689, metadata !54, metadata !"iterations", metadata !5, i32 16777436, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [iterations] [line 220]
!59 = metadata !{i32 786689, metadata !54, metadata !"present", metadata !5, i32 33554652, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [present] [line 220]
!60 = metadata !{i32 786689, metadata !54, metadata !"prob", metadata !5, i32 50331868, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prob] [line 220]
!61 = metadata !{i32 786689, metadata !54, metadata !"structure", metadata !5, i32 67109084, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [structure] [line 220]
!62 = metadata !{i32 786688, metadata !54, metadata !"temp", metadata !5, i32 222, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 222]
!63 = metadata !{i32 786688, metadata !54, metadata !"different", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [different] [line 223]
!64 = metadata !{i32 786688, metadata !54, metadata !"savef_free", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [savef_free] [line 223]
!65 = metadata !{i32 786688, metadata !54, metadata !"savefaulty", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [savefaulty] [line 223]
!66 = metadata !{i32 786688, metadata !54, metadata !"rem", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rem] [line 224]
!67 = metadata !{i32 786688, metadata !54, metadata !"quot", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [quot] [line 224]
!68 = metadata !{i32 786688, metadata !54, metadata !"h", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 224]
!69 = metadata !{i32 786688, metadata !54, metadata !"i", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 224]
!70 = metadata !{i32 786688, metadata !54, metadata !"j", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 224]
!71 = metadata !{i32 786688, metadata !54, metadata !"randv", metadata !5, i32 225, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [randv] [line 225]
!72 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!73 = metadata !{i32 786688, metadata !54, metadata !"randprob", metadata !5, i32 226, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [randprob] [line 226]
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786484, i32 0, null, metadata !"reg_len", metadata !"reg_len", metadata !"", metadata !5, i32 48, metadata !8, i32 0, i32 1, i32* @reg_len, null} ; [ DW_TAG_variable ] [reg_len] [line 48] [def]
!76 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!77 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!78 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!79 = metadata !{i32 65, i32 0, metadata !4, null}
!80 = metadata !{i32 67, i32 0, metadata !4, null}
!81 = metadata !{i32 70, i32 0, metadata !4, null}
!82 = metadata !{i32 71, i32 0, metadata !4, null}
!83 = metadata !{i32 10}
!84 = metadata !{i32 86, i32 0, metadata !4, null}
!85 = metadata !{metadata !86, metadata !86, i64 0}
!86 = metadata !{metadata !"int", metadata !87, i64 0}
!87 = metadata !{metadata !"omnipotent char", metadata !88, i64 0}
!88 = metadata !{metadata !"Simple C/C++ TBAA"}
!89 = metadata !{double 2.500000e-01}
!90 = metadata !{i32 87, i32 0, metadata !4, null}
!91 = metadata !{i32 100000}
!92 = metadata !{i32 91, i32 0, metadata !4, null}
!93 = metadata !{i32 95, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !4, i32 95, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!95 = metadata !{i32 97, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !97, i32 97, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!97 = metadata !{i32 786443, metadata !1, metadata !94, i32 96, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!98 = metadata !{metadata !99, metadata !99, i64 0}
!99 = metadata !{metadata !"any pointer", metadata !87, i64 0}
!100 = metadata !{i32 98, i32 0, metadata !96, null}
!101 = metadata !{i32 99, i32 0, metadata !97, null}
!102 = metadata !{metadata !87, metadata !87, i64 0}
!103 = metadata !{i32 100, i32 0, metadata !97, null}
!104 = metadata !{i32 102, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!106 = metadata !{metadata !107, metadata !107, i64 0}
!107 = metadata !{metadata !"short", metadata !87, i64 0}
!108 = metadata !{i32 103, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !4, i32 103, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!110 = metadata !{i32 104, i32 0, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !4, i32 104, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!112 = metadata !{i32 108, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !4, i32 108, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!114 = metadata !{i32 110, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !113, i32 109, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!116 = metadata !{i32 111, i32 0, metadata !115, null}
!117 = metadata !{i32 118, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !4, i32 118, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!119 = metadata !{i32 120, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !118, i32 119, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!121 = metadata !{i32 121, i32 0, metadata !120, null}
!122 = metadata !{i32 126, i32 0, metadata !4, null}
!123 = metadata !{i32 130, i32 0, metadata !4, null}
!124 = metadata !{i32 0}
!125 = metadata !{i32 133, i32 0, metadata !4, null}
!126 = metadata !{i32 136, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !128, i32 136, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!128 = metadata !{i32 786443, metadata !1, metadata !129, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!129 = metadata !{i32 786443, metadata !1, metadata !4, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!130 = metadata !{i32 138, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !127, i32 137, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!132 = metadata !{i32 139, i32 0, metadata !131, null}
!133 = metadata !{i32 154, i32 0, metadata !4, null}
!134 = metadata !{i32 156, i32 0, metadata !4, null}
!135 = metadata !{i32 158, i32 0, metadata !4, null}
!136 = metadata !{i32 159, i32 0, metadata !4, null}
!137 = metadata !{i32 165, i32 0, metadata !38, null}
!138 = metadata !{i32 170, i32 0, metadata !38, null}
!139 = metadata !{i32 171, i32 0, metadata !38, null}
!140 = metadata !{i32 172, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !38, i32 172, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!142 = metadata !{i32 174, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !141, i32 173, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!144 = metadata !{i32 175, i32 0, metadata !143, null}
!145 = metadata !{metadata !146, metadata !86, i64 0}
!146 = metadata !{metadata !"cells", metadata !86, i64 0, metadata !86, i64 4, metadata !99, i64 8}
!147 = metadata !{i32 176, i32 0, metadata !143, null}
!148 = metadata !{metadata !146, metadata !86, i64 4}
!149 = metadata !{i32 177, i32 0, metadata !143, null}
!150 = metadata !{metadata !146, metadata !99, i64 8}
!151 = metadata !{i32 178, i32 0, metadata !143, null}
!152 = metadata !{i32 179, i32 0, metadata !143, null}
!153 = metadata !{i32 181, i32 0, metadata !38, null}
!154 = metadata !{i32 204, i32 0, metadata !51, null}
!155 = metadata !{i32 207, i32 0, metadata !51, null}
!156 = metadata !{i32 209, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !51, i32 208, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!158 = metadata !{i32 210, i32 0, metadata !157, null}
!159 = metadata !{i32 212, i32 0, metadata !51, null}
!160 = metadata !{i32 220, i32 0, metadata !54, null}
!161 = metadata !{i32 228, i32 0, metadata !54, null}
!162 = metadata !{i32 229, i32 0, metadata !54, null}
!163 = metadata !{i32 230, i32 0, metadata !54, null}
!164 = metadata !{i32 231, i32 0, metadata !54, null}
!165 = metadata !{i32 233, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !54, i32 233, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!167 = metadata !{i32 237, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !169, i32 237, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!169 = metadata !{i32 786443, metadata !1, metadata !166, i32 234, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!170 = metadata !{i32 256, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !169, i32 256, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!172 = metadata !{i32 258, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !174, i32 258, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!174 = metadata !{i32 786443, metadata !1, metadata !171, i32 257, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!175 = metadata !{i32 239, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !168, i32 238, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!177 = metadata !{i32 240, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !176, i32 240, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!179 = metadata !{i32 284, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !54, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!181 = metadata !{i32 242, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !183, i32 242, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!183 = metadata !{i32 786443, metadata !1, metadata !178, i32 241, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!184 = metadata !{i32 undef}
!185 = metadata !{i32 244, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !182, i32 243, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!187 = metadata !{i32 245, i32 0, metadata !186, null}
!188 = metadata !{i32 246, i32 0, metadata !186, null}
!189 = metadata !{i32 247, i32 0, metadata !183, null}
!190 = metadata !{i32 248, i32 0, metadata !183, null}
!191 = metadata !{i32 249, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !183, i32 249, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!193 = metadata !{i32 250, i32 0, metadata !183, null}
!194 = metadata !{i32 251, i32 0, metadata !183, null}
!195 = metadata !{i32 252, i32 0, metadata !183, null}
!196 = metadata !{i32 260, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !173, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!198 = metadata !{i32 261, i32 0, metadata !197, null}
!199 = metadata !{i32 262, i32 0, metadata !197, null}
!200 = metadata !{i32 263, i32 0, metadata !174, null}
!201 = metadata !{i32 264, i32 0, metadata !174, null}
!202 = metadata !{i32 265, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !174, i32 265, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!204 = metadata !{i32 266, i32 0, metadata !174, null}
!205 = metadata !{i32 267, i32 0, metadata !174, null}
!206 = metadata !{i32 268, i32 0, metadata !174, null}
!207 = metadata !{i32 270, i32 0, metadata !169, null}
!208 = metadata !{i32 271, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !169, i32 271, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!210 = metadata !{i32 273, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !209, i32 272, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!212 = metadata !{i32 274, i32 0, metadata !211, null}
!213 = metadata !{i32 275, i32 0, metadata !211, null}
!214 = metadata !{i32 276, i32 0, metadata !169, null}
!215 = metadata !{i32 277, i32 0, metadata !169, null}
!216 = metadata !{i32 278, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !169, i32 278, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!218 = metadata !{i32 279, i32 0, metadata !169, null}
!219 = metadata !{i32 281, i32 0, metadata !169, null}
!220 = metadata !{i32 286, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !222, i32 286, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!222 = metadata !{i32 786443, metadata !1, metadata !180, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!223 = metadata !{i32 1}
!224 = metadata !{i32 287, i32 0, metadata !222, null}
!225 = metadata !{i32 289, i32 0, metadata !54, null}
!226 = metadata !{i32 187, i32 0, metadata !47, null}
!227 = metadata !{i32 191, i32 0, metadata !47, null}
!228 = metadata !{i32 193, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !47, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!230 = metadata !{i32 194, i32 0, metadata !229, null}
!231 = metadata !{i32 195, i32 0, metadata !229, null}
!232 = metadata !{i32 197, i32 0, metadata !47, null}
