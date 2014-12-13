; ModuleID = 'flops-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A0 = global double 1.000000e+00, align 8
@A1 = global double 0xBFC5555555559705, align 8
@A2 = global double 0x3F811111113AE9A3, align 8
@A3 = global double 0x3F2A01A03FB1CA71, align 8
@A4 = global double 0x3EC71DF284AA3566, align 8
@A5 = global double 0x3E5AEB5A8CF8A426, align 8
@A6 = global double 0x3DE68DF75229C1A6, align 8
@B0 = global double 1.000000e+00, align 8
@B1 = global double 0xBFDFFFFFFFFF8156, align 8
@B2 = global double 0x3FA5555555290224, align 8
@B3 = global double 0xBF56C16BFFE76516, align 8
@B4 = global double 0x3EFA019528242DB7, align 8
@B5 = global double 0xBE927BB3D47DDB8E, align 8
@B6 = global double 0x3E2157B275DF182A, align 8
@C0 = global double 1.000000e+00, align 8
@C1 = global double 0x3FEFFFFFFE37B3E2, align 8
@C2 = global double 0x3FDFFFFFCC2BA4B8, align 8
@C3 = global double 0x3FC555587C476915, align 8
@C4 = global double 0x3FA5555B7E795548, align 8
@C5 = global double 0x3F810D9A4AD9120C, align 8
@C6 = global double 0x3F5713187EDB8C05, align 8
@C7 = global double 0x3F26C077C8173F3A, align 8
@C8 = global double 3.931683e-05, align 8
@D1 = global double 0x3FA47AE143138374, align 8
@D2 = global double 9.600000e-04, align 8
@D3 = global double 1.233153e-06, align 8
@E2 = global double 4.800000e-04, align 8
@E3 = global double 4.110510e-07, align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1 = private unnamed_addr constant [58 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\0A\00", align 1
@TLimit = common global double 0.000000e+00, align 8
@piref = common global double 0.000000e+00, align 8
@one = common global double 0.000000e+00, align 8
@two = common global double 0.000000e+00, align 8
@three = common global double 0.000000e+00, align 8
@four = common global double 0.000000e+00, align 8
@five = common global double 0.000000e+00, align 8
@scale = common global double 0.000000e+00, align 8
@.str2 = private unnamed_addr constant [48 x i8] c"   Module     Error        RunTime      MFLOPS\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"                            (usec)\0A\00", align 1
@sa = common global double 0.000000e+00, align 8
@sb = common global double 0.000000e+00, align 8
@sc = common global double 0.000000e+00, align 8
@.str4 = private unnamed_addr constant [36 x i8] c"     3   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@nulltime = common global double 0.000000e+00, align 8
@TimeArray = common global [3 x double] zeroinitializer, align 16
@T = common global [36 x double] zeroinitializer, align 16
@sd = common global double 0.000000e+00, align 8
@piprg = common global double 0.000000e+00, align 8
@pierr = common global double 0.000000e+00, align 8
@str = private unnamed_addr constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00"
@str5 = private unnamed_addr constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00"
@str6 = private unnamed_addr constant [35 x i8] c"                            (usec)\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !77
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str, i64 0, i64 0)), !dbg !78
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !16), !dbg !80
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !81, !tbaa !82
  tail call void @llvm.dbg.value(metadata !86, i64 0, metadata !18), !dbg !87
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !88, !tbaa !82
  store double 1.000000e+00, double* @one, align 8, !dbg !89, !tbaa !82
  store double 2.000000e+00, double* @two, align 8, !dbg !90, !tbaa !82
  store double 3.000000e+00, double* @three, align 8, !dbg !91, !tbaa !82
  store double 4.000000e+00, double* @four, align 8, !dbg !92, !tbaa !82
  store double 5.000000e+00, double* @five, align 8, !dbg !93, !tbaa !82
  store double 1.000000e+00, double* @scale, align 8, !dbg !94, !tbaa !82
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str5, i64 0, i64 0)), !dbg !95
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str6, i64 0, i64 0)), !dbg !96
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !20), !dbg !98
  %1 = load double* @piref, align 8, !dbg !99, !tbaa !82
  %2 = load double* @three, align 8, !dbg !99, !tbaa !82
  %3 = fmul double %2, 3.125000e+08, !dbg !99
  %4 = fdiv double %1, %3, !dbg !99
  tail call void @llvm.dbg.value(metadata !{double %4}, i64 0, metadata !15), !dbg !99
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !10), !dbg !101
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !13), !dbg !102
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !19), !dbg !104
  %5 = load double* @one, align 8, !dbg !106, !tbaa !82
  %6 = load double* @A6, align 8, !dbg !108, !tbaa !82
  %7 = load double* @A5, align 8, !dbg !108, !tbaa !82
  %8 = load double* @A4, align 8, !dbg !108, !tbaa !82
  %9 = load double* @A3, align 8, !dbg !108, !tbaa !82
  %10 = load double* @A2, align 8, !dbg !108, !tbaa !82
  %11 = load double* @A1, align 8, !dbg !108, !tbaa !82
  br label %12, !dbg !104

