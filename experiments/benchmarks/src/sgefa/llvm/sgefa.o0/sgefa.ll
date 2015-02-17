; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgefa(%struct.FULL* %a, i32* %ipvt) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.FULL*, align 8
  %ipvt.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %nm1 = alloca i32, align 4
  %info = alloca i32, align 4
  %n = alloca i32, align 4
  %t = alloca float, align 4
  %akk = alloca float*, align 8
  %alk = alloca float*, align 8
  %aij = alloca float*, align 8
  %mik = alloca float*, align 8
  store %struct.FULL* %a, %struct.FULL** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.FULL** %a.addr, metadata !25, metadata !26), !dbg !27
  store i32* %ipvt, i32** %ipvt.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %ipvt.addr, metadata !28, metadata !26), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !26), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %j, metadata !32, metadata !26), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %k, metadata !34, metadata !26), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %l, metadata !36, metadata !26), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %nm1, metadata !38, metadata !26), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %info, metadata !40, metadata !26), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %n, metadata !42, metadata !26), !dbg !43
  call void @llvm.dbg.declare(metadata float* %t, metadata !44, metadata !26), !dbg !45
  call void @llvm.dbg.declare(metadata float** %akk, metadata !46, metadata !26), !dbg !47
  call void @llvm.dbg.declare(metadata float** %alk, metadata !48, metadata !26), !dbg !49
  call void @llvm.dbg.declare(metadata float** %aij, metadata !50, metadata !26), !dbg !51
  call void @llvm.dbg.declare(metadata float** %mik, metadata !52, metadata !26), !dbg !53
  %0 = load %struct.FULL** %a.addr, align 8, !dbg !54
  %cd = getelementptr inbounds %struct.FULL* %0, i32 0, i32 0, !dbg !54
  %1 = load i32* %cd, align 4, !dbg !54
  %2 = load %struct.FULL** %a.addr, align 8, !dbg !56
  %rd = getelementptr inbounds %struct.FULL* %2, i32 0, i32 1, !dbg !56
  %3 = load i32* %rd, align 4, !dbg !56
  %cmp = icmp ne i32 %1, %3, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, !dbg !58
  br label %return, !dbg !58

if.end:                                           ; preds = %entry
  %4 = load %struct.FULL** %a.addr, align 8, !dbg !60
  %cd1 = getelementptr inbounds %struct.FULL* %4, i32 0, i32 0, !dbg !60
  %5 = load i32* %cd1, align 4, !dbg !60
  store i32 %5, i32* %n, align 4, !dbg !61
  %6 = load i32* %n, align 4, !dbg !62
  %sub = sub nsw i32 %6, 1, !dbg !62
  store i32 %sub, i32* %nm1, align 4, !dbg !63
  %7 = load %struct.FULL** %a.addr, align 8, !dbg !64
  %pd = getelementptr inbounds %struct.FULL* %7, i32 0, i32 2, !dbg !64
  %arrayidx = getelementptr inbounds [1000 x float*]* %pd, i32 0, i64 0, !dbg !64
  %8 = load float** %arrayidx, align 8, !dbg !64
  store float* %8, float** %akk, align 8, !dbg !65
  store i32 0, i32* %info, align 4, !dbg !66
  %9 = load i32* %n, align 4, !dbg !67
  %cmp2 = icmp slt i32 %9, 2, !dbg !67
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !69

if.then3:                                         ; preds = %if.end
  br label %CLEAN_UP, !dbg !70

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %k, align 4, !dbg !72
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc86, %if.end4
  %10 = load i32* %k, align 4, !dbg !74
  %11 = load i32* %nm1, align 4, !dbg !78
  %cmp5 = icmp slt i32 %10, %11, !dbg !79
  br i1 %cmp5, label %for.body, label %for.end89, !dbg !80

