; ModuleID = 'n-body.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* %bodies, double %dt) #0 {
entry:
  %nbodies.addr = alloca i32, align 4
  %bodies.addr = alloca %struct.planet*, align 8
  %dt.addr = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  %mag = alloca double, align 8
  %b49 = alloca %struct.planet*, align 8
  store i32 %nbodies, i32* %nbodies.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nbodies.addr, metadata !40, metadata !41), !dbg !42
  store %struct.planet* %bodies, %struct.planet** %bodies.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.planet** %bodies.addr, metadata !43, metadata !41), !dbg !44
  store double %dt, double* %dt.addr, align 8
  call void @llvm.dbg.declare(metadata double* %dt.addr, metadata !45, metadata !41), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !41), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %j, metadata !49, metadata !41), !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc43, %entry
  %0 = load i32* %i, align 4, !dbg !53
  %1 = load i32* %nbodies.addr, align 4, !dbg !57
  %cmp = icmp slt i32 %0, %1, !dbg !58
  br i1 %cmp, label %for.body, label %for.end45, !dbg !59

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.planet** %b, metadata !60, metadata !41), !dbg !62
  %2 = load i32* %i, align 4, !dbg !63
  %idxprom = sext i32 %2 to i64, !dbg !64
  %3 = load %struct.planet** %bodies.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds %struct.planet* %3, i64 %idxprom, !dbg !64
  store %struct.planet* %arrayidx, %struct.planet** %b, align 8, !dbg !62
  %4 = load i32* %i, align 4, !dbg !66
  %add = add nsw i32 %4, 1, !dbg !66
  store i32 %add, i32* %j, align 4, !dbg !68
  br label %for.cond1, !dbg !68

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32* %j, align 4, !dbg !69
  %6 = load i32* %nbodies.addr, align 4, !dbg !73
  %cmp2 = icmp slt i32 %5, %6, !dbg !74
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !75

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata %struct.planet** %b2, metadata !76, metadata !41), !dbg !78
  %7 = load i32* %j, align 4, !dbg !79
  %idxprom4 = sext i32 %7 to i64, !dbg !80
  %8 = load %struct.planet** %bodies.addr, align 8, !dbg !81
  %arrayidx5 = getelementptr inbounds %struct.planet* %8, i64 %idxprom4, !dbg !80
  store %struct.planet* %arrayidx5, %struct.planet** %b2, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata double* %dx, metadata !82, metadata !41), !dbg !83
  %9 = load %struct.planet** %b, align 8, !dbg !84
  %x = getelementptr inbounds %struct.planet* %9, i32 0, i32 0, !dbg !84
  %10 = load double* %x, align 8, !dbg !84
  %11 = load %struct.planet** %b2, align 8, !dbg !85
  %x6 = getelementptr inbounds %struct.planet* %11, i32 0, i32 0, !dbg !85
  %12 = load double* %x6, align 8, !dbg !85
  %sub = fsub double %10, %12, !dbg !84
  store double %sub, double* %dx, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata double* %dy, metadata !86, metadata !41), !dbg !87
  %13 = load %struct.planet** %b, align 8, !dbg !88
  %y = getelementptr inbounds %struct.planet* %13, i32 0, i32 1, !dbg !88
  %14 = load double* %y, align 8, !dbg !88
  %15 = load %struct.planet** %b2, align 8, !dbg !89
  %y7 = getelementptr inbounds %struct.planet* %15, i32 0, i32 1, !dbg !89
  %16 = load double* %y7, align 8, !dbg !89
  %sub8 = fsub double %14, %16, !dbg !88
  store double %sub8, double* %dy, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata double* %dz, metadata !90, metadata !41), !dbg !91
  %17 = load %struct.planet** %b, align 8, !dbg !92
  %z = getelementptr inbounds %struct.planet* %17, i32 0, i32 2, !dbg !92
  %18 = load double* %z, align 8, !dbg !92
  %19 = load %struct.planet** %b2, align 8, !dbg !93
  %z9 = getelementptr inbounds %struct.planet* %19, i32 0, i32 2, !dbg !93
  %20 = load double* %z9, align 8, !dbg !93
  %sub10 = fsub double %18, %20, !dbg !92
  store double %sub10, double* %dz, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata double* %distance, metadata !94, metadata !41), !dbg !95
  %21 = load double* %dx, align 8, !dbg !96
  %22 = load double* %dx, align 8, !dbg !97
  %mul = fmul double %21, %22, !dbg !96
  %23 = load double* %dy, align 8, !dbg !98
  %24 = load double* %dy, align 8, !dbg !99
  %mul11 = fmul double %23, %24, !dbg !98
  %add12 = fadd double %mul, %mul11, !dbg !96
  %25 = load double* %dz, align 8, !dbg !100
  %26 = load double* %dz, align 8, !dbg !101
  %mul13 = fmul double %25, %26, !dbg !100
  %add14 = fadd double %add12, %mul13, !dbg !96
  %call = call double @sqrt(double %add14) #4, !dbg !102
  store double %call, double* %distance, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata double* %mag, metadata !103, metadata !41), !dbg !104
  %27 = load double* %dt.addr, align 8, !dbg !105
  %28 = load double* %distance, align 8, !dbg !106
  %29 = load double* %distance, align 8, !dbg !107
  %mul15 = fmul double %28, %29, !dbg !106
  %30 = load double* %distance, align 8, !dbg !108
  %mul16 = fmul double %mul15, %30, !dbg !106
  %div = fdiv double %27, %mul16, !dbg !105
  store double %div, double* %mag, align 8, !dbg !104
  %31 = load double* %dx, align 8, !dbg !109
  %32 = load %struct.planet** %b2, align 8, !dbg !110
  %mass = getelementptr inbounds %struct.planet* %32, i32 0, i32 6, !dbg !110
  %33 = load double* %mass, align 8, !dbg !110
  %mul17 = fmul double %31, %33, !dbg !109
  %34 = load double* %mag, align 8, !dbg !111
  %mul18 = fmul double %mul17, %34, !dbg !109
  %35 = load %struct.planet** %b, align 8, !dbg !112
  %vx = getelementptr inbounds %struct.planet* %35, i32 0, i32 3, !dbg !112
  %36 = load double* %vx, align 8, !dbg !112
  %sub19 = fsub double %36, %mul18, !dbg !112
  store double %sub19, double* %vx, align 8, !dbg !112
  %37 = load double* %dy, align 8, !dbg !113
  %38 = load %struct.planet** %b2, align 8, !dbg !114
  %mass20 = getelementptr inbounds %struct.planet* %38, i32 0, i32 6, !dbg !114
  %39 = load double* %mass20, align 8, !dbg !114
  %mul21 = fmul double %37, %39, !dbg !113
  %40 = load double* %mag, align 8, !dbg !115
  %mul22 = fmul double %mul21, %40, !dbg !113
  %41 = load %struct.planet** %b, align 8, !dbg !116
  %vy = getelementptr inbounds %struct.planet* %41, i32 0, i32 4, !dbg !116
  %42 = load double* %vy, align 8, !dbg !116
  %sub23 = fsub double %42, %mul22, !dbg !116
  store double %sub23, double* %vy, align 8, !dbg !116
  %43 = load double* %dz, align 8, !dbg !117
  %44 = load %struct.planet** %b2, align 8, !dbg !118
  %mass24 = getelementptr inbounds %struct.planet* %44, i32 0, i32 6, !dbg !118
  %45 = load double* %mass24, align 8, !dbg !118
  %mul25 = fmul double %43, %45, !dbg !117
  %46 = load double* %mag, align 8, !dbg !119
  %mul26 = fmul double %mul25, %46, !dbg !117
  %47 = load %struct.planet** %b, align 8, !dbg !120
  %vz = getelementptr inbounds %struct.planet* %47, i32 0, i32 5, !dbg !120
  %48 = load double* %vz, align 8, !dbg !120
  %sub27 = fsub double %48, %mul26, !dbg !120
  store double %sub27, double* %vz, align 8, !dbg !120
  %49 = load double* %dx, align 8, !dbg !121
  %50 = load %struct.planet** %b, align 8, !dbg !122
  %mass28 = getelementptr inbounds %struct.planet* %50, i32 0, i32 6, !dbg !122
  %51 = load double* %mass28, align 8, !dbg !122
  %mul29 = fmul double %49, %51, !dbg !121
  %52 = load double* %mag, align 8, !dbg !123
  %mul30 = fmul double %mul29, %52, !dbg !121
  %53 = load %struct.planet** %b2, align 8, !dbg !124
  %vx31 = getelementptr inbounds %struct.planet* %53, i32 0, i32 3, !dbg !124
  %54 = load double* %vx31, align 8, !dbg !124
  %add32 = fadd double %54, %mul30, !dbg !124
  store double %add32, double* %vx31, align 8, !dbg !124
  %55 = load double* %dy, align 8, !dbg !125
  %56 = load %struct.planet** %b, align 8, !dbg !126
  %mass33 = getelementptr inbounds %struct.planet* %56, i32 0, i32 6, !dbg !126
  %57 = load double* %mass33, align 8, !dbg !126
  %mul34 = fmul double %55, %57, !dbg !125
  %58 = load double* %mag, align 8, !dbg !127
  %mul35 = fmul double %mul34, %58, !dbg !125
  %59 = load %struct.planet** %b2, align 8, !dbg !128
  %vy36 = getelementptr inbounds %struct.planet* %59, i32 0, i32 4, !dbg !128
  %60 = load double* %vy36, align 8, !dbg !128
  %add37 = fadd double %60, %mul35, !dbg !128
  store double %add37, double* %vy36, align 8, !dbg !128
  %61 = load double* %dz, align 8, !dbg !129
  %62 = load %struct.planet** %b, align 8, !dbg !130
  %mass38 = getelementptr inbounds %struct.planet* %62, i32 0, i32 6, !dbg !130
  %63 = load double* %mass38, align 8, !dbg !130
  %mul39 = fmul double %61, %63, !dbg !129
  %64 = load double* %mag, align 8, !dbg !131
  %mul40 = fmul double %mul39, %64, !dbg !129
  %65 = load %struct.planet** %b2, align 8, !dbg !132
  %vz41 = getelementptr inbounds %struct.planet* %65, i32 0, i32 5, !dbg !132
  %66 = load double* %vz41, align 8, !dbg !132
  %add42 = fadd double %66, %mul40, !dbg !132
  store double %add42, double* %vz41, align 8, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body3
  %67 = load i32* %j, align 4, !dbg !134
  %inc = add nsw i32 %67, 1, !dbg !134
  store i32 %inc, i32* %j, align 4, !dbg !134
  br label %for.cond1, !dbg !135

