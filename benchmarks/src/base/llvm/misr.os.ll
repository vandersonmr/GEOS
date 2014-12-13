; ModuleID = 'misr.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cells = type { i32, i32, %struct.cells* }

@reg_len = common global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%hu\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"Register too long; Max. = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [75 x i8] c"reg_len\09#_vect\09prob      #_tms\09struct\09seed1\09seed2\09seed3\09Prob same output\0A \00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"%d\09%d\09%.3e %d\09%s\09%d\09%d\09%d\09%.8e\0A\00", align 1
@str = private unnamed_addr constant [42 x i8] c"Structure does not match Register length:\00"

; Function Attrs: nounwind optsize uwtable
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
  br i1 %2, label %3, label %7, !dbg !93

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds i8** %argv, i64 6, !dbg !93
  %5 = load i8** %4, align 8, !dbg !93, !tbaa !95
  %6 = call i8* @strcpy(i8* %1, i8* %5) #5, !dbg !93
  br label %9, !dbg !93

; <label>:7                                       ; preds = %0
  %scevgep = getelementptr [100 x i8]* %structure, i64 0, i64 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 48, i64 9, i32 1, i1 false), !dbg !97
  store i8 49, i8* %1, align 16, !dbg !100, !tbaa !101
  %8 = getelementptr inbounds [100 x i8]* %structure, i64 0, i64 10, !dbg !102
  store i8 0, i8* %8, align 2, !dbg !102, !tbaa !101
  br label %9

; <label>:9                                       ; preds = %7, %3
  %10 = icmp sgt i32 %argc, 7, !dbg !103
  br i1 %10, label %11, label %16, !dbg !103

; <label>:11                                      ; preds = %9
  %12 = getelementptr inbounds i8** %argv, i64 7, !dbg !103
  %13 = load i8** %12, align 8, !dbg !103, !tbaa !95
  %14 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 0, !dbg !103
  %15 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %13, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i16* %14) #5, !dbg !103
  br label %18, !dbg !103

; <label>:16                                      ; preds = %9
  %17 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 0, !dbg !103
  store i16 1, i16* %17, align 2, !dbg !103, !tbaa !105
  br label %18

; <label>:18                                      ; preds = %16, %11
  %19 = icmp sgt i32 %argc, 8, !dbg !107
  br i1 %19, label %20, label %25, !dbg !107

; <label>:20                                      ; preds = %18
  %21 = getelementptr inbounds i8** %argv, i64 8, !dbg !107
  %22 = load i8** %21, align 8, !dbg !107, !tbaa !95
  %23 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 1, !dbg !107
  %24 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %22, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i16* %23) #5, !dbg !107
  br label %27, !dbg !107

; <label>:25                                      ; preds = %18
  %26 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 1, !dbg !107
  store i16 0, i16* %26, align 2, !dbg !107, !tbaa !105
  br label %27

; <label>:27                                      ; preds = %25, %20
  %28 = icmp sgt i32 %argc, 9, !dbg !109
  br i1 %28, label %29, label %34, !dbg !109

; <label>:29                                      ; preds = %27
  %30 = getelementptr inbounds i8** %argv, i64 9, !dbg !109
  %31 = load i8** %30, align 8, !dbg !109, !tbaa !95
  %32 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 2, !dbg !109
  %33 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %31, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i16* %32) #5, !dbg !109
  br label %36, !dbg !109

; <label>:34                                      ; preds = %27
  %35 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 2, !dbg !109
  store i16 0, i16* %35, align 2, !dbg !109, !tbaa !105
  br label %36

; <label>:36                                      ; preds = %34, %29
  %37 = load i32* @reg_len, align 4, !dbg !111, !tbaa !85
  %38 = icmp sgt i32 %37, 100, !dbg !111
  br i1 %38, label %39, label %41, !dbg !111

; <label>:39                                      ; preds = %36
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 100) #5, !dbg !113
  br label %78, !dbg !115

; <label>:41                                      ; preds = %36
  %42 = call i64 @strlen(i8* %1) #6, !dbg !116
  %43 = sext i32 %37 to i64, !dbg !116
  %44 = icmp eq i64 %42, %43, !dbg !116
  br i1 %44, label %46, label %45, !dbg !116

; <label>:45                                      ; preds = %41
  %puts = call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @str, i64 0, i64 0)), !dbg !118
  br label %78, !dbg !120

; <label>:46                                      ; preds = %41
  %47 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 0, !dbg !121
  %48 = call i16* @seed48(i16* %47) #5, !dbg !121
  call void @create_link_list(%struct.cells* %cell_array) #7, !dbg !122
  call void @llvm.dbg.value(metadata !123, i64 0, metadata !25), !dbg !124
  call void @llvm.dbg.value(metadata !123, i64 0, metadata !26), !dbg !125
  %49 = getelementptr inbounds %struct.cells* %cell_array, i64 0, i32 2, !dbg !129
  br label %50, !dbg !125

