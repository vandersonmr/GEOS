; ModuleID = 'pi.o3.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00"
@.str1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @myadd(float* nocapture %sum, float* nocapture readonly %addend) #0 {
entry:
  %0 = load float* %sum, align 4, !tbaa !3
  %1 = load float* %addend, align 4, !tbaa !3
  %add = fadd float %0, %1
  store float %add, float* %sum, align 4, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str, i64 0, i64 0))
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %yran.057 = phi float [ 5.813000e+03, %entry ], [ %sub10, %for.body ]
  %j.056 = phi i64 [ 1, %entry ], [ %inc, %for.body ]
  %ixran.055 = phi i64 [ 1907, %entry ], [ %div, %for.body ]
  %low.054 = phi i64 [ 1, %entry ], [ %low.1, %for.body ]
  %0 = phi float [ 0.000000e+00, %entry ], [ %add.i, %for.body ]
  %mul = mul nsw i64 %ixran.055, 27611
  %div = srem i64 %mul, 74383
  %conv = sitofp i64 %div to float
  %mul5 = fmul float %yran.057, 1.307000e+03
  %div6 = fdiv float %mul5, 5.471000e+03
  %conv7 = fptosi float %div6 to i64
  %conv8 = sitofp i64 %conv7 to float
  %mul9 = fmul float %conv8, 5.471000e+03
  %sub10 = fsub float %mul5, %mul9
  %1 = insertelement <2 x float> undef, float %conv, i32 0
  %2 = insertelement <2 x float> %1, float %sub10, i32 1
  %3 = fdiv <2 x float> %2, <float 7.438300e+04, float 5.471000e+03>
  %4 = fmul <2 x float> %3, %3
  %5 = extractelement <2 x float> %4, i32 0
  %6 = extractelement <2 x float> %4, i32 1
  %add = fadd float %5, %6
  %add.i = fadd float %0, %add
  %not.cmp15 = fcmp ole float %add, 1.000000e+00
  %add17 = zext i1 %not.cmp15 to i64
  %low.1 = add nsw i64 %add17, %low.054
  %inc = add nuw nsw i64 %j.056, 1
  %exitcond = icmp eq i64 %inc, 40000001
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %low.1.lcssa = phi i64 [ %low.1, %for.body ]
  %add.i.lcssa = phi float [ %add.i, %for.body ]
  %.lcssa = phi <2 x float> [ %3, %for.body ]
  %7 = extractelement <2 x float> %.lcssa, i32 0
  %phitmp.le = fpext float %7 to double
  %8 = extractelement <2 x float> %.lcssa, i32 1
  %phitmp51.le = fpext float %8 to double
  %conv20 = trunc i64 %low.1.lcssa to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i64 0, i64 0), double %phitmp.le, double %phitmp51.le, i32 %conv20, i32 40000001) #2
  %conv23 = sitofp i64 %low.1.lcssa to float
  %conv24 = fpext float %conv23 to double
  %mul25 = fmul double %conv24, 4.000000e+00
  %div28 = fdiv double %mul25, 4.000000e+07
  %conv29 = fptrunc double %div28 to float
  %conv30 = fpext float %conv29 to double
  %conv31 = fpext float %add.i.lcssa to double
  %mul32 = fmul double %conv31, 0.000000e+00
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0), double %conv30, double %mul32, i32 40000000) #2
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
