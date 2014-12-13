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
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  %Z = alloca double, align 8
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !96
  tail call void @llvm.dbg.declare(metadata !{double* %Z}, metadata !34), !dbg !97
  tail call void @llvm.dbg.value(metadata !98, i64 0, metadata !38), !dbg !99
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !43), !dbg !101
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !36), !dbg !103
  %1 = icmp sgt i32 %argc, 1, !dbg !104
  br i1 %1, label %.lr.ph61, label %.preheader, !dbg !104

.preheader:                                       ; preds = %32, %0
  %continuous.0.lcssa = phi i32 [ 0, %0 ], [ %continuous.1, %32 ]
  %loopstart.0.lcssa = phi i64 [ 100000, %0 ], [ %loopstart.1, %32 ]
  %2 = mul nsw i64 %loopstart.0.lcssa, 12, !dbg !105
  %3 = mul nsw i64 %loopstart.0.lcssa, 14, !dbg !106
  %4 = mul nsw i64 %loopstart.0.lcssa, 345, !dbg !107
  %5 = mul nsw i64 %loopstart.0.lcssa, 210, !dbg !108
  %6 = shl nsw i64 %loopstart.0.lcssa, 5, !dbg !109
  %7 = mul nsw i64 %loopstart.0.lcssa, 899, !dbg !110
  %8 = mul nsw i64 %loopstart.0.lcssa, 616, !dbg !111
  %9 = mul nsw i64 %loopstart.0.lcssa, 93, !dbg !112
  %10 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !113
  %11 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !115
  %12 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !117
  %13 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !119
  %14 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !121
  %15 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !123
  %16 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !125
  %17 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !127
  %18 = icmp eq i32 %continuous.0.lcssa, 0, !dbg !129
  br label %35, !dbg !131

.lr.ph61:                                         ; preds = %0, %32
  %indvars.iv = phi i64 [ %indvars.iv.next, %32 ], [ 1, %0 ]
  %continuous.059 = phi i32 [ %continuous.1, %32 ], [ 0, %0 ]
  %loopstart.058 = phi i64 [ %loopstart.1, %32 ], [ 100000, %0 ]
  %19 = getelementptr inbounds i8** %argv, i64 %indvars.iv, !dbg !132
  %20 = load i8** %19, align 8, !dbg !132, !tbaa !135
  %21 = tail call i32 @strncmp(i8* %20, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i64 2) #6, !dbg !132
  %22 = icmp eq i32 %21, 0, !dbg !132
  br i1 %22, label %32, label %23, !dbg !132

; <label>:23                                      ; preds = %.lr.ph61
  %24 = load i8* %20, align 1, !dbg !132, !tbaa !139
  %25 = icmp eq i8 %24, 99, !dbg !132
  br i1 %25, label %32, label %26, !dbg !132

; <label>:26                                      ; preds = %23
  %27 = tail call i64 @atol(i8* %20) #6, !dbg !140
  %28 = icmp sgt i64 %27, 0, !dbg !140
  br i1 %28, label %32, label %29, !dbg !140

; <label>:29                                      ; preds = %26
  %30 = load %struct._IO_FILE** @stderr, align 8, !dbg !142, !tbaa !135
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %30) #7, !dbg !142
  br label %.loopexit, !dbg !144

; <label>:32                                      ; preds = %26, %.lr.ph61, %23
  %loopstart.1 = phi i64 [ %loopstart.058, %23 ], [ %loopstart.058, %.lr.ph61 ], [ %27, %26 ]
  %continuous.1 = phi i32 [ 1, %23 ], [ 1, %.lr.ph61 ], [ %continuous.059, %26 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !104
  %33 = trunc i64 %indvars.iv.next to i32, !dbg !104
  %34 = icmp slt i32 %33, %argc, !dbg !104
  br i1 %34, label %.lr.ph61, label %.preheader, !dbg !104

; <label>:35                                      ; preds = %.preheader, %._crit_edge55
  %36 = tail call i64 @time(i64* null) #5, !dbg !131
  tail call void @llvm.dbg.value(metadata !{i64 %36}, i64 0, metadata !39), !dbg !131
  store double 4.999750e-01, double* @T, align 8, !dbg !145, !tbaa !146
  store double 5.002500e-01, double* @T1, align 8, !dbg !148, !tbaa !146
  store double 2.000000e+00, double* @T2, align 8, !dbg !149, !tbaa !146
  tail call void @llvm.dbg.value(metadata !{i64 %loopstart.0.lcssa}, i64 0, metadata !35), !dbg !150
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !36), !dbg !151
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !37), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !17), !dbg !154
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !18), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !19), !dbg !106
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !20), !dbg !107
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !21), !dbg !108
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !22), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !23), !dbg !110
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !24), !dbg !111
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !25), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i64 %9}, i64 0, metadata !26), !dbg !112
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !27), !dbg !157
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !29), !dbg !159
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !30), !dbg !160
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !31), !dbg !161
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !163
  tail call void @POUT(i64 0, i64 0, i64 0, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00), !dbg !165
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !167, !tbaa !146
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !168, !tbaa !146
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !169, !tbaa !146
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !170, !tbaa !146
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !113
  %37 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !171, !tbaa !146
  %38 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !171, !tbaa !146
  br i1 %10, label %64, label %.lr.ph, !dbg !113

