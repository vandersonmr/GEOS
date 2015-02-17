; ModuleID = 'blas.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isamax(i32 %n, float* %sx, i32 %incx) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %smax = alloca float, align 4
  %i = alloca i32, align 4
  %istmp = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !43, metadata !44), !dbg !45
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !46, metadata !44), !dbg !47
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !48, metadata !44), !dbg !49
  call void @llvm.dbg.declare(metadata float* %smax, metadata !50, metadata !44), !dbg !51
  store float 0.000000e+00, float* %smax, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !44), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %istmp, metadata !54, metadata !44), !dbg !55
  store i32 0, i32* %istmp, align 4, !dbg !55
  %0 = load i32* %n.addr, align 4, !dbg !56
  %cmp = icmp sle i32 %0, 1, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %1 = load i32* %istmp, align 4, !dbg !59
  store i32 %1, i32* %retval, !dbg !61
  br label %return, !dbg !61

if.end:                                           ; preds = %entry
  %2 = load i32* %incx.addr, align 4, !dbg !62
  %cmp1 = icmp ne i32 %2, 1, !dbg !62
  br i1 %cmp1, label %if.then2, label %if.end36, !dbg !64

if.then2:                                         ; preds = %if.end
  %3 = load i32* %incx.addr, align 4, !dbg !65
  %cmp3 = icmp slt i32 %3, 0, !dbg !65
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !68

if.then4:                                         ; preds = %if.then2
  %4 = load float** %sx.addr, align 8, !dbg !69
  %5 = load i32* %n.addr, align 4, !dbg !71
  %sub = sub nsw i32 0, %5, !dbg !72
  %add = add nsw i32 %sub, 1, !dbg !72
  %6 = load i32* %incx.addr, align 4, !dbg !73
  %mul = mul nsw i32 %add, %6, !dbg !74
  %add5 = add nsw i32 %mul, 1, !dbg !74
  %idx.ext = sext i32 %add5 to i64, !dbg !75
  %add.ptr = getelementptr inbounds float* %4, i64 %idx.ext, !dbg !75
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !76
  br label %if.end6, !dbg !76

if.end6:                                          ; preds = %if.then4, %if.then2
  store i32 0, i32* %istmp, align 4, !dbg !77
  %7 = load float** %sx.addr, align 8, !dbg !78
  %8 = load float* %7, align 4, !dbg !78
  %conv = fpext float %8 to double, !dbg !78
  %cmp7 = fcmp ogt double %conv, 0.000000e+00, !dbg !78
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !78

cond.true:                                        ; preds = %if.end6
  %9 = load float** %sx.addr, align 8, !dbg !79
  %10 = load float* %9, align 4, !dbg !79
  br label %cond.end, !dbg !79

cond.false:                                       ; preds = %if.end6
  %11 = load float** %sx.addr, align 8, !dbg !81
  %12 = load float* %11, align 4, !dbg !81
  %sub9 = fsub float -0.000000e+00, %12, !dbg !81
  br label %cond.end, !dbg !81

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %10, %cond.true ], [ %sub9, %cond.false ], !dbg !78
  store float %cond, float* %smax, align 4, !dbg !83
  %13 = load i32* %incx.addr, align 4, !dbg !86
  %14 = load float** %sx.addr, align 8, !dbg !87
  %idx.ext10 = sext i32 %13 to i64, !dbg !87
  %add.ptr11 = getelementptr inbounds float* %14, i64 %idx.ext10, !dbg !87
  store float* %add.ptr11, float** %sx.addr, align 8, !dbg !87
  store i32 1, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %cond.end
  %15 = load i32* %i, align 4, !dbg !90
  %16 = load i32* %n.addr, align 4, !dbg !94
  %cmp12 = icmp slt i32 %15, %16, !dbg !95
  br i1 %cmp12, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %17 = load float** %sx.addr, align 8, !dbg !97
  %18 = load float* %17, align 4, !dbg !97
  %conv14 = fpext float %18 to double, !dbg !97
  %cmp15 = fcmp ogt double %conv14, 0.000000e+00, !dbg !97
  br i1 %cmp15, label %cond.true17, label %cond.false18, !dbg !97

cond.true17:                                      ; preds = %for.body
  %19 = load float** %sx.addr, align 8, !dbg !99
  %20 = load float* %19, align 4, !dbg !99
  br label %cond.end20, !dbg !99

cond.false18:                                     ; preds = %for.body
  %21 = load float** %sx.addr, align 8, !dbg !101
  %22 = load float* %21, align 4, !dbg !101
  %sub19 = fsub float -0.000000e+00, %22, !dbg !101
  br label %cond.end20, !dbg !101

cond.end20:                                       ; preds = %cond.false18, %cond.true17
  %cond21 = phi float [ %20, %cond.true17 ], [ %sub19, %cond.false18 ], !dbg !97
  %23 = load float* %smax, align 4, !dbg !103
  %cmp22 = fcmp ogt float %cond21, %23, !dbg !97
  br i1 %cmp22, label %if.then24, label %if.end33, !dbg !106

if.then24:                                        ; preds = %cond.end20
  %24 = load i32* %i, align 4, !dbg !107
  store i32 %24, i32* %istmp, align 4, !dbg !109
  %25 = load float** %sx.addr, align 8, !dbg !110
  %26 = load float* %25, align 4, !dbg !110
  %conv25 = fpext float %26 to double, !dbg !110
  %cmp26 = fcmp ogt double %conv25, 0.000000e+00, !dbg !110
  br i1 %cmp26, label %cond.true28, label %cond.false29, !dbg !110

cond.true28:                                      ; preds = %if.then24
  %27 = load float** %sx.addr, align 8, !dbg !111
  %28 = load float* %27, align 4, !dbg !111
  br label %cond.end31, !dbg !111

cond.false29:                                     ; preds = %if.then24
  %29 = load float** %sx.addr, align 8, !dbg !113
  %30 = load float* %29, align 4, !dbg !113
  %sub30 = fsub float -0.000000e+00, %30, !dbg !113
  br label %cond.end31, !dbg !113

cond.end31:                                       ; preds = %cond.false29, %cond.true28
  %cond32 = phi float [ %28, %cond.true28 ], [ %sub30, %cond.false29 ], !dbg !110
  store float %cond32, float* %smax, align 4, !dbg !115
  br label %if.end33, !dbg !118

if.end33:                                         ; preds = %cond.end31, %cond.end20
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %if.end33
  %31 = load i32* %i, align 4, !dbg !121
  %inc = add nsw i32 %31, 1, !dbg !121
  store i32 %inc, i32* %i, align 4, !dbg !121
  %32 = load i32* %incx.addr, align 4, !dbg !122
  %33 = load float** %sx.addr, align 8, !dbg !123
  %idx.ext34 = sext i32 %32 to i64, !dbg !123
  %add.ptr35 = getelementptr inbounds float* %33, i64 %idx.ext34, !dbg !123
  store float* %add.ptr35, float** %sx.addr, align 8, !dbg !123
  br label %for.cond, !dbg !124

for.end:                                          ; preds = %for.cond
  %34 = load i32* %istmp, align 4, !dbg !125
  store i32 %34, i32* %retval, !dbg !126
  br label %return, !dbg !126

if.end36:                                         ; preds = %if.end
  store i32 0, i32* %istmp, align 4, !dbg !127
  %35 = load float** %sx.addr, align 8, !dbg !128
  %36 = load float* %35, align 4, !dbg !128
  %conv37 = fpext float %36 to double, !dbg !128
  %cmp38 = fcmp ogt double %conv37, 0.000000e+00, !dbg !128
  br i1 %cmp38, label %cond.true40, label %cond.false41, !dbg !128

cond.true40:                                      ; preds = %if.end36
  %37 = load float** %sx.addr, align 8, !dbg !129
  %38 = load float* %37, align 4, !dbg !129
  br label %cond.end43, !dbg !129

cond.false41:                                     ; preds = %if.end36
  %39 = load float** %sx.addr, align 8, !dbg !131
  %40 = load float* %39, align 4, !dbg !131
  %sub42 = fsub float -0.000000e+00, %40, !dbg !131
  br label %cond.end43, !dbg !131

cond.end43:                                       ; preds = %cond.false41, %cond.true40
  %cond44 = phi float [ %38, %cond.true40 ], [ %sub42, %cond.false41 ], !dbg !128
  store float %cond44, float* %smax, align 4, !dbg !133
  %41 = load float** %sx.addr, align 8, !dbg !136
  %incdec.ptr = getelementptr inbounds float* %41, i32 1, !dbg !136
  store float* %incdec.ptr, float** %sx.addr, align 8, !dbg !136
  store i32 1, i32* %i, align 4, !dbg !137
  br label %for.cond45, !dbg !137

for.cond45:                                       ; preds = %for.inc69, %cond.end43
  %42 = load i32* %i, align 4, !dbg !139
  %43 = load i32* %n.addr, align 4, !dbg !143
  %cmp46 = icmp slt i32 %42, %43, !dbg !144
  br i1 %cmp46, label %for.body48, label %for.end72, !dbg !145

for.body48:                                       ; preds = %for.cond45
  %44 = load float** %sx.addr, align 8, !dbg !146
  %45 = load float* %44, align 4, !dbg !146
  %conv49 = fpext float %45 to double, !dbg !146
  %cmp50 = fcmp ogt double %conv49, 0.000000e+00, !dbg !146
  br i1 %cmp50, label %cond.true52, label %cond.false53, !dbg !146

cond.true52:                                      ; preds = %for.body48
  %46 = load float** %sx.addr, align 8, !dbg !148
  %47 = load float* %46, align 4, !dbg !148
  br label %cond.end55, !dbg !148

cond.false53:                                     ; preds = %for.body48
  %48 = load float** %sx.addr, align 8, !dbg !150
  %49 = load float* %48, align 4, !dbg !150
  %sub54 = fsub float -0.000000e+00, %49, !dbg !150
  br label %cond.end55, !dbg !150

cond.end55:                                       ; preds = %cond.false53, %cond.true52
  %cond56 = phi float [ %47, %cond.true52 ], [ %sub54, %cond.false53 ], !dbg !146
  %50 = load float* %smax, align 4, !dbg !152
  %cmp57 = fcmp ogt float %cond56, %50, !dbg !146
  br i1 %cmp57, label %if.then59, label %if.end68, !dbg !155

if.then59:                                        ; preds = %cond.end55
  %51 = load i32* %i, align 4, !dbg !156
  store i32 %51, i32* %istmp, align 4, !dbg !158
  %52 = load float** %sx.addr, align 8, !dbg !159
  %53 = load float* %52, align 4, !dbg !159
  %conv60 = fpext float %53 to double, !dbg !159
  %cmp61 = fcmp ogt double %conv60, 0.000000e+00, !dbg !159
  br i1 %cmp61, label %cond.true63, label %cond.false64, !dbg !159

cond.true63:                                      ; preds = %if.then59
  %54 = load float** %sx.addr, align 8, !dbg !160
  %55 = load float* %54, align 4, !dbg !160
  br label %cond.end66, !dbg !160

cond.false64:                                     ; preds = %if.then59
  %56 = load float** %sx.addr, align 8, !dbg !162
  %57 = load float* %56, align 4, !dbg !162
  %sub65 = fsub float -0.000000e+00, %57, !dbg !162
  br label %cond.end66, !dbg !162

cond.end66:                                       ; preds = %cond.false64, %cond.true63
  %cond67 = phi float [ %55, %cond.true63 ], [ %sub65, %cond.false64 ], !dbg !159
  store float %cond67, float* %smax, align 4, !dbg !164
  br label %if.end68, !dbg !167

if.end68:                                         ; preds = %cond.end66, %cond.end55
  br label %for.inc69, !dbg !168

for.inc69:                                        ; preds = %if.end68
  %58 = load i32* %i, align 4, !dbg !170
  %inc70 = add nsw i32 %58, 1, !dbg !170
  store i32 %inc70, i32* %i, align 4, !dbg !170
  %59 = load float** %sx.addr, align 8, !dbg !171
  %incdec.ptr71 = getelementptr inbounds float* %59, i32 1, !dbg !171
  store float* %incdec.ptr71, float** %sx.addr, align 8, !dbg !171
  br label %for.cond45, !dbg !172

for.end72:                                        ; preds = %for.cond45
  %60 = load i32* %istmp, align 4, !dbg !173
  store i32 %60, i32* %retval, !dbg !174
  br label %return, !dbg !174

return:                                           ; preds = %for.end72, %for.end, %if.then
  %61 = load i32* %retval, !dbg !175
  ret i32 %61, !dbg !175
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @saxpy(i32 %n, double, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sa.addr = alloca float, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !176, metadata !44), !dbg !177
  store float %sa, float* %sa.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sa.addr, metadata !178, metadata !44), !dbg !179
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !180, metadata !44), !dbg !181
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !182, metadata !44), !dbg !183
  store float* %sy, float** %sy.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sy.addr, metadata !184, metadata !44), !dbg !185
  store i32 %incy, i32* %incy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incy.addr, metadata !186, metadata !44), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %i, metadata !188, metadata !44), !dbg !189
  %1 = load i32* %n.addr, align 4, !dbg !190
  %cmp = icmp sle i32 %1, 0, !dbg !190
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !192

lor.lhs.false:                                    ; preds = %entry
  %2 = load float* %sa.addr, align 4, !dbg !193
  %conv = fpext float %2 to double, !dbg !193
  %cmp1 = fcmp oeq double %conv, 0.000000e+00, !dbg !193
  br i1 %cmp1, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end60, !dbg !195

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32* %incx.addr, align 4, !dbg !198
  %4 = load i32* %incy.addr, align 4, !dbg !200
  %cmp3 = icmp eq i32 %3, %4, !dbg !198
  br i1 %cmp3, label %if.then5, label %if.end28, !dbg !201

if.then5:                                         ; preds = %if.end
  %5 = load i32* %incx.addr, align 4, !dbg !202
  %cmp6 = icmp eq i32 %5, 1, !dbg !202
  br i1 %cmp6, label %if.then8, label %if.end12, !dbg !205

if.then8:                                         ; preds = %if.then5
  store i32 0, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.then8
  %6 = load i32* %i, align 4, !dbg !209
  %7 = load i32* %n.addr, align 4, !dbg !213
  %cmp9 = icmp slt i32 %6, %7, !dbg !214
  br i1 %cmp9, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %8 = load float* %sa.addr, align 4, !dbg !216
  %9 = load float** %sx.addr, align 8, !dbg !217
  %10 = load float* %9, align 4, !dbg !218
  %mul = fmul float %8, %10, !dbg !216
  %11 = load float** %sy.addr, align 8, !dbg !219
  %12 = load float* %11, align 4, !dbg !220
  %add = fadd float %12, %mul, !dbg !220
  store float %add, float* %11, align 4, !dbg !220
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %13 = load i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %13, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  %14 = load float** %sy.addr, align 8, !dbg !222
  %incdec.ptr = getelementptr inbounds float* %14, i32 1, !dbg !222
  store float* %incdec.ptr, float** %sy.addr, align 8, !dbg !222
  %15 = load float** %sx.addr, align 8, !dbg !223
  %incdec.ptr11 = getelementptr inbounds float* %15, i32 1, !dbg !223
  store float* %incdec.ptr11, float** %sx.addr, align 8, !dbg !223
  br label %for.cond, !dbg !224

for.end:                                          ; preds = %for.cond
  br label %for.end60, !dbg !225

if.end12:                                         ; preds = %if.then5
  %16 = load i32* %incx.addr, align 4, !dbg !226
  %cmp13 = icmp sgt i32 %16, 0, !dbg !226
  br i1 %cmp13, label %if.then15, label %if.end27, !dbg !228

if.then15:                                        ; preds = %if.end12
  store i32 0, i32* %i, align 4, !dbg !229
  br label %for.cond16, !dbg !229

for.cond16:                                       ; preds = %for.inc22, %if.then15
  %17 = load i32* %i, align 4, !dbg !232
  %18 = load i32* %n.addr, align 4, !dbg !236
  %cmp17 = icmp slt i32 %17, %18, !dbg !237
  br i1 %cmp17, label %for.body19, label %for.end26, !dbg !238

for.body19:                                       ; preds = %for.cond16
  %19 = load float* %sa.addr, align 4, !dbg !239
  %20 = load float** %sx.addr, align 8, !dbg !240
  %21 = load float* %20, align 4, !dbg !241
  %mul20 = fmul float %19, %21, !dbg !239
  %22 = load float** %sy.addr, align 8, !dbg !242
  %23 = load float* %22, align 4, !dbg !243
  %add21 = fadd float %23, %mul20, !dbg !243
  store float %add21, float* %22, align 4, !dbg !243
  br label %for.inc22, !dbg !243

for.inc22:                                        ; preds = %for.body19
  %24 = load i32* %i, align 4, !dbg !244
  %inc23 = add nsw i32 %24, 1, !dbg !244
  store i32 %inc23, i32* %i, align 4, !dbg !244
  %25 = load i32* %incx.addr, align 4, !dbg !245
  %26 = load float** %sx.addr, align 8, !dbg !246
  %idx.ext = sext i32 %25 to i64, !dbg !246
  %add.ptr = getelementptr inbounds float* %26, i64 %idx.ext, !dbg !246
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !246
  %27 = load i32* %incx.addr, align 4, !dbg !247
  %28 = load float** %sy.addr, align 8, !dbg !248
  %idx.ext24 = sext i32 %27 to i64, !dbg !248
  %add.ptr25 = getelementptr inbounds float* %28, i64 %idx.ext24, !dbg !248
  store float* %add.ptr25, float** %sy.addr, align 8, !dbg !248
  br label %for.cond16, !dbg !249

for.end26:                                        ; preds = %for.cond16
  br label %for.end60, !dbg !250

if.end27:                                         ; preds = %if.end12
  br label %if.end28, !dbg !251

if.end28:                                         ; preds = %if.end27, %if.end
  %29 = load i32* %incx.addr, align 4, !dbg !252
  %cmp29 = icmp slt i32 %29, 0, !dbg !252
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !254

if.then31:                                        ; preds = %if.end28
  %30 = load i32* %n.addr, align 4, !dbg !255
  %sub = sub nsw i32 0, %30, !dbg !257
  %add32 = add nsw i32 %sub, 1, !dbg !257
  %31 = load i32* %incx.addr, align 4, !dbg !258
  %mul33 = mul nsw i32 %add32, %31, !dbg !259
  %add34 = add nsw i32 %mul33, 1, !dbg !259
  %32 = load float** %sx.addr, align 8, !dbg !260
  %idx.ext35 = sext i32 %add34 to i64, !dbg !260
  %add.ptr36 = getelementptr inbounds float* %32, i64 %idx.ext35, !dbg !260
  store float* %add.ptr36, float** %sx.addr, align 8, !dbg !260
  br label %if.end37, !dbg !260

if.end37:                                         ; preds = %if.then31, %if.end28
  %33 = load i32* %incy.addr, align 4, !dbg !261
  %cmp38 = icmp slt i32 %33, 0, !dbg !261
  br i1 %cmp38, label %if.then40, label %if.end47, !dbg !263

if.then40:                                        ; preds = %if.end37
  %34 = load i32* %n.addr, align 4, !dbg !264
  %sub41 = sub nsw i32 0, %34, !dbg !266
  %add42 = add nsw i32 %sub41, 1, !dbg !266
  %35 = load i32* %incy.addr, align 4, !dbg !267
  %mul43 = mul nsw i32 %add42, %35, !dbg !268
  %add44 = add nsw i32 %mul43, 1, !dbg !268
  %36 = load float** %sy.addr, align 8, !dbg !269
  %idx.ext45 = sext i32 %add44 to i64, !dbg !269
  %add.ptr46 = getelementptr inbounds float* %36, i64 %idx.ext45, !dbg !269
  store float* %add.ptr46, float** %sy.addr, align 8, !dbg !269
  br label %if.end47, !dbg !269

if.end47:                                         ; preds = %if.then40, %if.end37
  store i32 0, i32* %i, align 4, !dbg !270
  br label %for.cond48, !dbg !270

for.cond48:                                       ; preds = %for.inc54, %if.end47
  %37 = load i32* %i, align 4, !dbg !272
  %38 = load i32* %n.addr, align 4, !dbg !276
  %cmp49 = icmp slt i32 %37, %38, !dbg !277
  br i1 %cmp49, label %for.body51, label %for.end60, !dbg !278

for.body51:                                       ; preds = %for.cond48
  %39 = load float* %sa.addr, align 4, !dbg !279
  %40 = load float** %sx.addr, align 8, !dbg !280
  %41 = load float* %40, align 4, !dbg !281
  %mul52 = fmul float %39, %41, !dbg !279
  %42 = load float** %sy.addr, align 8, !dbg !282
  %43 = load float* %42, align 4, !dbg !283
  %add53 = fadd float %43, %mul52, !dbg !283
  store float %add53, float* %42, align 4, !dbg !283
  br label %for.inc54, !dbg !283

for.inc54:                                        ; preds = %for.body51
  %44 = load i32* %i, align 4, !dbg !284
  %inc55 = add nsw i32 %44, 1, !dbg !284
  store i32 %inc55, i32* %i, align 4, !dbg !284
  %45 = load i32* %incx.addr, align 4, !dbg !285
  %46 = load float** %sx.addr, align 8, !dbg !286
  %idx.ext56 = sext i32 %45 to i64, !dbg !286
  %add.ptr57 = getelementptr inbounds float* %46, i64 %idx.ext56, !dbg !286
  store float* %add.ptr57, float** %sx.addr, align 8, !dbg !286
  %47 = load i32* %incy.addr, align 4, !dbg !287
  %48 = load float** %sy.addr, align 8, !dbg !288
  %idx.ext58 = sext i32 %47 to i64, !dbg !288
  %add.ptr59 = getelementptr inbounds float* %48, i64 %idx.ext58, !dbg !288
  store float* %add.ptr59, float** %sy.addr, align 8, !dbg !288
  br label %for.cond48, !dbg !289

for.end60:                                        ; preds = %if.then, %for.end, %for.end26, %for.cond48
  ret void, !dbg !290
}

; Function Attrs: nounwind uwtable
define void @saxpyx(i32 %n, double, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sa.addr = alloca float, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !291, metadata !44), !dbg !292
  store float %sa, float* %sa.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sa.addr, metadata !293, metadata !44), !dbg !294
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !295, metadata !44), !dbg !296
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !297, metadata !44), !dbg !298
  store float* %sy, float** %sy.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sy.addr, metadata !299, metadata !44), !dbg !300
  store i32 %incy, i32* %incy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incy.addr, metadata !301, metadata !44), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %i, metadata !303, metadata !44), !dbg !304
  %1 = load i32* %n.addr, align 4, !dbg !305
  %cmp = icmp sle i32 %1, 0, !dbg !305
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !307

lor.lhs.false:                                    ; preds = %entry
  %2 = load float* %sa.addr, align 4, !dbg !308
  %conv = fpext float %2 to double, !dbg !308
  %cmp1 = fcmp oeq double %conv, 0.000000e+00, !dbg !308
  br i1 %cmp1, label %if.then, label %if.end, !dbg !307

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end60, !dbg !310

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32* %incx.addr, align 4, !dbg !313
  %4 = load i32* %incy.addr, align 4, !dbg !315
  %cmp3 = icmp eq i32 %3, %4, !dbg !313
  br i1 %cmp3, label %if.then5, label %if.end28, !dbg !316

if.then5:                                         ; preds = %if.end
  %5 = load i32* %incx.addr, align 4, !dbg !317
  %cmp6 = icmp eq i32 %5, 1, !dbg !317
  br i1 %cmp6, label %if.then8, label %if.end12, !dbg !320

if.then8:                                         ; preds = %if.then5
  store i32 0, i32* %i, align 4, !dbg !321
  br label %for.cond, !dbg !321

for.cond:                                         ; preds = %for.inc, %if.then8
  %6 = load i32* %i, align 4, !dbg !324
  %7 = load i32* %n.addr, align 4, !dbg !328
  %cmp9 = icmp slt i32 %6, %7, !dbg !329
  br i1 %cmp9, label %for.body, label %for.end, !dbg !330

for.body:                                         ; preds = %for.cond
  %8 = load float** %sy.addr, align 8, !dbg !331
  %9 = load float* %8, align 4, !dbg !332
  %10 = load float* %sa.addr, align 4, !dbg !333
  %11 = load float** %sx.addr, align 8, !dbg !334
  %12 = load float* %11, align 4, !dbg !335
  %mul = fmul float %10, %12, !dbg !333
  %add = fadd float %9, %mul, !dbg !332
  %13 = load float** %sx.addr, align 8, !dbg !336
  store float %add, float* %13, align 4, !dbg !337
  br label %for.inc, !dbg !337

