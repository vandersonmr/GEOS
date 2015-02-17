; ModuleID = 'salsa20.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ptr = global i32 0, align 4
@outbuf = common global [16 x i32] zeroinitializer, align 16
@STATE = common global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [15 x i8] c"got:       %x\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"should be: %x\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @salsa20(i32* nocapture %out, i32* nocapture readonly %in) #0 {
entry:
  %in385 = bitcast i32* %in to i8*
  %x = alloca [16 x i32], align 16
  %0 = bitcast [16 x i32]* %x to i8*
  tail call void @llvm.dbg.value(metadata i32* %out, i64 0, metadata !16, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata i32* %in, i64 0, metadata !17, metadata !42), !dbg !44
  call void @llvm.lifetime.start(i64 64, i8* %0) #2, !dbg !45
  tail call void @llvm.dbg.declare(metadata [16 x i32]* %x, metadata !19, metadata !42), !dbg !46
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !42), !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %in385, i64 64, i32 4, i1 false), !dbg !48
  %arrayidx7 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 12, !dbg !51
  %arrayidx11 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 4, !dbg !55
  %arrayidx21 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 8, !dbg !56
  %arrayidx89 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 10, !dbg !57
  %arrayidx90 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 6, !dbg !57
  %arrayidx98 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 14, !dbg !58
  %arrayidx109 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 2, !dbg !59
  %1 = bitcast [16 x i32]* %x to i64*, !dbg !60
  %arrayidx6.promoted = load i64* %1, align 16, !dbg !60
  %2 = trunc i64 %arrayidx6.promoted to i32, !dbg !60
  %3 = bitcast i32* %arrayidx7 to i64*, !dbg !61
  %arrayidx7.promoted = load i64* %3, align 16, !dbg !61
  %4 = trunc i64 %arrayidx7.promoted to i32, !dbg !61
  %5 = bitcast i32* %arrayidx11 to i64*, !dbg !62
  %arrayidx11.promoted = load i64* %5, align 16, !dbg !62
  %6 = trunc i64 %arrayidx11.promoted to i32, !dbg !62
  %7 = bitcast i32* %arrayidx21 to i64*, !dbg !63
  %arrayidx21.promoted = load i64* %7, align 16, !dbg !63
  %8 = trunc i64 %arrayidx21.promoted to i32, !dbg !63
  %9 = lshr i64 %arrayidx11.promoted, 32
  %10 = trunc i64 %9 to i32
  %11 = lshr i64 %arrayidx6.promoted, 32
  %12 = trunc i64 %11 to i32
  %13 = lshr i64 %arrayidx21.promoted, 32
  %14 = trunc i64 %13 to i32
  %15 = lshr i64 %arrayidx7.promoted, 32
  %16 = trunc i64 %15 to i32
  %17 = bitcast i32* %arrayidx89 to i64*, !dbg !64
  %arrayidx89.promoted = load i64* %17, align 8, !dbg !64
  %18 = trunc i64 %arrayidx89.promoted to i32, !dbg !64
  %19 = bitcast i32* %arrayidx90 to i64*, !dbg !65
  %arrayidx90.promoted = load i64* %19, align 8, !dbg !65
  %20 = trunc i64 %arrayidx90.promoted to i32, !dbg !65
  %21 = bitcast i32* %arrayidx98 to i64*, !dbg !66
  %arrayidx98.promoted = load i64* %21, align 8, !dbg !66
  %22 = trunc i64 %arrayidx98.promoted to i32, !dbg !66
  %23 = bitcast i32* %arrayidx109 to i64*, !dbg !67
  %arrayidx109.promoted = load i64* %23, align 8, !dbg !67
  %24 = trunc i64 %arrayidx109.promoted to i32, !dbg !67
  %25 = lshr i64 %arrayidx98.promoted, 32
  %26 = trunc i64 %25 to i32
  %27 = lshr i64 %arrayidx89.promoted, 32
  %28 = trunc i64 %27 to i32
  %29 = lshr i64 %arrayidx109.promoted, 32
  %30 = trunc i64 %29 to i32
  %31 = lshr i64 %arrayidx90.promoted, 32
  %32 = trunc i64 %31 to i32
  br label %for.body5, !dbg !68

