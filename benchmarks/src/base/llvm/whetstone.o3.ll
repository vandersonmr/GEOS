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

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !96
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !38), !dbg !98
  tail call void @llvm.dbg.value(metadata !99, i64 0, metadata !43), !dbg !100
  tail call void @llvm.dbg.value(metadata !101, i64 0, metadata !36), !dbg !102
  %1 = icmp sgt i32 %argc, 1, !dbg !103
  br i1 %1, label %.lr.ph88, label %.preheader, !dbg !103

.preheader:                                       ; preds = %27, %0
  %continuous.0.lcssa = phi i32 [ 0, %0 ], [ %continuous.1, %27 ]
  %loopstart.0.lcssa = phi i64 [ 100000, %0 ], [ %loopstart.1, %27 ]
  %2 = mul nsw i64 %loopstart.0.lcssa, 12, !dbg !104
  %3 = mul nsw i64 %loopstart.0.lcssa, 14, !dbg !105
  %4 = mul nsw i64 %loopstart.0.lcssa, 345, !dbg !106
  %5 = mul nsw i64 %loopstart.0.lcssa, 210, !dbg !107
  %6 = shl nsw i64 %loopstart.0.lcssa, 5, !dbg !108
  %7 = mul nsw i64 %loopstart.0.lcssa, 899, !dbg !109
  %8 = mul nsw i64 %loopstart.0.lcssa, 616, !dbg !110
  %9 = mul nsw i64 %loopstart.0.lcssa, 93, !dbg !111
  %10 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !112
  %11 = icmp eq i32 %continuous.0.lcssa, 0, !dbg !114
  %12 = mul i64 %loopstart.0.lcssa, 345, !dbg !116
  %13 = icmp sgt i64 %12, 1
  %smax = select i1 %13, i64 %12, i64 1
  br label %30, !dbg !116

.lr.ph88:                                         ; preds = %0, %27
  %indvars.iv = phi i64 [ %indvars.iv.next, %27 ], [ 1, %0 ]
  %continuous.086 = phi i32 [ %continuous.1, %27 ], [ 0, %0 ]
  %loopstart.085 = phi i64 [ %loopstart.1, %27 ], [ 100000, %0 ]
  %14 = getelementptr inbounds i8** %argv, i64 %indvars.iv, !dbg !117
  %15 = load i8** %14, align 8, !dbg !117, !tbaa !120
  %16 = tail call i32 @strncmp(i8* %15, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i64 2) #5, !dbg !117
  %17 = icmp eq i32 %16, 0, !dbg !117
  br i1 %17, label %27, label %18, !dbg !117

; <label>:18                                      ; preds = %.lr.ph88
  %19 = load i8* %15, align 1, !dbg !117, !tbaa !124
  %20 = icmp eq i8 %19, 99, !dbg !117
  br i1 %20, label %27, label %21, !dbg !117

; <label>:21                                      ; preds = %18
  tail call void @llvm.dbg.value(metadata !{i8* %15}, i64 0, metadata !125) #4, !dbg !128
  %22 = tail call i64 @strtol(i8* nocapture %15, i8** null, i32 10) #4, !dbg !129
  %23 = icmp sgt i64 %22, 0, !dbg !126
  br i1 %23, label %27, label %24, !dbg !126

; <label>:24                                      ; preds = %21
  %25 = load %struct._IO_FILE** @stderr, align 8, !dbg !131, !tbaa !120
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %25) #6, !dbg !131
  br label %.loopexit, !dbg !133

; <label>:27                                      ; preds = %21, %.lr.ph88, %18
  %loopstart.1 = phi i64 [ %loopstart.085, %18 ], [ %loopstart.085, %.lr.ph88 ], [ %22, %21 ]
  %continuous.1 = phi i32 [ 1, %18 ], [ 1, %.lr.ph88 ], [ %continuous.086, %21 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !103
  %28 = trunc i64 %indvars.iv.next to i32, !dbg !103
  %29 = icmp slt i32 %28, %argc, !dbg !103
  br i1 %29, label %.lr.ph88, label %.preheader, !dbg !103

; <label>:30                                      ; preds = %.preheader, %._crit_edge82
  %31 = tail call i64 @time(i64* null) #4, !dbg !116
  tail call void @llvm.dbg.value(metadata !{i64 %31}, i64 0, metadata !39), !dbg !116
  store double 4.999750e-01, double* @T, align 8, !dbg !134, !tbaa !135
  store double 5.002500e-01, double* @T1, align 8, !dbg !137, !tbaa !135
  store double 2.000000e+00, double* @T2, align 8, !dbg !138, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %loopstart.0.lcssa}, i64 0, metadata !35), !dbg !139
  tail call void @llvm.dbg.value(metadata !101, i64 0, metadata !36), !dbg !140
  tail call void @llvm.dbg.value(metadata !101, i64 0, metadata !37), !dbg !141
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !17), !dbg !143
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !18), !dbg !104
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !19), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !20), !dbg !106
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !21), !dbg !107
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !22), !dbg !108
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !23), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !24), !dbg !110
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !25), !dbg !144
  tail call void @llvm.dbg.value(metadata !{i64 %9}, i64 0, metadata !26), !dbg !111
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !27), !dbg !146
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !29), !dbg !148
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !30), !dbg !149
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !31), !dbg !150
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !152
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !154) #4, !dbg !157
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !158) #4, !dbg !157
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !159) #4, !dbg !157
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !160) #4, !dbg !157
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !161) #4, !dbg !157
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !162) #4, !dbg !157
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !163) #4, !dbg !157
  %32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 0, i64 0, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !164
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !165, !tbaa !135
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !166, !tbaa !135
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !167, !tbaa !135
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !168, !tbaa !135
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !112
  br i1 %10, label %.thread, label %.lr.ph, !dbg !112

.thread:                                          ; preds = %30
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !169) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !173) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !174) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %43}, i64 0, metadata !175) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !176) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %51}, i64 0, metadata !177) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !178) #4, !dbg !172
  %33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %2, i64 %3, i64 %2, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !179
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !180
  br label %._crit_edge108, !dbg !180

.lr.ph:                                           ; preds = %30
  %34 = load double* @T, align 8, !dbg !182, !tbaa !135
  br label %35, !dbg !112

; <label>:35                                      ; preds = %35, %.lr.ph
  %36 = phi double [ -1.000000e+00, %.lr.ph ], [ %47, %35 ], !dbg !182
  %37 = phi double [ -1.000000e+00, %.lr.ph ], [ %55, %35 ], !dbg !182
  %38 = phi double [ -1.000000e+00, %.lr.ph ], [ %51, %35 ], !dbg !182
  %39 = phi double [ 1.000000e+00, %.lr.ph ], [ %43, %35 ]
  %I.110 = phi i64 [ 1, %.lr.ph ], [ %56, %35 ]
  %40 = fadd double %39, %36, !dbg !182
  %41 = fadd double %40, %38, !dbg !182
  %42 = fsub double %41, %37, !dbg !182
  %43 = fmul double %42, %34, !dbg !182
  %44 = fadd double %43, %36, !dbg !184
  %45 = fsub double %44, %38, !dbg !184
  %46 = fadd double %45, %37, !dbg !184
  %47 = fmul double %46, %34, !dbg !184
  %48 = fsub double %43, %47, !dbg !185
  %49 = fadd double %48, %38, !dbg !185
  %50 = fadd double %49, %37, !dbg !185
  %51 = fmul double %50, %34, !dbg !185
  %52 = fsub double %47, %43, !dbg !186
  %53 = fadd double %51, %52, !dbg !186
  %54 = fadd double %37, %53, !dbg !186
  %55 = fmul double %34, %54, !dbg !186
  %56 = add nsw i64 %I.110, 1, !dbg !112
  tail call void @llvm.dbg.value(metadata !{i64 %56}, i64 0, metadata !15), !dbg !112
  %57 = icmp slt i64 %I.110, %2, !dbg !112
  br i1 %57, label %35, label %58, !dbg !112