for.inc:                                          ; preds = %for.body
  %14 = load i32* %i, align 4, !dbg !338
  %inc = add nsw i32 %14, 1, !dbg !338
  store i32 %inc, i32* %i, align 4, !dbg !338
  %15 = load float** %sx.addr, align 8, !dbg !339
  %incdec.ptr = getelementptr inbounds float* %15, i32 1, !dbg !339
  store float* %incdec.ptr, float** %sx.addr, align 8, !dbg !339
  %16 = load float** %sy.addr, align 8, !dbg !340
  %incdec.ptr11 = getelementptr inbounds float* %16, i32 1, !dbg !340
  store float* %incdec.ptr11, float** %sy.addr, align 8, !dbg !340
  br label %for.cond, !dbg !341

for.end:                                          ; preds = %for.cond
  br label %for.end60, !dbg !342

if.end12:                                         ; preds = %if.then5
  %17 = load i32* %incx.addr, align 4, !dbg !343
  %cmp13 = icmp sgt i32 %17, 0, !dbg !343
  br i1 %cmp13, label %if.then15, label %if.end27, !dbg !345

if.then15:                                        ; preds = %if.end12
  store i32 0, i32* %i, align 4, !dbg !346
  br label %for.cond16, !dbg !346

for.cond16:                                       ; preds = %for.inc22, %if.then15
  %18 = load i32* %i, align 4, !dbg !349
  %19 = load i32* %n.addr, align 4, !dbg !353
  %cmp17 = icmp slt i32 %18, %19, !dbg !354
  br i1 %cmp17, label %for.body19, label %for.end26, !dbg !355

for.body19:                                       ; preds = %for.cond16
  %20 = load float** %sy.addr, align 8, !dbg !356
  %21 = load float* %20, align 4, !dbg !357
  %22 = load float* %sa.addr, align 4, !dbg !358
  %23 = load float** %sx.addr, align 8, !dbg !359
  %24 = load float* %23, align 4, !dbg !360
  %mul20 = fmul float %22, %24, !dbg !358
  %add21 = fadd float %21, %mul20, !dbg !357
  %25 = load float** %sx.addr, align 8, !dbg !361
  store float %add21, float* %25, align 4, !dbg !362
  br label %for.inc22, !dbg !362

for.inc22:                                        ; preds = %for.body19
  %26 = load i32* %i, align 4, !dbg !363
  %inc23 = add nsw i32 %26, 1, !dbg !363
  store i32 %inc23, i32* %i, align 4, !dbg !363
  %27 = load i32* %incx.addr, align 4, !dbg !364
  %28 = load float** %sx.addr, align 8, !dbg !365
  %idx.ext = sext i32 %27 to i64, !dbg !365
  %add.ptr = getelementptr inbounds float* %28, i64 %idx.ext, !dbg !365
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !365
  %29 = load i32* %incx.addr, align 4, !dbg !366
  %30 = load float** %sy.addr, align 8, !dbg !367
  %idx.ext24 = sext i32 %29 to i64, !dbg !367
  %add.ptr25 = getelementptr inbounds float* %30, i64 %idx.ext24, !dbg !367
  store float* %add.ptr25, float** %sy.addr, align 8, !dbg !367
  br label %for.cond16, !dbg !368

for.end26:                                        ; preds = %for.cond16
  br label %for.end60, !dbg !369

if.end27:                                         ; preds = %if.end12
  br label %if.end28, !dbg !370

if.end28:                                         ; preds = %if.end27, %if.end
  %31 = load i32* %incx.addr, align 4, !dbg !371
  %cmp29 = icmp slt i32 %31, 0, !dbg !371
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !373

if.then31:                                        ; preds = %if.end28
  %32 = load i32* %n.addr, align 4, !dbg !374
  %sub = sub nsw i32 0, %32, !dbg !376
  %add32 = add nsw i32 %sub, 1, !dbg !376
  %33 = load i32* %incx.addr, align 4, !dbg !377
  %mul33 = mul nsw i32 %add32, %33, !dbg !378
  %add34 = add nsw i32 %mul33, 1, !dbg !378
  %34 = load float** %sx.addr, align 8, !dbg !379
  %idx.ext35 = sext i32 %add34 to i64, !dbg !379
  %add.ptr36 = getelementptr inbounds float* %34, i64 %idx.ext35, !dbg !379
  store float* %add.ptr36, float** %sx.addr, align 8, !dbg !379
  br label %if.end37, !dbg !379

if.end37:                                         ; preds = %if.then31, %if.end28
  %35 = load i32* %incy.addr, align 4, !dbg !380
  %cmp38 = icmp slt i32 %35, 0, !dbg !380
  br i1 %cmp38, label %if.then40, label %if.end47, !dbg !382

if.then40:                                        ; preds = %if.end37
  %36 = load i32* %n.addr, align 4, !dbg !383
  %sub41 = sub nsw i32 0, %36, !dbg !385
  %add42 = add nsw i32 %sub41, 1, !dbg !385
  %37 = load i32* %incy.addr, align 4, !dbg !386
  %mul43 = mul nsw i32 %add42, %37, !dbg !387
  %add44 = add nsw i32 %mul43, 1, !dbg !387
  %38 = load float** %sy.addr, align 8, !dbg !388
  %idx.ext45 = sext i32 %add44 to i64, !dbg !388
  %add.ptr46 = getelementptr inbounds float* %38, i64 %idx.ext45, !dbg !388
  store float* %add.ptr46, float** %sy.addr, align 8, !dbg !388
  br label %if.end47, !dbg !388

if.end47:                                         ; preds = %if.then40, %if.end37
  store i32 0, i32* %i, align 4, !dbg !389
  br label %for.cond48, !dbg !389

for.cond48:                                       ; preds = %for.inc54, %if.end47
  %39 = load i32* %i, align 4, !dbg !391
  %40 = load i32* %n.addr, align 4, !dbg !395
  %cmp49 = icmp slt i32 %39, %40, !dbg !396
  br i1 %cmp49, label %for.body51, label %for.end60, !dbg !397

for.body51:                                       ; preds = %for.cond48
  %41 = load float** %sy.addr, align 8, !dbg !398
  %42 = load float* %41, align 4, !dbg !399
  %43 = load float* %sa.addr, align 4, !dbg !400
  %44 = load float** %sx.addr, align 8, !dbg !401
  %45 = load float* %44, align 4, !dbg !402
  %mul52 = fmul float %43, %45, !dbg !400
  %add53 = fadd float %42, %mul52, !dbg !399
  %46 = load float** %sx.addr, align 8, !dbg !403
  store float %add53, float* %46, align 4, !dbg !404
  br label %for.inc54, !dbg !404

for.inc54:                                        ; preds = %for.body51
  %47 = load i32* %i, align 4, !dbg !405
  %inc55 = add nsw i32 %47, 1, !dbg !405
  store i32 %inc55, i32* %i, align 4, !dbg !405
  %48 = load i32* %incx.addr, align 4, !dbg !406
  %49 = load float** %sx.addr, align 8, !dbg !407
  %idx.ext56 = sext i32 %48 to i64, !dbg !407
  %add.ptr57 = getelementptr inbounds float* %49, i64 %idx.ext56, !dbg !407
  store float* %add.ptr57, float** %sx.addr, align 8, !dbg !407
  %50 = load i32* %incy.addr, align 4, !dbg !408
  %51 = load float** %sy.addr, align 8, !dbg !409
  %idx.ext58 = sext i32 %50 to i64, !dbg !409
  %add.ptr59 = getelementptr inbounds float* %51, i64 %idx.ext58, !dbg !409
  store float* %add.ptr59, float** %sy.addr, align 8, !dbg !409
  br label %for.cond48, !dbg !410

for.end60:                                        ; preds = %if.then, %for.end, %for.end26, %for.cond48
  ret void, !dbg !411
}

; Function Attrs: nounwind uwtable
define void @scopy(i32 %n, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !412, metadata !44), !dbg !413
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !414, metadata !44), !dbg !415
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !416, metadata !44), !dbg !417
  store float* %sy, float** %sy.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sy.addr, metadata !418, metadata !44), !dbg !419
  store i32 %incy, i32* %incy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incy.addr, metadata !420, metadata !44), !dbg !421
  call void @llvm.dbg.declare(metadata i32* %i, metadata !422, metadata !44), !dbg !423
  %0 = load i32* %n.addr, align 4, !dbg !424
  %cmp = icmp slt i32 %0, 1, !dbg !424
  br i1 %cmp, label %if.then, label %if.end, !dbg !426

if.then:                                          ; preds = %entry
  br label %return, !dbg !427

if.end:                                           ; preds = %entry
  %1 = load i32* %incx.addr, align 4, !dbg !429
  %2 = load i32* %incy.addr, align 4, !dbg !431
  %cmp1 = icmp eq i32 %1, %2, !dbg !429
  br i1 %cmp1, label %if.then2, label %if.end19, !dbg !432

if.then2:                                         ; preds = %if.end
  %3 = load i32* %incx.addr, align 4, !dbg !433
  %cmp3 = icmp eq i32 %3, 1, !dbg !433
  br i1 %cmp3, label %if.then4, label %if.end7, !dbg !436

if.then4:                                         ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !437
  br label %for.cond, !dbg !437

for.cond:                                         ; preds = %for.inc, %if.then4
  %4 = load i32* %i, align 4, !dbg !440
  %5 = load i32* %n.addr, align 4, !dbg !444
  %cmp5 = icmp slt i32 %4, %5, !dbg !445
  br i1 %cmp5, label %for.body, label %for.end, !dbg !446

for.body:                                         ; preds = %for.cond
  %6 = load float** %sx.addr, align 8, !dbg !447
  %incdec.ptr = getelementptr inbounds float* %6, i32 1, !dbg !447
  store float* %incdec.ptr, float** %sx.addr, align 8, !dbg !447
  %7 = load float* %6, align 4, !dbg !448
  %8 = load float** %sy.addr, align 8, !dbg !449
  %incdec.ptr6 = getelementptr inbounds float* %8, i32 1, !dbg !449
  store float* %incdec.ptr6, float** %sy.addr, align 8, !dbg !449
  store float %7, float* %8, align 4, !dbg !450
  br label %for.inc, !dbg !450

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4, !dbg !451
  %inc = add nsw i32 %9, 1, !dbg !451
  store i32 %inc, i32* %i, align 4, !dbg !451
  br label %for.cond, !dbg !452

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !453

if.end7:                                          ; preds = %if.then2
  %10 = load i32* %incx.addr, align 4, !dbg !454
  %cmp8 = icmp sgt i32 %10, 0, !dbg !454
  br i1 %cmp8, label %if.then9, label %if.end18, !dbg !456

if.then9:                                         ; preds = %if.end7
  store i32 0, i32* %i, align 4, !dbg !457
  br label %for.cond10, !dbg !457

for.cond10:                                       ; preds = %for.inc13, %if.then9
  %11 = load i32* %i, align 4, !dbg !460
  %12 = load i32* %n.addr, align 4, !dbg !464
  %cmp11 = icmp slt i32 %11, %12, !dbg !465
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !466

for.body12:                                       ; preds = %for.cond10
  %13 = load float** %sx.addr, align 8, !dbg !467
  %14 = load float* %13, align 4, !dbg !468
  %15 = load float** %sy.addr, align 8, !dbg !469
  store float %14, float* %15, align 4, !dbg !470
  br label %for.inc13, !dbg !470

for.inc13:                                        ; preds = %for.body12
  %16 = load i32* %i, align 4, !dbg !471
  %inc14 = add nsw i32 %16, 1, !dbg !471
  store i32 %inc14, i32* %i, align 4, !dbg !471
  %17 = load i32* %incx.addr, align 4, !dbg !472
  %18 = load float** %sx.addr, align 8, !dbg !473
  %idx.ext = sext i32 %17 to i64, !dbg !473
  %add.ptr = getelementptr inbounds float* %18, i64 %idx.ext, !dbg !473
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !473
  %19 = load i32* %incx.addr, align 4, !dbg !474
  %20 = load float** %sy.addr, align 8, !dbg !475
  %idx.ext15 = sext i32 %19 to i64, !dbg !475
  %add.ptr16 = getelementptr inbounds float* %20, i64 %idx.ext15, !dbg !475
  store float* %add.ptr16, float** %sy.addr, align 8, !dbg !475
  br label %for.cond10, !dbg !476

for.end17:                                        ; preds = %for.cond10
  br label %return, !dbg !477

if.end18:                                         ; preds = %if.end7
  br label %if.end19, !dbg !478

if.end19:                                         ; preds = %if.end18, %if.end
  %21 = load i32* %incx.addr, align 4, !dbg !479
  %cmp20 = icmp slt i32 %21, 0, !dbg !479
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !481

if.then21:                                        ; preds = %if.end19
  %22 = load i32* %n.addr, align 4, !dbg !482
  %sub = sub nsw i32 0, %22, !dbg !484
  %add = add nsw i32 %sub, 1, !dbg !484
  %23 = load i32* %incx.addr, align 4, !dbg !485
  %mul = mul nsw i32 %add, %23, !dbg !486
  %add22 = add nsw i32 %mul, 1, !dbg !486
  %24 = load float** %sx.addr, align 8, !dbg !487
  %idx.ext23 = sext i32 %add22 to i64, !dbg !487
  %add.ptr24 = getelementptr inbounds float* %24, i64 %idx.ext23, !dbg !487
  store float* %add.ptr24, float** %sx.addr, align 8, !dbg !487
  br label %if.end25, !dbg !487

if.end25:                                         ; preds = %if.then21, %if.end19
  %25 = load i32* %incy.addr, align 4, !dbg !488
  %cmp26 = icmp slt i32 %25, 0, !dbg !488
  br i1 %cmp26, label %if.then27, label %if.end34, !dbg !490

if.then27:                                        ; preds = %if.end25
  %26 = load i32* %n.addr, align 4, !dbg !491
  %sub28 = sub nsw i32 0, %26, !dbg !493
  %add29 = add nsw i32 %sub28, 1, !dbg !493
  %27 = load i32* %incy.addr, align 4, !dbg !494
  %mul30 = mul nsw i32 %add29, %27, !dbg !495
  %add31 = add nsw i32 %mul30, 1, !dbg !495
  %28 = load float** %sy.addr, align 8, !dbg !496
  %idx.ext32 = sext i32 %add31 to i64, !dbg !496
  %add.ptr33 = getelementptr inbounds float* %28, i64 %idx.ext32, !dbg !496
  store float* %add.ptr33, float** %sy.addr, align 8, !dbg !496
  br label %if.end34, !dbg !496

if.end34:                                         ; preds = %if.then27, %if.end25
  store i32 0, i32* %i, align 4, !dbg !497
  br label %for.cond35, !dbg !497

for.cond35:                                       ; preds = %for.inc38, %if.end34
  %29 = load i32* %i, align 4, !dbg !499
  %30 = load i32* %n.addr, align 4, !dbg !503
  %cmp36 = icmp slt i32 %29, %30, !dbg !504
  br i1 %cmp36, label %for.body37, label %for.end44, !dbg !505

for.body37:                                       ; preds = %for.cond35
  %31 = load float** %sy.addr, align 8, !dbg !506
  %32 = load float* %31, align 4, !dbg !507
  %33 = load float** %sx.addr, align 8, !dbg !508
  store float %32, float* %33, align 4, !dbg !509
  br label %for.inc38, !dbg !509

for.inc38:                                        ; preds = %for.body37
  %34 = load i32* %i, align 4, !dbg !510
  %inc39 = add nsw i32 %34, 1, !dbg !510
  store i32 %inc39, i32* %i, align 4, !dbg !510
  %35 = load i32* %incx.addr, align 4, !dbg !511
  %36 = load float** %sx.addr, align 8, !dbg !512
  %idx.ext40 = sext i32 %35 to i64, !dbg !512
  %add.ptr41 = getelementptr inbounds float* %36, i64 %idx.ext40, !dbg !512
  store float* %add.ptr41, float** %sx.addr, align 8, !dbg !512
  %37 = load i32* %incy.addr, align 4, !dbg !513
  %38 = load float** %sy.addr, align 8, !dbg !514
  %idx.ext42 = sext i32 %37 to i64, !dbg !514
  %add.ptr43 = getelementptr inbounds float* %38, i64 %idx.ext42, !dbg !514
  store float* %add.ptr43, float** %sy.addr, align 8, !dbg !514
  br label %for.cond35, !dbg !515

for.end44:                                        ; preds = %for.cond35
  br label %return, !dbg !516

return:                                           ; preds = %for.end44, %for.end17, %for.end, %if.then
  ret void, !dbg !517
}

; Function Attrs: nounwind uwtable
define double @sdot(i32 %n, float* %sx, i32 %incx, float* %sy, i32 %incy) #0 {
entry:
  %retval = alloca double, align 8
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %sy.addr = alloca float*, align 8
  %incy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %stemp = alloca float, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !518, metadata !44), !dbg !519
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !520, metadata !44), !dbg !521
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !522, metadata !44), !dbg !523
  store float* %sy, float** %sy.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sy.addr, metadata !524, metadata !44), !dbg !525
  store i32 %incy, i32* %incy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incy.addr, metadata !526, metadata !44), !dbg !527
  call void @llvm.dbg.declare(metadata i32* %i, metadata !528, metadata !44), !dbg !529
  call void @llvm.dbg.declare(metadata float* %stemp, metadata !530, metadata !44), !dbg !531
  store float 0.000000e+00, float* %stemp, align 4, !dbg !531
  %0 = load i32* %n.addr, align 4, !dbg !532
  %cmp = icmp slt i32 %0, 1, !dbg !532
  br i1 %cmp, label %if.then, label %if.end, !dbg !534

if.then:                                          ; preds = %entry
  %1 = load float* %stemp, align 4, !dbg !535
  %conv = fpext float %1 to double, !dbg !537
  store double %conv, double* %retval, !dbg !538
  br label %return, !dbg !538

if.end:                                           ; preds = %entry
  %2 = load i32* %incx.addr, align 4, !dbg !539
  %3 = load i32* %incy.addr, align 4, !dbg !541
  %cmp1 = icmp eq i32 %2, %3, !dbg !539
  br i1 %cmp1, label %if.then3, label %if.end28, !dbg !542

if.then3:                                         ; preds = %if.end
  %4 = load i32* %incx.addr, align 4, !dbg !543
  %cmp4 = icmp eq i32 %4, 1, !dbg !543
  br i1 %cmp4, label %if.then6, label %if.end11, !dbg !546

if.then6:                                         ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !547
  br label %for.cond, !dbg !547

for.cond:                                         ; preds = %for.inc, %if.then6
  %5 = load i32* %i, align 4, !dbg !550
  %6 = load i32* %n.addr, align 4, !dbg !554
  %cmp7 = icmp slt i32 %5, %6, !dbg !555
  br i1 %cmp7, label %for.body, label %for.end, !dbg !556

for.body:                                         ; preds = %for.cond
  %7 = load float** %sx.addr, align 8, !dbg !557
  %8 = load float* %7, align 4, !dbg !558
  %9 = load float** %sy.addr, align 8, !dbg !559
  %10 = load float* %9, align 4, !dbg !560
  %mul = fmul float %8, %10, !dbg !561
  %11 = load float* %stemp, align 4, !dbg !562
  %add = fadd float %11, %mul, !dbg !562
  store float %add, float* %stemp, align 4, !dbg !562
  br label %for.inc, !dbg !562

for.inc:                                          ; preds = %for.body
  %12 = load i32* %i, align 4, !dbg !563
  %inc = add nsw i32 %12, 1, !dbg !563
  store i32 %inc, i32* %i, align 4, !dbg !563
  %13 = load float** %sx.addr, align 8, !dbg !564
  %incdec.ptr = getelementptr inbounds float* %13, i32 1, !dbg !564
  store float* %incdec.ptr, float** %sx.addr, align 8, !dbg !564
  %14 = load float** %sy.addr, align 8, !dbg !565
  %incdec.ptr9 = getelementptr inbounds float* %14, i32 1, !dbg !565
  store float* %incdec.ptr9, float** %sy.addr, align 8, !dbg !565
  br label %for.cond, !dbg !566

for.end:                                          ; preds = %for.cond
  %15 = load float* %stemp, align 4, !dbg !567
  %conv10 = fpext float %15 to double, !dbg !568
  store double %conv10, double* %retval, !dbg !569
  br label %return, !dbg !569

if.end11:                                         ; preds = %if.then3
  %16 = load i32* %incx.addr, align 4, !dbg !570
  %cmp12 = icmp sgt i32 %16, 0, !dbg !570
  br i1 %cmp12, label %if.then14, label %if.end27, !dbg !572

if.then14:                                        ; preds = %if.end11
  store i32 0, i32* %i, align 4, !dbg !573
  br label %for.cond15, !dbg !573

for.cond15:                                       ; preds = %for.inc21, %if.then14
  %17 = load i32* %i, align 4, !dbg !576
  %18 = load i32* %n.addr, align 4, !dbg !580
  %cmp16 = icmp slt i32 %17, %18, !dbg !581
  br i1 %cmp16, label %for.body18, label %for.end25, !dbg !582

for.body18:                                       ; preds = %for.cond15
  %19 = load float** %sx.addr, align 8, !dbg !583
  %20 = load float* %19, align 4, !dbg !584
  %21 = load float** %sy.addr, align 8, !dbg !585
  %22 = load float* %21, align 4, !dbg !586
  %mul19 = fmul float %20, %22, !dbg !587
  %23 = load float* %stemp, align 4, !dbg !588
  %add20 = fadd float %23, %mul19, !dbg !588
  store float %add20, float* %stemp, align 4, !dbg !588
  br label %for.inc21, !dbg !588

for.inc21:                                        ; preds = %for.body18
  %24 = load i32* %i, align 4, !dbg !589
  %inc22 = add nsw i32 %24, 1, !dbg !589
  store i32 %inc22, i32* %i, align 4, !dbg !589
  %25 = load i32* %incx.addr, align 4, !dbg !590
  %26 = load float** %sx.addr, align 8, !dbg !591
  %idx.ext = sext i32 %25 to i64, !dbg !591
  %add.ptr = getelementptr inbounds float* %26, i64 %idx.ext, !dbg !591
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !591
  %27 = load i32* %incx.addr, align 4, !dbg !592
  %28 = load float** %sy.addr, align 8, !dbg !593
  %idx.ext23 = sext i32 %27 to i64, !dbg !593
  %add.ptr24 = getelementptr inbounds float* %28, i64 %idx.ext23, !dbg !593
  store float* %add.ptr24, float** %sy.addr, align 8, !dbg !593
  br label %for.cond15, !dbg !594

for.end25:                                        ; preds = %for.cond15
  %29 = load float* %stemp, align 4, !dbg !595
  %conv26 = fpext float %29 to double, !dbg !596
  store double %conv26, double* %retval, !dbg !597
  br label %return, !dbg !597

if.end27:                                         ; preds = %if.end11
  br label %if.end28, !dbg !598

if.end28:                                         ; preds = %if.end27, %if.end
  %30 = load i32* %incx.addr, align 4, !dbg !599
  %cmp29 = icmp slt i32 %30, 0, !dbg !599
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !601

if.then31:                                        ; preds = %if.end28
  %31 = load i32* %n.addr, align 4, !dbg !602
  %sub = sub nsw i32 0, %31, !dbg !604
  %add32 = add nsw i32 %sub, 1, !dbg !604
  %32 = load i32* %incx.addr, align 4, !dbg !605
  %mul33 = mul nsw i32 %add32, %32, !dbg !606
  %add34 = add nsw i32 %mul33, 1, !dbg !606
  %33 = load float** %sx.addr, align 8, !dbg !607
  %idx.ext35 = sext i32 %add34 to i64, !dbg !607
  %add.ptr36 = getelementptr inbounds float* %33, i64 %idx.ext35, !dbg !607
  store float* %add.ptr36, float** %sx.addr, align 8, !dbg !607
  br label %if.end37, !dbg !607

if.end37:                                         ; preds = %if.then31, %if.end28
  %34 = load i32* %incy.addr, align 4, !dbg !608
  %cmp38 = icmp slt i32 %34, 0, !dbg !608
  br i1 %cmp38, label %if.then40, label %if.end47, !dbg !610

if.then40:                                        ; preds = %if.end37
  %35 = load i32* %n.addr, align 4, !dbg !611
  %sub41 = sub nsw i32 0, %35, !dbg !613
  %add42 = add nsw i32 %sub41, 1, !dbg !613
  %36 = load i32* %incy.addr, align 4, !dbg !614
  %mul43 = mul nsw i32 %add42, %36, !dbg !615
  %add44 = add nsw i32 %mul43, 1, !dbg !615
  %37 = load float** %sy.addr, align 8, !dbg !616
  %idx.ext45 = sext i32 %add44 to i64, !dbg !616
  %add.ptr46 = getelementptr inbounds float* %37, i64 %idx.ext45, !dbg !616
  store float* %add.ptr46, float** %sy.addr, align 8, !dbg !616
  br label %if.end47, !dbg !616

if.end47:                                         ; preds = %if.then40, %if.end37
  store i32 0, i32* %i, align 4, !dbg !617
  br label %for.cond48, !dbg !617

