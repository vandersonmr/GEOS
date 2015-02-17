; ModuleID = 'perlin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@p = internal global [512 x i32] zeroinitializer, align 16
@permutation = internal global [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %sum = alloca double, align 8
  store i32 0, i32* %retval
  %call = call i32 @init(), !dbg !33
  call void @llvm.dbg.declare(metadata double* %x, metadata !34, metadata !35), !dbg !36
  call void @llvm.dbg.declare(metadata double* %y, metadata !37, metadata !35), !dbg !38
  call void @llvm.dbg.declare(metadata double* %z, metadata !39, metadata !35), !dbg !40
  call void @llvm.dbg.declare(metadata double* %sum, metadata !41, metadata !35), !dbg !42
  store double 0.000000e+00, double* %sum, align 8, !dbg !42
  store double -1.135257e+04, double* %x, align 8, !dbg !43
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load double* %x, align 8, !dbg !45
  %cmp = fcmp olt double %0, 2.356157e+04, !dbg !45
  br i1 %cmp, label %for.body, label %for.end14, !dbg !49

for.body:                                         ; preds = %for.cond
  store double -3.461235e+02, double* %y, align 8, !dbg !50
  br label %for.cond1, !dbg !50

for.cond1:                                        ; preds = %for.inc9, %for.body
  %1 = load double* %y, align 8, !dbg !52
  %cmp2 = fcmp olt double %1, 1.241240e+02, !dbg !52
  br i1 %cmp2, label %for.body3, label %for.end11, !dbg !56

for.body3:                                        ; preds = %for.cond1
  store double -1.562350e+02, double* %z, align 8, !dbg !57
  br label %for.cond4, !dbg !57

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load double* %y, align 8, !dbg !59
  %cmp5 = fcmp olt double %2, 2.323450e+01, !dbg !59
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !63

for.body6:                                        ; preds = %for.cond4
  %3 = load double* %x, align 8, !dbg !64
  %4 = load double* %y, align 8, !dbg !65
  %5 = load double* %z, align 8, !dbg !66
  %call7 = call double @noise(double %3, double %4, double %5), !dbg !67
  %6 = load double* %sum, align 8, !dbg !68
  %add = fadd double %6, %call7, !dbg !68
  store double %add, double* %sum, align 8, !dbg !68
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body6
  %7 = load double* %y, align 8, !dbg !69
  %add8 = fadd double %7, 2.450000e+00, !dbg !69
  store double %add8, double* %y, align 8, !dbg !69
  br label %for.cond4, !dbg !70

for.end:                                          ; preds = %for.cond4
  br label %for.inc9, !dbg !71

for.inc9:                                         ; preds = %for.end
  %8 = load double* %y, align 8, !dbg !72
  %add10 = fadd double %8, 1.432500e+00, !dbg !72
  store double %add10, double* %y, align 8, !dbg !72
  br label %for.cond1, !dbg !73

for.end11:                                        ; preds = %for.cond1
  br label %for.inc12, !dbg !74

for.inc12:                                        ; preds = %for.end11
  %9 = load double* %x, align 8, !dbg !75
  %add13 = fadd double %9, 1.235000e-01, !dbg !75
  store double %add13, double* %x, align 8, !dbg !75
  br label %for.cond, !dbg !76

for.end14:                                        ; preds = %for.cond
  %10 = load double* %sum, align 8, !dbg !77
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %10), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal double @noise(double %x, double %y, double %z) #0 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %z.addr = alloca double, align 8
  %X = alloca i32, align 4
  %Y = alloca i32, align 4
  %Z = alloca i32, align 4
  %u = alloca double, align 8
  %v = alloca double, align 8
  %w = alloca double, align 8
  %A = alloca i32, align 4
  %AA = alloca i32, align 4
  %AB = alloca i32, align 4
  %B = alloca i32, align 4
  %BA = alloca i32, align 4
  %BB = alloca i32, align 4
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !80, metadata !35), !dbg !81
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !82, metadata !35), !dbg !83
  store double %z, double* %z.addr, align 8
  call void @llvm.dbg.declare(metadata double* %z.addr, metadata !84, metadata !35), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %X, metadata !86, metadata !35), !dbg !87
  %0 = load double* %x.addr, align 8, !dbg !88
  %call = call double @floor(double %0) #1, !dbg !89
  %conv = fptosi double %call to i32, !dbg !90
  %and = and i32 %conv, 255, !dbg !90
  store i32 %and, i32* %X, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %Y, metadata !91, metadata !35), !dbg !92
  %1 = load double* %y.addr, align 8, !dbg !93
  %call1 = call double @floor(double %1) #1, !dbg !94
  %conv2 = fptosi double %call1 to i32, !dbg !95
  %and3 = and i32 %conv2, 255, !dbg !95
  store i32 %and3, i32* %Y, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i32* %Z, metadata !96, metadata !35), !dbg !97
  %2 = load double* %z.addr, align 8, !dbg !98
  %call4 = call double @floor(double %2) #1, !dbg !99
  %conv5 = fptosi double %call4 to i32, !dbg !100
  %and6 = and i32 %conv5, 255, !dbg !100
  store i32 %and6, i32* %Z, align 4, !dbg !97
  %3 = load double* %x.addr, align 8, !dbg !101
  %call7 = call double @floor(double %3) #1, !dbg !102
  %4 = load double* %x.addr, align 8, !dbg !103
  %sub = fsub double %4, %call7, !dbg !103
  store double %sub, double* %x.addr, align 8, !dbg !103
  %5 = load double* %y.addr, align 8, !dbg !104
  %call8 = call double @floor(double %5) #1, !dbg !105
  %6 = load double* %y.addr, align 8, !dbg !106
  %sub9 = fsub double %6, %call8, !dbg !106
  store double %sub9, double* %y.addr, align 8, !dbg !106
  %7 = load double* %z.addr, align 8, !dbg !107
  %call10 = call double @floor(double %7) #1, !dbg !108
  %8 = load double* %z.addr, align 8, !dbg !109
  %sub11 = fsub double %8, %call10, !dbg !109
  store double %sub11, double* %z.addr, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata double* %u, metadata !110, metadata !35), !dbg !111
  %9 = load double* %x.addr, align 8, !dbg !112
  %call12 = call double @fade(double %9), !dbg !113
  store double %call12, double* %u, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata double* %v, metadata !114, metadata !35), !dbg !115
  %10 = load double* %y.addr, align 8, !dbg !116
  %call13 = call double @fade(double %10), !dbg !117
  store double %call13, double* %v, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata double* %w, metadata !118, metadata !35), !dbg !119
  %11 = load double* %z.addr, align 8, !dbg !120
  %call14 = call double @fade(double %11), !dbg !121
  store double %call14, double* %w, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32* %A, metadata !122, metadata !35), !dbg !123
  %12 = load i32* %X, align 4, !dbg !124
  %idxprom = sext i32 %12 to i64, !dbg !125
  %arrayidx = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom, !dbg !125
  %13 = load i32* %arrayidx, align 4, !dbg !125
  %14 = load i32* %Y, align 4, !dbg !126
  %add = add nsw i32 %13, %14, !dbg !125
  store i32 %add, i32* %A, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %AA, metadata !127, metadata !35), !dbg !128
  %15 = load i32* %A, align 4, !dbg !129
  %idxprom15 = sext i32 %15 to i64, !dbg !130
  %arrayidx16 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom15, !dbg !130
  %16 = load i32* %arrayidx16, align 4, !dbg !130
  %17 = load i32* %Z, align 4, !dbg !131
  %add17 = add nsw i32 %16, %17, !dbg !130
  store i32 %add17, i32* %AA, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata i32* %AB, metadata !132, metadata !35), !dbg !133
  %18 = load i32* %A, align 4, !dbg !134
  %add18 = add nsw i32 %18, 1, !dbg !134
  %idxprom19 = sext i32 %add18 to i64, !dbg !135
  %arrayidx20 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom19, !dbg !135
  %19 = load i32* %arrayidx20, align 4, !dbg !135
  %20 = load i32* %Z, align 4, !dbg !136
  %add21 = add nsw i32 %19, %20, !dbg !135
  store i32 %add21, i32* %AB, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata i32* %B, metadata !137, metadata !35), !dbg !138
  %21 = load i32* %X, align 4, !dbg !139
  %add22 = add nsw i32 %21, 1, !dbg !139
  %idxprom23 = sext i32 %add22 to i64, !dbg !140
  %arrayidx24 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom23, !dbg !140
  %22 = load i32* %arrayidx24, align 4, !dbg !140
  %23 = load i32* %Y, align 4, !dbg !141
  %add25 = add nsw i32 %22, %23, !dbg !140
  store i32 %add25, i32* %B, align 4, !dbg !138
  call void @llvm.dbg.declare(metadata i32* %BA, metadata !142, metadata !35), !dbg !143
  %24 = load i32* %B, align 4, !dbg !144
  %idxprom26 = sext i32 %24 to i64, !dbg !145
  %arrayidx27 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom26, !dbg !145
  %25 = load i32* %arrayidx27, align 4, !dbg !145
  %26 = load i32* %Z, align 4, !dbg !146
  %add28 = add nsw i32 %25, %26, !dbg !145
  store i32 %add28, i32* %BA, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata i32* %BB, metadata !147, metadata !35), !dbg !148
  %27 = load i32* %B, align 4, !dbg !149
  %add29 = add nsw i32 %27, 1, !dbg !149
  %idxprom30 = sext i32 %add29 to i64, !dbg !150
  %arrayidx31 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom30, !dbg !150
  %28 = load i32* %arrayidx31, align 4, !dbg !150
  %29 = load i32* %Z, align 4, !dbg !151
  %add32 = add nsw i32 %28, %29, !dbg !150
  store i32 %add32, i32* %BB, align 4, !dbg !148
  %30 = load double* %w, align 8, !dbg !152
  %31 = load double* %v, align 8, !dbg !153
  %32 = load double* %u, align 8, !dbg !154
  %33 = load i32* %AA, align 4, !dbg !155
  %idxprom33 = sext i32 %33 to i64, !dbg !156
  %arrayidx34 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom33, !dbg !156
  %34 = load i32* %arrayidx34, align 4, !dbg !156
  %35 = load double* %x.addr, align 8, !dbg !157
  %36 = load double* %y.addr, align 8, !dbg !158
  %37 = load double* %z.addr, align 8, !dbg !159
  %call35 = call double @grad(i32 %34, double %35, double %36, double %37), !dbg !160
  %38 = load i32* %BA, align 4, !dbg !161
  %idxprom36 = sext i32 %38 to i64, !dbg !162
  %arrayidx37 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom36, !dbg !162
  %39 = load i32* %arrayidx37, align 4, !dbg !162
  %40 = load double* %x.addr, align 8, !dbg !163
  %sub38 = fsub double %40, 1.000000e+00, !dbg !163
  %41 = load double* %y.addr, align 8, !dbg !164
  %42 = load double* %z.addr, align 8, !dbg !165
  %call39 = call double @grad(i32 %39, double %sub38, double %41, double %42), !dbg !166
  %call40 = call double @lerp(double %32, double %call35, double %call39), !dbg !167
  %43 = load double* %u, align 8, !dbg !168
  %44 = load i32* %AB, align 4, !dbg !169
  %idxprom41 = sext i32 %44 to i64, !dbg !170
  %arrayidx42 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom41, !dbg !170
  %45 = load i32* %arrayidx42, align 4, !dbg !170
  %46 = load double* %x.addr, align 8, !dbg !171
  %47 = load double* %y.addr, align 8, !dbg !172
  %sub43 = fsub double %47, 1.000000e+00, !dbg !172
  %48 = load double* %z.addr, align 8, !dbg !173
  %call44 = call double @grad(i32 %45, double %46, double %sub43, double %48), !dbg !174
  %49 = load i32* %BB, align 4, !dbg !175
  %idxprom45 = sext i32 %49 to i64, !dbg !176
  %arrayidx46 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom45, !dbg !176
  %50 = load i32* %arrayidx46, align 4, !dbg !176
  %51 = load double* %x.addr, align 8, !dbg !177
  %sub47 = fsub double %51, 1.000000e+00, !dbg !177
  %52 = load double* %y.addr, align 8, !dbg !178
  %sub48 = fsub double %52, 1.000000e+00, !dbg !178
  %53 = load double* %z.addr, align 8, !dbg !179
  %call49 = call double @grad(i32 %50, double %sub47, double %sub48, double %53), !dbg !180
  %call50 = call double @lerp(double %43, double %call44, double %call49), !dbg !181
  %call51 = call double @lerp(double %31, double %call40, double %call50), !dbg !182
  %54 = load double* %v, align 8, !dbg !183
  %55 = load double* %u, align 8, !dbg !184
  %56 = load i32* %AA, align 4, !dbg !185
  %add52 = add nsw i32 %56, 1, !dbg !185
  %idxprom53 = sext i32 %add52 to i64, !dbg !186
  %arrayidx54 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom53, !dbg !186
  %57 = load i32* %arrayidx54, align 4, !dbg !186
  %58 = load double* %x.addr, align 8, !dbg !187
  %59 = load double* %y.addr, align 8, !dbg !188
  %60 = load double* %z.addr, align 8, !dbg !189
  %sub55 = fsub double %60, 1.000000e+00, !dbg !189
  %call56 = call double @grad(i32 %57, double %58, double %59, double %sub55), !dbg !190
  %61 = load i32* %BA, align 4, !dbg !191
  %add57 = add nsw i32 %61, 1, !dbg !191
  %idxprom58 = sext i32 %add57 to i64, !dbg !192
  %arrayidx59 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom58, !dbg !192
  %62 = load i32* %arrayidx59, align 4, !dbg !192
  %63 = load double* %x.addr, align 8, !dbg !193
  %sub60 = fsub double %63, 1.000000e+00, !dbg !193
  %64 = load double* %y.addr, align 8, !dbg !194
  %65 = load double* %z.addr, align 8, !dbg !195
  %sub61 = fsub double %65, 1.000000e+00, !dbg !195
  %call62 = call double @grad(i32 %62, double %sub60, double %64, double %sub61), !dbg !196
  %call63 = call double @lerp(double %55, double %call56, double %call62), !dbg !197
  %66 = load double* %u, align 8, !dbg !198
  %67 = load i32* %AB, align 4, !dbg !199
  %add64 = add nsw i32 %67, 1, !dbg !199
  %idxprom65 = sext i32 %add64 to i64, !dbg !200
  %arrayidx66 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom65, !dbg !200
  %68 = load i32* %arrayidx66, align 4, !dbg !200
  %69 = load double* %x.addr, align 8, !dbg !201
  %70 = load double* %y.addr, align 8, !dbg !202
  %sub67 = fsub double %70, 1.000000e+00, !dbg !202
  %71 = load double* %z.addr, align 8, !dbg !203
  %sub68 = fsub double %71, 1.000000e+00, !dbg !203
  %call69 = call double @grad(i32 %68, double %69, double %sub67, double %sub68), !dbg !204
  %72 = load i32* %BB, align 4, !dbg !205
  %add70 = add nsw i32 %72, 1, !dbg !205
  %idxprom71 = sext i32 %add70 to i64, !dbg !206
  %arrayidx72 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom71, !dbg !206
  %73 = load i32* %arrayidx72, align 4, !dbg !206
  %74 = load double* %x.addr, align 8, !dbg !207
  %sub73 = fsub double %74, 1.000000e+00, !dbg !207
  %75 = load double* %y.addr, align 8, !dbg !208
  %sub74 = fsub double %75, 1.000000e+00, !dbg !208
  %76 = load double* %z.addr, align 8, !dbg !209
  %sub75 = fsub double %76, 1.000000e+00, !dbg !209
  %call76 = call double @grad(i32 %73, double %sub73, double %sub74, double %sub75), !dbg !210
  %call77 = call double @lerp(double %66, double %call69, double %call76), !dbg !211
  %call78 = call double @lerp(double %54, double %call63, double %call77), !dbg !212
  %call79 = call double @lerp(double %30, double %call51, double %call78), !dbg !213
  ret double %call79, !dbg !214
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone
declare double @floor(double) #3