for.body:                                         ; preds = %for.cond
  %12 = load i32* %k, align 4, !dbg !81
  %idxprom = sext i32 %12 to i64, !dbg !83
  %13 = load %struct.FULL** %a.addr, align 8, !dbg !83
  %pd6 = getelementptr inbounds %struct.FULL* %13, i32 0, i32 2, !dbg !83
  %arrayidx7 = getelementptr inbounds [1000 x float*]* %pd6, i32 0, i64 %idxprom, !dbg !83
  %14 = load float** %arrayidx7, align 8, !dbg !83
  %15 = load i32* %k, align 4, !dbg !84
  %idx.ext = sext i32 %15 to i64, !dbg !83
  %add.ptr = getelementptr inbounds float* %14, i64 %idx.ext, !dbg !83
  store float* %add.ptr, float** %akk, align 8, !dbg !85
  %16 = load i32* %n, align 4, !dbg !86
  %17 = load i32* %k, align 4, !dbg !87
  %sub8 = sub nsw i32 %16, %17, !dbg !86
  %18 = load float** %akk, align 8, !dbg !88
  %call = call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %sub8, float* %18, i32 1), !dbg !89
  %19 = load i32* %k, align 4, !dbg !90
  %add = add nsw i32 %call, %19, !dbg !89
  store i32 %add, i32* %l, align 4, !dbg !91
  %20 = load i32* %l, align 4, !dbg !92
  %21 = load i32** %ipvt.addr, align 8, !dbg !93
  store i32 %20, i32* %21, align 4, !dbg !94
  %22 = load i32* %k, align 4, !dbg !95
  %idxprom9 = sext i32 %22 to i64, !dbg !96
  %23 = load %struct.FULL** %a.addr, align 8, !dbg !96
  %pd10 = getelementptr inbounds %struct.FULL* %23, i32 0, i32 2, !dbg !96
  %arrayidx11 = getelementptr inbounds [1000 x float*]* %pd10, i32 0, i64 %idxprom9, !dbg !96
  %24 = load float** %arrayidx11, align 8, !dbg !96
  %25 = load i32* %l, align 4, !dbg !97
  %idx.ext12 = sext i32 %25 to i64, !dbg !96
  %add.ptr13 = getelementptr inbounds float* %24, i64 %idx.ext12, !dbg !96
  store float* %add.ptr13, float** %alk, align 8, !dbg !98
  %26 = load float** %alk, align 8, !dbg !99
  %27 = load float* %26, align 4, !dbg !101
  %conv = fpext float %27 to double, !dbg !101
  %cmp14 = fcmp oeq double %conv, 0.000000e+00, !dbg !101
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !102

if.then16:                                        ; preds = %for.body
  %28 = load i32* %k, align 4, !dbg !103
  store i32 %28, i32* %info, align 4, !dbg !105
  br label %for.inc86, !dbg !106

if.end17:                                         ; preds = %for.body
  %29 = load i32* %l, align 4, !dbg !107
  %30 = load i32* %k, align 4, !dbg !109
  %cmp18 = icmp ne i32 %29, %30, !dbg !107
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !110

if.then20:                                        ; preds = %if.end17
  %31 = load float** %alk, align 8, !dbg !111
  %32 = load float* %31, align 4, !dbg !113
  store float %32, float* %t, align 4, !dbg !114
  %33 = load float** %akk, align 8, !dbg !115
  %34 = load float* %33, align 4, !dbg !116
  %35 = load float** %alk, align 8, !dbg !117
  store float %34, float* %35, align 4, !dbg !118
  %36 = load float* %t, align 4, !dbg !119
  %37 = load float** %akk, align 8, !dbg !120
  store float %36, float* %37, align 4, !dbg !121
  br label %if.end21, !dbg !122

if.end21:                                         ; preds = %if.then20, %if.end17
  %38 = load float** %akk, align 8, !dbg !123
  %39 = load float* %38, align 4, !dbg !124
  %conv22 = fpext float %39 to double, !dbg !125
  %div = fdiv double -1.000000e+00, %conv22, !dbg !126
  %conv23 = fptrunc double %div to float, !dbg !126
  store float %conv23, float* %t, align 4, !dbg !127
  %40 = load i32* %k, align 4, !dbg !128
  %add24 = add nsw i32 %40, 1, !dbg !128
  store i32 %add24, i32* %i, align 4, !dbg !130
  %41 = load float** %akk, align 8, !dbg !131
  %add.ptr25 = getelementptr inbounds float* %41, i64 1, !dbg !131
  store float* %add.ptr25, float** %mik, align 8, !dbg !132
  br label %for.cond26, !dbg !130