for.cond48:                                       ; preds = %for.inc54, %if.end47
  %38 = load i32* %i, align 4, !dbg !619
  %39 = load i32* %n.addr, align 4, !dbg !623
  %cmp49 = icmp slt i32 %38, %39, !dbg !624
  br i1 %cmp49, label %for.body51, label %for.end60, !dbg !625

for.body51:                                       ; preds = %for.cond48
  %40 = load float** %sx.addr, align 8, !dbg !626
  %41 = load float* %40, align 4, !dbg !627
  %42 = load float** %sy.addr, align 8, !dbg !628
  %43 = load float* %42, align 4, !dbg !629
  %mul52 = fmul float %41, %43, !dbg !630
  %44 = load float* %stemp, align 4, !dbg !631
  %add53 = fadd float %44, %mul52, !dbg !631
  store float %add53, float* %stemp, align 4, !dbg !631
  br label %for.inc54, !dbg !631

for.inc54:                                        ; preds = %for.body51
  %45 = load i32* %i, align 4, !dbg !632
  %inc55 = add nsw i32 %45, 1, !dbg !632
  store i32 %inc55, i32* %i, align 4, !dbg !632
  %46 = load i32* %incx.addr, align 4, !dbg !633
  %47 = load float** %sx.addr, align 8, !dbg !634
  %idx.ext56 = sext i32 %46 to i64, !dbg !634
  %add.ptr57 = getelementptr inbounds float* %47, i64 %idx.ext56, !dbg !634
  store float* %add.ptr57, float** %sx.addr, align 8, !dbg !634
  %48 = load i32* %incy.addr, align 4, !dbg !635
  %49 = load float** %sy.addr, align 8, !dbg !636
  %idx.ext58 = sext i32 %48 to i64, !dbg !636
  %add.ptr59 = getelementptr inbounds float* %49, i64 %idx.ext58, !dbg !636
  store float* %add.ptr59, float** %sy.addr, align 8, !dbg !636
  br label %for.cond48, !dbg !637

for.end60:                                        ; preds = %for.cond48
  %50 = load float* %stemp, align 4, !dbg !638
  %conv61 = fpext float %50 to double, !dbg !639
  store double %conv61, double* %retval, !dbg !640
  br label %return, !dbg !640

return:                                           ; preds = %for.end60, %for.end25, %for.end, %if.then
  %51 = load double* %retval, !dbg !641
  ret double %51, !dbg !641
}

; Function Attrs: nounwind uwtable
define double @snrm2(i32 %n, float* %sx, i32 %incx) #0 {
entry:
  %retval = alloca double, align 8
  %n.addr = alloca i32, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %phase = alloca i32, align 4
  %sum = alloca double, align 8
  %cutlo = alloca double, align 8
  %cuthi = alloca double, align 8
  %hitst = alloca double, align 8
  %xmax = alloca float, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !642, metadata !44), !dbg !643
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !644, metadata !44), !dbg !645
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !646, metadata !44), !dbg !647
  call void @llvm.dbg.declare(metadata i32* %i, metadata !648, metadata !44), !dbg !649
  call void @llvm.dbg.declare(metadata i32* %phase, metadata !650, metadata !44), !dbg !651
  store i32 3, i32* %phase, align 4, !dbg !651
  call void @llvm.dbg.declare(metadata double* %sum, metadata !652, metadata !44), !dbg !653
  store double 0.000000e+00, double* %sum, align 8, !dbg !653
  call void @llvm.dbg.declare(metadata double* %cutlo, metadata !654, metadata !44), !dbg !655
  call void @llvm.dbg.declare(metadata double* %cuthi, metadata !656, metadata !44), !dbg !657
  call void @llvm.dbg.declare(metadata double* %hitst, metadata !658, metadata !44), !dbg !659
  call void @llvm.dbg.declare(metadata float* %xmax, metadata !660, metadata !44), !dbg !661
  %0 = load i32* %n.addr, align 4, !dbg !662
  %cmp = icmp slt i32 %0, 1, !dbg !662
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !664

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %incx.addr, align 4, !dbg !665
  %cmp1 = icmp slt i32 %1, 1, !dbg !665
  br i1 %cmp1, label %if.then, label %if.end, !dbg !664

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load double* %sum, align 8, !dbg !667
  store double %2, double* %retval, !dbg !670
  br label %return, !dbg !670

if.end:                                           ; preds = %lor.lhs.false
  %call = call double @r1mach(), !dbg !671
  %div = fdiv double 1.000000e-45, %call, !dbg !672
  %call2 = call double @sqrt(double %div) #3, !dbg !673
  store double %call2, double* %cutlo, align 8, !dbg !674
  %call3 = call double @sqrt(double 1.000000e+38) #3, !dbg !675
  store double %call3, double* %cuthi, align 8, !dbg !676
  %3 = load double* %cuthi, align 8, !dbg !677
  %4 = load i32* %n.addr, align 4, !dbg !678
  %conv = sitofp i32 %4 to double, !dbg !679
  %div4 = fdiv double %3, %conv, !dbg !677
  store double %div4, double* %hitst, align 8, !dbg !680
  store i32 0, i32* %i, align 4, !dbg !681
  br label %while.cond, !dbg !682

while.cond:                                       ; preds = %while.body, %if.end
  %5 = load i32* %i, align 4, !dbg !683
  %6 = load i32* %n.addr, align 4, !dbg !686
  %cmp5 = icmp slt i32 %5, %6, !dbg !687
  br i1 %cmp5, label %land.rhs, label %land.end, !dbg !687

land.rhs:                                         ; preds = %while.cond
  %7 = load float** %sx.addr, align 8, !dbg !688
  %8 = load float* %7, align 4, !dbg !690
  %conv7 = fpext float %8 to double, !dbg !690
  %cmp8 = fcmp oeq double %conv7, 0.000000e+00, !dbg !690
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %9 = phi i1 [ false, %while.cond ], [ %cmp8, %land.rhs ]
  br i1 %9, label %while.body, label %while.end, !dbg !691

while.body:                                       ; preds = %land.end
  %10 = load i32* %i, align 4, !dbg !693
  %inc = add nsw i32 %10, 1, !dbg !693
  store i32 %inc, i32* %i, align 4, !dbg !693
  %11 = load i32* %incx.addr, align 4, !dbg !695
  %12 = load float** %sx.addr, align 8, !dbg !696
  %idx.ext = sext i32 %11 to i64, !dbg !696
  %add.ptr = getelementptr inbounds float* %12, i64 %idx.ext, !dbg !696
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !696
  br label %while.cond, !dbg !682

while.end:                                        ; preds = %land.end
  %13 = load i32* %i, align 4, !dbg !697
  %14 = load i32* %n.addr, align 4, !dbg !699
  %cmp10 = icmp sge i32 %13, %14, !dbg !697
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !700

if.then12:                                        ; preds = %while.end
  %15 = load double* %sum, align 8, !dbg !701
  store double %15, double* %retval, !dbg !703
  br label %return, !dbg !703

if.end13:                                         ; preds = %while.end
  br label %START, !dbg !704

START:                                            ; preds = %if.then68, %if.end13
  %16 = load float** %sx.addr, align 8, !dbg !706
  %17 = load float* %16, align 4, !dbg !706
  %conv14 = fpext float %17 to double, !dbg !706
  %cmp15 = fcmp ogt double %conv14, 0.000000e+00, !dbg !706
  br i1 %cmp15, label %cond.true, label %cond.false, !dbg !706

cond.true:                                        ; preds = %START
  %18 = load float** %sx.addr, align 8, !dbg !708
  %19 = load float* %18, align 4, !dbg !708
  br label %cond.end, !dbg !708

cond.false:                                       ; preds = %START
  %20 = load float** %sx.addr, align 8, !dbg !710
  %21 = load float* %20, align 4, !dbg !710
  %sub = fsub float -0.000000e+00, %21, !dbg !710
  br label %cond.end, !dbg !710

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %19, %cond.true ], [ %sub, %cond.false ], !dbg !706
  %conv17 = fpext float %cond to double, !dbg !712
  %22 = load double* %cutlo, align 8, !dbg !715
  %cmp18 = fcmp ogt double %conv17, %22, !dbg !706
  br i1 %cmp18, label %if.then20, label %if.else, !dbg !716

if.then20:                                        ; preds = %cond.end
  br label %for.cond, !dbg !717

for.cond:                                         ; preds = %for.inc, %if.then20
  %23 = load i32* %i, align 4, !dbg !719
  %24 = load i32* %n.addr, align 4, !dbg !724
  %cmp21 = icmp slt i32 %23, %24, !dbg !725
  br i1 %cmp21, label %for.body, label %for.end, !dbg !726

for.body:                                         ; preds = %for.cond
  %25 = load float** %sx.addr, align 8, !dbg !727
  %26 = load float* %25, align 4, !dbg !727
  %conv23 = fpext float %26 to double, !dbg !727
  %cmp24 = fcmp ogt double %conv23, 0.000000e+00, !dbg !727
  br i1 %cmp24, label %cond.true26, label %cond.false27, !dbg !727

cond.true26:                                      ; preds = %for.body
  %27 = load float** %sx.addr, align 8, !dbg !730
  %28 = load float* %27, align 4, !dbg !730
  br label %cond.end29, !dbg !730

cond.false27:                                     ; preds = %for.body
  %29 = load float** %sx.addr, align 8, !dbg !732
  %30 = load float* %29, align 4, !dbg !732
  %sub28 = fsub float -0.000000e+00, %30, !dbg !732
  br label %cond.end29, !dbg !732

cond.end29:                                       ; preds = %cond.false27, %cond.true26
  %cond30 = phi float [ %28, %cond.true26 ], [ %sub28, %cond.false27 ], !dbg !727
  %conv31 = fpext float %cond30 to double, !dbg !734
  %31 = load double* %hitst, align 8, !dbg !737
  %cmp32 = fcmp ogt double %conv31, %31, !dbg !727
  br i1 %cmp32, label %if.then34, label %if.end35, !dbg !738

if.then34:                                        ; preds = %cond.end29
  br label %GOT_LARGE, !dbg !739

if.end35:                                         ; preds = %cond.end29
  %32 = load float** %sx.addr, align 8, !dbg !741
  %33 = load float* %32, align 4, !dbg !742
  %34 = load float** %sx.addr, align 8, !dbg !743
  %35 = load float* %34, align 4, !dbg !744
  %mul = fmul float %33, %35, !dbg !745
  %conv36 = fpext float %mul to double, !dbg !745
  %36 = load double* %sum, align 8, !dbg !746
  %add = fadd double %36, %conv36, !dbg !746
  store double %add, double* %sum, align 8, !dbg !746
  br label %for.inc, !dbg !747

for.inc:                                          ; preds = %if.end35
  %37 = load i32* %i, align 4, !dbg !748
  %inc37 = add nsw i32 %37, 1, !dbg !748
  store i32 %inc37, i32* %i, align 4, !dbg !748
  %38 = load i32* %incx.addr, align 4, !dbg !749
  %39 = load float** %sx.addr, align 8, !dbg !750
  %idx.ext38 = sext i32 %38 to i64, !dbg !750
  %add.ptr39 = getelementptr inbounds float* %39, i64 %idx.ext38, !dbg !750
  store float* %add.ptr39, float** %sx.addr, align 8, !dbg !750
  br label %for.cond, !dbg !751

for.end:                                          ; preds = %for.cond
  %40 = load double* %sum, align 8, !dbg !752
  %call40 = call double @sqrt(double %40) #3, !dbg !753
  store double %call40, double* %sum, align 8, !dbg !754
  %41 = load double* %sum, align 8, !dbg !755
  store double %41, double* %retval, !dbg !756
  br label %return, !dbg !756

if.else:                                          ; preds = %cond.end
  %42 = load float** %sx.addr, align 8, !dbg !757
  %43 = load float* %42, align 4, !dbg !757
  %conv41 = fpext float %43 to double, !dbg !757
  %cmp42 = fcmp ogt double %conv41, 0.000000e+00, !dbg !757
  br i1 %cmp42, label %cond.true44, label %cond.false45, !dbg !757

cond.true44:                                      ; preds = %if.else
  %44 = load float** %sx.addr, align 8, !dbg !759
  %45 = load float* %44, align 4, !dbg !759
  br label %cond.end47, !dbg !759

cond.false45:                                     ; preds = %if.else
  %46 = load float** %sx.addr, align 8, !dbg !761
  %47 = load float* %46, align 4, !dbg !761
  %sub46 = fsub float -0.000000e+00, %47, !dbg !761
  br label %cond.end47, !dbg !761

cond.end47:                                       ; preds = %cond.false45, %cond.true44
  %cond48 = phi float [ %45, %cond.true44 ], [ %sub46, %cond.false45 ], !dbg !757
  store float %cond48, float* %xmax, align 4, !dbg !763
  %48 = load i32* %incx.addr, align 4, !dbg !766
  %49 = load float** %sx.addr, align 8, !dbg !767
  %idx.ext49 = sext i32 %48 to i64, !dbg !767
  %add.ptr50 = getelementptr inbounds float* %49, i64 %idx.ext49, !dbg !767
  store float* %add.ptr50, float** %sx.addr, align 8, !dbg !767
  %50 = load i32* %i, align 4, !dbg !768
  %inc51 = add nsw i32 %50, 1, !dbg !768
  store i32 %inc51, i32* %i, align 4, !dbg !768
  %51 = load double* %sum, align 8, !dbg !769
  %add52 = fadd double %51, 1.000000e+00, !dbg !769
  store double %add52, double* %sum, align 8, !dbg !769
  br label %for.cond53, !dbg !770

for.cond53:                                       ; preds = %for.inc106, %cond.end47
  %52 = load i32* %i, align 4, !dbg !771
  %53 = load i32* %n.addr, align 4, !dbg !776
  %cmp54 = icmp slt i32 %52, %53, !dbg !777
  br i1 %cmp54, label %for.body56, label %for.end110, !dbg !778

for.body56:                                       ; preds = %for.cond53
  %54 = load float** %sx.addr, align 8, !dbg !779
  %55 = load float* %54, align 4, !dbg !779
  %conv57 = fpext float %55 to double, !dbg !779
  %cmp58 = fcmp ogt double %conv57, 0.000000e+00, !dbg !779
  br i1 %cmp58, label %cond.true60, label %cond.false61, !dbg !779

cond.true60:                                      ; preds = %for.body56
  %56 = load float** %sx.addr, align 8, !dbg !782
  %57 = load float* %56, align 4, !dbg !782
  br label %cond.end63, !dbg !782

cond.false61:                                     ; preds = %for.body56
  %58 = load float** %sx.addr, align 8, !dbg !784
  %59 = load float* %58, align 4, !dbg !784
  %sub62 = fsub float -0.000000e+00, %59, !dbg !784
  br label %cond.end63, !dbg !784

cond.end63:                                       ; preds = %cond.false61, %cond.true60
  %cond64 = phi float [ %57, %cond.true60 ], [ %sub62, %cond.false61 ], !dbg !779
  %conv65 = fpext float %cond64 to double, !dbg !786
  %60 = load double* %cutlo, align 8, !dbg !789
  %cmp66 = fcmp ogt double %conv65, %60, !dbg !779
  br i1 %cmp66, label %if.then68, label %if.end73, !dbg !790

if.then68:                                        ; preds = %cond.end63
  %61 = load double* %sum, align 8, !dbg !791
  %62 = load float* %xmax, align 4, !dbg !793
  %conv69 = fpext float %62 to double, !dbg !793
  %mul70 = fmul double %61, %conv69, !dbg !791
  %63 = load float* %xmax, align 4, !dbg !794
  %conv71 = fpext float %63 to double, !dbg !794
  %mul72 = fmul double %mul70, %conv71, !dbg !795
  store double %mul72, double* %sum, align 8, !dbg !796
  br label %START, !dbg !797

if.end73:                                         ; preds = %cond.end63
  %64 = load float** %sx.addr, align 8, !dbg !798
  %65 = load float* %64, align 4, !dbg !798
  %conv74 = fpext float %65 to double, !dbg !798
  %cmp75 = fcmp ogt double %conv74, 0.000000e+00, !dbg !798
  br i1 %cmp75, label %cond.true77, label %cond.false78, !dbg !798

cond.true77:                                      ; preds = %if.end73
  %66 = load float** %sx.addr, align 8, !dbg !800
  %67 = load float* %66, align 4, !dbg !800
  br label %cond.end80, !dbg !800

cond.false78:                                     ; preds = %if.end73
  %68 = load float** %sx.addr, align 8, !dbg !802
  %69 = load float* %68, align 4, !dbg !802
  %sub79 = fsub float -0.000000e+00, %69, !dbg !802
  br label %cond.end80, !dbg !802

cond.end80:                                       ; preds = %cond.false78, %cond.true77
  %cond81 = phi float [ %67, %cond.true77 ], [ %sub79, %cond.false78 ], !dbg !798
  %70 = load float* %xmax, align 4, !dbg !804
  %cmp82 = fcmp ogt float %cond81, %70, !dbg !798
  br i1 %cmp82, label %if.then84, label %if.end100, !dbg !807

if.then84:                                        ; preds = %cond.end80
  %71 = load double* %sum, align 8, !dbg !808
  %72 = load float* %xmax, align 4, !dbg !810
  %73 = load float** %sx.addr, align 8, !dbg !811
  %74 = load float* %73, align 4, !dbg !812
  %div85 = fdiv float %72, %74, !dbg !810
  %conv86 = fpext float %div85 to double, !dbg !813
  %mul87 = fmul double %71, %conv86, !dbg !808
  %75 = load float* %xmax, align 4, !dbg !814
  %76 = load float** %sx.addr, align 8, !dbg !815
  %77 = load float* %76, align 4, !dbg !816
  %div88 = fdiv float %75, %77, !dbg !814
  %conv89 = fpext float %div88 to double, !dbg !817
  %mul90 = fmul double %mul87, %conv89, !dbg !808
  %add91 = fadd double 1.000000e+00, %mul90, !dbg !818
  store double %add91, double* %sum, align 8, !dbg !819
  %78 = load float** %sx.addr, align 8, !dbg !820
  %79 = load float* %78, align 4, !dbg !820
  %conv92 = fpext float %79 to double, !dbg !820
  %cmp93 = fcmp ogt double %conv92, 0.000000e+00, !dbg !820
  br i1 %cmp93, label %cond.true95, label %cond.false96, !dbg !820

cond.true95:                                      ; preds = %if.then84
  %80 = load float** %sx.addr, align 8, !dbg !821
  %81 = load float* %80, align 4, !dbg !821
  br label %cond.end98, !dbg !821

cond.false96:                                     ; preds = %if.then84
  %82 = load float** %sx.addr, align 8, !dbg !823
  %83 = load float* %82, align 4, !dbg !823
  %sub97 = fsub float -0.000000e+00, %83, !dbg !823
  br label %cond.end98, !dbg !823

cond.end98:                                       ; preds = %cond.false96, %cond.true95
  %cond99 = phi float [ %81, %cond.true95 ], [ %sub97, %cond.false96 ], !dbg !820
  store float %cond99, float* %xmax, align 4, !dbg !825
  br label %for.inc106, !dbg !828

if.end100:                                        ; preds = %cond.end80
  %84 = load float** %sx.addr, align 8, !dbg !829
  %85 = load float* %84, align 4, !dbg !830
  %86 = load float* %xmax, align 4, !dbg !831
  %div101 = fdiv float %85, %86, !dbg !832
  %87 = load float** %sx.addr, align 8, !dbg !833
  %88 = load float* %87, align 4, !dbg !834
  %89 = load float* %xmax, align 4, !dbg !835
  %div102 = fdiv float %88, %89, !dbg !836
  %mul103 = fmul float %div101, %div102, !dbg !837
  %conv104 = fpext float %mul103 to double, !dbg !837
  %90 = load double* %sum, align 8, !dbg !838
  %add105 = fadd double %90, %conv104, !dbg !838
  store double %add105, double* %sum, align 8, !dbg !838
  br label %for.inc106, !dbg !839

for.inc106:                                       ; preds = %if.end100, %cond.end98
  %91 = load i32* %i, align 4, !dbg !840
  %inc107 = add nsw i32 %91, 1, !dbg !840
  store i32 %inc107, i32* %i, align 4, !dbg !840
  %92 = load i32* %incx.addr, align 4, !dbg !841
  %93 = load float** %sx.addr, align 8, !dbg !842
  %idx.ext108 = sext i32 %92 to i64, !dbg !842
  %add.ptr109 = getelementptr inbounds float* %93, i64 %idx.ext108, !dbg !842
  store float* %add.ptr109, float** %sx.addr, align 8, !dbg !842
  br label %for.cond53, !dbg !843

for.end110:                                       ; preds = %for.cond53
  %94 = load float* %xmax, align 4, !dbg !844
  %conv111 = fpext float %94 to double, !dbg !845
  %95 = load double* %sum, align 8, !dbg !846
  %call112 = call double @sqrt(double %95) #3, !dbg !847
  %mul113 = fmul double %conv111, %call112, !dbg !845
  store double %mul113, double* %retval, !dbg !848
  br label %return, !dbg !848

GOT_LARGE:                                        ; preds = %if.then34
  %96 = load double* %sum, align 8, !dbg !849
  %97 = load float** %sx.addr, align 8, !dbg !850
  %98 = load float* %97, align 4, !dbg !851
  %conv114 = fpext float %98 to double, !dbg !852
  %div115 = fdiv double %96, %conv114, !dbg !849
  %99 = load float** %sx.addr, align 8, !dbg !853
  %100 = load float* %99, align 4, !dbg !854
  %conv116 = fpext float %100 to double, !dbg !855
  %div117 = fdiv double %div115, %conv116, !dbg !856
  %add118 = fadd double 1.000000e+00, %div117, !dbg !857
  store double %add118, double* %sum, align 8, !dbg !858
  %101 = load float** %sx.addr, align 8, !dbg !859
  %102 = load float* %101, align 4, !dbg !859
  %conv119 = fpext float %102 to double, !dbg !859
  %cmp120 = fcmp ogt double %conv119, 0.000000e+00, !dbg !859
  br i1 %cmp120, label %cond.true122, label %cond.false123, !dbg !859

cond.true122:                                     ; preds = %GOT_LARGE
  %103 = load float** %sx.addr, align 8, !dbg !860
  %104 = load float* %103, align 4, !dbg !860
  br label %cond.end125, !dbg !860

cond.false123:                                    ; preds = %GOT_LARGE
  %105 = load float** %sx.addr, align 8, !dbg !861
  %106 = load float* %105, align 4, !dbg !861
  %sub124 = fsub float -0.000000e+00, %106, !dbg !861
  br label %cond.end125, !dbg !861

cond.end125:                                      ; preds = %cond.false123, %cond.true122
  %cond126 = phi float [ %104, %cond.true122 ], [ %sub124, %cond.false123 ], !dbg !859
  store float %cond126, float* %xmax, align 4, !dbg !862
  %107 = load i32* %incx.addr, align 4, !dbg !864
  %108 = load float** %sx.addr, align 8, !dbg !865
  %idx.ext127 = sext i32 %107 to i64, !dbg !865
  %add.ptr128 = getelementptr inbounds float* %108, i64 %idx.ext127, !dbg !865
  store float* %add.ptr128, float** %sx.addr, align 8, !dbg !865
  %109 = load i32* %i, align 4, !dbg !866
  %inc129 = add nsw i32 %109, 1, !dbg !866
  store i32 %inc129, i32* %i, align 4, !dbg !866
  br label %for.cond130, !dbg !867

for.cond130:                                      ; preds = %for.inc166, %cond.end125
  %110 = load i32* %i, align 4, !dbg !868
  %111 = load i32* %n.addr, align 4, !dbg !873
  %cmp131 = icmp slt i32 %110, %111, !dbg !874
  br i1 %cmp131, label %for.body133, label %for.end170, !dbg !875

for.body133:                                      ; preds = %for.cond130
  %112 = load float** %sx.addr, align 8, !dbg !876
  %113 = load float* %112, align 4, !dbg !876
  %conv134 = fpext float %113 to double, !dbg !876
  %cmp135 = fcmp ogt double %conv134, 0.000000e+00, !dbg !876
  br i1 %cmp135, label %cond.true137, label %cond.false138, !dbg !876

cond.true137:                                     ; preds = %for.body133
  %114 = load float** %sx.addr, align 8, !dbg !879
  %115 = load float* %114, align 4, !dbg !879
  br label %cond.end140, !dbg !879

cond.false138:                                    ; preds = %for.body133
  %116 = load float** %sx.addr, align 8, !dbg !881
  %117 = load float* %116, align 4, !dbg !881
  %sub139 = fsub float -0.000000e+00, %117, !dbg !881
  br label %cond.end140, !dbg !881

cond.end140:                                      ; preds = %cond.false138, %cond.true137
  %cond141 = phi float [ %115, %cond.true137 ], [ %sub139, %cond.false138 ], !dbg !876
  %118 = load float* %xmax, align 4, !dbg !883
  %cmp142 = fcmp ogt float %cond141, %118, !dbg !876
  br i1 %cmp142, label %if.then144, label %if.end160, !dbg !886

