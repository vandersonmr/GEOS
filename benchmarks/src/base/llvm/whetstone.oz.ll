; ModuleID = 'whetstone.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1
@T = common global double 0.000000e+00, align 8
@T1 = common global double 0.000000e+00, align 8
@T2 = common global double 0.000000e+00, align 8
@E1 = common global [5 x double] zeroinitializer, align 16
@J = common global i32 0, align 4
@K = common global i32 0, align 4
@L = common global i32 0, align 4
@.str3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !87
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !87
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !38), !dbg !89
  tail call void @llvm.dbg.value(metadata !90, i64 0, metadata !43), !dbg !91
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !36), !dbg !93
  %1 = icmp sgt i32 %argc, 1, !dbg !94
  br i1 %1, label %.lr.ph72, label %.preheader, !dbg !94

.preheader:                                       ; preds = %25, %0
  %continuous.0.lcssa = phi i32 [ 0, %0 ], [ %continuous.1, %25 ]
  %loopstart.0.lcssa = phi i64 [ 100000, %0 ], [ %loopstart.1, %25 ]
  %2 = mul nsw i64 %loopstart.0.lcssa, 12, !dbg !95
  %3 = mul nsw i64 %loopstart.0.lcssa, 14, !dbg !96
  %4 = mul nsw i64 %loopstart.0.lcssa, 345, !dbg !97
  %5 = mul nsw i64 %loopstart.0.lcssa, 210, !dbg !98
  %6 = shl nsw i64 %loopstart.0.lcssa, 5, !dbg !99
  %7 = mul nsw i64 %loopstart.0.lcssa, 899, !dbg !100
  %8 = mul nsw i64 %loopstart.0.lcssa, 616, !dbg !101
  %9 = mul nsw i64 %loopstart.0.lcssa, 93, !dbg !102
  %10 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !103
  %11 = icmp eq i32 %continuous.0.lcssa, 0, !dbg !105
  br label %28, !dbg !107

.lr.ph72:                                         ; preds = %0, %25
  %indvars.iv = phi i64 [ %indvars.iv.next, %25 ], [ 1, %0 ]
  %continuous.070 = phi i32 [ %continuous.1, %25 ], [ 0, %0 ]
  %loopstart.069 = phi i64 [ %loopstart.1, %25 ], [ 100000, %0 ]
  %12 = getelementptr inbounds i8** %argv, i64 %indvars.iv, !dbg !108
  %13 = load i8** %12, align 8, !dbg !108, !tbaa !111
  %14 = tail call i32 @strncmp(i8* %13, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i64 2) #5, !dbg !108
  %15 = icmp eq i32 %14, 0, !dbg !108
  br i1 %15, label %25, label %16, !dbg !108

; <label>:16                                      ; preds = %.lr.ph72
  %17 = load i8* %13, align 1, !dbg !108, !tbaa !115
  %18 = icmp eq i8 %17, 99, !dbg !108
  br i1 %18, label %25, label %19, !dbg !108

; <label>:19                                      ; preds = %16
  %20 = tail call i64 @atol(i8* %13) #5, !dbg !116
  %21 = icmp sgt i64 %20, 0, !dbg !116
  br i1 %21, label %25, label %22, !dbg !116

; <label>:22                                      ; preds = %19
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !118, !tbaa !111
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %23) #6, !dbg !118
  br label %.loopexit, !dbg !120

; <label>:25                                      ; preds = %19, %.lr.ph72, %16
  %loopstart.1 = phi i64 [ %loopstart.069, %16 ], [ %loopstart.069, %.lr.ph72 ], [ %20, %19 ]
  %continuous.1 = phi i32 [ 1, %16 ], [ 1, %.lr.ph72 ], [ %continuous.070, %19 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !94
  %26 = trunc i64 %indvars.iv.next to i32, !dbg !94
  %27 = icmp slt i32 %26, %argc, !dbg !94
  br i1 %27, label %.lr.ph72, label %.preheader, !dbg !94

; <label>:28                                      ; preds = %.preheader, %._crit_edge66
  %29 = tail call i64 @time(i64* null) #7, !dbg !107
  tail call void @llvm.dbg.value(metadata !{i64 %29}, i64 0, metadata !39), !dbg !107
  store double 4.999750e-01, double* @T, align 8, !dbg !121, !tbaa !122
  store double 5.002500e-01, double* @T1, align 8, !dbg !124, !tbaa !122
  store double 2.000000e+00, double* @T2, align 8, !dbg !125, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %loopstart.0.lcssa}, i64 0, metadata !35), !dbg !126
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !36), !dbg !127
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !37), !dbg !128
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !17), !dbg !130
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !18), !dbg !95
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !19), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !20), !dbg !97
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !21), !dbg !98
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !22), !dbg !99
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !23), !dbg !100
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !24), !dbg !101
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !25), !dbg !131
  tail call void @llvm.dbg.value(metadata !{i64 %9}, i64 0, metadata !26), !dbg !102
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !27), !dbg !133
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !29), !dbg !135
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !30), !dbg !136
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !31), !dbg !137
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !139
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !141) #4, !dbg !144
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !145) #4, !dbg !144
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !146) #4, !dbg !144
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !147) #4, !dbg !144
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !148) #4, !dbg !144
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !149) #4, !dbg !144
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !150) #4, !dbg !144
  %30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 0, i64 0, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #7, !dbg !151
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !152, !tbaa !122
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !153, !tbaa !122
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !154, !tbaa !122
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !155, !tbaa !122
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !103
  br i1 %10, label %.thread, label %.lr.ph, !dbg !103

.thread:                                          ; preds = %28
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !156) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !160) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !161) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %41}, i64 0, metadata !162) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !163) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !164) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %53}, i64 0, metadata !165) #4, !dbg !159
  %31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %2, i64 %3, i64 %2, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #7, !dbg !166
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !167
  br label %._crit_edge22, !dbg !167

.lr.ph:                                           ; preds = %28
  %32 = load double* @T, align 8, !dbg !169, !tbaa !122
  br label %33, !dbg !103