; <label>:50                                      ; preds = %init.exit, %46
  %i.13 = phi i32 [ 0, %46 ], [ %62, %init.exit ]
  %num_true.02 = phi i32 [ 0, %46 ], [ %61, %init.exit ]
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %cell_array}, i64 0, metadata !132), !dbg !133
  %51 = load %struct.cells** %49, align 8, !dbg !129, !tbaa !134
  %52 = icmp eq %struct.cells* %51, null, !dbg !129
  br i1 %52, label %init.exit, label %.lr.ph.i, !dbg !129

.lr.ph.i:                                         ; preds = %50, %.lr.ph.i
  %53 = phi %struct.cells* [ %58, %.lr.ph.i ], [ %51, %50 ], !dbg !136
  %.01.i = phi %struct.cells* [ %53, %.lr.ph.i ], [ %cell_array, %50 ]
  %54 = getelementptr inbounds %struct.cells* %.01.i, i64 0, i32 0, !dbg !136
  %55 = load i32* %54, align 4, !dbg !136, !tbaa !138
  %56 = getelementptr inbounds %struct.cells* %.01.i, i64 0, i32 1, !dbg !136
  store i32 %55, i32* %56, align 4, !dbg !136, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %53}, i64 0, metadata !132), !dbg !140
  %57 = getelementptr inbounds %struct.cells* %53, i64 0, i32 2, !dbg !129
  %58 = load %struct.cells** %57, align 8, !dbg !129, !tbaa !134
  %59 = icmp eq %struct.cells* %58, null, !dbg !129
  br i1 %59, label %init.exit, label %.lr.ph.i, !dbg !129

init.exit:                                        ; preds = %.lr.ph.i, %50
  %60 = call i32 @simulate(i32 10, %struct.cells* %cell_array, double 2.500000e-01, i8* %1) #7, !dbg !141
  %61 = add nsw i32 %60, %num_true.02, !dbg !141
  call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !25), !dbg !141
  %62 = add nsw i32 %i.13, 1, !dbg !125
  call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !26), !dbg !125
  %exitcond = icmp eq i32 %62, 100000, !dbg !125
  br i1 %exitcond, label %63, label %50, !dbg !125

; <label>:63                                      ; preds = %init.exit
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([75 x i8]* @.str4, i64 0, i64 0)) #5, !dbg !142
  %65 = load i32* @reg_len, align 4, !dbg !143, !tbaa !85
  %66 = load i16* %47, align 2, !dbg !143, !tbaa !105
  %67 = zext i16 %66 to i32, !dbg !143
  %68 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 1, !dbg !143
  %69 = load i16* %68, align 2, !dbg !143, !tbaa !105
  %70 = zext i16 %69 to i32, !dbg !143
  %71 = getelementptr inbounds [3 x i16]* %seed, i64 0, i64 2, !dbg !143
  %72 = load i16* %71, align 2, !dbg !143, !tbaa !105
  %73 = zext i16 %72 to i32, !dbg !143
  %74 = sub nsw i32 100000, %61, !dbg !143
  %75 = sitofp i32 %74 to double, !dbg !143
  %76 = fdiv double %75, 1.000000e+05, !dbg !143
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i64 0, i64 0), i32 %65, i32 10, double 2.500000e-01, i32 100000, i8* %1, i32 %67, i32 %70, i32 %73, double %76) #5, !dbg !143
  br label %78, !dbg !144

; <label>:78                                      ; preds = %63, %45, %39
  %.0 = phi i32 [ 2, %39 ], [ 4, %45 ], [ 0, %63 ]
  call void @llvm.lifetime.end(i64 100, i8* %1) #2, !dbg !144
  ret i32 %.0, !dbg !145
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind optsize
declare i8* @strcpy(i8*, i8* nocapture readonly) #3

; Function Attrs: nounwind optsize
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind optsize readonly
declare i64 @strlen(i8* nocapture) #4

; Function Attrs: nounwind optsize
declare i16* @seed48(i16*) #3

; Function Attrs: nounwind optsize uwtable
define void @create_link_list(%struct.cells* nocapture %cell_array) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %cell_array}, i64 0, metadata !43), !dbg !146
  %1 = bitcast %struct.cells* %cell_array to i8*, !dbg !147
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false), !dbg !147
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %cell_array}, i64 0, metadata !46), !dbg !148
  tail call void @llvm.dbg.value(metadata !123, i64 0, metadata !44), !dbg !149
  %2 = load i32* @reg_len, align 4, !dbg !149, !tbaa !85
  %3 = icmp sgt i32 %2, -1, !dbg !149
  br i1 %3, label %.lr.ph, label %._crit_edge, !dbg !149