if.then144:                                       ; preds = %cond.end140
  %119 = load double* %sum, align 8, !dbg !887
  %120 = load float* %xmax, align 4, !dbg !889
  %121 = load float** %sx.addr, align 8, !dbg !890
  %122 = load float* %121, align 4, !dbg !891
  %div145 = fdiv float %120, %122, !dbg !889
  %conv146 = fpext float %div145 to double, !dbg !892
  %mul147 = fmul double %119, %conv146, !dbg !887
  %123 = load float* %xmax, align 4, !dbg !893
  %124 = load float** %sx.addr, align 8, !dbg !894
  %125 = load float* %124, align 4, !dbg !895
  %div148 = fdiv float %123, %125, !dbg !893
  %conv149 = fpext float %div148 to double, !dbg !896
  %mul150 = fmul double %mul147, %conv149, !dbg !887
  %add151 = fadd double 1.000000e+00, %mul150, !dbg !897
  store double %add151, double* %sum, align 8, !dbg !898
  %126 = load float** %sx.addr, align 8, !dbg !899
  %127 = load float* %126, align 4, !dbg !899
  %conv152 = fpext float %127 to double, !dbg !899
  %cmp153 = fcmp ogt double %conv152, 0.000000e+00, !dbg !899
  br i1 %cmp153, label %cond.true155, label %cond.false156, !dbg !899

cond.true155:                                     ; preds = %if.then144
  %128 = load float** %sx.addr, align 8, !dbg !900
  %129 = load float* %128, align 4, !dbg !900
  br label %cond.end158, !dbg !900

cond.false156:                                    ; preds = %if.then144
  %130 = load float** %sx.addr, align 8, !dbg !902
  %131 = load float* %130, align 4, !dbg !902
  %sub157 = fsub float -0.000000e+00, %131, !dbg !902
  br label %cond.end158, !dbg !902

cond.end158:                                      ; preds = %cond.false156, %cond.true155
  %cond159 = phi float [ %129, %cond.true155 ], [ %sub157, %cond.false156 ], !dbg !899
  store float %cond159, float* %xmax, align 4, !dbg !904
  br label %for.inc166, !dbg !907

if.end160:                                        ; preds = %cond.end140
  %132 = load float** %sx.addr, align 8, !dbg !908
  %133 = load float* %132, align 4, !dbg !909
  %134 = load float* %xmax, align 4, !dbg !910
  %div161 = fdiv float %133, %134, !dbg !911
  %135 = load float** %sx.addr, align 8, !dbg !912
  %136 = load float* %135, align 4, !dbg !913
  %137 = load float* %xmax, align 4, !dbg !914
  %div162 = fdiv float %136, %137, !dbg !915
  %mul163 = fmul float %div161, %div162, !dbg !916
  %conv164 = fpext float %mul163 to double, !dbg !916
  %138 = load double* %sum, align 8, !dbg !917
  %add165 = fadd double %138, %conv164, !dbg !917
  store double %add165, double* %sum, align 8, !dbg !917
  br label %for.inc166, !dbg !918

for.inc166:                                       ; preds = %if.end160, %cond.end158
  %139 = load i32* %i, align 4, !dbg !919
  %inc167 = add nsw i32 %139, 1, !dbg !919
  store i32 %inc167, i32* %i, align 4, !dbg !919
  %140 = load i32* %incx.addr, align 4, !dbg !920
  %141 = load float** %sx.addr, align 8, !dbg !921
  %idx.ext168 = sext i32 %140 to i64, !dbg !921
  %add.ptr169 = getelementptr inbounds float* %141, i64 %idx.ext168, !dbg !921
  store float* %add.ptr169, float** %sx.addr, align 8, !dbg !921
  br label %for.cond130, !dbg !922

for.end170:                                       ; preds = %for.cond130
  %142 = load float* %xmax, align 4, !dbg !923
  %conv171 = fpext float %142 to double, !dbg !924
  %143 = load double* %sum, align 8, !dbg !925
  %call172 = call double @sqrt(double %143) #3, !dbg !926
  %mul173 = fmul double %conv171, %call172, !dbg !924
  store double %mul173, double* %retval, !dbg !927
  br label %return, !dbg !927

return:                                           ; preds = %for.end170, %for.end110, %for.end, %if.then12, %if.then
  %144 = load double* %retval, !dbg !928
  ret double %144, !dbg !928
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @r1mach() #0 {
entry:
  %u = alloca float, align 4
  %comp = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %u, metadata !929, metadata !44), !dbg !930
  store float 1.000000e+00, float* %u, align 4, !dbg !930
  call void @llvm.dbg.declare(metadata float* %comp, metadata !931, metadata !44), !dbg !932
  br label %do.body, !dbg !933

do.body:                                          ; preds = %do.cond, %entry
  %0 = load float* %u, align 4, !dbg !934
  %conv = fpext float %0 to double, !dbg !934
  %mul = fmul double %conv, 5.000000e-01, !dbg !934
  %conv1 = fptrunc double %mul to float, !dbg !934
  store float %conv1, float* %u, align 4, !dbg !934
  %1 = load float* %u, align 4, !dbg !936
  %conv2 = fpext float %1 to double, !dbg !936
  %add = fadd double 1.000000e+00, %conv2, !dbg !937
  %conv3 = fptrunc double %add to float, !dbg !937
  store float %conv3, float* %comp, align 4, !dbg !938
  br label %do.cond, !dbg !939

do.cond:                                          ; preds = %do.body
  %2 = load float* %comp, align 4, !dbg !940
  %conv4 = fpext float %2 to double, !dbg !940
  %cmp = fcmp une double %conv4, 1.000000e+00, !dbg !940
  br i1 %cmp, label %do.body, label %do.end, !dbg !939

do.end:                                           ; preds = %do.cond
  %3 = load float* %u, align 4, !dbg !941
  %conv6 = fpext float %3 to double, !dbg !942
  %mul7 = fmul double %conv6, 2.000000e+00, !dbg !942
  ret double %mul7, !dbg !943
}

; Function Attrs: nounwind uwtable
define i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %l.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %o.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %mt = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !944, metadata !44), !dbg !945
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !946, metadata !44), !dbg !947
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !948, metadata !44), !dbg !949
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !950, metadata !44), !dbg !951
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !952, metadata !44), !dbg !953
  store i32 %e, i32* %e.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %e.addr, metadata !954, metadata !44), !dbg !955
  store i32 %f, i32* %f.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %f.addr, metadata !956, metadata !44), !dbg !957
  store i32 %g, i32* %g.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %g.addr, metadata !958, metadata !44), !dbg !959
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !960, metadata !44), !dbg !961
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !962, metadata !44), !dbg !963
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !964, metadata !44), !dbg !965
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !966, metadata !44), !dbg !967
  store i32 %l, i32* %l.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %l.addr, metadata !968, metadata !44), !dbg !969
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !970, metadata !44), !dbg !971
  store i32 %o, i32* %o.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %o.addr, metadata !972, metadata !44), !dbg !973
  store i32 %p, i32* %p.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p.addr, metadata !974, metadata !44), !dbg !975
  call void @llvm.dbg.declare(metadata i32* %mt, metadata !976, metadata !44), !dbg !977
  %0 = load i32* %n.addr, align 4, !dbg !978
  %cmp = icmp slt i32 %0, 1, !dbg !978
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !980

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %n.addr, align 4, !dbg !981
  %cmp1 = icmp sgt i32 %1, 15, !dbg !981
  br i1 %cmp1, label %if.then, label %if.end, !dbg !980

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, !dbg !983
  br label %return, !dbg !983

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32* %a.addr, align 4, !dbg !986
  store i32 %2, i32* %mt, align 4, !dbg !987
  %3 = load i32* %n.addr, align 4, !dbg !988
  %cmp2 = icmp eq i32 %3, 1, !dbg !988
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !990

if.then3:                                         ; preds = %if.end
  %4 = load i32* %mt, align 4, !dbg !991
  store i32 %4, i32* %retval, !dbg !993
  br label %return, !dbg !993

if.end4:                                          ; preds = %if.end
  %5 = load i32* %mt, align 4, !dbg !994
  %6 = load i32* %b.addr, align 4, !dbg !996
  %cmp5 = icmp sgt i32 %5, %6, !dbg !994
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !997

if.then6:                                         ; preds = %if.end4
  %7 = load i32* %b.addr, align 4, !dbg !998
  store i32 %7, i32* %mt, align 4, !dbg !1000
  br label %if.end7, !dbg !1000

if.end7:                                          ; preds = %if.then6, %if.end4
  %8 = load i32* %n.addr, align 4, !dbg !1001
  %cmp8 = icmp eq i32 %8, 2, !dbg !1001
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !1003

if.then9:                                         ; preds = %if.end7
  %9 = load i32* %mt, align 4, !dbg !1004
  store i32 %9, i32* %retval, !dbg !1006
  br label %return, !dbg !1006

if.end10:                                         ; preds = %if.end7
  %10 = load i32* %mt, align 4, !dbg !1007
  %11 = load i32* %c.addr, align 4, !dbg !1009
  %cmp11 = icmp sgt i32 %10, %11, !dbg !1007
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !1010

if.then12:                                        ; preds = %if.end10
  %12 = load i32* %c.addr, align 4, !dbg !1011
  store i32 %12, i32* %mt, align 4, !dbg !1013
  br label %if.end13, !dbg !1013

if.end13:                                         ; preds = %if.then12, %if.end10
  %13 = load i32* %n.addr, align 4, !dbg !1014
  %cmp14 = icmp eq i32 %13, 3, !dbg !1014
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !1016

if.then15:                                        ; preds = %if.end13
  %14 = load i32* %mt, align 4, !dbg !1017
  store i32 %14, i32* %retval, !dbg !1019
  br label %return, !dbg !1019

if.end16:                                         ; preds = %if.end13
  %15 = load i32* %mt, align 4, !dbg !1020
  %16 = load i32* %d.addr, align 4, !dbg !1022
  %cmp17 = icmp sgt i32 %15, %16, !dbg !1020
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !1023

if.then18:                                        ; preds = %if.end16
  %17 = load i32* %d.addr, align 4, !dbg !1024
  store i32 %17, i32* %mt, align 4, !dbg !1026
  br label %if.end19, !dbg !1026

if.end19:                                         ; preds = %if.then18, %if.end16
  %18 = load i32* %n.addr, align 4, !dbg !1027
  %cmp20 = icmp eq i32 %18, 4, !dbg !1027
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !1029

if.then21:                                        ; preds = %if.end19
  %19 = load i32* %mt, align 4, !dbg !1030
  store i32 %19, i32* %retval, !dbg !1032
  br label %return, !dbg !1032

if.end22:                                         ; preds = %if.end19
  %20 = load i32* %mt, align 4, !dbg !1033
  %21 = load i32* %e.addr, align 4, !dbg !1035
  %cmp23 = icmp sgt i32 %20, %21, !dbg !1033
  br i1 %cmp23, label %if.then24, label %if.end25, !dbg !1036

if.then24:                                        ; preds = %if.end22
  %22 = load i32* %e.addr, align 4, !dbg !1037
  store i32 %22, i32* %mt, align 4, !dbg !1039
  br label %if.end25, !dbg !1039

if.end25:                                         ; preds = %if.then24, %if.end22
  %23 = load i32* %n.addr, align 4, !dbg !1040
  %cmp26 = icmp eq i32 %23, 5, !dbg !1040
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !1042

if.then27:                                        ; preds = %if.end25
  %24 = load i32* %mt, align 4, !dbg !1043
  store i32 %24, i32* %retval, !dbg !1045
  br label %return, !dbg !1045

if.end28:                                         ; preds = %if.end25
  %25 = load i32* %mt, align 4, !dbg !1046
  %26 = load i32* %f.addr, align 4, !dbg !1048
  %cmp29 = icmp sgt i32 %25, %26, !dbg !1046
  br i1 %cmp29, label %if.then30, label %if.end31, !dbg !1049

if.then30:                                        ; preds = %if.end28
  %27 = load i32* %f.addr, align 4, !dbg !1050
  store i32 %27, i32* %mt, align 4, !dbg !1052
  br label %if.end31, !dbg !1052

if.end31:                                         ; preds = %if.then30, %if.end28
  %28 = load i32* %n.addr, align 4, !dbg !1053
  %cmp32 = icmp eq i32 %28, 6, !dbg !1053
  br i1 %cmp32, label %if.then33, label %if.end34, !dbg !1055

if.then33:                                        ; preds = %if.end31
  %29 = load i32* %mt, align 4, !dbg !1056
  store i32 %29, i32* %retval, !dbg !1058
  br label %return, !dbg !1058

if.end34:                                         ; preds = %if.end31
  %30 = load i32* %mt, align 4, !dbg !1059
  %31 = load i32* %g.addr, align 4, !dbg !1061
  %cmp35 = icmp sgt i32 %30, %31, !dbg !1059
  br i1 %cmp35, label %if.then36, label %if.end37, !dbg !1062

if.then36:                                        ; preds = %if.end34
  %32 = load i32* %g.addr, align 4, !dbg !1063
  store i32 %32, i32* %mt, align 4, !dbg !1065
  br label %if.end37, !dbg !1065

if.end37:                                         ; preds = %if.then36, %if.end34
  %33 = load i32* %n.addr, align 4, !dbg !1066
  %cmp38 = icmp eq i32 %33, 7, !dbg !1066
  br i1 %cmp38, label %if.then39, label %if.end40, !dbg !1068

if.then39:                                        ; preds = %if.end37
  %34 = load i32* %mt, align 4, !dbg !1069
  store i32 %34, i32* %retval, !dbg !1071
  br label %return, !dbg !1071

if.end40:                                         ; preds = %if.end37
  %35 = load i32* %mt, align 4, !dbg !1072
  %36 = load i32* %h.addr, align 4, !dbg !1074
  %cmp41 = icmp sgt i32 %35, %36, !dbg !1072
  br i1 %cmp41, label %if.then42, label %if.end43, !dbg !1075

if.then42:                                        ; preds = %if.end40
  %37 = load i32* %h.addr, align 4, !dbg !1076
  store i32 %37, i32* %mt, align 4, !dbg !1078
  br label %if.end43, !dbg !1078

if.end43:                                         ; preds = %if.then42, %if.end40
  %38 = load i32* %n.addr, align 4, !dbg !1079
  %cmp44 = icmp eq i32 %38, 8, !dbg !1079
  br i1 %cmp44, label %if.then45, label %if.end46, !dbg !1081

if.then45:                                        ; preds = %if.end43
  %39 = load i32* %mt, align 4, !dbg !1082
  store i32 %39, i32* %retval, !dbg !1084
  br label %return, !dbg !1084

if.end46:                                         ; preds = %if.end43
  %40 = load i32* %mt, align 4, !dbg !1085
  %41 = load i32* %i.addr, align 4, !dbg !1087
  %cmp47 = icmp sgt i32 %40, %41, !dbg !1085
  br i1 %cmp47, label %if.then48, label %if.end49, !dbg !1088

if.then48:                                        ; preds = %if.end46
  %42 = load i32* %i.addr, align 4, !dbg !1089
  store i32 %42, i32* %mt, align 4, !dbg !1091
  br label %if.end49, !dbg !1091

if.end49:                                         ; preds = %if.then48, %if.end46
  %43 = load i32* %n.addr, align 4, !dbg !1092
  %cmp50 = icmp eq i32 %43, 9, !dbg !1092
  br i1 %cmp50, label %if.then51, label %if.end52, !dbg !1094

if.then51:                                        ; preds = %if.end49
  %44 = load i32* %mt, align 4, !dbg !1095
  store i32 %44, i32* %retval, !dbg !1097
  br label %return, !dbg !1097

if.end52:                                         ; preds = %if.end49
  %45 = load i32* %mt, align 4, !dbg !1098
  %46 = load i32* %j.addr, align 4, !dbg !1100
  %cmp53 = icmp sgt i32 %45, %46, !dbg !1098
  br i1 %cmp53, label %if.then54, label %if.end55, !dbg !1101

if.then54:                                        ; preds = %if.end52
  %47 = load i32* %j.addr, align 4, !dbg !1102
  store i32 %47, i32* %mt, align 4, !dbg !1104
  br label %if.end55, !dbg !1104

if.end55:                                         ; preds = %if.then54, %if.end52
  %48 = load i32* %n.addr, align 4, !dbg !1105
  %cmp56 = icmp eq i32 %48, 10, !dbg !1105
  br i1 %cmp56, label %if.then57, label %if.end58, !dbg !1107

if.then57:                                        ; preds = %if.end55
  %49 = load i32* %mt, align 4, !dbg !1108
  store i32 %49, i32* %retval, !dbg !1110
  br label %return, !dbg !1110

if.end58:                                         ; preds = %if.end55
  %50 = load i32* %mt, align 4, !dbg !1111
  %51 = load i32* %k.addr, align 4, !dbg !1113
  %cmp59 = icmp sgt i32 %50, %51, !dbg !1111
  br i1 %cmp59, label %if.then60, label %if.end61, !dbg !1114

if.then60:                                        ; preds = %if.end58
  %52 = load i32* %k.addr, align 4, !dbg !1115
  store i32 %52, i32* %mt, align 4, !dbg !1117
  br label %if.end61, !dbg !1117

if.end61:                                         ; preds = %if.then60, %if.end58
  %53 = load i32* %n.addr, align 4, !dbg !1118
  %cmp62 = icmp eq i32 %53, 11, !dbg !1118
  br i1 %cmp62, label %if.then63, label %if.end64, !dbg !1120

if.then63:                                        ; preds = %if.end61
  %54 = load i32* %mt, align 4, !dbg !1121
  store i32 %54, i32* %retval, !dbg !1123
  br label %return, !dbg !1123

if.end64:                                         ; preds = %if.end61
  %55 = load i32* %mt, align 4, !dbg !1124
  %56 = load i32* %l.addr, align 4, !dbg !1126
  %cmp65 = icmp sgt i32 %55, %56, !dbg !1124
  br i1 %cmp65, label %if.then66, label %if.end67, !dbg !1127

if.then66:                                        ; preds = %if.end64
  %57 = load i32* %l.addr, align 4, !dbg !1128
  store i32 %57, i32* %mt, align 4, !dbg !1130
  br label %if.end67, !dbg !1130

if.end67:                                         ; preds = %if.then66, %if.end64
  %58 = load i32* %n.addr, align 4, !dbg !1131
  %cmp68 = icmp eq i32 %58, 12, !dbg !1131
  br i1 %cmp68, label %if.then69, label %if.end70, !dbg !1133

if.then69:                                        ; preds = %if.end67
  %59 = load i32* %mt, align 4, !dbg !1134
  store i32 %59, i32* %retval, !dbg !1136
  br label %return, !dbg !1136

if.end70:                                         ; preds = %if.end67
  %60 = load i32* %mt, align 4, !dbg !1137
  %61 = load i32* %m.addr, align 4, !dbg !1139
  %cmp71 = icmp sgt i32 %60, %61, !dbg !1137
  br i1 %cmp71, label %if.then72, label %if.end73, !dbg !1140

if.then72:                                        ; preds = %if.end70
  %62 = load i32* %m.addr, align 4, !dbg !1141
  store i32 %62, i32* %mt, align 4, !dbg !1143
  br label %if.end73, !dbg !1143

if.end73:                                         ; preds = %if.then72, %if.end70
  %63 = load i32* %n.addr, align 4, !dbg !1144
  %cmp74 = icmp eq i32 %63, 13, !dbg !1144
  br i1 %cmp74, label %if.then75, label %if.end76, !dbg !1146

if.then75:                                        ; preds = %if.end73
  %64 = load i32* %mt, align 4, !dbg !1147
  store i32 %64, i32* %retval, !dbg !1149
  br label %return, !dbg !1149

if.end76:                                         ; preds = %if.end73
  %65 = load i32* %mt, align 4, !dbg !1150
  %66 = load i32* %o.addr, align 4, !dbg !1152
  %cmp77 = icmp sgt i32 %65, %66, !dbg !1150
  br i1 %cmp77, label %if.then78, label %if.end79, !dbg !1153

if.then78:                                        ; preds = %if.end76
  %67 = load i32* %o.addr, align 4, !dbg !1154
  store i32 %67, i32* %mt, align 4, !dbg !1156
  br label %if.end79, !dbg !1156

if.end79:                                         ; preds = %if.then78, %if.end76
  %68 = load i32* %n.addr, align 4, !dbg !1157
  %cmp80 = icmp eq i32 %68, 14, !dbg !1157
  br i1 %cmp80, label %if.then81, label %if.end82, !dbg !1159

if.then81:                                        ; preds = %if.end79
  %69 = load i32* %mt, align 4, !dbg !1160
  store i32 %69, i32* %retval, !dbg !1162
  br label %return, !dbg !1162

if.end82:                                         ; preds = %if.end79
  %70 = load i32* %mt, align 4, !dbg !1163
  %71 = load i32* %p.addr, align 4, !dbg !1165
  %cmp83 = icmp sgt i32 %70, %71, !dbg !1163
  br i1 %cmp83, label %if.then84, label %if.end85, !dbg !1166

if.then84:                                        ; preds = %if.end82
  %72 = load i32* %p.addr, align 4, !dbg !1167
  store i32 %72, i32* %mt, align 4, !dbg !1169
  br label %if.end85, !dbg !1169

if.end85:                                         ; preds = %if.then84, %if.end82
  %73 = load i32* %mt, align 4, !dbg !1170
  store i32 %73, i32* %retval, !dbg !1171
  br label %return, !dbg !1171

return:                                           ; preds = %if.end85, %if.then81, %if.then75, %if.then69, %if.then63, %if.then57, %if.then51, %if.then45, %if.then39, %if.then33, %if.then27, %if.then21, %if.then15, %if.then9, %if.then3, %if.then
  %74 = load i32* %retval, !dbg !1172
  ret i32 %74, !dbg !1172
}

; Function Attrs: nounwind uwtable
define i32 @sscal(i32 %n, double, float* %sx, i32 %incx) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sa.addr = alloca float, align 4
  %sx.addr = alloca float*, align 8
  %incx.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sa = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1173, metadata !44), !dbg !1174
  store float %sa, float* %sa.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sa.addr, metadata !1175, metadata !44), !dbg !1176
  store float* %sx, float** %sx.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sx.addr, metadata !1177, metadata !44), !dbg !1178
  store i32 %incx, i32* %incx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %incx.addr, metadata !1179, metadata !44), !dbg !1180
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1181, metadata !44), !dbg !1182
  %1 = load i32* %n.addr, align 4, !dbg !1183
  %cmp = icmp slt i32 %1, 1, !dbg !1183
  br i1 %cmp, label %if.then, label %if.end, !dbg !1185

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, !dbg !1186
  br label %return, !dbg !1186

if.end:                                           ; preds = %entry
  %2 = load i32* %incx.addr, align 4, !dbg !1188
  %cmp1 = icmp ne i32 %2, 1, !dbg !1188
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !1190

if.then2:                                         ; preds = %if.end
  %3 = load i32* %incx.addr, align 4, !dbg !1191
  %cmp3 = icmp slt i32 %3, 0, !dbg !1191
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !1194

if.then4:                                         ; preds = %if.then2
  %4 = load i32* %n.addr, align 4, !dbg !1195
  %sub = sub nsw i32 0, %4, !dbg !1197
  %add = add nsw i32 %sub, 1, !dbg !1197
  %5 = load i32* %incx.addr, align 4, !dbg !1198
  %mul = mul nsw i32 %add, %5, !dbg !1199
  %6 = load float** %sx.addr, align 8, !dbg !1200
  %idx.ext = sext i32 %mul to i64, !dbg !1200
  %add.ptr = getelementptr inbounds float* %6, i64 %idx.ext, !dbg !1200
  store float* %add.ptr, float** %sx.addr, align 8, !dbg !1200
  br label %if.end5, !dbg !1200

if.end5:                                          ; preds = %if.then4, %if.then2
  store i32 0, i32* %i, align 4, !dbg !1201
  br label %for.cond, !dbg !1201

for.cond:                                         ; preds = %for.inc, %if.end5
  %7 = load i32* %i, align 4, !dbg !1203
  %8 = load i32* %n.addr, align 4, !dbg !1207
  %cmp6 = icmp slt i32 %7, %8, !dbg !1208
  br i1 %cmp6, label %for.body, label %for.end, !dbg !1209

for.body:                                         ; preds = %for.cond
  %9 = load float* %sa.addr, align 4, !dbg !1210
  %10 = load float** %sx.addr, align 8, !dbg !1211
  %11 = load float* %10, align 4, !dbg !1212
  %mul7 = fmul float %11, %9, !dbg !1212
  store float %mul7, float* %10, align 4, !dbg !1212
  br label %for.inc, !dbg !1212