; <label>:12                                      ; preds = %12, %0
  %s.05 = phi double [ 0.000000e+00, %0 ], [ %29, %12 ]
  %i.04 = phi i64 [ 1, %0 ], [ %30, %12 ]
  %v.03 = phi double [ 0.000000e+00, %0 ], [ %13, %12 ]
  %13 = fadd double %v.03, %5, !dbg !106
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !13), !dbg !106
  %14 = fmul double %4, %13, !dbg !109
  tail call void @llvm.dbg.value(metadata !{double %14}, i64 0, metadata !12), !dbg !109
  %15 = fmul double %14, %14, !dbg !110
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !14), !dbg !110
  %16 = fmul double %6, %15, !dbg !108
  %17 = fsub double %16, %7, !dbg !108
  %18 = fmul double %15, %17, !dbg !108
  %19 = fadd double %8, %18, !dbg !108
  %20 = fmul double %15, %19, !dbg !108
  %21 = fsub double %20, %9, !dbg !108
  %22 = fmul double %15, %21, !dbg !108
  %23 = fadd double %10, %22, !dbg !108
  %24 = fmul double %15, %23, !dbg !108
  %25 = fadd double %11, %24, !dbg !108
  %26 = fmul double %15, %25, !dbg !108
  %27 = fadd double %5, %26, !dbg !108
  %28 = fmul double %14, %27, !dbg !108
  %29 = fadd double %s.05, %28, !dbg !108
  tail call void @llvm.dbg.value(metadata !{double %29}, i64 0, metadata !10), !dbg !108
  %30 = add nsw i64 %i.04, 1, !dbg !104
  tail call void @llvm.dbg.value(metadata !{i64 %30}, i64 0, metadata !19), !dbg !104
  %exitcond = icmp eq i64 %30, 312500000, !dbg !104
  br i1 %exitcond, label %31, label %12, !dbg !104

; <label>:31                                      ; preds = %12
  %32 = load double* @piref, align 8, !dbg !111, !tbaa !82
  %33 = load double* @three, align 8, !dbg !111, !tbaa !82
  %34 = fdiv double %32, %33, !dbg !111
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !12), !dbg !111
  %35 = fmul double %34, %34, !dbg !112
  tail call void @llvm.dbg.value(metadata !{double %35}, i64 0, metadata !14), !dbg !112
  %36 = load double* @A6, align 8, !dbg !113, !tbaa !82
  %37 = fmul double %36, %35, !dbg !113
  %38 = load double* @A5, align 8, !dbg !113, !tbaa !82
  %39 = fsub double %37, %38, !dbg !113
  %40 = fmul double %35, %39, !dbg !113
  %41 = load double* @A4, align 8, !dbg !113, !tbaa !82
  %42 = fadd double %41, %40, !dbg !113
  %43 = fmul double %35, %42, !dbg !113
  %44 = load double* @A3, align 8, !dbg !113, !tbaa !82
  %45 = fsub double %43, %44, !dbg !113
  %46 = fmul double %35, %45, !dbg !113
  %47 = load double* @A2, align 8, !dbg !113, !tbaa !82
  %48 = fadd double %47, %46, !dbg !113
  %49 = fmul double %35, %48, !dbg !113
  %50 = load double* @A1, align 8, !dbg !113, !tbaa !82
  %51 = fadd double %50, %49, !dbg !113
  %52 = fmul double %35, %51, !dbg !113
  %53 = load double* @one, align 8, !dbg !113, !tbaa !82
  %54 = fadd double %53, %52, !dbg !113
  %55 = fmul double %34, %54, !dbg !113
  %56 = load double* @two, align 8, !dbg !114, !tbaa !82
  %57 = fmul double %29, %56, !dbg !114
  %58 = fadd double %57, %55, !dbg !114
  %59 = fmul double %4, %58, !dbg !114
  %60 = fdiv double %59, %56, !dbg !114
  store double %60, double* @sa, align 8, !dbg !114, !tbaa !82
  store double 5.000000e-01, double* @sb, align 8, !dbg !115, !tbaa !82
  %61 = fadd double %60, -5.000000e-01, !dbg !116
  store double %61, double* @sc, align 8, !dbg !116, !tbaa !82
  %62 = fmul double %61, 1.000000e-30, !dbg !117
  %63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %62, double 0.000000e+00, double 0.000000e+00) #3, !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!74, !75}