; <label>:58                                      ; preds = %35
  store double %51, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !185, !tbaa !135
  store double %55, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !186, !tbaa !135
  store double %43, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !186, !tbaa !135
  store double %47, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !186, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !169) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !173) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !174) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %43}, i64 0, metadata !175) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !176) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %51}, i64 0, metadata !177) #4, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !178) #4, !dbg !172
  %59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %2, i64 %3, i64 %2, double %43, double %47, double %51, double %55) #4, !dbg !179
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !180
  br i1 %10, label %._crit_edge108, label %.lr.ph29, !dbg !180

._crit_edge108:                                   ; preds = %.thread, %58
  %.pre = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !187, !tbaa !135
  %.pre109 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !187, !tbaa !135
  %.pre110 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !187, !tbaa !135
  %.pre111 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !187, !tbaa !135
  br label %160, !dbg !180

.lr.ph29:                                         ; preds = %58
  %60 = load double* @T, align 8, !dbg !189, !tbaa !135
  %61 = load double* @T2, align 8, !dbg !191, !tbaa !135
  %.promoted31 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !189, !tbaa !135
  %.promoted33 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !192, !tbaa !135
  %.promoted35 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !193, !tbaa !135
  %.promoted37 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !191, !tbaa !135
  br label %PA.exit107, !dbg !180

PA.exit107:                                       ; preds = %PA.exit107, %.lr.ph29
  %.lcssa2638 = phi double [ %.promoted37, %.lr.ph29 ], [ %157, %PA.exit107 ]
  %.lcssa2436 = phi double [ %.promoted35, %.lr.ph29 ], [ %153, %PA.exit107 ]
  %.lcssa2234 = phi double [ %.promoted33, %.lr.ph29 ], [ %149, %PA.exit107 ]
  %.lcssa2032 = phi double [ %.promoted31, %.lr.ph29 ], [ %145, %PA.exit107 ]
  %I.227 = phi i64 [ 1, %.lr.ph29 ], [ %158, %PA.exit107 ]
  tail call void @llvm.dbg.value(metadata !194, i64 0, metadata !195), !dbg !196
  %62 = fadd double %.lcssa2234, %.lcssa2032, !dbg !189
  %63 = fadd double %.lcssa2436, %62, !dbg !189
  %64 = fsub double %63, %.lcssa2638, !dbg !189
  %65 = fmul double %60, %64, !dbg !189
  %66 = fadd double %.lcssa2234, %65, !dbg !192
  %67 = fsub double %66, %.lcssa2436, !dbg !192
  %68 = fadd double %.lcssa2638, %67, !dbg !192
  %69 = fmul double %60, %68, !dbg !192
  %70 = fsub double %65, %69, !dbg !193
  %71 = fadd double %.lcssa2436, %70, !dbg !193
  %72 = fadd double %.lcssa2638, %71, !dbg !193
  %73 = fmul double %60, %72, !dbg !193
  %74 = fsub double %69, %65, !dbg !191
  %75 = fadd double %74, %73, !dbg !191
  %76 = fadd double %.lcssa2638, %75, !dbg !191
  %77 = fdiv double %76, %61, !dbg !191
  %78 = fadd double %69, %65, !dbg !189
  %79 = fadd double %73, %78, !dbg !189
  %80 = fsub double %79, %77, !dbg !189
  %81 = fmul double %60, %80, !dbg !189
  %82 = fadd double %69, %81, !dbg !192
  %83 = fsub double %82, %73, !dbg !192
  %84 = fadd double %77, %83, !dbg !192
  %85 = fmul double %60, %84, !dbg !192
  %86 = fsub double %81, %85, !dbg !193
  %87 = fadd double %73, %86, !dbg !193
  %88 = fadd double %77, %87, !dbg !193
  %89 = fmul double %60, %88, !dbg !193
  %90 = fsub double %85, %81, !dbg !191
  %91 = fadd double %90, %89, !dbg !191
  %92 = fadd double %77, %91, !dbg !191
  %93 = fdiv double %92, %61, !dbg !191
  %94 = fadd double %85, %81, !dbg !189
  %95 = fadd double %89, %94, !dbg !189
  %96 = fsub double %95, %93, !dbg !189
  %97 = fmul double %60, %96, !dbg !189
  %98 = fadd double %85, %97, !dbg !192
  %99 = fsub double %98, %89, !dbg !192
  %100 = fadd double %93, %99, !dbg !192
  %101 = fmul double %60, %100, !dbg !192
  %102 = fsub double %97, %101, !dbg !193
  %103 = fadd double %89, %102, !dbg !193
  %104 = fadd double %93, %103, !dbg !193
  %105 = fmul double %60, %104, !dbg !193
  %106 = fsub double %101, %97, !dbg !191
  %107 = fadd double %106, %105, !dbg !191
  %108 = fadd double %93, %107, !dbg !191
  %109 = fdiv double %108, %61, !dbg !191
  %110 = fadd double %101, %97, !dbg !189
  %111 = fadd double %105, %110, !dbg !189
  %112 = fsub double %111, %109, !dbg !189
  %113 = fmul double %60, %112, !dbg !189
  %114 = fadd double %101, %113, !dbg !192
  %115 = fsub double %114, %105, !dbg !192
  %116 = fadd double %109, %115, !dbg !192
  %117 = fmul double %60, %116, !dbg !192
  %118 = fsub double %113, %117, !dbg !193
  %119 = fadd double %105, %118, !dbg !193
  %120 = fadd double %109, %119, !dbg !193
  %121 = fmul double %60, %120, !dbg !193
  %122 = fsub double %117, %113, !dbg !191
  %123 = fadd double %122, %121, !dbg !191
  %124 = fadd double %109, %123, !dbg !191
  %125 = fdiv double %124, %61, !dbg !191
  %126 = fadd double %117, %113, !dbg !189
  %127 = fadd double %121, %126, !dbg !189
  %128 = fsub double %127, %125, !dbg !189
  %129 = fmul double %60, %128, !dbg !189
  %130 = fadd double %117, %129, !dbg !192
  %131 = fsub double %130, %121, !dbg !192
  %132 = fadd double %125, %131, !dbg !192
  %133 = fmul double %60, %132, !dbg !192
  %134 = fsub double %129, %133, !dbg !193
  %135 = fadd double %121, %134, !dbg !193
  %136 = fadd double %125, %135, !dbg !193
  %137 = fmul double %60, %136, !dbg !193
  %138 = fsub double %133, %129, !dbg !191
  %139 = fadd double %138, %137, !dbg !191
  %140 = fadd double %125, %139, !dbg !191
  %141 = fdiv double %140, %61, !dbg !191
  %142 = fadd double %133, %129, !dbg !189
  %143 = fadd double %137, %142, !dbg !189
  %144 = fsub double %143, %141, !dbg !189
  %145 = fmul double %60, %144, !dbg !189
  %146 = fadd double %133, %145, !dbg !192
  %147 = fsub double %146, %137, !dbg !192
  %148 = fadd double %141, %147, !dbg !192
  %149 = fmul double %60, %148, !dbg !192
  %150 = fsub double %145, %149, !dbg !193
  %151 = fadd double %137, %150, !dbg !193
  %152 = fadd double %141, %151, !dbg !193
  %153 = fmul double %60, %152, !dbg !193
  %154 = fsub double %149, %145, !dbg !191
  %155 = fadd double %154, %153, !dbg !191
  %156 = fadd double %141, %155, !dbg !191
  %157 = fdiv double %156, %61, !dbg !191
  %158 = add nsw i64 %I.227, 1, !dbg !180
  tail call void @llvm.dbg.value(metadata !{i64 %158}, i64 0, metadata !15), !dbg !180
  %159 = icmp slt i64 %I.227, %3, !dbg !180
  br i1 %159, label %PA.exit107, label %._crit_edge30, !dbg !180