for.cond26:                                       ; preds = %for.inc, %if.end21
  %42 = load i32* %i, align 4, !dbg !133
  %43 = load i32* %n, align 4, !dbg !137
  %cmp27 = icmp slt i32 %42, %43, !dbg !138
  br i1 %cmp27, label %for.body29, label %for.end, !dbg !139

for.body29:                                       ; preds = %for.cond26
  %44 = load float* %t, align 4, !dbg !140
  %45 = load float** %mik, align 8, !dbg !141
  %46 = load float* %45, align 4, !dbg !142
  %mul = fmul float %46, %44, !dbg !142
  store float %mul, float* %45, align 4, !dbg !142
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body29
  %47 = load i32* %i, align 4, !dbg !143
  %inc = add nsw i32 %47, 1, !dbg !143
  store i32 %inc, i32* %i, align 4, !dbg !143
  %48 = load float** %mik, align 8, !dbg !144
  %incdec.ptr = getelementptr inbounds float* %48, i32 1, !dbg !144
  store float* %incdec.ptr, float** %mik, align 8, !dbg !144
  br label %for.cond26, !dbg !145

for.end:                                          ; preds = %for.cond26
  %49 = load i32* %k, align 4, !dbg !146
  %add30 = add nsw i32 %49, 1, !dbg !146
  store i32 %add30, i32* %j, align 4, !dbg !148
  br label %for.cond31, !dbg !148

for.cond31:                                       ; preds = %for.inc83, %for.end
  %50 = load i32* %j, align 4, !dbg !149
  %51 = load i32* %n, align 4, !dbg !153
  %cmp32 = icmp slt i32 %50, %51, !dbg !154
  br i1 %cmp32, label %for.body34, label %for.end85, !dbg !155

for.body34:                                       ; preds = %for.cond31
  %52 = load i32* %j, align 4, !dbg !156
  %idxprom35 = sext i32 %52 to i64, !dbg !156
  %53 = load %struct.FULL** %a.addr, align 8, !dbg !156
  %pd36 = getelementptr inbounds %struct.FULL* %53, i32 0, i32 2, !dbg !156
  %arrayidx37 = getelementptr inbounds [1000 x float*]* %pd36, i32 0, i64 %idxprom35, !dbg !156
  %54 = load float** %arrayidx37, align 8, !dbg !156
  %55 = load i32* %k, align 4, !dbg !156
  %idx.ext38 = sext i32 %55 to i64, !dbg !156
  %add.ptr39 = getelementptr inbounds float* %54, i64 %idx.ext38, !dbg !156
  %56 = load float* %add.ptr39, align 4, !dbg !156
  store float %56, float* %t, align 4, !dbg !158
  %57 = load i32* %l, align 4, !dbg !159
  %58 = load i32* %k, align 4, !dbg !161
  %cmp40 = icmp ne i32 %57, %58, !dbg !159
  br i1 %cmp40, label %if.then42, label %if.end63, !dbg !162

