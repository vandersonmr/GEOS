; ModuleID = 'flops-8.c'
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
@.str4 = private unnamed_addr constant [36 x i8] c"     8   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1
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
  %2 = load double* @piref, align 8, !dbg !105
  %3 = load double* @three, align 8, !dbg !106
  %4 = load i64* %m, align 8, !dbg !107
  %conv = sitofp i64 %4 to double, !dbg !108
  %mul4 = fmul double %3, %conv, !dbg !106
  %div = fdiv double %2, %mul4, !dbg !105
  store double %div, double* %x, align 8, !dbg !109
  store double 0.000000e+00, double* %s, align 8, !dbg !110
  store double 0.000000e+00, double* %v, align 8, !dbg !111
  store i64 1, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64* %i, align 8, !dbg !114
  %6 = load i64* %m, align 8, !dbg !118
  %sub = sub nsw i64 %6, 1, !dbg !118
  %cmp = icmp sle i64 %5, %sub, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %7 = load i64* %i, align 8, !dbg !121
  %conv6 = sitofp i64 %7 to double, !dbg !123
  %8 = load double* %x, align 8, !dbg !124
  %mul7 = fmul double %conv6, %8, !dbg !123
  store double %mul7, double* %u, align 8, !dbg !125
  %9 = load double* %u, align 8, !dbg !126
  %10 = load double* %u, align 8, !dbg !127
  %mul8 = fmul double %9, %10, !dbg !126
  store double %mul8, double* %w, align 8, !dbg !128
  %11 = load double* %w, align 8, !dbg !129
  %12 = load double* %w, align 8, !dbg !130
  %13 = load double* %w, align 8, !dbg !131
  %14 = load double* %w, align 8, !dbg !132
  %15 = load double* %w, align 8, !dbg !133
  %16 = load double* @B6, align 8, !dbg !134
  %17 = load double* %w, align 8, !dbg !135
  %mul9 = fmul double %16, %17, !dbg !134
  %18 = load double* @B5, align 8, !dbg !136
  %add = fadd double %mul9, %18, !dbg !134
  %mul10 = fmul double %15, %add, !dbg !133
  %19 = load double* @B4, align 8, !dbg !137
  %add11 = fadd double %mul10, %19, !dbg !133
  %mul12 = fmul double %14, %add11, !dbg !132
  %20 = load double* @B3, align 8, !dbg !138
  %add13 = fadd double %mul12, %20, !dbg !132
  %mul14 = fmul double %13, %add13, !dbg !131
  %21 = load double* @B2, align 8, !dbg !139
  %add15 = fadd double %mul14, %21, !dbg !131
  %mul16 = fmul double %12, %add15, !dbg !130
  %22 = load double* @B1, align 8, !dbg !140
  %add17 = fadd double %mul16, %22, !dbg !130
  %mul18 = fmul double %11, %add17, !dbg !129
  %23 = load double* @one, align 8, !dbg !141
  %add19 = fadd double %mul18, %23, !dbg !129
  store double %add19, double* %v, align 8, !dbg !142
  %24 = load double* %s, align 8, !dbg !143
  %25 = load double* %v, align 8, !dbg !144
  %26 = load double* %v, align 8, !dbg !145
  %mul20 = fmul double %25, %26, !dbg !144
  %27 = load double* %u, align 8, !dbg !146
  %mul21 = fmul double %mul20, %27, !dbg !144
  %28 = load double* @A6, align 8, !dbg !147
  %29 = load double* %w, align 8, !dbg !148
  %mul22 = fmul double %28, %29, !dbg !147
  %30 = load double* @A5, align 8, !dbg !149
  %add23 = fadd double %mul22, %30, !dbg !147
  %31 = load double* %w, align 8, !dbg !150
  %mul24 = fmul double %add23, %31, !dbg !151
  %32 = load double* @A4, align 8, !dbg !152
  %add25 = fadd double %mul24, %32, !dbg !151
  %33 = load double* %w, align 8, !dbg !153
  %mul26 = fmul double %add25, %33, !dbg !154
  %34 = load double* @A3, align 8, !dbg !155
  %add27 = fadd double %mul26, %34, !dbg !154
  %35 = load double* %w, align 8, !dbg !156
  %mul28 = fmul double %add27, %35, !dbg !157
  %36 = load double* @A2, align 8, !dbg !158
  %add29 = fadd double %mul28, %36, !dbg !157
  %37 = load double* %w, align 8, !dbg !159
  %mul30 = fmul double %add29, %37, !dbg !160
  %38 = load double* @A1, align 8, !dbg !161
  %add31 = fadd double %mul30, %38, !dbg !160
  %39 = load double* %w, align 8, !dbg !162
  %mul32 = fmul double %add31, %39, !dbg !163
  %40 = load double* @one, align 8, !dbg !164
  %add33 = fadd double %mul32, %40, !dbg !163
  %mul34 = fmul double %mul21, %add33, !dbg !144
  %add35 = fadd double %24, %mul34, !dbg !143
  store double %add35, double* %s, align 8, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %41 = load i64* %i, align 8, !dbg !167
  %inc = add nsw i64 %41, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168