for.cond355.preheader:                            ; preds = %for.body5
  %xor352.lcssa = phi i32 [ %xor352, %for.body5 ]
  %xor341.lcssa = phi i32 [ %xor341, %for.body5 ]
  %xor330.lcssa = phi i32 [ %xor330, %for.body5 ]
  %xor319.lcssa = phi i32 [ %xor319, %for.body5 ]
  %xor308.lcssa = phi i32 [ %xor308, %for.body5 ]
  %xor297.lcssa = phi i32 [ %xor297, %for.body5 ]
  %xor286.lcssa = phi i32 [ %xor286, %for.body5 ]
  %xor275.lcssa = phi i32 [ %xor275, %for.body5 ]
  %xor264.lcssa = phi i32 [ %xor264, %for.body5 ]
  %xor253.lcssa = phi i32 [ %xor253, %for.body5 ]
  %xor242.lcssa = phi i32 [ %xor242, %for.body5 ]
  %xor231.lcssa = phi i32 [ %xor231, %for.body5 ]
  %xor220.lcssa = phi i32 [ %xor220, %for.body5 ]
  %xor209.lcssa = phi i32 [ %xor209, %for.body5 ]
  %xor198.lcssa = phi i32 [ %xor198, %for.body5 ]
  %xor187.lcssa = phi i32 [ %xor187, %for.body5 ]
  %33 = load i32* %in, align 4, !dbg !69, !tbaa !72
  %add362 = add i32 %33, %xor220.lcssa, !dbg !76
  store i32 %add362, i32* %out, align 4, !dbg !77, !tbaa !72
  %arrayidx361.1 = getelementptr inbounds i32* %in, i64 1, !dbg !69
  %34 = load i32* %arrayidx361.1, align 4, !dbg !69, !tbaa !72
  %add362.1 = add i32 %34, %xor187.lcssa, !dbg !76
  %arrayidx364.1 = getelementptr inbounds i32* %out, i64 1, !dbg !77
  store i32 %add362.1, i32* %arrayidx364.1, align 4, !dbg !77, !tbaa !72
  %arrayidx361.2 = getelementptr inbounds i32* %in, i64 2, !dbg !69
  %35 = load i32* %arrayidx361.2, align 4, !dbg !69, !tbaa !72
  %add362.2 = add i32 %35, %xor198.lcssa, !dbg !76
  %arrayidx364.2 = getelementptr inbounds i32* %out, i64 2, !dbg !77
  store i32 %add362.2, i32* %arrayidx364.2, align 4, !dbg !77, !tbaa !72
  %arrayidx361.3 = getelementptr inbounds i32* %in, i64 3, !dbg !69
  %36 = load i32* %arrayidx361.3, align 4, !dbg !69, !tbaa !72
  %add362.3 = add i32 %36, %xor209.lcssa, !dbg !76
  %arrayidx364.3 = getelementptr inbounds i32* %out, i64 3, !dbg !77
  store i32 %add362.3, i32* %arrayidx364.3, align 4, !dbg !77, !tbaa !72
  %arrayidx361.4 = getelementptr inbounds i32* %in, i64 4, !dbg !69
  %37 = load i32* %arrayidx361.4, align 4, !dbg !69, !tbaa !72
  %add362.4 = add i32 %37, %xor253.lcssa, !dbg !76
  %arrayidx364.4 = getelementptr inbounds i32* %out, i64 4, !dbg !77
  store i32 %add362.4, i32* %arrayidx364.4, align 4, !dbg !77, !tbaa !72
  %arrayidx361.5 = getelementptr inbounds i32* %in, i64 5, !dbg !69
  %38 = load i32* %arrayidx361.5, align 4, !dbg !69, !tbaa !72
  %add362.5 = add i32 %38, %xor264.lcssa, !dbg !76
  %arrayidx364.5 = getelementptr inbounds i32* %out, i64 5, !dbg !77
  store i32 %add362.5, i32* %arrayidx364.5, align 4, !dbg !77, !tbaa !72
  %arrayidx361.6 = getelementptr inbounds i32* %in, i64 6, !dbg !69
  %39 = load i32* %arrayidx361.6, align 4, !dbg !69, !tbaa !72
  %add362.6 = add i32 %39, %xor231.lcssa, !dbg !76
  %arrayidx364.6 = getelementptr inbounds i32* %out, i64 6, !dbg !77
  store i32 %add362.6, i32* %arrayidx364.6, align 4, !dbg !77, !tbaa !72
  %arrayidx361.7 = getelementptr inbounds i32* %in, i64 7, !dbg !69
  %40 = load i32* %arrayidx361.7, align 4, !dbg !69, !tbaa !72
  %add362.7 = add i32 %40, %xor242.lcssa, !dbg !76
  %arrayidx364.7 = getelementptr inbounds i32* %out, i64 7, !dbg !77
  store i32 %add362.7, i32* %arrayidx364.7, align 4, !dbg !77, !tbaa !72
  %arrayidx361.8 = getelementptr inbounds i32* %in, i64 8, !dbg !69
  %41 = load i32* %arrayidx361.8, align 4, !dbg !69, !tbaa !72
  %add362.8 = add i32 %41, %xor286.lcssa, !dbg !76
  %arrayidx364.8 = getelementptr inbounds i32* %out, i64 8, !dbg !77
  store i32 %add362.8, i32* %arrayidx364.8, align 4, !dbg !77, !tbaa !72
  %arrayidx361.9 = getelementptr inbounds i32* %in, i64 9, !dbg !69
  %42 = load i32* %arrayidx361.9, align 4, !dbg !69, !tbaa !72
  %add362.9 = add i32 %42, %xor297.lcssa, !dbg !76
  %arrayidx364.9 = getelementptr inbounds i32* %out, i64 9, !dbg !77
  store i32 %add362.9, i32* %arrayidx364.9, align 4, !dbg !77, !tbaa !72
  %arrayidx361.10 = getelementptr inbounds i32* %in, i64 10, !dbg !69
  %43 = load i32* %arrayidx361.10, align 4, !dbg !69, !tbaa !72
  %add362.10 = add i32 %43, %xor308.lcssa, !dbg !76
  %arrayidx364.10 = getelementptr inbounds i32* %out, i64 10, !dbg !77
  store i32 %add362.10, i32* %arrayidx364.10, align 4, !dbg !77, !tbaa !72
  %arrayidx361.11 = getelementptr inbounds i32* %in, i64 11, !dbg !69
  %44 = load i32* %arrayidx361.11, align 4, !dbg !69, !tbaa !72
  %add362.11 = add i32 %44, %xor275.lcssa, !dbg !76
  %arrayidx364.11 = getelementptr inbounds i32* %out, i64 11, !dbg !77
  store i32 %add362.11, i32* %arrayidx364.11, align 4, !dbg !77, !tbaa !72
  %arrayidx361.12 = getelementptr inbounds i32* %in, i64 12, !dbg !69
  %45 = load i32* %arrayidx361.12, align 4, !dbg !69, !tbaa !72
  %add362.12 = add i32 %45, %xor319.lcssa, !dbg !76
  %arrayidx364.12 = getelementptr inbounds i32* %out, i64 12, !dbg !77
  store i32 %add362.12, i32* %arrayidx364.12, align 4, !dbg !77, !tbaa !72
  %arrayidx361.13 = getelementptr inbounds i32* %in, i64 13, !dbg !69
  %46 = load i32* %arrayidx361.13, align 4, !dbg !69, !tbaa !72
  %add362.13 = add i32 %46, %xor330.lcssa, !dbg !76
  %arrayidx364.13 = getelementptr inbounds i32* %out, i64 13, !dbg !77
  store i32 %add362.13, i32* %arrayidx364.13, align 4, !dbg !77, !tbaa !72
  %arrayidx361.14 = getelementptr inbounds i32* %in, i64 14, !dbg !69
  %47 = load i32* %arrayidx361.14, align 4, !dbg !69, !tbaa !72
  %add362.14 = add i32 %47, %xor341.lcssa, !dbg !76
  %arrayidx364.14 = getelementptr inbounds i32* %out, i64 14, !dbg !77
  store i32 %add362.14, i32* %arrayidx364.14, align 4, !dbg !77, !tbaa !72
  %arrayidx361.15 = getelementptr inbounds i32* %in, i64 15, !dbg !69
  %48 = load i32* %arrayidx361.15, align 4, !dbg !69, !tbaa !72
  %add362.15 = add i32 %48, %xor352.lcssa, !dbg !76
  %arrayidx364.15 = getelementptr inbounds i32* %out, i64 15, !dbg !77
  store i32 %add362.15, i32* %arrayidx364.15, align 4, !dbg !77, !tbaa !72
  call void @llvm.lifetime.end(i64 64, i8* %0) #2, !dbg !78
  ret void, !dbg !78

