; ModuleID = 'ffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !77, i64 0, metadata !15), !dbg !78
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !16), !dbg !80
  tail call void @llvm.dbg.value(metadata !81, i64 0, metadata !20), !dbg !82
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !22), !dbg !84
  store i32 256, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 2), align 4, !dbg !85, !tbaa !86
  store i32 256, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 1), align 4, !dbg !85, !tbaa !86
  %1 = tail call noalias i8* @malloc(i64 1048592) #3, !dbg !90
  %2 = bitcast i8* %1 to double*, !dbg !90
  tail call void @llvm.dbg.value(metadata !{double* %2}, i64 0, metadata !17), !dbg !90
  %3 = icmp eq i8* %1, null, !dbg !91
  br i1 %3, label %4, label %7, !dbg !91

; <label>:4                                       ; preds = %0
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !93, !tbaa !95
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %5) #5, !dbg !93
  tail call void @exit(i32 1) #6, !dbg !97
  unreachable, !dbg !97

; <label>:7                                       ; preds = %0
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 1048592, i32 8, i1 false), !dbg !98
  tail call void @llvm.dbg.value(metadata !99, i64 0, metadata !10), !dbg !100
  br label %.preheader4, !dbg !100

.preheader4:                                      ; preds = %.us-lcssa17.us, %7
  %indvars.iv35 = phi i64 [ 0, %7 ], [ %indvars.iv.next36, %.us-lcssa17.us ]
  %8 = and i64 %indvars.iv35, 15, !dbg !102
  %9 = icmp eq i64 %8, 8, !dbg !102
  %10 = shl i64 %indvars.iv35, 8, !dbg !107
  br i1 %9, label %vector.body, label %.preheader4..preheader4.split_crit_edge

vector.body:                                      ; preds = %.preheader4, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader4 ], !dbg !108
  %induction4546 = or i64 %index, 1
  %11 = add nsw i64 %index, %10, !dbg !107
  %12 = add nsw i64 %induction4546, %10, !dbg !107
  %13 = shl nsw i64 %11, 1, !dbg !107
  %14 = shl nsw i64 %12, 1, !dbg !107
  %15 = or i64 %13, 1, !dbg !107
  %16 = or i64 %14, 1, !dbg !107
  %17 = getelementptr inbounds double* %2, i64 %15, !dbg !107
  %18 = getelementptr inbounds double* %2, i64 %16, !dbg !107
  store double 1.280000e+02, double* %17, align 8, !dbg !107, !tbaa !109
  store double 1.280000e+02, double* %18, align 8, !dbg !107, !tbaa !109
  %index.next = add i64 %index, 2, !dbg !108
  %19 = icmp eq i64 %index.next, 256, !dbg !108
  br i1 %19, label %.us-lcssa17.us, label %vector.body, !dbg !108, !llvm.loop !111

.preheader4..preheader4.split_crit_edge:          ; preds = %.preheader4, %27
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %27 ], [ 0, %.preheader4 ]
  %20 = and i64 %indvars.iv29, 15, !dbg !102
  %21 = icmp eq i64 %20, 8, !dbg !102
  br i1 %21, label %22, label %27, !dbg !102

; <label>:22                                      ; preds = %.preheader4..preheader4.split_crit_edge
  %23 = add nsw i64 %indvars.iv29, %10, !dbg !107
  %24 = shl nsw i64 %23, 1, !dbg !107
  %25 = or i64 %24, 1, !dbg !107
  %26 = getelementptr inbounds double* %2, i64 %25, !dbg !107
  store double 1.280000e+02, double* %26, align 8, !dbg !107, !tbaa !109
  br label %27, !dbg !107

; <label>:27                                      ; preds = %.preheader4..preheader4.split_crit_edge, %22
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !108
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 256, !dbg !108
  br i1 %exitcond31, label %.us-lcssa17.us, label %.preheader4..preheader4.split_crit_edge, !dbg !108

.us-lcssa17.us:                                   ; preds = %27, %vector.body
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1, !dbg !100
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 256, !dbg !100
  br i1 %exitcond37, label %.preheader3, label %.preheader4, !dbg !100

.preheader3:                                      ; preds = %.us-lcssa17.us, %.preheader3
  %i.115 = phi i32 [ %28, %.preheader3 ], [ 0, %.us-lcssa17.us ]
  tail call fastcc void @fourn(double* %2, i32 1), !dbg !114
  tail call fastcc void @fourn(double* %2, i32 -1), !dbg !117
  %28 = add nsw i32 %i.115, 1, !dbg !118
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !10), !dbg !118
  %exitcond28 = icmp eq i32 %28, 63, !dbg !118
  br i1 %exitcond28, label %.preheader2, label %.preheader3, !dbg !118