; <label>:33                                      ; preds = %33, %.lr.ph
  %34 = phi double [ -1.000000e+00, %.lr.ph ], [ %45, %33 ], !dbg !169
  %35 = phi double [ -1.000000e+00, %.lr.ph ], [ %53, %33 ], !dbg !169
  %36 = phi double [ -1.000000e+00, %.lr.ph ], [ %49, %33 ], !dbg !169
  %37 = phi double [ 1.000000e+00, %.lr.ph ], [ %41, %33 ]
  %I.110 = phi i64 [ 1, %.lr.ph ], [ %54, %33 ]
  %38 = fadd double %37, %34, !dbg !169
  %39 = fadd double %38, %36, !dbg !169
  %40 = fsub double %39, %35, !dbg !169
  %41 = fmul double %40, %32, !dbg !169
  %42 = fadd double %41, %34, !dbg !171
  %43 = fsub double %42, %36, !dbg !171
  %44 = fadd double %43, %35, !dbg !171
  %45 = fmul double %44, %32, !dbg !171
  %46 = fsub double %41, %45, !dbg !172
  %47 = fadd double %46, %36, !dbg !172
  %48 = fadd double %47, %35, !dbg !172
  %49 = fmul double %48, %32, !dbg !172
  %50 = fsub double %45, %41, !dbg !173
  %51 = fadd double %49, %50, !dbg !173
  %52 = fadd double %35, %51, !dbg !173
  %53 = fmul double %32, %52, !dbg !173
  %54 = add nsw i64 %I.110, 1, !dbg !103
  tail call void @llvm.dbg.value(metadata !{i64 %54}, i64 0, metadata !15), !dbg !103
  %55 = icmp slt i64 %I.110, %2, !dbg !103
  br i1 %55, label %33, label %56, !dbg !103

; <label>:56                                      ; preds = %33
  store double %49, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !172, !tbaa !122
  store double %53, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !173, !tbaa !122
  store double %41, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !173, !tbaa !122
  store double %45, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !173, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !156) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !160) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !161) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %41}, i64 0, metadata !162) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !163) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !164) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %53}, i64 0, metadata !165) #4, !dbg !159
  %57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %2, i64 %3, i64 %2, double %41, double %45, double %49, double %53) #7, !dbg !166
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !167
  br i1 %10, label %.critedge, label %.lr.ph21, !dbg !167

.lr.ph21:                                         ; preds = %56, %.lr.ph21
  %I.219 = phi i64 [ %58, %.lr.ph21 ], [ 1, %56 ]
  tail call void @PA(double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 0)) #8, !dbg !174
  %58 = add nsw i64 %I.219, 1, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i64 %58}, i64 0, metadata !15), !dbg !167
  %59 = icmp slt i64 %I.219, %3, !dbg !167
  br i1 %59, label %.lr.ph21, label %._crit_edge22, !dbg !167

._crit_edge22:                                    ; preds = %.lr.ph21, %.thread
  %60 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !175, !tbaa !122
  %61 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !175, !tbaa !122
  %62 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !175, !tbaa !122
  %63 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !175, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !177) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !179) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !180) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !181) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !182) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !183) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !184) #4, !dbg !178
  %64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %3, i64 %2, i64 %2, double %60, double %61, double %62, double %63) #7, !dbg !185
  store i32 1, i32* @J, align 4, !dbg !186, !tbaa !187
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !189
  br i1 %10, label %.critedge93, label %.lr.ph25, !dbg !189

.lr.ph25:                                         ; preds = %._crit_edge22, %.lr.ph25
  %65 = phi i32 [ %66, %.lr.ph25 ], [ 1, %._crit_edge22 ]
  %I.323 = phi i64 [ %67, %.lr.ph25 ], [ 1, %._crit_edge22 ]
  %66 = xor i32 %65, 1
  %67 = add nsw i64 %I.323, 1, !dbg !189
  tail call void @llvm.dbg.value(metadata !{i64 %67}, i64 0, metadata !15), !dbg !189
  %68 = icmp slt i64 %I.323, %4, !dbg !189
  br i1 %68, label %.lr.ph25, label %._crit_edge26, !dbg !189

._crit_edge26:                                    ; preds = %.lr.ph25
  store i32 %66, i32* @J, align 4, !dbg !191, !tbaa !187
  %phitmp = sext i32 %66 to i64, !dbg !189
  br label %74, !dbg !189

.critedge:                                        ; preds = %56
  %69 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !175, !tbaa !122
  %70 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !175, !tbaa !122
  %71 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !175, !tbaa !122
  %72 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !175, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !177) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !179) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !180) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !181) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !182) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !183) #4, !dbg !178
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !184) #4, !dbg !178
  %73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %3, i64 %2, i64 %2, double %69, double %70, double %71, double %72) #7, !dbg !185
  store i32 1, i32* @J, align 4, !dbg !186, !tbaa !187
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !189
  br label %74

; <label>:74                                      ; preds = %.critedge, %._crit_edge26
  %.lcssa5 = phi i64 [ %phitmp, %._crit_edge26 ], [ 1, %.critedge ]
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !194) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa5}, i64 0, metadata !198) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa5}, i64 0, metadata !199) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !200) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !201) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !202) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !203) #4, !dbg !197
  %75 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %4, i64 %.lcssa5, i64 %.lcssa5, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #7, !dbg !204
  store i32 1, i32* @J, align 4, !dbg !205, !tbaa !187
  store i32 2, i32* @K, align 4, !dbg !206, !tbaa !187
  store i32 3, i32* @L, align 4, !dbg !207, !tbaa !187
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !208
  br i1 %10, label %._crit_edge41.critedge, label %.lr.ph30, !dbg !208

.lr.ph30:                                         ; preds = %74, %.lr.ph30
  %I.428 = phi i64 [ %76, %.lr.ph30 ], [ 1, %74 ]
  store double 6.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !210, !tbaa !122
  store double 6.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !212, !tbaa !122
  %76 = add nsw i64 %I.428, 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{i64 %76}, i64 0, metadata !15), !dbg !208
  %77 = icmp slt i64 %I.428, %5, !dbg !208
  br i1 %77, label %.lr.ph30, label %._crit_edge31, !dbg !208

._crit_edge31:                                    ; preds = %.lr.ph30
  store i32 2, i32* @K, align 4, !dbg !212, !tbaa !187
  store i32 3, i32* @L, align 4, !dbg !212, !tbaa !187
  store i32 1, i32* @J, align 4, !dbg !213, !tbaa !187
  br label %79, !dbg !208

.critedge93:                                      ; preds = %._crit_edge22
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !194) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa5}, i64 0, metadata !198) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{i64 %.lcssa5}, i64 0, metadata !199) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !200) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !201) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !202) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !203) #4, !dbg !197
  %78 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %4, i64 1, i64 1, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #7, !dbg !204
  store i32 1, i32* @J, align 4, !dbg !205, !tbaa !187
  store i32 2, i32* @K, align 4, !dbg !206, !tbaa !187
  store i32 3, i32* @L, align 4, !dbg !207, !tbaa !187
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !208
  br label %79

