; ModuleID = '2mm.o3.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@polybench_papi_counters_threadid = global i32 0, align 4
@polybench_program_total_flops = global double 0.000000e+00, align 8
@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str13 = private unnamed_addr constant [22 x i8] c"utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@.str3 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %0 = call i32 (i32, ...)* @init_PAPI(i32 15)
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #2
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #2
  %call4 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #2
  %call6 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #2
  %call8 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #2
  %arraydecay = bitcast i8* %call2 to [1024 x double]*
  %arraydecay10 = bitcast i8* %call6 to [1024 x double]*
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %entry
  %indvars.iv29.i = phi i64 [ 0, %entry ], [ %indvars.iv.next30.i, %for.inc8.i ]
  %1 = trunc i64 %indvars.iv29.i to i32
  %conv.i = sitofp i32 %1 to double
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ]
  %induction111162 = or i64 %index, 1
  %2 = trunc i64 %index to i32
  %induction113163 = or i32 %2, 1
  %3 = sitofp i32 %2 to double
  %4 = sitofp i32 %induction113163 to double
  %5 = fmul double %conv.i, %3
  %6 = fmul double %conv.i, %4
  %7 = fmul double %5, 9.765625e-04
  %8 = fmul double %6, 9.765625e-04
  %9 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %index
  %10 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %induction111162
  store double %7, double* %9, align 8, !tbaa !3
  store double %8, double* %10, align 8, !tbaa !3
  %index.next = add nuw nsw i64 %index, 2
  %induction111162.1 = or i64 %index.next, 1
  %11 = trunc i64 %index.next to i32
  %induction113163.1 = or i32 %11, 1
  %12 = sitofp i32 %11 to double
  %13 = sitofp i32 %induction113163.1 to double
  %14 = fmul double %conv.i, %12
  %15 = fmul double %conv.i, %13
  %16 = fmul double %14, 9.765625e-04
  %17 = fmul double %15, 9.765625e-04
  %18 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %index.next
  %19 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %induction111162.1
  store double %16, double* %18, align 8, !tbaa !3
  store double %17, double* %19, align 8, !tbaa !3
  %index.next.1 = add nuw nsw i64 %index.next, 2
  %20 = icmp eq i64 %index.next.1, 1024
  br i1 %20, label %for.inc8.i, label %vector.body, !llvm.loop !7

for.inc8.i:                                       ; preds = %vector.body
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1
  %exitcond31.i = icmp eq i64 %indvars.iv.next30.i, 1024
  br i1 %exitcond31.i, label %for.cond15.preheader.i.preheader, label %for.cond1.preheader.i

for.cond15.preheader.i.preheader:                 ; preds = %for.inc8.i
  %arraydecay9 = bitcast i8* %call4 to [1024 x double]*
  %arraydecay11 = bitcast i8* %call8 to [1024 x double]*
  br label %for.cond15.preheader.i

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.cond15.preheader.i.preheader
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.inc31.i ], [ 0, %for.cond15.preheader.i.preheader ]
  %21 = trunc i64 %indvars.iv23.i to i32
  %conv19.i = sitofp i32 %21 to double
  br label %vector.body117

vector.body117:                                   ; preds = %vector.body117, %for.cond15.preheader.i
  %index120 = phi i64 [ 0, %for.cond15.preheader.i ], [ %index.next127, %vector.body117 ]
  %induction129164 = or i64 %index120, 1
  %22 = or i64 %index120, 1
  %23 = add nuw nsw i64 %induction129164, 1
  %24 = trunc i64 %22 to i32
  %25 = trunc i64 %23 to i32
  %26 = sitofp i32 %24 to double
  %27 = sitofp i32 %25 to double
  %28 = fmul double %conv19.i, %26
  %29 = fmul double %conv19.i, %27
  %30 = fmul double %28, 9.765625e-04
  %31 = fmul double %29, 9.765625e-04
  %32 = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv23.i, i64 %index120
  %33 = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv23.i, i64 %induction129164
  store double %30, double* %32, align 8, !tbaa !3
  store double %31, double* %33, align 8, !tbaa !3
  %index.next127 = add i64 %index120, 2
  %34 = icmp eq i64 %index.next127, 1024
  br i1 %34, label %for.inc31.i, label %vector.body117, !llvm.loop !10

for.inc31.i:                                      ; preds = %vector.body117
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 1024
  br i1 %exitcond25.i, label %for.cond38.preheader.i.preheader, label %for.cond15.preheader.i

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  br label %for.cond38.preheader.i

