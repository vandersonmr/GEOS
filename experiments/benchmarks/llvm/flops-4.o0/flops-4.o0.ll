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
@.str4 = private unnamed_addr constant [36 x i8] c"     4   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
@nulltime = common global double 0.000000e+00, align 8
@TimeArray = common global [3 x double] zeroinitializer, align 16
@T = common global [36 x double] zeroinitializer, align 16
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
  call void @llvm.dbg.declare(metadata double* %s, metadata !66, metadata !67), !dbg !68
  call void @llvm.dbg.declare(metadata double* %u, metadata !69, metadata !67), !dbg !70
  call void @llvm.dbg.declare(metadata double* %v, metadata !71, metadata !67), !dbg !72
  call void @llvm.dbg.declare(metadata double* %w, metadata !73, metadata !67), !dbg !74
  call void @llvm.dbg.declare(metadata double* %x, metadata !75, metadata !67), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %loops, metadata !77, metadata !67), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %NLimit, metadata !80, metadata !67), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !67), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %m, metadata !84, metadata !67), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %n, metadata !86, metadata !67), !dbg !87
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !88
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0)), !dbg !89
  store i64 15625, i64* %loops, align 8, !dbg !90
  store double 1.000000e+00, double* @TLimit, align 8, !dbg !91
  store i64 512000000, i64* %NLimit, align 8, !dbg !92
  store double 0x400921FB54442D18, double* @piref, align 8, !dbg !93
  store double 1.000000e+00, double* @one, align 8, !dbg !94
  store double 2.000000e+00, double* @two, align 8, !dbg !95
  store double 3.000000e+00, double* @three, align 8, !dbg !96
  store double 4.000000e+00, double* @four, align 8, !dbg !97
  store double 5.000000e+00, double* @five, align 8, !dbg !98
  %0 = load double* @one, align 8, !dbg !99
  store double %0, double* @scale, align 8, !dbg !100
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str2, i32 0, i32 0)), !dbg !101
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0)), !dbg !102
  %1 = load i64* %loops, align 8, !dbg !103
  %mul = mul nsw i64 %1, 10000, !dbg !103
  store i64 %mul, i64* %m, align 8, !dbg !104
  %2 = load double* @A3, align 8, !dbg !105
  %sub = fsub double -0.000000e+00, %2, !dbg !106
  store double %sub, double* @A3, align 8, !dbg !107
  %3 = load double* @A5, align 8, !dbg !108
  %sub4 = fsub double -0.000000e+00, %3, !dbg !109
  store double %sub4, double* @A5, align 8, !dbg !110
  %4 = load double* @piref, align 8, !dbg !111
  %5 = load double* @three, align 8, !dbg !112
  %6 = load i64* %m, align 8, !dbg !113
  %conv = sitofp i64 %6 to double, !dbg !114
  %mul5 = fmul double %5, %conv, !dbg !112
  %div = fdiv double %4, %mul5, !dbg !111
  store double %div, double* %x, align 8, !dbg !115
  store double 0.000000e+00, double* %s, align 8, !dbg !116
  store double 0.000000e+00, double* %v, align 8, !dbg !117
  store i64 1, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64* %i, align 8, !dbg !120
  %8 = load i64* %m, align 8, !dbg !124
  %sub6 = sub nsw i64 %8, 1, !dbg !124
  %cmp = icmp sle i64 %7, %sub6, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %9 = load i64* %i, align 8, !dbg !127
  %conv8 = sitofp i64 %9 to double, !dbg !129
  %10 = load double* %x, align 8, !dbg !130
  %mul9 = fmul double %conv8, %10, !dbg !129
  store double %mul9, double* %u, align 8, !dbg !131
  %11 = load double* %u, align 8, !dbg !132
  %12 = load double* %u, align 8, !dbg !133
  %mul10 = fmul double %11, %12, !dbg !132
  store double %mul10, double* %w, align 8, !dbg !134
  %13 = load double* %s, align 8, !dbg !135
  %14 = load double* %w, align 8, !dbg !136
  %15 = load double* %w, align 8, !dbg !137
  %16 = load double* %w, align 8, !dbg !138
  %17 = load double* %w, align 8, !dbg !139
  %18 = load double* %w, align 8, !dbg !140
  %19 = load double* @B6, align 8, !dbg !141
  %20 = load double* %w, align 8, !dbg !142
  %mul11 = fmul double %19, %20, !dbg !141
  %21 = load double* @B5, align 8, !dbg !143
  %add = fadd double %mul11, %21, !dbg !141
  %mul12 = fmul double %18, %add, !dbg !140
  %22 = load double* @B4, align 8, !dbg !144
  %add13 = fadd double %mul12, %22, !dbg !140
  %mul14 = fmul double %17, %add13, !dbg !139
  %23 = load double* @B3, align 8, !dbg !145
  %add15 = fadd double %mul14, %23, !dbg !139
  %mul16 = fmul double %16, %add15, !dbg !138
  %24 = load double* @B2, align 8, !dbg !146
  %add17 = fadd double %mul16, %24, !dbg !138
  %mul18 = fmul double %15, %add17, !dbg !137
  %25 = load double* @B1, align 8, !dbg !147
  %add19 = fadd double %mul18, %25, !dbg !137
  %mul20 = fmul double %14, %add19, !dbg !136
  %add21 = fadd double %13, %mul20, !dbg !135
  %26 = load double* @one, align 8, !dbg !148
  %add22 = fadd double %add21, %26, !dbg !135
  store double %add22, double* %s, align 8, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %27 = load i64* %i, align 8, !dbg !151
  %inc = add nsw i64 %27, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152