; <label>:79                                      ; preds = %.critedge93, %._crit_edge31
  %80 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !213, !tbaa !122
  %81 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !213, !tbaa !122
  %82 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !213, !tbaa !122
  %83 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !213, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !215) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !217) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !218, i64 0, metadata !219) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !220) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !221) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !222) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %83}, i64 0, metadata !223) #4, !dbg !216
  %84 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %5, i64 1, i64 2, double %80, double %81, double %82, double %83) #7, !dbg !224
  tail call void @llvm.dbg.value(metadata !225, i64 0, metadata !32), !dbg !226
  tail call void @llvm.dbg.value(metadata !225, i64 0, metadata !33), !dbg !227
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !228
  br i1 %10, label %.critedge94, label %.lr.ph40, !dbg !228

.lr.ph40:                                         ; preds = %79, %.lr.ph40
  %I.538 = phi i64 [ %115, %.lr.ph40 ], [ 1, %79 ]
  %Y.037 = phi double [ %114, %.lr.ph40 ], [ 5.000000e-01, %79 ]
  %X.036 = phi double [ %99, %.lr.ph40 ], [ 5.000000e-01, %79 ]
  %85 = load double* @T, align 8, !dbg !230, !tbaa !122
  %86 = load double* @T2, align 8, !dbg !230, !tbaa !122
  %87 = tail call double @sin(double %X.036) #7, !dbg !230
  %88 = fmul double %86, %87, !dbg !230
  %89 = tail call double @cos(double %X.036) #7, !dbg !230
  %90 = fmul double %88, %89, !dbg !230
  %91 = fadd double %X.036, %Y.037, !dbg !230
  %92 = tail call double @cos(double %91) #7, !dbg !230
  %93 = fsub double %X.036, %Y.037, !dbg !230
  %94 = tail call double @cos(double %93) #7, !dbg !230
  %95 = fadd double %92, %94, !dbg !230
  %96 = fadd double %95, -1.000000e+00, !dbg !230
  %97 = fdiv double %90, %96, !dbg !230
  %98 = tail call double @atan(double %97) #7, !dbg !230
  %99 = fmul double %85, %98, !dbg !230
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !32), !dbg !230
  %100 = load double* @T, align 8, !dbg !232, !tbaa !122
  %101 = load double* @T2, align 8, !dbg !232, !tbaa !122
  %102 = tail call double @sin(double %Y.037) #7, !dbg !232
  %103 = fmul double %101, %102, !dbg !232
  %104 = tail call double @cos(double %Y.037) #7, !dbg !232
  %105 = fmul double %103, %104, !dbg !232
  %106 = fadd double %Y.037, %99, !dbg !232
  %107 = tail call double @cos(double %106) #7, !dbg !232
  %108 = fsub double %99, %Y.037, !dbg !232
  %109 = tail call double @cos(double %108) #7, !dbg !232
  %110 = fadd double %107, %109, !dbg !232
  %111 = fadd double %110, -1.000000e+00, !dbg !232
  %112 = fdiv double %105, %111, !dbg !232
  %113 = tail call double @atan(double %112) #7, !dbg !232
  %114 = fmul double %100, %113, !dbg !232
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !33), !dbg !232
  %115 = add nsw i64 %I.538, 1, !dbg !228
  tail call void @llvm.dbg.value(metadata !{i64 %115}, i64 0, metadata !15), !dbg !228
  %116 = icmp slt i64 %I.538, %6, !dbg !228
  br i1 %116, label %.lr.ph40, label %._crit_edge41, !dbg !228

._crit_edge41.critedge:                           ; preds = %74
  %117 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !213, !tbaa !122
  %118 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !213, !tbaa !122
  %119 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !213, !tbaa !122
  %120 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !213, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !215) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !217) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !218, i64 0, metadata !219) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !220) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !221) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !222) #4, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %83}, i64 0, metadata !223) #4, !dbg !216
  %121 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %5, i64 1, i64 2, double %117, double %118, double %119, double %120) #7, !dbg !224
  tail call void @llvm.dbg.value(metadata !225, i64 0, metadata !32), !dbg !226
  tail call void @llvm.dbg.value(metadata !225, i64 0, metadata !33), !dbg !227
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !228
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %.lr.ph40, %._crit_edge41.critedge
  %Y.0.lcssa = phi double [ 5.000000e-01, %._crit_edge41.critedge ], [ %114, %.lr.ph40 ]
  %X.0.lcssa = phi double [ 5.000000e-01, %._crit_edge41.critedge ], [ %99, %.lr.ph40 ]
  %122 = load i32* @J, align 4, !dbg !233, !tbaa !187
  %123 = sext i32 %122 to i64, !dbg !233
  %124 = load i32* @K, align 4, !dbg !233, !tbaa !187
  %125 = sext i32 %124 to i64, !dbg !233
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !235) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{i64 %123}, i64 0, metadata !237) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{i64 %125}, i64 0, metadata !238) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !239) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !240) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !241) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !242) #4, !dbg !236
  %126 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %6, i64 %123, i64 %125, double %X.0.lcssa, double %X.0.lcssa, double %Y.0.lcssa, double %Y.0.lcssa) #7, !dbg !243
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !32), !dbg !244
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !33), !dbg !245
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !34), !dbg !246
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !247), !dbg !250
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !34), !dbg !251
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !253
  br i1 %10, label %139, label %.lr.ph46, !dbg !253

.lr.ph46:                                         ; preds = %._crit_edge41
  %127 = load double* @T, align 8, !dbg !254, !tbaa !122
  %128 = fmul double %127, 2.000000e+00, !dbg !254
  %129 = fadd double %128, 1.000000e+00, !dbg !255
  %130 = fmul double %127, %129, !dbg !255
  %131 = fadd double %128, %130, !dbg !256
  %132 = load double* @T2, align 8, !dbg !256, !tbaa !122
  %133 = fdiv double %131, %132, !dbg !256
  br label %139, !dbg !253

.critedge94:                                      ; preds = %79
  %134 = load i32* @J, align 4, !dbg !233, !tbaa !187
  %135 = sext i32 %134 to i64, !dbg !233
  %136 = load i32* @K, align 4, !dbg !233, !tbaa !187
  %137 = sext i32 %136 to i64, !dbg !233
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !235) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{i64 %123}, i64 0, metadata !237) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{i64 %125}, i64 0, metadata !238) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !239) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !240) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !241) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !242) #4, !dbg !236
  %138 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %6, i64 %135, i64 %137, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01) #7, !dbg !243
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !32), !dbg !244
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !33), !dbg !245
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !34), !dbg !246
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !247), !dbg !250
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !34), !dbg !251
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !253
  br label %139