!llvm.ident = !{!76}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !22, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-3.c] [DW_LANG_C99]
!1 = metadata !{metadata !"flops-3.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 173, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !9, i32 174} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-3.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !18, metadata !19, metadata !20, metadata !21}
!10 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 179]
!11 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!12 = metadata !{i32 786688, metadata !4, metadata !"u", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 179]
!13 = metadata !{i32 786688, metadata !4, metadata !"v", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 179]
!14 = metadata !{i32 786688, metadata !4, metadata !"w", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 179]
!15 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 179, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 179]
!16 = metadata !{i32 786688, metadata !4, metadata !"loops", metadata !5, i32 182, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loops] [line 182]
!17 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786688, metadata !4, metadata !"NLimit", metadata !5, i32 182, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!19 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 183, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 183]
!20 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 183, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 183]
!21 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 183, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 183]
!22 = metadata !{metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !56, metadata !57, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71, metadata !72, metadata !73}
!23 = metadata !{i32 786484, i32 0, null, metadata !"A0", metadata !"A0", metadata !"", metadata !5, i32 140, metadata !11, i32 0, i32 1, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"A1", metadata !"A1", metadata !"", metadata !5, i32 141, metadata !11, i32 0, i32 1, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"A2", metadata !"A2", metadata !"", metadata !5, i32 142, metadata !11, i32 0, i32 1, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"A3", metadata !"A3", metadata !"", metadata !5, i32 143, metadata !11, i32 0, i32 1, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"A4", metadata !"A4", metadata !"", metadata !5, i32 144, metadata !11, i32 0, i32 1, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!28 = metadata !{i32 786484, i32 0, null, metadata !"A5", metadata !"A5", metadata !"", metadata !5, i32 145, metadata !11, i32 0, i32 1, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"A6", metadata !"A6", metadata !"", metadata !5, i32 146, metadata !11, i32 0, i32 1, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!30 = metadata !{i32 786484, i32 0, null, metadata !"B0", metadata !"B0", metadata !"", metadata !5, i32 148, metadata !11, i32 0, i32 1, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"B1", metadata !"B1", metadata !"", metadata !5, i32 149, metadata !11, i32 0, i32 1, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"B2", metadata !"B2", metadata !"", metadata !5, i32 150, metadata !11, i32 0, i32 1, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"B3", metadata !"B3", metadata !"", metadata !5, i32 151, metadata !11, i32 0, i32 1, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"B4", metadata !"B4", metadata !"", metadata !5, i32 152, metadata !11, i32 0, i32 1, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"B5", metadata !"B5", metadata !"", metadata !5, i32 153, metadata !11, i32 0, i32 1, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"B6", metadata !"B6", metadata !"", metadata !5, i32 154, metadata !11, i32 0, i32 1, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"C0", metadata !"C0", metadata !"", metadata !5, i32 156, metadata !11, i32 0, i32 1, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!38 = metadata !{i32 786484, i32 0, null, metadata !"C1", metadata !"C1", metadata !"", metadata !5, i32 157, metadata !11, i32 0, i32 1, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!39 = metadata !{i32 786484, i32 0, null, metadata !"C2", metadata !"C2", metadata !"", metadata !5, i32 158, metadata !11, i32 0, i32 1, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"C3", metadata !"C3", metadata !"", metadata !5, i32 159, metadata !11, i32 0, i32 1, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!41 = metadata !{i32 786484, i32 0, null, metadata !"C4", metadata !"C4", metadata !"", metadata !5, i32 160, metadata !11, i32 0, i32 1, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"C5", metadata !"C5", metadata !"", metadata !5, i32 161, metadata !11, i32 0, i32 1, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"C6", metadata !"C6", metadata !"", metadata !5, i32 162, metadata !11, i32 0, i32 1, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!44 = metadata !{i32 786484, i32 0, null, metadata !"C7", metadata !"C7", metadata !"", metadata !5, i32 163, metadata !11, i32 0, i32 1, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!45 = metadata !{i32 786484, i32 0, null, metadata !"C8", metadata !"C8", metadata !"", metadata !5, i32 164, metadata !11, i32 0, i32 1, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!46 = metadata !{i32 786484, i32 0, null, metadata !"D1", metadata !"D1", metadata !"", metadata !5, i32 166, metadata !11, i32 0, i32 1, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!47 = metadata !{i32 786484, i32 0, null, metadata !"D2", metadata !"D2", metadata !"", metadata !5, i32 167, metadata !11, i32 0, i32 1, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!48 = metadata !{i32 786484, i32 0, null, metadata !"D3", metadata !"D3", metadata !"", metadata !5, i32 168, metadata !11, i32 0, i32 1, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!49 = metadata !{i32 786484, i32 0, null, metadata !"E2", metadata !"E2", metadata !"", metadata !5, i32 170, metadata !11, i32 0, i32 1, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"E3", metadata !"E3", metadata !"", metadata !5, i32 171, metadata !11, i32 0, i32 1, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!51 = metadata !{i32 786484, i32 0, null, metadata !"nulltime", metadata !"nulltime", metadata !"", metadata !5, i32 129, metadata !11, i32 0, i32 1, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!52 = metadata !{i32 786484, i32 0, null, metadata !"TimeArray", metadata !"TimeArray", metadata !"", metadata !5, i32 129, metadata !53, i32 0, i32 1, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!53 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !11, metadata !54, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!56 = metadata !{i32 786484, i32 0, null, metadata !"TLimit", metadata !"TLimit", metadata !"", metadata !5, i32 130, metadata !11, i32 0, i32 1, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 133, metadata !58, i32 0, i32 1, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!58 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2304, i64 64, i32 0, i32 0, metadata !11, metadata !59, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786465, i64 0, i64 36}       ; [ DW_TAG_subrange_type ] [0, 35]
!61 = metadata !{i32 786484, i32 0, null, metadata !"sa", metadata !"sa", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!62 = metadata !{i32 786484, i32 0, null, metadata !"sb", metadata !"sb", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!63 = metadata !{i32 786484, i32 0, null, metadata !"sc", metadata !"sc", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"sd", metadata !"sd", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"one", metadata !"one", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"two", metadata !"two", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!67 = metadata !{i32 786484, i32 0, null, metadata !"three", metadata !"three", metadata !"", metadata !5, i32 136, metadata !11, i32 0, i32 1, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!68 = metadata !{i32 786484, i32 0, null, metadata !"four", metadata !"four", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"five", metadata !"five", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"piref", metadata !"piref", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!71 = metadata !{i32 786484, i32 0, null, metadata !"piprg", metadata !"piprg", metadata !"", metadata !5, i32 137, metadata !11, i32 0, i32 1, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!72 = metadata !{i32 786484, i32 0, null, metadata !"scale", metadata !"scale", metadata !"", metadata !5, i32 138, metadata !11, i32 0, i32 1, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!73 = metadata !{i32 786484, i32 0, null, metadata !"pierr", metadata !"pierr", metadata !"", metadata !5, i32 138, metadata !11, i32 0, i32 1, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!74 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!75 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!76 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!77 = metadata !{i32 185, i32 0, metadata !4, null}
!78 = metadata !{i32 186, i32 0, metadata !4, null}
!79 = metadata !{i64 15625}
!80 = metadata !{i32 189, i32 0, metadata !4, null}
!81 = metadata !{i32 207, i32 0, metadata !4, null}
!82 = metadata !{metadata !83, metadata !83, i64 0}
!83 = metadata !{metadata !"double", metadata !84, i64 0}
!84 = metadata !{metadata !"omnipotent char", metadata !85, i64 0}
!85 = metadata !{metadata !"Simple C/C++ TBAA"}
!86 = metadata !{i64 512000000}
!87 = metadata !{i32 208, i32 0, metadata !4, null}
!88 = metadata !{i32 210, i32 0, metadata !4, null}
!89 = metadata !{i32 211, i32 0, metadata !4, null}
!90 = metadata !{i32 212, i32 0, metadata !4, null}
!91 = metadata !{i32 213, i32 0, metadata !4, null}
!92 = metadata !{i32 214, i32 0, metadata !4, null}
!93 = metadata !{i32 215, i32 0, metadata !4, null}
!94 = metadata !{i32 216, i32 0, metadata !4, null}
!95 = metadata !{i32 218, i32 0, metadata !4, null}
!96 = metadata !{i32 219, i32 0, metadata !4, null}
!97 = metadata !{i64 312500000}
!98 = metadata !{i32 226, i32 0, metadata !4, null}
!99 = metadata !{i32 239, i32 0, metadata !4, null}
!100 = metadata !{double 0.000000e+00}
!101 = metadata !{i32 240, i32 0, metadata !4, null}
!102 = metadata !{i32 241, i32 0, metadata !4, null}
!103 = metadata !{i64 1}
!104 = metadata !{i32 243, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !4, i32 243, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-3.c]
!106 = metadata !{i32 245, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !105, i32 244, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/flops-3.c]
!108 = metadata !{i32 248, i32 0, metadata !107, null}
!109 = metadata !{i32 246, i32 0, metadata !107, null}
!110 = metadata !{i32 247, i32 0, metadata !107, null}
!111 = metadata !{i32 251, i32 0, metadata !4, null}
!112 = metadata !{i32 252, i32 0, metadata !4, null}
!113 = metadata !{i32 253, i32 0, metadata !4, null}
!114 = metadata !{i32 255, i32 0, metadata !4, null}
!115 = metadata !{i32 256, i32 0, metadata !4, null}
!116 = metadata !{i32 257, i32 0, metadata !4, null}
!117 = metadata !{i32 262, i32 0, metadata !4, null}
!118 = metadata !{i32 267, i32 0, metadata !4, null}