for.cond38.preheader.i:                           ; preds = %for.inc55.i, %for.cond38.preheader.i.preheader
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %for.inc55.i ], [ 0, %for.cond38.preheader.i.preheader ]
  %35 = trunc i64 %indvars.iv17.i to i32
  %conv42.i = sitofp i32 %35 to double
  br label %vector.body133

vector.body133:                                   ; preds = %vector.body133, %for.cond38.preheader.i
  %index136 = phi i64 [ 0, %for.cond38.preheader.i ], [ %index.next143, %vector.body133 ]
  %induction145165 = or i64 %index136, 1
  %36 = add nuw nsw i64 %index136, 3
  %37 = add nuw nsw i64 %induction145165, 3
  %38 = trunc i64 %36 to i32
  %39 = trunc i64 %37 to i32
  %40 = sitofp i32 %38 to double
  %41 = sitofp i32 %39 to double
  %42 = fmul double %conv42.i, %40
  %43 = fmul double %conv42.i, %41
  %44 = fmul double %42, 9.765625e-04
  %45 = fmul double %43, 9.765625e-04
  %46 = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv17.i, i64 %index136
  %47 = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv17.i, i64 %induction145165
  store double %44, double* %46, align 8, !tbaa !3
  store double %45, double* %47, align 8, !tbaa !3
  %index.next143 = add i64 %index136, 2
  %48 = icmp eq i64 %index.next143, 1024
  br i1 %48, label %for.inc55.i, label %vector.body133, !llvm.loop !11

for.inc55.i:                                      ; preds = %vector.body133
  %indvars.iv.next18.i = add nuw nsw i64 %indvars.iv17.i, 1
  %exitcond19.i = icmp eq i64 %indvars.iv.next18.i, 1024
  br i1 %exitcond19.i, label %for.cond62.preheader.i.preheader, label %for.cond38.preheader.i

for.cond62.preheader.i.preheader:                 ; preds = %for.inc55.i
  br label %for.cond62.preheader.i

for.cond62.preheader.i:                           ; preds = %for.inc79.i, %for.cond62.preheader.i.preheader
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %for.inc79.i ], [ 0, %for.cond62.preheader.i.preheader ]
  %49 = trunc i64 %indvars.iv10.i to i32
  %conv66.i = sitofp i32 %49 to double
  br label %vector.body149

vector.body149:                                   ; preds = %vector.body149, %for.cond62.preheader.i
  %index152 = phi i64 [ 0, %for.cond62.preheader.i ], [ %index.next159, %vector.body149 ]
  %induction161166 = or i64 %index152, 1
  %50 = add nuw nsw i64 %index152, 2
  %51 = add nuw nsw i64 %induction161166, 2
  %52 = trunc i64 %50 to i32
  %53 = trunc i64 %51 to i32
  %54 = sitofp i32 %52 to double
  %55 = sitofp i32 %53 to double
  %56 = fmul double %conv66.i, %54
  %57 = fmul double %conv66.i, %55
  %58 = fmul double %56, 9.765625e-04
  %59 = fmul double %57, 9.765625e-04
  %60 = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv10.i, i64 %index152
  %61 = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv10.i, i64 %induction161166
  store double %58, double* %60, align 8, !tbaa !3
  store double %59, double* %61, align 8, !tbaa !3
  %index.next159 = add i64 %index152, 2
  %62 = icmp eq i64 %index.next159, 1024
  br i1 %62, label %for.inc79.i, label %vector.body149, !llvm.loop !12

for.inc79.i:                                      ; preds = %vector.body149
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1
  %exitcond12.i = icmp eq i64 %indvars.iv.next11.i, 1024
  br i1 %exitcond12.i, label %init_array.exit, label %for.cond62.preheader.i

init_array.exit:                                  ; preds = %for.inc79.i
  %arraydecay12 = bitcast i8* %call to [1024 x double]*
  br label %for.cond4.preheader.i

for.cond4.preheader.i:                            ; preds = %for.inc28.i, %init_array.exit
  %indvars.iv20.i97 = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next21.i101, %for.inc28.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.inc25.i, %for.cond4.preheader.i
  %indvars.iv16.i = phi i64 [ 0, %for.cond4.preheader.i ], [ %indvars.iv.next17.i, %for.inc25.i ]
  %arrayidx8.i = getelementptr inbounds [1024 x double]* %arraydecay12, i64 %indvars.iv20.i97, i64 %indvars.iv16.i
  store double 0.000000e+00, double* %arrayidx8.i, align 8, !tbaa !3
  br label %for.body11.i

