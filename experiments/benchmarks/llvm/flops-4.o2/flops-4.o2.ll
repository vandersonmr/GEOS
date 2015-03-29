; ModuleID = 'flops-4.c'
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
@TLimit = common global double 0.000000e+00, align 8
@piref = common global double 0.000000e+00, align 8
@one = common global double 0.000000e+00, align 8
@two = common global double 0.000000e+00, align 8
@three = common global double 0.000000e+00, align 8
@four = common global double 0.000000e+00, align 8
@five = common global double 0.000000e+00, align 8
@scale = common global double 0.000000e+00, align 8
@sa = common global double 0.000000e+00, align 8
@sb = common global double 0.000000e+00, align 8
@sc = common global double 0.000000e+00, align 8
@.str4 = private unnamed_addr constant [36 x i8] c"     4   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
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
entry:
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !78
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str, i64 0, i64 0)), !dbg !79
  tail call void @llvm.dbg.value(metadata i64 15625, i64 0, metadata !17, metadata !80), !dbg !81
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !82, !tbaa !83
  tail call void @llvm.dbg.value(metadata i64 512000000, i64 0, metadata !19, metadata !80), !dbg !87
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !88, !tbaa !83
  store double 1.000000e+00, double* @one, align 8, !dbg !89, !tbaa !83
  store double 2.000000e+00, double* @two, align 8, !dbg !90, !tbaa !83
  store double 3.000000e+00, double* @three, align 8, !dbg !91, !tbaa !83
  store double 4.000000e+00, double* @four, align 8, !dbg !92, !tbaa !83
  store double 5.000000e+00, double* @five, align 8, !dbg !93, !tbaa !83
  store double 1.000000e+00, double* @scale, align 8, !dbg !94, !tbaa !83
  %puts88 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str5, i64 0, i64 0)), !dbg !95
  %puts89 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str6, i64 0, i64 0)), !dbg !96
  tail call void @llvm.dbg.value(metadata i64 156250000, i64 0, metadata !21, metadata !80), !dbg !97
  %0 = load double* @A3, align 8, !dbg !98, !tbaa !83
  %sub = fsub double -0.000000e+00, %0, !dbg !99
  store double %sub, double* @A3, align 8, !dbg !100, !tbaa !83
  %1 = load double* @A5, align 8, !dbg !101, !tbaa !83
  %sub4 = fsub double -0.000000e+00, %1, !dbg !102
  store double %sub4, double* @A5, align 8, !dbg !103, !tbaa !83
  %2 = load double* @piref, align 8, !dbg !104, !tbaa !83
  %3 = load double* @three, align 8, !dbg !105, !tbaa !83
  %mul5 = fmul double %3, 1.562500e+08, !dbg !105
  %div = fdiv double %2, %mul5, !dbg !104
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !16, metadata !80), !dbg !106
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !12, metadata !80), !dbg !107
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !14, metadata !80), !dbg !108
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !20, metadata !80), !dbg !109
  %4 = load double* @B6, align 8, !dbg !110, !tbaa !83
  %5 = load double* @B5, align 8, !dbg !114, !tbaa !83
  %6 = load double* @B4, align 8, !dbg !115, !tbaa !83
  %7 = load double* @B3, align 8, !dbg !116, !tbaa !83
  %8 = load double* @B2, align 8, !dbg !117, !tbaa !83
  %9 = load double* @B1, align 8, !dbg !118, !tbaa !83
  %10 = load double* @one, align 8, !dbg !119, !tbaa !83
  br label %for.body, !dbg !120