; Function Attrs: nounwind uwtable
define internal double @fade(double %t) #0 {
entry:
  %t.addr = alloca double, align 8
  store double %t, double* %t.addr, align 8
  call void @llvm.dbg.declare(metadata double* %t.addr, metadata !215, metadata !35), !dbg !216
  %0 = load double* %t.addr, align 8, !dbg !217
  %1 = load double* %t.addr, align 8, !dbg !218
  %mul = fmul double %0, %1, !dbg !217
  %2 = load double* %t.addr, align 8, !dbg !219
  %mul1 = fmul double %mul, %2, !dbg !217
  %3 = load double* %t.addr, align 8, !dbg !220
  %4 = load double* %t.addr, align 8, !dbg !221
  %mul2 = fmul double %4, 6.000000e+00, !dbg !221
  %sub = fsub double %mul2, 1.500000e+01, !dbg !221
  %mul3 = fmul double %3, %sub, !dbg !220
  %add = fadd double %mul3, 1.000000e+01, !dbg !220
  %mul4 = fmul double %mul1, %add, !dbg !217
  ret double %mul4, !dbg !222
}

; Function Attrs: nounwind uwtable
define internal double @lerp(double %t, double %a, double %b) #0 {
entry:
  %t.addr = alloca double, align 8
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %t, double* %t.addr, align 8
  call void @llvm.dbg.declare(metadata double* %t.addr, metadata !223, metadata !35), !dbg !224
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !225, metadata !35), !dbg !226
  store double %b, double* %b.addr, align 8
  call void @llvm.dbg.declare(metadata double* %b.addr, metadata !227, metadata !35), !dbg !228
  %0 = load double* %a.addr, align 8, !dbg !229
  %1 = load double* %t.addr, align 8, !dbg !230
  %2 = load double* %b.addr, align 8, !dbg !231
  %3 = load double* %a.addr, align 8, !dbg !232
  %sub = fsub double %2, %3, !dbg !231
  %mul = fmul double %1, %sub, !dbg !230
  %add = fadd double %0, %mul, !dbg !229
  ret double %add, !dbg !233
}

