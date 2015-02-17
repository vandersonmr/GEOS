; ModuleID = 'salsa20.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ptr = global i32 0, align 4
@outbuf = common global [16 x i32] zeroinitializer, align 16
@STATE = common global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [15 x i8] c"got:       %x\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"should be: %x\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @salsa20(i32* %out, i32* %in) #0 {
entry:
  %out.addr = alloca i32*, align 8
  %in.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %x = alloca [16 x i32], align 16
  store i32* %out, i32** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %out.addr, metadata !32, metadata !33), !dbg !34
  store i32* %in, i32** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %in.addr, metadata !35, metadata !33), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !33), !dbg !38
  call void @llvm.dbg.declare(metadata [16 x i32]* %x, metadata !39, metadata !33), !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !43
  %cmp = icmp ult i32 %0, 16, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !48
  %idxprom = zext i32 %1 to i64, !dbg !49
  %2 = load i32** %in.addr, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32* %2, i64 %idxprom, !dbg !49
  %3 = load i32* %arrayidx, align 4, !dbg !49
  %4 = load i32* %i, align 4, !dbg !50
  %idxprom1 = zext i32 %4 to i64, !dbg !51
  %arrayidx2 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %idxprom1, !dbg !51
  store i32 %3, i32* %arrayidx2, align 4, !dbg !51
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4, !dbg !52
  %inc = add i32 %5, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53

for.end:                                          ; preds = %for.cond
  store i32 20, i32* %i, align 4, !dbg !54
  br label %for.cond3, !dbg !54

for.cond3:                                        ; preds = %for.inc353, %for.end
  %6 = load i32* %i, align 4, !dbg !56
  %cmp4 = icmp ugt i32 %6, 0, !dbg !56
  br i1 %cmp4, label %for.body5, label %for.end354, !dbg !60