for.body:                                         ; preds = %for.body, %entry
  %s.091 = phi double [ 0.000000e+00, %entry ], [ %add22, %for.body ]
  %i.090 = phi i64 [ 1, %entry ], [ %inc, %for.body ]
  %conv8 = sitofp i64 %i.090 to double, !dbg !121
  %mul9 = fmul double %div, %conv8, !dbg !121
  tail call void @llvm.dbg.value(metadata double %mul9, i64 0, metadata !13, metadata !80), !dbg !122
  %mul10 = fmul double %mul9, %mul9, !dbg !123
  tail call void @llvm.dbg.value(metadata double %mul10, i64 0, metadata !15, metadata !80), !dbg !124
  %mul11 = fmul double %mul10, %4, !dbg !110
  %add = fadd double %mul11, %5, !dbg !110
  %mul12 = fmul double %mul10, %add, !dbg !125
  %add13 = fadd double %6, %mul12, !dbg !125
  %mul14 = fmul double %mul10, %add13, !dbg !126
  %add15 = fadd double %7, %mul14, !dbg !126
  %mul16 = fmul double %mul10, %add15, !dbg !127
  %add17 = fadd double %8, %mul16, !dbg !127
  %mul18 = fmul double %mul10, %add17, !dbg !128
  %add19 = fadd double %9, %mul18, !dbg !128
  %mul20 = fmul double %mul10, %add19, !dbg !129
  %add21 = fadd double %s.091, %mul20, !dbg !130
  %add22 = fadd double %10, %add21, !dbg !130
  tail call void @llvm.dbg.value(metadata double %add22, i64 0, metadata !12, metadata !80), !dbg !107
  %inc = add nuw nsw i64 %i.090, 1, !dbg !131
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !20, metadata !80), !dbg !109
  %exitcond = icmp eq i64 %inc, 156250000, !dbg !120
  br i1 %exitcond, label %for.end, label %for.body, !dbg !120