; Function Attrs: nounwind uwtable
define internal double @grad(i32 %hash, double %x, double %y, double %z) #0 {
entry:
  %hash.addr = alloca i32, align 4
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %z.addr = alloca double, align 8
  %h = alloca i32, align 4
  %u = alloca double, align 8
  %v = alloca double, align 8
  store i32 %hash, i32* %hash.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hash.addr, metadata !234, metadata !35), !dbg !235
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !236, metadata !35), !dbg !237
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !238, metadata !35), !dbg !239
  store double %z, double* %z.addr, align 8
  call void @llvm.dbg.declare(metadata double* %z.addr, metadata !240, metadata !35), !dbg !241
  call void @llvm.dbg.declare(metadata i32* %h, metadata !242, metadata !35), !dbg !243
  %0 = load i32* %hash.addr, align 4, !dbg !244
  %and = and i32 %0, 15, !dbg !244
  store i32 %and, i32* %h, align 4, !dbg !243
  call void @llvm.dbg.declare(metadata double* %u, metadata !245, metadata !35), !dbg !246
  %1 = load i32* %h, align 4, !dbg !247
  %cmp = icmp slt i32 %1, 8, !dbg !247
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !247

cond.true:                                        ; preds = %entry
  %2 = load double* %x.addr, align 8, !dbg !248
  br label %cond.end, !dbg !247

