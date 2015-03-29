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

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %s = alloca double, align 8
  %u = alloca double, align 8
  %v = alloca double, align 8
  %w = alloca double, align 8
  %x = alloca double, align 8
  %loops = alloca i64, align 8
  %NLimit = alloca i64, align 8
  %i = alloca i64, align 8
  %m = alloca i64, align 8
  %n = alloca i64, align 8
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata double* %s, metadata !67, metadata !68), !dbg !69
  call void @llvm.dbg.declare(metadata double* %u, metadata !70, metadata !68), !dbg !71
  call void @llvm.dbg.declare(metadata double* %v, metadata !72, metadata !68), !dbg !73
  call void @llvm.dbg.declare(metadata double* %w, metadata !74, metadata !68), !dbg !75
  call void @llvm.dbg.declare(metadata double* %x, metadata !76, metadata !68), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %loops, metadata !78, metadata !68), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %NLimit, metadata !80, metadata !68), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !68), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %m, metadata !84, metadata !68), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %n, metadata !86, metadata !68), !dbg !87
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !88
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0)), !dbg !89
  store i64 15625, i64* %loops, align 8, !dbg !90
  %0 = load i64* %loops, align 8, !dbg !91
  %conv = sitofp i64 %0 to double, !dbg !92
  %div = fdiv double 1.000000e+06, %conv, !dbg !93
  store double %div, double* getelementptr inbounds ([36 x double]* @T, i32 0, i64 1), align 8, !dbg !94
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !95
  store i64 512000000, i64* %NLimit, align 8, !dbg !96
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !97
  store double 1.000000e+00, double* @one, align 8, !dbg !98
  store double 2.000000e+00, double* @two, align 8, !dbg !99
  store double 3.000000e+00, double* @three, align 8, !dbg !100
  store double 4.000000e+00, double* @four, align 8, !dbg !101
  store double 5.000000e+00, double* @five, align 8, !dbg !102
  %1 = load double* @one, align 8, !dbg !103
  store double %1, double* @scale, align 8, !dbg !104
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str2, i32 0, i32 0)), !dbg !105
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0)), !dbg !106
  %2 = load i64* %loops, align 8, !dbg !107
  %mul = mul nsw i64 %2, 10000, !dbg !107
  store i64 %mul, i64* %n, align 8, !dbg !108
  store double 0.000000e+00, double* @sa, align 8, !dbg !109
  %3 = load i64* %n, align 8, !dbg !110
  %mul4 = mul nsw i64 2, %3, !dbg !111
  store i64 %mul4, i64* %n, align 8, !dbg !112
  %4 = load double* @one, align 8, !dbg !113
  %5 = load i64* %n, align 8, !dbg !114
  %conv5 = sitofp i64 %5 to double, !dbg !115
  %div6 = fdiv double %4, %conv5, !dbg !113
  store double %div6, double* %x, align 8, !dbg !116
  store double 0.000000e+00, double* %s, align 8, !dbg !117
  store double 0.000000e+00, double* %v, align 8, !dbg !118
  %6 = load double* @one, align 8, !dbg !119
  store double %6, double* %w, align 8, !dbg !120
  store i64 1, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64* %i, align 8, !dbg !123
  %8 = load i64* %n, align 8, !dbg !127
  %sub = sub nsw i64 %8, 1, !dbg !127
  %cmp = icmp sle i64 %7, %sub, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %9 = load double* %v, align 8, !dbg !130
  %10 = load double* %w, align 8, !dbg !132
  %add = fadd double %9, %10, !dbg !130
  store double %add, double* %v, align 8, !dbg !133
  %11 = load double* %v, align 8, !dbg !134
  %12 = load double* %x, align 8, !dbg !135
  %mul8 = fmul double %11, %12, !dbg !134
  store double %mul8, double* %u, align 8, !dbg !136
  %13 = load double* %s, align 8, !dbg !137
  %14 = load double* @D1, align 8, !dbg !138
  %15 = load double* %u, align 8, !dbg !139
  %16 = load double* @D2, align 8, !dbg !140
  %17 = load double* %u, align 8, !dbg !141
  %18 = load double* @D3, align 8, !dbg !142
  %mul9 = fmul double %17, %18, !dbg !141
  %add10 = fadd double %16, %mul9, !dbg !140
  %mul11 = fmul double %15, %add10, !dbg !139
  %add12 = fadd double %14, %mul11, !dbg !138
  %19 = load double* %w, align 8, !dbg !143
  %20 = load double* %u, align 8, !dbg !144
  %21 = load double* @D1, align 8, !dbg !145
  %22 = load double* %u, align 8, !dbg !146
  %23 = load double* @E2, align 8, !dbg !147
  %24 = load double* %u, align 8, !dbg !148
  %25 = load double* @E3, align 8, !dbg !149
  %mul13 = fmul double %24, %25, !dbg !148
  %add14 = fadd double %23, %mul13, !dbg !147
  %mul15 = fmul double %22, %add14, !dbg !146
  %add16 = fadd double %21, %mul15, !dbg !145
  %mul17 = fmul double %20, %add16, !dbg !144
  %add18 = fadd double %19, %mul17, !dbg !143
  %div19 = fdiv double %add12, %add18, !dbg !150
  %add20 = fadd double %13, %div19, !dbg !137
  store double %add20, double* %s, align 8, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %26 = load i64* %i, align 8, !dbg !153
  %inc = add nsw i64 %26, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154