for.end:                                          ; preds = %for.cond1
  br label %for.inc43, !dbg !136

for.inc43:                                        ; preds = %for.end
  %68 = load i32* %i, align 4, !dbg !137
  %inc44 = add nsw i32 %68, 1, !dbg !137
  store i32 %inc44, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138

for.end45:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond46, !dbg !139

for.cond46:                                       ; preds = %for.inc64, %for.end45
  %69 = load i32* %i, align 4, !dbg !141
  %70 = load i32* %nbodies.addr, align 4, !dbg !145
  %cmp47 = icmp slt i32 %69, %70, !dbg !146
  br i1 %cmp47, label %for.body48, label %for.end66, !dbg !147

for.body48:                                       ; preds = %for.cond46
  call void @llvm.dbg.declare(metadata %struct.planet** %b49, metadata !148, metadata !41), !dbg !150
  %71 = load i32* %i, align 4, !dbg !151
  %idxprom50 = sext i32 %71 to i64, !dbg !152
  %72 = load %struct.planet** %bodies.addr, align 8, !dbg !153
  %arrayidx51 = getelementptr inbounds %struct.planet* %72, i64 %idxprom50, !dbg !152
  store %struct.planet* %arrayidx51, %struct.planet** %b49, align 8, !dbg !150
  %73 = load double* %dt.addr, align 8, !dbg !154
  %74 = load %struct.planet** %b49, align 8, !dbg !155
  %vx52 = getelementptr inbounds %struct.planet* %74, i32 0, i32 3, !dbg !155
  %75 = load double* %vx52, align 8, !dbg !155
  %mul53 = fmul double %73, %75, !dbg !154
  %76 = load %struct.planet** %b49, align 8, !dbg !156
  %x54 = getelementptr inbounds %struct.planet* %76, i32 0, i32 0, !dbg !156
  %77 = load double* %x54, align 8, !dbg !156
  %add55 = fadd double %77, %mul53, !dbg !156
  store double %add55, double* %x54, align 8, !dbg !156
  %78 = load double* %dt.addr, align 8, !dbg !157
  %79 = load %struct.planet** %b49, align 8, !dbg !158
  %vy56 = getelementptr inbounds %struct.planet* %79, i32 0, i32 4, !dbg !158
  %80 = load double* %vy56, align 8, !dbg !158
  %mul57 = fmul double %78, %80, !dbg !157
  %81 = load %struct.planet** %b49, align 8, !dbg !159
  %y58 = getelementptr inbounds %struct.planet* %81, i32 0, i32 1, !dbg !159
  %82 = load double* %y58, align 8, !dbg !159
  %add59 = fadd double %82, %mul57, !dbg !159
  store double %add59, double* %y58, align 8, !dbg !159
  %83 = load double* %dt.addr, align 8, !dbg !160
  %84 = load %struct.planet** %b49, align 8, !dbg !161
  %vz60 = getelementptr inbounds %struct.planet* %84, i32 0, i32 5, !dbg !161
  %85 = load double* %vz60, align 8, !dbg !161
  %mul61 = fmul double %83, %85, !dbg !160
  %86 = load %struct.planet** %b49, align 8, !dbg !162
  %z62 = getelementptr inbounds %struct.planet* %86, i32 0, i32 2, !dbg !162
  %87 = load double* %z62, align 8, !dbg !162
  %add63 = fadd double %87, %mul61, !dbg !162
  store double %add63, double* %z62, align 8, !dbg !162
  br label %for.inc64, !dbg !163