for.body5:                                        ; preds = %entry, %for.body5
  %49 = phi i32 [ %32, %entry ], [ %xor242, %for.body5 ], !dbg !51
  %50 = phi i32 [ %30, %entry ], [ %xor209, %for.body5 ], !dbg !51
  %51 = phi i32 [ %28, %entry ], [ %xor275, %for.body5 ], !dbg !51
  %52 = phi i32 [ %26, %entry ], [ %xor352, %for.body5 ], !dbg !51
  %53 = phi i32 [ %24, %entry ], [ %xor198, %for.body5 ], !dbg !51
  %54 = phi i32 [ %22, %entry ], [ %xor341, %for.body5 ], !dbg !51
  %55 = phi i32 [ %20, %entry ], [ %xor231, %for.body5 ], !dbg !51
  %56 = phi i32 [ %18, %entry ], [ %xor308, %for.body5 ], !dbg !51
  %57 = phi i32 [ %16, %entry ], [ %xor330, %for.body5 ], !dbg !51
  %58 = phi i32 [ %14, %entry ], [ %xor297, %for.body5 ], !dbg !51
  %59 = phi i32 [ %12, %entry ], [ %xor187, %for.body5 ], !dbg !51
  %60 = phi i32 [ %10, %entry ], [ %xor264, %for.body5 ], !dbg !51
  %61 = phi i32 [ %8, %entry ], [ %xor286, %for.body5 ], !dbg !51
  %62 = phi i32 [ %6, %entry ], [ %xor253, %for.body5 ], !dbg !51
  %63 = phi i32 [ %4, %entry ], [ %xor319, %for.body5 ], !dbg !51
  %64 = phi i32 [ %2, %entry ], [ %xor220, %for.body5 ], !dbg !51
  %i.1380 = phi i32 [ 20, %entry ], [ %sub, %for.body5 ]
  %add = add i32 %63, %64, !dbg !51
  %shl = shl i32 %add, 7, !dbg !51
  %shr = lshr i32 %add, 25, !dbg !51
  %or = or i32 %shl, %shr, !dbg !51
  %xor = xor i32 %or, %62, !dbg !55
  %add14 = add i32 %xor, %64, !dbg !79
  %shl15 = shl i32 %add14, 9, !dbg !79
  %shr19 = lshr i32 %add14, 23, !dbg !79
  %or20 = or i32 %shl15, %shr19, !dbg !79
  %xor22 = xor i32 %or20, %61, !dbg !56
  %add25 = add i32 %xor22, %xor, !dbg !80
  %shl26 = shl i32 %add25, 13, !dbg !80
  %shr30 = lshr i32 %add25, 19, !dbg !80
  %or31 = or i32 %shl26, %shr30, !dbg !80
  %xor33 = xor i32 %or31, %63, !dbg !81
  %add36 = add i32 %xor33, %xor22, !dbg !82
  %shl37 = shl i32 %add36, 18, !dbg !82
  %shr41 = lshr i32 %add36, 14, !dbg !82
  %or42 = or i32 %shl37, %shr41, !dbg !82
  %xor44 = xor i32 %or42, %64, !dbg !83
  %add47 = add i32 %59, %60, !dbg !84
  %shl48 = shl i32 %add47, 7, !dbg !84
  %shr52 = lshr i32 %add47, 25, !dbg !84
  %or53 = or i32 %shl48, %shr52, !dbg !84
  %xor55 = xor i32 %or53, %58, !dbg !85
  %add58 = add i32 %xor55, %60, !dbg !86
  %shl59 = shl i32 %add58, 9, !dbg !86
  %shr63 = lshr i32 %add58, 23, !dbg !86
  %or64 = or i32 %shl59, %shr63, !dbg !86
  %xor66 = xor i32 %or64, %57, !dbg !87
  %add69 = add i32 %xor66, %xor55, !dbg !88
  %shl70 = shl i32 %add69, 13, !dbg !88
  %shr74 = lshr i32 %add69, 19, !dbg !88
  %or75 = or i32 %shl70, %shr74, !dbg !88
  %xor77 = xor i32 %or75, %59, !dbg !89
  %add80 = add i32 %xor77, %xor66, !dbg !90
  %shl81 = shl i32 %add80, 18, !dbg !90
  %shr85 = lshr i32 %add80, 14, !dbg !90
  %or86 = or i32 %shl81, %shr85, !dbg !90
  %xor88 = xor i32 %or86, %60, !dbg !91
  %add91 = add i32 %55, %56, !dbg !57
  %shl92 = shl i32 %add91, 7, !dbg !57
  %shr96 = lshr i32 %add91, 25, !dbg !57
  %or97 = or i32 %shl92, %shr96, !dbg !57
  %xor99 = xor i32 %or97, %54, !dbg !58
  %add102 = add i32 %xor99, %56, !dbg !92
  %shl103 = shl i32 %add102, 9, !dbg !92
  %shr107 = lshr i32 %add102, 23, !dbg !92
  %or108 = or i32 %shl103, %shr107, !dbg !92
  %xor110 = xor i32 %or108, %53, !dbg !59
  %add113 = add i32 %xor110, %xor99, !dbg !93
  %shl114 = shl i32 %add113, 13, !dbg !93
  %shr118 = lshr i32 %add113, 19, !dbg !93
  %or119 = or i32 %shl114, %shr118, !dbg !93
  %xor121 = xor i32 %or119, %55, !dbg !94
  %add124 = add i32 %xor121, %xor110, !dbg !95
  %shl125 = shl i32 %add124, 18, !dbg !95
  %shr129 = lshr i32 %add124, 14, !dbg !95
  %or130 = or i32 %shl125, %shr129, !dbg !95
  %xor132 = xor i32 %or130, %56, !dbg !96
  %add135 = add i32 %51, %52, !dbg !97
  %shl136 = shl i32 %add135, 7, !dbg !97
  %shr140 = lshr i32 %add135, 25, !dbg !97
  %or141 = or i32 %shl136, %shr140, !dbg !97
  %xor143 = xor i32 %or141, %50, !dbg !98
  %add146 = add i32 %xor143, %52, !dbg !99
  %shl147 = shl i32 %add146, 9, !dbg !99
  %shr151 = lshr i32 %add146, 23, !dbg !99
  %or152 = or i32 %shl147, %shr151, !dbg !99
  %xor154 = xor i32 %or152, %49, !dbg !100
  %add157 = add i32 %xor154, %xor143, !dbg !101
  %shl158 = shl i32 %add157, 13, !dbg !101
  %shr162 = lshr i32 %add157, 19, !dbg !101
  %or163 = or i32 %shl158, %shr162, !dbg !101
  %xor165 = xor i32 %or163, %51, !dbg !102
  %add168 = add i32 %xor165, %xor154, !dbg !103
  %shl169 = shl i32 %add168, 18, !dbg !103
  %shr173 = lshr i32 %add168, 14, !dbg !103
  %or174 = or i32 %shl169, %shr173, !dbg !103
  %xor176 = xor i32 %or174, %52, !dbg !104
  %add179 = add i32 %xor143, %xor44, !dbg !105
  %shl180 = shl i32 %add179, 7, !dbg !105
  %shr184 = lshr i32 %add179, 25, !dbg !105
  %or185 = or i32 %shl180, %shr184, !dbg !105
  %xor187 = xor i32 %or185, %xor77, !dbg !106
  %add190 = add i32 %xor187, %xor44, !dbg !107
  %shl191 = shl i32 %add190, 9, !dbg !107
  %shr195 = lshr i32 %add190, 23, !dbg !107
  %or196 = or i32 %shl191, %shr195, !dbg !107
  %xor198 = xor i32 %or196, %xor110, !dbg !108
  %add201 = add i32 %xor198, %xor187, !dbg !109
  %shl202 = shl i32 %add201, 13, !dbg !109
  %shr206 = lshr i32 %add201, 19, !dbg !109
  %or207 = or i32 %shl202, %shr206, !dbg !109
  %xor209 = xor i32 %or207, %xor143, !dbg !110
  %add212 = add i32 %xor209, %xor198, !dbg !67
  %shl213 = shl i32 %add212, 18, !dbg !67
  %shr217 = lshr i32 %add212, 14, !dbg !67
  %or218 = or i32 %shl213, %shr217, !dbg !67
  %xor220 = xor i32 %or218, %xor44, !dbg !60
  %add223 = add i32 %xor, %xor88, !dbg !111
  %shl224 = shl i32 %add223, 7, !dbg !111
  %shr228 = lshr i32 %add223, 25, !dbg !111
  %or229 = or i32 %shl224, %shr228, !dbg !111
  %xor231 = xor i32 %or229, %xor121, !dbg !112
  %add234 = add i32 %xor231, %xor88, !dbg !113
  %shl235 = shl i32 %add234, 9, !dbg !113
  %shr239 = lshr i32 %add234, 23, !dbg !113
  %or240 = or i32 %shl235, %shr239, !dbg !113
  %xor242 = xor i32 %or240, %xor154, !dbg !114
  %add245 = add i32 %xor242, %xor231, !dbg !65
  %shl246 = shl i32 %add245, 13, !dbg !65
  %shr250 = lshr i32 %add245, 19, !dbg !65
  %or251 = or i32 %shl246, %shr250, !dbg !65
  %xor253 = xor i32 %or251, %xor, !dbg !62
  %add256 = add i32 %xor253, %xor242, !dbg !115
  %shl257 = shl i32 %add256, 18, !dbg !115
  %shr261 = lshr i32 %add256, 14, !dbg !115
  %or262 = or i32 %shl257, %shr261, !dbg !115
  %xor264 = xor i32 %or262, %xor88, !dbg !116
  %add267 = add i32 %xor55, %xor132, !dbg !117
  %shl268 = shl i32 %add267, 7, !dbg !117
  %shr272 = lshr i32 %add267, 25, !dbg !117
  %or273 = or i32 %shl268, %shr272, !dbg !117
  %xor275 = xor i32 %or273, %xor165, !dbg !118
  %add278 = add i32 %xor275, %xor132, !dbg !119
  %shl279 = shl i32 %add278, 9, !dbg !119
  %shr283 = lshr i32 %add278, 23, !dbg !119
  %or284 = or i32 %shl279, %shr283, !dbg !119
  %xor286 = xor i32 %or284, %xor22, !dbg !120
  %add289 = add i32 %xor286, %xor275, !dbg !121
  %shl290 = shl i32 %add289, 13, !dbg !121
  %shr294 = lshr i32 %add289, 19, !dbg !121
  %or295 = or i32 %shl290, %shr294, !dbg !121
  %xor297 = xor i32 %or295, %xor55, !dbg !122
  %add300 = add i32 %xor297, %xor286, !dbg !63
  %shl301 = shl i32 %add300, 18, !dbg !63
  %shr305 = lshr i32 %add300, 14, !dbg !63
  %or306 = or i32 %shl301, %shr305, !dbg !63
  %xor308 = xor i32 %or306, %xor132, !dbg !64
  %add311 = add i32 %xor99, %xor176, !dbg !123
  %shl312 = shl i32 %add311, 7, !dbg !123
  %shr316 = lshr i32 %add311, 25, !dbg !123
  %or317 = or i32 %shl312, %shr316, !dbg !123
  %xor319 = xor i32 %or317, %xor33, !dbg !124
  %add322 = add i32 %xor319, %xor176, !dbg !125
  %shl323 = shl i32 %add322, 9, !dbg !125
  %shr327 = lshr i32 %add322, 23, !dbg !125
  %or328 = or i32 %shl323, %shr327, !dbg !125
  %xor330 = xor i32 %or328, %xor66, !dbg !126
  %add333 = add i32 %xor330, %xor319, !dbg !61
  %shl334 = shl i32 %add333, 13, !dbg !61
  %shr338 = lshr i32 %add333, 19, !dbg !61
  %or339 = or i32 %shl334, %shr338, !dbg !61
  %xor341 = xor i32 %or339, %xor99, !dbg !66
  %add344 = add i32 %xor341, %xor330, !dbg !127
  %shl345 = shl i32 %add344, 18, !dbg !127
  %shr349 = lshr i32 %add344, 14, !dbg !127
  %or350 = or i32 %shl345, %shr349, !dbg !127
  %xor352 = xor i32 %or350, %xor176, !dbg !128
  %sub = add nsw i32 %i.1380, -2, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !18, metadata !42), !dbg !47
  %cmp4 = icmp eq i32 %sub, 0, !dbg !130
  br i1 %cmp4, label %for.cond355.preheader, label %for.body5, !dbg !68
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @salsa() #0 {
entry:
  %0 = load i32* @ptr, align 4, !dbg !133, !tbaa !72
  %cmp = icmp eq i32 %0, 0, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  tail call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i64 0, i64 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0)), !dbg !136
  %1 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !138, !tbaa !72
  %inc = add i32 %1, 1, !dbg !138
  store i32 %inc, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !138, !tbaa !72
  %.pre = load i32* @ptr, align 4, !dbg !139, !tbaa !72
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %entry
  %2 = phi i32 [ %.pre, %if.then ], [ %0, %entry ]
  %add = add i32 %2, 1, !dbg !139
  %and = and i32 %add, 15, !dbg !141
  store i32 %and, i32* @ptr, align 4, !dbg !142, !tbaa !72
  %idxprom = zext i32 %and to i64, !dbg !143
  %arrayidx = getelementptr inbounds [16 x i32]* @outbuf, i64 0, i64 %idxprom, !dbg !143
  %3 = load i32* %arrayidx, align 4, !dbg !143, !tbaa !72
  ret i32 %3, !dbg !144
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 537919488, i64 0, metadata !33, metadata !42), !dbg !145
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !34, metadata !42), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 1), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036633, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 2), align 8, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036633, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 3), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 4), align 16, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 5), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036625, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 6), align 8, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036625, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 7), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 8), align 16, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 9), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036633, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 10), align 8, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036633, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 11), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 12), align 16, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036637, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 13), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036065, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 14), align 8, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  store i32 856036065, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 15), align 4, !dbg !148, !tbaa !72
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !32, metadata !42), !dbg !147
  %.pre = load i32* @ptr, align 4, !dbg !151, !tbaa !72
  br label %for.cond2, !dbg !155