cond.false:                                       ; preds = %entry
  %3 = load double* %y.addr, align 8, !dbg !250
  br label %cond.end, !dbg !247

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %2, %cond.true ], [ %3, %cond.false ], !dbg !247
  store double %cond, double* %u, align 8, !dbg !252
  call void @llvm.dbg.declare(metadata double* %v, metadata !255, metadata !35), !dbg !256
  %4 = load i32* %h, align 4, !dbg !257
  %cmp1 = icmp slt i32 %4, 4, !dbg !257
  br i1 %cmp1, label %cond.true2, label %cond.false3, !dbg !257

cond.true2:                                       ; preds = %cond.end
  %5 = load double* %y.addr, align 8, !dbg !258
  br label %cond.end10, !dbg !257

cond.false3:                                      ; preds = %cond.end
  %6 = load i32* %h, align 4, !dbg !259
  %cmp4 = icmp eq i32 %6, 12, !dbg !259
  br i1 %cmp4, label %cond.true6, label %lor.lhs.false, !dbg !259

lor.lhs.false:                                    ; preds = %cond.false3
  %7 = load i32* %h, align 4, !dbg !260
  %cmp5 = icmp eq i32 %7, 14, !dbg !260
  br i1 %cmp5, label %cond.true6, label %cond.false7, !dbg !262

cond.true6:                                       ; preds = %lor.lhs.false, %cond.false3
  %8 = load double* %x.addr, align 8, !dbg !263
  br label %cond.end8, !dbg !262

cond.false7:                                      ; preds = %lor.lhs.false
  %9 = load double* %z.addr, align 8, !dbg !266
  br label %cond.end8, !dbg !262

cond.end8:                                        ; preds = %cond.false7, %cond.true6
  %cond9 = phi double [ %8, %cond.true6 ], [ %9, %cond.false7 ], !dbg !262
  br label %cond.end10, !dbg !268

cond.end10:                                       ; preds = %cond.end8, %cond.true2
  %cond11 = phi double [ %5, %cond.true2 ], [ %cond9, %cond.end8 ], !dbg !257
  store double %cond11, double* %v, align 8, !dbg !271
  %10 = load i32* %h, align 4, !dbg !273
  %and12 = and i32 %10, 1, !dbg !273
  %cmp13 = icmp eq i32 %and12, 0, !dbg !274
  br i1 %cmp13, label %cond.true14, label %cond.false15, !dbg !274

cond.true14:                                      ; preds = %cond.end10
  %11 = load double* %u, align 8, !dbg !275
  br label %cond.end16, !dbg !274

cond.false15:                                     ; preds = %cond.end10
  %12 = load double* %u, align 8, !dbg !276
  %sub = fsub double -0.000000e+00, %12, !dbg !277
  br label %cond.end16, !dbg !274

cond.end16:                                       ; preds = %cond.false15, %cond.true14
  %cond17 = phi double [ %11, %cond.true14 ], [ %sub, %cond.false15 ], !dbg !274
  %13 = load i32* %h, align 4, !dbg !278
  %and18 = and i32 %13, 2, !dbg !278
  %cmp19 = icmp eq i32 %and18, 0, !dbg !279
  br i1 %cmp19, label %cond.true20, label %cond.false21, !dbg !279

cond.true20:                                      ; preds = %cond.end16
  %14 = load double* %v, align 8, !dbg !280
  br label %cond.end23, !dbg !279

cond.false21:                                     ; preds = %cond.end16
  %15 = load double* %v, align 8, !dbg !281
  %sub22 = fsub double -0.000000e+00, %15, !dbg !283
  br label %cond.end23, !dbg !279

cond.end23:                                       ; preds = %cond.false21, %cond.true20
  %cond24 = phi double [ %14, %cond.true20 ], [ %sub22, %cond.false21 ], !dbg !279
  %add = fadd double %cond17, %cond24, !dbg !284
  ret double %add, !dbg !286
}