.preheader2:                                      ; preds = %.preheader3, %.preheader2
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %.preheader2 ], [ 1, %.preheader3 ]
  %rmax.011 = phi double [ %34, %.preheader2 ], [ -1.000000e+10, %.preheader3 ]
  %rmin.010 = phi double [ %32, %.preheader2 ], [ 1.000000e+10, %.preheader3 ]
  %29 = getelementptr inbounds double* %2, i64 %indvars.iv26, !dbg !119
  %30 = load double* %29, align 8, !dbg !119, !tbaa !109
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !29), !dbg !119
  %31 = fcmp ole double %30, %rmin.010, !dbg !122
  %32 = select i1 %31, double %30, double %rmin.010, !dbg !122
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !25), !dbg !122
  %33 = fcmp ogt double %30, %rmax.011, !dbg !123
  %34 = select i1 %33, double %30, double %rmax.011, !dbg !123
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !26), !dbg !123
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 2, !dbg !124
  %35 = trunc i64 %indvars.iv.next27 to i32, !dbg !124
  %36 = icmp slt i32 %35, 65537, !dbg !124
  br i1 %36, label %.preheader2, label %37, !dbg !124

; <label>:37                                      ; preds = %.preheader2
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !23), !dbg !125
  %38 = fsub double %34, %32, !dbg !126
  %39 = fdiv double 2.550000e+02, %38, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !24), !dbg !126
  tail call void @llvm.dbg.value(metadata !99, i64 0, metadata !14), !dbg !127
  tail call void @llvm.dbg.value(metadata !99, i64 0, metadata !10), !dbg !128
  br label %.preheader, !dbg !128

.preheader:                                       ; preds = %.us-lcssa.us, %37
  %indvars.iv23 = phi i64 [ 0, %37 ], [ %indvars.iv.next24, %.us-lcssa.us ]
  %m.07 = phi i32 [ 0, %37 ], [ %m.1.lcssa, %.us-lcssa.us ]
  %40 = shl i64 %indvars.iv23, 8, !dbg !130
  %41 = trunc i64 %indvars.iv23 to i32, !dbg !134
  %42 = and i32 %41, 15, !dbg !134
  %43 = icmp eq i32 %42, 8, !dbg !134
  br i1 %43, label %.preheader39, label %.preheader40

.preheader39:                                     ; preds = %.preheader, %58
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %58 ], [ 0, %.preheader ]
  %m.15.us = phi i32 [ %m.2.us, %58 ], [ %m.07, %.preheader ]
  %44 = add nsw i64 %indvars.iv20, %40, !dbg !130
  %45 = shl nsw i64 %44, 1, !dbg !130
  %46 = or i64 %45, 1, !dbg !130
  %47 = getelementptr inbounds double* %2, i64 %46, !dbg !130
  %48 = load double* %47, align 8, !dbg !130, !tbaa !109
  %49 = fsub double %48, %32, !dbg !130
  %50 = fmul double %39, %49, !dbg !130
  %51 = fptosi double %50 to i32, !dbg !130
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !12), !dbg !130
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !13), !dbg !134
  %52 = icmp eq i32 %51, 255, !dbg !136
  br i1 %52, label %58, label %53, !dbg !136

; <label>:53                                      ; preds = %.preheader39
  %54 = add nsw i32 %m.15.us, 1, !dbg !138
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !14), !dbg !138
  %55 = load %struct._IO_FILE** @stderr, align 8, !dbg !140, !tbaa !95
  %56 = trunc i64 %indvars.iv20 to i32, !dbg !140
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([48 x i8]* @.str1, i64 0, i64 0), i32 %41, i32 %56, i32 255, i32 %51) #7, !dbg !140
  br label %58, !dbg !141

; <label>:58                                      ; preds = %53, %.preheader39
  %m.2.us = phi i32 [ %54, %53 ], [ %m.15.us, %.preheader39 ]
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1, !dbg !142
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 256, !dbg !142
  br i1 %exitcond22, label %.us-lcssa.us, label %.preheader39, !dbg !142

.preheader40:                                     ; preds = %.preheader, %75
  %indvars.iv = phi i64 [ %indvars.iv.next, %75 ], [ 0, %.preheader ]
  %m.15 = phi i32 [ %m.2, %75 ], [ %m.07, %.preheader ]
  %59 = add nsw i64 %indvars.iv, %40, !dbg !130
  %60 = shl nsw i64 %59, 1, !dbg !130
  %61 = or i64 %60, 1, !dbg !130
  %62 = getelementptr inbounds double* %2, i64 %61, !dbg !130
  %63 = load double* %62, align 8, !dbg !130, !tbaa !109
  %64 = fsub double %63, %32, !dbg !130
  %65 = fmul double %39, %64, !dbg !130
  %66 = fptosi double %65 to i32, !dbg !130
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !12), !dbg !130
  %67 = and i64 %indvars.iv, 15, !dbg !134
  %68 = icmp eq i64 %67, 8, !dbg !134
  %phitmp = select i1 %68, i32 255, i32 0, !dbg !134
  tail call void @llvm.dbg.value(metadata !{i32 %phitmp}, i64 0, metadata !13), !dbg !134
  %69 = icmp eq i32 %66, %phitmp, !dbg !136
  br i1 %69, label %75, label %70, !dbg !136

; <label>:70                                      ; preds = %.preheader40
  %71 = add nsw i32 %m.15, 1, !dbg !138
  tail call void @llvm.dbg.value(metadata !{i32 %71}, i64 0, metadata !14), !dbg !138
  %72 = load %struct._IO_FILE** @stderr, align 8, !dbg !140, !tbaa !95
  %73 = trunc i64 %indvars.iv to i32, !dbg !140
  %74 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([48 x i8]* @.str1, i64 0, i64 0), i32 %41, i32 %73, i32 %phitmp, i32 %66) #7, !dbg !140
  br label %75, !dbg !141