.lr.ph:                                           ; preds = %35
  %39 = load double* @T, align 8, !dbg !173, !tbaa !146
  %.promoted = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !175, !tbaa !146
  %.promoted12 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !176, !tbaa !146
  %.promoted16 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !176, !tbaa !146
  br label %40, !dbg !113

; <label>:40                                      ; preds = %40, %.lr.ph
  %41 = phi double [ %.promoted16, %.lr.ph ], [ %53, %40 ], !dbg !173
  %42 = phi double [ %.promoted12, %.lr.ph ], [ %61, %40 ], !dbg !173
  %43 = phi double [ %.promoted, %.lr.ph ], [ %57, %40 ], !dbg !173
  %44 = phi double [ %38, %.lr.ph ], [ %53, %40 ]
  %45 = phi double [ %37, %.lr.ph ], [ %49, %40 ]
  %I.19 = phi i64 [ 1, %.lr.ph ], [ %62, %40 ]
  %46 = fadd double %45, %44, !dbg !173
  %47 = fadd double %46, %43, !dbg !173
  %48 = fsub double %47, %42, !dbg !173
  %49 = fmul double %48, %39, !dbg !173
  %50 = fadd double %49, %41, !dbg !177
  %51 = fsub double %50, %43, !dbg !177
  %52 = fadd double %51, %42, !dbg !177
  %53 = fmul double %52, %39, !dbg !177
  %54 = fsub double %49, %53, !dbg !175
  %55 = fadd double %54, %43, !dbg !175
  %56 = fadd double %55, %42, !dbg !175
  %57 = fmul double %56, %39, !dbg !175
  %58 = fsub double %53, %49, !dbg !176
  %59 = fadd double %57, %58, !dbg !176
  %60 = fadd double %42, %59, !dbg !176
  %61 = fmul double %39, %60, !dbg !176
  %62 = add nsw i64 %I.19, 1, !dbg !113
  tail call void @llvm.dbg.value(metadata !{i64 %62}, i64 0, metadata !15), !dbg !113
  %63 = icmp slt i64 %I.19, %2, !dbg !113
  br i1 %63, label %40, label %._crit_edge, !dbg !113

._crit_edge:                                      ; preds = %40
  store double %57, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !175, !tbaa !146
  store double %61, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !176, !tbaa !146
  store double %49, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !176, !tbaa !146
  store double %53, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !176, !tbaa !146
  br label %64, !dbg !113

; <label>:64                                      ; preds = %._crit_edge, %35
  %.lcssa4 = phi double [ %53, %._crit_edge ], [ %38, %35 ]
  %.lcssa = phi double [ %49, %._crit_edge ], [ %37, %35 ]
  %65 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !171, !tbaa !146
  %66 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !171, !tbaa !146
  tail call void @POUT(i64 %2, i64 %3, i64 %2, double %.lcssa, double %.lcssa4, double %65, double %66), !dbg !171
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !115
  br i1 %11, label %._crit_edge21, label %.lr.ph20, !dbg !115

.lr.ph20:                                         ; preds = %64, %.lr.ph20
  %I.218 = phi i64 [ %67, %.lr.ph20 ], [ 1, %64 ]
  tail call void @PA(double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 0)), !dbg !178
  %67 = add nsw i64 %I.218, 1, !dbg !115
  tail call void @llvm.dbg.value(metadata !{i64 %67}, i64 0, metadata !15), !dbg !115
  %68 = icmp slt i64 %I.218, %3, !dbg !115
  br i1 %68, label %.lr.ph20, label %._crit_edge21, !dbg !115

._crit_edge21:                                    ; preds = %.lr.ph20, %64
  %69 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !179, !tbaa !146
  %70 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !179, !tbaa !146
  %71 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !179, !tbaa !146
  %72 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !179, !tbaa !146
  tail call void @POUT(i64 %3, i64 %2, i64 %2, double %69, double %70, double %71, double %72), !dbg !179
  store i32 1, i32* @J, align 4, !dbg !181, !tbaa !182
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !117
  br i1 %12, label %77, label %.lr.ph24, !dbg !117

.lr.ph24:                                         ; preds = %._crit_edge21, %.lr.ph24
  %73 = phi i32 [ %74, %.lr.ph24 ], [ 1, %._crit_edge21 ]
  %I.322 = phi i64 [ %75, %.lr.ph24 ], [ 1, %._crit_edge21 ]
  %74 = xor i32 %73, 1
  %75 = add nsw i64 %I.322, 1, !dbg !117
  tail call void @llvm.dbg.value(metadata !{i64 %75}, i64 0, metadata !15), !dbg !117
  %76 = icmp slt i64 %I.322, %4, !dbg !117
  br i1 %76, label %.lr.ph24, label %._crit_edge25, !dbg !117

._crit_edge25:                                    ; preds = %.lr.ph24
  store i32 %74, i32* @J, align 4, !dbg !184, !tbaa !182
  %phitmp = sext i32 %74 to i64, !dbg !117
  br label %77, !dbg !117

; <label>:77                                      ; preds = %._crit_edge25, %._crit_edge21
  %.lcssa5 = phi i64 [ %phitmp, %._crit_edge25 ], [ 1, %._crit_edge21 ]
  tail call void @POUT(i64 %4, i64 %.lcssa5, i64 %.lcssa5, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00), !dbg !187
  store i32 1, i32* @J, align 4, !dbg !189, !tbaa !182
  store i32 2, i32* @K, align 4, !dbg !190, !tbaa !182
  store i32 3, i32* @L, align 4, !dbg !191, !tbaa !182
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !119
  br i1 %13, label %104, label %.lr.ph29, !dbg !119