for.inc:                                          ; preds = %for.body
  %12 = load i32* %i, align 4, !dbg !1213
  %inc = add nsw i32 %12, 1, !dbg !1213
  store i32 %inc, i32* %i, align 4, !dbg !1213
  %13 = load i32* %incx.addr, align 4, !dbg !1214
  %14 = load float** %sx.addr, align 8, !dbg !1215
  %idx.ext8 = sext i32 %13 to i64, !dbg !1215
  %add.ptr9 = getelementptr inbounds float* %14, i64 %idx.ext8, !dbg !1215
  store float* %add.ptr9, float** %sx.addr, align 8, !dbg !1215
  br label %for.cond, !dbg !1216

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, !dbg !1217
  br label %return, !dbg !1217

if.end10:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !1218
  br label %for.cond11, !dbg !1218

for.cond11:                                       ; preds = %for.inc15, %if.end10
  %15 = load i32* %i, align 4, !dbg !1220
  %16 = load i32* %n.addr, align 4, !dbg !1224
  %cmp12 = icmp slt i32 %15, %16, !dbg !1225
  br i1 %cmp12, label %for.body13, label %for.end17, !dbg !1226

for.body13:                                       ; preds = %for.cond11
  %17 = load float* %sa.addr, align 4, !dbg !1227
  %18 = load float** %sx.addr, align 8, !dbg !1228
  %19 = load float* %18, align 4, !dbg !1229
  %mul14 = fmul float %19, %17, !dbg !1229
  store float %mul14, float* %18, align 4, !dbg !1229
  br label %for.inc15, !dbg !1229

for.inc15:                                        ; preds = %for.body13
  %20 = load i32* %i, align 4, !dbg !1230
  %inc16 = add nsw i32 %20, 1, !dbg !1230
  store i32 %inc16, i32* %i, align 4, !dbg !1230
  %21 = load float** %sx.addr, align 8, !dbg !1231
  %incdec.ptr = getelementptr inbounds float* %21, i32 1, !dbg !1231
  store float* %incdec.ptr, float** %sx.addr, align 8, !dbg !1231
  br label %for.cond11, !dbg !1232

for.end17:                                        ; preds = %for.cond11
  store i32 0, i32* %retval, !dbg !1233
  br label %return, !dbg !1233

return:                                           ; preds = %for.end17, %for.end, %if.then
  %22 = load i32* %retval, !dbg !1234
  ret i32 %22, !dbg !1234
}

; Function Attrs: nounwind uwtable
define void @vexopy(i32 %n, float* %v, float* %x, float* %y, i32 %itype) #0 {
entry:
  %n.addr = alloca i32, align 4
  %v.addr = alloca float*, align 8
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  %itype.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1235, metadata !44), !dbg !1236
  store float* %v, float** %v.addr, align 8
  call void @llvm.dbg.declare(metadata float** %v.addr, metadata !1237, metadata !44), !dbg !1238
  store float* %x, float** %x.addr, align 8
  call void @llvm.dbg.declare(metadata float** %x.addr, metadata !1239, metadata !44), !dbg !1240
  store float* %y, float** %y.addr, align 8
  call void @llvm.dbg.declare(metadata float** %y.addr, metadata !1241, metadata !44), !dbg !1242
  store i32 %itype, i32* %itype.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %itype.addr, metadata !1243, metadata !44), !dbg !1244
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1245, metadata !44), !dbg !1246
  %0 = load i32* %n.addr, align 4, !dbg !1247
  %cmp = icmp slt i32 %0, 1, !dbg !1247
  br i1 %cmp, label %if.then, label %if.end, !dbg !1249

if.then:                                          ; preds = %entry
  br label %if.end15, !dbg !1250

if.end:                                           ; preds = %entry
  %1 = load i32* %itype.addr, align 4, !dbg !1252
  %cmp1 = icmp eq i32 %1, 1, !dbg !1252
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1254

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !1255
  br label %for.cond, !dbg !1255

for.cond:                                         ; preds = %for.inc, %if.then2
  %2 = load i32* %i, align 4, !dbg !1257
  %3 = load i32* %n.addr, align 4, !dbg !1261
  %cmp3 = icmp slt i32 %2, %3, !dbg !1262
  br i1 %cmp3, label %for.body, label %for.end, !dbg !1263

for.body:                                         ; preds = %for.cond
  %4 = load float** %x.addr, align 8, !dbg !1264
  %5 = load float* %4, align 4, !dbg !1265
  %6 = load float** %y.addr, align 8, !dbg !1266
  %7 = load float* %6, align 4, !dbg !1267
  %add = fadd float %5, %7, !dbg !1265
  %8 = load float** %v.addr, align 8, !dbg !1268
  store float %add, float* %8, align 4, !dbg !1269
  br label %for.inc, !dbg !1269

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4, !dbg !1270
  %inc = add nsw i32 %9, 1, !dbg !1270
  store i32 %inc, i32* %i, align 4, !dbg !1270
  %10 = load float** %x.addr, align 8, !dbg !1271
  %incdec.ptr = getelementptr inbounds float* %10, i32 1, !dbg !1271
  store float* %incdec.ptr, float** %x.addr, align 8, !dbg !1271
  %11 = load float** %y.addr, align 8, !dbg !1272
  %incdec.ptr4 = getelementptr inbounds float* %11, i32 1, !dbg !1272
  store float* %incdec.ptr4, float** %y.addr, align 8, !dbg !1272
  %12 = load float** %v.addr, align 8, !dbg !1273
  %incdec.ptr5 = getelementptr inbounds float* %12, i32 1, !dbg !1273
  store float* %incdec.ptr5, float** %v.addr, align 8, !dbg !1273
  br label %for.cond, !dbg !1274

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !1275

if.else:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !1276
  br label %for.cond6, !dbg !1276

for.cond6:                                        ; preds = %for.inc9, %if.else
  %13 = load i32* %i, align 4, !dbg !1278
  %14 = load i32* %n.addr, align 4, !dbg !1282
  %cmp7 = icmp slt i32 %13, %14, !dbg !1283
  br i1 %cmp7, label %for.body8, label %for.end14, !dbg !1284

for.body8:                                        ; preds = %for.cond6
  %15 = load float** %x.addr, align 8, !dbg !1285
  %16 = load float* %15, align 4, !dbg !1286
  %17 = load float** %y.addr, align 8, !dbg !1287
  %18 = load float* %17, align 4, !dbg !1288
  %sub = fsub float %16, %18, !dbg !1286
  %19 = load float** %v.addr, align 8, !dbg !1289
  store float %sub, float* %19, align 4, !dbg !1290
  br label %for.inc9, !dbg !1290

for.inc9:                                         ; preds = %for.body8
  %20 = load i32* %i, align 4, !dbg !1291
  %inc10 = add nsw i32 %20, 1, !dbg !1291
  store i32 %inc10, i32* %i, align 4, !dbg !1291
  %21 = load float** %x.addr, align 8, !dbg !1292
  %incdec.ptr11 = getelementptr inbounds float* %21, i32 1, !dbg !1292
  store float* %incdec.ptr11, float** %x.addr, align 8, !dbg !1292
  %22 = load float** %y.addr, align 8, !dbg !1293
  %incdec.ptr12 = getelementptr inbounds float* %22, i32 1, !dbg !1293
  store float* %incdec.ptr12, float** %y.addr, align 8, !dbg !1293
  %23 = load float** %v.addr, align 8, !dbg !1294
  %incdec.ptr13 = getelementptr inbounds float* %23, i32 1, !dbg !1294
  store float* %incdec.ptr13, float** %v.addr, align 8, !dbg !1294
  br label %for.cond6, !dbg !1295

for.end14:                                        ; preds = %for.cond6
  br label %if.end15

if.end15:                                         ; preds = %if.then, %for.end14, %for.end
  ret void, !dbg !1296
}

; Function Attrs: nounwind uwtable
define void @vfill(i32 %n, float* %v, double) #0 {
entry:
  %n.addr = alloca i32, align 4
  %v.addr = alloca float*, align 8
  %val.addr = alloca float, align 4
  %i = alloca i32, align 4
  %val = fptrunc double %0 to float
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1297, metadata !44), !dbg !1298
  store float* %v, float** %v.addr, align 8
  call void @llvm.dbg.declare(metadata float** %v.addr, metadata !1299, metadata !44), !dbg !1300
  store float %val, float* %val.addr, align 4
  call void @llvm.dbg.declare(metadata float* %val.addr, metadata !1301, metadata !44), !dbg !1302
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1303, metadata !44), !dbg !1304
  %1 = load i32* %n.addr, align 4, !dbg !1305
  %cmp = icmp slt i32 %1, 1, !dbg !1305
  br i1 %cmp, label %if.then, label %if.end, !dbg !1307

if.then:                                          ; preds = %entry
  br label %for.end, !dbg !1308

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !1310
  br label %for.cond, !dbg !1310

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32* %i, align 4, !dbg !1312
  %3 = load i32* %n.addr, align 4, !dbg !1316
  %cmp1 = icmp slt i32 %2, %3, !dbg !1317
  br i1 %cmp1, label %for.body, label %for.end, !dbg !1318

for.body:                                         ; preds = %for.cond
  %4 = load float* %val.addr, align 4, !dbg !1319
  %5 = load float** %v.addr, align 8, !dbg !1320
  store float %4, float* %5, align 4, !dbg !1321
  br label %for.inc, !dbg !1321

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4, !dbg !1322
  %inc = add nsw i32 %6, 1, !dbg !1322
  store i32 %inc, i32* %i, align 4, !dbg !1322
  %7 = load float** %v.addr, align 8, !dbg !1323
  %incdec.ptr = getelementptr inbounds float* %7, i32 1, !dbg !1323
  store float* %incdec.ptr, float** %v.addr, align 8, !dbg !1323
  br label %for.cond, !dbg !1324