for.body11.i:                                     ; preds = %for.body11.i, %for.body6.i
  %63 = phi double [ 0.000000e+00, %for.body6.i ], [ %add.i.1, %for.body11.i ]
  %indvars.iv13.i98 = phi i64 [ 0, %for.body6.i ], [ %indvars.iv.next14.i100.1, %for.body11.i ]
  %arrayidx15.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv20.i97, i64 %indvars.iv13.i98
  %64 = load double* %arrayidx15.i, align 8, !tbaa !3
  %mul.i99 = fmul double %64, 3.241200e+04
  %arrayidx19.i = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv13.i98, i64 %indvars.iv16.i
  %65 = load double* %arrayidx19.i, align 8, !tbaa !3
  %mul20.i = fmul double %mul.i99, %65
  %add.i = fadd double %63, %mul20.i
  store double %add.i, double* %arrayidx8.i, align 8, !tbaa !3
  %indvars.iv.next14.i100 = add nuw nsw i64 %indvars.iv13.i98, 1
  %arrayidx15.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv20.i97, i64 %indvars.iv.next14.i100
  %66 = load double* %arrayidx15.i.1, align 8, !tbaa !3
  %mul.i99.1 = fmul double %66, 3.241200e+04
  %arrayidx19.i.1 = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv.next14.i100, i64 %indvars.iv16.i
  %67 = load double* %arrayidx19.i.1, align 8, !tbaa !3
  %mul20.i.1 = fmul double %mul.i99.1, %67
  %add.i.1 = fadd double %add.i, %mul20.i.1
  store double %add.i.1, double* %arrayidx8.i, align 8, !tbaa !3
  %indvars.iv.next14.i100.1 = add nuw nsw i64 %indvars.iv.next14.i100, 1
  %exitcond15.i.1 = icmp eq i64 %indvars.iv.next14.i100.1, 1024
  br i1 %exitcond15.i.1, label %for.inc25.i, label %for.body11.i

for.inc25.i:                                      ; preds = %for.body11.i
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 1024
  br i1 %exitcond18.i, label %for.inc28.i, label %for.body6.i

for.inc28.i:                                      ; preds = %for.inc25.i
  %indvars.iv.next21.i101 = add nuw nsw i64 %indvars.iv20.i97, 1
  %exitcond22.i102 = icmp eq i64 %indvars.iv.next21.i101, 1024
  br i1 %exitcond22.i102, label %for.cond34.preheader.i.preheader, label %for.cond4.preheader.i

for.cond34.preheader.i.preheader:                 ; preds = %for.inc28.i
  br label %for.cond34.preheader.i

for.cond34.preheader.i:                           ; preds = %for.inc65.i, %for.cond34.preheader.i.preheader
  %indvars.iv10.i103 = phi i64 [ %indvars.iv.next11.i109, %for.inc65.i ], [ 0, %for.cond34.preheader.i.preheader ]
  br label %for.body36.i

for.body36.i:                                     ; preds = %for.inc62.i, %for.cond34.preheader.i
  %indvars.iv7.i104 = phi i64 [ 0, %for.cond34.preheader.i ], [ %indvars.iv.next8.i108, %for.inc62.i ]
  %arrayidx40.i = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv10.i103, i64 %indvars.iv7.i104
  %68 = load double* %arrayidx40.i, align 8, !tbaa !3
  %mul41.i = fmul double %68, 2.123000e+03
  store double %mul41.i, double* %arrayidx40.i, align 8, !tbaa !3
  br label %for.body44.i