if.then42:                                        ; preds = %for.body34
  %59 = load i32* %j, align 4, !dbg !163
  %idxprom43 = sext i32 %59 to i64, !dbg !163
  %60 = load %struct.FULL** %a.addr, align 8, !dbg !163
  %pd44 = getelementptr inbounds %struct.FULL* %60, i32 0, i32 2, !dbg !163
  %arrayidx45 = getelementptr inbounds [1000 x float*]* %pd44, i32 0, i64 %idxprom43, !dbg !163
  %61 = load float** %arrayidx45, align 8, !dbg !163
  %62 = load i32* %l, align 4, !dbg !163
  %idx.ext46 = sext i32 %62 to i64, !dbg !163
  %add.ptr47 = getelementptr inbounds float* %61, i64 %idx.ext46, !dbg !163
  %63 = load float* %add.ptr47, align 4, !dbg !163
  %64 = load i32* %j, align 4, !dbg !165
  %idxprom48 = sext i32 %64 to i64, !dbg !165
  %65 = load %struct.FULL** %a.addr, align 8, !dbg !165
  %pd49 = getelementptr inbounds %struct.FULL* %65, i32 0, i32 2, !dbg !165
  %arrayidx50 = getelementptr inbounds [1000 x float*]* %pd49, i32 0, i64 %idxprom48, !dbg !165
  %66 = load float** %arrayidx50, align 8, !dbg !165
  %67 = load i32* %k, align 4, !dbg !165
  %idx.ext51 = sext i32 %67 to i64, !dbg !165
  %add.ptr52 = getelementptr inbounds float* %66, i64 %idx.ext51, !dbg !165
  store float %63, float* %add.ptr52, align 4, !dbg !165
  %68 = load float* %t, align 4, !dbg !166
  %69 = load i32* %j, align 4, !dbg !167
  %idxprom53 = sext i32 %69 to i64, !dbg !167
  %70 = load %struct.FULL** %a.addr, align 8, !dbg !167
  %pd54 = getelementptr inbounds %struct.FULL* %70, i32 0, i32 2, !dbg !167
  %arrayidx55 = getelementptr inbounds [1000 x float*]* %pd54, i32 0, i64 %idxprom53, !dbg !167
  %71 = load float** %arrayidx55, align 8, !dbg !167
  %72 = load i32* %l, align 4, !dbg !167
  %idx.ext56 = sext i32 %72 to i64, !dbg !167
  %add.ptr57 = getelementptr inbounds float* %71, i64 %idx.ext56, !dbg !167
  store float %68, float* %add.ptr57, align 4, !dbg !167
  %73 = load i32* %j, align 4, !dbg !168
  %idxprom58 = sext i32 %73 to i64, !dbg !168
  %74 = load %struct.FULL** %a.addr, align 8, !dbg !168
  %pd59 = getelementptr inbounds %struct.FULL* %74, i32 0, i32 2, !dbg !168
  %arrayidx60 = getelementptr inbounds [1000 x float*]* %pd59, i32 0, i64 %idxprom58, !dbg !168
  %75 = load float** %arrayidx60, align 8, !dbg !168
  %76 = load i32* %k, align 4, !dbg !168
  %idx.ext61 = sext i32 %76 to i64, !dbg !168
  %add.ptr62 = getelementptr inbounds float* %75, i64 %idx.ext61, !dbg !168
  %77 = load float* %add.ptr62, align 4, !dbg !168
  store float %77, float* %t, align 4, !dbg !169
  br label %if.end63, !dbg !170

if.end63:                                         ; preds = %if.then42, %for.body34
  %78 = load i32* %k, align 4, !dbg !171
  %add64 = add nsw i32 %78, 1, !dbg !171
  store i32 %add64, i32* %i, align 4, !dbg !173
  %79 = load i32* %j, align 4, !dbg !174
  %idxprom65 = sext i32 %79 to i64, !dbg !175
  %80 = load %struct.FULL** %a.addr, align 8, !dbg !175
  %pd66 = getelementptr inbounds %struct.FULL* %80, i32 0, i32 2, !dbg !175
  %arrayidx67 = getelementptr inbounds [1000 x float*]* %pd66, i32 0, i64 %idxprom65, !dbg !175
  %81 = load float** %arrayidx67, align 8, !dbg !175
  %82 = load i32* %k, align 4, !dbg !176
  %idx.ext68 = sext i32 %82 to i64, !dbg !175
  %add.ptr69 = getelementptr inbounds float* %81, i64 %idx.ext68, !dbg !175
  %add.ptr70 = getelementptr inbounds float* %add.ptr69, i64 1, !dbg !175
  store float* %add.ptr70, float** %aij, align 8, !dbg !177
  %83 = load float** %akk, align 8, !dbg !178
  %add.ptr71 = getelementptr inbounds float* %83, i64 1, !dbg !178
  store float* %add.ptr71, float** %mik, align 8, !dbg !179
  br label %for.cond72, !dbg !173

for.cond72:                                       ; preds = %for.inc78, %if.end63
  %84 = load i32* %i, align 4, !dbg !180
  %85 = load i32* %n, align 4, !dbg !184
  %cmp73 = icmp slt i32 %84, %85, !dbg !185
  br i1 %cmp73, label %for.body75, label %for.end82, !dbg !186

for.body75:                                       ; preds = %for.cond72
  %86 = load float* %t, align 4, !dbg !187
  %87 = load float** %mik, align 8, !dbg !188
  %88 = load float* %87, align 4, !dbg !189
  %mul76 = fmul float %86, %88, !dbg !187
  %89 = load float** %aij, align 8, !dbg !190
  %90 = load float* %89, align 4, !dbg !191
  %add77 = fadd float %90, %mul76, !dbg !191
  store float %add77, float* %89, align 4, !dbg !191
  br label %for.inc78, !dbg !191