for.inc64:                                        ; preds = %for.body48
  %88 = load i32* %i, align 4, !dbg !164
  %inc65 = add nsw i32 %88, 1, !dbg !164
  store i32 %inc65, i32* %i, align 4, !dbg !164
  br label %for.cond46, !dbg !165

for.end66:                                        ; preds = %for.cond46
  ret void, !dbg !166
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* %bodies) #0 {
entry:
  %nbodies.addr = alloca i32, align 4
  %bodies.addr = alloca %struct.planet*, align 8
  %e = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  store i32 %nbodies, i32* %nbodies.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nbodies.addr, metadata !167, metadata !41), !dbg !168
  store %struct.planet* %bodies, %struct.planet** %bodies.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.planet** %bodies.addr, metadata !169, metadata !41), !dbg !170
  call void @llvm.dbg.declare(metadata double* %e, metadata !171, metadata !41), !dbg !172
  call void @llvm.dbg.declare(metadata i32* %i, metadata !173, metadata !41), !dbg !174
  call void @llvm.dbg.declare(metadata i32* %j, metadata !175, metadata !41), !dbg !176
  store double 0.000000e+00, double* %e, align 8, !dbg !177
  store i32 0, i32* %i, align 4, !dbg !178
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc30, %entry
  %0 = load i32* %i, align 4, !dbg !180
  %1 = load i32* %nbodies.addr, align 4, !dbg !184
  %cmp = icmp slt i32 %0, %1, !dbg !185
  br i1 %cmp, label %for.body, label %for.end32, !dbg !186

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.planet** %b, metadata !187, metadata !41), !dbg !189
  %2 = load i32* %i, align 4, !dbg !190
  %idxprom = sext i32 %2 to i64, !dbg !191
  %3 = load %struct.planet** %bodies.addr, align 8, !dbg !192
  %arrayidx = getelementptr inbounds %struct.planet* %3, i64 %idxprom, !dbg !191
  store %struct.planet* %arrayidx, %struct.planet** %b, align 8, !dbg !189
  %4 = load %struct.planet** %b, align 8, !dbg !193
  %mass = getelementptr inbounds %struct.planet* %4, i32 0, i32 6, !dbg !193
  %5 = load double* %mass, align 8, !dbg !193
  %mul = fmul double 5.000000e-01, %5, !dbg !194
  %6 = load %struct.planet** %b, align 8, !dbg !195
  %vx = getelementptr inbounds %struct.planet* %6, i32 0, i32 3, !dbg !195
  %7 = load double* %vx, align 8, !dbg !195
  %8 = load %struct.planet** %b, align 8, !dbg !196
  %vx1 = getelementptr inbounds %struct.planet* %8, i32 0, i32 3, !dbg !196
  %9 = load double* %vx1, align 8, !dbg !196
  %mul2 = fmul double %7, %9, !dbg !195
  %10 = load %struct.planet** %b, align 8, !dbg !197
  %vy = getelementptr inbounds %struct.planet* %10, i32 0, i32 4, !dbg !197
  %11 = load double* %vy, align 8, !dbg !197
  %12 = load %struct.planet** %b, align 8, !dbg !198
  %vy3 = getelementptr inbounds %struct.planet* %12, i32 0, i32 4, !dbg !198
  %13 = load double* %vy3, align 8, !dbg !198
  %mul4 = fmul double %11, %13, !dbg !197
  %add = fadd double %mul2, %mul4, !dbg !195
  %14 = load %struct.planet** %b, align 8, !dbg !199
  %vz = getelementptr inbounds %struct.planet* %14, i32 0, i32 5, !dbg !199
  %15 = load double* %vz, align 8, !dbg !199
  %16 = load %struct.planet** %b, align 8, !dbg !200
  %vz5 = getelementptr inbounds %struct.planet* %16, i32 0, i32 5, !dbg !200
  %17 = load double* %vz5, align 8, !dbg !200
  %mul6 = fmul double %15, %17, !dbg !199
  %add7 = fadd double %add, %mul6, !dbg !195
  %mul8 = fmul double %mul, %add7, !dbg !194
  %18 = load double* %e, align 8, !dbg !201
  %add9 = fadd double %18, %mul8, !dbg !201
  store double %add9, double* %e, align 8, !dbg !201
  %19 = load i32* %i, align 4, !dbg !202
  %add10 = add nsw i32 %19, 1, !dbg !202
  store i32 %add10, i32* %j, align 4, !dbg !204
  br label %for.cond11, !dbg !204

for.cond11:                                       ; preds = %for.inc, %for.body
  %20 = load i32* %j, align 4, !dbg !205
  %21 = load i32* %nbodies.addr, align 4, !dbg !209
  %cmp12 = icmp slt i32 %20, %21, !dbg !210
  br i1 %cmp12, label %for.body13, label %for.end, !dbg !211