.lr.ph:                                           ; preds = %0, %.lr.ph
  %present.02 = phi %struct.cells* [ %5, %.lr.ph ], [ %cell_array, %0 ]
  %i.01 = phi i32 [ %12, %.lr.ph ], [ 0, %0 ]
  %4 = tail call noalias i8* @malloc(i64 16) #5, !dbg !151
  %5 = bitcast i8* %4 to %struct.cells*, !dbg !151
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %5}, i64 0, metadata !45), !dbg !151
  %6 = bitcast i8* %4 to i32*, !dbg !153
  store i32 1, i32* %6, align 4, !dbg !153, !tbaa !138
  %7 = getelementptr inbounds i8* %4, i64 4, !dbg !154
  %8 = bitcast i8* %7 to i32*, !dbg !154
  store i32 1, i32* %8, align 4, !dbg !154, !tbaa !139
  %9 = getelementptr inbounds i8* %4, i64 8, !dbg !155
  %10 = bitcast i8* %9 to %struct.cells**, !dbg !155
  store %struct.cells* null, %struct.cells** %10, align 8, !dbg !155, !tbaa !134
  %11 = getelementptr inbounds %struct.cells* %present.02, i64 0, i32 2, !dbg !156
  store %struct.cells* %5, %struct.cells** %11, align 8, !dbg !156, !tbaa !134
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %5}, i64 0, metadata !46), !dbg !157
  %12 = add nsw i32 %i.01, 1, !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !44), !dbg !149
  %13 = icmp slt i32 %i.01, %2, !dbg !149
  br i1 %13, label %.lr.ph, label %._crit_edge, !dbg !149

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !158
}

; Function Attrs: nounwind optsize uwtable
define void @init(%struct.cells* nocapture %present) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !53), !dbg !159
  %1 = getelementptr inbounds %struct.cells* %present, i64 0, i32 2, !dbg !160
  %2 = load %struct.cells** %1, align 8, !dbg !160, !tbaa !134
  %3 = icmp eq %struct.cells* %2, null, !dbg !160
  br i1 %3, label %._crit_edge, label %.lr.ph, !dbg !160

.lr.ph:                                           ; preds = %0, %.lr.ph
  %4 = phi %struct.cells* [ %9, %.lr.ph ], [ %2, %0 ], !dbg !161
  %.01 = phi %struct.cells* [ %4, %.lr.ph ], [ %present, %0 ]
  %5 = getelementptr inbounds %struct.cells* %.01, i64 0, i32 0, !dbg !161
  %6 = load i32* %5, align 4, !dbg !161, !tbaa !138
  %7 = getelementptr inbounds %struct.cells* %.01, i64 0, i32 1, !dbg !161
  store i32 %6, i32* %7, align 4, !dbg !161, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %4}, i64 0, metadata !53), !dbg !162
  %8 = getelementptr inbounds %struct.cells* %4, i64 0, i32 2, !dbg !160
  %9 = load %struct.cells** %8, align 8, !dbg !160, !tbaa !134
  %10 = icmp eq %struct.cells* %9, null, !dbg !160
  br i1 %10, label %._crit_edge, label %.lr.ph, !dbg !160

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !163
}

; Function Attrs: nounwind optsize uwtable
define i32 @simulate(i32 %iterations, %struct.cells* nocapture %present, double %prob, i8* nocapture readonly %structure) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %iterations}, i64 0, metadata !58), !dbg !164
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !59), !dbg !164
  tail call void @llvm.dbg.value(metadata !{double %prob}, i64 0, metadata !60), !dbg !164
  tail call void @llvm.dbg.value(metadata !{i8* %structure}, i64 0, metadata !61), !dbg !164
  tail call void @llvm.dbg.value(metadata !123, i64 0, metadata !63), !dbg !165
  %1 = load i32* @reg_len, align 4, !dbg !166, !tbaa !85
  %2 = add nsw i32 %1, -1, !dbg !166
  %3 = sdiv i32 %2, 31, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !67), !dbg !166
  %4 = srem i32 %2, 31, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !66), !dbg !167
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !62), !dbg !168
  tail call void @llvm.dbg.value(metadata !123, i64 0, metadata !68), !dbg !169
  %5 = icmp sgt i32 %iterations, 0, !dbg !169
  br i1 %5, label %.preheader8.lr.ph, label %.preheader, !dbg !169

.preheader8.lr.ph:                                ; preds = %0
  %6 = icmp sgt i32 %2, 30, !dbg !171
  %7 = icmp sgt i32 %4, 0, !dbg !174
  %8 = mul nsw i32 %3, 31, !dbg !176
  %9 = sext i32 %8 to i64, !dbg !169
  br label %.preheader8, !dbg !169

.preheader8:                                      ; preds = %._crit_edge45, %.preheader8.lr.ph
  %h.035 = phi i32 [ 0, %.preheader8.lr.ph ], [ %115, %._crit_edge45 ]
  %10 = tail call i64 @lrand48() #5, !dbg !179
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa}, i64 0, metadata !71), !dbg !179
  tail call void @llvm.dbg.value(metadata !123, i64 0, metadata !70), !dbg !181
  br i1 %6, label %.preheader6, label %.preheader7, !dbg !171