for.body44.i:                                     ; preds = %for.body44.i, %for.body36.i
  %69 = phi double [ %mul41.i, %for.body36.i ], [ %add58.i.1, %for.body44.i ]
  %indvars.iv.i105 = phi i64 [ 0, %for.body36.i ], [ %indvars.iv.next.i106.1, %for.body44.i ]
  %arrayidx48.i = getelementptr inbounds [1024 x double]* %arraydecay12, i64 %indvars.iv10.i103, i64 %indvars.iv.i105
  %70 = load double* %arrayidx48.i, align 8, !tbaa !3
  %arrayidx52.i = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv.i105, i64 %indvars.iv7.i104
  %71 = load double* %arrayidx52.i, align 8, !tbaa !3
  %mul53.i = fmul double %70, %71
  %add58.i = fadd double %69, %mul53.i
  store double %add58.i, double* %arrayidx40.i, align 8, !tbaa !3
  %indvars.iv.next.i106 = add nuw nsw i64 %indvars.iv.i105, 1
  %arrayidx48.i.1 = getelementptr inbounds [1024 x double]* %arraydecay12, i64 %indvars.iv10.i103, i64 %indvars.iv.next.i106
  %72 = load double* %arrayidx48.i.1, align 8, !tbaa !3
  %arrayidx52.i.1 = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv.next.i106, i64 %indvars.iv7.i104
  %73 = load double* %arrayidx52.i.1, align 8, !tbaa !3
  %mul53.i.1 = fmul double %72, %73
  %add58.i.1 = fadd double %add58.i, %mul53.i.1
  store double %add58.i.1, double* %arrayidx40.i, align 8, !tbaa !3
  %indvars.iv.next.i106.1 = add nuw nsw i64 %indvars.iv.next.i106, 1
  %exitcond.i107.1 = icmp eq i64 %indvars.iv.next.i106.1, 1024
  br i1 %exitcond.i107.1, label %for.inc62.i, label %for.body44.i

for.inc62.i:                                      ; preds = %for.body44.i
  %indvars.iv.next8.i108 = add nuw nsw i64 %indvars.iv7.i104, 1
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i108, 1024
  br i1 %exitcond9.i, label %for.inc65.i, label %for.body36.i

for.inc65.i:                                      ; preds = %for.inc62.i
  %indvars.iv.next11.i109 = add nuw nsw i64 %indvars.iv10.i103, 1
  %exitcond12.i110 = icmp eq i64 %indvars.iv.next11.i109, 1024
  br i1 %exitcond12.i110, label %kernel_2mm.exit, label %for.cond34.preheader.i

kernel_2mm.exit:                                  ; preds = %for.inc65.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %if.end56, label %if.end62

if.end56:                                         ; preds = %kernel_2mm.exit
  %74 = load i8** %argv, align 8, !tbaa !13
  %75 = load i8* %74, align 1, !tbaa !15
  %phitmp = icmp eq i8 %75, 0
  br i1 %phitmp, label %for.cond1.preheader.i91.preheader, label %if.end62

for.cond1.preheader.i91.preheader:                ; preds = %if.end56
  br label %for.cond1.preheader.i91

for.cond1.preheader.i91:                          ; preds = %for.inc8.i96, %for.cond1.preheader.i91.preheader
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i96 ], [ 0, %for.cond1.preheader.i91.preheader ]
  %76 = shl i64 %indvars.iv7.i, 10
  br label %for.body3.i93

for.body3.i93:                                    ; preds = %for.inc.i, %for.cond1.preheader.i91
  %indvars.iv.i92 = phi i64 [ 0, %for.cond1.preheader.i91 ], [ %indvars.iv.next.i94, %for.inc.i ]
  %77 = load %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv7.i, i64 %indvars.iv.i92
  %78 = load double* %arrayidx5.i, align 8, !tbaa !3
  call void (i32, ...)* @start_measures(i32 0)
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %78) #8
  call void (...)* @get_results()
  %79 = add nuw nsw i64 %indvars.iv.i92, %76
  %80 = trunc i64 %79 to i32
  %rem.i = srem i32 %80, 20
  %cmp6.i = icmp eq i32 %rem.i, 0
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body3.i93
  %81 = load %struct._IO_FILE** @stderr, align 8, !tbaa !13
  call void (i32, ...)* @start_measures(i32 1)
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %81) #8
  call void (...)* @get_results()
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i93
  %indvars.iv.next.i94 = add nuw nsw i64 %indvars.iv.i92, 1
  %exitcond.i95 = icmp eq i64 %indvars.iv.next.i94, 1024
  br i1 %exitcond.i95, label %for.inc8.i96, label %for.body3.i93

for.inc8.i96:                                     ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i91

print_array.exit:                                 ; preds = %for.inc8.i96
  %82 = load %struct._IO_FILE** @stderr, align 8, !tbaa !13
  call void (i32, ...)* @start_measures(i32 2)
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %82) #8
  call void (...)* @get_results()
  br label %if.end62