for.end:                                          ; preds = %for.cond
  %42 = load double* @piref, align 8, !dbg !169
  %43 = load double* @three, align 8, !dbg !170
  %div36 = fdiv double %42, %43, !dbg !169
  store double %div36, double* %u, align 8, !dbg !171
  %44 = load double* %u, align 8, !dbg !172
  %45 = load double* %u, align 8, !dbg !173
  %mul37 = fmul double %44, %45, !dbg !172
  store double %mul37, double* %w, align 8, !dbg !174
  %46 = load double* %u, align 8, !dbg !175
  %47 = load double* @A6, align 8, !dbg !176
  %48 = load double* %w, align 8, !dbg !177
  %mul38 = fmul double %47, %48, !dbg !176
  %49 = load double* @A5, align 8, !dbg !178
  %add39 = fadd double %mul38, %49, !dbg !176
  %50 = load double* %w, align 8, !dbg !179
  %mul40 = fmul double %add39, %50, !dbg !180
  %51 = load double* @A4, align 8, !dbg !181
  %add41 = fadd double %mul40, %51, !dbg !180
  %52 = load double* %w, align 8, !dbg !182
  %mul42 = fmul double %add41, %52, !dbg !183
  %53 = load double* @A3, align 8, !dbg !184
  %add43 = fadd double %mul42, %53, !dbg !183
  %54 = load double* %w, align 8, !dbg !185
  %mul44 = fmul double %add43, %54, !dbg !186
  %55 = load double* @A2, align 8, !dbg !187
  %add45 = fadd double %mul44, %55, !dbg !186
  %56 = load double* %w, align 8, !dbg !188
  %mul46 = fmul double %add45, %56, !dbg !189
  %57 = load double* @A1, align 8, !dbg !190
  %add47 = fadd double %mul46, %57, !dbg !189
  %58 = load double* %w, align 8, !dbg !191
  %mul48 = fmul double %add47, %58, !dbg !192
  %59 = load double* @one, align 8, !dbg !193
  %add49 = fadd double %mul48, %59, !dbg !192
  %mul50 = fmul double %46, %add49, !dbg !175
  store double %mul50, double* @sa, align 8, !dbg !194
  %60 = load double* %w, align 8, !dbg !195
  %61 = load double* %w, align 8, !dbg !196
  %62 = load double* %w, align 8, !dbg !197
  %63 = load double* %w, align 8, !dbg !198
  %64 = load double* %w, align 8, !dbg !199
  %65 = load double* @B6, align 8, !dbg !200
  %66 = load double* %w, align 8, !dbg !201
  %mul51 = fmul double %65, %66, !dbg !200
  %67 = load double* @B5, align 8, !dbg !202
  %add52 = fadd double %mul51, %67, !dbg !200
  %mul53 = fmul double %64, %add52, !dbg !199
  %68 = load double* @B4, align 8, !dbg !203
  %add54 = fadd double %mul53, %68, !dbg !199
  %mul55 = fmul double %63, %add54, !dbg !198
  %69 = load double* @B3, align 8, !dbg !204
  %add56 = fadd double %mul55, %69, !dbg !198
  %mul57 = fmul double %62, %add56, !dbg !197
  %70 = load double* @B2, align 8, !dbg !205
  %add58 = fadd double %mul57, %70, !dbg !197
  %mul59 = fmul double %61, %add58, !dbg !196
  %71 = load double* @B1, align 8, !dbg !206
  %add60 = fadd double %mul59, %71, !dbg !196
  %mul61 = fmul double %60, %add60, !dbg !195
  %72 = load double* @one, align 8, !dbg !207
  %add62 = fadd double %mul61, %72, !dbg !195
  store double %add62, double* @sb, align 8, !dbg !208
  %73 = load double* @sa, align 8, !dbg !209
  %74 = load double* @sb, align 8, !dbg !210
  %mul63 = fmul double %73, %74, !dbg !209
  %75 = load double* @sb, align 8, !dbg !211
  %mul64 = fmul double %mul63, %75, !dbg !209
  store double %mul64, double* @sa, align 8, !dbg !212
  %76 = load double* %x, align 8, !dbg !213
  %77 = load double* @sa, align 8, !dbg !214
  %78 = load double* @two, align 8, !dbg !215
  %79 = load double* %s, align 8, !dbg !216
  %mul65 = fmul double %78, %79, !dbg !215
  %add66 = fadd double %77, %mul65, !dbg !214
  %mul67 = fmul double %76, %add66, !dbg !213
  %80 = load double* @two, align 8, !dbg !217
  %div68 = fdiv double %mul67, %80, !dbg !213
  store double %div68, double* @sa, align 8, !dbg !218
  store double 0x3FD2AAAAAAAAAAAB, double* @sb, align 8, !dbg !219
  %81 = load double* @sa, align 8, !dbg !220
  %82 = load double* @sb, align 8, !dbg !221
  %sub69 = fsub double %81, %82, !dbg !220
  store double %sub69, double* @sc, align 8, !dbg !222
  %83 = load double* @sc, align 8, !dbg !223
  %mul70 = fmul double %83, 1.000000e-30, !dbg !223
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0), double %mul70, double 0.000000e+00, double 0.000000e+00), !dbg !224
  ret i32 0, !dbg !225
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !11, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c] [DW_LANG_C99]
!1 = !{!"flops-8.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6}
!6 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\000\00174", !1, !7, !8, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c]
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
!105 = !MDLocation(line: 241, column: 8, scope: !6)
!106 = !MDLocation(line: 241, column: 18, scope: !6)
!107 = !MDLocation(line: 241, column: 34, scope: !6)
!108 = !MDLocation(line: 241, column: 26, scope: !6)
!109 = !MDLocation(line: 241, column: 4, scope: !6)
!110 = !MDLocation(line: 242, column: 4, scope: !6)
!111 = !MDLocation(line: 243, column: 4, scope: !6)
!112 = !MDLocation(line: 245, column: 9, scope: !113)
!113 = !{!"0xb\00245\004\000", !1, !6}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c]
!114 = !MDLocation(line: 245, column: 17, scope: !115)
!115 = !{!"0xb\002", !1, !116}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c]
!116 = !{!"0xb\001", !1, !117}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c]
!117 = !{!"0xb\00245\004\001", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c]
!118 = !MDLocation(line: 245, column: 22, scope: !117)
!119 = !MDLocation(line: 245, column: 17, scope: !117)
!120 = !MDLocation(line: 245, column: 4, scope: !113)
!121 = !MDLocation(line: 247, column: 16, scope: !122)
!122 = !{!"0xb\00246\004\002", !1, !117}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/flops-8.c]
!123 = !MDLocation(line: 247, column: 8, scope: !122)
!124 = !MDLocation(line: 247, column: 20, scope: !122)
!125 = !MDLocation(line: 247, column: 4, scope: !122)
!126 = !MDLocation(line: 248, column: 8, scope: !122)
!127 = !MDLocation(line: 248, column: 12, scope: !122)
!128 = !MDLocation(line: 248, column: 4, scope: !122)
!129 = !MDLocation(line: 249, column: 8, scope: !122)
!130 = !MDLocation(line: 249, column: 11, scope: !122)
!131 = !MDLocation(line: 249, column: 14, scope: !122)
!132 = !MDLocation(line: 249, column: 17, scope: !122)
!133 = !MDLocation(line: 249, column: 20, scope: !122)
!134 = !MDLocation(line: 249, column: 23, scope: !122)
!135 = !MDLocation(line: 249, column: 26, scope: !122)
!136 = !MDLocation(line: 249, column: 28, scope: !122)
!137 = !MDLocation(line: 249, column: 32, scope: !122)
!138 = !MDLocation(line: 249, column: 36, scope: !122)
!139 = !MDLocation(line: 249, column: 40, scope: !122)
!140 = !MDLocation(line: 249, column: 44, scope: !122)
!141 = !MDLocation(line: 249, column: 48, scope: !122)
!142 = !MDLocation(line: 249, column: 4, scope: !122)
!143 = !MDLocation(line: 250, column: 8, scope: !122)
!144 = !MDLocation(line: 250, column: 12, scope: !122)
!145 = !MDLocation(line: 250, column: 14, scope: !122)
!146 = !MDLocation(line: 250, column: 16, scope: !122)
!147 = !MDLocation(line: 250, column: 24, scope: !122)
!148 = !MDLocation(line: 250, column: 27, scope: !122)
!149 = !MDLocation(line: 250, column: 29, scope: !122)
!150 = !MDLocation(line: 250, column: 33, scope: !122)
!151 = !MDLocation(line: 250, column: 23, scope: !122)
!152 = !MDLocation(line: 250, column: 35, scope: !122)
!153 = !MDLocation(line: 250, column: 39, scope: !122)
!154 = !MDLocation(line: 250, column: 22, scope: !122)
!155 = !MDLocation(line: 250, column: 41, scope: !122)
!156 = !MDLocation(line: 250, column: 45, scope: !122)
!157 = !MDLocation(line: 250, column: 21, scope: !122)
!158 = !MDLocation(line: 250, column: 47, scope: !122)
!159 = !MDLocation(line: 250, column: 51, scope: !122)
!160 = !MDLocation(line: 250, column: 20, scope: !122)
!161 = !MDLocation(line: 250, column: 53, scope: !122)
!162 = !MDLocation(line: 250, column: 57, scope: !122)
!163 = !MDLocation(line: 250, column: 19, scope: !122)
!164 = !MDLocation(line: 250, column: 59, scope: !122)
!165 = !MDLocation(line: 250, column: 4, scope: !122)
!166 = !MDLocation(line: 251, column: 4, scope: !122)
!167 = !MDLocation(line: 245, column: 28, scope: !117)
!168 = !MDLocation(line: 245, column: 4, scope: !117)
!169 = !MDLocation(line: 253, column: 9, scope: !6)
!170 = !MDLocation(line: 253, column: 17, scope: !6)
!171 = !MDLocation(line: 253, column: 4, scope: !6)
!172 = !MDLocation(line: 254, column: 9, scope: !6)
!173 = !MDLocation(line: 254, column: 13, scope: !6)
!174 = !MDLocation(line: 254, column: 4, scope: !6)
!175 = !MDLocation(line: 255, column: 9, scope: !6)
!176 = !MDLocation(line: 255, column: 17, scope: !6)
!177 = !MDLocation(line: 255, column: 20, scope: !6)
!178 = !MDLocation(line: 255, column: 22, scope: !6)
!179 = !MDLocation(line: 255, column: 26, scope: !6)
!180 = !MDLocation(line: 255, column: 16, scope: !6)
!181 = !MDLocation(line: 255, column: 28, scope: !6)
!182 = !MDLocation(line: 255, column: 32, scope: !6)
!183 = !MDLocation(line: 255, column: 15, scope: !6)
!184 = !MDLocation(line: 255, column: 34, scope: !6)
!185 = !MDLocation(line: 255, column: 38, scope: !6)
!186 = !MDLocation(line: 255, column: 14, scope: !6)
!187 = !MDLocation(line: 255, column: 40, scope: !6)
!188 = !MDLocation(line: 255, column: 44, scope: !6)
!189 = !MDLocation(line: 255, column: 13, scope: !6)
!190 = !MDLocation(line: 255, column: 46, scope: !6)
!191 = !MDLocation(line: 255, column: 50, scope: !6)
!192 = !MDLocation(line: 255, column: 12, scope: !6)
!193 = !MDLocation(line: 255, column: 52, scope: !6)
!194 = !MDLocation(line: 255, column: 4, scope: !6)
!195 = !MDLocation(line: 256, column: 9, scope: !6)
!196 = !MDLocation(line: 256, column: 12, scope: !6)
!197 = !MDLocation(line: 256, column: 15, scope: !6)
!198 = !MDLocation(line: 256, column: 18, scope: !6)
!199 = !MDLocation(line: 256, column: 21, scope: !6)
!200 = !MDLocation(line: 256, column: 24, scope: !6)
!201 = !MDLocation(line: 256, column: 27, scope: !6)
!202 = !MDLocation(line: 256, column: 29, scope: !6)
!203 = !MDLocation(line: 256, column: 33, scope: !6)
!204 = !MDLocation(line: 256, column: 37, scope: !6)
!205 = !MDLocation(line: 256, column: 41, scope: !6)
!206 = !MDLocation(line: 256, column: 45, scope: !6)
!207 = !MDLocation(line: 256, column: 49, scope: !6)
!208 = !MDLocation(line: 256, column: 4, scope: !6)
!209 = !MDLocation(line: 257, column: 9, scope: !6)
!210 = !MDLocation(line: 257, column: 14, scope: !6)
!211 = !MDLocation(line: 257, column: 19, scope: !6)
!212 = !MDLocation(line: 257, column: 4, scope: !6)
!213 = !MDLocation(line: 259, column: 9, scope: !6)
!214 = !MDLocation(line: 259, column: 15, scope: !6)
!215 = !MDLocation(line: 259, column: 20, scope: !6)
!216 = !MDLocation(line: 259, column: 26, scope: !6)
!217 = !MDLocation(line: 259, column: 32, scope: !6)
!218 = !MDLocation(line: 259, column: 4, scope: !6)
!219 = !MDLocation(line: 260, column: 4, scope: !6)
!220 = !MDLocation(line: 261, column: 9, scope: !6)
!221 = !MDLocation(line: 261, column: 14, scope: !6)
!222 = !MDLocation(line: 261, column: 4, scope: !6)
!223 = !MDLocation(line: 267, column: 11, scope: !6)
!224 = !MDLocation(line: 266, column: 4, scope: !6)
!225 = !MDLocation(line: 271, column: 4, scope: !6)