for.end:                                          ; preds = %if.then, %for.cond
  ret void, !dbg !1325
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!40, !41}
!llvm.ident = !{!42}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c] [DW_LANG_C99]
!1 = !{!"blas.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !13, !16, !17, !20, !23, !26, !28, !31, !34, !37}
!6 = !{!"0x2e\00isamax\00isamax\00\0023\000\001\000\000\000\000\0036", !1, !7, !8, null, i32 (i32, float*, i32)* @isamax, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 36] [isamax]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !10, !11, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!12 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!13 = !{!"0x2e\00saxpy\00saxpy\00\0069\000\001\000\000\000\000\0087", !1, !7, !14, null, void (i32, double, float*, i32, float*, i32)* @saxpy, null, null, !2} ; [ DW_TAG_subprogram ] [line 69] [def] [scope 87] [saxpy]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{null, !10, !12, !11, !10, !11, !10}
!16 = !{!"0x2e\00saxpyx\00saxpyx\00\00112\000\001\000\000\000\000\00130", !1, !7, !14, null, void (i32, double, float*, i32, float*, i32)* @saxpyx, null, null, !2} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 130] [saxpyx]
!17 = !{!"0x2e\00scopy\00scopy\00\00155\000\001\000\000\000\000\00171", !1, !7, !18, null, void (i32, float*, i32, float*, i32)* @scopy, null, null, !2} ; [ DW_TAG_subprogram ] [line 155] [def] [scope 171] [scopy]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{null, !10, !11, !10, !11, !10}
!20 = !{!"0x2e\00sdot\00sdot\00\00196\000\001\000\000\000\000\00214", !1, !7, !21, null, double (i32, float*, i32, float*, i32)* @sdot, null, null, !2} ; [ DW_TAG_subprogram ] [line 196] [def] [scope 214] [sdot]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!4, !10, !11, !10, !11, !10}
!23 = !{!"0x2e\00snrm2\00snrm2\00\00241\000\001\000\000\000\000\00262", !1, !7, !24, null, double (i32, float*, i32)* @snrm2, null, null, !2} ; [ DW_TAG_subprogram ] [line 241] [def] [scope 262] [snrm2]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!4, !10, !11, !10}
!26 = !{!"0x2e\00r1mach\00r1mach\00\00327\000\001\000\000\000\000\00334", !1, !7, !27, null, double ()* @r1mach, null, null, !2} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 334] [r1mach]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!"0x2e\00min0\00min0\00\00346\000\001\000\000\000\000\00359", !1, !7, !29, null, i32 (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)* @min0, null, null, !2} ; [ DW_TAG_subprogram ] [line 346] [def] [scope 359] [min0]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{!10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10}
!31 = !{!"0x2e\00sscal\00sscal\00\00408\000\001\000\000\000\000\00424", !1, !7, !32, null, i32 (i32, double, float*, i32)* @sscal, null, null, !2} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 424] [sscal]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !33, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{!10, !10, !12, !11, !10}
!34 = !{!"0x2e\00vexopy\00vexopy\00\00441\000\001\000\000\000\000\00459", !1, !7, !35, null, void (i32, float*, float*, float*, i32)* @vexopy, null, null, !2} ; [ DW_TAG_subprogram ] [line 441] [def] [scope 459] [vexopy]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{null, !10, !11, !11, !11, !10}
!37 = !{!"0x2e\00vfill\00vfill\00\00471\000\001\000\000\000\000\00481", !1, !7, !38, null, void (i32, float*, double)* @vfill, null, null, !2} ; [ DW_TAG_subprogram ] [line 471] [def] [scope 481] [vfill]
!38 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !39, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = !{null, !10, !11, !12}
!40 = !{i32 2, !"Dwarf Version", i32 4}
!41 = !{i32 2, !"Debug Info Version", i32 2}
!42 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!43 = !{!"0x101\00n\0016777241\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 25]
!44 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!45 = !MDLocation(line: 25, column: 5, scope: !6)
!46 = !{!"0x101\00sx\0033554456\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 24]
!47 = !MDLocation(line: 24, column: 8, scope: !6)
!48 = !{!"0x101\00incx\0050331673\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 25]
!49 = !MDLocation(line: 25, column: 8, scope: !6)
!50 = !{!"0x100\00smax\0037\000", !6, !7, !12}    ; [ DW_TAG_auto_variable ] [smax] [line 37]
!51 = !MDLocation(line: 37, column: 9, scope: !6)
!52 = !{!"0x100\00i\0038\000", !6, !7, !10}       ; [ DW_TAG_auto_variable ] [i] [line 38]
!53 = !MDLocation(line: 38, column: 7, scope: !6)
!54 = !{!"0x100\00istmp\0038\000", !6, !7, !10}   ; [ DW_TAG_auto_variable ] [istmp] [line 38]
!55 = !MDLocation(line: 38, column: 10, scope: !6)
!56 = !MDLocation(line: 43, column: 7, scope: !57)
!57 = !{!"0xb\0043\007\000", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!58 = !MDLocation(line: 43, column: 7, scope: !6)
!59 = !MDLocation(line: 43, column: 24, scope: !60)
!60 = !{!"0xb\001", !1, !57}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!61 = !MDLocation(line: 43, column: 16, scope: !57)
!62 = !MDLocation(line: 44, column: 7, scope: !63)
!63 = !{!"0xb\0044\007\001", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!64 = !MDLocation(line: 44, column: 7, scope: !6)
!65 = !MDLocation(line: 46, column: 9, scope: !66)
!66 = !{!"0xb\0046\009\003", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!67 = !{!"0xb\0044\0019\002", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!68 = !MDLocation(line: 46, column: 9, scope: !67)
!69 = !MDLocation(line: 46, column: 25, scope: !70)
!70 = !{!"0xb\001", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!71 = !MDLocation(line: 46, column: 33, scope: !66)
!72 = !MDLocation(line: 46, column: 32, scope: !66)
!73 = !MDLocation(line: 46, column: 38, scope: !66)
!74 = !MDLocation(line: 46, column: 31, scope: !66)
!75 = !MDLocation(line: 46, column: 25, scope: !66)
!76 = !MDLocation(line: 46, column: 20, scope: !66)
!77 = !MDLocation(line: 47, column: 5, scope: !67)
!78 = !MDLocation(line: 48, column: 13, scope: !67)
!79 = !MDLocation(line: 48, column: 13, scope: !80)
!80 = !{!"0xb\001", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!81 = !MDLocation(line: 48, column: 13, scope: !82)
!82 = !{!"0xb\002", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!83 = !MDLocation(line: 48, column: 5, scope: !84)
!84 = !{!"0xb\004", !1, !85}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!85 = !{!"0xb\003", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!86 = !MDLocation(line: 49, column: 11, scope: !67)
!87 = !MDLocation(line: 49, column: 5, scope: !67)
!88 = !MDLocation(line: 50, column: 10, scope: !89)
!89 = !{!"0xb\0050\005\004", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!90 = !MDLocation(line: 50, column: 15, scope: !91)
!91 = !{!"0xb\002", !1, !92}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!92 = !{!"0xb\001", !1, !93}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!93 = !{!"0xb\0050\005\005", !1, !89}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!94 = !MDLocation(line: 50, column: 17, scope: !93)
!95 = !MDLocation(line: 50, column: 15, scope: !93)
!96 = !MDLocation(line: 50, column: 5, scope: !89)
!97 = !MDLocation(line: 51, column: 11, scope: !98)
!98 = !{!"0xb\0051\0011\006", !1, !93}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!99 = !MDLocation(line: 51, column: 11, scope: !100)
!100 = !{!"0xb\001", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!101 = !MDLocation(line: 51, column: 11, scope: !102)
!102 = !{!"0xb\002", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!103 = !MDLocation(line: 51, column: 24, scope: !104)
!104 = !{!"0xb\004", !1, !105}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!105 = !{!"0xb\003", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!106 = !MDLocation(line: 51, column: 11, scope: !93)
!107 = !MDLocation(line: 52, column: 10, scope: !108)
!108 = !{!"0xb\0051\0031\007", !1, !98}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!109 = !MDLocation(line: 52, column: 2, scope: !108)
!110 = !MDLocation(line: 53, column: 10, scope: !108)
!111 = !MDLocation(line: 53, column: 10, scope: !112)
!112 = !{!"0xb\001", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!113 = !MDLocation(line: 53, column: 10, scope: !114)
!114 = !{!"0xb\002", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!115 = !MDLocation(line: 53, column: 2, scope: !116)
!116 = !{!"0xb\004", !1, !117}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!117 = !{!"0xb\003", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!118 = !MDLocation(line: 54, column: 7, scope: !108)
!119 = !MDLocation(line: 51, column: 24, scope: !120)
!120 = !{!"0xb\005", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!121 = !MDLocation(line: 50, column: 20, scope: !93)
!122 = !MDLocation(line: 50, column: 29, scope: !93)
!123 = !MDLocation(line: 50, column: 25, scope: !93)
!124 = !MDLocation(line: 50, column: 5, scope: !93)
!125 = !MDLocation(line: 55, column: 13, scope: !67)
!126 = !MDLocation(line: 55, column: 5, scope: !67)
!127 = !MDLocation(line: 58, column: 3, scope: !6)
!128 = !MDLocation(line: 59, column: 11, scope: !6)
!129 = !MDLocation(line: 59, column: 11, scope: !130)
!130 = !{!"0xb\001", !1, !6}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!131 = !MDLocation(line: 59, column: 11, scope: !132)
!132 = !{!"0xb\002", !1, !6}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!133 = !MDLocation(line: 59, column: 3, scope: !134)
!134 = !{!"0xb\004", !1, !135}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!135 = !{!"0xb\003", !1, !6}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!136 = !MDLocation(line: 60, column: 3, scope: !6)
!137 = !MDLocation(line: 61, column: 8, scope: !138)
!138 = !{!"0xb\0061\003\008", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!139 = !MDLocation(line: 61, column: 13, scope: !140)
!140 = !{!"0xb\002", !1, !141}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!141 = !{!"0xb\001", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!142 = !{!"0xb\0061\003\009", !1, !138}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!143 = !MDLocation(line: 61, column: 15, scope: !142)
!144 = !MDLocation(line: 61, column: 13, scope: !142)
!145 = !MDLocation(line: 61, column: 3, scope: !138)
!146 = !MDLocation(line: 62, column: 9, scope: !147)
!147 = !{!"0xb\0062\009\0010", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!148 = !MDLocation(line: 62, column: 9, scope: !149)
!149 = !{!"0xb\001", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!150 = !MDLocation(line: 62, column: 9, scope: !151)
!151 = !{!"0xb\002", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!152 = !MDLocation(line: 62, column: 22, scope: !153)
!153 = !{!"0xb\004", !1, !154}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!154 = !{!"0xb\003", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!155 = !MDLocation(line: 62, column: 9, scope: !142)
!156 = !MDLocation(line: 63, column: 15, scope: !157)
!157 = !{!"0xb\0062\0029\0011", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!158 = !MDLocation(line: 63, column: 7, scope: !157)
!159 = !MDLocation(line: 64, column: 15, scope: !157)
!160 = !MDLocation(line: 64, column: 15, scope: !161)
!161 = !{!"0xb\001", !1, !157}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!162 = !MDLocation(line: 64, column: 15, scope: !163)
!163 = !{!"0xb\002", !1, !157}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!164 = !MDLocation(line: 64, column: 7, scope: !165)
!165 = !{!"0xb\004", !1, !166}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!166 = !{!"0xb\003", !1, !157}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!167 = !MDLocation(line: 65, column: 5, scope: !157)
!168 = !MDLocation(line: 62, column: 22, scope: !169)
!169 = !{!"0xb\005", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!170 = !MDLocation(line: 61, column: 18, scope: !142)
!171 = !MDLocation(line: 61, column: 23, scope: !142)
!172 = !MDLocation(line: 61, column: 3, scope: !142)
!173 = !MDLocation(line: 66, column: 11, scope: !6)
!174 = !MDLocation(line: 66, column: 3, scope: !6)
!175 = !MDLocation(line: 67, column: 1, scope: !6)
!176 = !{!"0x101\00n\0016777287\000", !13, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 71]
!177 = !MDLocation(line: 71, column: 7, scope: !13)
!178 = !{!"0x101\00sa\0033554502\000", !13, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 70]
!179 = !MDLocation(line: 70, column: 17, scope: !13)
!180 = !{!"0x101\00sx\0050331718\000", !13, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 70]
!181 = !MDLocation(line: 70, column: 8, scope: !13)
!182 = !{!"0x101\00incx\0067108935\000", !13, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 71]
!183 = !MDLocation(line: 71, column: 10, scope: !13)
!184 = !{!"0x101\00sy\0083886150\000", !13, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 70]
!185 = !MDLocation(line: 70, column: 13, scope: !13)
!186 = !{!"0x101\00incy\00100663367\000", !13, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 71]
!187 = !MDLocation(line: 71, column: 16, scope: !13)
!188 = !{!"0x100\00i\0088\000", !13, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 88]
!189 = !MDLocation(line: 88, column: 16, scope: !13)
!190 = !MDLocation(line: 90, column: 7, scope: !191)
!191 = !{!"0xb\0090\007\0012", !1, !13}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!192 = !MDLocation(line: 90, column: 7, scope: !13)
!193 = !MDLocation(line: 90, column: 15, scope: !194)
!194 = !{!"0xb\002", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!195 = !MDLocation(line: 90, column: 25, scope: !196)
!196 = !{!"0xb\003", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!197 = !{!"0xb\001", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!198 = !MDLocation(line: 91, column: 7, scope: !199)
!199 = !{!"0xb\0091\007\0013", !1, !13}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!200 = !MDLocation(line: 91, column: 15, scope: !199)
!201 = !MDLocation(line: 91, column: 7, scope: !13)
!202 = !MDLocation(line: 92, column: 9, scope: !203)
!203 = !{!"0xb\0092\009\0015", !1, !204}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!204 = !{!"0xb\0091\0022\0014", !1, !199}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!205 = !MDLocation(line: 92, column: 9, scope: !204)
!206 = !MDLocation(line: 94, column: 12, scope: !207)
!207 = !{!"0xb\0094\007\0017", !1, !208}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!208 = !{!"0xb\0092\0021\0016", !1, !203}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!209 = !MDLocation(line: 94, column: 17, scope: !210)
!210 = !{!"0xb\002", !1, !211}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!211 = !{!"0xb\001", !1, !212}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!212 = !{!"0xb\0094\007\0018", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!213 = !MDLocation(line: 94, column: 19, scope: !212)
!214 = !MDLocation(line: 94, column: 17, scope: !212)
!215 = !MDLocation(line: 94, column: 7, scope: !207)
!216 = !MDLocation(line: 95, column: 9, scope: !212)
!217 = !MDLocation(line: 95, column: 14, scope: !212)
!218 = !MDLocation(line: 95, column: 13, scope: !212)
!219 = !MDLocation(line: 95, column: 3, scope: !212)
!220 = !MDLocation(line: 95, column: 2, scope: !212)
!221 = !MDLocation(line: 94, column: 22, scope: !212)
!222 = !MDLocation(line: 94, column: 26, scope: !212)
!223 = !MDLocation(line: 94, column: 31, scope: !212)
!224 = !MDLocation(line: 94, column: 7, scope: !212)
!225 = !MDLocation(line: 96, column: 7, scope: !208)
!226 = !MDLocation(line: 98, column: 9, scope: !227)
!227 = !{!"0xb\0098\009\0019", !1, !204}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!228 = !MDLocation(line: 98, column: 9, scope: !204)
!229 = !MDLocation(line: 100, column: 12, scope: !230)
!230 = !{!"0xb\00100\007\0021", !1, !231}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!231 = !{!"0xb\0098\0018\0020", !1, !227}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!232 = !MDLocation(line: 100, column: 17, scope: !233)
!233 = !{!"0xb\002", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!234 = !{!"0xb\001", !1, !235}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!235 = !{!"0xb\00100\007\0022", !1, !230}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!236 = !MDLocation(line: 100, column: 19, scope: !235)
!237 = !MDLocation(line: 100, column: 17, scope: !235)
!238 = !MDLocation(line: 100, column: 7, scope: !230)
!239 = !MDLocation(line: 101, column: 9, scope: !235)
!240 = !MDLocation(line: 101, column: 14, scope: !235)
!241 = !MDLocation(line: 101, column: 13, scope: !235)
!242 = !MDLocation(line: 101, column: 3, scope: !235)
!243 = !MDLocation(line: 101, column: 2, scope: !235)
!244 = !MDLocation(line: 100, column: 22, scope: !235)
!245 = !MDLocation(line: 100, column: 30, scope: !235)
!246 = !MDLocation(line: 100, column: 26, scope: !235)
!247 = !MDLocation(line: 100, column: 39, scope: !235)
!248 = !MDLocation(line: 100, column: 35, scope: !235)
!249 = !MDLocation(line: 100, column: 7, scope: !235)
!250 = !MDLocation(line: 102, column: 7, scope: !231)
!251 = !MDLocation(line: 104, column: 3, scope: !204)
!252 = !MDLocation(line: 106, column: 7, scope: !253)
!253 = !{!"0xb\00106\007\0023", !1, !13}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!254 = !MDLocation(line: 106, column: 7, scope: !13)
!255 = !MDLocation(line: 106, column: 27, scope: !256)
!256 = !{!"0xb\001", !1, !253}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!257 = !MDLocation(line: 106, column: 26, scope: !253)
!258 = !MDLocation(line: 106, column: 32, scope: !253)
!259 = !MDLocation(line: 106, column: 25, scope: !253)
!260 = !MDLocation(line: 106, column: 18, scope: !253)
!261 = !MDLocation(line: 107, column: 7, scope: !262)
!262 = !{!"0xb\00107\007\0024", !1, !13}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!263 = !MDLocation(line: 107, column: 7, scope: !13)
!264 = !MDLocation(line: 107, column: 27, scope: !265)
!265 = !{!"0xb\001", !1, !262}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!266 = !MDLocation(line: 107, column: 26, scope: !262)
!267 = !MDLocation(line: 107, column: 32, scope: !262)
!268 = !MDLocation(line: 107, column: 25, scope: !262)
!269 = !MDLocation(line: 107, column: 18, scope: !262)
!270 = !MDLocation(line: 108, column: 8, scope: !271)
!271 = !{!"0xb\00108\003\0025", !1, !13}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!272 = !MDLocation(line: 108, column: 13, scope: !273)
!273 = !{!"0xb\002", !1, !274}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!274 = !{!"0xb\001", !1, !275}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!275 = !{!"0xb\00108\003\0026", !1, !271}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!276 = !MDLocation(line: 108, column: 15, scope: !275)
!277 = !MDLocation(line: 108, column: 13, scope: !275)
!278 = !MDLocation(line: 108, column: 3, scope: !271)
!279 = !MDLocation(line: 109, column: 12, scope: !275)
!280 = !MDLocation(line: 109, column: 17, scope: !275)
!281 = !MDLocation(line: 109, column: 16, scope: !275)
!282 = !MDLocation(line: 109, column: 6, scope: !275)
!283 = !MDLocation(line: 109, column: 5, scope: !275)
!284 = !MDLocation(line: 108, column: 18, scope: !275)
!285 = !MDLocation(line: 108, column: 26, scope: !275)
!286 = !MDLocation(line: 108, column: 22, scope: !275)
!287 = !MDLocation(line: 108, column: 35, scope: !275)
!288 = !MDLocation(line: 108, column: 31, scope: !275)
!289 = !MDLocation(line: 108, column: 3, scope: !275)
!290 = !MDLocation(line: 110, column: 1, scope: !13)
!291 = !{!"0x101\00n\0016777330\000", !16, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 114]
!292 = !MDLocation(line: 114, column: 7, scope: !16)
!293 = !{!"0x101\00sa\0033554545\000", !16, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 113]
!294 = !MDLocation(line: 113, column: 17, scope: !16)
!295 = !{!"0x101\00sx\0050331761\000", !16, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 113]
!296 = !MDLocation(line: 113, column: 8, scope: !16)
!297 = !{!"0x101\00incx\0067108978\000", !16, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 114]
!298 = !MDLocation(line: 114, column: 10, scope: !16)
!299 = !{!"0x101\00sy\0083886193\000", !16, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 113]
!300 = !MDLocation(line: 113, column: 13, scope: !16)
!301 = !{!"0x101\00incy\00100663410\000", !16, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 114]
!302 = !MDLocation(line: 114, column: 16, scope: !16)
!303 = !{!"0x100\00i\00131\000", !16, !7, !10}    ; [ DW_TAG_auto_variable ] [i] [line 131]
!304 = !MDLocation(line: 131, column: 12, scope: !16)
!305 = !MDLocation(line: 133, column: 7, scope: !306)
!306 = !{!"0xb\00133\007\0027", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!307 = !MDLocation(line: 133, column: 7, scope: !16)
!308 = !MDLocation(line: 133, column: 15, scope: !309)
!309 = !{!"0xb\002", !1, !306}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!310 = !MDLocation(line: 133, column: 25, scope: !311)
!311 = !{!"0xb\003", !1, !312}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!312 = !{!"0xb\001", !1, !306}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!313 = !MDLocation(line: 134, column: 7, scope: !314)
!314 = !{!"0xb\00134\007\0028", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!315 = !MDLocation(line: 134, column: 15, scope: !314)
!316 = !MDLocation(line: 134, column: 7, scope: !16)
!317 = !MDLocation(line: 135, column: 9, scope: !318)
!318 = !{!"0xb\00135\009\0030", !1, !319}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!319 = !{!"0xb\00134\0022\0029", !1, !314}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!320 = !MDLocation(line: 135, column: 9, scope: !319)
!321 = !MDLocation(line: 137, column: 12, scope: !322)
!322 = !{!"0xb\00137\007\0032", !1, !323}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!323 = !{!"0xb\00135\0021\0031", !1, !318}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!324 = !MDLocation(line: 137, column: 17, scope: !325)
!325 = !{!"0xb\002", !1, !326}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!326 = !{!"0xb\001", !1, !327}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!327 = !{!"0xb\00137\007\0033", !1, !322}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!328 = !MDLocation(line: 137, column: 19, scope: !327)
!329 = !MDLocation(line: 137, column: 17, scope: !327)
!330 = !MDLocation(line: 137, column: 7, scope: !322)
!331 = !MDLocation(line: 138, column: 9, scope: !327)
!332 = !MDLocation(line: 138, column: 8, scope: !327)
!333 = !MDLocation(line: 138, column: 14, scope: !327)
!334 = !MDLocation(line: 138, column: 19, scope: !327)
!335 = !MDLocation(line: 138, column: 18, scope: !327)
!336 = !MDLocation(line: 138, column: 3, scope: !327)
!337 = !MDLocation(line: 138, column: 2, scope: !327)
!338 = !MDLocation(line: 137, column: 22, scope: !327)
!339 = !MDLocation(line: 137, column: 27, scope: !327)
!340 = !MDLocation(line: 137, column: 33, scope: !327)
!341 = !MDLocation(line: 137, column: 7, scope: !327)
!342 = !MDLocation(line: 139, column: 7, scope: !323)
!343 = !MDLocation(line: 141, column: 9, scope: !344)
!344 = !{!"0xb\00141\009\0034", !1, !319}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!345 = !MDLocation(line: 141, column: 9, scope: !319)
!346 = !MDLocation(line: 143, column: 12, scope: !347)
!347 = !{!"0xb\00143\007\0036", !1, !348}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!348 = !{!"0xb\00141\0018\0035", !1, !344}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!349 = !MDLocation(line: 143, column: 17, scope: !350)
!350 = !{!"0xb\002", !1, !351}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!351 = !{!"0xb\001", !1, !352}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!352 = !{!"0xb\00143\007\0037", !1, !347}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!353 = !MDLocation(line: 143, column: 19, scope: !352)
!354 = !MDLocation(line: 143, column: 17, scope: !352)
!355 = !MDLocation(line: 143, column: 7, scope: !347)
!356 = !MDLocation(line: 144, column: 9, scope: !352)
!357 = !MDLocation(line: 144, column: 8, scope: !352)
!358 = !MDLocation(line: 144, column: 14, scope: !352)
!359 = !MDLocation(line: 144, column: 19, scope: !352)
!360 = !MDLocation(line: 144, column: 18, scope: !352)
!361 = !MDLocation(line: 144, column: 3, scope: !352)
!362 = !MDLocation(line: 144, column: 2, scope: !352)
!363 = !MDLocation(line: 143, column: 22, scope: !352)
!364 = !MDLocation(line: 143, column: 31, scope: !352)
!365 = !MDLocation(line: 143, column: 27, scope: !352)
!366 = !MDLocation(line: 143, column: 41, scope: !352)
!367 = !MDLocation(line: 143, column: 37, scope: !352)
!368 = !MDLocation(line: 143, column: 7, scope: !352)
!369 = !MDLocation(line: 145, column: 7, scope: !348)
!370 = !MDLocation(line: 147, column: 3, scope: !319)
!371 = !MDLocation(line: 149, column: 7, scope: !372)
!372 = !{!"0xb\00149\007\0038", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!373 = !MDLocation(line: 149, column: 7, scope: !16)
!374 = !MDLocation(line: 149, column: 27, scope: !375)
!375 = !{!"0xb\001", !1, !372}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!376 = !MDLocation(line: 149, column: 26, scope: !372)
!377 = !MDLocation(line: 149, column: 32, scope: !372)
!378 = !MDLocation(line: 149, column: 25, scope: !372)
!379 = !MDLocation(line: 149, column: 18, scope: !372)
!380 = !MDLocation(line: 150, column: 7, scope: !381)
!381 = !{!"0xb\00150\007\0039", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!382 = !MDLocation(line: 150, column: 7, scope: !16)
!383 = !MDLocation(line: 150, column: 27, scope: !384)
!384 = !{!"0xb\001", !1, !381}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!385 = !MDLocation(line: 150, column: 26, scope: !381)
!386 = !MDLocation(line: 150, column: 32, scope: !381)
!387 = !MDLocation(line: 150, column: 25, scope: !381)
!388 = !MDLocation(line: 150, column: 18, scope: !381)
!389 = !MDLocation(line: 151, column: 8, scope: !390)
!390 = !{!"0xb\00151\003\0040", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!391 = !MDLocation(line: 151, column: 13, scope: !392)
!392 = !{!"0xb\002", !1, !393}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!393 = !{!"0xb\001", !1, !394}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!394 = !{!"0xb\00151\003\0041", !1, !390}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!395 = !MDLocation(line: 151, column: 15, scope: !394)
!396 = !MDLocation(line: 151, column: 13, scope: !394)
!397 = !MDLocation(line: 151, column: 3, scope: !390)
!398 = !MDLocation(line: 152, column: 12, scope: !394)
!399 = !MDLocation(line: 152, column: 11, scope: !394)
!400 = !MDLocation(line: 152, column: 17, scope: !394)
!401 = !MDLocation(line: 152, column: 22, scope: !394)
!402 = !MDLocation(line: 152, column: 21, scope: !394)
!403 = !MDLocation(line: 152, column: 6, scope: !394)
!404 = !MDLocation(line: 152, column: 5, scope: !394)
!405 = !MDLocation(line: 151, column: 18, scope: !394)
!406 = !MDLocation(line: 151, column: 26, scope: !394)
!407 = !MDLocation(line: 151, column: 22, scope: !394)
!408 = !MDLocation(line: 151, column: 35, scope: !394)
!409 = !MDLocation(line: 151, column: 31, scope: !394)
!410 = !MDLocation(line: 151, column: 3, scope: !394)
!411 = !MDLocation(line: 153, column: 1, scope: !16)
!412 = !{!"0x101\00n\0016777373\000", !17, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 157]
!413 = !MDLocation(line: 157, column: 9, scope: !17)
!414 = !{!"0x101\00sx\0033554588\000", !17, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 156]
!415 = !MDLocation(line: 156, column: 9, scope: !17)
!416 = !{!"0x101\00incx\0050331805\000", !17, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 157]
!417 = !MDLocation(line: 157, column: 12, scope: !17)
!418 = !{!"0x101\00sy\0067109020\000", !17, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 156]
!419 = !MDLocation(line: 156, column: 14, scope: !17)
!420 = !{!"0x101\00incy\0083886237\000", !17, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 157]
!421 = !MDLocation(line: 157, column: 18, scope: !17)
!422 = !{!"0x100\00i\00172\000", !17, !7, !10}    ; [ DW_TAG_auto_variable ] [i] [line 172]
!423 = !MDLocation(line: 172, column: 16, scope: !17)
!424 = !MDLocation(line: 174, column: 7, scope: !425)
!425 = !{!"0xb\00174\007\0042", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!426 = !MDLocation(line: 174, column: 7, scope: !17)
!427 = !MDLocation(line: 174, column: 14, scope: !428)
!428 = !{!"0xb\001", !1, !425}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!429 = !MDLocation(line: 175, column: 7, scope: !430)
!430 = !{!"0xb\00175\007\0043", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!431 = !MDLocation(line: 175, column: 15, scope: !430)
!432 = !MDLocation(line: 175, column: 7, scope: !17)
!433 = !MDLocation(line: 176, column: 9, scope: !434)
!434 = !{!"0xb\00176\009\0045", !1, !435}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!435 = !{!"0xb\00175\0022\0044", !1, !430}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!436 = !MDLocation(line: 176, column: 9, scope: !435)
!437 = !MDLocation(line: 178, column: 12, scope: !438)
!438 = !{!"0xb\00178\007\0047", !1, !439}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!439 = !{!"0xb\00176\0021\0046", !1, !434}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!440 = !MDLocation(line: 178, column: 17, scope: !441)
!441 = !{!"0xb\002", !1, !442}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!442 = !{!"0xb\001", !1, !443}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!443 = !{!"0xb\00178\007\0048", !1, !438}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!444 = !MDLocation(line: 178, column: 19, scope: !443)
!445 = !MDLocation(line: 178, column: 17, scope: !443)
!446 = !MDLocation(line: 178, column: 7, scope: !438)
!447 = !MDLocation(line: 179, column: 14, scope: !443)
!448 = !MDLocation(line: 179, column: 12, scope: !443)
!449 = !MDLocation(line: 179, column: 4, scope: !443)
!450 = !MDLocation(line: 179, column: 2, scope: !443)
!451 = !MDLocation(line: 178, column: 22, scope: !443)
!452 = !MDLocation(line: 178, column: 7, scope: !443)
!453 = !MDLocation(line: 180, column: 7, scope: !439)
!454 = !MDLocation(line: 182, column: 9, scope: !455)
!455 = !{!"0xb\00182\009\0049", !1, !435}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!456 = !MDLocation(line: 182, column: 9, scope: !435)
!457 = !MDLocation(line: 184, column: 12, scope: !458)
!458 = !{!"0xb\00184\007\0051", !1, !459}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!459 = !{!"0xb\00182\0020\0050", !1, !455}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!460 = !MDLocation(line: 184, column: 17, scope: !461)
!461 = !{!"0xb\002", !1, !462}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!462 = !{!"0xb\001", !1, !463}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!463 = !{!"0xb\00184\007\0052", !1, !458}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!464 = !MDLocation(line: 184, column: 19, scope: !463)
!465 = !MDLocation(line: 184, column: 17, scope: !463)
!466 = !MDLocation(line: 184, column: 7, scope: !458)
!467 = !MDLocation(line: 185, column: 9, scope: !463)
!468 = !MDLocation(line: 185, column: 8, scope: !463)
!469 = !MDLocation(line: 185, column: 3, scope: !463)
!470 = !MDLocation(line: 185, column: 2, scope: !463)
!471 = !MDLocation(line: 184, column: 22, scope: !463)
!472 = !MDLocation(line: 184, column: 31, scope: !463)
!473 = !MDLocation(line: 184, column: 27, scope: !463)
!474 = !MDLocation(line: 184, column: 41, scope: !463)
!475 = !MDLocation(line: 184, column: 37, scope: !463)
!476 = !MDLocation(line: 184, column: 7, scope: !463)
!477 = !MDLocation(line: 186, column: 7, scope: !459)
!478 = !MDLocation(line: 188, column: 3, scope: !435)
!479 = !MDLocation(line: 190, column: 7, scope: !480)
!480 = !{!"0xb\00190\007\0053", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!481 = !MDLocation(line: 190, column: 7, scope: !17)
!482 = !MDLocation(line: 190, column: 27, scope: !483)
!483 = !{!"0xb\001", !1, !480}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!484 = !MDLocation(line: 190, column: 26, scope: !480)
!485 = !MDLocation(line: 190, column: 32, scope: !480)
!486 = !MDLocation(line: 190, column: 25, scope: !480)
!487 = !MDLocation(line: 190, column: 18, scope: !480)
!488 = !MDLocation(line: 191, column: 7, scope: !489)
!489 = !{!"0xb\00191\007\0054", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!490 = !MDLocation(line: 191, column: 7, scope: !17)
!491 = !MDLocation(line: 191, column: 27, scope: !492)
!492 = !{!"0xb\001", !1, !489}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!493 = !MDLocation(line: 191, column: 26, scope: !489)
!494 = !MDLocation(line: 191, column: 32, scope: !489)
!495 = !MDLocation(line: 191, column: 25, scope: !489)
!496 = !MDLocation(line: 191, column: 18, scope: !489)
!497 = !MDLocation(line: 192, column: 8, scope: !498)
!498 = !{!"0xb\00192\003\0055", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!499 = !MDLocation(line: 192, column: 13, scope: !500)
!500 = !{!"0xb\002", !1, !501}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!501 = !{!"0xb\001", !1, !502}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!502 = !{!"0xb\00192\003\0056", !1, !498}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!503 = !MDLocation(line: 192, column: 15, scope: !502)
!504 = !MDLocation(line: 192, column: 13, scope: !502)
!505 = !MDLocation(line: 192, column: 3, scope: !498)
!506 = !MDLocation(line: 193, column: 15, scope: !502)
!507 = !MDLocation(line: 193, column: 14, scope: !502)
!508 = !MDLocation(line: 193, column: 7, scope: !502)
!509 = !MDLocation(line: 193, column: 5, scope: !502)
!510 = !MDLocation(line: 192, column: 18, scope: !502)
!511 = !MDLocation(line: 192, column: 26, scope: !502)
!512 = !MDLocation(line: 192, column: 22, scope: !502)
!513 = !MDLocation(line: 192, column: 35, scope: !502)
!514 = !MDLocation(line: 192, column: 31, scope: !502)
!515 = !MDLocation(line: 192, column: 3, scope: !502)
!516 = !MDLocation(line: 194, column: 3, scope: !17)
!517 = !MDLocation(line: 195, column: 1, scope: !17)
!518 = !{!"0x101\00n\0016777414\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 198]
!519 = !MDLocation(line: 198, column: 5, scope: !20)
!520 = !{!"0x101\00sx\0033554629\000", !20, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 197]
!521 = !MDLocation(line: 197, column: 8, scope: !20)
!522 = !{!"0x101\00incx\0050331846\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 198]
!523 = !MDLocation(line: 198, column: 8, scope: !20)
!524 = !{!"0x101\00sy\0067109061\000", !20, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 197]
!525 = !MDLocation(line: 197, column: 13, scope: !20)
!526 = !{!"0x101\00incy\0083886278\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 198]
!527 = !MDLocation(line: 198, column: 14, scope: !20)
!528 = !{!"0x100\00i\00215\000", !20, !7, !10}    ; [ DW_TAG_auto_variable ] [i] [line 215]
!529 = !MDLocation(line: 215, column: 12, scope: !20)
!530 = !{!"0x100\00stemp\00216\000", !20, !7, !12} ; [ DW_TAG_auto_variable ] [stemp] [line 216]
!531 = !MDLocation(line: 216, column: 9, scope: !20)
!532 = !MDLocation(line: 218, column: 7, scope: !533)
!533 = !{!"0xb\00218\007\0057", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!534 = !MDLocation(line: 218, column: 7, scope: !20)
!535 = !MDLocation(line: 218, column: 21, scope: !536)
!536 = !{!"0xb\001", !1, !533}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!537 = !MDLocation(line: 218, column: 19, scope: !533)
!538 = !MDLocation(line: 218, column: 13, scope: !533)
!539 = !MDLocation(line: 219, column: 7, scope: !540)
!540 = !{!"0xb\00219\007\0058", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!541 = !MDLocation(line: 219, column: 15, scope: !540)
!542 = !MDLocation(line: 219, column: 7, scope: !20)
!543 = !MDLocation(line: 220, column: 9, scope: !544)
!544 = !{!"0xb\00220\009\0060", !1, !545}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!545 = !{!"0xb\00219\0022\0059", !1, !540}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!546 = !MDLocation(line: 220, column: 9, scope: !545)
!547 = !MDLocation(line: 222, column: 12, scope: !548)
!548 = !{!"0xb\00222\007\0062", !1, !549}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!549 = !{!"0xb\00220\0021\0061", !1, !544}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!550 = !MDLocation(line: 222, column: 17, scope: !551)
!551 = !{!"0xb\002", !1, !552}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!552 = !{!"0xb\001", !1, !553}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!553 = !{!"0xb\00222\007\0063", !1, !548}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!554 = !MDLocation(line: 222, column: 19, scope: !553)
!555 = !MDLocation(line: 222, column: 17, scope: !553)
!556 = !MDLocation(line: 222, column: 7, scope: !548)
!557 = !MDLocation(line: 223, column: 13, scope: !553)
!558 = !MDLocation(line: 223, column: 12, scope: !553)
!559 = !MDLocation(line: 223, column: 19, scope: !553)
!560 = !MDLocation(line: 223, column: 18, scope: !553)
!561 = !MDLocation(line: 223, column: 11, scope: !553)
!562 = !MDLocation(line: 223, column: 2, scope: !553)
!563 = !MDLocation(line: 222, column: 22, scope: !553)
!564 = !MDLocation(line: 222, column: 27, scope: !553)
!565 = !MDLocation(line: 222, column: 33, scope: !553)
!566 = !MDLocation(line: 222, column: 7, scope: !553)
!567 = !MDLocation(line: 224, column: 15, scope: !549)
!568 = !MDLocation(line: 224, column: 13, scope: !549)
!569 = !MDLocation(line: 224, column: 7, scope: !549)
!570 = !MDLocation(line: 226, column: 9, scope: !571)
!571 = !{!"0xb\00226\009\0064", !1, !545}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!572 = !MDLocation(line: 226, column: 9, scope: !545)
!573 = !MDLocation(line: 228, column: 12, scope: !574)
!574 = !{!"0xb\00228\007\0066", !1, !575}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!575 = !{!"0xb\00226\0018\0065", !1, !571}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!576 = !MDLocation(line: 228, column: 17, scope: !577)
!577 = !{!"0xb\002", !1, !578}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!578 = !{!"0xb\001", !1, !579}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!579 = !{!"0xb\00228\007\0067", !1, !574}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!580 = !MDLocation(line: 228, column: 19, scope: !579)
!581 = !MDLocation(line: 228, column: 17, scope: !579)
!582 = !MDLocation(line: 228, column: 7, scope: !574)
!583 = !MDLocation(line: 229, column: 13, scope: !579)
!584 = !MDLocation(line: 229, column: 12, scope: !579)
!585 = !MDLocation(line: 229, column: 19, scope: !579)
!586 = !MDLocation(line: 229, column: 18, scope: !579)
!587 = !MDLocation(line: 229, column: 11, scope: !579)
!588 = !MDLocation(line: 229, column: 2, scope: !579)
!589 = !MDLocation(line: 228, column: 22, scope: !579)
!590 = !MDLocation(line: 228, column: 31, scope: !579)
!591 = !MDLocation(line: 228, column: 27, scope: !579)
!592 = !MDLocation(line: 228, column: 41, scope: !579)
!593 = !MDLocation(line: 228, column: 37, scope: !579)
!594 = !MDLocation(line: 228, column: 7, scope: !579)
!595 = !MDLocation(line: 230, column: 15, scope: !575)
!596 = !MDLocation(line: 230, column: 13, scope: !575)
!597 = !MDLocation(line: 230, column: 7, scope: !575)
!598 = !MDLocation(line: 232, column: 3, scope: !545)
!599 = !MDLocation(line: 234, column: 7, scope: !600)
!600 = !{!"0xb\00234\007\0068", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!601 = !MDLocation(line: 234, column: 7, scope: !20)
!602 = !MDLocation(line: 234, column: 27, scope: !603)
!603 = !{!"0xb\001", !1, !600}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!604 = !MDLocation(line: 234, column: 26, scope: !600)
!605 = !MDLocation(line: 234, column: 32, scope: !600)
!606 = !MDLocation(line: 234, column: 25, scope: !600)
!607 = !MDLocation(line: 234, column: 18, scope: !600)
!608 = !MDLocation(line: 235, column: 7, scope: !609)
!609 = !{!"0xb\00235\007\0069", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!610 = !MDLocation(line: 235, column: 7, scope: !20)
!611 = !MDLocation(line: 235, column: 27, scope: !612)
!612 = !{!"0xb\001", !1, !609}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!613 = !MDLocation(line: 235, column: 26, scope: !609)
!614 = !MDLocation(line: 235, column: 32, scope: !609)
!615 = !MDLocation(line: 235, column: 25, scope: !609)
!616 = !MDLocation(line: 235, column: 18, scope: !609)
!617 = !MDLocation(line: 236, column: 8, scope: !618)
!618 = !{!"0xb\00236\003\0070", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!619 = !MDLocation(line: 236, column: 13, scope: !620)
!620 = !{!"0xb\002", !1, !621}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!621 = !{!"0xb\001", !1, !622}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!622 = !{!"0xb\00236\003\0071", !1, !618}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!623 = !MDLocation(line: 236, column: 15, scope: !622)
!624 = !MDLocation(line: 236, column: 13, scope: !622)
!625 = !MDLocation(line: 236, column: 3, scope: !618)
!626 = !MDLocation(line: 237, column: 16, scope: !622)
!627 = !MDLocation(line: 237, column: 15, scope: !622)
!628 = !MDLocation(line: 237, column: 22, scope: !622)
!629 = !MDLocation(line: 237, column: 21, scope: !622)
!630 = !MDLocation(line: 237, column: 14, scope: !622)
!631 = !MDLocation(line: 237, column: 5, scope: !622)
!632 = !MDLocation(line: 236, column: 18, scope: !622)
!633 = !MDLocation(line: 236, column: 26, scope: !622)
!634 = !MDLocation(line: 236, column: 22, scope: !622)
!635 = !MDLocation(line: 236, column: 35, scope: !622)
!636 = !MDLocation(line: 236, column: 31, scope: !622)
!637 = !MDLocation(line: 236, column: 3, scope: !622)
!638 = !MDLocation(line: 238, column: 11, scope: !20)
!639 = !MDLocation(line: 238, column: 9, scope: !20)
!640 = !MDLocation(line: 238, column: 3, scope: !20)
!641 = !MDLocation(line: 239, column: 1, scope: !20)
!642 = !{!"0x101\00n\0016777459\000", !23, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 243]
!643 = !MDLocation(line: 243, column: 5, scope: !23)
!644 = !{!"0x101\00sx\0033554674\000", !23, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 242]
!645 = !MDLocation(line: 242, column: 8, scope: !23)
!646 = !{!"0x101\00incx\0050331891\000", !23, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 243]
!647 = !MDLocation(line: 243, column: 8, scope: !23)
!648 = !{!"0x100\00i\00263\000", !23, !7, !10}    ; [ DW_TAG_auto_variable ] [i] [line 263]
!649 = !MDLocation(line: 263, column: 16, scope: !23)
!650 = !{!"0x100\00phase\00264\000", !23, !7, !10} ; [ DW_TAG_auto_variable ] [phase] [line 264]
!651 = !MDLocation(line: 264, column: 8, scope: !23)
!652 = !{!"0x100\00sum\00265\000", !23, !7, !4}   ; [ DW_TAG_auto_variable ] [sum] [line 265]
!653 = !MDLocation(line: 265, column: 10, scope: !23)
!654 = !{!"0x100\00cutlo\00265\000", !23, !7, !4} ; [ DW_TAG_auto_variable ] [cutlo] [line 265]
!655 = !MDLocation(line: 265, column: 23, scope: !23)
!656 = !{!"0x100\00cuthi\00265\000", !23, !7, !4} ; [ DW_TAG_auto_variable ] [cuthi] [line 265]
!657 = !MDLocation(line: 265, column: 30, scope: !23)
!658 = !{!"0x100\00hitst\00265\000", !23, !7, !4} ; [ DW_TAG_auto_variable ] [hitst] [line 265]
!659 = !MDLocation(line: 265, column: 37, scope: !23)
!660 = !{!"0x100\00xmax\00266\000", !23, !7, !12} ; [ DW_TAG_auto_variable ] [xmax] [line 266]
!661 = !MDLocation(line: 266, column: 9, scope: !23)
!662 = !MDLocation(line: 268, column: 7, scope: !663)
!663 = !{!"0xb\00268\007\0072", !1, !23}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!664 = !MDLocation(line: 268, column: 7, scope: !23)
!665 = !MDLocation(line: 268, column: 14, scope: !666)
!666 = !{!"0xb\002", !1, !663}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!667 = !MDLocation(line: 268, column: 31, scope: !668)
!668 = !{!"0xb\003", !1, !669}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!669 = !{!"0xb\001", !1, !663}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!670 = !MDLocation(line: 268, column: 23, scope: !663)
!671 = !MDLocation(line: 270, column: 25, scope: !23)
!672 = !MDLocation(line: 270, column: 17, scope: !23)
!673 = !MDLocation(line: 270, column: 11, scope: !23)
!674 = !MDLocation(line: 270, column: 3, scope: !23)
!675 = !MDLocation(line: 271, column: 11, scope: !23)
!676 = !MDLocation(line: 271, column: 3, scope: !23)
!677 = !MDLocation(line: 272, column: 11, scope: !23)
!678 = !MDLocation(line: 272, column: 26, scope: !23)
!679 = !MDLocation(line: 272, column: 17, scope: !23)
!680 = !MDLocation(line: 272, column: 3, scope: !23)
!681 = !MDLocation(line: 273, column: 3, scope: !23)
!682 = !MDLocation(line: 276, column: 3, scope: !23)
!683 = !MDLocation(line: 276, column: 10, scope: !684)
!684 = !{!"0xb\004", !1, !685}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!685 = !{!"0xb\001", !1, !23}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!686 = !MDLocation(line: 276, column: 14, scope: !23)
!687 = !MDLocation(line: 276, column: 10, scope: !23)
!688 = !MDLocation(line: 276, column: 20, scope: !689)
!689 = !{!"0xb\002", !1, !23}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!690 = !MDLocation(line: 276, column: 19, scope: !23)
!691 = !MDLocation(line: 276, column: 3, scope: !692)
!692 = !{!"0xb\003", !1, !23}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!693 = !MDLocation(line: 277, column: 5, scope: !694)
!694 = !{!"0xb\00276\0032\0073", !1, !23}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!695 = !MDLocation(line: 278, column: 11, scope: !694)
!696 = !MDLocation(line: 278, column: 5, scope: !694)
!697 = !MDLocation(line: 280, column: 7, scope: !698)
!698 = !{!"0xb\00280\007\0074", !1, !23}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!699 = !MDLocation(line: 280, column: 10, scope: !698)
!700 = !MDLocation(line: 280, column: 7, scope: !23)
!701 = !MDLocation(line: 280, column: 22, scope: !702)
!702 = !{!"0xb\001", !1, !698}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!703 = !MDLocation(line: 280, column: 14, scope: !698)
!704 = !MDLocation(line: 280, column: 10, scope: !705)
!705 = !{!"0xb\002", !1, !698}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!706 = !MDLocation(line: 283, column: 7, scope: !707)
!707 = !{!"0xb\00283\007\0075", !1, !23}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!708 = !MDLocation(line: 283, column: 7, scope: !709)
!709 = !{!"0xb\001", !1, !707}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!710 = !MDLocation(line: 283, column: 7, scope: !711)
!711 = !{!"0xb\002", !1, !707}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!712 = !MDLocation(line: 283, column: 7, scope: !713)
!713 = !{!"0xb\004", !1, !714}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!714 = !{!"0xb\003", !1, !707}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!715 = !MDLocation(line: 283, column: 20, scope: !707)
!716 = !MDLocation(line: 283, column: 7, scope: !23)
!717 = !MDLocation(line: 284, column: 5, scope: !718)
!718 = !{!"0xb\00283\0028\0076", !1, !707}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!719 = !MDLocation(line: 284, column: 12, scope: !720)
!720 = !{!"0xb\002", !1, !721}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!721 = !{!"0xb\001", !1, !722}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!722 = !{!"0xb\00284\005\0078", !1, !723}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!723 = !{!"0xb\00284\005\0077", !1, !718}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!724 = !MDLocation(line: 284, column: 14, scope: !722)
!725 = !MDLocation(line: 284, column: 12, scope: !722)
!726 = !MDLocation(line: 284, column: 5, scope: !723)
!727 = !MDLocation(line: 285, column: 11, scope: !728)
!728 = !{!"0xb\00285\0011\0080", !1, !729}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!729 = !{!"0xb\00284\0033\0079", !1, !722}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!730 = !MDLocation(line: 285, column: 11, scope: !731)
!731 = !{!"0xb\001", !1, !728}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!732 = !MDLocation(line: 285, column: 11, scope: !733)
!733 = !{!"0xb\002", !1, !728}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!734 = !MDLocation(line: 285, column: 11, scope: !735)
!735 = !{!"0xb\004", !1, !736}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!736 = !{!"0xb\003", !1, !728}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!737 = !MDLocation(line: 285, column: 24, scope: !728)
!738 = !MDLocation(line: 285, column: 11, scope: !729)
!739 = !MDLocation(line: 285, column: 32, scope: !740)
!740 = !{!"0xb\005", !1, !728}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!741 = !MDLocation(line: 286, column: 16, scope: !729)
!742 = !MDLocation(line: 286, column: 15, scope: !729)
!743 = !MDLocation(line: 286, column: 24, scope: !729)
!744 = !MDLocation(line: 286, column: 23, scope: !729)
!745 = !MDLocation(line: 286, column: 14, scope: !729)
!746 = !MDLocation(line: 286, column: 7, scope: !729)
!747 = !MDLocation(line: 287, column: 5, scope: !729)
!748 = !MDLocation(line: 284, column: 17, scope: !722)
!749 = !MDLocation(line: 284, column: 26, scope: !722)
!750 = !MDLocation(line: 284, column: 22, scope: !722)
!751 = !MDLocation(line: 284, column: 5, scope: !722)
!752 = !MDLocation(line: 288, column: 17, scope: !718)
!753 = !MDLocation(line: 288, column: 11, scope: !718)
!754 = !MDLocation(line: 288, column: 5, scope: !718)
!755 = !MDLocation(line: 289, column: 13, scope: !718)
!756 = !MDLocation(line: 289, column: 5, scope: !718)
!757 = !MDLocation(line: 292, column: 13, scope: !758)
!758 = !{!"0xb\00291\008\0081", !1, !707}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!759 = !MDLocation(line: 292, column: 13, scope: !760)
!760 = !{!"0xb\001", !1, !758}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!761 = !MDLocation(line: 292, column: 13, scope: !762)
!762 = !{!"0xb\002", !1, !758}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!763 = !MDLocation(line: 292, column: 5, scope: !764)
!764 = !{!"0xb\004", !1, !765}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!765 = !{!"0xb\003", !1, !758}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!766 = !MDLocation(line: 293, column: 11, scope: !758)
!767 = !MDLocation(line: 293, column: 5, scope: !758)
!768 = !MDLocation(line: 294, column: 5, scope: !758)
!769 = !MDLocation(line: 295, column: 5, scope: !758)
!770 = !MDLocation(line: 296, column: 5, scope: !758)
!771 = !MDLocation(line: 296, column: 12, scope: !772)
!772 = !{!"0xb\002", !1, !773}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!773 = !{!"0xb\001", !1, !774}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!774 = !{!"0xb\00296\005\0083", !1, !775}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!775 = !{!"0xb\00296\005\0082", !1, !758}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!776 = !MDLocation(line: 296, column: 14, scope: !774)
!777 = !MDLocation(line: 296, column: 12, scope: !774)
!778 = !MDLocation(line: 296, column: 5, scope: !775)
!779 = !MDLocation(line: 297, column: 11, scope: !780)
!780 = !{!"0xb\00297\0011\0085", !1, !781}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!781 = !{!"0xb\00296\0033\0084", !1, !774}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!782 = !MDLocation(line: 297, column: 11, scope: !783)
!783 = !{!"0xb\001", !1, !780}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!784 = !MDLocation(line: 297, column: 11, scope: !785)
!785 = !{!"0xb\002", !1, !780}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!786 = !MDLocation(line: 297, column: 11, scope: !787)
!787 = !{!"0xb\004", !1, !788}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!788 = !{!"0xb\003", !1, !780}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!789 = !MDLocation(line: 297, column: 24, scope: !780)
!790 = !MDLocation(line: 297, column: 11, scope: !781)
!791 = !MDLocation(line: 298, column: 9, scope: !792)
!792 = !{!"0xb\00297\0032\0086", !1, !780}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!793 = !MDLocation(line: 298, column: 13, scope: !792)
!794 = !MDLocation(line: 298, column: 19, scope: !792)
!795 = !MDLocation(line: 298, column: 8, scope: !792)
!796 = !MDLocation(line: 298, column: 2, scope: !792)
!797 = !MDLocation(line: 299, column: 2, scope: !792)
!798 = !MDLocation(line: 301, column: 11, scope: !799)
!799 = !{!"0xb\00301\0011\0087", !1, !781}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!800 = !MDLocation(line: 301, column: 11, scope: !801)
!801 = !{!"0xb\001", !1, !799}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!802 = !MDLocation(line: 301, column: 11, scope: !803)
!803 = !{!"0xb\002", !1, !799}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!804 = !MDLocation(line: 301, column: 24, scope: !805)
!805 = !{!"0xb\004", !1, !806}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!806 = !{!"0xb\003", !1, !799}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!807 = !MDLocation(line: 301, column: 11, scope: !781)
!808 = !MDLocation(line: 302, column: 15, scope: !809)
!809 = !{!"0xb\00301\0031\0088", !1, !799}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!810 = !MDLocation(line: 302, column: 20, scope: !809)
!811 = !MDLocation(line: 302, column: 28, scope: !809)
!812 = !MDLocation(line: 302, column: 27, scope: !809)
!813 = !MDLocation(line: 302, column: 19, scope: !809)
!814 = !MDLocation(line: 302, column: 34, scope: !809)
!815 = !MDLocation(line: 302, column: 42, scope: !809)
!816 = !MDLocation(line: 302, column: 41, scope: !809)
!817 = !MDLocation(line: 302, column: 33, scope: !809)
!818 = !MDLocation(line: 302, column: 9, scope: !809)
!819 = !MDLocation(line: 302, column: 2, scope: !809)
!820 = !MDLocation(line: 303, column: 9, scope: !809)
!821 = !MDLocation(line: 303, column: 9, scope: !822)
!822 = !{!"0xb\001", !1, !809}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!823 = !MDLocation(line: 303, column: 9, scope: !824)
!824 = !{!"0xb\002", !1, !809}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!825 = !MDLocation(line: 303, column: 2, scope: !826)
!826 = !{!"0xb\004", !1, !827}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!827 = !{!"0xb\003", !1, !809}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!828 = !MDLocation(line: 304, column: 2, scope: !809)
!829 = !MDLocation(line: 306, column: 17, scope: !781)
!830 = !MDLocation(line: 306, column: 16, scope: !781)
!831 = !MDLocation(line: 306, column: 21, scope: !781)
!832 = !MDLocation(line: 306, column: 15, scope: !781)
!833 = !MDLocation(line: 306, column: 30, scope: !781)
!834 = !MDLocation(line: 306, column: 29, scope: !781)
!835 = !MDLocation(line: 306, column: 34, scope: !781)
!836 = !MDLocation(line: 306, column: 28, scope: !781)
!837 = !MDLocation(line: 306, column: 14, scope: !781)
!838 = !MDLocation(line: 306, column: 7, scope: !781)
!839 = !MDLocation(line: 307, column: 5, scope: !781)
!840 = !MDLocation(line: 296, column: 17, scope: !774)
!841 = !MDLocation(line: 296, column: 26, scope: !774)
!842 = !MDLocation(line: 296, column: 22, scope: !774)
!843 = !MDLocation(line: 296, column: 5, scope: !774)
!844 = !MDLocation(line: 308, column: 21, scope: !758)
!845 = !MDLocation(line: 308, column: 13, scope: !758)
!846 = !MDLocation(line: 308, column: 32, scope: !758)
!847 = !MDLocation(line: 308, column: 26, scope: !758)
!848 = !MDLocation(line: 308, column: 5, scope: !758)
!849 = !MDLocation(line: 312, column: 17, scope: !23)
!850 = !MDLocation(line: 312, column: 23, scope: !23)
!851 = !MDLocation(line: 312, column: 22, scope: !23)
!852 = !MDLocation(line: 312, column: 21, scope: !23)
!853 = !MDLocation(line: 312, column: 30, scope: !23)
!854 = !MDLocation(line: 312, column: 29, scope: !23)
!855 = !MDLocation(line: 312, column: 28, scope: !23)
!856 = !MDLocation(line: 312, column: 16, scope: !23)
!857 = !MDLocation(line: 312, column: 10, scope: !23)
!858 = !MDLocation(line: 312, column: 3, scope: !23)
!859 = !MDLocation(line: 313, column: 10, scope: !23)
!860 = !MDLocation(line: 313, column: 10, scope: !685)
!861 = !MDLocation(line: 313, column: 10, scope: !689)
!862 = !MDLocation(line: 313, column: 3, scope: !863)
!863 = !{!"0xb\004", !1, !692}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!864 = !MDLocation(line: 314, column: 11, scope: !23)
!865 = !MDLocation(line: 314, column: 3, scope: !23)
!866 = !MDLocation(line: 315, column: 3, scope: !23)
!867 = !MDLocation(line: 316, column: 3, scope: !23)
!868 = !MDLocation(line: 316, column: 10, scope: !869)
!869 = !{!"0xb\002", !1, !870}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!870 = !{!"0xb\001", !1, !871}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!871 = !{!"0xb\00316\003\0090", !1, !872}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!872 = !{!"0xb\00316\003\0089", !1, !23}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!873 = !MDLocation(line: 316, column: 12, scope: !871)
!874 = !MDLocation(line: 316, column: 10, scope: !871)
!875 = !MDLocation(line: 316, column: 3, scope: !872)
!876 = !MDLocation(line: 317, column: 9, scope: !877)
!877 = !{!"0xb\00317\009\0092", !1, !878}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!878 = !{!"0xb\00316\0031\0091", !1, !871}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!879 = !MDLocation(line: 317, column: 9, scope: !880)
!880 = !{!"0xb\001", !1, !877}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!881 = !MDLocation(line: 317, column: 9, scope: !882)
!882 = !{!"0xb\002", !1, !877}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!883 = !MDLocation(line: 317, column: 22, scope: !884)
!884 = !{!"0xb\004", !1, !885}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!885 = !{!"0xb\003", !1, !877}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!886 = !MDLocation(line: 317, column: 9, scope: !878)
!887 = !MDLocation(line: 318, column: 20, scope: !888)
!888 = !{!"0xb\00317\0029\0093", !1, !877}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!889 = !MDLocation(line: 318, column: 25, scope: !888)
!890 = !MDLocation(line: 318, column: 33, scope: !888)
!891 = !MDLocation(line: 318, column: 32, scope: !888)
!892 = !MDLocation(line: 318, column: 24, scope: !888)
!893 = !MDLocation(line: 318, column: 39, scope: !888)
!894 = !MDLocation(line: 318, column: 47, scope: !888)
!895 = !MDLocation(line: 318, column: 46, scope: !888)
!896 = !MDLocation(line: 318, column: 38, scope: !888)
!897 = !MDLocation(line: 318, column: 14, scope: !888)
!898 = !MDLocation(line: 318, column: 7, scope: !888)
!899 = !MDLocation(line: 319, column: 14, scope: !888)
!900 = !MDLocation(line: 319, column: 14, scope: !901)
!901 = !{!"0xb\001", !1, !888}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!902 = !MDLocation(line: 319, column: 14, scope: !903)
!903 = !{!"0xb\002", !1, !888}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!904 = !MDLocation(line: 319, column: 7, scope: !905)
!905 = !{!"0xb\004", !1, !906}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!906 = !{!"0xb\003", !1, !888}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!907 = !MDLocation(line: 320, column: 7, scope: !888)
!908 = !MDLocation(line: 322, column: 15, scope: !878)
!909 = !MDLocation(line: 322, column: 14, scope: !878)
!910 = !MDLocation(line: 322, column: 19, scope: !878)
!911 = !MDLocation(line: 322, column: 13, scope: !878)
!912 = !MDLocation(line: 322, column: 28, scope: !878)
!913 = !MDLocation(line: 322, column: 27, scope: !878)
!914 = !MDLocation(line: 322, column: 32, scope: !878)
!915 = !MDLocation(line: 322, column: 26, scope: !878)
!916 = !MDLocation(line: 322, column: 12, scope: !878)
!917 = !MDLocation(line: 322, column: 5, scope: !878)
!918 = !MDLocation(line: 323, column: 3, scope: !878)
!919 = !MDLocation(line: 316, column: 15, scope: !871)
!920 = !MDLocation(line: 316, column: 24, scope: !871)
!921 = !MDLocation(line: 316, column: 20, scope: !871)
!922 = !MDLocation(line: 316, column: 3, scope: !871)
!923 = !MDLocation(line: 324, column: 19, scope: !23)
!924 = !MDLocation(line: 324, column: 11, scope: !23)
!925 = !MDLocation(line: 324, column: 30, scope: !23)
!926 = !MDLocation(line: 324, column: 24, scope: !23)
!927 = !MDLocation(line: 324, column: 3, scope: !23)
!928 = !MDLocation(line: 325, column: 1, scope: !23)
!929 = !{!"0x100\00u\00335\000", !26, !7, !12}    ; [ DW_TAG_auto_variable ] [u] [line 335]
!930 = !MDLocation(line: 335, column: 11, scope: !26)
!931 = !{!"0x100\00comp\00335\000", !26, !7, !12} ; [ DW_TAG_auto_variable ] [comp] [line 335]
!932 = !MDLocation(line: 335, column: 22, scope: !26)
!933 = !MDLocation(line: 337, column: 5, scope: !26)
!934 = !MDLocation(line: 338, column: 9, scope: !935)
!935 = !{!"0xb\00337\008\0094", !1, !26}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!936 = !MDLocation(line: 339, column: 24, scope: !935)
!937 = !MDLocation(line: 339, column: 16, scope: !935)
!938 = !MDLocation(line: 339, column: 9, scope: !935)
!939 = !MDLocation(line: 340, column: 5, scope: !935)
!940 = !MDLocation(line: 341, column: 12, scope: !26)
!941 = !MDLocation(line: 342, column: 21, scope: !26)
!942 = !MDLocation(line: 342, column: 13, scope: !26)
!943 = !MDLocation(line: 342, column: 5, scope: !26)
!944 = !{!"0x101\00n\0016777574\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 358]
!945 = !MDLocation(line: 358, column: 5, scope: !28)
!946 = !{!"0x101\00a\0033554790\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [a] [line 358]
!947 = !MDLocation(line: 358, column: 8, scope: !28)
!948 = !{!"0x101\00b\0050332006\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [b] [line 358]
!949 = !MDLocation(line: 358, column: 11, scope: !28)
!950 = !{!"0x101\00c\0067109222\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [c] [line 358]
!951 = !MDLocation(line: 358, column: 14, scope: !28)
!952 = !{!"0x101\00d\0083886438\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [d] [line 358]
!953 = !MDLocation(line: 358, column: 17, scope: !28)
!954 = !{!"0x101\00e\00100663654\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [e] [line 358]
!955 = !MDLocation(line: 358, column: 20, scope: !28)
!956 = !{!"0x101\00f\00117440870\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [f] [line 358]
!957 = !MDLocation(line: 358, column: 23, scope: !28)
!958 = !{!"0x101\00g\00134218086\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [g] [line 358]
!959 = !MDLocation(line: 358, column: 26, scope: !28)
!960 = !{!"0x101\00h\00150995302\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [h] [line 358]
!961 = !MDLocation(line: 358, column: 29, scope: !28)
!962 = !{!"0x101\00i\00167772518\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [i] [line 358]
!963 = !MDLocation(line: 358, column: 32, scope: !28)
!964 = !{!"0x101\00j\00184549734\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [j] [line 358]
!965 = !MDLocation(line: 358, column: 35, scope: !28)
!966 = !{!"0x101\00k\00201326950\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [k] [line 358]
!967 = !MDLocation(line: 358, column: 38, scope: !28)
!968 = !{!"0x101\00l\00218104166\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [l] [line 358]
!969 = !MDLocation(line: 358, column: 41, scope: !28)
!970 = !{!"0x101\00m\00234881382\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [m] [line 358]
!971 = !MDLocation(line: 358, column: 44, scope: !28)
!972 = !{!"0x101\00o\00251658598\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [o] [line 358]
!973 = !MDLocation(line: 358, column: 47, scope: !28)
!974 = !{!"0x101\00p\00268435814\000", !28, !7, !10} ; [ DW_TAG_arg_variable ] [p] [line 358]
!975 = !MDLocation(line: 358, column: 50, scope: !28)
!976 = !{!"0x100\00mt\00360\000", !28, !7, !10}   ; [ DW_TAG_auto_variable ] [mt] [line 360]
!977 = !MDLocation(line: 360, column: 9, scope: !28)
!978 = !MDLocation(line: 362, column: 9, scope: !979)
!979 = !{!"0xb\00362\009\0095", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!980 = !MDLocation(line: 362, column: 9, scope: !28)
!981 = !MDLocation(line: 362, column: 18, scope: !982)
!982 = !{!"0xb\002", !1, !979}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!983 = !MDLocation(line: 362, column: 27, scope: !984)
!984 = !{!"0xb\003", !1, !985}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!985 = !{!"0xb\001", !1, !979}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!986 = !MDLocation(line: 363, column: 10, scope: !28)
!987 = !MDLocation(line: 363, column: 5, scope: !28)
!988 = !MDLocation(line: 364, column: 9, scope: !989)
!989 = !{!"0xb\00364\009\0096", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!990 = !MDLocation(line: 364, column: 9, scope: !28)
!991 = !MDLocation(line: 364, column: 26, scope: !992)
!992 = !{!"0xb\001", !1, !989}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!993 = !MDLocation(line: 364, column: 18, scope: !989)
!994 = !MDLocation(line: 366, column: 9, scope: !995)
!995 = !{!"0xb\00366\009\0097", !1, !28}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!996 = !MDLocation(line: 366, column: 14, scope: !995)
!997 = !MDLocation(line: 366, column: 9, scope: !28)
!998 = !MDLocation(line: 366, column: 23, scope: !999)
!999 = !{!"0xb\001", !1, !995}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1000 = !MDLocation(line: 366, column: 18, scope: !995)
!1001 = !MDLocation(line: 367, column: 9, scope: !1002)
!1002 = !{!"0xb\00367\009\0098", !1, !28}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1003 = !MDLocation(line: 367, column: 9, scope: !28)
!1004 = !MDLocation(line: 367, column: 26, scope: !1005)
!1005 = !{!"0xb\001", !1, !1002}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1006 = !MDLocation(line: 367, column: 18, scope: !1002)
!1007 = !MDLocation(line: 369, column: 9, scope: !1008)
!1008 = !{!"0xb\00369\009\0099", !1, !28}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1009 = !MDLocation(line: 369, column: 14, scope: !1008)
!1010 = !MDLocation(line: 369, column: 9, scope: !28)
!1011 = !MDLocation(line: 369, column: 23, scope: !1012)
!1012 = !{!"0xb\001", !1, !1008}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1013 = !MDLocation(line: 369, column: 18, scope: !1008)
!1014 = !MDLocation(line: 370, column: 9, scope: !1015)
!1015 = !{!"0xb\00370\009\00100", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1016 = !MDLocation(line: 370, column: 9, scope: !28)
!1017 = !MDLocation(line: 370, column: 26, scope: !1018)
!1018 = !{!"0xb\001", !1, !1015}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1019 = !MDLocation(line: 370, column: 18, scope: !1015)
!1020 = !MDLocation(line: 372, column: 9, scope: !1021)
!1021 = !{!"0xb\00372\009\00101", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1022 = !MDLocation(line: 372, column: 14, scope: !1021)
!1023 = !MDLocation(line: 372, column: 9, scope: !28)
!1024 = !MDLocation(line: 372, column: 23, scope: !1025)
!1025 = !{!"0xb\001", !1, !1021}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1026 = !MDLocation(line: 372, column: 18, scope: !1021)
!1027 = !MDLocation(line: 373, column: 9, scope: !1028)
!1028 = !{!"0xb\00373\009\00102", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1029 = !MDLocation(line: 373, column: 9, scope: !28)
!1030 = !MDLocation(line: 373, column: 26, scope: !1031)
!1031 = !{!"0xb\001", !1, !1028}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1032 = !MDLocation(line: 373, column: 18, scope: !1028)
!1033 = !MDLocation(line: 375, column: 9, scope: !1034)
!1034 = !{!"0xb\00375\009\00103", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1035 = !MDLocation(line: 375, column: 14, scope: !1034)
!1036 = !MDLocation(line: 375, column: 9, scope: !28)
!1037 = !MDLocation(line: 375, column: 23, scope: !1038)
!1038 = !{!"0xb\001", !1, !1034}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1039 = !MDLocation(line: 375, column: 18, scope: !1034)
!1040 = !MDLocation(line: 376, column: 9, scope: !1041)
!1041 = !{!"0xb\00376\009\00104", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1042 = !MDLocation(line: 376, column: 9, scope: !28)
!1043 = !MDLocation(line: 376, column: 26, scope: !1044)
!1044 = !{!"0xb\001", !1, !1041}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1045 = !MDLocation(line: 376, column: 18, scope: !1041)
!1046 = !MDLocation(line: 378, column: 9, scope: !1047)
!1047 = !{!"0xb\00378\009\00105", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1048 = !MDLocation(line: 378, column: 14, scope: !1047)
!1049 = !MDLocation(line: 378, column: 9, scope: !28)
!1050 = !MDLocation(line: 378, column: 23, scope: !1051)
!1051 = !{!"0xb\001", !1, !1047}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1052 = !MDLocation(line: 378, column: 18, scope: !1047)
!1053 = !MDLocation(line: 379, column: 9, scope: !1054)
!1054 = !{!"0xb\00379\009\00106", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1055 = !MDLocation(line: 379, column: 9, scope: !28)
!1056 = !MDLocation(line: 379, column: 26, scope: !1057)
!1057 = !{!"0xb\001", !1, !1054}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1058 = !MDLocation(line: 379, column: 18, scope: !1054)
!1059 = !MDLocation(line: 381, column: 9, scope: !1060)
!1060 = !{!"0xb\00381\009\00107", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1061 = !MDLocation(line: 381, column: 14, scope: !1060)
!1062 = !MDLocation(line: 381, column: 9, scope: !28)
!1063 = !MDLocation(line: 381, column: 23, scope: !1064)
!1064 = !{!"0xb\001", !1, !1060}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1065 = !MDLocation(line: 381, column: 18, scope: !1060)
!1066 = !MDLocation(line: 382, column: 9, scope: !1067)
!1067 = !{!"0xb\00382\009\00108", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1068 = !MDLocation(line: 382, column: 9, scope: !28)
!1069 = !MDLocation(line: 382, column: 26, scope: !1070)
!1070 = !{!"0xb\001", !1, !1067}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1071 = !MDLocation(line: 382, column: 18, scope: !1067)
!1072 = !MDLocation(line: 384, column: 9, scope: !1073)
!1073 = !{!"0xb\00384\009\00109", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1074 = !MDLocation(line: 384, column: 14, scope: !1073)
!1075 = !MDLocation(line: 384, column: 9, scope: !28)
!1076 = !MDLocation(line: 384, column: 23, scope: !1077)
!1077 = !{!"0xb\001", !1, !1073}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1078 = !MDLocation(line: 384, column: 18, scope: !1073)
!1079 = !MDLocation(line: 385, column: 9, scope: !1080)
!1080 = !{!"0xb\00385\009\00110", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1081 = !MDLocation(line: 385, column: 9, scope: !28)
!1082 = !MDLocation(line: 385, column: 26, scope: !1083)
!1083 = !{!"0xb\001", !1, !1080}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1084 = !MDLocation(line: 385, column: 18, scope: !1080)
!1085 = !MDLocation(line: 387, column: 9, scope: !1086)
!1086 = !{!"0xb\00387\009\00111", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1087 = !MDLocation(line: 387, column: 14, scope: !1086)
!1088 = !MDLocation(line: 387, column: 9, scope: !28)
!1089 = !MDLocation(line: 387, column: 23, scope: !1090)
!1090 = !{!"0xb\001", !1, !1086}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1091 = !MDLocation(line: 387, column: 18, scope: !1086)
!1092 = !MDLocation(line: 388, column: 9, scope: !1093)
!1093 = !{!"0xb\00388\009\00112", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1094 = !MDLocation(line: 388, column: 9, scope: !28)
!1095 = !MDLocation(line: 388, column: 26, scope: !1096)
!1096 = !{!"0xb\001", !1, !1093}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1097 = !MDLocation(line: 388, column: 18, scope: !1093)
!1098 = !MDLocation(line: 390, column: 9, scope: !1099)
!1099 = !{!"0xb\00390\009\00113", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1100 = !MDLocation(line: 390, column: 14, scope: !1099)
!1101 = !MDLocation(line: 390, column: 9, scope: !28)
!1102 = !MDLocation(line: 390, column: 24, scope: !1103)
!1103 = !{!"0xb\001", !1, !1099}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1104 = !MDLocation(line: 390, column: 19, scope: !1099)
!1105 = !MDLocation(line: 391, column: 9, scope: !1106)
!1106 = !{!"0xb\00391\009\00114", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1107 = !MDLocation(line: 391, column: 9, scope: !28)
!1108 = !MDLocation(line: 391, column: 27, scope: !1109)
!1109 = !{!"0xb\001", !1, !1106}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1110 = !MDLocation(line: 391, column: 19, scope: !1106)
!1111 = !MDLocation(line: 393, column: 9, scope: !1112)
!1112 = !{!"0xb\00393\009\00115", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1113 = !MDLocation(line: 393, column: 14, scope: !1112)
!1114 = !MDLocation(line: 393, column: 9, scope: !28)
!1115 = !MDLocation(line: 393, column: 24, scope: !1116)
!1116 = !{!"0xb\001", !1, !1112}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1117 = !MDLocation(line: 393, column: 19, scope: !1112)
!1118 = !MDLocation(line: 394, column: 9, scope: !1119)
!1119 = !{!"0xb\00394\009\00116", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1120 = !MDLocation(line: 394, column: 9, scope: !28)
!1121 = !MDLocation(line: 394, column: 27, scope: !1122)
!1122 = !{!"0xb\001", !1, !1119}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1123 = !MDLocation(line: 394, column: 19, scope: !1119)
!1124 = !MDLocation(line: 396, column: 9, scope: !1125)
!1125 = !{!"0xb\00396\009\00117", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1126 = !MDLocation(line: 396, column: 14, scope: !1125)
!1127 = !MDLocation(line: 396, column: 9, scope: !28)
!1128 = !MDLocation(line: 396, column: 24, scope: !1129)
!1129 = !{!"0xb\001", !1, !1125}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1130 = !MDLocation(line: 396, column: 19, scope: !1125)
!1131 = !MDLocation(line: 397, column: 9, scope: !1132)
!1132 = !{!"0xb\00397\009\00118", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1133 = !MDLocation(line: 397, column: 9, scope: !28)
!1134 = !MDLocation(line: 397, column: 27, scope: !1135)
!1135 = !{!"0xb\001", !1, !1132}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1136 = !MDLocation(line: 397, column: 19, scope: !1132)
!1137 = !MDLocation(line: 399, column: 9, scope: !1138)
!1138 = !{!"0xb\00399\009\00119", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1139 = !MDLocation(line: 399, column: 14, scope: !1138)
!1140 = !MDLocation(line: 399, column: 9, scope: !28)
!1141 = !MDLocation(line: 399, column: 23, scope: !1142)
!1142 = !{!"0xb\001", !1, !1138}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1143 = !MDLocation(line: 399, column: 18, scope: !1138)
!1144 = !MDLocation(line: 400, column: 9, scope: !1145)
!1145 = !{!"0xb\00400\009\00120", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1146 = !MDLocation(line: 400, column: 9, scope: !28)
!1147 = !MDLocation(line: 400, column: 27, scope: !1148)
!1148 = !{!"0xb\001", !1, !1145}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1149 = !MDLocation(line: 400, column: 19, scope: !1145)
!1150 = !MDLocation(line: 402, column: 9, scope: !1151)
!1151 = !{!"0xb\00402\009\00121", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1152 = !MDLocation(line: 402, column: 14, scope: !1151)
!1153 = !MDLocation(line: 402, column: 9, scope: !28)
!1154 = !MDLocation(line: 402, column: 24, scope: !1155)
!1155 = !{!"0xb\001", !1, !1151}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1156 = !MDLocation(line: 402, column: 19, scope: !1151)
!1157 = !MDLocation(line: 403, column: 9, scope: !1158)
!1158 = !{!"0xb\00403\009\00122", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1159 = !MDLocation(line: 403, column: 9, scope: !28)
!1160 = !MDLocation(line: 403, column: 27, scope: !1161)
!1161 = !{!"0xb\001", !1, !1158}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1162 = !MDLocation(line: 403, column: 19, scope: !1158)
!1163 = !MDLocation(line: 405, column: 9, scope: !1164)
!1164 = !{!"0xb\00405\009\00123", !1, !28}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1165 = !MDLocation(line: 405, column: 14, scope: !1164)
!1166 = !MDLocation(line: 405, column: 9, scope: !28)
!1167 = !MDLocation(line: 405, column: 24, scope: !1168)
!1168 = !{!"0xb\001", !1, !1164}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1169 = !MDLocation(line: 405, column: 19, scope: !1164)
!1170 = !MDLocation(line: 406, column: 13, scope: !28)
!1171 = !MDLocation(line: 406, column: 5, scope: !28)
!1172 = !MDLocation(line: 407, column: 1, scope: !28)
!1173 = !{!"0x101\00n\0016777625\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 409]
!1174 = !MDLocation(line: 409, column: 9, scope: !31)
!1175 = !{!"0x101\00sa\0033554842\000", !31, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 410]
!1176 = !MDLocation(line: 410, column: 8, scope: !31)
!1177 = !{!"0x101\00sx\0050332058\000", !31, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 410]
!1178 = !MDLocation(line: 410, column: 13, scope: !31)
!1179 = !{!"0x101\00incx\0067109273\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 409]
!1180 = !MDLocation(line: 409, column: 12, scope: !31)
!1181 = !{!"0x100\00i\00425\000", !31, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 425]
!1182 = !MDLocation(line: 425, column: 7, scope: !31)
!1183 = !MDLocation(line: 427, column: 7, scope: !1184)
!1184 = !{!"0xb\00427\007\00124", !1, !31}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1185 = !MDLocation(line: 427, column: 7, scope: !31)
!1186 = !MDLocation(line: 427, column: 15, scope: !1187)
!1187 = !{!"0xb\001", !1, !1184}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1188 = !MDLocation(line: 430, column: 7, scope: !1189)
!1189 = !{!"0xb\00430\007\00125", !1, !31}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1190 = !MDLocation(line: 430, column: 7, scope: !31)
!1191 = !MDLocation(line: 431, column: 9, scope: !1192)
!1192 = !{!"0xb\00431\009\00127", !1, !1193}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1193 = !{!"0xb\00430\0019\00126", !1, !1189}     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1194 = !MDLocation(line: 431, column: 9, scope: !1193)
!1195 = !MDLocation(line: 431, column: 28, scope: !1196)
!1196 = !{!"0xb\001", !1, !1192}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1197 = !MDLocation(line: 431, column: 27, scope: !1192)
!1198 = !MDLocation(line: 431, column: 33, scope: !1192)
!1199 = !MDLocation(line: 431, column: 26, scope: !1192)
!1200 = !MDLocation(line: 431, column: 20, scope: !1192)
!1201 = !MDLocation(line: 432, column: 10, scope: !1202)
!1202 = !{!"0xb\00432\005\00128", !1, !1193}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1203 = !MDLocation(line: 432, column: 15, scope: !1204)
!1204 = !{!"0xb\002", !1, !1205}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1205 = !{!"0xb\001", !1, !1206}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1206 = !{!"0xb\00432\005\00129", !1, !1202}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1207 = !MDLocation(line: 432, column: 17, scope: !1206)
!1208 = !MDLocation(line: 432, column: 15, scope: !1206)
!1209 = !MDLocation(line: 432, column: 5, scope: !1202)
!1210 = !MDLocation(line: 433, column: 11, scope: !1206)
!1211 = !MDLocation(line: 433, column: 5, scope: !1206)
!1212 = !MDLocation(line: 433, column: 4, scope: !1206)
!1213 = !MDLocation(line: 432, column: 20, scope: !1206)
!1214 = !MDLocation(line: 432, column: 29, scope: !1206)
!1215 = !MDLocation(line: 432, column: 25, scope: !1206)
!1216 = !MDLocation(line: 432, column: 5, scope: !1206)
!1217 = !MDLocation(line: 434, column: 9, scope: !1193)
!1218 = !MDLocation(line: 437, column: 8, scope: !1219)
!1219 = !{!"0xb\00437\003\00130", !1, !31}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1220 = !MDLocation(line: 437, column: 13, scope: !1221)
!1221 = !{!"0xb\002", !1, !1222}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1222 = !{!"0xb\001", !1, !1223}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1223 = !{!"0xb\00437\003\00131", !1, !1219}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1224 = !MDLocation(line: 437, column: 15, scope: !1223)
!1225 = !MDLocation(line: 437, column: 13, scope: !1223)
!1226 = !MDLocation(line: 437, column: 3, scope: !1219)
!1227 = !MDLocation(line: 438, column: 12, scope: !1223)
!1228 = !MDLocation(line: 438, column: 6, scope: !1223)
!1229 = !MDLocation(line: 438, column: 5, scope: !1223)
!1230 = !MDLocation(line: 437, column: 18, scope: !1223)
!1231 = !MDLocation(line: 437, column: 23, scope: !1223)
!1232 = !MDLocation(line: 437, column: 3, scope: !1223)
!1233 = !MDLocation(line: 439, column: 3, scope: !31)
!1234 = !MDLocation(line: 440, column: 1, scope: !31)
!1235 = !{!"0x101\00n\0016777658\000", !34, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 442]
!1236 = !MDLocation(line: 442, column: 5, scope: !34)
!1237 = !{!"0x101\00v\0033554875\000", !34, !7, !11} ; [ DW_TAG_arg_variable ] [v] [line 443]
!1238 = !MDLocation(line: 443, column: 8, scope: !34)
!1239 = !{!"0x101\00x\0050332091\000", !34, !7, !11} ; [ DW_TAG_arg_variable ] [x] [line 443]
!1240 = !MDLocation(line: 443, column: 12, scope: !34)
!1241 = !{!"0x101\00y\0067109307\000", !34, !7, !11} ; [ DW_TAG_arg_variable ] [y] [line 443]
!1242 = !MDLocation(line: 443, column: 16, scope: !34)
!1243 = !{!"0x101\00itype\0083886522\000", !34, !7, !10} ; [ DW_TAG_arg_variable ] [itype] [line 442]
!1244 = !MDLocation(line: 442, column: 8, scope: !34)
!1245 = !{!"0x100\00i\00460\000", !34, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 460]
!1246 = !MDLocation(line: 460, column: 16, scope: !34)
!1247 = !MDLocation(line: 462, column: 7, scope: !1248)
!1248 = !{!"0xb\00462\007\00132", !1, !34}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1249 = !MDLocation(line: 462, column: 7, scope: !34)
!1250 = !MDLocation(line: 462, column: 13, scope: !1251)
!1251 = !{!"0xb\001", !1, !1248}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1252 = !MDLocation(line: 464, column: 7, scope: !1253)
!1253 = !{!"0xb\00464\007\00133", !1, !34}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1254 = !MDLocation(line: 464, column: 7, scope: !34)
!1255 = !MDLocation(line: 465, column: 10, scope: !1256)
!1256 = !{!"0xb\00465\005\00134", !1, !1253}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1257 = !MDLocation(line: 465, column: 15, scope: !1258)
!1258 = !{!"0xb\002", !1, !1259}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1259 = !{!"0xb\001", !1, !1260}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1260 = !{!"0xb\00465\005\00135", !1, !1256}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1261 = !MDLocation(line: 465, column: 17, scope: !1260)
!1262 = !MDLocation(line: 465, column: 15, scope: !1260)
!1263 = !MDLocation(line: 465, column: 5, scope: !1256)
!1264 = !MDLocation(line: 466, column: 13, scope: !1260)
!1265 = !MDLocation(line: 466, column: 12, scope: !1260)
!1266 = !MDLocation(line: 466, column: 18, scope: !1260)
!1267 = !MDLocation(line: 466, column: 17, scope: !1260)
!1268 = !MDLocation(line: 466, column: 8, scope: !1260)
!1269 = !MDLocation(line: 466, column: 7, scope: !1260)
!1270 = !MDLocation(line: 465, column: 20, scope: !1260)
!1271 = !MDLocation(line: 465, column: 25, scope: !1260)
!1272 = !MDLocation(line: 465, column: 30, scope: !1260)
!1273 = !MDLocation(line: 465, column: 35, scope: !1260)
!1274 = !MDLocation(line: 465, column: 5, scope: !1260)
!1275 = !MDLocation(line: 466, column: 18, scope: !1256)
!1276 = !MDLocation(line: 468, column: 10, scope: !1277)
!1277 = !{!"0xb\00468\005\00136", !1, !1253}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1278 = !MDLocation(line: 468, column: 15, scope: !1279)
!1279 = !{!"0xb\002", !1, !1280}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1280 = !{!"0xb\001", !1, !1281}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1281 = !{!"0xb\00468\005\00137", !1, !1277}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1282 = !MDLocation(line: 468, column: 17, scope: !1281)
!1283 = !MDLocation(line: 468, column: 15, scope: !1281)
!1284 = !MDLocation(line: 468, column: 5, scope: !1277)
!1285 = !MDLocation(line: 469, column: 13, scope: !1281)
!1286 = !MDLocation(line: 469, column: 12, scope: !1281)
!1287 = !MDLocation(line: 469, column: 18, scope: !1281)
!1288 = !MDLocation(line: 469, column: 17, scope: !1281)
!1289 = !MDLocation(line: 469, column: 8, scope: !1281)
!1290 = !MDLocation(line: 469, column: 7, scope: !1281)
!1291 = !MDLocation(line: 468, column: 20, scope: !1281)
!1292 = !MDLocation(line: 468, column: 25, scope: !1281)
!1293 = !MDLocation(line: 468, column: 30, scope: !1281)
!1294 = !MDLocation(line: 468, column: 35, scope: !1281)
!1295 = !MDLocation(line: 468, column: 5, scope: !1281)
!1296 = !MDLocation(line: 470, column: 1, scope: !34)
!1297 = !{!"0x101\00n\0016777688\000", !37, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 472]
!1298 = !MDLocation(line: 472, column: 5, scope: !37)
!1299 = !{!"0x101\00v\0033554905\000", !37, !7, !11} ; [ DW_TAG_arg_variable ] [v] [line 473]
!1300 = !MDLocation(line: 473, column: 8, scope: !37)
!1301 = !{!"0x101\00val\0050332121\000", !37, !7, !12} ; [ DW_TAG_arg_variable ] [val] [line 473]
!1302 = !MDLocation(line: 473, column: 11, scope: !37)
!1303 = !{!"0x100\00i\00482\000", !37, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 482]
!1304 = !MDLocation(line: 482, column: 16, scope: !37)
!1305 = !MDLocation(line: 484, column: 7, scope: !1306)
!1306 = !{!"0xb\00484\007\00138", !1, !37}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1307 = !MDLocation(line: 484, column: 7, scope: !37)
!1308 = !MDLocation(line: 484, column: 13, scope: !1309)
!1309 = !{!"0xb\001", !1, !1306}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1310 = !MDLocation(line: 485, column: 8, scope: !1311)
!1311 = !{!"0xb\00485\003\00139", !1, !37}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1312 = !MDLocation(line: 485, column: 13, scope: !1313)
!1313 = !{!"0xb\002", !1, !1314}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1314 = !{!"0xb\001", !1, !1315}                  ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1315 = !{!"0xb\00485\003\00140", !1, !1311}      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!1316 = !MDLocation(line: 485, column: 15, scope: !1315)
!1317 = !MDLocation(line: 485, column: 13, scope: !1315)
!1318 = !MDLocation(line: 485, column: 3, scope: !1311)
!1319 = !MDLocation(line: 486, column: 10, scope: !1315)
!1320 = !MDLocation(line: 486, column: 6, scope: !1315)
!1321 = !MDLocation(line: 486, column: 5, scope: !1315)
!1322 = !MDLocation(line: 485, column: 18, scope: !1315)
!1323 = !MDLocation(line: 485, column: 23, scope: !1315)
!1324 = !MDLocation(line: 485, column: 3, scope: !1315)
!1325 = !MDLocation(line: 487, column: 1, scope: !37)