; <label>:139                                     ; preds = %.critedge94, %.lr.ph46, %._crit_edge41
  %.lcssa7 = phi double [ %133, %.lr.ph46 ], [ 1.000000e+00, %._crit_edge41 ], [ 1.000000e+00, %.critedge94 ]
  %140 = load i32* @J, align 4, !dbg !251, !tbaa !187
  %141 = sext i32 %140 to i64, !dbg !251
  %142 = load i32* @K, align 4, !dbg !251, !tbaa !187
  %143 = sext i32 %142 to i64, !dbg !251
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !257) #4, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i64 %141}, i64 0, metadata !259) #4, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i64 %143}, i64 0, metadata !260) #4, !dbg !258
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !261) #4, !dbg !258
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !262) #4, !dbg !258
  tail call void @llvm.dbg.value(metadata !{double %.lcssa7}, i64 0, metadata !263) #4, !dbg !258
  tail call void @llvm.dbg.value(metadata !{double %.lcssa7}, i64 0, metadata !264) #4, !dbg !258
  %144 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %7, i64 %141, i64 %143, double 1.000000e+00, double 1.000000e+00, double %.lcssa7, double %.lcssa7) #7, !dbg !265
  store i32 1, i32* @J, align 4, !dbg !266, !tbaa !187
  store i32 2, i32* @K, align 4, !dbg !267, !tbaa !187
  store i32 3, i32* @L, align 4, !dbg !268, !tbaa !187
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !269, !tbaa !122
  store double 2.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !270, !tbaa !122
  store double 3.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !271, !tbaa !122
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !272
  br i1 %10, label %._crit_edge66.critedge, label %.lr.ph60, !dbg !272

.lr.ph60:                                         ; preds = %139, %.lr.ph60
  %I.758 = phi i64 [ %145, %.lr.ph60 ], [ 1, %139 ]
  tail call void @P0() #8, !dbg !274
  %145 = add nsw i64 %I.758, 1, !dbg !272
  tail call void @llvm.dbg.value(metadata !{i64 %145}, i64 0, metadata !15), !dbg !272
  %146 = icmp slt i64 %I.758, %8, !dbg !272
  br i1 %146, label %.lr.ph60, label %._crit_edge61, !dbg !272

._crit_edge61:                                    ; preds = %.lr.ph60
  %.pre = load i32* @J, align 4, !dbg !275, !tbaa !187
  %.pre87 = load i32* @K, align 4, !dbg !275, !tbaa !187
  %.pre88 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !275, !tbaa !122
  %.pre89 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !275, !tbaa !122
  %.pre90 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !275, !tbaa !122
  %phitmp91 = sext i32 %.pre to i64, !dbg !272
  %phitmp92 = sext i32 %.pre87 to i64, !dbg !272
  %147 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !275, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !277) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp91}, i64 0, metadata !279) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp92}, i64 0, metadata !280) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %.pre88}, i64 0, metadata !281) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %.pre89}, i64 0, metadata !282) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %.pre90}, i64 0, metadata !283) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !284) #4, !dbg !278
  %148 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %8, i64 %phitmp91, i64 %phitmp92, double %.pre88, double %.pre89, double %.pre90, double %147) #7, !dbg !285
  store i32 2, i32* @J, align 4, !dbg !286, !tbaa !187
  store i32 3, i32* @K, align 4, !dbg !287, !tbaa !187
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !288
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !290) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !218, i64 0, metadata !294) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !295, i64 0, metadata !296) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !297) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !298) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !299) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !300) #4, !dbg !293
  %149 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #7, !dbg !301
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !32), !dbg !303
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !304
  br i1 %10, label %._crit_edge66, label %.lr.ph65, !dbg !304

.lr.ph65:                                         ; preds = %._crit_edge61, %.lr.ph65
  %I.963 = phi i64 [ %155, %.lr.ph65 ], [ 1, %._crit_edge61 ]
  %X.162 = phi double [ %154, %.lr.ph65 ], [ 7.500000e-01, %._crit_edge61 ]
  %150 = tail call double @log(double %X.162) #7, !dbg !306
  %151 = load double* @T1, align 8, !dbg !306, !tbaa !122
  %152 = fdiv double %150, %151, !dbg !306
  %153 = tail call double @exp(double %152) #7, !dbg !306
  %154 = tail call double @sqrt(double %153) #7, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !32), !dbg !306
  %155 = add nsw i64 %I.963, 1, !dbg !304
  tail call void @llvm.dbg.value(metadata !{i64 %155}, i64 0, metadata !15), !dbg !304
  %156 = icmp slt i64 %I.963, %9, !dbg !304
  br i1 %156, label %.lr.ph65, label %._crit_edge66, !dbg !304

._crit_edge66.critedge:                           ; preds = %139
  %157 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !275, !tbaa !122
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !277) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp91}, i64 0, metadata !279) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp92}, i64 0, metadata !280) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %.pre88}, i64 0, metadata !281) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %.pre89}, i64 0, metadata !282) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %.pre90}, i64 0, metadata !283) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !284) #4, !dbg !278
  %158 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %8, i64 1, i64 2, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double %157) #7, !dbg !285
  store i32 2, i32* @J, align 4, !dbg !286, !tbaa !187
  store i32 3, i32* @K, align 4, !dbg !287, !tbaa !187
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !288
  tail call void @llvm.dbg.value(metadata !129, i64 0, metadata !290) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !218, i64 0, metadata !294) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !295, i64 0, metadata !296) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !297) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !298) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !299) #4, !dbg !293
  tail call void @llvm.dbg.value(metadata !134, i64 0, metadata !300) #4, !dbg !293
  %159 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #7, !dbg !301
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !32), !dbg !303
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !15), !dbg !304
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %.lr.ph65, %._crit_edge66.critedge, %._crit_edge61
  %X.1.lcssa = phi double [ 7.500000e-01, %._crit_edge61 ], [ 7.500000e-01, %._crit_edge66.critedge ], [ %154, %.lr.ph65 ]
  %160 = load i32* @J, align 4, !dbg !307, !tbaa !187
  %161 = sext i32 %160 to i64, !dbg !307
  %162 = load i32* @K, align 4, !dbg !307, !tbaa !187
  %163 = sext i32 %162 to i64, !dbg !307
  tail call void @llvm.dbg.value(metadata !{i64 %9}, i64 0, metadata !309) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata !{i64 %161}, i64 0, metadata !311) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata !{i64 %163}, i64 0, metadata !312) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !313) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !314) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !315) #4, !dbg !310
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !316) #4, !dbg !310
  %164 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %9, i64 %161, i64 %163, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa) #7, !dbg !317
  tail call void @llvm.dbg.value(metadata !318, i64 0, metadata !37), !dbg !319
  %165 = tail call i64 @time(i64* null) #7, !dbg !321
  tail call void @llvm.dbg.value(metadata !{i64 %165}, i64 0, metadata !40), !dbg !321
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !322
  br i1 %11, label %.loopexit, label %28, !dbg !105