for.end:                                          ; preds = %for.cond
  %27 = load double* @D1, align 8, !dbg !155
  %28 = load double* @D2, align 8, !dbg !156
  %add21 = fadd double %27, %28, !dbg !155
  %29 = load double* @D3, align 8, !dbg !157
  %add22 = fadd double %add21, %29, !dbg !155
  %30 = load double* @one, align 8, !dbg !158
  %31 = load double* @D1, align 8, !dbg !159
  %add23 = fadd double %30, %31, !dbg !158
  %32 = load double* @E2, align 8, !dbg !160
  %add24 = fadd double %add23, %32, !dbg !158
  %33 = load double* @E3, align 8, !dbg !161
  %add25 = fadd double %add24, %33, !dbg !158
  %div26 = fdiv double %add22, %add25, !dbg !162
  store double %div26, double* @sa, align 8, !dbg !163
  %34 = load double* @D1, align 8, !dbg !164
  store double %34, double* @sb, align 8, !dbg !165
  %35 = load double* %x, align 8, !dbg !166
  %36 = load double* @sa, align 8, !dbg !167
  %37 = load double* @sb, align 8, !dbg !168
  %add27 = fadd double %36, %37, !dbg !167
  %38 = load double* @two, align 8, !dbg !169
  %39 = load double* %s, align 8, !dbg !170
  %mul28 = fmul double %38, %39, !dbg !169
  %add29 = fadd double %add27, %mul28, !dbg !167
  %mul30 = fmul double %35, %add29, !dbg !166
  %40 = load double* @two, align 8, !dbg !171
  %div31 = fdiv double %mul30, %40, !dbg !166
  store double %div31, double* @sa, align 8, !dbg !172
  %41 = load double* @one, align 8, !dbg !173
  %42 = load double* @sa, align 8, !dbg !174
  %div32 = fdiv double %41, %42, !dbg !173
  store double %div32, double* @sb, align 8, !dbg !175
  %43 = load double* @sb, align 8, !dbg !176
  %conv33 = fptosi double %43 to i64, !dbg !177
  %mul34 = mul nsw i64 40000, %conv33, !dbg !178
  %conv35 = sitofp i64 %mul34 to double, !dbg !179
  %44 = load double* @scale, align 8, !dbg !180
  %div36 = fdiv double %conv35, %44, !dbg !179
  %conv37 = fptosi double %div36 to i64, !dbg !181
  store i64 %conv37, i64* %n, align 8, !dbg !182
  %45 = load double* @sb, align 8, !dbg !183
  %sub38 = fsub double %45, 2.520000e+01, !dbg !183
  store double %sub38, double* @sc, align 8, !dbg !184
  %46 = load double* @sc, align 8, !dbg !185
  %mul39 = fmul double %46, 1.000000e-30, !dbg !185
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0), double %mul39, double 0.000000e+00, double 0.000000e+00), !dbg !186
  ret i32 0, !dbg !187
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65}
!llvm.ident = !{!66}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !6, !12, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c] [DW_LANG_C99]
!1 = !{!"flops-1.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!6 = !{!7}
!7 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\000\00174", !1, !8, !9, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11}
!11 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !46, !47, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63}
!13 = !{!"0x34\00A0\00A0\00\00140\000\001", null, !8, !4, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!14 = !{!"0x34\00A1\00A1\00\00141\000\001", null, !8, !4, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!15 = !{!"0x34\00A2\00A2\00\00142\000\001", null, !8, !4, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!16 = !{!"0x34\00A3\00A3\00\00143\000\001", null, !8, !4, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!17 = !{!"0x34\00A4\00A4\00\00144\000\001", null, !8, !4, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!18 = !{!"0x34\00A5\00A5\00\00145\000\001", null, !8, !4, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!19 = !{!"0x34\00A6\00A6\00\00146\000\001", null, !8, !4, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!20 = !{!"0x34\00B0\00B0\00\00148\000\001", null, !8, !4, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!21 = !{!"0x34\00B1\00B1\00\00149\000\001", null, !8, !4, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!22 = !{!"0x34\00B2\00B2\00\00150\000\001", null, !8, !4, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!23 = !{!"0x34\00B3\00B3\00\00151\000\001", null, !8, !4, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!24 = !{!"0x34\00B4\00B4\00\00152\000\001", null, !8, !4, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!25 = !{!"0x34\00B5\00B5\00\00153\000\001", null, !8, !4, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!26 = !{!"0x34\00B6\00B6\00\00154\000\001", null, !8, !4, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!27 = !{!"0x34\00C0\00C0\00\00156\000\001", null, !8, !4, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!28 = !{!"0x34\00C1\00C1\00\00157\000\001", null, !8, !4, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!29 = !{!"0x34\00C2\00C2\00\00158\000\001", null, !8, !4, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!30 = !{!"0x34\00C3\00C3\00\00159\000\001", null, !8, !4, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!31 = !{!"0x34\00C4\00C4\00\00160\000\001", null, !8, !4, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!32 = !{!"0x34\00C5\00C5\00\00161\000\001", null, !8, !4, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!33 = !{!"0x34\00C6\00C6\00\00162\000\001", null, !8, !4, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!34 = !{!"0x34\00C7\00C7\00\00163\000\001", null, !8, !4, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!35 = !{!"0x34\00C8\00C8\00\00164\000\001", null, !8, !4, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!36 = !{!"0x34\00D1\00D1\00\00166\000\001", null, !8, !4, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!37 = !{!"0x34\00D2\00D2\00\00167\000\001", null, !8, !4, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!38 = !{!"0x34\00D3\00D3\00\00168\000\001", null, !8, !4, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!39 = !{!"0x34\00E2\00E2\00\00170\000\001", null, !8, !4, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!40 = !{!"0x34\00E3\00E3\00\00171\000\001", null, !8, !4, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!41 = !{!"0x34\00nulltime\00nulltime\00\00129\000\001", null, !8, !4, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!42 = !{!"0x34\00TimeArray\00TimeArray\00\00129\000\001", null, !8, !43, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!43 = !{!"0x1\00\000\00192\0064\000\000\000", null, null, !4, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!44 = !{!45}
!45 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!46 = !{!"0x34\00TLimit\00TLimit\00\00130\000\001", null, !8, !4, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!47 = !{!"0x34\00T\00T\00\00133\000\001", null, !8, !48, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!48 = !{!"0x1\00\000\002304\0064\000\000\000", null, null, !4, !49, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!49 = !{!50}
!50 = !{!"0x21\000\0036"}                         ; [ DW_TAG_subrange_type ] [0, 35]
!51 = !{!"0x34\00sa\00sa\00\00136\000\001", null, !8, !4, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!52 = !{!"0x34\00sb\00sb\00\00136\000\001", null, !8, !4, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!53 = !{!"0x34\00sc\00sc\00\00136\000\001", null, !8, !4, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!54 = !{!"0x34\00sd\00sd\00\00136\000\001", null, !8, !4, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!55 = !{!"0x34\00one\00one\00\00136\000\001", null, !8, !4, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!56 = !{!"0x34\00two\00two\00\00136\000\001", null, !8, !4, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!57 = !{!"0x34\00three\00three\00\00136\000\001", null, !8, !4, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!58 = !{!"0x34\00four\00four\00\00137\000\001", null, !8, !4, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!59 = !{!"0x34\00five\00five\00\00137\000\001", null, !8, !4, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!60 = !{!"0x34\00piref\00piref\00\00137\000\001", null, !8, !4, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!61 = !{!"0x34\00piprg\00piprg\00\00137\000\001", null, !8, !4, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!62 = !{!"0x34\00scale\00scale\00\00138\000\001", null, !8, !4, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!63 = !{!"0x34\00pierr\00pierr\00\00138\000\001", null, !8, !4, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!64 = !{i32 2, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 2}
!66 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!67 = !{!"0x100\00s\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [s] [line 179]
!68 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!69 = !MDLocation(line: 179, column: 11, scope: !7)
!70 = !{!"0x100\00u\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [u] [line 179]
!71 = !MDLocation(line: 179, column: 13, scope: !7)
!72 = !{!"0x100\00v\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [v] [line 179]
!73 = !MDLocation(line: 179, column: 15, scope: !7)
!74 = !{!"0x100\00w\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [w] [line 179]
!75 = !MDLocation(line: 179, column: 17, scope: !7)
!76 = !{!"0x100\00x\00179\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [x] [line 179]
!77 = !MDLocation(line: 179, column: 19, scope: !7)
!78 = !{!"0x100\00loops\00182\000", !7, !8, !5}   ; [ DW_TAG_auto_variable ] [loops] [line 182]
!79 = !MDLocation(line: 182, column: 9, scope: !7)
!80 = !{!"0x100\00NLimit\00182\000", !7, !8, !5}  ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!81 = !MDLocation(line: 182, column: 16, scope: !7)
!82 = !{!"0x100\00i\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [i] [line 183]
!83 = !MDLocation(line: 183, column: 18, scope: !7)
!84 = !{!"0x100\00m\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [m] [line 183]
!85 = !MDLocation(line: 183, column: 21, scope: !7)
!86 = !{!"0x100\00n\00183\000", !7, !8, !5}       ; [ DW_TAG_auto_variable ] [n] [line 183]
!87 = !MDLocation(line: 183, column: 24, scope: !7)
!88 = !MDLocation(line: 185, column: 4, scope: !7)
!89 = !MDLocation(line: 186, column: 4, scope: !7)
!90 = !MDLocation(line: 189, column: 4, scope: !7)
!91 = !MDLocation(line: 207, column: 27, scope: !7)
!92 = !MDLocation(line: 207, column: 19, scope: !7)
!93 = !MDLocation(line: 207, column: 11, scope: !7)
!94 = !MDLocation(line: 207, column: 4, scope: !7)
!95 = !MDLocation(line: 209, column: 4, scope: !7)
!96 = !MDLocation(line: 210, column: 4, scope: !7)
!97 = !MDLocation(line: 212, column: 4, scope: !7)
!98 = !MDLocation(line: 213, column: 4, scope: !7)
!99 = !MDLocation(line: 214, column: 4, scope: !7)
!100 = !MDLocation(line: 215, column: 4, scope: !7)
!101 = !MDLocation(line: 216, column: 4, scope: !7)
!102 = !MDLocation(line: 217, column: 4, scope: !7)
!103 = !MDLocation(line: 218, column: 12, scope: !7)
!104 = !MDLocation(line: 218, column: 4, scope: !7)
!105 = !MDLocation(line: 220, column: 4, scope: !7)
!106 = !MDLocation(line: 221, column: 4, scope: !7)
!107 = !MDLocation(line: 234, column: 8, scope: !7)
!108 = !MDLocation(line: 234, column: 4, scope: !7)
!109 = !MDLocation(line: 236, column: 4, scope: !7)
!110 = !MDLocation(line: 238, column: 12, scope: !7)
!111 = !MDLocation(line: 238, column: 8, scope: !7)
!112 = !MDLocation(line: 238, column: 4, scope: !7)
!113 = !MDLocation(line: 239, column: 8, scope: !7)
!114 = !MDLocation(line: 239, column: 22, scope: !7)
!115 = !MDLocation(line: 239, column: 14, scope: !7)
!116 = !MDLocation(line: 239, column: 4, scope: !7)
!117 = !MDLocation(line: 240, column: 4, scope: !7)
!118 = !MDLocation(line: 241, column: 4, scope: !7)
!119 = !MDLocation(line: 242, column: 8, scope: !7)
!120 = !MDLocation(line: 242, column: 4, scope: !7)
!121 = !MDLocation(line: 244, column: 9, scope: !122)
!122 = !{!"0xb\00244\004\000", !1, !7}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!123 = !MDLocation(line: 244, column: 17, scope: !124)
!124 = !{!"0xb\002", !1, !125}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!125 = !{!"0xb\001", !1, !126}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!126 = !{!"0xb\00244\004\001", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!127 = !MDLocation(line: 244, column: 22, scope: !126)
!128 = !MDLocation(line: 244, column: 17, scope: !126)
!129 = !MDLocation(line: 244, column: 4, scope: !122)
!130 = !MDLocation(line: 246, column: 10, scope: !131)
!131 = !{!"0xb\00245\004\002", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-1.c]
!132 = !MDLocation(line: 246, column: 14, scope: !131)
!133 = !MDLocation(line: 246, column: 6, scope: !131)
!134 = !MDLocation(line: 247, column: 10, scope: !131)
!135 = !MDLocation(line: 247, column: 14, scope: !131)
!136 = !MDLocation(line: 247, column: 6, scope: !131)
!137 = !MDLocation(line: 248, column: 10, scope: !131)
!138 = !MDLocation(line: 248, column: 15, scope: !131)
!139 = !MDLocation(line: 248, column: 18, scope: !131)
!140 = !MDLocation(line: 248, column: 21, scope: !131)
!141 = !MDLocation(line: 248, column: 24, scope: !131)
!142 = !MDLocation(line: 248, column: 26, scope: !131)
!143 = !MDLocation(line: 248, column: 32, scope: !131)
!144 = !MDLocation(line: 248, column: 34, scope: !131)
!145 = !MDLocation(line: 248, column: 37, scope: !131)
!146 = !MDLocation(line: 248, column: 40, scope: !131)
!147 = !MDLocation(line: 248, column: 43, scope: !131)
!148 = !MDLocation(line: 248, column: 46, scope: !131)
!149 = !MDLocation(line: 248, column: 48, scope: !131)
!150 = !MDLocation(line: 248, column: 14, scope: !131)
!151 = !MDLocation(line: 248, column: 6, scope: !131)
!152 = !MDLocation(line: 249, column: 4, scope: !131)
!153 = !MDLocation(line: 244, column: 28, scope: !126)
!154 = !MDLocation(line: 244, column: 4, scope: !126)
!155 = !MDLocation(line: 251, column: 10, scope: !7)
!156 = !MDLocation(line: 251, column: 13, scope: !7)
!157 = !MDLocation(line: 251, column: 16, scope: !7)
!158 = !MDLocation(line: 251, column: 21, scope: !7)
!159 = !MDLocation(line: 251, column: 25, scope: !7)
!160 = !MDLocation(line: 251, column: 28, scope: !7)
!161 = !MDLocation(line: 251, column: 31, scope: !7)
!162 = !MDLocation(line: 251, column: 9, scope: !7)
!163 = !MDLocation(line: 251, column: 4, scope: !7)
!164 = !MDLocation(line: 252, column: 9, scope: !7)
!165 = !MDLocation(line: 252, column: 4, scope: !7)
!166 = !MDLocation(line: 254, column: 9, scope: !7)
!167 = !MDLocation(line: 254, column: 15, scope: !7)
!168 = !MDLocation(line: 254, column: 20, scope: !7)
!169 = !MDLocation(line: 254, column: 25, scope: !7)
!170 = !MDLocation(line: 254, column: 31, scope: !7)
!171 = !MDLocation(line: 254, column: 37, scope: !7)
!172 = !MDLocation(line: 254, column: 4, scope: !7)
!173 = !MDLocation(line: 255, column: 9, scope: !7)
!174 = !MDLocation(line: 255, column: 15, scope: !7)
!175 = !MDLocation(line: 255, column: 4, scope: !7)
!176 = !MDLocation(line: 256, column: 41, scope: !7)
!177 = !MDLocation(line: 256, column: 35, scope: !7)
!178 = !MDLocation(line: 256, column: 27, scope: !7)
!179 = !MDLocation(line: 256, column: 17, scope: !7)
!180 = !MDLocation(line: 256, column: 48, scope: !7)
!181 = !MDLocation(line: 256, column: 9, scope: !7)
!182 = !MDLocation(line: 256, column: 4, scope: !7)
!183 = !MDLocation(line: 257, column: 9, scope: !7)
!184 = !MDLocation(line: 257, column: 4, scope: !7)
!185 = !MDLocation(line: 263, column: 11, scope: !7)
!186 = !MDLocation(line: 262, column: 4, scope: !7)
!187 = !MDLocation(line: 266, column: 4, scope: !7)