._crit_edge30:                                    ; preds = %PA.exit107
  store double %145, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !189, !tbaa !135
  store double %149, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !192, !tbaa !135
  store double %153, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !193, !tbaa !135
  store double %157, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !191, !tbaa !135
  store i32 6, i32* @J, align 4, !dbg !197, !tbaa !198
  br label %160, !dbg !180

; <label>:160                                     ; preds = %._crit_edge108, %._crit_edge30
  %161 = phi double [ %.pre111, %._crit_edge108 ], [ %157, %._crit_edge30 ]
  %162 = phi double [ %.pre110, %._crit_edge108 ], [ %153, %._crit_edge30 ]
  %163 = phi double [ %.pre109, %._crit_edge108 ], [ %149, %._crit_edge30 ]
  %164 = phi double [ %.pre, %._crit_edge108 ], [ %145, %._crit_edge30 ]
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !200) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !202) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !203) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %164}, i64 0, metadata !204) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !205) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !206) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %161}, i64 0, metadata !207) #4, !dbg !201
  %165 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %3, i64 %2, i64 %2, double %164, double %163, double %162, double %161) #4, !dbg !208
  store i32 1, i32* @J, align 4, !dbg !209, !tbaa !198
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !210
  br i1 %10, label %.critedge, label %.lr.ph41.preheader, !dbg !210

.lr.ph41.preheader:                               ; preds = %160
  %end.idx = add i64 %smax, 1, !dbg !210
  %n.vec = and i64 %smax, -4, !dbg !210
  %end.idx.rnd.down133 = or i64 %n.vec, 1, !dbg !210
  %cmp.zero = icmp eq i64 %end.idx.rnd.down133, 1, !dbg !210
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph41.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 1, %.lr.ph41.preheader ], !dbg !210
  %vec.phi = phi <2 x i32> [ %166, %vector.body ], [ <i32 1, i32 0>, %.lr.ph41.preheader ]
  %vec.phi127 = phi <2 x i32> [ %167, %vector.body ], [ zeroinitializer, %.lr.ph41.preheader ]
  %166 = xor <2 x i32> %vec.phi, <i32 1, i32 1>
  %167 = xor <2 x i32> %vec.phi127, <i32 1, i32 1>
  %index.next = add i64 %index, 4, !dbg !210
  %168 = icmp eq i64 %index.next, %end.idx.rnd.down133, !dbg !210
  br i1 %168, label %middle.block, label %vector.body, !dbg !210, !llvm.loop !212

middle.block:                                     ; preds = %vector.body, %.lr.ph41.preheader
  %resume.val = phi i64 [ 1, %.lr.ph41.preheader ], [ %end.idx.rnd.down133, %vector.body ]
  %rdx.vec.exit.phi = phi <2 x i32> [ <i32 1, i32 0>, %.lr.ph41.preheader ], [ %166, %vector.body ]
  %rdx.vec.exit.phi131 = phi <2 x i32> [ zeroinitializer, %.lr.ph41.preheader ], [ %167, %vector.body ]
  %bin.rdx = xor <2 x i32> %rdx.vec.exit.phi131, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <2 x i32> %bin.rdx, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx132 = xor <2 x i32> %bin.rdx, %rdx.shuf
  %169 = extractelement <2 x i32> %bin.rdx132, i32 0
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge42, label %.lr.ph41

.lr.ph41:                                         ; preds = %middle.block, %.lr.ph41
  %170 = phi i32 [ %171, %.lr.ph41 ], [ %169, %middle.block ]
  %I.339 = phi i64 [ %172, %.lr.ph41 ], [ %resume.val, %middle.block ]
  %171 = xor i32 %170, 1
  %172 = add nsw i64 %I.339, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i64 %172}, i64 0, metadata !15), !dbg !210
  %173 = icmp slt i64 %I.339, %4, !dbg !210
  br i1 %173, label %.lr.ph41, label %._crit_edge42, !dbg !210, !llvm.loop !215

._crit_edge42:                                    ; preds = %middle.block, %.lr.ph41
  %.lcssa123 = phi i32 [ %171, %.lr.ph41 ], [ %169, %middle.block ]
  store i32 %.lcssa123, i32* @J, align 4, !dbg !216, !tbaa !198
  %phitmp = sext i32 %.lcssa123 to i64, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !219) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp}, i64 0, metadata !223) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp}, i64 0, metadata !224) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !225) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !226) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !227) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !228) #4, !dbg !222
  %174 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %4, i64 %phitmp, i64 %phitmp, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !229
  store i32 1, i32* @J, align 4, !dbg !230, !tbaa !198
  store i32 2, i32* @K, align 4, !dbg !231, !tbaa !198
  store i32 3, i32* @L, align 4, !dbg !232, !tbaa !198
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !233
  br i1 %10, label %._crit_edge57.critedge, label %.lr.ph46, !dbg !233

.lr.ph46:                                         ; preds = %._crit_edge42, %.lr.ph46
  %I.444 = phi i64 [ %175, %.lr.ph46 ], [ 1, %._crit_edge42 ]
  store double 6.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !235, !tbaa !135
  store double 6.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !237, !tbaa !135
  %175 = add nsw i64 %I.444, 1, !dbg !233
  tail call void @llvm.dbg.value(metadata !{i64 %175}, i64 0, metadata !15), !dbg !233
  %176 = icmp slt i64 %I.444, %5, !dbg !233
  br i1 %176, label %.lr.ph46, label %._crit_edge47, !dbg !233

._crit_edge47:                                    ; preds = %.lr.ph46
  store i32 2, i32* @K, align 4, !dbg !237, !tbaa !198
  store i32 3, i32* @L, align 4, !dbg !237, !tbaa !198
  store i32 1, i32* @J, align 4, !dbg !238, !tbaa !198
  br label %178, !dbg !233