; <label>:75                                      ; preds = %.preheader40, %70
  %m.2 = phi i32 [ %71, %70 ], [ %m.15, %.preheader40 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !142
  %exitcond = icmp eq i64 %indvars.iv.next, 256, !dbg !142
  br i1 %exitcond, label %.us-lcssa.us, label %.preheader40, !dbg !142

.us-lcssa.us:                                     ; preds = %75, %58
  %m.1.lcssa = phi i32 [ %m.2.us, %58 ], [ %m.2, %75 ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !128
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 256, !dbg !128
  br i1 %exitcond25, label %76, label %.preheader, !dbg !128

; <label>:76                                      ; preds = %.us-lcssa.us
  %77 = icmp eq i32 %m.1.lcssa, 0, !dbg !143
  %78 = load %struct._IO_FILE** @stderr, align 8, !dbg !145, !tbaa !95
  br i1 %77, label %79, label %81, !dbg !143

; <label>:79                                      ; preds = %76
  %80 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([35 x i8]* @.str2, i64 0, i64 0), i32 63) #7, !dbg !145
  br label %83, !dbg !147

; <label>:81                                      ; preds = %76
  %82 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([35 x i8]* @.str3, i64 0, i64 0), i32 63, i32 %m.1.lcssa) #7, !dbg !148
  br label %83

; <label>:83                                      ; preds = %81, %79
  ret i32 0, !dbg !150
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @fourn(double* nocapture %data, i32 %isign) #0 {
.preheader642:
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !40), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !41), !dbg !152
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !60), !dbg !155
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !54), !dbg !156
  %0 = load i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 1), align 4, !dbg !158, !tbaa !86
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !60), !dbg !158
  %1 = load i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 2), align 4, !dbg !158, !tbaa !86
  %2 = mul nsw i32 %1, %0, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !60), !dbg !158
  %3 = sitofp i32 %isign to double, !dbg !159
  %4 = fmul double %3, 0x401921FB54442D1C, !dbg !159
  br label %5, !dbg !163

; <label>:5                                       ; preds = %._crit_edge43, %.preheader642
  %6 = phi i32 [ %1, %.preheader642 ], [ %.pre, %._crit_edge43 ]
  %indvars.iv38 = phi i64 [ 1, %.preheader642 ], [ %phitmp, %._crit_edge43 ]
  %nprev.025 = phi i32 [ 1, %.preheader642 ], [ %7, %._crit_edge43 ]
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !57), !dbg !164
  %7 = mul nsw i32 %6, %nprev.025, !dbg !165
  %8 = sdiv i32 %2, %7, !dbg !165
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !59), !dbg !165
  %9 = shl i32 %nprev.025, 1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !48), !dbg !166
  %10 = mul nsw i32 %6, %9, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !49), !dbg !167
  %11 = mul nsw i32 %10, %8, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !50), !dbg !168
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !46), !dbg !169
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !44), !dbg !170
  %12 = icmp slt i32 %10, 1, !dbg !170
  br i1 %12, label %.preheader5, label %.lr.ph12, !dbg !170

.lr.ph12:                                         ; preds = %5
  %13 = add i32 %9, -2, !dbg !172
  %14 = shl i32 %nprev.025, 1, !dbg !170
  %15 = sext i32 %14 to i64
  %16 = mul i32 %14, %6, !dbg !170
  %17 = sext i32 %16 to i64
  br label %21, !dbg !170

.preheader5:                                      ; preds = %47, %5
  %18 = icmp slt i32 %9, %10, !dbg !177
  br i1 %18, label %.lr.ph22, label %._crit_edge23, !dbg !177

.lr.ph22:                                         ; preds = %.preheader5
  %19 = shl i32 %nprev.025, 1, !dbg !177
  %20 = sext i32 %19 to i64
  br label %52, !dbg !177

; <label>:21                                      ; preds = %.lr.ph12, %47
  %indvars.iv = phi i64 [ 1, %.lr.ph12 ], [ %indvars.iv.next, %47 ]
  %i2.010 = phi i32 [ 1, %.lr.ph12 ], [ %49, %47 ]
  %i2rev.09 = phi i32 [ 1, %.lr.ph12 ], [ %48, %47 ]
  %22 = icmp sgt i32 %i2rev.09, %i2.010, !dbg !178
  br i1 %22, label %.preheader4, label %.preheader3, !dbg !178

.preheader4:                                      ; preds = %21
  %23 = add i32 %13, %i2.010, !dbg !172
  %24 = icmp sgt i32 %i2.010, %23, !dbg !172
  br i1 %24, label %.preheader3, label %.preheader2.lr.ph, !dbg !172

.preheader2.lr.ph:                                ; preds = %.preheader4
  %25 = sub i32 %i2rev.09, %i2.010, !dbg !179
  br label %.preheader2, !dbg !172

