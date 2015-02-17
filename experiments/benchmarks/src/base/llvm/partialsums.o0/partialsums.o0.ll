; ModuleID = 'partialsums.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%.9f\09%s\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"(2/3)^k\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"k^-0.5\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"1/k(k+1)\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"Flint Hills\00", align 1
@.str5 = private unnamed_addr constant [14 x i8] c"Cookson Hills\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"Harmonic\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Riemann Zeta\00", align 1
@.str8 = private unnamed_addr constant [21 x i8] c"Alternating Harmonic\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"Gregory\00", align 1

; Function Attrs: nounwind uwtable
define <2 x double> @make_vec(double %a, double %b) #0 {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  %v = alloca <2 x double>, align 16
  %tmp = alloca double*, align 8
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !28, metadata !29), !dbg !30
  store double %b, double* %b.addr, align 8
  call void @llvm.dbg.declare(metadata double* %b.addr, metadata !31, metadata !29), !dbg !32
  call void @llvm.dbg.declare(metadata <2 x double>* %v, metadata !33, metadata !29), !dbg !34
  call void @llvm.dbg.declare(metadata double** %tmp, metadata !35, metadata !29), !dbg !36
  %0 = bitcast <2 x double>* %v to double*, !dbg !37
  store double* %0, double** %tmp, align 8, !dbg !38
  %1 = load double* %a.addr, align 8, !dbg !39
  %2 = load double** %tmp, align 8, !dbg !40
  store double %1, double* %2, align 8, !dbg !41
  %3 = load double* %b.addr, align 8, !dbg !42
  %4 = load double** %tmp, align 8, !dbg !43
  %add.ptr = getelementptr inbounds double* %4, i64 1, !dbg !43
  store double %3, double* %add.ptr, align 8, !dbg !44
  %5 = load <2 x double>* %v, align 16, !dbg !45
  ret <2 x double> %5, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @sum_vec(<2 x double> %x) #0 {