for.body5:                                        ; preds = %for.cond3
  %arrayidx6 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !61
  %7 = load i32* %arrayidx6, align 4, !dbg !61
  %arrayidx7 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !61
  %8 = load i32* %arrayidx7, align 4, !dbg !61
  %add = add i32 %7, %8, !dbg !61
  %shl = shl i32 %add, 7, !dbg !61
  %arrayidx8 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !61
  %9 = load i32* %arrayidx8, align 4, !dbg !61
  %arrayidx9 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !61
  %10 = load i32* %arrayidx9, align 4, !dbg !61
  %add10 = add i32 %9, %10, !dbg !61
  %shr = lshr i32 %add10, 25, !dbg !61
  %or = or i32 %shl, %shr, !dbg !61
  %arrayidx11 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !63
  %11 = load i32* %arrayidx11, align 4, !dbg !63
  %xor = xor i32 %11, %or, !dbg !63
  store i32 %xor, i32* %arrayidx11, align 4, !dbg !63
  %arrayidx12 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !64
  %12 = load i32* %arrayidx12, align 4, !dbg !64
  %arrayidx13 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !64
  %13 = load i32* %arrayidx13, align 4, !dbg !64
  %add14 = add i32 %12, %13, !dbg !64
  %shl15 = shl i32 %add14, 9, !dbg !64
  %arrayidx16 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !64
  %14 = load i32* %arrayidx16, align 4, !dbg !64
  %arrayidx17 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !64
  %15 = load i32* %arrayidx17, align 4, !dbg !64
  %add18 = add i32 %14, %15, !dbg !64
  %shr19 = lshr i32 %add18, 23, !dbg !64
  %or20 = or i32 %shl15, %shr19, !dbg !64
  %arrayidx21 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !65
  %16 = load i32* %arrayidx21, align 4, !dbg !65
  %xor22 = xor i32 %16, %or20, !dbg !65
  store i32 %xor22, i32* %arrayidx21, align 4, !dbg !65
  %arrayidx23 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !66
  %17 = load i32* %arrayidx23, align 4, !dbg !66
  %arrayidx24 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !66
  %18 = load i32* %arrayidx24, align 4, !dbg !66
  %add25 = add i32 %17, %18, !dbg !66
  %shl26 = shl i32 %add25, 13, !dbg !66
  %arrayidx27 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !66
  %19 = load i32* %arrayidx27, align 4, !dbg !66
  %arrayidx28 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !66
  %20 = load i32* %arrayidx28, align 4, !dbg !66
  %add29 = add i32 %19, %20, !dbg !66
  %shr30 = lshr i32 %add29, 19, !dbg !66
  %or31 = or i32 %shl26, %shr30, !dbg !66
  %arrayidx32 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !67
  %21 = load i32* %arrayidx32, align 4, !dbg !67
  %xor33 = xor i32 %21, %or31, !dbg !67
  store i32 %xor33, i32* %arrayidx32, align 4, !dbg !67
  %arrayidx34 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !68
  %22 = load i32* %arrayidx34, align 4, !dbg !68
  %arrayidx35 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !68
  %23 = load i32* %arrayidx35, align 4, !dbg !68
  %add36 = add i32 %22, %23, !dbg !68
  %shl37 = shl i32 %add36, 18, !dbg !68
  %arrayidx38 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !68
  %24 = load i32* %arrayidx38, align 4, !dbg !68
  %arrayidx39 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !68
  %25 = load i32* %arrayidx39, align 4, !dbg !68
  %add40 = add i32 %24, %25, !dbg !68
  %shr41 = lshr i32 %add40, 14, !dbg !68
  %or42 = or i32 %shl37, %shr41, !dbg !68
  %arrayidx43 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !69
  %26 = load i32* %arrayidx43, align 4, !dbg !69
  %xor44 = xor i32 %26, %or42, !dbg !69
  store i32 %xor44, i32* %arrayidx43, align 4, !dbg !69
  %arrayidx45 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !70
  %27 = load i32* %arrayidx45, align 4, !dbg !70
  %arrayidx46 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !70
  %28 = load i32* %arrayidx46, align 4, !dbg !70
  %add47 = add i32 %27, %28, !dbg !70
  %shl48 = shl i32 %add47, 7, !dbg !70
  %arrayidx49 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !70
  %29 = load i32* %arrayidx49, align 4, !dbg !70
  %arrayidx50 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !70
  %30 = load i32* %arrayidx50, align 4, !dbg !70
  %add51 = add i32 %29, %30, !dbg !70
  %shr52 = lshr i32 %add51, 25, !dbg !70
  %or53 = or i32 %shl48, %shr52, !dbg !70
  %arrayidx54 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !71
  %31 = load i32* %arrayidx54, align 4, !dbg !71
  %xor55 = xor i32 %31, %or53, !dbg !71
  store i32 %xor55, i32* %arrayidx54, align 4, !dbg !71
  %arrayidx56 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !72
  %32 = load i32* %arrayidx56, align 4, !dbg !72
  %arrayidx57 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !72
  %33 = load i32* %arrayidx57, align 4, !dbg !72
  %add58 = add i32 %32, %33, !dbg !72
  %shl59 = shl i32 %add58, 9, !dbg !72
  %arrayidx60 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !72
  %34 = load i32* %arrayidx60, align 4, !dbg !72
  %arrayidx61 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !72
  %35 = load i32* %arrayidx61, align 4, !dbg !72
  %add62 = add i32 %34, %35, !dbg !72
  %shr63 = lshr i32 %add62, 23, !dbg !72
  %or64 = or i32 %shl59, %shr63, !dbg !72
  %arrayidx65 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !73
  %36 = load i32* %arrayidx65, align 4, !dbg !73
  %xor66 = xor i32 %36, %or64, !dbg !73
  store i32 %xor66, i32* %arrayidx65, align 4, !dbg !73
  %arrayidx67 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !74
  %37 = load i32* %arrayidx67, align 4, !dbg !74
  %arrayidx68 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !74
  %38 = load i32* %arrayidx68, align 4, !dbg !74
  %add69 = add i32 %37, %38, !dbg !74
  %shl70 = shl i32 %add69, 13, !dbg !74
  %arrayidx71 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !74
  %39 = load i32* %arrayidx71, align 4, !dbg !74
  %arrayidx72 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !74
  %40 = load i32* %arrayidx72, align 4, !dbg !74
  %add73 = add i32 %39, %40, !dbg !74
  %shr74 = lshr i32 %add73, 19, !dbg !74
  %or75 = or i32 %shl70, %shr74, !dbg !74
  %arrayidx76 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !75
  %41 = load i32* %arrayidx76, align 4, !dbg !75
  %xor77 = xor i32 %41, %or75, !dbg !75
  store i32 %xor77, i32* %arrayidx76, align 4, !dbg !75
  %arrayidx78 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !76
  %42 = load i32* %arrayidx78, align 4, !dbg !76
  %arrayidx79 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !76
  %43 = load i32* %arrayidx79, align 4, !dbg !76
  %add80 = add i32 %42, %43, !dbg !76
  %shl81 = shl i32 %add80, 18, !dbg !76
  %arrayidx82 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !76
  %44 = load i32* %arrayidx82, align 4, !dbg !76
  %arrayidx83 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !76
  %45 = load i32* %arrayidx83, align 4, !dbg !76
  %add84 = add i32 %44, %45, !dbg !76
  %shr85 = lshr i32 %add84, 14, !dbg !76
  %or86 = or i32 %shl81, %shr85, !dbg !76
  %arrayidx87 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !77
  %46 = load i32* %arrayidx87, align 4, !dbg !77
  %xor88 = xor i32 %46, %or86, !dbg !77
  store i32 %xor88, i32* %arrayidx87, align 4, !dbg !77
  %arrayidx89 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !78
  %47 = load i32* %arrayidx89, align 4, !dbg !78
  %arrayidx90 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !78
  %48 = load i32* %arrayidx90, align 4, !dbg !78
  %add91 = add i32 %47, %48, !dbg !78
  %shl92 = shl i32 %add91, 7, !dbg !78
  %arrayidx93 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !78
  %49 = load i32* %arrayidx93, align 4, !dbg !78
  %arrayidx94 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !78
  %50 = load i32* %arrayidx94, align 4, !dbg !78
  %add95 = add i32 %49, %50, !dbg !78
  %shr96 = lshr i32 %add95, 25, !dbg !78
  %or97 = or i32 %shl92, %shr96, !dbg !78
  %arrayidx98 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !79
  %51 = load i32* %arrayidx98, align 4, !dbg !79
  %xor99 = xor i32 %51, %or97, !dbg !79
  store i32 %xor99, i32* %arrayidx98, align 4, !dbg !79
  %arrayidx100 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !80
  %52 = load i32* %arrayidx100, align 4, !dbg !80
  %arrayidx101 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !80
  %53 = load i32* %arrayidx101, align 4, !dbg !80
  %add102 = add i32 %52, %53, !dbg !80
  %shl103 = shl i32 %add102, 9, !dbg !80
  %arrayidx104 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !80
  %54 = load i32* %arrayidx104, align 4, !dbg !80
  %arrayidx105 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !80
  %55 = load i32* %arrayidx105, align 4, !dbg !80
  %add106 = add i32 %54, %55, !dbg !80
  %shr107 = lshr i32 %add106, 23, !dbg !80
  %or108 = or i32 %shl103, %shr107, !dbg !80
  %arrayidx109 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !81
  %56 = load i32* %arrayidx109, align 4, !dbg !81
  %xor110 = xor i32 %56, %or108, !dbg !81
  store i32 %xor110, i32* %arrayidx109, align 4, !dbg !81
  %arrayidx111 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !82
  %57 = load i32* %arrayidx111, align 4, !dbg !82
  %arrayidx112 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !82
  %58 = load i32* %arrayidx112, align 4, !dbg !82
  %add113 = add i32 %57, %58, !dbg !82
  %shl114 = shl i32 %add113, 13, !dbg !82
  %arrayidx115 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !82
  %59 = load i32* %arrayidx115, align 4, !dbg !82
  %arrayidx116 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !82
  %60 = load i32* %arrayidx116, align 4, !dbg !82
  %add117 = add i32 %59, %60, !dbg !82
  %shr118 = lshr i32 %add117, 19, !dbg !82
  %or119 = or i32 %shl114, %shr118, !dbg !82
  %arrayidx120 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !83
  %61 = load i32* %arrayidx120, align 4, !dbg !83
  %xor121 = xor i32 %61, %or119, !dbg !83
  store i32 %xor121, i32* %arrayidx120, align 4, !dbg !83
  %arrayidx122 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !84
  %62 = load i32* %arrayidx122, align 4, !dbg !84
  %arrayidx123 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !84
  %63 = load i32* %arrayidx123, align 4, !dbg !84
  %add124 = add i32 %62, %63, !dbg !84
  %shl125 = shl i32 %add124, 18, !dbg !84
  %arrayidx126 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !84
  %64 = load i32* %arrayidx126, align 4, !dbg !84
  %arrayidx127 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !84
  %65 = load i32* %arrayidx127, align 4, !dbg !84
  %add128 = add i32 %64, %65, !dbg !84
  %shr129 = lshr i32 %add128, 14, !dbg !84
  %or130 = or i32 %shl125, %shr129, !dbg !84
  %arrayidx131 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !85
  %66 = load i32* %arrayidx131, align 4, !dbg !85
  %xor132 = xor i32 %66, %or130, !dbg !85
  store i32 %xor132, i32* %arrayidx131, align 4, !dbg !85
  %arrayidx133 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !86
  %67 = load i32* %arrayidx133, align 4, !dbg !86
  %arrayidx134 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !86
  %68 = load i32* %arrayidx134, align 4, !dbg !86
  %add135 = add i32 %67, %68, !dbg !86
  %shl136 = shl i32 %add135, 7, !dbg !86
  %arrayidx137 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !86
  %69 = load i32* %arrayidx137, align 4, !dbg !86
  %arrayidx138 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !86
  %70 = load i32* %arrayidx138, align 4, !dbg !86
  %add139 = add i32 %69, %70, !dbg !86
  %shr140 = lshr i32 %add139, 25, !dbg !86
  %or141 = or i32 %shl136, %shr140, !dbg !86
  %arrayidx142 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !87
  %71 = load i32* %arrayidx142, align 4, !dbg !87
  %xor143 = xor i32 %71, %or141, !dbg !87
  store i32 %xor143, i32* %arrayidx142, align 4, !dbg !87
  %arrayidx144 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !88
  %72 = load i32* %arrayidx144, align 4, !dbg !88
  %arrayidx145 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !88
  %73 = load i32* %arrayidx145, align 4, !dbg !88
  %add146 = add i32 %72, %73, !dbg !88
  %shl147 = shl i32 %add146, 9, !dbg !88
  %arrayidx148 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !88
  %74 = load i32* %arrayidx148, align 4, !dbg !88
  %arrayidx149 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !88
  %75 = load i32* %arrayidx149, align 4, !dbg !88
  %add150 = add i32 %74, %75, !dbg !88
  %shr151 = lshr i32 %add150, 23, !dbg !88
  %or152 = or i32 %shl147, %shr151, !dbg !88
  %arrayidx153 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !89
  %76 = load i32* %arrayidx153, align 4, !dbg !89
  %xor154 = xor i32 %76, %or152, !dbg !89
  store i32 %xor154, i32* %arrayidx153, align 4, !dbg !89
  %arrayidx155 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !90
  %77 = load i32* %arrayidx155, align 4, !dbg !90
  %arrayidx156 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !90
  %78 = load i32* %arrayidx156, align 4, !dbg !90
  %add157 = add i32 %77, %78, !dbg !90
  %shl158 = shl i32 %add157, 13, !dbg !90
  %arrayidx159 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !90
  %79 = load i32* %arrayidx159, align 4, !dbg !90
  %arrayidx160 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !90
  %80 = load i32* %arrayidx160, align 4, !dbg !90
  %add161 = add i32 %79, %80, !dbg !90
  %shr162 = lshr i32 %add161, 19, !dbg !90
  %or163 = or i32 %shl158, %shr162, !dbg !90
  %arrayidx164 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !91
  %81 = load i32* %arrayidx164, align 4, !dbg !91
  %xor165 = xor i32 %81, %or163, !dbg !91
  store i32 %xor165, i32* %arrayidx164, align 4, !dbg !91
  %arrayidx166 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !92
  %82 = load i32* %arrayidx166, align 4, !dbg !92
  %arrayidx167 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !92
  %83 = load i32* %arrayidx167, align 4, !dbg !92
  %add168 = add i32 %82, %83, !dbg !92
  %shl169 = shl i32 %add168, 18, !dbg !92
  %arrayidx170 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !92
  %84 = load i32* %arrayidx170, align 4, !dbg !92
  %arrayidx171 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !92
  %85 = load i32* %arrayidx171, align 4, !dbg !92
  %add172 = add i32 %84, %85, !dbg !92
  %shr173 = lshr i32 %add172, 14, !dbg !92
  %or174 = or i32 %shl169, %shr173, !dbg !92
  %arrayidx175 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !93
  %86 = load i32* %arrayidx175, align 4, !dbg !93
  %xor176 = xor i32 %86, %or174, !dbg !93
  store i32 %xor176, i32* %arrayidx175, align 4, !dbg !93
  %arrayidx177 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !94
  %87 = load i32* %arrayidx177, align 4, !dbg !94
  %arrayidx178 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !94
  %88 = load i32* %arrayidx178, align 4, !dbg !94
  %add179 = add i32 %87, %88, !dbg !94
  %shl180 = shl i32 %add179, 7, !dbg !94
  %arrayidx181 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !94
  %89 = load i32* %arrayidx181, align 4, !dbg !94
  %arrayidx182 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !94
  %90 = load i32* %arrayidx182, align 4, !dbg !94
  %add183 = add i32 %89, %90, !dbg !94
  %shr184 = lshr i32 %add183, 25, !dbg !94
  %or185 = or i32 %shl180, %shr184, !dbg !94
  %arrayidx186 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !95
  %91 = load i32* %arrayidx186, align 4, !dbg !95
  %xor187 = xor i32 %91, %or185, !dbg !95
  store i32 %xor187, i32* %arrayidx186, align 4, !dbg !95
  %arrayidx188 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !96
  %92 = load i32* %arrayidx188, align 4, !dbg !96
  %arrayidx189 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !96
  %93 = load i32* %arrayidx189, align 4, !dbg !96
  %add190 = add i32 %92, %93, !dbg !96
  %shl191 = shl i32 %add190, 9, !dbg !96
  %arrayidx192 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !96
  %94 = load i32* %arrayidx192, align 4, !dbg !96
  %arrayidx193 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !96
  %95 = load i32* %arrayidx193, align 4, !dbg !96
  %add194 = add i32 %94, %95, !dbg !96
  %shr195 = lshr i32 %add194, 23, !dbg !96
  %or196 = or i32 %shl191, %shr195, !dbg !96
  %arrayidx197 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !97
  %96 = load i32* %arrayidx197, align 4, !dbg !97
  %xor198 = xor i32 %96, %or196, !dbg !97
  store i32 %xor198, i32* %arrayidx197, align 4, !dbg !97
  %arrayidx199 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !98
  %97 = load i32* %arrayidx199, align 4, !dbg !98
  %arrayidx200 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !98
  %98 = load i32* %arrayidx200, align 4, !dbg !98
  %add201 = add i32 %97, %98, !dbg !98
  %shl202 = shl i32 %add201, 13, !dbg !98
  %arrayidx203 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !98
  %99 = load i32* %arrayidx203, align 4, !dbg !98
  %arrayidx204 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 1, !dbg !98
  %100 = load i32* %arrayidx204, align 4, !dbg !98
  %add205 = add i32 %99, %100, !dbg !98
  %shr206 = lshr i32 %add205, 19, !dbg !98
  %or207 = or i32 %shl202, %shr206, !dbg !98
  %arrayidx208 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !99
  %101 = load i32* %arrayidx208, align 4, !dbg !99
  %xor209 = xor i32 %101, %or207, !dbg !99
  store i32 %xor209, i32* %arrayidx208, align 4, !dbg !99
  %arrayidx210 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !100
  %102 = load i32* %arrayidx210, align 4, !dbg !100
  %arrayidx211 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !100
  %103 = load i32* %arrayidx211, align 4, !dbg !100
  %add212 = add i32 %102, %103, !dbg !100
  %shl213 = shl i32 %add212, 18, !dbg !100
  %arrayidx214 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 3, !dbg !100
  %104 = load i32* %arrayidx214, align 4, !dbg !100
  %arrayidx215 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 2, !dbg !100
  %105 = load i32* %arrayidx215, align 4, !dbg !100
  %add216 = add i32 %104, %105, !dbg !100
  %shr217 = lshr i32 %add216, 14, !dbg !100
  %or218 = or i32 %shl213, %shr217, !dbg !100
  %arrayidx219 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 0, !dbg !101
  %106 = load i32* %arrayidx219, align 4, !dbg !101
  %xor220 = xor i32 %106, %or218, !dbg !101
  store i32 %xor220, i32* %arrayidx219, align 4, !dbg !101
  %arrayidx221 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !102
  %107 = load i32* %arrayidx221, align 4, !dbg !102
  %arrayidx222 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !102
  %108 = load i32* %arrayidx222, align 4, !dbg !102
  %add223 = add i32 %107, %108, !dbg !102
  %shl224 = shl i32 %add223, 7, !dbg !102
  %arrayidx225 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !102
  %109 = load i32* %arrayidx225, align 4, !dbg !102
  %arrayidx226 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !102
  %110 = load i32* %arrayidx226, align 4, !dbg !102
  %add227 = add i32 %109, %110, !dbg !102
  %shr228 = lshr i32 %add227, 25, !dbg !102
  %or229 = or i32 %shl224, %shr228, !dbg !102
  %arrayidx230 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !103
  %111 = load i32* %arrayidx230, align 4, !dbg !103
  %xor231 = xor i32 %111, %or229, !dbg !103
  store i32 %xor231, i32* %arrayidx230, align 4, !dbg !103
  %arrayidx232 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !104
  %112 = load i32* %arrayidx232, align 4, !dbg !104
  %arrayidx233 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !104
  %113 = load i32* %arrayidx233, align 4, !dbg !104
  %add234 = add i32 %112, %113, !dbg !104
  %shl235 = shl i32 %add234, 9, !dbg !104
  %arrayidx236 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !104
  %114 = load i32* %arrayidx236, align 4, !dbg !104
  %arrayidx237 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !104
  %115 = load i32* %arrayidx237, align 4, !dbg !104
  %add238 = add i32 %114, %115, !dbg !104
  %shr239 = lshr i32 %add238, 23, !dbg !104
  %or240 = or i32 %shl235, %shr239, !dbg !104
  %arrayidx241 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !105
  %116 = load i32* %arrayidx241, align 4, !dbg !105
  %xor242 = xor i32 %116, %or240, !dbg !105
  store i32 %xor242, i32* %arrayidx241, align 4, !dbg !105
  %arrayidx243 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !106
  %117 = load i32* %arrayidx243, align 4, !dbg !106
  %arrayidx244 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !106
  %118 = load i32* %arrayidx244, align 4, !dbg !106
  %add245 = add i32 %117, %118, !dbg !106
  %shl246 = shl i32 %add245, 13, !dbg !106
  %arrayidx247 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !106
  %119 = load i32* %arrayidx247, align 4, !dbg !106
  %arrayidx248 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 6, !dbg !106
  %120 = load i32* %arrayidx248, align 4, !dbg !106
  %add249 = add i32 %119, %120, !dbg !106
  %shr250 = lshr i32 %add249, 19, !dbg !106
  %or251 = or i32 %shl246, %shr250, !dbg !106
  %arrayidx252 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !107
  %121 = load i32* %arrayidx252, align 4, !dbg !107
  %xor253 = xor i32 %121, %or251, !dbg !107
  store i32 %xor253, i32* %arrayidx252, align 4, !dbg !107
  %arrayidx254 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !108
  %122 = load i32* %arrayidx254, align 4, !dbg !108
  %arrayidx255 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !108
  %123 = load i32* %arrayidx255, align 4, !dbg !108
  %add256 = add i32 %122, %123, !dbg !108
  %shl257 = shl i32 %add256, 18, !dbg !108
  %arrayidx258 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 4, !dbg !108
  %124 = load i32* %arrayidx258, align 4, !dbg !108
  %arrayidx259 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 7, !dbg !108
  %125 = load i32* %arrayidx259, align 4, !dbg !108
  %add260 = add i32 %124, %125, !dbg !108
  %shr261 = lshr i32 %add260, 14, !dbg !108
  %or262 = or i32 %shl257, %shr261, !dbg !108
  %arrayidx263 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 5, !dbg !109
  %126 = load i32* %arrayidx263, align 4, !dbg !109
  %xor264 = xor i32 %126, %or262, !dbg !109
  store i32 %xor264, i32* %arrayidx263, align 4, !dbg !109
  %arrayidx265 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !110
  %127 = load i32* %arrayidx265, align 4, !dbg !110
  %arrayidx266 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !110
  %128 = load i32* %arrayidx266, align 4, !dbg !110
  %add267 = add i32 %127, %128, !dbg !110
  %shl268 = shl i32 %add267, 7, !dbg !110
  %arrayidx269 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !110
  %129 = load i32* %arrayidx269, align 4, !dbg !110
  %arrayidx270 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !110
  %130 = load i32* %arrayidx270, align 4, !dbg !110
  %add271 = add i32 %129, %130, !dbg !110
  %shr272 = lshr i32 %add271, 25, !dbg !110
  %or273 = or i32 %shl268, %shr272, !dbg !110
  %arrayidx274 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !111
  %131 = load i32* %arrayidx274, align 4, !dbg !111
  %xor275 = xor i32 %131, %or273, !dbg !111
  store i32 %xor275, i32* %arrayidx274, align 4, !dbg !111
  %arrayidx276 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !112
  %132 = load i32* %arrayidx276, align 4, !dbg !112
  %arrayidx277 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !112
  %133 = load i32* %arrayidx277, align 4, !dbg !112
  %add278 = add i32 %132, %133, !dbg !112
  %shl279 = shl i32 %add278, 9, !dbg !112
  %arrayidx280 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !112
  %134 = load i32* %arrayidx280, align 4, !dbg !112
  %arrayidx281 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !112
  %135 = load i32* %arrayidx281, align 4, !dbg !112
  %add282 = add i32 %134, %135, !dbg !112
  %shr283 = lshr i32 %add282, 23, !dbg !112
  %or284 = or i32 %shl279, %shr283, !dbg !112
  %arrayidx285 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !113
  %136 = load i32* %arrayidx285, align 4, !dbg !113
  %xor286 = xor i32 %136, %or284, !dbg !113
  store i32 %xor286, i32* %arrayidx285, align 4, !dbg !113
  %arrayidx287 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !114
  %137 = load i32* %arrayidx287, align 4, !dbg !114
  %arrayidx288 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !114
  %138 = load i32* %arrayidx288, align 4, !dbg !114
  %add289 = add i32 %137, %138, !dbg !114
  %shl290 = shl i32 %add289, 13, !dbg !114
  %arrayidx291 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !114
  %139 = load i32* %arrayidx291, align 4, !dbg !114
  %arrayidx292 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 11, !dbg !114
  %140 = load i32* %arrayidx292, align 4, !dbg !114
  %add293 = add i32 %139, %140, !dbg !114
  %shr294 = lshr i32 %add293, 19, !dbg !114
  %or295 = or i32 %shl290, %shr294, !dbg !114
  %arrayidx296 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !115
  %141 = load i32* %arrayidx296, align 4, !dbg !115
  %xor297 = xor i32 %141, %or295, !dbg !115
  store i32 %xor297, i32* %arrayidx296, align 4, !dbg !115
  %arrayidx298 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !116
  %142 = load i32* %arrayidx298, align 4, !dbg !116
  %arrayidx299 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !116
  %143 = load i32* %arrayidx299, align 4, !dbg !116
  %add300 = add i32 %142, %143, !dbg !116
  %shl301 = shl i32 %add300, 18, !dbg !116
  %arrayidx302 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 9, !dbg !116
  %144 = load i32* %arrayidx302, align 4, !dbg !116
  %arrayidx303 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 8, !dbg !116
  %145 = load i32* %arrayidx303, align 4, !dbg !116
  %add304 = add i32 %144, %145, !dbg !116
  %shr305 = lshr i32 %add304, 14, !dbg !116
  %or306 = or i32 %shl301, %shr305, !dbg !116
  %arrayidx307 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 10, !dbg !117
  %146 = load i32* %arrayidx307, align 4, !dbg !117
  %xor308 = xor i32 %146, %or306, !dbg !117
  store i32 %xor308, i32* %arrayidx307, align 4, !dbg !117
  %arrayidx309 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !118
  %147 = load i32* %arrayidx309, align 4, !dbg !118
  %arrayidx310 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !118
  %148 = load i32* %arrayidx310, align 4, !dbg !118
  %add311 = add i32 %147, %148, !dbg !118
  %shl312 = shl i32 %add311, 7, !dbg !118
  %arrayidx313 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !118
  %149 = load i32* %arrayidx313, align 4, !dbg !118
  %arrayidx314 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !118
  %150 = load i32* %arrayidx314, align 4, !dbg !118
  %add315 = add i32 %149, %150, !dbg !118
  %shr316 = lshr i32 %add315, 25, !dbg !118
  %or317 = or i32 %shl312, %shr316, !dbg !118
  %arrayidx318 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !119
  %151 = load i32* %arrayidx318, align 4, !dbg !119
  %xor319 = xor i32 %151, %or317, !dbg !119
  store i32 %xor319, i32* %arrayidx318, align 4, !dbg !119
  %arrayidx320 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !120
  %152 = load i32* %arrayidx320, align 4, !dbg !120
  %arrayidx321 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !120
  %153 = load i32* %arrayidx321, align 4, !dbg !120
  %add322 = add i32 %152, %153, !dbg !120
  %shl323 = shl i32 %add322, 9, !dbg !120
  %arrayidx324 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !120
  %154 = load i32* %arrayidx324, align 4, !dbg !120
  %arrayidx325 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !120
  %155 = load i32* %arrayidx325, align 4, !dbg !120
  %add326 = add i32 %154, %155, !dbg !120
  %shr327 = lshr i32 %add326, 23, !dbg !120
  %or328 = or i32 %shl323, %shr327, !dbg !120
  %arrayidx329 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !121
  %156 = load i32* %arrayidx329, align 4, !dbg !121
  %xor330 = xor i32 %156, %or328, !dbg !121
  store i32 %xor330, i32* %arrayidx329, align 4, !dbg !121
  %arrayidx331 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !122
  %157 = load i32* %arrayidx331, align 4, !dbg !122
  %arrayidx332 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !122
  %158 = load i32* %arrayidx332, align 4, !dbg !122
  %add333 = add i32 %157, %158, !dbg !122
  %shl334 = shl i32 %add333, 13, !dbg !122
  %arrayidx335 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !122
  %159 = load i32* %arrayidx335, align 4, !dbg !122
  %arrayidx336 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 12, !dbg !122
  %160 = load i32* %arrayidx336, align 4, !dbg !122
  %add337 = add i32 %159, %160, !dbg !122
  %shr338 = lshr i32 %add337, 19, !dbg !122
  %or339 = or i32 %shl334, %shr338, !dbg !122
  %arrayidx340 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !123
  %161 = load i32* %arrayidx340, align 4, !dbg !123
  %xor341 = xor i32 %161, %or339, !dbg !123
  store i32 %xor341, i32* %arrayidx340, align 4, !dbg !123
  %arrayidx342 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !124
  %162 = load i32* %arrayidx342, align 4, !dbg !124
  %arrayidx343 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !124
  %163 = load i32* %arrayidx343, align 4, !dbg !124
  %add344 = add i32 %162, %163, !dbg !124
  %shl345 = shl i32 %add344, 18, !dbg !124
  %arrayidx346 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 14, !dbg !124
  %164 = load i32* %arrayidx346, align 4, !dbg !124
  %arrayidx347 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 13, !dbg !124
  %165 = load i32* %arrayidx347, align 4, !dbg !124
  %add348 = add i32 %164, %165, !dbg !124
  %shr349 = lshr i32 %add348, 14, !dbg !124
  %or350 = or i32 %shl345, %shr349, !dbg !124
  %arrayidx351 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 15, !dbg !125
  %166 = load i32* %arrayidx351, align 4, !dbg !125
  %xor352 = xor i32 %166, %or350, !dbg !125
  store i32 %xor352, i32* %arrayidx351, align 4, !dbg !125
  br label %for.inc353, !dbg !126