; Function Attrs: nounwind uwtable
define internal i32 @init() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !287, metadata !35), !dbg !288
  store i32 0, i32* %i, align 4, !dbg !288
  store i32 0, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !289

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !291
  %cmp = icmp slt i32 %0, 256, !dbg !291
  br i1 %cmp, label %for.body, label %for.end, !dbg !295

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !296
  %idxprom = sext i32 %1 to i64, !dbg !297
  %arrayidx = getelementptr inbounds [256 x i32]* @permutation, i32 0, i64 %idxprom, !dbg !297
  %2 = load i32* %arrayidx, align 4, !dbg !297
  %3 = load i32* %i, align 4, !dbg !298
  %idxprom1 = sext i32 %3 to i64, !dbg !299
  %arrayidx2 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom1, !dbg !299
  store i32 %2, i32* %arrayidx2, align 4, !dbg !299
  %4 = load i32* %i, align 4, !dbg !300
  %add = add nsw i32 256, %4, !dbg !301
  %idxprom3 = sext i32 %add to i64, !dbg !302
  %arrayidx4 = getelementptr inbounds [512 x i32]* @p, i32 0, i64 %idxprom3, !dbg !302
  store i32 %2, i32* %arrayidx4, align 4, !dbg !302
  br label %for.inc, !dbg !302

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4, !dbg !303
  %inc = add nsw i32 %5, 1, !dbg !303
  store i32 %inc, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !304