entry:
  %x.addr = alloca <2 x double>, align 16
  %tmp = alloca double*, align 8
  store <2 x double> %x, <2 x double>* %x.addr, align 16
  call void @llvm.dbg.declare(metadata <2 x double>* %x.addr, metadata !47, metadata !29), !dbg !48
  call void @llvm.dbg.declare(metadata double** %tmp, metadata !49, metadata !29), !dbg !50
  %0 = bitcast <2 x double>* %x.addr to double*, !dbg !51
  store double* %0, double** %tmp, align 8, !dbg !50
  %1 = load double** %tmp, align 8, !dbg !52
  %2 = load double* %1, align 8, !dbg !53
  %3 = load double** %tmp, align 8, !dbg !54
  %add.ptr = getelementptr inbounds double* %3, i64 1, !dbg !54
  %4 = load double* %add.ptr, align 8, !dbg !55
  %add = fadd double %2, %4, !dbg !53
  ret double %add, !dbg !56
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %twoThrd = alloca double, align 8
  %sqrts = alloca double, align 8
  %Flint = alloca double, align 8
  %Cookson = alloca double, align 8
  %Harmonic = alloca <2 x double>, align 16
  %zeta = alloca <2 x double>, align 16
  %poly = alloca <2 x double>, align 16
  %alt = alloca <2 x double>, align 16
  %Gregory = alloca <2 x double>, align 16
  %zero = alloca <2 x double>, align 16
  %one = alloca <2 x double>, align 16
  %two = alloca <2 x double>, align 16
  %init = alloca <2 x double>, align 16
  %m_one = alloca <2 x double>, align 16
  %kv = alloca <2 x double>, align 16
  %av = alloca <2 x double>, align 16
  %k = alloca double, align 8
  %k3 = alloca double, align 8
  %s = alloca double, align 8
  %c = alloca double, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !29), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !29), !dbg !60
  call void @llvm.dbg.declare(metadata double* %twoThrd, metadata !61, metadata !29), !dbg !62
  store double 0.000000e+00, double* %twoThrd, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata double* %sqrts, metadata !63, metadata !29), !dbg !64
  store double 0.000000e+00, double* %sqrts, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata double* %Flint, metadata !65, metadata !29), !dbg !66
  store double 0.000000e+00, double* %Flint, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata double* %Cookson, metadata !67, metadata !29), !dbg !68
  store double 0.000000e+00, double* %Cookson, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata <2 x double>* %Harmonic, metadata !69, metadata !29), !dbg !70
  call void @llvm.dbg.declare(metadata <2 x double>* %zeta, metadata !71, metadata !29), !dbg !72
  call void @llvm.dbg.declare(metadata <2 x double>* %poly, metadata !73, metadata !29), !dbg !74
  call void @llvm.dbg.declare(metadata <2 x double>* %alt, metadata !75, metadata !29), !dbg !76
  call void @llvm.dbg.declare(metadata <2 x double>* %Gregory, metadata !77, metadata !29), !dbg !78
  call void @llvm.dbg.declare(metadata <2 x double>* %zero, metadata !79, metadata !29), !dbg !80
  call void @llvm.dbg.declare(metadata <2 x double>* %one, metadata !81, metadata !29), !dbg !82
  call void @llvm.dbg.declare(metadata <2 x double>* %two, metadata !83, metadata !29), !dbg !84
  call void @llvm.dbg.declare(metadata <2 x double>* %init, metadata !85, metadata !29), !dbg !86
  call void @llvm.dbg.declare(metadata <2 x double>* %m_one, metadata !87, metadata !29), !dbg !88
  call void @llvm.dbg.declare(metadata <2 x double>* %kv, metadata !89, metadata !29), !dbg !90
  call void @llvm.dbg.declare(metadata <2 x double>* %av, metadata !91, metadata !29), !dbg !92
  call void @llvm.dbg.declare(metadata double* %k, metadata !93, metadata !29), !dbg !94
  call void @llvm.dbg.declare(metadata double* %k3, metadata !95, metadata !29), !dbg !96
  call void @llvm.dbg.declare(metadata double* %s, metadata !97, metadata !29), !dbg !98
  call void @llvm.dbg.declare(metadata double* %c, metadata !99, metadata !29), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %n, metadata !101, metadata !29), !dbg !102
  store i32 2500000, i32* %n, align 4, !dbg !103
  %call = call <2 x double> @make_vec(double 0.000000e+00, double 0.000000e+00), !dbg !104
  store <2 x double> %call, <2 x double>* %zero, align 16, !dbg !105
  %call1 = call <2 x double> @make_vec(double 1.000000e+00, double 1.000000e+00), !dbg !106
  store <2 x double> %call1, <2 x double>* %one, align 16, !dbg !107
  %call2 = call <2 x double> @make_vec(double 2.000000e+00, double 2.000000e+00), !dbg !108
  store <2 x double> %call2, <2 x double>* %two, align 16, !dbg !109
  %call3 = call <2 x double> @make_vec(double -1.000000e+00, double -1.000000e+00), !dbg !110
  store <2 x double> %call3, <2 x double>* %m_one, align 16, !dbg !111
  %call4 = call <2 x double> @make_vec(double 1.000000e+00, double 2.000000e+00), !dbg !112
  store <2 x double> %call4, <2 x double>* %init, align 16, !dbg !113
  %call5 = call <2 x double> @make_vec(double 1.000000e+00, double -1.000000e+00), !dbg !114
  store <2 x double> %call5, <2 x double>* %av, align 16, !dbg !115
  %0 = load <2 x double>* %zero, align 16, !dbg !116
  store <2 x double> %0, <2 x double>* %Gregory, align 16, !dbg !117
  store <2 x double> %0, <2 x double>* %alt, align 16, !dbg !118
  store <2 x double> %0, <2 x double>* %poly, align 16, !dbg !119
  store <2 x double> %0, <2 x double>* %zeta, align 16, !dbg !120
  store <2 x double> %0, <2 x double>* %Harmonic, align 16, !dbg !121
  store double 1.000000e+00, double* %k, align 8, !dbg !122
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load double* %k, align 8, !dbg !124
  %2 = load i32* %n, align 4, !dbg !128
  %conv = sitofp i32 %2 to double, !dbg !128
  %cmp = fcmp ole double %1, %conv, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %3 = load double* %k, align 8, !dbg !131
  %sub = fsub double %3, 1.000000e+00, !dbg !131
  %call7 = call double @pow(double 0x3FE5555555555555, double %sub) #4, !dbg !133
  %4 = load double* %twoThrd, align 8, !dbg !134
  %add = fadd double %4, %call7, !dbg !134
  store double %add, double* %twoThrd, align 8, !dbg !134
  %5 = load double* %k, align 8, !dbg !135
  %call8 = call double @sqrt(double %5) #4, !dbg !136
  %div = fdiv double 1.000000e+00, %call8, !dbg !137
  %6 = load double* %sqrts, align 8, !dbg !138
  %add9 = fadd double %6, %div, !dbg !138
  store double %add9, double* %sqrts, align 8, !dbg !138
  %7 = load double* %k, align 8, !dbg !139
  %8 = load double* %k, align 8, !dbg !140
  %mul = fmul double %7, %8, !dbg !139
  %9 = load double* %k, align 8, !dbg !141
  %mul10 = fmul double %mul, %9, !dbg !139
  store double %mul10, double* %k3, align 8, !dbg !142
  %10 = load double* %k, align 8, !dbg !143
  %call11 = call double @sin(double %10) #4, !dbg !144
  store double %call11, double* %s, align 8, !dbg !145
  %11 = load double* %k, align 8, !dbg !146
  %call12 = call double @cos(double %11) #4, !dbg !147
  store double %call12, double* %c, align 8, !dbg !148
  %12 = load double* %k3, align 8, !dbg !149
  %13 = load double* %s, align 8, !dbg !150
  %mul13 = fmul double %12, %13, !dbg !149
  %14 = load double* %s, align 8, !dbg !151
  %mul14 = fmul double %mul13, %14, !dbg !149
  %div15 = fdiv double 1.000000e+00, %mul14, !dbg !152
  %15 = load double* %Flint, align 8, !dbg !153
  %add16 = fadd double %15, %div15, !dbg !153
  store double %add16, double* %Flint, align 8, !dbg !153
  %16 = load double* %k3, align 8, !dbg !154
  %17 = load double* %c, align 8, !dbg !155
  %mul17 = fmul double %16, %17, !dbg !154
  %18 = load double* %c, align 8, !dbg !156
  %mul18 = fmul double %mul17, %18, !dbg !154
  %div19 = fdiv double 1.000000e+00, %mul18, !dbg !157
  %19 = load double* %Cookson, align 8, !dbg !158
  %add20 = fadd double %19, %div19, !dbg !158
  store double %add20, double* %Cookson, align 8, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %20 = load double* %k, align 8, !dbg !160
  %inc = fadd double %20, 1.000000e+00, !dbg !160
  store double %inc, double* %k, align 8, !dbg !160
  br label %for.cond, !dbg !161