.lr.ph29:                                         ; preds = %77
  %K.promoted = load i32* @K, align 4, !dbg !192, !tbaa !182
  %L.promoted = load i32* @L, align 4, !dbg !192, !tbaa !182
  br label %78, !dbg !119

; <label>:78                                      ; preds = %78, %.lr.ph29
  %79 = phi i32 [ %L.promoted, %.lr.ph29 ], [ %89, %78 ], !dbg !194
  %80 = phi i32 [ %K.promoted, %.lr.ph29 ], [ %86, %78 ], !dbg !194
  %81 = phi i32 [ 1, %.lr.ph29 ], [ %85, %78 ]
  %I.427 = phi i64 [ 1, %.lr.ph29 ], [ %102, %78 ]
  %82 = sub nsw i32 %80, %81, !dbg !194
  %83 = mul nsw i32 %82, %81, !dbg !194
  %84 = sub nsw i32 %79, %80, !dbg !194
  %85 = mul nsw i32 %83, %84, !dbg !194
  %86 = mul i32 %85, %80, !dbg !195
  %87 = sub nsw i32 %79, %86, !dbg !196
  %88 = add nsw i32 %86, %85, !dbg !196
  %89 = mul nsw i32 %87, %88, !dbg !196
  %90 = add nsw i32 %86, %85, !dbg !197
  %91 = add nsw i32 %90, %89, !dbg !197
  %92 = sitofp i32 %91 to double, !dbg !197
  %93 = add nsw i32 %89, -1, !dbg !197
  %94 = sext i32 %93 to i64, !dbg !197
  %95 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %94, !dbg !197
  store double %92, double* %95, align 8, !dbg !197, !tbaa !146
  %96 = mul nsw i32 %86, %85, !dbg !192
  %97 = mul nsw i32 %96, %89, !dbg !192
  %98 = sitofp i32 %97 to double, !dbg !192
  %99 = add nsw i32 %86, -1, !dbg !192
  %100 = sext i32 %99 to i64, !dbg !192
  %101 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %100, !dbg !192
  store double %98, double* %101, align 8, !dbg !192, !tbaa !146
  %102 = add nsw i64 %I.427, 1, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i64 %102}, i64 0, metadata !15), !dbg !119
  %103 = icmp slt i64 %I.427, %5, !dbg !119
  br i1 %103, label %78, label %._crit_edge30, !dbg !119

._crit_edge30:                                    ; preds = %78
  store i32 %86, i32* @K, align 4, !dbg !192, !tbaa !182
  store i32 %89, i32* @L, align 4, !dbg !192, !tbaa !182
  store i32 %85, i32* @J, align 4, !dbg !198, !tbaa !182
  %phitmp64 = sext i32 %85 to i64, !dbg !119
  br label %104, !dbg !119

; <label>:104                                     ; preds = %._crit_edge30, %77
  %.lcssa6 = phi i64 [ %phitmp64, %._crit_edge30 ], [ 1, %77 ]
  %105 = load i32* @K, align 4, !dbg !198, !tbaa !182
  %106 = sext i32 %105 to i64, !dbg !198
  %107 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !198, !tbaa !146
  %108 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !198, !tbaa !146
  %109 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !198, !tbaa !146
  %110 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !198, !tbaa !146
  tail call void @POUT(i64 %5, i64 %.lcssa6, i64 %106, double %107, double %108, double %109, double %110), !dbg !198
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !32), !dbg !201
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !33), !dbg !202
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !121
  br i1 %14, label %._crit_edge40, label %.lr.ph39, !dbg !121

.lr.ph39:                                         ; preds = %104, %.lr.ph39
  %I.537 = phi i64 [ %141, %.lr.ph39 ], [ 1, %104 ]
  %Y.036 = phi double [ %140, %.lr.ph39 ], [ 5.000000e-01, %104 ]
  %X.035 = phi double [ %125, %.lr.ph39 ], [ 5.000000e-01, %104 ]
  %111 = load double* @T, align 8, !dbg !203, !tbaa !146
  %112 = load double* @T2, align 8, !dbg !203, !tbaa !146
  %113 = tail call double @sin(double %X.035) #5, !dbg !203
  %114 = fmul double %112, %113, !dbg !203
  %115 = tail call double @cos(double %X.035) #5, !dbg !203
  %116 = fmul double %114, %115, !dbg !203
  %117 = fadd double %X.035, %Y.036, !dbg !203
  %118 = tail call double @cos(double %117) #5, !dbg !203
  %119 = fsub double %X.035, %Y.036, !dbg !203
  %120 = tail call double @cos(double %119) #5, !dbg !203
  %121 = fadd double %118, %120, !dbg !203
  %122 = fadd double %121, -1.000000e+00, !dbg !203
  %123 = fdiv double %116, %122, !dbg !203
  %124 = tail call double @atan(double %123) #5, !dbg !203
  %125 = fmul double %111, %124, !dbg !203
  tail call void @llvm.dbg.value(metadata !{double %125}, i64 0, metadata !32), !dbg !203
  %126 = load double* @T, align 8, !dbg !205, !tbaa !146
  %127 = load double* @T2, align 8, !dbg !205, !tbaa !146
  %128 = tail call double @sin(double %Y.036) #5, !dbg !205
  %129 = fmul double %127, %128, !dbg !205
  %130 = tail call double @cos(double %Y.036) #5, !dbg !205
  %131 = fmul double %129, %130, !dbg !205
  %132 = fadd double %Y.036, %125, !dbg !205
  %133 = tail call double @cos(double %132) #5, !dbg !205
  %134 = fsub double %125, %Y.036, !dbg !205
  %135 = tail call double @cos(double %134) #5, !dbg !205
  %136 = fadd double %133, %135, !dbg !205
  %137 = fadd double %136, -1.000000e+00, !dbg !205
  %138 = fdiv double %131, %137, !dbg !205
  %139 = tail call double @atan(double %138) #5, !dbg !205
  %140 = fmul double %126, %139, !dbg !205
  tail call void @llvm.dbg.value(metadata !{double %140}, i64 0, metadata !33), !dbg !205
  %141 = add nsw i64 %I.537, 1, !dbg !121
  tail call void @llvm.dbg.value(metadata !{i64 %141}, i64 0, metadata !15), !dbg !121
  %142 = icmp slt i64 %I.537, %6, !dbg !121
  br i1 %142, label %.lr.ph39, label %._crit_edge40, !dbg !121