..preheader_crit_edge:                            ; preds = %._crit_edge45
  %.pre = load i32* @reg_len, align 4, !dbg !183, !tbaa !85
  br label %.preheader, !dbg !169

.preheader:                                       ; preds = %..preheader_crit_edge, %0
  %11 = phi i32 [ %.pre, %..preheader_crit_edge ], [ %1, %0 ]
  %12 = icmp sgt i32 %11, 0, !dbg !183
  br i1 %12, label %.lr.ph, label %._crit_edge, !dbg !183

.preheader7:                                      ; preds = %50, %.preheader8
  %.lcssa = phi i64 [ %10, %.preheader8 ], [ %53, %50 ]
  %temp.1.lcssa = phi %struct.cells* [ %present, %.preheader8 ], [ %43, %50 ]
  %13 = phi <2 x i32> [ zeroinitializer, %.preheader8 ], [ %29, %50 ]
  br i1 %7, label %.lr.ph30, label %._crit_edge31, !dbg !174

.preheader6:                                      ; preds = %.preheader8, %50
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %50 ], [ 0, %.preheader8 ]
  %14 = phi i64 [ %53, %50 ], [ %10, %.preheader8 ]
  %temp.119 = phi %struct.cells* [ %43, %50 ], [ %present, %.preheader8 ]
  %15 = phi <2 x i32> [ %29, %50 ], [ zeroinitializer, %.preheader8 ]
  %sext = mul i64 %indvars.iv39, 133143986176, !dbg !181
  %16 = ashr exact i64 %sext, 32, !dbg !181
  br label %17, !dbg !181

; <label>:17                                      ; preds = %._crit_edge47, %.preheader6
  %indvars.iv = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next, %._crit_edge47 ]
  %randv.016 = phi i64 [ %14, %.preheader6 ], [ %49, %._crit_edge47 ]
  %temp.214 = phi %struct.cells* [ %temp.119, %.preheader6 ], [ %43, %._crit_edge47 ]
  %18 = phi <2 x i32> [ %15, %.preheader6 ], [ %29, %._crit_edge47 ]
  %19 = add nsw i64 %indvars.iv, %16, !dbg !185
  %20 = getelementptr inbounds i8* %structure, i64 %19, !dbg !185
  %21 = load i8* %20, align 1, !dbg !185, !tbaa !101
  %22 = icmp eq i8 %21, 49, !dbg !185
  %23 = getelementptr inbounds %struct.cells* %temp.214, i64 0, i32 0, !dbg !188
  %24 = getelementptr inbounds %struct.cells* %temp.214, i64 0, i32 1, !dbg !190
  br i1 %22, label %25, label %._crit_edge47, !dbg !185

; <label>:25                                      ; preds = %17
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !64), !dbg !188
  %26 = bitcast %struct.cells* %temp.214 to <2 x i32>*, !dbg !188
  %27 = load <2 x i32>* %26, align 4, !dbg !188, !tbaa !85
  %28 = add <2 x i32> %27, %18, !dbg !188
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !65), !dbg !190
  br label %._crit_edge47, !dbg !192

._crit_edge47:                                    ; preds = %17, %25
  %29 = phi <2 x i32> [ %28, %25 ], [ %18, %17 ]
  %30 = getelementptr inbounds %struct.cells* %temp.214, i64 0, i32 2, !dbg !193
  %31 = load %struct.cells** %30, align 8, !dbg !193, !tbaa !134
  %32 = getelementptr inbounds %struct.cells* %31, i64 0, i32 0, !dbg !193
  %33 = load i32* %32, align 4, !dbg !193, !tbaa !138
  %34 = zext i32 %33 to i64, !dbg !193
  %35 = add nsw i64 %34, %randv.016, !dbg !193
  %.tr4 = trunc i64 %35 to i32, !dbg !193
  %36 = and i32 %.tr4, 1, !dbg !193
  store i32 %36, i32* %23, align 4, !dbg !193, !tbaa !138
  %37 = tail call i64 @lrand48() #5, !dbg !194
  %38 = srem i64 %37, 1000, !dbg !194
  %39 = sitofp i64 %38 to double, !dbg !194
  %40 = fdiv double %39, 1.000000e+03, !dbg !194
  tail call void @llvm.dbg.value(metadata !{double %40}, i64 0, metadata !73), !dbg !194
  %41 = fcmp olt double %40, %prob, !dbg !195
  %42 = zext i1 %41 to i64, !dbg !195
  %randv.1 = xor i64 %42, %randv.016, !dbg !195
  %43 = load %struct.cells** %30, align 8, !dbg !197, !tbaa !134
  %44 = getelementptr inbounds %struct.cells* %43, i64 0, i32 1, !dbg !197
  %45 = load i32* %44, align 4, !dbg !197, !tbaa !139
  %46 = zext i32 %45 to i64, !dbg !197
  %47 = add nsw i64 %46, %randv.1, !dbg !197
  %.tr5 = trunc i64 %47 to i32, !dbg !197
  %48 = and i32 %.tr5, 1, !dbg !197
  store i32 %48, i32* %24, align 4, !dbg !197, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %43}, i64 0, metadata !62), !dbg !198
  %49 = ashr i64 %randv.016, 1, !dbg !199
  tail call void @llvm.dbg.value(metadata !{i64 %49}, i64 0, metadata !71), !dbg !199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !181
  %exitcond = icmp eq i64 %indvars.iv.next, 31, !dbg !181
  br i1 %exitcond, label %50, label %17, !dbg !181