for.end:                                          ; preds = %for.body
  %add22.lcssa = phi double [ %add22, %for.body ]
  %div23 = fdiv double %2, %3, !dbg !132
  tail call void @llvm.dbg.value(metadata double %div23, i64 0, metadata !13, metadata !80), !dbg !122
  %mul24 = fmul double %div23, %div23, !dbg !133
  tail call void @llvm.dbg.value(metadata double %mul24, i64 0, metadata !15, metadata !80), !dbg !124
  %mul25 = fmul double %4, %mul24, !dbg !134
  %add26 = fadd double %mul25, %5, !dbg !134
  %mul27 = fmul double %mul24, %add26, !dbg !135
  %add28 = fadd double %6, %mul27, !dbg !135
  %mul29 = fmul double %mul24, %add28, !dbg !136
  %add30 = fadd double %7, %mul29, !dbg !136
  %mul31 = fmul double %mul24, %add30, !dbg !137
  %add32 = fadd double %8, %mul31, !dbg !137
  %mul33 = fmul double %mul24, %add32, !dbg !138
  %add34 = fadd double %9, %mul33, !dbg !138
  %mul35 = fmul double %mul24, %add34, !dbg !139
  %add36 = fadd double %10, %mul35, !dbg !139
  %add37 = fadd double %10, %add36, !dbg !140
  %11 = load double* @two, align 8, !dbg !141, !tbaa !83
  %mul38 = fmul double %add22.lcssa, %11, !dbg !141
  %add39 = fadd double %mul38, %add37, !dbg !140
  %mul40 = fmul double %div, %add39, !dbg !142
  %div41 = fdiv double %mul40, %11, !dbg !142
  store double %div41, double* @sa, align 8, !dbg !143, !tbaa !83
  tail call void @llvm.dbg.value(metadata double %div23, i64 0, metadata !13, metadata !80), !dbg !122
  tail call void @llvm.dbg.value(metadata double %mul24, i64 0, metadata !15, metadata !80), !dbg !124
  %12 = load double* @A6, align 8, !dbg !144, !tbaa !83
  %mul44 = fmul double %12, %mul24, !dbg !144
  %add45 = fsub double %mul44, %1, !dbg !144
  %mul46 = fmul double %mul24, %add45, !dbg !145
  %13 = load double* @A4, align 8, !dbg !146, !tbaa !83
  %add47 = fadd double %13, %mul46, !dbg !145
  %mul48 = fmul double %mul24, %add47, !dbg !147
  %add49 = fsub double %mul48, %0, !dbg !147
  %mul50 = fmul double %mul24, %add49, !dbg !148
  %14 = load double* @A2, align 8, !dbg !149, !tbaa !83
  %add51 = fadd double %14, %mul50, !dbg !148
  %mul52 = fmul double %mul24, %add51, !dbg !150
  %15 = load double* @A1, align 8, !dbg !151, !tbaa !83
  %add53 = fadd double %15, %mul52, !dbg !150
  %mul54 = fmul double %mul24, %add53, !dbg !152
  %16 = load double* @A0, align 8, !dbg !153, !tbaa !83
  %add55 = fadd double %16, %mul54, !dbg !152
  %mul56 = fmul double %div23, %add55, !dbg !154
  store double %mul56, double* @sb, align 8, !dbg !155, !tbaa !83
  %sub57 = fsub double %div41, %mul56, !dbg !156
  store double %sub57, double* @sc, align 8, !dbg !157, !tbaa !83
  %mul58 = fmul double %sub57, 1.000000e-30, !dbg !158
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0), double %mul58, double 0.000000e+00, double 0.000000e+00) #3, !dbg !159
  ret i32 0, !dbg !160
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !23, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c] [DW_LANG_C99]
!1 = !{!"flops-4.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6}
!6 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\001\00174", !1, !7, !8, null, i32 ()* @main, null, null, !11} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12, !13, !14, !15, !16, !17, !19, !20, !21, !22}
!12 = !{!"0x100\00s\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [s] [line 179]
!13 = !{!"0x100\00u\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [u] [line 179]
!14 = !{!"0x100\00v\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [v] [line 179]
!15 = !{!"0x100\00w\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [w] [line 179]
!16 = !{!"0x100\00x\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [x] [line 179]
!17 = !{!"0x100\00loops\00182\000", !6, !7, !18}  ; [ DW_TAG_auto_variable ] [loops] [line 182]
!18 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!19 = !{!"0x100\00NLimit\00182\000", !6, !7, !18} ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!20 = !{!"0x100\00i\00183\000", !6, !7, !18}      ; [ DW_TAG_auto_variable ] [i] [line 183]
!21 = !{!"0x100\00m\00183\000", !6, !7, !18}      ; [ DW_TAG_auto_variable ] [m] [line 183]
!22 = !{!"0x100\00n\00183\000", !6, !7, !18}      ; [ DW_TAG_auto_variable ] [n] [line 183]
!23 = !{!24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !57, !58, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74}
!24 = !{!"0x34\00A0\00A0\00\00140\000\001", null, !7, !4, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!25 = !{!"0x34\00A1\00A1\00\00141\000\001", null, !7, !4, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!26 = !{!"0x34\00A2\00A2\00\00142\000\001", null, !7, !4, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!27 = !{!"0x34\00A3\00A3\00\00143\000\001", null, !7, !4, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!28 = !{!"0x34\00A4\00A4\00\00144\000\001", null, !7, !4, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!29 = !{!"0x34\00A5\00A5\00\00145\000\001", null, !7, !4, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!30 = !{!"0x34\00A6\00A6\00\00146\000\001", null, !7, !4, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!31 = !{!"0x34\00B0\00B0\00\00148\000\001", null, !7, !4, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!32 = !{!"0x34\00B1\00B1\00\00149\000\001", null, !7, !4, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!33 = !{!"0x34\00B2\00B2\00\00150\000\001", null, !7, !4, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!34 = !{!"0x34\00B3\00B3\00\00151\000\001", null, !7, !4, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!35 = !{!"0x34\00B4\00B4\00\00152\000\001", null, !7, !4, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!36 = !{!"0x34\00B5\00B5\00\00153\000\001", null, !7, !4, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!37 = !{!"0x34\00B6\00B6\00\00154\000\001", null, !7, !4, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!38 = !{!"0x34\00C0\00C0\00\00156\000\001", null, !7, !4, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!39 = !{!"0x34\00C1\00C1\00\00157\000\001", null, !7, !4, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!40 = !{!"0x34\00C2\00C2\00\00158\000\001", null, !7, !4, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!41 = !{!"0x34\00C3\00C3\00\00159\000\001", null, !7, !4, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!42 = !{!"0x34\00C4\00C4\00\00160\000\001", null, !7, !4, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!43 = !{!"0x34\00C5\00C5\00\00161\000\001", null, !7, !4, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!44 = !{!"0x34\00C6\00C6\00\00162\000\001", null, !7, !4, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!45 = !{!"0x34\00C7\00C7\00\00163\000\001", null, !7, !4, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!46 = !{!"0x34\00C8\00C8\00\00164\000\001", null, !7, !4, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!47 = !{!"0x34\00D1\00D1\00\00166\000\001", null, !7, !4, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!48 = !{!"0x34\00D2\00D2\00\00167\000\001", null, !7, !4, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!49 = !{!"0x34\00D3\00D3\00\00168\000\001", null, !7, !4, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!50 = !{!"0x34\00E2\00E2\00\00170\000\001", null, !7, !4, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!51 = !{!"0x34\00E3\00E3\00\00171\000\001", null, !7, !4, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!52 = !{!"0x34\00nulltime\00nulltime\00\00129\000\001", null, !7, !4, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!53 = !{!"0x34\00TimeArray\00TimeArray\00\00129\000\001", null, !7, !54, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!54 = !{!"0x1\00\000\00192\0064\000\000\000", null, null, !4, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!55 = !{!56}
!56 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!57 = !{!"0x34\00TLimit\00TLimit\00\00130\000\001", null, !7, !4, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!58 = !{!"0x34\00T\00T\00\00133\000\001", null, !7, !59, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!59 = !{!"0x1\00\000\002304\0064\000\000\000", null, null, !4, !60, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!60 = !{!61}
!61 = !{!"0x21\000\0036"}                         ; [ DW_TAG_subrange_type ] [0, 35]
!62 = !{!"0x34\00sa\00sa\00\00136\000\001", null, !7, !4, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!63 = !{!"0x34\00sb\00sb\00\00136\000\001", null, !7, !4, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!64 = !{!"0x34\00sc\00sc\00\00136\000\001", null, !7, !4, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!65 = !{!"0x34\00sd\00sd\00\00136\000\001", null, !7, !4, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!66 = !{!"0x34\00one\00one\00\00136\000\001", null, !7, !4, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!67 = !{!"0x34\00two\00two\00\00136\000\001", null, !7, !4, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!68 = !{!"0x34\00three\00three\00\00136\000\001", null, !7, !4, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!69 = !{!"0x34\00four\00four\00\00137\000\001", null, !7, !4, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!70 = !{!"0x34\00five\00five\00\00137\000\001", null, !7, !4, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!71 = !{!"0x34\00piref\00piref\00\00137\000\001", null, !7, !4, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!72 = !{!"0x34\00piprg\00piprg\00\00137\000\001", null, !7, !4, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!73 = !{!"0x34\00scale\00scale\00\00138\000\001", null, !7, !4, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!74 = !{!"0x34\00pierr\00pierr\00\00138\000\001", null, !7, !4, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!75 = !{i32 2, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 2}
!77 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!78 = !MDLocation(line: 185, column: 4, scope: !6)
!79 = !MDLocation(line: 186, column: 4, scope: !6)
!80 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!81 = !MDLocation(line: 182, column: 9, scope: !6)
!82 = !MDLocation(line: 207, column: 4, scope: !6)
!83 = !{!84, !84, i64 0}
!84 = !{!"double", !85, i64 0}
!85 = !{!"omnipotent char", !86, i64 0}
!86 = !{!"Simple C/C++ TBAA"}
!87 = !MDLocation(line: 182, column: 16, scope: !6)
!88 = !MDLocation(line: 210, column: 4, scope: !6)
!89 = !MDLocation(line: 211, column: 4, scope: !6)
!90 = !MDLocation(line: 212, column: 4, scope: !6)
!91 = !MDLocation(line: 213, column: 4, scope: !6)
!92 = !MDLocation(line: 214, column: 4, scope: !6)
!93 = !MDLocation(line: 215, column: 4, scope: !6)
!94 = !MDLocation(line: 216, column: 4, scope: !6)
!95 = !MDLocation(line: 218, column: 4, scope: !6)
!96 = !MDLocation(line: 219, column: 4, scope: !6)
!97 = !MDLocation(line: 183, column: 21, scope: !6)
!98 = !MDLocation(line: 238, column: 10, scope: !6)
!99 = !MDLocation(line: 238, column: 9, scope: !6)
!100 = !MDLocation(line: 238, column: 4, scope: !6)
!101 = !MDLocation(line: 239, column: 10, scope: !6)
!102 = !MDLocation(line: 239, column: 9, scope: !6)
!103 = !MDLocation(line: 239, column: 4, scope: !6)
!104 = !MDLocation(line: 240, column: 8, scope: !6)
!105 = !MDLocation(line: 240, column: 18, scope: !6)
!106 = !MDLocation(line: 179, column: 19, scope: !6)
!107 = !MDLocation(line: 179, column: 11, scope: !6)
!108 = !MDLocation(line: 179, column: 15, scope: !6)
!109 = !MDLocation(line: 183, column: 18, scope: !6)
!110 = !MDLocation(line: 248, column: 27, scope: !111)
!111 = !{!"0xb\00245\004\002", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!112 = !{!"0xb\00244\004\001", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!113 = !{!"0xb\00244\004\000", !1, !6}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!114 = !MDLocation(line: 248, column: 32, scope: !111)
!115 = !MDLocation(line: 248, column: 36, scope: !111)
!116 = !MDLocation(line: 248, column: 40, scope: !111)
!117 = !MDLocation(line: 248, column: 44, scope: !111)
!118 = !MDLocation(line: 248, column: 48, scope: !111)
!119 = !MDLocation(line: 248, column: 52, scope: !111)
!120 = !MDLocation(line: 244, column: 4, scope: !113)
!121 = !MDLocation(line: 246, column: 8, scope: !111)
!122 = !MDLocation(line: 179, column: 13, scope: !6)
!123 = !MDLocation(line: 247, column: 8, scope: !111)
!124 = !MDLocation(line: 179, column: 17, scope: !6)
!125 = !MDLocation(line: 248, column: 24, scope: !111)
!126 = !MDLocation(line: 248, column: 21, scope: !111)
!127 = !MDLocation(line: 248, column: 18, scope: !111)
!128 = !MDLocation(line: 248, column: 15, scope: !111)
!129 = !MDLocation(line: 248, column: 12, scope: !111)
!130 = !MDLocation(line: 248, column: 8, scope: !111)
!131 = !MDLocation(line: 244, column: 28, scope: !112)
!132 = !MDLocation(line: 251, column: 9, scope: !6)
!133 = !MDLocation(line: 252, column: 9, scope: !6)
!134 = !MDLocation(line: 253, column: 24, scope: !6)
!135 = !MDLocation(line: 253, column: 21, scope: !6)
!136 = !MDLocation(line: 253, column: 18, scope: !6)
!137 = !MDLocation(line: 253, column: 15, scope: !6)
!138 = !MDLocation(line: 253, column: 12, scope: !6)
!139 = !MDLocation(line: 253, column: 9, scope: !6)
!140 = !MDLocation(line: 255, column: 15, scope: !6)
!141 = !MDLocation(line: 255, column: 26, scope: !6)
!142 = !MDLocation(line: 255, column: 9, scope: !6)
!143 = !MDLocation(line: 255, column: 4, scope: !6)
!144 = !MDLocation(line: 258, column: 19, scope: !6)
!145 = !MDLocation(line: 258, column: 18, scope: !6)
!146 = !MDLocation(line: 258, column: 30, scope: !6)
!147 = !MDLocation(line: 258, column: 17, scope: !6)
!148 = !MDLocation(line: 258, column: 16, scope: !6)
!149 = !MDLocation(line: 258, column: 42, scope: !6)
!150 = !MDLocation(line: 258, column: 15, scope: !6)
!151 = !MDLocation(line: 258, column: 48, scope: !6)
!152 = !MDLocation(line: 258, column: 14, scope: !6)
!153 = !MDLocation(line: 258, column: 54, scope: !6)
!154 = !MDLocation(line: 258, column: 9, scope: !6)
!155 = !MDLocation(line: 258, column: 4, scope: !6)
!156 = !MDLocation(line: 259, column: 9, scope: !6)
!157 = !MDLocation(line: 259, column: 4, scope: !6)
!158 = !MDLocation(line: 265, column: 11, scope: !6)
!159 = !MDLocation(line: 264, column: 4, scope: !6)
!160 = !MDLocation(line: 269, column: 4, scope: !6)
