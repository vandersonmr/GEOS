; ModuleID = 'flops-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
@T = common global [36 x double] zeroinitializer, align 16
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
@.str4 = private unnamed_addr constant [36 x i8] c"     1   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@nulltime = common global double 0.000000e+00, align 8
@TimeArray = common global [3 x double] zeroinitializer, align 16
@sd = common global double 0.000000e+00, align 8
@piprg = common global double 0.000000e+00, align 8
@pierr = common global double 0.000000e+00, align 8
@str = private unnamed_addr constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00"
@str5 = private unnamed_addr constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00"
@str6 = private unnamed_addr constant [35 x i8] c"                            (usec)\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !78
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str, i64 0, i64 0)), !dbg !79
  tail call void @llvm.dbg.value(metadata i64 15625, i64 0, metadata !18, metadata !80), !dbg !81
  store double 6.400000e+01, double* getelementptr inbounds ([36 x double]* @T, i64 0, i64 1), align 8, !dbg !82, !tbaa !83
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !87, !tbaa !83
  tail call void @llvm.dbg.value(metadata i64 512000000, i64 0, metadata !19, metadata !80), !dbg !88
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !89, !tbaa !83
  store double 1.000000e+00, double* @one, align 8, !dbg !90, !tbaa !83
  store double 2.000000e+00, double* @two, align 8, !dbg !91, !tbaa !83
  store double 3.000000e+00, double* @three, align 8, !dbg !92, !tbaa !83
  store double 4.000000e+00, double* @four, align 8, !dbg !93, !tbaa !83
  store double 5.000000e+00, double* @five, align 8, !dbg !94, !tbaa !83
  store double 1.000000e+00, double* @scale, align 8, !dbg !95, !tbaa !83
  %puts53 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str5, i64 0, i64 0)), !dbg !96
  %puts54 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str6, i64 0, i64 0)), !dbg !97
  tail call void @llvm.dbg.value(metadata i64 156250000, i64 0, metadata !22, metadata !80), !dbg !98
  store double 0.000000e+00, double* @sa, align 8, !dbg !99, !tbaa !83
  tail call void @llvm.dbg.value(metadata i64 312500000, i64 0, metadata !22, metadata !80), !dbg !98
  %0 = load double* @one, align 8, !dbg !100, !tbaa !83
  %div6 = fdiv double %0, 3.125000e+08, !dbg !100
  tail call void @llvm.dbg.value(metadata double %div6, i64 0, metadata !17, metadata !80), !dbg !101
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !13, metadata !80), !dbg !102
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !15, metadata !80), !dbg !103
  tail call void @llvm.dbg.value(metadata double %0, i64 0, metadata !16, metadata !80), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !80), !dbg !105
  %1 = load double* @D1, align 8, !dbg !106, !tbaa !83
  %2 = load double* @D2, align 8, !dbg !110, !tbaa !83
  %3 = load double* @D3, align 8, !dbg !111, !tbaa !83
  %4 = load double* @E2, align 8, !dbg !112, !tbaa !83
  %5 = load double* @E3, align 8, !dbg !113, !tbaa !83
  br label %for.body, !dbg !114

for.body:                                         ; preds = %for.body, %entry
  %i.057 = phi i64 [ 1, %entry ], [ %inc, %for.body ]
  %s.056 = phi double [ 0.000000e+00, %entry ], [ %add20, %for.body ]
  %v.055 = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  %add = fadd double %0, %v.055, !dbg !115
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !15, metadata !80), !dbg !103
  %mul8 = fmul double %div6, %add, !dbg !116
  tail call void @llvm.dbg.value(metadata double %mul8, i64 0, metadata !14, metadata !80), !dbg !117
  %mul9 = fmul double %mul8, %3, !dbg !118
  %add10 = fadd double %2, %mul9, !dbg !110
  %mul11 = fmul double %mul8, %add10, !dbg !119
  %add12 = fadd double %1, %mul11, !dbg !106
  %mul13 = fmul double %mul8, %5, !dbg !120
  %add14 = fadd double %4, %mul13, !dbg !112
  %mul15 = fmul double %mul8, %add14, !dbg !121
  %add16 = fadd double %1, %mul15, !dbg !122
  %mul17 = fmul double %mul8, %add16, !dbg !123
  %add18 = fadd double %0, %mul17, !dbg !124
  %div19 = fdiv double %add12, %add18, !dbg !125
  %add20 = fadd double %s.056, %div19, !dbg !126
  tail call void @llvm.dbg.value(metadata double %add20, i64 0, metadata !13, metadata !80), !dbg !102
  %inc = add nuw nsw i64 %i.057, 1, !dbg !127
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !20, metadata !80), !dbg !105
  %exitcond = icmp eq i64 %inc, 312500000, !dbg !114
  br i1 %exitcond, label %for.end, label %for.body, !dbg !114