._crit_edge40:                                    ; preds = %.lr.ph39, %104
  %Y.0.lcssa = phi double [ 5.000000e-01, %104 ], [ %140, %.lr.ph39 ]
  %X.0.lcssa = phi double [ 5.000000e-01, %104 ], [ %125, %.lr.ph39 ]
  %143 = load i32* @J, align 4, !dbg !206, !tbaa !182
  %144 = sext i32 %143 to i64, !dbg !206
  %145 = load i32* @K, align 4, !dbg !206, !tbaa !182
  %146 = sext i32 %145 to i64, !dbg !206
  tail call void @POUT(i64 %6, i64 %144, i64 %146, double %X.0.lcssa, double %X.0.lcssa, double %Y.0.lcssa, double %Y.0.lcssa), !dbg !206
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !32), !dbg !208
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !33), !dbg !209
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !210
  store double 1.000000e+00, double* %Z, align 8, !dbg !210, !tbaa !146
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !123
  br i1 %15, label %._crit_edge46, label %.lr.ph45, !dbg !123

.lr.ph45:                                         ; preds = %._crit_edge40, %.lr.ph45
  %I.643 = phi i64 [ %147, %.lr.ph45 ], [ 1, %._crit_edge40 ]
  call void @P3(double 1.000000e+00, double 1.000000e+00, double* %Z), !dbg !211
  %147 = add nsw i64 %I.643, 1, !dbg !123
  tail call void @llvm.dbg.value(metadata !{i64 %147}, i64 0, metadata !15), !dbg !123
  %148 = icmp slt i64 %I.643, %7, !dbg !123
  br i1 %148, label %.lr.ph45, label %._crit_edge46, !dbg !123

._crit_edge46:                                    ; preds = %.lr.ph45, %._crit_edge40
  %149 = load i32* @J, align 4, !dbg !212, !tbaa !182
  %150 = sext i32 %149 to i64, !dbg !212
  %151 = load i32* @K, align 4, !dbg !212, !tbaa !182
  %152 = sext i32 %151 to i64, !dbg !212
  tail call void @llvm.dbg.value(metadata !{double* %Z}, i64 0, metadata !34), !dbg !212
  %153 = load double* %Z, align 8, !dbg !212, !tbaa !146
  tail call void @POUT(i64 %7, i64 %150, i64 %152, double 1.000000e+00, double 1.000000e+00, double %153, double %153), !dbg !212
  store i32 1, i32* @J, align 4, !dbg !214, !tbaa !182
  store i32 2, i32* @K, align 4, !dbg !215, !tbaa !182
  store i32 3, i32* @L, align 4, !dbg !216, !tbaa !182
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !217, !tbaa !146
  store double 2.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !218, !tbaa !146
  store double 3.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !219, !tbaa !146
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !125
  br i1 %16, label %._crit_edge50, label %.lr.ph49, !dbg !125

.lr.ph49:                                         ; preds = %._crit_edge46, %.lr.ph49
  %I.747 = phi i64 [ %154, %.lr.ph49 ], [ 1, %._crit_edge46 ]
  tail call void @P0(), !dbg !220
  %154 = add nsw i64 %I.747, 1, !dbg !125
  tail call void @llvm.dbg.value(metadata !{i64 %154}, i64 0, metadata !15), !dbg !125
  %155 = icmp slt i64 %I.747, %8, !dbg !125
  br i1 %155, label %.lr.ph49, label %._crit_edge50, !dbg !125

._crit_edge50:                                    ; preds = %.lr.ph49, %._crit_edge46
  %156 = load i32* @J, align 4, !dbg !221, !tbaa !182
  %157 = sext i32 %156 to i64, !dbg !221
  %158 = load i32* @K, align 4, !dbg !221, !tbaa !182
  %159 = sext i32 %158 to i64, !dbg !221
  %160 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !221, !tbaa !146
  %161 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !221, !tbaa !146
  %162 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !221, !tbaa !146
  %163 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !221, !tbaa !146
  tail call void @POUT(i64 %8, i64 %157, i64 %159, double %160, double %161, double %162, double %163), !dbg !221
  store i32 2, i32* @J, align 4, !dbg !223, !tbaa !182
  store i32 3, i32* @K, align 4, !dbg !224, !tbaa !182
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !225
  tail call void @POUT(i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00), !dbg !227
  tail call void @llvm.dbg.value(metadata !229, i64 0, metadata !32), !dbg !230
  tail call void @llvm.dbg.value(metadata !162, i64 0, metadata !15), !dbg !127
  br i1 %17, label %._crit_edge55, label %.lr.ph54, !dbg !127