for.end:                                          ; preds = %for.cond
  %28 = load double* @piref, align 8, !dbg !153
  %29 = load double* @three, align 8, !dbg !154
  %div23 = fdiv double %28, %29, !dbg !153
  store double %div23, double* %u, align 8, !dbg !155
  %30 = load double* %u, align 8, !dbg !156
  %31 = load double* %u, align 8, !dbg !157
  %mul24 = fmul double %30, %31, !dbg !156
  store double %mul24, double* %w, align 8, !dbg !158
  %32 = load double* %w, align 8, !dbg !159
  %33 = load double* %w, align 8, !dbg !160
  %34 = load double* %w, align 8, !dbg !161
  %35 = load double* %w, align 8, !dbg !162
  %36 = load double* %w, align 8, !dbg !163
  %37 = load double* @B6, align 8, !dbg !164
  %38 = load double* %w, align 8, !dbg !165
  %mul25 = fmul double %37, %38, !dbg !164
  %39 = load double* @B5, align 8, !dbg !166
  %add26 = fadd double %mul25, %39, !dbg !164
  %mul27 = fmul double %36, %add26, !dbg !163
  %40 = load double* @B4, align 8, !dbg !167
  %add28 = fadd double %mul27, %40, !dbg !163
  %mul29 = fmul double %35, %add28, !dbg !162
  %41 = load double* @B3, align 8, !dbg !168
  %add30 = fadd double %mul29, %41, !dbg !162
  %mul31 = fmul double %34, %add30, !dbg !161
  %42 = load double* @B2, align 8, !dbg !169
  %add32 = fadd double %mul31, %42, !dbg !161
  %mul33 = fmul double %33, %add32, !dbg !160
  %43 = load double* @B1, align 8, !dbg !170
  %add34 = fadd double %mul33, %43, !dbg !160
  %mul35 = fmul double %32, %add34, !dbg !159
  %44 = load double* @one, align 8, !dbg !171
  %add36 = fadd double %mul35, %44, !dbg !159
  store double %add36, double* @sa, align 8, !dbg !172
  %45 = load double* %x, align 8, !dbg !173
  %46 = load double* @sa, align 8, !dbg !174
  %47 = load double* @one, align 8, !dbg !175
  %add37 = fadd double %46, %47, !dbg !174
  %48 = load double* @two, align 8, !dbg !176
  %49 = load double* %s, align 8, !dbg !177
  %mul38 = fmul double %48, %49, !dbg !176
  %add39 = fadd double %add37, %mul38, !dbg !174
  %mul40 = fmul double %45, %add39, !dbg !173
  %50 = load double* @two, align 8, !dbg !178
  %div41 = fdiv double %mul40, %50, !dbg !173
  store double %div41, double* @sa, align 8, !dbg !179
  %51 = load double* @piref, align 8, !dbg !180
  %52 = load double* @three, align 8, !dbg !181
  %div42 = fdiv double %51, %52, !dbg !180
  store double %div42, double* %u, align 8, !dbg !182
  %53 = load double* %u, align 8, !dbg !183
  %54 = load double* %u, align 8, !dbg !184
  %mul43 = fmul double %53, %54, !dbg !183
  store double %mul43, double* %w, align 8, !dbg !185
  %55 = load double* %u, align 8, !dbg !186
  %56 = load double* @A6, align 8, !dbg !187
  %57 = load double* %w, align 8, !dbg !188
  %mul44 = fmul double %56, %57, !dbg !187
  %58 = load double* @A5, align 8, !dbg !189
  %add45 = fadd double %mul44, %58, !dbg !187
  %59 = load double* %w, align 8, !dbg !190
  %mul46 = fmul double %add45, %59, !dbg !191
  %60 = load double* @A4, align 8, !dbg !192
  %add47 = fadd double %mul46, %60, !dbg !191
  %61 = load double* %w, align 8, !dbg !193
  %mul48 = fmul double %add47, %61, !dbg !194
  %62 = load double* @A3, align 8, !dbg !195
  %add49 = fadd double %mul48, %62, !dbg !194
  %63 = load double* %w, align 8, !dbg !196
  %mul50 = fmul double %add49, %63, !dbg !197
  %64 = load double* @A2, align 8, !dbg !198
  %add51 = fadd double %mul50, %64, !dbg !197
  %65 = load double* %w, align 8, !dbg !199
  %mul52 = fmul double %add51, %65, !dbg !200
  %66 = load double* @A1, align 8, !dbg !201
  %add53 = fadd double %mul52, %66, !dbg !200
  %67 = load double* %w, align 8, !dbg !202
  %mul54 = fmul double %add53, %67, !dbg !203
  %68 = load double* @A0, align 8, !dbg !204
  %add55 = fadd double %mul54, %68, !dbg !203
  %mul56 = fmul double %55, %add55, !dbg !186
  store double %mul56, double* @sb, align 8, !dbg !205
  %69 = load double* @sa, align 8, !dbg !206
  %70 = load double* @sb, align 8, !dbg !207
  %sub57 = fsub double %69, %70, !dbg !206
  store double %sub57, double* @sc, align 8, !dbg !208
  %71 = load double* @sc, align 8, !dbg !209
  %mul58 = fmul double %71, 1.000000e-30, !dbg !209
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0), double %mul58, double 0.000000e+00, double 0.000000e+00), !dbg !210
  ret i32 0, !dbg !211
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !11, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c] [DW_LANG_C99]
!1 = !{!"flops-4.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6}
!6 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\000\00174", !1, !7, !8, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !45, !46, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62}
!12 = !{!"0x34\00A0\00A0\00\00140\000\001", null, !7, !4, double* @A0, null} ; [ DW_TAG_variable ] [A0] [line 140] [def]
!13 = !{!"0x34\00A1\00A1\00\00141\000\001", null, !7, !4, double* @A1, null} ; [ DW_TAG_variable ] [A1] [line 141] [def]
!14 = !{!"0x34\00A2\00A2\00\00142\000\001", null, !7, !4, double* @A2, null} ; [ DW_TAG_variable ] [A2] [line 142] [def]
!15 = !{!"0x34\00A3\00A3\00\00143\000\001", null, !7, !4, double* @A3, null} ; [ DW_TAG_variable ] [A3] [line 143] [def]
!16 = !{!"0x34\00A4\00A4\00\00144\000\001", null, !7, !4, double* @A4, null} ; [ DW_TAG_variable ] [A4] [line 144] [def]
!17 = !{!"0x34\00A5\00A5\00\00145\000\001", null, !7, !4, double* @A5, null} ; [ DW_TAG_variable ] [A5] [line 145] [def]
!18 = !{!"0x34\00A6\00A6\00\00146\000\001", null, !7, !4, double* @A6, null} ; [ DW_TAG_variable ] [A6] [line 146] [def]
!19 = !{!"0x34\00B0\00B0\00\00148\000\001", null, !7, !4, double* @B0, null} ; [ DW_TAG_variable ] [B0] [line 148] [def]
!20 = !{!"0x34\00B1\00B1\00\00149\000\001", null, !7, !4, double* @B1, null} ; [ DW_TAG_variable ] [B1] [line 149] [def]
!21 = !{!"0x34\00B2\00B2\00\00150\000\001", null, !7, !4, double* @B2, null} ; [ DW_TAG_variable ] [B2] [line 150] [def]
!22 = !{!"0x34\00B3\00B3\00\00151\000\001", null, !7, !4, double* @B3, null} ; [ DW_TAG_variable ] [B3] [line 151] [def]
!23 = !{!"0x34\00B4\00B4\00\00152\000\001", null, !7, !4, double* @B4, null} ; [ DW_TAG_variable ] [B4] [line 152] [def]
!24 = !{!"0x34\00B5\00B5\00\00153\000\001", null, !7, !4, double* @B5, null} ; [ DW_TAG_variable ] [B5] [line 153] [def]
!25 = !{!"0x34\00B6\00B6\00\00154\000\001", null, !7, !4, double* @B6, null} ; [ DW_TAG_variable ] [B6] [line 154] [def]
!26 = !{!"0x34\00C0\00C0\00\00156\000\001", null, !7, !4, double* @C0, null} ; [ DW_TAG_variable ] [C0] [line 156] [def]
!27 = !{!"0x34\00C1\00C1\00\00157\000\001", null, !7, !4, double* @C1, null} ; [ DW_TAG_variable ] [C1] [line 157] [def]
!28 = !{!"0x34\00C2\00C2\00\00158\000\001", null, !7, !4, double* @C2, null} ; [ DW_TAG_variable ] [C2] [line 158] [def]
!29 = !{!"0x34\00C3\00C3\00\00159\000\001", null, !7, !4, double* @C3, null} ; [ DW_TAG_variable ] [C3] [line 159] [def]
!30 = !{!"0x34\00C4\00C4\00\00160\000\001", null, !7, !4, double* @C4, null} ; [ DW_TAG_variable ] [C4] [line 160] [def]
!31 = !{!"0x34\00C5\00C5\00\00161\000\001", null, !7, !4, double* @C5, null} ; [ DW_TAG_variable ] [C5] [line 161] [def]
!32 = !{!"0x34\00C6\00C6\00\00162\000\001", null, !7, !4, double* @C6, null} ; [ DW_TAG_variable ] [C6] [line 162] [def]
!33 = !{!"0x34\00C7\00C7\00\00163\000\001", null, !7, !4, double* @C7, null} ; [ DW_TAG_variable ] [C7] [line 163] [def]
!34 = !{!"0x34\00C8\00C8\00\00164\000\001", null, !7, !4, double* @C8, null} ; [ DW_TAG_variable ] [C8] [line 164] [def]
!35 = !{!"0x34\00D1\00D1\00\00166\000\001", null, !7, !4, double* @D1, null} ; [ DW_TAG_variable ] [D1] [line 166] [def]
!36 = !{!"0x34\00D2\00D2\00\00167\000\001", null, !7, !4, double* @D2, null} ; [ DW_TAG_variable ] [D2] [line 167] [def]
!37 = !{!"0x34\00D3\00D3\00\00168\000\001", null, !7, !4, double* @D3, null} ; [ DW_TAG_variable ] [D3] [line 168] [def]
!38 = !{!"0x34\00E2\00E2\00\00170\000\001", null, !7, !4, double* @E2, null} ; [ DW_TAG_variable ] [E2] [line 170] [def]
!39 = !{!"0x34\00E3\00E3\00\00171\000\001", null, !7, !4, double* @E3, null} ; [ DW_TAG_variable ] [E3] [line 171] [def]
!40 = !{!"0x34\00nulltime\00nulltime\00\00129\000\001", null, !7, !4, double* @nulltime, null} ; [ DW_TAG_variable ] [nulltime] [line 129] [def]
!41 = !{!"0x34\00TimeArray\00TimeArray\00\00129\000\001", null, !7, !42, [3 x double]* @TimeArray, null} ; [ DW_TAG_variable ] [TimeArray] [line 129] [def]
!42 = !{!"0x1\00\000\00192\0064\000\000\000", null, null, !4, !43, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!43 = !{!44}
!44 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!45 = !{!"0x34\00TLimit\00TLimit\00\00130\000\001", null, !7, !4, double* @TLimit, null} ; [ DW_TAG_variable ] [TLimit] [line 130] [def]
!46 = !{!"0x34\00T\00T\00\00133\000\001", null, !7, !47, [36 x double]* @T, null} ; [ DW_TAG_variable ] [T] [line 133] [def]
!47 = !{!"0x1\00\000\002304\0064\000\000\000", null, null, !4, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 64, offset 0] [from double]
!48 = !{!49}
!49 = !{!"0x21\000\0036"}                         ; [ DW_TAG_subrange_type ] [0, 35]
!50 = !{!"0x34\00sa\00sa\00\00136\000\001", null, !7, !4, double* @sa, null} ; [ DW_TAG_variable ] [sa] [line 136] [def]
!51 = !{!"0x34\00sb\00sb\00\00136\000\001", null, !7, !4, double* @sb, null} ; [ DW_TAG_variable ] [sb] [line 136] [def]
!52 = !{!"0x34\00sc\00sc\00\00136\000\001", null, !7, !4, double* @sc, null} ; [ DW_TAG_variable ] [sc] [line 136] [def]
!53 = !{!"0x34\00sd\00sd\00\00136\000\001", null, !7, !4, double* @sd, null} ; [ DW_TAG_variable ] [sd] [line 136] [def]
!54 = !{!"0x34\00one\00one\00\00136\000\001", null, !7, !4, double* @one, null} ; [ DW_TAG_variable ] [one] [line 136] [def]
!55 = !{!"0x34\00two\00two\00\00136\000\001", null, !7, !4, double* @two, null} ; [ DW_TAG_variable ] [two] [line 136] [def]
!56 = !{!"0x34\00three\00three\00\00136\000\001", null, !7, !4, double* @three, null} ; [ DW_TAG_variable ] [three] [line 136] [def]
!57 = !{!"0x34\00four\00four\00\00137\000\001", null, !7, !4, double* @four, null} ; [ DW_TAG_variable ] [four] [line 137] [def]
!58 = !{!"0x34\00five\00five\00\00137\000\001", null, !7, !4, double* @five, null} ; [ DW_TAG_variable ] [five] [line 137] [def]
!59 = !{!"0x34\00piref\00piref\00\00137\000\001", null, !7, !4, double* @piref, null} ; [ DW_TAG_variable ] [piref] [line 137] [def]
!60 = !{!"0x34\00piprg\00piprg\00\00137\000\001", null, !7, !4, double* @piprg, null} ; [ DW_TAG_variable ] [piprg] [line 137] [def]
!61 = !{!"0x34\00scale\00scale\00\00138\000\001", null, !7, !4, double* @scale, null} ; [ DW_TAG_variable ] [scale] [line 138] [def]
!62 = !{!"0x34\00pierr\00pierr\00\00138\000\001", null, !7, !4, double* @pierr, null} ; [ DW_TAG_variable ] [pierr] [line 138] [def]
!63 = !{i32 2, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 2}
!65 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!66 = !{!"0x100\00s\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [s] [line 179]
!67 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!68 = !MDLocation(line: 179, column: 11, scope: !6)
!69 = !{!"0x100\00u\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [u] [line 179]
!70 = !MDLocation(line: 179, column: 13, scope: !6)
!71 = !{!"0x100\00v\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [v] [line 179]
!72 = !MDLocation(line: 179, column: 15, scope: !6)
!73 = !{!"0x100\00w\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [w] [line 179]
!74 = !MDLocation(line: 179, column: 17, scope: !6)
!75 = !{!"0x100\00x\00179\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [x] [line 179]
!76 = !MDLocation(line: 179, column: 19, scope: !6)
!77 = !{!"0x100\00loops\00182\000", !6, !7, !78}  ; [ DW_TAG_auto_variable ] [loops] [line 182]
!78 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!79 = !MDLocation(line: 182, column: 9, scope: !6)
!80 = !{!"0x100\00NLimit\00182\000", !6, !7, !78} ; [ DW_TAG_auto_variable ] [NLimit] [line 182]
!81 = !MDLocation(line: 182, column: 16, scope: !6)
!82 = !{!"0x100\00i\00183\000", !6, !7, !78}      ; [ DW_TAG_auto_variable ] [i] [line 183]
!83 = !MDLocation(line: 183, column: 18, scope: !6)
!84 = !{!"0x100\00m\00183\000", !6, !7, !78}      ; [ DW_TAG_auto_variable ] [m] [line 183]
!85 = !MDLocation(line: 183, column: 21, scope: !6)
!86 = !{!"0x100\00n\00183\000", !6, !7, !78}      ; [ DW_TAG_auto_variable ] [n] [line 183]
!87 = !MDLocation(line: 183, column: 24, scope: !6)
!88 = !MDLocation(line: 185, column: 4, scope: !6)
!89 = !MDLocation(line: 186, column: 4, scope: !6)
!90 = !MDLocation(line: 189, column: 4, scope: !6)
!91 = !MDLocation(line: 207, column: 4, scope: !6)
!92 = !MDLocation(line: 208, column: 4, scope: !6)
!93 = !MDLocation(line: 210, column: 4, scope: !6)
!94 = !MDLocation(line: 211, column: 4, scope: !6)
!95 = !MDLocation(line: 212, column: 4, scope: !6)
!96 = !MDLocation(line: 213, column: 4, scope: !6)
!97 = !MDLocation(line: 214, column: 4, scope: !6)
!98 = !MDLocation(line: 215, column: 4, scope: !6)
!99 = !MDLocation(line: 216, column: 12, scope: !6)
!100 = !MDLocation(line: 216, column: 4, scope: !6)
!101 = !MDLocation(line: 218, column: 4, scope: !6)
!102 = !MDLocation(line: 219, column: 4, scope: !6)
!103 = !MDLocation(line: 226, column: 8, scope: !6)
!104 = !MDLocation(line: 226, column: 4, scope: !6)
!105 = !MDLocation(line: 238, column: 10, scope: !6)
!106 = !MDLocation(line: 238, column: 9, scope: !6)
!107 = !MDLocation(line: 238, column: 4, scope: !6)
!108 = !MDLocation(line: 239, column: 10, scope: !6)
!109 = !MDLocation(line: 239, column: 9, scope: !6)
!110 = !MDLocation(line: 239, column: 4, scope: !6)
!111 = !MDLocation(line: 240, column: 8, scope: !6)
!112 = !MDLocation(line: 240, column: 18, scope: !6)
!113 = !MDLocation(line: 240, column: 34, scope: !6)
!114 = !MDLocation(line: 240, column: 26, scope: !6)
!115 = !MDLocation(line: 240, column: 4, scope: !6)
!116 = !MDLocation(line: 241, column: 4, scope: !6)
!117 = !MDLocation(line: 242, column: 4, scope: !6)
!118 = !MDLocation(line: 244, column: 9, scope: !119)
!119 = !{!"0xb\00244\004\000", !1, !6}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!120 = !MDLocation(line: 244, column: 17, scope: !121)
!121 = !{!"0xb\002", !1, !122}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!122 = !{!"0xb\001", !1, !123}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!123 = !{!"0xb\00244\004\001", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!124 = !MDLocation(line: 244, column: 22, scope: !123)
!125 = !MDLocation(line: 244, column: 17, scope: !123)
!126 = !MDLocation(line: 244, column: 4, scope: !119)
!127 = !MDLocation(line: 246, column: 16, scope: !128)
!128 = !{!"0xb\00245\004\002", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-4.c]
!129 = !MDLocation(line: 246, column: 8, scope: !128)
!130 = !MDLocation(line: 246, column: 20, scope: !128)
!131 = !MDLocation(line: 246, column: 4, scope: !128)
!132 = !MDLocation(line: 247, column: 8, scope: !128)
!133 = !MDLocation(line: 247, column: 12, scope: !128)
!134 = !MDLocation(line: 247, column: 4, scope: !128)
!135 = !MDLocation(line: 248, column: 8, scope: !128)
!136 = !MDLocation(line: 248, column: 12, scope: !128)
!137 = !MDLocation(line: 248, column: 15, scope: !128)
!138 = !MDLocation(line: 248, column: 18, scope: !128)
!139 = !MDLocation(line: 248, column: 21, scope: !128)
!140 = !MDLocation(line: 248, column: 24, scope: !128)
!141 = !MDLocation(line: 248, column: 27, scope: !128)
!142 = !MDLocation(line: 248, column: 30, scope: !128)
!143 = !MDLocation(line: 248, column: 32, scope: !128)
!144 = !MDLocation(line: 248, column: 36, scope: !128)
!145 = !MDLocation(line: 248, column: 40, scope: !128)
!146 = !MDLocation(line: 248, column: 44, scope: !128)
!147 = !MDLocation(line: 248, column: 48, scope: !128)
!148 = !MDLocation(line: 248, column: 52, scope: !128)
!149 = !MDLocation(line: 248, column: 4, scope: !128)
!150 = !MDLocation(line: 249, column: 4, scope: !128)
!151 = !MDLocation(line: 244, column: 28, scope: !123)
!152 = !MDLocation(line: 244, column: 4, scope: !123)
!153 = !MDLocation(line: 251, column: 9, scope: !6)
!154 = !MDLocation(line: 251, column: 17, scope: !6)
!155 = !MDLocation(line: 251, column: 4, scope: !6)
!156 = !MDLocation(line: 252, column: 9, scope: !6)
!157 = !MDLocation(line: 252, column: 13, scope: !6)
!158 = !MDLocation(line: 252, column: 4, scope: !6)
!159 = !MDLocation(line: 253, column: 9, scope: !6)
!160 = !MDLocation(line: 253, column: 12, scope: !6)
!161 = !MDLocation(line: 253, column: 15, scope: !6)
!162 = !MDLocation(line: 253, column: 18, scope: !6)
!163 = !MDLocation(line: 253, column: 21, scope: !6)
!164 = !MDLocation(line: 253, column: 24, scope: !6)
!165 = !MDLocation(line: 253, column: 27, scope: !6)
!166 = !MDLocation(line: 253, column: 29, scope: !6)
!167 = !MDLocation(line: 253, column: 33, scope: !6)
!168 = !MDLocation(line: 253, column: 37, scope: !6)
!169 = !MDLocation(line: 253, column: 41, scope: !6)
!170 = !MDLocation(line: 253, column: 45, scope: !6)
!171 = !MDLocation(line: 253, column: 49, scope: !6)
!172 = !MDLocation(line: 253, column: 4, scope: !6)
!173 = !MDLocation(line: 255, column: 9, scope: !6)
!174 = !MDLocation(line: 255, column: 15, scope: !6)
!175 = !MDLocation(line: 255, column: 20, scope: !6)
!176 = !MDLocation(line: 255, column: 26, scope: !6)
!177 = !MDLocation(line: 255, column: 32, scope: !6)
!178 = !MDLocation(line: 255, column: 38, scope: !6)
!179 = !MDLocation(line: 255, column: 4, scope: !6)
!180 = !MDLocation(line: 256, column: 9, scope: !6)
!181 = !MDLocation(line: 256, column: 17, scope: !6)
!182 = !MDLocation(line: 256, column: 4, scope: !6)
!183 = !MDLocation(line: 257, column: 9, scope: !6)
!184 = !MDLocation(line: 257, column: 13, scope: !6)
!185 = !MDLocation(line: 257, column: 4, scope: !6)
!186 = !MDLocation(line: 258, column: 9, scope: !6)
!187 = !MDLocation(line: 258, column: 19, scope: !6)
!188 = !MDLocation(line: 258, column: 22, scope: !6)
!189 = !MDLocation(line: 258, column: 24, scope: !6)
!190 = !MDLocation(line: 258, column: 28, scope: !6)
!191 = !MDLocation(line: 258, column: 18, scope: !6)
!192 = !MDLocation(line: 258, column: 30, scope: !6)
!193 = !MDLocation(line: 258, column: 34, scope: !6)
!194 = !MDLocation(line: 258, column: 17, scope: !6)
!195 = !MDLocation(line: 258, column: 36, scope: !6)
!196 = !MDLocation(line: 258, column: 40, scope: !6)
!197 = !MDLocation(line: 258, column: 16, scope: !6)
!198 = !MDLocation(line: 258, column: 42, scope: !6)
!199 = !MDLocation(line: 258, column: 46, scope: !6)
!200 = !MDLocation(line: 258, column: 15, scope: !6)
!201 = !MDLocation(line: 258, column: 48, scope: !6)
!202 = !MDLocation(line: 258, column: 52, scope: !6)
!203 = !MDLocation(line: 258, column: 14, scope: !6)
!204 = !MDLocation(line: 258, column: 54, scope: !6)
!205 = !MDLocation(line: 258, column: 4, scope: !6)
!206 = !MDLocation(line: 259, column: 9, scope: !6)
!207 = !MDLocation(line: 259, column: 14, scope: !6)
!208 = !MDLocation(line: 259, column: 4, scope: !6)
!209 = !MDLocation(line: 265, column: 11, scope: !6)
!210 = !MDLocation(line: 264, column: 4, scope: !6)
!211 = !MDLocation(line: 269, column: 4, scope: !6)