.critedge:                                        ; preds = %160
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !219) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp}, i64 0, metadata !223) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i64 %phitmp}, i64 0, metadata !224) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !225) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !226) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !227) #4, !dbg !222
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !228) #4, !dbg !222
  %177 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %4, i64 1, i64 1, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !229
  store i32 1, i32* @J, align 4, !dbg !230, !tbaa !198
  store i32 2, i32* @K, align 4, !dbg !231, !tbaa !198
  store i32 3, i32* @L, align 4, !dbg !232, !tbaa !198
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !233
  br label %178

; <label>:178                                     ; preds = %.critedge, %._crit_edge47
  %179 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !238, !tbaa !135
  %180 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !238, !tbaa !135
  %181 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !238, !tbaa !135
  %182 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !238, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !240) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !242) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !243, i64 0, metadata !244) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %179}, i64 0, metadata !245) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !246) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !247) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !248) #4, !dbg !241
  %183 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %5, i64 1, i64 2, double %179, double %180, double %181, double %182) #4, !dbg !249
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !32), !dbg !251
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !33), !dbg !252
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !253
  br i1 %10, label %.critedge115, label %.lr.ph56, !dbg !253

.lr.ph56:                                         ; preds = %178, %.lr.ph56
  %I.554 = phi i64 [ %214, %.lr.ph56 ], [ 1, %178 ]
  %Y.053 = phi double [ %213, %.lr.ph56 ], [ 5.000000e-01, %178 ]
  %X.052 = phi double [ %198, %.lr.ph56 ], [ 5.000000e-01, %178 ]
  %184 = load double* @T, align 8, !dbg !255, !tbaa !135
  %185 = load double* @T2, align 8, !dbg !255, !tbaa !135
  %186 = tail call double @sin(double %X.052) #4, !dbg !255
  %187 = fmul double %185, %186, !dbg !255
  %188 = tail call double @cos(double %X.052) #4, !dbg !255
  %189 = fmul double %187, %188, !dbg !255
  %190 = fadd double %X.052, %Y.053, !dbg !255
  %191 = tail call double @cos(double %190) #4, !dbg !255
  %192 = fsub double %X.052, %Y.053, !dbg !255
  %193 = tail call double @cos(double %192) #4, !dbg !255
  %194 = fadd double %191, %193, !dbg !255
  %195 = fadd double %194, -1.000000e+00, !dbg !255
  %196 = fdiv double %189, %195, !dbg !255
  %197 = tail call double @atan(double %196) #4, !dbg !255
  %198 = fmul double %184, %197, !dbg !255
  tail call void @llvm.dbg.value(metadata !{double %198}, i64 0, metadata !32), !dbg !255
  %199 = load double* @T, align 8, !dbg !257, !tbaa !135
  %200 = load double* @T2, align 8, !dbg !257, !tbaa !135
  %201 = tail call double @sin(double %Y.053) #4, !dbg !257
  %202 = fmul double %200, %201, !dbg !257
  %203 = tail call double @cos(double %Y.053) #4, !dbg !257
  %204 = fmul double %202, %203, !dbg !257
  %205 = fadd double %Y.053, %198, !dbg !257
  %206 = tail call double @cos(double %205) #4, !dbg !257
  %207 = fsub double %198, %Y.053, !dbg !257
  %208 = tail call double @cos(double %207) #4, !dbg !257
  %209 = fadd double %206, %208, !dbg !257
  %210 = fadd double %209, -1.000000e+00, !dbg !257
  %211 = fdiv double %204, %210, !dbg !257
  %212 = tail call double @atan(double %211) #4, !dbg !257
  %213 = fmul double %199, %212, !dbg !257
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !33), !dbg !257
  %214 = add nsw i64 %I.554, 1, !dbg !253
  tail call void @llvm.dbg.value(metadata !{i64 %214}, i64 0, metadata !15), !dbg !253
  %215 = icmp slt i64 %I.554, %6, !dbg !253
  br i1 %215, label %.lr.ph56, label %._crit_edge57, !dbg !253

._crit_edge57.critedge:                           ; preds = %._crit_edge42
  %216 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !238, !tbaa !135
  %217 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !238, !tbaa !135
  %218 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !238, !tbaa !135
  %219 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !238, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %5}, i64 0, metadata !240) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !242) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !243, i64 0, metadata !244) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %179}, i64 0, metadata !245) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !246) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !247) #4, !dbg !241
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !248) #4, !dbg !241
  %220 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %5, i64 1, i64 2, double %216, double %217, double %218, double %219) #4, !dbg !249
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !32), !dbg !251
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !33), !dbg !252
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !253
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %.lr.ph56, %._crit_edge57.critedge
  %Y.0.lcssa = phi double [ 5.000000e-01, %._crit_edge57.critedge ], [ %213, %.lr.ph56 ]
  %X.0.lcssa = phi double [ 5.000000e-01, %._crit_edge57.critedge ], [ %198, %.lr.ph56 ]
  %221 = load i32* @J, align 4, !dbg !258, !tbaa !198
  %222 = sext i32 %221 to i64, !dbg !258
  %223 = load i32* @K, align 4, !dbg !258, !tbaa !198
  %224 = sext i32 %223 to i64, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !260) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i64 %222}, i64 0, metadata !262) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i64 %224}, i64 0, metadata !263) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !264) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !265) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !266) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !267) #4, !dbg !261
  %225 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %6, i64 %222, i64 %224, double %X.0.lcssa, double %X.0.lcssa, double %Y.0.lcssa, double %Y.0.lcssa) #4, !dbg !268
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !32), !dbg !269
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !33), !dbg !270
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !272), !dbg !275
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !34), !dbg !276
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !278
  br i1 %10, label %238, label %.lr.ph62, !dbg !278

.lr.ph62:                                         ; preds = %._crit_edge57
  %226 = load double* @T, align 8, !dbg !279, !tbaa !135
  %227 = fmul double %226, 2.000000e+00, !dbg !279
  %228 = fadd double %227, 1.000000e+00, !dbg !280
  %229 = fmul double %226, %228, !dbg !280
  %230 = fadd double %227, %229, !dbg !281
  %231 = load double* @T2, align 8, !dbg !281, !tbaa !135
  %232 = fdiv double %230, %231, !dbg !281
  br label %238, !dbg !278

.critedge115:                                     ; preds = %178
  %233 = load i32* @J, align 4, !dbg !258, !tbaa !198
  %234 = sext i32 %233 to i64, !dbg !258
  %235 = load i32* @K, align 4, !dbg !258, !tbaa !198
  %236 = sext i32 %235 to i64, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !260) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i64 %222}, i64 0, metadata !262) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{i64 %224}, i64 0, metadata !263) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !264) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %X.0.lcssa}, i64 0, metadata !265) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !266) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %Y.0.lcssa}, i64 0, metadata !267) #4, !dbg !261
  %237 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %6, i64 %234, i64 %236, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01) #4, !dbg !268
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !32), !dbg !269
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !33), !dbg !270
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !272), !dbg !275
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !34), !dbg !276
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !278
  br label %238