for.end:                                          ; preds = %for.cond
  %21 = load <2 x double>* %init, align 16, !dbg !162
  store <2 x double> %21, <2 x double>* %kv, align 16, !dbg !164
  br label %for.cond21, !dbg !164

for.cond21:                                       ; preds = %for.inc41, %for.end
  %22 = bitcast <2 x double>* %kv to double*, !dbg !165
  %23 = load double* %22, align 8, !dbg !169
  %24 = load i32* %n, align 4, !dbg !170
  %conv22 = sitofp i32 %24 to double, !dbg !170
  %cmp23 = fcmp ole double %23, %conv22, !dbg !169
  br i1 %cmp23, label %for.body25, label %for.end43, !dbg !171

for.body25:                                       ; preds = %for.cond21
  %25 = load <2 x double>* %one, align 16, !dbg !172
  %26 = load <2 x double>* %kv, align 16, !dbg !174
  %27 = load <2 x double>* %kv, align 16, !dbg !175
  %28 = load <2 x double>* %one, align 16, !dbg !176
  %add26 = fadd <2 x double> %27, %28, !dbg !175
  %mul27 = fmul <2 x double> %26, %add26, !dbg !174
  %div28 = fdiv <2 x double> %25, %mul27, !dbg !172
  %29 = load <2 x double>* %poly, align 16, !dbg !177
  %add29 = fadd <2 x double> %29, %div28, !dbg !177
  store <2 x double> %add29, <2 x double>* %poly, align 16, !dbg !177
  %30 = load <2 x double>* %one, align 16, !dbg !178
  %31 = load <2 x double>* %kv, align 16, !dbg !179
  %div30 = fdiv <2 x double> %30, %31, !dbg !178
  %32 = load <2 x double>* %Harmonic, align 16, !dbg !180
  %add31 = fadd <2 x double> %32, %div30, !dbg !180
  store <2 x double> %add31, <2 x double>* %Harmonic, align 16, !dbg !180
  %33 = load <2 x double>* %one, align 16, !dbg !181
  %34 = load <2 x double>* %kv, align 16, !dbg !182
  %35 = load <2 x double>* %kv, align 16, !dbg !183
  %mul32 = fmul <2 x double> %34, %35, !dbg !182
  %div33 = fdiv <2 x double> %33, %mul32, !dbg !181
  %36 = load <2 x double>* %zeta, align 16, !dbg !184
  %add34 = fadd <2 x double> %36, %div33, !dbg !184
  store <2 x double> %add34, <2 x double>* %zeta, align 16, !dbg !184
  %37 = load <2 x double>* %av, align 16, !dbg !185
  %38 = load <2 x double>* %kv, align 16, !dbg !186
  %div35 = fdiv <2 x double> %37, %38, !dbg !185
  %39 = load <2 x double>* %alt, align 16, !dbg !187
  %add36 = fadd <2 x double> %39, %div35, !dbg !187
  store <2 x double> %add36, <2 x double>* %alt, align 16, !dbg !187
  %40 = load <2 x double>* %av, align 16, !dbg !188
  %41 = load <2 x double>* %two, align 16, !dbg !189
  %42 = load <2 x double>* %kv, align 16, !dbg !190
  %mul37 = fmul <2 x double> %41, %42, !dbg !189
  %43 = load <2 x double>* %one, align 16, !dbg !191
  %sub38 = fsub <2 x double> %mul37, %43, !dbg !189
  %div39 = fdiv <2 x double> %40, %sub38, !dbg !188
  %44 = load <2 x double>* %Gregory, align 16, !dbg !192
  %add40 = fadd <2 x double> %44, %div39, !dbg !192
  store <2 x double> %add40, <2 x double>* %Gregory, align 16, !dbg !192
  br label %for.inc41, !dbg !193