for.body13:                                       ; preds = %for.cond11
  call void @llvm.dbg.declare(metadata %struct.planet** %b2, metadata !212, metadata !41), !dbg !214
  %22 = load i32* %j, align 4, !dbg !215
  %idxprom14 = sext i32 %22 to i64, !dbg !216
  %23 = load %struct.planet** %bodies.addr, align 8, !dbg !217
  %arrayidx15 = getelementptr inbounds %struct.planet* %23, i64 %idxprom14, !dbg !216
  store %struct.planet* %arrayidx15, %struct.planet** %b2, align 8, !dbg !214
  call void @llvm.dbg.declare(metadata double* %dx, metadata !218, metadata !41), !dbg !219
  %24 = load %struct.planet** %b, align 8, !dbg !220
  %x = getelementptr inbounds %struct.planet* %24, i32 0, i32 0, !dbg !220
  %25 = load double* %x, align 8, !dbg !220
  %26 = load %struct.planet** %b2, align 8, !dbg !221
  %x16 = getelementptr inbounds %struct.planet* %26, i32 0, i32 0, !dbg !221
  %27 = load double* %x16, align 8, !dbg !221
  %sub = fsub double %25, %27, !dbg !220
  store double %sub, double* %dx, align 8, !dbg !219
  call void @llvm.dbg.declare(metadata double* %dy, metadata !222, metadata !41), !dbg !223
  %28 = load %struct.planet** %b, align 8, !dbg !224
  %y = getelementptr inbounds %struct.planet* %28, i32 0, i32 1, !dbg !224
  %29 = load double* %y, align 8, !dbg !224
  %30 = load %struct.planet** %b2, align 8, !dbg !225
  %y17 = getelementptr inbounds %struct.planet* %30, i32 0, i32 1, !dbg !225
  %31 = load double* %y17, align 8, !dbg !225
  %sub18 = fsub double %29, %31, !dbg !224
  store double %sub18, double* %dy, align 8, !dbg !223
  call void @llvm.dbg.declare(metadata double* %dz, metadata !226, metadata !41), !dbg !227
  %32 = load %struct.planet** %b, align 8, !dbg !228
  %z = getelementptr inbounds %struct.planet* %32, i32 0, i32 2, !dbg !228
  %33 = load double* %z, align 8, !dbg !228
  %34 = load %struct.planet** %b2, align 8, !dbg !229
  %z19 = getelementptr inbounds %struct.planet* %34, i32 0, i32 2, !dbg !229
  %35 = load double* %z19, align 8, !dbg !229
  %sub20 = fsub double %33, %35, !dbg !228
  store double %sub20, double* %dz, align 8, !dbg !227
  call void @llvm.dbg.declare(metadata double* %distance, metadata !230, metadata !41), !dbg !231
  %36 = load double* %dx, align 8, !dbg !232
  %37 = load double* %dx, align 8, !dbg !233
  %mul21 = fmul double %36, %37, !dbg !232
  %38 = load double* %dy, align 8, !dbg !234
  %39 = load double* %dy, align 8, !dbg !235
  %mul22 = fmul double %38, %39, !dbg !234
  %add23 = fadd double %mul21, %mul22, !dbg !232
  %40 = load double* %dz, align 8, !dbg !236
  %41 = load double* %dz, align 8, !dbg !237
  %mul24 = fmul double %40, %41, !dbg !236
  %add25 = fadd double %add23, %mul24, !dbg !232
  %call = call double @sqrt(double %add25) #4, !dbg !238
  store double %call, double* %distance, align 8, !dbg !231
  %42 = load %struct.planet** %b, align 8, !dbg !239
  %mass26 = getelementptr inbounds %struct.planet* %42, i32 0, i32 6, !dbg !239
  %43 = load double* %mass26, align 8, !dbg !239
  %44 = load %struct.planet** %b2, align 8, !dbg !240
  %mass27 = getelementptr inbounds %struct.planet* %44, i32 0, i32 6, !dbg !240
  %45 = load double* %mass27, align 8, !dbg !240
  %mul28 = fmul double %43, %45, !dbg !239
  %46 = load double* %distance, align 8, !dbg !241
  %div = fdiv double %mul28, %46, !dbg !242
  %47 = load double* %e, align 8, !dbg !243
  %sub29 = fsub double %47, %div, !dbg !243
  store double %sub29, double* %e, align 8, !dbg !243
  br label %for.inc, !dbg !244

for.inc:                                          ; preds = %for.body13
  %48 = load i32* %j, align 4, !dbg !245
  %inc = add nsw i32 %48, 1, !dbg !245
  store i32 %inc, i32* %j, align 4, !dbg !245
  br label %for.cond11, !dbg !246

for.end:                                          ; preds = %for.cond11
  br label %for.inc30, !dbg !247

for.inc30:                                        ; preds = %for.end
  %49 = load i32* %i, align 4, !dbg !248
  %inc31 = add nsw i32 %49, 1, !dbg !248
  store i32 %inc31, i32* %i, align 4, !dbg !248
  br label %for.cond, !dbg !249

for.end32:                                        ; preds = %for.cond
  %50 = load double* %e, align 8, !dbg !250
  ret double %50, !dbg !251
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* %bodies) #0 {
entry:
  %nbodies.addr = alloca i32, align 4
  %bodies.addr = alloca %struct.planet*, align 8
  %px = alloca double, align 8
  %py = alloca double, align 8
  %pz = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %nbodies, i32* %nbodies.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nbodies.addr, metadata !252, metadata !41), !dbg !253
  store %struct.planet* %bodies, %struct.planet** %bodies.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.planet** %bodies.addr, metadata !254, metadata !41), !dbg !255
  call void @llvm.dbg.declare(metadata double* %px, metadata !256, metadata !41), !dbg !257
  store double 0.000000e+00, double* %px, align 8, !dbg !257
  call void @llvm.dbg.declare(metadata double* %py, metadata !258, metadata !41), !dbg !259
  store double 0.000000e+00, double* %py, align 8, !dbg !259
  call void @llvm.dbg.declare(metadata double* %pz, metadata !260, metadata !41), !dbg !261
  store double 0.000000e+00, double* %pz, align 8, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %i, metadata !262, metadata !41), !dbg !263
  store i32 0, i32* %i, align 4, !dbg !264
  br label %for.cond, !dbg !264

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !266
  %1 = load i32* %nbodies.addr, align 4, !dbg !270
  %cmp = icmp slt i32 %0, %1, !dbg !271
  br i1 %cmp, label %for.body, label %for.end, !dbg !272

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !273
  %idxprom = sext i32 %2 to i64, !dbg !275
  %3 = load %struct.planet** %bodies.addr, align 8, !dbg !275
  %arrayidx = getelementptr inbounds %struct.planet* %3, i64 %idxprom, !dbg !275
  %vx = getelementptr inbounds %struct.planet* %arrayidx, i32 0, i32 3, !dbg !275
  %4 = load double* %vx, align 8, !dbg !275
  %5 = load i32* %i, align 4, !dbg !276
  %idxprom1 = sext i32 %5 to i64, !dbg !277
  %6 = load %struct.planet** %bodies.addr, align 8, !dbg !277
  %arrayidx2 = getelementptr inbounds %struct.planet* %6, i64 %idxprom1, !dbg !277
  %mass = getelementptr inbounds %struct.planet* %arrayidx2, i32 0, i32 6, !dbg !277
  %7 = load double* %mass, align 8, !dbg !277
  %mul = fmul double %4, %7, !dbg !275
  %8 = load double* %px, align 8, !dbg !278
  %add = fadd double %8, %mul, !dbg !278
  store double %add, double* %px, align 8, !dbg !278
  %9 = load i32* %i, align 4, !dbg !279
  %idxprom3 = sext i32 %9 to i64, !dbg !280
  %10 = load %struct.planet** %bodies.addr, align 8, !dbg !280
  %arrayidx4 = getelementptr inbounds %struct.planet* %10, i64 %idxprom3, !dbg !280
  %vy = getelementptr inbounds %struct.planet* %arrayidx4, i32 0, i32 4, !dbg !280
  %11 = load double* %vy, align 8, !dbg !280
  %12 = load i32* %i, align 4, !dbg !281
  %idxprom5 = sext i32 %12 to i64, !dbg !282
  %13 = load %struct.planet** %bodies.addr, align 8, !dbg !282
  %arrayidx6 = getelementptr inbounds %struct.planet* %13, i64 %idxprom5, !dbg !282
  %mass7 = getelementptr inbounds %struct.planet* %arrayidx6, i32 0, i32 6, !dbg !282
  %14 = load double* %mass7, align 8, !dbg !282
  %mul8 = fmul double %11, %14, !dbg !280
  %15 = load double* %py, align 8, !dbg !283
  %add9 = fadd double %15, %mul8, !dbg !283
  store double %add9, double* %py, align 8, !dbg !283
  %16 = load i32* %i, align 4, !dbg !284
  %idxprom10 = sext i32 %16 to i64, !dbg !285
  %17 = load %struct.planet** %bodies.addr, align 8, !dbg !285
  %arrayidx11 = getelementptr inbounds %struct.planet* %17, i64 %idxprom10, !dbg !285
  %vz = getelementptr inbounds %struct.planet* %arrayidx11, i32 0, i32 5, !dbg !285
  %18 = load double* %vz, align 8, !dbg !285
  %19 = load i32* %i, align 4, !dbg !286
  %idxprom12 = sext i32 %19 to i64, !dbg !287
  %20 = load %struct.planet** %bodies.addr, align 8, !dbg !287
  %arrayidx13 = getelementptr inbounds %struct.planet* %20, i64 %idxprom12, !dbg !287
  %mass14 = getelementptr inbounds %struct.planet* %arrayidx13, i32 0, i32 6, !dbg !287
  %21 = load double* %mass14, align 8, !dbg !287
  %mul15 = fmul double %18, %21, !dbg !285
  %22 = load double* %pz, align 8, !dbg !288
  %add16 = fadd double %22, %mul15, !dbg !288
  store double %add16, double* %pz, align 8, !dbg !288
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %for.body
  %23 = load i32* %i, align 4, !dbg !290
  %inc = add nsw i32 %23, 1, !dbg !290
  store i32 %inc, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !291