; <label>:238                                     ; preds = %.critedge115, %.lr.ph62, %._crit_edge57
  %.lcssa7 = phi double [ %232, %.lr.ph62 ], [ 1.000000e+00, %._crit_edge57 ], [ 1.000000e+00, %.critedge115 ]
  %239 = load i32* @J, align 4, !dbg !276, !tbaa !198
  %240 = sext i32 %239 to i64, !dbg !276
  %241 = load i32* @K, align 4, !dbg !276, !tbaa !198
  %242 = sext i32 %241 to i64, !dbg !276
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !282) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i64 %240}, i64 0, metadata !284) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i64 %242}, i64 0, metadata !285) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !286) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !287) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !{double %.lcssa7}, i64 0, metadata !288) #4, !dbg !283
  tail call void @llvm.dbg.value(metadata !{double %.lcssa7}, i64 0, metadata !289) #4, !dbg !283
  %243 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %7, i64 %240, i64 %242, double 1.000000e+00, double 1.000000e+00, double %.lcssa7, double %.lcssa7) #4, !dbg !290
  store i32 1, i32* @J, align 4, !dbg !291, !tbaa !198
  store i32 2, i32* @K, align 4, !dbg !292, !tbaa !198
  store i32 3, i32* @L, align 4, !dbg !293, !tbaa !198
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !294, !tbaa !135
  store double 2.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !295, !tbaa !135
  store double 3.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !296, !tbaa !135
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !297
  br i1 %10, label %._crit_edge82.critedge, label %.lr.ph76, !dbg !297

.lr.ph76:                                         ; preds = %238, %.lr.ph76
  %.pre113 = phi double [ %.pre114, %.lr.ph76 ], [ 3.000000e+00, %238 ], !dbg !299
  %.pre114 = phi double [ %.pre113, %.lr.ph76 ], [ 2.000000e+00, %238 ], !dbg !299
  %I.774 = phi i64 [ %244, %.lr.ph76 ], [ 1, %238 ]
  store double %.pre114, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !299, !tbaa !135
  store double %.pre113, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !301, !tbaa !135
  store double %.pre114, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !302, !tbaa !135
  %244 = add nsw i64 %I.774, 1, !dbg !297
  tail call void @llvm.dbg.value(metadata !{i64 %244}, i64 0, metadata !15), !dbg !297
  %245 = icmp slt i64 %I.774, %8, !dbg !297
  br i1 %245, label %.lr.ph76, label %._crit_edge77, !dbg !297

._crit_edge77:                                    ; preds = %.lr.ph76
  %246 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !303, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !305) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !307) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !243, i64 0, metadata !308) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %.pre114}, i64 0, metadata !309) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %.pre113}, i64 0, metadata !310) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %.pre114}, i64 0, metadata !311) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %246}, i64 0, metadata !312) #4, !dbg !306
  %247 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %8, i64 1, i64 2, double %.pre114, double %.pre113, double %.pre114, double %246) #4, !dbg !313
  store i32 2, i32* @J, align 4, !dbg !314, !tbaa !198
  store i32 3, i32* @K, align 4, !dbg !315, !tbaa !198
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !316
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !318) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !243, i64 0, metadata !322) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !323, i64 0, metadata !324) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !325) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !326) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !327) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !328) #4, !dbg !321
  %248 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !329
  tail call void @llvm.dbg.value(metadata !330, i64 0, metadata !32), !dbg !331
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !332
  br i1 %10, label %._crit_edge82, label %.lr.ph81, !dbg !332

.lr.ph81:                                         ; preds = %._crit_edge77, %.lr.ph81
  %I.979 = phi i64 [ %254, %.lr.ph81 ], [ 1, %._crit_edge77 ]
  %X.178 = phi double [ %253, %.lr.ph81 ], [ 7.500000e-01, %._crit_edge77 ]
  %249 = tail call double @log(double %X.178) #4, !dbg !334
  %250 = load double* @T1, align 8, !dbg !334, !tbaa !135
  %251 = fdiv double %249, %250, !dbg !334
  %252 = tail call double @exp(double %251) #4, !dbg !334
  %253 = tail call double @sqrt(double %252) #4, !dbg !334
  tail call void @llvm.dbg.value(metadata !{double %253}, i64 0, metadata !32), !dbg !334
  %254 = add nsw i64 %I.979, 1, !dbg !332
  tail call void @llvm.dbg.value(metadata !{i64 %254}, i64 0, metadata !15), !dbg !332
  %255 = icmp slt i64 %I.979, %9, !dbg !332
  br i1 %255, label %.lr.ph81, label %._crit_edge82, !dbg !332

._crit_edge82.critedge:                           ; preds = %238
  %256 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !303, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i64 %8}, i64 0, metadata !305) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !307) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !243, i64 0, metadata !308) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %.pre114}, i64 0, metadata !309) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %.pre113}, i64 0, metadata !310) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %.pre114}, i64 0, metadata !311) #4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %246}, i64 0, metadata !312) #4, !dbg !306
  %257 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %8, i64 1, i64 2, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double %256) #4, !dbg !313
  store i32 2, i32* @J, align 4, !dbg !314, !tbaa !198
  store i32 3, i32* @K, align 4, !dbg !315, !tbaa !198
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !316
  tail call void @llvm.dbg.value(metadata !142, i64 0, metadata !318) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !243, i64 0, metadata !322) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !323, i64 0, metadata !324) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !145, i64 0, metadata !325) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !326) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !327) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata !147, i64 0, metadata !328) #4, !dbg !321
  %258 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !329
  tail call void @llvm.dbg.value(metadata !330, i64 0, metadata !32), !dbg !331
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !15), !dbg !332
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %.lr.ph81, %._crit_edge82.critedge, %._crit_edge77
  %X.1.lcssa = phi double [ 7.500000e-01, %._crit_edge77 ], [ 7.500000e-01, %._crit_edge82.critedge ], [ %253, %.lr.ph81 ]
  %259 = load i32* @J, align 4, !dbg !335, !tbaa !198
  %260 = sext i32 %259 to i64, !dbg !335
  %261 = load i32* @K, align 4, !dbg !335, !tbaa !198
  %262 = sext i32 %261 to i64, !dbg !335
  tail call void @llvm.dbg.value(metadata !{i64 %9}, i64 0, metadata !337) #4, !dbg !338
  tail call void @llvm.dbg.value(metadata !{i64 %260}, i64 0, metadata !339) #4, !dbg !338
  tail call void @llvm.dbg.value(metadata !{i64 %262}, i64 0, metadata !340) #4, !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !341) #4, !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !342) #4, !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !343) #4, !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %X.1.lcssa}, i64 0, metadata !344) #4, !dbg !338
  %263 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %9, i64 %260, i64 %262, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa) #4, !dbg !345
  tail call void @llvm.dbg.value(metadata !346, i64 0, metadata !37), !dbg !347
  %264 = tail call i64 @time(i64* null) #4, !dbg !349
  tail call void @llvm.dbg.value(metadata !{i64 %264}, i64 0, metadata !40), !dbg !349
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !350
  br i1 %11, label %.loopexit, label %30, !dbg !114