for.inc78:                                        ; preds = %for.body75
  %91 = load i32* %i, align 4, !dbg !192
  %inc79 = add nsw i32 %91, 1, !dbg !192
  store i32 %inc79, i32* %i, align 4, !dbg !192
  %92 = load float** %aij, align 8, !dbg !193
  %incdec.ptr80 = getelementptr inbounds float* %92, i32 1, !dbg !193
  store float* %incdec.ptr80, float** %aij, align 8, !dbg !193
  %93 = load float** %mik, align 8, !dbg !194
  %incdec.ptr81 = getelementptr inbounds float* %93, i32 1, !dbg !194
  store float* %incdec.ptr81, float** %mik, align 8, !dbg !194
  br label %for.cond72, !dbg !195

for.end82:                                        ; preds = %for.cond72
  br label %for.inc83, !dbg !196

for.inc83:                                        ; preds = %for.end82
  %94 = load i32* %j, align 4, !dbg !197
  %inc84 = add nsw i32 %94, 1, !dbg !197
  store i32 %inc84, i32* %j, align 4, !dbg !197
  br label %for.cond31, !dbg !198

for.end85:                                        ; preds = %for.cond31
  br label %for.inc86, !dbg !199

for.inc86:                                        ; preds = %for.end85, %if.then16
  %95 = load i32* %k, align 4, !dbg !200
  %inc87 = add nsw i32 %95, 1, !dbg !200
  store i32 %inc87, i32* %k, align 4, !dbg !200
  %96 = load i32** %ipvt.addr, align 8, !dbg !201
  %incdec.ptr88 = getelementptr inbounds i32* %96, i32 1, !dbg !201
  store i32* %incdec.ptr88, i32** %ipvt.addr, align 8, !dbg !201
  br label %for.cond, !dbg !202

for.end89:                                        ; preds = %for.cond
  br label %CLEAN_UP, !dbg !203

CLEAN_UP:                                         ; preds = %for.end89, %if.then3
  %97 = load i32* %nm1, align 4, !dbg !204
  %98 = load i32** %ipvt.addr, align 8, !dbg !205
  store i32 %97, i32* %98, align 4, !dbg !206
  %99 = load float** %akk, align 8, !dbg !207
  %100 = load float* %99, align 4, !dbg !209
  %conv90 = fpext float %100 to double, !dbg !209
  %cmp91 = fcmp oeq double %conv90, 0.000000e+00, !dbg !209
  br i1 %cmp91, label %if.then93, label %if.end94, !dbg !210

if.then93:                                        ; preds = %CLEAN_UP
  %101 = load i32* %n, align 4, !dbg !211
  store i32 %101, i32* %info, align 4, !dbg !213
  br label %if.end94, !dbg !213

if.end94:                                         ; preds = %if.then93, %CLEAN_UP
  %102 = load i32* %info, align 4, !dbg !214
  store i32 %102, i32* %retval, !dbg !215
  br label %return, !dbg !215