.preheader2:                                      ; preds = %.preheader2.lr.ph, %._crit_edge
  %indvars.iv28 = phi i64 [ %indvars.iv, %.preheader2.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %i1.08 = phi i32 [ %i2.010, %.preheader2.lr.ph ], [ %43, %._crit_edge ]
  %26 = icmp sgt i32 %i1.08, %11, !dbg !183
  br i1 %26, label %._crit_edge, label %.lr.ph, !dbg !183

.lr.ph:                                           ; preds = %.preheader2, %.lr.ph
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %.lr.ph ], [ %indvars.iv28, %.preheader2 ]
  %i3.07 = phi i32 [ %41, %.lr.ph ], [ %i1.08, %.preheader2 ]
  %27 = trunc i64 %indvars.iv30 to i32, !dbg !179
  %28 = add i32 %25, %27, !dbg !179
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !47), !dbg !179
  %29 = getelementptr inbounds double* %data, i64 %indvars.iv30, !dbg !184
  %30 = load double* %29, align 8, !dbg !184, !tbaa !109
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !62), !dbg !184
  %31 = sext i32 %28 to i64, !dbg !184
  %32 = getelementptr inbounds double* %data, i64 %31, !dbg !184
  %33 = load double* %32, align 8, !dbg !184, !tbaa !109
  store double %33, double* %29, align 8, !dbg !184, !tbaa !109
  store double %30, double* %32, align 8, !dbg !184, !tbaa !109
  %34 = add nsw i64 %indvars.iv30, 1, !dbg !185
  %35 = getelementptr inbounds double* %data, i64 %34, !dbg !185
  %36 = load double* %35, align 8, !dbg !185, !tbaa !109
  tail call void @llvm.dbg.value(metadata !{double %36}, i64 0, metadata !62), !dbg !185
  %37 = add nsw i32 %28, 1, !dbg !185
  %38 = sext i32 %37 to i64, !dbg !185
  %39 = getelementptr inbounds double* %data, i64 %38, !dbg !185
  %40 = load double* %39, align 8, !dbg !185, !tbaa !109
  store double %40, double* %35, align 8, !dbg !185, !tbaa !109
  store double %36, double* %39, align 8, !dbg !185, !tbaa !109
  %41 = add nsw i32 %i3.07, %10, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !45), !dbg !183
  %42 = icmp sgt i32 %41, %11, !dbg !183
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, %17, !dbg !183
  br i1 %42, label %._crit_edge, label %.lr.ph, !dbg !183

._crit_edge:                                      ; preds = %.lr.ph, %.preheader2
  %43 = add nsw i32 %i1.08, 2, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !43), !dbg !172
  %44 = icmp sgt i32 %43, %23, !dbg !172
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, 2, !dbg !172
  br i1 %44, label %.preheader3, label %.preheader2, !dbg !172

.preheader3:                                      ; preds = %21, %.preheader4, %._crit_edge, %.preheader3
  %ibit.0.in = phi i32 [ %ibit.0, %.preheader3 ], [ %10, %._crit_edge ], [ %10, %.preheader4 ], [ %10, %21 ]
  %i2rev.1 = phi i32 [ %46, %.preheader3 ], [ %i2rev.09, %._crit_edge ], [ %i2rev.09, %.preheader4 ], [ %i2rev.09, %21 ]
  %ibit.0 = ashr i32 %ibit.0.in, 1, !dbg !186
  %45 = icmp sgt i32 %i2rev.1, %ibit.0, !dbg !187
  %not. = icmp sge i32 %ibit.0, %9, !dbg !187
  %. = and i1 %45, %not., !dbg !187
  %46 = sub nsw i32 %i2rev.1, %ibit.0, !dbg !188
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !46), !dbg !188
  br i1 %., label %.preheader3, label %47

; <label>:47                                      ; preds = %.preheader3
  %48 = add nsw i32 %i2rev.1, %ibit.0, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !46), !dbg !190
  %49 = add nsw i32 %i2.010, %9, !dbg !170
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !44), !dbg !170
  %50 = icmp sgt i32 %49, %10, !dbg !170
  %indvars.iv.next = add nsw i64 %indvars.iv, %15, !dbg !170
  br i1 %50, label %.preheader5, label %21, !dbg !170

.loopexit:                                        ; preds = %._crit_edge17, %52
  %51 = icmp slt i32 %53, %10, !dbg !177
  br i1 %51, label %52, label %._crit_edge23, !dbg !177

; <label>:52                                      ; preds = %.lr.ph22, %.loopexit
  %ifp1.021 = phi i32 [ %9, %.lr.ph22 ], [ %53, %.loopexit ]
  %53 = shl i32 %ifp1.021, 1, !dbg !191
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !52), !dbg !191
  %54 = sdiv i32 %53, %9, !dbg !159
  %55 = sitofp i32 %54 to double, !dbg !159
  %56 = fdiv double %4, %55, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %56}, i64 0, metadata !63), !dbg !159
  %57 = fmul double %56, 5.000000e-01, !dbg !192
  %58 = tail call double @sin(double %57) #3, !dbg !192
  tail call void @llvm.dbg.value(metadata !{double %58}, i64 0, metadata !68), !dbg !192
  %59 = fmul double %58, -2.000000e+00, !dbg !193
  %60 = fmul double %58, %59, !dbg !193
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !66), !dbg !193
  %61 = tail call double @sin(double %56) #3, !dbg !194
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !65), !dbg !194
  tail call void @llvm.dbg.value(metadata !195, i64 0, metadata !67), !dbg !196
  tail call void @llvm.dbg.value(metadata !197, i64 0, metadata !64), !dbg !198
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !45), !dbg !199
  %62 = icmp slt i32 %ifp1.021, 1, !dbg !199
  br i1 %62, label %.loopexit, label %.preheader1.lr.ph, !dbg !199