.loopexit:                                        ; preds = %._crit_edge66, %22
  %.0 = phi i32 [ 1, %22 ], [ 0, %._crit_edge66 ]
  ret i32 %.0, !dbg !323
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) #1

; Function Attrs: minsize nounwind optsize readonly
declare i64 @atol(i8* nocapture) #1

; Function Attrs: minsize nounwind optsize
declare i64 @time(i64*) #2

; Function Attrs: minsize nounwind optsize uwtable
define void @POUT(i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %N}, i64 0, metadata !66), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i64 %J}, i64 0, metadata !67), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i64 %K}, i64 0, metadata !68), !dbg !324
  tail call void @llvm.dbg.value(metadata !{double %X1}, i64 0, metadata !69), !dbg !324
  tail call void @llvm.dbg.value(metadata !{double %X2}, i64 0, metadata !70), !dbg !324
  tail call void @llvm.dbg.value(metadata !{double %X3}, i64 0, metadata !71), !dbg !324
  tail call void @llvm.dbg.value(metadata !{double %X4}, i64 0, metadata !72), !dbg !324
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #7, !dbg !325
  ret void, !dbg !326
}

; Function Attrs: minsize nounwind optsize uwtable
define void @PA(double* nocapture %E) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %E}, i64 0, metadata !49), !dbg !327
  store i32 0, i32* @J, align 4, !dbg !328, !tbaa !187
  %1 = getelementptr inbounds double* %E, i64 1, !dbg !329
  %2 = getelementptr inbounds double* %E, i64 2, !dbg !329
  %3 = getelementptr inbounds double* %E, i64 3, !dbg !329
  %4 = getelementptr inbounds double* %E, i64 4, !dbg !329
  %.pre = load double* %1, align 8, !dbg !329, !tbaa !122
  %.pre1 = load double* %2, align 8, !dbg !329, !tbaa !122
  %.pre2 = load double* %3, align 8, !dbg !329, !tbaa !122
  %.pre3 = load double* %4, align 8, !dbg !329, !tbaa !122
  br label %5, !dbg !328

; <label>:5                                       ; preds = %5, %0
  %6 = phi double [ %30, %5 ], [ %.pre3, %0 ], !dbg !329
  %7 = phi double [ %25, %5 ], [ %.pre2, %0 ], !dbg !329
  %8 = phi double [ %20, %5 ], [ %.pre1, %0 ], !dbg !329
  %9 = phi double [ %15, %5 ], [ %.pre, %0 ], !dbg !329
  %10 = phi i32 [ %31, %5 ], [ 0, %0 ], !dbg !329
  %11 = fadd double %9, %8, !dbg !329
  %12 = fadd double %11, %7, !dbg !329
  %13 = fsub double %12, %6, !dbg !329
  %14 = load double* @T, align 8, !dbg !329, !tbaa !122
  %15 = fmul double %13, %14, !dbg !329
  store double %15, double* %1, align 8, !dbg !329, !tbaa !122
  %16 = fadd double %15, %8, !dbg !330
  %17 = fsub double %16, %7, !dbg !330
  %18 = fadd double %17, %6, !dbg !330
  %19 = load double* @T, align 8, !dbg !330, !tbaa !122
  %20 = fmul double %18, %19, !dbg !330
  store double %20, double* %2, align 8, !dbg !330, !tbaa !122
  %21 = fsub double %15, %20, !dbg !331
  %22 = fadd double %21, %7, !dbg !331
  %23 = fadd double %22, %6, !dbg !331
  %24 = load double* @T, align 8, !dbg !331, !tbaa !122
  %25 = fmul double %23, %24, !dbg !331
  store double %25, double* %3, align 8, !dbg !331, !tbaa !122
  %26 = fsub double %20, %15, !dbg !332
  %27 = fadd double %25, %26, !dbg !332
  %28 = fadd double %6, %27, !dbg !332
  %29 = load double* @T2, align 8, !dbg !332, !tbaa !122
  %30 = fdiv double %28, %29, !dbg !332
  store double %30, double* %4, align 8, !dbg !332, !tbaa !122
  %31 = add nsw i32 %10, 1, !dbg !333
  %exitcond = icmp eq i32 %31, 6, !dbg !334
  br i1 %exitcond, label %32, label %5, !dbg !334

; <label>:32                                      ; preds = %5
  store i32 6, i32* @J, align 4, !dbg !333, !tbaa !187
  ret void, !dbg !336
}

; Function Attrs: minsize nounwind optsize
declare double @atan(double) #2

; Function Attrs: minsize nounwind optsize
declare double @sin(double) #2

; Function Attrs: minsize nounwind optsize
declare double @cos(double) #2

; Function Attrs: minsize nounwind optsize uwtable
define void @P3(double %X, double %Y, double* nocapture %Z) #0 {
  tail call void @llvm.dbg.value(metadata !{double %X}, i64 0, metadata !57), !dbg !337
  tail call void @llvm.dbg.value(metadata !{double %Y}, i64 0, metadata !58), !dbg !337
  tail call void @llvm.dbg.value(metadata !{double* %Z}, i64 0, metadata !59), !dbg !337
  tail call void @llvm.dbg.value(metadata !{double %X}, i64 0, metadata !60), !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %Y}, i64 0, metadata !61), !dbg !339
  %1 = load double* @T, align 8, !dbg !340, !tbaa !122
  %2 = fadd double %X, %Y, !dbg !340
  %3 = fmul double %2, %1, !dbg !340
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !60), !dbg !340
  %4 = fadd double %3, %Y, !dbg !341
  %5 = fmul double %1, %4, !dbg !341
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !61), !dbg !341
  %6 = fadd double %3, %5, !dbg !342
  %7 = load double* @T2, align 8, !dbg !342, !tbaa !122
  %8 = fdiv double %6, %7, !dbg !342
  store double %8, double* %Z, align 8, !dbg !342, !tbaa !122
  ret void, !dbg !343
}

; Function Attrs: minsize nounwind optsize uwtable
define void @P0() #0 {
  %1 = load i32* @K, align 4, !dbg !344, !tbaa !187
  %2 = sext i32 %1 to i64, !dbg !344
  %3 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %2, !dbg !344
  %4 = load double* %3, align 8, !dbg !344, !tbaa !122
  %5 = load i32* @J, align 4, !dbg !344, !tbaa !187
  %6 = sext i32 %5 to i64, !dbg !344
  %7 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %6, !dbg !344
  store double %4, double* %7, align 8, !dbg !344, !tbaa !122
  %8 = load i32* @L, align 4, !dbg !345, !tbaa !187
  %9 = sext i32 %8 to i64, !dbg !345
  %10 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %9, !dbg !345
  %11 = load double* %10, align 8, !dbg !345, !tbaa !122
  store double %11, double* %3, align 8, !dbg !345, !tbaa !122
  %12 = load double* %7, align 8, !dbg !346, !tbaa !122
  store double %12, double* %10, align 8, !dbg !346, !tbaa !122
  ret void, !dbg !347
}