return:                                           ; preds = %if.end94, %if.then
  %103 = load i32* %retval, !dbg !216
  ret i32 %103, !dbg !216
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @isamax(...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c] [DW_LANG_C99]
!1 = !{!"sgefa.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00sgefa\00sgefa\00\0011\000\001\000\000\000\000\0048", !1, !5, !6, null, i32 (%struct.FULL*, i32*)* @sgefa, null, null, !2} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 48] [sgefa]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !21}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = !{!"0x13\00FULL\0031\0064064\0064\000\000\000", !11, null, null, !12, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = !{!"./ge.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!12 = !{!13, !14, !15}
!13 = !{!"0xd\00cd\0032\0032\0032\000\000", !11, !10, !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = !{!"0xd\00rd\0033\0032\0032\0032\000", !11, !10, !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = !{!"0xd\00pd\0034\0064000\0064\0064\000", !11, !10, !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !17, !19, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = !{!20}
!20 = !{!"0x21\000\001000"}                       ; [ DW_TAG_subrange_type ] [0, 999]
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 2}
!24 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!25 = !{!"0x101\00a\0016777228\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!26 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!27 = !MDLocation(line: 12, column: 14, scope: !4)
!28 = !{!"0x101\00ipvt\0033554445\000", !4, !5, !21} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!29 = !MDLocation(line: 13, column: 10, scope: !4)
!30 = !{!"0x100\00i\0049\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 49]
!31 = !MDLocation(line: 49, column: 17, scope: !4)
!32 = !{!"0x100\00j\0049\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 49]
!33 = !MDLocation(line: 49, column: 20, scope: !4)
!34 = !{!"0x100\00k\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [k] [line 50]
!35 = !MDLocation(line: 50, column: 18, scope: !4)
!36 = !{!"0x100\00l\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [l] [line 50]
!37 = !MDLocation(line: 50, column: 21, scope: !4)
!38 = !{!"0x100\00nm1\0050\000", !4, !5, !8}      ; [ DW_TAG_auto_variable ] [nm1] [line 50]
!39 = !MDLocation(line: 50, column: 24, scope: !4)
!40 = !{!"0x100\00info\0050\000", !4, !5, !8}     ; [ DW_TAG_auto_variable ] [info] [line 50]
!41 = !MDLocation(line: 50, column: 29, scope: !4)
!42 = !{!"0x100\00n\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 50]
!43 = !MDLocation(line: 50, column: 35, scope: !4)
!44 = !{!"0x100\00t\0051\000", !4, !5, !18}       ; [ DW_TAG_auto_variable ] [t] [line 51]
!45 = !MDLocation(line: 51, column: 10, scope: !4)
!46 = !{!"0x100\00akk\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [akk] [line 51]
!47 = !MDLocation(line: 51, column: 14, scope: !4)
!48 = !{!"0x100\00alk\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [alk] [line 51]
!49 = !MDLocation(line: 51, column: 20, scope: !4)
!50 = !{!"0x100\00aij\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [aij] [line 51]
!51 = !MDLocation(line: 51, column: 26, scope: !4)
!52 = !{!"0x100\00mik\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [mik] [line 51]
!53 = !MDLocation(line: 51, column: 32, scope: !4)
!54 = !MDLocation(line: 54, column: 7, scope: !55)
!55 = !{!"0xb\0054\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!56 = !MDLocation(line: 54, column: 16, scope: !55)
!57 = !MDLocation(line: 54, column: 7, scope: !4)
!58 = !MDLocation(line: 54, column: 24, scope: !59)
!59 = !{!"0xb\001", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!60 = !MDLocation(line: 55, column: 10, scope: !4)
!61 = !MDLocation(line: 55, column: 3, scope: !4)
!62 = !MDLocation(line: 56, column: 10, scope: !4)
!63 = !MDLocation(line: 56, column: 3, scope: !4)
!64 = !MDLocation(line: 57, column: 10, scope: !4)
!65 = !MDLocation(line: 57, column: 3, scope: !4)
!66 = !MDLocation(line: 58, column: 3, scope: !4)
!67 = !MDLocation(line: 59, column: 7, scope: !68)
!68 = !{!"0xb\0059\007\001", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!69 = !MDLocation(line: 59, column: 7, scope: !4)
!70 = !MDLocation(line: 59, column: 15, scope: !71)
!71 = !{!"0xb\001", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!72 = !MDLocation(line: 62, column: 8, scope: !73)
!73 = !{!"0xb\0062\003\002", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!74 = !MDLocation(line: 62, column: 13, scope: !75)
!75 = !{!"0xb\002", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!76 = !{!"0xb\001", !1, !77}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!77 = !{!"0xb\0062\003\003", !1, !73}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!78 = !MDLocation(line: 62, column: 15, scope: !77)
!79 = !MDLocation(line: 62, column: 13, scope: !77)
!80 = !MDLocation(line: 62, column: 3, scope: !73)
!81 = !MDLocation(line: 65, column: 19, scope: !82)
!82 = !{!"0xb\0062\0034\004", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!83 = !MDLocation(line: 65, column: 13, scope: !82)
!84 = !MDLocation(line: 65, column: 24, scope: !82)
!85 = !MDLocation(line: 65, column: 5, scope: !82)
!86 = !MDLocation(line: 66, column: 21, scope: !82)
!87 = !MDLocation(line: 66, column: 23, scope: !82)
!88 = !MDLocation(line: 66, column: 26, scope: !82)
!89 = !MDLocation(line: 66, column: 13, scope: !82)
!90 = !MDLocation(line: 66, column: 37, scope: !82)
!91 = !MDLocation(line: 66, column: 5, scope: !82)
!92 = !MDLocation(line: 67, column: 13, scope: !82)
!93 = !MDLocation(line: 67, column: 6, scope: !82)
!94 = !MDLocation(line: 67, column: 5, scope: !82)
!95 = !MDLocation(line: 70, column: 17, scope: !82)
!96 = !MDLocation(line: 70, column: 11, scope: !82)
!97 = !MDLocation(line: 70, column: 22, scope: !82)
!98 = !MDLocation(line: 70, column: 5, scope: !82)
!99 = !MDLocation(line: 71, column: 10, scope: !100)
!100 = !{!"0xb\0071\009\005", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!101 = !MDLocation(line: 71, column: 9, scope: !100)
!102 = !MDLocation(line: 71, column: 9, scope: !82)
!103 = !MDLocation(line: 72, column: 14, scope: !104)
!104 = !{!"0xb\0071\0024\006", !1, !100}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!105 = !MDLocation(line: 72, column: 7, scope: !104)
!106 = !MDLocation(line: 73, column: 7, scope: !104)
!107 = !MDLocation(line: 77, column: 9, scope: !108)
!108 = !{!"0xb\0077\009\007", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!109 = !MDLocation(line: 77, column: 14, scope: !108)
!110 = !MDLocation(line: 77, column: 9, scope: !82)
!111 = !MDLocation(line: 78, column: 15, scope: !112)
!112 = !{!"0xb\0077\0018\008", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!113 = !MDLocation(line: 78, column: 14, scope: !112)
!114 = !MDLocation(line: 78, column: 7, scope: !112)
!115 = !MDLocation(line: 79, column: 15, scope: !112)
!116 = !MDLocation(line: 79, column: 14, scope: !112)
!117 = !MDLocation(line: 79, column: 8, scope: !112)
!118 = !MDLocation(line: 79, column: 7, scope: !112)
!119 = !MDLocation(line: 80, column: 14, scope: !112)
!120 = !MDLocation(line: 80, column: 8, scope: !112)
!121 = !MDLocation(line: 80, column: 7, scope: !112)
!122 = !MDLocation(line: 81, column: 5, scope: !112)
!123 = !MDLocation(line: 84, column: 20, scope: !82)
!124 = !MDLocation(line: 84, column: 19, scope: !82)
!125 = !MDLocation(line: 84, column: 18, scope: !82)
!126 = !MDLocation(line: 84, column: 9, scope: !82)
!127 = !MDLocation(line: 84, column: 5, scope: !82)
!128 = !MDLocation(line: 85, column: 12, scope: !129)
!129 = !{!"0xb\0085\005\009", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!130 = !MDLocation(line: 85, column: 10, scope: !129)
!131 = !MDLocation(line: 85, column: 23, scope: !129)
!132 = !MDLocation(line: 85, column: 17, scope: !129)
!133 = !MDLocation(line: 85, column: 30, scope: !134)
!134 = !{!"0xb\002", !1, !135}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!135 = !{!"0xb\001", !1, !136}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!136 = !{!"0xb\0085\005\0010", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!137 = !MDLocation(line: 85, column: 32, scope: !136)
!138 = !MDLocation(line: 85, column: 30, scope: !136)
!139 = !MDLocation(line: 85, column: 5, scope: !129)
!140 = !MDLocation(line: 86, column: 15, scope: !136)
!141 = !MDLocation(line: 86, column: 8, scope: !136)
!142 = !MDLocation(line: 86, column: 7, scope: !136)
!143 = !MDLocation(line: 85, column: 35, scope: !136)
!144 = !MDLocation(line: 85, column: 40, scope: !136)
!145 = !MDLocation(line: 85, column: 5, scope: !136)
!146 = !MDLocation(line: 89, column: 12, scope: !147)
!147 = !{!"0xb\0089\005\0011", !1, !82}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!148 = !MDLocation(line: 89, column: 10, scope: !147)
!149 = !MDLocation(line: 89, column: 17, scope: !150)
!150 = !{!"0xb\002", !1, !151}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!151 = !{!"0xb\001", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!152 = !{!"0xb\0089\005\0012", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!153 = !MDLocation(line: 89, column: 19, scope: !152)
!154 = !MDLocation(line: 89, column: 17, scope: !152)
!155 = !MDLocation(line: 89, column: 5, scope: !147)
!156 = !MDLocation(line: 92, column: 11, scope: !157)
!157 = !{!"0xb\0089\0028\0013", !1, !152}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!158 = !MDLocation(line: 92, column: 7, scope: !157)
!159 = !MDLocation(line: 93, column: 11, scope: !160)
!160 = !{!"0xb\0093\0011\0014", !1, !157}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!161 = !MDLocation(line: 93, column: 16, scope: !160)
!162 = !MDLocation(line: 93, column: 11, scope: !157)
!163 = !MDLocation(line: 94, column: 17, scope: !164)
!164 = !{!"0xb\0093\0020\0015", !1, !160}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!165 = !MDLocation(line: 94, column: 2, scope: !164)
!166 = !MDLocation(line: 95, column: 17, scope: !164)
!167 = !MDLocation(line: 95, column: 2, scope: !164)
!168 = !MDLocation(line: 96, column: 6, scope: !164)
!169 = !MDLocation(line: 96, column: 2, scope: !164)
!170 = !MDLocation(line: 97, column: 7, scope: !164)
!171 = !MDLocation(line: 98, column: 14, scope: !172)
!172 = !{!"0xb\0098\007\0016", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!173 = !MDLocation(line: 98, column: 12, scope: !172)
!174 = !MDLocation(line: 98, column: 29, scope: !172)
!175 = !MDLocation(line: 98, column: 23, scope: !172)
!176 = !MDLocation(line: 98, column: 32, scope: !172)
!177 = !MDLocation(line: 98, column: 19, scope: !172)
!178 = !MDLocation(line: 98, column: 41, scope: !172)
!179 = !MDLocation(line: 98, column: 37, scope: !172)
!180 = !MDLocation(line: 98, column: 48, scope: !181)
!181 = !{!"0xb\002", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!182 = !{!"0xb\001", !1, !183}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!183 = !{!"0xb\0098\007\0017", !1, !172}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!184 = !MDLocation(line: 98, column: 50, scope: !183)
!185 = !MDLocation(line: 98, column: 48, scope: !183)
!186 = !MDLocation(line: 98, column: 7, scope: !172)
!187 = !MDLocation(line: 99, column: 10, scope: !183)
!188 = !MDLocation(line: 99, column: 14, scope: !183)
!189 = !MDLocation(line: 99, column: 13, scope: !183)
!190 = !MDLocation(line: 99, column: 3, scope: !183)
!191 = !MDLocation(line: 99, column: 2, scope: !183)
!192 = !MDLocation(line: 98, column: 53, scope: !183)
!193 = !MDLocation(line: 98, column: 58, scope: !183)
!194 = !MDLocation(line: 98, column: 65, scope: !183)
!195 = !MDLocation(line: 98, column: 7, scope: !183)
!196 = !MDLocation(line: 100, column: 5, scope: !157)
!197 = !MDLocation(line: 89, column: 22, scope: !152)
!198 = !MDLocation(line: 89, column: 5, scope: !152)
!199 = !MDLocation(line: 101, column: 3, scope: !82)
!200 = !MDLocation(line: 62, column: 20, scope: !77)
!201 = !MDLocation(line: 62, column: 25, scope: !77)
!202 = !MDLocation(line: 62, column: 3, scope: !77)
!203 = !MDLocation(line: 101, column: 3, scope: !73)
!204 = !MDLocation(line: 104, column: 11, scope: !4)
!205 = !MDLocation(line: 104, column: 4, scope: !4)
!206 = !MDLocation(line: 104, column: 3, scope: !4)
!207 = !MDLocation(line: 105, column: 8, scope: !208)
!208 = !{!"0xb\00105\007\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!209 = !MDLocation(line: 105, column: 7, scope: !208)
!210 = !MDLocation(line: 105, column: 7, scope: !4)
!211 = !MDLocation(line: 105, column: 30, scope: !212)
!212 = !{!"0xb\001", !1, !208}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!213 = !MDLocation(line: 105, column: 23, scope: !208)
!214 = !MDLocation(line: 106, column: 11, scope: !4)
!215 = !MDLocation(line: 106, column: 3, scope: !4)
!216 = !MDLocation(line: 107, column: 1, scope: !4)