; <label>:50                                      ; preds = %._crit_edge47
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1, !dbg !171
  %51 = trunc i64 %indvars.iv.next40 to i32, !dbg !171
  %52 = icmp slt i32 %51, %3, !dbg !171
  %53 = tail call i64 @lrand48() #5, !dbg !179
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa}, i64 0, metadata !71), !dbg !179
  tail call void @llvm.dbg.value(metadata !123, i64 0, metadata !70), !dbg !181
  br i1 %52, label %.preheader6, label %.preheader7, !dbg !171

.lr.ph30:                                         ; preds = %.preheader7, %._crit_edge46
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge46 ], [ 0, %.preheader7 ]
  %randv.229 = phi i64 [ %85, %._crit_edge46 ], [ %.lcssa, %.preheader7 ]
  %temp.327 = phi %struct.cells* [ %79, %._crit_edge46 ], [ %temp.1.lcssa, %.preheader7 ]
  %54 = phi <2 x i32> [ %65, %._crit_edge46 ], [ %13, %.preheader7 ]
  %55 = add nsw i64 %indvars.iv41, %9, !dbg !176
  %56 = getelementptr inbounds i8* %structure, i64 %55, !dbg !176
  %57 = load i8* %56, align 1, !dbg !176, !tbaa !101
  %58 = icmp eq i8 %57, 49, !dbg !176
  %59 = getelementptr inbounds %struct.cells* %temp.327, i64 0, i32 0, !dbg !200
  %60 = getelementptr inbounds %struct.cells* %temp.327, i64 0, i32 1, !dbg !202
  br i1 %58, label %61, label %._crit_edge46, !dbg !176

; <label>:61                                      ; preds = %.lr.ph30
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !64), !dbg !200
  %62 = bitcast %struct.cells* %temp.327 to <2 x i32>*, !dbg !200
  %63 = load <2 x i32>* %62, align 4, !dbg !200, !tbaa !85
  %64 = add <2 x i32> %63, %54, !dbg !200
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !65), !dbg !202
  br label %._crit_edge46, !dbg !203

._crit_edge46:                                    ; preds = %.lr.ph30, %61
  %65 = phi <2 x i32> [ %64, %61 ], [ %54, %.lr.ph30 ]
  %66 = getelementptr inbounds %struct.cells* %temp.327, i64 0, i32 2, !dbg !204
  %67 = load %struct.cells** %66, align 8, !dbg !204, !tbaa !134
  %68 = getelementptr inbounds %struct.cells* %67, i64 0, i32 0, !dbg !204
  %69 = load i32* %68, align 4, !dbg !204, !tbaa !138
  %70 = zext i32 %69 to i64, !dbg !204
  %71 = add nsw i64 %70, %randv.229, !dbg !204
  %.tr2 = trunc i64 %71 to i32, !dbg !204
  %72 = and i32 %.tr2, 1, !dbg !204
  store i32 %72, i32* %59, align 4, !dbg !204, !tbaa !138
  %73 = tail call i64 @lrand48() #5, !dbg !205
  %74 = srem i64 %73, 1000, !dbg !205
  %75 = sitofp i64 %74 to double, !dbg !205
  %76 = fdiv double %75, 1.000000e+03, !dbg !205
  tail call void @llvm.dbg.value(metadata !{double %76}, i64 0, metadata !73), !dbg !205
  %77 = fcmp olt double %76, %prob, !dbg !206
  %78 = zext i1 %77 to i64, !dbg !206
  %randv.3 = xor i64 %78, %randv.229, !dbg !206
  %79 = load %struct.cells** %66, align 8, !dbg !208, !tbaa !134
  %80 = getelementptr inbounds %struct.cells* %79, i64 0, i32 1, !dbg !208
  %81 = load i32* %80, align 4, !dbg !208, !tbaa !139
  %82 = zext i32 %81 to i64, !dbg !208
  %83 = add nsw i64 %82, %randv.3, !dbg !208
  %.tr3 = trunc i64 %83 to i32, !dbg !208
  %84 = and i32 %.tr3, 1, !dbg !208
  store i32 %84, i32* %60, align 4, !dbg !208, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %79}, i64 0, metadata !62), !dbg !209
  %85 = ashr i64 %randv.229, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i64 %85}, i64 0, metadata !71), !dbg !210
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !174
  %lftr.wideiv = trunc i64 %indvars.iv.next42 to i32, !dbg !174
  %exitcond43 = icmp eq i32 %lftr.wideiv, %4, !dbg !174
  br i1 %exitcond43, label %._crit_edge31, label %.lr.ph30, !dbg !174