; Function Attrs: minsize nounwind optsize
declare double @sqrt(double) #2

; Function Attrs: minsize nounwind optsize
declare double @exp(double) #2

; Function Attrs: minsize nounwind optsize
declare double @log(double) #2

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { minsize nounwind optsize readonly }
attributes #6 = { cold }
attributes #7 = { minsize nounwind optsize }
attributes #8 = { minsize optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!84, !85}
!llvm.ident = !{!86}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !73, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c] [DW_LANG_C99]
!1 = metadata !{metadata !"whetstone.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !44, metadata !50, metadata !53, metadata !62}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 87, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 88} ; [ DW_TAG_subprogram ] [line 87] [def] [scope 88] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !43}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777303, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 87]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554519, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 87]
!15 = metadata !{i32 786688, metadata !4, metadata !"I", metadata !5, i32 90, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [I] [line 90]
!16 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786688, metadata !4, metadata !"N1", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N1] [line 91]
!18 = metadata !{i32 786688, metadata !4, metadata !"N2", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N2] [line 91]
!19 = metadata !{i32 786688, metadata !4, metadata !"N3", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N3] [line 91]
!20 = metadata !{i32 786688, metadata !4, metadata !"N4", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N4] [line 91]
!21 = metadata !{i32 786688, metadata !4, metadata !"N6", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N6] [line 91]
!22 = metadata !{i32 786688, metadata !4, metadata !"N7", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N7] [line 91]
!23 = metadata !{i32 786688, metadata !4, metadata !"N8", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N8] [line 91]
!24 = metadata !{i32 786688, metadata !4, metadata !"N9", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N9] [line 91]
!25 = metadata !{i32 786688, metadata !4, metadata !"N10", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N10] [line 91]
!26 = metadata !{i32 786688, metadata !4, metadata !"N11", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N11] [line 91]
!27 = metadata !{i32 786688, metadata !4, metadata !"X1", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X1] [line 92]
!28 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!29 = metadata !{i32 786688, metadata !4, metadata !"X2", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X2] [line 92]
!30 = metadata !{i32 786688, metadata !4, metadata !"X3", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X3] [line 92]
!31 = metadata !{i32 786688, metadata !4, metadata !"X4", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X4] [line 92]
!32 = metadata !{i32 786688, metadata !4, metadata !"X", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 92]
!33 = metadata !{i32 786688, metadata !4, metadata !"Y", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y] [line 92]
!34 = metadata !{i32 786688, metadata !4, metadata !"Z", metadata !5, i32 92, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z] [line 92]
!35 = metadata !{i32 786688, metadata !4, metadata !"LOOP", metadata !5, i32 93, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [LOOP] [line 93]
!36 = metadata !{i32 786688, metadata !4, metadata !"II", metadata !5, i32 94, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [II] [line 94]
!37 = metadata !{i32 786688, metadata !4, metadata !"JJ", metadata !5, i32 94, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [JJ] [line 94]
!38 = metadata !{i32 786688, metadata !4, metadata !"loopstart", metadata !5, i32 97, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loopstart] [line 97]
!39 = metadata !{i32 786688, metadata !4, metadata !"startsec", metadata !5, i32 98, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [startsec] [line 98]
!40 = metadata !{i32 786688, metadata !4, metadata !"finisec", metadata !5, i32 98, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [finisec] [line 98]
!41 = metadata !{i32 786688, metadata !4, metadata !"KIPS", metadata !5, i32 99, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [KIPS] [line 99]
!42 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!43 = metadata !{i32 786688, metadata !4, metadata !"continuous", metadata !5, i32 100, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [continuous] [line 100]
!44 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"PA", metadata !"PA", metadata !"", i32 397, metadata !45, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double*)* @PA, null, null, metadata !48, i32 398} ; [ DW_TAG_subprogram ] [line 397] [def] [scope 398] [PA]
!45 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{null, metadata !47}
!47 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786689, metadata !44, metadata !"E", metadata !5, i32 16777613, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [E] [line 397]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"P0", metadata !"P0", metadata !"", i32 413, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @P0, null, null, metadata !2, i32 414} ; [ DW_TAG_subprogram ] [line 413] [def] [scope 414] [P0]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null}
!53 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"P3", metadata !"P3", metadata !"", i32 421, metadata !54, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double, double, double*)* @P3, null, null, metadata !56, i32 422} ; [ DW_TAG_subprogram ] [line 421] [def] [scope 422] [P3]
!54 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{null, metadata !28, metadata !28, metadata !47}
!56 = metadata !{metadata !57, metadata !58, metadata !59, metadata !60, metadata !61}
!57 = metadata !{i32 786689, metadata !53, metadata !"X", metadata !5, i32 16777637, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X] [line 421]
!58 = metadata !{i32 786689, metadata !53, metadata !"Y", metadata !5, i32 33554853, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Y] [line 421]
!59 = metadata !{i32 786689, metadata !53, metadata !"Z", metadata !5, i32 50332069, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Z] [line 421]
!60 = metadata !{i32 786688, metadata !53, metadata !"X1", metadata !5, i32 423, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X1] [line 423]
!61 = metadata !{i32 786688, metadata !53, metadata !"Y1", metadata !5, i32 423, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y1] [line 423]
!62 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"POUT", metadata !"POUT", metadata !"", i32 434, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64, i64, double, double, double, double)* @POUT, null, null, metadata !65, i32 435} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [POUT]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{null, metadata !16, metadata !16, metadata !16, metadata !28, metadata !28, metadata !28, metadata !28}
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71, metadata !72}
!66 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 434]
!67 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [J] [line 434]
!68 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [K] [line 434]
!69 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!70 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!71 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!72 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!73 = metadata !{metadata !74, metadata !75, metadata !76, metadata !77, metadata !81, metadata !82, metadata !83}
!74 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 83, metadata !28, i32 0, i32 1, double* @T, null} ; [ DW_TAG_variable ] [T] [line 83] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"T1", metadata !"T1", metadata !"", metadata !5, i32 83, metadata !28, i32 0, i32 1, double* @T1, null} ; [ DW_TAG_variable ] [T1] [line 83] [def]
!76 = metadata !{i32 786484, i32 0, null, metadata !"T2", metadata !"T2", metadata !"", metadata !5, i32 83, metadata !28, i32 0, i32 1, double* @T2, null} ; [ DW_TAG_variable ] [T2] [line 83] [def]
!77 = metadata !{i32 786484, i32 0, null, metadata !"E1", metadata !"E1", metadata !"", metadata !5, i32 83, metadata !78, i32 0, i32 1, [5 x double]* @E1, null} ; [ DW_TAG_variable ] [E1] [line 83] [def]
!78 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 64, i32 0, i32 0, metadata !28, metadata !79, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 64, offset 0] [from double]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!81 = metadata !{i32 786484, i32 0, null, metadata !"J", metadata !"J", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @J, null} ; [ DW_TAG_variable ] [J] [line 84] [def]
!82 = metadata !{i32 786484, i32 0, null, metadata !"K", metadata !"K", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @K, null} ; [ DW_TAG_variable ] [K] [line 84] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"L", metadata !"L", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @L, null} ; [ DW_TAG_variable ] [L] [line 84] [def]
!84 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!85 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!86 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!87 = metadata !{i32 87, i32 0, metadata !4, null}
!88 = metadata !{i64 100000}
!89 = metadata !{i32 105, i32 0, metadata !4, null}
!90 = metadata !{i32 0}
!91 = metadata !{i32 107, i32 0, metadata !4, null}
!92 = metadata !{i32 1}
!93 = metadata !{i32 109, i32 0, metadata !4, null}
!94 = metadata !{i32 110, i32 0, metadata !4, null}
!95 = metadata !{i32 153, i32 0, metadata !4, null}
!96 = metadata !{i32 154, i32 0, metadata !4, null}
!97 = metadata !{i32 155, i32 0, metadata !4, null}
!98 = metadata !{i32 156, i32 0, metadata !4, null}
!99 = metadata !{i32 157, i32 0, metadata !4, null}
!100 = metadata !{i32 158, i32 0, metadata !4, null}
!101 = metadata !{i32 159, i32 0, metadata !4, null}
!102 = metadata !{i32 161, i32 0, metadata !4, null}
!103 = metadata !{i32 192, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !4, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!105 = metadata !{i32 390, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !4, i32 390, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!107 = metadata !{i32 128, i32 0, metadata !4, null}
!108 = metadata !{i32 111, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !110, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!110 = metadata !{i32 786443, metadata !1, metadata !4, i32 110, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!111 = metadata !{metadata !112, metadata !112, i64 0}
!112 = metadata !{metadata !"any pointer", metadata !113, i64 0}
!113 = metadata !{metadata !"omnipotent char", metadata !114, i64 0}
!114 = metadata !{metadata !"Simple C/C++ TBAA"}
!115 = metadata !{metadata !113, metadata !113, i64 0}
!116 = metadata !{i32 113, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !109, i32 113, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!118 = metadata !{i32 116, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !117, i32 115, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!120 = metadata !{i32 117, i32 0, metadata !119, null}
!121 = metadata !{i32 135, i32 0, metadata !4, null}
!122 = metadata !{metadata !123, metadata !123, i64 0}
!123 = metadata !{metadata !"double", metadata !113, i64 0}
!124 = metadata !{i32 136, i32 0, metadata !4, null}
!125 = metadata !{i32 137, i32 0, metadata !4, null}
!126 = metadata !{i32 146, i32 0, metadata !4, null}
!127 = metadata !{i32 147, i32 0, metadata !4, null}
!128 = metadata !{i32 149, i32 0, metadata !4, null}
!129 = metadata !{i64 0}
!130 = metadata !{i32 152, i32 0, metadata !4, null}
!131 = metadata !{i32 160, i32 0, metadata !4, null}
!132 = metadata !{double 1.000000e+00}
!133 = metadata !{i32 167, i32 0, metadata !4, null}
!134 = metadata !{double -1.000000e+00}
!135 = metadata !{i32 168, i32 0, metadata !4, null}
!136 = metadata !{i32 169, i32 0, metadata !4, null}
!137 = metadata !{i32 170, i32 0, metadata !4, null}
!138 = metadata !{i64 1}
!139 = metadata !{i32 172, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !4, i32 172, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!141 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [N] [line 434]
!142 = metadata !{i32 179, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !4, i32 179, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!144 = metadata !{i32 434, i32 0, metadata !62, metadata !142}
!145 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [J] [line 434]
!146 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [K] [line 434]
!147 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!148 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!149 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!150 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!151 = metadata !{i32 436, i32 0, metadata !62, metadata !142}
!152 = metadata !{i32 187, i32 0, metadata !4, null}
!153 = metadata !{i32 188, i32 0, metadata !4, null}
!154 = metadata !{i32 189, i32 0, metadata !4, null}
!155 = metadata !{i32 190, i32 0, metadata !4, null}
!156 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [N] [line 434]
!157 = metadata !{i32 200, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !4, i32 200, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!159 = metadata !{i32 434, i32 0, metadata !62, metadata !157}
!160 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [J] [line 434]
!161 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [K] [line 434]
!162 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!163 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!164 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!165 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!166 = metadata !{i32 436, i32 0, metadata !62, metadata !157}
!167 = metadata !{i32 208, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !4, i32 208, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!169 = metadata !{i32 193, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !104, i32 192, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!171 = metadata !{i32 194, i32 0, metadata !170, null}
!172 = metadata !{i32 195, i32 0, metadata !170, null}
!173 = metadata !{i32 196, i32 0, metadata !170, null}
!174 = metadata !{i32 209, i32 0, metadata !168, null}
!175 = metadata !{i32 212, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !4, i32 212, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!177 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [N] [line 434]
!178 = metadata !{i32 434, i32 0, metadata !62, metadata !175}
!179 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [J] [line 434]
!180 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [K] [line 434]
!181 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!182 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!183 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!184 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!185 = metadata !{i32 436, i32 0, metadata !62, metadata !175}
!186 = metadata !{i32 220, i32 0, metadata !4, null}
!187 = metadata !{metadata !188, metadata !188, i64 0}
!188 = metadata !{metadata !"int", metadata !113, i64 0}
!189 = metadata !{i32 221, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !4, i32 221, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!191 = metadata !{i32 233, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !193, i32 232, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!193 = metadata !{i32 786443, metadata !1, metadata !190, i32 221, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!194 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [N] [line 434]
!195 = metadata !{i32 239, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !4, i32 239, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!197 = metadata !{i32 434, i32 0, metadata !62, metadata !195}
!198 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [J] [line 434]
!199 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [K] [line 434]
!200 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!201 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!202 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!203 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!204 = metadata !{i32 436, i32 0, metadata !62, metadata !195}
!205 = metadata !{i32 249, i32 0, metadata !4, null}
!206 = metadata !{i32 250, i32 0, metadata !4, null}
!207 = metadata !{i32 251, i32 0, metadata !4, null}
!208 = metadata !{i32 253, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !4, i32 253, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!210 = metadata !{i32 257, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !209, i32 253, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!212 = metadata !{i32 258, i32 0, metadata !211, null}
!213 = metadata !{i32 262, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !4, i32 262, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!215 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [N] [line 434]
!216 = metadata !{i32 434, i32 0, metadata !62, metadata !213}
!217 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [J] [line 434]
!218 = metadata !{i64 2}
!219 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [K] [line 434]
!220 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!221 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!222 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!223 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !213} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!224 = metadata !{i32 436, i32 0, metadata !62, metadata !213}
!225 = metadata !{double 5.000000e-01}
!226 = metadata !{i32 270, i32 0, metadata !4, null}
!227 = metadata !{i32 271, i32 0, metadata !4, null}
!228 = metadata !{i32 273, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !4, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!230 = metadata !{i32 274, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !229, i32 273, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!232 = metadata !{i32 275, i32 0, metadata !231, null}
!233 = metadata !{i32 279, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !4, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!235 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [N] [line 434]
!236 = metadata !{i32 434, i32 0, metadata !62, metadata !233}
!237 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [J] [line 434]
!238 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [K] [line 434]
!239 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!240 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!241 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!242 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!243 = metadata !{i32 436, i32 0, metadata !62, metadata !233}
!244 = metadata !{i32 287, i32 0, metadata !4, null}
!245 = metadata !{i32 288, i32 0, metadata !4, null}
!246 = metadata !{i32 289, i32 0, metadata !4, null}
!247 = metadata !{i32 786689, metadata !53, metadata !"Z", metadata !5, i32 50332069, metadata !47, i32 0, metadata !248} ; [ DW_TAG_arg_variable ] [Z] [line 421]
!248 = metadata !{i32 292, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !4, i32 291, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!250 = metadata !{i32 421, i32 0, metadata !53, metadata !248}
!251 = metadata !{i32 295, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !4, i32 295, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!253 = metadata !{i32 291, i32 0, metadata !249, null}
!254 = metadata !{i32 427, i32 0, metadata !53, metadata !248}
!255 = metadata !{i32 428, i32 0, metadata !53, metadata !248}
!256 = metadata !{i32 429, i32 0, metadata !53, metadata !248}
!257 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [N] [line 434]
!258 = metadata !{i32 434, i32 0, metadata !62, metadata !251}
!259 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [J] [line 434]
!260 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [K] [line 434]
!261 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!262 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!263 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!264 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!265 = metadata !{i32 436, i32 0, metadata !62, metadata !251}
!266 = metadata !{i32 303, i32 0, metadata !4, null}
!267 = metadata !{i32 304, i32 0, metadata !4, null}
!268 = metadata !{i32 305, i32 0, metadata !4, null}
!269 = metadata !{i32 306, i32 0, metadata !4, null}
!270 = metadata !{i32 307, i32 0, metadata !4, null}
!271 = metadata !{i32 308, i32 0, metadata !4, null}
!272 = metadata !{i32 310, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !4, i32 310, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!274 = metadata !{i32 311, i32 0, metadata !273, null}
!275 = metadata !{i32 314, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!277 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [N] [line 434]
!278 = metadata !{i32 434, i32 0, metadata !62, metadata !275}
!279 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [J] [line 434]
!280 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [K] [line 434]
!281 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!282 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!283 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!284 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!285 = metadata !{i32 436, i32 0, metadata !62, metadata !275}
!286 = metadata !{i32 322, i32 0, metadata !4, null}
!287 = metadata !{i32 323, i32 0, metadata !4, null}
!288 = metadata !{i32 325, i32 0, metadata !289, null}
!289 = metadata !{i32 786443, metadata !1, metadata !4, i32 325, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!290 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [N] [line 434]
!291 = metadata !{i32 333, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !4, i32 333, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!293 = metadata !{i32 434, i32 0, metadata !62, metadata !291}
!294 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [J] [line 434]
!295 = metadata !{i64 3}
!296 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [K] [line 434]
!297 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!298 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!299 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!300 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !291} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!301 = metadata !{i32 436, i32 0, metadata !62, metadata !291}
!302 = metadata !{double 7.500000e-01}
!303 = metadata !{i32 341, i32 0, metadata !4, null}
!304 = metadata !{i32 343, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !4, i32 343, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!306 = metadata !{i32 344, i32 0, metadata !305, null}
!307 = metadata !{i32 347, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !4, i32 347, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!309 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [N] [line 434]
!310 = metadata !{i32 434, i32 0, metadata !62, metadata !307}
!311 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [J] [line 434]
!312 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [K] [line 434]
!313 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!314 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!315 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!316 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!317 = metadata !{i32 436, i32 0, metadata !62, metadata !307}
!318 = metadata !{i32 2}
!319 = metadata !{i32 355, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !4, i32 355, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!321 = metadata !{i32 363, i32 0, metadata !4, null}
!322 = metadata !{i32 374, i32 0, metadata !4, null}
!323 = metadata !{i32 394, i32 0, metadata !4, null}
!324 = metadata !{i32 434, i32 0, metadata !62, null}
!325 = metadata !{i32 436, i32 0, metadata !62, null}
!326 = metadata !{i32 438, i32 0, metadata !62, null}
!327 = metadata !{i32 397, i32 0, metadata !44, null}
!328 = metadata !{i32 399, i32 0, metadata !44, null}
!329 = metadata !{i32 402, i32 0, metadata !44, null}
!330 = metadata !{i32 403, i32 0, metadata !44, null}
!331 = metadata !{i32 404, i32 0, metadata !44, null}
!332 = metadata !{i32 405, i32 0, metadata !44, null}
!333 = metadata !{i32 406, i32 0, metadata !44, null}
!334 = metadata !{i32 408, i32 0, metadata !335, null}
!335 = metadata !{i32 786443, metadata !1, metadata !44, i32 408, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!336 = metadata !{i32 410, i32 0, metadata !44, null}
!337 = metadata !{i32 421, i32 0, metadata !53, null}
!338 = metadata !{i32 425, i32 0, metadata !53, null}
!339 = metadata !{i32 426, i32 0, metadata !53, null}
!340 = metadata !{i32 427, i32 0, metadata !53, null}
!341 = metadata !{i32 428, i32 0, metadata !53, null}
!342 = metadata !{i32 429, i32 0, metadata !53, null}
!343 = metadata !{i32 430, i32 0, metadata !53, null}
!344 = metadata !{i32 415, i32 0, metadata !50, null}
!345 = metadata !{i32 416, i32 0, metadata !50, null}
!346 = metadata !{i32 417, i32 0, metadata !50, null}
!347 = metadata !{i32 418, i32 0, metadata !50, null}