.loopexit:                                        ; preds = %._crit_edge82, %24
  %.0 = phi i32 [ 1, %24 ], [ 0, %._crit_edge82 ]
  ret i32 %.0, !dbg !351
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind uwtable
define void @POUT(i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %N}, i64 0, metadata !66), !dbg !352
  tail call void @llvm.dbg.value(metadata !{i64 %J}, i64 0, metadata !67), !dbg !352
  tail call void @llvm.dbg.value(metadata !{i64 %K}, i64 0, metadata !68), !dbg !352
  tail call void @llvm.dbg.value(metadata !{double %X1}, i64 0, metadata !69), !dbg !352
  tail call void @llvm.dbg.value(metadata !{double %X2}, i64 0, metadata !70), !dbg !352
  tail call void @llvm.dbg.value(metadata !{double %X3}, i64 0, metadata !71), !dbg !352
  tail call void @llvm.dbg.value(metadata !{double %X4}, i64 0, metadata !72), !dbg !352
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #4, !dbg !353
  ret void, !dbg !354
}

; Function Attrs: nounwind uwtable
define void @PA(double* nocapture %E) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %E}, i64 0, metadata !49), !dbg !355
  store i32 0, i32* @J, align 4, !dbg !356, !tbaa !198
  %1 = getelementptr inbounds double* %E, i64 1, !dbg !357
  %2 = getelementptr inbounds double* %E, i64 2, !dbg !357
  %3 = getelementptr inbounds double* %E, i64 3, !dbg !357
  %4 = getelementptr inbounds double* %E, i64 4, !dbg !357
  %.pre = load double* %1, align 8, !dbg !357, !tbaa !135
  %.pre1 = load double* %2, align 8, !dbg !357, !tbaa !135
  %.pre2 = load double* %3, align 8, !dbg !357, !tbaa !135
  %.pre3 = load double* %4, align 8, !dbg !357, !tbaa !135
  br label %5, !dbg !356

; <label>:5                                       ; preds = %5, %0
  %6 = phi double [ %30, %5 ], [ %.pre3, %0 ], !dbg !357
  %7 = phi double [ %25, %5 ], [ %.pre2, %0 ], !dbg !357
  %8 = phi double [ %20, %5 ], [ %.pre1, %0 ], !dbg !357
  %9 = phi double [ %15, %5 ], [ %.pre, %0 ], !dbg !357
  %10 = phi i32 [ %31, %5 ], [ 0, %0 ], !dbg !357
  %11 = fadd double %9, %8, !dbg !357
  %12 = fadd double %11, %7, !dbg !357
  %13 = fsub double %12, %6, !dbg !357
  %14 = load double* @T, align 8, !dbg !357, !tbaa !135
  %15 = fmul double %13, %14, !dbg !357
  store double %15, double* %1, align 8, !dbg !357, !tbaa !135
  %16 = fadd double %15, %8, !dbg !358
  %17 = fsub double %16, %7, !dbg !358
  %18 = fadd double %17, %6, !dbg !358
  %19 = load double* @T, align 8, !dbg !358, !tbaa !135
  %20 = fmul double %18, %19, !dbg !358
  store double %20, double* %2, align 8, !dbg !358, !tbaa !135
  %21 = fsub double %15, %20, !dbg !359
  %22 = fadd double %21, %7, !dbg !359
  %23 = fadd double %22, %6, !dbg !359
  %24 = load double* @T, align 8, !dbg !359, !tbaa !135
  %25 = fmul double %23, %24, !dbg !359
  store double %25, double* %3, align 8, !dbg !359, !tbaa !135
  %26 = fsub double %20, %15, !dbg !360
  %27 = fadd double %25, %26, !dbg !360
  %28 = fadd double %6, %27, !dbg !360
  %29 = load double* @T2, align 8, !dbg !360, !tbaa !135
  %30 = fdiv double %28, %29, !dbg !360
  store double %30, double* %4, align 8, !dbg !360, !tbaa !135
  %31 = add nsw i32 %10, 1, !dbg !361
  %exitcond = icmp eq i32 %31, 6, !dbg !362
  br i1 %exitcond, label %32, label %5, !dbg !362

; <label>:32                                      ; preds = %5
  store i32 6, i32* @J, align 4, !dbg !361, !tbaa !198
  ret void, !dbg !364
}

; Function Attrs: nounwind
declare double @atan(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind uwtable
define void @P3(double %X, double %Y, double* nocapture %Z) #0 {
  tail call void @llvm.dbg.value(metadata !{double %X}, i64 0, metadata !57), !dbg !365
  tail call void @llvm.dbg.value(metadata !{double %Y}, i64 0, metadata !58), !dbg !365
  tail call void @llvm.dbg.value(metadata !{double* %Z}, i64 0, metadata !59), !dbg !365
  tail call void @llvm.dbg.value(metadata !{double %X}, i64 0, metadata !60), !dbg !366
  tail call void @llvm.dbg.value(metadata !{double %Y}, i64 0, metadata !61), !dbg !367
  %1 = load double* @T, align 8, !dbg !368, !tbaa !135
  %2 = fadd double %X, %Y, !dbg !368
  %3 = fmul double %2, %1, !dbg !368
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !60), !dbg !368
  %4 = fadd double %3, %Y, !dbg !369
  %5 = fmul double %1, %4, !dbg !369
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !61), !dbg !369
  %6 = fadd double %3, %5, !dbg !370
  %7 = load double* @T2, align 8, !dbg !370, !tbaa !135
  %8 = fdiv double %6, %7, !dbg !370
  store double %8, double* %Z, align 8, !dbg !370, !tbaa !135
  ret void, !dbg !371
}

; Function Attrs: nounwind uwtable
define void @P0() #0 {
  %1 = load i32* @K, align 4, !dbg !372, !tbaa !198
  %2 = sext i32 %1 to i64, !dbg !372
  %3 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %2, !dbg !372
  %4 = load double* %3, align 8, !dbg !372, !tbaa !135
  %5 = load i32* @J, align 4, !dbg !372, !tbaa !198
  %6 = sext i32 %5 to i64, !dbg !372
  %7 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %6, !dbg !372
  store double %4, double* %7, align 8, !dbg !372, !tbaa !135
  %8 = load i32* @L, align 4, !dbg !373, !tbaa !198
  %9 = sext i32 %8 to i64, !dbg !373
  %10 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %9, !dbg !373
  %11 = load double* %10, align 8, !dbg !373, !tbaa !135
  store double %11, double* %3, align 8, !dbg !373, !tbaa !135
  %12 = load double* %7, align 8, !dbg !374, !tbaa !135
  store double %12, double* %10, align 8, !dbg !374, !tbaa !135
  ret void, !dbg !375
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @exp(double) #2