.preheader1.lr.ph:                                ; preds = %52
  %63 = shl i32 %ifp1.021, 1, !dbg !199
  %64 = sext i32 %63 to i64
  %65 = sext i32 %ifp1.021 to i64, !dbg !199
  br label %.preheader1, !dbg !199

.preheader1:                                      ; preds = %.preheader1.lr.ph, %._crit_edge17
  %indvars.iv32 = phi i64 [ 1, %.preheader1.lr.ph ], [ %indvars.iv.next33, %._crit_edge17 ]
  %wr.020 = phi double [ 1.000000e+00, %.preheader1.lr.ph ], [ %102, %._crit_edge17 ]
  %wi.019 = phi double [ 0.000000e+00, %.preheader1.lr.ph ], [ %106, %._crit_edge17 ]
  %i3.118 = phi i32 [ 1, %.preheader1.lr.ph ], [ %66, %._crit_edge17 ]
  %66 = add nsw i32 %i3.118, %9, !dbg !201
  %67 = add nsw i32 %66, -2, !dbg !201
  %68 = icmp sgt i32 %i3.118, %67, !dbg !201
  br i1 %68, label %._crit_edge17, label %.preheader, !dbg !201

.preheader:                                       ; preds = %.preheader1, %._crit_edge15
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge15 ], [ %indvars.iv32, %.preheader1 ]
  %i1.116 = phi i32 [ %97, %._crit_edge15 ], [ %i3.118, %.preheader1 ]
  %69 = icmp sgt i32 %i1.116, %11, !dbg !204
  br i1 %69, label %._crit_edge15, label %.lr.ph14, !dbg !204

.lr.ph14:                                         ; preds = %.preheader, %.lr.ph14
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %.lr.ph14 ], [ %indvars.iv34, %.preheader ]
  %i2.113 = phi i32 [ %95, %.lr.ph14 ], [ %i1.116, %.preheader ]
  tail call void @llvm.dbg.value(metadata !{i32 %i2.113}, i64 0, metadata !55), !dbg !207
  %70 = add nsw i64 %indvars.iv36, %65, !dbg !209
  %71 = getelementptr inbounds double* %data, i64 %70, !dbg !210
  %72 = load double* %71, align 8, !dbg !210, !tbaa !109
  %73 = fmul double %wr.020, %72, !dbg !210
  %74 = add nsw i64 %70, 1, !dbg !210
  %75 = getelementptr inbounds double* %data, i64 %74, !dbg !210
  %76 = load double* %75, align 8, !dbg !210, !tbaa !109
  %77 = fmul double %wi.019, %76, !dbg !210
  %78 = fsub double %73, %77, !dbg !210
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !62), !dbg !210
  %79 = fmul double %wr.020, %76, !dbg !211
  %80 = fmul double %wi.019, %72, !dbg !211
  %81 = fadd double %80, %79, !dbg !211
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !61), !dbg !211
  %82 = getelementptr inbounds double* %data, i64 %indvars.iv36, !dbg !212
  %83 = load double* %82, align 8, !dbg !212, !tbaa !109
  %84 = fsub double %83, %78, !dbg !212
  store double %84, double* %71, align 8, !dbg !212, !tbaa !109
  %85 = add nsw i64 %indvars.iv36, 1, !dbg !213
  %86 = getelementptr inbounds double* %data, i64 %85, !dbg !213
  %87 = load double* %86, align 8, !dbg !213, !tbaa !109
  %88 = fsub double %87, %81, !dbg !213
  store double %88, double* %75, align 8, !dbg !213, !tbaa !109
  %89 = bitcast double* %82 to <2 x double>*, !dbg !214
  %90 = load <2 x double>* %89, align 8, !dbg !214, !tbaa !109
  %91 = insertelement <2 x double> undef, double %78, i32 0, !dbg !214
  %92 = insertelement <2 x double> %91, double %81, i32 1, !dbg !214
  %93 = fadd <2 x double> %92, %90, !dbg !214
  %94 = bitcast double* %82 to <2 x double>*, !dbg !214
  store <2 x double> %93, <2 x double>* %94, align 8, !dbg !214, !tbaa !109
  %95 = add nsw i32 %i2.113, %53, !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !44), !dbg !204
  %96 = icmp sgt i32 %95, %11, !dbg !204
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, %64, !dbg !204
  br i1 %96, label %._crit_edge15, label %.lr.ph14, !dbg !204

._crit_edge15:                                    ; preds = %.lr.ph14, %.preheader
  %97 = add nsw i32 %i1.116, 2, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i32 %97}, i64 0, metadata !43), !dbg !201
  %98 = icmp sgt i32 %97, %67, !dbg !201
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 2, !dbg !201
  br i1 %98, label %._crit_edge17, label %.preheader, !dbg !201