for.cond2:                                        ; preds = %salsa.exit, %entry
  %0 = phi i32 [ %and.i, %salsa.exit ], [ %.pre, %entry ]
  %i.1 = phi i32 [ %inc6, %salsa.exit ], [ 0, %entry ]
  %cmp.i = icmp eq i32 %0, 0, !dbg !151
  br i1 %cmp.i, label %if.then.i, label %salsa.exit, !dbg !156

if.then.i:                                        ; preds = %for.cond2
  tail call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i64 0, i64 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0)) #2, !dbg !157
  %1 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !158, !tbaa !72
  %inc.i = add i32 %1, 1, !dbg !158
  store i32 %inc.i, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !158, !tbaa !72
  %.pre.i = load i32* @ptr, align 4, !dbg !159, !tbaa !72
  br label %salsa.exit, !dbg !160

salsa.exit:                                       ; preds = %for.cond2, %if.then.i
  %2 = phi i32 [ %.pre.i, %if.then.i ], [ %0, %for.cond2 ], !dbg !152
  %add.i = add i32 %2, 1, !dbg !159
  %and.i = and i32 %add.i, 15, !dbg !161
  store i32 %and.i, i32* @ptr, align 4, !dbg !162, !tbaa !72
  %idxprom.i = zext i32 %and.i to i64, !dbg !163
  %arrayidx.i = getelementptr inbounds [16 x i32]* @outbuf, i64 0, i64 %idxprom.i, !dbg !163
  %3 = load i32* %arrayidx.i, align 4, !dbg !163, !tbaa !72
  %inc6 = add nuw nsw i32 %i.1, 1, !dbg !164
  tail call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !32, metadata !42), !dbg !147
  %exitcond = icmp eq i32 %inc6, 537919489, !dbg !165
  br i1 %exitcond, label %for.end7, label %for.cond2, !dbg !165