for.inc353:                                       ; preds = %for.body5
  %167 = load i32* %i, align 4, !dbg !127
  %sub = sub i32 %167, 2, !dbg !127
  store i32 %sub, i32* %i, align 4, !dbg !127
  br label %for.cond3, !dbg !128

for.end354:                                       ; preds = %for.cond3
  store i32 0, i32* %i, align 4, !dbg !129
  br label %for.cond355, !dbg !129

for.cond355:                                      ; preds = %for.inc365, %for.end354
  %168 = load i32* %i, align 4, !dbg !131
  %cmp356 = icmp ult i32 %168, 16, !dbg !131
  br i1 %cmp356, label %for.body357, label %for.end367, !dbg !135

for.body357:                                      ; preds = %for.cond355
  %169 = load i32* %i, align 4, !dbg !136
  %idxprom358 = zext i32 %169 to i64, !dbg !138
  %arrayidx359 = getelementptr inbounds [16 x i32]* %x, i32 0, i64 %idxprom358, !dbg !138
  %170 = load i32* %arrayidx359, align 4, !dbg !138
  %171 = load i32* %i, align 4, !dbg !139
  %idxprom360 = zext i32 %171 to i64, !dbg !140
  %172 = load i32** %in.addr, align 8, !dbg !140
  %arrayidx361 = getelementptr inbounds i32* %172, i64 %idxprom360, !dbg !140
  %173 = load i32* %arrayidx361, align 4, !dbg !140
  %add362 = add i32 %170, %173, !dbg !138
  %174 = load i32* %i, align 4, !dbg !141
  %idxprom363 = zext i32 %174 to i64, !dbg !142
  %175 = load i32** %out.addr, align 8, !dbg !142
  %arrayidx364 = getelementptr inbounds i32* %175, i64 %idxprom363, !dbg !142
  store i32 %add362, i32* %arrayidx364, align 4, !dbg !142
  br label %for.inc365, !dbg !142