._crit_edge17:                                    ; preds = %._crit_edge15, %.preheader1
  tail call void @llvm.dbg.value(metadata !{double %wr.020}, i64 0, metadata !68), !dbg !215
  %99 = fmul double %60, %wr.020, !dbg !215
  %100 = fmul double %61, %wi.019, !dbg !215
  %101 = fsub double %99, %100, !dbg !215
  %102 = fadd double %wr.020, %101, !dbg !215
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !67), !dbg !215
  %103 = fmul double %60, %wi.019, !dbg !216
  %104 = fmul double %61, %wr.020, !dbg !216
  %105 = fadd double %103, %104, !dbg !216
  %106 = fadd double %wi.019, %105, !dbg !216
  tail call void @llvm.dbg.value(metadata !{double %106}, i64 0, metadata !64), !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !45), !dbg !199
  %107 = icmp sgt i32 %66, %ifp1.021, !dbg !199
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, %20, !dbg !199
  br i1 %107, label %.loopexit, label %.preheader1, !dbg !199

._crit_edge23:                                    ; preds = %.loopexit, %.preheader5
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !58), !dbg !217
  %108 = trunc i64 %indvars.iv38 to i32, !dbg !163
  %109 = icmp sgt i32 %108, 0, !dbg !163
  br i1 %109, label %._crit_edge43, label %110, !dbg !163

._crit_edge43:                                    ; preds = %._crit_edge23
  %.phi.trans.insert = getelementptr inbounds [3 x i32]* @main.nsize, i64 0, i64 %indvars.iv38
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !164, !tbaa !86
  %phitmp = add i64 %indvars.iv38, -1, !dbg !163
  br label %5, !dbg !163