.lr.ph54:                                         ; preds = %._crit_edge50, %.lr.ph54
  %I.952 = phi i64 [ %169, %.lr.ph54 ], [ 1, %._crit_edge50 ]
  %X.151 = phi double [ %168, %.lr.ph54 ], [ 7.500000e-01, %._crit_edge50 ]
  %164 = tail call double @log(double %X.151) #5, !dbg !231
  %165 = load double* @T1, align 8, !dbg !231, !tbaa !146
  %166 = fdiv double %164, %165, !dbg !231
  %167 = tail call double @exp(double %166) #5, !dbg !231
  %168 = tail call double @sqrt(double %167) #5, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !32), !dbg !231
  %169 = add nsw i64 %I.952, 1, !dbg !127
  tail call void @llvm.dbg.value(metadata !{i64 %169}, i64 0, metadata !15), !dbg !127
  %170 = icmp slt i64 %I.952, %9, !dbg !127
  br i1 %170, label %.lr.ph54, label %._crit_edge55, !dbg !127

._crit_edge55:                                    ; preds = %.lr.ph54, %._crit_edge50
  %X.1.lcssa = phi double [ 7.500000e-01, %._crit_edge50 ], [ %168, %.lr.ph54 ]
  %171 = load i32* @J, align 4, !dbg !232, !tbaa !182
  %172 = sext i32 %171 to i64, !dbg !232
  %173 = load i32* @K, align 4, !dbg !232, !tbaa !182
  %174 = sext i32 %173 to i64, !dbg !232
  tail call void @POUT(i64 %9, i64 %172, i64 %174, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa), !dbg !232
  tail call void @llvm.dbg.value(metadata !234, i64 0, metadata !37), !dbg !235
  %175 = tail call i64 @time(i64* null) #5, !dbg !237
  tail call void @llvm.dbg.value(metadata !{i64 %175}, i64 0, metadata !40), !dbg !237
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !238
  br i1 %18, label %.loopexit, label %35, !dbg !129

.loopexit:                                        ; preds = %._crit_edge55, %29
  %.0 = phi i32 [ 1, %29 ], [ 0, %._crit_edge55 ]
  ret i32 %.0, !dbg !239
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i64 @atol(i8* nocapture readonly %__nptr) #3 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !81), !dbg !240
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !241
  ret i64 %1, !dbg !241
}

; Function Attrs: nounwind
declare i64 @time(i64*) #4

; Function Attrs: nounwind uwtable
define void @POUT(i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %N}, i64 0, metadata !66), !dbg !243
  tail call void @llvm.dbg.value(metadata !{i64 %J}, i64 0, metadata !67), !dbg !243
  tail call void @llvm.dbg.value(metadata !{i64 %K}, i64 0, metadata !68), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double %X1}, i64 0, metadata !69), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double %X2}, i64 0, metadata !70), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double %X3}, i64 0, metadata !71), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double %X4}, i64 0, metadata !72), !dbg !243
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #5, !dbg !244
  ret void, !dbg !245
}

; Function Attrs: nounwind uwtable
define void @PA(double* nocapture %E) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %E}, i64 0, metadata !49), !dbg !246
  store i32 0, i32* @J, align 4, !dbg !247, !tbaa !182
  %1 = getelementptr inbounds double* %E, i64 1, !dbg !248
  %2 = getelementptr inbounds double* %E, i64 2, !dbg !248
  %3 = getelementptr inbounds double* %E, i64 3, !dbg !248
  %4 = getelementptr inbounds double* %E, i64 4, !dbg !248
  br label %5, !dbg !247

; <label>:5                                       ; preds = %5, %0
  %6 = phi i32 [ %40, %5 ], [ 0, %0 ], !dbg !248
  %7 = load double* %1, align 8, !dbg !248, !tbaa !146
  %8 = load double* %2, align 8, !dbg !248, !tbaa !146
  %9 = fadd double %7, %8, !dbg !248
  %10 = load double* %3, align 8, !dbg !248, !tbaa !146
  %11 = fadd double %9, %10, !dbg !248
  %12 = load double* %4, align 8, !dbg !248, !tbaa !146
  %13 = fsub double %11, %12, !dbg !248
  %14 = load double* @T, align 8, !dbg !248, !tbaa !146
  %15 = fmul double %13, %14, !dbg !248
  store double %15, double* %1, align 8, !dbg !248, !tbaa !146
  %16 = load double* %2, align 8, !dbg !249, !tbaa !146
  %17 = fadd double %15, %16, !dbg !249
  %18 = load double* %3, align 8, !dbg !249, !tbaa !146
  %19 = fsub double %17, %18, !dbg !249
  %20 = load double* %4, align 8, !dbg !249, !tbaa !146
  %21 = fadd double %19, %20, !dbg !249
  %22 = load double* @T, align 8, !dbg !249, !tbaa !146
  %23 = fmul double %21, %22, !dbg !249
  store double %23, double* %2, align 8, !dbg !249, !tbaa !146
  %24 = load double* %1, align 8, !dbg !250, !tbaa !146
  %25 = fsub double %24, %23, !dbg !250
  %26 = load double* %3, align 8, !dbg !250, !tbaa !146
  %27 = fadd double %25, %26, !dbg !250
  %28 = load double* %4, align 8, !dbg !250, !tbaa !146
  %29 = fadd double %27, %28, !dbg !250
  %30 = load double* @T, align 8, !dbg !250, !tbaa !146
  %31 = fmul double %29, %30, !dbg !250
  store double %31, double* %3, align 8, !dbg !250, !tbaa !146
  %32 = load double* %1, align 8, !dbg !251, !tbaa !146
  %33 = load double* %2, align 8, !dbg !251, !tbaa !146
  %34 = fsub double %33, %32, !dbg !251
  %35 = fadd double %31, %34, !dbg !251
  %36 = load double* %4, align 8, !dbg !251, !tbaa !146
  %37 = fadd double %36, %35, !dbg !251
  %38 = load double* @T2, align 8, !dbg !251, !tbaa !146
  %39 = fdiv double %37, %38, !dbg !251
  store double %39, double* %4, align 8, !dbg !251, !tbaa !146
  %40 = add nsw i32 %6, 1, !dbg !252
  %exitcond = icmp eq i32 %40, 6, !dbg !253
  br i1 %exitcond, label %41, label %5, !dbg !253