for.end:                                          ; preds = %for.cond
  %24 = load double* %px, align 8, !dbg !292
  %sub = fsub double -0.000000e+00, %24, !dbg !293
  %div = fdiv double %sub, 0x4043BD3CC9BE45DE, !dbg !293
  %25 = load %struct.planet** %bodies.addr, align 8, !dbg !294
  %arrayidx17 = getelementptr inbounds %struct.planet* %25, i64 0, !dbg !294
  %vx18 = getelementptr inbounds %struct.planet* %arrayidx17, i32 0, i32 3, !dbg !294
  store double %div, double* %vx18, align 8, !dbg !294
  %26 = load double* %py, align 8, !dbg !295
  %sub19 = fsub double -0.000000e+00, %26, !dbg !296
  %div20 = fdiv double %sub19, 0x4043BD3CC9BE45DE, !dbg !296
  %27 = load %struct.planet** %bodies.addr, align 8, !dbg !297
  %arrayidx21 = getelementptr inbounds %struct.planet* %27, i64 0, !dbg !297
  %vy22 = getelementptr inbounds %struct.planet* %arrayidx21, i32 0, i32 4, !dbg !297
  store double %div20, double* %vy22, align 8, !dbg !297
  %28 = load double* %pz, align 8, !dbg !298
  %sub23 = fsub double -0.000000e+00, %28, !dbg !299
  %div24 = fdiv double %sub23, 0x4043BD3CC9BE45DE, !dbg !299
  %29 = load %struct.planet** %bodies.addr, align 8, !dbg !300
  %arrayidx25 = getelementptr inbounds %struct.planet* %29, i64 0, !dbg !300
  %vz26 = getelementptr inbounds %struct.planet* %arrayidx25, i32 0, i32 5, !dbg !300
  store double %div24, double* %vz26, align 8, !dbg !300
  ret void, !dbg !301
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !302, metadata !41), !dbg !303
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !304, metadata !41), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %n, metadata !306, metadata !41), !dbg !307
  store i32 5000000, i32* %n, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %i, metadata !308, metadata !41), !dbg !309
  call void @offset_momentum(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0)), !dbg !310
  %call = call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0)), !dbg !311
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %call), !dbg !312
  store i32 1, i32* %i, align 4, !dbg !313
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !315
  %1 = load i32* %n, align 4, !dbg !319
  %cmp = icmp sle i32 %0, %1, !dbg !320
  br i1 %cmp, label %for.body, label %for.end, !dbg !321

for.body:                                         ; preds = %for.cond
  call void @advance(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0), double 1.000000e-02), !dbg !322
  br label %for.inc, !dbg !322

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4, !dbg !323
  %inc = add nsw i32 %2, 1, !dbg !323
  store i32 %inc, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !324