; Function Attrs: nounwind
declare double @log(double) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { cold }

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
!73 = metadata !{i32 786478, metadata !74, metadata !75, metadata !"atol", metadata !"atol", metadata !"", i32 283, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !80, i32 284} ; [ DW_TAG_subprogram ] [line 283] [def] [scope 284] [atol]
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
!97 = metadata !{i64 100000}
!98 = metadata !{i32 105, i32 0, metadata !4, null}
!99 = metadata !{i32 0}
!100 = metadata !{i32 107, i32 0, metadata !4, null}
!101 = metadata !{i32 1}
!102 = metadata !{i32 109, i32 0, metadata !4, null}
!103 = metadata !{i32 110, i32 0, metadata !4, null}
!104 = metadata !{i32 153, i32 0, metadata !4, null}
!105 = metadata !{i32 154, i32 0, metadata !4, null}
!106 = metadata !{i32 155, i32 0, metadata !4, null}
!107 = metadata !{i32 156, i32 0, metadata !4, null}
!108 = metadata !{i32 157, i32 0, metadata !4, null}
!109 = metadata !{i32 158, i32 0, metadata !4, null}
!110 = metadata !{i32 159, i32 0, metadata !4, null}
!111 = metadata !{i32 161, i32 0, metadata !4, null}
!112 = metadata !{i32 192, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !4, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!114 = metadata !{i32 390, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !4, i32 390, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!116 = metadata !{i32 128, i32 0, metadata !4, null}
!117 = metadata !{i32 111, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !119, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!119 = metadata !{i32 786443, metadata !1, metadata !4, i32 110, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!120 = metadata !{metadata !121, metadata !121, i64 0}
!121 = metadata !{metadata !"any pointer", metadata !122, i64 0}
!122 = metadata !{metadata !"omnipotent char", metadata !123, i64 0}
!123 = metadata !{metadata !"Simple C/C++ TBAA"}
!124 = metadata !{metadata !122, metadata !122, i64 0}
!125 = metadata !{i32 786689, metadata !73, metadata !"__nptr", metadata !75, i32 16777499, metadata !78, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [__nptr] [line 283]
!126 = metadata !{i32 113, i32 14, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !118, i32 113, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!128 = metadata !{i32 283, i32 0, metadata !73, metadata !126}
!129 = metadata !{i32 285, i32 0, metadata !130, metadata !126}
!130 = metadata !{i32 786443, metadata !74, metadata !73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!131 = metadata !{i32 116, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !127, i32 115, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!133 = metadata !{i32 117, i32 0, metadata !132, null}
!134 = metadata !{i32 135, i32 0, metadata !4, null}
!135 = metadata !{metadata !136, metadata !136, i64 0}
!136 = metadata !{metadata !"double", metadata !122, i64 0}
!137 = metadata !{i32 136, i32 0, metadata !4, null}
!138 = metadata !{i32 137, i32 0, metadata !4, null}
!139 = metadata !{i32 146, i32 0, metadata !4, null}
!140 = metadata !{i32 147, i32 0, metadata !4, null}
!141 = metadata !{i32 149, i32 0, metadata !4, null}
!142 = metadata !{i64 0}
!143 = metadata !{i32 152, i32 0, metadata !4, null}
!144 = metadata !{i32 160, i32 0, metadata !4, null}
!145 = metadata !{double 1.000000e+00}
!146 = metadata !{i32 167, i32 0, metadata !4, null}
!147 = metadata !{double -1.000000e+00}
!148 = metadata !{i32 168, i32 0, metadata !4, null}
!149 = metadata !{i32 169, i32 0, metadata !4, null}
!150 = metadata !{i32 170, i32 0, metadata !4, null}
!151 = metadata !{i64 1}
!152 = metadata !{i32 172, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !4, i32 172, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!154 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [N] [line 434]
!155 = metadata !{i32 179, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !4, i32 179, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!157 = metadata !{i32 434, i32 0, metadata !62, metadata !155}
!158 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [J] [line 434]
!159 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [K] [line 434]
!160 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!161 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!162 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!163 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!164 = metadata !{i32 436, i32 0, metadata !62, metadata !155}
!165 = metadata !{i32 187, i32 0, metadata !4, null}
!166 = metadata !{i32 188, i32 0, metadata !4, null}
!167 = metadata !{i32 189, i32 0, metadata !4, null}
!168 = metadata !{i32 190, i32 0, metadata !4, null}
!169 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [N] [line 434]
!170 = metadata !{i32 200, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !4, i32 200, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!172 = metadata !{i32 434, i32 0, metadata !62, metadata !170}
!173 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [J] [line 434]
!174 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [K] [line 434]
!175 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!176 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!177 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!178 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!179 = metadata !{i32 436, i32 0, metadata !62, metadata !170}
!180 = metadata !{i32 208, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !4, i32 208, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!182 = metadata !{i32 193, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !113, i32 192, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!184 = metadata !{i32 194, i32 0, metadata !183, null}
!185 = metadata !{i32 195, i32 0, metadata !183, null}
!186 = metadata !{i32 196, i32 0, metadata !183, null}
!187 = metadata !{i32 212, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !4, i32 212, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!189 = metadata !{i32 402, i32 0, metadata !44, metadata !190}
!190 = metadata !{i32 209, i32 0, metadata !181, null}
!191 = metadata !{i32 405, i32 0, metadata !44, metadata !190}
!192 = metadata !{i32 403, i32 0, metadata !44, metadata !190}
!193 = metadata !{i32 404, i32 0, metadata !44, metadata !190}
!194 = metadata !{null}
!195 = metadata !{i32 786689, metadata !44, metadata !"E", metadata !5, i32 16777613, metadata !47, i32 0, metadata !190} ; [ DW_TAG_arg_variable ] [E] [line 397]
!196 = metadata !{i32 397, i32 0, metadata !44, metadata !190}
!197 = metadata !{i32 406, i32 0, metadata !44, metadata !190}
!198 = metadata !{metadata !199, metadata !199, i64 0}
!199 = metadata !{metadata !"int", metadata !122, i64 0}
!200 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [N] [line 434]
!201 = metadata !{i32 434, i32 0, metadata !62, metadata !187}
!202 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [J] [line 434]
!203 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [K] [line 434]
!204 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!205 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!206 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!207 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!208 = metadata !{i32 436, i32 0, metadata !62, metadata !187}
!209 = metadata !{i32 220, i32 0, metadata !4, null}
!210 = metadata !{i32 221, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !4, i32 221, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!212 = metadata !{metadata !212, metadata !213, metadata !214}
!213 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!214 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!215 = metadata !{metadata !215, metadata !213, metadata !214}
!216 = metadata !{i32 233, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !218, i32 232, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!218 = metadata !{i32 786443, metadata !1, metadata !211, i32 221, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!219 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [N] [line 434]
!220 = metadata !{i32 239, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !4, i32 239, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!222 = metadata !{i32 434, i32 0, metadata !62, metadata !220}
!223 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [J] [line 434]
!224 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [K] [line 434]
!225 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!226 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!227 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!228 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !220} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!229 = metadata !{i32 436, i32 0, metadata !62, metadata !220}
!230 = metadata !{i32 249, i32 0, metadata !4, null}
!231 = metadata !{i32 250, i32 0, metadata !4, null}
!232 = metadata !{i32 251, i32 0, metadata !4, null}
!233 = metadata !{i32 253, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !4, i32 253, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!235 = metadata !{i32 257, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !234, i32 253, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!237 = metadata !{i32 258, i32 0, metadata !236, null}
!238 = metadata !{i32 262, i32 0, metadata !239, null}
!239 = metadata !{i32 786443, metadata !1, metadata !4, i32 262, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!240 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [N] [line 434]
!241 = metadata !{i32 434, i32 0, metadata !62, metadata !238}
!242 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [J] [line 434]
!243 = metadata !{i64 2}
!244 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [K] [line 434]
!245 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!246 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!247 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!248 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!249 = metadata !{i32 436, i32 0, metadata !62, metadata !238}
!250 = metadata !{double 5.000000e-01}
!251 = metadata !{i32 270, i32 0, metadata !4, null}
!252 = metadata !{i32 271, i32 0, metadata !4, null}
!253 = metadata !{i32 273, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !1, metadata !4, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!255 = metadata !{i32 274, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !254, i32 273, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!257 = metadata !{i32 275, i32 0, metadata !256, null}
!258 = metadata !{i32 279, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !4, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!260 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [N] [line 434]
!261 = metadata !{i32 434, i32 0, metadata !62, metadata !258}
!262 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [J] [line 434]
!263 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [K] [line 434]
!264 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!265 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!266 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!267 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!268 = metadata !{i32 436, i32 0, metadata !62, metadata !258}
!269 = metadata !{i32 287, i32 0, metadata !4, null}
!270 = metadata !{i32 288, i32 0, metadata !4, null}
!271 = metadata !{i32 289, i32 0, metadata !4, null}
!272 = metadata !{i32 786689, metadata !53, metadata !"Z", metadata !5, i32 50332069, metadata !47, i32 0, metadata !273} ; [ DW_TAG_arg_variable ] [Z] [line 421]
!273 = metadata !{i32 292, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !4, i32 291, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!275 = metadata !{i32 421, i32 0, metadata !53, metadata !273}
!276 = metadata !{i32 295, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !4, i32 295, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!278 = metadata !{i32 291, i32 0, metadata !274, null}
!279 = metadata !{i32 427, i32 0, metadata !53, metadata !273}
!280 = metadata !{i32 428, i32 0, metadata !53, metadata !273}
!281 = metadata !{i32 429, i32 0, metadata !53, metadata !273}
!282 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [N] [line 434]
!283 = metadata !{i32 434, i32 0, metadata !62, metadata !276}
!284 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [J] [line 434]
!285 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [K] [line 434]
!286 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!287 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!288 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!289 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!290 = metadata !{i32 436, i32 0, metadata !62, metadata !276}
!291 = metadata !{i32 303, i32 0, metadata !4, null}
!292 = metadata !{i32 304, i32 0, metadata !4, null}
!293 = metadata !{i32 305, i32 0, metadata !4, null}
!294 = metadata !{i32 306, i32 0, metadata !4, null}
!295 = metadata !{i32 307, i32 0, metadata !4, null}
!296 = metadata !{i32 308, i32 0, metadata !4, null}
!297 = metadata !{i32 310, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !4, i32 310, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!299 = metadata !{i32 415, i32 0, metadata !50, metadata !300}
!300 = metadata !{i32 311, i32 0, metadata !298, null}
!301 = metadata !{i32 416, i32 0, metadata !50, metadata !300}
!302 = metadata !{i32 417, i32 0, metadata !50, metadata !300}
!303 = metadata !{i32 314, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!305 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [N] [line 434]
!306 = metadata !{i32 434, i32 0, metadata !62, metadata !303}
!307 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [J] [line 434]
!308 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [K] [line 434]
!309 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!310 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!311 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!312 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!313 = metadata !{i32 436, i32 0, metadata !62, metadata !303}
!314 = metadata !{i32 322, i32 0, metadata !4, null}
!315 = metadata !{i32 323, i32 0, metadata !4, null}
!316 = metadata !{i32 325, i32 0, metadata !317, null}
!317 = metadata !{i32 786443, metadata !1, metadata !4, i32 325, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!318 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [N] [line 434]
!319 = metadata !{i32 333, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !4, i32 333, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!321 = metadata !{i32 434, i32 0, metadata !62, metadata !319}
!322 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [J] [line 434]
!323 = metadata !{i64 3}
!324 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [K] [line 434]
!325 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!326 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!327 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!328 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!329 = metadata !{i32 436, i32 0, metadata !62, metadata !319}
!330 = metadata !{double 7.500000e-01}
!331 = metadata !{i32 341, i32 0, metadata !4, null}
!332 = metadata !{i32 343, i32 0, metadata !333, null}
!333 = metadata !{i32 786443, metadata !1, metadata !4, i32 343, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!334 = metadata !{i32 344, i32 0, metadata !333, null}
!335 = metadata !{i32 347, i32 0, metadata !336, null}
!336 = metadata !{i32 786443, metadata !1, metadata !4, i32 347, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!337 = metadata !{i32 786689, metadata !62, metadata !"N", metadata !5, i32 16777650, metadata !16, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [N] [line 434]
!338 = metadata !{i32 434, i32 0, metadata !62, metadata !335}
!339 = metadata !{i32 786689, metadata !62, metadata !"J", metadata !5, i32 33554866, metadata !16, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [J] [line 434]
!340 = metadata !{i32 786689, metadata !62, metadata !"K", metadata !5, i32 50332082, metadata !16, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [K] [line 434]
!341 = metadata !{i32 786689, metadata !62, metadata !"X1", metadata !5, i32 67109298, metadata !28, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!342 = metadata !{i32 786689, metadata !62, metadata !"X2", metadata !5, i32 83886514, metadata !28, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!343 = metadata !{i32 786689, metadata !62, metadata !"X3", metadata !5, i32 100663730, metadata !28, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!344 = metadata !{i32 786689, metadata !62, metadata !"X4", metadata !5, i32 117440946, metadata !28, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!345 = metadata !{i32 436, i32 0, metadata !62, metadata !335}
!346 = metadata !{i32 2}
!347 = metadata !{i32 355, i32 0, metadata !348, null}
!348 = metadata !{i32 786443, metadata !1, metadata !4, i32 355, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!349 = metadata !{i32 363, i32 0, metadata !4, null}
!350 = metadata !{i32 374, i32 0, metadata !4, null}
!351 = metadata !{i32 394, i32 0, metadata !4, null}
!352 = metadata !{i32 434, i32 0, metadata !62, null}
!353 = metadata !{i32 436, i32 0, metadata !62, null}
!354 = metadata !{i32 438, i32 0, metadata !62, null}
!355 = metadata !{i32 397, i32 0, metadata !44, null}
!356 = metadata !{i32 399, i32 0, metadata !44, null}
!357 = metadata !{i32 402, i32 0, metadata !44, null}
!358 = metadata !{i32 403, i32 0, metadata !44, null}
!359 = metadata !{i32 404, i32 0, metadata !44, null}
!360 = metadata !{i32 405, i32 0, metadata !44, null}
!361 = metadata !{i32 406, i32 0, metadata !44, null}
!362 = metadata !{i32 408, i32 0, metadata !363, null}
!363 = metadata !{i32 786443, metadata !1, metadata !44, i32 408, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!364 = metadata !{i32 410, i32 0, metadata !44, null}
!365 = metadata !{i32 421, i32 0, metadata !53, null}
!366 = metadata !{i32 425, i32 0, metadata !53, null}
!367 = metadata !{i32 426, i32 0, metadata !53, null}
!368 = metadata !{i32 427, i32 0, metadata !53, null}
!369 = metadata !{i32 428, i32 0, metadata !53, null}
!370 = metadata !{i32 429, i32 0, metadata !53, null}
!371 = metadata !{i32 430, i32 0, metadata !53, null}
!372 = metadata !{i32 415, i32 0, metadata !50, null}
!373 = metadata !{i32 416, i32 0, metadata !50, null}
!374 = metadata !{i32 417, i32 0, metadata !50, null}
!375 = metadata !{i32 418, i32 0, metadata !50, null}