; <label>:41                                      ; preds = %5
  store i32 6, i32* @J, align 4, !dbg !252, !tbaa !182
  ret void, !dbg !255
}

; Function Attrs: nounwind
declare double @atan(double) #4

; Function Attrs: nounwind
declare double @sin(double) #4

; Function Attrs: nounwind
declare double @cos(double) #4

; Function Attrs: nounwind uwtable
define void @P3(double %X, double %Y, double* nocapture %Z) #0 {
  tail call void @llvm.dbg.value(metadata !{double %X}, i64 0, metadata !57), !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %Y}, i64 0, metadata !58), !dbg !256
  tail call void @llvm.dbg.value(metadata !{double* %Z}, i64 0, metadata !59), !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %X}, i64 0, metadata !60), !dbg !257
  tail call void @llvm.dbg.value(metadata !{double %Y}, i64 0, metadata !61), !dbg !258
  %1 = load double* @T, align 8, !dbg !259, !tbaa !146
  %2 = fadd double %X, %Y, !dbg !259
  %3 = fmul double %2, %1, !dbg !259
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !60), !dbg !259
  %4 = fadd double %3, %Y, !dbg !260
  %5 = fmul double %1, %4, !dbg !260
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !61), !dbg !260
  %6 = fadd double %3, %5, !dbg !261
  %7 = load double* @T2, align 8, !dbg !261, !tbaa !146
  %8 = fdiv double %6, %7, !dbg !261
  store double %8, double* %Z, align 8, !dbg !261, !tbaa !146
  ret void, !dbg !262
}

; Function Attrs: nounwind uwtable
define void @P0() #0 {
  %1 = load i32* @K, align 4, !dbg !263, !tbaa !182
  %2 = sext i32 %1 to i64, !dbg !263
  %3 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %2, !dbg !263
  %4 = load double* %3, align 8, !dbg !263, !tbaa !146
  %5 = load i32* @J, align 4, !dbg !263, !tbaa !182
  %6 = sext i32 %5 to i64, !dbg !263
  %7 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %6, !dbg !263
  store double %4, double* %7, align 8, !dbg !263, !tbaa !146
  %8 = load i32* @L, align 4, !dbg !264, !tbaa !182
  %9 = sext i32 %8 to i64, !dbg !264
  %10 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %9, !dbg !264
  %11 = load double* %10, align 8, !dbg !264, !tbaa !146
  %12 = load i32* @K, align 4, !dbg !264, !tbaa !182
  %13 = sext i32 %12 to i64, !dbg !264
  %14 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %13, !dbg !264
  store double %11, double* %14, align 8, !dbg !264, !tbaa !146
  %15 = load i32* @J, align 4, !dbg !265, !tbaa !182
  %16 = sext i32 %15 to i64, !dbg !265
  %17 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %16, !dbg !265
  %18 = load double* %17, align 8, !dbg !265, !tbaa !146
  %19 = load i32* @L, align 4, !dbg !265, !tbaa !182
  %20 = sext i32 %19 to i64, !dbg !265
  %21 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %20, !dbg !265
  store double %18, double* %21, align 8, !dbg !265, !tbaa !146
  ret void, !dbg !266
}

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare double @exp(double) #4