for.end:                                          ; preds = %for.cond
  %call2 = call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0)), !dbg !325
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %call2), !dbg !326
  ret i32 0, !dbg !327
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !32, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c] [DW_LANG_C99]
!1 = !{!"n-body.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !20, !23, !26}
!4 = !{!"0x2e\00advance\00advance\00\0023\000\001\000\000\00256\000\0024", !1, !5, !6, null, void (i32, %struct.planet*, double)* @advance, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [advance]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{null, !8, !9, !13}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from planet]
!10 = !{!"0x13\00planet\0017\00448\0064\000\000\000", !1, null, null, !11, null, null, null} ; [ DW_TAG_structure_type ] [planet] [line 17, size 448, align 64, offset 0] [def] [from ]
!11 = !{!12, !14, !15, !16, !17, !18, !19}
!12 = !{!"0xd\00x\0018\0064\0064\000\000", !1, !10, !13} ; [ DW_TAG_member ] [x] [line 18, size 64, align 64, offset 0] [from double]
!13 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = !{!"0xd\00y\0018\0064\0064\0064\000", !1, !10, !13} ; [ DW_TAG_member ] [y] [line 18, size 64, align 64, offset 64] [from double]
!15 = !{!"0xd\00z\0018\0064\0064\00128\000", !1, !10, !13} ; [ DW_TAG_member ] [z] [line 18, size 64, align 64, offset 128] [from double]
!16 = !{!"0xd\00vx\0019\0064\0064\00192\000", !1, !10, !13} ; [ DW_TAG_member ] [vx] [line 19, size 64, align 64, offset 192] [from double]
!17 = !{!"0xd\00vy\0019\0064\0064\00256\000", !1, !10, !13} ; [ DW_TAG_member ] [vy] [line 19, size 64, align 64, offset 256] [from double]
!18 = !{!"0xd\00vz\0019\0064\0064\00320\000", !1, !10, !13} ; [ DW_TAG_member ] [vz] [line 19, size 64, align 64, offset 320] [from double]
!19 = !{!"0xd\00mass\0020\0064\0064\00384\000", !1, !10, !13} ; [ DW_TAG_member ] [mass] [line 20, size 64, align 64, offset 384] [from double]
!20 = !{!"0x2e\00energy\00energy\00\0052\000\001\000\000\00256\000\0053", !1, !5, !21, null, double (i32, %struct.planet*)* @energy, null, null, !2} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [energy]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!13, !8, !9}
!23 = !{!"0x2e\00offset_momentum\00offset_momentum\00\0073\000\001\000\000\00256\000\0074", !1, !5, !24, null, void (i32, %struct.planet*)* @offset_momentum, null, null, !2} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [offset_momentum]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !8, !9}
!26 = !{!"0x2e\00main\00main\00\00130\000\001\000\000\00256\000\00131", !1, !5, !27, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 130] [def] [scope 131] [main]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!8, !8, !29}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!31 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!32 = !{!33}
!33 = !{!"0x34\00bodies\00bodies\00\0088\000\001", null, !5, !34, [5 x %struct.planet]* @bodies, null} ; [ DW_TAG_variable ] [bodies] [line 88] [def]
!34 = !{!"0x1\00\000\002240\0064\000\000\000", null, null, !10, !35, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2240, align 64, offset 0] [from planet]
!35 = !{!36}
!36 = !{!"0x21\000\005"}                          ; [ DW_TAG_subrange_type ] [0, 4]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x101\00nbodies\0016777239\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 23]
!41 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!42 = !MDLocation(line: 23, column: 18, scope: !4)
!43 = !{!"0x101\00bodies\0033554455\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 23]
!44 = !MDLocation(line: 23, column: 43, scope: !4)
!45 = !{!"0x101\00dt\0050331671\000", !4, !5, !13} ; [ DW_TAG_arg_variable ] [dt] [line 23]
!46 = !MDLocation(line: 23, column: 58, scope: !4)
!47 = !{!"0x100\00i\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 25]
!48 = !MDLocation(line: 25, column: 7, scope: !4)
!49 = !{!"0x100\00j\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 25]
!50 = !MDLocation(line: 25, column: 10, scope: !4)
!51 = !MDLocation(line: 27, column: 8, scope: !52)
!52 = !{!"0xb\0027\003\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!53 = !MDLocation(line: 27, column: 15, scope: !54)
!54 = !{!"0xb\002", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!55 = !{!"0xb\001", !1, !56}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!56 = !{!"0xb\0027\003\001", !1, !52}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!57 = !MDLocation(line: 27, column: 19, scope: !56)
!58 = !MDLocation(line: 27, column: 15, scope: !56)
!59 = !MDLocation(line: 27, column: 3, scope: !52)
!60 = !{!"0x100\00b\0028\000", !61, !5, !9}       ; [ DW_TAG_auto_variable ] [b] [line 28]
!61 = !{!"0xb\0027\0033\002", !1, !56}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!62 = !MDLocation(line: 28, column: 21, scope: !61)
!63 = !MDLocation(line: 28, column: 34, scope: !61)
!64 = !MDLocation(line: 28, column: 25, scope: !61)
!65 = !MDLocation(line: 28, column: 27, scope: !61)
!66 = !MDLocation(line: 29, column: 14, scope: !67)
!67 = !{!"0xb\0029\005\003", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!68 = !MDLocation(line: 29, column: 10, scope: !67)
!69 = !MDLocation(line: 29, column: 21, scope: !70)
!70 = !{!"0xb\002", !1, !71}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!71 = !{!"0xb\001", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!72 = !{!"0xb\0029\005\004", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!73 = !MDLocation(line: 29, column: 25, scope: !72)
!74 = !MDLocation(line: 29, column: 21, scope: !72)
!75 = !MDLocation(line: 29, column: 5, scope: !67)
!76 = !{!"0x100\00b2\0030\000", !77, !5, !9}      ; [ DW_TAG_auto_variable ] [b2] [line 30]
!77 = !{!"0xb\0029\0039\005", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!78 = !MDLocation(line: 30, column: 23, scope: !77)
!79 = !MDLocation(line: 30, column: 37, scope: !77)
!80 = !MDLocation(line: 30, column: 28, scope: !77)
!81 = !MDLocation(line: 30, column: 30, scope: !77)
!82 = !{!"0x100\00dx\0031\000", !77, !5, !13}     ; [ DW_TAG_auto_variable ] [dx] [line 31]
!83 = !MDLocation(line: 31, column: 14, scope: !77)
!84 = !MDLocation(line: 31, column: 19, scope: !77)
!85 = !MDLocation(line: 31, column: 26, scope: !77)
!86 = !{!"0x100\00dy\0032\000", !77, !5, !13}     ; [ DW_TAG_auto_variable ] [dy] [line 32]
!87 = !MDLocation(line: 32, column: 14, scope: !77)
!88 = !MDLocation(line: 32, column: 19, scope: !77)
!89 = !MDLocation(line: 32, column: 26, scope: !77)
!90 = !{!"0x100\00dz\0033\000", !77, !5, !13}     ; [ DW_TAG_auto_variable ] [dz] [line 33]
!91 = !MDLocation(line: 33, column: 14, scope: !77)
!92 = !MDLocation(line: 33, column: 19, scope: !77)
!93 = !MDLocation(line: 33, column: 26, scope: !77)
!94 = !{!"0x100\00distance\0034\000", !77, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 34]
!95 = !MDLocation(line: 34, column: 14, scope: !77)
!96 = !MDLocation(line: 34, column: 30, scope: !77)
!97 = !MDLocation(line: 34, column: 35, scope: !77)
!98 = !MDLocation(line: 34, column: 40, scope: !77)
!99 = !MDLocation(line: 34, column: 45, scope: !77)
!100 = !MDLocation(line: 34, column: 50, scope: !77)
!101 = !MDLocation(line: 34, column: 55, scope: !77)
!102 = !MDLocation(line: 34, column: 25, scope: !77)
!103 = !{!"0x100\00mag\0035\000", !77, !5, !13}   ; [ DW_TAG_auto_variable ] [mag] [line 35]
!104 = !MDLocation(line: 35, column: 14, scope: !77)
!105 = !MDLocation(line: 35, column: 20, scope: !77)
!106 = !MDLocation(line: 35, column: 26, scope: !77)
!107 = !MDLocation(line: 35, column: 37, scope: !77)
!108 = !MDLocation(line: 35, column: 48, scope: !77)
!109 = !MDLocation(line: 36, column: 16, scope: !77)
!110 = !MDLocation(line: 36, column: 21, scope: !77)
!111 = !MDLocation(line: 36, column: 32, scope: !77)
!112 = !MDLocation(line: 36, column: 7, scope: !77)
!113 = !MDLocation(line: 37, column: 16, scope: !77)
!114 = !MDLocation(line: 37, column: 21, scope: !77)
!115 = !MDLocation(line: 37, column: 32, scope: !77)
!116 = !MDLocation(line: 37, column: 7, scope: !77)
!117 = !MDLocation(line: 38, column: 16, scope: !77)
!118 = !MDLocation(line: 38, column: 21, scope: !77)
!119 = !MDLocation(line: 38, column: 32, scope: !77)
!120 = !MDLocation(line: 38, column: 7, scope: !77)
!121 = !MDLocation(line: 39, column: 17, scope: !77)
!122 = !MDLocation(line: 39, column: 22, scope: !77)
!123 = !MDLocation(line: 39, column: 32, scope: !77)
!124 = !MDLocation(line: 39, column: 7, scope: !77)
!125 = !MDLocation(line: 40, column: 17, scope: !77)
!126 = !MDLocation(line: 40, column: 22, scope: !77)
!127 = !MDLocation(line: 40, column: 32, scope: !77)
!128 = !MDLocation(line: 40, column: 7, scope: !77)
!129 = !MDLocation(line: 41, column: 17, scope: !77)
!130 = !MDLocation(line: 41, column: 22, scope: !77)
!131 = !MDLocation(line: 41, column: 32, scope: !77)
!132 = !MDLocation(line: 41, column: 7, scope: !77)
!133 = !MDLocation(line: 42, column: 5, scope: !77)
!134 = !MDLocation(line: 29, column: 34, scope: !72)
!135 = !MDLocation(line: 29, column: 5, scope: !72)
!136 = !MDLocation(line: 43, column: 3, scope: !61)
!137 = !MDLocation(line: 27, column: 28, scope: !56)
!138 = !MDLocation(line: 27, column: 3, scope: !56)
!139 = !MDLocation(line: 44, column: 8, scope: !140)
!140 = !{!"0xb\0044\003\006", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!141 = !MDLocation(line: 44, column: 15, scope: !142)
!142 = !{!"0xb\002", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!143 = !{!"0xb\001", !1, !144}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!144 = !{!"0xb\0044\003\007", !1, !140}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!145 = !MDLocation(line: 44, column: 19, scope: !144)
!146 = !MDLocation(line: 44, column: 15, scope: !144)
!147 = !MDLocation(line: 44, column: 3, scope: !140)
!148 = !{!"0x100\00b\0045\000", !149, !5, !9}     ; [ DW_TAG_auto_variable ] [b] [line 45]
!149 = !{!"0xb\0044\0033\008", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!150 = !MDLocation(line: 45, column: 21, scope: !149)
!151 = !MDLocation(line: 45, column: 34, scope: !149)
!152 = !MDLocation(line: 45, column: 25, scope: !149)
!153 = !MDLocation(line: 45, column: 27, scope: !149)
!154 = !MDLocation(line: 46, column: 13, scope: !149)
!155 = !MDLocation(line: 46, column: 18, scope: !149)
!156 = !MDLocation(line: 46, column: 5, scope: !149)
!157 = !MDLocation(line: 47, column: 13, scope: !149)
!158 = !MDLocation(line: 47, column: 18, scope: !149)
!159 = !MDLocation(line: 47, column: 5, scope: !149)
!160 = !MDLocation(line: 48, column: 13, scope: !149)
!161 = !MDLocation(line: 48, column: 18, scope: !149)
!162 = !MDLocation(line: 48, column: 5, scope: !149)
!163 = !MDLocation(line: 49, column: 3, scope: !149)
!164 = !MDLocation(line: 44, column: 28, scope: !144)
!165 = !MDLocation(line: 44, column: 3, scope: !144)
!166 = !MDLocation(line: 50, column: 1, scope: !4)
!167 = !{!"0x101\00nbodies\0016777268\000", !20, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!168 = !MDLocation(line: 52, column: 19, scope: !20)
!169 = !{!"0x101\00bodies\0033554484\000", !20, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!170 = !MDLocation(line: 52, column: 44, scope: !20)
!171 = !{!"0x100\00e\0054\000", !20, !5, !13}     ; [ DW_TAG_auto_variable ] [e] [line 54]
!172 = !MDLocation(line: 54, column: 10, scope: !20)
!173 = !{!"0x100\00i\0055\000", !20, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 55]
!174 = !MDLocation(line: 55, column: 7, scope: !20)
!175 = !{!"0x100\00j\0055\000", !20, !5, !8}      ; [ DW_TAG_auto_variable ] [j] [line 55]
!176 = !MDLocation(line: 55, column: 10, scope: !20)
!177 = !MDLocation(line: 57, column: 3, scope: !20)
!178 = !MDLocation(line: 58, column: 8, scope: !179)
!179 = !{!"0xb\0058\003\009", !1, !20}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!180 = !MDLocation(line: 58, column: 15, scope: !181)
!181 = !{!"0xb\002", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!182 = !{!"0xb\001", !1, !183}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!183 = !{!"0xb\0058\003\0010", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!184 = !MDLocation(line: 58, column: 19, scope: !183)
!185 = !MDLocation(line: 58, column: 15, scope: !183)
!186 = !MDLocation(line: 58, column: 3, scope: !179)
!187 = !{!"0x100\00b\0059\000", !188, !5, !9}     ; [ DW_TAG_auto_variable ] [b] [line 59]
!188 = !{!"0xb\0058\0033\0011", !1, !183}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!189 = !MDLocation(line: 59, column: 21, scope: !188)
!190 = !MDLocation(line: 59, column: 34, scope: !188)
!191 = !MDLocation(line: 59, column: 25, scope: !188)
!192 = !MDLocation(line: 59, column: 27, scope: !188)
!193 = !MDLocation(line: 60, column: 16, scope: !188)
!194 = !MDLocation(line: 60, column: 10, scope: !188)
!195 = !MDLocation(line: 60, column: 27, scope: !188)
!196 = !MDLocation(line: 60, column: 35, scope: !188)
!197 = !MDLocation(line: 60, column: 43, scope: !188)
!198 = !MDLocation(line: 60, column: 51, scope: !188)
!199 = !MDLocation(line: 60, column: 59, scope: !188)
!200 = !MDLocation(line: 60, column: 67, scope: !188)
!201 = !MDLocation(line: 60, column: 5, scope: !188)
!202 = !MDLocation(line: 61, column: 14, scope: !203)
!203 = !{!"0xb\0061\005\0012", !1, !188}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!204 = !MDLocation(line: 61, column: 10, scope: !203)
!205 = !MDLocation(line: 61, column: 21, scope: !206)
!206 = !{!"0xb\002", !1, !207}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!207 = !{!"0xb\001", !1, !208}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!208 = !{!"0xb\0061\005\0013", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!209 = !MDLocation(line: 61, column: 25, scope: !208)
!210 = !MDLocation(line: 61, column: 21, scope: !208)
!211 = !MDLocation(line: 61, column: 5, scope: !203)
!212 = !{!"0x100\00b2\0062\000", !213, !5, !9}    ; [ DW_TAG_auto_variable ] [b2] [line 62]
!213 = !{!"0xb\0061\0039\0014", !1, !208}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!214 = !MDLocation(line: 62, column: 23, scope: !213)
!215 = !MDLocation(line: 62, column: 37, scope: !213)
!216 = !MDLocation(line: 62, column: 28, scope: !213)
!217 = !MDLocation(line: 62, column: 30, scope: !213)
!218 = !{!"0x100\00dx\0063\000", !213, !5, !13}   ; [ DW_TAG_auto_variable ] [dx] [line 63]
!219 = !MDLocation(line: 63, column: 14, scope: !213)
!220 = !MDLocation(line: 63, column: 19, scope: !213)
!221 = !MDLocation(line: 63, column: 26, scope: !213)
!222 = !{!"0x100\00dy\0064\000", !213, !5, !13}   ; [ DW_TAG_auto_variable ] [dy] [line 64]
!223 = !MDLocation(line: 64, column: 14, scope: !213)
!224 = !MDLocation(line: 64, column: 19, scope: !213)
!225 = !MDLocation(line: 64, column: 26, scope: !213)
!226 = !{!"0x100\00dz\0065\000", !213, !5, !13}   ; [ DW_TAG_auto_variable ] [dz] [line 65]
!227 = !MDLocation(line: 65, column: 14, scope: !213)
!228 = !MDLocation(line: 65, column: 19, scope: !213)
!229 = !MDLocation(line: 65, column: 26, scope: !213)
!230 = !{!"0x100\00distance\0066\000", !213, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!231 = !MDLocation(line: 66, column: 14, scope: !213)
!232 = !MDLocation(line: 66, column: 30, scope: !213)
!233 = !MDLocation(line: 66, column: 35, scope: !213)
!234 = !MDLocation(line: 66, column: 40, scope: !213)
!235 = !MDLocation(line: 66, column: 45, scope: !213)
!236 = !MDLocation(line: 66, column: 50, scope: !213)
!237 = !MDLocation(line: 66, column: 55, scope: !213)
!238 = !MDLocation(line: 66, column: 25, scope: !213)
!239 = !MDLocation(line: 67, column: 13, scope: !213)
!240 = !MDLocation(line: 67, column: 23, scope: !213)
!241 = !MDLocation(line: 67, column: 35, scope: !213)
!242 = !MDLocation(line: 67, column: 12, scope: !213)
!243 = !MDLocation(line: 67, column: 7, scope: !213)
!244 = !MDLocation(line: 68, column: 5, scope: !213)
!245 = !MDLocation(line: 61, column: 34, scope: !208)
!246 = !MDLocation(line: 61, column: 5, scope: !208)
!247 = !MDLocation(line: 69, column: 3, scope: !188)
!248 = !MDLocation(line: 58, column: 28, scope: !183)
!249 = !MDLocation(line: 58, column: 3, scope: !183)
!250 = !MDLocation(line: 70, column: 10, scope: !20)
!251 = !MDLocation(line: 70, column: 3, scope: !20)
!252 = !{!"0x101\00nbodies\0016777289\000", !23, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!253 = !MDLocation(line: 73, column: 26, scope: !23)
!254 = !{!"0x101\00bodies\0033554505\000", !23, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!255 = !MDLocation(line: 73, column: 51, scope: !23)
!256 = !{!"0x100\00px\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [px] [line 75]
!257 = !MDLocation(line: 75, column: 10, scope: !23)
!258 = !{!"0x100\00py\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [py] [line 75]
!259 = !MDLocation(line: 75, column: 20, scope: !23)
!260 = !{!"0x100\00pz\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [pz] [line 75]
!261 = !MDLocation(line: 75, column: 30, scope: !23)
!262 = !{!"0x100\00i\0076\000", !23, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 76]
!263 = !MDLocation(line: 76, column: 7, scope: !23)
!264 = !MDLocation(line: 77, column: 8, scope: !265)
!265 = !{!"0xb\0077\003\0015", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!266 = !MDLocation(line: 77, column: 15, scope: !267)
!267 = !{!"0xb\002", !1, !268}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!268 = !{!"0xb\001", !1, !269}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!269 = !{!"0xb\0077\003\0016", !1, !265}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!270 = !MDLocation(line: 77, column: 19, scope: !269)
!271 = !MDLocation(line: 77, column: 15, scope: !269)
!272 = !MDLocation(line: 77, column: 3, scope: !265)
!273 = !MDLocation(line: 78, column: 18, scope: !274)
!274 = !{!"0xb\0077\0033\0017", !1, !269}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!275 = !MDLocation(line: 78, column: 11, scope: !274)
!276 = !MDLocation(line: 78, column: 33, scope: !274)
!277 = !MDLocation(line: 78, column: 26, scope: !274)
!278 = !MDLocation(line: 78, column: 5, scope: !274)
!279 = !MDLocation(line: 79, column: 18, scope: !274)
!280 = !MDLocation(line: 79, column: 11, scope: !274)
!281 = !MDLocation(line: 79, column: 33, scope: !274)
!282 = !MDLocation(line: 79, column: 26, scope: !274)
!283 = !MDLocation(line: 79, column: 5, scope: !274)
!284 = !MDLocation(line: 80, column: 18, scope: !274)
!285 = !MDLocation(line: 80, column: 11, scope: !274)
!286 = !MDLocation(line: 80, column: 33, scope: !274)
!287 = !MDLocation(line: 80, column: 26, scope: !274)
!288 = !MDLocation(line: 80, column: 5, scope: !274)
!289 = !MDLocation(line: 81, column: 3, scope: !274)
!290 = !MDLocation(line: 77, column: 28, scope: !269)
!291 = !MDLocation(line: 77, column: 3, scope: !269)
!292 = !MDLocation(line: 82, column: 20, scope: !23)
!293 = !MDLocation(line: 82, column: 18, scope: !23)
!294 = !MDLocation(line: 82, column: 3, scope: !23)
!295 = !MDLocation(line: 83, column: 20, scope: !23)
!296 = !MDLocation(line: 83, column: 18, scope: !23)
!297 = !MDLocation(line: 83, column: 3, scope: !23)
!298 = !MDLocation(line: 84, column: 20, scope: !23)
!299 = !MDLocation(line: 84, column: 18, scope: !23)
!300 = !MDLocation(line: 84, column: 3, scope: !23)
!301 = !MDLocation(line: 85, column: 1, scope: !23)
!302 = !{!"0x101\00argc\0016777346\000", !26, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 130]
!303 = !MDLocation(line: 130, column: 14, scope: !26)
!304 = !{!"0x101\00argv\0033554562\000", !26, !5, !29} ; [ DW_TAG_arg_variable ] [argv] [line 130]
!305 = !MDLocation(line: 130, column: 28, scope: !26)
!306 = !{!"0x100\00n\00132\000", !26, !5, !8}     ; [ DW_TAG_auto_variable ] [n] [line 132]
!307 = !MDLocation(line: 132, column: 7, scope: !26)
!308 = !{!"0x100\00i\00133\000", !26, !5, !8}     ; [ DW_TAG_auto_variable ] [i] [line 133]
!309 = !MDLocation(line: 133, column: 7, scope: !26)
!310 = !MDLocation(line: 135, column: 3, scope: !26)
!311 = !MDLocation(line: 136, column: 21, scope: !26)
!312 = !MDLocation(line: 136, column: 3, scope: !26)
!313 = !MDLocation(line: 137, column: 8, scope: !314)
!314 = !{!"0xb\00137\003\0018", !1, !26}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!315 = !MDLocation(line: 137, column: 15, scope: !316)
!316 = !{!"0xb\002", !1, !317}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!317 = !{!"0xb\001", !1, !318}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!318 = !{!"0xb\00137\003\0019", !1, !314}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!319 = !MDLocation(line: 137, column: 20, scope: !318)
!320 = !MDLocation(line: 137, column: 15, scope: !318)
!321 = !MDLocation(line: 137, column: 3, scope: !314)
!322 = !MDLocation(line: 138, column: 5, scope: !318)
!323 = !MDLocation(line: 137, column: 23, scope: !318)
!324 = !MDLocation(line: 137, column: 3, scope: !318)
!325 = !MDLocation(line: 139, column: 21, scope: !26)
!326 = !MDLocation(line: 139, column: 3, scope: !26)
!327 = !MDLocation(line: 140, column: 3, scope: !26)