for.end:                                          ; preds = %for.body
  %6 = load double* @D1, align 8, !dbg !128, !tbaa !83
  %7 = load double* @D2, align 8, !dbg !129, !tbaa !83
  %add21 = fadd double %6, %7, !dbg !128
  %8 = load double* @D3, align 8, !dbg !130, !tbaa !83
  %add22 = fadd double %add21, %8, !dbg !128
  %9 = load double* @one, align 8, !dbg !131, !tbaa !83
  %add23 = fadd double %6, %9, !dbg !131
  %10 = load double* @E2, align 8, !dbg !132, !tbaa !83
  %add24 = fadd double %add23, %10, !dbg !131
  %11 = load double* @E3, align 8, !dbg !133, !tbaa !83
  %add25 = fadd double %add24, %11, !dbg !131
  %div26 = fdiv double %add22, %add25, !dbg !134
  %12 = load double* @D1, align 8, !dbg !135, !tbaa !83
  %add27 = fadd double %div26, %12, !dbg !136
  %13 = load double* @two, align 8, !dbg !137, !tbaa !83
  %mul28 = fmul double %add20, %13, !dbg !137
  %add29 = fadd double %add27, %mul28, !dbg !136
  %mul30 = fmul double %div6, %add29, !dbg !138
  %div31 = fdiv double %mul30, %13, !dbg !138
  store double %div31, double* @sa, align 8, !dbg !139, !tbaa !83
  %14 = load double* @one, align 8, !dbg !140, !tbaa !83
  %div32 = fdiv double %14, %div31, !dbg !140
  store double %div32, double* @sb, align 8, !dbg !141, !tbaa !83
  %sub38 = fadd double %div32, -2.520000e+01, !dbg !142
  store double %sub38, double* @sc, align 8, !dbg !143, !tbaa !83
  %mul39 = fmul double %sub38, 1.000000e-30, !dbg !144
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %mul39, double 0.000000e+00, double 0.000000e+00) #3, !dbg !145
  ret i32 0, !dbg !146
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!75, !76}
!llvm.ident = !{!77}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !23, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c] [DW_LANG_C99]
!1 = !{!"flops-1.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!6 = !{!7}
!7 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\001\00174", !1, !8, !9, null, i32 ()* @main, null, null, !12} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11}
!11 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22}
!13 = !{!"0x100\00s\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [s] [line 179]
!14 = !{!"0x100\00u\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [u] [line 179]
!15 = !{!"0x100\00v\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [v] [line 179]
!16 = !{!"0x100\00w\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [w] [line 179]
!17 = !{!"0x100\00x\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [x] [line 179]
!18 = !{!"0x100\00loops\00182\000", !7, !8, !5}   ; [ DW_TAG_auto_variable ] [loops] [line 182]
!19 = !{!"0x100\00NLimit\00182\000", !7, !8, !5}  ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!20 = !{!"0x100\00i\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [i] [line 183]
!21 = !{!"0x100\00m\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [m] [line 183]
!22 = !{!"0x100\00n\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [n] [line 183]
!23 = !{!24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !57, !58, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74}
!24 = !{!"0x34\00A0\00A0\00\00140\000\001", null, !8, !4, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!25 = !{!"0x34\00A1\00A1\00\00141\000\001", null, !8, !4, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!26 = !{!"0x34\00A2\00A2\00\00142\000\001", null, !8, !4, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!27 = !{!"0x34\00A3\00A3\00\00143\000\001", null, !8, !4, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!28 = !{!"0x34\00A4\00A4\00\00144\000\001", null, !8, !4, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!29 = !{!"0x34\00A5\00A5\00\00145\000\001", null, !8, !4, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!30 = !{!"0x34\00A6\00A6\00\00146\000\001", null, !8, !4, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!31 = !{!"0x34\00B0\00B0\00\00148\000\001", null, !8, !4, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!32 = !{!"0x34\00B1\00B1\00\00149\000\001", null, !8, !4, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!33 = !{!"0x34\00B2\00B2\00\00150\000\001", null, !8, !4, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!34 = !{!"0x34\00B3\00B3\00\00151\000\001", null, !8, !4, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!35 = !{!"0x34\00B4\00B4\00\00152\000\001", null, !8, !4, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!36 = !{!"0x34\00B5\00B5\00\00153\000\001", null, !8, !4, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!37 = !{!"0x34\00B6\00B6\00\00154\000\001", null, !8, !4, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!38 = !{!"0x34\00C0\00C0\00\00156\000\001", null, !8, !4, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!39 = !{!"0x34\00C1\00C1\00\00157\000\001", null, !8, !4, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!40 = !{!"0x34\00C2\00C2\00\00158\000\001", null, !8, !4, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!41 = !{!"0x34\00C3\00C3\00\00159\000\001", null, !8, !4, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!42 = !{!"0x34\00C4\00C4\00\00160\000\001", null, !8, !4, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!43 = !{!"0x34\00C5\00C5\00\00161\000\001", null, !8, !4, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!44 = !{!"0x34\00C6\00C6\00\00162\000\001", null, !8, !4, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!45 = !{!"0x34\00C7\00C7\00\00163\000\001", null, !8, !4, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!46 = !{!"0x34\00C8\00C8\00\00164\000\001", null, !8, !4, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!47 = !{!"0x34\00D1\00D1\00\00166\000\001", null, !8, !4, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!48 = !{!"0x34\00D2\00D2\00\00167\000\001", null, !8, !4, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!49 = !{!"0x34\00D3\00D3\00\00168\000\001", null, !8, !4, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!50 = !{!"0x34\00E2\00E2\00\00170\000\001", null, !8, !4, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!51 = !{!"0x34\00E3\00E3\00\00171\000\001", null, !8, !4, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!52 = !{!"0x34\00nulltime\00nulltime\00\00129\000\001", null, !8, !4, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!53 = !{!"0x34\00TimeArray\00TimeArray\00\00129\000\001", null, !8, !54, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!54 = !{!"0x1\00\000\00192\0064\000\000\000", null, null, !4, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!55 = !{!56}
!56 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!57 = !{!"0x34\00TLimit\00TLimit\00\00130\000\001", null, !8, !4, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!58 = !{!"0x34\00T\00T\00\00133\000\001", null, !8, !59, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!59 = !{!"0x1\00\000\002304\0064\000\000\000", null, null, !4, !60, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!60 = !{!61}
!61 = !{!"0x21\000\0036"}                         ; [ DW_TAG_subrange_type ] [0, 35]
!62 = !{!"0x34\00sa\00sa\00\00136\000\001", null, !8, !4, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!63 = !{!"0x34\00sb\00sb\00\00136\000\001", null, !8, !4, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!64 = !{!"0x34\00sc\00sc\00\00136\000\001", null, !8, !4, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!65 = !{!"0x34\00sd\00sd\00\00136\000\001", null, !8, !4, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!66 = !{!"0x34\00one\00one\00\00136\000\001", null, !8, !4, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!67 = !{!"0x34\00two\00two\00\00136\000\001", null, !8, !4, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!68 = !{!"0x34\00three\00three\00\00136\000\001", null, !8, !4, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!69 = !{!"0x34\00four\00four\00\00137\000\001", null, !8, !4, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!70 = !{!"0x34\00five\00five\00\00137\000\001", null, !8, !4, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!71 = !{!"0x34\00piref\00piref\00\00137\000\001", null, !8, !4, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!72 = !{!"0x34\00piprg\00piprg\00\00137\000\001", null, !8, !4, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!73 = !{!"0x34\00scale\00scale\00\00138\000\001", null, !8, !4, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!74 = !{!"0x34\00pierr\00pierr\00\00138\000\001", null, !8, !4, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!75 = !{i32 2, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 2}
!77 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!78 = !MDLocation(line: 185, column: 4, scope: !7)
!79 = !MDLocation(line: 186, column: 4, scope: !7)
!80 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!81 = !MDLocation(line: 182, column: 9, scope: !7)
!82 = !MDLocation(line: 207, column: 4, scope: !7)
!83 = !{!84, !84, i64 0}
!84 = !{!"double", !85, i64 0}
!85 = !{!"omnipotent char", !86, i64 0}
!86 = !{!"Simple C/C++ TBAA"}
!87 = !MDLocation(line: 209, column: 4, scope: !7)
!88 = !MDLocation(line: 182, column: 16, scope: !7)
!89 = !MDLocation(line: 212, column: 4, scope: !7)
!90 = !MDLocation(line: 213, column: 4, scope: !7)
!91 = !MDLocation(line: 214, column: 4, scope: !7)
!92 = !MDLocation(line: 215, column: 4, scope: !7)
!93 = !MDLocation(line: 216, column: 4, scope: !7)
!94 = !MDLocation(line: 217, column: 4, scope: !7)
!95 = !MDLocation(line: 218, column: 4, scope: !7)
!96 = !MDLocation(line: 220, column: 4, scope: !7)
!97 = !MDLocation(line: 221, column: 4, scope: !7)
!98 = !MDLocation(line: 183, column: 24, scope: !7)
!99 = !MDLocation(line: 236, column: 4, scope: !7)
!100 = !MDLocation(line: 239, column: 8, scope: !7)
!101 = !MDLocation(line: 179, column: 19, scope: !7)
!102 = !MDLocation(line: 179, column: 11, scope: !7)
!103 = !MDLocation(line: 179, column: 15, scope: !7)
!104 = !MDLocation(line: 179, column: 17, scope: !7)
!105 = !MDLocation(line: 183, column: 18, scope: !7)
!106 = !MDLocation(line: 248, column: 15, scope: !107)
!107 = !{!"0xb\00245\004\002", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!108 = !{!"0xb\00244\004\001", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!109 = !{!"0xb\00244\004\000", !1, !7}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!110 = !MDLocation(line: 248, column: 21, scope: !107)
!111 = !MDLocation(line: 248, column: 26, scope: !107)
!112 = !MDLocation(line: 248, column: 43, scope: !107)
!113 = !MDLocation(line: 248, column: 48, scope: !107)
!114 = !MDLocation(line: 244, column: 4, scope: !109)
!115 = !MDLocation(line: 246, column: 10, scope: !107)
!116 = !MDLocation(line: 247, column: 10, scope: !107)
!117 = !MDLocation(line: 179, column: 13, scope: !7)
!118 = !MDLocation(line: 248, column: 24, scope: !107)
!119 = !MDLocation(line: 248, column: 18, scope: !107)
!120 = !MDLocation(line: 248, column: 46, scope: !107)
!121 = !MDLocation(line: 248, column: 40, scope: !107)
!122 = !MDLocation(line: 248, column: 37, scope: !107)
!123 = !MDLocation(line: 248, column: 34, scope: !107)
!124 = !MDLocation(line: 248, column: 32, scope: !107)
!125 = !MDLocation(line: 248, column: 14, scope: !107)
!126 = !MDLocation(line: 248, column: 10, scope: !107)
!127 = !MDLocation(line: 244, column: 28, scope: !108)
!128 = !MDLocation(line: 251, column: 10, scope: !7)
!129 = !MDLocation(line: 251, column: 13, scope: !7)
!130 = !MDLocation(line: 251, column: 16, scope: !7)
!131 = !MDLocation(line: 251, column: 21, scope: !7)
!132 = !MDLocation(line: 251, column: 28, scope: !7)
!133 = !MDLocation(line: 251, column: 31, scope: !7)
!134 = !MDLocation(line: 251, column: 9, scope: !7)
!135 = !MDLocation(line: 252, column: 9, scope: !7)
!136 = !MDLocation(line: 254, column: 15, scope: !7)
!137 = !MDLocation(line: 254, column: 25, scope: !7)
!138 = !MDLocation(line: 254, column: 9, scope: !7)
!139 = !MDLocation(line: 254, column: 4, scope: !7)
!140 = !MDLocation(line: 255, column: 9, scope: !7)
!141 = !MDLocation(line: 255, column: 4, scope: !7)
!142 = !MDLocation(line: 257, column: 9, scope: !7)
!143 = !MDLocation(line: 257, column: 4, scope: !7)
!144 = !MDLocation(line: 263, column: 11, scope: !7)
!145 = !MDLocation(line: 262, column: 4, scope: !7)
!146 = !MDLocation(line: 266, column: 4, scope: !7)