._crit_edge31:                                    ; preds = %._crit_edge46, %.preheader7
  %temp.3.lcssa = phi %struct.cells* [ %temp.1.lcssa, %.preheader7 ], [ %79, %._crit_edge46 ]
  %86 = phi <2 x i32> [ %13, %.preheader7 ], [ %65, %._crit_edge46 ]
  %87 = tail call i64 @lrand48() #5, !dbg !211
  tail call void @llvm.dbg.value(metadata !{i64 %87}, i64 0, metadata !71), !dbg !211
  %88 = load i32* @reg_len, align 4, !dbg !212, !tbaa !85
  %89 = add nsw i32 %88, -1, !dbg !212
  %90 = sext i32 %89 to i64, !dbg !212
  %91 = getelementptr inbounds i8* %structure, i64 %90, !dbg !212
  %92 = load i8* %91, align 1, !dbg !212, !tbaa !101
  %93 = icmp eq i8 %92, 49, !dbg !212
  %94 = getelementptr inbounds %struct.cells* %temp.3.lcssa, i64 0, i32 0, !dbg !214
  %95 = getelementptr inbounds %struct.cells* %temp.3.lcssa, i64 0, i32 1, !dbg !216
  br i1 %93, label %96, label %._crit_edge45, !dbg !212

; <label>:96                                      ; preds = %._crit_edge31
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !64), !dbg !214
  %97 = bitcast %struct.cells* %temp.3.lcssa to <2 x i32>*, !dbg !214
  %98 = load <2 x i32>* %97, align 4, !dbg !214, !tbaa !85
  %99 = add <2 x i32> %98, %86, !dbg !214
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !65), !dbg !216
  br label %._crit_edge45, !dbg !217