for.inc365:                                       ; preds = %for.body357
  %176 = load i32* %i, align 4, !dbg !143
  %inc366 = add i32 %176, 1, !dbg !143
  store i32 %inc366, i32* %i, align 4, !dbg !143
  br label %for.cond355, !dbg !145

for.end367:                                       ; preds = %for.cond355
  ret void, !dbg !146
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @salsa() #0 {
entry:
  %0 = load i32* @ptr, align 4, !dbg !147
  %cmp = icmp eq i32 %0, 0, !dbg !147
  br i1 %cmp, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i32 0, i32 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 0)), !dbg !150
  %1 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i64 0), align 4, !dbg !152
  %inc = add i32 %1, 1, !dbg !152
  store i32 %inc, i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i64 0), align 4, !dbg !152
  %conv = zext i32 %1 to i64, !dbg !153
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32* @ptr, align 4, !dbg !155
  %add = add i32 %2, 1, !dbg !155
  %and = and i32 %add, 15, !dbg !156
  store i32 %and, i32* @ptr, align 4, !dbg !157
  %3 = load i32* @ptr, align 4, !dbg !158
  %idxprom = zext i32 %3 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [16 x i32]* @outbuf, i32 0, i64 %idxprom, !dbg !159
  %4 = load i32* %arrayidx, align 4, !dbg !159
  ret i32 %4, !dbg !160
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %offset = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %val, metadata !161, metadata !33), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %i, metadata !163, metadata !33), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %count, metadata !165, metadata !33), !dbg !166
  store i32 537919488, i32* %count, align 4, !dbg !166
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !167, metadata !33), !dbg !168
  store i32 0, i32* %offset, align 4, !dbg !168
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !171
  %cmp = icmp ult i32 %0, 16, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !176
  %add = add i32 %1, 13, !dbg !176
  %add1 = add i32 -307516443, %add, !dbg !177
  %2 = load i32* %i, align 4, !dbg !178
  %sub = sub i32 -559038737, %2, !dbg !179
  %xor = xor i32 %add1, %sub, !dbg !180
  %3 = load i32* %i, align 4, !dbg !181
  %idxprom = zext i32 %3 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [16 x i32]* @STATE, i32 0, i64 %idxprom, !dbg !182
  store i32 %xor, i32* %arrayidx, align 4, !dbg !182
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4, !dbg !183
  %inc = add i32 %4, 1, !dbg !183
  store i32 %inc, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !184

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond2, !dbg !185