for.end7:                                         ; preds = %salsa.exit
  %.lcssa = phi i32 [ %3, %salsa.exit ]
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !31, metadata !42), !dbg !166
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !31, metadata !42), !dbg !166
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %.lcssa) #2, !dbg !167
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 -162172867) #2, !dbg !168
  %cmp12 = icmp ne i32 %.lcssa, -162172867, !dbg !169
  %conv = zext i1 %cmp12 to i32, !dbg !169
  ret i32 %conv, !dbg !170
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !35, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c] [DW_LANG_C99]
!1 = !{!"salsa20.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x16\00uint64_t\0055\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [uint64_t] [line 55, size 0, align 0, offset 0] [from long unsigned int]
!5 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!6 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!7 = !{!8, !23, !26}
!8 = !{!"0x2e\00salsa20\00salsa20\00\0015\000\001\000\000\00256\001\0015", !1, !9, !10, null, void (i32*, i32*)* @salsa20, null, null, !15} ; [ DW_TAG_subprogram ] [line 15] [def] [salsa20]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !12, !12}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint32_t]
!13 = !{!"0x16\00uint32_t\0051\000\000\000\000", !5, null, !14} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!14 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!15 = !{!16, !17, !18, !19}
!16 = !{!"0x101\00out\0016777231\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [out] [line 15]
!17 = !{!"0x101\00in\0033554447\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 15]
!18 = !{!"0x100\00i\0016\000", !8, !9, !13}       ; [ DW_TAG_auto_variable ] [i] [line 16]
!19 = !{!"0x100\00x\0016\000", !8, !9, !20}       ; [ DW_TAG_auto_variable ] [x] [line 16]
!20 = !{!"0x1\00\000\00512\0032\000\000\000", null, null, !13, !21, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from uint32_t]
!21 = !{!22}
!22 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!23 = !{!"0x2e\00salsa\00salsa\00\0042\000\001\000\000\00256\001\0042", !1, !9, !24, null, i32 ()* @salsa, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [def] [salsa]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!13}
!26 = !{!"0x2e\00main\00main\00\0052\000\001\000\000\00256\001\0052", !1, !9, !27, null, i32 ()* @main, null, null, !30} ; [ DW_TAG_subprogram ] [line 52] [def] [main]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!31, !32, !33, !34}
!31 = !{!"0x100\00val\0053\000", !26, !9, !13}    ; [ DW_TAG_auto_variable ] [val] [line 53]
!32 = !{!"0x100\00i\0053\000", !26, !9, !13}      ; [ DW_TAG_auto_variable ] [i] [line 53]
!33 = !{!"0x100\00count\0058\000", !26, !9, !13}  ; [ DW_TAG_auto_variable ] [count] [line 58]
!34 = !{!"0x100\00offset\0059\000", !26, !9, !13} ; [ DW_TAG_auto_variable ] [offset] [line 59]
!35 = !{!36, !37, !38}
!36 = !{!"0x34\00ptr\00ptr\00\0012\000\001", null, !9, !13, i32* @ptr, null} ; [ DW_TAG_variable ] [ptr] [line 12] [def]
!37 = !{!"0x34\00STATE\00STATE\00\0010\000\001", null, !9, !20, [16 x i32]* @STATE, null} ; [ DW_TAG_variable ] [STATE] [line 10] [def]
!38 = !{!"0x34\00outbuf\00outbuf\00\0011\000\001", null, !9, !20, [16 x i32]* @outbuf, null} ; [ DW_TAG_variable ] [outbuf] [line 11] [def]
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 15, column: 23, scope: !8)
!44 = !MDLocation(line: 15, column: 40, scope: !8)
!45 = !MDLocation(line: 16, column: 3, scope: !8)
!46 = !MDLocation(line: 16, column: 15, scope: !8)
!47 = !MDLocation(line: 16, column: 12, scope: !8)
!48 = !MDLocation(line: 19, column: 5, scope: !49)
!49 = !{!"0xb\0018\003\001", !1, !50}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!50 = !{!"0xb\0018\003\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!51 = !MDLocation(line: 22, column: 14, scope: !52)
!52 = !{!"0xb\0021\0029\004", !1, !53}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!53 = !{!"0xb\0021\003\003", !1, !54}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!54 = !{!"0xb\0021\003\002", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!55 = !MDLocation(line: 22, column: 5, scope: !52)
!56 = !MDLocation(line: 22, column: 34, scope: !52)
!57 = !MDLocation(line: 26, column: 14, scope: !52)
!58 = !MDLocation(line: 26, column: 5, scope: !52)
!59 = !MDLocation(line: 26, column: 34, scope: !52)
!60 = !MDLocation(line: 31, column: 34, scope: !52)
!61 = !MDLocation(line: 37, column: 14, scope: !52)
!62 = !MDLocation(line: 33, column: 5, scope: !52)
!63 = !MDLocation(line: 35, column: 43, scope: !52)
!64 = !MDLocation(line: 35, column: 34, scope: !52)
!65 = !MDLocation(line: 33, column: 14, scope: !52)
!66 = !MDLocation(line: 37, column: 5, scope: !52)
!67 = !MDLocation(line: 31, column: 43, scope: !52)
!68 = !MDLocation(line: 21, column: 3, scope: !54)
!69 = !MDLocation(line: 39, column: 42, scope: !70)
!70 = !{!"0xb\0039\003\006", !1, !71}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!71 = !{!"0xb\0039\003\005", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!72 = !{!73, !73, i64 0}
!73 = !{!"int", !74, i64 0}
!74 = !{!"omnipotent char", !75, i64 0}
!75 = !{!"Simple C/C++ TBAA"}
!76 = !MDLocation(line: 39, column: 35, scope: !70)
!77 = !MDLocation(line: 39, column: 26, scope: !70)
!78 = !MDLocation(line: 40, column: 1, scope: !8)
!79 = !MDLocation(line: 22, column: 43, scope: !52)
!80 = !MDLocation(line: 23, column: 14, scope: !52)
!81 = !MDLocation(line: 23, column: 5, scope: !52)
!82 = !MDLocation(line: 23, column: 43, scope: !52)
!83 = !MDLocation(line: 23, column: 34, scope: !52)
!84 = !MDLocation(line: 24, column: 14, scope: !52)
!85 = !MDLocation(line: 24, column: 5, scope: !52)
!86 = !MDLocation(line: 24, column: 43, scope: !52)
!87 = !MDLocation(line: 24, column: 34, scope: !52)
!88 = !MDLocation(line: 25, column: 14, scope: !52)
!89 = !MDLocation(line: 25, column: 5, scope: !52)
!90 = !MDLocation(line: 25, column: 43, scope: !52)
!91 = !MDLocation(line: 25, column: 34, scope: !52)
!92 = !MDLocation(line: 26, column: 43, scope: !52)
!93 = !MDLocation(line: 27, column: 14, scope: !52)
!94 = !MDLocation(line: 27, column: 5, scope: !52)
!95 = !MDLocation(line: 27, column: 43, scope: !52)
!96 = !MDLocation(line: 27, column: 34, scope: !52)
!97 = !MDLocation(line: 28, column: 14, scope: !52)
!98 = !MDLocation(line: 28, column: 5, scope: !52)
!99 = !MDLocation(line: 28, column: 43, scope: !52)
!100 = !MDLocation(line: 28, column: 34, scope: !52)
!101 = !MDLocation(line: 29, column: 14, scope: !52)
!102 = !MDLocation(line: 29, column: 5, scope: !52)
!103 = !MDLocation(line: 29, column: 43, scope: !52)
!104 = !MDLocation(line: 29, column: 34, scope: !52)
!105 = !MDLocation(line: 30, column: 14, scope: !52)
!106 = !MDLocation(line: 30, column: 5, scope: !52)
!107 = !MDLocation(line: 30, column: 43, scope: !52)
!108 = !MDLocation(line: 30, column: 34, scope: !52)
!109 = !MDLocation(line: 31, column: 14, scope: !52)
!110 = !MDLocation(line: 31, column: 5, scope: !52)
!111 = !MDLocation(line: 32, column: 14, scope: !52)
!112 = !MDLocation(line: 32, column: 5, scope: !52)
!113 = !MDLocation(line: 32, column: 43, scope: !52)
!114 = !MDLocation(line: 32, column: 34, scope: !52)
!115 = !MDLocation(line: 33, column: 43, scope: !52)
!116 = !MDLocation(line: 33, column: 34, scope: !52)
!117 = !MDLocation(line: 34, column: 14, scope: !52)
!118 = !MDLocation(line: 34, column: 5, scope: !52)
!119 = !MDLocation(line: 34, column: 43, scope: !52)
!120 = !MDLocation(line: 34, column: 34, scope: !52)
!121 = !MDLocation(line: 35, column: 14, scope: !52)
!122 = !MDLocation(line: 35, column: 5, scope: !52)
!123 = !MDLocation(line: 36, column: 14, scope: !52)
!124 = !MDLocation(line: 36, column: 5, scope: !52)
!125 = !MDLocation(line: 36, column: 43, scope: !52)
!126 = !MDLocation(line: 36, column: 34, scope: !52)
!127 = !MDLocation(line: 37, column: 43, scope: !52)
!128 = !MDLocation(line: 37, column: 34, scope: !52)
!129 = !MDLocation(line: 21, column: 21, scope: !53)
!130 = !MDLocation(line: 21, column: 15, scope: !131)
!131 = !{!"0xb\002", !1, !132}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!132 = !{!"0xb\001", !1, !53}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!133 = !MDLocation(line: 43, column: 6, scope: !134)
!134 = !{!"0xb\0043\006\007", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!135 = !MDLocation(line: 43, column: 6, scope: !23)
!136 = !MDLocation(line: 44, column: 5, scope: !137)
!137 = !{!"0xb\0043\0014\008", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!138 = !MDLocation(line: 45, column: 15, scope: !137)
!139 = !MDLocation(line: 48, column: 10, scope: !23)
!140 = !MDLocation(line: 46, column: 3, scope: !137)
!141 = !MDLocation(line: 48, column: 9, scope: !23)
!142 = !MDLocation(line: 48, column: 3, scope: !23)
!143 = !MDLocation(line: 49, column: 10, scope: !23)
!144 = !MDLocation(line: 49, column: 3, scope: !23)
!145 = !MDLocation(line: 58, column: 12, scope: !26)
!146 = !MDLocation(line: 59, column: 12, scope: !26)
!147 = !MDLocation(line: 53, column: 17, scope: !26)
!148 = !MDLocation(line: 63, column: 5, scope: !149)
!149 = !{!"0xb\0062\003\0010", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!150 = !{!"0xb\0062\003\009", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!151 = !MDLocation(line: 43, column: 6, scope: !134, inlinedAt: !152)
!152 = !MDLocation(line: 66, column: 5, scope: !153)
!153 = !{!"0xb\0065\003\0012", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!154 = !{!"0xb\0065\003\0011", !1, !26}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!155 = !MDLocation(line: 65, column: 12, scope: !153)
!156 = !MDLocation(line: 43, column: 6, scope: !23, inlinedAt: !152)
!157 = !MDLocation(line: 44, column: 5, scope: !137, inlinedAt: !152)
!158 = !MDLocation(line: 45, column: 15, scope: !137, inlinedAt: !152)
!159 = !MDLocation(line: 48, column: 10, scope: !23, inlinedAt: !152)
!160 = !MDLocation(line: 46, column: 3, scope: !137, inlinedAt: !152)
!161 = !MDLocation(line: 48, column: 9, scope: !23, inlinedAt: !152)
!162 = !MDLocation(line: 48, column: 3, scope: !23, inlinedAt: !152)
!163 = !MDLocation(line: 49, column: 10, scope: !23, inlinedAt: !152)
!164 = !MDLocation(line: 65, column: 21, scope: !153)
!165 = !MDLocation(line: 65, column: 3, scope: !154)
!166 = !MDLocation(line: 53, column: 12, scope: !26)
!167 = !MDLocation(line: 71, column: 3, scope: !26)
!168 = !MDLocation(line: 72, column: 3, scope: !26)
!169 = !MDLocation(line: 73, column: 10, scope: !26)
!170 = !MDLocation(line: 73, column: 3, scope: !26)