._crit_edge45:                                    ; preds = %._crit_edge31, %96
  %100 = phi <2 x i32> [ %99, %96 ], [ %86, %._crit_edge31 ]
  %101 = extractelement <2 x i32> %100, i32 1, !dbg !218
  %102 = extractelement <2 x i32> %100, i32 0, !dbg !218
  %103 = zext i32 %102 to i64, !dbg !218
  %104 = add nsw i64 %103, %87, !dbg !218
  %.tr = trunc i64 %104 to i32, !dbg !218
  %105 = and i32 %.tr, 1, !dbg !218
  store i32 %105, i32* %94, align 4, !dbg !218, !tbaa !138
  %106 = tail call i64 @lrand48() #5, !dbg !219
  %107 = srem i64 %106, 10000, !dbg !219
  %108 = sitofp i64 %107 to double, !dbg !219
  %109 = fdiv double %108, 1.000000e+04, !dbg !219
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !73), !dbg !219
  %110 = fcmp olt double %109, %prob, !dbg !220
  %111 = zext i1 %110 to i64, !dbg !220
  %randv.4 = xor i64 %111, %87, !dbg !220
  %112 = zext i32 %101 to i64, !dbg !222
  %113 = add nsw i64 %randv.4, %112, !dbg !222
  %.tr1 = trunc i64 %113 to i32, !dbg !222
  %114 = and i32 %.tr1, 1, !dbg !222
  store i32 %114, i32* %95, align 4, !dbg !222, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !62), !dbg !223
  %115 = add nsw i32 %h.035, 1, !dbg !169
  tail call void @llvm.dbg.value(metadata !{i32 %115}, i64 0, metadata !68), !dbg !169
  %exitcond44 = icmp eq i32 %115, %iterations, !dbg !169
  br i1 %exitcond44, label %..preheader_crit_edge, label %.preheader8, !dbg !169

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.111 = phi i32 [ %123, %.lr.ph ], [ 0, %.preheader ]
  %temp.410 = phi %struct.cells* [ %122, %.lr.ph ], [ %present, %.preheader ]
  %different.09 = phi i32 [ %different.0., %.lr.ph ], [ 0, %.preheader ]
  %116 = getelementptr inbounds %struct.cells* %temp.410, i64 0, i32 0, !dbg !224
  %117 = load i32* %116, align 4, !dbg !224, !tbaa !138
  %118 = getelementptr inbounds %struct.cells* %temp.410, i64 0, i32 1, !dbg !224
  %119 = load i32* %118, align 4, !dbg !224, !tbaa !139
  %120 = icmp eq i32 %117, %119, !dbg !224
  tail call void @llvm.dbg.value(metadata !227, i64 0, metadata !63), !dbg !224
  %different.0. = select i1 %120, i32 %different.09, i32 1, !dbg !224
  %121 = getelementptr inbounds %struct.cells* %temp.410, i64 0, i32 2, !dbg !228
  %122 = load %struct.cells** %121, align 8, !dbg !228, !tbaa !134
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %122}, i64 0, metadata !62), !dbg !228
  %123 = add nsw i32 %i.111, 1, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %123}, i64 0, metadata !69), !dbg !183
  %124 = icmp slt i32 %123, %11, !dbg !183
  br i1 %124, label %.lr.ph, label %._crit_edge, !dbg !183

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %different.0.lcssa = phi i32 [ 0, %.preheader ], [ %different.0., %.lr.ph ]
  ret i32 %different.0.lcssa, !dbg !229
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind optsize uwtable
define void @kill_list(%struct.cells* %present) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %present}, i64 0, metadata !49), !dbg !230
  %1 = icmp eq %struct.cells* %present, null, !dbg !231
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !231

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct.cells* [ %3, %.lr.ph ], [ %present, %0 ]
  %2 = getelementptr inbounds %struct.cells* %.01, i64 0, i32 2, !dbg !232
  %3 = load %struct.cells** %2, align 8, !dbg !232, !tbaa !134
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %3}, i64 0, metadata !50), !dbg !232
  %4 = bitcast %struct.cells* %.01 to i8*, !dbg !234
  tail call void @free(i8* %4) #5, !dbg !234
  tail call void @llvm.dbg.value(metadata !{%struct.cells* %3}, i64 0, metadata !49), !dbg !235
  %5 = icmp eq %struct.cells* %3, null, !dbg !231
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !231

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !236
}

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind optsize
declare i64 @lrand48() #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind optsize }
attributes #6 = { nounwind optsize readonly }
attributes #7 = { optsize }

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
!95 = metadata !{metadata !96, metadata !96, i64 0}
!96 = metadata !{metadata !"any pointer", metadata !87, i64 0}
!97 = metadata !{i32 98, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !99, i32 97, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!99 = metadata !{i32 786443, metadata !1, metadata !94, i32 96, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!100 = metadata !{i32 99, i32 0, metadata !99, null}
!101 = metadata !{metadata !87, metadata !87, i64 0}
!102 = metadata !{i32 100, i32 0, metadata !99, null}
!103 = metadata !{i32 102, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!105 = metadata !{metadata !106, metadata !106, i64 0}
!106 = metadata !{metadata !"short", metadata !87, i64 0}
!107 = metadata !{i32 103, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !4, i32 103, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!109 = metadata !{i32 104, i32 0, metadata !110, null}
!110 = metadata !{i32 786443, metadata !1, metadata !4, i32 104, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!111 = metadata !{i32 108, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !4, i32 108, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!113 = metadata !{i32 110, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !112, i32 109, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!115 = metadata !{i32 111, i32 0, metadata !114, null}
!116 = metadata !{i32 118, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !4, i32 118, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!118 = metadata !{i32 120, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !117, i32 119, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!120 = metadata !{i32 121, i32 0, metadata !119, null}
!121 = metadata !{i32 126, i32 0, metadata !4, null}
!122 = metadata !{i32 130, i32 0, metadata !4, null}
!123 = metadata !{i32 0}
!124 = metadata !{i32 133, i32 0, metadata !4, null}
!125 = metadata !{i32 136, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !127, i32 136, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!127 = metadata !{i32 786443, metadata !1, metadata !128, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!128 = metadata !{i32 786443, metadata !1, metadata !4, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!129 = metadata !{i32 207, i32 0, metadata !51, metadata !130}
!130 = metadata !{i32 138, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !126, i32 137, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!132 = metadata !{i32 786689, metadata !51, metadata !"present", metadata !5, i32 16777420, metadata !41, i32 0, metadata !130} ; [ DW_TAG_arg_variable ] [present] [line 204]
!133 = metadata !{i32 204, i32 0, metadata !51, metadata !130}
!134 = metadata !{metadata !135, metadata !96, i64 8}
!135 = metadata !{metadata !"cells", metadata !86, i64 0, metadata !86, i64 4, metadata !96, i64 8}
!136 = metadata !{i32 209, i32 0, metadata !137, metadata !130}
!137 = metadata !{i32 786443, metadata !1, metadata !51, i32 208, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!138 = metadata !{metadata !135, metadata !86, i64 0}
!139 = metadata !{metadata !135, metadata !86, i64 4}
!140 = metadata !{i32 210, i32 0, metadata !137, metadata !130}
!141 = metadata !{i32 139, i32 0, metadata !131, null}
!142 = metadata !{i32 154, i32 0, metadata !4, null}
!143 = metadata !{i32 156, i32 0, metadata !4, null}
!144 = metadata !{i32 158, i32 0, metadata !4, null}
!145 = metadata !{i32 159, i32 0, metadata !4, null}
!146 = metadata !{i32 165, i32 0, metadata !38, null}
!147 = metadata !{i32 170, i32 0, metadata !38, null}
!148 = metadata !{i32 171, i32 0, metadata !38, null}
!149 = metadata !{i32 172, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !38, i32 172, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!151 = metadata !{i32 174, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !150, i32 173, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!153 = metadata !{i32 175, i32 0, metadata !152, null}
!154 = metadata !{i32 176, i32 0, metadata !152, null}
!155 = metadata !{i32 177, i32 0, metadata !152, null}
!156 = metadata !{i32 178, i32 0, metadata !152, null}
!157 = metadata !{i32 179, i32 0, metadata !152, null}
!158 = metadata !{i32 181, i32 0, metadata !38, null}
!159 = metadata !{i32 204, i32 0, metadata !51, null}
!160 = metadata !{i32 207, i32 0, metadata !51, null}
!161 = metadata !{i32 209, i32 0, metadata !137, null}
!162 = metadata !{i32 210, i32 0, metadata !137, null}
!163 = metadata !{i32 212, i32 0, metadata !51, null}
!164 = metadata !{i32 220, i32 0, metadata !54, null}
!165 = metadata !{i32 228, i32 0, metadata !54, null}
!166 = metadata !{i32 229, i32 0, metadata !54, null}
!167 = metadata !{i32 230, i32 0, metadata !54, null}
!168 = metadata !{i32 231, i32 0, metadata !54, null}
!169 = metadata !{i32 233, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !54, i32 233, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!171 = metadata !{i32 237, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !173, i32 237, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!173 = metadata !{i32 786443, metadata !1, metadata !170, i32 234, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!174 = metadata !{i32 256, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 256, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!176 = metadata !{i32 258, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !178, i32 258, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!178 = metadata !{i32 786443, metadata !1, metadata !175, i32 257, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!179 = metadata !{i32 239, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !172, i32 238, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!181 = metadata !{i32 240, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !180, i32 240, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!183 = metadata !{i32 284, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !54, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!185 = metadata !{i32 242, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !187, i32 242, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!187 = metadata !{i32 786443, metadata !1, metadata !182, i32 241, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!188 = metadata !{i32 244, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !186, i32 243, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!190 = metadata !{i32 245, i32 0, metadata !189, null}
!191 = metadata !{i32 undef}
!192 = metadata !{i32 246, i32 0, metadata !189, null}
!193 = metadata !{i32 247, i32 0, metadata !187, null}
!194 = metadata !{i32 248, i32 0, metadata !187, null}
!195 = metadata !{i32 249, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !187, i32 249, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!197 = metadata !{i32 250, i32 0, metadata !187, null}
!198 = metadata !{i32 251, i32 0, metadata !187, null}
!199 = metadata !{i32 252, i32 0, metadata !187, null}
!200 = metadata !{i32 260, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !1, metadata !177, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!202 = metadata !{i32 261, i32 0, metadata !201, null}
!203 = metadata !{i32 262, i32 0, metadata !201, null}
!204 = metadata !{i32 263, i32 0, metadata !178, null}
!205 = metadata !{i32 264, i32 0, metadata !178, null}
!206 = metadata !{i32 265, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !178, i32 265, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!208 = metadata !{i32 266, i32 0, metadata !178, null}
!209 = metadata !{i32 267, i32 0, metadata !178, null}
!210 = metadata !{i32 268, i32 0, metadata !178, null}
!211 = metadata !{i32 270, i32 0, metadata !173, null}
!212 = metadata !{i32 271, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !173, i32 271, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!214 = metadata !{i32 273, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !213, i32 272, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!216 = metadata !{i32 274, i32 0, metadata !215, null}
!217 = metadata !{i32 275, i32 0, metadata !215, null}
!218 = metadata !{i32 276, i32 0, metadata !173, null}
!219 = metadata !{i32 277, i32 0, metadata !173, null}
!220 = metadata !{i32 278, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !173, i32 278, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!222 = metadata !{i32 279, i32 0, metadata !173, null}
!223 = metadata !{i32 281, i32 0, metadata !173, null}
!224 = metadata !{i32 286, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !226, i32 286, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!226 = metadata !{i32 786443, metadata !1, metadata !184, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!227 = metadata !{i32 1}
!228 = metadata !{i32 287, i32 0, metadata !226, null}
!229 = metadata !{i32 289, i32 0, metadata !54, null}
!230 = metadata !{i32 187, i32 0, metadata !47, null}
!231 = metadata !{i32 191, i32 0, metadata !47, null}
!232 = metadata !{i32 193, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !47, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!234 = metadata !{i32 194, i32 0, metadata !233, null}
!235 = metadata !{i32 195, i32 0, metadata !233, null}
!236 = metadata !{i32 197, i32 0, metadata !47, null}