for.end:                                          ; preds = %for.cond
  %6 = load i32* %retval, !dbg !305
  ret i32 %6, !dbg !305
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !21, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c] [DW_LANG_C99]
!1 = !{!"perlin.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !9, !13, !16, !17, !20}
!6 = !{!"0x2e\00main\00main\00\0064\000\001\000\000\000\000\0064", !1, !7, !8, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 64] [def] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!"0x2e\00noise\00noise\00\0035\001\001\000\000\00256\000\0035", !1, !7, !10, null, double (double, double, double)* @noise, null, null, !2} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [noise]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!12, !12, !12, !12}
!12 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!13 = !{!"0x2e\00grad\00grad\00\0028\001\001\000\000\00256\000\0028", !1, !7, !14, null, double (i32, double, double, double)* @grad, null, null, !2} ; [ DW_TAG_subprogram ] [line 28] [local] [def] [grad]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!12, !4, !12, !12, !12}
!16 = !{!"0x2e\00lerp\00lerp\00\0026\001\001\000\000\00256\000\0026", !1, !7, !10, null, double (double, double, double)* @lerp, null, null, !2} ; [ DW_TAG_subprogram ] [line 26] [local] [def] [lerp]
!17 = !{!"0x2e\00fade\00fade\00\0024\001\001\000\000\00256\000\0024", !1, !7, !18, null, double (double)* @fade, null, null, !2} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [fade]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!12, !12}
!20 = !{!"0x2e\00init\00init\00\0058\001\001\000\000\000\000\0058", !1, !7, !8, null, i32 ()* @init, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [init]
!21 = !{!22, !26}
!22 = !{!"0x34\00p\00p\00\007\001\001", null, !7, !23, [512 x i32]* @p, null} ; [ DW_TAG_variable ] [p] [line 7] [local] [def]
!23 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!24 = !{!25}
!25 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!26 = !{!"0x34\00permutation\00permutation\00\009\001\001", null, !7, !27, [256 x i32]* @permutation, null} ; [ DW_TAG_variable ] [permutation] [line 9] [local] [def]
!27 = !{!"0x1\00\000\008192\0032\000\000\000", null, null, !4, !28, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from int]
!28 = !{!29}
!29 = !{!"0x21\000\00256"}                        ; [ DW_TAG_subrange_type ] [0, 255]
!30 = !{i32 2, !"Dwarf Version", i32 4}
!31 = !{i32 2, !"Debug Info Version", i32 2}
!32 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!33 = !MDLocation(line: 65, column: 3, scope: !6)
!34 = !{!"0x100\00x\0067\000", !6, !7, !12}       ; [ DW_TAG_auto_variable ] [x] [line 67]
!35 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!36 = !MDLocation(line: 67, column: 10, scope: !6)
!37 = !{!"0x100\00y\0067\000", !6, !7, !12}       ; [ DW_TAG_auto_variable ] [y] [line 67]
!38 = !MDLocation(line: 67, column: 13, scope: !6)
!39 = !{!"0x100\00z\0067\000", !6, !7, !12}       ; [ DW_TAG_auto_variable ] [z] [line 67]
!40 = !MDLocation(line: 67, column: 16, scope: !6)
!41 = !{!"0x100\00sum\0067\000", !6, !7, !12}     ; [ DW_TAG_auto_variable ] [sum] [line 67]
!42 = !MDLocation(line: 67, column: 19, scope: !6)
!43 = !MDLocation(line: 73, column: 8, scope: !44)
!44 = !{!"0xb\0073\003\000", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!45 = !MDLocation(line: 73, column: 23, scope: !46)
!46 = !{!"0xb\002", !1, !47}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!47 = !{!"0xb\001", !1, !48}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!48 = !{!"0xb\0073\003\001", !1, !44}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!49 = !MDLocation(line: 73, column: 3, scope: !44)
!50 = !MDLocation(line: 74, column: 10, scope: !51)
!51 = !{!"0xb\0074\005\002", !1, !48}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!52 = !MDLocation(line: 74, column: 25, scope: !53)
!53 = !{!"0xb\002", !1, !54}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!54 = !{!"0xb\001", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!55 = !{!"0xb\0074\005\003", !1, !51}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!56 = !MDLocation(line: 74, column: 5, scope: !51)
!57 = !MDLocation(line: 75, column: 12, scope: !58)
!58 = !{!"0xb\0075\007\004", !1, !55}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!59 = !MDLocation(line: 75, column: 26, scope: !60)
!60 = !{!"0xb\002", !1, !61}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!61 = !{!"0xb\001", !1, !62}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!62 = !{!"0xb\0075\007\005", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!63 = !MDLocation(line: 75, column: 7, scope: !58)
!64 = !MDLocation(line: 77, column: 22, scope: !62)
!65 = !MDLocation(line: 77, column: 25, scope: !62)
!66 = !MDLocation(line: 77, column: 28, scope: !62)
!67 = !MDLocation(line: 77, column: 16, scope: !62)
!68 = !MDLocation(line: 77, column: 9, scope: !62)
!69 = !MDLocation(line: 75, column: 39, scope: !62)
!70 = !MDLocation(line: 75, column: 7, scope: !62)
!71 = !MDLocation(line: 77, column: 29, scope: !58)
!72 = !MDLocation(line: 74, column: 38, scope: !55)
!73 = !MDLocation(line: 74, column: 5, scope: !55)
!74 = !MDLocation(line: 77, column: 29, scope: !51)
!75 = !MDLocation(line: 73, column: 37, scope: !48)
!76 = !MDLocation(line: 73, column: 3, scope: !48)
!77 = !MDLocation(line: 79, column: 18, scope: !6)
!78 = !MDLocation(line: 79, column: 3, scope: !6)
!79 = !MDLocation(line: 80, column: 3, scope: !6)
!80 = !{!"0x101\00x\0016777251\000", !9, !7, !12} ; [ DW_TAG_arg_variable ] [x] [line 35]
!81 = !MDLocation(line: 35, column: 28, scope: !9)
!82 = !{!"0x101\00y\0033554467\000", !9, !7, !12} ; [ DW_TAG_arg_variable ] [y] [line 35]
!83 = !MDLocation(line: 35, column: 38, scope: !9)
!84 = !{!"0x101\00z\0050331683\000", !9, !7, !12} ; [ DW_TAG_arg_variable ] [z] [line 35]
!85 = !MDLocation(line: 35, column: 48, scope: !9)
!86 = !{!"0x100\00X\0036\000", !9, !7, !4}        ; [ DW_TAG_auto_variable ] [X] [line 36]
!87 = !MDLocation(line: 36, column: 7, scope: !9)
!88 = !MDLocation(line: 36, column: 22, scope: !9)
!89 = !MDLocation(line: 36, column: 16, scope: !9)
!90 = !MDLocation(line: 36, column: 11, scope: !9)
!91 = !{!"0x100\00Y\0037\000", !9, !7, !4}        ; [ DW_TAG_auto_variable ] [Y] [line 37]
!92 = !MDLocation(line: 37, column: 7, scope: !9)
!93 = !MDLocation(line: 37, column: 22, scope: !9)
!94 = !MDLocation(line: 37, column: 16, scope: !9)
!95 = !MDLocation(line: 37, column: 11, scope: !9)
!96 = !{!"0x100\00Z\0038\000", !9, !7, !4}        ; [ DW_TAG_auto_variable ] [Z] [line 38]
!97 = !MDLocation(line: 38, column: 7, scope: !9)
!98 = !MDLocation(line: 38, column: 22, scope: !9)
!99 = !MDLocation(line: 38, column: 16, scope: !9)
!100 = !MDLocation(line: 38, column: 11, scope: !9)
!101 = !MDLocation(line: 39, column: 14, scope: !9)
!102 = !MDLocation(line: 39, column: 8, scope: !9)
!103 = !MDLocation(line: 39, column: 3, scope: !9)
!104 = !MDLocation(line: 40, column: 14, scope: !9)
!105 = !MDLocation(line: 40, column: 8, scope: !9)
!106 = !MDLocation(line: 40, column: 3, scope: !9)
!107 = !MDLocation(line: 41, column: 14, scope: !9)
!108 = !MDLocation(line: 41, column: 8, scope: !9)
!109 = !MDLocation(line: 41, column: 3, scope: !9)
!110 = !{!"0x100\00u\0042\000", !9, !7, !12}      ; [ DW_TAG_auto_variable ] [u] [line 42]
!111 = !MDLocation(line: 42, column: 10, scope: !9)
!112 = !MDLocation(line: 42, column: 19, scope: !9)
!113 = !MDLocation(line: 42, column: 14, scope: !9)
!114 = !{!"0x100\00v\0043\000", !9, !7, !12}      ; [ DW_TAG_auto_variable ] [v] [line 43]
!115 = !MDLocation(line: 43, column: 10, scope: !9)
!116 = !MDLocation(line: 43, column: 19, scope: !9)
!117 = !MDLocation(line: 43, column: 14, scope: !9)
!118 = !{!"0x100\00w\0044\000", !9, !7, !12}      ; [ DW_TAG_auto_variable ] [w] [line 44]
!119 = !MDLocation(line: 44, column: 9, scope: !9)
!120 = !MDLocation(line: 44, column: 18, scope: !9)
!121 = !MDLocation(line: 44, column: 13, scope: !9)
!122 = !{!"0x100\00A\0045\000", !9, !7, !4}       ; [ DW_TAG_auto_variable ] [A] [line 45]
!123 = !MDLocation(line: 45, column: 7, scope: !9)
!124 = !MDLocation(line: 45, column: 13, scope: !9)
!125 = !MDLocation(line: 45, column: 11, scope: !9)
!126 = !MDLocation(line: 45, column: 18, scope: !9)
!127 = !{!"0x100\00AA\0045\000", !9, !7, !4}      ; [ DW_TAG_auto_variable ] [AA] [line 45]
!128 = !MDLocation(line: 45, column: 21, scope: !9)
!129 = !MDLocation(line: 45, column: 28, scope: !9)
!130 = !MDLocation(line: 45, column: 26, scope: !9)
!131 = !MDLocation(line: 45, column: 31, scope: !9)
!132 = !{!"0x100\00AB\0045\000", !9, !7, !4}      ; [ DW_TAG_auto_variable ] [AB] [line 45]
!133 = !MDLocation(line: 45, column: 34, scope: !9)
!134 = !MDLocation(line: 45, column: 41, scope: !9)
!135 = !MDLocation(line: 45, column: 39, scope: !9)
!136 = !MDLocation(line: 45, column: 46, scope: !9)
!137 = !{!"0x100\00B\0046\000", !9, !7, !4}       ; [ DW_TAG_auto_variable ] [B] [line 46]
!138 = !MDLocation(line: 46, column: 7, scope: !9)
!139 = !MDLocation(line: 46, column: 13, scope: !9)
!140 = !MDLocation(line: 46, column: 11, scope: !9)
!141 = !MDLocation(line: 46, column: 18, scope: !9)
!142 = !{!"0x100\00BA\0046\000", !9, !7, !4}      ; [ DW_TAG_auto_variable ] [BA] [line 46]
!143 = !MDLocation(line: 46, column: 21, scope: !9)
!144 = !MDLocation(line: 46, column: 28, scope: !9)
!145 = !MDLocation(line: 46, column: 26, scope: !9)
!146 = !MDLocation(line: 46, column: 31, scope: !9)
!147 = !{!"0x100\00BB\0046\000", !9, !7, !4}      ; [ DW_TAG_auto_variable ] [BB] [line 46]
!148 = !MDLocation(line: 46, column: 34, scope: !9)
!149 = !MDLocation(line: 46, column: 41, scope: !9)
!150 = !MDLocation(line: 46, column: 39, scope: !9)
!151 = !MDLocation(line: 46, column: 46, scope: !9)
!152 = !MDLocation(line: 48, column: 15, scope: !9)
!153 = !MDLocation(line: 48, column: 23, scope: !9)
!154 = !MDLocation(line: 48, column: 31, scope: !9)
!155 = !MDLocation(line: 48, column: 41, scope: !9)
!156 = !MDLocation(line: 48, column: 39, scope: !9)
!157 = !MDLocation(line: 48, column: 48, scope: !9)
!158 = !MDLocation(line: 48, column: 53, scope: !9)
!159 = !MDLocation(line: 48, column: 58, scope: !9)
!160 = !MDLocation(line: 48, column: 34, scope: !9)
!161 = !MDLocation(line: 49, column: 41, scope: !9)
!162 = !MDLocation(line: 49, column: 39, scope: !9)
!163 = !MDLocation(line: 49, column: 48, scope: !9)
!164 = !MDLocation(line: 49, column: 53, scope: !9)
!165 = !MDLocation(line: 49, column: 58, scope: !9)
!166 = !MDLocation(line: 49, column: 34, scope: !9)
!167 = !MDLocation(line: 48, column: 26, scope: !9)
!168 = !MDLocation(line: 50, column: 31, scope: !9)
!169 = !MDLocation(line: 50, column: 41, scope: !9)
!170 = !MDLocation(line: 50, column: 39, scope: !9)
!171 = !MDLocation(line: 50, column: 48, scope: !9)
!172 = !MDLocation(line: 50, column: 53, scope: !9)
!173 = !MDLocation(line: 50, column: 58, scope: !9)
!174 = !MDLocation(line: 50, column: 34, scope: !9)
!175 = !MDLocation(line: 51, column: 41, scope: !9)
!176 = !MDLocation(line: 51, column: 39, scope: !9)
!177 = !MDLocation(line: 51, column: 48, scope: !9)
!178 = !MDLocation(line: 51, column: 53, scope: !9)
!179 = !MDLocation(line: 51, column: 58, scope: !9)
!180 = !MDLocation(line: 51, column: 34, scope: !9)
!181 = !MDLocation(line: 50, column: 26, scope: !9)
!182 = !MDLocation(line: 48, column: 18, scope: !9)
!183 = !MDLocation(line: 52, column: 23, scope: !9)
!184 = !MDLocation(line: 52, column: 31, scope: !9)
!185 = !MDLocation(line: 52, column: 41, scope: !9)
!186 = !MDLocation(line: 52, column: 39, scope: !9)
!187 = !MDLocation(line: 52, column: 48, scope: !9)
!188 = !MDLocation(line: 52, column: 53, scope: !9)
!189 = !MDLocation(line: 52, column: 58, scope: !9)
!190 = !MDLocation(line: 52, column: 34, scope: !9)
!191 = !MDLocation(line: 53, column: 41, scope: !9)
!192 = !MDLocation(line: 53, column: 39, scope: !9)
!193 = !MDLocation(line: 53, column: 48, scope: !9)
!194 = !MDLocation(line: 53, column: 53, scope: !9)
!195 = !MDLocation(line: 53, column: 58, scope: !9)
!196 = !MDLocation(line: 53, column: 34, scope: !9)
!197 = !MDLocation(line: 52, column: 26, scope: !9)
!198 = !MDLocation(line: 54, column: 31, scope: !9)
!199 = !MDLocation(line: 54, column: 41, scope: !9)
!200 = !MDLocation(line: 54, column: 39, scope: !9)
!201 = !MDLocation(line: 54, column: 48, scope: !9)
!202 = !MDLocation(line: 54, column: 53, scope: !9)
!203 = !MDLocation(line: 54, column: 58, scope: !9)
!204 = !MDLocation(line: 54, column: 34, scope: !9)
!205 = !MDLocation(line: 55, column: 41, scope: !9)
!206 = !MDLocation(line: 55, column: 39, scope: !9)
!207 = !MDLocation(line: 55, column: 48, scope: !9)
!208 = !MDLocation(line: 55, column: 53, scope: !9)
!209 = !MDLocation(line: 55, column: 58, scope: !9)
!210 = !MDLocation(line: 55, column: 34, scope: !9)
!211 = !MDLocation(line: 54, column: 26, scope: !9)
!212 = !MDLocation(line: 52, column: 18, scope: !9)
!213 = !MDLocation(line: 48, column: 10, scope: !9)
!214 = !MDLocation(line: 48, column: 3, scope: !9)
!215 = !{!"0x101\00t\0016777240\000", !17, !7, !12} ; [ DW_TAG_arg_variable ] [t] [line 24]
!216 = !MDLocation(line: 24, column: 27, scope: !17)
!217 = !MDLocation(line: 24, column: 39, scope: !17)
!218 = !MDLocation(line: 24, column: 43, scope: !17)
!219 = !MDLocation(line: 24, column: 47, scope: !17)
!220 = !MDLocation(line: 24, column: 52, scope: !17)
!221 = !MDLocation(line: 24, column: 57, scope: !17)
!222 = !MDLocation(line: 24, column: 32, scope: !17)
!223 = !{!"0x101\00t\0016777242\000", !16, !7, !12} ; [ DW_TAG_arg_variable ] [t] [line 26]
!224 = !MDLocation(line: 26, column: 27, scope: !16)
!225 = !{!"0x101\00a\0033554458\000", !16, !7, !12} ; [ DW_TAG_arg_variable ] [a] [line 26]
!226 = !MDLocation(line: 26, column: 37, scope: !16)
!227 = !{!"0x101\00b\0050331674\000", !16, !7, !12} ; [ DW_TAG_arg_variable ] [b] [line 26]
!228 = !MDLocation(line: 26, column: 47, scope: !16)
!229 = !MDLocation(line: 26, column: 59, scope: !16)
!230 = !MDLocation(line: 26, column: 63, scope: !16)
!231 = !MDLocation(line: 26, column: 68, scope: !16)
!232 = !MDLocation(line: 26, column: 72, scope: !16)
!233 = !MDLocation(line: 26, column: 52, scope: !16)
!234 = !{!"0x101\00hash\0016777244\000", !13, !7, !4} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!235 = !MDLocation(line: 28, column: 24, scope: !13)
!236 = !{!"0x101\00x\0033554460\000", !13, !7, !12} ; [ DW_TAG_arg_variable ] [x] [line 28]
!237 = !MDLocation(line: 28, column: 37, scope: !13)
!238 = !{!"0x101\00y\0050331676\000", !13, !7, !12} ; [ DW_TAG_arg_variable ] [y] [line 28]
!239 = !MDLocation(line: 28, column: 47, scope: !13)
!240 = !{!"0x101\00z\0067108892\000", !13, !7, !12} ; [ DW_TAG_arg_variable ] [z] [line 28]
!241 = !MDLocation(line: 28, column: 57, scope: !13)
!242 = !{!"0x100\00h\0029\000", !13, !7, !4}      ; [ DW_TAG_auto_variable ] [h] [line 29]
!243 = !MDLocation(line: 29, column: 7, scope: !13)
!244 = !MDLocation(line: 29, column: 11, scope: !13)
!245 = !{!"0x100\00u\0030\000", !13, !7, !12}     ; [ DW_TAG_auto_variable ] [u] [line 30]
!246 = !MDLocation(line: 30, column: 10, scope: !13)
!247 = !MDLocation(line: 30, column: 14, scope: !13)
!248 = !MDLocation(line: 30, column: 20, scope: !249)
!249 = !{!"0xb\001", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!250 = !MDLocation(line: 30, column: 24, scope: !251)
!251 = !{!"0xb\002", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!252 = !MDLocation(line: 30, column: 10, scope: !253)
!253 = !{!"0xb\004", !1, !254}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!254 = !{!"0xb\003", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!255 = !{!"0x100\00v\0031\000", !13, !7, !12}     ; [ DW_TAG_auto_variable ] [v] [line 31]
!256 = !MDLocation(line: 31, column: 10, scope: !13)
!257 = !MDLocation(line: 31, column: 14, scope: !13)
!258 = !MDLocation(line: 31, column: 20, scope: !249)
!259 = !MDLocation(line: 31, column: 24, scope: !251)
!260 = !MDLocation(line: 31, column: 31, scope: !261)
!261 = !{!"0xb\005", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!262 = !MDLocation(line: 31, column: 24, scope: !13)
!263 = !MDLocation(line: 31, column: 39, scope: !264)
!264 = !{!"0xb\006", !1, !265}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!265 = !{!"0xb\004", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!266 = !MDLocation(line: 31, column: 43, scope: !267)
!267 = !{!"0xb\007", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!268 = !MDLocation(line: 31, column: 14, scope: !269)
!269 = !{!"0xb\009", !1, !270}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!270 = !{!"0xb\008", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!271 = !MDLocation(line: 31, column: 10, scope: !272)
!272 = !{!"0xb\0010", !1, !254}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!273 = !MDLocation(line: 32, column: 12, scope: !13)
!274 = !MDLocation(line: 32, column: 11, scope: !13)
!275 = !MDLocation(line: 32, column: 24, scope: !249)
!276 = !MDLocation(line: 32, column: 29, scope: !251)
!277 = !MDLocation(line: 32, column: 28, scope: !13)
!278 = !MDLocation(line: 32, column: 36, scope: !253)
!279 = !MDLocation(line: 32, column: 35, scope: !13)
!280 = !MDLocation(line: 32, column: 48, scope: !261)
!281 = !MDLocation(line: 32, column: 53, scope: !282)
!282 = !{!"0xb\006", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!283 = !MDLocation(line: 32, column: 52, scope: !13)
!284 = !MDLocation(line: 32, column: 10, scope: !285)
!285 = !{!"0xb\008", !1, !267}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!286 = !MDLocation(line: 32, column: 3, scope: !13)
!287 = !{!"0x100\00i\0059\000", !20, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 59]
!288 = !MDLocation(line: 59, column: 7, scope: !20)
!289 = !MDLocation(line: 60, column: 8, scope: !290)
!290 = !{!"0xb\0060\003\006", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!291 = !MDLocation(line: 60, column: 13, scope: !292)
!292 = !{!"0xb\002", !1, !293}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!293 = !{!"0xb\001", !1, !294}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!294 = !{!"0xb\0060\003\007", !1, !290}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!295 = !MDLocation(line: 60, column: 3, scope: !290)
!296 = !MDLocation(line: 61, column: 35, scope: !294)
!297 = !MDLocation(line: 61, column: 23, scope: !294)
!298 = !MDLocation(line: 61, column: 18, scope: !294)
!299 = !MDLocation(line: 61, column: 16, scope: !294)
!300 = !MDLocation(line: 61, column: 11, scope: !294)
!301 = !MDLocation(line: 61, column: 7, scope: !294)
!302 = !MDLocation(line: 61, column: 5, scope: !294)
!303 = !MDLocation(line: 60, column: 23, scope: !294)
!304 = !MDLocation(line: 60, column: 3, scope: !294)
!305 = !MDLocation(line: 62, column: 1, scope: !20)