; Function Attrs: nounwind
declare double @log(double) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!93, !94}
!llvm.ident = !{!95}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !82, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c] [DW_LANG_C99]
!1 = metadata !{metadata !"whetstone.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !44, metadata !50, metadata !53, metadata !62, metadata !73}
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
!73 = metadata !{i32 786478, metadata !74, metadata !75, metadata !"atol", metadata !"atol", metadata !"", i32 283, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*)* @atol, null, null, metadata !80, i32 284} ; [ DW_TAG_subprogram ] [line 283] [def] [scope 284] [atol]
!74 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!75 = metadata !{i32 786473, metadata !74}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!76 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = metadata !{metadata !16, metadata !78}
!78 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!79 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!80 = metadata !{metadata !81}
!81 = metadata !{i32 786689, metadata !73, metadata !"__nptr", metadata !75, i32 16777499, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 283]
!82 = metadata !{metadata !83, metadata !84, metadata !85, metadata !86, metadata !90, metadata !91, metadata !92}
!83 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 83, metadata !28, i32 0, i32 1, double* @T, null} ; [ DW_TAG_variable ] [T] [line 83] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"T1", metadata !"T1", metadata !"", metadata !5, i32 83, metadata !28, i32 0, i32 1, double* @T1, null} ; [ DW_TAG_variable ] [T1] [line 83] [def]
!85 = metadata !{i32 786484, i32 0, null, metadata !"T2", metadata !"T2", metadata !"", metadata !5, i32 83, metadata !28, i32 0, i32 1, double* @T2, null} ; [ DW_TAG_variable ] [T2] [line 83] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"E1", metadata !"E1", metadata !"", metadata !5, i32 83, metadata !87, i32 0, i32 1, [5 x double]* @E1, null} ; [ DW_TAG_variable ] [E1] [line 83] [def]
!87 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 64, i32 0, i32 0, metadata !28, metadata !88, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 64, offset 0] [from double]
!88 = metadata !{metadata !89}
!89 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!90 = metadata !{i32 786484, i32 0, null, metadata !"J", metadata !"J", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @J, null} ; [ DW_TAG_variable ] [J] [line 84] [def]
!91 = metadata !{i32 786484, i32 0, null, metadata !"K", metadata !"K", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @K, null} ; [ DW_TAG_variable ] [K] [line 84] [def]
!92 = metadata !{i32 786484, i32 0, null, metadata !"L", metadata !"L", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @L, null} ; [ DW_TAG_variable ] [L] [line 84] [def]
!93 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!94 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!95 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!96 = metadata !{i32 87, i32 0, metadata !4, null}
!97 = metadata !{i32 92, i32 0, metadata !4, null}
!98 = metadata !{i64 100000}
!99 = metadata !{i32 105, i32 0, metadata !4, null}
!100 = metadata !{i32 0}
!101 = metadata !{i32 107, i32 0, metadata !4, null}
!102 = metadata !{i32 1}
!103 = metadata !{i32 109, i32 0, metadata !4, null}
!104 = metadata !{i32 110, i32 0, metadata !4, null}
!105 = metadata !{i32 153, i32 0, metadata !4, null}
!106 = metadata !{i32 154, i32 0, metadata !4, null}
!107 = metadata !{i32 155, i32 0, metadata !4, null}
!108 = metadata !{i32 156, i32 0, metadata !4, null}
!109 = metadata !{i32 157, i32 0, metadata !4, null}
!110 = metadata !{i32 158, i32 0, metadata !4, null}
!111 = metadata !{i32 159, i32 0, metadata !4, null}
!112 = metadata !{i32 161, i32 0, metadata !4, null}
!113 = metadata !{i32 192, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !4, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!115 = metadata !{i32 208, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !4, i32 208, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!117 = metadata !{i32 221, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !4, i32 221, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!119 = metadata !{i32 253, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !4, i32 253, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!121 = metadata !{i32 273, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !4, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!123 = metadata !{i32 291, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !4, i32 291, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!125 = metadata !{i32 310, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !4, i32 310, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!127 = metadata !{i32 343, i32 0, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !4, i32 343, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!129 = metadata !{i32 390, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !4, i32 390, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!131 = metadata !{i32 128, i32 0, metadata !4, null}
!132 = metadata !{i32 111, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !134, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!134 = metadata !{i32 786443, metadata !1, metadata !4, i32 110, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!135 = metadata !{metadata !136, metadata !136, i64 0}
!136 = metadata !{metadata !"any pointer", metadata !137, i64 0}
!137 = metadata !{metadata !"omnipotent char", metadata !138, i64 0}
!138 = metadata !{metadata !"Simple C/C++ TBAA"}
!139 = metadata !{metadata !137, metadata !137, i64 0}
!140 = metadata !{i32 113, i32 14, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !133, i32 113, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!142 = metadata !{i32 116, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !141, i32 115, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!144 = metadata !{i32 117, i32 0, metadata !143, null}
!145 = metadata !{i32 135, i32 0, metadata !4, null}
!146 = metadata !{metadata !147, metadata !147, i64 0}
!147 = metadata !{metadata !"double", metadata !137, i64 0}
!148 = metadata !{i32 136, i32 0, metadata !4, null}
!149 = metadata !{i32 137, i32 0, metadata !4, null}
!150 = metadata !{i32 146, i32 0, metadata !4, null}
!151 = metadata !{i32 147, i32 0, metadata !4, null}
!152 = metadata !{i32 149, i32 0, metadata !4, null}
!153 = metadata !{i64 0}
!154 = metadata !{i32 152, i32 0, metadata !4, null}
!155 = metadata !{i32 160, i32 0, metadata !4, null}
!156 = metadata !{double 1.000000e+00}
!157 = metadata !{i32 167, i32 0, metadata !4, null}
!158 = metadata !{double -1.000000e+00}
!159 = metadata !{i32 168, i32 0, metadata !4, null}
!160 = metadata !{i32 169, i32 0, metadata !4, null}
!161 = metadata !{i32 170, i32 0, metadata !4, null}
!162 = metadata !{i64 1}
!163 = metadata !{i32 172, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !4, i32 172, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!165 = metadata !{i32 179, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !4, i32 179, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!167 = metadata !{i32 187, i32 0, metadata !4, null}
!168 = metadata !{i32 188, i32 0, metadata !4, null}
!169 = metadata !{i32 189, i32 0, metadata !4, null}
!170 = metadata !{i32 190, i32 0, metadata !4, null}
!171 = metadata !{i32 200, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !4, i32 200, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!173 = metadata !{i32 193, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !114, i32 192, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!175 = metadata !{i32 195, i32 0, metadata !174, null}
!176 = metadata !{i32 196, i32 0, metadata !174, null}
!177 = metadata !{i32 194, i32 0, metadata !174, null}
!178 = metadata !{i32 209, i32 0, metadata !116, null}
!179 = metadata !{i32 212, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !4, i32 212, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!181 = metadata !{i32 220, i32 0, metadata !4, null}
!182 = metadata !{metadata !183, metadata !183, i64 0}
!183 = metadata !{metadata !"int", metadata !137, i64 0}
!184 = metadata !{i32 233, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !186, i32 232, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!186 = metadata !{i32 786443, metadata !1, metadata !118, i32 221, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!187 = metadata !{i32 239, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !4, i32 239, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!189 = metadata !{i32 249, i32 0, metadata !4, null}
!190 = metadata !{i32 250, i32 0, metadata !4, null}
!191 = metadata !{i32 251, i32 0, metadata !4, null}
!192 = metadata !{i32 258, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !120, i32 253, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!194 = metadata !{i32 254, i32 0, metadata !193, null}
!195 = metadata !{i32 255, i32 0, metadata !193, null}
!196 = metadata !{i32 256, i32 0, metadata !193, null}
!197 = metadata !{i32 257, i32 0, metadata !193, null}
!198 = metadata !{i32 262, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !4, i32 262, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!200 = metadata !{double 5.000000e-01}
!201 = metadata !{i32 270, i32 0, metadata !4, null}
!202 = metadata !{i32 271, i32 0, metadata !4, null}
!203 = metadata !{i32 274, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !122, i32 273, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!205 = metadata !{i32 275, i32 0, metadata !204, null}
!206 = metadata !{i32 279, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !4, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!208 = metadata !{i32 287, i32 0, metadata !4, null}
!209 = metadata !{i32 288, i32 0, metadata !4, null}
!210 = metadata !{i32 289, i32 0, metadata !4, null}
!211 = metadata !{i32 292, i32 0, metadata !124, null}
!212 = metadata !{i32 295, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !4, i32 295, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!214 = metadata !{i32 303, i32 0, metadata !4, null}
!215 = metadata !{i32 304, i32 0, metadata !4, null}
!216 = metadata !{i32 305, i32 0, metadata !4, null}
!217 = metadata !{i32 306, i32 0, metadata !4, null}
!218 = metadata !{i32 307, i32 0, metadata !4, null}
!219 = metadata !{i32 308, i32 0, metadata !4, null}
!220 = metadata !{i32 311, i32 0, metadata !126, null}
!221 = metadata !{i32 314, i32 0, metadata !222, null}
!222 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!223 = metadata !{i32 322, i32 0, metadata !4, null}
!224 = metadata !{i32 323, i32 0, metadata !4, null}
!225 = metadata !{i32 325, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !4, i32 325, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!227 = metadata !{i32 333, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !4, i32 333, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!229 = metadata !{double 7.500000e-01}
!230 = metadata !{i32 341, i32 0, metadata !4, null}
!231 = metadata !{i32 344, i32 0, metadata !128, null}
!232 = metadata !{i32 347, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !4, i32 347, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!234 = metadata !{i32 2}
!235 = metadata !{i32 355, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !4, i32 355, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!237 = metadata !{i32 363, i32 0, metadata !4, null}
!238 = metadata !{i32 374, i32 0, metadata !4, null}
!239 = metadata !{i32 394, i32 0, metadata !4, null}
!240 = metadata !{i32 283, i32 0, metadata !73, null}
!241 = metadata !{i32 285, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !74, metadata !73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!243 = metadata !{i32 434, i32 0, metadata !62, null}
!244 = metadata !{i32 436, i32 0, metadata !62, null}
!245 = metadata !{i32 438, i32 0, metadata !62, null}
!246 = metadata !{i32 397, i32 0, metadata !44, null}
!247 = metadata !{i32 399, i32 0, metadata !44, null}
!248 = metadata !{i32 402, i32 0, metadata !44, null}
!249 = metadata !{i32 403, i32 0, metadata !44, null}
!250 = metadata !{i32 404, i32 0, metadata !44, null}
!251 = metadata !{i32 405, i32 0, metadata !44, null}
!252 = metadata !{i32 406, i32 0, metadata !44, null}
!253 = metadata !{i32 408, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !1, metadata !44, i32 408, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!255 = metadata !{i32 410, i32 0, metadata !44, null}
!256 = metadata !{i32 421, i32 0, metadata !53, null}
!257 = metadata !{i32 425, i32 0, metadata !53, null}
!258 = metadata !{i32 426, i32 0, metadata !53, null}
!259 = metadata !{i32 427, i32 0, metadata !53, null}
!260 = metadata !{i32 428, i32 0, metadata !53, null}
!261 = metadata !{i32 429, i32 0, metadata !53, null}
!262 = metadata !{i32 430, i32 0, metadata !53, null}
!263 = metadata !{i32 415, i32 0, metadata !50, null}
!264 = metadata !{i32 416, i32 0, metadata !50, null}
!265 = metadata !{i32 417, i32 0, metadata !50, null}
!266 = metadata !{i32 418, i32 0, metadata !50, null}