if.end62:                                         ; preds = %print_array.exit, %if.end56, %kernel_2mm.exit
  call void (i32, ...)* @start_measures(i32 3)
  tail call void @free(i8* %call) #2
  call void (...)* @get_results()
  call void (i32, ...)* @start_measures(i32 4)
  tail call void @free(i8* %call2) #2
  call void (...)* @get_results()
  call void (i32, ...)* @start_measures(i32 5)
  tail call void @free(i8* %call4) #2
  call void (...)* @get_results()
  call void (i32, ...)* @start_measures(i32 6)
  tail call void @free(i8* %call6) #2
  call void (...)* @get_results()
  call void (i32, ...)* @start_measures(i32 7)
  tail call void @free(i8* %call8) #2
  call void (...)* @get_results()
  %83 = call i32 (...)* @print_results()
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #3 {
entry:
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  store i32 4194560, i32* %cs, align 4
  %0 = load i32* %cs, align 4
  %conv = sext i32 %0 to i64
  call void (i32, ...)* @start_measures(i32 8)
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #2
  call void (...)* @get_results()
  %1 = bitcast i8* %call to double*
  store double* %1, double** %flush, align 8
  store double 0.000000e+00, double* %tmp, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %cs, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load double** %flush, align 8
  %arrayidx = getelementptr inbounds double* %5, i64 %idxprom
  %6 = load double* %arrayidx, align 8
  %7 = load double* %tmp, align 8
  %add = fadd double %7, %6
  store double %add, double* %tmp, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load double* %tmp, align 8
  %cmp2 = fcmp ole double %9, 1.000000e+01
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  br label %cond.end

cond.false:                                       ; preds = %for.end
  call void (i32, ...)* @start_measures(i32 9)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @.str13, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i32 0, i32 0)) #9
  call void (...)* @get_results()
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %10, %cond.true
  %11 = load double** %flush, align 8
  %12 = bitcast double* %11 to i8*
  call void (i32, ...)* @start_measures(i32 10)
  call void @free(i8* %12) #2
  call void (...)* @get_results()
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #4

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() #3 {
entry:
  call void @polybench_flush_cache()
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() #3 {
entry:
  call void @polybench_prepare_instruments()
  %call = call double @rtclock()
  store double %call, double* @polybench_t_start, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_stop() #3 {
entry:
  %call = call double @rtclock()
  store double %call, double* @polybench_t_end, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_print() #3 {
entry:
  %0 = load double* @polybench_t_end, align 8
  %1 = load double* @polybench_t_start, align 8
  %sub = fsub double %0, %1
  call void (i32, ...)* @start_measures(i32 11)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), double %sub)
  call void (...)* @get_results()
  ret void
}

declare i32 @printf(i8*, ...) #6

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i32 %n, i32 %elt_size) #3 {
entry:
  %n.addr = alloca i32, align 4
  %elt_size.addr = alloca i32, align 4
  %ret = alloca i8*, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %elt_size, i32* %elt_size.addr, align 4
  %0 = load i32* %n.addr, align 4
  %1 = load i32* %elt_size.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv = sext i32 %mul to i64
  %call = call i8* @xmalloc(i64 %conv)
  store i8* %call, i8** %ret, align 8
  %2 = load i8** %ret, align 8
  ret i8* %2
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind uwtable
define internal double @rtclock() #3 {
entry:
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define internal i8* @xmalloc(i64 %num) #3 {
entry:
  %num.addr = alloca i64, align 8
  %new = alloca i8*, align 8
  %ret = alloca i32, align 4
  store i64 %num, i64* %num.addr, align 8
  store i8* null, i8** %new, align 8
  %0 = load i64* %num.addr, align 8
  call void (i32, ...)* @start_measures(i32 12)
  %call = call i32 @posix_memalign(i8** %new, i64 32, i64 %0) #2
  call void (...)* @get_results()
  store i32 %call, i32* %ret, align 4
  %1 = load i8** %new, align 8
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %ret, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load %struct._IO_FILE** @stderr, align 8
  call void (i32, ...)* @start_measures(i32 13)
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([51 x i8]* @.str3, i32 0, i32 0))
  call void (...)* @get_results()
  call void (i32, ...)* @start_measures(i32 14)
  call void @exit(i32 1) #9
  call void (...)* @get_results()
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8** %new, align 8
  ret i8* %4
}

declare void @PAPI_shutdown() #7

declare void @start_measures(i32, ...) #7

declare void @get_results(...) #7

declare i32 @init_PAPI(i32, ...) #7

declare i32 @print_results(...) #7

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="8" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { cold nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !8, !9}
!11 = distinct !{!11, !8, !9}
!12 = distinct !{!12, !8, !9}
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !5, i64 0}
!15 = !{!5, !5, i64 0}