; <label>:110                                     ; preds = %._crit_edge23
  ret void, !dbg !218
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }
attributes #7 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!74, !75}
!llvm.ident = !{!76}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !69, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ffbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !34}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 227, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !9, i32 228} ; [ DW_TAG_subprogram ] [line 227] [def] [scope 228] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !20, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !31, metadata !32, metadata !33}
!10 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 229]
!11 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 229]
!12 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 229]
!13 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 229]
!14 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 229]
!15 = metadata !{i32 786688, metadata !4, metadata !"npasses", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [npasses] [line 229]
!16 = metadata !{i32 786688, metadata !4, metadata !"faedge", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [faedge] [line 229]
!17 = metadata !{i32 786688, metadata !4, metadata !"fdata", metadata !5, i32 230, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fdata] [line 230]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!20 = metadata !{i32 786688, metadata !4, metadata !"fanum", metadata !5, i32 232, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fanum] [line 232]
!21 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!22 = metadata !{i32 786688, metadata !4, metadata !"fasize", metadata !5, i32 232, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fasize] [line 232]
!23 = metadata !{i32 786688, metadata !4, metadata !"mapbase", metadata !5, i32 233, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mapbase] [line 233]
!24 = metadata !{i32 786688, metadata !4, metadata !"mapscale", metadata !5, i32 233, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mapscale] [line 233]
!25 = metadata !{i32 786688, metadata !4, metadata !"rmin", metadata !5, i32 233, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rmin] [line 233]
!26 = metadata !{i32 786688, metadata !4, metadata !"rmax", metadata !5, i32 233, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rmax] [line 233]
!27 = metadata !{i32 786688, metadata !4, metadata !"imin", metadata !5, i32 233, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imin] [line 233]
!28 = metadata !{i32 786688, metadata !4, metadata !"imax", metadata !5, i32 233, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 233]
!29 = metadata !{i32 786688, metadata !30, metadata !"r", metadata !5, i32 269, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 269]
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 268, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!31 = metadata !{i32 786688, metadata !30, metadata !"ij", metadata !5, i32 269, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ij] [line 269]
!32 = metadata !{i32 786688, metadata !30, metadata !"ar", metadata !5, i32 269, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ar] [line 269]
!33 = metadata !{i32 786688, metadata !30, metadata !"ai", metadata !5, i32 269, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ai] [line 269]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fourn", metadata !"fourn", metadata !"", i32 157, metadata !35, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (double*, i32)* @fourn, null, null, metadata !38, i32 160} ; [ DW_TAG_subprogram ] [line 157] [local] [def] [scope 160] [fourn]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{null, metadata !18, metadata !37, metadata !8, metadata !8}
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!38 = metadata !{metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68}
!39 = metadata !{i32 786689, metadata !34, metadata !"data", metadata !5, i32 16777374, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 158]
!40 = metadata !{i32 786689, metadata !34, metadata !"nn", metadata !5, i32 33554591, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 159]
!41 = metadata !{i32 786689, metadata !34, metadata !"ndim", metadata !5, i32 50331807, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ndim] [line 159]
!42 = metadata !{i32 786689, metadata !34, metadata !"isign", metadata !5, i32 67109023, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [isign] [line 159]
!43 = metadata !{i32 786688, metadata !34, metadata !"i1", metadata !5, i32 161, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i1] [line 161]
!44 = metadata !{i32 786688, metadata !34, metadata !"i2", metadata !5, i32 161, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i2] [line 161]
!45 = metadata !{i32 786688, metadata !34, metadata !"i3", metadata !5, i32 161, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i3] [line 161]
!46 = metadata !{i32 786688, metadata !34, metadata !"i2rev", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i2rev] [line 162]
!47 = metadata !{i32 786688, metadata !34, metadata !"i3rev", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i3rev] [line 162]
!48 = metadata !{i32 786688, metadata !34, metadata !"ip1", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip1] [line 162]
!49 = metadata !{i32 786688, metadata !34, metadata !"ip2", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip2] [line 162]
!50 = metadata !{i32 786688, metadata !34, metadata !"ip3", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip3] [line 162]
!51 = metadata !{i32 786688, metadata !34, metadata !"ifp1", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ifp1] [line 162]
!52 = metadata !{i32 786688, metadata !34, metadata !"ifp2", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ifp2] [line 162]
!53 = metadata !{i32 786688, metadata !34, metadata !"ibit", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ibit] [line 163]
!54 = metadata !{i32 786688, metadata !34, metadata !"idim", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idim] [line 163]
!55 = metadata !{i32 786688, metadata !34, metadata !"k1", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 163]
!56 = metadata !{i32 786688, metadata !34, metadata !"k2", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k2] [line 163]
!57 = metadata !{i32 786688, metadata !34, metadata !"n", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 163]
!58 = metadata !{i32 786688, metadata !34, metadata !"nprev", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nprev] [line 163]
!59 = metadata !{i32 786688, metadata !34, metadata !"nrem", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nrem] [line 163]
!60 = metadata !{i32 786688, metadata !34, metadata !"ntot", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ntot] [line 163]
!61 = metadata !{i32 786688, metadata !34, metadata !"tempi", metadata !5, i32 164, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tempi] [line 164]
!62 = metadata !{i32 786688, metadata !34, metadata !"tempr", metadata !5, i32 164, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tempr] [line 164]
!63 = metadata !{i32 786688, metadata !34, metadata !"theta", metadata !5, i32 165, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 165]
!64 = metadata !{i32 786688, metadata !34, metadata !"wi", metadata !5, i32 165, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wi] [line 165]
!65 = metadata !{i32 786688, metadata !34, metadata !"wpi", metadata !5, i32 165, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wpi] [line 165]
!66 = metadata !{i32 786688, metadata !34, metadata !"wpr", metadata !5, i32 165, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wpr] [line 165]
!67 = metadata !{i32 786688, metadata !34, metadata !"wr", metadata !5, i32 165, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wr] [line 165]
!68 = metadata !{i32 786688, metadata !34, metadata !"wtemp", metadata !5, i32 165, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wtemp] [line 165]
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786484, i32 0, metadata !4, metadata !"nsize", metadata !"nsize", metadata !"", metadata !5, i32 231, metadata !71, i32 1, i32 1, [3 x i32]* @main.nsize, null} ; [ DW_TAG_variable ] [nsize] [line 231] [local] [def]
!71 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 96, i64 32, i32 0, i32 0, metadata !8, metadata !72, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!74 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!75 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!76 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!77 = metadata !{i32 63}
!78 = metadata !{i32 229, i32 0, metadata !4, null}
!79 = metadata !{i32 256}
!80 = metadata !{i32 235, i32 0, metadata !4, null}
!81 = metadata !{i64 65536}
!82 = metadata !{i32 236, i32 0, metadata !4, null}
!83 = metadata !{i64 1048592}
!84 = metadata !{i32 237, i32 0, metadata !4, null}
!85 = metadata !{i32 238, i32 0, metadata !4, null}
!86 = metadata !{metadata !87, metadata !87, i64 0}
!87 = metadata !{metadata !"int", metadata !88, i64 0}
!88 = metadata !{metadata !"omnipotent char", metadata !89, i64 0}
!89 = metadata !{metadata !"Simple C/C++ TBAA"}
!90 = metadata !{i32 240, i32 0, metadata !4, null}
!91 = metadata !{i32 241, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !4, i32 241, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!93 = metadata !{i32 242, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !92, i32 241, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!95 = metadata !{metadata !96, metadata !96, i64 0}
!96 = metadata !{metadata !"any pointer", metadata !88, i64 0}
!97 = metadata !{i32 243, i32 0, metadata !94, null}
!98 = metadata !{i32 251, i32 0, metadata !4, null}
!99 = metadata !{i32 0}
!100 = metadata !{i32 252, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !4, i32 252, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!102 = metadata !{i32 254, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !104, i32 254, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!104 = metadata !{i32 786443, metadata !1, metadata !105, i32 253, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!105 = metadata !{i32 786443, metadata !1, metadata !106, i32 253, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!106 = metadata !{i32 786443, metadata !1, metadata !101, i32 252, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!107 = metadata !{i32 255, i32 0, metadata !103, null}
!108 = metadata !{i32 253, i32 0, metadata !105, null}
!109 = metadata !{metadata !110, metadata !110, i64 0}
!110 = metadata !{metadata !"double", metadata !88, i64 0}
!111 = metadata !{metadata !111, metadata !112, metadata !113}
!112 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!113 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!114 = metadata !{i32 262, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !116, i32 259, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!116 = metadata !{i32 786443, metadata !1, metadata !4, i32 259, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!117 = metadata !{i32 265, i32 0, metadata !115, null}
!118 = metadata !{i32 259, i32 0, metadata !116, null}
!119 = metadata !{i32 276, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !121, i32 275, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!121 = metadata !{i32 786443, metadata !1, metadata !30, i32 275, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!122 = metadata !{i32 280, i32 0, metadata !120, null}
!123 = metadata !{i32 281, i32 0, metadata !120, null}
!124 = metadata !{i32 275, i32 0, metadata !121, null}
!125 = metadata !{i32 291, i32 0, metadata !30, null}
!126 = metadata !{i32 292, i32 0, metadata !30, null}
!127 = metadata !{i32 297, i32 0, metadata !4, null}
!128 = metadata !{i32 298, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !4, i32 298, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!130 = metadata !{i32 300, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !132, i32 299, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!132 = metadata !{i32 786443, metadata !1, metadata !133, i32 299, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!133 = metadata !{i32 786443, metadata !1, metadata !129, i32 298, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!134 = metadata !{i32 301, i32 0, metadata !131, null}
!135 = metadata !{i32 255}
!136 = metadata !{i32 302, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !131, i32 302, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!138 = metadata !{i32 303, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !137, i32 302, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!140 = metadata !{i32 304, i32 0, metadata !139, null}
!141 = metadata !{i32 307, i32 0, metadata !139, null}
!142 = metadata !{i32 299, i32 0, metadata !132, null}
!143 = metadata !{i32 310, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !4, i32 310, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!145 = metadata !{i32 311, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !144, i32 310, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!147 = metadata !{i32 312, i32 0, metadata !146, null}
!148 = metadata !{i32 313, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !144, i32 312, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!150 = metadata !{i32 360, i32 0, metadata !4, null}
!151 = metadata !{null}
!152 = metadata !{i32 159, i32 0, metadata !34, null}
!153 = metadata !{i32 2}
!154 = metadata !{i32 1}
!155 = metadata !{i32 167, i32 0, metadata !34, null}
!156 = metadata !{i32 168, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !34, i32 168, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!158 = metadata !{i32 169, i32 0, metadata !157, null}
!159 = metadata !{i32 198, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !161, i32 196, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!161 = metadata !{i32 786443, metadata !1, metadata !162, i32 171, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!162 = metadata !{i32 786443, metadata !1, metadata !34, i32 171, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!163 = metadata !{i32 171, i32 0, metadata !162, null}
!164 = metadata !{i32 172, i32 0, metadata !161, null}
!165 = metadata !{i32 173, i32 0, metadata !161, null}
!166 = metadata !{i32 174, i32 0, metadata !161, null}
!167 = metadata !{i32 175, i32 0, metadata !161, null}
!168 = metadata !{i32 176, i32 0, metadata !161, null}
!169 = metadata !{i32 177, i32 0, metadata !161, null}
!170 = metadata !{i32 178, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !161, i32 178, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!172 = metadata !{i32 180, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !174, i32 180, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!174 = metadata !{i32 786443, metadata !1, metadata !175, i32 179, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!175 = metadata !{i32 786443, metadata !1, metadata !176, i32 179, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!176 = metadata !{i32 786443, metadata !1, metadata !171, i32 178, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!177 = metadata !{i32 196, i32 0, metadata !161, null}
!178 = metadata !{i32 179, i32 0, metadata !175, null}
!179 = metadata !{i32 182, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !181, i32 181, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!181 = metadata !{i32 786443, metadata !1, metadata !182, i32 181, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!182 = metadata !{i32 786443, metadata !1, metadata !173, i32 180, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!183 = metadata !{i32 181, i32 0, metadata !181, null}
!184 = metadata !{i32 183, i32 0, metadata !180, null}
!185 = metadata !{i32 184, i32 0, metadata !180, null}
!186 = metadata !{i32 188, i32 0, metadata !176, null}
!187 = metadata !{i32 189, i32 0, metadata !176, null}
!188 = metadata !{i32 190, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !176, i32 189, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!190 = metadata !{i32 193, i32 0, metadata !176, null}
!191 = metadata !{i32 197, i32 0, metadata !160, null}
!192 = metadata !{i32 199, i32 0, metadata !160, null}
!193 = metadata !{i32 200, i32 0, metadata !160, null}
!194 = metadata !{i32 201, i32 0, metadata !160, null}
!195 = metadata !{double 1.000000e+00}
!196 = metadata !{i32 202, i32 0, metadata !160, null}
!197 = metadata !{double 0.000000e+00}
!198 = metadata !{i32 203, i32 0, metadata !160, null}
!199 = metadata !{i32 204, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !160, i32 204, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!201 = metadata !{i32 205, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !203, i32 205, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!203 = metadata !{i32 786443, metadata !1, metadata !200, i32 204, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!204 = metadata !{i32 206, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !206, i32 206, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!206 = metadata !{i32 786443, metadata !1, metadata !202, i32 205, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!207 = metadata !{i32 207, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !205, i32 206, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!209 = metadata !{i32 208, i32 0, metadata !208, null}
!210 = metadata !{i32 209, i32 0, metadata !208, null}
!211 = metadata !{i32 210, i32 0, metadata !208, null}
!212 = metadata !{i32 211, i32 0, metadata !208, null}
!213 = metadata !{i32 212, i32 0, metadata !208, null}
!214 = metadata !{i32 213, i32 0, metadata !208, null}
!215 = metadata !{i32 217, i32 0, metadata !203, null}
!216 = metadata !{i32 218, i32 0, metadata !203, null}
!217 = metadata !{i32 222, i32 0, metadata !161, null}
!218 = metadata !{i32 224, i32 0, metadata !34, null}