for.inc41:                                        ; preds = %for.body25
  %45 = load <2 x double>* %two, align 16, !dbg !194
  %46 = load <2 x double>* %kv, align 16, !dbg !195
  %add42 = fadd <2 x double> %46, %45, !dbg !195
  store <2 x double> %add42, <2 x double>* %kv, align 16, !dbg !195
  br label %for.cond21, !dbg !196

for.end43:                                        ; preds = %for.cond21
  %47 = load double* %twoThrd, align 8, !dbg !197
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %47, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0)), !dbg !197
  %48 = load double* %sqrts, align 8, !dbg !198
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %48, i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)), !dbg !198
  %49 = load <2 x double>* %poly, align 16, !dbg !199
  %call46 = call double @sum_vec(<2 x double> %49), !dbg !199
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %call46, i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0)), !dbg !199
  %50 = load double* %Flint, align 8, !dbg !200
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %50, i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0)), !dbg !200
  %51 = load double* %Cookson, align 8, !dbg !201
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %51, i8* getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0)), !dbg !201
  %52 = load <2 x double>* %Harmonic, align 16, !dbg !202
  %call50 = call double @sum_vec(<2 x double> %52), !dbg !202
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %call50, i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0)), !dbg !202
  %53 = load <2 x double>* %zeta, align 16, !dbg !203
  %call52 = call double @sum_vec(<2 x double> %53), !dbg !203
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %call52, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0)), !dbg !203
  %54 = load <2 x double>* %alt, align 16, !dbg !204
  %call54 = call double @sum_vec(<2 x double> %54), !dbg !204
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %call54, i8* getelementptr inbounds ([21 x i8]* @.str8, i32 0, i32 0)), !dbg !204
  %55 = load <2 x double>* %Gregory, align 16, !dbg !205
  %call56 = call double @sum_vec(<2 x double> %55), !dbg !205
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %call56, i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0)), !dbg !205
  ret i32 0, !dbg !206
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !6, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c] [DW_LANG_C99]
!1 = !{!"partialsums.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!5 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!6 = !{!7, !15, !18}
!7 = !{!"0x2e\00make_vec\00make_vec\00\0012\000\001\000\000\00256\000\0013", !1, !8, !9, null, <2 x double> (double, double)* @make_vec, null, null, !2} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [make_vec]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11, !5, !5}
!11 = !{!"0x16\00v2df\0010\000\000\000\000", !1, null, !12} ; [ DW_TAG_typedef ] [v2df] [line 10, size 0, align 0, offset 0] [from ]
!12 = !{!"0x1\00\000\00128\00128\000\002048\000", null, null, !5, !13, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 128, offset 0] [vector] [from double]
!13 = !{!14}
!14 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!15 = !{!"0x2e\00sum_vec\00sum_vec\00\0020\000\001\000\000\00256\000\0021", !1, !8, !16, null, double (<2 x double>)* @sum_vec, null, null, !2} ; [ DW_TAG_subprogram ] [line 20] [def] [scope 21] [sum_vec]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!5, !11}
!18 = !{!"0x2e\00main\00main\00\0026\000\001\000\000\00256\000\0027", !1, !8, !19, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [main]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!21, !21, !22}
!21 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!24 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!25 = !{i32 2, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 2}
!27 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!28 = !{!"0x101\00a\0016777228\000", !7, !8, !5}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!29 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!30 = !MDLocation(line: 12, column: 22, scope: !7)
!31 = !{!"0x101\00b\0033554444\000", !7, !8, !5}  ; [ DW_TAG_arg_variable ] [b] [line 12]
!32 = !MDLocation(line: 12, column: 32, scope: !7)
!33 = !{!"0x100\00v\0014\000", !7, !8, !11}       ; [ DW_TAG_auto_variable ] [v] [line 14]
!34 = !MDLocation(line: 14, column: 10, scope: !7)
!35 = !{!"0x100\00tmp\0015\000", !7, !8, !4}      ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!36 = !MDLocation(line: 15, column: 13, scope: !7)
!37 = !MDLocation(line: 16, column: 11, scope: !7)
!38 = !MDLocation(line: 16, column: 5, scope: !7)
!39 = !MDLocation(line: 16, column: 34, scope: !7)
!40 = !MDLocation(line: 16, column: 27, scope: !7)
!41 = !MDLocation(line: 16, column: 25, scope: !7)
!42 = !MDLocation(line: 16, column: 48, scope: !7)
!43 = !MDLocation(line: 16, column: 39, scope: !7)
!44 = !MDLocation(line: 16, column: 37, scope: !7)
!45 = !MDLocation(line: 17, column: 12, scope: !7)
!46 = !MDLocation(line: 17, column: 5, scope: !7)
!47 = !{!"0x101\00x\0016777236\000", !15, !8, !11} ; [ DW_TAG_arg_variable ] [x] [line 20]
!48 = !MDLocation(line: 20, column: 21, scope: !15)
!49 = !{!"0x100\00tmp\0022\000", !15, !8, !4}     ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!50 = !MDLocation(line: 22, column: 13, scope: !15)
!51 = !MDLocation(line: 22, column: 19, scope: !15)
!52 = !MDLocation(line: 23, column: 14, scope: !15)
!53 = !MDLocation(line: 23, column: 12, scope: !15)
!54 = !MDLocation(line: 23, column: 23, scope: !15)
!55 = !MDLocation(line: 23, column: 21, scope: !15)
!56 = !MDLocation(line: 23, column: 5, scope: !15)
!57 = !{!"0x101\00argc\0016777242\000", !18, !8, !21} ; [ DW_TAG_arg_variable ] [argc] [line 26]
!58 = !MDLocation(line: 26, column: 14, scope: !18)
!59 = !{!"0x101\00argv\0033554458\000", !18, !8, !22} ; [ DW_TAG_arg_variable ] [argv] [line 26]
!60 = !MDLocation(line: 26, column: 26, scope: !18)
!61 = !{!"0x100\00twoThrd\0028\000", !18, !8, !5} ; [ DW_TAG_auto_variable ] [twoThrd] [line 28]
!62 = !MDLocation(line: 28, column: 13, scope: !18)
!63 = !{!"0x100\00sqrts\0028\000", !18, !8, !5}   ; [ DW_TAG_auto_variable ] [sqrts] [line 28]
!64 = !MDLocation(line: 28, column: 26, scope: !18)
!65 = !{!"0x100\00Flint\0028\000", !18, !8, !5}   ; [ DW_TAG_auto_variable ] [Flint] [line 28]
!66 = !MDLocation(line: 28, column: 37, scope: !18)
!67 = !{!"0x100\00Cookson\0028\000", !18, !8, !5} ; [ DW_TAG_auto_variable ] [Cookson] [line 28]
!68 = !MDLocation(line: 28, column: 48, scope: !18)
!69 = !{!"0x100\00Harmonic\0029\000", !18, !8, !11} ; [ DW_TAG_auto_variable ] [Harmonic] [line 29]
!70 = !MDLocation(line: 29, column: 13, scope: !18)
!71 = !{!"0x100\00zeta\0029\000", !18, !8, !11}   ; [ DW_TAG_auto_variable ] [zeta] [line 29]
!72 = !MDLocation(line: 29, column: 23, scope: !18)
!73 = !{!"0x100\00poly\0029\000", !18, !8, !11}   ; [ DW_TAG_auto_variable ] [poly] [line 29]
!74 = !MDLocation(line: 29, column: 29, scope: !18)
!75 = !{!"0x100\00alt\0029\000", !18, !8, !11}    ; [ DW_TAG_auto_variable ] [alt] [line 29]
!76 = !MDLocation(line: 29, column: 35, scope: !18)
!77 = !{!"0x100\00Gregory\0029\000", !18, !8, !11} ; [ DW_TAG_auto_variable ] [Gregory] [line 29]
!78 = !MDLocation(line: 29, column: 40, scope: !18)
!79 = !{!"0x100\00zero\0030\000", !18, !8, !11}   ; [ DW_TAG_auto_variable ] [zero] [line 30]
!80 = !MDLocation(line: 30, column: 13, scope: !18)
!81 = !{!"0x100\00one\0030\000", !18, !8, !11}    ; [ DW_TAG_auto_variable ] [one] [line 30]
!82 = !MDLocation(line: 30, column: 19, scope: !18)
!83 = !{!"0x100\00two\0030\000", !18, !8, !11}    ; [ DW_TAG_auto_variable ] [two] [line 30]
!84 = !MDLocation(line: 30, column: 24, scope: !18)
!85 = !{!"0x100\00init\0030\000", !18, !8, !11}   ; [ DW_TAG_auto_variable ] [init] [line 30]
!86 = !MDLocation(line: 30, column: 29, scope: !18)
!87 = !{!"0x100\00m_one\0030\000", !18, !8, !11}  ; [ DW_TAG_auto_variable ] [m_one] [line 30]
!88 = !MDLocation(line: 30, column: 35, scope: !18)
!89 = !{!"0x100\00kv\0030\000", !18, !8, !11}     ; [ DW_TAG_auto_variable ] [kv] [line 30]
!90 = !MDLocation(line: 30, column: 42, scope: !18)
!91 = !{!"0x100\00av\0030\000", !18, !8, !11}     ; [ DW_TAG_auto_variable ] [av] [line 30]
!92 = !MDLocation(line: 30, column: 46, scope: !18)
!93 = !{!"0x100\00k\0032\000", !18, !8, !5}       ; [ DW_TAG_auto_variable ] [k] [line 32]
!94 = !MDLocation(line: 32, column: 13, scope: !18)
!95 = !{!"0x100\00k3\0032\000", !18, !8, !5}      ; [ DW_TAG_auto_variable ] [k3] [line 32]
!96 = !MDLocation(line: 32, column: 16, scope: !18)
!97 = !{!"0x100\00s\0032\000", !18, !8, !5}       ; [ DW_TAG_auto_variable ] [s] [line 32]
!98 = !MDLocation(line: 32, column: 20, scope: !18)
!99 = !{!"0x100\00c\0032\000", !18, !8, !5}       ; [ DW_TAG_auto_variable ] [c] [line 32]
!100 = !MDLocation(line: 32, column: 23, scope: !18)
!101 = !{!"0x100\00n\0033\000", !18, !8, !21}     ; [ DW_TAG_auto_variable ] [n] [line 33]
!102 = !MDLocation(line: 33, column: 9, scope: !18)
!103 = !MDLocation(line: 33, column: 13, scope: !18)
!104 = !MDLocation(line: 35, column: 13, scope: !18)
!105 = !MDLocation(line: 35, column: 5, scope: !18)
!106 = !MDLocation(line: 35, column: 44, scope: !18)
!107 = !MDLocation(line: 35, column: 36, scope: !18)
!108 = !MDLocation(line: 36, column: 13, scope: !18)
!109 = !MDLocation(line: 36, column: 5, scope: !18)
!110 = !MDLocation(line: 36, column: 44, scope: !18)
!111 = !MDLocation(line: 36, column: 36, scope: !18)
!112 = !MDLocation(line: 37, column: 13, scope: !18)
!113 = !MDLocation(line: 37, column: 5, scope: !18)
!114 = !MDLocation(line: 37, column: 44, scope: !18)
!115 = !MDLocation(line: 37, column: 36, scope: !18)
!116 = !MDLocation(line: 39, column: 46, scope: !18)
!117 = !MDLocation(line: 39, column: 36, scope: !18)
!118 = !MDLocation(line: 39, column: 30, scope: !18)
!119 = !MDLocation(line: 39, column: 23, scope: !18)
!120 = !MDLocation(line: 39, column: 16, scope: !18)
!121 = !MDLocation(line: 39, column: 5, scope: !18)
!122 = !MDLocation(line: 41, column: 10, scope: !123)
!123 = !{!"0xb\0041\005\000", !1, !18}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!124 = !MDLocation(line: 41, column: 15, scope: !125)
!125 = !{!"0xb\002", !1, !126}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!126 = !{!"0xb\001", !1, !127}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!127 = !{!"0xb\0041\005\001", !1, !123}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!128 = !MDLocation(line: 41, column: 18, scope: !127)
!129 = !MDLocation(line: 41, column: 15, scope: !127)
!130 = !MDLocation(line: 41, column: 5, scope: !123)
!131 = !MDLocation(line: 43, column: 33, scope: !132)
!132 = !{!"0xb\0042\005\002", !1, !127}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!133 = !MDLocation(line: 43, column: 20, scope: !132)
!134 = !MDLocation(line: 43, column: 9, scope: !132)
!135 = !MDLocation(line: 44, column: 29, scope: !132)
!136 = !MDLocation(line: 44, column: 24, scope: !132)
!137 = !MDLocation(line: 44, column: 20, scope: !132)
!138 = !MDLocation(line: 44, column: 9, scope: !132)
!139 = !MDLocation(line: 45, column: 20, scope: !132)
!140 = !MDLocation(line: 45, column: 22, scope: !132)
!141 = !MDLocation(line: 45, column: 24, scope: !132)
!142 = !MDLocation(line: 45, column: 15, scope: !132)
!143 = !MDLocation(line: 46, column: 24, scope: !132)
!144 = !MDLocation(line: 46, column: 20, scope: !132)
!145 = !MDLocation(line: 46, column: 15, scope: !132)
!146 = !MDLocation(line: 46, column: 36, scope: !132)
!147 = !MDLocation(line: 46, column: 32, scope: !132)
!148 = !MDLocation(line: 46, column: 28, scope: !132)
!149 = !MDLocation(line: 47, column: 25, scope: !132)
!150 = !MDLocation(line: 47, column: 30, scope: !132)
!151 = !MDLocation(line: 47, column: 32, scope: !132)
!152 = !MDLocation(line: 47, column: 20, scope: !132)
!153 = !MDLocation(line: 47, column: 9, scope: !132)
!154 = !MDLocation(line: 48, column: 25, scope: !132)
!155 = !MDLocation(line: 48, column: 30, scope: !132)
!156 = !MDLocation(line: 48, column: 32, scope: !132)
!157 = !MDLocation(line: 48, column: 20, scope: !132)
!158 = !MDLocation(line: 48, column: 9, scope: !132)
!159 = !MDLocation(line: 49, column: 5, scope: !132)
!160 = !MDLocation(line: 41, column: 21, scope: !127)
!161 = !MDLocation(line: 41, column: 5, scope: !127)
!162 = !MDLocation(line: 51, column: 13, scope: !163)
!163 = !{!"0xb\0051\005\003", !1, !18}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!164 = !MDLocation(line: 51, column: 10, scope: !163)
!165 = !MDLocation(line: 51, column: 20, scope: !166)
!166 = !{!"0xb\002", !1, !167}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!167 = !{!"0xb\001", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!168 = !{!"0xb\0051\005\004", !1, !163}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!169 = !MDLocation(line: 51, column: 19, scope: !168)
!170 = !MDLocation(line: 51, column: 37, scope: !168)
!171 = !MDLocation(line: 51, column: 5, scope: !163)
!172 = !MDLocation(line: 53, column: 20, scope: !173)
!173 = !{!"0xb\0052\005\005", !1, !168}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!174 = !MDLocation(line: 53, column: 26, scope: !173)
!175 = !MDLocation(line: 53, column: 30, scope: !173)
!176 = !MDLocation(line: 53, column: 33, scope: !173)
!177 = !MDLocation(line: 53, column: 9, scope: !173)
!178 = !MDLocation(line: 54, column: 20, scope: !173)
!179 = !MDLocation(line: 54, column: 26, scope: !173)
!180 = !MDLocation(line: 54, column: 9, scope: !173)
!181 = !MDLocation(line: 55, column: 20, scope: !173)
!182 = !MDLocation(line: 55, column: 26, scope: !173)
!183 = !MDLocation(line: 55, column: 29, scope: !173)
!184 = !MDLocation(line: 55, column: 9, scope: !173)
!185 = !MDLocation(line: 56, column: 21, scope: !173)
!186 = !MDLocation(line: 56, column: 26, scope: !173)
!187 = !MDLocation(line: 56, column: 9, scope: !173)
!188 = !MDLocation(line: 57, column: 21, scope: !173)
!189 = !MDLocation(line: 57, column: 26, scope: !173)
!190 = !MDLocation(line: 57, column: 30, scope: !173)
!191 = !MDLocation(line: 57, column: 35, scope: !173)
!192 = !MDLocation(line: 57, column: 9, scope: !173)
!193 = !MDLocation(line: 58, column: 5, scope: !173)
!194 = !MDLocation(line: 51, column: 44, scope: !168)
!195 = !MDLocation(line: 51, column: 40, scope: !168)
!196 = !MDLocation(line: 51, column: 5, scope: !168)
!197 = !MDLocation(line: 61, column: 5, scope: !18)
!198 = !MDLocation(line: 61, column: 41, scope: !18)
!199 = !MDLocation(line: 62, column: 5, scope: !18)
!200 = !MDLocation(line: 62, column: 41, scope: !18)
!201 = !MDLocation(line: 63, column: 5, scope: !18)
!202 = !MDLocation(line: 63, column: 41, scope: !18)
!203 = !MDLocation(line: 64, column: 5, scope: !18)
!204 = !MDLocation(line: 64, column: 41, scope: !18)
!205 = !MDLocation(line: 65, column: 5, scope: !18)
!206 = !MDLocation(line: 67, column: 5, scope: !18)