for.cond2:                                        ; preds = %for.inc5, %for.end
  %5 = load i32* %i, align 4, !dbg !187
  %6 = load i32* %count, align 4, !dbg !191
  %cmp3 = icmp ult i32 %5, %6, !dbg !192
  br i1 %cmp3, label %for.body4, label %for.end7, !dbg !193

for.body4:                                        ; preds = %for.cond2
  %call = call i32 @salsa(), !dbg !194
  br label %for.inc5, !dbg !194

for.inc5:                                         ; preds = %for.body4
  %7 = load i32* %i, align 4, !dbg !195
  %inc6 = add i32 %7, 1, !dbg !195
  store i32 %inc6, i32* %i, align 4, !dbg !195
  br label %for.cond2, !dbg !196

for.end7:                                         ; preds = %for.cond2
  %call8 = call i32 @salsa(), !dbg !197
  store i32 %call8, i32* %val, align 4, !dbg !198
  %8 = load i32* %offset, align 4, !dbg !199
  %9 = load i32* %val, align 4, !dbg !200
  %add9 = add i32 %9, %8, !dbg !200
  store i32 %add9, i32* %val, align 4, !dbg !200
  %10 = load i32* %val, align 4, !dbg !201
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %10), !dbg !202
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 -162172867), !dbg !203
  %11 = load i32* %val, align 4, !dbg !204
  %cmp12 = icmp ne i32 %11, -162172867, !dbg !204
  %conv = zext i1 %cmp12 to i32, !dbg !204
  ret i32 %conv, !dbg !205
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !7, !22, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c] [DW_LANG_C99]
!1 = !{!"salsa20.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x16\00uint64_t\0055\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [uint64_t] [line 55, size 0, align 0, offset 0] [from long unsigned int]
!5 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!6 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!7 = !{!8, !15, !18}
!8 = !{!"0x2e\00salsa20\00salsa20\00\0015\000\001\000\000\00256\000\0015", !1, !9, !10, null, void (i32*, i32*)* @salsa20, null, null, !2} ; [ DW_TAG_subprogram ] [line 15] [def] [salsa20]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !12, !12}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint32_t]
!13 = !{!"0x16\00uint32_t\0051\000\000\000\000", !5, null, !14} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!14 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!15 = !{!"0x2e\00salsa\00salsa\00\0042\000\001\000\000\00256\000\0042", !1, !9, !16, null, i32 ()* @salsa, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [def] [salsa]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!13}
!18 = !{!"0x2e\00main\00main\00\0052\000\001\000\000\00256\000\0052", !1, !9, !19, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 52] [def] [main]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!21}
!21 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = !{!23, !24, !28}
!23 = !{!"0x34\00ptr\00ptr\00\0012\000\001", null, !9, !13, i32* @ptr, null} ; [ DW_TAG_variable ] [ptr] [line 12] [def]
!24 = !{!"0x34\00STATE\00STATE\00\0010\000\001", null, !9, !25, [16 x i32]* @STATE, null} ; [ DW_TAG_variable ] [STATE] [line 10] [def]
!25 = !{!"0x1\00\000\00512\0032\000\000\000", null, null, !13, !26, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from uint32_t]
!26 = !{!27}
!27 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!28 = !{!"0x34\00outbuf\00outbuf\00\0011\000\001", null, !9, !25, [16 x i32]* @outbuf, null} ; [ DW_TAG_variable ] [outbuf] [line 11] [def]
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 2}
!31 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!32 = !{!"0x101\00out\0016777231\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [out] [line 15]
!33 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!34 = !MDLocation(line: 15, column: 23, scope: !8)
!35 = !{!"0x101\00in\0033554447\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 15]
!36 = !MDLocation(line: 15, column: 40, scope: !8)
!37 = !{!"0x100\00i\0016\000", !8, !9, !13}       ; [ DW_TAG_auto_variable ] [i] [line 16]
!38 = !MDLocation(line: 16, column: 12, scope: !8)
!39 = !{!"0x100\00x\0016\000", !8, !9, !25}       ; [ DW_TAG_auto_variable ] [x] [line 16]
!40 = !MDLocation(line: 16, column: 15, scope: !8)
!41 = !MDLocation(line: 18, column: 8, scope: !42)
!42 = !{!"0xb\0018\003\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!43 = !MDLocation(line: 18, column: 14, scope: !44)
!44 = !{!"0xb\002", !1, !45}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!45 = !{!"0xb\001", !1, !46}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!46 = !{!"0xb\0018\003\001", !1, !42}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!47 = !MDLocation(line: 18, column: 3, scope: !42)
!48 = !MDLocation(line: 19, column: 15, scope: !46)
!49 = !MDLocation(line: 19, column: 12, scope: !46)
!50 = !MDLocation(line: 19, column: 7, scope: !46)
!51 = !MDLocation(line: 19, column: 5, scope: !46)
!52 = !MDLocation(line: 18, column: 21, scope: !46)
!53 = !MDLocation(line: 18, column: 3, scope: !46)
!54 = !MDLocation(line: 21, column: 8, scope: !55)
!55 = !{!"0xb\0021\003\002", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!56 = !MDLocation(line: 21, column: 15, scope: !57)
!57 = !{!"0xb\002", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!58 = !{!"0xb\001", !1, !59}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!59 = !{!"0xb\0021\003\003", !1, !55}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!60 = !MDLocation(line: 21, column: 3, scope: !55)
!61 = !MDLocation(line: 22, column: 14, scope: !62)
!62 = !{!"0xb\0021\0029\004", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!63 = !MDLocation(line: 22, column: 5, scope: !62)
!64 = !MDLocation(line: 22, column: 43, scope: !62)
!65 = !MDLocation(line: 22, column: 34, scope: !62)
!66 = !MDLocation(line: 23, column: 14, scope: !62)
!67 = !MDLocation(line: 23, column: 5, scope: !62)
!68 = !MDLocation(line: 23, column: 43, scope: !62)
!69 = !MDLocation(line: 23, column: 34, scope: !62)
!70 = !MDLocation(line: 24, column: 14, scope: !62)
!71 = !MDLocation(line: 24, column: 5, scope: !62)
!72 = !MDLocation(line: 24, column: 43, scope: !62)
!73 = !MDLocation(line: 24, column: 34, scope: !62)
!74 = !MDLocation(line: 25, column: 14, scope: !62)
!75 = !MDLocation(line: 25, column: 5, scope: !62)
!76 = !MDLocation(line: 25, column: 43, scope: !62)
!77 = !MDLocation(line: 25, column: 34, scope: !62)
!78 = !MDLocation(line: 26, column: 14, scope: !62)
!79 = !MDLocation(line: 26, column: 5, scope: !62)
!80 = !MDLocation(line: 26, column: 43, scope: !62)
!81 = !MDLocation(line: 26, column: 34, scope: !62)
!82 = !MDLocation(line: 27, column: 14, scope: !62)
!83 = !MDLocation(line: 27, column: 5, scope: !62)
!84 = !MDLocation(line: 27, column: 43, scope: !62)
!85 = !MDLocation(line: 27, column: 34, scope: !62)
!86 = !MDLocation(line: 28, column: 14, scope: !62)
!87 = !MDLocation(line: 28, column: 5, scope: !62)
!88 = !MDLocation(line: 28, column: 43, scope: !62)
!89 = !MDLocation(line: 28, column: 34, scope: !62)
!90 = !MDLocation(line: 29, column: 14, scope: !62)
!91 = !MDLocation(line: 29, column: 5, scope: !62)
!92 = !MDLocation(line: 29, column: 43, scope: !62)
!93 = !MDLocation(line: 29, column: 34, scope: !62)
!94 = !MDLocation(line: 30, column: 14, scope: !62)
!95 = !MDLocation(line: 30, column: 5, scope: !62)
!96 = !MDLocation(line: 30, column: 43, scope: !62)
!97 = !MDLocation(line: 30, column: 34, scope: !62)
!98 = !MDLocation(line: 31, column: 14, scope: !62)
!99 = !MDLocation(line: 31, column: 5, scope: !62)
!100 = !MDLocation(line: 31, column: 43, scope: !62)
!101 = !MDLocation(line: 31, column: 34, scope: !62)
!102 = !MDLocation(line: 32, column: 14, scope: !62)
!103 = !MDLocation(line: 32, column: 5, scope: !62)
!104 = !MDLocation(line: 32, column: 43, scope: !62)
!105 = !MDLocation(line: 32, column: 34, scope: !62)
!106 = !MDLocation(line: 33, column: 14, scope: !62)
!107 = !MDLocation(line: 33, column: 5, scope: !62)
!108 = !MDLocation(line: 33, column: 43, scope: !62)
!109 = !MDLocation(line: 33, column: 34, scope: !62)
!110 = !MDLocation(line: 34, column: 14, scope: !62)
!111 = !MDLocation(line: 34, column: 5, scope: !62)
!112 = !MDLocation(line: 34, column: 43, scope: !62)
!113 = !MDLocation(line: 34, column: 34, scope: !62)
!114 = !MDLocation(line: 35, column: 14, scope: !62)
!115 = !MDLocation(line: 35, column: 5, scope: !62)
!116 = !MDLocation(line: 35, column: 43, scope: !62)
!117 = !MDLocation(line: 35, column: 34, scope: !62)
!118 = !MDLocation(line: 36, column: 14, scope: !62)
!119 = !MDLocation(line: 36, column: 5, scope: !62)
!120 = !MDLocation(line: 36, column: 43, scope: !62)
!121 = !MDLocation(line: 36, column: 34, scope: !62)
!122 = !MDLocation(line: 37, column: 14, scope: !62)
!123 = !MDLocation(line: 37, column: 5, scope: !62)
!124 = !MDLocation(line: 37, column: 43, scope: !62)
!125 = !MDLocation(line: 37, column: 34, scope: !62)
!126 = !MDLocation(line: 38, column: 3, scope: !62)
!127 = !MDLocation(line: 21, column: 21, scope: !59)
!128 = !MDLocation(line: 21, column: 3, scope: !59)
!129 = !MDLocation(line: 39, column: 8, scope: !130)
!130 = !{!"0xb\0039\003\005", !1, !8}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!131 = !MDLocation(line: 39, column: 14, scope: !132)
!132 = !{!"0xb\004", !1, !133}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!133 = !{!"0xb\001", !1, !134}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!134 = !{!"0xb\0039\003\006", !1, !130}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!135 = !MDLocation(line: 39, column: 3, scope: !130)
!136 = !MDLocation(line: 39, column: 37, scope: !137)
!137 = !{!"0xb\002", !1, !134}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!138 = !MDLocation(line: 39, column: 35, scope: !134)
!139 = !MDLocation(line: 39, column: 45, scope: !134)
!140 = !MDLocation(line: 39, column: 42, scope: !134)
!141 = !MDLocation(line: 39, column: 30, scope: !134)
!142 = !MDLocation(line: 39, column: 26, scope: !134)
!143 = !MDLocation(line: 39, column: 21, scope: !144)
!144 = !{!"0xb\003", !1, !134}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!145 = !MDLocation(line: 39, column: 3, scope: !134)
!146 = !MDLocation(line: 40, column: 1, scope: !8)
!147 = !MDLocation(line: 43, column: 6, scope: !148)
!148 = !{!"0xb\0043\006\007", !1, !15}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!149 = !MDLocation(line: 43, column: 6, scope: !15)
!150 = !MDLocation(line: 44, column: 5, scope: !151)
!151 = !{!"0xb\0043\0014\008", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!152 = !MDLocation(line: 45, column: 15, scope: !151)
!153 = !MDLocation(line: 45, column: 5, scope: !151)
!154 = !MDLocation(line: 46, column: 3, scope: !151)
!155 = !MDLocation(line: 48, column: 10, scope: !15)
!156 = !MDLocation(line: 48, column: 9, scope: !15)
!157 = !MDLocation(line: 48, column: 3, scope: !15)
!158 = !MDLocation(line: 49, column: 17, scope: !15)
!159 = !MDLocation(line: 49, column: 10, scope: !15)
!160 = !MDLocation(line: 49, column: 3, scope: !15)
!161 = !{!"0x100\00val\0053\000", !18, !9, !13}   ; [ DW_TAG_auto_variable ] [val] [line 53]
!162 = !MDLocation(line: 53, column: 12, scope: !18)
!163 = !{!"0x100\00i\0053\000", !18, !9, !13}     ; [ DW_TAG_auto_variable ] [i] [line 53]
!164 = !MDLocation(line: 53, column: 17, scope: !18)
!165 = !{!"0x100\00count\0058\000", !18, !9, !13} ; [ DW_TAG_auto_variable ] [count] [line 58]
!166 = !MDLocation(line: 58, column: 12, scope: !18)
!167 = !{!"0x100\00offset\0059\000", !18, !9, !13} ; [ DW_TAG_auto_variable ] [offset] [line 59]
!168 = !MDLocation(line: 59, column: 12, scope: !18)
!169 = !MDLocation(line: 62, column: 7, scope: !170)
!170 = !{!"0xb\0062\003\009", !1, !18}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!171 = !MDLocation(line: 62, column: 12, scope: !172)
!172 = !{!"0xb\002", !1, !173}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!173 = !{!"0xb\001", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!174 = !{!"0xb\0062\003\0010", !1, !170}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!175 = !MDLocation(line: 62, column: 3, scope: !170)
!176 = !MDLocation(line: 63, column: 29, scope: !174)
!177 = !MDLocation(line: 63, column: 17, scope: !174)
!178 = !MDLocation(line: 63, column: 48, scope: !174)
!179 = !MDLocation(line: 63, column: 37, scope: !174)
!180 = !MDLocation(line: 63, column: 16, scope: !174)
!181 = !MDLocation(line: 63, column: 11, scope: !174)
!182 = !MDLocation(line: 63, column: 5, scope: !174)
!183 = !MDLocation(line: 62, column: 18, scope: !174)
!184 = !MDLocation(line: 62, column: 3, scope: !174)
!185 = !MDLocation(line: 65, column: 7, scope: !186)
!186 = !{!"0xb\0065\003\0011", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!187 = !MDLocation(line: 65, column: 12, scope: !188)
!188 = !{!"0xb\002", !1, !189}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!189 = !{!"0xb\001", !1, !190}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!190 = !{!"0xb\0065\003\0012", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!191 = !MDLocation(line: 65, column: 14, scope: !190)
!192 = !MDLocation(line: 65, column: 12, scope: !190)
!193 = !MDLocation(line: 65, column: 3, scope: !186)
!194 = !MDLocation(line: 66, column: 5, scope: !190)
!195 = !MDLocation(line: 65, column: 21, scope: !190)
!196 = !MDLocation(line: 65, column: 3, scope: !190)
!197 = !MDLocation(line: 68, column: 9, scope: !18)
!198 = !MDLocation(line: 68, column: 3, scope: !18)
!199 = !MDLocation(line: 69, column: 10, scope: !18)
!200 = !MDLocation(line: 69, column: 3, scope: !18)
!201 = !MDLocation(line: 71, column: 29, scope: !18)
!202 = !MDLocation(line: 71, column: 3, scope: !18)
!203 = !MDLocation(line: 72, column: 3, scope: !18)
!204 = !MDLocation(line: 73, column: 10, scope: !18)
!205 = !MDLocation(line: 73, column: 3, scope: !18)
